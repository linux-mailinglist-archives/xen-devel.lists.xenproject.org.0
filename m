Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B5FA10EA8
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 18:59:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871648.1282633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXlBi-0003Jp-LJ; Tue, 14 Jan 2025 17:58:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871648.1282633; Tue, 14 Jan 2025 17:58:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXlBi-0003IE-HL; Tue, 14 Jan 2025 17:58:50 +0000
Received: by outflank-mailman (input) for mailman id 871648;
 Tue, 14 Jan 2025 17:52:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Qro=UG=redhat.com=vschneid@srs-se1.protection.inumbo.net>)
 id 1tXl63-0002zS-9K
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 17:52:59 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62a28cdc-d2a0-11ef-a0e1-8be0dac302b0;
 Tue, 14 Jan 2025 18:52:57 +0100 (CET)
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-523-VoXCR5IgO0KVO9YPu5k6sw-1; Tue,
 14 Jan 2025 12:52:53 -0500
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id F1D241956059; Tue, 14 Jan 2025 17:52:47 +0000 (UTC)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (unknown [10.39.192.55])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix)
 with ESMTPS id 62E9C195608A; Tue, 14 Jan 2025 17:52:18 +0000 (UTC)
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
X-Inumbo-ID: 62a28cdc-d2a0-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736877176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eUZWh6RdpXqevgtwM7GO1PdkjkoPSVHNTkFKZr43JQk=;
	b=MwR6VkooiosStphOPkbg3KeNs/Jb6S49cVlzo5bGtXU2OJOO/Ii8ad184aGVcGp747LTpo
	3+37WW8zK3zIzl/RLQd3m10N63mhDOxQpyKdu4SoJSNFda3i6p4PjrGsuKjOv+b2w+11Cr
	whXJt04z8T3Aahn/X+lFJ68pUO2BQkE=
X-MC-Unique: VoXCR5IgO0KVO9YPu5k6sw-1
X-Mimecast-MFC-AGG-ID: VoXCR5IgO0KVO9YPu5k6sw
From: Valentin Schneider <vschneid@redhat.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	virtualization@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	linux-arch@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	bpf@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Cc: Juergen Gross <jgross@suse.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.amakhalov@broadcom.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
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
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Kees Cook <kees@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@infradead.org>,
	Shuah Khan <shuah@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
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
Subject: [PATCH v4 00/30] context_tracking,x86: Defer some IPIs until a user->kernel transition
Date: Tue, 14 Jan 2025 18:51:13 +0100
Message-ID: <20250114175143.81438-1-vschneid@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Context
=======

We've observed within Red Hat that isolated, NOHZ_FULL CPUs running a
pure-userspace application get regularly interrupted by IPIs sent from
housekeeping CPUs. Those IPIs are caused by activity on the housekeeping CPUs
leading to various on_each_cpu() calls, e.g.:

  64359.052209596    NetworkManager       0    1405     smp_call_function_many_cond (cpu=0, func=do_kernel_range_flush)
    smp_call_function_many_cond+0x1
    smp_call_function+0x39
    on_each_cpu+0x2a
    flush_tlb_kernel_range+0x7b
    __purge_vmap_area_lazy+0x70
    _vm_unmap_aliases.part.42+0xdf
    change_page_attr_set_clr+0x16a
    set_memory_ro+0x26
    bpf_int_jit_compile+0x2f9
    bpf_prog_select_runtime+0xc6
    bpf_prepare_filter+0x523
    sk_attach_filter+0x13
    sock_setsockopt+0x92c
    __sys_setsockopt+0x16a
    __x64_sys_setsockopt+0x20
    do_syscall_64+0x87
    entry_SYSCALL_64_after_hwframe+0x65

The heart of this series is the thought that while we cannot remove NOHZ_FULL
CPUs from the list of CPUs targeted by these IPIs, they may not have to execute
the callbacks immediately. Anything that only affects kernelspace can wait
until the next user->kernel transition, providing it can be executed "early
enough" in the entry code.

The original implementation is from Peter [1]. Nicolas then added kernel TLB
invalidation deferral to that [2], and I picked it up from there.

Deferral approach
=================

Storing each and every callback, like a secondary call_single_queue turned out
to be a no-go: the whole point of deferral is to keep NOHZ_FULL CPUs in
userspace for as long as possible - no signal of any form would be sent when
deferring an IPI. This means that any form of queuing for deferred callbacks
would end up as a convoluted memory leak.

Deferred IPIs must thus be coalesced, which this series achieves by assigning
IPIs a "type" and having a mapping of IPI type to callback, leveraged upon
kernel entry.

What about IPIs whose callback take a parameter, you may ask?

Peter suggested during OSPM23 [3] that since on_each_cpu() targets
housekeeping CPUs *and* isolated CPUs, isolated CPUs can access either global or
housekeeping-CPU-local state to "reconstruct" the data that would have been sent
via the IPI.

This series does not affect any IPI callback that requires an argument, but the
approach would remain the same (one coalescable callback executed on kernel
entry).

Kernel entry vs execution of the deferred operation
===================================================

This is what I've referred to as the "Danger Zone" during my LPC24 talk [4].

There is a non-zero length of code that is executed upon kernel entry before the
deferred operation can be itself executed (i.e. before we start getting into
context_tracking.c proper), i.e.:

  idtentry_func_foo()                <--- we're in the kernel
    irqentry_enter()
      enter_from_user_mode()
	__ct_user_exit()
	    ct_kernel_enter_state()
	      ct_work_flush()        <--- deferred operation is executed here

This means one must take extra care to what can happen in the early entry code,
and that <bad things> cannot happen. For instance, we really don't want to hit
instructions that have been modified by a remote text_poke() while we're on our
way to execute a deferred sync_core(). Patches doing the actual deferral have
more detail on this.

Patches
=======

o Patches 1-2 are standalone objtool cleanups.

o Patches 3-4 add an RCU testing feature.

o Patches 5-6 add infrastructure for annotating static keys and static calls
  that may be used in noinstr code (courtesy of Josh).
o Patches 7-19 use said annotations on relevant keys / calls.
o Patch 20 enforces proper usage of said annotations (courtesy of Josh).

o Patches 21-23 fiddle with CT_STATE* within context tracking

o Patches 24-29 add the actual IPI deferral faff

o Patch 30 adds a freebie: deferring IPIs for NOHZ_IDLE. Not tested that much!
  if you care about battery-powered devices and energy consumption, go give it
  a try!

Patches are also available at:
https://gitlab.com/vschneid/linux.git -b redhat/isolirq/defer/v4

Stuff I'd like eyes and neurons on
==================================

Context-tracking vs idle. Patch 22 "improves" the situation by adding an
IDLE->KERNEL transition when getting an IRQ while idle, but it leaves the
following window:

  ~> IRQ
  ct_nmi_enter()
    state = state + CT_STATE_KERNEL - CT_STATE_IDLE

  [...]

  ct_nmi_exit()
    state = state - CT_STATE_KERNEL + CT_STATE_IDLE

  [...] /!\ CT_STATE_IDLE here while we're really in kernelspace! /!\

  ct_cpuidle_exit()
    state = state + CT_STATE_KERNEL - CT_STATE_IDLE

Said window is contained within cpu_idle_poll() and the cpuidle call within
cpuidle_enter_state(), both being noinstr (the former is __cpuidle which is
noinstr itself). Thus objtool will consider it as early entry and will warn
accordingly of any static key / call misuse, so the damage is somewhat
contained, but it's not ideal.

I tried fiddling with this but idle polling likes being annoying, as it is
shaped like so:

	ct_cpuidle_enter();

	raw_local_irq_enable();
	while (!tif_need_resched() &&
	       (cpu_idle_force_poll || tick_check_broadcast_expired()))
		cpu_relax();
	raw_local_irq_disable();

	ct_cpuidle_exit();

IOW, getting an IRQ that doesn't end up setting NEED_RESCHED while idle-polling
doesn't come near ct_cpuidle_exit(), which prevents me from having the outermost
ct_nmi_exit() leave the state as CT_STATE_KERNEL (rather than CT_STATE_IDLE).

Testing
=======

Xeon E5-2699 system with SMToff, NOHZ_FULL, isolated CPUs.
RHEL9 userspace.

Workload is using rteval (kernel compilation + hackbench) on housekeeping CPUs
and a dummy stay-in-userspace loop on the isolated CPUs. The main invocation is:

$ trace-cmd record -e "csd_queue_cpu" -f "cpu & CPUS{$ISOL_CPUS}" \
 	           -e "ipi_send_cpumask" -f "cpumask & CPUS{$ISOL_CPUS}" \
	           -e "ipi_send_cpu"     -f "cpu & CPUS{$ISOL_CPUS}" \
		   rteval --onlyload --loads-cpulist=$HK_CPUS \
		   --hackbench-runlowmem=True --duration=$DURATION

This only records IPIs sent to isolated CPUs, so any event there is interference
(with a bit of fuzz at the start/end of the workload when spawning the
processes). All tests were done with a duration of 6 hours.

v6.13-rc6
# This is the actual IPI count
$ trace-cmd report | grep callback | awk '{ print $(NF) }' | sort | uniq -c | sort -nr
    531 callback=generic_smp_call_function_single_interrupt+0x0

# These are the different CSD's that caused IPIs    
$ trace-cmd report | grep csd_queue | awk '{ print $(NF-1) }' | sort | uniq -c | sort -nr
  12818 func=do_flush_tlb_all
    910 func=do_kernel_range_flush
     78 func=do_sync_core

v6.13-rc6 + patches:
# This is the actual IPI count
$ trace-cmd report | grep callback | awk '{ print $(NF) }' | sort | uniq -c | sort -nr
# Zilch!

# These are the different CSD's that caused IPIs          
$ trace-cmd report | grep csd_queue | awk '{ print $(NF-1) }' | sort | uniq -c | sort -nr
# Nada!

Note that tlb_remove_table_smp_sync() showed up during testing of v3, and has
gone as mysteriously as it showed up. Yair had a series adressing this [5] which
would be worth revisiting.

Acknowledgements
================

Special thanks to:
o Clark Williams for listening to my ramblings about this and throwing ideas my way
o Josh Poimboeuf for all his help with everything objtool-related
o All of the folks who attended various (too many?) talks about this and
  provided precious feedback.  

Links
=====

[1]: https://lore.kernel.org/all/20210929151723.162004989@infradead.org/
[2]: https://github.com/vianpl/linux.git -b ct-work-defer-wip
[3]: https://youtu.be/0vjE6fjoVVE
[4]: https://lpc.events/event/18/contributions/1889/
[5]: https://lore.kernel.org/lkml/20230620144618.125703-1-ypodemsk@redhat.com/

Revisions
=========

RFCv3 -> v4
++++++++++++++

o Rebased onto v6.13-rc6

o New objtool patches from Josh
o More .noinstr static key/call patches
o Static calls now handled as well (again thanks to Josh)

o Fixed clearing the work bits on kernel exit
o Messed with IRQ hitting an idle CPU vs context tracking
o Various comment and naming cleanups

o Made RCU_DYNTICKS_TORTURE depend on !COMPILE_TEST (PeterZ)
o Fixed the CT_STATE_KERNEL check when setting a deferred work (Frederic)
o Cleaned up the __flush_tlb_all() mess thanks to PeterZ

RFCv2 -> RFCv3
++++++++++++++

o Rebased onto v6.12-rc6

o Added objtool documentation for the new warning (Josh)
o Added low-size RCU watching counter to TREE04 torture scenario (Paul)
o Added FORCEFUL jump label and static key types
o Added noinstr-compliant helpers for tlb flush deferral


RFCv1 -> RFCv2
++++++++++++++

o Rebased onto v6.5-rc1

o Updated the trace filter patches (Steven)

o Fixed __ro_after_init keys used in modules (Peter)
o Dropped the extra context_tracking atomic, squashed the new bits in the
  existing .state field (Peter, Frederic)
  
o Added an RCU_EXPERT config for the RCU dynticks counter size, and added an
  rcutorture case for a low-size counter (Paul) 

o Fixed flush_tlb_kernel_range_deferrable() definition

Josh Poimboeuf (3):
  jump_label: Add annotations for validating noinstr usage
  static_call: Add read-only-after-init static calls
  objtool: Add noinstr validation for static branches/calls

Peter Zijlstra (1):
  x86,tlb: Make __flush_tlb_global() noinstr-compliant

Valentin Schneider (26):
  objtool: Make validate_call() recognize indirect calls to pv_ops[]
  objtool: Flesh out warning related to pv_ops[] calls
  rcu: Add a small-width RCU watching counter debug option
  rcutorture: Make TREE04 use CONFIG_RCU_DYNTICKS_TORTURE
  x86/paravirt: Mark pv_sched_clock static call as __ro_after_init
  x86/idle: Mark x86_idle static call as __ro_after_init
  x86/paravirt: Mark pv_steal_clock static call as __ro_after_init
  riscv/paravirt: Mark pv_steal_clock static call as __ro_after_init
  loongarch/paravirt: Mark pv_steal_clock static call as __ro_after_init
  arm64/paravirt: Mark pv_steal_clock static call as __ro_after_init
  arm/paravirt: Mark pv_steal_clock static call as __ro_after_init
  perf/x86/amd: Mark perf_lopwr_cb static call as __ro_after_init
  sched/clock: Mark sched_clock_running key as __ro_after_init
  x86/speculation/mds: Mark mds_idle_clear key as allowed in .noinstr
  sched/clock, x86: Mark __sched_clock_stable key as allowed in .noinstr
  x86/kvm/vmx: Mark vmx_l1d_should flush and vmx_l1d_flush_cond keys as
    allowed in .noinstr
  stackleack: Mark stack_erasing_bypass key as allowed in .noinstr
  context_tracking: Explicitely use CT_STATE_KERNEL where it is missing
  context_tracking: Exit CT_STATE_IDLE upon irq/nmi entry
  context_tracking: Turn CT_STATE_* into bits
  context-tracking: Introduce work deferral infrastructure
  context_tracking,x86: Defer kernel text patching IPIs
  x86/tlb: Make __flush_tlb_local() noinstr-compliant
  x86/tlb: Make __flush_tlb_all() noinstr
  x86/mm, mm/vmalloc: Defer flush_tlb_kernel_range() targeting NOHZ_FULL
    CPUs
  context-tracking: Add a Kconfig to enable IPI deferral for NO_HZ_IDLE

 arch/Kconfig                                  |   9 ++
 arch/arm/kernel/paravirt.c                    |   2 +-
 arch/arm64/kernel/paravirt.c                  |   2 +-
 arch/loongarch/kernel/paravirt.c              |   2 +-
 arch/riscv/kernel/paravirt.c                  |   2 +-
 arch/x86/Kconfig                              |   1 +
 arch/x86/events/amd/brs.c                     |   2 +-
 arch/x86/include/asm/context_tracking_work.h  |  22 ++++
 arch/x86/include/asm/invpcid.h                |  13 +--
 arch/x86/include/asm/paravirt.h               |   4 +-
 arch/x86/include/asm/text-patching.h          |   1 +
 arch/x86/include/asm/tlbflush.h               |   3 +-
 arch/x86/include/asm/xen/hypercall.h          |  11 +-
 arch/x86/kernel/alternative.c                 |  38 ++++++-
 arch/x86/kernel/cpu/bugs.c                    |   9 +-
 arch/x86/kernel/kprobes/core.c                |   4 +-
 arch/x86/kernel/kprobes/opt.c                 |   4 +-
 arch/x86/kernel/module.c                      |   2 +-
 arch/x86/kernel/paravirt.c                    |   4 +-
 arch/x86/kernel/process.c                     |   2 +-
 arch/x86/kvm/vmx/vmx.c                        |  11 +-
 arch/x86/mm/tlb.c                             |  46 ++++++--
 arch/x86/xen/mmu_pv.c                         |  10 +-
 arch/x86/xen/xen-ops.h                        |  12 +-
 include/asm-generic/sections.h                |  15 +++
 include/linux/context_tracking.h              |  21 ++++
 include/linux/context_tracking_state.h        |  64 +++++++++--
 include/linux/context_tracking_work.h         |  28 +++++
 include/linux/jump_label.h                    |  30 ++++-
 include/linux/objtool.h                       |   7 ++
 include/linux/static_call.h                   |  19 ++++
 kernel/context_tracking.c                     |  98 ++++++++++++++--
 kernel/rcu/Kconfig.debug                      |  15 +++
 kernel/sched/clock.c                          |   7 +-
 kernel/stackleak.c                            |   6 +-
 kernel/time/Kconfig                           |  19 ++++
 mm/vmalloc.c                                  |  35 +++++-
 tools/objtool/Documentation/objtool.txt       |  34 ++++++
 tools/objtool/check.c                         | 106 +++++++++++++++---
 tools/objtool/include/objtool/check.h         |   1 +
 tools/objtool/include/objtool/elf.h           |   1 +
 tools/objtool/include/objtool/special.h       |   1 +
 tools/objtool/special.c                       |  18 ++-
 .../selftests/rcutorture/configs/rcu/TREE04   |   1 +
 44 files changed, 635 insertions(+), 107 deletions(-)
 create mode 100644 arch/x86/include/asm/context_tracking_work.h
 create mode 100644 include/linux/context_tracking_work.h

--
2.43.0


