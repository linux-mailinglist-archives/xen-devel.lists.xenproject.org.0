Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8AF4B8793
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 13:26:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274093.469438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKJNd-00039R-3Z; Wed, 16 Feb 2022 12:25:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274093.469438; Wed, 16 Feb 2022 12:25:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKJNd-00037G-08; Wed, 16 Feb 2022 12:25:57 +0000
Received: by outflank-mailman (input) for mailman id 274093;
 Wed, 16 Feb 2022 12:25:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TMKw=S7=gmail.com=rjwysocki@srs-se1.protection.inumbo.net>)
 id 1nKJNb-000377-BF
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 12:25:55 +0000
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9533f134-8f23-11ec-b215-9bbe72dcb22c;
 Wed, 16 Feb 2022 13:25:53 +0100 (CET)
Received: by mail-yb1-f182.google.com with SMTP id y129so5474823ybe.7
 for <xen-devel@lists.xenproject.org>; Wed, 16 Feb 2022 04:25:54 -0800 (PST)
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
X-Inumbo-ID: 9533f134-8f23-11ec-b215-9bbe72dcb22c
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZzgKkF+Qi9uD0PohBja9X66WgBtIRyDp12JGMxNBcpY=;
        b=H5BkQ2we3A7U+dtK0KCoZ4Zu6SIAJK13H0WXiptdXlGRQzkYD3WqCGIshSoVzuccro
         JkIWamUWRXwDvYuAkuvIlG4JkhYhsyxqVuDKHowUkWaC6VZReJOFtJN9M7VQ9c5oKqI5
         xZKHGzUnDD8SzUDK2rtLyUBAnxoGoNGUOEebQjkcpwFs7F00dFYrVJxwXcGCZk/HRloY
         0/62z5nh7p1CujgggWDJcwY7EzvlJKcr3kYYbSXIvDErl/WUNxINXOPgrL+xHPnCvK7e
         T3YhdNFIxAhWjq7i5yegcJ5QL8kKKrQsKwe8ua0213I2HvPn5AT3ZL59GPZ1JYYTinWz
         aDvQ==
X-Gm-Message-State: AOAM531v1R8x6ikcrmpGVIVF8WBe5N2EMdizOrnjkFg82GNICSaoU9Ko
	dqnXc/OjlUIk7MmOyQS7td6W0iDXxhQKXQlI4Og=
X-Google-Smtp-Source: ABdhPJzgB2WXDlMNWyEW279no9A0knLc+PLldmsjtAqBW5sJWGuZ+ouM0fPGPUzKV7R9c8p8BV9gaIDPnZPFqeD/pjM=
X-Received: by 2002:a81:f008:0:b0:2d0:cd72:74e5 with SMTP id
 p8-20020a81f008000000b002d0cd7274e5mr2135032ywm.301.1645014353165; Wed, 16
 Feb 2022 04:25:53 -0800 (PST)
MIME-Version: 1.0
References: <20220130233718.21544-1-digetx@gmail.com> <635e8121-fca4-580c-6af5-d9317a2eee1b@gmail.com>
In-Reply-To: <635e8121-fca4-580c-6af5-d9317a2eee1b@gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 16 Feb 2022 13:25:39 +0100
Message-ID: <CAJZ5v0g0MrBm2+GwctkB7kUyBEt6HTAexRCFFRmTF1UKDrVQ-g@mail.gmail.com>
Subject: Re: [PATCH v6 00/21] Introduce power-off+restart call chain API
To: Dmitry Osipenko <digetx@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-csky@vger.kernel.org, 
	linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, linux-parisc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Linux-sh list <linux-sh@vger.kernel.org>, 
	xen-devel@lists.xenproject.org, 
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	linux-tegra <linux-tegra@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
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
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2022 at 11:00 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 31.01.2022 02:36, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > Problem
> > -------
> >
> > SoC devices require power-off call chaining functionality from kernel.
> > We have a widely used restart chaining provided by restart notifier API=
,
> > but nothing for power-off.
> >
> > Solution
> > --------
> >
> > Introduce new API that provides both restart and power-off call chains.
> >
> > Why combine restart with power-off? Because drivers often do both.
> > More practical to have API that provides both under the same roof.
> >
> > The new API is designed with simplicity and extensibility in mind.
> > It's built upon the existing restart and reboot APIs. The simplicity
> > is in new helper functions that are convenient for drivers. The
> > extensibility is in the design that doesn't hardcode callback
> > arguments, making easy to add new parameters and remove old.
> >
> > This is a third attempt to introduce the new API. First was made by
> > Guenter Roeck back in 2014, second was made by Thierry Reding in 2017.
> > In fact the work didn't stop and recently arm_pm_restart() was removed
> > from v5.14 kernel, which was a part of preparatory work started by
> > Guenter Roeck. I took into account experience and ideas from the
> > previous attempts, extended and polished them.
>
>
> Rafael and all, do you see anything critical that needs to be improved
> in this v6?
>
> Will be great if you could take this patchset via the power tree if it
> looks okay, or give an ack.

I need some more time for this, sorry.

I'm a bit concerned about seeing no response to this set from anyone.

It looks like multiple platforms may be affected by it in principle,
so doesn't anyone care?

