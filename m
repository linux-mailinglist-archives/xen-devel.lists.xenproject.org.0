Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C79D8B20D71
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 17:19:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077734.1438766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulUIk-0006RA-Pc; Mon, 11 Aug 2025 15:19:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077734.1438766; Mon, 11 Aug 2025 15:19:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulUIk-0006Pk-LC; Mon, 11 Aug 2025 15:19:06 +0000
Received: by outflank-mailman (input) for mailman id 1077734;
 Mon, 11 Aug 2025 15:19:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MOyo=2X=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ulUIi-0006Pe-Lg
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 15:19:04 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8389974b-76c6-11f0-a325-13f23c93f187;
 Mon, 11 Aug 2025 17:19:03 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-605b9488c28so7949425a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 08:19:03 -0700 (PDT)
Received: from [192.168.1.17] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a911567fsm18232723a12.61.2025.08.11.08.19.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 08:19:02 -0700 (PDT)
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
X-Inumbo-ID: 8389974b-76c6-11f0-a325-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754925543; x=1755530343; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5VSUpEHUUMjWYlJ08GVQz7+Yhi7mO9arUSHs7DQTdM4=;
        b=ZAvWpkYyktyM9ptJzt8VHhifKq44Vl4gDBWarIce+2KoLgBQYIMCWBbnsyeGW7cIaM
         NO8YGbkHnHx01g9EpK/whzwGI9AaYZSqEUb9qYvasZd6nozKmARrZUOhhy88/cQEsmGf
         Gqt4K7lCivGC1ZKJpDfLPZ8werAmk6tgWk+3pB8vl96TFy2Kzm30t74ibkuH2xXvDUt4
         zjQjD2BMC+Ip7E1G58P/9ACXFezm9oN72XJwuI4EOd0idnWdtFpDt/ZmS1RQoIQQh4vl
         Kg8DofjAP5zKOJ2IiXKHw4dE8/GOnbjP2kPpk9zCbXpW3E2Az2gaYJlab/bxspNURRUn
         ckhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754925543; x=1755530343;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5VSUpEHUUMjWYlJ08GVQz7+Yhi7mO9arUSHs7DQTdM4=;
        b=VHkjXV03cgYC/NMyDOBv3wwCpPPBuljllndpjVldd/bInPR4cjZe2W84V39RpV1Up1
         KzKdtJebITExx5qSzR5ChHmTWmzPtTKxgS9cYvq51G8gV7uhPLgwrzezOmMswP5yBn+W
         Q0Ft8coFPK7Vz8od8InRYHLHWqoIJBLIgg5kAsrlGMf05Y6IVEdkCCJnnL2uT+WjWkNr
         MG1nWoja529stdgOuQff3Z87/tKGHL+7W42P57Mw1kFeUpt9QXgvu/qOjeO8/NT8GMM8
         Rn8cpW8sZSPB8hVy6SP6hxqBYr4Yd8ASjnqnKoikWO/8DEJA512zLYxfG+QSXgV3OfL7
         1eIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoTWkkqIZTy4kisP9fC0OV5z7Bi2/TIUapj7x+/5RZTJfIDzwVGdPACrRAgfpkmOBCGBQn+zytv3Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwMHDNVURAEsNPBOrcVvWxCQEPom+GGW0edXGzBEgu6en3iJUE6
	fJWBRVWG5TGbvJC+nAUUm+Xzp1qlmp+MuzVxXlLQH5FREQ07+ntTxuba
X-Gm-Gg: ASbGncv+on8NuCjFaGFJ+ls4TFw79oJtgcaipWreWk2Vp8xv8dOmENufA09OjuHRKAI
	jccm1GvOFgPcMS0kh3fKgBY1vYXqAfO5QLeH9hJPU6XZEGl6K5Yq0GmXSrlJX/9hqcWaISFw1PI
	M0e8+Z+a/PiOW8ctvaR/nma5HU65UiwDJChVkPz7Ari7BZKOc8WQ8FyHQkjewY7A++xhLnWpx7e
	GjRkdfvdkG40rGzkk/JNxNNXyUD/i5Y/5PMpnvdDLVLsHRkNcDWrt6WxQefkv2CeJbFebxHn3Pd
	4Tz8RXX7++RwihCkQJBZjrym5B8meAR6X2ugmIOxKMit6AgsR+PxHiXGCZvUyIovtoHTABEijZc
	yNo92pvUOY+ZUT71ToXbsWYGbJ4yMxr3RjGhiyGRlbQgcH4oOJ8cVD8VL/9xYcDc4Jf3a1CaF
X-Google-Smtp-Source: AGHT+IFhU1dQDps2lbZ7QqIRlgjSrPJWJO1bn7+On+fvl/P6pLmExLOVBAt3W76jr+Y9xTSN9KWNuA==
X-Received: by 2002:a05:6402:4416:b0:617:d013:74a with SMTP id 4fb4d7f45d1cf-617e2bf8713mr12894643a12.4.1754925542434;
        Mon, 11 Aug 2025 08:19:02 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------wMBQ7AGjueSMXPSR5FEb2k5o"
Message-ID: <adc9689b-a3e2-47fb-a8ed-6481371c751d@gmail.com>
Date: Mon, 11 Aug 2025 17:19:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/20] xen/riscv: Implement superpage splitting for p2m
 mappings
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <6890f77e577493194ea94834989dc0841d18eed0.1753973161.git.oleksii.kurochko@gmail.com>
 <cc0fd91c-2dd1-4094-997a-87856f6cd914@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <cc0fd91c-2dd1-4094-997a-87856f6cd914@suse.com>

This is a multi-part message in MIME format.
--------------wMBQ7AGjueSMXPSR5FEb2k5o
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 8/11/25 1:59 PM, Jan Beulich wrote:
> On 31.07.2025 17:58, Oleksii Kurochko wrote:
>> Add support for down large memory mappings ("superpages") in the RISC-V
>> p2m mapping so that smaller, more precise mappings ("finer-grained entries")
>> can be inserted into lower levels of the page table hierarchy.
>>
>> To implement that the following is done:
>> - Introduce p2m_split_superpage(): Recursively shatters a superpage into
>>    smaller page table entries down to the target level, preserving original
>>    permissions and attributes.
>> - p2m_set_entry() updated to invoke superpage splitting when inserting
>>    entries at lower levels within a superpage-mapped region.
>>
>> This implementation is based on the ARM code, with modifications to the part
>> that follows the BBM (break-before-make) approach, some parts are simplified
>> as according to RISC-V spec:
>>    It is permitted for multiple address-translation cache entries to co-exist
>>    for the same address. This represents the fact that in a conventional
>>    TLB hierarchy, it is possible for multiple entries to match a single
>>    address if, for example, a page is upgraded to a superpage without first
>>    clearing the original non-leaf PTE’s valid bit and executing an SFENCE.VMA
>>    with rs1=x0, or if multiple TLBs exist in parallel at a given level of the
>>    hierarchy. In this case, just as if an SFENCE.VMA is not executed between
>>    a write to the memory-management tables and subsequent implicit read of the
>>    same address: it is unpredictable whether the old non-leaf PTE or the new
>>    leaf PTE is used, but the behavior is otherwise well defined.
>> In contrast to the Arm architecture, where BBM is mandatory and failing to
>> use it in some cases can lead to CPU instability, RISC-V guarantees
>> stability, and the behavior remains safe — though unpredictable in terms of
>> which translation will be used.
>>
>> Additionally, the page table walk logic has been adjusted, as ARM uses the
>> opposite number of levels compared to RISC-V.
> As before, I think you mean "numbering".

Yes, level numbering would be better.

>
>> --- a/xen/arch/riscv/p2m.c
>> +++ b/xen/arch/riscv/p2m.c
>> @@ -539,6 +539,91 @@ static void p2m_free_subtree(struct p2m_domain *p2m,
>>       p2m_free_page(p2m, pg);
>>   }
>>   
>> +static bool p2m_split_superpage(struct p2m_domain *p2m, pte_t *entry,
>> +                                unsigned int level, unsigned int target,
>> +                                const unsigned int *offsets)
>> +{
>> +    struct page_info *page;
>> +    unsigned long i;
>> +    pte_t pte, *table;
>> +    bool rv = true;
>> +
>> +    /* Convenience aliases */
>> +    mfn_t mfn = pte_get_mfn(*entry);
>> +    unsigned int next_level = level - 1;
>> +    unsigned int level_order = XEN_PT_LEVEL_ORDER(next_level);
>> +
>> +    /*
>> +     * This should only be called with target != level and the entry is
>> +     * a superpage.
>> +     */
>> +    ASSERT(level > target);
>> +    ASSERT(pte_is_superpage(*entry, level));
>> +
>> +    page = p2m_alloc_page(p2m->domain);
>> +    if ( !page )
>> +    {
>> +        /*
>> +         * The caller is in charge to free the sub-tree.
>> +         * As we didn't manage to allocate anything, just tell the
>> +         * caller there is nothing to free by invalidating the PTE.
>> +         */
>> +        memset(entry, 0, sizeof(*entry));
>> +        return false;
>> +    }
>> +
>> +    table = __map_domain_page(page);
>> +
>> +    /*
>> +     * We are either splitting a second level 1G page into 512 first level
>> +     * 2M pages, or a first level 2M page into 512 zero level 4K pages.
>> +     */
> Such a comment is at risk of (silently) going stale when support for 512G
> mappings is added. I wonder if it's really that informative to have here.

Good point, I think we could really drop it.
Regarding support for 512G mappings. Is it really make sense to support
such big mappings? It seems like some operations as splitting or sub-entry
freeing could be pretty long under some circumstances.

>
>> +    for ( i = 0; i < XEN_PT_ENTRIES; i++ )
>> +    {
>> +        pte_t *new_entry = table + i;
>> +
>> +        /*
>> +         * Use the content of the superpage entry and override
>> +         * the necessary fields. So the correct permission are kept.
>> +         */
> It's not just permissions though? The memory type field also needs
> retaining (and is being retained this way). Maybe better say "attributes"?

Sure, I'll use "attributes" instead.

Thanks.

~ Oleksii

--------------wMBQ7AGjueSMXPSR5FEb2k5o
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
    <div class="moz-cite-prefix">On 8/11/25 1:59 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:cc0fd91c-2dd1-4094-997a-87856f6cd914@suse.com">
      <pre wrap="" class="moz-quote-pre">On 31.07.2025 17:58, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Add support for down large memory mappings ("superpages") in the RISC-V
p2m mapping so that smaller, more precise mappings ("finer-grained entries")
can be inserted into lower levels of the page table hierarchy.

To implement that the following is done:
- Introduce p2m_split_superpage(): Recursively shatters a superpage into
  smaller page table entries down to the target level, preserving original
  permissions and attributes.
- p2m_set_entry() updated to invoke superpage splitting when inserting
  entries at lower levels within a superpage-mapped region.

This implementation is based on the ARM code, with modifications to the part
that follows the BBM (break-before-make) approach, some parts are simplified
as according to RISC-V spec:
  It is permitted for multiple address-translation cache entries to co-exist
  for the same address. This represents the fact that in a conventional
  TLB hierarchy, it is possible for multiple entries to match a single
  address if, for example, a page is upgraded to a superpage without first
  clearing the original non-leaf PTE’s valid bit and executing an SFENCE.VMA
  with rs1=x0, or if multiple TLBs exist in parallel at a given level of the
  hierarchy. In this case, just as if an SFENCE.VMA is not executed between
  a write to the memory-management tables and subsequent implicit read of the
  same address: it is unpredictable whether the old non-leaf PTE or the new
  leaf PTE is used, but the behavior is otherwise well defined.
In contrast to the Arm architecture, where BBM is mandatory and failing to
use it in some cases can lead to CPU instability, RISC-V guarantees
stability, and the behavior remains safe — though unpredictable in terms of
which translation will be used.

Additionally, the page table walk logic has been adjusted, as ARM uses the
opposite number of levels compared to RISC-V.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
As before, I think you mean "numbering".</pre>
    </blockquote>
    <pre>Yes, level numbering would be better.

</pre>
    <blockquote type="cite"
      cite="mid:cc0fd91c-2dd1-4094-997a-87856f6cd914@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -539,6 +539,91 @@ static void p2m_free_subtree(struct p2m_domain *p2m,
     p2m_free_page(p2m, pg);
 }
 
+static bool p2m_split_superpage(struct p2m_domain *p2m, pte_t *entry,
+                                unsigned int level, unsigned int target,
+                                const unsigned int *offsets)
+{
+    struct page_info *page;
+    unsigned long i;
+    pte_t pte, *table;
+    bool rv = true;
+
+    /* Convenience aliases */
+    mfn_t mfn = pte_get_mfn(*entry);
+    unsigned int next_level = level - 1;
+    unsigned int level_order = XEN_PT_LEVEL_ORDER(next_level);
+
+    /*
+     * This should only be called with target != level and the entry is
+     * a superpage.
+     */
+    ASSERT(level &gt; target);
+    ASSERT(pte_is_superpage(*entry, level));
+
+    page = p2m_alloc_page(p2m-&gt;domain);
+    if ( !page )
+    {
+        /*
+         * The caller is in charge to free the sub-tree.
+         * As we didn't manage to allocate anything, just tell the
+         * caller there is nothing to free by invalidating the PTE.
+         */
+        memset(entry, 0, sizeof(*entry));
+        return false;
+    }
+
+    table = __map_domain_page(page);
+
+    /*
+     * We are either splitting a second level 1G page into 512 first level
+     * 2M pages, or a first level 2M page into 512 zero level 4K pages.
+     */
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Such a comment is at risk of (silently) going stale when support for 512G
mappings is added. I wonder if it's really that informative to have here.</pre>
    </blockquote>
    <pre>Good point, I think we could really drop it.
Regarding support for 512G mappings. Is it really make sense to support
such big mappings? It seems like some operations as splitting or sub-entry
freeing could be pretty long under some circumstances.

</pre>
    <blockquote type="cite"
      cite="mid:cc0fd91c-2dd1-4094-997a-87856f6cd914@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    for ( i = 0; i &lt; XEN_PT_ENTRIES; i++ )
+    {
+        pte_t *new_entry = table + i;
+
+        /*
+         * Use the content of the superpage entry and override
+         * the necessary fields. So the correct permission are kept.
+         */
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
It's not just permissions though? The memory type field also needs
retaining (and is being retained this way). Maybe better say "attributes"?</pre>
    </blockquote>
    <pre>Sure, I'll use "attributes" instead.

Thanks.

~ Oleksii
</pre>
  </body>
</html>

--------------wMBQ7AGjueSMXPSR5FEb2k5o--

