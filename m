Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF00BA308D
	for <lists+xen-devel@lfdr.de>; Fri, 26 Sep 2025 10:59:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1131350.1470480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v24I8-0000nZ-VH; Fri, 26 Sep 2025 08:59:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1131350.1470480; Fri, 26 Sep 2025 08:59:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v24I8-0000kn-S3; Fri, 26 Sep 2025 08:59:00 +0000
Received: by outflank-mailman (input) for mailman id 1131350;
 Fri, 26 Sep 2025 08:58:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5CHW=4F=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v24I7-0000kh-FV
 for xen-devel@lists.xenproject.org; Fri, 26 Sep 2025 08:58:59 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 088781dd-9ab7-11f0-9809-7dc792cee155;
 Fri, 26 Sep 2025 10:58:56 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-6349e3578adso3450510a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Sep 2025 01:58:56 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-67-38.play-internet.pl.
 [109.243.67.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-634a3ae308bsm2621905a12.32.2025.09.26.01.58.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Sep 2025 01:58:54 -0700 (PDT)
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
X-Inumbo-ID: 088781dd-9ab7-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758877136; x=1759481936; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tll720uHDLhbRSVtbVJvGPYb5YUByEDNqKBzBwWkBwE=;
        b=S8MBFSRty3vT9leqQg6GBo6KD69ABxrwpIhfLItgjiEqH5gxcxfjFJJ/T9nAv3FZfO
         tAMF40+f5E4Ym2ZvEBWCc84cXQYDfBKQAeYRwcsWxJVhTyZ2F4d6EOv5/mU3xewDdI2L
         +PyxK9a7moUIedgcPcEopQCPMozOYJK85rMb2YnyOxneLhCOb14k39wIWoziyw1vJHOF
         MqbsHTTVflzaG/YCjzSbhtzHcqxI//0R8aLbyMnv2vUYLYcf9NSsaLo8NmQXyANaSRT8
         qBgMKKpfysGtj8Dskoy2qvg6kYy4qGQSBl/VnHLvt3QIum4Ayaxr/2T2Mzy6ihoPa5Bl
         5X2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758877136; x=1759481936;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tll720uHDLhbRSVtbVJvGPYb5YUByEDNqKBzBwWkBwE=;
        b=uufFR1BSYPeEbKBWTRc5duvkJMcHj8IytDu3sGtyIzwzohy0J5nVVFZsS7Jyu8RZVK
         xYc1tzh8sQ1CyCylnEhceIa3zuxRYDinpQFal6lNzt1OKAyBkKCS/FJUHWSUMNt3R4Z3
         PzoKdlAbMgeOeDz+Kgq49MII9x+288jAxlzGLM25rzYnSZa47bfGGZwtYBHh9mXJsO90
         lwhTKv17HJZc9oCLC6Is+wbBQRKFd298+PrdBASsLgM1vvbG77IKQNVExUE8Ddp0tsbc
         ctBDaqj6kA1NPGq0M/A3lM7SwzJ2/qjqtysrgsBmiJj9kR85qqdybP56HrlDTnKrBCZE
         n8gg==
X-Forwarded-Encrypted: i=1; AJvYcCXfaCWYOJt3G+tQyjWVcq8UocXyfgv7o8xzJhqlis19oYbxyCTmsFz4T57mcj5gDQdQ3wKkMTjQ9Sg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwHabCA8p5gtTij80DuWyCG46fFG+0fELTU/yoAH0kCkc2Cq2+b
	CLNpODMY91g91AjoidBxSYI9Jxkw4PqBJnfiLbKe/+FYMY7ME9QhlQoD
X-Gm-Gg: ASbGnctXV7xme7IcnEARgv98glO2K2+/gZo9PPJNbRLN4aocMHV9zD0btoEZ+5GgyN9
	WvGhAEHn2mhCBKccLnKpByr7+QkSf8V9VZkSjku1470k8d35kM9/wXA3/mAEAp4Crm/Lga9giS+
	gCR1IYvLm6+aJsPOTzZKbR3uwuErnBC831qOpiJ3mU8Y+b62v2BjT2CPQAvdXrcNlmHN1wsPdqD
	P+4ztJCc0cHaon7C3TjJkxa7Mfp3bqdDg4vg9DumIYw04XKFRiG8AWP3YHhz9XPrnZkGNSQWk2c
	Ln2Zerlln1SuGUnhzthBsPn5y7pQjuFQEhORSYSH3xn0zoNgB9dA40m2P7Aelqx9NBdU6Dr0+IL
	gqYcVCoJJFjkRwqkjAEiWBAPw0iECxJpJUoMUVArOr419imTRj1RX1SjNvvVDeGBR9BXGvFw5mS
	ePqWEjtoY=
X-Google-Smtp-Source: AGHT+IE+ILVgLUNgj/mwJQLlwWtihgh5MW/x4L7viljYl21r1liW1gbkeixvn9mBycfWQpOHWCkF1Q==
X-Received: by 2002:aa7:cd67:0:b0:633:d0b7:d6c3 with SMTP id 4fb4d7f45d1cf-6349f9cab40mr4466363a12.5.1758877135297;
        Fri, 26 Sep 2025 01:58:55 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------xXuEtxmw2kSPDrCxIxO0c1JV"
Message-ID: <b60c5228-d7da-4b8e-b12b-3fe26825759b@gmail.com>
Date: Fri, 26 Sep 2025 10:58:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/18] xen/riscv: implement p2m_set_range()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
 <5e325267a792a9a0f4cb387b4e3287d22dc8d173.1758145428.git.oleksii.kurochko@gmail.com>
 <6ee4846e-dd27-4588-aac5-f2fe2937db18@suse.com>
 <a5c016c9-aee4-4a86-a6cc-0d89dd5e9216@gmail.com>
 <6b62cf4c-8367-47dc-9911-206c220fb050@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <6b62cf4c-8367-47dc-9911-206c220fb050@suse.com>

This is a multi-part message in MIME format.
--------------xXuEtxmw2kSPDrCxIxO0c1JV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 9/26/25 9:07 AM, Jan Beulich wrote:
> On 25.09.2025 22:08, Oleksii Kurochko wrote:
>> On 9/20/25 1:36 AM, Jan Beulich wrote:
>>> On 17.09.2025 23:55, Oleksii Kurochko wrote:
>>>> +static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
>>>> +{
>>>> +    unsigned long root_table_indx;
>>>> +
>>>> +    root_table_indx = gfn_x(gfn) >> P2M_LEVEL_ORDER(P2M_ROOT_LEVEL);
>>>> +    if ( root_table_indx >= P2M_ROOT_PAGES )
>>>> +        return NULL;
>>>> +
>>>> +    /*
>>>> +     * The P2M root page table is extended by 2 bits, making its size 16KB
>>>> +     * (instead of 4KB for non-root page tables). Therefore, p2m->root is
>>>> +     * allocated as four consecutive 4KB pages (since alloc_domheap_pages()
>>>> +     * only allocates 4KB pages).
>>>> +     *
>>>> +     * To determine which of these four 4KB pages the root_table_indx falls
>>>> +     * into, we divide root_table_indx by
>>>> +     * P2M_PAGETABLE_ENTRIES(P2M_ROOT_LEVEL - 1).
>>>> +     */
>>>> +    root_table_indx /= P2M_PAGETABLE_ENTRIES(P2M_ROOT_LEVEL - 1);
>>> The subtraction of 1 here feels odd: You're after the root table's
>>> number of entries, i.e. I'd expect you to pass just P2M_ROOT_LEVEL.
>>> And the way P2M_PAGETABLE_ENTRIES() works also suggests so.
>> The purpose of this line is to select the page within the root table, which
>> consists of 4 consecutive pages. However, P2M_PAGETABLE_ENTRIES(P2M_ROOT_LEVEL)
>> returns 2048, so root_table_idx will always be 0 after devision, which is not
>> what we want.
>>
>> As an alternative, P2M_PAGETABLE_ENTRIES(0) could be used, since it always
>> returns 512. Dividing root_table_idx by 512 then yields the index of the page
>> within the root table, which is made up of 4 consecutive pages.
>>
>> Does it make sense now?
> Yes and no. I understand what you're after, but that doesn't make the use of
> P2M_PAGETABLE_ENTRIES() (with an arbitrary level as argument) correct. This
> calculation wants doing by solely using properties of the top level.

Got it, thanks. Then I will use solely properties of the top level.

>>>> +static int p2m_set_entry(struct p2m_domain *p2m,
>>>> +                           gfn_t gfn,
>>>> +                           unsigned long page_order,
>>>> +                           mfn_t mfn,
>>>> +                           p2m_type_t t)
>>> Nit: Indentation.
>>>
>>>> +{
>>>> +    unsigned int level;
>>>> +    unsigned int target = page_order / PAGETABLE_ORDER;
>>>> +    pte_t *entry, *table, orig_pte;
>>>> +    int rc;
>>>> +    /*
>>>> +     * A mapping is removed only if the MFN is explicitly set to INVALID_MFN.
>>>> +     * Other MFNs that are considered invalid by mfn_valid() (e.g., MMIO)
>>>> +     * are still allowed.
>>>> +     */
>>>> +    bool removing_mapping = mfn_eq(mfn, INVALID_MFN);
>>>> +    DECLARE_OFFSETS(offsets, gfn_to_gaddr(gfn));
>>>> +
>>>> +    ASSERT(p2m_is_write_locked(p2m));
>>>> +
>>>> +    /*
>>>> +     * Check if the level target is valid: we only support
>>>> +     * 4K - 2M - 1G mapping.
>>>> +     */
>>>> +    ASSERT(target <= 2);
>>>> +
>>>> +    table = p2m_get_root_pointer(p2m, gfn);
>>>> +    if ( !table )
>>>> +        return -EINVAL;
>>>> +
>>>> +    for ( level = P2M_ROOT_LEVEL; level > target; level-- )
>>>> +    {
>>>> +        /*
>>>> +         * Don't try to allocate intermediate page table if the mapping
>>>> +         * is about to be removed.
>>>> +         */
>>>> +        rc = p2m_next_level(p2m, !removing_mapping,
>>>> +                            level, &table, offsets[level]);
>>>> +        if ( (rc == P2M_TABLE_MAP_NONE) || (rc == P2M_TABLE_MAP_NOMEM) )
>>>> +        {
>>>> +            rc = (rc == P2M_TABLE_MAP_NONE) ? -ENOENT : -ENOMEM;
>>>> +            /*
>>>> +             * We are here because p2m_next_level has failed to map
>>>> +             * the intermediate page table (e.g the table does not exist
>>>> +             * and they p2m tree is read-only).
>>> I thought I commented on this or something similar already: Calling the
>>> p2m tree "read-only" is imo misleading.
>> I will change then "read-only" to "not allocatable".
> That'll be only marginally better: What's "allocatable"? Why not something
> like "... does not exist and none should be allocated"? Or maybe simply
> omit this part of the comment?

Agree, "allocatable" could be also confusing. Perhaps, just omitting will
be fine.

>
>>>> +    /*
>>>> +     * Free the entry only if the original pte was valid and the base
>>>> +     * is different (to avoid freeing when permission is changed).
>>>> +     *
>>>> +     * If previously MFN 0 was mapped and it is going to be removed
>>>> +     * and considering that during removing MFN 0 is used then `entry`
>>>> +     * and `new_entry` will be the same and p2m_free_subtree() won't be
>>>> +     * called. This case is handled explicitly.
>>>> +     */
>>>> +    if ( pte_is_valid(orig_pte) &&
>>>> +         (!mfn_eq(pte_get_mfn(*entry), pte_get_mfn(orig_pte)) ||
>>>> +          (removing_mapping && mfn_eq(pte_get_mfn(*entry), _mfn(0)))) )
>>>> +        p2m_free_subtree(p2m, orig_pte, level);
>>> I continue to fail to understand why the MFN would matter here.
>> My understanding is that if, for the same GFN, the MFN changes fromMFN_1 to
>> MFN_2, then we need to update any references on the page referenced by
>> |orig_pte| to ensure the proper reference counter is maintained for the page
>> pointed to byMFN_1.
>>
>>>    Isn't the
>>> need to free strictly tied to a VALID -> NOT VALID transition? A permission
>>> change simply retains the VALID state of an entry.
>> It covers a case when removing happens and probably in this case we don't need
>> to check specifically for mfn(0) case "mfn_eq(pte_get_mfn(*entry), _mfn(0))",
>> but it would be enough to check that pte_is_valid(entry) instead:
>>     ...
>>     (removing_mapping && !pte_is_valid(entry)))) )
>>
>> Or only check removing_mapping variable as `entry` would be invalided by the
>> code above anyway. So we will get:
>> +    if ( pte_is_valid(orig_pte) &&
>> +         (!mfn_eq(pte_get_mfn(*entry), pte_get_mfn(orig_pte)) || removing_mapping) )
>> +        p2m_free_subtree(p2m, orig_pte, level);
>>
>> Does it make sense now?
> Not really, sorry. Imo the complicated condition indicates that something is
> wrong (or at least inefficient) here.

Then, in the case of aVALID -> VALID transition, where the MFN is changed for the
same PTE, should something be done with the old MFN (e.g., calling|p2m_put_page()|
for it), or can freeing the old MFN be delayed until|domain_relinquish_resources() |is called? If so, wouldn’t that lead to a situation where many old MFNs accumulate
and cannot be re-used until|domain_relinquish_resources()| (or another function that
explicitly frees pages) is invoked?

If we only need to care about theVALID -> NOT VALID transition, doesn’t that mean
|p2m_free_subtree()| should be called only when a removal actually occurs?

~ Oleksii


--------------xXuEtxmw2kSPDrCxIxO0c1JV
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
    <div class="moz-cite-prefix">On 9/26/25 9:07 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:6b62cf4c-8367-47dc-9911-206c220fb050@suse.com">
      <pre wrap="" class="moz-quote-pre">On 25.09.2025 22:08, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 9/20/25 1:36 AM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 17.09.2025 23:55, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
+{
+    unsigned long root_table_indx;
+
+    root_table_indx = gfn_x(gfn) &gt;&gt; P2M_LEVEL_ORDER(P2M_ROOT_LEVEL);
+    if ( root_table_indx &gt;= P2M_ROOT_PAGES )
+        return NULL;
+
+    /*
+     * The P2M root page table is extended by 2 bits, making its size 16KB
+     * (instead of 4KB for non-root page tables). Therefore, p2m-&gt;root is
+     * allocated as four consecutive 4KB pages (since alloc_domheap_pages()
+     * only allocates 4KB pages).
+     *
+     * To determine which of these four 4KB pages the root_table_indx falls
+     * into, we divide root_table_indx by
+     * P2M_PAGETABLE_ENTRIES(P2M_ROOT_LEVEL - 1).
+     */
+    root_table_indx /= P2M_PAGETABLE_ENTRIES(P2M_ROOT_LEVEL - 1);
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">The subtraction of 1 here feels odd: You're after the root table's
number of entries, i.e. I'd expect you to pass just P2M_ROOT_LEVEL.
And the way P2M_PAGETABLE_ENTRIES() works also suggests so.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
The purpose of this line is to select the page within the root table, which
consists of 4 consecutive pages. However, P2M_PAGETABLE_ENTRIES(P2M_ROOT_LEVEL)
returns 2048, so root_table_idx will always be 0 after devision, which is not
what we want.

As an alternative, P2M_PAGETABLE_ENTRIES(0) could be used, since it always
returns 512. Dividing root_table_idx by 512 then yields the index of the page
within the root table, which is made up of 4 consecutive pages.

Does it make sense now?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Yes and no. I understand what you're after, but that doesn't make the use of
P2M_PAGETABLE_ENTRIES() (with an arbitrary level as argument) correct. This
calculation wants doing by solely using properties of the top level.</pre>
    </blockquote>
    <pre>Got it, thanks. Then I will use solely properties of the top level.

</pre>
    <blockquote type="cite"
      cite="mid:6b62cf4c-8367-47dc-9911-206c220fb050@suse.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+static int p2m_set_entry(struct p2m_domain *p2m,
+                           gfn_t gfn,
+                           unsigned long page_order,
+                           mfn_t mfn,
+                           p2m_type_t t)
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Nit: Indentation.

</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+{
+    unsigned int level;
+    unsigned int target = page_order / PAGETABLE_ORDER;
+    pte_t *entry, *table, orig_pte;
+    int rc;
+    /*
+     * A mapping is removed only if the MFN is explicitly set to INVALID_MFN.
+     * Other MFNs that are considered invalid by mfn_valid() (e.g., MMIO)
+     * are still allowed.
+     */
+    bool removing_mapping = mfn_eq(mfn, INVALID_MFN);
+    DECLARE_OFFSETS(offsets, gfn_to_gaddr(gfn));
+
+    ASSERT(p2m_is_write_locked(p2m));
+
+    /*
+     * Check if the level target is valid: we only support
+     * 4K - 2M - 1G mapping.
+     */
+    ASSERT(target &lt;= 2);
+
+    table = p2m_get_root_pointer(p2m, gfn);
+    if ( !table )
+        return -EINVAL;
+
+    for ( level = P2M_ROOT_LEVEL; level &gt; target; level-- )
+    {
+        /*
+         * Don't try to allocate intermediate page table if the mapping
+         * is about to be removed.
+         */
+        rc = p2m_next_level(p2m, !removing_mapping,
+                            level, &amp;table, offsets[level]);
+        if ( (rc == P2M_TABLE_MAP_NONE) || (rc == P2M_TABLE_MAP_NOMEM) )
+        {
+            rc = (rc == P2M_TABLE_MAP_NONE) ? -ENOENT : -ENOMEM;
+            /*
+             * We are here because p2m_next_level has failed to map
+             * the intermediate page table (e.g the table does not exist
+             * and they p2m tree is read-only).
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">I thought I commented on this or something similar already: Calling the
p2m tree "read-only" is imo misleading.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
I will change then "read-only" to "not allocatable".
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
That'll be only marginally better: What's "allocatable"? Why not something
like "... does not exist and none should be allocated"? Or maybe simply
omit this part of the comment?</pre>
    </blockquote>
    <pre>Agree, "allocatable" could be also confusing. Perhaps, just omitting will
be fine.
</pre>
    <pre>
</pre>
    <blockquote type="cite"
      cite="mid:6b62cf4c-8367-47dc-9911-206c220fb050@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+    /*
+     * Free the entry only if the original pte was valid and the base
+     * is different (to avoid freeing when permission is changed).
+     *
+     * If previously MFN 0 was mapped and it is going to be removed
+     * and considering that during removing MFN 0 is used then `entry`
+     * and `new_entry` will be the same and p2m_free_subtree() won't be
+     * called. This case is handled explicitly.
+     */
+    if ( pte_is_valid(orig_pte) &amp;&amp;
+         (!mfn_eq(pte_get_mfn(*entry), pte_get_mfn(orig_pte)) ||
+          (removing_mapping &amp;&amp; mfn_eq(pte_get_mfn(*entry), _mfn(0)))) )
+        p2m_free_subtree(p2m, orig_pte, level);
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">I continue to fail to understand why the MFN would matter here.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
My understanding is that if, for the same GFN, the MFN changes fromMFN_1 to
MFN_2, then we need to update any references on the page referenced by
|orig_pte| to ensure the proper reference counter is maintained for the page
pointed to byMFN_1.

</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">  Isn't the
need to free strictly tied to a VALID -&gt; NOT VALID transition? A permission
change simply retains the VALID state of an entry.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
It covers a case when removing happens and probably in this case we don't need
to check specifically for mfn(0) case "mfn_eq(pte_get_mfn(*entry), _mfn(0))",
but it would be enough to check that pte_is_valid(entry) instead:
   ...
   (removing_mapping &amp;&amp; !pte_is_valid(entry)))) )

Or only check removing_mapping variable as `entry` would be invalided by the
code above anyway. So we will get:
+    if ( pte_is_valid(orig_pte) &amp;&amp;
+         (!mfn_eq(pte_get_mfn(*entry), pte_get_mfn(orig_pte)) || removing_mapping) )
+        p2m_free_subtree(p2m, orig_pte, level);

Does it make sense now?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Not really, sorry. Imo the complicated condition indicates that something is
wrong (or at least inefficient) here.</pre>
    </blockquote>
    <pre data-start="61" data-end="520">Then, in the case of a <span
    data-start="84" data-end="101">VALID -&gt; VALID</span> transition, where the MFN is changed for the
same PTE, should something be done with the old MFN (e.g., calling <code
    data-start="212" data-end="228">p2m_put_page()</code>
for it), or can freeing the old MFN be delayed until <code
    data-start="282" data-end="313">domain_relinquish_resources()
</code>is called? If so, wouldn’t that lead to a situation where many old MFNs accumulate
and cannot be re-used until <code data-start="425" data-end="456">domain_relinquish_resources()</code> (or another function that
explicitly frees pages) is invoked?</pre>
    <pre data-start="522" data-end="684">If we only need to care about the <span
    data-start="556" data-end="577">VALID -&gt; NOT VALID</span> transition, doesn’t that mean
<code data-start="608" data-end="628">p2m_free_subtree()</code> should be called only when a removal actually occurs?

~ Oleksii
</pre>
    <pre></pre>
    <br>
  </body>
</html>

--------------xXuEtxmw2kSPDrCxIxO0c1JV--

