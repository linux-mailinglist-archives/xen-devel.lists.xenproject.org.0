Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3502A568A65
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 16:00:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362271.592245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o95Zj-0001SJ-4W; Wed, 06 Jul 2022 14:00:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362271.592245; Wed, 06 Jul 2022 14:00:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o95Zj-0001PT-0B; Wed, 06 Jul 2022 14:00:19 +0000
Received: by outflank-mailman (input) for mailman id 362271;
 Wed, 06 Jul 2022 13:59:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vM8T=XL=gmail.com=rjwysocki@srs-se1.protection.inumbo.net>)
 id 1o95Z1-0000Wk-B5
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 13:59:35 +0000
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc9bcaa9-fd33-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 15:59:34 +0200 (CEST)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-3137316bb69so140642067b3.10
 for <xen-devel@lists.xenproject.org>; Wed, 06 Jul 2022 06:59:33 -0700 (PDT)
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
X-Inumbo-ID: dc9bcaa9-fd33-11ec-924f-1f966e50362f
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Onduqp6mjVbUTy8onn0jWt/mqpI9kGBQEYh+QUeZcBU=;
        b=3BzfFxCiTFPQ/pzeJcbUgBBMUJwnf/PxqYfknDjKqRp3DgDpr7v7oKYsa4X+Lc/mY3
         MDZ70WS8ulqxtiBV0i02dIezuqn9EWQhRdNS8Nqsr0GfQjPigYofsmWIUt2moq3Te2Wn
         O2+jyjUpenbU58TkTvl5FywWUnxKFMghgYw4IF1ixGafajlxi97p1Qjew0mytzEJTmy+
         6XThNQr11Qhwcz986EtXMgSbmGwy6ba/I8Gz2NnLNNGvvyCvC4VfYSnglm8TknuqvBbn
         Qi30kUBmfC3mwY1FT8s3ssQwnIeZjCnA/g72nIgyjeVW6faHengv6fBpqgoNqvz9H7n5
         k65g==
X-Gm-Message-State: AJIora/43qGKUrYB2nYJFlI0KBtSnCZlqOFb4mtKNU/cPkYej1BKJnCI
	WeHzgqLI8Agt37PsJiKGPDVZTmcTU1t0VPg0wX0=
X-Google-Smtp-Source: AGRyM1tNbC/Hml4tsQcA7xFkjwPTBe4V9sculTi4g4WqVg8ltnNA+flCFfg0CHpb2ZdV5OvqewQ30xyxgoEo0qXCWHo=
X-Received: by 2002:a81:1b97:0:b0:2db:640f:49d8 with SMTP id
 b145-20020a811b97000000b002db640f49d8mr45117410ywb.326.1657115972382; Wed, 06
 Jul 2022 06:59:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220608142723.103523089@infradead.org> <20220608144516.998681585@infradead.org>
In-Reply-To: <20220608144516.998681585@infradead.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 6 Jul 2022 15:59:21 +0200
Message-ID: <CAJZ5v0jSfvUoReFHjA5A+brExnnEKidak-GnjTbY0CKoaWpGVQ@mail.gmail.com>
Subject: Re: [PATCH 17/36] acpi_idle: Remove tracing
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
	pv-drivers@vmware.com, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Chris Zankel <chris@zankel.net>, jcmvbkbc@gmail.com, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, 
	Anup Patel <anup@brainfault.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jon Hunter <jonathanh@nvidia.com>, Jacob Pan <jacob.jun.pan@linux.intel.com>, 
	Arnd Bergmann <arnd@arndb.de>, Yury Norov <yury.norov@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
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
> All the idle routines are called with RCU disabled, as such there must
> not be any tracing inside.
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

This actually does some additional code duplication cleanup which
would be good to mention in the changelog.  Or even move to a separate
patch for that matter.

Otherwise LGTM.

> ---
>  drivers/acpi/processor_idle.c |   24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
>
> --- a/drivers/acpi/processor_idle.c
> +++ b/drivers/acpi/processor_idle.c
> @@ -108,8 +108,8 @@ static const struct dmi_system_id proces
>  static void __cpuidle acpi_safe_halt(void)
>  {
>         if (!tif_need_resched()) {
> -               safe_halt();
> -               local_irq_disable();
> +               raw_safe_halt();
> +               raw_local_irq_disable();
>         }
>  }
>
> @@ -524,16 +524,21 @@ static int acpi_idle_bm_check(void)
>         return bm_status;
>  }
>
> -static void wait_for_freeze(void)
> +static __cpuidle void io_idle(unsigned long addr)
>  {
> +       /* IO port based C-state */
> +       inb(addr);
> +
>  #ifdef CONFIG_X86
>         /* No delay is needed if we are in guest */
>         if (boot_cpu_has(X86_FEATURE_HYPERVISOR))
>                 return;
>  #endif
> -       /* Dummy wait op - must do something useless after P_LVL2 read
> -          because chipsets cannot guarantee that STPCLK# signal
> -          gets asserted in time to freeze execution properly. */
> +       /*
> +        * Dummy wait op - must do something useless after P_LVL2 read
> +        * because chipsets cannot guarantee that STPCLK# signal
> +        * gets asserted in time to freeze execution properly.
> +        */
>         inl(acpi_gbl_FADT.xpm_timer_block.address);
>  }
>
> @@ -553,9 +558,7 @@ static void __cpuidle acpi_idle_do_entry
>         } else if (cx->entry_method == ACPI_CSTATE_HALT) {
>                 acpi_safe_halt();
>         } else {
> -               /* IO port based C-state */
> -               inb(cx->address);
> -               wait_for_freeze();
> +               io_idle(cx->address);
>         }
>
>         perf_lopwr_cb(false);
> @@ -577,8 +580,7 @@ static int acpi_idle_play_dead(struct cp
>                 if (cx->entry_method == ACPI_CSTATE_HALT)
>                         safe_halt();
>                 else if (cx->entry_method == ACPI_CSTATE_SYSTEMIO) {
> -                       inb(cx->address);
> -                       wait_for_freeze();
> +                       io_idle(cx->address);
>                 } else
>                         return -ENODEV;
>
>
>

