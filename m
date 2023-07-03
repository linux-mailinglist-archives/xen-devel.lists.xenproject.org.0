Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DA6745869
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jul 2023 11:31:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558046.871829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGFu9-0006v0-FQ; Mon, 03 Jul 2023 09:31:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558046.871829; Mon, 03 Jul 2023 09:31:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGFu9-0006t5-C4; Mon, 03 Jul 2023 09:31:33 +0000
Received: by outflank-mailman (input) for mailman id 558046;
 Mon, 03 Jul 2023 09:31:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qGFu7-0006sz-J0
 for xen-devel@lists.xenproject.org; Mon, 03 Jul 2023 09:31:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGFu7-0002S7-2C; Mon, 03 Jul 2023 09:31:31 +0000
Received: from [54.239.6.190] (helo=[192.168.12.110])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGFu6-0003B2-Rx; Mon, 03 Jul 2023 09:31:31 +0000
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
	bh=/J1Ygkk6TXdimnrb8R+3iOtnEaTdzS5kxReB1Rk3SQc=; b=aA90aqdXAMLH7UlIFdqKFTl1JH
	Blb7eQrYadtb5yQ8Qh/5McqFaiwzzkW0XM5rt+pfy7SZ+iB5cqVT/fU+jit5XdJ7uC7OcFFomrTJW
	915nFXiJWhsR3HRfQMxtG7jjrzrLcwjv1dWpn5huEppn/MRy3yZay708gljGScp2oc9Q=;
Message-ID: <15791f2e-b4cf-aa60-3f67-d9e74877e54b@xen.org>
Date: Mon, 3 Jul 2023 10:31:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 33/52] xen/mpu: initialize frametable in MPU system
Content-Language: en-US
To: Penny Zheng <penny.zheng@arm.com>, Ayan Kumar Halder <ayankuma@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-34-Penny.Zheng@arm.com>
 <ee709651-a6fc-2485-ae2b-edf0306fbc13@amd.com>
 <db707ef1-cc91-bc7d-33d2-bf804ece2226@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <db707ef1-cc91-bc7d-33d2-bf804ece2226@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 03/07/2023 07:10, Penny Zheng wrote:
> On 2023/6/30 23:19, Ayan Kumar Halder wrote:
>> Hi Penny,
>>
>> On 26/06/2023 04:34, Penny Zheng wrote:
>>> CAUTION: This message has originated from an External Source. Please 
>>> use proper judgment and caution when opening attachments, clicking 
>>> links, or responding to this email.
>>>
>>>
>>> Xen is using page as the smallest granularity for memory managment.
>>> And we want to follow the same concept in MPU system.
>>> That is, structure page_info and the frametable which is used for 
>>> storing
>>> and managing the smallest memory managment unit is also required in 
>>> MPU system.
>>>
>>> In MPU system, since we can not use a fixed VA 
>>> address(FRAMETABLE_VIRT_START)
>>> to map frametable like MMU system does and everything is 1:1 mapping, we
>>> instead define a variable "struct page_info *frame_table" as frametable
>>> pointer, and ask boot allocator to allocate appropriate memory for 
>>> frametable.
>>>
>>> As frametable is successfully initialized, the convertion between 
>>> machine frame
>>> number/machine address/"virtual address" and page-info structure is
>>> ready too, like mfn_to_page/maddr_to_page/virt_to_page, etc
>>>
>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>> ---
>>> v3:
>>> - add ASSERT() to confirm the MFN you pass is covered by the frametable.
>>> ---
>>>   xen/arch/arm/include/asm/mm.h     | 14 ++++++++++++++
>>>   xen/arch/arm/include/asm/mpu/mm.h |  3 +++
>>>   xen/arch/arm/mpu/mm.c             | 27 +++++++++++++++++++++++++++
>>>   3 files changed, 44 insertions(+)
>>>
>>> diff --git a/xen/arch/arm/include/asm/mm.h 
>>> b/xen/arch/arm/include/asm/mm.h
>>> index daa6329505..66d98b9a29 100644
>>> --- a/xen/arch/arm/include/asm/mm.h
>>> +++ b/xen/arch/arm/include/asm/mm.h
>>> @@ -341,6 +341,19 @@ static inline uint64_t gvirt_to_maddr(vaddr_t 
>>> va, paddr_t *pa,
>>>   #define virt_to_mfn(va)     __virt_to_mfn(va)
>>>   #define mfn_to_virt(mfn)    __mfn_to_virt(mfn)
>>>
>>> +#ifdef CONFIG_HAS_MPU
>>> +/* Convert between virtual address to page-info structure. */
>>> +static inline struct page_info *virt_to_page(const void *v)
>>> +{
>>> +    unsigned long pdx;
>>> +
>>> +    pdx = paddr_to_pdx(virt_to_maddr(v));
>>> +    ASSERT(pdx >= frametable_base_pdx);
>>> +    ASSERT(pdx < frametable_pdx_end);
>>> +
>>> +    return frame_table + pdx - frametable_base_pdx;
>>> +}
>> This should go in xen/arch/arm/include/asm/mpu/mm.h. Then you don't 
>> need ifdef
>>> +#else
>>>   /* Convert between Xen-heap virtual addresses and page-info 
>>> structures. */
>>>   static inline struct page_info *virt_to_page(const void *v)
>>>   {
>>> @@ -354,6 +367,7 @@ static inline struct page_info 
>>> *virt_to_page(const void *v)
>>>       pdx += mfn_to_pdx(directmap_mfn_start);
>>>       return frame_table + pdx - frametable_base_pdx;
>>>   }
>> Consequently, this should be in xen/arch/arm/include/asm/mmu/mm.h
> 
> The reason why I don't put virt_to_page()/page_to_virt() in specific 
> header is that we are using some helpers, which are defined just
> a few lines before, like mfn_to_virt(), etc.
> If you are moving mfn_to_virt() to specific header too, that will
> result in a lot dulplication.
> 
>>> +#endif
>>>
>>>   static inline void *page_to_virt(const struct page_info *pg)
>>>   {
>>> diff --git a/xen/arch/arm/include/asm/mpu/mm.h 
>>> b/xen/arch/arm/include/asm/mpu/mm.h
>>> index e26bd4f975..98f6df65b8 100644
>>> --- a/xen/arch/arm/include/asm/mpu/mm.h
>>> +++ b/xen/arch/arm/include/asm/mpu/mm.h
>>> @@ -2,6 +2,9 @@
>>>   #ifndef __ARCH_ARM_MM_MPU__
>>>   #define __ARCH_ARM_MM_MPU__
>>>
>>> +extern struct page_info *frame_table;
>> If you define frame_table in xen/arch/arm/include/asm/mm.h , then you 
>> don't need the above declaration.
> 
> It is a variable only in MPU. In MMU, it is a fixed value.
> "#define frame_table ((struct page_info *)FRAMETABLE_VIRT_START)"
> 
>>> +extern unsigned long frametable_pdx_end;
>> Also you don't need extern as this is only used by xen/arch/arm/mpu/mm.c.
> 
> sure.
> 
>>> +
>>>   extern int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned 
>>> int flags);
>>
>> You don't need extern here as it should be used only in 
>> xen/arch/arm/mpu/mm.c
>>
>> Currently, I see the following in xen/arch/arm/mm.c,
>>
>> int map_pages_to_xen(unsigned long virt,
>>                       mfn_t mfn,
>>                       unsigned long nr_mfns,
>>                       unsigned int flags)
>> {
>> #ifndef CONFIG_HAS_MPU
>>      return xen_pt_update(virt, mfn, nr_mfns, flags);
>> #else
>>      return xen_mpumap_update(mfn_to_maddr(mfn),
>>                               mfn_to_maddr(mfn_add(mfn, nr_mfns)), 
You are ignoring 'virt' here. Shouldn't you at least check that 'virt == 
mfn_to_maddr(mfn)'?

>> flags);
>> #endif
>> }
>>
>> int destroy_xen_mappings(unsigned long s, unsigned long e)
>> {
>>      ASSERT(IS_ALIGNED(s, PAGE_SIZE));
>>      ASSERT(IS_ALIGNED(e, PAGE_SIZE));
>>      ASSERT(s <= e);
>> #ifndef CONFIG_HAS_MPU
>>      return xen_pt_update(s, INVALID_MFN, (e - s) >> PAGE_SHIFT, 0);
>> #else
>>      return xen_mpumap_update(virt_to_maddr((void *)s),
>>                               virt_to_maddr((void *)e), 0);
>> #endif
>> }
>>
>> int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int 
>> flags)
>> {
>>      ASSERT(IS_ALIGNED(s, PAGE_SIZE));
>>      ASSERT(IS_ALIGNED(e, PAGE_SIZE));
>>      ASSERT(s <= e);
>> #ifndef CONFIG_HAS_MPU
>>      return xen_pt_update(s, INVALID_MFN, (e - s) >> PAGE_SHIFT, flags);
>> #else
>>      return xen_mpumap_update(virt_to_maddr((void *)s),
>>                               virt_to_maddr((void *)e), flags);
>> #endif
>> }
>>
>> It would be better to have 2 implementations for map_pages_to_xen(), 
>> destroy_xen_mappings() and modify_xen_mappings() in 
>> xen/arch/arm/mpu/mm.c and xen/arch/arm/mmu/mm.c.
>>
> 
> I prefer them staying in the common file, using #ifdef to go to the
> different path.
I don't like the #ifdef solution in this situation. You are only doing 
it for the benefits of the ASSERT(). But they don't seem to have any 
value for xen_mpumap_update() (you are still passing an address rather 
than a frame).

> Since if not and when anyone wants to update map_pages_to_xen(), 
> destroy_xen_mappings() and modify_xen_mappings() in the future, it is 
> possible for them to leave changes in only one file.

The helpers are just wrappers. I doubt they will change in the future. 
So I think it would be OK to duplicate.

The alternative would to have a common prototype for xen_pt_update() and 
xen_mpumap_update() and avoid any #ifdery. That said, this is not my 
preference at least if they are not static inline.

Cheers,

-- 
Julien Grall

