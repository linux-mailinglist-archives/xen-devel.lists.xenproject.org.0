Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCE97478A1
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 21:21:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558658.872976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGlaN-0001VQ-Sa; Tue, 04 Jul 2023 19:21:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558658.872976; Tue, 04 Jul 2023 19:21:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGlaN-0001SM-PZ; Tue, 04 Jul 2023 19:21:15 +0000
Received: by outflank-mailman (input) for mailman id 558658;
 Tue, 04 Jul 2023 19:21:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qGlaL-0001Ru-Pt
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 19:21:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGlaL-0000SI-Fy; Tue, 04 Jul 2023 19:21:13 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234] helo=[192.168.9.70])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGlaL-0001qE-Ae; Tue, 04 Jul 2023 19:21:13 +0000
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
	bh=L9veqfFAmUqbsDl205lEzBz5WjO7NtwY/8BBgMnGd/c=; b=oLPJyp+BPBuFjBt6/LRl56/LPM
	7tttB4GP6KAEB5kpZaO89a08pn/f492evKoKAOvOXt6tx30Y84KhNT6GnDn91nMZa1Noju9IOwBKu
	3gX5vML2Nhvik6UhsN2nfrjeBv+e6YeoPes/WJYi6rGAwN6Vt3miVDJdskHWt5rQ/8vQ=;
Message-ID: <af5c0bf1-40eb-5b76-17b2-b63205cec182@xen.org>
Date: Tue, 4 Jul 2023 20:21:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 03/52] xen/arm: add an option to define Xen start
 address for Armv8-R
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-4-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230626033443.2943270-4-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 26/06/2023 04:33, Penny Zheng wrote:
> From: Wei Chen <wei.chen@arm.com>
> 
> On Armv8-A, Xen has a fixed virtual start address (link address
> too) for all Armv8-A platforms. In an MMU based system, Xen can
> map its loaded address to this virtual start address. So, on
> Armv8-A platforms, the Xen start address does not need to be
> configurable. But on Armv8-R platforms, there is no MMU to map
> loaded address to a fixed virtual address and different platforms
> will have very different address space layout. So Xen cannot use
> a fixed physical address on MPU based system and need to have it
> configurable.
> 
> In this patch we introduce one Kconfig option for users to define
> the default Xen start address for Armv8-R. Users can enter the
> address in config time, or select the tailored platform config
> file from arch/arm/configs.
> 
> And as we introduced Armv8-R to Xen, that means the existed Arm64
> MMU based platforms should not be listed in Armv8-R platform
> list, so we add !HAS_MPU dependency for these platforms.

 From a brief look, this patch doesn't seem to be necessary in order to 
move the MMU code in separate files. Can you confirm?

If so can this be moved latter in the series? This is to allow the 
reviewers to focus on the MMU split as we discussed on the call today.

Cheers,

-- 
Julien Grall

