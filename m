Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FA0544971
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 12:47:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.344829.570661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzFh9-0005Hk-Ks; Thu, 09 Jun 2022 10:47:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 344829.570661; Thu, 09 Jun 2022 10:47:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzFh9-0005DK-Fm; Thu, 09 Jun 2022 10:47:19 +0000
Received: by outflank-mailman (input) for mailman id 344829;
 Thu, 09 Jun 2022 09:48:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5tdW=WQ=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1nzEmW-0003qg-8Q
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 09:48:48 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b2d0c2b-e7d9-11ec-bd2c-47488cf2e6aa;
 Thu, 09 Jun 2022 11:48:46 +0200 (CEST)
Received: from dhcp-077-249-017-003.chello.nl ([77.249.17.3]
 helo=worktop.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nzElj-00DR5R-4H; Thu, 09 Jun 2022 09:47:59 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id 100CA981287; Thu,  9 Jun 2022 11:47:58 +0200 (CEST)
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
X-Inumbo-ID: 5b2d0c2b-e7d9-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9jA4mchnYQoJ5XaXo73/qgoc6iaW5C3P1k7XaYKsS1U=; b=cB9XFjQVxWqfDyzeN0qaxTZuLD
	YLcvVXkDGRGNOtMLtEgH+zL1QwGa+jRQrKiDu6o+KwcqUIios781clMIKdQSQtEcXojjpXyjmvj46
	euyjd4m+n/z+pXAWpiww5AHKVJISuO8dbwfn2kdK+vnbm4iQMh9u58KvobfYp6DKnGfTofnM78Yt0
	Jz76LJDB6p5dvl91aPCez/Dj+sFAkswEne+HjI0PWGc0G7Uh6QasF9s0y9AlvQ8RjyVaUQ4ilXQ62
	Z4qivKfe5pGVxrpCjV/g6X6ndctS6ICj5/6oYIabFd8D02kUsNuFDdK3DNDO+pifvTslSQOhwvIep
	NfI5oq7A==;
Date: Thu, 9 Jun 2022 11:47:57 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Tony Lindgren <tony@atomide.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Richard Henderson <rth@twiddle.net>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
	Russell King - ARM Linux <linux@armlinux.org.uk>,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sascha Hauer <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Kevin Hilman <khilman@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	bcain@quicinc.com, Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Sam Creasey <sammy@sammy.net>, Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>, David Miller <davem@davemloft.net>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	the arch/x86 maintainers <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
	Juergen Gross <jgross@suse.com>, srivatsa@csail.mit.edu,
	amakhalov@vmware.com, Pv-drivers <pv-drivers@vmware.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
	Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, gregkh <gregkh@linuxfoundation.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>, lpieralisi@kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	jacob.jun.pan@linux.intel.com, Yury Norov <yury.norov@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Steven Rostedt <rostedt@goodmis.org>,
	Petr Mladek <pmladek@suse.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	John Ogness <john.ogness@linutronix.de>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>, quic_neeraju@quicinc.com,
	Josh Triplett <josh@joshtriplett.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Daniel Bristot de Oliveira <bristot@redhat.com>,
	vschneid@redhat.com, jpoimboe@kernel.org,
	alpha <linux-alpha@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-omap <linux-omap@vger.kernel.org>, linux-csky@vger.kernel.org,
	"open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
	"open list:IA64 (Itanium) PLATFORM" <linux-ia64@vger.kernel.org>,
	linux-m68k <linux-m68k@lists.linux-m68k.org>,
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
	Openrisc <openrisc@lists.librecores.org>,
	Parisc List <linux-parisc@vger.kernel.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	linux-s390 <linux-s390@vger.kernel.org>,
	Linux-sh list <linux-sh@vger.kernel.org>,
	sparclinux <sparclinux@vger.kernel.org>,
	linux-um <linux-um@lists.infradead.org>,
	linux-perf-users@vger.kernel.org,
	"open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE" <virtualization@lists.linux-foundation.org>,
	xen-devel <xen-devel@lists.xenproject.org>,
	"open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>,
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
	Linux PM list <linux-pm@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-arm-msm <linux-arm-msm@vger.kernel.org>,
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
	linux-arch <linux-arch@vger.kernel.org>, rcu@vger.kernel.org
Subject: Re: [PATCH 33/36] cpuidle,omap3: Use WFI for omap3_pm_idle()
Message-ID: <YqHBzbAiqaZeoipw@worktop.programming.kicks-ass.net>
References: <20220608142723.103523089@infradead.org>
 <20220608144518.010587032@infradead.org>
 <CAK8P3a0g-fNu9=BUECSXcNeWT7XWHQMnSXZE-XYE+5eakHxKxA@mail.gmail.com>
 <YqGjqgSrTRseJW6M@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YqGjqgSrTRseJW6M@atomide.com>

On Thu, Jun 09, 2022 at 10:39:22AM +0300, Tony Lindgren wrote:
> * Arnd Bergmann <arnd@arndb.de> [220608 18:18]:
> > On Wed, Jun 8, 2022 at 4:27 PM Peter Zijlstra <peterz@infradead.org> wrote:
> > >
> > > arch_cpu_idle() is a very simple idle interface and exposes only a
> > > single idle state and is expected to not require RCU and not do any
> > > tracing/instrumentation.
> > >
> > > As such, omap_sram_idle() is not a valid implementation. Replace it
> > > with the simple (shallow) omap3_do_wfi() call. Leaving the more
> > > complicated idle states for the cpuidle driver.
> 
> Agreed it makes sense to limit deeper idle states to cpuidle. Hopefully
> there is some informative splat for attempting to use arch_cpu_ide()
> for deeper idle states :)

The arch_cpu_idle() interface doesn't allow one to express a desire for
deeper states. I'm not sure how anyone could even attempt this.

But given what OMAP needs to go deeper, this would involve things that
require RCU, combine that with the follow up patches that rip out all
the trace_.*_rcuidle() hackery from the power and clock domain code,
PROVE_RCU should scream if anybody were to attempt it.

