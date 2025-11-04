Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDDBC308B9
	for <lists+xen-devel@lfdr.de>; Tue, 04 Nov 2025 11:37:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155610.1485062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGEPn-0004mQ-FS; Tue, 04 Nov 2025 10:37:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155610.1485062; Tue, 04 Nov 2025 10:37:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGEPn-0004kP-Bw; Tue, 04 Nov 2025 10:37:27 +0000
Received: by outflank-mailman (input) for mailman id 1155610;
 Tue, 04 Nov 2025 10:37:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vGEPl-0004kJ-Dr
 for xen-devel@lists.xenproject.org; Tue, 04 Nov 2025 10:37:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vGEPk-000lwo-2c;
 Tue, 04 Nov 2025 10:37:25 +0000
Received: from [2a02:8012:3a1:0:2858:32e7:18b8:3bf]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vGEPj-00B2l5-2x;
 Tue, 04 Nov 2025 10:37:24 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=wF4bm3u3B5XQx2oUqwESeGw2xVLjLIKK4I3FCZZyx8k=; b=VUggCZG3Fzld5AitMHnwV03/Jz
	FXRgdTmwlnuobDLIC8iUqSMKzALQtfOvctKGQyYeNQb2YpPvBKXDgF0A7SICLoEl5qS3Vw/naOfFe
	K/kSWnjM3HaCpI6EdZUBB0o83Fdrsrs5nmJZaWC2H8zZQL8s8JKuLobuF/5SdjF4zEgg=;
Message-ID: <3e1525eb-7772-4e11-88d0-376f64591802@xen.org>
Date: Tue, 4 Nov 2025 10:37:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm/xen: zero init memory region before returning to
 the heap
Content-Language: en-GB
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <c2a15402f87de85c2733362ef3ebc3ffe55b231f.1761926280.git.dmytro_prokopchuk1@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c2a15402f87de85c2733362ef3ebc3ffe55b231f.1761926280.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dmytro,

On 31/10/2025 16:02, Dmytro Prokopchuk1 wrote:
> The current implementation of 'free_init_memory()' fills the freed '__init'
> and '__initdata' memory regions with a faulting instruction before unmapping
> and returning them to the heap. However, after unmapping, any access to this
> region will result in a page fault, making the instruction fill redundant.
> 
> Replace the instruction fill with a call to 'memset()', zeroing the entire
> region before it is unmapped and returned to the allocator.
> 
> Additionally, this change resolves a violation of MISRA C:2012 Rule 11.3
> (cast between pointer to object type and pointer to a different object type),
> caused by performing a cast from a 'char *' to a 'uint32_t *' pointer to
> write instructions directly into memory, which is not compliant with MISRA
> guidelines.
> 
> No functional changes.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


