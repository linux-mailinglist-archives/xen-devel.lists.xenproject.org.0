Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pQJnGtesL2qiEQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 09:42:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B775B684497
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 09:42:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=QYpvWlYB;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1338030.1599056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ1wc-0000X2-A2; Mon, 15 Jun 2026 07:41:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338030.1599056; Mon, 15 Jun 2026 07:41:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ1wc-0000UT-6p; Mon, 15 Jun 2026 07:41:18 +0000
Received: by outflank-mailman (input) for mailman id 1338030;
 Mon, 15 Jun 2026 07:41:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZ1wa-0000UN-9x
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 07:41:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZ1wZ-001iCl-N1
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 09:41:15 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2fac9b-2eae-0a2a0a5409dd-0a2a4508db48-0
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 09:41:15 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2fac9b-63b5-0a2a45080019-d155dd31edb5-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 09:41:15 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-45eeba68948so2199223f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 00:41:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490ea963cf8sm191853665e9.2.2026.06.15.00.41.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2026 00:41:14 -0700 (PDT)
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
        d=suse.com; s=google; t=1781509275; x=1782114075; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UuHI6Gu/da2Sf7eCm7CZhxbcwwH09LKnWMjkYuVqYl0=;
        b=QYpvWlYBGol9ZB+/rAhY4VNaTaArHvzO6wkD+aat31ksdtPq/lRm72FUSfcRFKFPbi
         8uyyVXhVETgh+dW6+oGEbI+gpmV3RWB5Juni8dja+6lFv4uMI3hEGgYyIXShW4UHhPJr
         y1KuXkj/qUOCvpCYrodFn23aCQ5ka5jLsqLkkQPcAyo+/qTiWfIDLJ7O3e/xwilVVmOy
         +oDRHEPI9lgxKZ5c4Q+j7XuKCOFy6lD9WjBdq/LiUoFeGkRFsW8cKGnPm2TxPpjP4KDk
         hq9nKDUWMiW4EZgxMcZmgnJQaDXn10bfO8vljB6H3aW7pSfywjYtFYs8mnDgKP2jGC3M
         KVwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781509275; x=1782114075;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UuHI6Gu/da2Sf7eCm7CZhxbcwwH09LKnWMjkYuVqYl0=;
        b=lV8/vPF8+vkoPQN41etHAJ24zjo65GPSYdikDdgZfEI55Bb2owOObYqMIArn1JP6Xo
         BrlO2w8vqAUvvqTU41HFF9jrwy1gP6vilCc+w9pKQG0IqSjyynf/Uf568jd5Ag5RCeP8
         1kFbp9M9+IRuQGAUIa8Mlqmk75d55inz/uGzBInUV+DC6iVlEKVBjpRX7ROMcwxHHcea
         5aQrY6xdhDnwZMP/peWrMnoi9/wTZDRbK9kSw/HO5H62ifqNmQulEizshJyO+9Avhklg
         4G3XOzxElL/QlNdKfVJ+7Od/410nHmiZdOlhvLjTAPu8Wgyg4B97DGPgch+i4W7/1xGw
         WAYA==
X-Forwarded-Encrypted: i=1; AFNElJ8HV2YfW26Aahl+cWNKMcOX/PYePhcM1eJMyotqqIjgVo/uXjyODD2ENtRF7sHQJ4O1ucUG2M2JSos=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx4ug9sBAPGhnkIs7xxhbPm0RE3+z/qGiQ42GZvrFs9gwq8OqBO
	6bsmNXtE+iRiQxp8blKdGyEwsDmXxUC1rdkYJSJ0RTe6FWPJw/Gsj9+uUMdGCnv4Qv9kSfA4scS
	oEcs=
X-Gm-Gg: Acq92OEF/AdgDAlIAINxUpS703JpZmBJvzMLBfVbVLEylEIoUsnYB8GlYPQ+SZUBNLe
	AU/rzt/W4ulrnmt/7aBDXUiKAU3UtBN/vfUsTkLxrZ3Schp5qqWis4BV29mjueUxDtfWD/lPlB2
	3oyQVAanM5bsgATQbZNHkcV/wYCGsxeay+x+coBubdUHOqpLi8s/rz15QbWdRZpE2oLa4A2iTMx
	UbGEuLHQNPc+dKLpMVfMDyKi9VqexwzxekYIDeqM8ILi1lajvvaLtwN6z1kyWT6QcYRWlbPKaPr
	YmEqNtWlalW9stJptAQOAHj6PK7dg40k9gZQm/Wphwlq0u/DxEkFltJdCPpBeK+4w3Iu8LzpOJ2
	DTv4nULxbvy3QE4B+DyeLbLBhYV1MFwsJkjacoH73tmpoqX4lrWbMzOhRDvlzCdAgxkkKUqgCuH
	Rdk/Vf4n/l9+5/qZXLj3c63z5urLikCktJ/B3XnlLReplQ9OYEB70V3izpaefuT5putKzawzEGn
	iMeS4VVDMmcbCg=
X-Received: by 2002:a05:600c:4f94:b0:490:bd66:e522 with SMTP id 5b1f17b1804b1-490ec50075fmr160204645e9.29.1781509274618;
        Mon, 15 Jun 2026 00:41:14 -0700 (PDT)
Message-ID: <8289ea1d-ceca-40b6-a992-a778be053cd0@suse.com>
Date: Mon, 15 Jun 2026 09:41:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/16] xen: implement new foreign copy hypercall
To: Frediano Ziglio <freddy77@gmail.com>
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org, Daniel Smith <dpsmith@apertussolutions.com>
References: <20260613214749.20620-1-frediano.ziglio@cloud.com>
 <20260613214749.20620-13-frediano.ziglio@cloud.com>
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
In-Reply-To: <20260613214749.20620-13-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1781509275-BE368DB1-06F3F6EC/0/0
X-purgate-type: clean
X-purgate-size: 7742
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
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:frediano.ziglio@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
X-Rspamd-Queue-Id: B775B684497

On 13.06.2026 23:47, Frediano Ziglio wrote:
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -1545,6 +1545,133 @@ static int acquire_resource(
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
> +    if ( copy.flags & ~1U )
> +        return -EINVAL;
> +
> +    direction = copy.flags & XENMEM_foreigncopy_direction;
> +
> +    if ( copy.nr_frames == 0 )
> +        return 0;
> +
> +    rc = rcu_lock_remote_domain_by_id(copy.domid, &d);
> +    if ( rc )
> +        return rc;

Extending my v4 remark: How about a "fully foreign" copy? I.e. one between two
pages in two foreign domains? Getting me back also to the un-answered v4
question of mine as to MMUEXT_COPY_PAGE.

Further, as to the order of checks: I'm not going to insist on re-ordering, yet
I'd like to point out that copying 0 pages to/from a bad domid might better
yield an error.

> +    /*
> +     * Check we are allowed to map and access these foreign pages.
> +     */
> +    rc = xsm_map_gmfn_foreign(XSM_TARGET, currd, d);
> +    if ( rc )
> +        goto out;

As per

K:	xsm_.*
K:	\b(xsm|XSM)\b

in ./MAINTAINERS please Cc the XSM/Flask maintainer for such changes. I for one
question the re-use of an existing predicate here.

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

Nit: "unsigned int" please (like you have it above).

> +        {
> +            struct page_info *foreign_page;
> +            void *foreign;
> +            p2m_type_t p2mt;
> +            const unsigned long valid_mask =
> +#ifdef CONFIG_X86
> +                p2m_to_mask(p2m_ram_rw) | p2m_to_mask(p2m_ram_logdirty);
> +#else
> +                p2m_to_mask(p2m_ram_rw);
> +#endif

What about, for example, p2m_ram_ro? Or p2m_ram_shared? Or p2m_grant_map_*?
Etc. Any artificial constraining wants justifying in the description and/or
mentioning in the public header.

> +            foreign_page = get_page_from_gfn(d, gfn_list[i], &p2mt, P2M_ALLOC);
> +
> +            if ( unlikely(p2m_to_mask(p2mt) & valid_mask) && foreign_page )

Was this meant to be

            if ( unlikely(!(p2m_to_mask(p2mt) & valid_mask)) && foreign_page )

?

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
> +            /* A page is dirtied when it's being copied to. */
> +            if ( direction == XENMEM_foreigncopy_to )
> +                paging_mark_dirty(d, page_to_mfn(foreign_page));
> +
> +            foreign = map_domain_page(page_to_mfn(foreign_page));

Latch page_to_mfn(foreign_page) into a local variable to avoid the redundant
translation (which the compiler may not be able to fold)?

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
> +                         "Error %d copying gfn %" PRI_gfn "\n",
> +                         -rc, gfn_list[i]);
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
> +    /*
> +     * Update in all cases, it allows the caller to know how many
> +     * frames were successfully copied and the continuation to
> +     * continue correctly.
> +     */
> +    if ( __copy_to_guest(arg, &copy, 1) )
> +        rc = -EFAULT;

It's not quite clear whether replacing an earlier non-zero value held in
rc is a good thing here. The only time when it's strictly necessary is
when you schedule a continuation. I'd suggest to add "&& rc >= 0".

> @@ -2012,6 +2139,13 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>              start_extent);
>          break;
>  
> +    case XENMEM_foreigncopy:
> +        if ( unlikely(start_extent) )
> +            return -EINVAL;

Please address review comments (verbally or by code changes) before submitting
a new version. Here I had asked "Why make this different from other continuable
sub-ops?"

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

There's still "resource" here, when this really is about RAM (memory) only,
not any other kind of resource.

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

This isn't just an input, as you update the field (and the handles below).
This property of fields wants reflecting here, so callers know that they (a)
can't re-use the struct on a subsequent call without re-initializing the
fields which may have changed, and (b) can't put the struct in r/o memory.

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

With these two handles, there continues to be a need to (explicitly) deal
with the compat case as well.

Jan

