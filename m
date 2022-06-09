Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B64C9544A4F
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 13:35:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.345104.570759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzGRO-000880-TS; Thu, 09 Jun 2022 11:35:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 345104.570759; Thu, 09 Jun 2022 11:35:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzGRO-00085P-PV; Thu, 09 Jun 2022 11:35:06 +0000
Received: by outflank-mailman (input) for mailman id 345104;
 Thu, 09 Jun 2022 11:31:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pINC=WQ=chromium.org=senozhatsky@srs-se1.protection.inumbo.net>)
 id 1nzGNb-0007EE-W9
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 11:31:12 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a92481be-e7e7-11ec-b605-df0040e90b76;
 Thu, 09 Jun 2022 13:31:10 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id o7so13563403eja.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jun 2022 04:31:10 -0700 (PDT)
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
X-Inumbo-ID: a92481be-e7e7-11ec-b605-df0040e90b76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+XewJc/p+7yp1re11t6BfmEtfp27WPbXPnywgusXXTc=;
        b=dD0Bz9eW32MHk+TeRLS+QqFpXQSyJG1PFuM0sFc2oIQiPmRbBKI4wiAjUnrY0TOPB3
         vmLpoVIxPESYT9ISrrirk39KtLhSpCgEKtG3yrDCpv/Gh6ZWSamp4kS8RJg23gIGNIEa
         lDd2yagv7BcuRvFzrWxMhthjwknH7br96szys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+XewJc/p+7yp1re11t6BfmEtfp27WPbXPnywgusXXTc=;
        b=uOSQvCB1vmFENbDYIJeYXJuaejA9VnmVRreE73ZoKXMTE0jpH1KohaXecIIlmatggO
         ahtycpKjZ1xteE8FqvADjnjow8XbfSaV7EKiaVynwB+Q/fden0zfK+s1X7z9HJqPM5bd
         ylV9gvh/qiDjKmNmISfE+lS60sDqPMghEHizj2h5W5h8PUtLLHCGI/i/Ss1g6k993OFv
         o6bItU5/jAwfi+tLlDygxPk/JRiHCA1kgBsQ305849WFQIrambUhv0cS1c6rdxZeRvcz
         bwheXMcYMDLs1Rd7s4WpdO16ATML2mdwllyefvxYkY3zTZZGA39ZH8cPVsVrSQH+jKD9
         gLJA==
X-Gm-Message-State: AOAM5310jp1ctll4Nesy9JF1mLv5SuBMLs3NFJ9gzochFfV2EbheF2Mw
	vhyLevZSz1+hRpZuKnwimOOjfgmBlPjCSRrGfGKhOQ==
X-Google-Smtp-Source: ABdhPJx9nV7wAxP/lyAtNedlGfDPIROj9YXpatcH7EqCac1uVlfTSKszMzYbWUxkatf8WgjTCZNOZTjPAlJBoltWDx4=
X-Received: by 2002:a17:907:c22:b0:711:dc95:3996 with SMTP id
 ga34-20020a1709070c2200b00711dc953996mr13928684ejc.62.1654774269713; Thu, 09
 Jun 2022 04:31:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220608142723.103523089@infradead.org> <20220608144517.444659212@infradead.org>
 <YqG6URbihTNCk9YR@alley> <YqHFHB6qqv5wiR8t@worktop.programming.kicks-ass.net>
In-Reply-To: <YqHFHB6qqv5wiR8t@worktop.programming.kicks-ass.net>
From: Sergey Senozhatsky <senozhatsky@chromium.org>
Date: Thu, 9 Jun 2022 20:30:58 +0900
Message-ID: <CA+_sPaoJGrXhNPCs2dKf2J7u07y1xYrRFZBUtkKwzK9GqcHSuQ@mail.gmail.com>
Subject: Re: [PATCH 24/36] printk: Remove trace_.*_rcuidle() usage
To: Peter Zijlstra <peterz@infradead.org>
Cc: Petr Mladek <pmladek@suse.com>, ink@jurassic.park.msu.ru, mattst88@gmail.com, 
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

My emails are getting rejected... Let me try web-interface

Kudos to Petr for the questions and thanks to PeterZ for the answers.

On Thu, Jun 9, 2022 at 7:02 PM Peter Zijlstra <peterz@infradead.org> wrote:
> This is the tracepoint used to spool all of printk into ftrace, I
> suspect there's users, but I haven't used it myself.

I'm somewhat curious whether we can actually remove that trace event.

