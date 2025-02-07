Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 784B5A2CB79
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2025 19:39:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.883888.1293732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgTEs-0004wm-MH; Fri, 07 Feb 2025 18:38:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 883888.1293732; Fri, 07 Feb 2025 18:38:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgTEs-0004ud-Je; Fri, 07 Feb 2025 18:38:06 +0000
Received: by outflank-mailman (input) for mailman id 883888;
 Fri, 07 Feb 2025 18:38:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D7PW=U6=kernel.org=frederic@srs-se1.protection.inumbo.net>)
 id 1tgTEq-0004uX-Or
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2025 18:38:04 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a901b5ac-e582-11ef-b3ef-695165c68f79;
 Fri, 07 Feb 2025 19:38:02 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BA41AA439E4;
 Fri,  7 Feb 2025 18:36:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4FB8C4CED1;
 Fri,  7 Feb 2025 18:37:59 +0000 (UTC)
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
X-Inumbo-ID: a901b5ac-e582-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738953480;
	bh=nKtIeXe1WybNWDzZwu5Tk8fpz5emsmZs04c0W6ceGA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NlQrJCswb2tfBHdOL//Nqi1duhWdmo0hhnvyFyfXR+kDIctwxBbNZGMh0uVXpdrpn
	 VtrsS32dlVeABXURIIGFmPTMZ88JEy/aky3D6z70pfkEKIebKtTmA3OIqxmZ3iDcEH
	 trWQP7mjMuGosKO+a09FIi/HB1+rytKm2YepWGLYPhGRvhc49fQbsTVEVzSz1vy8KY
	 6YWoxRaVR88tPNIw47TXvof69pWZuIN0NCuUntVn/ixzcMSAUzD+pD+us46BW7ocRi
	 X6a7pzBJZI/SEPEJ2Eua3jvdWjb6R21icBFzIt4mEif2XISSYrHb7WAcNTWLbqa0Er
	 f0yIWw7KhrZxA==
Date: Fri, 7 Feb 2025 19:37:57 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Valentin Schneider <vschneid@redhat.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	virtualization@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-perf-users@vger.kernel.org,
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
	linux-arch@vger.kernel.org, rcu@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, bpf@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	Juergen Gross <jgross@suse.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.amakhalov@broadcom.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joel@joelfernandes.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang1211@gmail.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Clark Williams <williams@redhat.com>,
	Yair Podemsky <ypodemsk@redhat.com>,
	Tomas Glozar <tglozar@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Kees Cook <kees@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@infradead.org>,
	Shuah Khan <shuah@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Rong Xu <xur@google.com>,
	Nicolas Saenz Julienne <nsaenzju@redhat.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Yosry Ahmed <yosryahmed@google.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	Jinghao Jia <jinghao7@illinois.edu>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v4 22/30] context_tracking: Exit CT_STATE_IDLE upon
 irq/nmi entry
Message-ID: <Z6ZTBXUiEOLVcSKp@pavilion.home>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-23-vschneid@redhat.com>
 <Z5A6NPqVGoZ32YsN@pavilion.home>
 <xhsmh5xm0pkuo.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <xhsmhbjvdk7kq.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <xhsmhbjvdk7kq.mognet@vschneid-thinkpadt14sgen2i.remote.csb>

Le Fri, Feb 07, 2025 at 06:06:45PM +0100, Valentin Schneider a écrit :
> On 27/01/25 12:17, Valentin Schneider wrote:
> > On 22/01/25 01:22, Frederic Weisbecker wrote:
> >> And NMIs interrupting userspace don't call
> >> enter_from_user_mode(). In fact they don't call irqentry_enter_from_user_mode()
> >> like regular IRQs but irqentry_nmi_enter() instead. Well that's for archs
> >> implementing common entry code, I can't speak for the others.
> >>
> >
> > That I didn't realize, so thank you for pointing it out. Having another
> > look now, I mistook DEFINE_IDTENTRY_RAW(exc_int3) for the general case
> > when it really isn't :(
> >
> >> Unifying the behaviour between user and idle such that the IRQs/NMIs exit the
> >> CT_STATE can be interesting but I fear this may not come for free. You would
> >> need to save the old state on IRQ/NMI entry and restore it on exit.
> >>
> >
> > That's what I tried to avoid, but it sounds like there's no nice way around it.
> >
> >> Do we really need it?
> >>
> >
> > Well, my problem with not doing IDLE->KERNEL transitions on IRQ/NMI is that
> > this leads the IPI deferral logic to observe a technically-out-of-sync sate
> > for remote CPUs. Consider:
> >
> >   CPUx            CPUy
> >                     state := CT_STATE_IDLE
> >                     ...
> >                     ~>IRQ
> >                     ...
> >                     ct_nmi_enter()
> >                     [in the kernel proper by now]
> >
> >   text_poke_bp_batch()
> >     ct_set_cpu_work(CPUy, CT_WORK_SYNC)
> >       READ CPUy ct->state
> >       `-> CT_IDLE_STATE
> >       `-> defer IPI
> >
> >
> > I thought this meant I would need to throw out the "defer IPIs if CPU is
> > idle" part, but AIUI this also affects CT_STATE_USER and CT_STATE_GUEST,
> > which is a bummer :(
> 
> Soooo I've been thinking...
> 
> Isn't
> 
>   (context_tracking.state & CT_RCU_WATCHING)
> 
> pretty much a proxy for knowing whether a CPU is executing in kernelspace,
> including NMIs?

You got it!

> 
> NMI interrupts userspace/VM/idle -> ct_nmi_enter()   -> it becomes true
> IRQ interrupts idle              -> ct_irq_enter()   -> it becomes true
> IRQ interrupts userspace         -> __ct_user_exit() -> it becomes true
> IRQ interrupts VM                -> __ct_user_exit() -> it becomes true
> 
> IOW, if I gate setting deferred work by checking for this instead of
> explicitely CT_STATE_KERNEL, "it should work" and prevent the
> aforementioned issue? Or should I be out drinking instead? :-)

Exactly it should work! Now that doesn't mean you can't go out
for a drink :-)

Thanks.

