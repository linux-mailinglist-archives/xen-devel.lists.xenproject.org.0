Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1CB54720D
	for <lists+xen-devel@lfdr.de>; Sat, 11 Jun 2022 06:42:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.346918.572997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzswp-0001yb-E8; Sat, 11 Jun 2022 04:42:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 346918.572997; Sat, 11 Jun 2022 04:42:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzswp-0001qd-3v; Sat, 11 Jun 2022 04:42:07 +0000
Received: by outflank-mailman (input) for mailman id 346918;
 Sat, 11 Jun 2022 02:33:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=78w8=WS=chromium.org=senozhatsky@srs-se1.protection.inumbo.net>)
 id 1nzqwA-0001hN-NX
 for xen-devel@lists.xenproject.org; Sat, 11 Jun 2022 02:33:18 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9376ec8-e92e-11ec-8901-93a377f238d6;
 Sat, 11 Jun 2022 04:33:16 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id h19so1080306edj.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jun 2022 19:33:16 -0700 (PDT)
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
X-Inumbo-ID: d9376ec8-e92e-11ec-8901-93a377f238d6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rgKkPquDB/3ylB22sdoq44O3nuMRqOGPmfYPJEM3DpI=;
        b=JsXVqmPM/FghNi+FuyecZKJimRfQRZRaZMN7LbU4AElduixKN8TVkmhpZTWnrsGkbZ
         5LwE/p8/n+cIXvQ1YTcLTi0yyURcD/DMLBUnB+eqSpwlWIAygkMHM4b3P17Zp5erCg7D
         knTgcyr8j5ARmG7z3CGlckVUGoumxDAZyb+n8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rgKkPquDB/3ylB22sdoq44O3nuMRqOGPmfYPJEM3DpI=;
        b=GlXtMrPVtUkvOblYq+6YtGAcN5p21m1TXaW/0c/VPiWFO4bUKNwmuwH7T4xOz0WqGg
         t4ghJmkdnrxPylGGDBPvQ74I92jSLIOmt5qz1aYqeyXWEMoj1YNPIEBZAerkazJyfXao
         OxAfHKOzvRVS6H3QWBDOFjT5DHQuF6bJziEA5ZTumNeJ06QGP9wcz0oRbP5llSLcQnnD
         9qFKlNC0hGMEQ8GNbSckNxGkC4rBcUo32GX6AknCfnUUevLEfyhycXr8Jm00rcno9Kp6
         0IlH8D564xlHTFfYXULSE9F/jUCFMtevUy81DtesE8RON2Qxz9YWz2tLB5elLhy8EsYZ
         Qj+w==
X-Gm-Message-State: AOAM531DtBcqsbYwTPvhNHX6Arv3PUCXhTbtU0tEKNb70NcSol9VfBax
	6rwnjyGM0M9FoPdwiNOE4JLmbFcXAeahr90WDVY2Kg==
X-Google-Smtp-Source: ABdhPJzFbgEeXrjhdaEFlL5CPKYiFgrRM2XGTpISMDDKOxh3YJg+nd70yb1Qcu1fnLsZwhWAweXqTRUn04uTYMjQVNU=
X-Received: by 2002:aa7:c604:0:b0:42d:cffb:f4dc with SMTP id
 h4-20020aa7c604000000b0042dcffbf4dcmr55022482edq.270.1654914796079; Fri, 10
 Jun 2022 19:33:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220608142723.103523089@infradead.org> <20220608144517.444659212@infradead.org>
 <YqG6URbihTNCk9YR@alley> <YqHFHB6qqv5wiR8t@worktop.programming.kicks-ass.net>
 <CA+_sPaoJGrXhNPCs2dKf2J7u07y1xYrRFZBUtkKwzK9GqcHSuQ@mail.gmail.com> <YqHvXFdIJfvUDI6e@alley>
In-Reply-To: <YqHvXFdIJfvUDI6e@alley>
From: Sergey Senozhatsky <senozhatsky@chromium.org>
Date: Sat, 11 Jun 2022 11:33:05 +0900
Message-ID: <CA+_sPaq1ez7jah0bibAdeA__Yp92K_VA7E-NZ9knoUmOW9itJg@mail.gmail.com>
Subject: Re: [PATCH 24/36] printk: Remove trace_.*_rcuidle() usage
To: Petr Mladek <pmladek@suse.com>
Cc: Peter Zijlstra <peterz@infradead.org>, ink@jurassic.park.msu.ru, mattst88@gmail.com, 
	vgupta@kernel.org, linux@armlinux.org.uk, ulli.kroll@googlemail.com, 
	linus.walleij@linaro.org, shawnguo@kernel.org, 
	Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de, festevam@gmail.com, 
	linux-imx@nxp.com, tony@atomide.com, khilman@kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, 
	bcain@quicinc.com, chenhuacai@kernel.org, kernel@xen0n.name, 
	geert@linux-m68k.org, sammy@sammy.net, monstr@monstr.eu, 
	tsbogend@alpha.franken.de, dinguyen@kernel.org, jonas@southpole.se, 
	stefan.kristiansson@saunalahti.fi, shorne@gmail.com, 
	James.Bottomley@hansenpartnership.com, deller@gmx.de, mpe@ellerman.id.au, 
	benh@kernel.crashing.org, paulus@samba.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, hca@linux.ibm.com, 
	gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com, 
	svens@linux.ibm.com, ysato@users.sourceforge.jp, dalias@libc.org, 
	davem@davemloft.net, richard@nod.at, anton.ivanov@cambridgegreys.com, 
	johannes@sipsolutions.net, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, acme@kernel.org, 
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	namhyung@kernel.org, jgross@suse.com, srivatsa@csail.mit.edu, 
	amakhalov@vmware.com, pv-drivers@vmware.com, boris.ostrovsky@oracle.com, 
	chris@zankel.net, jcmvbkbc@gmail.com, rafael@kernel.org, lenb@kernel.org, 
	pavel@ucw.cz, gregkh@linuxfoundation.org, mturquette@baylibre.com, 
	sboyd@kernel.org, daniel.lezcano@linaro.org, lpieralisi@kernel.org, 
	sudeep.holla@arm.com, agross@kernel.org, bjorn.andersson@linaro.org, 
	anup@brainfault.org, thierry.reding@gmail.com, jonathanh@nvidia.com, 
	jacob.jun.pan@linux.intel.com, Arnd Bergmann <arnd@arndb.de>, yury.norov@gmail.com, 
	andriy.shevchenko@linux.intel.com, linux@rasmusvillemoes.dk, 
	rostedt@goodmis.org, john.ogness@linutronix.de, paulmck@kernel.org, 
	frederic@kernel.org, quic_neeraju@quicinc.com, josh@joshtriplett.org, 
	mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com, 
	joel@joelfernandes.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, bsegall@google.com, mgorman@suse.de, 
	bristot@redhat.com, vschneid@redhat.com, jpoimboe@kernel.org, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	openrisc@lists.librecores.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	xen-devel@lists.xenproject.org, linux-xtensa@linux-xtensa.org, 
	linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-arch@vger.kernel.org, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 9, 2022 at 10:02 PM Petr Mladek <pmladek@suse.com> wrote:
>
> On Thu 2022-06-09 20:30:58, Sergey Senozhatsky wrote:
> > My emails are getting rejected... Let me try web-interface
>
> Bad day for mail sending. I have problems as well ;-)

For me the problem is still there and apparently it's an "too many
recipients" error.

> > I'm somewhat curious whether we can actually remove that trace event.
>
> Good question.
>
> Well, I think that it might be useful. It allows to see trace and
> printk messages together.

Fair enough. Seems that back in 2011 people were pretty happy with it
https://lore.kernel.org/all/1322161388.5366.54.camel@jlt3.sipsolutions.net/T/#m7bf6416f469119372191f22a6ecf653c5f7331d2

but... reportedly, one of the folks who Ack-ed it (*cough cough*
PeterZ) has never used it.

> It was ugly when it was in the console code. The new location
> in vprintk_store() allows to have it even "correctly" sorted
> (timestamp) against other tracing messages.

That's true.

