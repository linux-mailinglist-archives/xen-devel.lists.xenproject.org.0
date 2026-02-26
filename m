Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cO+ZH9lsoGk3jgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 16:55:05 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA2B1A92E0
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 16:55:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1242161.1542841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvdgk-00028x-Al; Thu, 26 Feb 2026 15:54:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1242161.1542841; Thu, 26 Feb 2026 15:54:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvdgk-000276-6z; Thu, 26 Feb 2026 15:54:06 +0000
Received: by outflank-mailman (input) for mailman id 1242161;
 Thu, 26 Feb 2026 15:54:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S+Ht=A6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vvdgj-000270-0l
 for xen-devel@lists.xenproject.org; Thu, 26 Feb 2026 15:54:05 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5eb76429-132b-11f1-9ccf-f158ae23cfc8;
 Thu, 26 Feb 2026 16:54:02 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-436e87589e8so1011107f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Feb 2026 07:54:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c7657c7sm330809f8f.28.2026.02.26.07.54.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Feb 2026 07:54:00 -0800 (PST)
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
X-Inumbo-ID: 5eb76429-132b-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772121241; x=1772726041; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MNZNyRP1+/BMikhGjXgBseL3jZKGuixhxpWEQaQcXKA=;
        b=OqRWSrPCMwqp6Eg5Gxk5cJFARxiT7CPc321lLciTb4Shy2wG0lRV5VLyiV0PYwo68M
         uM8wKB41qpFa6XBJ16T98vBB/673801iH2u52/4F6OCvWalu2zjG2YNJkNwj1VXS8ab0
         tkOhGdd5a1LGqpelifWTv8hztFc2F3BZDsHmvTb3gfaAtXYnp8F2b61AKU+I53cP1RSU
         Frt0w4GBD8HCNh6zMIVi+eiFvzzNq6wcyd5Y2xjoNNaA4bE7IeUyRbkma8phkETaWQti
         /1tRtJ/DOCJWOqU6uV7NgOdiNt0psZRk8ibFsLcj6ZrKBosYbOjcWXhET8QgteqzKvQJ
         hiQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772121241; x=1772726041;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MNZNyRP1+/BMikhGjXgBseL3jZKGuixhxpWEQaQcXKA=;
        b=ofYc5WG6yTUc5guyvNMg9iETe2370Zstmt2vBKTwb995/IMUcZUQLA/YV10yN6Yzl7
         5X3HGl7TqZeHNldKOo/y41TWrr1Y0nOKjsfQuR3GpA1dltl8Ba33WWuMr+lKnoicTTbQ
         WDy3Cj+sYmKUR9mJ7TpUbrnhsiG/frygWJdWixAchJZca1lo32TN6VreCvnG7UDZ4ovs
         qfE53nKEiV7PTBLOAnYKJsqYg9fgNc1rNcieSjhQz2ioLI0ixpCu4KRNw8xumB5zfifv
         4H6B8vzt9iSTgMcYVsLEulcG07yjFpjl2urvjGv+jZ7/y3kfl3KRPxAFHrOJgLP6JQEd
         J+hw==
X-Forwarded-Encrypted: i=1; AJvYcCUcXPQA9Y9hlyFfXrt+XBEn01Neug8MRAF7xjXLjkGcad3MLV39ChHYJUmUcwNTKTg8pMAen9qtRMo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzehgclAJYokO5E4o2LdORuAlay/N7BbKbVm4vBFpDg7K2YSFSg
	Cx0AgnyAQQOtHKkMVqLlfRbzW++MGi9C/dsNgKKcE+0bQ2gRnRI5zHPoXK38InzxKg==
X-Gm-Gg: ATEYQzxxuYvHt4sRWKq5jSesKvUDuyxwweOY34qphbjVe1zvYNRP2l7GmZFVF9kP34M
	mPc9dcSQVxICNVanYTIViJgNyIR9ba5pbyC0BZJnPSSNNR8NWZsO2y9xnxAOXSBmsaPCaEHkj/U
	Ytawt0Dr1IzAWBgiiJ/GBepJSfvkZSinKMmQ+ueR0x7C1D3u4Cpzt5aevmf4JcXcVSJ5xI5Y4JR
	Lp2G5MKwJI8oCIMVTH4COBJjfg7XwUQzotZ4vqc2PtH0vy0ZkYYqpXnc21IzMC2G07GwKK8u5qZ
	yFATN0AXsFc9sGj26fVe7AdMzk0mHEyZzadjbPXPAeB4DP0+7FjiwXLgu/9jvkEvB8bAsAsDI21
	eAKiLv/MarbyBvC84761jPg+3tyaVzkrvrIfNXETE6/K5KpAGyHDjD0kjDLQPmH3tnVPdGqQoJs
	6mVTkcCU/zGTQFlMkiyJGuqMUoemE01pd/FTkKIuzmL7tmedJPzMoqBhZ2g8LS4yYtQluo40I2J
	pzqeBOYazZZJ+s=
X-Received: by 2002:a05:6000:26c5:b0:439:8b42:9926 with SMTP id ffacd0b85a97d-4398b429b9dmr17248805f8f.12.1772121241297;
        Thu, 26 Feb 2026 07:54:01 -0800 (PST)
Message-ID: <c9126823-7c90-40bb-9fd1-c5649ffdb5cd@suse.com>
Date: Thu, 26 Feb 2026 16:53:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] x86/ioreq: Extend ioreq server to support multiple
 ioreq pages
To: Julian Vetter <julian.vetter@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260223093831.475769-1-julian.vetter@vates.tech>
 <20260223093831.475769-2-julian.vetter@vates.tech>
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
In-Reply-To: <20260223093831.475769-2-julian.vetter@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julian.vetter@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: DDA2B1A92E0
X-Rspamd-Action: no action

On 23.02.2026 10:38, Julian Vetter wrote:
> A single shared ioreq page provides PAGE_SIZE/sizeof(ioreq_t) = 128
> slots, limiting HVM guests to 128 vCPUs. To support more vCPUs, extend
> the ioreq server to use xvzalloc_array() for allocating a contiguous
> virtual array of ioreq_t slots sized to d->max_vcpus, backed by
> potentially non-contiguous physical pages.
> 
> For the GFN-mapped path (x86), page and writable type references are
> obtained directly via check_get_page_from_gfn() and get_page_type() for
> each GFN. The pages are then combined into a single contiguous VA using
> vmap(). The number of ioreq pages is computed at runtime via
> nr_ioreq_pages(d) = DIV_ROUND_UP(d->max_vcpus, IOREQS_PER_PAGE), so
> small VMs only allocate one page. All existing single-page paths
> (bufioreq, legacy clients) remain unchanged.
> 
> Mark the now-unused shared_iopage_t in the public header as deprecated.

For this I think we need to settle on one of two options: Either it was a
mistake that this was used in the hypervisor (and added to the public
interface), in which case the removal of the use may want to be separate
(without, imo, any need to mark the item deprecated in the public header,
as the property remains). Or we deem it legitimate / useful, in which case
you would want to continue using it (in struct ioreq_server).

> @@ -89,6 +91,39 @@ static gfn_t hvm_alloc_ioreq_gfn(struct ioreq_server *s)
>      return hvm_alloc_legacy_ioreq_gfn(s);
>  }
>  
> +static gfn_t hvm_alloc_ioreq_gfns(struct ioreq_server *s,
> +                                  unsigned int nr_pages)
> +{
> +    struct domain *d = s->target;
> +    unsigned long mask;
> +    unsigned int i, run;
> +
> +    if ( nr_pages == 1 )
> +        return hvm_alloc_ioreq_gfn(s);
> +
> +    /* Find nr_pages consecutive set bits */
> +    mask = d->arch.hvm.ioreq_gfn.mask;
> +
> +    for ( i = 0, run = 0; i < BITS_PER_LONG; i++ )
> +    {
> +        if ( !test_bit(i, &mask) )
> +            run = 0;
> +        else if ( ++run == nr_pages )
> +        {
> +            /* Found a run - clear all bits and return base GFN */
> +            unsigned int start = i - nr_pages + 1;
> +            unsigned int j;
> +
> +            for ( j = start; j <= i; j++ )
> +                clear_bit(j, &d->arch.hvm.ioreq_gfn.mask);

You using clear_bit() here doesn't make the while operation atomic. There will
need to be synchronization (also with hvm_alloc_ioreq_gfn()), and once that's
there (or if things are suitably synchronized already) __clear_bit() ought to
suffice here.

> +            return _gfn(d->arch.hvm.ioreq_gfn.base + start);
> +        }
> +    }
> +
> +    return INVALID_GFN;
> +}

Did you consider whether fragmentation could get in the way here, as is usually
the case when doing mixed-size allocations from a single pool? In how far is it
necessary for the GFNs used to be consecutive?

> @@ -134,16 +181,41 @@ static void hvm_unmap_ioreq_gfn(struct ioreq_server *s, bool buf)
>  
>          hvm_free_ioreq_gfn(s, iorp->gfn);
>          iorp->gfn = INVALID_GFN;
> +        return;
>      }
> +
> +    if ( gfn_eq(s->ioreq_gfn, INVALID_GFN) )
> +        return;
> +
> +    nr_pages = nr_ioreq_pages(s->target);
> +
> +    for ( i = 0; i < nr_pages; i++ )
> +    {
> +        struct page_info *pg = vmap_to_page((char *)s->ioreq +

Please can you preferably cast to const void * (or void *)? But perhaps you
would better latch the pointer into a local variable anyway, for ...

> +                                            i * PAGE_SIZE);
> +
> +        put_page_and_type(pg);
> +        put_page(pg);

> +    }
> +    vunmap(s->ioreq);
> +    s->ioreq = NULL;

... this clearing to move up ahead of any teardown done.

> +    hvm_free_ioreq_gfns(s, s->ioreq_gfn, nr_pages);
> +    s->ioreq_gfn = INVALID_GFN;

This similarly may want moving up.

As to the loop body, destroy_ring_for_helper() has put_page_and_type(), but
no put_page(). Why is this different here?

> @@ -173,30 +245,132 @@ static int hvm_map_ioreq_gfn(struct ioreq_server *s, bool buf)
>  
>          return rc;
>      }
> +
> +    /* ioreq: multi-page with contiguous VA */
> +    if ( s->ioreq )
> +    {
> +        if ( gfn_eq(s->ioreq_gfn, INVALID_GFN) )
> +            return -EPERM;

The comment on the other path at least wants referencing here.

> +        return 0;
> +    }
> +
> +    if ( d->is_dying )
> +        return -EINVAL;
> +
> +    nr_pages = nr_ioreq_pages(d);
> +    base_gfn = hvm_alloc_ioreq_gfns(s, nr_pages);
> +
> +    if ( gfn_eq(base_gfn, INVALID_GFN) )
> +        return -ENOMEM;
> +
> +    mfns = xmalloc_array(mfn_t, nr_pages);

Especially when there are only a few MFNs, this dynamic allocation would be
nice to avoid. If there was a not overly larger upper bound, using a per-CPU
array might also be an option.

If the dynamic allocation stays, new code wants to use xvmalloc() and
friends.

> +    if ( !mfns )
> +    {
> +        hvm_free_ioreq_gfns(s, base_gfn, nr_pages);
> +        return -ENOMEM;
> +    }
> +
> +    /*
> +     * Obtain a page reference and writable type reference for each GFN.
> +     * No per-page VA is needed; all pages are mapped as a single contiguous
> +     * VA via vmap() below.
> +     */

I think this comment wants to mention prepare_ring_for_helper(), so that if
updates are done there, there's at least a fair chance that people might spot
that changes need doing here as well.

> +    for ( i = 0; i < nr_pages; i++ )
> +    {
> +        struct page_info *pg;
> +        p2m_type_t p2mt;
> +
> +        rc = check_get_page_from_gfn(d, _gfn(gfn_x(base_gfn) + i),

gfn_add() please

> +                                     false, &p2mt, &pg);
> +        if ( rc )
> +        {
> +            if ( rc == -EAGAIN )
> +                rc = -ENOENT;
> +            goto fail;
> +        }
> +
> +        if ( !get_page_type(pg, PGT_writable_page) )
> +        {
> +            put_page(pg);
> +            rc = -EINVAL;
> +            goto fail;
> +        }
> +
> +        mfns[i] = page_to_mfn(pg);
> +    }
> +
> +    /* Map all mfns as single contiguous VA */
> +    s->ioreq = vmap(mfns, nr_pages);
> +    if ( !s->ioreq )
> +    {
> +        rc = -ENOMEM;
> +        goto fail;
> +    }
> +
> +    s->ioreq_gfn = base_gfn;
> +    xfree(mfns);
> +
> +    return 0;
> +
> + fail:
> +    while ( i-- > 0 )
> +    {
> +        struct page_info *pg = mfn_to_page(mfns[i]);
> +
> +        put_page_and_type(pg);
> +        put_page(pg);

Same issue here - I can't spot which page reference you're dropping. You
obtained only one above.

> @@ -208,6 +382,32 @@ static int hvm_add_ioreq_gfn(struct ioreq_server *s, bool buf)
>  
>          return rc;
>      }
> +
> +    if ( gfn_eq(s->ioreq_gfn, INVALID_GFN) )
> +        return 0;
> +
> +    nr_pages = nr_ioreq_pages(d);
> +    memset(s->ioreq, 0, nr_pages * PAGE_SIZE);
> +
> +    for ( i = 0; i < nr_pages; i++ )
> +    {
> +        gfn_t gfn = gfn_add(s->ioreq_gfn, i);
> +        struct page_info *pg = vmap_to_page((char *)s->ioreq +
> +                                            i * PAGE_SIZE);
> +
> +        rc = p2m_add_page(d, gfn, page_to_mfn(pg), 0, p2m_ram_rw);
> +        if ( rc )
> +            /*
> +             * No rollback of previously added pages: The caller
> +             * (arch_ioreq_server_disable) has no error handling path,
> +             * and partial failure here will be cleaned up when the
> +             * ioreq server is eventually destroyed.
> +             */
> +            return rc;

Shouldn't you continue the loop, to try to add back as many pages as
you can, so the domain encountering problems later is as unlikely as
possible (albeit a single missing page is already bad enough)?

> @@ -260,9 +259,32 @@ bool vcpu_ioreq_handle_completion(struct vcpu *v)
>  
>  static int ioreq_server_alloc_mfn(struct ioreq_server *s, bool buf)
>  {
> -    struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
> +    struct ioreq_page *iorp;
>      struct page_info *page;
>  
> +    if ( !buf )
> +    {
> +        if ( s->ioreq )
> +        {
> +            /*
> +             * If a guest frame has already been mapped (which may happen
> +             * on demand if ioreq_server_get_info() is called), then
> +             * allocating a page is not permitted.
> +             */
> +            if ( !gfn_eq(s->ioreq_gfn, INVALID_GFN) )
> +                return -EPERM;
> +
> +            return 0;
> +        }
> +
> +        s->ioreq = xvzalloc_array(ioreq_t, s->target->max_vcpus);
> +
> +        return s->ioreq ? 0 : -ENOMEM;

At this point you haven't fulfilled what the function is supposed to be
doing. The pages you allocate also aren't associated with the domain,
and you haven't obtained writable references.

> @@ -812,26 +861,30 @@ int ioreq_server_get_frame(struct domain *d, ioservid_t id,
>      if ( rc )
>          goto out;
>  
> -    switch ( idx )
> +    if ( idx == XENMEM_resource_ioreq_server_frame_bufioreq)
>      {
> -    case XENMEM_resource_ioreq_server_frame_bufioreq:
>          rc = -ENOENT;
>          if ( !HANDLE_BUFIOREQ(s) )
>              goto out;
>  
>          *mfn = page_to_mfn(s->bufioreq.page);
>          rc = 0;
> -        break;
> -
> -    case XENMEM_resource_ioreq_server_frame_ioreq(0):
> -        *mfn = page_to_mfn(s->ioreq.page);
> -        rc = 0;
> -        break;
> +    }
> +    else if (( idx >= XENMEM_resource_ioreq_server_frame_ioreq(0) ) &&
> +             ( idx < XENMEM_resource_ioreq_server_frame_ioreq(nr_ioreq_pages(d)) ))
> +    {
> +        unsigned int page_idx = idx - XENMEM_resource_ioreq_server_frame_ioreq(0);
>  
> -    default:
>          rc = -EINVAL;
> -        break;
> +        if ( idx >= XENMEM_resource_ioreq_server_frame_ioreq(0) &&

You checked this above already, didn't you?

> +             page_idx < nr_ioreq_pages(d) && s->ioreq )

The former part of this check also looks redundant with the earlier one.

> --- a/xen/include/xen/ioreq.h
> +++ b/xen/include/xen/ioreq.h
> @@ -19,9 +19,19 @@
>  #ifndef __XEN_IOREQ_H__
>  #define __XEN_IOREQ_H__
>  
> +#include <xen/macros.h>
>  #include <xen/sched.h>
>  
>  #include <public/hvm/dm_op.h>
> +#include <public/hvm/ioreq.h>
> +
> +/* 4096 / 32 = 128 ioreq slots per page */
> +#define IOREQS_PER_PAGE  (PAGE_SIZE / sizeof(ioreq_t))

I think the comment wants dropping, as it would end up wrong / useless for
page size different from 4k. I'm also not quite sure the #define is overly
useful, as ...

> +static inline unsigned int nr_ioreq_pages(const struct domain *d)
> +{
> +    return DIV_ROUND_UP(d->max_vcpus, IOREQS_PER_PAGE);

... this is its only use.

Jan

