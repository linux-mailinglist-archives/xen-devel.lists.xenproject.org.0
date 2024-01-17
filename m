Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 410B0830C24
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jan 2024 18:39:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668553.1040829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ9s6-0007Kf-Pq; Wed, 17 Jan 2024 17:38:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668553.1040829; Wed, 17 Jan 2024 17:38:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ9s6-0007HS-MT; Wed, 17 Jan 2024 17:38:38 +0000
Received: by outflank-mailman (input) for mailman id 668553;
 Wed, 17 Jan 2024 17:38:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YOw+=I3=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rQ9s4-00072k-Ui
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2024 17:38:36 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d5a2d50-b55f-11ee-9b0f-b553b5be7939;
 Wed, 17 Jan 2024 18:38:35 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-559533e2503so4009445a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jan 2024 09:38:35 -0800 (PST)
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
X-Inumbo-ID: 3d5a2d50-b55f-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1705513115; x=1706117915; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=udhYuHO7LR5zOfxSbqI0nC0Yi4nXzJrXwmuJ9ptHxCQ=;
        b=YW4S4zUxwja6fPBrG5JGi19w938N3d9HsX87ZkydDOsadUctY0SkcqxRcPf9q8zbGQ
         G9+GZDYDtgBdY13z0y/LCSLOPPJrczz4JTYGKxRh/ZkTBi0PTWRlCUlRuduvNayOo1bm
         bBff+/ZpC97ttTuXkjuTeM6yDMR0MEEt0TNvKFFBURTHGMU2HU9rBReqKK7SFG3qfEG/
         dIPR7L3u5KI96l2VhNQRoaeY6dCHSQgIQDeVEzVUgsBmMoB82vUgcEcgz1GQHGzoPX1N
         lTVxqozzQfo53/Pk1w/jBo8qlYlwxN5ncl3lstBMeH4IEef9j2B3H+agY7DYMYlsWtij
         tRHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705513115; x=1706117915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=udhYuHO7LR5zOfxSbqI0nC0Yi4nXzJrXwmuJ9ptHxCQ=;
        b=q5Anf28MREROPNZibkzQkOtyg21MobHm2S8w+r/vGX5GCWvEZxi+F4RxbppRhSvkh/
         5WdNp7pxXjx9DE3b1dkdkeTDu1iU8Dak8PVJMtcA72G14pmQ8FmWG8fpjoTp8dim2M7/
         ON89efjHqa42BnG8lYYZDPwwJnheL0ZNepsv1k5CiAfUEjCjX0kDuWd2KRMEOrxwfsYW
         WNicAiZTz3c6BCqrQ9EAKit46XBFoP53BTQgZlnACpdLhIgqZGhX/yMnIgoWyiiGM6fj
         ZwQK6NmHr7uVsmsq5s8pF8kMBS9jlcaFJ1y67EWS2Z/wW8KwYTqlcCj5a/iefjO/H9R1
         FHoQ==
X-Gm-Message-State: AOJu0YzIVf3fgBYZTBcaAp76nK70yvy3AEUTvWv/RUFMZWJVXQ0036FA
	64cmUBTlDKaq0LOtaJ7V9P1SHRFBPsZtFpBB4T2S8edyAQDIeg==
X-Google-Smtp-Source: AGHT+IFnWDz2C6kGGZtUf+SfpFjLt+eQRu1C3jv3Mlswq2E8RJwtwNADUxzd4Tvn3YEswyoC6dsZm+3E2pa+O2ToI/4=
X-Received: by 2002:aa7:c35a:0:b0:54c:4837:9a99 with SMTP id
 j26-20020aa7c35a000000b0054c48379a99mr4686710edr.64.1705513114746; Wed, 17
 Jan 2024 09:38:34 -0800 (PST)
MIME-Version: 1.0
References: <20240116143709.86584-1-julien@xen.org> <20240116143709.86584-5-julien@xen.org>
In-Reply-To: <20240116143709.86584-5-julien@xen.org>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Wed, 17 Jan 2024 18:38:24 +0100
Message-ID: <CAG+AhRUox+jMhUnbGo6tngxji8nOcncm+Nx_76UuhTKKPfae8g@mail.gmail.com>
Subject: Re: [PATCH v1 repost 4/4] [DO NOT COMMIT] xen/arm: Create a
 trampoline for secondary boot CPUs
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien

On Tue, Jan 16, 2024 at 3:37=E2=80=AFPM Julien Grall <julien@xen.org> wrote=
:
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

Here PRIx64 is needed for arm32.

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

Thanks.

