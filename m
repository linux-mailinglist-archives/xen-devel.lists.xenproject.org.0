Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD9654EFF3
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jun 2022 06:06:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350899.577495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o23Es-0005dE-J7; Fri, 17 Jun 2022 04:05:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350899.577495; Fri, 17 Jun 2022 04:05:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o23Es-0005bN-GF; Fri, 17 Jun 2022 04:05:42 +0000
Received: by outflank-mailman (input) for mailman id 350899;
 Thu, 16 Jun 2022 21:23:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xETI=WX=linux.intel.com=jacob.jun.pan@srs-se1.protection.inumbo.net>)
 id 1o1wxA-0005q1-BJ
 for xen-devel@lists.xenproject.org; Thu, 16 Jun 2022 21:23:00 +0000
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7acd545b-edba-11ec-bd2c-47488cf2e6aa;
 Thu, 16 Jun 2022 23:22:55 +0200 (CEST)
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 14:22:51 -0700
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.198.157])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 14:22:51 -0700
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
X-Inumbo-ID: 7acd545b-edba-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655414575; x=1686950575;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eIVB2Wcg0d4KNkOlM5BOJs0iOIDhUm5jxxQVobMAAIM=;
  b=OQ0iJhew++TA1rbFr369n0l2OSc4VHeYD+gUIWhn30eWLuYFqEwnpXuQ
   3NIEi0UBmGKIICmuV2VZjIt4KkHum5Tly6/wH+4GHHPvoupLqOItYLvYH
   VF80khvoojKjsalps30jwprPkWk4lnUQpb84i8ABB8rbIG7z+dTAwyZ+e
   s4M4rgS35rlx8w1Ag2f/MtLNEWSIx/QHOqnhrSCHtwCtgrhgGhThHnewg
   6kkIqPClJFDUA0/CtK2IpRCU9JC8bfAOtBLzkK5DGJCtCNv4dMCcMpvCy
   FreGQMaiRJilw1GR1I1TpT/6jKTsPC7NXTfZdIHywAtsTip6vQ4CP+60I
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="268043185"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="268043185"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="560027674"
Date: Thu, 16 Jun 2022 14:26:56 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com,
 vgupta@kernel.org, linux@armlinux.org.uk, ulli.kroll@googlemail.com,
 linus.walleij@linaro.org, shawnguo@kernel.org, Sascha Hauer
 <s.hauer@pengutronix.de>, kernel@pengutronix.de, festevam@gmail.com,
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
 johannes@sipsolutions.net, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 acme@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
 jolsa@kernel.org, namhyung@kernel.org, jgross@suse.com,
 srivatsa@csail.mit.edu, amakhalov@vmware.com, pv-drivers@vmware.com,
 boris.ostrovsky@oracle.com, chris@zankel.net, jcmvbkbc@gmail.com,
 rafael@kernel.org, lenb@kernel.org, pavel@ucw.cz,
 gregkh@linuxfoundation.org, mturquette@baylibre.com, sboyd@kernel.org,
 daniel.lezcano@linaro.org, lpieralisi@kernel.org, sudeep.holla@arm.com,
 agross@kernel.org, bjorn.andersson@linaro.org, anup@brainfault.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com, Arnd Bergmann
 <arnd@arndb.de>, yury.norov@gmail.com, andriy.shevchenko@linux.intel.com,
 linux@rasmusvillemoes.dk, rostedt@goodmis.org, pmladek@suse.com,
 senozhatsky@chromium.org, john.ogness@linutronix.de, paulmck@kernel.org,
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
 linux-perf-users@vger.kernel.org,
 virtualization@lists.linux-foundation.org, xen-devel@lists.xenproject.org,
 linux-xtensa@linux-xtensa.org, linux-acpi@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-arch@vger.kernel.org, rcu@vger.kernel.org,
 jacob.jun.pan@linux.intel.com
Subject: Re: [PATCH 04/36] cpuidle,intel_idle: Fix CPUIDLE_FLAG_IRQ_ENABLE
Message-ID: <20220616142656.4b1acc4a@jacob-builder>
In-Reply-To: <Yqb45vclY2KVL0wZ@hirez.programming.kicks-ass.net>
References: <20220608142723.103523089@infradead.org>
	<20220608144516.172460444@infradead.org>
	<20220609164921.5e61711d@jacob-builder>
	<Yqb45vclY2KVL0wZ@hirez.programming.kicks-ass.net>
Organization: OTC
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Peter,

On Mon, 13 Jun 2022 10:44:22 +0200, Peter Zijlstra <peterz@infradead.org>
wrote:

> On Thu, Jun 09, 2022 at 04:49:21PM -0700, Jacob Pan wrote:
> > Hi Peter,
> > 
> > On Wed, 08 Jun 2022 16:27:27 +0200, Peter Zijlstra
> > <peterz@infradead.org> wrote:
> >   
> > > Commit c227233ad64c ("intel_idle: enable interrupts before C1 on
> > > Xeons") wrecked intel_idle in two ways:
> > > 
> > >  - must not have tracing in idle functions
> > >  - must return with IRQs disabled
> > > 
> > > Additionally, it added a branch for no good reason.
> > > 
> > > Fixes: c227233ad64c ("intel_idle: enable interrupts before C1 on
> > > Xeons") Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > > ---
> > >  drivers/idle/intel_idle.c |   48
> > > +++++++++++++++++++++++++++++++++++----------- 1 file changed, 37
> > > insertions(+), 11 deletions(-)
> > > 
> > > --- a/drivers/idle/intel_idle.c
> > > +++ b/drivers/idle/intel_idle.c
> > > @@ -129,21 +137,37 @@ static unsigned int mwait_substates __in
> > >   *
> > >   * Must be called under local_irq_disable().
> > >   */  
> > nit: this comment is no long true, right?  
> 
> It still is, all the idle routines are called with interrupts disabled,
> but must also exit with interrupts disabled.
> 
> If the idle method requires interrupts to be enabled, it must be sure to
> disable them again before returning. Given all the RCU/tracing concerns
> it must use raw_local_irq_*() for this though.
Makes sense, it is just little confusing when the immediate caller does
raw_local_irq_enable() which does not cancel out local_irq_disable().

Thanks,

Jacob

