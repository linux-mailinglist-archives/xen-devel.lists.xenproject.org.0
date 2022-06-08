Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D94DD543EFC
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 00:02:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.344385.569914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nz3jy-0004yW-H5; Wed, 08 Jun 2022 22:01:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 344385.569914; Wed, 08 Jun 2022 22:01:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nz3jy-0004vr-At; Wed, 08 Jun 2022 22:01:26 +0000
Received: by outflank-mailman (input) for mailman id 344385;
 Wed, 08 Jun 2022 21:43:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QjaB=WP=arndb.de=arnd@srs-se1.protection.inumbo.net>)
 id 1nz3SS-0002zq-7T
 for xen-devel@lists.xenproject.org; Wed, 08 Jun 2022 21:43:20 +0000
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01f61925-e774-11ec-b605-df0040e90b76;
 Wed, 08 Jun 2022 23:43:17 +0200 (CEST)
Received: from mail-ua1-f47.google.com ([209.85.222.47]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MdNse-1nPzgj06cq-00ZQ1c for <xen-devel@lists.xenproject.org>; Wed, 08 Jun
 2022 23:43:17 +0200
Received: by mail-ua1-f47.google.com with SMTP id o8so7382278uap.6
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jun 2022 14:43:16 -0700 (PDT)
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
X-Inumbo-ID: 01f61925-e774-11ec-b605-df0040e90b76
X-Gm-Message-State: AOAM5314z4DzazvIHroPhIG82d+Ud50XyVYeVMqhFAsPWTaAbMXG4IjA
	JQoWwW8CRVZctX3NqzJyDMjIwri+VmJuQs6foWQ=
X-Google-Smtp-Source: ABdhPJzNVjvOg+I4TKoqtI9Mj5r7eGnKl4yZEYVHLzTr22uimte8bgKc1nTgREfDsecVqzQDeuxH8v8jGezndj85u8s=
X-Received: by 2002:a25:e64b:0:b0:663:ffad:eac5 with SMTP id
 d72-20020a25e64b000000b00663ffadeac5mr3789690ybh.550.1654705730388; Wed, 08
 Jun 2022 09:28:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220608142723.103523089@infradead.org> <20220608144518.010587032@infradead.org>
In-Reply-To: <20220608144518.010587032@infradead.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 8 Jun 2022 18:28:33 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0g-fNu9=BUECSXcNeWT7XWHQMnSXZE-XYE+5eakHxKxA@mail.gmail.com>
Message-ID: <CAK8P3a0g-fNu9=BUECSXcNeWT7XWHQMnSXZE-XYE+5eakHxKxA@mail.gmail.com>
Subject: Re: [PATCH 33/36] cpuidle,omap3: Use WFI for omap3_pm_idle()
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
X-Provags-ID: V03:K1:4jU4inRxbIK3YZV/EI0Jq7c1w+cBWepIpNcv7a5g9CAVNkikiKb
 xcIefAUSSDbZe9fnETUIBLrH/P/1DFCeasuj3P2CSClhs/obpVFFXyQ8KP+cH1mWwI9sxbt
 WyEm52osMQyq4rsYpXa5HZO05IFl2/JO42Q6KEqWu4F+TclkyQKN4EENOizX7E+Crg7A4Dd
 j+50z30Y0EdbHBe6S7m2Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:TZ/SzoOX1Aw=:2b4snShJDmaai2JDJp149R
 8FV8+Wr+seTO3BZs718tpDLR9SxzgG/RvKnywOfVdRL0BBgMkp+zbOY5Nj6O4l5qjeGmfZow9
 3rybvr47sXvN/HgjblHRbOR4p+lhwylZBbhruHwAAf88nVpIQeRDMWKacz64twYQAqEKZfNrb
 K393NZta2geV6RGJNbxBra2lfHi1KGdHeRV4a8RsdH3BYgWqjvXOLwfYLVKH34CLVhaVkgXbU
 wMkX07FWil2qBaS8McnhbF+ofHPWhuEbKw95RvkcPsCbhDc1fNMkrNxQl7tGCBqsWaJ7Yd94p
 foJ+9/TMnRZzd1j4OynDZGFC15qmstg1JJHJGFUEVTMGYcZHeFwv9Hjjbwsg9glq0pRVpwRsc
 h/jGPlLUKObZvQt+3o6kZgB4HwbEXLavhmksFPZxaV8wTVfnKB/VIXYI0dyN/yMPw+t8QGJTo
 GmbVjtDTPbZqaMfGctSszMaN77jA2n+em2fNTUcqeRYz7tV0J6U1AOWX2n3E3WK2na8WT4UUU
 VnFr5sbvX5viV4klFPqnEQqRLMKBCy8WI6NU1m9flzZC7bq9RG/ak9sbkCAMSrRofz9aGQqDk
 BL3NsJF6Al5ZowAlgDlfed5uWTR0QSRHkS7N5e7TpmhHk4OzGWgHDB3ZuAxAgbiSYB21Ua7rV
 YXKCnjukuL4yY9NBvCZnSyTIwraCLBuLmelrPNVXdbrGvIRfKBJf0vyVsnRyiaJdxwBbY2l5p
 Ejt0m1od1bLjojt5fBIbrXXU0rUHURjFMashSYFHVLJUxhnBZIKmmY9ChACgf+xeg53x2L/j4
 ytQFsOvUUaP1NfssOO1tWEPk6qB7+fRd9ev2jpMmSlsr/OHF0A5HASDdMY9cZGcB/tSn9dtz6
 MfLyYNKzUmi8Sk98iQgoPMyfugYuQZl7JQV4QDPG4EL+3VVn2URMoF6oStzqk0eSYf2Kd9mRT
 CuCzu01m6J+UAEaJxyauhf62VsSuGO2xNMcmdl2k7ci3a/M2j9MRj

On Wed, Jun 8, 2022 at 4:27 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> arch_cpu_idle() is a very simple idle interface and exposes only a
> single idle state and is expected to not require RCU and not do any
> tracing/instrumentation.
>
> As such, omap_sram_idle() is not a valid implementation. Replace it
> with the simple (shallow) omap3_do_wfi() call. Leaving the more
> complicated idle states for the cpuidle driver.
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

I see similar code in omap2:

omap2_pm_idle()
 -> omap2_enter_full_retention()
     -> omap2_sram_suspend()

Is that code path safe to use without RCU or does it need a similar change?

        Arnd

