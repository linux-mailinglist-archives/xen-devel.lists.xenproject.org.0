Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5654CC63D86
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 12:37:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1163608.1490688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKxX9-0002JE-1T; Mon, 17 Nov 2025 11:36:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1163608.1490688; Mon, 17 Nov 2025 11:36:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKxX8-0002HQ-Uw; Mon, 17 Nov 2025 11:36:34 +0000
Received: by outflank-mailman (input) for mailman id 1163608;
 Mon, 17 Nov 2025 11:36:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lv5t=5Z=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vKxX7-0002HK-R9
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 11:36:33 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa7f06d0-c3a9-11f0-9d18-b5c5bf9af7f9;
 Mon, 17 Nov 2025 12:36:32 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-6419aaced59so5772184a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 03:36:32 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a3d87e3sm9920032a12.7.2025.11.17.03.36.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 03:36:31 -0800 (PST)
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
X-Inumbo-ID: aa7f06d0-c3a9-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763379392; x=1763984192; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h+w5skDQjQKPpKBD0D07sikY/lh5cTebhvCbmA3IOh8=;
        b=Lp50/r0MmjQXz116Y8gg6Vrf4TVz/yuH3mue5ZWNUi3YTxKptuvlkB1cj7hpawji/q
         kpXAi81CTyCahR5NYKfNSuP2PJB9ygryf0ltEnPRBblSXcXbHx2CF40AnOItyF+X6+BZ
         348OETakjmUUYRZ4Y8AXzKSfGf8Z0ggbh7xZxDdzoDJxEm5K1lQ9tu9xqPyZ6kMfczkL
         OoruN3Bb3b+1Sd+6di2ozOslHY8dr6IItfH01U6FAVYzuedifiuHhMJne/b1nlfbE1EH
         B/AsYXsyKbc1yChLOkMBD0jQOHLhOEB5LrqXOruNnvtCVfRuJI4ThFAW53KHzYTyiYBa
         eCGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763379392; x=1763984192;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h+w5skDQjQKPpKBD0D07sikY/lh5cTebhvCbmA3IOh8=;
        b=apFzIWvDbeqc22cx4QrsTo4LlPSHkVR8s8fUgvh4mV9PVHHQWeeDOFI4A5UJAOYEu+
         ZpLU1qTN7rRqLNBRZUUuDbrtCT6Ed5/YI1pxyosxKV9l7OU3PTW5wrHU0C1Zmgszt2rc
         AlbbCrcxY2ynnLAJ0HPrrXwSRaxmZv16FveWqWwdPTr2uMLFFJWRfWThWbZbH/s+XE3c
         q4U3QrjwvEul7b1xsKpnzt0WZDUNNAocHtn7i881KH9CdKT4h3tztTNbdOHrO6P/63X+
         k0gegQEbCtPApbG2TkyELwigSsjB2cZVTNDYw7Htw26JcPprZlxi02q3PbEHuo033vWO
         agfA==
X-Forwarded-Encrypted: i=1; AJvYcCVhur9MyBgRjB7qq1VwbiErqJs1mrpwHoZGu15IxM+x1/kTHV/2WyYLw3xQlHLNW2zSIldkXNu+2gQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywgdx0TnjsH+pvz2N60C00eSufnUviriz44b+nRAMLkcNNSMVbv
	Z0UZl+zGadwDVJxwJZsQTlMUZmyBOWDkH1reLJu3aQfSbJqFVGBA0GWs
X-Gm-Gg: ASbGncscMrm2hHmbPoyfWwX0Mw9CKEMtA6nbbws7XYeychi/azsay3h5IOajCPk/I3o
	rnttFndJSmzPPcdnN/sifTofrVWKop0p220JkfHN3d0VVJukuiE3SI2ZtVA32w5THiD92vvS3lV
	CJifgDeW8bdpgFdZ3G6PUN6WVO1XH+KfSn2b0P1RWymA5k2Pm1GCNF1GtSJa2DA2QrQvGdNbxmo
	OPldWhATo7VpsTcQxHXw3IGAnRIOlOhq/PYZ44GRSBEl9ssmJTwsBPkWDSOWqTgkVLTKBrJznZ4
	XPOnCvJR837pNbT2t2lHK946BrhUviAqPTZZQKtZ+y2XR1rpq/7LT6YR4r7pTULDunWiks2pBTN
	JFxVuRoRGfElYQF+YZymFnROTX+8X98mvDhp2eVCeniN/9LMiyXN2gmeVZERn6NVjJMqDIsBn3J
	mFOkG/9RfQB9zNFF9B6vL8dsQmBT6Iml6sVzFBsIoEGoWmmN4QKJkt1mJKX6wU
X-Google-Smtp-Source: AGHT+IEOw+aMZAAYW9aax9h93sTsrEiv2K4qI3LLkgIOr/8lbTLqC5JaYw9YphhWVI62M0Na4L6TnA==
X-Received: by 2002:a05:6402:848:b0:640:b814:bb81 with SMTP id 4fb4d7f45d1cf-64350ebd23dmr12241316a12.32.1763379391684;
        Mon, 17 Nov 2025 03:36:31 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------V6mKv6hgrgibcKtaBVf7Ty0a"
Message-ID: <6eb7b19e-df55-4706-9da2-67158640aa08@gmail.com>
Date: Mon, 17 Nov 2025 12:36:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for 4.22 v5 11/18] xen/riscv: Implement p2m_free_subtree() and
 related helpers
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1760974017.git.oleksii.kurochko@gmail.com>
 <24928a25f63f81ee72b78830306881b2c4c5a1e4.1760974017.git.oleksii.kurochko@gmail.com>
 <acf32e9d-4c07-45dd-baac-29e6d93cff56@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <acf32e9d-4c07-45dd-baac-29e6d93cff56@suse.com>

This is a multi-part message in MIME format.
--------------V6mKv6hgrgibcKtaBVf7Ty0a
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/10/25 4:29 PM, Jan Beulich wrote:
> On 20.10.2025 17:57, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/include/asm/p2m.h
>> +++ b/xen/arch/riscv/include/asm/p2m.h
>> @@ -110,6 +110,8 @@ typedef enum {
>>       p2m_mmio_direct_io, /* Read/write mapping of genuine Device MMIO area,
>>                              PTE_PBMT_IO will be used for such mappings */
>>       p2m_ext_storage,    /* Following types'll be stored outsude PTE bits: */
>> +    p2m_map_foreign_rw, /* Read/write RAM pages from foreign domain */
>> +    p2m_map_foreign_ro, /* Read-only RAM pages from foreign domain */
>>   
>>       /* Sentinel — not a real type, just a marker for comparison */
>>       p2m_first_external = p2m_ext_storage,
>> @@ -120,15 +122,28 @@ static inline p2m_type_t arch_dt_passthrough_p2m_type(void)
>>       return p2m_mmio_direct_io;
>>   }
>>   
>> +/*
>> + * Bits 8 and 9 are reserved for use by supervisor software;
>> + * the implementation shall ignore this field.
>> + * We are going to use to save in these bits frequently used types to avoid
>> + * get/set of a type from radix tree.
>> + */
>> +#define P2M_TYPE_PTE_BITS_MASK  0x300
> Better use PTE_RSW in place of the raw number?

It would be better, thanks.

>
>> --- a/xen/arch/riscv/p2m.c
>> +++ b/xen/arch/riscv/p2m.c
>> @@ -17,6 +17,8 @@
>>   #include <asm/riscv_encoding.h>
>>   #include <asm/vmid.h>
>>   
>> +#define P2M_SUPPORTED_LEVEL_MAPPING 2
> I fear without a comment it's left unclear what this is / represents.

Probably just renaming it to|P2M_MAX_SUPPORTED_LEVEL_MAPPING| would make it clearer,
wouldn’t it?
Otherwise, I can add the following comment:
/*
  * At the moment, only 4K, 2M, and 1G mappings are supported for G-stage
  * translation. Therefore, the maximum supported page-table level is 2,
  * which corresponds to 1G mappings.
  */



>
>> @@ -403,11 +415,147 @@ static int p2m_next_level(struct p2m_domain *p2m, bool alloc_tbl,
>>       return P2M_TABLE_MAP_NONE;
>>   }
>>   
>> +static void p2m_put_foreign_page(struct page_info *pg)
>> +{
>> +    /*
>> +     * It’s safe to call put_page() here because arch_flush_tlb_mask()
>> +     * will be invoked if the page is reallocated, which will trigger a
>> +     * flush of the guest TLBs.
>> +     */
>> +    put_page(pg);
>> +}
>> +
>> +/* Put any references on the single 4K page referenced by mfn. */
> To me this and ...
>
>> +static void p2m_put_4k_page(mfn_t mfn, p2m_type_t type)
>> +{
>> +    /* TODO: Handle other p2m types */
>> +
>> +    if ( p2m_is_foreign(type) )
>> +    {
>> +        ASSERT(mfn_valid(mfn));
>> +        p2m_put_foreign_page(mfn_to_page(mfn));
>> +    }
>> +}
>> +
>> +/* Put any references on the superpage referenced by mfn. */
> ... to a lesser degree this comment are potentially misleading. Down here at
> least there is something plural-ish (the 4k pages that the 2M one consists
> of), but especially for the single page case above "any" could easily mean
> "anything that's still outstanding, anywhere". I'm also not quite sure "on"
> is really what you mean (I'm not a native speaker, so my gut feeling may be
> wrong here).

Then I could suggest the following instead:
   /* Put the reference associated with the 4K page identified by mfn. */
and
  /* Put the references associated with the superpage identified by mfn. */

I think the comments could be omitted, since the function names already make
this clear.

>
>> +static void p2m_put_2m_superpage(mfn_t mfn, p2m_type_t type)
>> +{
>> +    struct page_info *pg;
>> +    unsigned int i;
>> +
>> +    /*
>> +     * TODO: Handle other p2m types, but be aware that any changes to handle
>> +     * different types should require an update on the relinquish code to
>> +     * handle preemption.
>> +     */
> I guess if I was to address this TODO, I wouldn't know what the latter part
> of the sentence is warning me of.

It is referencing to the code which isn't introduced yet, something like Arm has
in|relinquish_p2m_mapping()|:
   https://gitlab.com/xen-project/xen/-/blob/staging/xen/arch/arm/mmu/p2m.c#L1588
I am not 100% sure that this comment is useful now (as|relinquish_p2m_mapping() isn't introduced yet), so I am okay just to 
drop it and add it when ||relinquish_p2m_mapping() will be introduced.|


>
>> +    if ( !p2m_is_foreign(type) )
>> +        return;
> Are super-page foreign mappings actually intended to be permitted, conceptually?

Good question. Conceptually, yes (and I thought that was the reason why ARM has
code to handle such cases and so I decided to have the same for RISC-V), but in
reality, it will be 4 KB pages, as I can see in the current codebase for other
architectures.

>
>>   /* Free pte sub-tree behind an entry */
>>   static void p2m_free_subtree(struct p2m_domain *p2m,
>>                                pte_t entry, unsigned int level)
>>   {
>> -    panic("%s: hasn't been implemented yet\n", __func__);
>> +    unsigned int i;
>> +    pte_t *table;
>> +    mfn_t mfn;
>> +    struct page_info *pg;
>> +
>> +    /*
>> +     * Check if the level is valid: only 4K - 2M - 1G mappings are supported.
>> +     * To support levels > 2, the implementation of p2m_free_subtree() would
>> +     * need to be updated, as the current recursive approach could consume
>> +     * excessive time and memory.
>> +     */
>> +    ASSERT(level <= P2M_SUPPORTED_LEVEL_MAPPING);
>> +
>> +    /* Nothing to do if the entry is invalid. */
>> +    if ( !pte_is_valid(entry) )
>> +        return;
>> +
>> +    if ( (level == 0) || pte_is_superpage(entry, level) )
> Considering what pte_is_superpage() expands to, simply pte_is_mapping()?

Makes sense, we can really just have:
  if ( pte_is_mapping(entry) )

>
>> +    {
>> +        p2m_type_t p2mt = p2m_get_type(entry);
>> +
>> +#ifdef CONFIG_IOREQ_SERVER
>> +        /*
>> +         * If this gets called then either the entry was replaced by an entry
>> +         * with a different base (valid case) or the shattering of a superpage
>> +         * has failed (error case).
>> +         * So, at worst, the spurious mapcache invalidation might be sent.
>> +         */
>> +        if ( p2m_is_ram(p2mt) &&
>> +             domain_has_ioreq_server(p2m->domain) )
>> +            ioreq_request_mapcache_invalidate(p2m->domain);
>> +#endif
>> +
>> +        p2m_put_page(entry, level, p2mt);
>> +
>> +        return;
>> +    }
>> +
>> +    table = map_domain_page(pte_get_mfn(entry));
>> +    for ( i = 0; i < P2M_PAGETABLE_ENTRIES(level); i++ )
>> +        p2m_free_subtree(p2m, table[i], level - 1);
>> +
>> +    unmap_domain_page(table);
> Please can the use of blank lines in such cases be symmetric: Either have them
> ahead of and after the loop, or have them nowhere?
>
>> @@ -435,7 +583,7 @@ static int p2m_set_entry(struct p2m_domain *p2m,
>>        * Check if the level target is valid: we only support
>>        * 4K - 2M - 1G mapping.
>>        */
>> -    ASSERT(target <= 2);
>> +    ASSERT(target <= P2M_SUPPORTED_LEVEL_MAPPING);
> Ah, this is where that constant comes into play. It wants moving to the earlier
> patch, and with this being the purpose I guess it also wants to include MAX in
> its name.

Regarding MAX it is what I came up to in my reply somewhere above, so then lets
just add "MAX".

~ Oleksii

--------------V6mKv6hgrgibcKtaBVf7Ty0a
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
    <div class="moz-cite-prefix">On 11/10/25 4:29 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:acf32e9d-4c07-45dd-baac-29e6d93cff56@suse.com">
      <pre wrap="" class="moz-quote-pre">On 20.10.2025 17:57, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -110,6 +110,8 @@ typedef enum {
     p2m_mmio_direct_io, /* Read/write mapping of genuine Device MMIO area,
                            PTE_PBMT_IO will be used for such mappings */
     p2m_ext_storage,    /* Following types'll be stored outsude PTE bits: */
+    p2m_map_foreign_rw, /* Read/write RAM pages from foreign domain */
+    p2m_map_foreign_ro, /* Read-only RAM pages from foreign domain */
 
     /* Sentinel — not a real type, just a marker for comparison */
     p2m_first_external = p2m_ext_storage,
@@ -120,15 +122,28 @@ static inline p2m_type_t arch_dt_passthrough_p2m_type(void)
     return p2m_mmio_direct_io;
 }
 
+/*
+ * Bits 8 and 9 are reserved for use by supervisor software;
+ * the implementation shall ignore this field.
+ * We are going to use to save in these bits frequently used types to avoid
+ * get/set of a type from radix tree.
+ */
+#define P2M_TYPE_PTE_BITS_MASK  0x300
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Better use PTE_RSW in place of the raw number?</pre>
    </blockquote>
    <pre>It would be better, thanks.

</pre>
    <blockquote type="cite"
      cite="mid:acf32e9d-4c07-45dd-baac-29e6d93cff56@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -17,6 +17,8 @@
 #include &lt;asm/riscv_encoding.h&gt;
 #include &lt;asm/vmid.h&gt;
 
+#define P2M_SUPPORTED_LEVEL_MAPPING 2
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I fear without a comment it's left unclear what this is / represents.</pre>
    </blockquote>
    <pre>Probably just renaming it to <code data-start="130"
    data-end="163">P2M_MAX_SUPPORTED_LEVEL_MAPPING</code> would make it clearer,
wouldn’t it?
Otherwise, I can add the following comment:
/*
 * At the moment, only 4K, 2M, and 1G mappings are supported for G-stage
 * translation. Therefore, the maximum supported page-table level is 2,
 * which corresponds to 1G mappings.
 */


</pre>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:acf32e9d-4c07-45dd-baac-29e6d93cff56@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -403,11 +415,147 @@ static int p2m_next_level(struct p2m_domain *p2m, bool alloc_tbl,
     return P2M_TABLE_MAP_NONE;
 }
 
+static void p2m_put_foreign_page(struct page_info *pg)
+{
+    /*
+     * It’s safe to call put_page() here because arch_flush_tlb_mask()
+     * will be invoked if the page is reallocated, which will trigger a
+     * flush of the guest TLBs.
+     */
+    put_page(pg);
+}
+
+/* Put any references on the single 4K page referenced by mfn. */
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
To me this and ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+static void p2m_put_4k_page(mfn_t mfn, p2m_type_t type)
+{
+    /* TODO: Handle other p2m types */
+
+    if ( p2m_is_foreign(type) )
+    {
+        ASSERT(mfn_valid(mfn));
+        p2m_put_foreign_page(mfn_to_page(mfn));
+    }
+}
+
+/* Put any references on the superpage referenced by mfn. */
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... to a lesser degree this comment are potentially misleading. Down here at
least there is something plural-ish (the 4k pages that the 2M one consists
of), but especially for the single page case above "any" could easily mean
"anything that's still outstanding, anywhere". I'm also not quite sure "on"
is really what you mean (I'm not a native speaker, so my gut feeling may be
wrong here).</pre>
    </blockquote>
    <pre>Then I could suggest the following instead:
  /* Put the reference associated with the 4K page identified by mfn. */
and
 /* Put the references associated with the superpage identified by mfn. */

I think the comments could be omitted, since the function names already make
this clear.

</pre>
    <blockquote type="cite"
      cite="mid:acf32e9d-4c07-45dd-baac-29e6d93cff56@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+static void p2m_put_2m_superpage(mfn_t mfn, p2m_type_t type)
+{
+    struct page_info *pg;
+    unsigned int i;
+
+    /*
+     * TODO: Handle other p2m types, but be aware that any changes to handle
+     * different types should require an update on the relinquish code to
+     * handle preemption.
+     */
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I guess if I was to address this TODO, I wouldn't know what the latter part
of the sentence is warning me of.</pre>
    </blockquote>
    <pre>It is referencing to the code which isn't introduced yet, something like Arm has
in <code>relinquish_p2m_mapping()</code>:
  <a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/xen/-/blob/staging/xen/arch/arm/mmu/p2m.c#L1588">https://gitlab.com/xen-project/xen/-/blob/staging/xen/arch/arm/mmu/p2m.c#L1588</a>
I am not 100% sure that this comment is useful now (as <code>relinquish_p2m_mapping()
isn't introduced yet), so I am okay just to drop it and add it when
</code><code>relinquish_p2m_mapping() will be introduced.</code></pre>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:acf32e9d-4c07-45dd-baac-29e6d93cff56@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    if ( !p2m_is_foreign(type) )
+        return;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Are super-page foreign mappings actually intended to be permitted, conceptually?</pre>
    </blockquote>
    <pre>Good question. Conceptually, yes (and I thought that was the reason why ARM has
code to handle such cases and so I decided to have the same for RISC-V), but in
reality, it will be 4 KB pages, as I can see in the current codebase for other
architectures.

</pre>
    <blockquote type="cite"
      cite="mid:acf32e9d-4c07-45dd-baac-29e6d93cff56@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> /* Free pte sub-tree behind an entry */
 static void p2m_free_subtree(struct p2m_domain *p2m,
                              pte_t entry, unsigned int level)
 {
-    panic("%s: hasn't been implemented yet\n", __func__);
+    unsigned int i;
+    pte_t *table;
+    mfn_t mfn;
+    struct page_info *pg;
+
+    /*
+     * Check if the level is valid: only 4K - 2M - 1G mappings are supported.
+     * To support levels &gt; 2, the implementation of p2m_free_subtree() would
+     * need to be updated, as the current recursive approach could consume
+     * excessive time and memory.
+     */
+    ASSERT(level &lt;= P2M_SUPPORTED_LEVEL_MAPPING);
+
+    /* Nothing to do if the entry is invalid. */
+    if ( !pte_is_valid(entry) )
+        return;
+
+    if ( (level == 0) || pte_is_superpage(entry, level) )
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Considering what pte_is_superpage() expands to, simply pte_is_mapping()?</pre>
    </blockquote>
    <pre>Makes sense, we can really just have:
 if ( pte_is_mapping(entry) )</pre>
    <blockquote type="cite"
      cite="mid:acf32e9d-4c07-45dd-baac-29e6d93cff56@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    {
+        p2m_type_t p2mt = p2m_get_type(entry);
+
+#ifdef CONFIG_IOREQ_SERVER
+        /*
+         * If this gets called then either the entry was replaced by an entry
+         * with a different base (valid case) or the shattering of a superpage
+         * has failed (error case).
+         * So, at worst, the spurious mapcache invalidation might be sent.
+         */
+        if ( p2m_is_ram(p2mt) &amp;&amp;
+             domain_has_ioreq_server(p2m-&gt;domain) )
+            ioreq_request_mapcache_invalidate(p2m-&gt;domain);
+#endif
+
+        p2m_put_page(entry, level, p2mt);
+
+        return;
+    }
+
+    table = map_domain_page(pte_get_mfn(entry));
+    for ( i = 0; i &lt; P2M_PAGETABLE_ENTRIES(level); i++ )
+        p2m_free_subtree(p2m, table[i], level - 1);
+
+    unmap_domain_page(table);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Please can the use of blank lines in such cases be symmetric: Either have them
ahead of and after the loop, or have them nowhere?

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -435,7 +583,7 @@ static int p2m_set_entry(struct p2m_domain *p2m,
      * Check if the level target is valid: we only support
      * 4K - 2M - 1G mapping.
      */
-    ASSERT(target &lt;= 2);
+    ASSERT(target &lt;= P2M_SUPPORTED_LEVEL_MAPPING);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Ah, this is where that constant comes into play. It wants moving to the earlier
patch, and with this being the purpose I guess it also wants to include MAX in
its name.</pre>
    </blockquote>
    <pre>Regarding MAX it is what I came up to in my reply somewhere above, so then lets
just add "MAX".

~ Oleksii</pre>
  </body>
</html>

--------------V6mKv6hgrgibcKtaBVf7Ty0a--

