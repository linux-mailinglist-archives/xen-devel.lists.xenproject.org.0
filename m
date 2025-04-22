Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5C9A96624
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 12:41:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.962431.1353652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7B3k-0002QM-Em; Tue, 22 Apr 2025 10:41:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 962431.1353652; Tue, 22 Apr 2025 10:41:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7B3k-0002Nf-Bf; Tue, 22 Apr 2025 10:41:00 +0000
Received: by outflank-mailman (input) for mailman id 962431;
 Tue, 22 Apr 2025 10:40:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bndg=XI=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1u7B3j-0002NZ-KH
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 10:40:59 +0000
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [2607:f8b0:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45c7069c-1f66-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 12:40:57 +0200 (CEST)
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-3feb3f54339so4355561b6e.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 03:40:57 -0700 (PDT)
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
X-Inumbo-ID: 45c7069c-1f66-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1745318456; x=1745923256; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XPksKxGDLIJspVPYxNnjXk8SSb1jQd5/N5NOjXAnpA0=;
        b=lflIb358bl2FJ11Kdy/L493z3wPnEpKcbupCZzMgxFWbfV0JmmsG6Eqn7eUdTf9G1P
         XAspN1HHlNYrcgyGpG7Fg5r+ebMw7neRd10I8mCE/aObla2UgKuACCVCEiuCnuCBYZvH
         A/6EABDzUhsF2ss80OaxmNlNaxz3eKu03WjtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745318456; x=1745923256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XPksKxGDLIJspVPYxNnjXk8SSb1jQd5/N5NOjXAnpA0=;
        b=UCekx+CBBJh98zpyqqV6WPKAZWCjJfgFrnZUGimJ+yjQi+X1kWkBAc8qNOZl0oiB0h
         PzKcqSaQVATUGNpGjWGFAxAQZnFuVqahU110a3CEy+0pEfWKY7gwiE56jp5qCfr/u4d2
         MkSvWVDW5gG/Jd+VdwhDpbYMOLxVtO0br+8g1GTBB4yzNdJs2L6Aq7TAkJ6NvOzyyLEr
         NYSbK8lJr4uolfIZRaVsUWX8IA7JeXPjmE2bg8XBu6PdVs3PsNfA75oFGXQdCN/1oIO5
         k0HHEeyWS2TyGwoa0XFT36ck9ZGNuWtNrNmbTigmdJfakUVbVqoC8YQWOk+3i28BjXP1
         e64A==
X-Gm-Message-State: AOJu0YwWRsH5o/HiDH49WUHTBA56eyP/HZhVU5ZtgZ+0LK4oiMr55xJd
	h8p/D10Vew8SCk1ZqSNmIxz9TyTDiRMlIr8ZePjdFYriyGopPMNgYsE4vUwKwDw1fYKBwLQIMPg
	PYcqjllmQVaJj2bMtZEY15uTfCTzLoFdyUZFNMw==
X-Gm-Gg: ASbGncsEyZskoZhTcziY48ockVg76x1+wVbvOABF6q5NCuf9yIKWZaG4qf0C8RI8n6v
	+iEVbLbq1pHfgHHb0cFBlRIE1C4splm+ANUQndnweZlpoo8dtkV9nR0evJvGJPr7kKKj6O2u6f6
	9m8oqeZHoarAyvz19QE9XXeg==
X-Google-Smtp-Source: AGHT+IE3S5VjutP5NuuMApBuOsQhd6cjqo5nr5124K1eC827hqpVOojoPY6AkQgsfZDzJM/+OajdADFof+ZmoC2N0FY=
X-Received: by 2002:a05:6808:3845:b0:3f8:f8c6:5500 with SMTP id
 5614622812f47-401c0c5b1b5mr9769321b6e.34.1745318456005; Tue, 22 Apr 2025
 03:40:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250417161913.14661-1-roger.pau@citrix.com>
In-Reply-To: <20250417161913.14661-1-roger.pau@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Tue, 22 Apr 2025 11:40:44 +0100
X-Gm-Features: ATxdqUE86MCEVRalQ120jPFmsYQFrN7RoHPvNx2x1z0li8JGZwnLSVymWKljdW8
Message-ID: <CACHz=ZgnaJuHTOrhhNEDtctV8HP7X8GZDP9HMAy7TTDUk+dcmQ@mail.gmail.com>
Subject: Re: [PATCH] x86/intel: workaround several MONITOR/MWAIT errata
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 5:19=E2=80=AFPM Roger Pau Monne <roger.pau@citrix.c=
om> wrote:
>
> There are several errata on Intel regarding the usage of the MONITOR/MWAI=
T
> instructions, all having in common that stores to the monitored region
> might not wake up the CPU.
>
> Fix them by forcing the sending of an IPI for the affected models.
>
> The Ice Lake issue has been reproduced internally on XenServer hardware,
> and the fix does seem to prevent it.  The symptom was APs getting stuck i=
n
> the idle loop immediately after bring up, which in turn prevented the BSP
> from making progress.  This would happen before the watchdog was
> initialized, and hence the whole system would get stuck.
>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
> Apollo and Lunar Lake fixes have not been tested, due to lack of hardware=
.
> ---
>  xen/arch/x86/acpi/cpu_idle.c     |  6 +++++
>  xen/arch/x86/cpu/intel.c         | 41 +++++++++++++++++++++++++++++++-
>  xen/arch/x86/include/asm/mwait.h |  3 +++
>  3 files changed, 49 insertions(+), 1 deletion(-)
>
> diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
> index 420198406def..f8f11f3c31e4 100644
> --- a/xen/arch/x86/acpi/cpu_idle.c
> +++ b/xen/arch/x86/acpi/cpu_idle.c
> @@ -441,8 +441,14 @@ void cpuidle_wakeup_mwait(cpumask_t *mask)
>      cpumask_andnot(mask, mask, &target);
>  }
>
> +/* Force sending of a wakeup IPI regardless of mwait usage. */
> +bool force_mwait_ipi_wakeup __read_mostly;
> +
>  bool arch_skip_send_event_check(unsigned int cpu)
>  {
> +    if ( force_mwait_ipi_wakeup )
> +        return false;
> +
>      /*
>       * This relies on softirq_pending() and mwait_wakeup() to access dat=
a
>       * on the same cache line.
> diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
> index 6a680ba38dc9..9d7c6ea297a9 100644
> --- a/xen/arch/x86/cpu/intel.c
> +++ b/xen/arch/x86/cpu/intel.c
> @@ -8,6 +8,7 @@
>  #include <asm/intel-family.h>
>  #include <asm/processor.h>
>  #include <asm/msr.h>
> +#include <asm/mwait.h>
>  #include <asm/uaccess.h>
>  #include <asm/mpspec.h>
>  #include <asm/apic.h>
> @@ -368,7 +369,6 @@ static void probe_c3_errata(const struct cpuinfo_x86 =
*c)
>          INTEL_FAM6_MODEL(0x25),
>          { }
>      };
> -#undef INTEL_FAM6_MODEL
>
>      /* Serialized by the AP bringup code. */
>      if ( max_cstate > 1 && (c->apicid & (c->x86_num_siblings - 1)) &&
> @@ -380,6 +380,43 @@ static void probe_c3_errata(const struct cpuinfo_x86=
 *c)
>      }
>  }
>
> +/*
> + * APL30: One use of the MONITOR/MWAIT instruction pair is to allow a lo=
gical
> + * processor to wait in a sleep state until a store to the armed address=
 range
> + * occurs. Due to this erratum, stores to the armed address range may no=
t
> + * trigger MWAIT to resume execution.
> + *
> + * ICX143: Under complex microarchitectural conditions, a monitor that i=
s armed
> + * with the MWAIT instruction may not be triggered, leading to a process=
or
> + * hang.
> + *
> + * LNL030: Problem P-cores may not exit power state Core C6 on monitor h=
it.
> + *
> + * Force the sending of an IPI in those cases.
> + */
> +static void probe_mwait_errata(void)
> +{
> +    static const struct x86_cpu_id models[] =3D {
> +        /* Apollo Lake */
> +        INTEL_FAM6_MODEL(0x5C),
> +        /* Ice Lake */
> +        INTEL_FAM6_MODEL(0x6A),
> +        INTEL_FAM6_MODEL(0x6C),

Intel patch for Linux only adds model 0x6a, not 0x6c. Did we manage to
reproduce on 0x6c? Which patch is more correct? Surely we are on the
safer side.

> +        /* Lunar Lake */
> +        INTEL_FAM6_MODEL(0xBD),
> +        { }
> +    };
> +#undef INTEL_FAM6_MODEL
> +
> +    if ( boot_cpu_has(X86_FEATURE_MONITOR) && !force_mwait_ipi_wakeup &&
> +         x86_match_cpu(models) )
> +    {
> +        printk(XENLOG_WARNING
> +               "Forcing IPI MWAIT wakeup due to CPU erratum\n");
> +        force_mwait_ipi_wakeup =3D true;
> +    }
> +}
> +
>  /*
>   * P4 Xeon errata 037 workaround.
>   * Hardware prefetcher may cause stale data to be loaded into the cache.
> @@ -406,6 +443,8 @@ static void Intel_errata_workarounds(struct cpuinfo_x=
86 *c)
>                 __set_bit(X86_FEATURE_CLFLUSH_MONITOR, c->x86_capability)=
;
>
>         probe_c3_errata(c);
> +       if (c =3D=3D &boot_cpu_data)
> +               probe_mwait_errata();
>  }
>
>
> diff --git a/xen/arch/x86/include/asm/mwait.h b/xen/arch/x86/include/asm/=
mwait.h
> index 000a692f6d19..c52cd3f51011 100644
> --- a/xen/arch/x86/include/asm/mwait.h
> +++ b/xen/arch/x86/include/asm/mwait.h
> @@ -13,6 +13,9 @@
>
>  #define MWAIT_ECX_INTERRUPT_BREAK      0x1
>
> +/* Force sending of a wakeup IPI regardless of mwait usage. */
> +extern bool force_mwait_ipi_wakeup;
> +
>  void mwait_idle_with_hints(unsigned int eax, unsigned int ecx);
>  #ifdef CONFIG_INTEL
>  bool mwait_pc10_supported(void);

Frediano

