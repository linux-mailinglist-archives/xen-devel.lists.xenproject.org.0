Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TR+oEOAuIGouyQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 15:40:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9177C63829C
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 15:40:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=QT3COJqS;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1326389.1591832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUlp9-0004g4-7o; Wed, 03 Jun 2026 13:39:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326389.1591832; Wed, 03 Jun 2026 13:39:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUlp9-0004dR-3q; Wed, 03 Jun 2026 13:39:59 +0000
Received: by outflank-mailman (input) for mailman id 1326389;
 Wed, 03 Jun 2026 13:39:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUlp7-0004dL-Cq
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 13:39:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUlp6-00C9fy-HM
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 15:39:56 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a202e9d-5cb7-0a2a0a5109dd-0a2a4507b390-42
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:39:56 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a202eab-229c-0a2a45070019-d1558031d9dc-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:39:56 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-490b3637b90so16843915e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 06:39:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b7a52cbesm18191795e9.3.2026.06.03.06.39.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2026 06:39:55 -0700 (PDT)
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
        d=suse.com; s=google; t=1780493995; x=1781098795; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=A3qY6/INWxt/kXC8UNIMg2PYuKyGVPqo3xTNaZCQoIg=;
        b=QT3COJqS9AtfdPmLHBUVyhT6XYisWVoDa9scr+W47iB5heleKNkq4e0/MZvOO0Kw3A
         sz/nYit2qOSyoTO8uDlbVOsr9dBPlIRwf9idyTrFNGP7hK9wvEQIYw7aCUCTZHYgz2Sa
         z4bVJiJyIbnQpvYS7KGfW8QidXGVavnnFgki07VXYmZjq8VGYGk1kCwQ3c1dCWHp6j4R
         vqvMop6SmpGtKubJmlrE4mbVv0uANECN+tvmCZccw7g2CeMrNfPPMO2WAcs/mdVIvt9S
         0UDkL/rLXGEgKbD4wZKqKvp/SAiRaQwa+QYj8GafeT4Yy/k/A4cfAgQ+2dW5RHNlNpj3
         GusA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780493995; x=1781098795;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A3qY6/INWxt/kXC8UNIMg2PYuKyGVPqo3xTNaZCQoIg=;
        b=T1ELUA8EgH6sUQQogGAy2AE9Hv19VKNO67w7Mzvx6/c4HcTd7jdJI+7VqX2bVT7Fe8
         sFUWTkvBL4/714BDP6GndkWnVbKnp4m67Ycl6fZjuvtAhL6uSYWQx9C2BVTyctdU4cjz
         3FqyeTdFO1ifZTBpiGic90xvx2AVm56ZAknRFkHgVWRhUNtOd84NZyUCxddFArMeRkMv
         i7K7YyZfgKDEXlsRhfGRRfj4P1KKdhl3HK6pgv4BUx/kYYRBI48NpLjuWzQZAj2qRQcn
         OK2RIUCS7hhL3DNpqXWOwIiAtt8taizsajxR4BVFahCMngTKC1IgAkmpwE8Ohf7DWIZ/
         pG5A==
X-Forwarded-Encrypted: i=1; AFNElJ/MKe5asFv2wChXZT9foxrcWTpNEZ72VsjJlrBKMNlcgW6dIqFq4a0PhBoKXTQUA2Nc/Xxq0c1VLWo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyZ/raB/7vCyEFoh590pUP9vSzrROhha3QrG3Y7LR3dcHXcOjsQ
	MmKqOzuqi2ZMW3cFWQjXvm+alI1BRWMO428x8mnw4Awg+lE2wK3WdKd/PsvroQufxQ==
X-Gm-Gg: Acq92OHXjGBs3HH2Qaqr5Pyftb6oubLD1dyj9g3LQ6Nc4DEFhj4HSuI/V4oJ2zhTmiK
	4wtVdT9BBLl6C3K3Nx+z1uQ0pqUE7tvCaTjDHRTbZ68STtIdzv74kd8SOCpoO8Rgl9+slafjoCM
	DR0rGu+/4leIRf4cAPxH7pMd+sp2wuk5ciTEvJeWv5T4MvYR4irB7vS5Txn6wLBQwnN2OEbORfF
	0uVj1ltGn5j4FNyK4US8Wb94a+xSR1oHrSq3JWMhLiomCQMbihm9LqVaXj/Fr07vg+e4G+33zt2
	MAPCcNo/OWMfGhEUv9aQFHZsS0JIQYuBUN1Xw3hjKxcGFVb+KxF2MoyjOcE0SYgBruKT5um6hts
	hxB65g2C0JRP+V57fo3Tiui1PI8grJ4U9KCFVqdBQ15CGflxvWKRZn74XG5Q0/TWv9MpaGvClGL
	pPgG+bmXgJWeSI+HfUArzAOfvFw4Axw0ocI/1vnYbd+RUES/8R33eIjZERqiPodtI6Vbc185J75
	mKsZhSpPy4Z/Z4pp5g01101+w==
X-Received: by 2002:a05:600c:6389:b0:490:b9c3:6c62 with SMTP id 5b1f17b1804b1-490b9c36e79mr36612945e9.28.1780493995571;
        Wed, 03 Jun 2026 06:39:55 -0700 (PDT)
Message-ID: <8e71b997-a695-41bd-bfec-fac2740db142@suse.com>
Date: Wed, 3 Jun 2026 15:39:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/16] xen: implement new foreign copy hypercall
To: Frediano Ziglio <freddy77@gmail.com>
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <20260603130603.776452-1-frediano.ziglio@cloud.com>
 <20260603130603.776452-13-frediano.ziglio@cloud.com>
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
In-Reply-To: <20260603130603.776452-13-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1780493996-20F66C48-68D30F43/0/0
X-purgate-type: clean
X-purgate-size: 7127
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
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:frediano.ziglio@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:from_mime,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9177C63829C

On 03.06.2026 15:05, Frediano Ziglio wrote:
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -1545,6 +1545,132 @@ static int acquire_resource(
>      return rc;
>  }
>  
> +/*
> + * The "noinline" qualifier avoid the compiler to create a large function
> + * consuming quite a lot of stack.
> + */
> +static int noinline mem_foreigncopy(
> +    XEN_GUEST_HANDLE_PARAM(xen_foreigncopy_t) arg)
> +{
> +    struct domain *d, *const currd = current->domain;
> +    xen_foreigncopy_t copy;
> +    int rc, direction;
> +
> +    if ( !arch_acquire_resource_check(currd) )
> +        return -EACCES;

How is the new sub-op related to acquire-resource? And aren't you instead
lacking an XSM check?

> +    if ( copy_from_guest(&copy, arg, 1) )
> +        return -EFAULT;
> +
> +    if ( copy.flags & ~1u )

If a suffix is needed here in the first place, please use an upper-case one.
Misra only demands L suffixes to be upper-case, but iirc we decided that
then we want all suffixes that way.

> +        return -EINVAL;
> +
> +    direction = copy.flags & XENMEM_foreigncopy_direction;
> +
> +    if ( copy.nr_frames == 0 )
> +        return 0;
> +
> +    rc = rcu_lock_remote_domain_by_id(copy.domid, &d);

Why not rcu_lock_domain_by_any_id()? IOW why would a self-copy need
prohibiting? 

> +    if ( rc )
> +        return rc;
> +
> +    /*
> +     * Check we are allowed to map and access these foreign pages.
> +     */
> +    rc = xsm_map_gmfn_foreign(XSM_TARGET, currd, d);
> +    if ( rc )
> +        goto out;
> +
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
> +        for ( unsigned i = 0; i < todo; i++ )
> +        {
> +            struct page_info *foreign_page;
> +            void *foreign;
> +            p2m_type_t p2mt;
> +
> +            foreign_page = get_page_from_gfn(d, gfn_list[i], &p2mt, P2M_ALLOC);
> +
> +            if ( unlikely(p2mt != p2m_ram_rw
> +#ifdef CONFIG_X86
> +                 && p2mt != p2m_ram_logdirty
> +#endif
> +                 ) && foreign_page )

This is ugly formatting wise, and the use of unlikely() isn't very likely
to have the effect you intend: As long as the compiler can't translate the
&& expression to something involving only a single conditional branch,
which of the branches is it that is unlikely to be taken?

> +            {
> +                put_page(foreign_page);
> +                foreign_page = NULL;
> +            }
> +            if ( unlikely(!foreign_page) )
> +            {
> +                gdprintk(XENLOG_WARNING,
> +                         "Error accessing foreign mfn %" PRI_mfn "\n",
> +                         gfn_list[i]);

As per get_page_from_gfn() and gfn_list[] it's a GFN, not an MFN.

> +                rc = -EINVAL;
> +                copy.nr_frames -= i;
> +                guest_handle_add_offset(copy.frame_list, i);
> +                goto out;
> +            }
> +
> +            /* A page is dirtied when it's being copied to. */
> +            if ( direction == XENMEM_foreigncopy_to )
> +                paging_mark_dirty(d, page_to_mfn(foreign_page));
> +
> +            foreign = map_domain_page(page_to_mfn(foreign_page));
> +            if ( direction == XENMEM_foreigncopy_from )
> +                rc = copy_to_guest(copy.buffer, foreign, PAGE_SIZE);
> +            else
> +                rc = copy_from_guest(foreign, copy.buffer, PAGE_SIZE);
> +            unmap_domain_page(foreign);
> +            put_page(foreign_page);
> +
> +            if ( unlikely(rc) )
> +            {
> +                gdprintk(XENLOG_WARNING,
> +                         "Error copying to mfn %" PRI_mfn "\n", gfn_list[i]);

"to" isn't always correct here, and the problem wasn't with the GFN (not
MFN) anyway, but with the buffer.

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
> +
> +        if ( copy.nr_frames && hypercall_preempt_check() )
> +        {
> +            rc = hypercall_create_continuation(
> +                __HYPERVISOR_memory_op, "lh", XENMEM_foreigncopy, arg);
> +            goto out;
> +        }
> +    } while ( copy.nr_frames );
> +
> +    rc = 0;
> +
> + out:
> +    rcu_unlock_domain(d);
> +
> +    /* Update in all cases, it allows the caller to know how many
> +     * frames were successfully copied and the continuation to
> +     * continue correctly.
> +     */
> +    if ( copy_to_guest(arg, &copy, 1) )

Since you already used copy_from_guest() one the way in, __copy_to_guest()
will do here.

> +        rc = -EFAULT;
> +
> +    return rc;
> +}

Before looking at the implementation in yet more detail: This is quite a
bit of new code. Did you at least consider extending MMUEXT_COPY_PAGE
along the lines of what c6b8bdfe3b47 ("x86: extend mmu_update hypercall
to allow update of foreign pagetables") did, allowing two domains to be
specified in the foreigndom argument?

> @@ -2012,6 +2138,13 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>              start_extent);
>          break;
>  
> +    case XENMEM_foreigncopy:
> +        if ( unlikely(start_extent) )
> +            return -EINVAL;

Why make this different from other continuable sub-ops?

> --- a/xen/include/public/memory.h
> +++ b/xen/include/public/memory.h
> @@ -740,7 +740,45 @@ struct xen_vnuma_topology_info {
>  typedef struct xen_vnuma_topology_info xen_vnuma_topology_info_t;
>  DEFINE_XEN_GUEST_HANDLE(xen_vnuma_topology_info_t);
>  
> -/* Next available subop number is 29 */
> +/*
> + * Copy memory from/to a given domain.
> + */
> +#define XENMEM_foreigncopy 29
> +struct xen_foreigncopy {
> +    /* IN - The domain whose resource is to be copied. */
> +    domid_t domid;
> +
> +    /* IN - Flags. */
> +#define XENMEM_foreigncopy_from 0
> +#define XENMEM_foreigncopy_to 1
> +#define XENMEM_foreigncopy_direction 1
> +    uint16_t flags;
> +
> +    /*
> +     * IN
> +     *
> +     * As an IN parameter number of frames of the domain to be copied.
> +     */
> +    uint32_t nr_frames;
> +
> +    /*
> +     * IN
> +     *
> +     * Frames to be copied.
> +     */
> +    XEN_GUEST_HANDLE(xen_pfn_t) frame_list;
> +
> +    /*
> +     * IN/OUT
> +     *
> +     * Userspace buffer to read/write from.
> +     */
> +    XEN_GUEST_HANDLE(uint8) buffer;
> +};

Seeing the two handles - what about compat_memory_op()?

Jan

