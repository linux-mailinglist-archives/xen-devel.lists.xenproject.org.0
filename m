Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 768A043DE51
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 11:59:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217774.377940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg2C5-0000cB-F0; Thu, 28 Oct 2021 09:59:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217774.377940; Thu, 28 Oct 2021 09:59:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg2C5-0000aP-Bj; Thu, 28 Oct 2021 09:59:33 +0000
Received: by outflank-mailman (input) for mailman id 217774;
 Thu, 28 Oct 2021 09:59:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3vD9=PQ=gmail.com=rjwysocki@srs-us1.protection.inumbo.net>)
 id 1mg2C4-0000aJ-Ey
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 09:59:32 +0000
Received: from mail-ot1-f47.google.com (unknown [209.85.210.47])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bee3b0c0-37d5-11ec-849b-12813bfff9fa;
 Thu, 28 Oct 2021 09:59:31 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 v2-20020a05683018c200b0054e3acddd91so7801421ote.8
 for <xen-devel@lists.xenproject.org>; Thu, 28 Oct 2021 02:59:31 -0700 (PDT)
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
X-Inumbo-ID: bee3b0c0-37d5-11ec-849b-12813bfff9fa
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YApfc+rtORQHprN7aKpnZNhl8TPl/VtOJQI8beQJmCY=;
        b=LAm2gKCwm1SkWg5dM9bC0xZ2RyIBWOvX2+7d2iOMfn0lEopdx5kywBvUFB4l74IJli
         RtCo+7BEltzjHoQkbrzpcBh7RbgN68HWD9nz/lH3lKRJzCzoPwzy2TBhFYd/LIYwsu/X
         ywP7HPrMmixKhiKj9q8EONTc+Fwn0EuMevfrM0p0E7QdUzl6sIYJlJjBPZb4IL5SLOqp
         +n9m/AQChd6KO2Hca1nIo1XegNjIn15KwwhweDUd0QmqQIvMVEy0GYRrufpwW+m8KYN4
         JqshFGuHcR2EwgvA/H/IC4IYW7L0wx97RGoY3WWfXduevCIDLmH/PqLgP3zOUQJPBvBO
         M/nA==
X-Gm-Message-State: AOAM533c8ZqXnNGn6Nwgb9IcF6Deh4dGkjN98kmkgZpCMaUpJy4TmBLV
	nQ4I4jUEbAvKD6zv8tIn9IB41EVMlV75SAjVPJU=
X-Google-Smtp-Source: ABdhPJzD4cm7tn60vkyopY5CUMxUc9huwAUhS0IgxTyGcJq7Km0Bm+8fuUNsdZomFIBYzzQsRecVralPmU+TS+34zNY=
X-Received: by 2002:a9d:65c1:: with SMTP id z1mr2427957oth.198.1635415170827;
 Thu, 28 Oct 2021 02:59:30 -0700 (PDT)
MIME-Version: 1.0
References: <20211027211715.12671-1-digetx@gmail.com> <20211027211715.12671-9-digetx@gmail.com>
In-Reply-To: <20211027211715.12671-9-digetx@gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 28 Oct 2021 11:59:18 +0200
Message-ID: <CAJZ5v0gpu2ezMhWr=grg6M8aWAx58DQozbXHoZaiPqUaZxJi4Q@mail.gmail.com>
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
	Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>, 
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

Also I'm wondering why these particular numbers were chosen, here and above?

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
> +       /**
> +        * @cb_data:
> +        *
> +        * User data included in callback's argument.
> +        */

And here I would document the structure fields in the main kerneldoc
comment above.

As is, it is a bit hard to grasp the whole definition.

> +       void *cb_data;
> +
> +       /**
> +        * @power_off_cb:
> +        *
> +        * Callback that should turn off machine.  Inactive if NULL.
> +        */
> +       void (*power_off_cb)(struct power_off_data *data);
> +
> +       /**
> +        * @power_off_prepare_cb:
> +        *
> +        * Power-off preparation callback.  All power-off preparation callbacks
> +        * are invoked before @restart_cb.  Inactive if NULL.
> +        */
> +       void (*power_off_prepare_cb)(struct power_off_prep_data *data);
> +
> +       /**
> +        * @power_off_priority:
> +        *
> +        * Power-off callback priority, must be unique.  Zero value is
> +        * reassigned to default priority.  Inactive if @power_off_cb is NULL.
> +        */
> +       int power_off_priority;
> +
> +       /**
> +        * @power_off_chaining_allowed:
> +        *
> +        * False if callbacks execution should stop when @power_off_cb fails
> +        * to power off machine.  True if further lower priority power-off
> +        * callback should be executed.
> +        */
> +       bool power_off_chaining_allowed;
> +
> +       /**
> +        * @restart_cb:
> +        *
> +        * Callback that should reboot machine.  Inactive if NULL.
> +        */
> +       void (*restart_cb)(struct restart_data *data);
> +
> +       /**
> +        * @restart_priority:
> +        *
> +        * Restart callback priority, must be unique.  Zero value is reassigned
> +        * to default priority.  Inactive if @restart_cb is NULL.
> +        */
> +       int restart_priority;
> +
> +       /**
> +        * @reboot_prepare_cb:
> +        *
> +        * Reboot preparation callback.  All reboot preparation callbacks are
> +        * invoked before @restart_cb.  Inactive if NULL.
> +        */
> +       void (*reboot_prepare_cb)(struct reboot_prep_data *data);
> +
> +       /**
> +        * @priv:
> +        *
> +        * Internal data.  Shouldn't be touched.
> +        */
> +       const struct power_handler_private_data priv;
> +};

