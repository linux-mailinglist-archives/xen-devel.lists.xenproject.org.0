Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 806A5B29FF4
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 13:03:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1085920.1444176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unxdw-00044m-2C; Mon, 18 Aug 2025 11:03:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1085920.1444176; Mon, 18 Aug 2025 11:03:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unxdv-00043A-Um; Mon, 18 Aug 2025 11:03:11 +0000
Received: by outflank-mailman (input) for mailman id 1085920;
 Mon, 18 Aug 2025 11:03:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YQjc=26=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1unxdu-000432-An
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 11:03:10 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec38d554-7c22-11f0-a32a-13f23c93f187;
 Mon, 18 Aug 2025 13:03:08 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-afcb78c77ebso634487266b.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Aug 2025 04:03:08 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdd0107ecsm765220166b.86.2025.08.18.04.03.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 04:03:06 -0700 (PDT)
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
X-Inumbo-ID: ec38d554-7c22-11f0-a32a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755514988; x=1756119788; darn=lists.xenproject.org;
        h=in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dGuD18uJg0jAH6V6gOSHIgVxrqhpA8JY6ekj+vV34fc=;
        b=Zy3oKDQ6QVnlrLRiqdKSSr5btsZrR0cONtJq1AaHGd15TMU1kHBLrC/xUHj4hPrRO/
         X3XFjbbvKT82KQlOGd/C6fqejmTlF2u94DXNhbOwVOusLg46nqoTwiRqSncipHJWQC3s
         f8yRkeheYpbUbkEeRjXFyJXyPUwAMwsZXk2MF6GQSY3SUJ5qWIQhicG4Apts3KkeoXxW
         8wPIqWEVqjfX2NE5rnEU6WlPUd5tjJ7FRT3kmnjxwKTCLgSHSf0uuVHs9LCUbMTOA1Ot
         Bg6ANpmXfIgqCx7Dk+VZq14XaUK3M4/814wFFbQUtUuA29r4QaIFBPprJzehiwJavpJk
         yPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755514988; x=1756119788;
        h=in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dGuD18uJg0jAH6V6gOSHIgVxrqhpA8JY6ekj+vV34fc=;
        b=aTxPqY2wK6i52fxZIG3XIC6A1k+4A7BFV6d1U3YarRpG2M5yOjxfof7OEinl5KjcV2
         4r2otZluiczNVYs6+Wx9RICzGA3jF20jpw/B08Z5AS1FgWUmJQWjvK6otrXCShwoZ1Sd
         s6B9kCaaZf3LKAQMEtqzu2btFs+tVGbnYF4QyVnGmlqnh8lVe0oTF7QGH2GpBFHK0EDt
         pDlrEcupX9PGDb34TfzYp7tYkdqA8ZYmMzw3C0N8usM1+Aw5UA0/VUx8PZfBTgXHn07r
         dP6bG+YD44ksPiSxKl7PAG+ILozbhf90WPUr+5n+1WGNzVRaPMeslARgooHAkMZxQE/L
         L10Q==
X-Forwarded-Encrypted: i=1; AJvYcCXnw6i8T/k6ATb7boA7YbDWZzcklAXlI9uMjWDgeFrMa1jMvb3DhiXpTTUfilR/aA2C5ncW1pzNXkM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx6cFA0kxgERwIKs8QtGmmMvctJlMas3jr3VICVgbItKbj/kT+1
	XvB+PEG5S3pQ+U3VYWE/bC9N9RBcNqyy8DmtrwsqdkIWdzClsYiTaNJ2
X-Gm-Gg: ASbGncvNM0tNvobuMs7oJJNHGXKRIbE1yWN7WxpayPfOxVPBQOO9ZMllY4G7FLRykkh
	j4aFbU6vf1CiBvv16KPDa5WbyfiBGcQXNJdC4Xj+PKByz4YR98JJHUZZwcjy/JpDbVkKfAWuZHp
	xpNCupveSUXChgjL/jQavsq7ZVU8gyy/MZKE4NDs0YzibNW6WUItf/q3tPS23N0nIlBs/ErE+pg
	xdqmMx+DtQkZM97nbhg7WlJduIDCvA0MrBXHucI7h7qoiELItYYxBNuTrWtxCdwdc/ECc/5cwTX
	R0fPqWn4rZytmZaqaozhQ1UN2V0pUmUWXBY3cPlgKOClRvuq0GNDLE7smKqbR0yhpyfpGx6ocjq
	sA4kuXQD0DHjCfDM1wtbDHE9D17LX/R5zhmhexEHk2S/Q/KAiONO1Ip/iFFJajFQPontHf2A=
X-Google-Smtp-Source: AGHT+IF8wD3nSlxrkH0ucNqDd4VnUdV4msy47kozDVZ1/hvesYkzXySz+VU7toF5AD7KYyGUToeu8Q==
X-Received: by 2002:a17:906:c141:b0:af9:6065:fc84 with SMTP id a640c23a62f3a-afcdc237d69mr1164715966b.27.1755514987310;
        Mon, 18 Aug 2025 04:03:07 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------JjfAIznUMdWgBed42B00sOpd"
Message-ID: <f9c816d3-7222-4a32-8aff-801f3c08d671@gmail.com>
Date: Mon, 18 Aug 2025 13:03:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v3 12/20] xen/riscv: implement p2m_set_range()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <ea69584222a4c41eac276de1ec8eed25b13642d3.1753973161.git.oleksii.kurochko@gmail.com>
 <f217021e-1fef-4324-a56e-529fd29b4c69@suse.com>
 <62a3c3ef-1f19-4fac-b967-f7730e8f235f@gmail.com>
 <da08c994-f14d-4fce-9b4e-8f97103e9acf@suse.com>
Content-Language: en-US
In-Reply-To: <da08c994-f14d-4fce-9b4e-8f97103e9acf@suse.com>

This is a multi-part message in MIME format.
--------------JjfAIznUMdWgBed42B00sOpd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 8/15/25 2:50 PM, Jan Beulich wrote:
> On 15.08.2025 11:52, Oleksii Kurochko wrote:
>> On 8/5/25 6:04 PM, Jan Beulich wrote:
>>> On 31.07.2025 17:58, Oleksii Kurochko wrote:
>>>> +static inline void p2m_write_pte(pte_t *p, pte_t pte, bool clean_pte)
>>>> +{
>>>> +    write_pte(p, pte);
>>>> +    if ( clean_pte )
>>>> +        clean_dcache_va_range(p, sizeof(*p));
>>> Not necessarily for right away, but if multiple adjacent PTEs are
>>> written without releasing the lock, this then redundant cache flushing
>>> can be a performance issue.
>> Can't it be resolved on a caller side? Something like:
>>     p2m_write_pte(p1, pte1, false);
>>     p2m_write_pte(p2, pte2, false);
>>     p2m_write_pte(p3, pte3, false);
>>     p2m_write_pte(p4, pte4, true);
>> where p1-p4 are adjacent.
> No. You wouldn't know whether the last write flushes what the earlier
> three have written. There may be a cacheline boundary in between.

Oh, correct. It would be hard to detect, so agree that it will work
badly...

> Plus
> I didn't really think of back-to-back writes, but e.g. a loop doing
> many of them, where a single wider flush may then be more efficient.

... So IIUC you mean something like:
   for (i = 0; i < nr_entries; i++)
       p2m_write_pte(&pt[i], entries[i], false);  // no flush yet

   clean_dcache_va_range(pt, nr_entries * sizeof(pte_t));

>>>> +#define P2M_TABLE_MAP_NONE 0
>>>> +#define P2M_TABLE_MAP_NOMEM 1
>>>> +#define P2M_TABLE_SUPER_PAGE 2
>>>> +#define P2M_TABLE_NORMAL 3
>>>> +
>>>> +/*
>>>> + * Take the currently mapped table, find the corresponding the entry
>>>> + * corresponding to the GFN, and map the next table, if available.
>>> Nit: Double "corresponding".
>>>
>>>> + * The previous table will be unmapped if the next level was mapped
>>>> + * (e.g P2M_TABLE_NORMAL returned).
>>>> + *
>>>> + * `alloc_tbl` parameter indicates whether intermediate tables should
>>>> + * be allocated when not present.
>>>> + *
>>>> + * Return values:
>>>> + *  P2M_TABLE_MAP_NONE: a table allocation isn't permitted.
>>>> + *  P2M_TABLE_MAP_NOMEM: allocating a new page failed.
>>>> + *  P2M_TABLE_SUPER_PAGE: next level or leaf mapped normally.
>>>> + *  P2M_TABLE_NORMAL: The next entry points to a superpage.
>>>> + */
>>>> +static int p2m_next_level(struct p2m_domain *p2m, bool alloc_tbl,
>>>> +                          unsigned int level, pte_t **table,
>>>> +                          unsigned int offset)
>>>> +{
>>>> +    panic("%s: hasn't been implemented yet\n", __func__);
>>>> +
>>>> +    return P2M_TABLE_MAP_NONE;
>>>> +}
>>>> +
>>>> +/* Free pte sub-tree behind an entry */
>>>> +static void p2m_free_subtree(struct p2m_domain *p2m,
>>>> +                             pte_t entry, unsigned int level)
>>>> +{
>>>> +    panic("%s: hasn't been implemented yet\n", __func__);
>>>> +}
>>>> +
>>>> +/*
>>>> + * Insert an entry in the p2m. This should be called with a mapping
>>>> + * equal to a page/superpage.
>>>> + */
>>>> +static int p2m_set_entry(struct p2m_domain *p2m,
>>>> +                           gfn_t gfn,
>>>> +                           unsigned long page_order,
>>>> +                           mfn_t mfn,
>>>> +                           p2m_type_t t)
>>>> +{
>>>> +    unsigned int level;
>>>> +    unsigned int target = page_order / PAGETABLE_ORDER;
>>>> +    pte_t *entry, *table, orig_pte;
>>>> +    int rc;
>>>> +    /* A mapping is removed if the MFN is invalid. */
>>>> +    bool removing_mapping = mfn_eq(mfn, INVALID_MFN);
>>> Comment and code don't fit together. Many MFNs are invalid (any for which
>>> mfn_valid() returns false), yet you only check for INVALID_MFN here.
>> Probably, it makes sense to add an|ASSERT()| here for the case when
>> |mfn_valid(mfn)| is false, but the MFN is not explicitly equal to|INVALID_MFN|.
>> This would indicate that someone attempted to perform a mapping with an
>> incorrect MFN, which, IMO, is entirely wrong.
> No, and we've been there before. MMIO can live anywhere, and mappings for
> such still will need to be permitted. It is correct to check only for
> INVALID_MFN here imo; it's just the comment which also needs to reflect
> that.

Got it now. The original one comment looked clear to me, but considering what
you wrote, I will update the comment then to:
   A mapping is removed only if the MFN is explicitly passed as INVALID_MFN.
Also, perhaps, it makes sense to add the following:
   Other MFNs that are not valid (e.g., MMIO) from mfn_valid() point of
   view are allowed.

Does it make more sense now?

>
>>>> +    /*
>>>> +     * If we are here with level > target, we must be at a leaf node,
>>>> +     * and we need to break up the superpage.
>>>> +     */
>>>> +    if ( level > target )
>>>> +    {
>>>> +        panic("Shattering isn't implemented\n");
>>>> +    }
>>>> +
>>>> +    /*
>>>> +     * We should always be there with the correct level because all the
>>>> +     * intermediate tables have been installed if necessary.
>>>> +     */
>>>> +    ASSERT(level == target);
>>>> +
>>>> +    orig_pte = *entry;
>>>> +
>>>> +    if ( removing_mapping )
>>>> +        p2m_clean_pte(entry, p2m->clean_pte);
>>>> +    else
>>>> +    {
>>>> +        pte_t pte = p2m_pte_from_mfn(mfn, t);
>>>> +
>>>> +        p2m_write_pte(entry, pte, p2m->clean_pte);
>>>> +
>>>> +        p2m->max_mapped_gfn = gfn_max(p2m->max_mapped_gfn,
>>>> +                                      gfn_add(gfn, BIT(page_order, UL) - 1));
>>>> +        p2m->lowest_mapped_gfn = gfn_min(p2m->lowest_mapped_gfn, gfn);
>>>> +    }
>>>> +
>>>> +    p2m->need_flush = true;
>>>> +
>>>> +    /*
>>>> +     * Currently, the infrastructure required to enable CONFIG_HAS_PASSTHROUGH
>>>> +     * is not ready for RISC-V support.
>>>> +     *
>>>> +     * When CONFIG_HAS_PASSTHROUGH=y, iommu_iotlb_flush() should be done
>>>> +     * here.
>>>> +     */
>>>> +#ifdef CONFIG_HAS_PASSTHROUGH
>>>> +#   error "add code to flush IOMMU TLB"
>>>> +#endif
>>>> +
>>>> +    rc = 0;
>>>> +
>>>> +    /*
>>>> +     * Free the entry only if the original pte was valid and the base
>>>> +     * is different (to avoid freeing when permission is changed).
>>>> +     */
>>>> +    if ( pte_is_valid(orig_pte) &&
>>>> +         !mfn_eq(pte_get_mfn(*entry), pte_get_mfn(orig_pte)) )
>>> I'm puzzled by this 2nd check: A permission change would - I expect - only
>>> occur to a leaf entry. If the new entry is a super-page one and the old
>>> wasn't, don't you still need to free the sub-tree, no matter whether the
>>> MFNs are the same?
>> I expect the MFNs to differ in this scenario, so the old sub-tree will be freed.
> You expecting something isn't a good criteria. If it's possible, even if
> unexpected (by you), it needs dealing with correctly.
>
>> Based on your example (new entry is super-page and old entry isn't):
>> For old mapping (lets say, 4 KiB leaf) p2m_set_entry() walks all levels down
>> to L0, so we will have the following MMU page table walks:
>>     L2 PTE -> L1 PTE (MFN of L0 page table) -> L0 PTE -> RAM
>>
>> When new mapping (lets say, 2 MiB superpage) will be requested, p2m_set_entry()
>> will stop at L1 (the superpage level):
>>    L2 PTE -> L1 PTE (at this moment, L1 PTE points to L0 page table, which
>>                      points to RAM)
>> Then the old L1 PTE will be saved in 'orig_pte', then writes 'entry' with
>> the RAM MFN for the 2 MiB mapping. The walk becomes:
>>     L2 PTE -> L1 PTE -> RAM
>>
>> Therefore, 'entry' now holds an MFN pointing to RAM (superpage leaf). 'orig_pte'
>> still holds an MFN pointing to the L0 table (the old sub-tree). Since these MFNs
>> differ, the code calls p2m_free_subtree(p2m, orig_pte, …) and frees the old L0
>> sub-tree.
> A particular example doesn't help. All possible cases need handling correctly.

For sure, all possible cases need handling correctly, but I don't see any cases
except one you mentioned below where MFNs will be the same.

>
>>>    Plus consider the special case of MFN 0: If you clear
>>> an entry using MFN 0, you will find old and new PTEs' both having the same
>>> MFN.
>> Isn't this happen only when a mapping removal is explicitly requested?
>> In the case of a mapping removal it seems to me it is enough just to
>> clear PTE with all zeroes.
> Correct. Which means original MFN (PPN) and new MFN (PPN) would match.

Oh, I got it what is the issue here. If previously MFN 0 was mapped, then
it is going to be removed and considering that during removing MFN 0 is
used, we won't put MFN 0 page reference (mapped earlier) because
p2m_free_subtree() won't be called.

In this case, if-condidtion should be updated with:
   @@ -883,7 +890,8 @@ static int p2m_set_entry(struct p2m_domain *p2m,
         * is different (to avoid freeing when permission is changed).
         */
        if ( pte_is_valid(orig_pte) &&
   -         !mfn_eq(pte_get_mfn(*entry), pte_get_mfn(orig_pte)) )
   +         (!mfn_eq(pte_get_mfn(*entry), pte_get_mfn(orig_pte)) ||
   +          (removing_mapping && mfn_eq(pte_get_mfn(*entry), mfn_t(0))) )

or call p2m_free_subentry() in remove_mapping handling:
   @@ -850,7 +852,12 @@ static int p2m_set_entry(struct p2m_domain *p2m,
        orig_pte = *entry;
  
        if ( removing_mapping )
   +    {
   +       if ( mfn_eq(pte_get_mfn(*entry), mfn_t(0) )
   +            p2m_free_subtree(p2m, orig_pte, level,  virt_to_page(table), offsets[level]);
   +
          p2m_clean_pte(entry, p2m->clean_pte);
   +    }
        else

~ Oleksii

--------------JjfAIznUMdWgBed42B00sOpd
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
    <div class="moz-cite-prefix">On 8/15/25 2:50 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:da08c994-f14d-4fce-9b4e-8f97103e9acf@suse.com">
      <pre wrap="" class="moz-quote-pre">On 15.08.2025 11:52, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 8/5/25 6:04 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 31.07.2025 17:58, Oleksii Kurochko wrote:
</pre>
        </blockquote>
      </blockquote>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+static inline void p2m_write_pte(pte_t *p, pte_t pte, bool clean_pte)
+{
+    write_pte(p, pte);
+    if ( clean_pte )
+        clean_dcache_va_range(p, sizeof(*p));
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Not necessarily for right away, but if multiple adjacent PTEs are
written without releasing the lock, this then redundant cache flushing
can be a performance issue.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">Can't it be resolved on a caller side? Something like:
   p2m_write_pte(p1, pte1, false);
   p2m_write_pte(p2, pte2, false);
   p2m_write_pte(p3, pte3, false);
   p2m_write_pte(p4, pte4, true);
where p1-p4 are adjacent.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">No. You wouldn't know whether the last write flushes what the earlier
three have written. There may be a cacheline boundary in between. </pre>
    </blockquote>
    <pre>Oh, correct. It would be hard to detect, so agree that it will work
badly...
</pre>
    <blockquote type="cite"
      cite="mid:da08c994-f14d-4fce-9b4e-8f97103e9acf@suse.com">
      <pre wrap="" class="moz-quote-pre">Plus
I didn't really think of back-to-back writes, but e.g. a loop doing
many of them, where a single wider flush may then be more efficient.</pre>
    </blockquote>
    <pre>... So IIUC you mean something like:
  for (i = 0; i &lt; nr_entries; i++)
      p2m_write_pte(&amp;pt[i], entries[i], false);  // no flush yet

  clean_dcache_va_range(pt, nr_entries * sizeof(pte_t));

</pre>
    <blockquote type="cite"
      cite="mid:da08c994-f14d-4fce-9b4e-8f97103e9acf@suse.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+#define P2M_TABLE_MAP_NONE 0
+#define P2M_TABLE_MAP_NOMEM 1
+#define P2M_TABLE_SUPER_PAGE 2
+#define P2M_TABLE_NORMAL 3
+
+/*
+ * Take the currently mapped table, find the corresponding the entry
+ * corresponding to the GFN, and map the next table, if available.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Nit: Double "corresponding".

</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+ * The previous table will be unmapped if the next level was mapped
+ * (e.g P2M_TABLE_NORMAL returned).
+ *
+ * `alloc_tbl` parameter indicates whether intermediate tables should
+ * be allocated when not present.
+ *
+ * Return values:
+ *  P2M_TABLE_MAP_NONE: a table allocation isn't permitted.
+ *  P2M_TABLE_MAP_NOMEM: allocating a new page failed.
+ *  P2M_TABLE_SUPER_PAGE: next level or leaf mapped normally.
+ *  P2M_TABLE_NORMAL: The next entry points to a superpage.
+ */
+static int p2m_next_level(struct p2m_domain *p2m, bool alloc_tbl,
+                          unsigned int level, pte_t **table,
+                          unsigned int offset)
+{
+    panic("%s: hasn't been implemented yet\n", __func__);
+
+    return P2M_TABLE_MAP_NONE;
+}
+
+/* Free pte sub-tree behind an entry */
+static void p2m_free_subtree(struct p2m_domain *p2m,
+                             pte_t entry, unsigned int level)
+{
+    panic("%s: hasn't been implemented yet\n", __func__);
+}
+
+/*
+ * Insert an entry in the p2m. This should be called with a mapping
+ * equal to a page/superpage.
+ */
+static int p2m_set_entry(struct p2m_domain *p2m,
+                           gfn_t gfn,
+                           unsigned long page_order,
+                           mfn_t mfn,
+                           p2m_type_t t)
+{
+    unsigned int level;
+    unsigned int target = page_order / PAGETABLE_ORDER;
+    pte_t *entry, *table, orig_pte;
+    int rc;
+    /* A mapping is removed if the MFN is invalid. */
+    bool removing_mapping = mfn_eq(mfn, INVALID_MFN);
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Comment and code don't fit together. Many MFNs are invalid (any for which
mfn_valid() returns false), yet you only check for INVALID_MFN here.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">Probably, it makes sense to add an|ASSERT()| here for the case when
|mfn_valid(mfn)| is false, but the MFN is not explicitly equal to|INVALID_MFN|.
This would indicate that someone attempted to perform a mapping with an
incorrect MFN, which, IMO, is entirely wrong.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">No, and we've been there before. MMIO can live anywhere, and mappings for
such still will need to be permitted. It is correct to check only for
INVALID_MFN here imo; it's just the comment which also needs to reflect
that.</pre>
    </blockquote>
    <pre>Got it now. The original one comment looked clear to me, but considering what
you wrote, I will update the comment then to:
  A mapping is removed only if the MFN is explicitly passed as INVALID_MFN.
Also, perhaps, it makes sense to add the following:
  Other MFNs that are not valid (e.g., MMIO) from mfn_valid() point of
  view are allowed.

Does it make more sense now?

</pre>
    <blockquote type="cite"
      cite="mid:da08c994-f14d-4fce-9b4e-8f97103e9acf@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+    /*
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
+        p2m_clean_pte(entry, p2m-&gt;clean_pte);
+    else
+    {
+        pte_t pte = p2m_pte_from_mfn(mfn, t);
+
+        p2m_write_pte(entry, pte, p2m-&gt;clean_pte);
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
+     */
+    if ( pte_is_valid(orig_pte) &amp;&amp;
+         !mfn_eq(pte_get_mfn(*entry), pte_get_mfn(orig_pte)) )
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">I'm puzzled by this 2nd check: A permission change would - I expect - only
occur to a leaf entry. If the new entry is a super-page one and the old
wasn't, don't you still need to free the sub-tree, no matter whether the
MFNs are the same?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">I expect the MFNs to differ in this scenario, so the old sub-tree will be freed.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">You expecting something isn't a good criteria. If it's possible, even if
unexpected (by you), it needs dealing with correctly.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Based on your example (new entry is super-page and old entry isn't):
For old mapping (lets say, 4 KiB leaf) p2m_set_entry() walks all levels down
to L0, so we will have the following MMU page table walks:
   L2 PTE -&gt; L1 PTE (MFN of L0 page table) -&gt; L0 PTE -&gt; RAM

When new mapping (lets say, 2 MiB superpage) will be requested, p2m_set_entry()
will stop at L1 (the superpage level):
  L2 PTE -&gt; L1 PTE (at this moment, L1 PTE points to L0 page table, which
                    points to RAM)
Then the old L1 PTE will be saved in 'orig_pte', then writes 'entry' with
the RAM MFN for the 2 MiB mapping. The walk becomes:
   L2 PTE -&gt; L1 PTE -&gt; RAM

Therefore, 'entry' now holds an MFN pointing to RAM (superpage leaf). 'orig_pte'
still holds an MFN pointing to the L0 table (the old sub-tree). Since these MFNs
differ, the code calls p2m_free_subtree(p2m, orig_pte, …) and frees the old L0
sub-tree.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">A particular example doesn't help. All possible cases need handling correctly.</pre>
    </blockquote>
    <pre>For sure, all possible cases need handling correctly, but I don't see any cases
except one you mentioned below where MFNs will be the same.

</pre>
    <blockquote type="cite"
      cite="mid:da08c994-f14d-4fce-9b4e-8f97103e9acf@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">  Plus consider the special case of MFN 0: If you clear
an entry using MFN 0, you will find old and new PTEs' both having the same
MFN.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">Isn't this happen only when a mapping removal is explicitly requested?
In the case of a mapping removal it seems to me it is enough just to
clear PTE with all zeroes.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Correct. Which means original MFN (PPN) and new MFN (PPN) would match.</pre>
    </blockquote>
    <pre>Oh, I got it what is the issue here. If previously MFN 0 was mapped, then
it is going to be removed and considering that during removing MFN 0 is
used, we won't put MFN 0 page reference (mapped earlier) because
p2m_free_subtree() won't be called.

In this case, if-condidtion should be updated with:
  @@ -883,7 +890,8 @@ static int p2m_set_entry(struct p2m_domain *p2m,
        * is different (to avoid freeing when permission is changed).
        */
       if ( pte_is_valid(orig_pte) &amp;&amp;
  -         !mfn_eq(pte_get_mfn(*entry), pte_get_mfn(orig_pte)) )
  +         (!mfn_eq(pte_get_mfn(*entry), pte_get_mfn(orig_pte)) ||
  +          (removing_mapping &amp;&amp; mfn_eq(pte_get_mfn(*entry), mfn_t(0))) )

or call p2m_free_subentry() in remove_mapping handling:
  @@ -850,7 +852,12 @@ static int p2m_set_entry(struct p2m_domain *p2m,
       orig_pte = *entry;
 
       if ( removing_mapping )
  +    {
  +       if ( mfn_eq(pte_get_mfn(*entry), mfn_t(0) )
  +            p2m_free_subtree(p2m, orig_pte, level,  virt_to_page(table), offsets[level]);
  +
         p2m_clean_pte(entry, p2m-&gt;clean_pte);
  +    }
       else
</pre>
    <pre>~ Oleksii
</pre>
  </body>
</html>

--------------JjfAIznUMdWgBed42B00sOpd--

