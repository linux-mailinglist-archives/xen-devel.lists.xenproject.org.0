Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8D654828F
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jun 2022 10:56:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.347857.574198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0frz-0007en-PW; Mon, 13 Jun 2022 08:56:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 347857.574198; Mon, 13 Jun 2022 08:56:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0frz-0007XG-Iz; Mon, 13 Jun 2022 08:56:23 +0000
Received: by outflank-mailman (input) for mailman id 347857;
 Mon, 13 Jun 2022 08:42:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f0g7=WU=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1o0fed-0005hb-MP
 for xen-devel@lists.xenproject.org; Mon, 13 Jun 2022 08:42:37 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4447aa3-eaf4-11ec-8901-93a377f238d6;
 Mon, 13 Jun 2022 10:42:34 +0200 (CEST)
Received: from dhcp-077-249-017-003.chello.nl ([77.249.17.3]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1o0fdb-00Gf1z-43; Mon, 13 Jun 2022 08:41:31 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 600BB300472;
 Mon, 13 Jun 2022 10:41:27 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 42FA02849859B; Mon, 13 Jun 2022 10:41:27 +0200 (CEST)
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
X-Inumbo-ID: c4447aa3-eaf4-11ec-8901-93a377f238d6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TBu1hM1Fbte1hrb329bc3ivTNLPSxYZoE9gYu5eRiHg=; b=AYS6grJVD8NMmpEvSXoRmqR/m5
	NEo85wVpnYAfEDlJuO/EUebdXwmtGi7E1hfXWnzD4xJRKZ83szCruTMmPOs7xBMJ6Aw1UFgllIdA2
	DrNCgkjyxwSlCkaYvmrnpeyVHjsekjBUo+W+kPzFmB2XaZh0Vpc97VCHNs1UCeL3PGYHI9qxJxVu/
	DaFylVxmC0fZNsBkd3ExUz+u7t35uoUT8AamFGd6WJIWdTb36E6JQrKM1QWtIzoeKjuNFK4QcGaGj
	jl+nLLuCaTmbWLVhpIZJqu3xqI2+WRMTvXP48+Wg/el92i2X48vydvI85ds5VF4NfA6ZUW+2+coel
	hUXUv0FQ==;
Date: Mon, 13 Jun 2022 10:41:27 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Lai Jiangshan <jiangshanlai@gmail.com>
Cc: Richard Henderson <rth@twiddle.net>, ink@jurassic.park.msu.ru,
	mattst88@gmail.com, vgupta@kernel.org, linux@armlinux.org.uk,
	ulli.kroll@googlemail.com, linus.walleij@linaro.org,
	shawnguo@kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
	tony@atomide.com, khilman@kernel.org, catalin.marinas@arm.com,
	Will Deacon <will@kernel.org>, guoren@kernel.org, bcain@quicinc.com,
	Huacai Chen <chenhuacai@kernel.org>, kernel@xen0n.name,
	geert@linux-m68k.org, sammy@sammy.net, monstr@monstr.eu,
	tsbogend@alpha.franken.de, dinguyen@kernel.org, jonas@southpole.se,
	stefan.kristiansson@saunalahti.fi, shorne@gmail.com,
	James.Bottomley@hansenpartnership.com, deller@gmx.de,
	Michael Ellerman <mpe@ellerman.id.au>, benh@kernel.crashing.org,
	paulus@samba.org, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, hca@linux.ibm.com,
	gor@linux.ibm.com, agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com, svens@linux.ibm.com,
	ysato@users.sourceforge.jp, dalias@libc.org, davem@davemloft.net,
	Richard Weinberger <richard@nod.at>,
	anton.ivanov@cambridgegreys.com,
	Johannes Berg <johannes@sipsolutions.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>, acme <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	jolsa@kernel.org, Namhyung Kim <namhyung@kernel.org>,
	Juergen Gross <jgross@suse.com>, srivatsa@csail.mit.edu,
	amakhalov@vmware.com, VMware Inc <pv-drivers@vmware.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, chris@zankel.net,
	jcmvbkbc@gmail.com, rafael@kernel.org, lenb@kernel.org,
	pavel@ucw.cz, gregkh@linuxfoundation.org, mturquette@baylibre.com,
	sboyd@kernel.org, daniel.lezcano@linaro.org, lpieralisi@kernel.org,
	sudeep.holla@arm.com, agross@kernel.org, bjorn.andersson@linaro.org,
	Anup Patel <anup@brainfault.org>, thierry.reding@gmail.com,
	jonathanh@nvidia.com, jacob.jun.pan@linux.intel.com,
	Arnd Bergmann <arnd@arndb.de>, yury.norov@gmail.com,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux@rasmusvillemoes.dk, rostedt@goodmis.org, pmladek@suse.com,
	senozhatsky@chromium.org, john.ogness@linutronix.de,
	paulmck@kernel.org, frederic@kernel.org, quic_neeraju@quicinc.com,
	josh@joshtriplett.org, mathieu.desnoyers@efficios.com,
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
	rcu@vger.kernel.org, Isaku Yamahata <isaku.yamahata@gmail.com>,
	kirill.shutemov@linux.intel.com
Subject: Re: [PATCH 21/36] x86/tdx: Remove TDX_HCALL_ISSUE_STI
Message-ID: <Yqb4N3iwh1X7378o@hirez.programming.kicks-ass.net>
References: <20220608142723.103523089@infradead.org>
 <20220608144517.251109029@infradead.org>
 <CAJhGHyCnu_BsKf5STMMJKMWm0NVZ8qXT8Qh=BhhCjSSgwchL3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJhGHyCnu_BsKf5STMMJKMWm0NVZ8qXT8Qh=BhhCjSSgwchL3Q@mail.gmail.com>

On Mon, Jun 13, 2022 at 04:26:01PM +0800, Lai Jiangshan wrote:
> On Wed, Jun 8, 2022 at 10:48 PM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > Now that arch_cpu_idle() is expected to return with IRQs disabled,
> > avoid the useless STI/CLI dance.
> >
> > Per the specs this is supposed to work, but nobody has yet relied up
> > this behaviour so broken implementations are possible.
> 
> I'm totally newbie here.
> 
> The point of safe_halt() is that STI must be used and be used
> directly before HLT to enable IRQ during the halting and stop
> the halting if there is any IRQ.

Correct; on real hardware. But this is virt...

> In TDX case, STI must be used directly before the hypercall.
> Otherwise, no IRQ can come and the vcpu would be stalled forever.
> 
> Although the hypercall has an "irq_disabled" argument.
> But the hypervisor doesn't (and can't) touch the IRQ flags no matter
> what the "irq_disabled" argument is.  The IRQ is not enabled during
> the halting if the IRQ is disabled before the hypercall even if
> irq_disabled=false.

All we need the VMM to do is wake the vCPU, and it can do that,
irrespective of the guest's IF.

So the VMM can (and does) know if there's an interrupt pending, and
that's all that's needed to wake from this hypercall. Once the vCPU is
back up and running again, we'll eventually set IF again and the pending
interrupt will get delivered and all's well.

Think of this like MWAIT with ECX[0] set if you will.

