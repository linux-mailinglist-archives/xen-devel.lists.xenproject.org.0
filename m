Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B5C8CE2B3
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 10:59:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729187.1134293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAQl1-00062J-GC; Fri, 24 May 2024 08:58:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729187.1134293; Fri, 24 May 2024 08:58:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAQl1-0005zv-D0; Fri, 24 May 2024 08:58:35 +0000
Received: by outflank-mailman (input) for mailman id 729187;
 Fri, 24 May 2024 08:58:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LySr=M3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sAQkz-0005zp-Tt
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 08:58:33 +0000
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [2607:f8b0:4864:20::f2c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cbb95f1b-19ab-11ef-90a1-e314d9c70b13;
 Fri, 24 May 2024 10:58:32 +0200 (CEST)
Received: by mail-qv1-xf2c.google.com with SMTP id
 6a1803df08f44-6aa93d19a25so24001236d6.3
 for <xen-devel@lists.xenproject.org>; Fri, 24 May 2024 01:58:32 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6ac070f3597sm5496936d6.58.2024.05.24.01.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 01:58:31 -0700 (PDT)
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
X-Inumbo-ID: cbb95f1b-19ab-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716541112; x=1717145912; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bGddc/d20WfES02t8eky1QTcJaXCspHyZojH3X0VL2E=;
        b=i9LTyMzEf1Ygnw4udQVgWWTLXQIRvuin8n1K0h8hJ3NXa2ZaWCrxhJ5zJ3jMBA+fgv
         QJQeh4O4/mVgee9OFWNtpi+c8+zZhxhKZJn0SWQ68ooW+Y8CiOl39FHjleKMqrC9hFCC
         Ao0h6gUhz1i+YWzi7PwODc8NHbmKOPK+jOQU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716541112; x=1717145912;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bGddc/d20WfES02t8eky1QTcJaXCspHyZojH3X0VL2E=;
        b=EhBhUdPc2ifJ3V68vYOebS1oJHQ7oWLcZrXsnYzc92cXLI+2uJAwBrg4tDfSD4kr+a
         Ja3PH6r+JysINJKiNYtXnjQvRx22+SG9ncUlRV3TtoAbtsn3R5bJrl3o5Gqaqhf3jJ94
         SQpX5MG1ex4478mjk89hxpj2XbKu2PYraJHm3VbJf4s395ykb/OTvjpUaJED25GZkycT
         X6ktnqMw73cobgzHFiuY2524b8jARS49pNeHJ7kNXQieZhwic+75o/FuHZeTRAuVSi44
         NWsE6gzzFuUABaH75nAtbGQUfLSFAhfE52Lj/xL9uBFTM2jismeGrumPnPtp80kDBiGF
         HeWA==
X-Gm-Message-State: AOJu0YxcruQx77Pnsmb2evLFYw8vvBOBNFJWWgqpXuKBeudfEyiU7e98
	pGhJzYed2ndYHqsI7+2fcQ2vBFbcdwi23Ze+R2CCruI0znHwLzi3suQ2lll+RB8=
X-Google-Smtp-Source: AGHT+IHHgdYxQLDhYbhAGcyi8pYRv0UsQ+cs0MwDGoqFrJgfHuHis0KG8K5BnuwxByAlX3jOGw7jyQ==
X-Received: by 2002:ad4:4d07:0:b0:6ad:60d8:183c with SMTP id 6a1803df08f44-6ad60d81deemr1019106d6.20.1716541111720;
        Fri, 24 May 2024 01:58:31 -0700 (PDT)
Date: Fri, 24 May 2024 10:58:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 8/8] xen/x86: Synthesise domain topologies
Message-ID: <ZlBWtXkpkqzh1EWC@macbook>
References: <cover.1715102098.git.alejandro.vallejo@cloud.com>
 <f51b54328a09c510c9320f1317c2da371ef16eb5.1715102098.git.alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f51b54328a09c510c9320f1317c2da371ef16eb5.1715102098.git.alejandro.vallejo@cloud.com>

On Wed, May 08, 2024 at 01:39:27PM +0100, Alejandro Vallejo wrote:
> Expose sensible topologies in leaf 0xb. At the moment it synthesises non-HT
> systems, in line with the previous code intent.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
> v2:
>   * Zap the topology leaves of (pv/hvm)_(def/max)_policy rather than the host policy
> ---
>  tools/libs/guest/xg_cpuid_x86.c | 62 +++++----------------------------
>  xen/arch/x86/cpu-policy.c       |  9 +++--
>  2 files changed, 15 insertions(+), 56 deletions(-)
> 
> diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
> index 4453178100ad..8170769dbe43 100644
> --- a/tools/libs/guest/xg_cpuid_x86.c
> +++ b/tools/libs/guest/xg_cpuid_x86.c
> @@ -584,7 +584,7 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
>      bool hvm;
>      xc_domaininfo_t di;
>      struct xc_cpu_policy *p = xc_cpu_policy_init();
> -    unsigned int i, nr_leaves = ARRAY_SIZE(p->leaves), nr_msrs = 0;
> +    unsigned int nr_leaves = ARRAY_SIZE(p->leaves), nr_msrs = 0;
>      uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
>      uint32_t host_featureset[FEATURESET_NR_ENTRIES] = {};
>      uint32_t len = ARRAY_SIZE(host_featureset);
> @@ -727,59 +727,15 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
>      }
>      else
>      {
> -        /*
> -         * Topology for HVM guests is entirely controlled by Xen.  For now, we
> -         * hardcode APIC_ID = vcpu_id * 2 to give the illusion of no SMT.
> -         */
> -        p->policy.basic.htt = true;
> -        p->policy.extd.cmp_legacy = false;
> -
> -        /*
> -         * Leaf 1 EBX[23:16] is Maximum Logical Processors Per Package.
> -         * Update to reflect vLAPIC_ID = vCPU_ID * 2, but make sure to avoid
> -         * overflow.
> -         */
> -        if ( !p->policy.basic.lppp )
> -            p->policy.basic.lppp = 2;
> -        else if ( !(p->policy.basic.lppp & 0x80) )
> -            p->policy.basic.lppp *= 2;
> -
> -        switch ( p->policy.x86_vendor )
> +        /* TODO: Expose the ability to choose a custom topology for HVM/PVH */
> +        unsigned int threads_per_core = 1;
> +        unsigned int cores_per_pkg = di.max_vcpu_id + 1;

Newline.

> +        rc = x86_topo_from_parts(&p->policy, threads_per_core, cores_per_pkg);

I assume this generates the same topology as the current code, or will
the population of the leaves be different in some way?

> +        if ( rc )
>          {
> -        case X86_VENDOR_INTEL:
> -            for ( i = 0; (p->policy.cache.subleaf[i].type &&
> -                          i < ARRAY_SIZE(p->policy.cache.raw)); ++i )
> -            {
> -                p->policy.cache.subleaf[i].cores_per_package =
> -                    (p->policy.cache.subleaf[i].cores_per_package << 1) | 1;
> -                p->policy.cache.subleaf[i].threads_per_cache = 0;
> -            }
> -            break;
> -
> -        case X86_VENDOR_AMD:
> -        case X86_VENDOR_HYGON:
> -            /*
> -             * Leaf 0x80000008 ECX[15:12] is ApicIdCoreSize.
> -             * Leaf 0x80000008 ECX[7:0] is NumberOfCores (minus one).
> -             * Update to reflect vLAPIC_ID = vCPU_ID * 2.  But avoid
> -             * - overflow,
> -             * - going out of sync with leaf 1 EBX[23:16],
> -             * - incrementing ApicIdCoreSize when it's zero (which changes the
> -             *   meaning of bits 7:0).
> -             *
> -             * UPDATE: I addition to avoiding overflow, some
> -             * proprietary operating systems have trouble with
> -             * apic_id_size values greater than 7.  Limit the value to
> -             * 7 for now.
> -             */
> -            if ( p->policy.extd.nc < 0x7f )
> -            {
> -                if ( p->policy.extd.apic_id_size != 0 && p->policy.extd.apic_id_size < 0x7 )
> -                    p->policy.extd.apic_id_size++;
> -
> -                p->policy.extd.nc = (p->policy.extd.nc << 1) | 1;
> -            }
> -            break;
> +            ERROR("Failed to generate topology: t/c=%u c/p=%u",
> +                  threads_per_core, cores_per_pkg);

Could you also print the error code?

> +            goto out;
>          }
>      }
>  
> diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
> index 4b6d96276399..0ad871732ba0 100644
> --- a/xen/arch/x86/cpu-policy.c
> +++ b/xen/arch/x86/cpu-policy.c
> @@ -278,9 +278,6 @@ static void recalculate_misc(struct cpu_policy *p)
>  
>      p->basic.raw[0x8] = EMPTY_LEAF;
>  
> -    /* TODO: Rework topology logic. */
> -    memset(p->topo.raw, 0, sizeof(p->topo.raw));
> -
>      p->basic.raw[0xc] = EMPTY_LEAF;
>  
>      p->extd.e1d &= ~CPUID_COMMON_1D_FEATURES;
> @@ -621,6 +618,9 @@ static void __init calculate_pv_max_policy(void)
>      recalculate_xstate(p);
>  
>      p->extd.raw[0xa] = EMPTY_LEAF; /* No SVM for PV guests. */
> +
> +    /* Wipe host topology. Toolstack is expected to synthesise a sensible one */
> +    memset(p->topo.raw, 0, sizeof(p->topo.raw));
>  }
>  
>  static void __init calculate_pv_def_policy(void)
> @@ -773,6 +773,9 @@ static void __init calculate_hvm_max_policy(void)
>  
>      /* It's always possible to emulate CPUID faulting for HVM guests */
>      p->platform_info.cpuid_faulting = true;
> +
> +    /* Wipe host topology. Toolstack is expected to synthesise a sensible one */

Line length.

/* Wipe host topology.  Populated by toolstack. */

Would be OK IMO.

Thanks, Roger.
> +    memset(p->topo.raw, 0, sizeof(p->topo.raw));

Note that currently the host policy also gets the topology leaves
cleared, is it intended to not clear them anymore after this change?

(as you only clear the leaves for the guest {max,def} policies)

Thanks, Roger.

