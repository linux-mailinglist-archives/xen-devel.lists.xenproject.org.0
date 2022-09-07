Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF47C5B0205
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 12:44:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401194.642983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVsX9-0007uU-R8; Wed, 07 Sep 2022 10:43:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401194.642983; Wed, 07 Sep 2022 10:43:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVsX9-0007rK-NC; Wed, 07 Sep 2022 10:43:51 +0000
Received: by outflank-mailman (input) for mailman id 401194;
 Wed, 07 Sep 2022 10:43:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oVsX8-0007rD-In
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 10:43:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVsX8-00035M-9I; Wed, 07 Sep 2022 10:43:50 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.17.46]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVsX8-0003Pn-2o; Wed, 07 Sep 2022 10:43:50 +0000
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
	bh=bJL974w4VVQGhGc1R8+F9YXO22SnzIe6gszIIs1Urns=; b=Kk+BIZbH1HEq7IkERs8nEvsdbi
	rm7Q59dq+KL3C8kol16MvThVwcq7aFtHwd1UYu9S9o2VnV0mQ0ONeMKS9RGn/NKCjR1u/FBlSkC7V
	VBxg9ZZwhLRZ8SVkFrJaBTpfm08Q8N4ha8grGu+fL+l6/0aKmwqioGTpSEopyrIQeWiA=;
Message-ID: <d72422dd-ff96-c577-9e27-b7cd97469d83@xen.org>
Date: Wed, 7 Sep 2022 11:43:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v3 4/4] xen/arm: Handle static heap pages in boot and heap
 allocator
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220907083643.20152-1-Henry.Wang@arm.com>
 <20220907083643.20152-5-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220907083643.20152-5-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 07/09/2022 09:36, Henry Wang wrote:
> This commit firstly adds a bool field `static_heap` to bootinfo.
> This newly introduced field is set at the device tree parsing time
> if the static heap ranges are defined in the device tree chosen
> node.
> 
> For Arm32, In `setup_mm`, if the static heap is enabled, we use the
> static heap region for both domheap and xenheap allocation. Note
> that the xenheap on Arm32 should be always contiguous, so also add
> a helper fit_xenheap_in_static_heap() for Arm32 to find the required
> xenheap in the static heap regions.
> 
> For Arm64, In `setup_mm`, if the static heap is enabled and used,
> we make sure that only these static heap pages are added to the boot
> allocator. These static heap pages in the boot allocator are
> added to the heap allocator at `end_boot_allocator()`.
> 
> If the static heap is disabled, we stick to current page allocation
> strategy at boot time.
> 
> Also, take the chance to correct a "double not" print in Arm32
> `setup_mm()` and replace the open-coding address ~0 by INVALID_PADDR.
> 
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

