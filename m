Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CCE7CB00A
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 18:41:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617888.960977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsQei-0000Ql-Ie; Mon, 16 Oct 2023 16:41:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617888.960977; Mon, 16 Oct 2023 16:41:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsQei-0000O7-G0; Mon, 16 Oct 2023 16:41:24 +0000
Received: by outflank-mailman (input) for mailman id 617888;
 Mon, 16 Oct 2023 16:41:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qsQeg-0000Nz-Kq
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 16:41:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qsQeg-0008GH-Bv; Mon, 16 Oct 2023 16:41:22 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.9.197]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qsQeg-0007rX-64; Mon, 16 Oct 2023 16:41:22 +0000
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
	bh=1xJm5LbdEVoaOaJNCt8O1uzOxxtFAYe8gyZX26+4gFY=; b=BvNnBXBYtj7hUDiTZpYilpNzbq
	VvCSd69WIu/SK9LtDN/j+Fl+V5Fvy2ILXK/FSFIcB6yelynhioOHQd1Bly9TicgYBYBxz2geYoP3W
	6tjxpoEh4lHAi8R5wcYRX+iLdprSHajUqaaX4jNmaK8VNzFEDIye0U9KlhEaD6i8fCic=;
Message-ID: <0299c7f0-6235-421a-b57d-63b0ad4a650f@xen.org>
Date: Mon, 16 Oct 2023 17:41:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 8/8] xen/arm: mmu: move MMU specific P2M code to
 mmu/p2m.{c,h}
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>
References: <20231009010313.3668423-1-Henry.Wang@arm.com>
 <20231009010313.3668423-9-Henry.Wang@arm.com>
 <af6a376c-a224-45d7-9972-d69ee44239d6@xen.org>
 <4607C809-7625-4C8E-A26E-8B8F641CEB29@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <4607C809-7625-4C8E-A26E-8B8F641CEB29@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 14/10/2023 02:26, Henry Wang wrote:
> Hi Julien,

Hi Henry,

>> On Oct 14, 2023, at 02:22, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Henry,
>>
>> On 09/10/2023 02:03, Henry Wang wrote:
>>> From: Penny Zheng <penny.zheng@arm.com>
>>> Current P2M implementation is designed for MMU system only.
>>> We move the MMU-specific codes into mmu/p2m.c, and only keep generic
>>> codes in p2m.c, like VMID allocator, etc. We also move MMU-specific
>>> definitions and declarations to mmu/p2m.h, such as p2m_tlb_flush_sync().
>>> Also expose previously static functions p2m_vmid_allocator_init(),
>>> p2m_alloc_vmid(), and setup_virt_paging_one() for further MPU usage.
>>> With the code movement, global variable max_vmid is used in multiple
>>> files instead of a single file (and will be used in MPU P2M
>>> implementation), declare it in the header and remove the "static" of
>>> this variable.
>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
>>
>> Some remarks about some of the code not moved:
>> * struct p2m_domain: The bulk of the fields seems to be MMU specific. So depending on the number of common fields we either want to split or move the structure to p2m_domain. I would be ok to wait until the MPU code is present.
>> * p2m_type_t: It is not yet clear how this will apply to the MPU. I am ok to wait before moving it.
> 
> Agree with both here, let’s continue the discussion in the actual MPU patch for P2M
> then, but I am then a bit confused about...
> 
>> * p2m_cache_flush_range(): I expect the code will need some change because you may get large chunk of memory for the MPU.
>> * p2m_set_way_flush()/p2m_toggle_cache(): This was a giant hack to support cache flush operations via set/way. To make it efficient, we track the pages that have been touched and only flush them. For the MPU, this would not work. Can we attempt to not emulate the instructions?
> 
> …these two remarks here, do you expect me to do some changes with these three
> functions in this patch? Or we can defer the required changes to the MPU patch for
> P2M?

My original intention was to ask to move them right now. But if it is 
unclear whether they would be used, then it would be best to defer until 
we have a better understanding.

> 
> I think I am highly likely to make a mistake here but I took a look at the MPU
> implementation [1] and it looks like the MPU code can use these tree functions
> without changes - probably because these functions are simply used by
> (1) domctl and we only have dom0less DomUs on MPU
> (2) trap handlers
> which means these functions are simply not called…

I am not sure I fully understand why would the trap handlers not called. 
Is this suggesting that a dom0less domUs can not use set/way instructions?

Cheers,

-- 
Julien Grall

