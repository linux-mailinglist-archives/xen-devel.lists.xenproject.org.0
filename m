Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD54785F3C
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 20:08:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589486.921418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYsHU-0007Iw-5x; Wed, 23 Aug 2023 18:08:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589486.921418; Wed, 23 Aug 2023 18:08:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYsHU-0007HB-2D; Wed, 23 Aug 2023 18:08:36 +0000
Received: by outflank-mailman (input) for mailman id 589486;
 Wed, 23 Aug 2023 18:08:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qYsHR-0007H3-Uu
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 18:08:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYsHR-0007qZ-FY; Wed, 23 Aug 2023 18:08:33 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.29.180]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYsHR-00018G-97; Wed, 23 Aug 2023 18:08:33 +0000
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
	bh=X9QysCVU4jEQ1r6HHLD2aOKevcyJ4y/i7C2dwJg9yjA=; b=VocTMWmmZXSktw7u3Yq1G3jTCv
	BKCcUFAcAvgbrWGmx7tbdhrbtyjBvJx7OrwyVl4e3q7cHJ6ES40WwAY0ZSPyqBnWaMvrcmNUeHqFo
	OwsTYoRCePD0tMKPppN2Z/AfLizphFOf6yrrFPjpAEZxic0lSZd48DvFyIaNPs3t4VXI=;
Message-ID: <9a0273a3-b7c0-46c9-8ba6-bfeaf57b91cb@xen.org>
Date: Wed, 23 Aug 2023 19:08:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/13] xen/arm: mmu: move MMU specific P2M code to
 mmu/p2m.{c,h}
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>
References: <20230814042536.878720-1-Henry.Wang@arm.com>
 <20230814042536.878720-12-Henry.Wang@arm.com>
 <5356f905-4b14-46b4-b5b4-c236989e1ec8@xen.org>
 <AD09B38F-EE24-4163-8443-B6A86550F24D@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AD09B38F-EE24-4163-8443-B6A86550F24D@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 23/08/2023 02:41, Henry Wang wrote:
> Hi Julien,

Hi Henry,

>> On Aug 23, 2023, at 02:01, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Henry,
>>
>> On 14/08/2023 05:25, Henry Wang wrote:
>>> From: Penny Zheng <penny.zheng@arm.com>
>>> Current P2M implementation is designed for MMU system only.
>>> We move the MMU-specific codes into mmu/p2m.c, and only keep generic
>>> codes in p2m.c, like VMID allocator, etc. We also move MMU-specific
>>> definitions and declarations to mmu/p2m.h, such as p2m_tlb_flush_sync().
>>> Also expose previously static functions p2m_vmid_allocator_init(),
>>> p2m_alloc_vmid(), __p2m_set_entry() and setup_virt_paging_one()
>>
>> Looking at the code, it seemsm that you need to keep expose __p2m_set_entry() because of p2m_relinquish_mapping(). However, it is not clear how this code is supposed to work for the MPU. So should we instead from p2m_relinquish_mapping() to mmu/p2m.c?
> 
> Sure, I will try that.
> 
>>
>> Other functions which doesn't seem to make sense in p2m.c are:
>>   * p2m_clear_root_pages(): AFAIU there is no concept of root in the MPU. This also means that we possibly want to move out anything specific to the MMU from 'struct p2m'. This could be done separately.
>>   * p2m_flush_vm(): This is built with MMU in mind as we can use the page-table to track access pages. You don't have that fine granularity in the MPU.
> 
> I agree, will also move these to mmu/ in v6.
> 
>>
>>> for futher MPU usage.
>>
>> typo: futher/further/
> 
> Thanks, will fix.
> 
>>
>>> With the code movement, global variable max_vmid is used in multiple
>>> files instead of a single file (and will be used in MPU P2M
>>> implementation), declare it in the header and remove the "static" of
>>> this variable.
>>> Add #ifdef CONFIG_HAS_MMU to p2m_write_unlock() since future MPU
>>> work does not need p2m_tlb_flush_sync().
>>
>> And there are no specific barrier required? Overall, I am not sure I like the #ifdef rather than providing a stub helper.
> 
> I think for MPU systems we don’t need to flush the TLB, hence the #ifdef.

I wasn't necessarily thinking about a TLB flush but instead a DSB/DMB. 
At least for the MMU case, I think that in theory we need a DSB when the 
there is no TLB flush to ensure new entry in the page-tables are seen 
before p2m_write_unlock() completes.

So far we are getting away because write_pte() always have a barrier 
after. But at some point, I would like to remove it as this is a massive 
hammer.

> Do you mean we should
> provide a stub helper of p2m_tlb_flush_sync() for MPU? If so I think maybe the naming of this stub
> helper is not really ideal?

See above. I am trying to understand the expected sequence when updating 
the MPU tables. Are you going to add barriers after every update to the 
entry?

Having an helper would also be a good place to explain why some 
synchronization is not needed. I am not sure about a name though.

Maybe p2m_sync() and p2m_force_sync()?

Cheers,

-- 
Julien Grall

