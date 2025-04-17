Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D01A91842
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 11:48:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957278.1350434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Lq8-0008QF-6m; Thu, 17 Apr 2025 09:47:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957278.1350434; Thu, 17 Apr 2025 09:47:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Lq8-0008Ns-3u; Thu, 17 Apr 2025 09:47:24 +0000
Received: by outflank-mailman (input) for mailman id 957278;
 Thu, 17 Apr 2025 09:47:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nsoM=XD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u5Lq7-0008Nm-GB
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 09:47:23 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f30af69b-1b70-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 11:47:17 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43ce70f9afbso4916755e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 02:47:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30861212fc9sm3204782a91.26.2025.04.17.02.47.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 02:47:16 -0700 (PDT)
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
X-Inumbo-ID: f30af69b-1b70-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744883237; x=1745488037; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AEcYRdFH8NYvu8BJb8HAvA6pzBIMSPi1WtfzutwpNA8=;
        b=CaZawYgD+1fmTHOZa7UtnA8vkAYTuJt+HIVrAVyXD7+mWul3OP6NjhfjZY6Ob1eFMQ
         uejHk7dalLdm82iRTsrFPlTbl5aZloyZgDdwjyNCseMv6CFi2/OONt29GKExFa8bvgVY
         8xIsM1t7PVaT05H6i9y3yVXQSd796al8iQQbPA1H/p4TtDdPwmmWb9Pzf9O3knPBrvV/
         NdSCrFpBo5WI8tNmYl93Iwwf9A258rzNKv+9DUhFzjgxRCLVipsA8I/9ir/CVoovmV/O
         0ksnE0txZcnEpf8xdco+CfmBhfPDMlVN1HFbKsc7vGekyQxq5MbAQblE7Q4W0vF80Vg7
         V7FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744883237; x=1745488037;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AEcYRdFH8NYvu8BJb8HAvA6pzBIMSPi1WtfzutwpNA8=;
        b=soHn8ew1/QD5VLFzrb4CFgZ+etSMU1AddI4e3Y68EmkvJPZuHk5U2BE/ujs/gdW7wJ
         5zunWA2vkNeqJHLxvO9GESmKCw6/UP/ARbr6vXdpCHJ7enU87LO3r9KVIxX/3/nrtBBl
         d/ukamnYcVMSBINyvEyKfbOumVD2+T0jqPkOGZ7I3N4m/biSwsNLRtOI1rSrSIl5uARa
         lSByJBmrlQv/sDQ7tUf+GoRKoNi2OuZq9+CXmLd8FiWDa4ONdccqBwrzXJPPaQjbd2Co
         q7kHKu6qbUKKOqA9yaQWIB9koGwDG+vFArdO0fDtcdWEWGQgSYFRXwxmRy0fDxDfbo1w
         tJkg==
X-Forwarded-Encrypted: i=1; AJvYcCVt74cK6u8VP8Xnuy+viwsxKDfexGb9uSnLyst60nwbHD2Vk0kYeoKNsa1wO7llbK90efEO2+EQ7qE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy954liIW4nTxqdklgiM4nFVfpSV5H2xkxStdTtrHooed65P+8m
	cPXysKX8D7hAObRnohuTxWtNFDpCZQZp/6n2l36/+AFt+3LU+64cnCdjOBUDCQ==
X-Gm-Gg: ASbGnctW7xBzt6VTykE2x+1/0JLT8uSvvWjMJs+FLt+Gt2X8jEmawUkixhyXOE/EfEo
	9mBQVVkbtv1JdEvaiR4T5qhHj9YrnqBjmeXDJgx/FuY9Ksyta5CXjw9CPr+ibknlqUWLNs6vVU2
	KZ8nmF8I+8JboLeTvcZSR/faaFRXdf9yRKBtBmwPeoV2tRy08iXRAIWDX40EVOurqk60U7/rLKa
	ofBEAqMqCQ/QV0AYEAqbD+xfHsz9nyRymhbuFXlLLXc24gP7b1W871TwBVqjNrnP09IJ6+PONTs
	HjCnGm4CpQIkgVyQpxIX1CNlQ5jYnsHIco3BR14ADaG1X0fyk57WJ+s5FiRIZKcCjNguhBL4nMu
	vlqsApg47//CU8qTGfVAz7VmFAn9eD3LvKhGo
X-Google-Smtp-Source: AGHT+IGOqo45sMG5IOvHDIhNCqs8pxfCR9oVtiULG61Z7T3VnMpR7BRRgpl7ib+S0oJAAQQa8eS1Mw==
X-Received: by 2002:a5d:5c84:0:b0:39e:cbc7:ad45 with SMTP id ffacd0b85a97d-39ee5bafc92mr3844345f8f.52.1744883237016;
        Thu, 17 Apr 2025 02:47:17 -0700 (PDT)
Message-ID: <7c5c1e59-248f-4b62-9e15-fdb692fd1c7c@suse.com>
Date: Thu, 17 Apr 2025 11:47:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/domain: unify domain ID allocation
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250416061509.934220-1-dmukhin@ford.com>
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
In-Reply-To: <20250416061509.934220-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.04.2025 08:15, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Unify the logic of domain ID allocation, so that both the initial domain
> creation and the usage by domctl use the same helper function across
> architectures (Arm and x86).
> 
> Wrap the domain ID allocation as an arch-independent function domid_alloc() in
> common/domain.c.
> 
> Allocation algorithm:
> - If an explicit domain ID is provided, verify its availability and
>   use it if ID is unused;
> - Otherwise, perform an exhaustive search for the first available ID
>   within the [0..DOMID_FIRST_RESERVED) range, excluding hardware_domid.
> 
> Move the is_free_domid() helper closer to domid_alloc(). Simplify
> is_free_domid() by removing the domain ID range check, as the ID is now
> guaranteed to be within the valid range. Additionally, update the predicate to
> return a bool value instead of an int.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Please can you clarify whether this is intended to be no functional change
(as far as one would be able to observe from the outside)? (It isn't, and
when it isn't, the behavioral change needs justifying. Which I fear you
won't be able to, in which case it needs undoing. Not using the first
unused ID is a deliberate property of the present allocation scheme.)

> ---
>  xen/arch/arm/dom0less-build.c | 19 ++++++++-------
>  xen/arch/arm/domain_build.c   | 19 +++++++++++----
>  xen/arch/x86/setup.c          |  8 +++++--
>  xen/common/domain.c           | 45 +++++++++++++++++++++++++++++++++++
>  xen/common/domctl.c           | 45 ++++-------------------------------
>  xen/include/xen/domain.h      |  2 ++
>  6 files changed, 81 insertions(+), 57 deletions(-)

This suggests it's not clearly an improvement. And I'm heavily inclined
to ask (also considering the above) that this simply be dropped.

> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2370,6 +2370,7 @@ void __init create_dom0(void)
>          .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
>      };
>      unsigned int flags = CDF_privileged;
> +    domid_t domid;
>      int rc;
>  
>      /* The vGIC for DOM0 is exactly emulating the hardware GIC */
> @@ -2394,19 +2395,27 @@ void __init create_dom0(void)
>      if ( !llc_coloring_enabled )
>          flags |= CDF_directmap;
>  
> -    dom0 = domain_create(0, &dom0_cfg, flags);
> +    rc = domid_alloc(get_initial_domain_id());
> +    if ( rc < 0 )
> +        panic("Error allocating domain ID %d (rc = %d)\n",
> +              get_initial_domain_id(), rc);
> +    domid = rc;
> +
> +    dom0 = domain_create(domid, &dom0_cfg, flags);
>      if ( IS_ERR(dom0) )
> -        panic("Error creating domain 0 (rc = %ld)\n", PTR_ERR(dom0));
> +        panic("Error creating domain %d (rc = %ld)\n", domid, PTR_ERR(dom0));

Up to here using domid is okay. However, ...

>      if ( llc_coloring_enabled && (rc = dom0_set_llc_colors(dom0)) )
> -        panic("Error initializing LLC coloring for domain 0 (rc = %d)\n", rc);
> +        panic("Error initializing LLC coloring for domain %d (rc = %d)\n",
> +              domid, rc);
>  
>      if ( alloc_dom0_vcpu0(dom0) == NULL )
> -        panic("Error creating domain 0 vcpu0\n");
> +        panic("Error creating domain %d vcpu0\n", domid);
>  
>      rc = construct_dom0(dom0);
>      if ( rc )
> -        panic("Could not set up DOM0 guest OS (rc = %d)\n", rc);
> +        panic("Could not set up guest OS for domain %d (rc = %d)\n",
> +              domid, rc);
>  }

... these all would better use %pd, when already being touched.

While touching all of these I think you also want to aim at making output
match that %pd or %pv would result in, if they were usable at those places.

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1009,8 +1009,12 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>      if ( iommu_enabled )
>          dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
>  
> -    /* Create initial domain.  Not d0 for pvshim. */
> -    bd->domid = get_initial_domain_id();
> +    /* Allocate initial domain ID. Not d0 for pvshim. */
> +    bd->domid = domid_alloc(get_initial_domain_id());

You're clipping the int return value to domid_t here, and thus ...

> +    if ( bd->domid < 0 )

... this condition will be always false. I'm surprised the compiler didn't
flag this for you.

> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -66,6 +66,51 @@ DEFINE_RCU_READ_LOCK(domlist_read_lock);
>  static struct domain *domain_hash[DOMAIN_HASH_SIZE];
>  struct domain *domain_list;
>  
> +static inline bool is_free_domid(domid_t dom)
> +{
> +    struct domain *d = rcu_lock_domain_by_id(dom);
> +
> +    if ( d )
> +        rcu_unlock_domain(d);
> +
> +    return !d;
> +}
> +
> +/*
> + * Allocate new domain ID based on the hint.
> + *
> + * If hint is outside of valid [0..DOMID_FIRST_RESERVED] range of IDs,

That's [0, DOMID_FIRST_RESERVED), to be unambiguous. In C array initializer
notation it would be [0 ... DOMID_FIRST_RESERVED - 1].

> + * perform an exhaustive search of the first free domain ID excluding
> + * hardware_domid.
> + */
> +int domid_alloc(int hint)

I would have thought that I did comment already on the parameter being plain
int.

> +{
> +    domid_t domid;
> +
> +    if ( hint >= 0 && hint < DOMID_FIRST_RESERVED )
> +    {
> +        if ( !is_free_domid(hint) )
> +            return -EEXIST;
> +
> +        domid = hint;
> +    }
> +    else
> +    {
> +        for ( domid = 0; domid < DOMID_FIRST_RESERVED; domid++ )
> +        {
> +            if ( domid == hardware_domid )
> +                continue;
> +            if ( is_free_domid(domid) )
> +                break;
> +        }
> +
> +        if ( domid == DOMID_FIRST_RESERVED )
> +            return -ENOMEM;

There's no memory allocation here, so why ENOMEM? ENOSPC may already be slightly
better.

Jan

