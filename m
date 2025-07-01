Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1879AEFB72
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jul 2025 16:02:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029760.1403501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWbYp-00028z-DS; Tue, 01 Jul 2025 14:02:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029760.1403501; Tue, 01 Jul 2025 14:02:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWbYp-00026p-Aq; Tue, 01 Jul 2025 14:02:11 +0000
Received: by outflank-mailman (input) for mailman id 1029760;
 Tue, 01 Jul 2025 14:02:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tqAo=ZO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uWbYn-00026j-VH
 for xen-devel@lists.xenproject.org; Tue, 01 Jul 2025 14:02:10 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f99f97ce-5683-11f0-b894-0df219b8e170;
 Tue, 01 Jul 2025 16:02:07 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ae0de1c378fso479749766b.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Jul 2025 07:02:07 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae353ca1ca6sm888089866b.176.2025.07.01.07.02.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jul 2025 07:02:04 -0700 (PDT)
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
X-Inumbo-ID: f99f97ce-5683-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751378527; x=1751983327; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJ1zBojffemAZxLM60c8o7JVtSqt6pQjvL5iBOB7TYE=;
        b=UJKDFTY7C8Btjj/RopAFzA+WVGkq4WVA4+3THeYEMAoIsjtIf+/taUvp2iFz3tgAtr
         UQFXx7qy8cwD8QFCkf8TIlgl+WwRHThke1iKHs0/3aTXhpXVxEp1QPMjQy4UrbkEAwYe
         ka8k2KU8NJiNpO09EthA8hxpn//KHBL7IC7+f9ss9HbMbIZCKldYSAcgtxNmDWnJedbv
         P31Pgm2ZyzR2LmqjG1k/+ChIm1uH0I2wjmfjXAHNc/HZPB1ONEIyby1a50+SdQ41WO+5
         FpjGzUX1JlKmktnd/1RCORTNHcSVcwjK5lgzoaLnDVjK8GLVBsyFHeVB+0aY5lTYChWG
         qR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751378527; x=1751983327;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SJ1zBojffemAZxLM60c8o7JVtSqt6pQjvL5iBOB7TYE=;
        b=r6zycqEdAuX0m0xuTnzgWI40C2TCqtsBJVGg4p4aD2q8MTeNQdVPBWIVQjFHZXQzz6
         l5vXuNum66LBrol9LhtqzGPy6Ij7KernXb1++Ud+algl4hpyEmAXa0Ie0zQvluZTC1oB
         Q+Jyh+bt7W9atEnCvrRo5AjvSaKCXy+Gy+VisKkWWbDNYeIrZtcMFAFe2O9e0idHzg2y
         Kvc6BQYIfvJe5wpVHrtYb6JR1vBq27EpKbh2hbWsBefsPiDH+qekDpBKJ4dSuEmt3q2+
         TmER+lrZ1pIB/rYmVKB/WlqkSgIDPD3ZUb+W/wu8bX9lORefgJwg/1FuHOLZS4aHuiqr
         uMoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuX1dmE5kyPDlJPx2D++31ArUZT93/EQPIbWc7lNyZaeYq04PJJX6pNKvf8vxhNmNnltm5dEzSB8Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy5FSY6Gol3EJCuFNzdPaNxauE5V3QxZ2fukUfdk7Q0qB+m2X9X
	yKMRZ04ZiAzQQ+Y+bws1D97+8zcEkQl8vGc0MgYx9sVfVXUFoL2eW2hP
X-Gm-Gg: ASbGncuuhLfUKoTpIPVeR8myEeeO7hk6teoD5Cfceh4WMK9G+XcGRG0pvUTNsGPQupG
	tsucEwre/HdVR4sBVTkaqcZTDUUcQJw/Y0AO6Q8XbzS+K1Ru8aKhrXRKC007+KU0/hYpPJ2QDVv
	vA0VxD+1b/PrJijliLiESoweK7YON+zX62lkv/ZdeF/4DGPGRRRIQ2FzKZikOlGV1dh/9Dl+Wjs
	UHLbQ3IPiJ6p17/5guzKpJOz1qbtL2CxG8AMRHEfkG5XESZE4i6FxVM6H3jojCoSMAkswKgNudD
	20WDFIduxVyz+jDKx9xCbia2R2m/iB7bRe5ZwFhTCpjHzQxCin3rctqJzIGa+cv6GfXg8v8DuUd
	xbIEWGmMbPsDDhWerS4C0qclyxyOwt33/rY4=
X-Google-Smtp-Source: AGHT+IE43kzo2PgcSIezF3wYCc+DSK9UZHIoS6+a0J+Uz/nZ0XLg3mCJVh77uiUgxpDWBB85ngYo9g==
X-Received: by 2002:a17:907:3fa8:b0:ad5:27f5:7183 with SMTP id a640c23a62f3a-ae3500b3f5bmr1616088066b.39.1751378526518;
        Tue, 01 Jul 2025 07:02:06 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------RDkAIySSNyshNttyKe3bPWrw"
Message-ID: <a30141b2-1b02-482c-b6dd-a017d976fdc1@gmail.com>
Date: Tue, 1 Jul 2025 16:02:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/17] xen/riscv: add root page table allocation
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <76675ddb7517e4cceb63472c94944046b255da01.1749555949.git.oleksii.kurochko@gmail.com>
 <9c89ead3-7577-46f2-acc2-6dd8d793ab89@suse.com>
 <c9924195-17e5-4f47-869a-c7930a65538c@gmail.com>
 <49de841e-d3dd-447f-98f2-77de8b2acf94@suse.com>
 <55144da9-cf8e-4b73-8817-e72d8ff91019@gmail.com>
 <b658471f-28f2-4ee7-b1c1-41837daa72c2@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <b658471f-28f2-4ee7-b1c1-41837daa72c2@suse.com>

This is a multi-part message in MIME format.
--------------RDkAIySSNyshNttyKe3bPWrw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 7/1/25 12:27 PM, Jan Beulich wrote:
> On 01.07.2025 11:44, Oleksii Kurochko wrote:
>> On 7/1/25 8:29 AM, Jan Beulich wrote:
>>> On 30.06.2025 18:18, Oleksii Kurochko wrote:
>>>> On 6/30/25 5:22 PM, Jan Beulich wrote:
>>>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>>>> --- a/xen/arch/riscv/include/asm/p2m.h
>>>>>> +++ b/xen/arch/riscv/include/asm/p2m.h
>>>>>> @@ -26,6 +26,12 @@ struct p2m_domain {
>>>>>>         /* Pages used to construct the p2m */
>>>>>>         struct page_list_head pages;
>>>>>>     
>>>>>> +    /* The root of the p2m tree. May be concatenated */
>>>>>> +    struct page_info *root;
>>>>>> +
>>>>>> +    /* Address Translation Table for the p2m */
>>>>>> +    paddr_t hgatp;
>>>>> Does this really need holding in a struct field? Can't is be re-created at
>>>>> any time from "root" above?
>>>> Yes, with the current one implementation, I agree it would be enough only
>>>> root. But as you noticed below...
>>>>
>>>>> And such re-creation is apparently infrequent,
>>>>> if happening at all after initial allocation. (But of course I don't know
>>>>> what future patches of yours will bring.) This is even more so if ...
>>>>>
>>>>>> --- a/xen/arch/riscv/include/asm/riscv_encoding.h
>>>>>> +++ b/xen/arch/riscv/include/asm/riscv_encoding.h
>>>>>> @@ -133,11 +133,13 @@
>>>>>>     #define HGATP_MODE_SV48X4		_UL(9)
>>>>>>     
>>>>>>     #define HGATP32_MODE_SHIFT		31
>>>>>> +#define HGATP32_MODE_MASK		_UL(0x80000000)
>>>>>>     #define HGATP32_VMID_SHIFT		22
>>>>>>     #define HGATP32_VMID_MASK		_UL(0x1FC00000)
>>>>>>     #define HGATP32_PPN			_UL(0x003FFFFF)
>>>>>>     
>>>>>>     #define HGATP64_MODE_SHIFT		60
>>>>>> +#define HGATP64_MODE_MASK		_ULL(0xF000000000000000)
>>>>>>     #define HGATP64_VMID_SHIFT		44
>>>>>>     #define HGATP64_VMID_MASK		_ULL(0x03FFF00000000000)
>>>>> ... VMID management is going to change as previously discussed, at which
>>>>> point the value to put in hgatp will need (partly) re-calculating at certain
>>>>> points anyway.
>>>> ... after VMID management will changed to per-CPU base then it will be needed
>>>> to update re-calculate hgatp each time vCPU on pCPU is changed.
>>>> In this case I prefer to have partially calculated 'hgatp'.
>>> But why, when you need to do some recalculation anyway?
>> Less operations will be needed to do.
> Right; I wonder how big the savings would be.

Probably not big.

>
>> If we have partially prepared 'hgatp' then we have to only update VMID bits
>> instead of getting ppn for page, then calculate hgatp_mode each time.
>> But if you think it isn't really needed I can add vmid argument for hgatp_from_page()
>> and just call this function when an update of hgatp is needed.
> I think it'll need to be struct p2m_domain * that you (also?) pass in. In the
> longer run I think you will want to support all three permitted modes, with
> smaller guests using fewer page table levels.

Yes, but these modes will be const for a domain, I guess. I mean that once a mode has
been set, it isn't going to be changed. But VMID is going to be changed each time vCPU
gives control to another vCPU.
Anyway, I am okay to make update of hgatp more generic and just update it fully each
time it is needed.

>
> As to "also" - maybe it's better to change the name of the function, and pass
> in just (const if possible) struct p2m_domain *.
>
>>>>>> --- a/xen/arch/riscv/p2m.c
>>>>>> +++ b/xen/arch/riscv/p2m.c
>>>>>> @@ -41,6 +41,91 @@ void p2m_write_unlock(struct p2m_domain *p2m)
>>>>>>         write_unlock(&p2m->lock);
>>>>>>     }
>>>>>>     
>>>>>> +static void clear_and_clean_page(struct page_info *page)
>>>>>> +{
>>>>>> +    clean_dcache_va_range(page, PAGE_SIZE);
>>>>>> +    clear_domain_page(page_to_mfn(page));
>>>>>> +}
>>>>> A function of this name can, imo, only clear and then clean. Question is why
>>>>> it's the other way around, and what the underlying requirement is for the
>>>>> cleaning part to be there in the first place. Maybe that's obvious for a
>>>>> RISC-V person, but it's entirely non-obvious to me (Arm being different in
>>>>> this regard because of running with caches disabled at certain points in
>>>>> time).
>>>> You're right, the current name|clear_and_clean_page()| implies that clearing
>>>> should come before cleaning, which contradicts the current implementation.
>>>> The intent here is to ensure that the page contents are consistent in RAM
>>>> (not just in cache) before use by other entities (guests or devices).
>>>>
>>>> The clean must follow the clear — so yes, the order needs to be reversed.
>>> What you don't address though - why's the cleaning needed in the first place?
>> If we clean the data cache first, we flush the d-cache and then use the page to
>> perform the clear operation. As a result, the "cleared" value will be written into
>> the d-cache. To avoid polluting the d-cache with the "cleared" value, the correct
>> sequence is to clear the page first, then clean the data cache.
> If you want to avoid cache pollution, I think you'd need to use a form of stores
> which simply bypass the cache. Yet then - why would this matter here, but not
> elsewhere? Wouldn't you better leave such to the hardware, unless you can prove
> a (meaningful) performance gain?

I thought about a case when IOMMU doesn't support coherent walks and p2m tables are
shared between CPU and IOMMU. Then my understanding is:
- clear_page(p) just zero-ing a page in a CPU's cache.
- But IOMMU can see old data or uninitialized, if they still in cache.
- So, it is need to do clean_cache() to writeback data from cache to RAM, before a
   page will be used as a part of page table for IOMMU.

>
>>>>>> +    unsigned int nr_pages = _AC(1,U) << order;
>>>>> Nit (style): Missing blank after comma.
>>>> I've changed that to BIT(order, U)
>>>>
>>>>>> +    /* Return back nr_pages necessary for p2m root table. */
>>>>>> +
>>>>>> +    if ( ACCESS_ONCE(d->arch.paging.p2m_total_pages) < nr_pages )
>>>>>> +        panic("Specify more xen,domain-p2m-mem-mb\n");
>>>>> You shouldn't panic() in anything involved in domain creation. You want to
>>>>> return NULL in this case.
>>>> It makes sense in this case just to return NULL.
>>>>
>>>>> Further, to me the use of "more" looks misleading here. Do you perhaps mean
>>>>> "larger" or "bigger"?
>>>>>
>>>>> This also looks to be happening without any lock held. If that's intentional,
>>>>> I think the "why" wants clarifying in a code comment.
>>>> Agree, returning back pages necessary for p2m root table should be done under
>>>> spin_lock(&d->arch.paging.lock).
>>> Which should be acquired at the paging_*() layer then, not at the p2m_*() layer.
>>> (As long as you mean to have that separation, that is. See the earlier discussion
>>> on that matter.)
>> Then partly p2m_set_allocation() should be moved to paging_*() too.
> Not exactly sure what you mean. On x86 at least the paging layer part of
> the function is pretty slim.

I meant that part of code which is spin_lock(&d->arch.paging.lock); ... spin_unlock(&d->arch.paging.lock)
in function p2m_set_allocation() should be moved somewhere to paging_*() layer for the same logic as you
suggested to move part of  p2m_allocate_root()'s code which is guarded by d->arch.paging.lock to
paging_*() layer.

Or I just misunderstood your initial idea with this paging_*() layer and its necessity.

>
>>>>>> +    for ( unsigned int i = 0; i < nr_pages; i++ )
>>>>>> +    {
>>>>>> +        /* Return memory to domheap. */
>>>>>> +        page = page_list_remove_head(&d->arch.paging.p2m_freelist);
>>>>>> +        if( page )
>>>>>> +        {
>>>>>> +            ACCESS_ONCE(d->arch.paging.p2m_total_pages)--;
>>>>>> +            free_domheap_page(page);
>>>>>> +        }
>>>>>> +        else
>>>>>> +        {
>>>>>> +            printk(XENLOG_ERR
>>>>>> +                   "Failed to free P2M pages, P2M freelist is empty.\n");
>>>>>> +            return NULL;
>>>>>> +        }
>>>>>> +    }
>>>>> The reason for doing this may also want to be put in a comment.
>>>> I thought it would be enough the comment above: /* Return back nr_pages necessary for p2m root table. */
>>> That describes what the code does, but not why.
>> I will add to the comment: "... to get the memory accounting right".
> I'm sorry to be picky, but what is "right"? You want assure the root table
> memory is also accounted against the P2M pool of the domain. Can't you say
> exactly that?

It can be said in this way.

Thanks.

~ Oleksii

--------------RDkAIySSNyshNttyKe3bPWrw
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/1/25 12:27 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:b658471f-28f2-4ee7-b1c1-41837daa72c2@suse.com">
      <pre wrap="" class="moz-quote-pre">On 01.07.2025 11:44, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 7/1/25 8:29 AM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 30.06.2025 18:18, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On 6/30/25 5:22 PM, Jan Beulich wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">On 10.06.2025 15:05, Oleksii Kurochko wrote:
</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -26,6 +26,12 @@ struct p2m_domain {
       /* Pages used to construct the p2m */
       struct page_list_head pages;
   
+    /* The root of the p2m tree. May be concatenated */
+    struct page_info *root;
+
+    /* Address Translation Table for the p2m */
+    paddr_t hgatp;
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">Does this really need holding in a struct field? Can't is be re-created at
any time from "root" above?
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">Yes, with the current one implementation, I agree it would be enough only
root. But as you noticed below...

</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">And such re-creation is apparently infrequent,
if happening at all after initial allocation. (But of course I don't know
what future patches of yours will bring.) This is even more so if ...

</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/include/asm/riscv_encoding.h
+++ b/xen/arch/riscv/include/asm/riscv_encoding.h
@@ -133,11 +133,13 @@
   #define HGATP_MODE_SV48X4		_UL(9)
   
   #define HGATP32_MODE_SHIFT		31
+#define HGATP32_MODE_MASK		_UL(0x80000000)
   #define HGATP32_VMID_SHIFT		22
   #define HGATP32_VMID_MASK		_UL(0x1FC00000)
   #define HGATP32_PPN			_UL(0x003FFFFF)
   
   #define HGATP64_MODE_SHIFT		60
+#define HGATP64_MODE_MASK		_ULL(0xF000000000000000)
   #define HGATP64_VMID_SHIFT		44
   #define HGATP64_VMID_MASK		_ULL(0x03FFF00000000000)
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">... VMID management is going to change as previously discussed, at which
point the value to put in hgatp will need (partly) re-calculating at certain
points anyway.
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">... after VMID management will changed to per-CPU base then it will be needed
to update re-calculate hgatp each time vCPU on pCPU is changed.
In this case I prefer to have partially calculated 'hgatp'.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">But why, when you need to do some recalculation anyway?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Less operations will be needed to do.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Right; I wonder how big the savings would be.</pre>
    </blockquote>
    <pre>Probably not big.
</pre>
    <blockquote type="cite"
      cite="mid:b658471f-28f2-4ee7-b1c1-41837daa72c2@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">If we have partially prepared 'hgatp' then we have to only update VMID bits
instead of getting ppn for page, then calculate hgatp_mode each time.
But if you think it isn't really needed I can add vmid argument for hgatp_from_page()
and just call this function when an update of hgatp is needed.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I think it'll need to be struct p2m_domain * that you (also?) pass in. In the
longer run I think you will want to support all three permitted modes, with
smaller guests using fewer page table levels.</pre>
    </blockquote>
    <pre>Yes, but these modes will be const for a domain, I guess. I mean that once a mode has
been set, it isn't going to be changed. But VMID is going to be changed each time vCPU
gives control to another vCPU.
Anyway, I am okay to make update of hgatp more generic and just update it fully each
time it is needed.

</pre>
    <blockquote type="cite"
      cite="mid:b658471f-28f2-4ee7-b1c1-41837daa72c2@suse.com">
      <pre wrap="" class="moz-quote-pre">

As to "also" - maybe it's better to change the name of the function, and pass
in just (const if possible) struct p2m_domain *.

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -41,6 +41,91 @@ void p2m_write_unlock(struct p2m_domain *p2m)
       write_unlock(&amp;p2m-&gt;lock);
   }
   
+static void clear_and_clean_page(struct page_info *page)
+{
+    clean_dcache_va_range(page, PAGE_SIZE);
+    clear_domain_page(page_to_mfn(page));
+}
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">A function of this name can, imo, only clear and then clean. Question is why
it's the other way around, and what the underlying requirement is for the
cleaning part to be there in the first place. Maybe that's obvious for a
RISC-V person, but it's entirely non-obvious to me (Arm being different in
this regard because of running with caches disabled at certain points in
time).
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">You're right, the current name|clear_and_clean_page()| implies that clearing
should come before cleaning, which contradicts the current implementation.
The intent here is to ensure that the page contents are consistent in RAM
(not just in cache) before use by other entities (guests or devices).

The clean must follow the clear — so yes, the order needs to be reversed.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">What you don't address though - why's the cleaning needed in the first place?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
If we clean the data cache first, we flush the d-cache and then use the page to
perform the clear operation. As a result, the "cleared" value will be written into
the d-cache. To avoid polluting the d-cache with the "cleared" value, the correct
sequence is to clear the page first, then clean the data cache.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
If you want to avoid cache pollution, I think you'd need to use a form of stores
which simply bypass the cache. Yet then - why would this matter here, but not
elsewhere? Wouldn't you better leave such to the hardware, unless you can prove
a (meaningful) performance gain?</pre>
    </blockquote>
    <pre>I thought about a case when IOMMU doesn't support coherent walks and p2m tables are
shared between CPU and IOMMU. Then my understanding is:
- clear_page(p) just zero-ing a page in a CPU's cache.
- But IOMMU can see old data or uninitialized, if they still in cache.
- So, it is need to do clean_cache() to writeback data from cache to RAM, before a
  page will be used as a part of page table for IOMMU.

</pre>
    <blockquote type="cite"
      cite="mid:b658471f-28f2-4ee7-b1c1-41837daa72c2@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">+    unsigned int nr_pages = _AC(1,U) &lt;&lt; order;
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">Nit (style): Missing blank after comma.
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">I've changed that to BIT(order, U)

</pre>
            <blockquote type="cite">
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">+    /* Return back nr_pages necessary for p2m root table. */
+
+    if ( ACCESS_ONCE(d-&gt;arch.paging.p2m_total_pages) &lt; nr_pages )
+        panic("Specify more xen,domain-p2m-mem-mb\n");
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">You shouldn't panic() in anything involved in domain creation. You want to
return NULL in this case.
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">It makes sense in this case just to return NULL.

</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">Further, to me the use of "more" looks misleading here. Do you perhaps mean
"larger" or "bigger"?

This also looks to be happening without any lock held. If that's intentional,
I think the "why" wants clarifying in a code comment.
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">Agree, returning back pages necessary for p2m root table should be done under
spin_lock(&amp;d-&gt;arch.paging.lock).
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Which should be acquired at the paging_*() layer then, not at the p2m_*() layer.
(As long as you mean to have that separation, that is. See the earlier discussion
on that matter.)
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Then partly p2m_set_allocation() should be moved to paging_*() too.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Not exactly sure what you mean. On x86 at least the paging layer part of
the function is pretty slim.</pre>
    </blockquote>
    <pre>I meant that part of code which is spin_lock(&amp;d-&gt;arch.paging.lock); ... spin_unlock(&amp;d-&gt;arch.paging.lock)
in function p2m_set_allocation() should be moved somewhere to paging_*() layer for the same logic as you
suggested to move part of  p2m_allocate_root()'s code which is guarded by d-&gt;arch.paging.lock to
paging_*() layer.

Or I just misunderstood your initial idea with this paging_*() layer and its necessity.
</pre>
    <blockquote type="cite"
      cite="mid:b658471f-28f2-4ee7-b1c1-41837daa72c2@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">+    for ( unsigned int i = 0; i &lt; nr_pages; i++ )
+    {
+        /* Return memory to domheap. */
+        page = page_list_remove_head(&amp;d-&gt;arch.paging.p2m_freelist);
+        if( page )
+        {
+            ACCESS_ONCE(d-&gt;arch.paging.p2m_total_pages)--;
+            free_domheap_page(page);
+        }
+        else
+        {
+            printk(XENLOG_ERR
+                   "Failed to free P2M pages, P2M freelist is empty.\n");
+            return NULL;
+        }
+    }
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">The reason for doing this may also want to be put in a comment.
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">I thought it would be enough the comment above: /* Return back nr_pages necessary for p2m root table. */
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">That describes what the code does, but not why.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
I will add to the comment: "... to get the memory accounting right".
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I'm sorry to be picky, but what is "right"? You want assure the root table
memory is also accounted against the P2M pool of the domain. Can't you say
exactly that?
</pre>
    </blockquote>
    <pre>It can be said in this way.

Thanks.

~ Oleksii</pre>
  </body>
</html>

--------------RDkAIySSNyshNttyKe3bPWrw--

