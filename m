Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E1A6E3178
	for <lists+xen-devel@lfdr.de>; Sat, 15 Apr 2023 15:00:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521453.810157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnfUM-0000oW-LV; Sat, 15 Apr 2023 12:58:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521453.810157; Sat, 15 Apr 2023 12:58:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnfUM-0000mc-Ih; Sat, 15 Apr 2023 12:58:46 +0000
Received: by outflank-mailman (input) for mailman id 521453;
 Sat, 15 Apr 2023 12:58:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PlBa=AG=gmail.com=brgerst@srs-se1.protection.inumbo.net>)
 id 1pnfUL-0000mW-De
 for xen-devel@lists.xenproject.org; Sat, 15 Apr 2023 12:58:45 +0000
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [2607:f8b0:4864:20::112d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f4959f2-db8d-11ed-b21e-6b7b168915f2;
 Sat, 15 Apr 2023 14:58:42 +0200 (CEST)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-54c12009c30so485649017b3.9
 for <xen-devel@lists.xenproject.org>; Sat, 15 Apr 2023 05:58:42 -0700 (PDT)
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
X-Inumbo-ID: 3f4959f2-db8d-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681563521; x=1684155521;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ccV6fJmLsZscVpXweMcEv4sovH+IDrkvejv50k6gs/U=;
        b=BSOaYfaXyd5Wb+epLfvjrJB5ddMbSfuRSPgkDv/0OOsO8ij2hFGojnuviqXm0GCrkP
         ID2hBr77xwAaGcKnrXJiZAUdBojhzD8cglmd8qXgd51iUqdS7A9NAWUQz0MUF5ZcciE8
         AWz1SY3aKamn3My6fXKs/8E5eqVabut4SfZKc0c5sbIlrZyG34ztRaxzO3zCWgWJeeks
         vL5yfHXHE0t7DNIuTqx162KoYvLaNpuXLEhcNNNv20NmCKzlwGF6mcKsLN10ua6WOBit
         5o9zCg+9j1R+WkmMZNRoFuK0k+WfhwAjMsbRMXWBbGHiHnx9KcILf1NV5DEtKeNZyNxV
         c60w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681563521; x=1684155521;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ccV6fJmLsZscVpXweMcEv4sovH+IDrkvejv50k6gs/U=;
        b=lDGLnOAXcncqxY8ebXApQU5/yMSxnvxXf6MmbHA7amZ2k8YbMl/HcgDkpNESKv5K4g
         sUmcPqeUj1L/ZkQQwgw3MAVi4bKRRuYKkAHQe7novFJKW33ZLXOmFWE2xxARfwj3xcrL
         XrxRRI7gp7CLY7Do47ia3PEi1YDvr0DAgOj0idHGUpmcHsF7KQI2flDFSRpHBoo8tFkR
         9nzkB8JcmMJeU2PNRSsDqIdanuhPKOrph9SNgeJoQ6FZDL22127f8eqY/zT5TboaEg79
         GnkM8ZoL5v32VJZEKx1KfrrgbwwyY8e3u+Da32qPI197FSKEtVRBDLO9JPHOw3L+7m2q
         WZjQ==
X-Gm-Message-State: AAQBX9dlN3fcijVBrFxZ3WneJHabvgsbcnJSliECeO/ZKG3h/CZgyS1n
	7Ihx1H8ri6PssO1OEYyGLCwIzmYhcHfUDOlvzw==
X-Google-Smtp-Source: AKy350bkbiaOTV48G/m6wg5f7oTu79ZcJL2xRJuRL2it4F9Xsb2JgTwgmruSWgxfXHK3zLR53InjScARyCku/VQAIuk=
X-Received: by 2002:a81:b245:0:b0:54f:b721:5325 with SMTP id
 q66-20020a81b245000000b0054fb7215325mr5587058ywh.1.1681563521186; Sat, 15 Apr
 2023 05:58:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230414225551.858160935@linutronix.de> <20230414232310.382005483@linutronix.de>
In-Reply-To: <20230414232310.382005483@linutronix.de>
From: Brian Gerst <brgerst@gmail.com>
Date: Sat, 15 Apr 2023 08:58:30 -0400
Message-ID: <CAMzpN2j4NbGGR=jfxpVVQwYCZ=hHOUKm3oBpw1WKGiTUJ73EXA@mail.gmail.com>
Subject: Re: [patch 19/37] x86/smpboot: Switch to hotplug core state synchronization
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, 
	David Woodhouse <dwmw@infradead.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Arjan van de Veen <arjan@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Paul McKenney <paulmck@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Sean Christopherson <seanjc@google.com>, Oleksandr Natalenko <oleksandr@natalenko.name>, 
	Paul Menzel <pmenzel@molgen.mpg.de>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
	Piotr Gorski <lucjan.lucjanov@gmail.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org, 
	David Woodhouse <dwmw@amazon.co.uk>, Usama Arif <usama.arif@bytedance.com>, 
	Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	linux-csky@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-mips@vger.kernel.org, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	linux-parisc@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Sabin Rapan <sabrapan@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 14, 2023 at 7:44=E2=80=AFPM Thomas Gleixner <tglx@linutronix.de=
> wrote:
>
> The new AP state tracking and synchronization mechanism in the CPU hotplu=
g
> core code allows to remove quite some x86 specific code:
>
>   1) The AP alive synchronization based on cpumasks
>
>   2) The decision whether an AP can be brought up again
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Cc: xen-devel@lists.xenproject.org
> ---
>  arch/x86/Kconfig           |    1
>  arch/x86/include/asm/smp.h |    7 +
>  arch/x86/kernel/smp.c      |    1
>  arch/x86/kernel/smpboot.c  |  159 ++++++++++----------------------------=
-------
>  arch/x86/xen/smp_hvm.c     |   16 +---
>  arch/x86/xen/smp_pv.c      |   39 ++++++-----
>  6 files changed, 72 insertions(+), 151 deletions(-)
>
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -272,6 +272,7 @@ config X86
>         select HAVE_UNSTABLE_SCHED_CLOCK
>         select HAVE_USER_RETURN_NOTIFIER
>         select HAVE_GENERIC_VDSO
> +       select HOTPLUG_CORE_SYNC_FULL           if SMP
>         select HOTPLUG_SMT                      if SMP
>         select IRQ_FORCED_THREADING
>         select NEED_PER_CPU_EMBED_FIRST_CHUNK
> --- a/arch/x86/include/asm/smp.h
> +++ b/arch/x86/include/asm/smp.h
> @@ -38,6 +38,8 @@ struct smp_ops {
>         void (*crash_stop_other_cpus)(void);
>         void (*smp_send_reschedule)(int cpu);
>
> +       void (*cleanup_dead_cpu)(unsigned cpu);
> +       void (*poll_sync_state)(void);
>         int (*cpu_up)(unsigned cpu, struct task_struct *tidle);
>         int (*cpu_disable)(void);
>         void (*cpu_die)(unsigned int cpu);
> @@ -90,7 +92,8 @@ static inline int __cpu_disable(void)
>
>  static inline void __cpu_die(unsigned int cpu)
>  {
> -       smp_ops.cpu_die(cpu);
> +       if (smp_ops.cpu_die)
> +               smp_ops.cpu_die(cpu);
>  }
>
>  static inline void play_dead(void)
> @@ -122,8 +125,6 @@ void native_smp_cpus_done(unsigned int m
>  int common_cpu_up(unsigned int cpunum, struct task_struct *tidle);
>  int native_cpu_up(unsigned int cpunum, struct task_struct *tidle);
>  int native_cpu_disable(void);
> -int common_cpu_die(unsigned int cpu);
> -void native_cpu_die(unsigned int cpu);
>  void hlt_play_dead(void);
>  void native_play_dead(void);
>  void play_dead_common(void);
> --- a/arch/x86/kernel/smp.c
> +++ b/arch/x86/kernel/smp.c
> @@ -269,7 +269,6 @@ struct smp_ops smp_ops =3D {
>         .smp_send_reschedule    =3D native_smp_send_reschedule,
>
>         .cpu_up                 =3D native_cpu_up,
> -       .cpu_die                =3D native_cpu_die,
>         .cpu_disable            =3D native_cpu_disable,
>         .play_dead              =3D native_play_dead,
>
> --- a/arch/x86/kernel/smpboot.c
> +++ b/arch/x86/kernel/smpboot.c
> @@ -57,6 +57,7 @@
>  #include <linux/pgtable.h>
>  #include <linux/overflow.h>
>  #include <linux/stackprotector.h>
> +#include <linux/cpuhotplug.h>
>
>  #include <asm/acpi.h>
>  #include <asm/cacheinfo.h>
> @@ -101,9 +102,6 @@ EXPORT_PER_CPU_SYMBOL(cpu_die_map);
>  DEFINE_PER_CPU_READ_MOSTLY(struct cpuinfo_x86, cpu_info);
>  EXPORT_PER_CPU_SYMBOL(cpu_info);
>
> -/* All of these masks are initialized in setup_cpu_local_masks() */
> -static cpumask_var_t cpu_initialized_mask;
> -static cpumask_var_t cpu_callout_mask;
>  /* Representing CPUs for which sibling maps can be computed */
>  static cpumask_var_t cpu_sibling_setup_mask;
>
> @@ -169,8 +167,8 @@ static void smp_callin(void)
>         int cpuid =3D smp_processor_id();
>
>         /*
> -        * If waken up by an INIT in an 82489DX configuration
> -        * cpu_callout_mask guarantees we don't get here before an
> +        * If waken up by an INIT in an 82489DX configuration the alive
> +        * synchronization guarantees we don't get here before an
>          * INIT_deassert IPI reaches our local APIC, so it is now safe to
>          * touch our local APIC.
>          *
> @@ -216,17 +214,6 @@ static void ap_calibrate_delay(void)
>         cpu_data(smp_processor_id()).loops_per_jiffy =3D loops_per_jiffy;
>  }
>
> -static void wait_for_master_cpu(int cpu)
> -{
> -       /*
> -        * Wait for release by control CPU before continuing with AP
> -        * initialization.
> -        */
> -       WARN_ON(cpumask_test_and_set_cpu(cpu, cpu_initialized_mask));
> -       while (!cpumask_test_cpu(cpu, cpu_callout_mask))
> -               cpu_relax();
> -}
> -
>  /*
>   * Activate a secondary processor.
>   */
> @@ -247,11 +234,10 @@ static void notrace start_secondary(void
>         cpu_init_exception_handling();
>
>         /*
> -        * Sync point with wait_cpu_initialized(). Sets AP in
> -        * cpu_initialized_mask and then waits for the control CPU
> -        * to release it.
> +        * Sync point with the hotplug core. Sets the sync state to ALIVE
> +        * and waits for the control CPU to release it.
>          */
> -       wait_for_master_cpu(raw_smp_processor_id());
> +       cpuhp_ap_sync_alive();
>
>         cpu_init();
>         rcu_cpu_starting(raw_smp_processor_id());
> @@ -285,7 +271,6 @@ static void notrace start_secondary(void
>         set_cpu_online(smp_processor_id(), true);
>         lapic_online();
>         unlock_vector_lock();
> -       cpu_set_state_online(smp_processor_id());
>         x86_platform.nmi_init();
>
>         /* enable local interrupts */
> @@ -736,9 +721,10 @@ static void impress_friends(void)
>          * Allow the user to impress friends.
>          */
>         pr_debug("Before bogomips\n");
> -       for_each_possible_cpu(cpu)
> -               if (cpumask_test_cpu(cpu, cpu_callout_mask))
> +       for_each_possible_cpu(cpu) {
> +               if (cpumask_test_cpu(cpu, cpu_online_mask))
>                         bogosum +=3D cpu_data(cpu).loops_per_jiffy;

This should be the same as for_each_online_cpu().

--
Brian Gerst

