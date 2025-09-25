Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6540BBA1500
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 22:09:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1130827.1470200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1sGy-0006SF-5f; Thu, 25 Sep 2025 20:09:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1130827.1470200; Thu, 25 Sep 2025 20:09:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1sGy-0006Pw-2z; Thu, 25 Sep 2025 20:09:00 +0000
Received: by outflank-mailman (input) for mailman id 1130827;
 Thu, 25 Sep 2025 20:08:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LCQs=4E=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v1sGw-0006Pq-EY
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 20:08:58 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76c3ad20-9a4b-11f0-9809-7dc792cee155;
 Thu, 25 Sep 2025 22:08:55 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-62fc89cd68bso2854918a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Sep 2025 13:08:55 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-67-38.play-internet.pl.
 [109.243.67.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-634a3b052d4sm1654928a12.48.2025.09.25.13.08.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 13:08:53 -0700 (PDT)
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
X-Inumbo-ID: 76c3ad20-9a4b-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758830935; x=1759435735; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SOxYxHOxZqS8QpjJBA9HbC+BdH9IE3gaGYDE+8DTsVI=;
        b=Kr0RdjLh8LWIxMIXBACdbT5WFCdmrm++MrjHAFHS96er5Y+Qwn2DqIh7Gr9TZa/yoS
         rELGHAMGr0DIkKGlpG2Xyj5vJm2vil+YEHWp+ads6KV9k/HosfE5ncVUn7GIcvQ1W/xL
         ZRvbEiV6s9s1LolINt0PmahPiUO8QLKeOZdeoYiDTsTkTyWfUbvEbA30pjtNjzVA4XwH
         BGmCZ8VK69FJyU+u1EZVlShWOEQDDb3Q9SdYiIakF64TmAauwWh2klb0n0NWfPfuRrC8
         EW1ISyskeka078sE3YZOrdWXfsU+D5XbW7FkAn+icpO48+JCQYX6M7zHMkv21q/r5Q7g
         Cm2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758830935; x=1759435735;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SOxYxHOxZqS8QpjJBA9HbC+BdH9IE3gaGYDE+8DTsVI=;
        b=L6KrOSZqKfFLJXNXI8MdXyfOznspTUpWQH44PR8lSE8mddUWHyAWaduJpiKiRNsKtE
         eBTz5156/7QNBImwPOyUTihr3kn1nCxonD3KhO9DbtOzF0R7T6H4ka9AxzQ3AieQlCsh
         202M1pFL8SjmVHDljI8isBGeGI36LECA3H1/GZsU58csJ2RbnIjcb8WhCS45xdCyaGRj
         iD79UU1wocCWGoo+wVQ89mOQxUoMkEvtsyfw4G3czOrMNXOmN8+JOO/6WhZqsOAHmTcR
         M0zT9eNzRoj2T82LTxhRzaQ6QJxnIXRNTjlMNB90zmDV6QRBAdaJtG8ma99ztwkWzvKA
         6pYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbX+1E/RgWjjCy1Wq2ENAoppag/i+1rdLMt1hzKHiqDNQb070qsAzjSBEBV9JmFbRLPBj7s5vdxIs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yytbnws+r71eeOF5yxDHD176brvW6QUfLqGG8nJxYf3hwvF3hzc
	hJepKz0OfIdxVyWDpbgAmCTg5+ime2GXwmimOg7OslsWUaV47RLgRVQO
X-Gm-Gg: ASbGncv34xo5rsCIaL9BVNRhGexZnkg8j4dfqoZqujBUGs+yVceLltmXHRbJ6JB0sKn
	6nKgkqQh9zu0T8frsf1c7mlZG2DpFHa7egbDOwLO+vdMKForHF8TWaQovLkFj3Ymn8jRbwUEDVA
	EzA/xAQiWNM6z161NzfnuSRkptDJUMVR6KlJ6ulTIoZHG7cA4i9Fj/fUfsJLlTi0WYfts8b0Ce1
	ycJnj6Rktrc+HFtZZKg4oV0VlFOhvfL7eyI8N337ZZ/kDOGT8oMKolskSOD6MhHWKpTMiSZSf6U
	sM0io181b0OKRZLfvDg2T1KsjAQZYO9tujH/UsDu1QrtV8Yho/hpzAPM04o5WiE3bQcDsK0Yvgi
	9AM/KCHY9Ds9DYoxyiN4vcvGNMXwpVwZIWpcU47c6iTOf+SJk5BmJjEVhyrVs96p5zpwOWnZw
X-Google-Smtp-Source: AGHT+IE0Ol4xet1x2KghTPSyBOufMpYjr7yoLlMUMoSzaBWC+Ph4JtVV6wqvSI+zMWJ/RdfkkbckaQ==
X-Received: by 2002:a05:6402:2552:b0:632:115b:6e72 with SMTP id 4fb4d7f45d1cf-6349f9ee308mr3809457a12.9.1758830934244;
        Thu, 25 Sep 2025 13:08:54 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------pZj6uq0YlIktb3xtf1mh4GXg"
Message-ID: <a5c016c9-aee4-4a86-a6cc-0d89dd5e9216@gmail.com>
Date: Thu, 25 Sep 2025 22:08:52 +0200
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <6ee4846e-dd27-4588-aac5-f2fe2937db18@suse.com>

This is a multi-part message in MIME format.
--------------pZj6uq0YlIktb3xtf1mh4GXg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/20/25 1:36 AM, Jan Beulich wrote:
> On 17.09.2025 23:55, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/p2m.c
>> +++ b/xen/arch/riscv/p2m.c
>> @@ -16,6 +16,7 @@
>>   #include <asm/riscv_encoding.h>
>>   
>>   unsigned long __ro_after_init gstage_mode;
>> +unsigned int __ro_after_init gstage_root_level;
>>   
>>   void __init gstage_mode_detect(void)
>>   {
>> @@ -53,6 +54,7 @@ void __init gstage_mode_detect(void)
>>           if ( MASK_EXTR(csr_read(CSR_HGATP), HGATP_MODE_MASK) == mode )
>>           {
>>               gstage_mode = mode;
>> +            gstage_root_level = modes[mode_idx].paging_levels - 1;
>>               break;
>>           }
>>       }
>> @@ -210,6 +212,9 @@ int p2m_init(struct domain *d)
>>       rwlock_init(&p2m->lock);
>>       INIT_PAGE_LIST_HEAD(&p2m->pages);
>>   
>> +    p2m->max_mapped_gfn = _gfn(0);
>> +    p2m->lowest_mapped_gfn = _gfn(ULONG_MAX);
>> +
>>       /*
>>        * Currently, the infrastructure required to enable CONFIG_HAS_PASSTHROUGH
>>        * is not ready for RISC-V support.
>> @@ -251,13 +256,287 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
>>       return rc;
>>   }
>>   
>> +/*
>> + * Find and map the root page table. The caller is responsible for
>> + * unmapping the table.
> With the root table being 4 pages, "the root table" is slightly misleading
> here: Yu never map the entire table.

I will update the comment then to:
/*
  * Map one of the four root pages of the P2M root page table.
  *
  * The P2M root page table is larger than normal (16KB instead of 4KB),
  * so it is allocated as four consecutive 4KB pages. This function selects
  * the appropriate 4KB page based on the given GFN and returns a mapping
  * to it.
  *
  * The caller is responsible for unmapping the page after use.
  *
  * Returns NULL if the calculated offset into the root table is invalid.
  */

>
>> + * The function will return NULL if the offset into the root table is
>> + * invalid.
>> + */
>> +static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
>> +{
>> +    unsigned long root_table_indx;
>> +
>> +    root_table_indx = gfn_x(gfn) >> P2M_LEVEL_ORDER(P2M_ROOT_LEVEL);
>> +    if ( root_table_indx >= P2M_ROOT_PAGES )
>> +        return NULL;
>> +
>> +    /*
>> +     * The P2M root page table is extended by 2 bits, making its size 16KB
>> +     * (instead of 4KB for non-root page tables). Therefore, p2m->root is
>> +     * allocated as four consecutive 4KB pages (since alloc_domheap_pages()
>> +     * only allocates 4KB pages).
>> +     *
>> +     * To determine which of these four 4KB pages the root_table_indx falls
>> +     * into, we divide root_table_indx by
>> +     * P2M_PAGETABLE_ENTRIES(P2M_ROOT_LEVEL - 1).
>> +     */
>> +    root_table_indx /= P2M_PAGETABLE_ENTRIES(P2M_ROOT_LEVEL - 1);
> The subtraction of 1 here feels odd: You're after the root table's
> number of entries, i.e. I'd expect you to pass just P2M_ROOT_LEVEL.
> And the way P2M_PAGETABLE_ENTRIES() works also suggests so.

The purpose of this line is to select the page within the root table, which
consists of 4 consecutive pages. However, P2M_PAGETABLE_ENTRIES(P2M_ROOT_LEVEL)
returns 2048, so root_table_idx will always be 0 after devision, which is not
what we want.

As an alternative, P2M_PAGETABLE_ENTRIES(0) could be used, since it always
returns 512. Dividing root_table_idx by 512 then yields the index of the page
within the root table, which is made up of 4 consecutive pages.

Does it make sense now?

The problem may occur with DECLARE_OFFSET(), which can produce an incorrect
index within the root page table. Since the index is in the range [0, 2047],
it becomes an issue if the value is greater than 511, because DECLARE_OFFSET()
does not account for the larger range of the root index.

I am not sure whether it is better to make DECLARE_OFFSET() generic enough
for both P2M and Xen page tables, or to provide a separate P2M_DECLARE_OFFSET()
and use it only in P2M-related code.
Also, it could be an option to move DECLARE_OFFSET() from asm/page.h header
to riscv/pt.c and define another one DECLARE_OFFSETS in riscv/p2m.c.

Do you have a preference?

>
>> +/*
>> + * Insert an entry in the p2m. This should be called with a mapping
>> + * equal to a page/superpage.
>> + */
> I don't follow this comment: There isn't any mapping being passed in, is there?

I think this comment should be dropped, it was about that requested mapping
should be equal to a page/superpage(4k, 2m, 1g), the correct order is always
guaranteed by p2m_mapping_order().

>
>> +static int p2m_set_entry(struct p2m_domain *p2m,
>> +                           gfn_t gfn,
>> +                           unsigned long page_order,
>> +                           mfn_t mfn,
>> +                           p2m_type_t t)
> Nit: Indentation.
>
>> +{
>> +    unsigned int level;
>> +    unsigned int target = page_order / PAGETABLE_ORDER;
>> +    pte_t *entry, *table, orig_pte;
>> +    int rc;
>> +    /*
>> +     * A mapping is removed only if the MFN is explicitly set to INVALID_MFN.
>> +     * Other MFNs that are considered invalid by mfn_valid() (e.g., MMIO)
>> +     * are still allowed.
>> +     */
>> +    bool removing_mapping = mfn_eq(mfn, INVALID_MFN);
>> +    DECLARE_OFFSETS(offsets, gfn_to_gaddr(gfn));
>> +
>> +    ASSERT(p2m_is_write_locked(p2m));
>> +
>> +    /*
>> +     * Check if the level target is valid: we only support
>> +     * 4K - 2M - 1G mapping.
>> +     */
>> +    ASSERT(target <= 2);
>> +
>> +    table = p2m_get_root_pointer(p2m, gfn);
>> +    if ( !table )
>> +        return -EINVAL;
>> +
>> +    for ( level = P2M_ROOT_LEVEL; level > target; level-- )
>> +    {
>> +        /*
>> +         * Don't try to allocate intermediate page table if the mapping
>> +         * is about to be removed.
>> +         */
>> +        rc = p2m_next_level(p2m, !removing_mapping,
>> +                            level, &table, offsets[level]);
>> +        if ( (rc == P2M_TABLE_MAP_NONE) || (rc == P2M_TABLE_MAP_NOMEM) )
>> +        {
>> +            rc = (rc == P2M_TABLE_MAP_NONE) ? -ENOENT : -ENOMEM;
>> +            /*
>> +             * We are here because p2m_next_level has failed to map
>> +             * the intermediate page table (e.g the table does not exist
>> +             * and they p2m tree is read-only).
> I thought I commented on this or something similar already: Calling the
> p2m tree "read-only" is imo misleading.

I will change then "read-only" to "not allocatable".

>
>> It is a valid case
>> +             * when removing a mapping as it may not exist in the
>> +             * page table. In this case, just ignore it.
> I fear the "it" has no reference; aiui you mean "ignore the lookup failure",
> but the comment isn't worded to refer to that by "it".

I will update the comment correspondingly.

>
>> +             */
>> +            rc = removing_mapping ? 0 : rc;
>> +            goto out;
>> +        }
>> +
>> +        if ( rc != P2M_TABLE_NORMAL )
>> +            break;
>> +    }
>> +
>> +    entry = table + offsets[level];
>> +
>> +    /*
>> +     * If we are here with level > target, we must be at a leaf node,
>> +     * and we need to break up the superpage.
>> +     */
>> +    if ( level > target )
>> +    {
>> +        panic("Shattering isn't implemented\n");
>> +    }
>> +
>> +    /*
>> +     * We should always be there with the correct level because all the
>> +     * intermediate tables have been installed if necessary.
>> +     */
>> +    ASSERT(level == target);
>> +
>> +    orig_pte = *entry;
>> +
>> +    if ( removing_mapping )
>> +        p2m_clean_pte(entry, p2m->clean_dcache);
>> +    else
>> +    {
>> +        pte_t pte = p2m_pte_from_mfn(mfn, t);
>> +
>> +        p2m_write_pte(entry, pte, p2m->clean_dcache);
>> +
>> +        p2m->max_mapped_gfn = gfn_max(p2m->max_mapped_gfn,
>> +                                      gfn_add(gfn, BIT(page_order, UL) - 1));
>> +        p2m->lowest_mapped_gfn = gfn_min(p2m->lowest_mapped_gfn, gfn);
>> +    }
>> +
>> +    p2m->need_flush = true;
>> +
>> +    /*
>> +     * Currently, the infrastructure required to enable CONFIG_HAS_PASSTHROUGH
>> +     * is not ready for RISC-V support.
>> +     *
>> +     * When CONFIG_HAS_PASSTHROUGH=y, iommu_iotlb_flush() should be done
>> +     * here.
>> +     */
>> +#ifdef CONFIG_HAS_PASSTHROUGH
>> +#   error "add code to flush IOMMU TLB"
>> +#endif
>> +
>> +    rc = 0;
>> +
>> +    /*
>> +     * Free the entry only if the original pte was valid and the base
>> +     * is different (to avoid freeing when permission is changed).
>> +     *
>> +     * If previously MFN 0 was mapped and it is going to be removed
>> +     * and considering that during removing MFN 0 is used then `entry`
>> +     * and `new_entry` will be the same and p2m_free_subtree() won't be
>> +     * called. This case is handled explicitly.
>> +     */
>> +    if ( pte_is_valid(orig_pte) &&
>> +         (!mfn_eq(pte_get_mfn(*entry), pte_get_mfn(orig_pte)) ||
>> +          (removing_mapping && mfn_eq(pte_get_mfn(*entry), _mfn(0)))) )
>> +        p2m_free_subtree(p2m, orig_pte, level);
> I continue to fail to understand why the MFN would matter here.

My understanding is that if, for the same GFN, the MFN changes fromMFN_1 to
MFN_2, then we need to update any references on the page referenced by
|orig_pte| to ensure the proper reference counter is maintained for the page
pointed to byMFN_1.

>   Isn't the
> need to free strictly tied to a VALID -> NOT VALID transition? A permission
> change simply retains the VALID state of an entry.

It covers a case when removing happens and probably in this case we don't need
to check specifically for mfn(0) case "mfn_eq(pte_get_mfn(*entry), _mfn(0))",
but it would be enough to check that pte_is_valid(entry) instead:
   ...
   (removing_mapping && !pte_is_valid(entry)))) )

Or only check removing_mapping variable as `entry` would be invalided by the
code above anyway. So we will get:
+    if ( pte_is_valid(orig_pte) &&
+         (!mfn_eq(pte_get_mfn(*entry), pte_get_mfn(orig_pte)) || removing_mapping) )
+        p2m_free_subtree(p2m, orig_pte, level);

Does it make sense now?

~ Oleksii

--------------pZj6uq0YlIktb3xtf1mh4GXg
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
    <div class="moz-cite-prefix">On 9/20/25 1:36 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:6ee4846e-dd27-4588-aac5-f2fe2937db18@suse.com">
      <pre wrap="" class="moz-quote-pre">On 17.09.2025 23:55, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -16,6 +16,7 @@
 #include &lt;asm/riscv_encoding.h&gt;
 
 unsigned long __ro_after_init gstage_mode;
+unsigned int __ro_after_init gstage_root_level;
 
 void __init gstage_mode_detect(void)
 {
@@ -53,6 +54,7 @@ void __init gstage_mode_detect(void)
         if ( MASK_EXTR(csr_read(CSR_HGATP), HGATP_MODE_MASK) == mode )
         {
             gstage_mode = mode;
+            gstage_root_level = modes[mode_idx].paging_levels - 1;
             break;
         }
     }
@@ -210,6 +212,9 @@ int p2m_init(struct domain *d)
     rwlock_init(&amp;p2m-&gt;lock);
     INIT_PAGE_LIST_HEAD(&amp;p2m-&gt;pages);
 
+    p2m-&gt;max_mapped_gfn = _gfn(0);
+    p2m-&gt;lowest_mapped_gfn = _gfn(ULONG_MAX);
+
     /*
      * Currently, the infrastructure required to enable CONFIG_HAS_PASSTHROUGH
      * is not ready for RISC-V support.
@@ -251,13 +256,287 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
     return rc;
 }
 
+/*
+ * Find and map the root page table. The caller is responsible for
+ * unmapping the table.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
With the root table being 4 pages, "the root table" is slightly misleading
here: Yu never map the entire table.</pre>
    </blockquote>
    <pre>I will update the comment then to:
/*
 * Map one of the four root pages of the P2M root page table.
 *
 * The P2M root page table is larger than normal (16KB instead of 4KB),
 * so it is allocated as four consecutive 4KB pages. This function selects
 * the appropriate 4KB page based on the given GFN and returns a mapping
 * to it. 
 *
 * The caller is responsible for unmapping the page after use.
 *
 * Returns NULL if the calculated offset into the root table is invalid.
 */

</pre>
    <blockquote type="cite"
      cite="mid:6ee4846e-dd27-4588-aac5-f2fe2937db18@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ * The function will return NULL if the offset into the root table is
+ * invalid.
+ */
+static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
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
      <pre wrap="" class="moz-quote-pre">
The subtraction of 1 here feels odd: You're after the root table's
number of entries, i.e. I'd expect you to pass just P2M_ROOT_LEVEL.
And the way P2M_PAGETABLE_ENTRIES() works also suggests so.</pre>
    </blockquote>
    <pre>The purpose of this line is to select the page within the root table, which
consists of 4 consecutive pages. However, P2M_PAGETABLE_ENTRIES(P2M_ROOT_LEVEL)
returns 2048, so root_table_idx will always be 0 after devision, which is not
what we want.

As an alternative, P2M_PAGETABLE_ENTRIES(0) could be used, since it always
returns 512. Dividing root_table_idx by 512 then yields the index of the page
within the root table, which is made up of 4 consecutive pages.

Does it make sense now?

The problem may occur with DECLARE_OFFSET(), which can produce an incorrect
index within the root page table. Since the index is in the range [0, 2047],
it becomes an issue if the value is greater than 511, because DECLARE_OFFSET()
does not account for the larger range of the root index.

I am not sure whether it is better to make DECLARE_OFFSET() generic enough
for both P2M and Xen page tables, or to provide a separate P2M_DECLARE_OFFSET()
and use it only in P2M-related code.
Also, it could be an option to move DECLARE_OFFSET() from asm/page.h header
to riscv/pt.c and define another one DECLARE_OFFSETS in riscv/p2m.c.

Do you have a preference?

</pre>
    <blockquote type="cite"
      cite="mid:6ee4846e-dd27-4588-aac5-f2fe2937db18@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+/*
+ * Insert an entry in the p2m. This should be called with a mapping
+ * equal to a page/superpage.
+ */
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I don't follow this comment: There isn't any mapping being passed in, is there?</pre>
    </blockquote>
    <pre>I think this comment should be dropped, it was about that requested mapping
should be equal to a page/superpage(4k, 2m, 1g), the correct order is always
guaranteed by p2m_mapping_order().

</pre>
    <blockquote type="cite"
      cite="mid:6ee4846e-dd27-4588-aac5-f2fe2937db18@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+static int p2m_set_entry(struct p2m_domain *p2m,
+                           gfn_t gfn,
+                           unsigned long page_order,
+                           mfn_t mfn,
+                           p2m_type_t t)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Nit: Indentation.

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
      <pre wrap="" class="moz-quote-pre">
I thought I commented on this or something similar already: Calling the
p2m tree "read-only" is imo misleading.</pre>
    </blockquote>
    <pre>I will change then "read-only" to "not allocatable".

</pre>
    <blockquote type="cite"
      cite="mid:6ee4846e-dd27-4588-aac5-f2fe2937db18@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">It is a valid case
+             * when removing a mapping as it may not exist in the
+             * page table. In this case, just ignore it.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I fear the "it" has no reference; aiui you mean "ignore the lookup failure",
but the comment isn't worded to refer to that by "it".</pre>
    </blockquote>
    <pre>I will update the comment correspondingly.

</pre>
    <blockquote type="cite"
      cite="mid:6ee4846e-dd27-4588-aac5-f2fe2937db18@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+             */
+            rc = removing_mapping ? 0 : rc;
+            goto out;
+        }
+
+        if ( rc != P2M_TABLE_NORMAL )
+            break;
+    }
+
+    entry = table + offsets[level];
+
+    /*
+     * If we are here with level &gt; target, we must be at a leaf node,
+     * and we need to break up the superpage.
+     */
+    if ( level &gt; target )
+    {
+        panic("Shattering isn't implemented\n");
+    }
+
+    /*
+     * We should always be there with the correct level because all the
+     * intermediate tables have been installed if necessary.
+     */
+    ASSERT(level == target);
+
+    orig_pte = *entry;
+
+    if ( removing_mapping )
+        p2m_clean_pte(entry, p2m-&gt;clean_dcache);
+    else
+    {
+        pte_t pte = p2m_pte_from_mfn(mfn, t);
+
+        p2m_write_pte(entry, pte, p2m-&gt;clean_dcache);
+
+        p2m-&gt;max_mapped_gfn = gfn_max(p2m-&gt;max_mapped_gfn,
+                                      gfn_add(gfn, BIT(page_order, UL) - 1));
+        p2m-&gt;lowest_mapped_gfn = gfn_min(p2m-&gt;lowest_mapped_gfn, gfn);
+    }
+
+    p2m-&gt;need_flush = true;
+
+    /*
+     * Currently, the infrastructure required to enable CONFIG_HAS_PASSTHROUGH
+     * is not ready for RISC-V support.
+     *
+     * When CONFIG_HAS_PASSTHROUGH=y, iommu_iotlb_flush() should be done
+     * here.
+     */
+#ifdef CONFIG_HAS_PASSTHROUGH
+#   error "add code to flush IOMMU TLB"
+#endif
+
+    rc = 0;
+
+    /*
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
      <pre wrap="" class="moz-quote-pre">
I continue to fail to understand why the MFN would matter here.</pre>
    </blockquote>
    <pre data-start="89" data-end="255">My understanding is that if, for the same GFN, the MFN changes from <span
    data-start="130" data-end="139">MFN_1</span> to
<span data-start="143" data-end="152">MFN_2</span>, then we need to update any references on the page referenced by
<code data-start="218" data-end="228">orig_pte</code> to ensure the proper reference counter is maintained for the page
pointed to by <span data-start="309" data-end="318">MFN_1</span>.</pre>
    <blockquote type="cite"
      cite="mid:6ee4846e-dd27-4588-aac5-f2fe2937db18@suse.com">
      <pre wrap="" class="moz-quote-pre"> Isn't the
need to free strictly tied to a VALID -&gt; NOT VALID transition? A permission
change simply retains the VALID state of an entry.</pre>
    </blockquote>
    <pre>It covers a case when removing happens and probably in this case we don't need
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

~ Oleksii
</pre>
  </body>
</html>

--------------pZj6uq0YlIktb3xtf1mh4GXg--

