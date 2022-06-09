Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66668544D24
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 15:09:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.345457.571020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzHuT-0006If-AO; Thu, 09 Jun 2022 13:09:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 345457.571020; Thu, 09 Jun 2022 13:09:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzHuT-0006Cl-5S; Thu, 09 Jun 2022 13:09:13 +0000
Received: by outflank-mailman (input) for mailman id 345457;
 Thu, 09 Jun 2022 13:06:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7WWr=WQ=suse.com=pmladek@srs-se1.protection.inumbo.net>)
 id 1nzHrq-00064z-LX
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 13:06:30 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9f8d908-e7f4-11ec-bd2c-47488cf2e6aa;
 Thu, 09 Jun 2022 15:06:29 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id EEA1421F3C;
 Thu,  9 Jun 2022 13:06:28 +0000 (UTC)
Received: from suse.cz (unknown [10.100.208.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id CEE382C141;
 Thu,  9 Jun 2022 13:06:27 +0000 (UTC)
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
X-Inumbo-ID: f9f8d908-e7f4-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1654779989; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fQ7/fX+AXX7RSe4KqEkRum0uc4vC19BTUP6nq2wTOec=;
	b=o28ZaXYpRsbDNeH7DdY3dJH3Fnc3dlxZT8L+x/2aFmo5tE4BAEDzQGW4+i3DDhNGrDHekt
	G23+f/oOyTepRO03yIh1gixSASehX2C07pg1fm0i3R3KDgn22PhYw8V9jvCq8nE2YIN+/O
	p3FQSqV1HR0kVCZZzDry3RvUltYRjYI=
Date: Thu, 9 Jun 2022 15:06:00 +0200
From: Petr Mladek <pmladek@suse.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: ink@jurassic.park.msu.ru, mattst88@gmail.com, vgupta@kernel.org,
	linux@armlinux.org.uk, ulli.kroll@googlemail.com,
	linus.walleij@linaro.org, shawnguo@kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de,
	festevam@gmail.com, linux-imx@nxp.com, tony@atomide.com,
	khilman@kernel.org, catalin.marinas@arm.com, will@kernel.org,
	guoren@kernel.org, bcain@quicinc.com, chenhuacai@kernel.org,
	kernel@xen0n.name, geert@linux-m68k.org, sammy@sammy.net,
	monstr@monstr.eu, tsbogend@alpha.franken.de, dinguyen@kernel.org,
	jonas@southpole.se, stefan.kristiansson@saunalahti.fi,
	shorne@gmail.com, James.Bottomley@hansenpartnership.com,
	deller@gmx.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
	paulus@samba.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, hca@linux.ibm.com, gor@linux.ibm.com,
	agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
	svens@linux.ibm.com, ysato@users.sourceforge.jp, dalias@libc.org,
	davem@davemloft.net, richard@nod.at,
	anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	acme@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	namhyung@kernel.org, jgross@suse.com, srivatsa@csail.mit.edu,
	amakhalov@vmware.com, pv-drivers@vmware.com,
	boris.ostrovsky@oracle.com, chris@zankel.net, jcmvbkbc@gmail.com,
	rafael@kernel.org, lenb@kernel.org, pavel@ucw.cz,
	gregkh@linuxfoundation.org, mturquette@baylibre.com,
	sboyd@kernel.org, daniel.lezcano@linaro.org, lpieralisi@kernel.org,
	sudeep.holla@arm.com, agross@kernel.org, bjorn.andersson@linaro.org,
	anup@brainfault.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
	jacob.jun.pan@linux.intel.com, Arnd Bergmann <arnd@arndb.de>,
	yury.norov@gmail.com, andriy.shevchenko@linux.intel.com,
	linux@rasmusvillemoes.dk, rostedt@goodmis.org,
	senozhatsky@chromium.org, john.ogness@linutronix.de,
	paulmck@kernel.org, frederic@kernel.org, quic_neeraju@quicinc.com,
	josh@joshtriplett.org, mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com, joel@joelfernandes.org,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, bsegall@google.com, mgorman@suse.de,
	bristot@redhat.com, vschneid@redhat.com, jpoimboe@kernel.org,
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org, linux-perf-users@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org, linux-xtensa@linux-xtensa.org,
	linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-arch@vger.kernel.org,
	rcu@vger.kernel.org
Subject: Re: [PATCH 24/36] printk: Remove trace_.*_rcuidle() usage
Message-ID: <YqHwOFg/WlMqe8/Z@alley>
References: <20220608142723.103523089@infradead.org>
 <20220608144517.444659212@infradead.org>
 <YqG6URbihTNCk9YR@alley>
 <YqHFHB6qqv5wiR8t@worktop.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YqHFHB6qqv5wiR8t@worktop.programming.kicks-ass.net>

On Thu 2022-06-09 12:02:04, Peter Zijlstra wrote:
> On Thu, Jun 09, 2022 at 11:16:46AM +0200, Petr Mladek wrote:
> > On Wed 2022-06-08 16:27:47, Peter Zijlstra wrote:
> > > The problem, per commit fc98c3c8c9dc ("printk: use rcuidle console
> > > tracepoint"), was printk usage from the cpuidle path where RCU was
> > > already disabled.
> > > 
> > Does this "prevent" calling printk() a safe way in code with
> > RCU disabled?
> 
> On x86_64, yes. Other architectures, less so.
> 
> Specifically, the objtool noinstr validation pass will warn at build
> time (DEBUG_ENTRY=y) if any noinstr/cpuidle code does a call to
> non-vetted code like printk().
> 
> At the same time; there's a few hacks that allow WARN to work, but
> mostly if you hit WARN in entry/noinstr you get to keep the pieces in
> any case.
> 
> On other architecture we'll need to rely on runtime coverage with
> PROVE_RCU. That is, if a splat like in the above mentioned commit
> happens again, we'll need to fix it by adjusting the callchain, not by
> mucking about with RCU state.

Makes sense. Feel free to use for this patch:

Acked-by: Petr Mladek <pmladek@suse.com>

> > Therefore if this patch allows to remove some tricky tracing
> > code then it might be worth it. But if trace_console_rcuidle()
> > variant is still going to be available then I would keep using it.
> 
> My ultimate goal is to delete trace_.*_rcuidle() and RCU_NONIDLE()
> entirely. We're close, but not quite there yet.

I keep my fingers crossed.

Best Regards,
Petr

