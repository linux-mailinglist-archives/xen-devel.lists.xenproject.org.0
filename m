Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 124F04709DF
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 20:08:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.244282.422506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvlG0-0004Z9-9W; Fri, 10 Dec 2021 19:08:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 244282.422506; Fri, 10 Dec 2021 19:08:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvlG0-0004WE-6V; Fri, 10 Dec 2021 19:08:36 +0000
Received: by outflank-mailman (input) for mailman id 244282;
 Fri, 10 Dec 2021 19:08:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2dzg=Q3=gmail.com=rjwysocki@srs-se1.protection.inumbo.net>)
 id 1mvlFy-0004W8-Rj
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 19:08:34 +0000
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 919aea1d-59ec-11ec-a74f-db008197e53d;
 Fri, 10 Dec 2021 20:08:33 +0100 (CET)
Received: by mail-ot1-f45.google.com with SMTP id
 w6-20020a9d77c6000000b0055e804fa524so10591470otl.3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Dec 2021 11:08:33 -0800 (PST)
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
X-Inumbo-ID: 919aea1d-59ec-11ec-a74f-db008197e53d
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=eV+MT/c+cWty36yyN1k88RcKH0yc2be+fuKXycnWnqs=;
        b=COw1oINMypu8v3XS1XuZDe7DsUOUOOs2cpuGLXnG4N53l2ajXBpuKYiGEVZSqZlolf
         6vetkS0MwZQT2TaKh89aJM9qnSPqNsPnWVpFI0lB5W/6ZWLG/0g3JB9uCrWeweDwWGr7
         VVYuppQtnmugAz9uV6WCyZG39NY6mz0a6feP7byxYUoqRxV7ygHDlSvmA54nqVMzCFsr
         PMjYOYRmKosQpd3tIUCiBqCuSgh0lkyXmfWblB2KB7F4mtFDDLNIZBgrJN2nCiVuGR9x
         D20aE9wKdtLwMNciIra7IxGyQ0YdRqjzvfwq2LpQ5iJkjaQ2taKUqp4sK6BZqwfsPkyX
         UhGg==
X-Gm-Message-State: AOAM530F612k4lu1us88XTe1SN2c1/eqJGb/+5Zs9neWE4bLYi0bh3Js
	ZwUEefez4UCPLZQ9xhpl2kURwS73dYUVHkKHuos=
X-Google-Smtp-Source: ABdhPJz3WnXJDp9MR1neaOhkZU7y1rSVa1ldfWi3aUs9lzZU+HiO7VfKdE35iqJJyDqw6NIr5Fwr8foXDpr2Xp5/alg=
X-Received: by 2002:a05:6830:1e57:: with SMTP id e23mr12553404otj.16.1639163312676;
 Fri, 10 Dec 2021 11:08:32 -0800 (PST)
MIME-Version: 1.0
References: <20211126180101.27818-1-digetx@gmail.com> <20211126180101.27818-7-digetx@gmail.com>
 <CAJZ5v0ii7tGRDbxw+5GqdyONXvRPznXUqBZd03+pdoAd+pH=JQ@mail.gmail.com> <c518ce36-09d2-16a3-cec2-6bab8260e3cf@gmail.com>
In-Reply-To: <c518ce36-09d2-16a3-cec2-6bab8260e3cf@gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 10 Dec 2021 20:08:21 +0100
Message-ID: <CAJZ5v0iP_VnNW3ChmdvRFg1gvwvkDGmqtGnf1oVwQxXY303RkQ@mail.gmail.com>
Subject: Re: [PATCH v4 06/25] reboot: Warn if unregister_restart_handler() fails
To: Dmitry Osipenko <digetx@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
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
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Len Brown <lenb@kernel.org>, 
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
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 10, 2021 at 7:54 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 10.12.2021 21:32, Rafael J. Wysocki =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Fri, Nov 26, 2021 at 7:02 PM Dmitry Osipenko <digetx@gmail.com> wrot=
e:
> >>
> >> Emit warning if unregister_restart_handler() fails since it never shou=
ld
> >> fail. This will ease further API development by catching mistakes earl=
y.
> >>
> >> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >> ---
> >>  kernel/reboot.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/kernel/reboot.c b/kernel/reboot.c
> >> index e6659ae329f1..f0e7b9c13f6b 100644
> >> --- a/kernel/reboot.c
> >> +++ b/kernel/reboot.c
> >> @@ -210,7 +210,7 @@ EXPORT_SYMBOL(register_restart_handler);
> >>   */
> >>  int unregister_restart_handler(struct notifier_block *nb)
> >>  {
> >> -       return atomic_notifier_chain_unregister(&restart_handler_list,=
 nb);
> >> +       return WARN_ON(atomic_notifier_chain_unregister(&restart_handl=
er_list, nb));
> >
> > The only reason why it can fail is if the object pointed to by nb is
> > not in the chain.
>
> I had exactly this case where object wasn't in the chain due to a bug
> and this warning was very helpful.

During the development.  In production it would be rather annoying.

> >  Why WARN() about this?  And what about systems with
> > panic_on_warn set?
>
> That warning condition will never happen normally, only when something
> is seriously wrong.
>
> Those systems with panic_on_warn will get what was they asked for.

They may not be asking for panicking on bugs in the reboot notifier
code, though.  That's what your change is making them panic on.

