Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD2354C07D
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 06:06:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.349280.575694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1KHk-0005t2-CS; Wed, 15 Jun 2022 04:05:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 349280.575694; Wed, 15 Jun 2022 04:05:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1KHj-0005lJ-UP; Wed, 15 Jun 2022 04:05:39 +0000
Received: by outflank-mailman (input) for mailman id 349280;
 Tue, 14 Jun 2022 16:28:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qq/B=WV=arm.com=mark.rutland@srs-se1.protection.inumbo.net>)
 id 1o19P0-0005jd-DX
 for xen-devel@lists.xenproject.org; Tue, 14 Jun 2022 16:28:26 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 03226e8a-ebff-11ec-a26a-b96bd03d9e80;
 Tue, 14 Jun 2022 18:28:24 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D221916F3;
 Tue, 14 Jun 2022 09:28:23 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.41.154])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EEF753F66F;
 Tue, 14 Jun 2022 09:28:05 -0700 (PDT)
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
X-Inumbo-ID: 03226e8a-ebff-11ec-a26a-b96bd03d9e80
Date: Tue, 14 Jun 2022 17:28:02 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com,
	vgupta@kernel.org, linux@armlinux.org.uk, ulli.kroll@googlemail.com,
	linus.walleij@linaro.org, shawnguo@kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de,
	festevam@gmail.com, linux-imx@nxp.com, tony@atomide.com,
	khilman@kernel.org, catalin.marinas@arm.com, will@kernel.org,
	guoren@kernel.org, bcain@quicinc.com, chenhuacai@kernel.org,
	kernel@xen0n.name, geert@linux-m68k.org, sammy@sammy.net,
	monstr@monstr.eu, tsbogend@alpha.franken.de, dinguyen@kernel.org,
	jonas@southpole.se, stefan.kristiansson@saunalahti.fi,
	shorne@gmail.com, James.Bottomley@HansenPartnership.com,
	deller@gmx.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
	paulus@samba.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, hca@linux.ibm.com, gor@linux.ibm.com,
	agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
	svens@linux.ibm.com, ysato@users.sourceforge.jp, dalias@libc.org,
	davem@davemloft.net, richard@nod.at,
	anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	acme@kernel.org, alexander.shishkin@linux.intel.com,
	jolsa@kernel.org, namhyung@kernel.org, jgross@suse.com,
	srivatsa@csail.mit.edu, amakhalov@vmware.com, pv-drivers@vmware.com,
	boris.ostrovsky@oracle.com, chris@zankel.net, jcmvbkbc@gmail.com,
	rafael@kernel.org, lenb@kernel.org, pavel@ucw.cz,
	gregkh@linuxfoundation.org, mturquette@baylibre.com,
	sboyd@kernel.org, daniel.lezcano@linaro.org, lpieralisi@kernel.org,
	sudeep.holla@arm.com, agross@kernel.org, bjorn.andersson@linaro.org,
	anup@brainfault.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
	jacob.jun.pan@linux.intel.com, Arnd Bergmann <arnd@arndb.de>,
	yury.norov@gmail.com, andriy.shevchenko@linux.intel.com,
	linux@rasmusvillemoes.dk, rostedt@goodmis.org, pmladek@suse.com,
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
Subject: Re: [PATCH 25/36] time/tick-broadcast: Remove RCU_NONIDLE usage
Message-ID: <Yqi3EmHbuvf3ItMI@FVFF77S0Q05N>
References: <20220608142723.103523089@infradead.org>
 <20220608144517.507286638@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220608144517.507286638@infradead.org>

On Wed, Jun 08, 2022 at 04:27:48PM +0200, Peter Zijlstra wrote:
> No callers left that have already disabled RCU.
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
>  kernel/time/tick-broadcast-hrtimer.c |   29 ++++++++++++-----------------
>  1 file changed, 12 insertions(+), 17 deletions(-)
> 
> --- a/kernel/time/tick-broadcast-hrtimer.c
> +++ b/kernel/time/tick-broadcast-hrtimer.c
> @@ -56,25 +56,20 @@ static int bc_set_next(ktime_t expires,
>  	 * hrtimer callback function is currently running, then
>  	 * hrtimer_start() cannot move it and the timer stays on the CPU on
>  	 * which it is assigned at the moment.
> +	 */
> +	hrtimer_start(&bctimer, expires, HRTIMER_MODE_ABS_PINNED_HARD);
> +	/*
> +	 * The core tick broadcast mode expects bc->bound_on to be set
> +	 * correctly to prevent a CPU which has the broadcast hrtimer
> +	 * armed from going deep idle.
>  	 *
> -	 * As this can be called from idle code, the hrtimer_start()
> -	 * invocation has to be wrapped with RCU_NONIDLE() as
> -	 * hrtimer_start() can call into tracing.
> +	 * As tick_broadcast_lock is held, nothing can change the cpu
> +	 * base which was just established in hrtimer_start() above. So
> +	 * the below access is safe even without holding the hrtimer
> +	 * base lock.
>  	 */
> -	RCU_NONIDLE( {
> -		hrtimer_start(&bctimer, expires, HRTIMER_MODE_ABS_PINNED_HARD);
> -		/*
> -		 * The core tick broadcast mode expects bc->bound_on to be set
> -		 * correctly to prevent a CPU which has the broadcast hrtimer
> -		 * armed from going deep idle.
> -		 *
> -		 * As tick_broadcast_lock is held, nothing can change the cpu
> -		 * base which was just established in hrtimer_start() above. So
> -		 * the below access is safe even without holding the hrtimer
> -		 * base lock.
> -		 */
> -		bc->bound_on = bctimer.base->cpu_base->cpu;
> -	} );
> +	bc->bound_on = bctimer.base->cpu_base->cpu;
> +
>  	return 0;
>  }
>  
> 
> 

