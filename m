Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB9F9CFDFE
	for <lists+xen-devel@lfdr.de>; Sat, 16 Nov 2024 11:19:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.838671.1254639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCFtN-0003Ac-BC; Sat, 16 Nov 2024 10:19:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 838671.1254639; Sat, 16 Nov 2024 10:19:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCFtN-00037S-85; Sat, 16 Nov 2024 10:19:01 +0000
Received: by outflank-mailman (input) for mailman id 838671;
 Sat, 16 Nov 2024 10:18:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tCFtL-00037H-8Q
 for xen-devel@lists.xenproject.org; Sat, 16 Nov 2024 10:18:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tCFtK-007zkz-1N;
 Sat, 16 Nov 2024 10:18:58 +0000
Received: from [2a02:8012:3a1:0:dc92:b14d:2764:76ac]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tCFtK-007v47-1X;
 Sat, 16 Nov 2024 10:18:58 +0000
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
	bh=uAEufPUTSrSCM+SrwgH9jIuIKeC+HVcaEAcaGeQWeh0=; b=s/RRErXl0tVej0F1YRO4BHuN+h
	TygsqF7AUwO2q/sOsFXK+66qqb8tEcUXcBDs5ninmkQ/SrjRKoxHwNCccizStfl1JG6gGD9mIAYUZ
	w4OhuOgGl+M2oE5RqwHq1FJi5K852eJaEnLVoaqpgMVG9wTZzkY+VyGO3TVxXqTin4T8=;
Message-ID: <f35997e4-40a7-40c5-9b29-932724e9cac5@xen.org>
Date: Sat, 16 Nov 2024 10:18:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/device-tree: Allow region overlapping with
 /memreserve/ ranges
Content-Language: en-GB
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
References: <20241114102802.54512-1-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20241114102802.54512-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 14/11/2024 10:28, Luca Fancellu wrote:
> There are some cases where the device tree exposes a memory range
> in both /memreserve/ and reserved-memory node, in this case the
> current code will stop Xen to boot since it will find that the
> latter range is clashing with the already recorded /memreserve/
> ranges.
> 
> Furthermore, u-boot lists boot modules ranges, such as ramdisk,
> in the /memreserve/ part and even in this case this will prevent
> Xen to boot since it will see that the module memory range that
> it is going to add in 'add_boot_module' clashes with a /memreserve/
> range.
> 
> When Xen populate the data structure that tracks the memory ranges,
> it also adds a memory type described in 'enum membank_type', so
> in order to fix this behavior, allow overlapping with the /memreserve/
> ranges in the 'check_reserved_regions_overlap' function when a flag
> is set.
> 
> In order to implement this solution, there is a distinction between
> the 'struct membanks *' handled by meminfo_overlap_check(...) that
> needs to be done, because the static shared memory banks doesn't have
> a usable bank[].type field and so it can't be accessed, hence now
> the 'struct membanks_hdr' have a 'enum region_type type' field in order
> to be able to identify static shared memory banks in meminfo_overlap_check(...).
> 
> While there, set a type for the memory recorded using meminfo_add_bank()
> from efi-boot.h.
> 
> Fixes: 53dc37829c31 ("xen/arm: Add DT reserve map regions to bootinfo.reserved_mem")
> Reported-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> Reported-by: Grygorii Strashko <grygorii_strashko@epam.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

I will give a few days for the others to review and Shawn to comment 
whether it fixes his issue (I can't remember if it was already done).

Cheers,

-- 
Julien Grall

