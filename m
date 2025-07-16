Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6632DB074D0
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 13:32:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045088.1415163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc0Mo-0007uj-Ld; Wed, 16 Jul 2025 11:32:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045088.1415163; Wed, 16 Jul 2025 11:32:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc0Mo-0007sm-I9; Wed, 16 Jul 2025 11:32:06 +0000
Received: by outflank-mailman (input) for mailman id 1045088;
 Wed, 16 Jul 2025 11:32:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vAMf=Z5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uc0Mn-0007qi-Qc
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 11:32:05 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7fc9e0b1-6238-11f0-a319-13f23c93f187;
 Wed, 16 Jul 2025 13:32:05 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-60780d74c85so9554552a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 04:32:05 -0700 (PDT)
Received: from [192.168.1.17] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e82645f2sm1160662166b.89.2025.07.16.04.32.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 04:32:03 -0700 (PDT)
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
X-Inumbo-ID: 7fc9e0b1-6238-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752665524; x=1753270324; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+u1+elnhIj0NmaeeSOnfVplZ6JOvR2xCzuqOH7iZ3Q=;
        b=Uli7bdFFQwZd7Q68GEhHHUti4Qeew5Hs3V550QzKICRu/DEagOv3947sHlst+t3hvs
         TlwEmPWQBJjVjo2n1A/ICiiRWN/LeDeUwedp7ex4gHJD6vMR84H3xwKR3Q+0TvVUxxEV
         dpXbvl7JP0UWmPWK1toyvccFXXB4saTVIKSfFP22BLzg3UL9Xt4j8PHXsV336ob9Uq2E
         VnhWOWvB4uTVNaLXp2sHraAD7/Otg4NRcYDsmsS13bbydw2LjCw4g/q1zgLUWky9QCPF
         qd3kVFb1NVi7bBadabHYQ+eq4tEzPDXvREB4b+MSD/EKiWMH1WifiBhZRU9mR5uDv+Gr
         XqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752665524; x=1753270324;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I+u1+elnhIj0NmaeeSOnfVplZ6JOvR2xCzuqOH7iZ3Q=;
        b=rYqJBeh73Byll93gzMccHT52ZDPdOmi5amjhTNFxV9EFFJxef2dI54L56TtwItMFED
         swJM9Fir9CPYfF23NA0tAHZhjDXJ18TC1ILb8sfUB8VLqhSv+z4IY6rqJYNmxR3eHL3d
         ulNrtfNhFC6sRa8f4Ww7ZmGQvekL4Bah5S8PspsYi41/lW0mejqXyUugz2g7xLByfyVK
         F/qWgqR3bUftHyK7ywt2VeFB10cGNmyc/tJ33+4qFGbVnpAKZgUH63E1gi15i33dPrGI
         gI3JxXQFeOfzB5fpZX7HbnJdjprnEVgrSgFvdHCvDBtsRbs6ezI0f+o3av1eh1iTqOpC
         ccdw==
X-Forwarded-Encrypted: i=1; AJvYcCW+BJ//+zrklPamV/tbR5Z+mFPHSTt8bt0AtSzBJ+qajbTDooF9s9MH3etoNyM1AKGW/LtwGWh1ne8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwGPa8tS0xW8VGgms3Ry2iG8Gj0PuG3w1MbNGBwTstY9UjEB8N/
	VVFdPKF/cmV6Co+3KzuUXvavtoVHIY1PA4++j76Rwx75tJujXaaeRmXV
X-Gm-Gg: ASbGncudc/+3BiB4YKm3tbSylR24McTeSy8DNJ6ED5+H6p3MYUg7u6NHJaqdFEUY2wu
	OXM7H1ovLYSrc586/tBTvAQTplDy9O/DcPcvYaXQ0LCF2fh0NcuuoSMmDw/E7/eb6dVNQ2rWLrA
	rSqSZtncm+EuReeAuBe+GO/wGP5gg8u3K/BRNc8tq1C+aOeDapA6rzj49Hr2jkHR6JnzB+Ikcdc
	icOe7JM6cKH9VUMvjfiCLoqUl5AiPVKPuIsAsyMJWX5dlSwiJC93Y6B8QPeWMxfWX/kk30QRDF6
	XdamxsLzHflYLDmhtv9H6tJwGeeBFTYlxxMwjEfccl565JbbsOylZnF/Vb9Nap+LU/AwLKTaXBO
	OaZQA2RTWrQC6aJRipJ/Wty1a0iG6loX6vzGnDFExokSHWwdRMVZehuMGorpz23EvAkG1OKxl
X-Google-Smtp-Source: AGHT+IFrS2zL1LcvaSeb57iPGQSf/3u9OrhgArpDYhF26FErCnxTyhya5TckwVwsaKeP6lK4wrG7hA==
X-Received: by 2002:a17:907:9809:b0:ae0:b22a:29b4 with SMTP id a640c23a62f3a-ae9c9ac18c2mr283034466b.39.1752665523953;
        Wed, 16 Jul 2025 04:32:03 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------PfpSnGn0zA8m4Ykow3iuP10w"
Message-ID: <b0013513-2646-4de4-a172-0d2ea571a3e8@gmail.com>
Date: Wed, 16 Jul 2025 13:32:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/17] xen/riscv: implement p2m_next_level()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <cc696a9e4e74233c81f0cbcfd303cee91b8271af.1749555949.git.oleksii.kurochko@gmail.com>
 <1496586d-484c-4e99-aea7-974be335150f@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1496586d-484c-4e99-aea7-974be335150f@suse.com>

This is a multi-part message in MIME format.
--------------PfpSnGn0zA8m4Ykow3iuP10w
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 7/2/25 10:35 AM, Jan Beulich wrote:
> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/p2m.c
>> +++ b/xen/arch/riscv/p2m.c
>> @@ -387,6 +387,17 @@ static inline bool p2me_is_valid(struct p2m_domain *p2m, pte_t pte)
>>       return p2m_type_radix_get(p2m, pte) != p2m_invalid;
>>   }
>>   
>> +/*
>> + * pte_is_* helpers are checking the valid bit set in the
>> + * PTE but we have to check p2m_type instead (look at the comment above
>> + * p2me_is_valid())
>> + * Provide our own overlay to check the valid bit.
>> + */
>> +static inline bool p2me_is_mapping(struct p2m_domain *p2m, pte_t pte)
>> +{
>> +    return p2me_is_valid(p2m, pte) && (pte.pte & PTE_ACCESS_MASK);
>> +}
> Same question as on the earlier patch - does P2M type apply to intermediate
> page tables at all? (Conceptually it shouldn't.)

It doesn't matter whether it is an intermediate page table or a leaf PTE pointing
to a page — PTE should be valid. Considering that in the current implementation
it’s possible for PTE.v = 0 but P2M.v = 1, it is better to check P2M.v instead
of PTE.v.

>
>> @@ -492,6 +503,70 @@ static pte_t p2m_entry_from_mfn(struct p2m_domain *p2m, mfn_t mfn, p2m_type_t t,
>>       return e;
>>   }
>>   
>> +/* Generate table entry with correct attributes. */
>> +static pte_t page_to_p2m_table(struct p2m_domain *p2m, struct page_info *page)
>> +{
>> +    /*
>> +     * Since this function generates a table entry, according to "Encoding
>> +     * of PTE R/W/X fields," the entry's r, w, and x fields must be set to 0
>> +     * to point to the next level of the page table.
>> +     * Therefore, to ensure that an entry is a page table entry,
>> +     * `p2m_access_n2rwx` is passed to `mfn_to_p2m_entry()` as the access value,
>> +     * which overrides whatever was passed as `p2m_type_t` and guarantees that
>> +     * the entry is a page table entry by setting r = w = x = 0.
>> +     */
>> +    return p2m_entry_from_mfn(p2m, page_to_mfn(page), p2m_ram_rw, p2m_access_n2rwx);
> Similarly P2M access shouldn't apply to intermediate page tables. (Moot
> with that, but (ab)using p2m_access_n2rwx would also look wrong: You did
> read what it means, didn't you?)

|p2m_access_n2rwx| was chosen not really because of the description mentioned near
its declaration, but because it sets r=w=x=0, which RISC-V expects for a PTE that
points to the next-level page table.

Generally, I agree that P2M access shouldn't be applied to intermediate page tables.

What I can suggest in this case is to use|p2m_access_rwx| instead of|p2m_access_n2rwx|,
which will ensure that the P2M access type isn't applied when|p2m_entry_from_mfn() |is called, and then, after calling|p2m_entry_from_mfn()|, simply set|PTE.r,w,x=0|.
So this function will look like:
     /* Generate table entry with correct attributes. */
     static pte_t page_to_p2m_table(struct p2m_domain *p2m, struct page_info *page)
     {
         /*
         * p2m_ram_rw is chosen for a table entry as p2m table should be valid
         * from both P2M and hardware point of view.
         *
         * p2m_access_rwx is chosen to restrict access permissions, what mean
         * do not apply access permission for a table entry
         */
         pte_t pte = p2m_pte_from_mfn(p2m, page_to_mfn(page), _gfn(0), p2m_ram_rw,
                                     p2m_access_rwx);

         /*
         * Since this function generates a table entry, according to "Encoding
         * of PTE R/W/X fields," the entry's r, w, and x fields must be set to 0
         * to point to the next level of the page table.
         */
         pte.pte &= ~PTE_ACCESS_MASK;

         return pte;
     }

Does this make sense? Or would it be better to keep the current version of
|page_to_p2m_table()| and just improve the comment explaining why|p2m_access_n2rwx |is used for a table entry?

>
>> +}
>> +
>> +static struct page_info *p2m_alloc_page(struct domain *d)
>> +{
>> +    struct page_info *pg;
>> +
>> +    /*
>> +     * For hardware domain, there should be no limit in the number of pages that
>> +     * can be allocated, so that the kernel may take advantage of the extended
>> +     * regions. Hence, allocate p2m pages for hardware domains from heap.
>> +     */
>> +    if ( is_hardware_domain(d) )
>> +    {
>> +        pg = alloc_domheap_page(d, MEMF_no_owner);
>> +        if ( pg == NULL )
>> +            printk(XENLOG_G_ERR "Failed to allocate P2M pages for hwdom.\n");
>> +    }
> The comment looks to have been taken verbatim from Arm. Whatever "extended
> regions" are, does the same concept even exist on RISC-V?

Initially, I missed that it’s used only for Arm. Since it was mentioned in
|doc/misc/xen-command-line.pandoc|, I assumed it applied to all architectures.
But now I see that it’s Arm-specific:: ### ext_regions (Arm)

>
> Also, special casing Dom0 like this has benefits, but also comes with a
> pitfall: If the system's out of memory, allocations will fail. A pre-
> populated pool would avoid that (until exhausted, of course). If special-
> casing of Dom0 is needed, I wonder whether ...
>
>> +    else
>> +    {
>> +        spin_lock(&d->arch.paging.lock);
>> +        pg = page_list_remove_head(&d->arch.paging.p2m_freelist);
>> +        spin_unlock(&d->arch.paging.lock);
>> +    }
> ... going this path but with a Dom0-only fallback to general allocation
> wouldn't be the better route.

IIUC, then it should be something like:
   static struct page_info *p2m_alloc_page(struct domain *d)
   {
       struct page_info *pg;
       
       spin_lock(&d->arch.paging.lock);
       pg = page_list_remove_head(&d->arch.paging.p2m_freelist);
       spin_unlock(&d->arch.paging.lock);

       if ( !pg && is_hardware_domain(d) )
       {
             /* Need to allocate more memory from domheap */
             pg = alloc_domheap_page(d, MEMF_no_owner);
             if ( pg == NULL )
             {
                 printk(XENLOG_ERR "Failed to allocate pages.\n");
                 return pg;
             }
             ACCESS_ONCE(d->arch.paging.total_pages)++;
             page_list_add_tail(pg, &d->arch.paging.freelist);
       }
    
       return pg;
}

And basically use|d->arch.paging.freelist| for both dom0less and dom0 domains,
with the only difference being that in the case of Dom0,|d->arch.paging.freelist |could be extended.

Do I understand your idea correctly?

(
Probably, this is the reply you’re referring to:
   https://lore.kernel.org/xen-devel/43e89225-5e69-49a6-a8c8-bda6d120d8ff@suse.com/,
at the moment, I can't find a better one.
)


>
>> +    return pg;
>> +}
>> +
>> +/* Allocate a new page table page and hook it in via the given entry. */
>> +static int p2m_create_table(struct p2m_domain *p2m, pte_t *entry)
>> +{
>> +    struct page_info *page;
>> +    pte_t *p;
>> +
>> +    ASSERT(!p2me_is_valid(p2m, *entry));
>> +
>> +    page = p2m_alloc_page(p2m->domain);
>> +    if ( page == NULL )
>> +        return -ENOMEM;
>> +
>> +    page_list_add(page, &p2m->pages);
>> +
>> +    p = __map_domain_page(page);
>> +    clear_page(p);
>> +
>> +    unmap_domain_page(p);
> clear_domain_page()? Or actually clear_and_clean_page()?

Agree, clear_and_clean_page() would be better here.

>
>> @@ -516,9 +591,33 @@ static int p2m_next_level(struct p2m_domain *p2m, bool alloc_tbl,
>>                             unsigned int level, pte_t **table,
>>                             unsigned int offset)
>>   {
>> -    panic("%s: hasn't been implemented yet\n", __func__);
>> +    pte_t *entry;
>> +    int ret;
>> +    mfn_t mfn;
>> +
>> +    entry = *table + offset;
>> +
>> +    if ( !p2me_is_valid(p2m, *entry) )
>> +    {
>> +        if ( !alloc_tbl )
>> +            return GUEST_TABLE_MAP_NONE;
>> +
>> +        ret = p2m_create_table(p2m, entry);
>> +        if ( ret )
>> +            return GUEST_TABLE_MAP_NOMEM;
>> +    }
>> +
>> +    /* The function p2m_next_level() is never called at the last level */
>> +    ASSERT(level != 0);
> Logically you would perhaps better do this ahead of trying to allocate a
> page table. Calls here with level == 0 are invalid in all cases aiui, not
> just when you make it here.

It makes sense. I will move ASSERT() to the start of the function
p2m_next_level().

>> +    if ( p2me_is_mapping(p2m, *entry) )
>> +        return GUEST_TABLE_SUPER_PAGE;
>> +
>> +    mfn = mfn_from_pte(*entry);
>> +
>> +    unmap_domain_page(*table);
>> +    *table = map_domain_page(mfn);
> Just to mention it (may not need taking care of right away), there's an
> inefficiency here: In p2m_create_table() you map the page to clear it.
> Then you tear down that mapping, just to re-establish it here.

I will add:
     /*
      * TODO: There's an inefficiency here:
      *       In p2m_create_table(), the page is mapped to clear it.
      *       Then that mapping is torn down in p2m_create_table(),
      *       only to be re-established here.
      */
     *table = map_domain_page(mfn);

Thanks.

~ Oleksii

--------------PfpSnGn0zA8m4Ykow3iuP10w
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
    <div class="moz-cite-prefix">On 7/2/25 10:35 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1496586d-484c-4e99-aea7-974be335150f@suse.com">
      <pre wrap="" class="moz-quote-pre">On 10.06.2025 15:05, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -387,6 +387,17 @@ static inline bool p2me_is_valid(struct p2m_domain *p2m, pte_t pte)
     return p2m_type_radix_get(p2m, pte) != p2m_invalid;
 }
 
+/*
+ * pte_is_* helpers are checking the valid bit set in the
+ * PTE but we have to check p2m_type instead (look at the comment above
+ * p2me_is_valid())
+ * Provide our own overlay to check the valid bit.
+ */
+static inline bool p2me_is_mapping(struct p2m_domain *p2m, pte_t pte)
+{
+    return p2me_is_valid(p2m, pte) &amp;&amp; (pte.pte &amp; PTE_ACCESS_MASK);
+}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Same question as on the earlier patch - does P2M type apply to intermediate
page tables at all? (Conceptually it shouldn't.)</pre>
    </blockquote>
    <pre>It doesn't matter whether it is an intermediate page table or a leaf PTE pointing
to a page — PTE should be valid. Considering that in the current implementation
it’s possible for PTE.v = 0 but P2M.v = 1, it is better to check P2M.v instead
of PTE.v.

</pre>
    <blockquote type="cite"
      cite="mid:1496586d-484c-4e99-aea7-974be335150f@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -492,6 +503,70 @@ static pte_t p2m_entry_from_mfn(struct p2m_domain *p2m, mfn_t mfn, p2m_type_t t,
     return e;
 }
 
+/* Generate table entry with correct attributes. */
+static pte_t page_to_p2m_table(struct p2m_domain *p2m, struct page_info *page)
+{
+    /*
+     * Since this function generates a table entry, according to "Encoding
+     * of PTE R/W/X fields," the entry's r, w, and x fields must be set to 0
+     * to point to the next level of the page table.
+     * Therefore, to ensure that an entry is a page table entry,
+     * `p2m_access_n2rwx` is passed to `mfn_to_p2m_entry()` as the access value,
+     * which overrides whatever was passed as `p2m_type_t` and guarantees that
+     * the entry is a page table entry by setting r = w = x = 0.
+     */
+    return p2m_entry_from_mfn(p2m, page_to_mfn(page), p2m_ram_rw, p2m_access_n2rwx);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Similarly P2M access shouldn't apply to intermediate page tables. (Moot
with that, but (ab)using p2m_access_n2rwx would also look wrong: You did
read what it means, didn't you?)</pre>
    </blockquote>
    <pre data-start="77" data-end="282"><code data-start="77"
    data-end="95">p2m_access_n2rwx</code> was chosen not really because of the description mentioned near
its declaration, but because it sets r=w=x=0, which RISC-V expects for a PTE that
points to the next-level page table.

Generally, I agree that P2M access shouldn't be applied to intermediate page tables.

What I can suggest in this case is to use <code data-start="413"
    data-end="429">p2m_access_rwx</code> instead of <code
    data-start="443" data-end="461">p2m_access_n2rwx</code>,
which will ensure that the P2M access type isn't applied when <code
    data-start="527" data-end="549">p2m_entry_from_mfn()
</code>is called, and then, after calling <code data-start="585"
    data-end="607">p2m_entry_from_mfn()</code>, simply set <code
    data-start="622" data-end="635">PTE.r,w,x=0</code>.
So this function will look like:
    /* Generate table entry with correct attributes. */
    static pte_t page_to_p2m_table(struct p2m_domain *p2m, struct page_info *page)
    {
        /*
        * p2m_ram_rw is chosen for a table entry as p2m table should be valid
        * from both P2M and hardware point of view.
        *
        * p2m_access_rwx is chosen to restrict access permissions, what mean
        * do not apply access permission for a table entry 
        */
        pte_t pte = p2m_pte_from_mfn(p2m, page_to_mfn(page), _gfn(0), p2m_ram_rw,
                                    p2m_access_rwx);

        /*
        * Since this function generates a table entry, according to "Encoding
        * of PTE R/W/X fields," the entry's r, w, and x fields must be set to 0
        * to point to the next level of the page table.
        */
        pte.pte &amp;= ~PTE_ACCESS_MASK;

        return pte;
    }

Does this make sense? Or would it be better to keep the current version of
<code data-start="772" data-end="793">page_to_p2m_table()</code> and just improve the comment explaining why <code
    data-start="840" data-end="858">p2m_access_n2rwx
</code>is used for a table entry?</pre>
    <blockquote type="cite"
      cite="mid:1496586d-484c-4e99-aea7-974be335150f@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+}
+
+static struct page_info *p2m_alloc_page(struct domain *d)
+{
+    struct page_info *pg;
+
+    /*
+     * For hardware domain, there should be no limit in the number of pages that
+     * can be allocated, so that the kernel may take advantage of the extended
+     * regions. Hence, allocate p2m pages for hardware domains from heap.
+     */
+    if ( is_hardware_domain(d) )
+    {
+        pg = alloc_domheap_page(d, MEMF_no_owner);
+        if ( pg == NULL )
+            printk(XENLOG_G_ERR "Failed to allocate P2M pages for hwdom.\n");
+    }
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
The comment looks to have been taken verbatim from Arm. Whatever "extended
regions" are, does the same concept even exist on RISC-V?</pre>
    </blockquote>
    <pre>Initially, I missed that it’s used only for Arm. Since it was mentioned in
<code data-start="75" data-end="109">doc/misc/xen-command-line.pandoc</code>, I assumed it applied to all architectures.
But now I see that it’s Arm-specific:: ### ext_regions (Arm)

</pre>
    <blockquote type="cite"
      cite="mid:1496586d-484c-4e99-aea7-974be335150f@suse.com">
      <pre wrap="" class="moz-quote-pre">

Also, special casing Dom0 like this has benefits, but also comes with a
pitfall: If the system's out of memory, allocations will fail. A pre-
populated pool would avoid that (until exhausted, of course). If special-
casing of Dom0 is needed, I wonder whether ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    else
+    {
+        spin_lock(&amp;d-&gt;arch.paging.lock);
+        pg = page_list_remove_head(&amp;d-&gt;arch.paging.p2m_freelist);
+        spin_unlock(&amp;d-&gt;arch.paging.lock);
+    }
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... going this path but with a Dom0-only fallback to general allocation
wouldn't be the better route.</pre>
    </blockquote>
    <pre>IIUC, then it should be something like:
  static struct page_info *p2m_alloc_page(struct domain *d)
  {
      struct page_info *pg;
      
      spin_lock(&amp;d-&gt;arch.paging.lock);
      pg = page_list_remove_head(&amp;d-&gt;arch.paging.p2m_freelist);
      spin_unlock(&amp;d-&gt;arch.paging.lock);

      if ( !pg &amp;&amp; is_hardware_domain(d) )
      {
            /* Need to allocate more memory from domheap */
            pg = alloc_domheap_page(d, MEMF_no_owner);
            if ( pg == NULL )
            {
                printk(XENLOG_ERR "Failed to allocate pages.\n");
                return pg;
            }
            ACCESS_ONCE(d-&gt;arch.paging.total_pages)++;
            page_list_add_tail(pg, &amp;d-&gt;arch.paging.freelist);
      }
   
      return pg;
}
</pre>
    <pre data-start="799" data-end="984">And basically use <code
    data-start="817" data-end="842">d-&gt;arch.paging.freelist</code> for both dom0less and dom0 domains,
with the only difference being that in the case of Dom0, <code
    data-start="938" data-end="963">d-&gt;arch.paging.freelist
</code>could be extended.</pre>
    <pre data-start="986" data-end="1022">Do I understand your idea correctly?</pre>
    <pre data-start="1024" data-end="1208" data-is-last-node=""
    data-is-only-node="">(
Probably, this is the reply you’re referring to:
  <a data-start="1079" data-end="1159" rel="noopener" target="_new"
    class="moz-txt-link-freetext"
href="https://lore.kernel.org/xen-devel/43e89225-5e69-49a6-a8c8-bda6d120d8ff@suse.com/">https://lore.kernel.org/xen-devel/43e89225-5e69-49a6-a8c8-bda6d120d8ff@suse.com/</a>,
at the moment, I can't find a better one.
)</pre>
    <pre>

</pre>
    <blockquote type="cite"
      cite="mid:1496586d-484c-4e99-aea7-974be335150f@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    return pg;
+}
+
+/* Allocate a new page table page and hook it in via the given entry. */
+static int p2m_create_table(struct p2m_domain *p2m, pte_t *entry)
+{
+    struct page_info *page;
+    pte_t *p;
+
+    ASSERT(!p2me_is_valid(p2m, *entry));
+
+    page = p2m_alloc_page(p2m-&gt;domain);
+    if ( page == NULL )
+        return -ENOMEM;
+
+    page_list_add(page, &amp;p2m-&gt;pages);
+
+    p = __map_domain_page(page);
+    clear_page(p);
+
+    unmap_domain_page(p);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
clear_domain_page()? Or actually clear_and_clean_page()?</pre>
    </blockquote>
    <pre>Agree, clear_and_clean_page() would be better here.

</pre>
    <blockquote type="cite"
      cite="mid:1496586d-484c-4e99-aea7-974be335150f@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -516,9 +591,33 @@ static int p2m_next_level(struct p2m_domain *p2m, bool alloc_tbl,
                           unsigned int level, pte_t **table,
                           unsigned int offset)
 {
-    panic("%s: hasn't been implemented yet\n", __func__);
+    pte_t *entry;
+    int ret;
+    mfn_t mfn;
+
+    entry = *table + offset;
+
+    if ( !p2me_is_valid(p2m, *entry) )
+    {
+        if ( !alloc_tbl )
+            return GUEST_TABLE_MAP_NONE;
+
+        ret = p2m_create_table(p2m, entry);
+        if ( ret )
+            return GUEST_TABLE_MAP_NOMEM;
+    }
+
+    /* The function p2m_next_level() is never called at the last level */
+    ASSERT(level != 0);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Logically you would perhaps better do this ahead of trying to allocate a
page table. Calls here with level == 0 are invalid in all cases aiui, not
just when you make it here.</pre>
    </blockquote>
    <pre>It makes sense. I will move ASSERT() to the start of the function 
p2m_next_level().

</pre>
    <blockquote type="cite"
      cite="mid:1496586d-484c-4e99-aea7-974be335150f@suse.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    if ( p2me_is_mapping(p2m, *entry) )
+        return GUEST_TABLE_SUPER_PAGE;
+
+    mfn = mfn_from_pte(*entry);
+
+    unmap_domain_page(*table);
+    *table = map_domain_page(mfn);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Just to mention it (may not need taking care of right away), there's an
inefficiency here: In p2m_create_table() you map the page to clear it.
Then you tear down that mapping, just to re-establish it here.</pre>
    </blockquote>
    <pre>I will add:
    /*
     * TODO: There's an inefficiency here:
     *       In p2m_create_table(), the page is mapped to clear it.
     *       Then that mapping is torn down in p2m_create_table(),
     *       only to be re-established here.
     */
    *table = map_domain_page(mfn);

Thanks.

~ Oleksii</pre>
  </body>
</html>

--------------PfpSnGn0zA8m4Ykow3iuP10w--

