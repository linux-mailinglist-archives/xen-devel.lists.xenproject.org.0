Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEF2A30D9C
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 15:03:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885569.1295373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thqrH-0001Aq-6T; Tue, 11 Feb 2025 14:03:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885569.1295373; Tue, 11 Feb 2025 14:03:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thqrH-00018f-3R; Tue, 11 Feb 2025 14:03:27 +0000
Received: by outflank-mailman (input) for mailman id 885569;
 Tue, 11 Feb 2025 14:03:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m2IW=VC=arm.com=mark.rutland@srs-se1.protection.inumbo.net>)
 id 1thqrF-00018J-62
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 14:03:25 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id f4a35efd-e880-11ef-a075-877d107080fb;
 Tue, 11 Feb 2025 15:03:23 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D37F113D5;
 Tue, 11 Feb 2025 06:03:43 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE72E3F6A8;
 Tue, 11 Feb 2025 06:03:10 -0800 (PST)
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
X-Inumbo-ID: f4a35efd-e880-11ef-a075-877d107080fb
Date: Tue, 11 Feb 2025 14:03:08 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Valentin Schneider <vschneid@redhat.com>
Cc: Jann Horn <jannh@google.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, virtualization@lists.linux.dev,
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
	Frederic Weisbecker <frederic@kernel.org>,
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
Subject: Re: [PATCH v4 29/30] x86/mm, mm/vmalloc: Defer
 flush_tlb_kernel_range() targeting NOHZ_FULL CPUs
Message-ID: <Z6tYnOEBkOlT_ehp@J2N7QTR9R3>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-30-vschneid@redhat.com>
 <CAG48ez1Mh+DOy0ysOo7Qioxh1W7xWQyK9CLGNU9TGOsLXbg=gQ@mail.gmail.com>
 <xhsmh34hhh37q.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <CAG48ez3H8OVP1GxBLdmFgusvT1gQhwu2SiXbgi8T9uuCYVK52w@mail.gmail.com>
 <xhsmh5xlhk5p2.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <CAG48ez1EAATYcX520Nnw=P8XtUDSr5pe+qGH1YVNk3xN2LE05g@mail.gmail.com>
 <xhsmh34gkk3ls.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <xhsmh34gkk3ls.mognet@vschneid-thinkpadt14sgen2i.remote.csb>

On Tue, Feb 11, 2025 at 02:33:51PM +0100, Valentin Schneider wrote:
> On 10/02/25 23:08, Jann Horn wrote:
> > On Mon, Feb 10, 2025 at 7:36 PM Valentin Schneider <vschneid@redhat.com> wrote:
> >> What if isolated CPUs unconditionally did a TLBi as late as possible in
> >> the stack right before returning to userspace? This would mean that upon
> >> re-entering the kernel, an isolated CPU's TLB wouldn't contain any kernel
> >> range translation - with the exception of whatever lies between the
> >> last-minute flush and the actual userspace entry, which should be feasible
> >> to vet? Then AFAICT there wouldn't be any work/flush to defer, the IPI
> >> could be entirely silenced if it targets an isolated CPU.
> >
> > Two issues with that:
> 
> Firstly, thank you for entertaining the idea :-)
> 
> > 1. I think the "Common not Private" feature Will Deacon referred to is
> > incompatible with this idea:
> > <https://developer.arm.com/documentation/101811/0104/Address-spaces/Common-not-Private>
> > says "When the CnP bit is set, the software promises to use the ASIDs
> > and VMIDs in the same way on all processors, which allows the TLB
> > entries that are created by one processor to be used by another"
> 
> Sorry for being obtuse - I can understand inconsistent TLB states (old vs
> new translations being present in separate TLBs) due to not sending the
> flush IPI causing an issue with that, but not "flushing early". Even if TLB
> entries can be shared/accessed between CPUs, a CPU should be allowed not to
> have a shared entry in its TLB - what am I missing?
> 
> > 2. It's wrong to assume that TLB entries are only populated for
> > addresses you access - thanks to speculative execution, you have to
> > assume that the CPU might be populating random TLB entries all over
> > the place.
> 
> Gotta love speculation. Now it is supposed to be limited to genuinely
> accessible data & code, right? Say theoretically we have a full TLBi as
> literally the last thing before doing the return-to-userspace, speculation
> should be limited to executing maybe bits of the return-from-userspace
> code?

I think it's easier to ignore speculation entirely, and just assume that
the MMU can arbitrarily fill TLB entries from any page table entries
which are valid/accessible in the active page tables. Hardware
prefetchers can do that regardless of the specific path of speculative
execution.

Thus TLB fills are not limited to VAs which would be used on that
return-to-userspace path.

> Furthermore, I would hope that once a CPU is executing in userspace, it's
> not going to populate the TLB with kernel address translations - AIUI the
> whole vulnerability mitigation debacle was about preventing this sort of
> thing.

The CPU can definitely do that; the vulnerability mitigations are all
about what userspace can observe rather than what the CPU can do in the
background. Additionally, there are features like SPE and TRBE that use
kernel addresses while the CPU is executing userspace instructions.

The latest ARM Architecture Reference Manual (ARM DDI 0487 L.a) is fairly clear
about that in section D8.16 "Translation Lookaside Buff", where it says
(among other things):

  When address translation is enabled, if a translation table entry
  meets all of the following requirements, then that translation table
  entry is permitted to be cached in a TLB or intermediate TLB caching
  structure at any time:
  • The translation table entry itself does not generate a Translation
    fault, an Address size fault, or an Access flag fault.
  • The translation table entry is not from a translation regime
    configured by an Exception level that is lower than the current
    Exception level.

Here "permitted to be cached in a TLB" also implies that the HW is
allowed to fetch the translation tabl entry (which is what ARM call page
table entries).

The PDF can be found at:

  https://developer.arm.com/documentation/ddi0487/la/?lang=en

Mark.

