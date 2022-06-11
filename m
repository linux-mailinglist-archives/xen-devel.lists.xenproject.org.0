Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B73454720E
	for <lists+xen-devel@lfdr.de>; Sat, 11 Jun 2022 06:42:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.346914.572989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzswo-0001qv-VY; Sat, 11 Jun 2022 04:42:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 346914.572989; Sat, 11 Jun 2022 04:42:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzswo-0001lg-OI; Sat, 11 Jun 2022 04:42:06 +0000
Received: by outflank-mailman (input) for mailman id 346914;
 Sat, 11 Jun 2022 02:23:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=78w8=WS=chromium.org=senozhatsky@srs-se1.protection.inumbo.net>)
 id 1nzqmR-0000Qp-IZ
 for xen-devel@lists.xenproject.org; Sat, 11 Jun 2022 02:23:15 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71b8077b-e92d-11ec-bd2c-47488cf2e6aa;
 Sat, 11 Jun 2022 04:23:14 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id w27so992236edl.7
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jun 2022 19:23:13 -0700 (PDT)
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
X-Inumbo-ID: 71b8077b-e92d-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HvaEucNyttJ72r4dgkt1sbWCJsvBPyIh5zMt0LNXalY=;
        b=D62jI1p8sOcmW+dGG367yCKI6736qfwlRYdRbtg+pQI3VQ/mZvhMkSh4muEy4yFzXi
         1pifN6keFBPADAFAutLs2f+vKDRy3jOy1SmannYfmHY7tjbpoLbP8600CMqIboz22zit
         FmdCeKC+IDyY3i3YwKCGDz5In1oYgHbIW3q58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HvaEucNyttJ72r4dgkt1sbWCJsvBPyIh5zMt0LNXalY=;
        b=v5gbq2Ez8HV30+emo0S0Pq+3J3jcK8zPkN3NeOhAm/FNLCRWCybec1msrm1uQVWza1
         ka1W2JlWqS62vQlxxxCP3ppUYUcSMZd1W1qIWLbkdIi6FytgAcyP4jk7KoMyHRnRzyOT
         MgkY/LG/3+ldBk/20JZaaHD65DCSLlTZGnc+8GXLx5RMw2KtSmwaUComXht/rY+XuEnc
         RLtV0SwXmcGLhhnacLp3YWza9qtNZQynmpj8kFmvZ4+imPLHz2OLMLEbSSMBvfLVg4Oq
         1MuazHtiMWDNZu/gHjZu2AAa/KNt3ildtE8TXWUVArL/9VFEmZebfewywvAahumnh8mP
         qPpw==
X-Gm-Message-State: AOAM530CrOR88nZwsPolDhLv4dT0YKvflYA7vcMud0k9BNLSkzO9GQKW
	8KZm1COqzmvFwfAJDW16tiiw59N0xH91vUx6OVlrNQ==
X-Google-Smtp-Source: ABdhPJz16+9kQdS9QDTB0tjL4FsLbUEsFaIS0ykQfnx5qpyFYyBQCn1i8W4mcCkA/y3viUzYkXAgYYv9JpSOTwgMdpQ=
X-Received: by 2002:a50:eb91:0:b0:42d:c1d8:616a with SMTP id
 y17-20020a50eb91000000b0042dc1d8616amr54940771edr.219.1654914192936; Fri, 10
 Jun 2022 19:23:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220608142723.103523089@infradead.org> <20220608144517.444659212@infradead.org>
 <YqG6URbihTNCk9YR@alley> <YqHFHB6qqv5wiR8t@worktop.programming.kicks-ass.net> <YqHwOFg/WlMqe8/Z@alley>
In-Reply-To: <YqHwOFg/WlMqe8/Z@alley>
From: Sergey Senozhatsky <senozhatsky@chromium.org>
Date: Sat, 11 Jun 2022 11:23:02 +0900
Message-ID: <CA+_sPaq_47C2PWnGU7WfGXMc03E1Nz+1=F-wZe0B2+ymqdm3Fg@mail.gmail.com>
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

On Thu, Jun 9, 2022 at 10:06 PM Petr Mladek <pmladek@suse.com> wrote:
>
> Makes sense. Feel free to use for this patch:
>
> Acked-by: Petr Mladek <pmladek@suse.com>

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>

