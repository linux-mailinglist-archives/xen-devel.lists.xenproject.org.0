Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B30A2CB6879
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 17:42:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184417.1506876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTjkZ-0000MR-09; Thu, 11 Dec 2025 16:42:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184417.1506876; Thu, 11 Dec 2025 16:42:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTjkY-0000Ky-TX; Thu, 11 Dec 2025 16:42:42 +0000
Received: by outflank-mailman (input) for mailman id 1184417;
 Thu, 11 Dec 2025 16:42:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fhd1=6R=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vTjkX-0000Kq-SP
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 16:42:41 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67c98aee-d6b0-11f0-9cce-f158ae23cfc8;
 Thu, 11 Dec 2025 17:42:39 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5943b62c47dso315915e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 08:42:39 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-598f2f37b02sm996042e87.20.2025.12.11.08.42.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Dec 2025 08:42:38 -0800 (PST)
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
X-Inumbo-ID: 67c98aee-d6b0-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765471359; x=1766076159; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R3yR7kNyuezzbiEULFKfXlBwf+Npdb5YvHWOzk+SdQI=;
        b=Co9JItMIydyNG/JZDobZuWr/kxlGBOIm1uSOlnDuEne2CrC23gdLJRz7Ogp6JWcNqz
         VPr0vkoM3GMOFI5xyVLtDO3QhPgueEzLxyylfloAMavEcHyTJSL3A5tceU/QU/O0zf3P
         wrKxXBdgwqK6npsMN4Fthcvzj0rsgs2KUm7zFZpQp9pO46/qg++irUqRmcJ46WUZ30XY
         x1YjTg6/e7Al3igc4cHwg/jtlOX1wdQd0MGmbLK0YIylza4jhr2KM1d6TahSViEN1qxp
         rdoDcO9dlyzGSA5HjQDyY4ybpq3+IFNQ+3e8RxDExOC7SEbRJHzM3LkW8+2cdztSk4it
         u1fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765471359; x=1766076159;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R3yR7kNyuezzbiEULFKfXlBwf+Npdb5YvHWOzk+SdQI=;
        b=gAGOC+skh2uoyQosfqMm/b8Xi25XZQxb6+j/LnHatkTBTSvDfzA+y2tQhzrJsl2PAw
         hV+PdwBbWkAH20FRheUWJigJtgn35fqo66fZ9LXUz51qIeQFJEwF7eRq78Uu5hJd/kYJ
         3qVav7aOCPSSexIVVtY7UY1/mCD9D4WfZtvyKu1gcDXTlQ5LNr4a5R7FZqYWKCELSMrb
         jCymGf8RtaQXy+hWxLo6Haw0zGfN8gcecWgyTRvRXhea9MU1QvIZ+kbv2moG4qLzjwU9
         nOadFnvdnGyDIC2GX7yazNUKPZ7KEtdWQSA1X8r/n+Hs7KLbbR+KETdQh8Z8PawVtmqJ
         FdBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWI5esb4AIij8c5YL5Gt4eP8d0fq/AQkcLmzWbN67Ta2d3H0cRDSWHtXGYwZHygaCAi2bsOu16H+JE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyAtfmZH6nXa01T9nQe7TKo6mdcqNCOLVG4HuSnxODNQUSyIZHx
	xxh4R3U4Cw0aNkgbi14oVA8vf92Rl6lZV9aKyJq7yeTg2RY634Yc/o0X
X-Gm-Gg: AY/fxX7A84MIh+J7M8pqraY0NQ7QG6TSsb7zvK/NsQeegnAn90vPfEJiJB/dHgXQTrw
	0Ki0cMVsPPQoF7k7aNGQMPu26K7ByovDjNSUIMJJfzU2yeRuLGyajLI8RGqrQmrFQEFpBLwIq7S
	4zzY7bVlYpXTofT0y1ejno55hE8UYMZejpaKG3YEaHO8c4nkDKxXIDyXq6SGgZwLPuXEWyuLwXo
	LqyD6lLxAecpIz07NTWGe985WFfBOfwYTYJ7wVvvWz9lEFWc3fZ79BN2qdkYW3x+4Mx4IC8SvbL
	x4D5+1UQpqOiTpJpCigEfIimY1PATU1JcoKc4d5ej5r9gszPNgtF6hJlYRczFfhWq0EeF0Ib2O+
	ucJE8RqbcKcickhy0/n+lUUMW5iiXyAfGe4A70DI6As+iYS2uns6+effQQF1FPm+zBAgW/xnI3+
	ifZKbngTao8n4GGGQswG9zrfXEXOjYS4/1b25WZRqjWcfx16OUOtXDpRhii+rc
X-Google-Smtp-Source: AGHT+IFMYIqs7RAPLPzyaYJ/Lzz1tnEHQ2NJQWeroQXEt8DlcOf2gS4JWWmW6/4aWIRIFOyVLJhB0Q==
X-Received: by 2002:a05:6512:e9d:b0:598:ef42:d59b with SMTP id 2adb3069b0e04-598ef42d9e6mr2481225e87.4.1765471358472;
        Thu, 11 Dec 2025 08:42:38 -0800 (PST)
Message-ID: <45231d95-1745-44a6-b364-e97f9f501e10@gmail.com>
Date: Thu, 11 Dec 2025 17:42:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v6 19/19] xen/riscv: introduce metadata table to store P2M
 type
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1763986955.git.oleksii.kurochko@gmail.com>
 <2c41da84b3e7fb0f6e6c3c856bff6edaf9e1d505.1763986955.git.oleksii.kurochko@gmail.com>
 <889df78f-7196-4b44-9558-fb83f432e18a@suse.com>
 <36be69fb-9362-43a4-8308-1e62be60d27f@gmail.com>
 <621089a4-d946-46ce-a3cf-4d0938d4a39a@suse.com>
 <db24c624-0432-48ec-aecc-3efaa4973303@gmail.com>
 <6c78a029-7437-4256-afca-c5d39fbd3f8b@suse.com>
Content-Language: en-US
In-Reply-To: <6c78a029-7437-4256-afca-c5d39fbd3f8b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/11/25 10:39 AM, Jan Beulich wrote:
> On 10.12.2025 13:44, Oleksii Kurochko wrote:
>> On 12/10/25 8:06 AM, Jan Beulich wrote:
>>> On 09.12.2025 18:09, Oleksii Kurochko wrote:
>>>> On 12/9/25 2:47 PM, Jan Beulich wrote:
>>>>> On 24.11.2025 13:33, Oleksii Kurochko wrote:
>>>>>> +            *md_pg = p2m_alloc_page(p2m);
>>>>>> +            if ( !*md_pg )
>>>>>> +            {
>>>>>> +                printk("%pd: can't allocate metadata page\n", p2m->domain);
>>>>>> +                domain_crash(p2m->domain);
>>>>>> +
>>>>>> +                return;
>>>>>> +            }
>>>>>> +        }
>>>>>> +    }
>>>>>> +
>>>>>> +    if ( *md_pg )
>>>>>> +        metadata = __map_domain_page(*md_pg);
>>>>>> +
>>>>>> +    if ( t >= p2m_first_external )
>>>>>> +    {
>>>>>> +        metadata[ctx->index].type = t;
>>>>>> +
>>>>>> +        t = p2m_ext_storage;
>>>>>> +    }
>>>>>> +    else if ( metadata )
>>>>>> +        metadata[ctx->index].type = p2m_invalid;
>>>>>> +
>>>>>> +    pte->pte |= MASK_INSR(t, P2M_TYPE_PTE_BITS_MASK);
>>>>>> +
>>>>>> +    unmap_domain_page(metadata);
>>>>>>     }
>>>>> Just to mention (towards future work): Once a metadata page goes back to be
>>>>> entirely zero-filled, it could as well be hooked off and returned to the pool.
>>>>> Not doing so may mean detaining an unused page indefinitely.
>>>> Won’t that already happen when p2m_free_table() is called?
>>> Well, that's when both page table and metadata table are freed. But what if a
>>> leaf page table is moving back to holding all p2m_ram_rw mappings? Then the
>>> metadata page is unused, but will remain allocated.
>> Good point...
>>
>> This could be a rather expensive operation, since in the code:
>>     +    else if ( metadata )
>>     +        metadata[ctx->index].type = p2m_invalid;
>> we would have to check all other metadata entries to determine whether they are
>> (p2m_invalid) or not, and return the page to the pool.
>>
>> It would be nice to have something like metadata.used_entries_num, but the entire
>> page is used for type entries.
>> As an option, we could reserve 8 bits to store a counter of the number of used
>> entries in the metadata page, and then use metadata[0].used_entries_num to check
>> whether it is zero. If it is zero, we could simply return the metadata page to the
>> pool in the “else if (metadata)” case mentioned above.
>>
>> How bad is this idea? Any better suggestions?
> First, as said in my initial reply: This may not need taking care of right away.
> It will need keeping in mind, of course.

I am thinking if it won't be too intrusive, I think that I am okay to introduce that
now.

>
> As to suggestions - hardly any of the fields in struct page_info for the page
> can be used when the page is a metadata one. Simply record the count there?

I suppose that|union u| could be used.
The only thing that confuses me is the shadow paging implementation on x86.
In|struct page_info|, it has the following:
     /* Context-dependent fields follow... */
     union {

         /* Page is in use: ((count_info & PGC_count_mask) != 0). */
         struct {
             /* Type reference count and various PGT_xxx flags and fields. */
             unsigned long type_info;
         } inuse;

         /* Page is in use as a shadow: count_info == 0. */
         struct {
	   ....
         } sh;

         /* Page is on a free list: ((count_info & PGC_count_mask) == 0). */
         union {

So it seems that something in the shadow code must set|count_info| to zero for
shadow pages. But I cannot find where this happens. I would expect it to be done
in|shadow_alloc()|, when the page is taken from the free list. However, pages
from the free list donot have|count_info == 0| since|alloc_heap_pages() |initializes|count_info|.
What guarantees that|count_info| will be zero for shadow tables?

Interestingly, in the shadow p2m page free code, there is logic that resets
|count_info| to zero:
{
     struct domain *owner = page_get_owner(pg);

     /* Should still have no owner and count zero. */
     if ( owner || (pg->count_info & PGC_count_mask) )
     {
         printk(XENLOG_ERR
                "d%d: Odd p2m page %"PRI_mfn" d=%d c=%lx t=%"PRtype_info"\n",
                d->domain_id, mfn_x(page_to_mfn(pg)),
                owner ? owner->domain_id : DOMID_INVALID,
                pg->count_info, pg->u.inuse.type_info);
         pg->count_info &= ~PGC_count_mask;
         page_set_owner(pg, NULL);
     }
...

And another question: since|u.sh.*| is updated, it effectively overwrites
|u.inuse.type_info|. But|u.inuse.type_info| is used by|free_domheap_pages()|,
which is called from|shadow_free()|:
void free_domheap_pages(struct page_info *pg, unsigned int order)
{
...
                 if ( pg[i].u.inuse.type_info & PGT_count_mask )
                 {
                     printk(XENLOG_ERR
                            "pg[%u] MFN %"PRI_mfn" c=%#lx o=%u v=%#lx t=%#x\n",
                            i, mfn_x(page_to_mfn(pg + i)),
                            pg[i].count_info, pg[i].v.free.order,
                            pg[i].u.free.val, pg[i].tlbflush_timestamp);
                     BUG();
                 }
...

Why is it acceptable that|u.inuse.type_info| will likely not be zero, since
|u.sh.*| modifies the same union field, at least during shadow page allocation?



> Finally, as to "rather expensive": Scanning a 4k page to hold all zeroes can't
> be all that expensive? In any event that expensiveness needs weighing carefully
> against the risk of getting the counter maintenance wrong.

It depends on how often|p2m_set_type()| will be called.
In the worst case, it will require a loop that performs up to 512 iterations
to scan a 4 KB page (512 * sizeof(struct mt_d) = 4096), which I think could be
expensive if|p2m_set_type()| is invoked frequently.

~ Oleksii


