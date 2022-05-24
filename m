Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEF4532B7E
	for <lists+xen-devel@lfdr.de>; Tue, 24 May 2022 15:44:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336574.560925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntUor-000432-LO; Tue, 24 May 2022 13:43:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336574.560925; Tue, 24 May 2022 13:43:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntUor-00040Q-Hp; Tue, 24 May 2022 13:43:29 +0000
Received: by outflank-mailman (input) for mailman id 336574;
 Tue, 24 May 2022 13:43:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Triq=WA=gmail.com=rjwysocki@srs-se1.protection.inumbo.net>)
 id 1ntUop-00040K-Mh
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 13:43:27 +0000
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c774b8f-db67-11ec-bd2c-47488cf2e6aa;
 Tue, 24 May 2022 15:43:26 +0200 (CEST)
Received: by mail-yb1-f170.google.com with SMTP id i187so28712163ybg.6
 for <xen-devel@lists.xenproject.org>; Tue, 24 May 2022 06:43:26 -0700 (PDT)
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
X-Inumbo-ID: 7c774b8f-db67-11ec-bd2c-47488cf2e6aa
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gF0TUV/f1EYPh7LzpbylOlyjLRvO0rS2Z8aSd7vESdM=;
        b=qM4lZocGU2K6t7Ms+LTa2tCi9Zklc9U8BLDgE9f6yXJqKyJBMo4ZwJ5sP/jlomghAX
         j/rHiu5H+e0dEPX8M2VBneQZ1YMYH6gGriIDoMEX7NVPgfk5FtAo9cnQNDFXvVuW9X6q
         Nn4j7W8JYz8VYDQaKzlAmT+LO3YsE4qRwfstI6AG0XY8PVdE37qOgIyNgszLqNIVxgu6
         14bEwBsoF0WlyfomXFYozc2xfAFhyJQa50zL5gx30UfI+Z+dcjmEb4k6K5aT49g2xM8F
         MHzywNRrA1QYeKPhawepZQKWRlRZKEzebU67ZgRTasie/XASsuri85MRVGRDiU0FnYp7
         2RkQ==
X-Gm-Message-State: AOAM530Hf2qbTcJ9cysDFQ+lmMIqnIlTl65qPg5zuTEnb/8I9qDHWKxy
	nxBEUc4SVTL7hCxS0uqbyiVCknWW9dzEgezaO4A=
X-Google-Smtp-Source: ABdhPJxrx+4PyTpojs6STJF90N5O3lVotlMS1F5ewlefJhltMPRleCLQ6INTFZNdlhzglSskVKU04pl4oHllKVWle+Q=
X-Received: by 2002:a05:6902:100a:b0:64f:44ec:13ff with SMTP id
 w10-20020a056902100a00b0064f44ec13ffmr24477246ybt.137.1653399805346; Tue, 24
 May 2022 06:43:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220509233235.995021-1-dmitry.osipenko@collabora.com>
 <CAJZ5v0jhWs-8ChHddebTZcaH6kA05sLEMsXM9Op7kHWAQDxeYA@mail.gmail.com> <CAMuHMdVbWpgubaA0V_tau3O=czAb3RQV9AwJsoQ+LWjf-wjMkA@mail.gmail.com>
In-Reply-To: <CAMuHMdVbWpgubaA0V_tau3O=czAb3RQV9AwJsoQ+LWjf-wjMkA@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 24 May 2022 15:43:14 +0200
Message-ID: <CAJZ5v0jar8GONkAZfLuRpKHuYRu1Y_0AecmGxayM00AHCJkYVg@mail.gmail.com>
Subject: Re: [PATCH v8 00/27] Introduce power-off+restart call chain API
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, 
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
	Santosh Shilimkar <ssantosh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
	Lee Jones <lee.jones@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Guenter Roeck <linux@roeck-us.net>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-csky@vger.kernel.org, 
	"linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, Parisc List <linux-parisc@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, Linux-sh list <linux-sh@vger.kernel.org>, 
	xen-devel@lists.xenproject.org, 
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	linux-tegra <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Geert,

On Mon, May 23, 2022 at 8:08 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Rafael,
>
> On Wed, May 18, 2022 at 4:46 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
> > On Tue, May 10, 2022 at 1:33 AM Dmitry Osipenko
> > <dmitry.osipenko@collabora.com> wrote:
>
> > >   m68k: Switch to new sys-off handler API
>
> Sorry, I didn't realize this was going to interact with the new m68k
> virtual machine support, which is included in the m68k pull request
> for v5.19.
>
> > However, I'm going to send a pull request with it in the second half
> > of the merge window, after the majority of the other changes in the
> > subsystems touched by it have been integrated.
>
> And presumably you will have to merge in v5.19-rc1, too?

I will merge this series on top of the Linus' merges of my pull
requests sent yesterday (assuming that he pulls them, that is).

> I've sent a fix.  It should appear at
> https://lore.kernel.org/r/20220523175520.949681-1-geert@linux-m68k.org
> soon.
>
> Can you please include that in your PR?

I will.

Thanks!

