Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2954F470877
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 19:20:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.244197.422372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvkV5-0006nc-KF; Fri, 10 Dec 2021 18:20:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 244197.422372; Fri, 10 Dec 2021 18:20:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvkV5-0006kv-GM; Fri, 10 Dec 2021 18:20:07 +0000
Received: by outflank-mailman (input) for mailman id 244197;
 Fri, 10 Dec 2021 18:20:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2dzg=Q3=gmail.com=rjwysocki@srs-se1.protection.inumbo.net>)
 id 1mvkV3-0006ev-QV
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 18:20:05 +0000
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com
 [209.85.161.44]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb747a9b-59e5-11ec-a74f-db008197e53d;
 Fri, 10 Dec 2021 19:20:04 +0100 (CET)
Received: by mail-oo1-f44.google.com with SMTP id
 w15-20020a4a9d0f000000b002c5cfa80e84so2595243ooj.5
 for <xen-devel@lists.xenproject.org>; Fri, 10 Dec 2021 10:20:04 -0800 (PST)
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
X-Inumbo-ID: cb747a9b-59e5-11ec-a74f-db008197e53d
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=otNvdkTkoV7wYQ8jKu5rR7dHo6vQCE5BmfrHPdMYTOI=;
        b=4BJDWz75nxCkv1l8VcO9qGsBppwao+2LMCsxohG7tgxn3CCzLMuNtqOE4MGnpt3Kh+
         05v3AQcgUVrJza7s7jG5hD6jON7kumXc3h/IiT6YPYS6D4gXw9p+O0jYzdtDgzR3LfQU
         crVKS6eMhrBhpNJ5zbg8eIZSiXPgfy3opedBVXZiydSTFbeTLeYgP03Uv79TcEsS0nWV
         9ZkWswqpUKb/HPnH8Xhe+40byT8WHxfrSLb/XgF/o409vBncH2ktk0A/awdnTmgqqDN/
         aKYLGoXzSIqTEZb48tOFumpkOiBK5b6a04jo6ViJ2EPFEMNlkE1MwYn85zEYa30lRecB
         XOzA==
X-Gm-Message-State: AOAM531TRMfvvz+ifJY1CSyjQ4vK1k1YI1wKNxFO8goOjGSCijEKcxlX
	JJMI5iPlB759qK7r6LKj1OkPdnT5+p1VgiBCEk8=
X-Google-Smtp-Source: ABdhPJwWhlgSTT1XO9DdsJeGtp3+qj/KLI9CFrQ1iXrm/9qKavB6UGr0uIjkNl6uj3XKEKq2VM+aZTVW+dl+zG+2Q+M=
X-Received: by 2002:a4a:1d82:: with SMTP id 124mr9074671oog.91.1639160403307;
 Fri, 10 Dec 2021 10:20:03 -0800 (PST)
MIME-Version: 1.0
References: <20211126180101.27818-1-digetx@gmail.com> <20211126180101.27818-4-digetx@gmail.com>
In-Reply-To: <20211126180101.27818-4-digetx@gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 10 Dec 2021 19:19:52 +0100
Message-ID: <CAJZ5v0jTJ3f7oUUR690PGaPJsxA8yzua9XDa8MONBHMzHnDfOQ@mail.gmail.com>
Subject: Re: [PATCH v4 03/25] notifier: Add atomic/blocking_notifier_has_unique_priority()
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@linux-m68k.org>, 
	Joshua Thompson <funaho@jurai.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Sebastian Reichel <sre@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Greentime Hu <green.hu@gmail.com>, 
	Vincent Chen <deanbo422@gmail.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
	Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "the arch/x86 maintainers" <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Santosh Shilimkar <ssantosh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck <linux@roeck-us.net>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	alankao@andestech.com, "K . C . Kuen-Chern Lin" <kclin@andestech.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-csky@vger.kernel.org, 
	linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-riscv@lists.infradead.org, 
	Linux-sh list <linux-sh@vger.kernel.org>, xen-devel@lists.xenproject.org, 
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	linux-tegra <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 26, 2021 at 7:02 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Add atomic/blocking_notifier_has_unique_priority() helpers which return
> true if given handler has unique priority.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  include/linux/notifier.h |  5 +++
>  kernel/notifier.c        | 69 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 74 insertions(+)
>
> diff --git a/include/linux/notifier.h b/include/linux/notifier.h
> index 924c9d7c8e73..2c4036f225e1 100644
> --- a/include/linux/notifier.h
> +++ b/include/linux/notifier.h
> @@ -175,6 +175,11 @@ int raw_notifier_call_chain_robust(struct raw_notifier_head *nh,
>
>  bool blocking_notifier_call_chain_is_empty(struct blocking_notifier_head *nh);
>
> +bool atomic_notifier_has_unique_priority(struct atomic_notifier_head *nh,
> +               struct notifier_block *nb);
> +bool blocking_notifier_has_unique_priority(struct blocking_notifier_head *nh,
> +               struct notifier_block *nb);
> +
>  #define NOTIFY_DONE            0x0000          /* Don't care */
>  #define NOTIFY_OK              0x0001          /* Suits me */
>  #define NOTIFY_STOP_MASK       0x8000          /* Don't call further */
> diff --git a/kernel/notifier.c b/kernel/notifier.c
> index b20cb7b9b1f0..7a325b742104 100644
> --- a/kernel/notifier.c
> +++ b/kernel/notifier.c
> @@ -122,6 +122,19 @@ static int notifier_call_chain_robust(struct notifier_block **nl,
>         return ret;
>  }
>
> +static int notifier_has_unique_priority(struct notifier_block **nl,
> +                                       struct notifier_block *n)
> +{
> +       while (*nl && (*nl)->priority >= n->priority) {
> +               if ((*nl)->priority == n->priority && *nl != n)
> +                       return false;
> +
> +               nl = &((*nl)->next);
> +       }
> +
> +       return true;
> +}
> +
>  /*
>   *     Atomic notifier chain routines.  Registration and unregistration
>   *     use a spinlock, and call_chain is synchronized by RCU (no locks).
> @@ -203,6 +216,30 @@ int atomic_notifier_call_chain(struct atomic_notifier_head *nh,
>  EXPORT_SYMBOL_GPL(atomic_notifier_call_chain);
>  NOKPROBE_SYMBOL(atomic_notifier_call_chain);
>
> +/**
> + *     atomic_notifier_has_unique_priority - Checks whether notifier's priority is unique
> + *     @nh: Pointer to head of the atomic notifier chain
> + *     @n: Entry in notifier chain to check
> + *
> + *     Checks whether there is another notifier in the chain with the same priority.
> + *     Must be called in process context.
> + *
> + *     Returns true if priority is unique, false otherwise.
> + */
> +bool atomic_notifier_has_unique_priority(struct atomic_notifier_head *nh,
> +               struct notifier_block *n)
> +{
> +       unsigned long flags;
> +       bool ret;
> +
> +       spin_lock_irqsave(&nh->lock, flags);
> +       ret = notifier_has_unique_priority(&nh->head, n);
> +       spin_unlock_irqrestore(&nh->lock, flags);

This only works if the caller can prevent new entries from being added
to the list at this point or if the caller knows that they cannot be
added for some reason, but the kerneldoc doesn't mention this
limitation.

> +
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(atomic_notifier_has_unique_priority);
> +
>  /*
>   *     Blocking notifier chain routines.  All access to the chain is
>   *     synchronized by an rwsem.
> @@ -336,6 +373,38 @@ bool blocking_notifier_call_chain_is_empty(struct blocking_notifier_head *nh)
>  }
>  EXPORT_SYMBOL_GPL(blocking_notifier_call_chain_is_empty);
>
> +/**
> + *     blocking_notifier_has_unique_priority - Checks whether notifier's priority is unique
> + *     @nh: Pointer to head of the blocking notifier chain
> + *     @n: Entry in notifier chain to check
> + *
> + *     Checks whether there is another notifier in the chain with the same priority.
> + *     Must be called in process context.
> + *
> + *     Returns true if priority is unique, false otherwise.
> + */
> +bool blocking_notifier_has_unique_priority(struct blocking_notifier_head *nh,
> +               struct notifier_block *n)
> +{
> +       bool ret;
> +
> +       /*
> +        * This code gets used during boot-up, when task switching is
> +        * not yet working and interrupts must remain disabled. At such
> +        * times we must not call down_read().
> +        */
> +       if (system_state != SYSTEM_BOOTING)

No, please don't do this, it makes the whole thing error-prone.

> +               down_read(&nh->rwsem);
> +
> +       ret = notifier_has_unique_priority(&nh->head, n);
> +
> +       if (system_state != SYSTEM_BOOTING)
> +               up_read(&nh->rwsem);

And still what if a new entry with a non-unique priority is added to
the chain at this point?

> +
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(blocking_notifier_has_unique_priority);
> +
>  /*
>   *     Raw notifier chain routines.  There is no protection;
>   *     the caller must provide it.  Use at your own risk!
> --
> 2.33.1
>

