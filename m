Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E556B22B20
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 16:53:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078791.1439829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulqMk-0004hb-1I; Tue, 12 Aug 2025 14:52:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078791.1439829; Tue, 12 Aug 2025 14:52:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulqMj-0004fA-U0; Tue, 12 Aug 2025 14:52:41 +0000
Received: by outflank-mailman (input) for mailman id 1078791;
 Tue, 12 Aug 2025 14:52:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OhhA=2Y=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ulqMi-0004es-N5
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 14:52:41 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd2410d0-778b-11f0-a327-13f23c93f187;
 Tue, 12 Aug 2025 16:52:39 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-61580eb7995so11235477a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 12 Aug 2025 07:52:38 -0700 (PDT)
Received: from [192.168.1.17] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8f28374sm20606620a12.24.2025.08.12.07.52.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Aug 2025 07:52:36 -0700 (PDT)
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
X-Inumbo-ID: fd2410d0-778b-11f0-a327-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755010357; x=1755615157; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vcsLAubzFhAWxIF25HITPyXvlnHVvVmwmyePy+kyVVc=;
        b=B72wJobrESusdJ7vTvT6k+AqZJYyxbLBOf6e55O7Q3kyjMtWIVZLfsif0gVeW+hI7G
         ELKSDKH5fhBaTMQdgwrlGnqOiuBgu4d9ZqSzW5Jtj11JHX71DLKVCDkAHwgAiPNYhL9Q
         rjoAVu8ccKDZ8V/Setjdivui3yWHQMbA+DI6aqbEvhdUu2C1ZR2ZPt0r24zYj3FRPP9F
         UGXZl5F74p3ble6dMHN3UCDwPfMXQLCwx9oQTvZNr7HTVa2BmdDWl4Zz9t67OJ3s9W7A
         nBiv/bIzGCCHZHtVeuQFKuiMjnKrwzH+zmMHKE6WzotPwuzILLrbuY/RWCFe8LemK0Hc
         slHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755010357; x=1755615157;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vcsLAubzFhAWxIF25HITPyXvlnHVvVmwmyePy+kyVVc=;
        b=MBys+TT0AvyEUOYlr1Yv3kw0tot56iHFjOoqEoMHh+TUw/BnGxl3CvTZ84yvSo4LqJ
         q9/4zq0MEqOK27J0SXSgJv3YgUJduoGfknhL7wvhPfCxPXmGoQnVg84HFhH3K63+Ilj2
         M1gSpJxkoLhldzP2O1skA9nWCrCKCiyZFUApEhxBOIL+LZHZXqWCiuEOZQxaV7hlWfQZ
         fQ6tA26yTt+v0ineoAe8Wv0tQGFXrt20B8m3iB5+OYmq8GIjqXVBr7p/H/PlccyFHrep
         HjWH+GOCq0kcksNejMPzzCa0z4ZD5EWbZQp2cKvp6GaN0pWfb1vSREzwEOdYZ6ZvbA7q
         BIvg==
X-Forwarded-Encrypted: i=1; AJvYcCXgcxHiVVGXkABtvVacXSSeI9188AGN+c3naFiGHiAwSvJaNTF55t8gOfC9tmmNeC2qsM8Tr2Pdyns=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxfWbgxtpkw1sLghqroO98KaCqDBoeINYgPRWwURrk45Fynj/8R
	s3QEDOTFgtv5+SCwKQr6AaSfed14zzhxRk7tg6jc/r+shZVGw1FEWNXQ
X-Gm-Gg: ASbGncv1d7GonnQ4VjwsKyMmF30wHtK6aNAdWuQRNx/4OWvNa/pT4W0kPrEO6WDZb2s
	cdH93RP60VqCqteSUq9TheL/WugVfb3SQQ3Kf36RLOZV8yWYa2gVEJ0PmbN6cX3zdXTx+Jj4KNQ
	NCqTaBVz1gbbNYJikgQEYWNyYgir0w8V+sFx3XQmZ75m5PLBzARpK3VBdXF6YNSHlm2JHLhGWqx
	ZVMA9V3wNmG5tlP7aNhsO02pRDuuY3kbA4Xjm4zwXhVImRV2uRgtM66Fd5UYRKBFOL3SwOzO1/D
	gvN7rAMX4LCfMa0/86LpV8DQLYjXCGHdHpgZ6CzrIlZx9teZOUiad4kxh2ar/ZyhNolWJxgiE4o
	f1SE8OX/WLCLycwem8gxoPeqa9KoELFLbdfSszdwBaIEEEh5sUnEEIAEVGInxXdfWbK6iMZ2J
X-Google-Smtp-Source: AGHT+IFhaJNYuEt2o1kce8dIKJ1aA2RRtRhSCokuvH9RkfNga3OWtUNk7/5sBX2UTtnTByuUUzwfmQ==
X-Received: by 2002:a50:9356:0:b0:615:7e88:ef95 with SMTP id 4fb4d7f45d1cf-6184dbb3101mr2134601a12.11.1755010356974;
        Tue, 12 Aug 2025 07:52:36 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------nNjh60kUbwPkc03zVml00qG0"
Message-ID: <b8781695-5fb4-456b-8c40-6bebea5a1af5@gmail.com>
Date: Tue, 12 Aug 2025 16:52:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 20/20] xen/riscv: introduce metadata table to store P2M
 type
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <802d757c167121c0a5ae2e529f5a365f779c5e59.1753973161.git.oleksii.kurochko@gmail.com>
 <12adb163-5f6b-4478-9592-7423b8db69a9@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <12adb163-5f6b-4478-9592-7423b8db69a9@suse.com>

This is a multi-part message in MIME format.
--------------nNjh60kUbwPkc03zVml00qG0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 8/11/25 5:44 PM, Jan Beulich wrote:
> On 31.07.2025 17:58, Oleksii Kurochko wrote:
>> RISC-V's PTE has only two available bits that can be used to store the P2M
>> type. This is insufficient to represent all the current RISC-V P2M types.
>> Therefore, some P2M types must be stored outside the PTE bits.
>>
>> To address this, a metadata table is introduced to store P2M types that
>> cannot fit in the PTE itself. Not all P2M types are stored in the
>> metadata table—only those that require it.
>>
>> The metadata table is linked to the intermediate page table via the
>> `struct page_info`'s list field of the corresponding intermediate page.
>>
>> To simplify the allocation and linking of intermediate and metadata page
>> tables, `p2m_{alloc,free}_table()` functions are implemented.
>>
>> These changes impact `p2m_split_superpage()`, since when a superpage is
>> split, it is necessary to update the metadata table of the new
>> intermediate page table — if the entry being split has its P2M type set
>> to `p2m_ext_storage` in its `P2M_TYPES` bits.
> Oh, this was an aspect I didn't realize when commenting on the name of
> the enumerator. I think you want to keep the name for the purpose here,
> but you better wouldn't apply relational operators to it (and hence
> have a second value to serve that purpose).

It could be done in this way, but I think that it would be better just to have
one value with a better name as I suggested in the reply to other patch.

>
>> In addition to updating
>> the metadata of the new intermediate page table, the corresponding entry
>> in the metadata for the original superpage is invalidated.
>>
>> Also, update p2m_{get,set}_type to work with P2M types which don't fit
>> into PTE bits.
>>
>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
> No Suggested-by: or anything?

Sorry for that, Suggested-by should be added here, I'll fix that in the
next patch series version.

>
>> --- a/xen/arch/riscv/include/asm/mm.h
>> +++ b/xen/arch/riscv/include/asm/mm.h
>> @@ -150,6 +150,15 @@ struct page_info
>>               /* Order-size of the free chunk this page is the head of. */
>>               unsigned int order;
>>           } free;
>> +
>> +        /* Page is used to store metadata: p2m type. */
> That's not correct. The page thus described is what the pointer below
> points to. Here it's more like "Page is used as an intermediate P2M
> page table".
>
>> +        struct {
>> +            /*
>> +             * Pointer to a page which store metadata for an intermediate page
>> +             * table.
>> +             */
>> +            struct page_info *metadata;
>> +        } md;
> In the description you say you would re-use the list field.

It was so in a first version of storing P2M type outside PTE bits, so, it is a
stale part of the commit message. I'll correct it.

>
>> --- a/xen/arch/riscv/p2m.c
>> +++ b/xen/arch/riscv/p2m.c
>> @@ -101,7 +101,16 @@ static int p2m_alloc_root_table(struct p2m_domain *p2m)
>>   {
>>       struct domain *d = p2m->domain;
>>       struct page_info *page;
>> -    const unsigned int nr_root_pages = P2M_ROOT_PAGES;
>> +    /*
>> +     * If the root page table starts at Level <= 2, and since only 1GB, 2MB,
>> +     * and 4KB mappings are supported (as enforced by the ASSERT() in
>> +     * p2m_set_entry()), it is necessary to allocate P2M_ROOT_PAGES for
>> +     * the root page table itself, plus an additional P2M_ROOT_PAGES for
>> +     * metadata storage. This is because only two free bits are available in
>> +     * the PTE, which are not sufficient to represent all possible P2M types.
>> +     */
>> +    const unsigned int nr_root_pages = P2M_ROOT_PAGES *
>> +                                       ((P2M_ROOT_LEVEL <= 2) ? 2 : 1);
>>   
>>       /*
>>        * Return back nr_root_pages to assure the root table memory is also
>> @@ -114,6 +123,23 @@ static int p2m_alloc_root_table(struct p2m_domain *p2m)
>>       if ( !page )
>>           return -ENOMEM;
>>   
>> +    if ( P2M_ROOT_LEVEL <= 2 )
>> +    {
>> +        /*
>> +         * In the case where P2M_ROOT_LEVEL <= 2, it is necessary to allocate
>> +         * a page of the same size as that used for the root page table.
>> +         * Therefore, p2m_allocate_root() can be safely reused.
>> +         */
>> +        struct page_info *metadata = p2m_allocate_root(d);
>> +        if ( !metadata )
>> +        {
>> +            free_domheap_pages(page, P2M_ROOT_ORDER);
>> +            return -ENOMEM;
>> +        }
>> +
>> +        page->v.md.metadata = metadata;
> Don't you need to install such a link for every one of the 4 pages?

Yes, I need to do that. Thanks.

>
>> @@ -198,24 +224,25 @@ static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
>>       return __map_domain_page(p2m->root + root_table_indx);
>>   }
>>   
>> -static int p2m_set_type(pte_t *pte, p2m_type_t t)
>> +static void p2m_set_type(pte_t *pte, const p2m_type_t t, const unsigned int i)
>>   {
>> -    int rc = 0;
>> -
>>       if ( t > p2m_ext_storage )
>> -        panic("unimplemeted\n");
>> +    {
>> +        ASSERT(pte);
>> +
>> +        pte[i].pte = t;
> What does i identify here?

An index in metadata page where P2M type for corresponding PTE is stored.
I will re-name it to metadata_indx for more clarity.

>
>> +    }
>>       else
>>           pte->pte |= MASK_INSR(t, P2M_TYPE_PTE_BITS_MASK);
>> -
>> -    return rc;
>>   }
>>   
>> -static p2m_type_t p2m_get_type(const pte_t pte)
>> +static p2m_type_t p2m_get_type(const pte_t pte, const pte_t *metadata,
>> +                               const unsigned int i)
>>   {
>>       p2m_type_t type = MASK_EXTR(pte.pte, P2M_TYPE_PTE_BITS_MASK);
>>   
>>       if ( type == p2m_ext_storage )
>> -        panic("unimplemented\n");
>> +        type = metadata[i].pte;
>>   
>>       return type;
>>   }
> Overall this feels pretty fragile, as the caller has to pass several values
> which all need to be in sync with one another. If you ...

Generally, agree it is fragile enough.

>
>> @@ -265,7 +292,10 @@ static void p2m_set_permission(pte_t *e, p2m_type_t t)
>>       }
>>   }
>>   
>> -static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t, bool is_table)
>> +static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t,
>> +                              struct page_info *metadata_pg,
>> +                              const unsigned int indx,
>> +                              bool is_table)
>>   {
>>       pte_t e = (pte_t) { PTE_VALID };
>>   
>> @@ -285,12 +315,21 @@ static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t, bool is_table)
>>   
>>       if ( !is_table )
>>       {
>> +        pte_t *metadata = __map_domain_page(metadata_pg);
> ... map the page anyway, no matter whether ...
>
>>           p2m_set_permission(&e, t);
>>   
>> +        metadata[indx].pte = p2m_invalid;
>> +
>>           if ( t < p2m_ext_storage )
>> -            p2m_set_type(&e, t);
>> +            p2m_set_type(&e, t, indx);
>>           else
>> -            panic("unimplemeted\n");
>> +        {
>> +            e.pte |= MASK_INSR(p2m_ext_storage, P2M_TYPE_PTE_BITS_MASK);
>> +            p2m_set_type(metadata, t, indx);
>> +        }
> ... you'll actually use it, maybe best to map both pages at the same point?

Only one page is mapped here (?) and it should be mapped here, I suppose, it could be a case
when a previous set type is overwritten, so, it could be needed to invalidate a type written
in metadata.

> And as said elsewhere, no, I don't think you want to use p2m_set_type() for
> two entirely different purposes.

I wasn't very happy too, but, at the same time I didn't want to have a prototype where
it isn't really clear when it is needed to pass metadata and where it is not. But considering
your comments then this one solution isn't good too. So maybe it would be better just have
two separate functions: p2m_set_pte_type() and p2m_set_metadata_type().

>
>> @@ -323,22 +364,71 @@ static struct page_info *p2m_alloc_page(struct p2m_domain *p2m)
>>       return pg;
>>   }
>>   
>> +static void p2m_free_page(struct p2m_domain *p2m, struct page_info *pg);
>> +
>> +/*
>> + * Allocate a page table with an additional extra page to store
>> + * metadata for each entry of the page table.
>> + * Link this metadata page to page table page's list field.
>> + */
>> +static struct page_info * p2m_alloc_table(struct p2m_domain *p2m)
> Nit: Stray blank after * again.
>
>> +{
>> +    enum table_type
>> +    {
>> +        INTERMEDIATE_TABLE=0,
> If you really think you need the "= 0", then please with blanks around '='.
>
>> +        /*
>> +         * At the moment, metadata is going to store P2M type
>> +         * for each PTE of page table.
>> +         */
>> +        METADATA_TABLE,
>> +        TABLE_MAX
>> +    };
>> +
>> +    struct page_info *tables[TABLE_MAX];
>> +
>> +    for ( unsigned int i = 0; i < TABLE_MAX; i++ )
>> +    {
>> +        tables[i] = p2m_alloc_page(p2m);
>> +
>> +        if ( !tables[i] )
>> +            goto out;
>> +
>> +        clear_and_clean_page(tables[i]);
>> +    }
>> +
>> +    tables[INTERMEDIATE_TABLE]->v.md.metadata = tables[METADATA_TABLE];
>> +
>> +    return tables[INTERMEDIATE_TABLE];
>> +
>> + out:
>> +    for ( unsigned int i = 0; i < TABLE_MAX; i++ )
>> +        if ( tables[i] )
> You didn't clear all of tables[] first, though.

Oh, right, i missed an initalizer for tables[] array.

>   This kind of cleanup is
> often better done as
>
>      while ( i-- > 0 )
>          ...
>
> You don't even need an if() then, as you know allocations succeeded for all
> earlier array slots.

Yes, it looks very nice.

>
>> +            p2m_free_page(p2m, tables[i]);
>> +
>> +    return NULL;
>> +}
> I'm also surprised you allocate the metadata table no matter whether you'll
> actually need it. That'll double your average paging pool usage, when in a
> typical case only very few entries would actually require this extra
> storage.

Nice point, we could really do a delayed allocation instead and allocate only
when requested P2M type is > p2m_ext_storage.
I'll implement that.

>
>> @@ -453,10 +543,9 @@ static void p2m_put_2m_superpage(mfn_t mfn, p2m_type_t type)
>>   }
>>   
>>   /* Put any references on the page referenced by pte. */
>> -static void p2m_put_page(const pte_t pte, unsigned int level)
>> +static void p2m_put_page(const pte_t pte, unsigned int level, p2m_type_t p2mt)
>>   {
>>       mfn_t mfn = pte_get_mfn(pte);
>> -    p2m_type_t p2m_type = p2m_get_type(pte);
>>   
>>       ASSERT(pte_is_valid(pte));
>>   
>> @@ -470,10 +559,10 @@ static void p2m_put_page(const pte_t pte, unsigned int level)
>>       switch ( level )
>>       {
>>       case 1:
>> -        return p2m_put_2m_superpage(mfn, p2m_type);
>> +        return p2m_put_2m_superpage(mfn, p2mt);
>>   
>>       case 0:
>> -        return p2m_put_4k_page(mfn, p2m_type);
>> +        return p2m_put_4k_page(mfn, p2mt);
>>       }
>>   }
> Might it be better to introduce this function in this shape right away, in
> the earlier patch?

Agree, probably, I did that intentionally, but I don't remember why. I will try to
avoid these changes in this patch as it looks unnecessary here.

>
>> @@ -690,18 +791,23 @@ static int p2m_set_entry(struct p2m_domain *p2m,
>>       {
>>           /* We need to split the original page. */
>>           pte_t split_pte = *entry;
>> +        struct page_info *metadata = virt_to_page(table)->v.md.metadata;
> This (or along these lines) is how I would have expected things to be done
> elsewhere as well, limiting the amount of arguments you need to pass
> around.

I will try to re-use this approach elsewhere I can.

Thanks.

~ Oleksii

--------------nNjh60kUbwPkc03zVml00qG0
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
    <div class="moz-cite-prefix">On 8/11/25 5:44 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:12adb163-5f6b-4478-9592-7423b8db69a9@suse.com">
      <pre wrap="" class="moz-quote-pre">On 31.07.2025 17:58, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">RISC-V's PTE has only two available bits that can be used to store the P2M
type. This is insufficient to represent all the current RISC-V P2M types.
Therefore, some P2M types must be stored outside the PTE bits.

To address this, a metadata table is introduced to store P2M types that
cannot fit in the PTE itself. Not all P2M types are stored in the
metadata table—only those that require it.

The metadata table is linked to the intermediate page table via the
`struct page_info`'s list field of the corresponding intermediate page.

To simplify the allocation and linking of intermediate and metadata page
tables, `p2m_{alloc,free}_table()` functions are implemented.

These changes impact `p2m_split_superpage()`, since when a superpage is
split, it is necessary to update the metadata table of the new
intermediate page table — if the entry being split has its P2M type set
to `p2m_ext_storage` in its `P2M_TYPES` bits.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Oh, this was an aspect I didn't realize when commenting on the name of
the enumerator. I think you want to keep the name for the purpose here,
but you better wouldn't apply relational operators to it (and hence
have a second value to serve that purpose).</pre>
    </blockquote>
    <pre>It could be done in this way, but I think that it would be better just to have
one value with a better name as I suggested in the reply to other patch.

</pre>
    <blockquote type="cite"
      cite="mid:12adb163-5f6b-4478-9592-7423b8db69a9@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">In addition to updating
the metadata of the new intermediate page table, the corresponding entry
in the metadata for the original superpage is invalidated.

Also, update p2m_{get,set}_type to work with P2M types which don't fit
into PTE bits.

Signed-off-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
No Suggested-by: or anything?</pre>
    </blockquote>
    <pre>Sorry for that, Suggested-by should be added here, I'll fix that in the
next patch series version.

</pre>
    <blockquote type="cite"
      cite="mid:12adb163-5f6b-4478-9592-7423b8db69a9@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -150,6 +150,15 @@ struct page_info
             /* Order-size of the free chunk this page is the head of. */
             unsigned int order;
         } free;
+
+        /* Page is used to store metadata: p2m type. */
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
That's not correct. The page thus described is what the pointer below
points to. Here it's more like "Page is used as an intermediate P2M
page table".

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        struct {
+            /*
+             * Pointer to a page which store metadata for an intermediate page
+             * table.
+             */
+            struct page_info *metadata;
+        } md;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
In the description you say you would re-use the list field.</pre>
    </blockquote>
    <pre>It was so in a first version of storing P2M type outside PTE bits, so, it is a 
stale part of the commit message. I'll correct it.

</pre>
    <blockquote type="cite"
      cite="mid:12adb163-5f6b-4478-9592-7423b8db69a9@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -101,7 +101,16 @@ static int p2m_alloc_root_table(struct p2m_domain *p2m)
 {
     struct domain *d = p2m-&gt;domain;
     struct page_info *page;
-    const unsigned int nr_root_pages = P2M_ROOT_PAGES;
+    /*
+     * If the root page table starts at Level &lt;= 2, and since only 1GB, 2MB,
+     * and 4KB mappings are supported (as enforced by the ASSERT() in
+     * p2m_set_entry()), it is necessary to allocate P2M_ROOT_PAGES for
+     * the root page table itself, plus an additional P2M_ROOT_PAGES for
+     * metadata storage. This is because only two free bits are available in
+     * the PTE, which are not sufficient to represent all possible P2M types.
+     */
+    const unsigned int nr_root_pages = P2M_ROOT_PAGES *
+                                       ((P2M_ROOT_LEVEL &lt;= 2) ? 2 : 1);
 
     /*
      * Return back nr_root_pages to assure the root table memory is also
@@ -114,6 +123,23 @@ static int p2m_alloc_root_table(struct p2m_domain *p2m)
     if ( !page )
         return -ENOMEM;
 
+    if ( P2M_ROOT_LEVEL &lt;= 2 )
+    {
+        /*
+         * In the case where P2M_ROOT_LEVEL &lt;= 2, it is necessary to allocate
+         * a page of the same size as that used for the root page table.
+         * Therefore, p2m_allocate_root() can be safely reused.
+         */
+        struct page_info *metadata = p2m_allocate_root(d);
+        if ( !metadata )
+        {
+            free_domheap_pages(page, P2M_ROOT_ORDER);
+            return -ENOMEM;
+        }
+
+        page-&gt;v.md.metadata = metadata;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Don't you need to install such a link for every one of the 4 pages?</pre>
    </blockquote>
    <pre>Yes, I need to do that. Thanks.

</pre>
    <blockquote type="cite"
      cite="mid:12adb163-5f6b-4478-9592-7423b8db69a9@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -198,24 +224,25 @@ static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
     return __map_domain_page(p2m-&gt;root + root_table_indx);
 }
 
-static int p2m_set_type(pte_t *pte, p2m_type_t t)
+static void p2m_set_type(pte_t *pte, const p2m_type_t t, const unsigned int i)
 {
-    int rc = 0;
-
     if ( t &gt; p2m_ext_storage )
-        panic("unimplemeted\n");
+    {
+        ASSERT(pte);
+
+        pte[i].pte = t;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
What does i identify here?</pre>
    </blockquote>
    <pre>An index in metadata page where P2M type for corresponding PTE is stored.
I will re-name it to metadata_indx for more clarity.

</pre>
    <blockquote type="cite"
      cite="mid:12adb163-5f6b-4478-9592-7423b8db69a9@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    }
     else
         pte-&gt;pte |= MASK_INSR(t, P2M_TYPE_PTE_BITS_MASK);
-
-    return rc;
 }
 
-static p2m_type_t p2m_get_type(const pte_t pte)
+static p2m_type_t p2m_get_type(const pte_t pte, const pte_t *metadata,
+                               const unsigned int i)
 {
     p2m_type_t type = MASK_EXTR(pte.pte, P2M_TYPE_PTE_BITS_MASK);
 
     if ( type == p2m_ext_storage )
-        panic("unimplemented\n");
+        type = metadata[i].pte;
 
     return type;
 }
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Overall this feels pretty fragile, as the caller has to pass several values
which all need to be in sync with one another. If you ...</pre>
    </blockquote>
    <pre>Generally, agree it is fragile enough.

</pre>
    <blockquote type="cite"
      cite="mid:12adb163-5f6b-4478-9592-7423b8db69a9@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -265,7 +292,10 @@ static void p2m_set_permission(pte_t *e, p2m_type_t t)
     }
 }
 
-static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t, bool is_table)
+static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t,
+                              struct page_info *metadata_pg,
+                              const unsigned int indx,
+                              bool is_table)
 {
     pte_t e = (pte_t) { PTE_VALID };
 
@@ -285,12 +315,21 @@ static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t, bool is_table)
 
     if ( !is_table )
     {
+        pte_t *metadata = __map_domain_page(metadata_pg);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... map the page anyway, no matter whether ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">         p2m_set_permission(&amp;e, t);
 
+        metadata[indx].pte = p2m_invalid;
+
         if ( t &lt; p2m_ext_storage )
-            p2m_set_type(&amp;e, t);
+            p2m_set_type(&amp;e, t, indx);
         else
-            panic("unimplemeted\n");
+        {
+            e.pte |= MASK_INSR(p2m_ext_storage, P2M_TYPE_PTE_BITS_MASK);
+            p2m_set_type(metadata, t, indx);
+        }
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... you'll actually use it, maybe best to map both pages at the same point?</pre>
    </blockquote>
    <pre>Only one page is mapped here (?) and it should be mapped here, I suppose, it could be a case
when a previous set type is overwritten, so, it could be needed to invalidate a type written
in metadata.

</pre>
    <blockquote type="cite"
      cite="mid:12adb163-5f6b-4478-9592-7423b8db69a9@suse.com">
      <pre wrap="" class="moz-quote-pre">
And as said elsewhere, no, I don't think you want to use p2m_set_type() for
two entirely different purposes.</pre>
    </blockquote>
    <pre>I wasn't very happy too, but, at the same time I didn't want to have a prototype where
it isn't really clear when it is needed to pass metadata and where it is not. But considering
your comments then this one solution isn't good too. So maybe it would be better just have
two separate functions: p2m_set_pte_type() and p2m_set_metadata_type().

</pre>
    <blockquote type="cite"
      cite="mid:12adb163-5f6b-4478-9592-7423b8db69a9@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -323,22 +364,71 @@ static struct page_info *p2m_alloc_page(struct p2m_domain *p2m)
     return pg;
 }
 
+static void p2m_free_page(struct p2m_domain *p2m, struct page_info *pg);
+
+/*
+ * Allocate a page table with an additional extra page to store
+ * metadata for each entry of the page table.
+ * Link this metadata page to page table page's list field.
+ */
+static struct page_info * p2m_alloc_table(struct p2m_domain *p2m)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Nit: Stray blank after * again.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+{
+    enum table_type
+    {
+        INTERMEDIATE_TABLE=0,
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
If you really think you need the "= 0", then please with blanks around '='.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        /*
+         * At the moment, metadata is going to store P2M type
+         * for each PTE of page table.
+         */
+        METADATA_TABLE,
+        TABLE_MAX
+    };
+
+    struct page_info *tables[TABLE_MAX];
+
+    for ( unsigned int i = 0; i &lt; TABLE_MAX; i++ )
+    {
+        tables[i] = p2m_alloc_page(p2m);
+
+        if ( !tables[i] )
+            goto out;
+
+        clear_and_clean_page(tables[i]);
+    }
+
+    tables[INTERMEDIATE_TABLE]-&gt;v.md.metadata = tables[METADATA_TABLE];
+
+    return tables[INTERMEDIATE_TABLE];
+
+ out:
+    for ( unsigned int i = 0; i &lt; TABLE_MAX; i++ )
+        if ( tables[i] )
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
You didn't clear all of tables[] first, though.</pre>
    </blockquote>
    <pre>Oh, right, i missed an initalizer for tables[] array.
</pre>
    <blockquote type="cite"
      cite="mid:12adb163-5f6b-4478-9592-7423b8db69a9@suse.com">
      <pre wrap="" class="moz-quote-pre"> This kind of cleanup is
often better done as

    while ( i-- &gt; 0 )
        ...

You don't even need an if() then, as you know allocations succeeded for all
earlier array slots.</pre>
    </blockquote>
    <pre>Yes, it looks very nice.

</pre>
    <blockquote type="cite"
      cite="mid:12adb163-5f6b-4478-9592-7423b8db69a9@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+            p2m_free_page(p2m, tables[i]);
+
+    return NULL;
+}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I'm also surprised you allocate the metadata table no matter whether you'll
actually need it. That'll double your average paging pool usage, when in a
typical case only very few entries would actually require this extra
storage.</pre>
    </blockquote>
    <pre>Nice point, we could really do a delayed allocation instead and allocate only
when requested P2M type is &gt; p2m_ext_storage.
I'll implement that.

</pre>
    <blockquote type="cite"
      cite="mid:12adb163-5f6b-4478-9592-7423b8db69a9@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -453,10 +543,9 @@ static void p2m_put_2m_superpage(mfn_t mfn, p2m_type_t type)
 }
 
 /* Put any references on the page referenced by pte. */
-static void p2m_put_page(const pte_t pte, unsigned int level)
+static void p2m_put_page(const pte_t pte, unsigned int level, p2m_type_t p2mt)
 {
     mfn_t mfn = pte_get_mfn(pte);
-    p2m_type_t p2m_type = p2m_get_type(pte);
 
     ASSERT(pte_is_valid(pte));
 
@@ -470,10 +559,10 @@ static void p2m_put_page(const pte_t pte, unsigned int level)
     switch ( level )
     {
     case 1:
-        return p2m_put_2m_superpage(mfn, p2m_type);
+        return p2m_put_2m_superpage(mfn, p2mt);
 
     case 0:
-        return p2m_put_4k_page(mfn, p2m_type);
+        return p2m_put_4k_page(mfn, p2mt);
     }
 }
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Might it be better to introduce this function in this shape right away, in
the earlier patch?</pre>
    </blockquote>
    <pre>Agree, probably, I did that intentionally, but I don't remember why. I will try to
avoid these changes in this patch as it looks unnecessary here.

</pre>
    <blockquote type="cite"
      cite="mid:12adb163-5f6b-4478-9592-7423b8db69a9@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -690,18 +791,23 @@ static int p2m_set_entry(struct p2m_domain *p2m,
     {
         /* We need to split the original page. */
         pte_t split_pte = *entry;
+        struct page_info *metadata = virt_to_page(table)-&gt;v.md.metadata;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This (or along these lines) is how I would have expected things to be done
elsewhere as well, limiting the amount of arguments you need to pass
around.</pre>
    </blockquote>
    <pre>I will try to re-use this approach elsewhere I can.

Thanks.

~ Oleksii</pre>
  </body>
</html>

--------------nNjh60kUbwPkc03zVml00qG0--

