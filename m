Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOSGDbdpqWlN6wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 12:32:07 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA7D2109A1
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 12:32:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1246468.1545637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy6v5-0001sg-Ta; Thu, 05 Mar 2026 11:31:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1246468.1545637; Thu, 05 Mar 2026 11:31:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy6v5-0001qD-Qq; Thu, 05 Mar 2026 11:31:07 +0000
Received: by outflank-mailman (input) for mailman id 1246468;
 Thu, 05 Mar 2026 11:31:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vy6v4-0001q7-BP
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 11:31:06 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cba7f88b-1886-11f1-b164-2bf370ae4941;
 Thu, 05 Mar 2026 12:31:04 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-439afc58ac7so4942997f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Mar 2026 03:31:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439b4e771basm36774706f8f.0.2026.03.05.03.31.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2026 03:31:03 -0800 (PST)
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
X-Inumbo-ID: cba7f88b-1886-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772710264; x=1773315064; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TZ+NLsEYwzCJxX04okPUm0W0QsmwdELejdWtO4TODvY=;
        b=XHhNBf+iqR+dSl/FCv0TmJUCHGH9ikPxaUYanU8lWDlxR0Bn67rGtwRefdOTihw+sc
         FjmTWfDR2HAreGfSn/D+Wh/tbEvABrbNS4iqmffRiq3uXdnHzO/dOolDC5yGuz701UKh
         ZLIqodgzUaHi3wbGdpcu/4fp5bfV+tgEkk1Jf85IXtXeI/PXR7G0N2LLwXZznZyzJZDH
         1fyRIWHHWo5/nIRgxxLOJbYO1qzvKJeFFfd6XkgM9plpk6pzPH+yJ7HFhqEZzduynOUV
         JAaNHr1n0CIZfdMrovnFUtuwnEmeUwvfIK6IxkCLV8XVqP1W1tdS9ik9ARHRDGkqrBc8
         j97g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772710264; x=1773315064;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZ+NLsEYwzCJxX04okPUm0W0QsmwdELejdWtO4TODvY=;
        b=gXPUu0vZTDcUUhm0vLFRmHuIi3AHSWkwZwSAPlS/hmHtrXY4HktR3QXSQni9yuTHPl
         apPTfe9SDzHY+b+OdLfCcTThQwUv83MP7jcGxNBd2oTh4YHJZRk3lR2L6kleou1wRhIt
         yrStrfskKFWO6IT6rQ997P4LL5Sv5w4Hv6Im6+ERTK6lHO0nkSkExX2E7GetzCfjPB1W
         3sTaWVEcVSA6aWyCPUy7bNLLhWp9/LCVCzOw3OC6TEstxWsec+1b2zeCK6xavKTC6k1E
         zJngk6pTaIpUYaYy1PDAwdXKWcMrQ7Q5B3ug6TNcMvlStZtmviMKkIhqNf7h/KIA6VyH
         /RpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJhh/5AcJwedbibVVaYoAmVD3Eff/drxsTtxzyY0BDa6dxrI+goaM0bHXjYwEsa3TFenqr/FFZBOU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyc0n+2sX3WYgqsGay23ktw8faF9o7qEjVHV9gbaRWBtjnqCVn1
	wSk7jw4aja46Nacu2uyRt628j5DmeqMxE58407jybbfg58aOZUcevQB9N2X0IKO+4w==
X-Gm-Gg: ATEYQzy/FlcVpiDuBmYB86AyNzoCFY91oD60wtJrfEcmo2WiiazQlVX2rRvYKg1Dbc9
	qFDcdNCQYvTiFQl8GFgj7WZ4q/0MIBOEPPDH8wi6hZqgd3h7gLss8g4MUvYgE3o2O8eYi4noNGi
	AoGkTYSJL2SoC99zUXSAE5K+5CL1rUPM2/ypBH79XxbJkxAKZ9N8EiFsn/tmcfDjzKhLwn9IqLO
	GjX9bGHXxCpfXScVkRYvx9F6cRcbwRWrxWyiXxxMhgH2VADSzqLydfDadlSzo2p29Qmxa74ewL+
	LLfEhaTpPFFDJmh7a9Og5cIQz+eENZcr3Wz81VhAnL0myjGiCTH+KQKb4HRu9iYHprLtS2umMuP
	1l3KxBiJ4VLfWqscjfHCA8mj7xr0RPSIvBaTJMruMTtnqWzpDFyO6Isc9uD5i/HjVxRUeWzJ75f
	uKJ8R5zW82ovS/WR+glURPOa5HYgn3hhXTzn+Nqq9ZsPli0y9fRJVScoHfzqUuPK54DJeWDD5IR
	Xxj13j7b/PFttZkjPnCRn87fg==
X-Received: by 2002:a05:6000:26c1:b0:439:b7c9:2ef1 with SMTP id ffacd0b85a97d-439c7fafb66mr9551409f8f.20.1772710263950;
        Thu, 05 Mar 2026 03:31:03 -0800 (PST)
Message-ID: <7d439bb1-7381-4fa4-af79-423e8c7fafb1@suse.com>
Date: Thu, 5 Mar 2026 12:31:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/10] xen/domain: Add DOMCTL handler for claiming
 memory with NUMA awareness
To: Bernhard Kaindl <bernhard.kaindl@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <cover.1772098423.git.bernhard.kaindl@citrix.com>
 <b2c94f0c3b41976b2691ce15b9f9a2589370e65a.1772098423.git.bernhard.kaindl@citrix.com>
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
In-Reply-To: <b2c94f0c3b41976b2691ce15b9f9a2589370e65a.1772098423.git.bernhard.kaindl@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 8EA7D2109A1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bernhard.kaindl@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 26.02.2026 15:29, Bernhard Kaindl wrote:
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -268,6 +268,35 @@ int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,
>      return rc;
>  }
>  
> +/* Claim memory for a domain or reset the claim */
> +int claim_memory(struct domain *d, const struct xen_domctl_claim_memory *uinfo)

static in domctl.c? Otherwise with Penny's work to make domctl optional this
would be unreachable code.

> +{
> +    memory_claim_t claim;
> +
> +    /* alloc_color_heap_page() does not handle claims, so reject LLC coloring */
> +    if ( llc_coloring_enabled )
> +        return -EOPNOTSUPP;
> +    /*
> +     * We only support single claims at the moment, and if the domain is
> +     * dying (d->is_dying is set), its claims have already been released
> +     */
> +    if ( uinfo->pad || uinfo->nr_claims != 1 || d->is_dying )
> +        return -EINVAL;

As already alluded to in reply to patch 03, I can't help the impression that
usage of this sub-op with multiple entries would we quite different (i.e. it
would be not only the implementation in Xen that changes). I'm therefore
pretty uncertain whether taking it with this restriction is going to make
much sense.

> +    if ( copy_from_guest(&claim, uinfo->claims, 1) )
> +        return -EFAULT;
> +
> +    if ( claim.pad )
> +        return -EINVAL;
> +
> +    /* Convert the API tag for a host-wide claim to the NUMA_NO_NODE constant */
> +    if ( claim.node == XEN_DOMCTL_CLAIM_MEMORY_NO_NODE )
> +        claim.node = NUMA_NO_NODE;

What about the incoming claim.node being NUMA_NO_NODE? Imo the range checking
the previous patch adds to domain_set_outstanding_pages() wants to move here,
at which point the function's new parameter could be properly nodeid_t.

> +    /* NB. domain_set_outstanding_pages() has the checks to validate its args */
> +    return domain_set_outstanding_pages(d, claim.pages, claim.node);
> +}

There's no copying back of the result. When this is extended to allow more
than one entry, what's the plan towards dealing with partial success? Needing
to roll back may be unwieldy.

> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -1276,6 +1276,42 @@ struct xen_domctl_get_domain_state {
>      uint64_t unique_id;      /* Unique domain identifier. */
>  };
>  
> +/*
> + * XEN_DOMCTL_claim_memory
> + *
> + * Claim memory for a guest domain. The claimed memory is converted into actual
> + * memory pages by allocating it. Except for the option to pass claims for
> + * multiple NUMA nodes, the semantics are based on host-wide claims as
> + * provided by XENMEM_claim_pages, and are identical for host-wide claims.
> + *
> + * The initial implementation supports a claim for the host or a NUMA node, but
> + * using an array, the API is designed to be extensible to support more claims.
> + */
> +struct xen_memory_claim {
> +    uint64_aligned_t pages;   /* Amount of pages to be allotted to the domain */
> +    uint32_t node;  /* NUMA node, or XEN_DOMCTL_CLAIM_MEMORY_NO_NODE for host */
> +    uint32_t pad;                 /* padding for alignment, set to 0 on input */

This isn't for alignment; it's there to make the padding explicit.

> +};
> +typedef struct xen_memory_claim memory_claim_t;
> +#define XEN_DOMCTL_CLAIM_MEMORY_NO_NODE    0xFFFFFFFF  /* No node: host claim */

Misra demands a U suffix here.

"host claim" (in the comment) also is ambiguous. Per-node claims also affect
the host. Maybe "host wide" or "global"?

> +/* Use XEN_NODE_CLAIM_INIT to initialize a memory_claim_t structure */
> +#define XEN_NODE_CLAIM_INIT(_pages, _node) { \
> +    .pages = (_pages),                  \
> +    .node = (_node),                    \
> +    .pad = 0                            \
> +}

While only a macro, it's still not C89, and hence may wants offering only as
an extension. Also .pad doesn't need explicitly specifying, does it? If you
provide such a macro, identifiers used also need to strictly conform to the
C spec (IOW leading underscores aren't permitted).

> +DEFINE_XEN_GUEST_HANDLE(memory_claim_t);

This wants to move up next to the typedef.

> +struct xen_domctl_claim_memory {
> +    /* IN: array of struct xen_memory_claim */
> +    XEN_GUEST_HANDLE_64(memory_claim_t) claims;
> +    /* IN: number of claims in the claims array handle. See the claims field. */
> +    uint32_t nr_claims;

Is repeating the word "claim" necessary / useful here?

> +#define XEN_DOMCTL_MAX_CLAIMS UINT8_MAX /* More claims require changes in Xen */
> +    uint32_t pad;                       /* padding for alignment, set it to 0 */

Same comment as on the other pad field.

> @@ -1368,6 +1404,7 @@ struct xen_domctl {
>  #define XEN_DOMCTL_gsi_permission                88
>  #define XEN_DOMCTL_set_llc_colors                89
>  #define XEN_DOMCTL_get_domain_state              90 /* stable interface */
> +#define XEN_DOMCTL_claim_memory                  91

Seeing the adjacent comment, did you consider making this new sub-op a stable one
as well?

Jan

