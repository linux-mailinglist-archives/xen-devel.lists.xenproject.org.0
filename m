Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3C4AE98A2
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 10:40:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1026031.1401317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUi9Q-0005hd-8C; Thu, 26 Jun 2025 08:40:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1026031.1401317; Thu, 26 Jun 2025 08:40:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUi9Q-0005gE-4u; Thu, 26 Jun 2025 08:40:08 +0000
Received: by outflank-mailman (input) for mailman id 1026031;
 Thu, 26 Jun 2025 08:40:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Scu=ZJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uUi9O-0005aO-Rm
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 08:40:06 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28945707-5269-11f0-a30f-13f23c93f187;
 Thu, 26 Jun 2025 10:40:05 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ae0d11bb2a7so98306266b.3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jun 2025 01:40:05 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae0a4da13fcsm475770766b.20.2025.06.26.01.40.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jun 2025 01:40:03 -0700 (PDT)
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
X-Inumbo-ID: 28945707-5269-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750927205; x=1751532005; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BbVpDqo2TcDM1/esE61LVN5Y0nn2ueDRgX1i6NDRF4w=;
        b=aMRRjZUJE/9YDjMb2clZ59K2tRSs2fBIIfIFa8xf34otLbfJAnNFeb9XKmuApy/FnC
         YVNxhlnZUD3C7LtZf7j8fkRj6kNTyrSaY6svQfISuJEpb38Bx3apakuGFY695Wmo9evY
         rnaBdvfC45p5KgXvHcUVH2sSLWZNFOzYkmikJWmlbssAlSKZtXm9YzcdZ4iOpFpExYvy
         p82q9x9RhITVCgt8+ynqJfZNBFZlI0QlnGpuxUQWVq4x7kVFAg2vqvoEjheEJN2Ju32i
         FSj+1uzHwJOLboOpAoi34anFCfZ19Ki/YqX5cnjFrOXirHm1F3r9SMuZe4Onz8KUZnwI
         IhOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750927205; x=1751532005;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BbVpDqo2TcDM1/esE61LVN5Y0nn2ueDRgX1i6NDRF4w=;
        b=iHnw5OG7xEOCdvNWJrp+l0QxLef+AMRUQqyLBEzlMB/+4C4rm58wJ54sXTV25w2pco
         4mPbmPnvDfFdvDGqTp2OFd+L2Tvkiq3z+TzJIv7uZXNJ5k61ykzXG256Nh9f9OnTD+At
         PrEdhn0d0G3DuDlA4W5UFVaL9mE5QsM7oP9knsb0CJ+K/9Z8Ph3J9N9FoMLFRjJLShUq
         O6G+wmJmo1nkAGpmhK0re0X7fpdtyNBQWNpNNblmORKeT2sjIorkm3beiBIEiFHRjoRP
         QU0etysCTSbiI0ylueYZX8JxelypLfFuKvmtLMNir5xVdOUjLsoM7GZIW2//BPbegKhV
         oCEA==
X-Forwarded-Encrypted: i=1; AJvYcCVndCf9AVb8ixuMCHzcGrZbkWv/RPJBj1vnu0jaIIFYo9Hsu4xxVAipJwM4sQ0qY6WMElSKN/LMLXw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy/ASAW10GY2v4PkZUAtSQYNdWnYFHcwotFzKl2LzaGolbxdZCW
	Uka04wCgg/In2vrwowpaFmtOckid2fAd434CkEvXs53xHBhLUJlo76dD
X-Gm-Gg: ASbGnctsCyYg1YuKg8Byfo60huZJKgF8gy+v8NzCOCENPcSWyddKHzDpmQnIfljFpIr
	CwwrzAZkcYtRtjJAcoIg+yoKlD4SHPNGtJfnxxksgF4MABQxsHN2HPsyMtFsYmOPFwotpfddism
	JWvPA5xZ69gg/ZVfoJnSvL53QKuHX0FFJTaSflsq//CprGbPKkwtf52I2bfyH3l0Eu4NwWhVJLb
	0rviJ3tzqYkY2EM5HQevjG9rcHus7orcSkFiIFDFWpIjChw1keV5rE6CBs1fdqGomaAIfRU5Ave
	1geoV8yku+kCXKjnB3VJuHcYiGum/yjmXgtO51aYmHAbkWHBf26uQimxfuFlgLdRGVIqpRaXqcd
	zgiAVHk77+DNzqMj5El4OcG372qExGxDLvIo=
X-Google-Smtp-Source: AGHT+IE6skJd82UuucOQtjBxc2kQDLCfxaXWEC/Ua80HHcrYs6Owck6tnVKhuANSJ29EnXEY7RGYVQ==
X-Received: by 2002:a17:907:9690:b0:ae0:de30:8569 with SMTP id a640c23a62f3a-ae0de30874emr51877166b.1.1750927204495;
        Thu, 26 Jun 2025 01:40:04 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------4C0lvgBwVJ7PPdUnn48sBYMC"
Message-ID: <8741800f-b40b-4c42-b435-91e2f9375f6c@gmail.com>
Date: Thu, 26 Jun 2025 10:40:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/17] xen/riscv: introduce things necessary for p2m
 initialization
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <443cb3566a60dcb5d5440c72410ff6d76a010a58.1749555949.git.oleksii.kurochko@gmail.com>
 <5c61fd86-5c0e-481e-a5a9-6a53f2d78c36@suse.com>
 <0b3c403b-0f24-4fc6-ba5b-fb4df62d7057@gmail.com>
 <7cb7a46b-8d2e-4f9e-9613-f7a4199096ee@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <7cb7a46b-8d2e-4f9e-9613-f7a4199096ee@suse.com>

This is a multi-part message in MIME format.
--------------4C0lvgBwVJ7PPdUnn48sBYMC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/25/25 5:53 PM, Jan Beulich wrote:
> On 25.06.2025 17:31, Oleksii Kurochko wrote:
>> On 6/18/25 6:08 PM, Jan Beulich wrote:
>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>> @@ -14,6 +18,29 @@
>>>>    
>>>>    /* Per-p2m-table state */
>>>>    struct p2m_domain {
>>>> +    /*
>>>> +     * Lock that protects updates to the p2m.
>>>> +     */
>>>> +    rwlock_t lock;
>>>> +
>>>> +    /* Pages used to construct the p2m */
>>>> +    struct page_list_head pages;
>>>> +
>>>> +    /* Indicate if it is required to clean the cache when writing an entry */
>>>> +    bool clean_pte;
>>>> +
>>>> +    struct radix_tree_root p2m_type;
>>> A field with a p2m_ prefix in a p2m struct?
>> p2m_ prefix could be really dropped.
>>
>>>    And is this tree really about
>>> just a single "type"?
>> Yes, we don't have enough bits in PTE so we need some extra storage to store type.
> My question wasn't about that, though. My question was whether in the name
> "type" (singular) is appropriate. I didn't think you need a tree to store just
> a single type.

I need tree to store a pair of <gfn, p2m_type>, where gfn is an index. And it seems
to me a tree is a good structure for fast insert/search.

>
>>>> +    /*
>>>> +     * Default P2M access type for each page in the the domain: new pages,
>>>> +     * swapped in pages, cleared pages, and pages that are ambiguously
>>>> +     * retyped get this access type.  See definition of p2m_access_t.
>>>> +     */
>>>> +    p2m_access_t default_access;
>>>> +
>>>> +    /* Back pointer to domain */
>>>> +    struct domain *domain;
>>> This you may want to introduce earlier, to prefer passing around struct
>>> p2m_domain * in / to P2M functions (which would benefit earlier patches
>>> already, I think).
>> But nothing uses it earlier.
> If you do as suggested and pass around struct p2m_domain * for p2m_*()
> functions, you'll quickly find it used, I think.
>
>>>> --- a/xen/arch/riscv/p2m.c
>>>> +++ b/xen/arch/riscv/p2m.c
>>>> @@ -1,13 +1,46 @@
>>>>    #include <xen/bitops.h>
>>>> +#include <xen/domain_page.h>
>>>>    #include <xen/event.h>
>>>> +#include <xen/iommu.h>
>>>>    #include <xen/lib.h>
>>>> +#include <xen/mm.h>
>>>> +#include <xen/pfn.h>
>>>> +#include <xen/rwlock.h>
>>>>    #include <xen/sched.h>
>>>>    #include <xen/spinlock.h>
>>>>    #include <xen/xvmalloc.h>
>>>>    
>>>> +#include <asm/page.h>
>>>>    #include <asm/p2m.h>
>>>>    #include <asm/sbi.h>
>>>>    
>>>> +/*
>>>> + * Force a synchronous P2M TLB flush.
>>>> + *
>>>> + * Must be called with the p2m lock held.
>>>> + */
>>>> +static void p2m_force_tlb_flush_sync(struct p2m_domain *p2m)
>>>> +{
>>>> +    struct domain *d = p2m->domain;
>>>> +
>>>> +    ASSERT(p2m_is_write_locked(p2m));
>>>> +
>>>> +    sbi_remote_hfence_gvma_vmid(d->dirty_cpumask, 0, 0, p2m->vmid);
>>>> +}
>>>> +
>>>> +/* Unlock the flush and do a P2M TLB flush if necessary */
>>>> +void p2m_write_unlock(struct p2m_domain *p2m)
>>>> +{
>>>> +    /*
>>>> +     * The final flush is done with the P2M write lock taken to avoid
>>>> +     * someone else modifying the P2M wbefore the TLB invalidation has
>>>> +     * completed.
>>>> +     */
>>>> +    p2m_force_tlb_flush_sync(p2m);
>>> The comment ahead of the function says "if necessary". Yet there's no
>>> conditional here. I also question the need for a global flush in all
>>> cases.
>> Stale comment.
>>
>> But if p2m page table was modified that it is needed to do a flush for CPUs
>> in d->dirty_cpumask.
> Right, but is that true for each and every case where you acquire the
> lock in write mode? There may e.g. be early-out path which end up doing
> nothing, yet you would then still flush the TLB.

Initially, I assumed that early-out patch will happen mostly in the cases when
some error happen, so it will be okay to flush the TLB each time.

But, yes, I missed some cases when it will be end up doing nothing. I will return
back need_flush.

>
>>>> @@ -109,8 +142,33 @@ int p2m_init(struct domain *d)
>>>>        spin_lock_init(&d->arch.paging.lock);
>>>>        INIT_PAGE_LIST_HEAD(&d->arch.paging.p2m_freelist);
>>>>    
>>>> +    rwlock_init(&p2m->lock);
>>>> +    INIT_PAGE_LIST_HEAD(&p2m->pages);
>>>> +
>>>>        p2m->vmid = INVALID_VMID;
>>>>    
>>>> +    p2m->default_access = p2m_access_rwx;
>>>> +
>>>> +    radix_tree_init(&p2m->p2m_type);
>>>> +
>>>> +#ifdef CONFIG_HAS_PASSTHROUGH
>>> Do you expect this to be conditionally selected on RISC-V?
>> No, once it will be implemented it will be just selected once by config RISC-V.
>> And it was done so because iommu_has_feature() isn't implemented now as IOMMU
>> isn't supported now and depends on CONFIG_HAS_PASSTHROUGH.
> If the selection isn't going to be conditional, then I see no reason to have
> such conditionals in RISC-V-specific code. The piece of code presently inside
> that #ifdef may simply need adding later, once there's enough infrastructure
> to allow that code to compile. Or maybe it would even compile fine already now?

I haven't tried. Anyway, I get your point.

>
>>>> +    /*
>>>> +     * Some IOMMUs don't support coherent PT walk. When the p2m is
>>>> +     * shared with the CPU, Xen has to make sure that the PT changes have
>>>> +     * reached the memory
>>>> +     */
>>>> +    p2m->clean_pte = is_iommu_enabled(d) &&
>>>> +        !iommu_has_feature(d, IOMMU_FEAT_COHERENT_WALK);
>>> The comment talks about shared page tables, yet you don't check whether
>>> page table sharing is actually enabled for the domain.
>> Do we have such function/macros?
> We have iommu_hap_pt_share, and we have the per-domain hap_pt_share flag.
>
>> It is shared by implementation now.
> I don't understand. There's no IOMMU support yet for RISC-V. Hence it's in
> neither state - not shared, but also not not shared.

In downstream there is a support of IOMMU for RISC-V.

~ Oleksii

--------------4C0lvgBwVJ7PPdUnn48sBYMC
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
    <div class="moz-cite-prefix">On 6/25/25 5:53 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:7cb7a46b-8d2e-4f9e-9613-f7a4199096ee@suse.com">
      <pre wrap="" class="moz-quote-pre">On 25.06.2025 17:31, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 6/18/25 6:08 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 10.06.2025 15:05, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">@@ -14,6 +18,29 @@
  
  /* Per-p2m-table state */
  struct p2m_domain {
+    /*
+     * Lock that protects updates to the p2m.
+     */
+    rwlock_t lock;
+
+    /* Pages used to construct the p2m */
+    struct page_list_head pages;
+
+    /* Indicate if it is required to clean the cache when writing an entry */
+    bool clean_pte;
+
+    struct radix_tree_root p2m_type;
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">A field with a p2m_ prefix in a p2m struct?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
p2m_ prefix could be really dropped.

</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">  And is this tree really about
just a single "type"?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Yes, we don't have enough bits in PTE so we need some extra storage to store type.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
My question wasn't about that, though. My question was whether in the name
"type" (singular) is appropriate. I didn't think you need a tree to store just
a single type.</pre>
    </blockquote>
    <pre>I need tree to store a pair of &lt;gfn, p2m_type&gt;, where gfn is an index. And it seems
to me a tree is a good structure for fast insert/search.

</pre>
    <blockquote type="cite"
      cite="mid:7cb7a46b-8d2e-4f9e-9613-f7a4199096ee@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+    /*
+     * Default P2M access type for each page in the the domain: new pages,
+     * swapped in pages, cleared pages, and pages that are ambiguously
+     * retyped get this access type.  See definition of p2m_access_t.
+     */
+    p2m_access_t default_access;
+
+    /* Back pointer to domain */
+    struct domain *domain;
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">This you may want to introduce earlier, to prefer passing around struct
p2m_domain * in / to P2M functions (which would benefit earlier patches
already, I think).
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
But nothing uses it earlier.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
If you do as suggested and pass around struct p2m_domain * for p2m_*()
functions, you'll quickly find it used, I think.

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -1,13 +1,46 @@
  #include &lt;xen/bitops.h&gt;
+#include &lt;xen/domain_page.h&gt;
  #include &lt;xen/event.h&gt;
+#include &lt;xen/iommu.h&gt;
  #include &lt;xen/lib.h&gt;
+#include &lt;xen/mm.h&gt;
+#include &lt;xen/pfn.h&gt;
+#include &lt;xen/rwlock.h&gt;
  #include &lt;xen/sched.h&gt;
  #include &lt;xen/spinlock.h&gt;
  #include &lt;xen/xvmalloc.h&gt;
  
+#include &lt;asm/page.h&gt;
  #include &lt;asm/p2m.h&gt;
  #include &lt;asm/sbi.h&gt;
  
+/*
+ * Force a synchronous P2M TLB flush.
+ *
+ * Must be called with the p2m lock held.
+ */
+static void p2m_force_tlb_flush_sync(struct p2m_domain *p2m)
+{
+    struct domain *d = p2m-&gt;domain;
+
+    ASSERT(p2m_is_write_locked(p2m));
+
+    sbi_remote_hfence_gvma_vmid(d-&gt;dirty_cpumask, 0, 0, p2m-&gt;vmid);
+}
+
+/* Unlock the flush and do a P2M TLB flush if necessary */
+void p2m_write_unlock(struct p2m_domain *p2m)
+{
+    /*
+     * The final flush is done with the P2M write lock taken to avoid
+     * someone else modifying the P2M wbefore the TLB invalidation has
+     * completed.
+     */
+    p2m_force_tlb_flush_sync(p2m);
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">The comment ahead of the function says "if necessary". Yet there's no
conditional here. I also question the need for a global flush in all
cases.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Stale comment.

But if p2m page table was modified that it is needed to do a flush for CPUs
in d-&gt;dirty_cpumask.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Right, but is that true for each and every case where you acquire the
lock in write mode? There may e.g. be early-out path which end up doing
nothing, yet you would then still flush the TLB.</pre>
    </blockquote>
    <pre>Initially, I assumed that early-out patch will happen mostly in the cases when
some error happen, so it will be okay to flush the TLB each time.

But, yes, I missed some cases when it will be end up doing nothing. I will return
back need_flush.

</pre>
    <blockquote type="cite"
      cite="mid:7cb7a46b-8d2e-4f9e-9613-f7a4199096ee@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">@@ -109,8 +142,33 @@ int p2m_init(struct domain *d)
      spin_lock_init(&amp;d-&gt;arch.paging.lock);
      INIT_PAGE_LIST_HEAD(&amp;d-&gt;arch.paging.p2m_freelist);
  
+    rwlock_init(&amp;p2m-&gt;lock);
+    INIT_PAGE_LIST_HEAD(&amp;p2m-&gt;pages);
+
      p2m-&gt;vmid = INVALID_VMID;
  
+    p2m-&gt;default_access = p2m_access_rwx;
+
+    radix_tree_init(&amp;p2m-&gt;p2m_type);
+
+#ifdef CONFIG_HAS_PASSTHROUGH
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Do you expect this to be conditionally selected on RISC-V?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
No, once it will be implemented it will be just selected once by config RISC-V.
And it was done so because iommu_has_feature() isn't implemented now as IOMMU
isn't supported now and depends on CONFIG_HAS_PASSTHROUGH.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
If the selection isn't going to be conditional, then I see no reason to have
such conditionals in RISC-V-specific code. The piece of code presently inside
that #ifdef may simply need adding later, once there's enough infrastructure
to allow that code to compile. Or maybe it would even compile fine already now?</pre>
    </blockquote>
    <pre>I haven't tried. Anyway, I get your point.

</pre>
    <blockquote type="cite"
      cite="mid:7cb7a46b-8d2e-4f9e-9613-f7a4199096ee@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+    /*
+     * Some IOMMUs don't support coherent PT walk. When the p2m is
+     * shared with the CPU, Xen has to make sure that the PT changes have
+     * reached the memory
+     */
+    p2m-&gt;clean_pte = is_iommu_enabled(d) &amp;&amp;
+        !iommu_has_feature(d, IOMMU_FEAT_COHERENT_WALK);
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">The comment talks about shared page tables, yet you don't check whether
page table sharing is actually enabled for the domain.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Do we have such function/macros?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
We have iommu_hap_pt_share, and we have the per-domain hap_pt_share flag.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">It is shared by implementation now.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I don't understand. There's no IOMMU support yet for RISC-V. Hence it's in
neither state - not shared, but also not not shared.</pre>
    </blockquote>
    <pre>In downstream there is a support of IOMMU for RISC-V.</pre>
    <pre>~ Oleksii
</pre>
  </body>
</html>

--------------4C0lvgBwVJ7PPdUnn48sBYMC--

