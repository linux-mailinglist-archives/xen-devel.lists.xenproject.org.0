Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E84C880FCB
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 11:30:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695845.1086042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmtCn-00015H-2c; Wed, 20 Mar 2024 10:29:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695845.1086042; Wed, 20 Mar 2024 10:29:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmtCm-000124-Vk; Wed, 20 Mar 2024 10:29:56 +0000
Received: by outflank-mailman (input) for mailman id 695845;
 Wed, 20 Mar 2024 10:29:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x+RR=K2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rmtCl-00011y-T3
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 10:29:55 +0000
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [2607:f8b0:4864:20::f36])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca686045-e6a4-11ee-afdd-a90da7624cb6;
 Wed, 20 Mar 2024 11:29:54 +0100 (CET)
Received: by mail-qv1-xf36.google.com with SMTP id
 6a1803df08f44-6962950c6bfso18391896d6.2
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 03:29:54 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 ff7-20020a0562140bc700b00691823f0980sm6058550qvb.0.2024.03.20.03.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Mar 2024 03:29:53 -0700 (PDT)
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
X-Inumbo-ID: ca686045-e6a4-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710930593; x=1711535393; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1hmVZ4+5+0fNwvZlaQM/m0KtR/kGoLvMMhEnvLzTk54=;
        b=WS0dYfDKePmCjhdzmuxwj+MCniCvznJaA9WjE293Flr3uVrdMUuQScu3I1vzBksCjm
         mhGN4L936i2KPxdvpebwUa++4DwAD+LrcBjlZY9ExCOyXFdA/Dwv8J7SGwqSQfv0d/rS
         1F80G+/sYtpJFy9gCNvcykEVef+IPy9MfkVKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710930593; x=1711535393;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1hmVZ4+5+0fNwvZlaQM/m0KtR/kGoLvMMhEnvLzTk54=;
        b=J81ghsP8vGdNwOxz5ARYLLv26QdCZBrlsJ4yeRgHPZBUxBNVlcZPd28dfHp91wj2/N
         6MdWEZ1MbNgIT59ai9xeHTrxCAq0K7fY3nRjPScMecfqIp6vsHK2Guf8Yxikt5PhghJ7
         TZxlV/AiDlxyMuNfQ34jZV260sOlJHMrrIT7C2EjyirzE7eFf16kfDFkYKiQH8rhLJ8d
         aXX9J+SSG9pAEYEvFBrq9prJhv/ZBng5meBJKw3NL/xZ6OYTINE99jBI5SJhYLRHQo9H
         iA2QIGHYOlRGKaXCVg4tGs4pPBCRacCCTT6dKoKnAuNpgSgRyNCFypWqDQzNhW1bbe2+
         sXaw==
X-Gm-Message-State: AOJu0YyFwhnYeW20Wdb63L7IfciJA+9aaSFbfQBsD+ES27Kh9PpLvBIJ
	hZHQyEOFZQNn/3z6i/NKGz0Ohq8WVxOD2gyemWTjGgW0W1pmUvyP/SBwDAyr2w8=
X-Google-Smtp-Source: AGHT+IG51sWuWUQEL848x8erv1rYW1ylxELTIBf9Ry4ICLJktKO0EHkaR852yxGzVhNd2U3A+Q9IoA==
X-Received: by 2002:a05:6214:8d2:b0:691:51d4:c40c with SMTP id da18-20020a05621408d200b0069151d4c40cmr16417177qvb.18.1710930593357;
        Wed, 20 Mar 2024 03:29:53 -0700 (PDT)
Date: Wed, 20 Mar 2024 11:29:50 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 6/6] xen/x86: Add topology generator
Message-ID: <Zfq6np1--SxKGE30@macbook>
References: <20240109153834.4192-1-alejandro.vallejo@cloud.com>
 <20240109153834.4192-7-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240109153834.4192-7-alejandro.vallejo@cloud.com>

On Tue, Jan 09, 2024 at 03:38:34PM +0000, Alejandro Vallejo wrote:
> This allows toolstack to synthesise sensible topologies for guests. In
> particular, this patch causes x2APIC IDs to be packed according to the
> topology now exposed to the guests on leaf 0xb.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
>  tools/include/xenguest.h        |  15 ++++
>  tools/libs/guest/xg_cpuid_x86.c | 144 ++++++++++++++++++++------------
>  xen/arch/x86/cpu-policy.c       |   6 +-
>  3 files changed, 107 insertions(+), 58 deletions(-)
> 
> diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
> index 4e9078fdee..f0043c559b 100644
> --- a/tools/include/xenguest.h
> +++ b/tools/include/xenguest.h
> @@ -843,5 +843,20 @@ enum xc_static_cpu_featuremask {
>      XC_FEATUREMASK_HVM_HAP_DEF,
>  };
>  const uint32_t *xc_get_static_cpu_featuremask(enum xc_static_cpu_featuremask);
> +
> +/**
> + * Synthesise topology information in `p` given high-level constraints
> + *
> + * Topology is given in various fields accross several leaves, some of
> + * which are vendor-specific. This function uses the policy itself to
> + * derive such leaves from threads/core and cores/package.
> + *
> + * @param p                   CPU policy of the domain.
> + * @param threads_per_core    threads/core. Doesn't need to be a power of 2.
> + * @param cores_per_package   cores/package. Doesn't need to be a power of 2.
> + */
> +void xc_topo_from_parts(struct cpu_policy *p,
> +                        uint32_t threads_per_core, uint32_t cores_per_pkg);

I think you can use plain unsigned int here.

> +
>  #endif /* __i386__ || __x86_64__ */
>  #endif /* XENGUEST_H */
> diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
> index 4453178100..7a622721be 100644
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
> @@ -727,60 +727,8 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
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
> -        {
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
> -        }
> +        /* TODO: Expose the ability to choose a custom topology for HVM/PVH */
> +        xc_topo_from_parts(&p->policy, 1, di.max_vcpu_id + 1);

It would be better if this was split into two commits.  First commit
would move the code as-is into xc_topo_from_parts() without any
changes.  Second patch would do the functional changes.  That was it's
far easier to spot what are the relevant changes vs pure code
movement.

>      }
>  
>      nr_leaves = ARRAY_SIZE(p->leaves);
> @@ -1028,3 +976,89 @@ bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
>  
>      return false;
>  }
> +
> +static uint32_t order(uint32_t n)
> +{
> +    return 32 - __builtin_clz(n);
> +}
> +
> +void xc_topo_from_parts(struct cpu_policy *p,
> +                        uint32_t threads_per_core, uint32_t cores_per_pkg)
> +{
> +    uint32_t threads_per_pkg = threads_per_core * cores_per_pkg;
> +    uint32_t apic_id_size;
> +
> +    if ( p->basic.max_leaf < 0xb )
> +        p->basic.max_leaf = 0xb;
> +
> +    memset(p->topo.raw, 0, sizeof(p->topo.raw));
> +
> +    /* thread level */
> +    p->topo.subleaf[0].nr_logical = threads_per_core;
> +    p->topo.subleaf[0].id_shift = 0;
> +    p->topo.subleaf[0].level = 0;
> +    p->topo.subleaf[0].type = 1;
> +    if ( threads_per_core > 1 )
> +        p->topo.subleaf[0].id_shift = order(threads_per_core - 1);
> +
> +    /* core level */
> +    p->topo.subleaf[1].nr_logical = cores_per_pkg;
> +    if ( p->x86_vendor == X86_VENDOR_INTEL )
> +        p->topo.subleaf[1].nr_logical = threads_per_pkg;
> +    p->topo.subleaf[1].id_shift = p->topo.subleaf[0].id_shift;
> +    p->topo.subleaf[1].level = 1;
> +    p->topo.subleaf[1].type = 2;
> +    if ( cores_per_pkg > 1 )
> +        p->topo.subleaf[1].id_shift += order(cores_per_pkg - 1);

I was kind of expecting this to be part of cpu-policy rather than xc,
as we could then also test this like you do test
x86_x2apic_id_from_vcpu_id().

It could also be used to populate the topologies in the tests
themselves.

Thanks, Roger.

