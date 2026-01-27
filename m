Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNFoA1aceGlurQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 12:07:02 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AD9935AF
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 12:07:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1214247.1524624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkgu5-0004ra-TK; Tue, 27 Jan 2026 11:06:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1214247.1524624; Tue, 27 Jan 2026 11:06:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkgu5-0004pe-QK; Tue, 27 Jan 2026 11:06:37 +0000
Received: by outflank-mailman (input) for mailman id 1214247;
 Tue, 27 Jan 2026 11:06:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y9JO=AA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vkgu4-0004pY-MV
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 11:06:36 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e748113-fb70-11f0-b15f-2bf370ae4941;
 Tue, 27 Jan 2026 12:06:35 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4806bf39419so861365e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jan 2026 03:06:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1c30293sm37884201f8f.19.2026.01.27.03.06.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jan 2026 03:06:34 -0800 (PST)
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
X-Inumbo-ID: 3e748113-fb70-11f0-b15f-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769511995; x=1770116795; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=26uRpTXGMxGsyYCxnznwvskxo7pssM7ff2WO+EhBO1I=;
        b=TFVzM9cGQgaM7S3uOZXihhMVVG/SJf4vbqrvGDo2s0vuujgaoXuJElBybpRUTpLFJt
         Z/7QwMDYZL3JmSqoex6em/HwENlTB8Dn4qN12vytdRIbIzYZZGGZzl12tg7tBGA2Bok6
         ygAasgfSq58s89GnVBFmHZsJJ4asuEv4Q/tDD+NmTz+fIEb/qtGSkIZH5HU1HosnNdSI
         waMlA3ca/ddldkWG/X1Gy9B4BsOmZmGIset5bZEAfP1QeJ4v4DJOIUdSsJ216sLDyeMd
         ZqG7c6m89Wmh89/k7KcOWiTuTbzibKkw/C68Fd44QIhoqGnFHmayUyjHpSqmtjd8l3hl
         aU0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769511995; x=1770116795;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=26uRpTXGMxGsyYCxnznwvskxo7pssM7ff2WO+EhBO1I=;
        b=VXk3MTZkXMsWzILmTqknsk4wV67mGChKP0TlUVh3NoK56RTe1EQuIX1zEprF5mF8EJ
         y/Fcijp/ODASDDMvcC0ix9cfHf2f+kvJM43702IbDuqiJS1l5B0TRkVpt/9BLsSgxQK5
         f2QTYd2foez2D2iWrn0kvfdo4fjth6eacvDTrg1eZHOq7DLguImX2GW3/RqJrKtVeNW4
         CTXiNXcznQbUxLSgkJYoyQ/ttaKHSmD1dttfCtd3kkqhWdx3qlP4GB/DUffCiYMJvHcT
         bty0oxNrCKeOy+PGUaGp2XFzYk5JzkdPdJZ/0O4odrpNgy+bH7MzLJXHbjxYA6NhiL7o
         1Apw==
X-Forwarded-Encrypted: i=1; AJvYcCVL6eHBkeNGrEI2HykAF27wtsQMed3NXkmgiBMbNuit7UguAdZUrCeKoFrT8mR1SiAyPldDM6v4jbA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzlosNvffhDxEa0Pc0HkoijRni6MjG7SjdcuHnhzzG1Jae8krQ6
	Jfie7JfoLBzv1zd+nKwuqP+hQYArmgdyDqgU8hRz9QTB7j5j5gepYq5dQe+2iG488Q==
X-Gm-Gg: AZuq6aKGyHK9xLly0ujaXq9cL7eYYkri1QtnHWuATPF9FYFLzvqn9npo1dHkhg6LV7Z
	GA4aOUgZ/fpjmLKFdvWEzDn1EMuS/9VowwICefWqoKMuRuEXzlx0bt9VU4Xcrc5OLkXuuZBS6ma
	foKIaTzie8L9GPECHHC2ByUbYMS8hrQAGN5xYyZwHaF28iB/uLxUt4gXqxXmGqCGg9PWdh+N0Mb
	+T8FP+w68vIRYiDWV6Rtthpry95b/cEsLmTTWACY3CgOeswFedDxdybgMJFeWBXuJdFJ25EFKPm
	gipNXzrwikk0v4rcRsT0mtWlEMqqgEFi26slcHOUzFLDHcrnyz3I8bt5Whsm/M+HYIoxG4zhzJM
	OsEgmuQn9TmCJZgIYdzYuGnfKz7Tq87pvatK7cxmrS5VKa63ivzJ6ePnMymd4gFOjBwm1LZOB36
	fPR3kXPmFQOKIgaq9kobtVy5IS2iKbJQx8zVQQLeZ14X7joTT+RjbpISUO5yWn6QIFWkG33gf23
	D4=
X-Received: by 2002:a05:600c:21ce:b0:477:9a61:fd06 with SMTP id 5b1f17b1804b1-48069e33806mr11255815e9.8.1769511994505;
        Tue, 27 Jan 2026 03:06:34 -0800 (PST)
Message-ID: <f369f85d-6699-44f7-bf3e-589569767e65@suse.com>
Date: Tue, 27 Jan 2026 12:06:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] xen/mm: allow deferred scrub of physmap populate
 allocated pages
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260122173857.83860-1-roger.pau@citrix.com>
 <20260122173857.83860-3-roger.pau@citrix.com>
 <69a64a89-af3f-47fe-8998-a3ff76e9484e@suse.com> <aXiVeAQFUMQkIK1_@Mac.lan>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <aXiVeAQFUMQkIK1_@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,citrix.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 58AD9935AF
X-Rspamd-Action: no action

On 27.01.2026 11:40, Roger Pau Monné wrote:
> On Mon, Jan 26, 2026 at 12:14:35PM +0100, Jan Beulich wrote:
>> On 22.01.2026 18:38, Roger Pau Monne wrote:
>>> Physmap population has the need to use pages as big as possible to reduce
>>> p2m shattering.  However that triggers issues when big enough pages are not
>>> yet scrubbed, and so scrubbing must be done at allocation time.  On some
>>> scenarios with added contention the watchdog can trigger:
>>>
>>> Watchdog timer detects that CPU55 is stuck!
>>> ----[ Xen-4.17.5-21  x86_64  debug=n  Not tainted ]----
>>> CPU:    55
>>> RIP:    e008:[<ffff82d040204c4a>] clear_page_sse2+0x1a/0x30
>>> RFLAGS: 0000000000000202   CONTEXT: hypervisor (d0v12)
>>> [...]
>>> Xen call trace:
>>>    [<ffff82d040204c4a>] R clear_page_sse2+0x1a/0x30
>>>    [<ffff82d04022a121>] S clear_domain_page+0x11/0x20
>>>    [<ffff82d04022c170>] S common/page_alloc.c#alloc_heap_pages+0x400/0x5a0
>>>    [<ffff82d04022d4a7>] S alloc_domheap_pages+0x67/0x180
>>>    [<ffff82d040226f9f>] S common/memory.c#populate_physmap+0x22f/0x3b0
>>>    [<ffff82d040228ec8>] S do_memory_op+0x728/0x1970
>>>
>>> Introduce a mechanism to preempt page scrubbing in populate_physmap().  It
>>> relies on stashing the dirty page in the domain struct temporarily to
>>> preempt to guest context, so the scrubbing can resume when the domain
>>> re-enters the hypercall.  The added deferral mechanism will only be used for
>>> domain construction, and is designed to be used with a single threaded
>>> domain builder.  If the toolstack makes concurrent calls to
>>> XENMEM_populate_physmap for the same target domain it will trash stashed
>>> pages, resulting in slow domain physmap population.
>>>
>>> Note a similar issue is present in increase reservation.  However that
>>> hypercall is likely to only be used once the domain is already running and
>>> the known implementations use 4K pages. It will be deal with in a separate
>>> patch using a different approach, that will also take care of the
>>> allocation in populate_physmap() once the domain is running.
>>>
>>> Fixes: 74d2e11ccfd2 ("mm: Scrub pages in alloc_heap_pages() if needed")
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>> Changes since v2:
>>>  - Introduce FREE_DOMHEAP_PAGE{,S}().
>>>  - Remove j local counter.
>>>  - Free page pending scrub in domain_kill() also.
>>
>> Yet still not right in domain_unpause_by_systemcontroller() as well. I.e. a
>> toolstack action is still needed after the crash to make the memory usable
>> again. If you made ...
> 
> Oh, I've misread your previous reply and it seemed to me your
> preference was to do it in domain_kill().

I meant to (possibly) have it kept there and be done yet earlier as well.

>>> @@ -1286,6 +1293,19 @@ int domain_kill(struct domain *d)
>>>          rspin_barrier(&d->domain_lock);
>>>          argo_destroy(d);
>>>          vnuma_destroy(d->vnuma);
>>> +        /*
>>> +         * Attempt to free any pages pending scrub early.  Toolstack can still
>>> +         * trigger populate_physmap() operations at this point, and hence a
>>> +         * final cleanup must be done in _domain_destroy().
>>> +         */
>>> +        rspin_lock(&d->page_alloc_lock);
>>> +        if ( d->pending_scrub )
>>> +        {
>>> +            FREE_DOMHEAP_PAGES(d->pending_scrub, d->pending_scrub_order);
>>> +            d->pending_scrub_order = 0;
>>> +            d->pending_scrub_index = 0;
>>> +        }
>>> +        rspin_unlock(&d->page_alloc_lock);
>>
>> ... this into a small helper function (usable even from _domain_destroy(),
>> as locking being used doesn't matter there), it would have negligible
>> footprint there.
>>
>> As to the comment, not being a native speaker it still feels to me as if
>> moving "early" earlier (after "free") might help parsing of the 1st sentence.
> 
> I could also drop "early" completely from the sentence.  I've moved
> the comment at the top of the newly introduced helper and reworded it
> as:
> 
> /*
>  * Called multiple times during domain destruction, to attempt to early free
>  * any stashed pages to be scrubbed.  The call from _domain_destroy() is done
>  * when the toolstack can no longer stash any pages.
>  */
> 
> Let me know if that's OK.

Fine with me.

>>> --- a/xen/common/memory.c
>>> +++ b/xen/common/memory.c
>>> @@ -159,6 +159,66 @@ static void increase_reservation(struct memop_args *a)
>>>      a->nr_done = i;
>>>  }
>>>  
>>> +/*
>>> + * Temporary storage for a domain assigned page that's not been fully scrubbed.
>>> + * Stored pages must be domheap ones.
>>> + *
>>> + * The stashed page can be freed at any time by Xen, the caller must pass the
>>> + * order and NUMA node requirement to the fetch function to ensure the
>>> + * currently stashed page matches it's requirements.
>>> + */
>>> +static void stash_allocation(struct domain *d, struct page_info *page,
>>> +                             unsigned int order, unsigned int scrub_index)
>>> +{
>>> +    rspin_lock(&d->page_alloc_lock);
>>> +
>>> +    /*
>>> +     * Drop any stashed allocation to accommodated the current one.  This
>>> +     * interface is designed to be used for single-threaded domain creation.
>>> +     */
>>> +    if ( d->pending_scrub )
>>> +        free_domheap_pages(d->pending_scrub, d->pending_scrub_order);
>>
>> Didn't you indicate you'd move the freeing ...
>>
>>> +    d->pending_scrub_index = scrub_index;
>>> +    d->pending_scrub_order = order;
>>> +    d->pending_scrub = page;
>>> +
>>> +    rspin_unlock(&d->page_alloc_lock);
>>> +}
>>> +
>>> +static struct page_info *get_stashed_allocation(struct domain *d,
>>> +                                                unsigned int order,
>>> +                                                nodeid_t node,
>>> +                                                unsigned int *scrub_index)
>>> +{
>>
>> ... into this function?
> 
> I could add freeing to get_stashed_allocation(), but it seems
> pointless, because the freeing in stash_allocation() will have to stay
> to deal with concurrent callers.  Even if a context frees the stashed
> page in get_stashed_allocation() there's no guarantee the field will
> still be free when stash_allocation() is called, as another concurrent
> thread might have stashed a page in the meantime.

Hmm, yes, yet still ...

> I think it's best to consistently do it only in stash_allocation(), as
> that's clearer.

... no, as (to me) "clearer" is only a secondary criteria here. What I'm
worried of is potentially holding back a 1Gb page when the new request is,
say, a 2Mb one, and then not having enough memory available just because
of that detained huge page.

In fact, if stash_allocation() finds the field re-populated despite
get_stashed_allocation() having cleared it, it's not quite clear which
of the two allocations should actually be undone. The other vCPU may be
quicker in retrying, and to avoid ping-pong freeing the new (local)
allocation rather than stashing it might possibly be better. Thoughts?

Jan

