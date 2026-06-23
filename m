Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QVK6J2yIOmr3/AcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 15:21:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B9B6B76B7
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 15:21:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=FlDWYucv;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1344253.1603362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wc14N-0006oS-Uc; Tue, 23 Jun 2026 13:21:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344253.1603362; Tue, 23 Jun 2026 13:21:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wc14N-0006mY-R9; Tue, 23 Jun 2026 13:21:39 +0000
Received: by outflank-mailman (input) for mailman id 1344253;
 Tue, 23 Jun 2026 13:21:38 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wc14M-0006lp-BX
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 13:21:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wc14L-00H4DB-OT
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 15:21:37 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3a8854-5cb7-0a2a0a5109dd-0a2a4506bbb2-28
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 15:21:37 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a3a8861-b690-0a2a45060019-d1558035c1de-3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 15:21:37 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-49222b6e871so47399015e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 06:21:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4923fe7b359sm362137335e9.9.2026.06.23.06.21.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jun 2026 06:21:35 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782220897; x=1782825697; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oQait8nDZnF7WL/twDwo15upLHpj3md5RFRUcOG7tV8=;
        b=FlDWYucvI+Z2rZk7oNqqg03X4YXkh4nzq7vDC+vCroufvs8XRbROUaXgUarz4C+SYr
         vGVq3lJ53IYUEbWfkpdvQJShRjYWr457BgN68fHc46x7TKBf55ayY98pGWOaOEFivk4m
         4IwR174M6+l8DeKIFTZGiAJdK4xBLVI/GZrKuYe6dbmZFOCESIhBHF9DcRj3T3eJ5mEN
         rSUPPVN/rdsf1pJ7jMIFXj5NbKqVMAY+I8OEz18Ss5wpgaQLpuLvwgEnF5lGcHZqeOa4
         ku+h+H8sLbY1yS31OtBYG+ZvG87D597dQNd3e5dqANBKJuaD/ZQ99FmDW/Tvy+GYMU/3
         0bYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782220897; x=1782825697;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQait8nDZnF7WL/twDwo15upLHpj3md5RFRUcOG7tV8=;
        b=pYw0f2mVFVsWCkCZ7qHRh4kjdspBx1vr/yQo8d10EabLJ7aERzWJ4zaqPEX0QqcWtt
         SWtx4wAjMMYokAuDR9WlAhY9Wk+iv1ZOhSx4RTxnxdJbDBy2V2kB267ieTamgzJ+eSxJ
         aEyv7uaCpsAzM4xQiQ5eryfsdV1jyNUhK6YSzAUc3mQv0j20fV400haWWeFGWy18x08r
         NqE+01ozYHO610w4wNJpFsZ5//VE3WozdG5mwIaFF2OIESAwZTkQuJMWzejNV7lt9WgR
         zjXA4U0UylEvy5cKJ0Wn2nQGTA79BgoycM7IQZ0a5NV9QsXNPjw1qy0VWRwfqHWA+Erd
         jKHg==
X-Forwarded-Encrypted: i=1; AFNElJ92VpoMbhmj3Yeq6xt0v9Z7pFACqh7t5IdfZ2pfQD+pwHkHWG1LovRiJgBiNVr0YP+7L/3heYpopLk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyEDfxYIf8AeBAg+xDw3X7AthAiilkRodSw46mg0p3E/QqBUPxk
	ynmk/AMwhzJEH+BlnlxY/g+p9eLov4JD08BfVG5Py5hr3WKu9vF1Sk4X3AY3zMFmHw==
X-Gm-Gg: AfdE7ckCpb6L05gbsWrd1TG6XxVnxj3L8PvTTsZK2zr8V0CBwoWY+xnKKR2OtzvwP23
	nCurAYj+KqzEVeJNL6gG7pt8M2Pkusm1L9h8/QQezcqYJRBpjr4bDZTbKnR1DvZYCqZs76VC4tZ
	VPQp84iRNBVExhVSCy9O88T5njU4691D9Hb3go+Skga4CEwL37EdJWdc/It3AH3bFSal3gyvOJ5
	IYx2HuHhnkCDuTudfydv2tdfLJPGHnw5xmoRPXZ/PesiR4f+ZX4W3WPQdBiyfA8SCNnbKRh5t4f
	G3MC2M9DQVCk6nJEEvjYM3EnT7cTDvsFZPxbOMLLKDO3FGseaZ0U+rK2QdIL1X6MC/BFJm0lGsJ
	ElZv1pRZlEPMu+AdCFCRHJmfgVdFhWWrY83oH/mhhRAQCLEsIo5y5Lb/XizP05iD0VyLDFX9pZH
	UpPUIOK2RBW8AvSv/Q4Zl3jYxfv/R1chdZq9FTZXTWvr9G5U3rqK4Mn8NQ6NqyWdqMv3WX6aF1u
	/AK
X-Received: by 2002:a05:600c:8b71:b0:492:59a0:4a65 with SMTP id 5b1f17b1804b1-4925b3802a0mr43031365e9.27.1782220896837;
        Tue, 23 Jun 2026 06:21:36 -0700 (PDT)
Message-ID: <2889dc4e-33ec-4d8f-b01d-026506a39cbf@suse.com>
Date: Tue, 23 Jun 2026 15:21:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/16] xen: implement new foreign copy hypercall
To: Frediano Ziglio <freddy77@gmail.com>
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20260619130501.272832-1-frediano.ziglio@citrix.com>
 <20260619130501.272832-13-frediano.ziglio@citrix.com>
 <c5f00fa4-4d9e-4227-87a0-6e657fd523e9@suse.com>
 <CAHt6W4c0FDaMZK-4-7CReG_PdV+L=HNxVGNjV5vUjDkKq3EMBA@mail.gmail.com>
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
In-Reply-To: <CAHt6W4c0FDaMZK-4-7CReG_PdV+L=HNxVGNjV5vUjDkKq3EMBA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1782220897-395F2853-279CC0C6/0/0
X-purgate-type: clean
X-purgate-size: 13557
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:frediano.ziglio@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime,xenproject.org:url,xen.org:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D6B9B6B76B7

On 23.06.2026 12:55, Frediano Ziglio wrote:
> On Mon, 22 Jun 2026 at 11:34, Jan Beulich <jbeulich@suse.com> wrote:
>> On 19.06.2026 15:04, Frediano Ziglio wrote:
>>> --- a/xen/common/memory.c
>>> +++ b/xen/common/memory.c
>>> @@ -1545,6 +1545,139 @@ static int acquire_resource(
>>>      return rc;
>>>  }
>>>
>>> +/*
>>> + * The "noinline" qualifier avoids the compiler to create a large function
>>> + * consuming quite a lot of stack.
>>> + */
>>> +static int noinline mem_foreigncopy(
>>> +    XEN_GUEST_HANDLE_PARAM(xen_foreigncopy_t) arg)
>>> +{
>>> +    struct domain *d, *const currd = current->domain;
>>> +    xen_foreigncopy_t copy;
>>> +    int rc, direction;
>>> +
>>> +    if ( copy_from_guest(&copy, arg, 1) )
>>> +        return -EFAULT;
>>> +
>>> +    if ( copy.flags & ~XENMEM_foreigncopy_direction )
>>> +        return -EINVAL;
>>> +
>>> +    direction = copy.flags & XENMEM_foreigncopy_direction;
>>> +
>>> +    rc = rcu_lock_remote_domain_by_id(copy.domid, &d);
>>
>> Iirc I did ask before why this isn't ..._by_any_id().
> 
> I probably was confused by the question about MMUEXT and the 2 domains.
> There are different similar hypercalls (like the mentioned MMUEXT but
> also hypercalls to map foreign domain memory) that have this check
> (not the same domain). Any domain has, obviously, access to its own
> memory, so it should not have to use hypercall to access its own
> memory. If it does it looks like a mistake causing performance issues
> or an attempt to circumvent security; in either case you would like to
> avoid it.

No. Self-grants are possible as well, for example, and for a good reason.
Allowing normally-remote operations on oneself helps with testing, for
example. It may also help avoid needing to special-case "self" in code
which needs to cover both cases.

>>> +    if ( rc )
>>> +        return rc;
>>> +
>>> +    if ( copy.nr_frames == 0 )
>>> +    {
>>> +        rcu_unlock_domain(d);
>>> +        return 0;
>>> +    }
>>
>> Any reason this cannot also be "goto out"? The more that now that you have
>> moved this past the domid validity check, imo it should further move to ...
> 
> The only reason was style and to avoid a memory copy, but it's not a
> hot case so I'll change to "goto out" (no strong about it).
> 
>>> +    /*
>>> +     * Check we are allowed to map and access these foreign pages.
>>> +     */
>>> +    rc = xsm_map_gmfn_foreign(XSM_TARGET, currd, d);
>>> +    if ( rc )
>>> +        goto out;
>>
>> ... below here. Perhaps simply as
>>
>>     if ( rc || !copy.nr_frames )
>>         goto out;
>>
> 
> I think this would be confusing with the above "Check we are allowed
> to map and access these foreign pages" comment.
> Are you okay with just the change above to "goto out" ?

I do want the order adjusted as indicated. I won't insist on (but I would
prefer) folding both if()-s.

> Also moving here would potentially change the result and do a useless check.

Affecting the result is the goal of the re-ordering.

>>> +    do {
>>> +        /*
>>> +         * Arbitrary size.  Not too much stack space, and a reasonable stride
>>> +         * for continuation checks.
>>> +         */
>>> +        xen_pfn_t gfn_list[32];
>>> +        unsigned int todo = MIN(ARRAY_SIZE(gfn_list), copy.nr_frames);
>>> +
>>> +        rc = -EFAULT;
>>> +        if ( copy_from_guest(gfn_list, copy.frame_list, todo) )
>>> +            goto out;
>>> +
>>> +        for ( unsigned int i = 0; i < todo; i++ )
>>> +        {
>>> +            struct page_info *foreign_page;
>>> +            mfn_t foreign_mfn;
>>> +            void *foreign;
>>> +            p2m_type_t p2mt;
>>> +            const unsigned long valid_mask =
>>> +#ifdef CONFIG_X86
>>> +                p2m_to_mask(p2m_ram_rw) | p2m_to_mask(p2m_ram_logdirty);
>>> +#else
>>> +                p2m_to_mask(p2m_ram_rw);
>>> +#endif
>>
>> The set of permitted types didn't change, yet a justification for the resulting
>> limitation also didn't appear.
>>
> 
> Yes, that's missing, indeed.
> Should the set of types be different for reading and writing? For
> instance do not allow writing to read-only memory?

Of course.

> Given that it looks like different architectures have different
> meanings and definitions for these constants, should it not be better
> to define some new constants for this specific usage? For instance
> P2M_READ_TYPES and P2M_WRITE_TYPES?

Perhaps, yes. The suggested names look overly generic to me, though.

>>> +            foreign_page = get_page_from_gfn(d, gfn_list[i], &p2mt, P2M_ALLOC);
>>> +
>>> +            if ( unlikely(!(p2m_to_mask(p2mt) & valid_mask)) && foreign_page )
>>> +            {
>>> +                put_page(foreign_page);
>>> +                foreign_page = NULL;
>>> +            }
>>> +            if ( unlikely(!foreign_page) )
>>> +            {
>>> +                gdprintk(XENLOG_WARNING,
>>> +                         "Error accessing foreign gfn %" PRI_gfn "\n",
>>> +                         gfn_list[i]);
>>> +                rc = -EINVAL;
>>> +                copy.nr_frames -= i;
>>> +                guest_handle_add_offset(copy.frame_list, i);
>>> +                goto out;
>>> +            }
>>> +
>>> +            foreign_mfn = page_to_mfn(foreign_page);
>>> +
>>> +            /* A page is dirtied when it's being copied to. */
>>> +            if ( direction == XENMEM_foreigncopy_to )
>>> +                paging_mark_dirty(d, foreign_mfn);
>>> +
>>> +            foreign = map_domain_page(foreign_mfn);
>>> +            if ( direction == XENMEM_foreigncopy_from )
>>> +                rc = copy_to_guest(copy.buffer, foreign, PAGE_SIZE);
>>> +            else
>>> +                rc = copy_from_guest(foreign, copy.buffer, PAGE_SIZE);
>>
>> You cannot validly write to the page without holding a PGT_writable ref.
>> Else you might overwrite a page table or a descriptor table in a PV guest.
>>
> 
> Given that this code was "inspired" by other hypercalls I'll also
> check the other code.
> 
>> Once again - can you please make sure you have addressed earlier review
>> comments, before sending a new version? I did point this out before.
> 
> Apparently not.

https://lists.xen.org/archives/html/xen-devel/2026-06/msg00850.html

>>> +                copy.nr_frames -= i;
>>> +                guest_handle_add_offset(copy.frame_list, i);
>>> +                goto out;
>>> +            }
>>> +
>>> +            guest_handle_add_offset(copy.buffer, PAGE_SIZE);
>>> +        }
>>> +
>>> +        copy.nr_frames -= todo;
>>> +        guest_handle_add_offset(copy.frame_list, todo);
>>
>> Don't you need to also update copy.buffer?
> 
> It's updated some lines above inside the loop.

Oh, sorry. Yet then - not doing all updates together is, as you can see,
potentially confusing.

>>> @@ -2012,6 +2145,18 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>              start_extent);
>>>          break;
>>>
>>> +    case XENMEM_foreigncopy:
>>> +        /*
>>> +         * Instead of using "start_extent" we update the structure back,
>>> +         * we update it back in anyway to tell caller were the copy
>>> +         * stopped.
>>> +         */
>>> +        if ( unlikely(start_extent) )
>>> +            return -EINVAL;
>>
>> As before - please be precise with comments like this. We update it back also
>> when encoding a continuation. Perhaps instead "..., to indicate the point of
>> failure to the caller as well as to encode continuations without being
>> constrained by MEMOP_EXTENT_SHIFT".
>>
> 
> What about (trying to include your suggestion, to be fixed for line length):
> 
>         /*
>          * Instead of using "start_extent" for the continuation, we
> update the structure back,
>          * we update the xen_foreigncopy structure back, so we are not
> constrained
>          * by MEMOP_EXTENT_SHIFT.
>          * We copy it back also to tell the caller where the copy stopped.
>          */

One of the things I take issue with (because it's hard to read that way,
at least for me) is the repeated use of "update ... back", effectively
saying the same things twice. The last sentence also wants disambiguating
towards the "stopped" possibly being a non-error situation as well.

>>> --- a/xen/include/public/memory.h
>>> +++ b/xen/include/public/memory.h
>>> @@ -740,7 +740,49 @@ struct xen_vnuma_topology_info {
>>>  typedef struct xen_vnuma_topology_info xen_vnuma_topology_info_t;
>>>  DEFINE_XEN_GUEST_HANDLE(xen_vnuma_topology_info_t);
>>>
>>> -/* Next available subop number is 29 */
>>> +/*
>>> + * Copy memory from/to a given domain.
>>> + * As this call requires target access and guest with target access won't be
>>> + * compat guests supported for compat guests this is not implemented.
>>
>> As before - I question this. You simply can't know. (I'm also struggling with
>> wording / grammar.)
> 
> I was trying to code the compatibility layer. Is there a way to have
> 64 bit PFN even for compatibility guests instead of having to limit
> and convert PFN numbers?

compat_pfn_t is a typedef of unsigned int (since a 32-bit guest seeing
"typedef unsigned long xen_pfn_t;" results in xen_pfn_t being a 32-bit
quantity for it), so 32-bit guests can only supply 32-bit frame numbers.
There's also no value in trying to be clever and using uint64_t instead
for the frame_list handle, as 32-bit guests won't ever own pages with
MFNs wider than 32 bits.

>>> + */
>>> +#define XENMEM_foreigncopy 29
>>> +struct xen_foreigncopy {
>>> +    /* IN - The domain whose memory is to be copied. */
>>> +    domid_t domid;
>>> +
>>> +    /* IN - Flags. */
>>> +#define XENMEM_foreigncopy_from 0
>>> +#define XENMEM_foreigncopy_to 1
>>> +#define XENMEM_foreigncopy_direction 1
>>> +    uint16_t flags;
>>> +
>>> +    /*
>>> +     * IN/OUT
>>> +     *
>>> +     * As an IN parameter number of frames of the domain to be copied.
>>> +     * On output on error updated number of frames left.
>>> +     */
>>> +    uint32_t nr_frames;
>>> +
>>> +    /*
>>> +     * IN/OUT
>>> +     *
>>> +     * Frames to be copied.
>>> +     * On output on error updated to point to first frame unhandled.
>>
>> Is "on error" really correct / meaningful? The field can be updated at
>> any intermediate point, when a continuation is scheduled. Perhaps:
>>
>>      * On output:
>>      *  - on error updated to point to first frame which couldn't be handled,
>>      *  - on success undefined.
>>
>> Along these lines for nr_frames then as well (if needed at all, seeing
>> that it could as well be undefined in both cases, as the information is
>> redundant with the frame_list update).
>>
>>> +     */
>>> +    XEN_GUEST_HANDLE(xen_pfn_t) frame_list;
>>> +
>>> +    /*
>>> +     * IN/OUT
>>> +     *
>>> +     * Userspace buffer to read/write from.
>>
>> s/Userspace/Guest/ ?
>>
>> Also still no mention of when / how this field is updated.
>>
> 
> What about:
> 
> /*
>  * Copy memory from/to a given domain.
>  */
> #define XENMEM_foreigncopy 29
> struct xen_foreigncopy {
>     /* IN - The domain whose memory is to be copied. */
>     domid_t domid;
> 
>     /* IN - Flags. */
> #define XENMEM_foreigncopy_from 0
> #define XENMEM_foreigncopy_to 1
> #define XENMEM_foreigncopy_direction 1
>     uint16_t flags;
> 
>     /*
>      * IN/OUT
>      *
>      * As an IN parameter number of frames of the domain to be copied.
>      * On output updated number of frames left (0 if success).
>      */
>     uint32_t nr_frames;
> 
>     /*
>      * IN/OUT
>      *
>      * Frames to be copied.
>      * On output updated to point to the first frame unhandled.

There may be no such frame, so at the very least add "..., if any"?

>      */
>     XEN_GUEST_HANDLE(xen_pfn_t) frame_list;
> 
>     /*
>      * IN/OUT
>      *
>      * Guest buffer to read/write from.
>      * On output updated to point to the first frame unhandled.

There's no frame here, as long as you don't switch to using two frame
lists (for source and destination).

>      */
>     XEN_GUEST_HANDLE(uint8) buffer;
> };
> typedef struct xen_foreigncopy xen_foreigncopy_t;
> DEFINE_XEN_GUEST_HANDLE(xen_foreigncopy_t);
> 
>>> +     */
>>> +    XEN_GUEST_HANDLE(uint8) buffer;
>>> +};
>>
>> What was (again) left unaddressed is the question towards using GFNs on both
>> sides of the copy. This would eliminate the need for the flags field, taken
>> by a 2nd domid_t one then.
>>
> 
> This was addressed in
> https://lists.xenproject.org/archives/html/xen-devel/2026-06/msg00567.html

Well, yes, but not in a satisfactory way. Back channels tell me that you
actually got the same feedback already on internal review. Which makes it
all the more puzzling that you insist on doing it differently. Multiple
maintainers asking for the same thing may be an indication of something.

> and in minor way by
> https://lists.xenproject.org/archives/html/xen-devel/2026-06/msg00847.html.
> It was considered but more complicated and worse from a performance perspective.

Okay, performance-wise worse would of course be relevant. But that would
need supporting by numbers (for both PV and PVH Dom0, as the latter
incurs extra overhead for virtual-address-based hypercall buffer operands).

Jan

