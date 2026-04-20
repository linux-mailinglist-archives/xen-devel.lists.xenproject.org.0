Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MuVLk7i5WnfowEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 10:22:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E65428175
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 10:22:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1285499.1566508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEjtV-0007EJ-Gz; Mon, 20 Apr 2026 08:22:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1285499.1566508; Mon, 20 Apr 2026 08:22:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEjtV-0007Bi-EM; Mon, 20 Apr 2026 08:22:13 +0000
Received: by outflank-mailman (input) for mailman id 1285499;
 Mon, 20 Apr 2026 08:22:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wEjtU-0007Bc-36
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 08:22:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEjtT-009ubX-G0
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 10:22:11 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e5e230-e002-0a2a0a5209dd-0a2a45019e0c-20
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 10:22:11 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e5e233-c1f2-0a2a45010019-d155802fe5ac-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 10:22:11 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso26705885e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 01:22:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e4d6casm25576821f8f.32.2026.04.20.01.22.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2026 01:22:10 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776673331; x=1777278131; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=c2iK3XQ83lX4GmyPOCBsLmeGDadhSHHxA+sAAHUVHqQ=;
        b=aWgELGGDi1CrtNiOjgZwzQ5qbGrCU6XXFAs4jlqD+Wa6KxewbwfJWHt8DOKW6aN0g1
         ZOKZczS7OjFa023EuBsO7ne/B4KgXspUqVYp5ixVoQXC51QtY0T2C49yY5D7p4uQQGDj
         TjVAm7DY79YW15cGLE72woJqqTrmcmJLziGVQ56orlftNQxdAe76aj1NglmJ8SyMfe0c
         3sbmcTqWAf0QE85Lrr42Ucdsw5VvjK0X4izFaIbMYrgX6gRyhRT8Hc+lpRE1QMypc6RO
         Ze0NW3CudVZ8fwrbWr2lKufJzbYJrrBk8I5fy8NwDBVvGW37f0n33mfQtTFUd7pqBxCs
         cPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776673331; x=1777278131;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c2iK3XQ83lX4GmyPOCBsLmeGDadhSHHxA+sAAHUVHqQ=;
        b=j8kCN2uY4j5RP4NNWN9DF1NpxEhQNeVv4kdvjBNqLwUxKTiLXQMomln2q+i3cI44O1
         xe5ekQYWHSxZMZgB1GVEph5392OCH/WrIv/yhXiO2v/WZW6Z6AVMr3Fl+INfEmjLYBcA
         RgJHH5V5/xzpCGFDm2/Ew7DT8MIFG4+x5/dmna6RdaXl02ZMjZMnbpjp6VGhEVekN5HU
         oudF8UejGRcG5fQ9/aRoDGoPq0bRa+ffwS/sGoV3Hf9ARsWF8Rce/UFJouYUqBVS7k1V
         LyFP38uQ2iC2CfoGL1nERYBCmq24qRjd3c05fjUb7oKtNG3jM0eDXNdFeBLqhyPujYj2
         kghw==
X-Forwarded-Encrypted: i=1; AFNElJ9dycGzWkEeCU4nWgUSam8sW8u1fgqIyZKTVemNEP0FQti2vLbW59P7EikwLsx1l6cz0FuY6LsjiuE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzUaeNwwS01OMmkOSled3/NVMl+DOHbp499CMDcQxXIOlo+4KPm
	hALM0G33Icq8JIOccQyHMbO/c6FWySC7Q7Ez3QQx5mTxzQNmh6HJ5x1/yIzUpPAYMA==
X-Gm-Gg: AeBDievH85Rpnsl2bPWjrZkzPGH/fX+/f5dSkuJrYMbdwnhFFndhupP3NYIkRarWUM9
	LHHcBM16Vie3KgtzK4LZH+IiCk0FWPERaDKbLU9+mFFVOXHYlLXr3J6keTylSNbM34xvjdjGwhL
	vIIVWH3joPT5BYXPE9PaQWXiDcfkirU6HWz5ILkP7l8eHfC0zXqQZ9dY9l+MqU77tSVb3AwQg1W
	//kwRAWE+D+0cGcBVT/7JBOKgXUtebH9VOpNfLKznG2UlIqiyI6mfh6yutB/rKOIXoaweCnDXwu
	RSHJhFNztypYRJ1KKQ21UR7FJLAhVQbhWBZIbIcAfMMqkv8wq5T4Fw7yn4HHN3Q1Hq/u8+9Ux04
	ReMYxubwAe8GzS36S0DfXi/xuxTMeLSXkVqbsUdpOErRW1KvuYU0aZS2tEWUnGoNX6/eFNoy8o0
	T8ypUXw4DqdEw+WXCXKnlXcY0sNzSiI9U2ssAQt6w/s9vwk3ZOSF2G5NUMWvkb43xpc837aSWzt
	P4JRH3PPC+3rDH2lEJHgkeHNg==
X-Received: by 2002:a05:600c:46cb:b0:488:ac01:72de with SMTP id 5b1f17b1804b1-488fb7451e4mr174026345e9.5.1776673330582;
        Mon, 20 Apr 2026 01:22:10 -0700 (PDT)
Message-ID: <f5c7006d-a6ed-4c92-962b-d5f4b27a5c6d@suse.com>
Date: Mon, 20 Apr 2026 10:22:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] xen: introduce CONFIG_HAS_DOMAIN_TYPE
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <cover.1776340422.git.oleksii.kurochko@gmail.com>
 <e5ffcdecb0ca3c87b46965449601ff20116fecc0.1776340422.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <e5ffcdecb0ca3c87b46965449601ff20116fecc0.1776340422.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1776673331-BE066FF4-DF5F8203/0/0
X-purgate-type: clean
X-purgate-size: 4504
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 26E65428175
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 16.04.2026 16:21, Oleksii Kurochko wrote:
> As domain type is part of common code now there is no any reason
> to have architecture-specific set_domain_type() functions so
> it is dropped.
> 
> The CONFIG_ARM_64 guard in xen/arch/arm/domain_build.c is intentionally
> left unchanged: it is ARM-specific code, and ARM_64 selects
> HAS_DOMAIN_TYPE, so the semantics are identical.

Still I think it would better be updated, for consistency's sake.

> x86 with CONFIG_64BIT=y shouldn't use is_{32,64}bit_domain() as
> x86 doesn't have support of CONFIG_HAS_DOMAIN_TYPE. For x86_32
> it is fine to follow generic is_{32,64}_bit_domain() implementations.

As Michal has also alluded to, the use of x86_32 here needs some further
qualification, as Xen hasn't been possible to be built for that target
for many years. Quite possibly you mean guest type there, but then it's
unclear why you would restrict the explanation to 32-bit guests.

> Generally it probably would be better to introduce CONFIG_32BIT
> and use it to define is_{32,64}bit_domain() as if one day
> CONFIG_128BIT will be introduced is_{32,64}bit_domain() will be
> defined incorrectly but considering that CONFIG_64BIT is maximum
> supported bitness it is fine to define in this way.

Many things will need adjustment for a future CONFIG_128BIT. Imo this
kind of statement doesn't belong in a patch description; it could be a
post-commit-message remark.

> --- a/xen/arch/Kconfig
> +++ b/xen/arch/Kconfig
> @@ -1,6 +1,9 @@
>  config 64BIT
>  	bool
>  
> +config HAS_DOMAIN_TYPE
> +	bool
> +
>  config PHYS_ADDR_T_32
>  	bool

Why here rather than where the bulk of the other HAS_* are?

> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1178,7 +1178,7 @@ int __init make_cpus_node(const struct domain *d, struct kernel_info *kinfo)
>      /* Keep the compiler happy with -Og */
>      bool clock_valid = false;
>      uint64_t mpidr_aff;
> -    void *fdt = kinfo;
> +    void *fdt = kinfo->fdt;
>  
>      dt_dprintk("Create cpus node\n");
>  
> @@ -1774,13 +1774,13 @@ int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
>  
>  #ifdef CONFIG_ARM_64
>      /* if aarch32 mode is not supported at EL1 do not allow 32-bit domain */
> -    if ( !(cpu_has_el1_32) && kinfo->arch.type == DOMAIN_32BIT )
> +    if ( !(cpu_has_el1_32) && kinfo->type == DOMAIN_32BIT )

I'm not an Arm maintainer; if I was, I'd ask for the stray parentheses to be
dropped on this occasion.

> @@ -1896,7 +1896,7 @@ int __init construct_hwdom(struct kernel_info *kinfo,
>  
>  #ifdef CONFIG_ARM_64
>      /* type must be set before allocate_memory */
> -    d->arch.type = kinfo->arch.type;
> +    d->type = kinfo->type;
>  #endif

I wonder why this doesn't use set_domain_type() (see also below).

> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -809,7 +809,10 @@ static int __init construct_domU(struct kernel_info *kinfo,
>      if ( rc < 0 )
>          return rc;
>  
> -    set_domain_type(d, kinfo);
> +#ifdef CONFIG_HAS_DOMAIN_TYPE
> +    /* type must be set before allocate memory */

Nit: Comment style.

> +    d->type = kinfo->type;
> +#endif

Imo it would be preferable to retain set_domain_type(), to avoid #ifdef-ary
here and in construct_hwdom(). Of course its implementation would need to
move. Couldn't it be ...

> --- a/xen/include/xen/dom0less-build.h
> +++ b/xen/include/xen/dom0less-build.h
> @@ -57,8 +57,6 @@ int init_vuart(struct domain *d, struct kernel_info *kinfo,
>  int make_intc_domU_node(struct kernel_info *kinfo);
>  int make_arch_nodes(struct kernel_info *kinfo);
>  
> -void set_domain_type(struct domain *d, struct kernel_info *kinfo);

... an inline function here?

> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -668,6 +668,10 @@ struct domain
>      struct page_info *pending_scrub;
>      unsigned int pending_scrub_order;
>      unsigned int pending_scrub_index;
> +
> +#ifdef CONFIG_HAS_DOMAIN_TYPE
> +    enum domain_type type;
> +#endif
>  } __aligned(PAGE_SIZE);

I'm not quite happy with all new fields getting put at the bottom, when
better options may exist. If the enum was a packed one, it could go next
to domain_id (where 16 bits of padding presently exist). The five *_pages
fields also have a padding field following them (unless MEM_SHARING !=
MEM_PAGING).

Jan

