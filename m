Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B07EE9ED2FE
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 18:01:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855036.1268081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLQ4x-0007IW-9K; Wed, 11 Dec 2024 17:00:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855036.1268081; Wed, 11 Dec 2024 17:00:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLQ4x-0007FN-5a; Wed, 11 Dec 2024 17:00:51 +0000
Received: by outflank-mailman (input) for mailman id 855036;
 Wed, 11 Dec 2024 17:00:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YTIw=TE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tLQ4w-00075X-4s
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 17:00:50 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78cc85aa-b7e1-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 18:00:49 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-aa543c4db92so622967966b.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 09:00:49 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa65d870db9sm697689966b.203.2024.12.11.09.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 09:00:48 -0800 (PST)
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
X-Inumbo-ID: 78cc85aa-b7e1-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1733936449; x=1734541249; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T3rrIoUY8eGTHYPZYuz6VI2qo5rwAkwDMw4Whb6+iVA=;
        b=sEFbgp4WAtm0v/J+z2wYRmPio33NpQEfO0ZSV82P/kXQzer85w/f2asL9OWN75BAGI
         aaBJnVE3hv4Qb2n3NSHrtIdZ/6Z8BdW98V0x7nfvvlFhLdkDeaNGVBYPf2LELOf5voPB
         H2q6fjLE4TkBnFMyMVHBem29ML0FCf69W2fcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733936449; x=1734541249;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T3rrIoUY8eGTHYPZYuz6VI2qo5rwAkwDMw4Whb6+iVA=;
        b=V0ugFJiEpIIsUeOp3czE595dgljSJtDfPK7LKFlCO5HbiGoklzG712e153uQsKyq0x
         tGhYoFobOnVWLaI2+vg+gC8gInNPfmVL3l0Pla1Fkxbz6X/kI9OtLj5ipS4G0RvcJfuQ
         54nS1L66N9cbD4erka1PnBwhPG5GeYmleiHQ97YRIqiSiAobvjVlM0mo14wxJfIi57Qr
         C4GQG0DFfENhtGHnPcEpiPrQYeHHv712sGMuozOKwI+j2VRFRNvIU1duGdlPmbRrO7ZF
         dIGGamB6UqFnpcHqUDOzy5+trOmOuha5jD3szLkojCTYNc2kQctwaMJln8E3NYWo14Jy
         gIgA==
X-Gm-Message-State: AOJu0YyPBtqg0NG/Qxc/XrUwyl/LGV9/aB2GDEBd+ly2j1cPyyfAsxpr
	Sc1aWDSKo8O/1DsJoFo9KII/Mx4wF2B1h4G/stOM0YE8iZ0UsKHSb1Oq5eZBK4k=
X-Gm-Gg: ASbGnctc1oywe5NZgp0bmmIGatksZ1Jj/lix367+KLgd7rviS+MSx8uIS6z4k0RR8Cl
	a1ukeCUWk1ddv1sfkJDzpZg7ibKv/B7nP6EwCWnyKL/+FyVTA25OKqYVW+0WhZ8CIUvCjn9S1ow
	X9DgbSYeMd/DQwDaxEwqkniClNeKDx+Djy1gNK+TUI8VSp+TY7fCYObzYFR8YETo7Q0tbb/lvb8
	ipGEu+ShimAUVInDki7ssgreQQErH+G+BoAPPf8ZcOKu+d5rl5egMTSIVLk+Fc=
X-Google-Smtp-Source: AGHT+IGaoYWTscHaKVMY4S7R1uZqi/YDwO64By5BA35vIjHDle1ciR93g35FnT7RnOnhZ053U8yJpA==
X-Received: by 2002:a17:907:9554:b0:aa6:ac4c:8dc with SMTP id a640c23a62f3a-aa6b117feb1mr309278966b.18.1733936448887;
        Wed, 11 Dec 2024 09:00:48 -0800 (PST)
Date: Wed, 11 Dec 2024 18:00:47 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 11/35] xen/domain: enable max_init_domid for all
 architectures
Message-ID: <Z1nFPw5889vC_MLX@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-11-e9aa923127eb@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241205-vuart-ns8250-v1-11-e9aa923127eb@ford.com>

On Thu, Dec 05, 2024 at 08:41:41PM -0800, Denis Mukhin via B4 Relay wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Move max_init_domid to a public API and enable for all architectures.
> That is pre-requisite change for console focus switch logic cleanup.
> 
> max_init_domid is updated in domain_create().
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>  xen/arch/arm/include/asm/setup.h   | 2 --
>  xen/arch/arm/setup.c               | 2 --
>  xen/arch/ppc/include/asm/setup.h   | 2 --
>  xen/arch/riscv/include/asm/setup.h | 2 --
>  xen/arch/x86/include/asm/setup.h   | 2 --
>  xen/common/domain.c                | 9 +++++++++
>  xen/include/xen/domain.h           | 2 ++
>  7 files changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index 64c227d171fc7b92e5b62d9fd42e5662871bd12b..d4e1670cd69cdd4475b2a5eb316d2c0601090ed7 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -19,8 +19,6 @@ struct map_range_data
>      struct rangeset *irq_ranges;
>  };
>  
> -extern domid_t max_init_domid;
> -
>  void copy_from_paddr(void *dst, paddr_t paddr, unsigned long len);
>  
>  size_t estimate_efi_size(unsigned int mem_nr_banks);
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 2e27af4560a504bf57daef572d4a768bd886145b..cb218fe3eb36f2cdda47cfa092fa99ee1ca4a14c 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -58,8 +58,6 @@ struct cpuinfo_arm __read_mostly system_cpuinfo;
>  bool __read_mostly acpi_disabled;
>  #endif
>  
> -domid_t __read_mostly max_init_domid;
> -
>  static __used void init_done(void)
>  {
>      int rc;
> diff --git a/xen/arch/ppc/include/asm/setup.h b/xen/arch/ppc/include/asm/setup.h
> index e4f64879b68ca5aac24bd9544255143e6ef693f3..956fa6985adb23375bd41d3e5d34d9d5f0712bd5 100644
> --- a/xen/arch/ppc/include/asm/setup.h
> +++ b/xen/arch/ppc/include/asm/setup.h
> @@ -1,6 +1,4 @@
>  #ifndef __ASM_PPC_SETUP_H__
>  #define __ASM_PPC_SETUP_H__
>  
> -#define max_init_domid (0)
> -
>  #endif /* __ASM_PPC_SETUP_H__ */
> diff --git a/xen/arch/riscv/include/asm/setup.h b/xen/arch/riscv/include/asm/setup.h
> index 844a2f0ef1d762b3a9bc90b61a336a23f1693cc9..978cad71d3df484e80ba19acc0e37b9278e941f0 100644
> --- a/xen/arch/riscv/include/asm/setup.h
> +++ b/xen/arch/riscv/include/asm/setup.h
> @@ -3,8 +3,6 @@
>  #ifndef ASM__RISCV__SETUP_H
>  #define ASM__RISCV__SETUP_H
>  
> -#define max_init_domid (0)
> -
>  void setup_mm(void);
>  
>  #endif /* ASM__RISCV__SETUP_H */
> diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
> index 5c2391a8684b66efdf4b092409ed33935db6b40c..296348655b9d146c73acc305cc9edd5fd46f7d47 100644
> --- a/xen/arch/x86/include/asm/setup.h
> +++ b/xen/arch/x86/include/asm/setup.h
> @@ -69,6 +69,4 @@ extern bool opt_dom0_verbose;
>  extern bool opt_dom0_cpuid_faulting;
>  extern bool opt_dom0_msr_relaxed;
>  
> -#define max_init_domid (0)
> -
>  #endif
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 2f67aa06ed50e69c27cedc8d7f6eb0b469fe81cd..9e57dd4122a726e2fb42efe9c029e775202be0e6 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -65,6 +65,9 @@ DEFINE_RCU_READ_LOCK(domlist_read_lock);
>  static struct domain *domain_hash[DOMAIN_HASH_SIZE];
>  struct domain *domain_list;
>  
> +/* Last known non-system domain ID. */
> +domid_t __read_mostly max_init_domid;

The comment (and implementation below) seems to differ from what Arm
dom0less code currently uses the variable for.

> +
>  /*
>   * Insert a domain into the domlist/hash.  This allows the domain to be looked
>   * up by domid, and therefore to be the subject of hypercalls/etc.
> @@ -815,6 +818,12 @@ struct domain *domain_create(domid_t domid,
>  
>      memcpy(d->handle, config->handle, sizeof(d->handle));
>  
> +    /*
> +     * Housekeeping for physical console forwarding to the domain.
> +     */
> +    if ( !is_system_domain(d) && max_init_domid < domid )
> +        max_init_domid = domid;

Don't you need to adjust the ARM dom0-less logic that deal with
increasing max_init_domid in create_domUs().

Also max_init_domid likely only wants to be updated for domains
created before the control domain is started, and hence could be
__ro_after_init instead of __read_mostly?

Thanks, Roger.

