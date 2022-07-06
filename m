Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 944C2568478
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 12:02:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362070.591943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o91q1-00006H-VC; Wed, 06 Jul 2022 10:00:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362070.591943; Wed, 06 Jul 2022 10:00:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o91q1-0008V5-RE; Wed, 06 Jul 2022 10:00:53 +0000
Received: by outflank-mailman (input) for mailman id 362070;
 Wed, 06 Jul 2022 09:46:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eCeP=XL=gmail.com=geert.uytterhoeven@srs-se1.protection.inumbo.net>)
 id 1o91cQ-0006P7-TR
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 09:46:50 +0000
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com
 [209.85.160.52]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8dc7dca4-fd10-11ec-bd2d-47488cf2e6aa;
 Wed, 06 Jul 2022 11:46:49 +0200 (CEST)
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-10c0430e27dso9213925fac.4
 for <xen-devel@lists.xenproject.org>; Wed, 06 Jul 2022 02:46:49 -0700 (PDT)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com.
 [209.85.210.52]) by smtp.gmail.com with ESMTPSA id
 u14-20020a056830230e00b00616c46f6daasm13153869ote.31.2022.07.06.02.46.47
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 02:46:47 -0700 (PDT)
Received: by mail-ot1-f52.google.com with SMTP id
 t26-20020a9d775a000000b006168f7563daso11475811otl.2
 for <xen-devel@lists.xenproject.org>; Wed, 06 Jul 2022 02:46:47 -0700 (PDT)
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
X-Inumbo-ID: 8dc7dca4-fd10-11ec-bd2d-47488cf2e6aa
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o8jOPstF035V3JBIGTjyEra8xnCZ4RAIho4NrHeIzoU=;
        b=kL4FALhvVXRC8PPK9GQSHb6XiRKFY/q/+R5RqlyBu39wH9vq3+CesPkY5umUMXh8le
         aaljtL0nhQOAoLu/ysiFdqTMyrvo0Tw/OCebQXSYd8+a1y+DI0IGY5E8b5YYVLFhxghb
         mElC6GbOOfoJumzSB/TAFDoOScBOXckRL76nevZVakcVbUQ/upavuH6XoTurvocnU9A8
         kRPRUxTN/Yum69bgEoLoFo4rMW+kC2wypyMayWQ5OjHws7/tFDP7eGom5POGrs8f6P+9
         xOEr+uoNONXKuU3tU/TrcuS8SoK9XtvFGHcOlxUw0vx335LMB3NE5X+g6X5WydJLTZcW
         1yPA==
X-Gm-Message-State: AJIora8YNKafhigM4+dbnIRoYTEWKcNJd+sqx7Ap3mBiWg2cxEdAA3dZ
	Y+S9p/hvniy5GopgHsnlwRifCaZfrA0g8w==
X-Google-Smtp-Source: AGRyM1sP+pQjVx1jujy3oBX5gC1ME2n7dwyTo3wzNJGCrEmQrOAAKYf8JM+DX88UnSe6LKDbAtFpzA==
X-Received: by 2002:a05:6870:51cb:b0:fb:5c97:bd1b with SMTP id b11-20020a05687051cb00b000fb5c97bd1bmr23764553oaj.104.1657100808029;
        Wed, 06 Jul 2022 02:46:48 -0700 (PDT)
X-Received: by 2002:a05:6902:50e:b0:66e:7f55:7a66 with SMTP id
 x14-20020a056902050e00b0066e7f557a66mr6648581ybs.365.1657100796735; Wed, 06
 Jul 2022 02:46:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220608142723.103523089@infradead.org> <20220608144517.124597382@infradead.org>
In-Reply-To: <20220608144517.124597382@infradead.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Jul 2022 11:46:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW4pT+YQfLzLTegFu1M3v9-9vaFDFAama7mc82=x6R__w@mail.gmail.com>
Message-ID: <CAMuHMdW4pT+YQfLzLTegFu1M3v9-9vaFDFAama7mc82=x6R__w@mail.gmail.com>
Subject: Re: [PATCH 19/36] objtool/idle: Validate __cpuidle code as noinstr
To: Peter Zijlstra <peterz@infradead.org>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, tony@atomide.com, 
	khilman@kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	guoren@kernel.org, bcain@quicinc.com, chenhuacai@kernel.org, 
	kernel@xen0n.name, sammy@sammy.net, monstr@monstr.eu, 
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
	rostedt@goodmis.org, pmladek@suse.com, senozhatsky@chromium.org, 
	john.ogness@linutronix.de, paulmck@kernel.org, frederic@kernel.org, 
	quic_neeraju@quicinc.com, josh@joshtriplett.org, 
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

On Wed, Jun 8, 2022 at 4:46 PM Peter Zijlstra <peterz@infradead.org> wrote:
> Idle code is very like entry code in that RCU isn't available. As
> such, add a little validation.
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

>  arch/m68k/kernel/vmlinux-nommu.lds   |    1 -
>  arch/m68k/kernel/vmlinux-std.lds     |    1 -
>  arch/m68k/kernel/vmlinux-sun3.lds    |    1 -

FWIW
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

