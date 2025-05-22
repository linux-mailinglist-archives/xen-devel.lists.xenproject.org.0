Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBAEAC1059
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 17:53:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.994339.1377381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI8Ed-000383-8T; Thu, 22 May 2025 15:53:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 994339.1377381; Thu, 22 May 2025 15:53:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI8Ed-00035i-3m; Thu, 22 May 2025 15:53:31 +0000
Received: by outflank-mailman (input) for mailman id 994339;
 Thu, 22 May 2025 15:53:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fIul=YG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uI8Eb-00035V-Iy
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 15:53:29 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e71268c5-3724-11f0-a2fb-13f23c93f187;
 Thu, 22 May 2025 17:53:28 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5f3f04b5dbcso12371956a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 08:53:28 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d490789sm1100706166b.130.2025.05.22.08.53.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 May 2025 08:53:27 -0700 (PDT)
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
X-Inumbo-ID: e71268c5-3724-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747929208; x=1748534008; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5T+4F+BevpbyJhSD1mtoloF5rTRkKw3a00s5qodp4XQ=;
        b=e1YYaZqg1y0ec+DYmQgCjORPesENJ94Hy3y7gIUh7tiuyq9JaZoc2RwIB9P7lDuGeW
         Xn4nYvGiTuUbsr4hna2g6Otgo1Ecwf0wNuW0uFiSquJRYlTZDvaj49wtRz0Oj8B/ZI7z
         qOIDK5dwHxFK3/+KkJPDrH3r+PBDfgIxvsXjzUpTXkR9es/F1VGYu1u2mlro5S+7VTRD
         WmTBkT2eiTCdwhWyaLN/RtI4R+swotd5iWuholKc1DyD16MmjLyVygz9qh0iehZpm9b6
         Qfq+yf3A0yqzCW/+XtzYQ8Avyt+dYQmlGxxLVUBURNBXLRkSBM5seJ3bj7685AtirLm6
         OCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747929208; x=1748534008;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5T+4F+BevpbyJhSD1mtoloF5rTRkKw3a00s5qodp4XQ=;
        b=ftffQs8J0tvZxcdR1RDtowP5cAGUkTPJWhA8TTfZnLq7HwdU68IPtBi3+ttAO0RXoW
         J+d1zJlzCPysQ5lsmIQ7HGhqei9IFonWjWhrULUtd0wud4T1wB7CaOtIhvh4Km4/5Lbv
         AlqYeNHWBiKmRNE3TWwqFsCqcxXvU12MYAZMBtFHsCR9Xu2iE+VGGnanI8hrScIq1Yyp
         72ETpe57pbUoKOYxhjgmqUCxPwSL5Ue9YbbsOic5PtoiOlVplk6j6NnjqRpZvWbWOfLx
         vU3ZZpwi2jac2n8kvNAw0GWvtG5nuqfCXThL07FTEXjFJdVc65PXQp6TgkatsOTrFNKT
         hcmA==
X-Forwarded-Encrypted: i=1; AJvYcCWis5VDab0oXQU2ydSB6/4lEn1dvDZSO7G068FgEV0VFRscetrslVrdKFDivVWox/N3Xmj4gEoTNc4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyJErpVHdKKv6nmDJ3KtjLct/CtEi+Jx4dsgZKo3fd9XuFwuB0W
	lGKWAkAd9GP9XZEf2z5oPRiVnAcE0bXlBwrzffYBzdgR+MU+WqQHwS0om6hR0A==
X-Gm-Gg: ASbGnctwhR6mdjF+D3DcvYJS85XJP+9avsCwBf7wNZfSlIzOMNz7U7BjNVTG+NVH4a6
	b9yYPoaBZyQ1PL5nCgE2hAKmfKBrFtxg3HGpVfQcm+B811g5nRpNoxl1JvHvd1ANZyLgLPyrCuE
	spBpBKs/MLJCKwq9fop/5N6QbZHRRNRWm300MvefF97l8ODM6KFqM0izJpd981mH9SjsfMIk/nx
	tojDsaA0Goqqchfworh2woTMTR0A6LDNxW+TzzkxPAs5BCQgHJoGG8FDfsyoquCiiyFQEqdnK1r
	dqK/H+KKVaZNgVtJPC8l0TFRV4ODFixQaj7Olq6xHjQRQoXcEt+5pMdg69gsEuMPVXvYN7nEYc7
	QG1nOBOdcBdhrp3RNWBhFxkjc
X-Google-Smtp-Source: AGHT+IEzLqx0c2jzSPB3oPprrg/78sOFFSOnsIbNJSEekqqr6YSuKCIBx0eVnPV3oImdCGAryd4WUg==
X-Received: by 2002:a17:907:c29:b0:ad5:4923:a024 with SMTP id a640c23a62f3a-ad54923a173mr2198525566b.16.1747929207286;
        Thu, 22 May 2025 08:53:27 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------nN0PHet1fX3NuT67iu0u457E"
Message-ID: <1a0d3084-9e77-4df5-936a-c1a1317c0f18@gmail.com>
Date: Thu, 22 May 2025 17:53:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/6] xen/riscv: introduce things necessary for p2m
 initialization
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1746805907.git.oleksii.kurochko@gmail.com>
 <0a03d1f38649cfd8656147f209652dff0f9d170c.1746805907.git.oleksii.kurochko@gmail.com>
 <7ef3ca26-05f5-4e86-b7c7-852b6c74a3d0@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <7ef3ca26-05f5-4e86-b7c7-852b6c74a3d0@suse.com>

This is a multi-part message in MIME format.
--------------nN0PHet1fX3NuT67iu0u457E
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/20/25 3:37 PM, Jan Beulich wrote:
> On 09.05.2025 17:57, Oleksii Kurochko wrote:
>> --- /dev/null
>> +++ b/xen/arch/riscv/p2m.c
>> +static void clear_and_clean_page(struct page_info *page)
>> +{
>> +    void *p = __map_domain_page(page);
>> +
>> +    clear_page(p);
>> +    unmap_domain_page(p);
>> +}
> What's the "clean" about in the function name? The "clear" is referring
> to the clear_page() call afaict.

Missed to add clean_dcache_va_range() between clear_page() and unmap_domain_page().

> Also aren't you largely open-coding
> clear_domain_page() here?

Yes, missed that it is almost the sane as clear_domain_page(), so we could re-write
this function as:
   static void clear_and_clean_page(struct page_info *page)
   {
       clean_dcache_va_range(page, PAGE_SIZE);
       clear_domain_page(page_to_mfn(page));
   }

>> +static struct page_info *p2m_get_clean_page(struct domain *d)
>> +{
>> +    struct page_info *page;
>> +
>> +    /*
>> +     * As mentioned in the Priviliged Architecture Spec (version 20240411)
>> +     * As explained in Section 18.5.1, for the paged virtual-memory schemes
>> +     * (Sv32x4, Sv39x4, Sv48x4, and Sv57x4), the root page table is 16 KiB
>> +     * and must be aligned to a 16-KiB boundary.
>> +     */
>> +    page = alloc_domheap_pages(NULL, 2, 0);
> Shouldn't this allocation come from the domain's P2M pool (which is yet
> to be introduced)?

First, I will drop p2m_get_clean_page() as it will be used only for p2m root page
table allocation.

p2m_init() is called by domain_create() [->arch_domain_create()->p2m_init()] from create_domUs():
[https://gitlab.com/xen-project/xen/-/blob/staging/xen/common/device-tree/dom0less-build.c?ref_type=heads#L984].

When p2m_init() is called, p2m pool isn't ready and domain isn't created yet. Last one
is also crucial for usage of p2m pool as p2m pool belongs to domain and thereby it is
using alloc_domheap_page(d, ...) (Not NULL as for allocation of p2m root table above),
so domain should be created first.

And only after domain_create() will created domain, p2m pool could be initialized during
domain construction:
   https://gitlab.com/xen-project/xen/-/blob/staging/xen/common/device-tree/dom0less-build.c?ref_type=heads#L756
and the size of p2m pool depends on the value from memory property of domain node in DT.
(line 748, the link the same as above).

Also, if CONFIG_ARCH_PAGING_MEMPOOL=n, then p2m pool isn't used. But it isn't a case for RISC-V
for the moment. Probably one day it would be useful if someone wanted to add support for MMU-less
case. Something like Arm is doing now for R-cores.

> Also hard-coding 2 here as order effectively builds
> in an assumption that PAGE_SIZE will only ever be 4k. I think to wants
> properly calculating instead.

I haven't thought about that. I will update it with:
   page = alloc_domheap_pages(NULL, get_order_from_bytes(KB(16)), 0);

>
>> +    if ( page == NULL )
>> +        return NULL;
>> +
>> +    clear_and_clean_page(page);
>> +
>> +    return page;
>> +}
> Contrary to the function name you obtained 4 pages here, which is suitable
> for ...
>
>> +static struct page_info *p2m_allocate_root(struct domain *d)
>> +{
>> +    return p2m_get_clean_page(d);
>> +}
> ... this but - I expect - no anywhere else.

Totally agree, as mentioned above this function is used only for p2m_allocate_root().
I will just open-code it in p2m_allocate_root().

>> +{
>> +    unsigned long ppn;
>> +    unsigned long hgatp_mode;
>> +
>> +    ppn = PFN_DOWN(page_to_maddr(page_info)) & HGATP_PPN;
>> +
>> +    /* ASID (VMID) not supported yet */
>> +
>> +#if RV_STAGE1_MODE == SATP_MODE_SV39
>> +    hgatp_mode = HGATP_MODE_SV39X4;
>> +#elif RV_STAGE1_MODE == SATP_MODE_SV48
>> +    hgatp_mode = HGATP_MODE_SV48X4;
>> +#else
>> +    #error "add HGATP_MODE"
> As before, please have the # of pre-processor directives in the first column.
>
>> +#endif
>> +
>> +    return ppn | (hgatp_mode << HGATP_MODE_SHIFT);
> Use MASK_INSR()?

Do you mean MASK_INSR(hgatp_mode, HGATP_MODE_MASK)?
If yes, then I didn't get what is the point then?

>
>> +}
>> +
>> +static int p2m_alloc_table(struct domain *d)
>> +{
>> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
>> +
>> +    p2m->root = p2m_allocate_root(d);
>> +    if ( !p2m->root )
>> +        return -ENOMEM;
>> +
>> +    p2m->hgatp = hgatp_from_page_info(p2m->root);
>> +
>> +    /*
>> +     * Make sure that all TLBs corresponding to the new VMID are flushed
>> +     * before using it.
>> +     */
>> +    p2m_write_lock(p2m);
>> +    p2m_force_tlb_flush_sync(p2m);
>> +    p2m_write_unlock(p2m);
> While Andrew directed you towards a better model in general, it won't be
> usable here then, as the guest didn't run on any pCPU(s) yet. Imo you
> want to do a single global flush e.g. when VMIDs wrap around. That'll be
> fewer global flushes than one per VM creation.

I am not sure that I get a phrase 'VMIDs wrap around'.

I am going to implement, p2m_force_tlb_flush_sync() as:
  static void p2m_force_tlb_flush_sync(struct p2m_domain *p2m)
  {
    ...
      sbi_remote_hfence_gvma(d->dirty_cpumask, 0, 0);
    ...
  }

With such implementation if the guest didn't run on any pCPU(s) yet
then d->dirty_cpumask is empty, then sbi_remote_hfence_gvma() will do nothing
as hmask will be NULL (https://gitlab.com/xen-project/people/olkur/xen/-/blob/staging/xen/arch/riscv/sbi.c?ref_type=heads#L238).
I am not sure that it is a good idea as I can't find a guarantee in the spec
that TLB will be empty during boot time.

But if another VM is being created then we should flush stage2 before run a VM
so, the new VM won't re-use something from the old VM.
Or in case of VMID if VMID is reused by new VM in case if, for example, the
previous owner(domain) was destroyed and a new domain is reusing VMID, it is
needed to flush stage2.

p2m_alloc_table() looks a good place for that and I am not sure that we can
do a single global flush, and I don't really know in first glance where it
should be done.


>> +    p2m->default_access = p2m_access_rwx;
>> +
>> +    radix_tree_init(&p2m->p2m_type);
>> +
>> +#ifdef CONFIG_HAS_PASSTHROUGH
>> +    /*
>> +     * Some IOMMUs don't support coherent PT walk. When the p2m is
>> +     * shared with the CPU, Xen has to make sure that the PT changes have
>> +     * reached the memory
>> +     */
>> +    p2m->clean_pte = is_iommu_enabled(d) &&
>> +        !iommu_has_feature(d, IOMMU_FEAT_COHERENT_WALK);
>> +#else
>> +    p2m->clean_pte = true;
> When there's no IOMMU (in use), doesn't this want to be "false"?

I think you are right, "false" is more correct here.

>
>> +#endif
>> +
>> +    /*
>> +     * "Trivial" initialisation is now complete.  Set the backpointer so
>> +     * p2m_teardown() and friends know to do something.
>> +     */
>> +    p2m->domain = d;
> And where is that p2m_teardown(), to cross-check the comment against?

It is not introduced now as I expected it is need only when domain is needed to
be stop for some reason. And it isn't really needed now.

Anyway, it seems like it is a stale comment as on other arch-es p2m_teardown() has
an argument with struct domain *d.

I can update the commit to:
  "Trivial" initialisation is now complete.  Set the backpointer so the users of p2m
   could get an access to domain structure.

~ Oleksii

--------------nN0PHet1fX3NuT67iu0u457E
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
    <div class="moz-cite-prefix">On 5/20/25 3:37 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:7ef3ca26-05f5-4e86-b7c7-852b6c74a3d0@suse.com">
      <pre wrap="" class="moz-quote-pre">On 09.05.2025 17:57, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- /dev/null
+++ b/xen/arch/riscv/p2m.c
+static void clear_and_clean_page(struct page_info *page)
+{
+    void *p = __map_domain_page(page);
+
+    clear_page(p);
+    unmap_domain_page(p);
+}
</pre>
      </blockquote>
    </blockquote>
    <blockquote type="cite"
      cite="mid:7ef3ca26-05f5-4e86-b7c7-852b6c74a3d0@suse.com">
      <pre wrap="" class="moz-quote-pre">
What's the "clean" about in the function name? The "clear" is referring
to the clear_page() call afaict.</pre>
    </blockquote>
    <pre>Missed to add clean_dcache_va_range() between clear_page() and unmap_domain_page().
</pre>
    <blockquote type="cite"
      cite="mid:7ef3ca26-05f5-4e86-b7c7-852b6c74a3d0@suse.com">
      <pre wrap="" class="moz-quote-pre">Also aren't you largely open-coding
clear_domain_page() here?</pre>
    </blockquote>
    <pre>Yes, missed that it is almost the sane as clear_domain_page(), so we could re-write
this function as:
  static void clear_and_clean_page(struct page_info *page)
  {
      clean_dcache_va_range(page, PAGE_SIZE);
      clear_domain_page(page_to_mfn(page));
  }

</pre>
    <blockquote type="cite"
      cite="mid:7ef3ca26-05f5-4e86-b7c7-852b6c74a3d0@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+static struct page_info *p2m_get_clean_page(struct domain *d)
+{
+    struct page_info *page;
+
+    /*
+     * As mentioned in the Priviliged Architecture Spec (version 20240411)
+     * As explained in Section 18.5.1, for the paged virtual-memory schemes
+     * (Sv32x4, Sv39x4, Sv48x4, and Sv57x4), the root page table is 16 KiB
+     * and must be aligned to a 16-KiB boundary.
+     */
+    page = alloc_domheap_pages(NULL, 2, 0);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Shouldn't this allocation come from the domain's P2M pool (which is yet
to be introduced)? </pre>
    </blockquote>
    <pre>First, I will drop p2m_get_clean_page() as it will be used only for p2m root page
table allocation.

p2m_init() is called by domain_create() [-&gt;arch_domain_create()-&gt;p2m_init()] from create_domUs():
[<a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/xen/-/blob/staging/xen/common/device-tree/dom0less-build.c?ref_type=heads#L984">https://gitlab.com/xen-project/xen/-/blob/staging/xen/common/device-tree/dom0less-build.c?ref_type=heads#L984</a>].

When p2m_init() is called, p2m pool isn't ready and domain isn't created yet. Last one
is also crucial for usage of p2m pool as p2m pool belongs to domain and thereby it is
using alloc_domheap_page(d, ...) (Not NULL as for allocation of p2m root table above),
so domain should be created first.

And only after domain_create() will created domain, p2m pool could be initialized during
domain construction:
  <a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/xen/-/blob/staging/xen/common/device-tree/dom0less-build.c?ref_type=heads#L756">https://gitlab.com/xen-project/xen/-/blob/staging/xen/common/device-tree/dom0less-build.c?ref_type=heads#L756</a>
and the size of p2m pool depends on the value from memory property of domain node in DT.
(line 748, the link the same as above).

Also, if CONFIG_ARCH_PAGING_MEMPOOL=n, then p2m pool isn't used. But it isn't a case for RISC-V
for the moment. Probably one day it would be useful if someone wanted to add support for MMU-less
case. Something like Arm is doing now for R-cores.

</pre>
    <blockquote type="cite"
      cite="mid:7ef3ca26-05f5-4e86-b7c7-852b6c74a3d0@suse.com">
      <pre wrap="" class="moz-quote-pre">Also hard-coding 2 here as order effectively builds
in an assumption that PAGE_SIZE will only ever be 4k. I think to wants
properly calculating instead.</pre>
    </blockquote>
    <pre>I haven't thought about that. I will update it with:
  page = alloc_domheap_pages(NULL, get_order_from_bytes(KB(16)), 0);

</pre>
    <blockquote type="cite"
      cite="mid:7ef3ca26-05f5-4e86-b7c7-852b6c74a3d0@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    if ( page == NULL )
+        return NULL;
+
+    clear_and_clean_page(page);
+
+    return page;
+}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Contrary to the function name you obtained 4 pages here, which is suitable
for ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+static struct page_info *p2m_allocate_root(struct domain *d)
+{
+    return p2m_get_clean_page(d);
+}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... this but - I expect - no anywhere else.</pre>
    </blockquote>
    <pre>Totally agree, as mentioned above this function is used only for p2m_allocate_root().
I will just open-code it in p2m_allocate_root().</pre>
    <blockquote type="cite"
      cite="mid:7ef3ca26-05f5-4e86-b7c7-852b6c74a3d0@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+{
+    unsigned long ppn;
+    unsigned long hgatp_mode;
+
+    ppn = PFN_DOWN(page_to_maddr(page_info)) &amp; HGATP_PPN;
+
+    /* ASID (VMID) not supported yet */
+
+#if RV_STAGE1_MODE == SATP_MODE_SV39
+    hgatp_mode = HGATP_MODE_SV39X4;
+#elif RV_STAGE1_MODE == SATP_MODE_SV48
+    hgatp_mode = HGATP_MODE_SV48X4;
+#else
+    #error "add HGATP_MODE"
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
As before, please have the # of pre-processor directives in the first column.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+#endif
+
+    return ppn | (hgatp_mode &lt;&lt; HGATP_MODE_SHIFT);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Use MASK_INSR()?</pre>
    </blockquote>
    <pre>Do you mean MASK_INSR(hgatp_mode, HGATP_MODE_MASK)?
If yes, then I didn't get what is the point then?

</pre>
    <blockquote type="cite"
      cite="mid:7ef3ca26-05f5-4e86-b7c7-852b6c74a3d0@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+}
+
+static int p2m_alloc_table(struct domain *d)
+{
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+
+    p2m-&gt;root = p2m_allocate_root(d);
+    if ( !p2m-&gt;root )
+        return -ENOMEM;
+
+    p2m-&gt;hgatp = hgatp_from_page_info(p2m-&gt;root);
+
+    /*
+     * Make sure that all TLBs corresponding to the new VMID are flushed
+     * before using it.
+     */
+    p2m_write_lock(p2m);
+    p2m_force_tlb_flush_sync(p2m);
+    p2m_write_unlock(p2m);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
While Andrew directed you towards a better model in general, it won't be
usable here then, as the guest didn't run on any pCPU(s) yet. Imo you
want to do a single global flush e.g. when VMIDs wrap around. That'll be
fewer global flushes than one per VM creation.</pre>
    </blockquote>
    <pre>I am not sure that I get a phrase 'VMIDs wrap around'.

I am going to implement, p2m_force_tlb_flush_sync() as:
 static void p2m_force_tlb_flush_sync(struct p2m_domain *p2m)
 {
   ...
     sbi_remote_hfence_gvma(d-&gt;dirty_cpumask, 0, 0);
   ...
 }

With such implementation if the guest didn't run on any pCPU(s) yet
then d-&gt;dirty_cpumask is empty, then sbi_remote_hfence_gvma() will do nothing
as hmask will be NULL (<a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/people/olkur/xen/-/blob/staging/xen/arch/riscv/sbi.c?ref_type=heads#L238">https://gitlab.com/xen-project/people/olkur/xen/-/blob/staging/xen/arch/riscv/sbi.c?ref_type=heads#L238</a>).
I am not sure that it is a good idea as I can't find a guarantee in the spec
that TLB will be empty during boot time.

But if another VM is being created then we should flush stage2 before run a VM
so, the new VM won't re-use something from the old VM.
Or in case of VMID if VMID is reused by new VM in case if, for example, the
previous owner(domain) was destroyed and a new domain is reusing VMID, it is
needed to flush stage2.

p2m_alloc_table() looks a good place for that and I am not sure that we can
do a single global flush, and I don't really know in first glance where it
should be done.


</pre>
    <blockquote type="cite"
      cite="mid:7ef3ca26-05f5-4e86-b7c7-852b6c74a3d0@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    p2m-&gt;default_access = p2m_access_rwx;
+
+    radix_tree_init(&amp;p2m-&gt;p2m_type);
+
+#ifdef CONFIG_HAS_PASSTHROUGH
+    /*
+     * Some IOMMUs don't support coherent PT walk. When the p2m is
+     * shared with the CPU, Xen has to make sure that the PT changes have
+     * reached the memory
+     */
+    p2m-&gt;clean_pte = is_iommu_enabled(d) &amp;&amp;
+        !iommu_has_feature(d, IOMMU_FEAT_COHERENT_WALK);
+#else
+    p2m-&gt;clean_pte = true;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
When there's no IOMMU (in use), doesn't this want to be "false"?</pre>
    </blockquote>
    <pre>I think you are right, "false" is more correct here.

</pre>
    <blockquote type="cite"
      cite="mid:7ef3ca26-05f5-4e86-b7c7-852b6c74a3d0@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+#endif
+
+    /*
+     * "Trivial" initialisation is now complete.  Set the backpointer so
+     * p2m_teardown() and friends know to do something.
+     */
+    p2m-&gt;domain = d;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
And where is that p2m_teardown(), to cross-check the comment against?</pre>
    </blockquote>
    <pre>It is not introduced now as I expected it is need only when domain is needed to
be stop for some reason. And it isn't really needed now.

Anyway, it seems like it is a stale comment as on other arch-es p2m_teardown() has
an argument with struct domain *d.

I can update the commit to:
 "Trivial" initialisation is now complete.  Set the backpointer so the users of p2m
  could get an access to domain structure.

~ Oleksii</pre>
  </body>
</html>

--------------nN0PHet1fX3NuT67iu0u457E--

