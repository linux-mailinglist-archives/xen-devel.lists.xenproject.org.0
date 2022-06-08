Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A77CF543BD8
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jun 2022 20:57:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.344335.569880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nz0r1-0008Si-LA; Wed, 08 Jun 2022 18:56:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 344335.569880; Wed, 08 Jun 2022 18:56:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nz0r1-0008MW-Fj; Wed, 08 Jun 2022 18:56:31 +0000
Received: by outflank-mailman (input) for mailman id 344335;
 Wed, 08 Jun 2022 18:13:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Gkb=WP=gmail.com=rjwysocki@srs-se1.protection.inumbo.net>)
 id 1nz0BE-0002Xq-Qb
 for xen-devel@lists.xenproject.org; Wed, 08 Jun 2022 18:13:20 +0000
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id acac7942-e756-11ec-bd2c-47488cf2e6aa;
 Wed, 08 Jun 2022 20:13:19 +0200 (CEST)
Received: by mail-yb1-f182.google.com with SMTP id x187so10310615ybe.2
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jun 2022 11:13:19 -0700 (PDT)
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
X-Inumbo-ID: acac7942-e756-11ec-bd2c-47488cf2e6aa
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZQePx5uIM1fUidMEiJVM5nuB6ZzPVeEu38qEpc1UrpE=;
        b=mrMV3XaTw9M5veahVv7TjH6RnhOai37m5qBTBdlGVb2XLE/MlWrKSEl9yusFHm7W9h
         TPsGW58oMDC2mRARmhNJFZT3IukmWnDVB3uFZPEm/L2IaL9UVjmHDurHA37ARDot1rLj
         d8JhK8u5Q/comRUPCCa/1b/m8S+EtgpgcP8kemO17nCexM2rKOicIjL7YpFbeXqCGxzq
         8LFKQYnr/W10feKXiXbVS9G1Yab3mrMQlMsGHfiUgBdE2rLqbxNpcOz/5LuaTe4fd+x6
         sop/fjBqBnHk1LKAwUMVjGWTGBzE5s6Hdo9pdSZ+ob0LnlPlAt/N16C3UfwBxV0EUIYa
         11Ww==
X-Gm-Message-State: AOAM532+P7ZwPtWYlNdbA2vmZD7spYIkZBoiaeUiYXb8yHHBrx5L2Gfk
	3rAop5zoYN59cjcmeX8BJtzMUWopkzMynz+Goe4=
X-Google-Smtp-Source: ABdhPJyd1CrHem+vVK3IGyX/t5xH0MretwaFF4fsfRB0Td7tNKI/Gb3F1VH58WOF1ULS3yEBVcV2AFovGma6uhuJi5U=
X-Received: by 2002:a5b:4a:0:b0:663:7c5b:a5ba with SMTP id e10-20020a5b004a000000b006637c5ba5bamr17352131ybp.81.1654711998678;
 Wed, 08 Jun 2022 11:13:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220608142723.103523089@infradead.org> <20220608144516.047149313@infradead.org>
In-Reply-To: <20220608144516.047149313@infradead.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 8 Jun 2022 20:13:07 +0200
Message-ID: <CAJZ5v0g=jcRkMhVoNkZzSaM0viK0C7WN6T5C1_3VQ5GGGQkSzQ@mail.gmail.com>
Subject: Re: [PATCH 02/36] x86/idle: Replace x86_idle with a static_call
To: Peter Zijlstra <peterz@infradead.org>
Cc: rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, 
	vgupta@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>, ulli.kroll@googlemail.com, 
	Linus Walleij <linus.walleij@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, Tony Lindgren <tony@atomide.com>, 
	Kevin Hilman <khilman@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, bcain@quicinc.com, 
	Huacai Chen <chenhuacai@kernel.org>, kernel@xen0n.name, 
	Geert Uytterhoeven <geert@linux-m68k.org>, sammy@sammy.net, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, dinguyen@kernel.org, jonas@southpole.se, 
	stefan.kristiansson@saunalahti.fi, Stafford Horne <shorne@gmail.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
	Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, David Miller <davem@davemloft.net>, 
	Richard Weinberger <richard@nod.at>, anton.ivanov@cambridgegreys.com, 
	Johannes Berg <johannes@sipsolutions.net>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "the arch/x86 maintainers" <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, acme@kernel.org, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, jolsa@kernel.org, namhyung@kernel.org, 
	Juergen Gross <jgross@suse.com>, srivatsa@csail.mit.edu, amakhalov@vmware.com, 
	pv-drivers@vmware.com, Boris Ostrovsky <boris.ostrovsky@oracle.com>, chris@zankel.net, 
	jcmvbkbc@gmail.com, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Pavel Machek <pavel@ucw.cz>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, lpieralisi@kernel.org, 
	Sudeep Holla <sudeep.holla@arm.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <bjorn.andersson@linaro.org>, Anup Patel <anup@brainfault.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, 
	Jacob Pan <jacob.jun.pan@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, 
	Yury Norov <yury.norov@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Steven Rostedt <rostedt@goodmis.org>, 
	Petr Mladek <pmladek@suse.com>, senozhatsky@chromium.org, 
	John Ogness <john.ogness@linutronix.de>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Frederic Weisbecker <frederic@kernel.org>, quic_neeraju@quicinc.com, 
	Josh Triplett <josh@joshtriplett.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Joel Fernandes <joel@joelfernandes.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Benjamin Segall <bsegall@google.com>, 
	Mel Gorman <mgorman@suse.de>, Daniel Bristot de Oliveira <bristot@redhat.com>, vschneid@redhat.com, 
	jpoimboe@kernel.org, linux-alpha@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-snps-arc@lists.infradead.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux OMAP Mailing List <linux-omap@vger.kernel.org>, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org, 
	linux-m68k <linux-m68k@lists.linux-m68k.org>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, openrisc@lists.librecores.org, 
	Parisc List <linux-parisc@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-s390@vger.kernel.org, 
	Linux-sh list <linux-sh@vger.kernel.org>, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	virtualization@lists.linux-foundation.org, xen-devel@lists.xenproject.org, 
	linux-xtensa@linux-xtensa.org, 
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	linux-clk <linux-clk@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
	linux-tegra <linux-tegra@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, 
	rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 8, 2022 at 4:47 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> Typical boot time setup; no need to suffer an indirect call for that.
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Reviewed-by: Frederic Weisbecker <frederic@kernel.org>

Reviewed-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

> ---
>  arch/x86/kernel/process.c |   50 +++++++++++++++++++++++++---------------------
>  1 file changed, 28 insertions(+), 22 deletions(-)
>
> --- a/arch/x86/kernel/process.c
> +++ b/arch/x86/kernel/process.c
> @@ -24,6 +24,7 @@
>  #include <linux/cpuidle.h>
>  #include <linux/acpi.h>
>  #include <linux/elf-randomize.h>
> +#include <linux/static_call.h>
>  #include <trace/events/power.h>
>  #include <linux/hw_breakpoint.h>
>  #include <asm/cpu.h>
> @@ -692,7 +693,23 @@ void __switch_to_xtra(struct task_struct
>  unsigned long boot_option_idle_override = IDLE_NO_OVERRIDE;
>  EXPORT_SYMBOL(boot_option_idle_override);
>
> -static void (*x86_idle)(void);
> +/*
> + * We use this if we don't have any better idle routine..
> + */
> +void __cpuidle default_idle(void)
> +{
> +       raw_safe_halt();
> +}
> +#if defined(CONFIG_APM_MODULE) || defined(CONFIG_HALTPOLL_CPUIDLE_MODULE)
> +EXPORT_SYMBOL(default_idle);
> +#endif
> +
> +DEFINE_STATIC_CALL_NULL(x86_idle, default_idle);
> +
> +static bool x86_idle_set(void)
> +{
> +       return !!static_call_query(x86_idle);
> +}
>
>  #ifndef CONFIG_SMP
>  static inline void play_dead(void)
> @@ -715,28 +732,17 @@ void arch_cpu_idle_dead(void)
>  /*
>   * Called from the generic idle code.
>   */
> -void arch_cpu_idle(void)
> -{
> -       x86_idle();
> -}
> -
> -/*
> - * We use this if we don't have any better idle routine..
> - */
> -void __cpuidle default_idle(void)
> +void __cpuidle arch_cpu_idle(void)
>  {
> -       raw_safe_halt();
> +       static_call(x86_idle)();
>  }
> -#if defined(CONFIG_APM_MODULE) || defined(CONFIG_HALTPOLL_CPUIDLE_MODULE)
> -EXPORT_SYMBOL(default_idle);
> -#endif
>
>  #ifdef CONFIG_XEN
>  bool xen_set_default_idle(void)
>  {
> -       bool ret = !!x86_idle;
> +       bool ret = x86_idle_set();
>
> -       x86_idle = default_idle;
> +       static_call_update(x86_idle, default_idle);
>
>         return ret;
>  }
> @@ -859,20 +865,20 @@ void select_idle_routine(const struct cp
>         if (boot_option_idle_override == IDLE_POLL && smp_num_siblings > 1)
>                 pr_warn_once("WARNING: polling idle and HT enabled, performance may degrade\n");
>  #endif
> -       if (x86_idle || boot_option_idle_override == IDLE_POLL)
> +       if (x86_idle_set() || boot_option_idle_override == IDLE_POLL)
>                 return;
>
>         if (boot_cpu_has_bug(X86_BUG_AMD_E400)) {
>                 pr_info("using AMD E400 aware idle routine\n");
> -               x86_idle = amd_e400_idle;
> +               static_call_update(x86_idle, amd_e400_idle);
>         } else if (prefer_mwait_c1_over_halt(c)) {
>                 pr_info("using mwait in idle threads\n");
> -               x86_idle = mwait_idle;
> +               static_call_update(x86_idle, mwait_idle);
>         } else if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST)) {
>                 pr_info("using TDX aware idle routine\n");
> -               x86_idle = tdx_safe_halt;
> +               static_call_update(x86_idle, tdx_safe_halt);
>         } else
> -               x86_idle = default_idle;
> +               static_call_update(x86_idle, default_idle);
>  }
>
>  void amd_e400_c1e_apic_setup(void)
> @@ -925,7 +931,7 @@ static int __init idle_setup(char *str)
>                  * To continue to load the CPU idle driver, don't touch
>                  * the boot_option_idle_override.
>                  */
> -               x86_idle = default_idle;
> +               static_call_update(x86_idle, default_idle);
>                 boot_option_idle_override = IDLE_HALT;
>         } else if (!strcmp(str, "nomwait")) {
>                 /*
>
>

