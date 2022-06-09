Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E74F2544D23
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 15:09:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.345455.571013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzHuS-0006CZ-Un; Thu, 09 Jun 2022 13:09:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 345455.571013; Thu, 09 Jun 2022 13:09:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzHuS-00069r-RH; Thu, 09 Jun 2022 13:09:12 +0000
Received: by outflank-mailman (input) for mailman id 345455;
 Thu, 09 Jun 2022 13:02:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7WWr=WQ=suse.com=pmladek@srs-se1.protection.inumbo.net>)
 id 1nzHnx-0005xS-2Y
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 13:02:29 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 697c06a5-e7f4-11ec-8b38-e96605d6a9a5;
 Thu, 09 Jun 2022 15:02:28 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id A55BE21F03;
 Thu,  9 Jun 2022 13:02:26 +0000 (UTC)
Received: from suse.cz (unknown [10.100.208.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 6EA862C141;
 Thu,  9 Jun 2022 13:02:21 +0000 (UTC)
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
X-Inumbo-ID: 697c06a5-e7f4-11ec-8b38-e96605d6a9a5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1654779746; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WNgY7GyrprNl76LhtyM4yyAr1//LVOR4uCT8xLqGCE8=;
	b=ojtY10eQLedQ1p8W7bkgtPGLkS2AZjpFLq6Jm7M5r6QmnKTONMm4DEE4c/QdWiGdnShevp
	eIN6ALkkVVj/WhUF02Ld8MHz00y8tRrFQ0iNR/EUdLO4UR9+Vq8VAuuJcSid16nMNGAGa3
	XvOmhnJPAVDKUKq8/PtY3J2tLln4dQU=
Date: Thu, 9 Jun 2022 15:02:20 +0200
From: Petr Mladek <pmladek@suse.com>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Peter Zijlstra <peterz@infradead.org>, ink@jurassic.park.msu.ru,
	mattst88@gmail.com, vgupta@kernel.org, linux@armlinux.org.uk,
	ulli.kroll@googlemail.com, linus.walleij@linaro.org,
	shawnguo@kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
	tony@atomide.com, khilman@kernel.org, catalin.marinas@arm.com,
	will@kernel.org, guoren@kernel.org, bcain@quicinc.com,
	chenhuacai@kernel.org, kernel@xen0n.name, geert@linux-m68k.org,
	sammy@sammy.net, monstr@monstr.eu, tsbogend@alpha.franken.de,
	dinguyen@kernel.org, jonas@southpole.se,
	stefan.kristiansson@saunalahti.fi, shorne@gmail.com,
	James.Bottomley@hansenpartnership.com, deller@gmx.de,
	mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com, svens@linux.ibm.com,
	ysato@users.sourceforge.jp, dalias@libc.org, davem@davemloft.net,
	richard@nod.at, anton.ivanov@cambridgegreys.com,
	johannes@sipsolutions.net, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
	hpa@zytor.com, acme@kernel.org, mark.rutland@arm.com,
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
	john.ogness@linutronix.de, paulmck@kernel.org, frederic@kernel.org,
	quic_neeraju@quicinc.com, josh@joshtriplett.org,
	mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com,
	joel@joelfernandes.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	bsegall@google.com, mgorman@suse.de, bristot@redhat.com,
	vschneid@redhat.com, jpoimboe@kernel.org,
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
Message-ID: <YqHvXFdIJfvUDI6e@alley>
References: <20220608142723.103523089@infradead.org>
 <20220608144517.444659212@infradead.org>
 <YqG6URbihTNCk9YR@alley>
 <YqHFHB6qqv5wiR8t@worktop.programming.kicks-ass.net>
 <CA+_sPaoJGrXhNPCs2dKf2J7u07y1xYrRFZBUtkKwzK9GqcHSuQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+_sPaoJGrXhNPCs2dKf2J7u07y1xYrRFZBUtkKwzK9GqcHSuQ@mail.gmail.com>

On Thu 2022-06-09 20:30:58, Sergey Senozhatsky wrote:
> My emails are getting rejected... Let me try web-interface

Bad day for mail sending. I have problems as well ;-)

> Kudos to Petr for the questions and thanks to PeterZ for the answers.
> 
> On Thu, Jun 9, 2022 at 7:02 PM Peter Zijlstra <peterz@infradead.org> wrote:
> > This is the tracepoint used to spool all of printk into ftrace, I
> > suspect there's users, but I haven't used it myself.
> 
> I'm somewhat curious whether we can actually remove that trace event.

Good question.

Well, I think that it might be useful. It allows to see trace and
printk messages together.

It was ugly when it was in the console code. The new location
in vprintk_store() allows to have it even "correctly" sorted
(timestamp) against other tracing messages.

Best Regards,
Petr

