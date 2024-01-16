Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3330482F086
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 15:24:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667789.1039402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPkMf-0003eL-Ma; Tue, 16 Jan 2024 14:24:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667789.1039402; Tue, 16 Jan 2024 14:24:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPkMf-0003b6-Jc; Tue, 16 Jan 2024 14:24:29 +0000
Received: by outflank-mailman (input) for mailman id 667789;
 Tue, 16 Jan 2024 14:24:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lstz=I2=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rPkMe-0003ay-Gz
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 14:24:28 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f427b7ce-b47a-11ee-98f1-6d05b1d4d9a1;
 Tue, 16 Jan 2024 15:24:27 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a2c179aa5c4so651045766b.0
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jan 2024 06:24:27 -0800 (PST)
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
X-Inumbo-ID: f427b7ce-b47a-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1705415066; x=1706019866; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NhnrQLItaSad0duFhSCp4HzrrXKTwINxqjLMFWpDc4A=;
        b=lzoQEAqRGyiYJReas9t51fe/MveoJduQEXczD7JS+fYmeo46bP1ekXmOAD920wEStn
         Psk+ErkwbbnZMpI8m3yQbnMWfG+RfJwVnsCS/bK7IG/o77N1e4EhNqx2+VUI5mstTarZ
         TZLC3MIDeOvNhP9WIqjIf0zSL8CXQjY+pf9L5wm7vE53GFR3hQG4zQ51BPsOM88eRCe0
         yiz9FYjawLQ22f17mpD9ZdSyKTuTapmKkIr8BNRcuJRQDtASQblp+BvCx3l5e8Hj1J26
         kFcePev/4TGV1TiHEj5JF2+jZwfDF72XU6LFxMMpYp2o6wEcNkKQNTu5mE4rUvAI2pr5
         K3rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705415066; x=1706019866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NhnrQLItaSad0duFhSCp4HzrrXKTwINxqjLMFWpDc4A=;
        b=AeQE7ZGMBtboPtqJtizbygPJv0Q1V4Te6EIoiAYqLMX5hr4sKSI2ZiMTCy5+y5ixIT
         YEJUP1tuMZ+Ha1WH7aBIw1c/VvVxBYGn6P1jBNtwI+2mLjIQqQFOTcqq5GLNK3DCOgXe
         Lf8Ov38b7OXcbl0DJgST1jWdOqrJWHSx4934LSW6JVpSxRKo2EaLUy78j4IPIvoobroJ
         /bZEhtpsCxDKxjcBCcBJAjNKed6WXb5k/ys4r8zmtEENGc0PLsfZa97g1hk7sqCSUZMA
         Eq/Ybkivw32//C9SOWoAMSOICOrbTa0b+Ob0F5Y3L0uuVmIUXOSOHao6RKaEtcLZoPZE
         lnAQ==
X-Gm-Message-State: AOJu0YyOFqs3CnGpJTIJ9Qi7c0aCCccYW4iX0cvvgcdx/97TY/nsZF7c
	pVk3l8yhc79+fQt7upFkYfCBEMULqm6Oy8OhDMulVPSTmhZ2tQ==
X-Google-Smtp-Source: AGHT+IGhr9pDZ9LILpeQYQOMTGfhmyuWD19RM0zHDr6qAvg63jbNCz21hkamGHPeeDDxmVaKGERdz+R0SfnAgL2cFXo=
X-Received: by 2002:a17:906:4f0d:b0:a2e:a02f:7293 with SMTP id
 t13-20020a1709064f0d00b00a2ea02f7293mr123737eju.48.1705415066493; Tue, 16 Jan
 2024 06:24:26 -0800 (PST)
MIME-Version: 1.0
References: <20240116115509.77545-1-julien@xen.org> <20240116115509.77545-4-julien@xen.org>
In-Reply-To: <20240116115509.77545-4-julien@xen.org>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Tue, 16 Jan 2024 15:24:15 +0100
Message-ID: <CAG+AhRWrN=Y4ZT57GjYMoX=7LPe0_3Xg_xaSnA4DY6CDHWPK0Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] [DO NOT COMMIT] xen/arm: Create a trampoline for
 secondary boot CPUs
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

On Tue, Jan 16, 2024 at 12:55=E2=80=AFPM Julien Grall <julien@xen.org> wrot=
e:
>
> From: Julien Grall <jgrall@amazon.com>
>
> In order to confirm the early boot code is self-contained, allocate a
> separate trampoline region for secondary to boot from it.
>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
>  xen/arch/arm/arm64/mmu/mm.c |  7 +++++++
>  xen/arch/arm/mmu/smpboot.c  |  4 +++-
>  xen/arch/arm/psci.c         |  5 ++++-
>  xen/arch/arm/smpboot.c      | 15 ++++++++++++++-
>  4 files changed, 28 insertions(+), 3 deletions(-)
>
> diff --git a/xen/arch/arm/arm64/mmu/mm.c b/xen/arch/arm/arm64/mmu/mm.c
> index d2651c948698..3c4988dc75d1 100644
> --- a/xen/arch/arm/arm64/mmu/mm.c
> +++ b/xen/arch/arm/arm64/mmu/mm.c
> @@ -110,11 +110,18 @@ void __init arch_setup_page_tables(void)
>      prepare_runtime_identity_mapping();
>  }
>
> +extern mfn_t trampoline_start;
> +
>  void update_identity_mapping(bool enable)
>  {
>      paddr_t id_addr =3D virt_to_maddr(_start);
>      int rc;
>
> +    if ( !mfn_eq(trampoline_start, INVALID_MFN) )
> +    {
> +        id_addr =3D mfn_to_maddr(trampoline_start);
> +    }
> +
>      if ( enable )
>          rc =3D map_pages_to_xen(id_addr, maddr_to_mfn(id_addr), 1,
>                                PAGE_HYPERVISOR_RX);
> diff --git a/xen/arch/arm/mmu/smpboot.c b/xen/arch/arm/mmu/smpboot.c
> index f1cf9252710c..d768dfe065a5 100644
> --- a/xen/arch/arm/mmu/smpboot.c
> +++ b/xen/arch/arm/mmu/smpboot.c
> @@ -72,13 +72,15 @@ static void clear_boot_pagetables(void)
>      clear_table(boot_third);
>  }
>
> +extern mfn_t trampoline_start;
> +
>  static void set_init_ttbr(lpae_t *root)

Isn't this function not present in the patch series?

>  {
>      /*
>       * init_ttbr is part of the identity mapping which is read-only. So
>       * We need to re-map the region so it can be updated
>       */
> -    void *ptr =3D map_domain_page(virt_to_mfn(&init_ttbr));
> +    void *ptr =3D map_domain_page(trampoline_start);
>
>      ptr +=3D PAGE_OFFSET(&init_ttbr);
>
> diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
> index 695d2fa1f1b5..a00574d559d6 100644
> --- a/xen/arch/arm/psci.c
> +++ b/xen/arch/arm/psci.c
> @@ -36,11 +36,14 @@ static uint32_t psci_cpu_on_nr;
>
>  #define PSCI_RET(res)   ((int32_t)(res).a0)
>
> +extern mfn_t trampoline_start;
> +
>  int call_psci_cpu_on(int cpu)
>  {
>      struct arm_smccc_res res;
>
> -    arm_smccc_smc(psci_cpu_on_nr, cpu_logical_map(cpu), __pa(init_second=
ary),
> +    arm_smccc_smc(psci_cpu_on_nr, cpu_logical_map(cpu),
> +                  mfn_to_maddr(trampoline_start) + PAGE_OFFSET(init_seco=
ndary),
>                    &res);
>
>      return PSCI_RET(res);
> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> index 8d508a1bb258..ef84b73ebd46 100644
> --- a/xen/arch/arm/smpboot.c
> +++ b/xen/arch/arm/smpboot.c
> @@ -293,10 +293,13 @@ unsigned int __init smp_get_max_cpus(void)
>      return cpus;
>  }
>
> +mfn_t trampoline_start =3D INVALID_MFN_INITIALIZER;
> +
>  void __init
>  smp_prepare_cpus(void)
>  {
>      int rc;
> +    void *trampoline;
>
>      cpumask_copy(&cpu_present_map, &cpu_possible_map);
>
> @@ -304,6 +307,16 @@ smp_prepare_cpus(void)
>      if ( rc )
>          panic("Unable to allocate CPU sibling/core maps\n");
>
> +    /* Create a trampoline to confirm early boot code is self-contained =
*/
> +    trampoline =3D alloc_xenheap_page();
> +    BUG_ON(!trampoline);
> +
> +    memcpy(trampoline, _start, PAGE_SIZE);
> +    clean_dcache_va_range(trampoline, PAGE_SIZE);
> +    invalidate_icache();
> +
> +    printk("Trampoline 0x%lx\n", virt_to_maddr(trampoline));
> +    trampoline_start =3D virt_to_mfn(trampoline);
>  }
>
>  /* Boot the current CPU */
> @@ -439,7 +452,7 @@ static void set_smp_up_cpu(unsigned long mpidr)
>       * smp_up_cpu is part of the identity mapping which is read-only. So
>       * We need to re-map the region so it can be updated.
>       */
> -    void *ptr =3D map_domain_page(virt_to_mfn(&smp_up_cpu));
> +    void *ptr =3D map_domain_page(trampoline_start);
>
>      ptr +=3D PAGE_OFFSET(&smp_up_cpu);
>
> --
> 2.40.1
>

Thank you very much for your help.

