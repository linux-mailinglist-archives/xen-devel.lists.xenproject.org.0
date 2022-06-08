Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC64543EFB
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 00:02:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.344387.569919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nz3jy-00053G-Nt; Wed, 08 Jun 2022 22:01:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 344387.569919; Wed, 08 Jun 2022 22:01:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nz3jy-0004yb-JC; Wed, 08 Jun 2022 22:01:26 +0000
Received: by outflank-mailman (input) for mailman id 344387;
 Wed, 08 Jun 2022 21:55:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QjaB=WP=arndb.de=arnd@srs-se1.protection.inumbo.net>)
 id 1nz3eV-00044U-Fw
 for xen-devel@lists.xenproject.org; Wed, 08 Jun 2022 21:55:47 +0000
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be8f22cc-e775-11ec-bd2c-47488cf2e6aa;
 Wed, 08 Jun 2022 23:55:46 +0200 (CEST)
Received: from mail-yb1-f173.google.com ([209.85.219.173]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MuUza-1niDDo45z8-00rar3 for <xen-devel@lists.xenproject.org>; Wed, 08 Jun
 2022 23:55:43 +0200
Received: by mail-yb1-f173.google.com with SMTP id a30so20003739ybj.3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jun 2022 14:55:42 -0700 (PDT)
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
X-Inumbo-ID: be8f22cc-e775-11ec-bd2c-47488cf2e6aa
X-Gm-Message-State: AOAM531iVnSG872l62iKviwF9PrHO8lr/WeOht9qKnDF0w6sed6e+kZg
	NVK4tzOsBS5NyF1aj0Itt46paxGzZS9LjbWyQQI=
X-Google-Smtp-Source: ABdhPJzN5kbTwiXruPcKSpnmqojFIl1cGQUBuhNCCdRneCrpSwm0deMOGKvKLmavgOJ05DHkpAoCHNV4Fm5CQu/QOU4=
X-Received: by 2002:a0d:efc2:0:b0:2fe:d2b7:da8 with SMTP id
 y185-20020a0defc2000000b002fed2b70da8mr36982567ywe.42.1654705351589; Wed, 08
 Jun 2022 09:22:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220608142723.103523089@infradead.org> <20220608144517.188449351@infradead.org>
In-Reply-To: <20220608144517.188449351@infradead.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 8 Jun 2022 18:22:12 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2y5+nrQFzhjrTTZe+d57Ug261J3kwLNe8Mu8i2qxtG2w@mail.gmail.com>
Message-ID: <CAK8P3a2y5+nrQFzhjrTTZe+d57Ug261J3kwLNe8Mu8i2qxtG2w@mail.gmail.com>
Subject: Re: [PATCH 20/36] arch/idle: Change arch_cpu_idle() IRQ behaviour
To: Peter Zijlstra <peterz@infradead.org>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, 
	Russell King - ARM Linux <linux@armlinux.org.uk>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Tony Lindgren <tony@atomide.com>, 
	Kevin Hilman <khilman@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, bcain@quicinc.com, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Sam Creasey <sammy@sammy.net>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Dinh Nguyen <dinguyen@kernel.org>, 
	Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
	Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, David Miller <davem@davemloft.net>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "the arch/x86 maintainers" <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Juergen Gross <jgross@suse.com>, srivatsa@csail.mit.edu, 
	amakhalov@vmware.com, Pv-drivers <pv-drivers@vmware.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Chris Zankel <chris@zankel.net>, 
	Max Filippov <jcmvbkbc@gmail.com>, Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Pavel Machek <pavel@ucw.cz>, gregkh <gregkh@linuxfoundation.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, lpieralisi@kernel.org, 
	Sudeep Holla <sudeep.holla@arm.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <bjorn.andersson@linaro.org>, Anup Patel <anup@brainfault.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	jacob.jun.pan@linux.intel.com, Arnd Bergmann <arnd@arndb.de>, 
	Yury Norov <yury.norov@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Steven Rostedt <rostedt@goodmis.org>, 
	Petr Mladek <pmladek@suse.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	John Ogness <john.ogness@linutronix.de>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Frederic Weisbecker <frederic@kernel.org>, quic_neeraju@quicinc.com, 
	Josh Triplett <josh@joshtriplett.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Joel Fernandes <joel@joelfernandes.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>, 
	Mel Gorman <mgorman@suse.de>, Daniel Bristot de Oliveira <bristot@redhat.com>, vschneid@redhat.com, 
	jpoimboe@kernel.org, alpha <linux-alpha@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-omap <linux-omap@vger.kernel.org>, linux-csky@vger.kernel.org, 
	"open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>, 
	"open list:IA64 (Itanium) PLATFORM" <linux-ia64@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, Openrisc <openrisc@lists.librecores.org>, 
	Parisc List <linux-parisc@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-s390 <linux-s390@vger.kernel.org>, 
	Linux-sh list <linux-sh@vger.kernel.org>, sparclinux <sparclinux@vger.kernel.org>, 
	linux-um <linux-um@lists.infradead.org>, linux-perf-users@vger.kernel.org, 
	"open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE" <virtualization@lists.linux-foundation.org>, 
	xen-devel <xen-devel@lists.xenproject.org>, 
	"open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>, 
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, 
	linux-clk <linux-clk@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, 
	rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:m8R1Pu+UFzRU6eC4jzpDdb8g6pVLHLdmGO5KVQBK/pYk/k+ipCy
 zrXY5zy+jCD8GyZxTQKr1nfTPbl8VptQzV0ZLnZjAcVyxO1YtQMOF00P9nkKmyR2as2/JYY
 d+dS3QyIckg74iMvx9YNJEBkn6Q0Wa993OqVjB+g/Sy0h/7aQNeResdeL3awiaLBEyZaClT
 cFDlan7NH0tH7dpNRe1hA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1xrwEBKmde8=:q/TsCD1dQLxyvoyLkQBcVR
 YJ85mfuLrkJIz1Y3PnVowarRhaV8J5rY2cMYoZP6Shqz4N4pzeoO49gAJdfyXKD3a2iFQOcq9
 JNUbUG+d8+2TryKFp13hUtpcPr9688Z0S9wG7wWMthVEcSBa3zAhQI2oigQYAtNIQrdcrac/D
 c0CymXAeaU1ZnUA8i9ijTM+RrEAWOZacLiowS7jzC9H3dinzIJgMxmBuwlGS9fEk9y2vc/lTv
 +3CY5GiGxjKixJGzqw6zPTuWcHwK/I3Skdbe4d5A8ne2EsKBUE+D46vHJwDJ1WVazpaDpVdeA
 xS1ZE6/rHCrldwzqZwJ3tcpQsrFSE6Qf0jtgCpD2A5Xyqj5T2pyKY55/l9pM9ZmyhzvEtQ8ZK
 6dWczCmjHBFPmkiNWh+YuFr4000thhf7z6G/RlXh1NNZdca2TMPG5xBZYXAB+gipnSmw+IW81
 z0zks2bNN3twYpu2sVirKN6pa+iO34rheBsHZuRZV5IXLrRIvwVlibxUPNsO1PmfZasfsL+rm
 xhFbJV+iO/8jrrd4BnT4tGy/PrjZuJpYO8aSGiktsG1s1pblmr1cmcy9L4DaPb0lIjPDH2XlS
 cuin7mFRP2/P0yR4up2Chi1hAPuvf/pmTh8Fon3zbJ3hqGvvYj4i1e5jSeE0fiJXcpZZvapVR
 k8rac1q/u5zGNg6Vyj7T6m+O+81HqluFb7huzVTwLFOZP8Xf2R4dUIlhvlCz9nB746XG+eAUu
 T6zVgENFsViPDghtQ4sFdd+jFcO0OdIsTmNAglqd8iXuD7G9TCkmrUWAWkIWMafUK1Zsu6lOy
 XvfxmgE27E6EAHtFOypPV4B7QXQ2vn2jWt/olXB8HOKsQiU29rj1f6fwCVsMfTfS4RSDHKRTz
 NvZdczBCSEO2BRbafEAr9ELi6rNZ88WJWWMJGRH5oZKhKdpOhkN8M5Tgjd3EPfUgf82iCmvUL
 0WCOXRSwBoewOsg/0s6PDJxoPgvctlTQmB6SV+OkzuowYYLCamVg+

On Wed, Jun 8, 2022 at 4:27 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> Current arch_cpu_idle() is called with IRQs disabled, but will return
> with IRQs enabled.
>
> However, the very first thing the generic code does after calling
> arch_cpu_idle() is raw_local_irq_disable(). This means that
> architectures that can idle with IRQs disabled end up doing a
> pointless 'enable-disable' dance.
>
> Therefore, push this IRQ disabling into the idle function, meaning
> that those architectures can avoid the pointless IRQ state flipping.
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

I think you now need to add the a raw_local_irq_disable(); in loongarch
as well.

       Arnd

