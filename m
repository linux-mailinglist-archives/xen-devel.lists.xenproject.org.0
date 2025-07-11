Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6072AB020F7
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 17:57:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1041047.1412228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaG7B-00017O-5O; Fri, 11 Jul 2025 15:56:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1041047.1412228; Fri, 11 Jul 2025 15:56:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaG7B-000157-2K; Fri, 11 Jul 2025 15:56:45 +0000
Received: by outflank-mailman (input) for mailman id 1041047;
 Fri, 11 Jul 2025 15:56:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MRqD=ZY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uaG79-00014z-6x
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 15:56:43 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a24d2918-5e6f-11f0-b894-0df219b8e170;
 Fri, 11 Jul 2025 17:56:40 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-ae35f36da9dso443672166b.0
 for <xen-devel@lists.xenproject.org>; Fri, 11 Jul 2025 08:56:40 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e8264608sm318060466b.109.2025.07.11.08.56.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jul 2025 08:56:39 -0700 (PDT)
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
X-Inumbo-ID: a24d2918-5e6f-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752249400; x=1752854200; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lnql3C3gURMkcH82frCebBMnplxbo3pAqWxO2Lpu2Ns=;
        b=BacEM28AxMRIT6p3B8uXcf+5p+ZQBu5eGEziYtgXFHm2QmRh0+kb8l1GJp5zo61Qqo
         3XheWFChiyzROILAieBcjl9/IN0U8fvwFOi6ST6l+c2rMiHvV4lWVZge8IGUsha+3nLm
         Kwl3Qwd8+wK9D2Nrb2eY6dm4np2xoS6AQkzrxJnl59lCO+GUzf9dT26hDX7r23f1LAgn
         mjzl2r2VusOkjJ1aa+79NUEsVZNRGi9q5ALc1YViRi5nSjK96f7KLHZsfi9ODniy3f2V
         EwI0qloBSc5AK7RyIFosW9cKwVwzRSpS28d1m6aKebzsFSr16KmVWB7ZkXmR9L1fnGC/
         h/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752249400; x=1752854200;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Lnql3C3gURMkcH82frCebBMnplxbo3pAqWxO2Lpu2Ns=;
        b=QYNBo4i7K+1KIFF4o+J3k3dhWUVZHEK6W3cpWNRB4V/YVhsDHPD924Y2mRjVs5z2SM
         LI14uG5KXnvl3GGyBGoyN/70ji4mMeVAWYzW4UcwjBMBx6IqhJU04TNGdZA3XKidI0Ws
         0RS41g48nVlfuSzPXef6HPnQYO8ijuKyaK2zd679HxH90C4zm/fjlcBohLfsGFy5I3LA
         mksGNMIX25oQWwIT0KnuJwtHyrikcLeNeTZciDR/UWhbeM9pCIyhUXa0nNzFJh8pT7ww
         3lKyuZnKFuaQ+1CoRMAT8IPWGzRVNFBxVvWcw6J1Il1GGmRq8nNgOb6qzSYNQO1dn33E
         baoA==
X-Forwarded-Encrypted: i=1; AJvYcCVZ9vbrBujOKX4FSTTemrxGAaql/JlKI2LNSN991VLJWnrakJTjpmazhjM3iCJ1qB2bUlYGKmWNHfU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxsUSF95qDqJqmvgMtkbPD2qaMocfnLBXnKj1OuQcIe2/39B2bf
	Fm9Ury7wGu/5a9rF1pF/Tc/8hfZnK1DcCauKsmcuFiTuiUowyixCAi1p
X-Gm-Gg: ASbGncuNDdIW9RC4G8OzBwMrAc54bNPVk9+Y/WGZ4VPA9Nu1cTg9NTGspcO/V1gRiH4
	7cDFa0v8U4DudvoUCDiF9tRnyQVqBzmmUtUt/SMZq4Nwy6kd4tQbuMPK0jQVil8Sh7EPS7Q0pSC
	PFwj4A4GDP0YTBOT66lQzgEnrTGEYJi/Lpl0SwqklYrtxD/hhFYNezunEDs1EfEoqkxzuuiHLuE
	26nZ3qZvAkek8peShkyLsKQM7w7nw+4qhRalMXada6HUXY5Eh0rT7sRr+5+jFu9ZnqsgD3x3Z+l
	PkCLDPBj/Ja+LgkbjHjo3klzyvhizJoqy8aWnFeS+QOkjH5DgjTkSHh0vGmh6dUq2d1BoajWQlx
	wdB5UaaevJFe+tzAmc3jgLTT9l37BfQtpfRwmIvO3HEzocy8TFb+nNWq7d2Pion8jV24psic=
X-Google-Smtp-Source: AGHT+IFNiPiHen3263UE1a2QtnEQU9VoWAOXsLPrxJAkip69KgBEWMmwHdVszirYFCKdECu/iATEkA==
X-Received: by 2002:a17:907:9282:b0:ae0:c6fb:2140 with SMTP id a640c23a62f3a-ae6fc120500mr406677066b.32.1752249399568;
        Fri, 11 Jul 2025 08:56:39 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------I9pxgsR01aLJT3O9wkZZVWSL"
Message-ID: <de4ce9e3-c858-4ef6-917e-c9dd05bca02e@gmail.com>
Date: Fri, 11 Jul 2025 17:56:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/17] xen/riscv: Implement p2m_free_entry() and
 related helpers
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <67148a7cceffdcbc5d8a51cd6af0a0c83e5b93bc.1749555949.git.oleksii.kurochko@gmail.com>
 <ec05b4c8-c328-4dc3-9f35-207421990893@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <ec05b4c8-c328-4dc3-9f35-207421990893@suse.com>

This is a multi-part message in MIME format.
--------------I9pxgsR01aLJT3O9wkZZVWSL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/1/25 4:23 PM, Jan Beulich wrote:
> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>> This patch introduces a working implementation of p2m_free_entry() for RISC-V
>> based on ARM's implementation of p2m_free_entry(), enabling proper cleanup
>> of page table entries in the P2M (physical-to-machine) mapping.
>>
>> Only few things are changed:
>> - Use p2m_force_flush_sync() instead of p2m_tlb_flush_sync() as latter
>>    isn't implemented on RISC-V.
>> - Introduce and use p2m_type_radix_get() to get a type of p2m entry as
>>    RISC-V's PTE doesn't have enough space to store all necessary types so
>>    a type is stored in a radix tree.
>>
>> Key additions include:
>> - p2m_free_entry(): Recursively frees page table entries at all levels. It
>>    handles both regular and superpage mappings and ensures that TLB entries
>>    are flushed before freeing intermediate tables.
>> - p2m_put_page() and helpers:
>>    - p2m_put_4k_page(): Clears GFN from xenheap pages if applicable.
>>    - p2m_put_2m_superpage(): Releases foreign page references in a 2MB
>>      superpage.
>>    - p2m_type_radix_get(): Extracts the stored p2m_type from the radix tree
>>      using the PTE.
>> - p2m_free_page(): Returns a page either to the domain's freelist or to
>>    the domheap, depending on whether the domain is hardware-backed.
> What is "hardware-backed"?

It means basically hardware domain, i.e. DOM0.

>> --- a/xen/arch/riscv/p2m.c
>> +++ b/xen/arch/riscv/p2m.c
>> @@ -345,11 +345,33 @@ static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
>>       return __map_domain_page(p2m->root + root_table_indx);
>>   }
>>   
>> +static p2m_type_t p2m_type_radix_get(struct p2m_domain *p2m, pte_t pte)
> Does it matter to callers that ...
>
>> +{
>> +    void *ptr;
>> +    gfn_t gfn = mfn_to_gfn(p2m->domain, mfn_from_pte(pte));
>> +
>> +    ptr = radix_tree_lookup(&p2m->p2m_type, gfn_x(gfn));
>> +
>> +    if ( !ptr )
>> +        return p2m_invalid;
>> +
>> +    return radix_tree_ptr_to_int(ptr);
>> +}
> ... this is a radix tree lookup? IOW does "radix" need to be part of the
> function name? Also "get" may want to move forward in the name, to better
> match the naming of other functions.

Agree, it doesn't really matter, so I will rename it.

>> +/*
>> + * In the case of the P2M, the valid bit is used for other purpose. Use
>> + * the type to check whether an entry is valid.
>> + */
>>   static inline bool p2me_is_valid(struct p2m_domain *p2m, pte_t pte)
>>   {
>> -    panic("%s: isn't implemented for now\n", __func__);
>> +    return p2m_type_radix_get(p2m, pte) != p2m_invalid;
>> +}
> No checking of the valid bit?

As mentioned in the comment, only the P2M type should be checked, since the
valid bit is used for other purposes we discussed earlier, for example, to
track whether pages were accessed by a guest domain, or to support certain
table invalidation optimizations (1) and (2).
So, in this case, we only need to consider whether the entry is invalid
from the P2M perspective.

(1)https://github.com/xen-project/xen/blob/19772b67/xen/arch/arm/mmu/p2m.c#L1245
(2)https://github.com/xen-project/xen/blob/19772b67/xen/arch/arm/mmu/p2m.c#L1386

>> @@ -404,11 +426,127 @@ static int p2m_next_level(struct p2m_domain *p2m, bool alloc_tbl,
>>       return GUEST_TABLE_MAP_NONE;
>>   }
>>   
>> +static void p2m_put_foreign_page(struct page_info *pg)
>> +{
>> +    /*
>> +     * It's safe to do the put_page here because page_alloc will
>> +     * flush the TLBs if the page is reallocated before the end of
>> +     * this loop.
>> +     */
>> +    put_page(pg);
> Is the comment really true? The page allocator will flush the normal
> TLBs, but not the stage-2 ones. Yet those are what you care about here,
> aiui.

In alloc_heap_pages():
  ...
      if ( need_tlbflush )
         filtered_flush_tlb_mask(tlbflush_timestamp);
  ...
  
filtered_flush_tlb_mask() calls arch_flush_tlb_mask().

and arch_flush_tlb_mask(), at least, on Arm (I haven't checked x86) is
implented as:
   void arch_flush_tlb_mask(const cpumask_t *mask)
   {
       /* No need to IPI other processors on ARM, the processor takes care of it. */
       flush_all_guests_tlb();
   }

So it flushes stage-2 TLB.

>
>> +/* Put any references on the single 4K page referenced by mfn. */
>> +static void p2m_put_4k_page(mfn_t mfn, p2m_type_t type)
>> +{
>> +    /* TODO: Handle other p2m types */
>> +
>> +    /* Detect the xenheap page and mark the stored GFN as invalid. */
>> +    if ( p2m_is_ram(type) && is_xen_heap_mfn(mfn) )
>> +        page_set_xenheap_gfn(mfn_to_page(mfn), INVALID_GFN);
> Is this a valid thing to do? How do you make sure the respective uses
> (in gnttab's shared and status page arrays) are / were also removed?

As grant table frame GFN is stored directly in struct page_info instead
of keeping it in standalone status/shared arrays, thereby there is no need
for status/shared arrays.

>
>> +}
>> +
>> +/* Put any references on the superpage referenced by mfn. */
>> +static void p2m_put_2m_superpage(mfn_t mfn, p2m_type_t type)
>> +{
>> +    struct page_info *pg;
>> +    unsigned int i;
>> +
>> +    ASSERT(mfn_valid(mfn));
>> +
>> +    pg = mfn_to_page(mfn);
>> +
>> +    for ( i = 0; i < XEN_PT_ENTRIES; i++, pg++ )
>> +        p2m_put_foreign_page(pg);
>> +}
>> +
>> +/* Put any references on the page referenced by pte. */
>> +static void p2m_put_page(struct p2m_domain *p2m, const pte_t pte,
>> +                         unsigned int level)
>> +{
>> +    mfn_t mfn = pte_get_mfn(pte);
>> +    p2m_type_t p2m_type = p2m_type_radix_get(p2m, pte);
> This gives you the type of the 1st page. What guarantees that all other pages
> in a superpage are of the exact same type?

Doesn't superpage mean that all the 4KB pages within that superpage have the
same type and contiguous in memory?

>
>> +    ASSERT(p2me_is_valid(p2m, pte));
>> +
>> +    /*
>> +     * TODO: Currently we don't handle level 2 super-page, Xen is not
>> +     * preemptible and therefore some work is needed to handle such
>> +     * superpages, for which at some point Xen might end up freeing memory
>> +     * and therefore for such a big mapping it could end up in a very long
>> +     * operation.
>> +     */
> This is pretty unsatisfactory. Imo, if you don't deal with that right away,
> you're setting yourself up for a significant re-write.

ARM leaves with that for a long time and it seems like it isn't a big issue for it.
And considering that frametable supports only 4Kb page granularity such big mappings
could lead to long operations during memory freeing.
And 1gb mapping isn't used for

>
>> +    if ( level == 1 )
>> +        return p2m_put_2m_superpage(mfn, p2m_type);
>> +    else if ( level == 0 )
>> +        return p2m_put_4k_page(mfn, p2m_type);
> Use switch() right away?

It could be, I think that no big difference at the moment, at least.
But I am okay to rework it.

>
>> +}
>> +
>> +static void p2m_free_page(struct domain *d, struct page_info *pg)
>> +{
>> +    if ( is_hardware_domain(d) )
>> +        free_domheap_page(pg);
> Why's the hardware domain different here? It should have a pool just like
> all other domains have.

Hardware domain (dom0) should be no limit in the number of pages that can
be allocated, so allocate p2m pages for hardware domain is done from heap.

An idea of p2m pool is to provide a way how to put clear limit and amount
to the p2m allocation.

>
>> +    else
>> +    {
>> +        spin_lock(&d->arch.paging.lock);
>> +        page_list_add_tail(pg, &d->arch.paging.p2m_freelist);
>> +        spin_unlock(&d->arch.paging.lock);
>> +    }
>> +}
>> +
>>   /* Free pte sub-tree behind an entry */
>>   static void p2m_free_entry(struct p2m_domain *p2m,
>>                              pte_t entry, unsigned int level)
>>   {
>> -    panic("%s: hasn't been implemented yet\n", __func__);
>> +    unsigned int i;
>> +    pte_t *table;
>> +    mfn_t mfn;
>> +    struct page_info *pg;
>> +
>> +    /* Nothing to do if the entry is invalid. */
>> +    if ( !p2me_is_valid(p2m, entry) )
>> +        return;
> Does this actually apply to intermediate page tables (which you handle
> later in the function), when that's (only) a P2M type check?

Yes, any PTE should have V bit set to 1, so from P2M perspective it also
should be, at least, not equal to p2m_invalid.

~ Oleksii

--------------I9pxgsR01aLJT3O9wkZZVWSL
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/1/25 4:23 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:ec05b4c8-c328-4dc3-9f35-207421990893@suse.com">
      <pre wrap="" class="moz-quote-pre">On 10.06.2025 15:05, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">This patch introduces a working implementation of p2m_free_entry() for RISC-V
based on ARM's implementation of p2m_free_entry(), enabling proper cleanup
of page table entries in the P2M (physical-to-machine) mapping.

Only few things are changed:
- Use p2m_force_flush_sync() instead of p2m_tlb_flush_sync() as latter
  isn't implemented on RISC-V.
- Introduce and use p2m_type_radix_get() to get a type of p2m entry as
  RISC-V's PTE doesn't have enough space to store all necessary types so
  a type is stored in a radix tree.

Key additions include:
- p2m_free_entry(): Recursively frees page table entries at all levels. It
  handles both regular and superpage mappings and ensures that TLB entries
  are flushed before freeing intermediate tables.
- p2m_put_page() and helpers:
  - p2m_put_4k_page(): Clears GFN from xenheap pages if applicable.
  - p2m_put_2m_superpage(): Releases foreign page references in a 2MB
    superpage.
  - p2m_type_radix_get(): Extracts the stored p2m_type from the radix tree
    using the PTE.
- p2m_free_page(): Returns a page either to the domain's freelist or to
  the domheap, depending on whether the domain is hardware-backed.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
What is "hardware-backed"?</pre>
    </blockquote>
    <pre>It means basically hardware domain, i.e. DOM0.
</pre>
    <blockquote type="cite"
      cite="mid:ec05b4c8-c328-4dc3-9f35-207421990893@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -345,11 +345,33 @@ static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
     return __map_domain_page(p2m-&gt;root + root_table_indx);
 }
 
+static p2m_type_t p2m_type_radix_get(struct p2m_domain *p2m, pte_t pte)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Does it matter to callers that ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+{
+    void *ptr;
+    gfn_t gfn = mfn_to_gfn(p2m-&gt;domain, mfn_from_pte(pte));
+
+    ptr = radix_tree_lookup(&amp;p2m-&gt;p2m_type, gfn_x(gfn));
+
+    if ( !ptr )
+        return p2m_invalid;
+
+    return radix_tree_ptr_to_int(ptr);
+}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... this is a radix tree lookup? IOW does "radix" need to be part of the
function name? Also "get" may want to move forward in the name, to better
match the naming of other functions.</pre>
    </blockquote>
    <pre>Agree, it doesn't really matter, so I will rename it.

</pre>
    <blockquote type="cite"
      cite="mid:ec05b4c8-c328-4dc3-9f35-207421990893@suse.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+/*
+ * In the case of the P2M, the valid bit is used for other purpose. Use
+ * the type to check whether an entry is valid.
+ */
 static inline bool p2me_is_valid(struct p2m_domain *p2m, pte_t pte)
 {
-    panic("%s: isn't implemented for now\n", __func__);
+    return p2m_type_radix_get(p2m, pte) != p2m_invalid;
+}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
No checking of the valid bit?</pre>
    </blockquote>
    <pre>As mentioned in the comment, only the P2M type should be checked, since the
valid bit is used for other purposes we discussed earlier, for example, to
track whether pages were accessed by a guest domain, or to support certain
table invalidation optimizations (1) and (2).
So, in this case, we only need to consider whether the entry is invalid
from the P2M perspective.

(1) <a class="moz-txt-link-freetext" href="https://github.com/xen-project/xen/blob/19772b67/xen/arch/arm/mmu/p2m.c#L1245">https://github.com/xen-project/xen/blob/19772b67/xen/arch/arm/mmu/p2m.c#L1245</a>
(2) <a class="moz-txt-link-freetext" href="https://github.com/xen-project/xen/blob/19772b67/xen/arch/arm/mmu/p2m.c#L1386">https://github.com/xen-project/xen/blob/19772b67/xen/arch/arm/mmu/p2m.c#L1386</a>

</pre>
    <blockquote type="cite"
      cite="mid:ec05b4c8-c328-4dc3-9f35-207421990893@suse.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -404,11 +426,127 @@ static int p2m_next_level(struct p2m_domain *p2m, bool alloc_tbl,
     return GUEST_TABLE_MAP_NONE;
 }
 
+static void p2m_put_foreign_page(struct page_info *pg)
+{
+    /*
+     * It's safe to do the put_page here because page_alloc will
+     * flush the TLBs if the page is reallocated before the end of
+     * this loop.
+     */
+    put_page(pg);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Is the comment really true? The page allocator will flush the normal
TLBs, but not the stage-2 ones. Yet those are what you care about here,
aiui.</pre>
    </blockquote>
    <pre>In alloc_heap_pages():
 ...
     if ( need_tlbflush )
        filtered_flush_tlb_mask(tlbflush_timestamp);
 ...
 
filtered_flush_tlb_mask() calls arch_flush_tlb_mask().

and arch_flush_tlb_mask(), at least, on Arm (I haven't checked x86) is
implented as:
  void arch_flush_tlb_mask(const cpumask_t *mask)  
  {
      /* No need to IPI other processors on ARM, the processor takes care of it. */
      flush_all_guests_tlb();
  }

So it flushes stage-2 TLB.
</pre>
    <blockquote type="cite"
      cite="mid:ec05b4c8-c328-4dc3-9f35-207421990893@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+/* Put any references on the single 4K page referenced by mfn. */
+static void p2m_put_4k_page(mfn_t mfn, p2m_type_t type)
+{
+    /* TODO: Handle other p2m types */
+
+    /* Detect the xenheap page and mark the stored GFN as invalid. */
+    if ( p2m_is_ram(type) &amp;&amp; is_xen_heap_mfn(mfn) )
+        page_set_xenheap_gfn(mfn_to_page(mfn), INVALID_GFN);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Is this a valid thing to do? How do you make sure the respective uses
(in gnttab's shared and status page arrays) are / were also removed?</pre>
    </blockquote>
    <pre>As grant table frame GFN is stored directly in struct page_info instead
of keeping it in standalone status/shared arrays, thereby there is no need
for status/shared arrays.

</pre>
    <blockquote type="cite"
      cite="mid:ec05b4c8-c328-4dc3-9f35-207421990893@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+}
+
+/* Put any references on the superpage referenced by mfn. */
+static void p2m_put_2m_superpage(mfn_t mfn, p2m_type_t type)
+{
+    struct page_info *pg;
+    unsigned int i;
+
+    ASSERT(mfn_valid(mfn));
+
+    pg = mfn_to_page(mfn);
+
+    for ( i = 0; i &lt; XEN_PT_ENTRIES; i++, pg++ )
+        p2m_put_foreign_page(pg);
+}
+
+/* Put any references on the page referenced by pte. */
+static void p2m_put_page(struct p2m_domain *p2m, const pte_t pte,
+                         unsigned int level)
+{
+    mfn_t mfn = pte_get_mfn(pte);
+    p2m_type_t p2m_type = p2m_type_radix_get(p2m, pte);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This gives you the type of the 1st page. What guarantees that all other pages
in a superpage are of the exact same type?</pre>
    </blockquote>
    <pre>Doesn't superpage mean that all the 4KB pages within that superpage have the
same type and contiguous in memory?

</pre>
    <blockquote type="cite"
      cite="mid:ec05b4c8-c328-4dc3-9f35-207421990893@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    ASSERT(p2me_is_valid(p2m, pte));
+
+    /*
+     * TODO: Currently we don't handle level 2 super-page, Xen is not
+     * preemptible and therefore some work is needed to handle such
+     * superpages, for which at some point Xen might end up freeing memory
+     * and therefore for such a big mapping it could end up in a very long
+     * operation.
+     */
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This is pretty unsatisfactory. Imo, if you don't deal with that right away,
you're setting yourself up for a significant re-write.</pre>
    </blockquote>
    <pre>ARM leaves with that for a long time and it seems like it isn't a big issue for it.
And considering that frametable supports only 4Kb page granularity such big mappings
could lead to long operations during memory freeing.
And 1gb mapping isn't used for 

</pre>
    <blockquote type="cite"
      cite="mid:ec05b4c8-c328-4dc3-9f35-207421990893@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    if ( level == 1 )
+        return p2m_put_2m_superpage(mfn, p2m_type);
+    else if ( level == 0 )
+        return p2m_put_4k_page(mfn, p2m_type);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Use switch() right away?</pre>
    </blockquote>
    <pre>It could be, I think that no big difference at the moment, at least.
But I am okay to rework it.

</pre>
    <blockquote type="cite"
      cite="mid:ec05b4c8-c328-4dc3-9f35-207421990893@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+}
+
+static void p2m_free_page(struct domain *d, struct page_info *pg)
+{
+    if ( is_hardware_domain(d) )
+        free_domheap_page(pg);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Why's the hardware domain different here? It should have a pool just like
all other domains have.</pre>
    </blockquote>
    <pre>Hardware domain (dom0) should be no limit in the number of pages that can
be allocated, so allocate p2m pages for hardware domain is done from heap.

An idea of p2m pool is to provide a way how to put clear limit and amount
to the p2m allocation.

</pre>
    <blockquote type="cite"
      cite="mid:ec05b4c8-c328-4dc3-9f35-207421990893@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    else
+    {
+        spin_lock(&amp;d-&gt;arch.paging.lock);
+        page_list_add_tail(pg, &amp;d-&gt;arch.paging.p2m_freelist);
+        spin_unlock(&amp;d-&gt;arch.paging.lock);
+    }
+}
+
 /* Free pte sub-tree behind an entry */
 static void p2m_free_entry(struct p2m_domain *p2m,
                            pte_t entry, unsigned int level)
 {
-    panic("%s: hasn't been implemented yet\n", __func__);
+    unsigned int i;
+    pte_t *table;
+    mfn_t mfn;
+    struct page_info *pg;
+
+    /* Nothing to do if the entry is invalid. */
+    if ( !p2me_is_valid(p2m, entry) )
+        return;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Does this actually apply to intermediate page tables (which you handle
later in the function), when that's (only) a P2M type check?</pre>
    </blockquote>
    <pre>Yes, any PTE should have V bit set to 1, so from P2M perspective it also
should be, at least, not equal to p2m_invalid.

~ Oleksii</pre>
  </body>
</html>

--------------I9pxgsR01aLJT3O9wkZZVWSL--

