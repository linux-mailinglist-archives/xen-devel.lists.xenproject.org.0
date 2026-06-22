Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id riE5LrgPOWqymAcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 12:34:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1990E6AEBAA
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 12:34:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=AoXdcvZ+;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1343605.1602864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbbyv-0006hR-Hh; Mon, 22 Jun 2026 10:34:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1343605.1602864; Mon, 22 Jun 2026 10:34:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbbyv-0006fB-F4; Mon, 22 Jun 2026 10:34:21 +0000
Received: by outflank-mailman (input) for mailman id 1343605;
 Mon, 22 Jun 2026 10:34:19 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wbbyt-0006f3-I7
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 10:34:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbbyq-005jXV-UD
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 12:34:16 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a390f9d-2eae-0a2a0a5409dd-0a2a45019c00-40
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 12:34:16 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a390fa8-e031-0a2a45010019-d155802dc1a9-3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 12:34:16 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-49222b6e871so35943805e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 03:34:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-466648c5413sm26183013f8f.11.2026.06.22.03.34.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2026 03:34:15 -0700 (PDT)
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
        d=suse.com; s=google; t=1782124456; x=1782729256; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RDzNNdHd4vNMUSDZ8I4fLAZSby25qbXcfj9DT//iM4A=;
        b=AoXdcvZ+iGSkBrBm3yJsJMZmhi18IlUa97/U9oX3Iewt5ky1PgLhACKmzZuksRMS7J
         gZrNJEaxSUxW4uHH8EXc2kWQY9tKlBzOhhMPPnoPrTNt/FF2iI7tCfCSJ+tZ2d5jZ9Yv
         ByKT+IntLUMY7QtKVHzA7Z98aYWbNb4ZpW2jb4BvO15qmnDED7smv64pYc80eWnMen4+
         JggAutPprTyFom4rrlyocBfkxjaQu8YdIqTOk53zk1v2KTVfGhSVeTAdJDkHMPLsBkKu
         6dPEnLENaPlexK5TQW45v+ZQVhRzmQFJViIn12IkqylrfWKO9qRC17oP4SZHx+W1vNn6
         iprw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782124456; x=1782729256;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RDzNNdHd4vNMUSDZ8I4fLAZSby25qbXcfj9DT//iM4A=;
        b=ksSUsTkcgtjRdw7wcBPOLw+yGD1/Ijgs5CftRVj3Q3qaEtihFHy9EuqQ3Qlh0OgMCB
         WzXqpiM3h2+LnZjDCIsWRfGnd4kNkezOaxokqbj7xWnIf+DYUJQfIXZx9Neq+6vxeYCf
         c6jMpR+yzitWKed9DaRNp/em0BHZpwXEEEuennf8IxcrtIguxeU63G49qRr4QKQS6Rxj
         Yc7g/6+XMjRGj87Ziqdxig92IaYMp0NP225JOrTUMzQ7G4DISs2vWkULHzFQWB3hi1fX
         hixmPqlYyer7ArVihfb4b7EFVT0yrQToECpPrEqCxl1HEmGqV5awmi40AVwN9R7iMFju
         UumQ==
X-Forwarded-Encrypted: i=1; AFNElJ84ytpdAJkpZSfPXbecIEXDxplcExUKRQChGcRhI1IndhlUg6Q5YcrSleqSQ0s32i42INraqrlVQ7M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YypjrmFVbtxN4D8uaWoXRkVngpjbHsfklU/hffc6Mn6orTynMrK
	hNeG8kJuvNuiaswh/2KO/Z0AagKoCuA8PzcN3TPtBy8VGNFY0Nf2Ozp6ucXnNaovMQ==
X-Gm-Gg: AfdE7cmgXxGBPFPkkwK7Wq5tkkBX960wDpZybEX3+dts8FvAcZUc9u4/na5j68YpM3A
	lvNa7hXD8GVSL/ZWq3UKAd8SpiBcD6dydcjtjBbeQ2r4zi7mlnkm44Op6AgsUkesI+C4Oy+ofAk
	FtHjyGHRoISrGAkL4GdSwqwCZHX/VM2E+MHO2yYlhWNS71Y2/R7M5OmUs817rhb2Zi1Vx53m+Rk
	EYx93DPSU5/TIXXjU/5n6NLBD3XK9DvgB0vu2krCoSoyMdWRYzsM5Y0dk/HMEddfCsfBqnwVpm1
	poexk1i4tfEV3SlESiSge0H1S4kpYuVICAmZWHC7aZwzxjJPvwYagjbRTUVIJTgAOV/Jx4j43cR
	pTgtRXwaYu8I2hjb9kPfj2f5p2JSqNMDaBdfN9dUprqcmKYB/dQklP3A+ilz2t0VyNI7tCurcSp
	2LsLmLoBQzzrk8UMZ+nO2Cp4MJd9hLJWb5xU1XWPjh2Ou9u5RmuSzQeBHf5rUQCWj3DhIHby9WM
	VVo
X-Received: by 2002:a05:600c:820e:b0:490:d354:d151 with SMTP id 5b1f17b1804b1-49242571659mr185438835e9.18.1782124455754;
        Mon, 22 Jun 2026 03:34:15 -0700 (PDT)
Message-ID: <c5f00fa4-4d9e-4227-87a0-6e657fd523e9@suse.com>
Date: Mon, 22 Jun 2026 12:34:14 +0200
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
In-Reply-To: <20260619130501.272832-13-frediano.ziglio@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1782124456-70DF5E30-36E85AEB/0/0
X-purgate-type: clean
X-purgate-size: 7755
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:frediano.ziglio@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1990E6AEBAA

On 19.06.2026 15:04, Frediano Ziglio wrote:
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -1545,6 +1545,139 @@ static int acquire_resource(
>      return rc;
>  }
>  
> +/*
> + * The "noinline" qualifier avoids the compiler to create a large function
> + * consuming quite a lot of stack.
> + */
> +static int noinline mem_foreigncopy(
> +    XEN_GUEST_HANDLE_PARAM(xen_foreigncopy_t) arg)
> +{
> +    struct domain *d, *const currd = current->domain;
> +    xen_foreigncopy_t copy;
> +    int rc, direction;
> +
> +    if ( copy_from_guest(&copy, arg, 1) )
> +        return -EFAULT;
> +
> +    if ( copy.flags & ~XENMEM_foreigncopy_direction )
> +        return -EINVAL;
> +
> +    direction = copy.flags & XENMEM_foreigncopy_direction;
> +
> +    rc = rcu_lock_remote_domain_by_id(copy.domid, &d);

Iirc I did ask before why this isn't ..._by_any_id().

> +    if ( rc )
> +        return rc;
> +
> +    if ( copy.nr_frames == 0 )
> +    {
> +        rcu_unlock_domain(d);
> +        return 0;
> +    }

Any reason this cannot also be "goto out"? The more that now that you have
moved this past the domid validity check, imo it should further move to ...

> +    /*
> +     * Check we are allowed to map and access these foreign pages.
> +     */
> +    rc = xsm_map_gmfn_foreign(XSM_TARGET, currd, d);
> +    if ( rc )
> +        goto out;

... below here. Perhaps simply as

    if ( rc || !copy.nr_frames )
        goto out;

> +    do {
> +        /*
> +         * Arbitrary size.  Not too much stack space, and a reasonable stride
> +         * for continuation checks.
> +         */
> +        xen_pfn_t gfn_list[32];
> +        unsigned int todo = MIN(ARRAY_SIZE(gfn_list), copy.nr_frames);
> +
> +        rc = -EFAULT;
> +        if ( copy_from_guest(gfn_list, copy.frame_list, todo) )
> +            goto out;
> +
> +        for ( unsigned int i = 0; i < todo; i++ )
> +        {
> +            struct page_info *foreign_page;
> +            mfn_t foreign_mfn;
> +            void *foreign;
> +            p2m_type_t p2mt;
> +            const unsigned long valid_mask =
> +#ifdef CONFIG_X86
> +                p2m_to_mask(p2m_ram_rw) | p2m_to_mask(p2m_ram_logdirty);
> +#else
> +                p2m_to_mask(p2m_ram_rw);
> +#endif

The set of permitted types didn't change, yet a justification for the resulting
limitation also didn't appear.

> +            foreign_page = get_page_from_gfn(d, gfn_list[i], &p2mt, P2M_ALLOC);
> +
> +            if ( unlikely(!(p2m_to_mask(p2mt) & valid_mask)) && foreign_page )
> +            {
> +                put_page(foreign_page);
> +                foreign_page = NULL;
> +            }
> +            if ( unlikely(!foreign_page) )
> +            {
> +                gdprintk(XENLOG_WARNING,
> +                         "Error accessing foreign gfn %" PRI_gfn "\n",
> +                         gfn_list[i]);
> +                rc = -EINVAL;
> +                copy.nr_frames -= i;
> +                guest_handle_add_offset(copy.frame_list, i);
> +                goto out;
> +            }
> +
> +            foreign_mfn = page_to_mfn(foreign_page);
> +
> +            /* A page is dirtied when it's being copied to. */
> +            if ( direction == XENMEM_foreigncopy_to )
> +                paging_mark_dirty(d, foreign_mfn);
> +
> +            foreign = map_domain_page(foreign_mfn);
> +            if ( direction == XENMEM_foreigncopy_from )
> +                rc = copy_to_guest(copy.buffer, foreign, PAGE_SIZE);
> +            else
> +                rc = copy_from_guest(foreign, copy.buffer, PAGE_SIZE);

You cannot validly write to the page without holding a PGT_writable ref.
Else you might overwrite a page table or a descriptor table in a PV guest.

Once again - can you please make sure you have addressed earlier review
comments, before sending a new version? I did point this out before.

> +            unmap_domain_page(foreign);
> +            put_page(foreign_page);
> +
> +            if ( unlikely(rc) )
> +            {
> +                gdprintk(XENLOG_WARNING,
> +                         "Error %d copying gfn %" PRI_gfn "\n",
> +                         -rc, gfn_list[i]);

Why "-rc"? (See other log messages including error codes.)

> +                copy.nr_frames -= i;
> +                guest_handle_add_offset(copy.frame_list, i);
> +                goto out;
> +            }
> +
> +            guest_handle_add_offset(copy.buffer, PAGE_SIZE);
> +        }
> +
> +        copy.nr_frames -= todo;
> +        guest_handle_add_offset(copy.frame_list, todo);

Don't you need to also update copy.buffer?

> @@ -2012,6 +2145,18 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>              start_extent);
>          break;
>  
> +    case XENMEM_foreigncopy:
> +        /*
> +         * Instead of using "start_extent" we update the structure back,
> +         * we update it back in anyway to tell caller were the copy
> +         * stopped.
> +         */
> +        if ( unlikely(start_extent) )
> +            return -EINVAL;

As before - please be precise with comments like this. We update it back also
when encoding a continuation. Perhaps instead "..., to indicate the point of
failure to the caller as well as to encode continuations without being
constrained by MEMOP_EXTENT_SHIFT".

> --- a/xen/include/public/memory.h
> +++ b/xen/include/public/memory.h
> @@ -740,7 +740,49 @@ struct xen_vnuma_topology_info {
>  typedef struct xen_vnuma_topology_info xen_vnuma_topology_info_t;
>  DEFINE_XEN_GUEST_HANDLE(xen_vnuma_topology_info_t);
>  
> -/* Next available subop number is 29 */
> +/*
> + * Copy memory from/to a given domain.
> + * As this call requires target access and guest with target access won't be
> + * compat guests supported for compat guests this is not implemented.

As before - I question this. You simply can't know. (I'm also struggling with
wording / grammar.)

> + */
> +#define XENMEM_foreigncopy 29
> +struct xen_foreigncopy {
> +    /* IN - The domain whose memory is to be copied. */
> +    domid_t domid;
> +
> +    /* IN - Flags. */
> +#define XENMEM_foreigncopy_from 0
> +#define XENMEM_foreigncopy_to 1
> +#define XENMEM_foreigncopy_direction 1
> +    uint16_t flags;
> +
> +    /*
> +     * IN/OUT
> +     *
> +     * As an IN parameter number of frames of the domain to be copied.
> +     * On output on error updated number of frames left.
> +     */
> +    uint32_t nr_frames;
> +
> +    /*
> +     * IN/OUT
> +     *
> +     * Frames to be copied.
> +     * On output on error updated to point to first frame unhandled.

Is "on error" really correct / meaningful? The field can be updated at
any intermediate point, when a continuation is scheduled. Perhaps:

     * On output:
     *  - on error updated to point to first frame which couldn't be handled,
     *  - on success undefined.

Along these lines for nr_frames then as well (if needed at all, seeing
that it could as well be undefined in both cases, as the information is
redundant with the frame_list update).

> +     */
> +    XEN_GUEST_HANDLE(xen_pfn_t) frame_list;
> +
> +    /*
> +     * IN/OUT
> +     *
> +     * Userspace buffer to read/write from.

s/Userspace/Guest/ ?

Also still no mention of when / how this field is updated.

> +     */
> +    XEN_GUEST_HANDLE(uint8) buffer;
> +};

What was (again) left unaddressed is the question towards using GFNs on both
sides of the copy. This would eliminate the need for the flags field, taken
by a 2nd domid_t one then.

Jan

