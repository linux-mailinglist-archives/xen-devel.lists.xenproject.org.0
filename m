Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 789157862AA
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 23:39:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589594.921567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYvZG-00045U-OY; Wed, 23 Aug 2023 21:39:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589594.921567; Wed, 23 Aug 2023 21:39:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYvZG-00042x-LF; Wed, 23 Aug 2023 21:39:10 +0000
Received: by outflank-mailman (input) for mailman id 589594;
 Wed, 23 Aug 2023 21:39:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qYvZF-00042r-Fb
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 21:39:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYvZE-0004Nz-UC; Wed, 23 Aug 2023 21:39:08 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYvZE-0001Zo-Os; Wed, 23 Aug 2023 21:39:08 +0000
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
	bh=l9gJOLk3rHBcw2ve/yUZ9Cm+IeAsE5mMWTbtKBi5gYU=; b=ybmXgvDIqUvYZNwjH+3ymsRfFf
	Per6IThgj2L3+J28+ti9e0a6uyHNMbR6bSoLv3WQoEMASenyYadqUtqBdUxsv7ae3Zm1Sp4/HfnQD
	j7eBJnUT+WIzAblscdWBGVcHJi2tDbxzMNLBkSk5INj/MNPgFzc7zmaDb9/D2527ujY0=;
Message-ID: <a90b4307-a82b-45a7-9132-1a71f4f0d482@xen.org>
Date: Wed, 23 Aug 2023 22:39:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/13] xen/arm: mmu: move MMU specific P2M code to
 mmu/p2m.{c,h}
Content-Language: en-GB
To: Penny Zheng <penny.zheng@arm.com>, Henry Wang <Henry.Wang@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20230814042536.878720-1-Henry.Wang@arm.com>
 <20230814042536.878720-12-Henry.Wang@arm.com>
 <5356f905-4b14-46b4-b5b4-c236989e1ec8@xen.org>
 <b23d8afb-281b-6de8-3046-674a45ff6494@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <b23d8afb-281b-6de8-3046-674a45ff6494@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 23/08/2023 04:47, Penny Zheng wrote:
> Hi Julien

Hi Penny,

> On 2023/8/23 02:01, Julien Grall wrote:
>> Hi Henry,
>>
>> On 14/08/2023 05:25, Henry Wang wrote:
>>> From: Penny Zheng <penny.zheng@arm.com>
>>>
>>> Current P2M implementation is designed for MMU system only.
>>> We move the MMU-specific codes into mmu/p2m.c, and only keep generic
>>> codes in p2m.c, like VMID allocator, etc. We also move MMU-specific
>>> definitions and declarations to mmu/p2m.h, such as p2m_tlb_flush_sync().
>>> Also expose previously static functions p2m_vmid_allocator_init(),
>>> p2m_alloc_vmid(), __p2m_set_entry() and setup_virt_paging_one()
>>
>> Looking at the code, it seemsm that you need to keep expose 
>> __p2m_set_entry() because of p2m_relinquish_mapping(). However, it is 
>> not clear how this code is supposed to work for the MPU. So should we 
>> instead from p2m_relinquish_mapping() to mmu/p2m.c?
>>
> 
> p2m->root stores per-domain P2M table, which is actually an array of MPU
> region(pr_t). So maybe we should relinquish mapping region by region,
> instead of page by page. Nevertheless, p2m_relinquish_mapping() shall be
> moved to mmu/p2m.c and we need MPU version of it.
> 
>> Other functions which doesn't seem to make sense in p2m.c are:
>>    * p2m_clear_root_pages(): AFAIU there is no concept of root in the 
>> MPU. This also means that we possibly want to move out anything 
>> specific to the MMU from 'struct p2m'. This could be done separately.
> 
> Current MPU implementation is re-using p2m->root to store P2M table.
> Do you agree on this, or should we create a new variable, like 
> p2m->mpu_table, for MPU P2M table only?

I have looked at the mpu_v5 tree to check how you use p2m->root. The 
common pattern is:

table = (pr_t *)page_to_virt(p2m->root);

AFAICT the "root" is always mapped in your case. So this is a bit 
inneficient to have to convert from a page to virt every single time you 
need to modify the P2M.

Therefore it would be better to introduce something more specific to the 
MPU. Rather than introduce a field in the structure p2m, it would be 
better if we introduce a structure that would be defined in 
{mmu,mpu}/p2m.h, would include there specific fields and be embedded in 
struct p2m.

> How we treat p2m_clear_root_pages also decides how we destroy P2M at 
> domain destruction stage, current MPU flow is as follows:
> ```
>      PROGRESS(mapping):
>          ret = relinquish_p2m_mapping(d);
>          if ( ret )
>              return ret;
> 
>      PROGRESS(p2m_root):
>          /*
>           * We are about to free the intermediate page-tables, so clear the
>           * root to prevent any walk to use them.
>           */
>          p2m_clear_root_pages(&d->arch.p2m);
> 
> #ifdef CONFIG_HAS_PAGING_MEMPOOL
>      PROGRESS(p2m):
>          ret = p2m_teardown(d);
>          if ( ret )
>              return ret;
> 
>      PROGRESS(p2m_pool):
>          ret = p2m_teardown_allocation(d);
>          if( ret )
>              return ret;
> #endif
> ```
> We guard MMU-specific intermediate page-tables destroy with the new 
> Kconfig CONFIG_HAS_PAGING_MEMPOOL, check 
> https://gitlab.com/xen-project/people/henryw/xen/-/commit/7ff6d351e65f43fc34ea694adea0e030a51b1576
> for more details.
> 
> If we destroy MPU P2M table in relinquish_p2m_mapping, region by region,

It would seem to be better to handle it region by region. Note that you 
will still need to handle preemption and that may happen in the middle 
of the region (in particular if they are big).

Cheers,

-- 
Julien Grall

