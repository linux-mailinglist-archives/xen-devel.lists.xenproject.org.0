Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A119CA188E6
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2025 01:22:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875739.1286163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taOVh-0004es-0T; Wed, 22 Jan 2025 00:22:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875739.1286163; Wed, 22 Jan 2025 00:22:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taOVg-0004cF-TU; Wed, 22 Jan 2025 00:22:20 +0000
Received: by outflank-mailman (input) for mailman id 875739;
 Wed, 22 Jan 2025 00:22:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VMsP=UO=kernel.org=frederic@srs-se1.protection.inumbo.net>)
 id 1taOVf-0004c9-Ay
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2025 00:22:19 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef930b97-d856-11ef-a0e5-8be0dac302b0;
 Wed, 22 Jan 2025 01:22:17 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5B5B6A42598;
 Wed, 22 Jan 2025 00:20:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A0ECC4CEDF;
 Wed, 22 Jan 2025 00:22:15 +0000 (UTC)
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
X-Inumbo-ID: ef930b97-d856-11ef-a0e5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737505335;
	bh=/jGFli4cvz5GuKwl53vdKodQbbfB6lqGAT1IVg71WEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m6yz2ru+LXXh5xzgW1nRGofBLoFG1mOtZGKi5a///oNnHCh2ZlX7+dcv8uCWMxNTP
	 NYc7Ip5HhxveoM1UG1zbALPWHqlghrr9FWkgxzL4ynzknjr2qzRJNXR0bvmmp0LFhV
	 2OSMqyc+t3WixyaNjJpsZ4FqrFQOpqBUkDbXqnD8oIRzHSRo6BI6S0PtYY51ka7mXT
	 F/aNHCRlDP27nrL0iFxyIILAmTVs3KAxdOxLI4Oy09Y/BLpA3KwnyrjprYZYiv2vA6
	 /XRCO70HAGc/N4UdSrMWqxSo9SxN0390mZcC3+duriCj1eGd6MeQlfVWwQxOpCa2cX
	 9AeBV3eiLnmoQ==
Date: Wed, 22 Jan 2025 01:22:12 +0100
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
Message-ID: <Z5A6NPqVGoZ32YsN@pavilion.home>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-23-vschneid@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250114175143.81438-23-vschneid@redhat.com>

Le Tue, Jan 14, 2025 at 06:51:35PM +0100, Valentin Schneider a écrit :
> ct_nmi_{enter, exit}() only touches the RCU watching counter and doesn't
> modify the actual CT state part context_tracking.state. This means that
> upon receiving an IRQ when idle, the CT_STATE_IDLE->CT_STATE_KERNEL
> transition only happens in ct_idle_exit().
> 
> One can note that ct_nmi_enter() can only ever be entered with the CT state
> as either CT_STATE_KERNEL or CT_STATE_IDLE, as an IRQ/NMI happenning in the
> CT_STATE_USER or CT_STATE_GUEST states will be routed down to ct_user_exit().

Are you sure? An NMI can fire between guest_state_enter_irqoff() and
__svm_vcpu_run(). And NMIs interrupting userspace don't call
enter_from_user_mode(). In fact they don't call irqentry_enter_from_user_mode()
like regular IRQs but irqentry_nmi_enter() instead. Well that's for archs
implementing common entry code, I can't speak for the others.

Unifying the behaviour between user and idle such that the IRQs/NMIs exit the
CT_STATE can be interesting but I fear this may not come for free. You would
need to save the old state on IRQ/NMI entry and restore it on exit.

Do we really need it?

Thanks.

