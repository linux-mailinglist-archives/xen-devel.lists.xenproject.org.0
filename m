Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B033243DE37
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 11:53:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217765.377929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg26K-0008HL-MY; Thu, 28 Oct 2021 09:53:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217765.377929; Thu, 28 Oct 2021 09:53:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg26K-0008EN-J2; Thu, 28 Oct 2021 09:53:36 +0000
Received: by outflank-mailman (input) for mailman id 217765;
 Thu, 28 Oct 2021 09:53:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3vD9=PQ=gmail.com=rjwysocki@srs-us1.protection.inumbo.net>)
 id 1mg26I-0008EG-8r
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 09:53:34 +0000
Received: from mail-ot1-f52.google.com (unknown [209.85.210.52])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e9552aec-37d4-11ec-849b-12813bfff9fa;
 Thu, 28 Oct 2021 09:53:33 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 l16-20020a9d6a90000000b0054e7ab56f27so7746554otq.12
 for <xen-devel@lists.xenproject.org>; Thu, 28 Oct 2021 02:53:33 -0700 (PDT)
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
X-Inumbo-ID: e9552aec-37d4-11ec-849b-12813bfff9fa
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uz31be5RzrXoa4uAxe1xyKZoIQd0wtsVVy1gZjyOGeo=;
        b=X+5dvuAmn9czEBhw6oatav5UeJL0vhrLj4q9FFVTO6GKkY+w6ZdTGQelk9hohVgmIY
         Yd/PMAb9qN2fX6rpO+Fpzm+gR/kyQtBYy1xKP0BVFyiF6JMgcVJ/jonAcOKEc5RMYN84
         bVyCtxx6L18Oix7FtsZay+26Tgxusro5DRWzimEhh0BkHauB34MF0IJQ0cJdxI8ndFpk
         tT4Q+r4ixZ5Ah5FISSTxYHxCacenL8jcQmXEuNicUbvPowtwmco9S3DHl+sUlxlFu2M/
         C/l6w+xpTjC03APqBD9r6g78sDJCOGZzbBq8lQX028BB5WtVKYbius/6Y/dmsd7As+UZ
         GHEw==
X-Gm-Message-State: AOAM533cQ7hhthlSJGrjUOE6zfetNM13gK+S35NHNSw5caDZ5bIiPyb6
	6VPoubcouKlXxtTAD28NN1Ei8sZ+IjxqaC1JJZo=
X-Google-Smtp-Source: ABdhPJzOhFRTFEQQ+n5tEP/bBwTFb0889hJMVw20FWNyFAcerxAE3whFQ+5AhX1ip3T9ogNIhdu7wA8+/uN9VNCEoX8=
X-Received: by 2002:a9d:65c1:: with SMTP id z1mr2411564oth.198.1635414812552;
 Thu, 28 Oct 2021 02:53:32 -0700 (PDT)
MIME-Version: 1.0
References: <20211027211715.12671-1-digetx@gmail.com> <20211027211715.12671-9-digetx@gmail.com>
In-Reply-To: <20211027211715.12671-9-digetx@gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 28 Oct 2021 11:53:20 +0200
Message-ID: <CAJZ5v0jMdSjmkswzu18LSxcNk+k92Oz5XFFXmu-h=W8aPP4Oig@mail.gmail.com>
Subject: Re: [PATCH v2 08/45] kernel: Add combined power-off+restart handler
 call chain API
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Lee Jones <lee.jones@linaro.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Guenter Roeck <linux@roeck-us.net>, Russell King <linux@armlinux.org.uk>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@linux-m68k.org>, 
	Joshua Thompson <funaho@jurai.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>, 
	Vincent Chen <deanbo422@gmail.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
	Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "the arch/x86 maintainers" <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Len Brown <lenb@kernel.org>, 
	Santosh Shilimkar <ssantosh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Tony Lindgren <tony@atomide.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, Pavel Machek <pavel@ucw.cz>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-csky@vger.kernel.org, 
	linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-riscv@lists.infradead.org, 
	Linux-sh list <linux-sh@vger.kernel.org>, xen-devel@lists.xenproject.org, 
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>, 
	Linux OMAP Mailing List <linux-omap@vger.kernel.org>, openbmc@lists.ozlabs.org, 
	linux-tegra <linux-tegra@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 27, 2021 at 11:18 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> SoC platforms often have multiple options of how to perform system's
> power-off and restart operations. Meanwhile today's kernel is limited to
> a single option. Add combined power-off+restart handler call chain API,
> which is inspired by the restart API. The new API provides both power-off
> and restart functionality.
>
> The old pm_power_off method will be kept around till all users are
> converted to the new API.
>
> Current restart API will be replaced by the new unified API since
> new API is its superset. The restart functionality of the power-handler
> API is built upon the existing restart-notifier APIs.
>
> In order to ease conversion to the new API, convenient helpers are added
> for the common use-cases. They will reduce amount of boilerplate code and
> remove global variables. These helpers preserve old behaviour for cases
> where only one power-off handler is executed, this is what existing
> drivers want, and thus, they could be easily converted to the new API.
> Users of the new API should explicitly enable power-off chaining by
> setting corresponding flag of the power_handler structure.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  include/linux/reboot.h   | 176 +++++++++++-
>  kernel/power/hibernate.c |   2 +-
>  kernel/reboot.c          | 601 ++++++++++++++++++++++++++++++++++++++-
>  3 files changed, 768 insertions(+), 11 deletions(-)
>
> diff --git a/include/linux/reboot.h b/include/linux/reboot.h
> index b7fa25726323..0ec835338c27 100644
> --- a/include/linux/reboot.h
> +++ b/include/linux/reboot.h
> @@ -8,10 +8,16 @@
>
>  struct device;
>
> -#define SYS_DOWN       0x0001  /* Notify of system down */
> -#define SYS_RESTART    SYS_DOWN
> -#define SYS_HALT       0x0002  /* Notify of system halt */
> -#define SYS_POWER_OFF  0x0003  /* Notify of system power off */
> +enum reboot_prepare_mode {
> +       SYS_DOWN = 1,           /* Notify of system down */
> +       SYS_RESTART = SYS_DOWN,
> +       SYS_HALT,               /* Notify of system halt */
> +       SYS_POWER_OFF,          /* Notify of system power off */
> +};
> +
> +#define RESTART_PRIO_RESERVED          0
> +#define RESTART_PRIO_DEFAULT           128
> +#define RESTART_PRIO_HIGH              192
>
>  enum reboot_mode {
>         REBOOT_UNDEFINED = -1,
> @@ -49,6 +55,167 @@ int register_restart_handler(struct notifier_block *);
>  int unregister_restart_handler(struct notifier_block *);
>  void do_kernel_restart(char *cmd);
>
> +/*
> + * Unified poweroff + restart API.
> + */
> +
> +#define POWEROFF_PRIO_RESERVED         0
> +#define POWEROFF_PRIO_PLATFORM         1
> +#define POWEROFF_PRIO_DEFAULT          128
> +#define POWEROFF_PRIO_HIGH             192
> +#define POWEROFF_PRIO_FIRMWARE         224
> +
> +enum poweroff_mode {
> +       POWEROFF_NORMAL = 0,
> +       POWEROFF_PREPARE,
> +};
> +
> +struct power_off_data {
> +       void *cb_data;
> +};
> +
> +struct power_off_prep_data {
> +       void *cb_data;
> +};
> +
> +struct restart_data {
> +       void *cb_data;
> +       const char *cmd;
> +       enum reboot_mode mode;
> +};
> +
> +struct reboot_prep_data {
> +       void *cb_data;
> +       const char *cmd;
> +       enum reboot_prepare_mode mode;
> +};
> +
> +struct power_handler_private_data {
> +       struct notifier_block reboot_prep_nb;
> +       struct notifier_block power_off_nb;
> +       struct notifier_block restart_nb;
> +       void (*trivial_power_off_cb)(void);
> +       void (*simple_power_off_cb)(void *data);
> +       void *simple_power_off_cb_data;
> +       bool registered;
> +};
> +
> +/**
> + * struct power_handler - Machine power-off + restart handler
> + *
> + * Describes power-off and restart handlers which are invoked by kernel
> + * to power off or restart this machine.  Supports prioritized chaining for
> + * both restart and power-off handlers.  Callback's priority must be unique.
> + * Intended to be used by device drivers that are responsible for restarting
> + * and powering off hardware which kernel is running on.
> + *
> + * Struct power_handler can be static.  Members of this structure must not be
> + * altered while handler is registered.
> + *
> + * Fill the structure members and pass it to register_power_handler().
> + */
> +struct power_handler {

The name of this structure is too generic IMV.  There are many things
that it might apply to in principle.

What about calling power_off_handler or sys_off_handler as it need not
be about power at all?

