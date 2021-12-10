Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4A54708F1
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 19:35:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.244232.422415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvkjv-0002NX-Ov; Fri, 10 Dec 2021 18:35:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 244232.422415; Fri, 10 Dec 2021 18:35:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvkjv-0002L7-Lt; Fri, 10 Dec 2021 18:35:27 +0000
Received: by outflank-mailman (input) for mailman id 244232;
 Fri, 10 Dec 2021 18:35:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2dzg=Q3=gmail.com=rjwysocki@srs-se1.protection.inumbo.net>)
 id 1mvkju-0002L1-M0
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 18:35:26 +0000
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0869579-59e7-11ec-a74f-db008197e53d;
 Fri, 10 Dec 2021 19:35:25 +0100 (CET)
Received: by mail-oi1-f172.google.com with SMTP id bf8so14395659oib.6
 for <xen-devel@lists.xenproject.org>; Fri, 10 Dec 2021 10:35:25 -0800 (PST)
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
X-Inumbo-ID: f0869579-59e7-11ec-a74f-db008197e53d
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cmWwBA8Prvw8yKg8YllQ7/9D+dqLH//9VzjE/Uy0t0I=;
        b=NALq1uh0Fj4hBS1R5YDqEz59DbyBc6zHGwXFzVs/Snf3Vb8SwSpFXLuw4Vu9jdQ9kU
         vVEPezKuN/Tg4B3FfWbNuNgRj6kH0na/1rAmQ1y3jnxNLetWo6SE2c4Yq7x88iJ/Es9x
         TFc2tfTEtY/JwCemCg0+tfGm+ph1guBnnuPKm9W0NJtaK/Rk2LJLslQtKQToYfoompLw
         Bk1NDGm1yOAc2GLphvTAOMq7i5agB2Y/p8lvjIn0VYlkLfKs3Y9QIb3tbsSa1AhghisC
         yAZ1DpkghMeLJAWvTbdLqTBtG5+JbBq9kyhAD4KinCtbIZj0Q6FxkTy3IsBa7pdJDTFh
         vjBw==
X-Gm-Message-State: AOAM531P+6M5dglZuZgqjWf1Dufroe8Do8tyuadIPcKd5cinbAuSkZko
	Lxo2/fycbjPYycEmR3JIZ2kURpjgqNFg1DXlehw=
X-Google-Smtp-Source: ABdhPJy55tGpIDxF+0NXDym/GuLq/jPswo3lW9bQPH3JZ5naSMZQfeBVB0yUiflqPmuJ6rchV13JR6onKlnNSicDR4M=
X-Received: by 2002:aca:eb0b:: with SMTP id j11mr14005588oih.51.1639161324582;
 Fri, 10 Dec 2021 10:35:24 -0800 (PST)
MIME-Version: 1.0
References: <20211126180101.27818-1-digetx@gmail.com> <20211126180101.27818-8-digetx@gmail.com>
 <CAJZ5v0i=zgubEtF5-Wnaqa5FMnfVUdSnEmD11-LAuYCH8ZCwrA@mail.gmail.com> <acf8289e-6ab8-6eda-ec06-e9044ddd9a92@gmail.com>
In-Reply-To: <acf8289e-6ab8-6eda-ec06-e9044ddd9a92@gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 10 Dec 2021 19:35:13 +0100
Message-ID: <CAJZ5v0gvuteY4EtXWTKmh4-Wt-Z_dPcqfDLwc-ja1uovbV3rpw@mail.gmail.com>
Subject: Re: [PATCH v4 07/25] reboot: Remove extern annotation from function prototypes
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

On Fri, Dec 10, 2021 at 7:16 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 10.12.2021 21:09, Rafael J. Wysocki =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Fri, Nov 26, 2021 at 7:02 PM Dmitry Osipenko <digetx@gmail.com> wrot=
e:
> >>
> >> There is no need to annotate function prototypes with 'extern', it mak=
es
> >> code less readable. Remove unnecessary annotations from <reboot.h>.
> >>
> >> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >
> > I'm not sure that this is really useful.
> >
> > Personally, I tend to respect the existing conventions like this.
> >
> > Surely, this change is not required for the rest of the series to work.
>
> Problem that such things start to spread all over the kernel with a
> copy-paste approach if there is nobody to clean up the code.
>
> This is not a common convention and sometimes it's getting corrected [1].
>
> [1] https://git.kernel.org/linus/6d7434931

In separate patches outside of series adding new features, if one is
so inclined.

