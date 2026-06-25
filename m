Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hSf+CLgtPWoiyggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 15:31:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 359EC6C6250
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 15:31:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=YHwFvWbv;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1345633.1604446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wckAU-0004Wn-Ed; Thu, 25 Jun 2026 13:30:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345633.1604446; Thu, 25 Jun 2026 13:30:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wckAU-0004U9-Bk; Thu, 25 Jun 2026 13:30:58 +0000
Received: by outflank-mailman (input) for mailman id 1345633;
 Thu, 25 Jun 2026 13:30:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wckAT-0004U3-8C
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 13:30:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wckAS-003wvN-Kh
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 15:30:56 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3d2d8a-2eae-0a2a0a5409dd-0a2a4503c326-22
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 15:30:56 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3d2d8f-ec1a-0a2a45030019-d1558036d95a-3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 15:30:56 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-490b3637b90so15061535e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 06:30:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49264082426sm77120365e9.9.2026.06.25.06.30.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jun 2026 06:30:54 -0700 (PDT)
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
        d=suse.com; s=google; t=1782394255; x=1782999055; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=70o//AS/ueYIBHfWCHjMu1YWzzj9a1OdpJnyPS470L4=;
        b=YHwFvWbvxCQFN5qavULP+zcQeNzkeIJXySnASmkVdtzJeULBbk/VFMhdCT2ZVhwHpy
         0ZC1H1zBEcPEjK4Q61IZHNsEkGeUT3Ue8ZJjCbE3nFnAcmKkTdfkHP+oJqc2Ffu9tPoU
         nkjfsz5ziOvzVS+9PDV9zsZQ+tenu2Q+zEqF53p13f5WfBgCPYIwIkgGRCugRigiSs1d
         40QZQ5aT66DYE036KrQ7LaYZMV6tug3h/rMt8aqbw8A92u8GSefG8bmi52j/mG+2JEqd
         N22F2mvrp5E5VrenO4M7soiI8TjLAPbhn4wiIj29mhmaSb1A4uKCwmlU1EF+NMP8m/gR
         +pOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782394255; x=1782999055;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=70o//AS/ueYIBHfWCHjMu1YWzzj9a1OdpJnyPS470L4=;
        b=I2O9fzJU6eU+lArFKsW8x2+ACUlx8aTbeU7Xo2fASF+NJE2WZ5IiLYiDP26HB4hYv4
         pXhLFv8wtqaz3P7JA3hrb88g9ayt9r/B+93hbKcQhnw/1QYFVYhmozD7iF1m9Dmlx6/k
         DQlTp5S1EhN8qtZYvDj1CTdv93UdvrHN2UFVB3RqKw1a/NJGh7iLlmgVBsP+jICNuf1n
         IR/bkq+zxTyG/l3TACLbLH8HNZPof8+S+5xzfnxyrnruiueHpdWg2oLGSD0Sz42IwGen
         iCr1z5G/qA8wl9kIYyO1CHlosTfWY79VxgrUXMpjogUJq8vslXYDiYYcUghli+ySkIOB
         H/Eg==
X-Forwarded-Encrypted: i=1; AFNElJ8XPIjkWD2WCNfGzvOaYUttgRBnC06CWmLMvK69C8YhRy7q0g+ZaSTWJKLTKJNGnsK1uIEvbl4O6bo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywk5CM80fbhxlZSB9v9G9h45lV65EX11cOD4xY6gUlZOvUR2LMg
	1npvV6hq01yKtppkohmQweisC2JV0OqQ7hYLg9L3XpS41RdkpPhJU+oZF74hko5GCA==
X-Gm-Gg: AfdE7cmAXiA1ot8QBFIYeaKmjtCwyQfLCfmMuz2bpkQySPqhtzjD/c8h1YwQ2rIZhub
	7v5/NjCNPBGxVayfAJXXPJikyGGET1GqCbrGUpu99t2uAYQU0oyZ49gRLG5yeBkIXa4qtpx5e9U
	MlsLdHZLoFIGMroxosWqGD/vo8VP69vZLWPBA45Sb/hvM+Y8OmebwH85i4biVi/HiPd9w31Hwo5
	PiIBwQ1S5AsZFXllG2/KhEbTYkPI0MZaq2TZQMv7M1JGMWRoBevB/giBD/BntaA/bJWRep0zRJG
	FcCaoSGfYQmuwxl9eDzjfdt72+QQGm4ApvndOr/hJqpQCs8YEIvJP498n/EM4v1RvcvnSWZEqSH
	s5j4irrtaLDh7t1kfFehFDC0E5m3XRyZedu47bd2Ih4N6/AGyb1q1A8DOpt8HmKOSy6xs+eJATW
	x2Kg6EHa9dRmo5qiIoQ5ZplfPuSEvOjAWF8JSTNWZW/6b04g06L+ytJ29Dg/m3XqjSCNfaExyAD
	sWG
X-Received: by 2002:a05:600c:6b70:b0:490:b06a:649e with SMTP id 5b1f17b1804b1-49266893253mr23158155e9.25.1782394255316;
        Thu, 25 Jun 2026 06:30:55 -0700 (PDT)
Message-ID: <28707464-ecd0-40a5-96e2-0afd3d33f34d@suse.com>
Date: Thu, 25 Jun 2026 15:30:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] xen/mm: Introduce NUMA-aware memory claim sets
To: Bernhard Kaindl <bernhard.kaindl@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <cover.1778272036.git.bernhard.kaindl@citrix.com>
 <ddcc692d642aaf6dec84dcdb17ebaf2b8c09c7b0.1778272036.git.bernhard.kaindl@citrix.com>
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
In-Reply-To: <ddcc692d642aaf6dec84dcdb17ebaf2b8c09c7b0.1778272036.git.bernhard.kaindl@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1782394256-B61315D1-B4E21B97/0/0
X-purgate-type: clean
X-purgate-size: 9202
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bernhard.kaindl@citrix.com,m:anthony.perard@vates.tech,m:jgross@suse.com,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 359EC6C6250

On 08.05.2026 22:27, Bernhard Kaindl wrote:
> This commit extends Xen's memory claim design to support installing claim
> sets spanning multiple NUMA nodes atomically. As Roger Pau Monné suggested:
> 
>   Ideally, we would need to introduce a new hypercall that allows
>   making claims from multiple nodes in a single locked region, as to
>   ensure success or failure in an atomic way.
> 
> A claim set can contain multiple node-specific claims and a host-wide
> claim for memory that may come from any NUMA node. The new domctl
> installs the full claim set atomically, and the allocator is updated
> so that claim checks and claim consumption follow the new semantics.
> 
> This adds:
> 
> 1. installing multi-node claim sets atomically,
> 2. protecting claimed pages from other claim requests and allocations, and
> 3. redeeming held claims when satisfying allocations.
> 
> Legacy XENMEM_claim_pages behaviour is preserved; the interface is
> deprecated and superseded by XEN_DOMCTL_claim_memory.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
> 
> ---
> The v7 design document submitted ahead of this series may help with review.
> It explains the background, design rationale, and implementation details.
> 
> Rendered version: https://xen.kaindl.dev/claims-v7-design/designs/claims
> 
> Many thanks to everyone who contributed to the earlier work and review:
> especially Roger Pau Monné, Alejandro Vallejo, Jan Beulich, Andrew Cooper,
> Marcus Granado, and Edwin Török.
> 
> Thanks,
> Bernhard
> ---
>  tools/include/xenctrl.h             |  11 +
>  tools/libs/ctrl/xc_domain.c         |  28 ++
>  xen/common/domain.c                 |   5 +-
>  xen/common/domctl.c                 |  57 ++++
>  xen/common/memory.c                 |   5 +-
>  xen/common/page_alloc.c             | 410 +++++++++++++++++++++++-----
>  xen/include/public/domctl.h         |  38 +++
>  xen/include/public/memory.h         |   2 +
>  xen/include/xen/mm.h                |   6 +-
>  xen/include/xen/sched.h             |   4 +
>  xen/xsm/flask/hooks.c               |   1 +
>  xen/xsm/flask/policy/access_vectors |   1 +
>  12 files changed, 493 insertions(+), 75 deletions(-)

And there's no way to split this some? I'll only do some light review for now.

> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -1319,7 +1319,10 @@ int domain_kill(struct domain *d)
>          rspin_barrier(&d->domain_lock);
>          argo_destroy(d);
>          vnuma_destroy(d->vnuma);
> -        domain_set_outstanding_pages(d, 0);
> +        /* Release all outstanding claims of the domain. */
> +        domain_set_claim_entries(d, 1, &(xen_memory_claim_t){
> +            .target = XEN_DOMCTL_CLAIM_MEMORY_HOST, .pages = 0,
> +        });

This is pretty badly formatted. Maybe

        domain_set_claim_entries(
            d, 1,
            &(xen_memory_claim_t){
                .target = XEN_DOMCTL_CLAIM_MEMORY_HOST, .pages = 0,
            });

? (Applies elsewhere as well, obviously.)

Whether the .pages field needs explicitly mentioning is questionable.

> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -51,6 +51,57 @@ static int xenctl_bitmap_to_nodemask(nodemask_t *nodemask,
>                                     MAX_NUMNODES);
>  }
>  
> +/* Set or get memory claims for a domain. */
> +static int claim_memory(struct domain *d,
> +                        struct xen_domctl_claim_memory *uinfo, bool *copyback)
> +{
> +    xen_memory_claim_t *entries;
> +    int rc = -EFAULT;
> +
> +    /* Reject LLC coloring; alloc_color_heap_page() does not handle claims. */
> +    if ( llc_coloring_enabled )
> +        return -EOPNOTSUPP;
> +
> +    switch ( uinfo->mode )
> +    {
> +    case XEN_DOMCTL_CLAIM_MEMORY_SET:
> +        if ( !uinfo->nr_entries )
> +            return -EINVAL;
> +        if ( uinfo->nr_entries > MAX_NUMNODES + 1 )

Why's MAX_NUMNODES and MAX_NUMNODES + 1 as an input permitted?

> +            return -E2BIG;
> +        break;
> +    case XEN_DOMCTL_CLAIM_MEMORY_GET:
> +        if ( uinfo->nr_entries > MAX_NUMNODES + 1 )
> +            uinfo->nr_entries = MAX_NUMNODES + 1;
> +        break;
> +    default:
> +        return -EOPNOTSUPP;
> +    }

Here and elsewhere - blank lines please between non-fall-through case blocks.

> +    if ( d->is_dying )
> +        return -ESRCH;
> +
> +    entries = xmalloc_array(xen_memory_claim_t, uinfo->nr_entries);

Better xzalloc_array() (really xvzalloc_array()) seeing ...

> +    if ( entries == NULL )
> +        return -ENOMEM;
> +
> +    switch ( uinfo->mode )
> +    {
> +    case XEN_DOMCTL_CLAIM_MEMORY_SET:
> +        if ( !copy_from_guest(entries, uinfo->claim_set, uinfo->nr_entries) )
> +            rc = domain_set_claim_entries(d, uinfo->nr_entries, entries);
> +        break;
> +    case XEN_DOMCTL_CLAIM_MEMORY_GET:
> +        rc = domain_get_claim_entries(d, &uinfo->nr_entries, entries);
> +        *copyback = true;
> +        if ( !rc && copy_to_guest(uinfo->claim_set, entries,
> +                                  uinfo->nr_entries) )

... this copy-out.

> +            rc = -EFAULT;
> +        break;
> +    }

Missing default:.

> @@ -865,6 +916,12 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>              copyback = true;
>          break;
>  
> +    case XEN_DOMCTL_claim_memory:
> +        ret = xsm_claim_pages(XSM_PRIV, d);

This and the xsm/flask/hooks.c change will need reworking, to fit the spirit
of XSA-492.

> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -1276,6 +1276,42 @@ struct xen_domctl_get_domain_state {
>      uint64_t unique_id;      /* Unique domain identifier. */
>  };
>  
> +struct xen_memory_claim {
> +    uint64_aligned_t pages; /* Number of pages to claim. */
> +    uint32_t target;        /* NUMA node or special target constant. */
> +    uint32_t cmd;           /* Reserved, must be zero. */

Why is this named "cmd" when it's reserved?

> +};
> +typedef struct xen_memory_claim xen_memory_claim_t;
> +DEFINE_XEN_GUEST_HANDLE(xen_memory_claim_t);
> +
> +/* Special claim targets for the target field of xen_memory_claim_t. */
> +#define XEN_DOMCTL_CLAIM_MEMORY_HOST     0x80000000U /* Host-wide claims. */
> +#define XEN_DOMCTL_CLAIM_MEMORY_LEGACY   0x40000000U /* Legacy semantics. */

I think the latter should be internal to Xen, and in particular not be
permitted with this new domctl.

> +/*
> + * XEN_DOMCTL_claim_memory
> + *
> + * Install or query a domain memory claim set. A SET operation replaces the
> + * existing claim set atomically. Claims are redeemed by later allocations to
> + * the domain. A SET request whose entries all have pages == 0 releases any
> + * existing claims.
> + *
> + * For GET, callers may pass nr_entries == 0 and claim_set == NULL to query the
> + * number of records needed. Xen returns -ERANGE and updates nr_entries. If the
> + * supplied array is too small, Xen returns -ERANGE and updates nr_entries
> + * without copying partial records.
> + */
> +struct xen_domctl_claim_memory {
> +    /* IN/OUT: Array of struct xen_memory_claim. */
> +    XEN_GUEST_HANDLE_64(xen_memory_claim_t) claim_set;
> +    /* IN/OUT: Number of records in the claim_set array. */
> +    uint32_t nr_entries;

What is IN and what is OUT looks to differ between GET and SET.

> +    /* IN: Operation to perform on the claim set (GET or SET). */
> +    uint32_t mode;
> +#define XEN_DOMCTL_CLAIM_MEMORY_SET 0U /* Set the claim set for the domain. */
> +#define XEN_DOMCTL_CLAIM_MEMORY_GET 1U /* Get the claim set of the domain. */
> +};

And there's no way to fetch overall claims?

> @@ -131,7 +132,10 @@ int populate_pt_range(unsigned long virt, unsigned long nr_mfns);
>  /* Claim handling */
>  unsigned long __must_check domain_adjust_tot_pages(struct domain *d,
>      long pages);
> -int domain_set_outstanding_pages(struct domain *d, unsigned long pages);
> +int domain_set_claim_entries(struct domain *d, uint32_t nr_entries,
> +                             const struct xen_memory_claim *claim_set);
> +int domain_get_claim_entries(struct domain *d, uint32_t *nr_entries,
> +                             struct xen_memory_claim *claim_set);

Please see ./CODING_STYLE as to the use of fixed-width types. In the latter
case I can see justification, but in the former I can't.

> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -419,6 +419,10 @@ struct domain
>      unsigned int     xenheap_pages;     /* pages allocated from Xen heap */
>      /* Pages claimed but not possessed, protected by global heap_lock. */
>      unsigned int     outstanding_pages;
> +    unsigned int     node_claims;       /* Sum of per-node claims. */
> +    /* Domain objects use dedicated pages, leaving room for per-node claims. */
> +    unsigned int     claims[MAX_NUMNODES]; /* Per-NUMA-node claims. */

Potentially too big an array to embed directly here.

Jan

