Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 051A554C19B
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 08:08:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.349689.575833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1MBX-0002W7-FF; Wed, 15 Jun 2022 06:07:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 349689.575833; Wed, 15 Jun 2022 06:07:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1MBX-0002T6-BE; Wed, 15 Jun 2022 06:07:23 +0000
Received: by outflank-mailman (input) for mailman id 349689;
 Wed, 15 Jun 2022 06:05:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Y2Ip=WW=kernel.org=maz@srs-se1.protection.inumbo.net>)
 id 1o1M9X-0002Q2-EP
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 06:05:19 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20eca2d6-ec71-11ec-9917-058037db3bb5;
 Wed, 15 Jun 2022 08:05:18 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7B693617B3;
 Wed, 15 Jun 2022 06:05:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B477C34115;
 Wed, 15 Jun 2022 06:05:15 +0000 (UTC)
Received: from sofa.misterjones.org ([185.219.108.64]
 helo=wait-a-minute.misterjones.org)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <maz@kernel.org>) id 1o1M9R-000hh4-Lq;
 Wed, 15 Jun 2022 07:05:13 +0100
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
X-Inumbo-ID: 20eca2d6-ec71-11ec-9917-058037db3bb5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655273115;
	bh=yf3pNom/syiLiOha7Upiq9/nR1Hjl9dv2JULctSWZP0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SjnyzJRJ5maovA4d7DzY2/Ij5TNs/akt5ph8MDjdNnh42oSEnpEqun3aky3dQcf6z
	 rGme0eLVsl/XoKZXtCCkL0+cKE/nzsKpLCn2sT4A50UeO3p7crMUO1XfASUME8HSj0
	 pD6alvihCcM/657amEHKEos8BTfaNv0g8jeH8Q6QrkIG8VgVi/YsytFwbegMDMw6Gn
	 Pxj0w5BlxtbfpWb4+1rV886T9D/GynKsmxsWQDGtqkBJk0CUIxtfKvkZpW8JkVRt5W
	 zI01Adx6IQH3zR34l9+HTfR6cCjay+Ytdyco9DFFfWGGA7opCch5d/Lzswk+yKRRZO
	 /G8E+1jj9J/iQ==
Date: Wed, 15 Jun 2022 07:05:11 +0100
Message-ID: <87mteepilk.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	rth@twiddle.net,
	ink@jurassic.park.msu.ru,
	mattst88@gmail.com,
	vgupta@kernel.org,
	linux@armlinux.org.uk,
	ulli.kroll@googlemail.com,
	linus.walleij@linaro.org,
	shawnguo@kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	tony@atomide.com,
	khilman@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	guoren@kernel.org,
	bcain@quicinc.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	geert@linux-m68k.org,
	sammy@sammy.net,
	monstr@monstr.eu,
	tsbogend@alpha.franken.de,
	dinguyen@kernel.org,
	jonas@southpole.se,
	stefan.kristiansson@saunalahti.fi,
	shorne@gmail.com,
	James.Bottomley@HansenPartnership.com,
	deller@gmx.de,
	mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com,
	svens@linux.ibm.com,
	ysato@users.sourceforge.jp,
	dalias@libc.org,
	davem@davemloft.net,
	richard@nod.at,
	anton.ivanov@cambridgegreys.com,
	johannes@sipsolutions.net,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	acme@kernel.org,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	namhyung@kernel.org,
	jgross@suse.com,
	srivatsa@csail.mit.edu,
	amakhalov@vmware.com,
	pv-drivers@vmware.com,
	boris.ostrovsky@oracle.com,
	chris@zankel.net,
	jcmvbkbc@gmail.com,
	rafael@kernel.org,
	lenb@kernel.org,
	pavel@ucw.cz,
	gregkh@linuxfoundation.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	daniel.lezcano@linaro.org,
	lpieralisi@kernel.org,
	sudeep.holla@arm.com,
	agross@kernel.org,
	bjorn.andersson@linaro.org,
	anup@brainfault.org,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	jacob.jun.pan@linux.intel.com,
	Arnd Bergmann <arnd@arndb.de>,
	yury.norov@gmail.com,
	andriy.shevchenko@linux.intel.com,
	linux@rasmusvillemoes.dk,
	rostedt@goodmis.org,
	pmladek@suse.com,
	senozhatsky@chromium.org,
	john.ogness@linutronix.de,
	paulmck@kernel.org,
	frederic@kernel.org,
	quic_neeraju@quicinc.com,
	josh@joshtriplett.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	joel@joelfernandes.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	bsegall@google.com,
	mgorman@suse.de,
	bristot@redhat.com,
	vschneid@redhat.com,
	jpoimboe@kernel.org,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-ia64@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	openrisc@lists.librecores.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org,
	linux-xtensa@linux-xtensa.org,
	linux-acpi@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-arch@vger.kernel.org,
	rcu@vger.kernel.org
Subject: Re: [PATCH 23/36] arm64,smp: Remove trace_.*_rcuidle() usage
In-Reply-To: <Yqi2UGb4alCAR5s4@FVFF77S0Q05N>
References: <20220608142723.103523089@infradead.org>
	<20220608144517.380962958@infradead.org>
	<Yqi2UGb4alCAR5s4@FVFF77S0Q05N>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: mark.rutland@arm.com, peterz@infradead.org, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, vgupta@kernel.org, linux@armlinux.org.uk, ulli.kroll@googlemail.com, linus.walleij@linaro.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, tony@atomide.com, khilman@kernel.org, catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, bcain@quicinc.com, chenhuacai@kernel.org, kernel@xen0n.name, geert@linux-m68k.org, sammy@sammy.net, monstr@monstr.eu, tsbogend@alpha.franken.de, dinguyen@kernel.org, jonas@southpole.se, stefan.kristiansson@saunalahti.fi, shorne@gmail.com, James.Bottomley@HansenPartnership.com, deller@gmx.de, mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org, paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com, ysato@users.sourceforge.jp, dalias@
 libc.org, davem@davemloft.net, richard@nod.at, anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, acme@kernel.org, alexander.shishkin@linux.intel.com, jolsa@kernel.org, namhyung@kernel.org, jgross@suse.com, srivatsa@csail.mit.edu, amakhalov@vmware.com, pv-drivers@vmware.com, boris.ostrovsky@oracle.com, chris@zankel.net, jcmvbkbc@gmail.com, rafael@kernel.org, lenb@kernel.org, pavel@ucw.cz, gregkh@linuxfoundation.org, mturquette@baylibre.com, sboyd@kernel.org, daniel.lezcano@linaro.org, lpieralisi@kernel.org, sudeep.holla@arm.com, agross@kernel.org, bjorn.andersson@linaro.org, anup@brainfault.org, thierry.reding@gmail.com, jonathanh@nvidia.com, jacob.jun.pan@linux.intel.com, arnd@arndb.de, yury.norov@gmail.com, andriy.shevchenko@linux.intel.com, linux@rasmusvillemoes.dk, rostedt@goodmis.org, pmladek@suse.com, senozhatsky@chromium.org, john.ogness@linutronix.de, paul
 mck@kernel.org, frederic@kernel.org, quic_neeraju@quicinc.com, josh@joshtriplett.org, mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com, joel@joelfernandes.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com, bsegall@google.com, mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com, jpoimboe@kernel.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, openrisc@lists.librecores.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-um@lists.infradead.org, linux-perf-users@vger.kernel.org, virtualization@lists.linux-foundation.org, xen-devel@lists.xenproject.org, 
 linux-xtensa@linux-xtensa.org, linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arch@vger.kernel.org, rcu@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

On Tue, 14 Jun 2022 17:24:48 +0100,
Mark Rutland <mark.rutland@arm.com> wrote:
> 
> On Wed, Jun 08, 2022 at 04:27:46PM +0200, Peter Zijlstra wrote:
> > Ever since commit d3afc7f12987 ("arm64: Allow IPIs to be handled as
> > normal interrupts") this function is called in regular IRQ context.
> > 
> > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> 
> [adding Marc since he authored that commit]
> 
> Makes sense to me:
> 
>   Acked-by: Mark Rutland <mark.rutland@arm.com>
> 
> Mark.
> 
> > ---
> >  arch/arm64/kernel/smp.c |    4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > --- a/arch/arm64/kernel/smp.c
> > +++ b/arch/arm64/kernel/smp.c
> > @@ -865,7 +865,7 @@ static void do_handle_IPI(int ipinr)
> >  	unsigned int cpu = smp_processor_id();
> >  
> >  	if ((unsigned)ipinr < NR_IPI)
> > -		trace_ipi_entry_rcuidle(ipi_types[ipinr]);
> > +		trace_ipi_entry(ipi_types[ipinr]);
> >  
> >  	switch (ipinr) {
> >  	case IPI_RESCHEDULE:
> > @@ -914,7 +914,7 @@ static void do_handle_IPI(int ipinr)
> >  	}
> >  
> >  	if ((unsigned)ipinr < NR_IPI)
> > -		trace_ipi_exit_rcuidle(ipi_types[ipinr]);
> > +		trace_ipi_exit(ipi_types[ipinr]);
> >  }
> >  
> >  static irqreturn_t ipi_handler(int irq, void *data)

Acked-by: Marc Zyngier <maz@kernel.org>

	M.

-- 
Without deviation from the norm, progress is not possible.

