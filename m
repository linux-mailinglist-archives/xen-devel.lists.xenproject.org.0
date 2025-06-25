Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 374AAAE882B
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 17:32:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1025227.1400865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUS66-000397-7a; Wed, 25 Jun 2025 15:31:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1025227.1400865; Wed, 25 Jun 2025 15:31:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUS66-000371-4b; Wed, 25 Jun 2025 15:31:38 +0000
Received: by outflank-mailman (input) for mailman id 1025227;
 Wed, 25 Jun 2025 15:31:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ahiT=ZI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uUS64-00036v-Ob
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 15:31:36 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7539d12f-51d9-11f0-b894-0df219b8e170;
 Wed, 25 Jun 2025 17:31:26 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-60780d74c85so2721594a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jun 2025 08:31:26 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60c2f4a497dsm2636326a12.69.2025.06.25.08.31.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jun 2025 08:31:24 -0700 (PDT)
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
X-Inumbo-ID: 7539d12f-51d9-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750865486; x=1751470286; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IK1rwYVWatbwXx37+p9OST/WtX06FQelroGhU5xtCAc=;
        b=PxxeKBRGLkcWKWc/Ld+EaBmVAcnVn1cNHPLpExNMFM8Cb+BIDBWsuooOX2vDDKn6S1
         tEcqYXOHlPjElDGImWbnbBLUFs7iF6CERPy5rtOiBmuKWLlnzLoF/RTze672cm2khNPO
         2qpYy8v13RmYehLD7OI4Iwx0Kw2TyQXla/kQTEONUAz+n9TqdQIMaisdj0sKTwG+x+sg
         TW1d+H/iC3XIhTA1yGrU5767BD0oDTN7eUTZmA49rGs4SHRTUQEIBNj2SRN8nUirx86Y
         8yFrcDFjQN3Iphu8Z8IY+p72L5l8UC1jT5umim7qxFAYoN6Laf5J6Ttc9wujazHatIZe
         yA2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750865486; x=1751470286;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IK1rwYVWatbwXx37+p9OST/WtX06FQelroGhU5xtCAc=;
        b=r/wsLlXXHlsthVnaK+0YCDiB77ykYVIZt+rzp0U7xwXFaT/KqSn2ShwBUw/Toy2wtn
         /BQB3RAR2HdKWZin/cfqhUwRbzyqdJQYwO85XsBVGqjYmmFLhKG99aPCS/4rZTfAF7BE
         mZrHJ2tmRFCpdxA8QFBcETT21EOQcU4oWBPndZY+UieoJEhaTZj1MPwLHc9zAgxWCcBh
         u+JPS7mV2yxfshdWgM4FMPQV52ezmypZI3usDlslD1uXO6dGXtxFy9udARq5+VR4Cw6H
         YrfE0JBzhNg0aM6X81vBuLBiPgmoMQKoF52CfyH9PW6E1KB7pqeymNhJhJVO6OCwscbm
         wh5A==
X-Forwarded-Encrypted: i=1; AJvYcCU7bYUDYJqmn/rBABcrs4MqDAg/y21/pSv2M/wSvJ9SbNWHku3XyeK8OdBAezz3Yft2vaMnZ2QbnbU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzMd2UI3UipxTyNYH8THABNrbBCVbViq/PYp+/sNkkfNhJMXj9/
	oVszUVjmhWqmaT3v+KvqqJ1kpqTVMAk7KDTbEMfQREu3w1I0nIUSdwbg
X-Gm-Gg: ASbGncuXUdxjFiTGUqwfrn9VKvymAJnjLvILefREjalNs9b9vzoPfeqwIJlATpgIExa
	qXqrRkf/cmJu3xNPMmcmJPnMZ1FU0efFr9HWfnlImsziPVEh3p9Yv0BihTezjQscFjyNvK+GfAy
	p3z98F0YTON9rG98As6htr+STkLHcIj0SzCs36PN7TXpImIvJqt6lSNlcSwFVV9Uqm8k63pDstr
	QE243ZKL4JUXQAnMYhjUNjnV41nkNG/hkQpYSDe7Jo6htx0jkvPGekmeGB8SlBzIoEA31/9lLSY
	1eYzmuIPVPHDhEIrw5EEeyNwDbq/8LA9rvHceaNR2988QRoWtHFnPOIWdaE6w2D4NkizI5YvCir
	s3gqlYbPKPX5ci+ldTlrqqrSpaKVGyT7h8N+8JNn+peEOiQ==
X-Google-Smtp-Source: AGHT+IFLEhctetxyRGrgZoJVxxzyFeD5ZTOI/ltJVfwGU0WEHrqKHEQ1qChuTtSvR4F+ByErmUH+rw==
X-Received: by 2002:a05:6402:42d0:b0:60c:4bc0:453e with SMTP id 4fb4d7f45d1cf-60c4dc5250cmr2681685a12.2.1750865485711;
        Wed, 25 Jun 2025 08:31:25 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------eaK6LrHcXj0tDtk9P2XbyRiC"
Message-ID: <0b3c403b-0f24-4fc6-ba5b-fb4df62d7057@gmail.com>
Date: Wed, 25 Jun 2025 17:31:23 +0200
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <5c61fd86-5c0e-481e-a5a9-6a53f2d78c36@suse.com>

This is a multi-part message in MIME format.
--------------eaK6LrHcXj0tDtk9P2XbyRiC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/18/25 6:08 PM, Jan Beulich wrote:
> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>> Introduce the following things:
>> - Update p2m_domain structure, which describe per p2m-table state, with:
>>    - lock to protect updates to p2m.
>>    - pool with pages used to construct p2m.
>>    - clean_pte which indicate if it is requires to clean the cache when
>>      writing an entry.
>>    - radix tree to store p2m type as PTE doesn't have enough free bits to
>>      store type.
>>    - default_access to store p2m access type for each page in the domain.
>>    - back pointer to domain structure.
>> - p2m_init() to initalize members introduced in p2m_domain structure.
>> - Introudce p2m_write_lock() and p2m_is_write_locked().
> What about the reader variant? If you don't need that, why not use a simple
> spin lock?

It will be introduced later in "xen/riscv: add support of page lookup by GFN"
of this patch series where it is really used.

But I can move it here.

>
>> @@ -14,6 +18,29 @@
>>   
>>   /* Per-p2m-table state */
>>   struct p2m_domain {
>> +    /*
>> +     * Lock that protects updates to the p2m.
>> +     */
>> +    rwlock_t lock;
>> +
>> +    /* Pages used to construct the p2m */
>> +    struct page_list_head pages;
>> +
>> +    /* Indicate if it is required to clean the cache when writing an entry */
>> +    bool clean_pte;
>> +
>> +    struct radix_tree_root p2m_type;
> A field with a p2m_ prefix in a p2m struct?

p2m_ prefix could be really dropped.

>   And is this tree really about
> just a single "type"?

Yes, we don't have enough bits in PTE so we need some extra storage to store type.

>
>> +    /*
>> +     * Default P2M access type for each page in the the domain: new pages,
>> +     * swapped in pages, cleared pages, and pages that are ambiguously
>> +     * retyped get this access type.  See definition of p2m_access_t.
>> +     */
>> +    p2m_access_t default_access;
>> +
>> +    /* Back pointer to domain */
>> +    struct domain *domain;
> This you may want to introduce earlier, to prefer passing around struct
> p2m_domain * in / to P2M functions (which would benefit earlier patches
> already, I think).

But nothing uses it earlier.

>
>> --- a/xen/arch/riscv/p2m.c
>> +++ b/xen/arch/riscv/p2m.c
>> @@ -1,13 +1,46 @@
>>   #include <xen/bitops.h>
>> +#include <xen/domain_page.h>
>>   #include <xen/event.h>
>> +#include <xen/iommu.h>
>>   #include <xen/lib.h>
>> +#include <xen/mm.h>
>> +#include <xen/pfn.h>
>> +#include <xen/rwlock.h>
>>   #include <xen/sched.h>
>>   #include <xen/spinlock.h>
>>   #include <xen/xvmalloc.h>
>>   
>> +#include <asm/page.h>
>>   #include <asm/p2m.h>
>>   #include <asm/sbi.h>
>>   
>> +/*
>> + * Force a synchronous P2M TLB flush.
>> + *
>> + * Must be called with the p2m lock held.
>> + */
>> +static void p2m_force_tlb_flush_sync(struct p2m_domain *p2m)
>> +{
>> +    struct domain *d = p2m->domain;
>> +
>> +    ASSERT(p2m_is_write_locked(p2m));
>> +
>> +    sbi_remote_hfence_gvma_vmid(d->dirty_cpumask, 0, 0, p2m->vmid);
>> +}
>> +
>> +/* Unlock the flush and do a P2M TLB flush if necessary */
>> +void p2m_write_unlock(struct p2m_domain *p2m)
>> +{
>> +    /*
>> +     * The final flush is done with the P2M write lock taken to avoid
>> +     * someone else modifying the P2M wbefore the TLB invalidation has
>> +     * completed.
>> +     */
>> +    p2m_force_tlb_flush_sync(p2m);
> The comment ahead of the function says "if necessary". Yet there's no
> conditional here. I also question the need for a global flush in all
> cases.

Stale comment.

But if p2m page table was modified that it is needed to do a flush for CPUs
in d->dirty_cpumask.

>
>> @@ -109,8 +142,33 @@ int p2m_init(struct domain *d)
>>       spin_lock_init(&d->arch.paging.lock);
>>       INIT_PAGE_LIST_HEAD(&d->arch.paging.p2m_freelist);
>>   
>> +    rwlock_init(&p2m->lock);
>> +    INIT_PAGE_LIST_HEAD(&p2m->pages);
>> +
>>       p2m->vmid = INVALID_VMID;
>>   
>> +    p2m->default_access = p2m_access_rwx;
>> +
>> +    radix_tree_init(&p2m->p2m_type);
>> +
>> +#ifdef CONFIG_HAS_PASSTHROUGH
> Do you expect this to be conditionally selected on RISC-V?

No, once it will be implemented it will be just selected once by config RISC-V.
And it was done so because iommu_has_feature() isn't implemented now as IOMMU
isn't supported now and depends on CONFIG_HAS_PASSTHROUGH.

>
>> +    /*
>> +     * Some IOMMUs don't support coherent PT walk. When the p2m is
>> +     * shared with the CPU, Xen has to make sure that the PT changes have
>> +     * reached the memory
>> +     */
>> +    p2m->clean_pte = is_iommu_enabled(d) &&
>> +        !iommu_has_feature(d, IOMMU_FEAT_COHERENT_WALK);
> The comment talks about shared page tables, yet you don't check whether
> page table sharing is actually enabled for the domain.

Do we have such function/macros? It is shared by implementation now.

>
>> +#else
>> +    p2m->clean_pte = false;
> I hope the struct starts out zero-filled, in which case you wouldn't need
> this.
>
>> +#endif
>> +
>> +    /*
>> +     * "Trivial" initialisation is now complete.  Set the backpointer so the
>> +     * users of p2m could get an access to domain structure.
>> +     */
>> +    p2m->domain = d;
> Better set this about the very first thing?

It makes sense. I will move it up.

Thanks.

~ Oleksii


--------------eaK6LrHcXj0tDtk9P2XbyRiC
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
    <div class="moz-cite-prefix">On 6/18/25 6:08 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:5c61fd86-5c0e-481e-a5a9-6a53f2d78c36@suse.com">
      <pre wrap="" class="moz-quote-pre">On 10.06.2025 15:05, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Introduce the following things:
- Update p2m_domain structure, which describe per p2m-table state, with:
  - lock to protect updates to p2m.
  - pool with pages used to construct p2m.
  - clean_pte which indicate if it is requires to clean the cache when
    writing an entry.
  - radix tree to store p2m type as PTE doesn't have enough free bits to
    store type.
  - default_access to store p2m access type for each page in the domain.
  - back pointer to domain structure.
- p2m_init() to initalize members introduced in p2m_domain structure.
- Introudce p2m_write_lock() and p2m_is_write_locked().
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
What about the reader variant? If you don't need that, why not use a simple
spin lock?</pre>
    </blockquote>
    <pre>It will be introduced later in "xen/riscv: add support of page lookup by GFN"
of this patch series where it is really used.

But I can move it here.

</pre>
    <blockquote type="cite"
      cite="mid:5c61fd86-5c0e-481e-a5a9-6a53f2d78c36@suse.com">
      <pre wrap="" class="moz-quote-pre">

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
      <pre wrap="" class="moz-quote-pre">
A field with a p2m_ prefix in a p2m struct?</pre>
    </blockquote>
    <pre>p2m_ prefix could be really dropped.</pre>
    <blockquote type="cite"
      cite="mid:5c61fd86-5c0e-481e-a5a9-6a53f2d78c36@suse.com">
      <pre wrap="" class="moz-quote-pre"> And is this tree really about
just a single "type"?</pre>
    </blockquote>
    <pre>Yes, we don't have enough bits in PTE so we need some extra storage to store type.

</pre>
    <blockquote type="cite"
      cite="mid:5c61fd86-5c0e-481e-a5a9-6a53f2d78c36@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
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
      <pre wrap="" class="moz-quote-pre">
This you may want to introduce earlier, to prefer passing around struct
p2m_domain * in / to P2M functions (which would benefit earlier patches
already, I think).</pre>
    </blockquote>
    <pre>But nothing uses it earlier.

</pre>
    <blockquote type="cite"
      cite="mid:5c61fd86-5c0e-481e-a5a9-6a53f2d78c36@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
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
      <pre wrap="" class="moz-quote-pre">
The comment ahead of the function says "if necessary". Yet there's no
conditional here. I also question the need for a global flush in all
cases.</pre>
    </blockquote>
    <pre>Stale comment.

But if p2m page table was modified that it is needed to do a flush for CPUs
in d-&gt;dirty_cpumask.

</pre>
    <blockquote type="cite"
      cite="mid:5c61fd86-5c0e-481e-a5a9-6a53f2d78c36@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
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
      <pre wrap="" class="moz-quote-pre">
Do you expect this to be conditionally selected on RISC-V?</pre>
    </blockquote>
    <pre>No, once it will be implemented it will be just selected once by config RISC-V.
And it was done so because iommu_has_feature() isn't implemented now as IOMMU
isn't supported now and depends on CONFIG_HAS_PASSTHROUGH.</pre>
    <blockquote type="cite"
      cite="mid:5c61fd86-5c0e-481e-a5a9-6a53f2d78c36@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
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
      <pre wrap="" class="moz-quote-pre">
The comment talks about shared page tables, yet you don't check whether
page table sharing is actually enabled for the domain.</pre>
    </blockquote>
    <pre>Do we have such function/macros? It is shared by implementation now.

</pre>
    <blockquote type="cite"
      cite="mid:5c61fd86-5c0e-481e-a5a9-6a53f2d78c36@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+#else
+    p2m-&gt;clean_pte = false;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I hope the struct starts out zero-filled, in which case you wouldn't need
this.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+#endif
+
+    /*
+     * "Trivial" initialisation is now complete.  Set the backpointer so the
+     * users of p2m could get an access to domain structure.
+     */
+    p2m-&gt;domain = d;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Better set this about the very first thing?</pre>
    </blockquote>
    <pre>It makes sense. I will move it up.

Thanks.

~ Oleksii</pre>
    <br>
  </body>
</html>

--------------eaK6LrHcXj0tDtk9P2XbyRiC--

