Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6B9A296D8
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2025 17:56:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882246.1292411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfigm-0002Gb-Ky; Wed, 05 Feb 2025 16:55:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882246.1292411; Wed, 05 Feb 2025 16:55:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfigm-0002Ek-IO; Wed, 05 Feb 2025 16:55:48 +0000
Received: by outflank-mailman (input) for mailman id 882246;
 Wed, 05 Feb 2025 16:55:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jnKU=U4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tfigl-0002Ec-4B
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2025 16:55:47 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a50fb6f-e3e2-11ef-99a4-01e77a169b0f;
 Wed, 05 Feb 2025 17:55:44 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5dce3c28889so77635a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Feb 2025 08:55:44 -0800 (PST)
Received: from [192.168.201.60] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e4a2fa09sm1134190866b.140.2025.02.05.08.55.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 08:55:43 -0800 (PST)
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
X-Inumbo-ID: 0a50fb6f-e3e2-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738774544; x=1739379344; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GFHbuEltu41OFVqjfHFDXzekZVOA+xhYqgbHPPdipnc=;
        b=DHVL4OiOkZC347s6NUr3bNHAdr4lHujo2Im6HBLu9TqHEox+cBy38UC1DEFCCZ+qZL
         Wze5zgq8b3BtCIbJfhbPPBzE7wSDtCuPO0huFDOF1zrR8KesDg1znA3X83sRdkiqkHqS
         jaD6fNnaJWAAoBfduniL5Rq07uoBCOX7H3ButmuGJw0mLpnscrr5pxWSvp52vJ4o4iQL
         wBFewgXYSbIf1Tdq9u67gg3JFy1x2zqPIozBRDRWPZ599nz4oPEvF2fV3GEcRPpkYSBS
         g/mipeZ8n3KMF/6YDJt9/DmEju+ZbkWm4kko7ANbarflXnuf+DFGk8AVSW/HLruW1HII
         2V8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738774544; x=1739379344;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GFHbuEltu41OFVqjfHFDXzekZVOA+xhYqgbHPPdipnc=;
        b=tOBRZl9ddBgi9lnZJpLmaF54YQ6VM3O8HQark+IxvVRQYhY6xxcpm67lu3F2t1Z8Ie
         WTTyj4djrOu/uUR/DKXrNLgVdFylMKdUlICDymfmIsZnMWU5p5okBh/yPy6vLlOx/WKl
         89nZi+5QB31/zeE15TZlGGJETkSPAybLZGdH/cEG51PBcAoFRAZrAa1s6Bkfq76asr2l
         W7L6OeXUCChoRItiR0XJ9Vv1rdGjdkby2JQbIXvT2f7ULNb5OAmfIoprGg6905tsAMvL
         CIZLjHGp0icvkDv8qVr+qDGe9EYwpXmHRXlKlYfeZ0tF5FdJuVgpnNrfSp5MrspOcmAH
         wsww==
X-Forwarded-Encrypted: i=1; AJvYcCXcS0x63E22Km+YVH0yzIs9M4hkJT2V9Kko6HTL9bwjS8GYAYyN4bG1H1rYFqAYbar8YeR5uCMPFBU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwZ/vS2cHRPPCA/gtC6dCzHJ9BE9VehHC7mH5PMKnKz2HCPSNqN
	z2nAtnKj2If0QoFnHASzcSeKxb6YjSWRyCcd4sdYknKUpw5gV7DU
X-Gm-Gg: ASbGncsWDvPte4Ge5IH/hAfnRfEK/m+gOabKFS2KJGxmZL4RcRrvnZRBSwit28LdQS3
	+HuNxdx7rleZf+OQkioiq+0aJsppHB94UE4Ug35LVd8chLJReJg017rNdxjme7VJughcrW08H7N
	HwKHgyMSQASEr8U90LqLE9wZUSTuw0Q9ycLLkvCI3XOMfoC+relXpGnH/2BlIsYerHnPGhwdk3z
	C8T5T3raSGGPhoCCIZQyfMkrRxOp5ju0yWR//TnY9DfejMmWxq6c6b4qNQey1sXOjSmJaA33SjT
	JOhC05SlrtC2Jcn4oC4uUThAyB0=
X-Google-Smtp-Source: AGHT+IGl0MKVLcRvT5SaFYbg5psr4jH1CKqO55gThsQ2UQQJIjWtjD6TXX5DUpl28m5wi4zl7kswCw==
X-Received: by 2002:a17:907:72cd:b0:aae:bd36:b198 with SMTP id a640c23a62f3a-ab75e321e23mr340370566b.47.1738774543844;
        Wed, 05 Feb 2025 08:55:43 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------AbFcnfhXb2jTV4nSD2k7Gg08"
Message-ID: <c0d9a023-566b-4559-b6e3-e04cf34c6206@gmail.com>
Date: Wed, 5 Feb 2025 17:55:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for 4.20? 1/3] xen/riscv: implement software page table
 walking
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1738587493.git.oleksii.kurochko@gmail.com>
 <a4f0b312351e5f6a9e57f50ebbc3bda8a72c18bb.1738587493.git.oleksii.kurochko@gmail.com>
 <475fc7fc-87ab-493e-8bef-eddeaa64aa54@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <475fc7fc-87ab-493e-8bef-eddeaa64aa54@suse.com>

This is a multi-part message in MIME format.
--------------AbFcnfhXb2jTV4nSD2k7Gg08
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/4/25 2:50 PM, Jan Beulich wrote:
> On 03.02.2025 14:12, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/include/asm/mm.h
>> +++ b/xen/arch/riscv/include/asm/mm.h
>> @@ -156,6 +156,10 @@ static inline struct page_info *virt_to_page(const void *v)
>>       return frametable_virt_start + PFN_DOWN(va - directmap_virt_start);
>>   }
>>   
>> +#include <asm/page.h>
> asm/page.h already includes asm/mm.h, so you're introducing a circular
> dependency here (much of which the patch description is about, so it's
> unclear why you didn't solve this another way). Afaict ...
>
>> +pte_t * pt_walk(vaddr_t va, unsigned int *pte_level);
> ... it's pte_t that presents a problem here. Why not simply put the
> declaration in asm/page.h (and drop all the secondary changes that
> don't really belong in this patch anyway)?

In the patch 2 it is used for implementing vmap_to_mfn():

   static inline mfn_t vmap_to_mfn_(vaddr_t va)
   {
       pte_t *entry = pt_walk(va, NULL);

       BUG_ON(!pte_is_mapping(*entry));

       return mfn_from_pte(*entry);
   }

   #define vmap_to_mfn(va)     vmap_to_mfn_((vaddr_t)va)mfn_from_pte

what leads to including of <asm/page.h> in <asm/mm.h>.

As an option, if to move the following to <asm/page.h>:
   #define vmap_to_mfn(va)     vmap_to_mfn_((vaddr_t)va)
   #define vmap_to_page(va)    mfn_to_page(vmap_to_mfn(va))
the circular dependency could be dropped.

> Also nit: Excess blank after the first *.
>
>> --- a/xen/arch/riscv/pt.c
>> +++ b/xen/arch/riscv/pt.c
>> @@ -274,6 +274,61 @@ static int pt_update_entry(mfn_t root, vaddr_t virt,
>>       return rc;
>>   }
>>   
>> +/*
>> + * pt_walk() performs software page table walking and returns the pte_t of
>> + * a leaf node or the leaf-most not-present pte_t if no leaf node is found
>> + * for further analysis.
>> + * Additionally, pt_walk() returns the level of the found pte.
>> + */
>> +pte_t * pt_walk(vaddr_t va, unsigned int *pte_level)
> See nit above.
>
>> +{
>> +    const mfn_t root = get_root_page();
>> +    /*
>> +     * In pt_walk() only XEN_TABLE_MAP_NONE and XEN_TABLE_SUPER_PAGE are
>> +     * handled (as they are only possible for page table walking), so
>> +     * initialize `ret` with "impossible" XEN_TABLE_MAP_NOMEM.
>> +     */
>> +    int ret = XEN_TABLE_MAP_NOMEM;
>> +    unsigned int level = HYP_PT_ROOT_LEVEL;
> With this initialization and ...
>
>> +    pte_t *table;
>> +
>> +    DECLARE_OFFSETS(offsets, va);
>> +
>> +    table = map_table(root);
>> +
>> +    /*
>> +     * Find `table` of an entry which corresponds to `va` by iterating for each
>> +     * page level and checking if the entry points to a next page table or
>> +     * to a page.
>> +     *
>> +     * Two cases are possible:
>> +     * - ret == XEN_TABLE_SUPER_PAGE means that the entry was find;
> (nit: found)
>
>> +     *   (Despite the name) XEN_TABLE_SUPER_PAGE also covers 4K mappings. If
>> +     *   pt_next_level() is called for page table level 0, it results in the
>> +     *   entry being a pointer to a leaf node, thereby returning
>> +     *   XEN_TABLE_SUPER_PAGE, despite of the fact this leaf covers 4k mapping.
>> +     * - ret == XEN_TABLE_MAP_NONE means that requested `va` wasn't actually
>> +     *   mapped.
>> +     */
>> +    while ( (ret != XEN_TABLE_MAP_NONE) && (ret != XEN_TABLE_SUPER_PAGE) )
>> +    {
>> +        /*
>> +         * This case shouldn't really occur as it will mean that for table
>> +         * level 0 a pointer to next page table has been written, but at
>> +         * level 0 it could be only a pointer to 4k page.
>> +         */
>> +        ASSERT(level <= HYP_PT_ROOT_LEVEL);
>> +
>> +        ret = pt_next_level(false, &table, offsets[level]);
>> +        level--;
> ... this being the only updating of the variable, what are the assertion and
> accompanying comment about? What you're rather at risk of is for level to
> wrap around through 0. In fact I think it does, ...
>
>> +    }
>> +
>> +    if ( pte_level )
>> +        *pte_level = level + 1;
>> +
>> +    return table + offsets[level + 1];
>> +}
> ... which you account for by adding 1 in both of the places here. Don't you
> think that it would be better to avoid such, e.g.:
>
>      for ( level = HYP_PT_ROOT_LEVEL; ; --level )
>      {
>          int ret = pt_next_level(false, &table, offsets[level]);
>
>          if ( ret == XEN_TABLE_MAP_NONE || ret == XEN_TABLE_SUPER_PAGE )
>              break;
>          ASSERT(level);
>      }
>
> or
>
>      for ( level = CONFIG_PAGING_LEVELS; level--; )
>      {
>          int ret = pt_next_level(false, &table, offsets[level]);
>
>          if ( ret == XEN_TABLE_MAP_NONE || ret == XEN_TABLE_SUPER_PAGE )
>              break;
>      }
>
> This then also avoids the oddity about ret's initializer.

We can do in the way you suggested, it is more clear. I will go with the second option.

Thanks.

~ Oleksii

--------------AbFcnfhXb2jTV4nSD2k7Gg08
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
    <div class="moz-cite-prefix">On 2/4/25 2:50 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:475fc7fc-87ab-493e-8bef-eddeaa64aa54@suse.com">
      <pre wrap="" class="moz-quote-pre">On 03.02.2025 14:12, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -156,6 +156,10 @@ static inline struct page_info *virt_to_page(const void *v)
     return frametable_virt_start + PFN_DOWN(va - directmap_virt_start);
 }
 
+#include &lt;asm/page.h&gt;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
asm/page.h already includes asm/mm.h, so you're introducing a circular
dependency here (much of which the patch description is about, so it's
unclear why you didn't solve this another way). Afaict ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+pte_t * pt_walk(vaddr_t va, unsigned int *pte_level);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... it's pte_t that presents a problem here. Why not simply put the
declaration in asm/page.h (and drop all the secondary changes that
don't really belong in this patch anyway)?</pre>
    </blockquote>
    <pre>In the patch 2 it is used for implementing vmap_to_mfn():</pre>
    <pre>  static inline mfn_t vmap_to_mfn_(vaddr_t va)
  {
      pte_t *entry = pt_walk(va, NULL);

      BUG_ON(!pte_is_mapping(*entry));

      return mfn_from_pte(*entry);
  }

  #define vmap_to_mfn(va)     vmap_to_mfn_((vaddr_t)va)mfn_from_pte</pre>
    <pre>what leads to including of &lt;asm/page.h&gt; in &lt;asm/mm.h&gt;.

As an option, if to move the following to &lt;asm/page.h&gt;:
  #define vmap_to_mfn(va)     vmap_to_mfn_((vaddr_t)va)
  #define vmap_to_page(va)    mfn_to_page(vmap_to_mfn(va))
the circular dependency could be dropped.

</pre>
    <blockquote type="cite"
      cite="mid:475fc7fc-87ab-493e-8bef-eddeaa64aa54@suse.com">
      <pre wrap="" class="moz-quote-pre">
Also nit: Excess blank after the first *.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/pt.c
+++ b/xen/arch/riscv/pt.c
@@ -274,6 +274,61 @@ static int pt_update_entry(mfn_t root, vaddr_t virt,
     return rc;
 }
 
+/*
+ * pt_walk() performs software page table walking and returns the pte_t of
+ * a leaf node or the leaf-most not-present pte_t if no leaf node is found
+ * for further analysis.
+ * Additionally, pt_walk() returns the level of the found pte.
+ */
+pte_t * pt_walk(vaddr_t va, unsigned int *pte_level)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
See nit above.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+{
+    const mfn_t root = get_root_page();
+    /*
+     * In pt_walk() only XEN_TABLE_MAP_NONE and XEN_TABLE_SUPER_PAGE are
+     * handled (as they are only possible for page table walking), so
+     * initialize `ret` with "impossible" XEN_TABLE_MAP_NOMEM.
+     */
+    int ret = XEN_TABLE_MAP_NOMEM;
+    unsigned int level = HYP_PT_ROOT_LEVEL;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
With this initialization and ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    pte_t *table;
+
+    DECLARE_OFFSETS(offsets, va);
+
+    table = map_table(root);
+
+    /*
+     * Find `table` of an entry which corresponds to `va` by iterating for each
+     * page level and checking if the entry points to a next page table or
+     * to a page.
+     *
+     * Two cases are possible:
+     * - ret == XEN_TABLE_SUPER_PAGE means that the entry was find;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
(nit: found)

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+     *   (Despite the name) XEN_TABLE_SUPER_PAGE also covers 4K mappings. If
+     *   pt_next_level() is called for page table level 0, it results in the
+     *   entry being a pointer to a leaf node, thereby returning
+     *   XEN_TABLE_SUPER_PAGE, despite of the fact this leaf covers 4k mapping.
+     * - ret == XEN_TABLE_MAP_NONE means that requested `va` wasn't actually
+     *   mapped.
+     */
+    while ( (ret != XEN_TABLE_MAP_NONE) &amp;&amp; (ret != XEN_TABLE_SUPER_PAGE) )
+    {
+        /*
+         * This case shouldn't really occur as it will mean that for table
+         * level 0 a pointer to next page table has been written, but at
+         * level 0 it could be only a pointer to 4k page.
+         */
+        ASSERT(level &lt;= HYP_PT_ROOT_LEVEL);
+
+        ret = pt_next_level(false, &amp;table, offsets[level]);
+        level--;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... this being the only updating of the variable, what are the assertion and
accompanying comment about? What you're rather at risk of is for level to
wrap around through 0. In fact I think it does, ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    }
+
+    if ( pte_level )
+        *pte_level = level + 1;
+
+    return table + offsets[level + 1];
+}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... which you account for by adding 1 in both of the places here. Don't you
think that it would be better to avoid such, e.g.:

    for ( level = HYP_PT_ROOT_LEVEL; ; --level )
    {
        int ret = pt_next_level(false, &amp;table, offsets[level]);

        if ( ret == XEN_TABLE_MAP_NONE || ret == XEN_TABLE_SUPER_PAGE )
            break;
        ASSERT(level);
    } 

or

    for ( level = CONFIG_PAGING_LEVELS; level--; )
    {
        int ret = pt_next_level(false, &amp;table, offsets[level]);

        if ( ret == XEN_TABLE_MAP_NONE || ret == XEN_TABLE_SUPER_PAGE )
            break;
    } 

This then also avoids the oddity about ret's initializer.</pre>
    </blockquote>
    <pre>We can do in the way you suggested, it is more clear. I will go with the second option.

Thanks.

~ Oleksii
</pre>
  </body>
</html>

--------------AbFcnfhXb2jTV4nSD2k7Gg08--

