Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B59AB0A69B
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 16:49:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048892.1419088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucmPB-0004wr-DX; Fri, 18 Jul 2025 14:49:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048892.1419088; Fri, 18 Jul 2025 14:49:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucmPB-0004uC-9v; Fri, 18 Jul 2025 14:49:45 +0000
Received: by outflank-mailman (input) for mailman id 1048892;
 Fri, 18 Jul 2025 14:49:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pPPV=Z7=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ucmP9-0004u6-U8
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 14:49:44 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 703827a5-63e6-11f0-a319-13f23c93f187;
 Fri, 18 Jul 2025 16:49:42 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-60c6fea6742so4521061a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 18 Jul 2025 07:49:42 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-612c9071069sm1088926a12.50.2025.07.18.07.49.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 07:49:41 -0700 (PDT)
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
X-Inumbo-ID: 703827a5-63e6-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752850182; x=1753454982; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oqrt8Ksr1s7hav1hvPXkEZxsESYsUraADOYSoGb8YWU=;
        b=DnS7fTr3DVgzpkDVjJzWt1hi25tN2HFCbp9dACEBn+x84ze9BgKQf73l57H/XPiIeZ
         36fTpH/Ab7HXlKnum8hiv71byyTTAjJILFxWEQg8Yj8CmGliQoRILRCglGsvozrVnRv1
         uae67HxaGf/erxsVVEArmK2xyKddi6mnJ7fX64VLyYqIdF64/m8FRJOWF0VPF30cEQqM
         5cLqf3IhoBf84hP+iKKqpYwmRLW0FVi+7CTCYY/NgNPdeZs5xHa6cym6HX/Myo7ezPuu
         hMHFHuRjuaEJ8bcyFOigJc3e5/k+YwEoDZ3AT4CgSN3i5PRggVbWwi8bfGOUyNjCW0MQ
         j9Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752850182; x=1753454982;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oqrt8Ksr1s7hav1hvPXkEZxsESYsUraADOYSoGb8YWU=;
        b=LQhoORxjFxXiYaP/k8L/ntrlfRXXT5EPBoUQrKBulp8wvCYIsDfRpm4E7Grrljgnz5
         3mpeL7r6ULjz2s9FYxpGAxNclxNN01ou2nu4x9iTFCbQuUzjbta6ARoEtFG3q+TB9WIK
         dEKBk5VqjWiyvlimIOxGFZRi44kbt2S8odHP+a5BNkLSkkrBCvz8v1pA11T83edRbUQm
         NuzIDY36+s6M+2MMJnk1EaHj/9A73AEPj1OqzNIWA2thpAOW8+ChACVrLXg/pPBvDg1b
         jBhrXKskOF+cdeJ8jl7gQzbDXh6+L2iUCMpc1VqWhEcGlehVL1SFobq2UhZdB6hwGoAX
         j/Fw==
X-Forwarded-Encrypted: i=1; AJvYcCX6tZZPFwGrTaXgrGFmYretWKQNL7ldAUujJRsFI3gp7TOY3w7V/tTM9Ys9AQTxeL4w9v8lS9IsxVs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyCn1+Zg5c2TL/T8tm63cLHTf+IdBbzJKiI7qdTxzmBYVhjUtX1
	ExXI8m5YbSLGOu4J9zRgqsQTJv7CdE5dCs2sGbunspHE9nE/ECikRnJ8
X-Gm-Gg: ASbGncu20frcPfUqHFACnWpHVwFlrKdtP6QTVHsfjUiyoUt1HnOFLst0/szDnJH2jZJ
	eac3sW7Q+wCvBBGKQhzbje5Dmj3tDWq7tQjIFnwiHenoCUSmk0zICGCJQfeznqj5GbniBDGWq0R
	KkX9UZYpZSaq0aAVybDMOKVEjWdAFMIFkg1tpRODRDQdVOHT/YlDYA2DjPXITcJZ7Sk1Te+Hp7T
	rRqz5fw7NlA+KNCDYQui+ebtnb2VvvxQZr08BQ7GlUV4uVBh79Y604hor1T5ceJS8sWz1uan0Gb
	cGho8oY2DRMafC9b9G9mghico5FFQNq+LFr2ODM7beWQ2RJqnlS/ftz2lkKfUZ6LcV7lbj3URd1
	gJfo4cxq0Id4sxmXv4R8fKn0WgfccVagXfJycZGZbeeRnxHq2mh60gPRD/2QXTGhP4er3Hic=
X-Google-Smtp-Source: AGHT+IEn1/LqeY6eGIErHTZ9BflFpMRRYiJbIgPwZML2+AMdjMoN/cvUVDiEiNVaAUfN7Kq6AO9P+A==
X-Received: by 2002:a05:6402:2115:b0:608:66a3:fec with SMTP id 4fb4d7f45d1cf-612c731f245mr2847989a12.2.1752850181800;
        Fri, 18 Jul 2025 07:49:41 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------m40sj9fEUweVIFqfRUgF2M83"
Message-ID: <133e13bc-39a9-4691-b383-8c62c2775c01@gmail.com>
Date: Fri, 18 Jul 2025 16:49:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/17] xen/riscv: implement mfn_valid() and page
 reference, ownership handling helpers
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <50159d05e75c14ca62ee6cab5a4d30645981827a.1749555949.git.oleksii.kurochko@gmail.com>
 <aa769aa7-739c-4e59-8aea-d07398025b2f@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <aa769aa7-739c-4e59-8aea-d07398025b2f@suse.com>

This is a multi-part message in MIME format.
--------------m40sj9fEUweVIFqfRUgF2M83
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/2/25 12:09 PM, Jan Beulich wrote:
> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>> Implement the mfn_valid() macro to verify whether a given MFN is valid by
>> checking that it falls within the range [start_page, max_page).
>> These bounds are initialized based on the start and end addresses of RAM.
>>
>> As part of this patch, start_page is introduced and initialized with the
>> PFN of the first RAM page.
>>
>> Also, after providing a non-stub implementation of the mfn_valid() macro,
>> the following compilation errors started to occur:
>>    riscv64-linux-gnu-ld: prelink.o: in function `__next_node':
>>    /build/xen/./include/xen/nodemask.h:202: undefined reference to `page_is_ram_type'
>>    riscv64-linux-gnu-ld: prelink.o: in function `get_free_buddy':
>>    /build/xen/common/page_alloc.c:881: undefined reference to `page_is_ram_type'
>>    riscv64-linux-gnu-ld: prelink.o: in function `alloc_heap_pages':
>>    /build/xen/common/page_alloc.c:1043: undefined reference to `page_get_owner_and_reference'
>>    riscv64-linux-gnu-ld: /build/xen/common/page_alloc.c:1098: undefined reference to `page_is_ram_type'
>>    riscv64-linux-gnu-ld: prelink.o: in function `ns16550_interrupt':
>>    /build/xen/drivers/char/ns16550.c:205: undefined reference to `get_page'
>>    riscv64-linux-gnu-ld: ./.xen-syms.0: hidden symbol `page_get_owner_and_reference' isn't defined
>>    riscv64-linux-gnu-ld: final link failed: bad value
>>    make[2]: *** [arch/riscv/Makefile:35: xen-syms] Error 1
>> To resolve these errors, the following functions have also been introduced,
>> based on their Arm counterparts:
>> - page_get_owner_and_reference() and its variant to safely acquire a
>>    reference to a page and retrieve its owner.
>> - put_page() and put_page_nr() to release page references and free the page
>>    when the count drops to zero.
>>    For put_page_nr(), code related to static memory configuration is wrapped
>>    with CONFIG_STATIC_MEMORY, as this configuration has not yet been moved to
>>    common code. Therefore, PGC_static and free_domstatic_page() are not
>>    introduced for RISC-V. However, since this configuration could be useful
>>    in the future, the relevant code is retained and conditionally compiled.
>> - A stub for page_is_ram_type() that currently always returns 0 and asserts
>>    unreachable, as RAM type checking is not yet implemented.
> How does this end up working when common code references the function?

Based on the following commit message:
     Callers are VT-d (so x86 specific) and various bits of page offlining
     support, which although it looks generic (and is in xen/common) does
     things like diving into page_info->count_info which is not generic.
     
     In any case on this is only reachable via XEN_SYSCTL_page_offline_op,
     which clearly shouldn't be called on ARM just yet.

There is no callers for page_is_ram_type() for Arm now, and I expect something similar
for RISC-V. As we don't even introduce hypercalls for RISC-V, we can just live
without it.

>
>> @@ -288,8 +289,12 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
>>   #define page_get_owner(p)    (p)->v.inuse.domain
>>   #define page_set_owner(p, d) ((p)->v.inuse.domain = (d))
>>   
>> -/* TODO: implement */
>> -#define mfn_valid(mfn) ({ (void)(mfn); 0; })
>> +extern unsigned long start_page;
>> +
>> +#define mfn_valid(mfn) ({                                   \
>> +    unsigned long mfn__ = mfn_x(mfn);                       \
>> +    likely((mfn__ >= start_page) && (mfn__ < max_page));    \
>> +})
> I don't think you should try to be clever and avoid using __mfn_valid() here,
> at least not without an easily identifiable TODO. Surely you've seen that both
> Arm and x86 use it.

Overlooked that pdx.c is compiled unconditionally, so I thought that __mfn_valid() common
implementation isn't avaiable as, at the moment, RISC-V doesn't support PDX_COMPRESSION...

> Also, according to all I know, likely() doesn't work very well when used like
> this, except for architectures supporting conditionally executed insns (like
> Arm32 or IA-64, i.e. beyond conditional branches). I.e. if you want to use
> likely() here, I think you need two of them.

... I will update mfn_valid() definition according to your recommendations.

>
>> @@ -525,6 +520,8 @@ static void __init setup_directmap_mappings(unsigned long base_mfn,
>>   #error setup_{directmap,frametable}_mapping() should be implemented for RV_32
>>   #endif
>>   
>> +unsigned long __read_mostly start_page;
> Memory hotplug question again: __read_mostly or __ro_after_init?
>
>> @@ -613,3 +612,91 @@ void __iomem *ioremap(paddr_t pa, size_t len)
>>   {
>>       return ioremap_attr(pa, len, PAGE_HYPERVISOR_NOCACHE);
>>   }
>> +
>> +int page_is_ram_type(unsigned long mfn, unsigned long mem_type)
>> +{
>> +    ASSERT_UNREACHABLE();
>> +
>> +    return 0;
>> +}
>> +
>> +static struct domain *page_get_owner_and_nr_reference(struct page_info *page,
>> +                                                      unsigned long nr)
>> +{
>> +    unsigned long x, y = page->count_info;
>> +    struct domain *owner;
>> +
>> +    /* Restrict nr to avoid "double" overflow */
>> +    if ( nr >= PGC_count_mask )
>> +    {
>> +        ASSERT_UNREACHABLE();
>> +        return NULL;
>> +    }
> I question the validity of this, already in the Arm original: I can't spot
> how the caller guarantees to stay below that limit. Without such an
> (attempted) guarantee, ASSERT_UNREACHABLE() is wrong to use. All I can see
> is process_shm_node() incrementing shmem_extra[].nr_shm_borrowers, without
> any limit check.

Agree, it could be really dropped.

>
>> +    do {
>> +        x = y;
>> +        /*
>> +         * Count ==  0: Page is not allocated, so we cannot take a reference.
>> +         * Count == -1: Reference count would wrap, which is invalid.
>> +         */
> May I once again ask that you look carefully at comments (as much as at code)
> you copy. Clearly this comment wasn't properly updated when the bumping by 1
> was changed to bumping by nr.
>
>> +        if ( unlikely(((x + nr) & PGC_count_mask) <= nr) )
>> +            return NULL;
>> +    }
>> +    while ( (y = cmpxchg(&page->count_info, x, x + nr)) != x );
>> +
>> +    owner = page_get_owner(page);
>> +    ASSERT(owner);
>> +
>> +    return owner;
>> +}
>> +
>> +struct domain *page_get_owner_and_reference(struct page_info *page)
>> +{
>> +    return page_get_owner_and_nr_reference(page, 1);
>> +}
>> +
>> +void put_page_nr(struct page_info *page, unsigned long nr)
>> +{
>> +    unsigned long nx, x, y = page->count_info;
>> +
>> +    do {
>> +        ASSERT((y & PGC_count_mask) >= nr);
>> +        x  = y;
>> +        nx = x - nr;
>> +    }
>> +    while ( unlikely((y = cmpxchg(&page->count_info, x, nx)) != x) );
>> +
>> +    if ( unlikely((nx & PGC_count_mask) == 0) )
>> +    {
>> +#ifdef CONFIG_STATIC_MEMORY
>> +        if ( unlikely(nx & PGC_static) )
>> +            free_domstatic_page(page);
>> +        else
>> +#endif
> Such #ifdef-ed-out code is liable to go stale. Minimally use IS_ENABLED().
> Even better would imo be if you introduced a "stub" PGC_static, resolving
> to 0 (i.e. for now unconditionally).

An introduction of PGC_static would be better.

Thanks.

~ Oleksii

--------------m40sj9fEUweVIFqfRUgF2M83
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
    <div class="moz-cite-prefix">On 7/2/25 12:09 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:aa769aa7-739c-4e59-8aea-d07398025b2f@suse.com">
      <pre wrap="" class="moz-quote-pre">On 10.06.2025 15:05, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Implement the mfn_valid() macro to verify whether a given MFN is valid by
checking that it falls within the range [start_page, max_page).
These bounds are initialized based on the start and end addresses of RAM.

As part of this patch, start_page is introduced and initialized with the
PFN of the first RAM page.

Also, after providing a non-stub implementation of the mfn_valid() macro,
the following compilation errors started to occur:
  riscv64-linux-gnu-ld: prelink.o: in function `__next_node':
  /build/xen/./include/xen/nodemask.h:202: undefined reference to `page_is_ram_type'
  riscv64-linux-gnu-ld: prelink.o: in function `get_free_buddy':
  /build/xen/common/page_alloc.c:881: undefined reference to `page_is_ram_type'
  riscv64-linux-gnu-ld: prelink.o: in function `alloc_heap_pages':
  /build/xen/common/page_alloc.c:1043: undefined reference to `page_get_owner_and_reference'
  riscv64-linux-gnu-ld: /build/xen/common/page_alloc.c:1098: undefined reference to `page_is_ram_type'
  riscv64-linux-gnu-ld: prelink.o: in function `ns16550_interrupt':
  /build/xen/drivers/char/ns16550.c:205: undefined reference to `get_page'
  riscv64-linux-gnu-ld: ./.xen-syms.0: hidden symbol `page_get_owner_and_reference' isn't defined
  riscv64-linux-gnu-ld: final link failed: bad value
  make[2]: *** [arch/riscv/Makefile:35: xen-syms] Error 1
To resolve these errors, the following functions have also been introduced,
based on their Arm counterparts:
- page_get_owner_and_reference() and its variant to safely acquire a
  reference to a page and retrieve its owner.
- put_page() and put_page_nr() to release page references and free the page
  when the count drops to zero.
  For put_page_nr(), code related to static memory configuration is wrapped
  with CONFIG_STATIC_MEMORY, as this configuration has not yet been moved to
  common code. Therefore, PGC_static and free_domstatic_page() are not
  introduced for RISC-V. However, since this configuration could be useful
  in the future, the relevant code is retained and conditionally compiled.
- A stub for page_is_ram_type() that currently always returns 0 and asserts
  unreachable, as RAM type checking is not yet implemented.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
How does this end up working when common code references the function?</pre>
    </blockquote>
    <pre>Based on the following commit message:
    Callers are VT-d (so x86 specific) and various bits of page offlining
    support, which although it looks generic (and is in xen/common) does
    things like diving into page_info-&gt;count_info which is not generic.
    
    In any case on this is only reachable via XEN_SYSCTL_page_offline_op,
    which clearly shouldn't be called on ARM just yet.

There is no callers for page_is_ram_type() for Arm now, and I expect something similar
for RISC-V. As we don't even introduce hypercalls for RISC-V, we can just live
without it.

</pre>
    <blockquote type="cite"
      cite="mid:aa769aa7-739c-4e59-8aea-d07398025b2f@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -288,8 +289,12 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
 #define page_get_owner(p)    (p)-&gt;v.inuse.domain
 #define page_set_owner(p, d) ((p)-&gt;v.inuse.domain = (d))
 
-/* TODO: implement */
-#define mfn_valid(mfn) ({ (void)(mfn); 0; })
+extern unsigned long start_page;
+
+#define mfn_valid(mfn) ({                                   \
+    unsigned long mfn__ = mfn_x(mfn);                       \
+    likely((mfn__ &gt;= start_page) &amp;&amp; (mfn__ &lt; max_page));    \
+})
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I don't think you should try to be clever and avoid using __mfn_valid() here,
at least not without an easily identifiable TODO. Surely you've seen that both
Arm and x86 use it.
</pre>
    </blockquote>
    <pre>Overlooked that pdx.c is compiled unconditionally, so I thought that __mfn_valid() common
implementation isn't avaiable as, at the moment, RISC-V doesn't support PDX_COMPRESSION...

</pre>
    <blockquote type="cite"
      cite="mid:aa769aa7-739c-4e59-8aea-d07398025b2f@suse.com">
      <pre wrap="" class="moz-quote-pre">
Also, according to all I know, likely() doesn't work very well when used like
this, except for architectures supporting conditionally executed insns (like
Arm32 or IA-64, i.e. beyond conditional branches). I.e. if you want to use
likely() here, I think you need two of them.</pre>
    </blockquote>
    <pre>... I will update mfn_valid() definition according to your recommendations.

</pre>
    <blockquote type="cite"
      cite="mid:aa769aa7-739c-4e59-8aea-d07398025b2f@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -525,6 +520,8 @@ static void __init setup_directmap_mappings(unsigned long base_mfn,
 #error setup_{directmap,frametable}_mapping() should be implemented for RV_32
 #endif
 
+unsigned long __read_mostly start_page;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Memory hotplug question again: __read_mostly or __ro_after_init?

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -613,3 +612,91 @@ void __iomem *ioremap(paddr_t pa, size_t len)
 {
     return ioremap_attr(pa, len, PAGE_HYPERVISOR_NOCACHE);
 }
+
+int page_is_ram_type(unsigned long mfn, unsigned long mem_type)
+{
+    ASSERT_UNREACHABLE();
+
+    return 0;
+}
+
+static struct domain *page_get_owner_and_nr_reference(struct page_info *page,
+                                                      unsigned long nr)
+{
+    unsigned long x, y = page-&gt;count_info;
+    struct domain *owner;
+
+    /* Restrict nr to avoid "double" overflow */
+    if ( nr &gt;= PGC_count_mask )
+    {
+        ASSERT_UNREACHABLE();
+        return NULL;
+    }
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I question the validity of this, already in the Arm original: I can't spot
how the caller guarantees to stay below that limit. Without such an
(attempted) guarantee, ASSERT_UNREACHABLE() is wrong to use. All I can see
is process_shm_node() incrementing shmem_extra[].nr_shm_borrowers, without
any limit check.</pre>
    </blockquote>
    <pre>Agree, it could be really dropped.

</pre>
    <blockquote type="cite"
      cite="mid:aa769aa7-739c-4e59-8aea-d07398025b2f@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    do {
+        x = y;
+        /*
+         * Count ==  0: Page is not allocated, so we cannot take a reference.
+         * Count == -1: Reference count would wrap, which is invalid.
+         */
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
May I once again ask that you look carefully at comments (as much as at code)
you copy. Clearly this comment wasn't properly updated when the bumping by 1
was changed to bumping by nr.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        if ( unlikely(((x + nr) &amp; PGC_count_mask) &lt;= nr) )
+            return NULL;
+    }
+    while ( (y = cmpxchg(&amp;page-&gt;count_info, x, x + nr)) != x );
+
+    owner = page_get_owner(page);
+    ASSERT(owner);
+
+    return owner;
+}
+
+struct domain *page_get_owner_and_reference(struct page_info *page)
+{
+    return page_get_owner_and_nr_reference(page, 1);
+}
+
+void put_page_nr(struct page_info *page, unsigned long nr)
+{
+    unsigned long nx, x, y = page-&gt;count_info;
+
+    do {
+        ASSERT((y &amp; PGC_count_mask) &gt;= nr);
+        x  = y;
+        nx = x - nr;
+    }
+    while ( unlikely((y = cmpxchg(&amp;page-&gt;count_info, x, nx)) != x) );
+
+    if ( unlikely((nx &amp; PGC_count_mask) == 0) )
+    {
+#ifdef CONFIG_STATIC_MEMORY
+        if ( unlikely(nx &amp; PGC_static) )
+            free_domstatic_page(page);
+        else
+#endif
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Such #ifdef-ed-out code is liable to go stale. Minimally use IS_ENABLED().
Even better would imo be if you introduced a "stub" PGC_static, resolving
to 0 (i.e. for now unconditionally).</pre>
    </blockquote>
    <pre>An introduction of PGC_static would be better.

Thanks.</pre>
    <pre>~ Oleksii
</pre>
  </body>
</html>

--------------m40sj9fEUweVIFqfRUgF2M83--

