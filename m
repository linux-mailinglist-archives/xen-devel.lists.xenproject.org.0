Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC584705737
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 21:36:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535563.833401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz0Sz-0001mc-1O; Tue, 16 May 2023 19:36:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535563.833401; Tue, 16 May 2023 19:36:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz0Sy-0001kK-UY; Tue, 16 May 2023 19:36:12 +0000
Received: by outflank-mailman (input) for mailman id 535563;
 Tue, 16 May 2023 19:36:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oY92=BF=kernel.org=arnd@srs-se1.protection.inumbo.net>)
 id 1pz0Sx-0001kC-Ps
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 19:36:11 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7e5406d-f420-11ed-b229-6b7b168915f2;
 Tue, 16 May 2023 21:36:09 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 21AD563CFE;
 Tue, 16 May 2023 19:36:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5E20C433EF;
 Tue, 16 May 2023 19:36:01 +0000 (UTC)
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
X-Inumbo-ID: e7e5406d-f420-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684265767;
	bh=oAoSmF3XxuLgHtI7FvZzT7auqFocUXgu+0MePwNsyrE=;
	h=From:To:Cc:Subject:Date:From;
	b=KwDbO61f3SBWhJix8Gr20ak/Qqboqqh3ldX/gA4euZLkNvRlBoYXYxgW34oKD5+bq
	 lgA3GGHMsATzDaZfCh2jM0WzWNvEFjiOGPlsVGcQu/sXjiIoK3zNv5yWDm1DhznX7Y
	 9C89B6xO5lEbyaGUNpJ+Oy07z9iVjaOP927NmsglHmbwU2P2dm4OwFSIPr5PJ2r5Gz
	 1qqAqLg3NzZPU+tuOvCbIzt9KUilvGUbJ8Y+hlsLmDHIjedHIx/H1y1Bj+xZR8Goe8
	 03nF3w/T1w6FhjESnpTOJw33XxK0QUG9UAP0KyuSJ0VYZg4J2UxgOMGzi+kT2/XCMT
	 GZd4OSYv/yqOQ==
From: Arnd Bergmann <arnd@kernel.org>
To: x86@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Juergen Gross <jgross@suse.com>,
	"Srivatsa S. Bhat (VMware)" <srivatsa@csail.mit.edu>,
	Alexey Makhalov <amakhalov@vmware.com>,
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Darren Hart <dvhart@infradead.org>,
	Andy Shevchenko <andy@infradead.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-pci@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-pm@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 00/20] x86: address -Wmissing-prototype warnings
Date: Tue, 16 May 2023 21:35:29 +0200
Message-Id: <20230516193549.544673-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

This addresses all x86 specific prototype warnings. The majority of the
patches should be straightforward, either adding an #include statement
to get the right header, or ensuring that an unused global function is
left out of the build when the prototype is hidden.

The ones that are a bit awkward are those that just add a prototype to
shut up the warning, but the prototypes are never used for calling the
function because the only caller is in assembler code. I tried to come up
with other ways to shut up the compiler using the asmlinkage annotation,
but with no success.

All of the warnings have to be addressed in some form before the warning
can be enabled by default.

    Arnd

Link: https://people.kernel.org/arnd/missing-prototype-warnings-in-the-kernel


Arnd Bergmann (20):
  x86: move prepare_ftrace_return prototype to header
  x86: ce4100: Mark local functions as 'static'
  x86: apic: hide unused safe_smp_processor_id on UP
  x86: avoid unneeded __div64_32 function definition
  x86: head: add dummy prototype for mk_early_pgtbl_32
  x86: math-emu: include asm/fpu/regset.h
  x86: doublefault: avoid missing-prototype warnings
  x86: highmem: include asm/numa.h for set_highmem_pages_init
  x86: platform_quirks: include linux/pnp.h for arch_pnpbios_disabled
  x86: xen: add missing prototypes
  x86: entry: add  do_SYSENTER_32() prototype
  x86: qspinlock-paravirt: fix mising-prototype warnings
  x86: hibernate: declare global functions in suspend.h
  x86: fbdev: include asm/fb.h as needed
  x86: mce: add copy_mc_fragile_handle_tail prototype
  x86: vdso: include vdso/processor.h
  x86: usercopy: include arch_wb_cache_pmem declaration
  x86: ioremap: add early_memremap_pgprot_adjust prototype
  x86: purgatory: include header for warn() declaration
  x86: olpc: avoid missing-prototype warnings

 arch/x86/boot/compressed/error.c          |  2 +-
 arch/x86/boot/compressed/error.h          |  2 +-
 arch/x86/entry/vdso/vgetcpu.c             |  1 +
 arch/x86/include/asm/div64.h              |  2 ++
 arch/x86/include/asm/doublefault.h        |  4 ++++
 arch/x86/include/asm/ftrace.h             |  3 +++
 arch/x86/include/asm/mce.h                |  3 +++
 arch/x86/include/asm/qspinlock_paravirt.h |  2 ++
 arch/x86/include/asm/syscall.h            |  6 ++++--
 arch/x86/kernel/apic/ipi.c                |  2 ++
 arch/x86/kernel/doublefault_32.c          |  1 +
 arch/x86/kernel/ftrace.c                  |  3 ---
 arch/x86/kernel/head32.c                  |  1 +
 arch/x86/kernel/paravirt.c                |  2 ++
 arch/x86/kernel/platform-quirks.c         |  1 +
 arch/x86/lib/usercopy_64.c                |  1 +
 arch/x86/math-emu/fpu_entry.c             |  1 +
 arch/x86/mm/highmem_32.c                  |  1 +
 arch/x86/pci/ce4100.c                     |  4 ++--
 arch/x86/platform/olpc/olpc_dt.c          |  2 +-
 arch/x86/purgatory/purgatory.c            |  1 +
 arch/x86/video/fbdev.c                    |  1 +
 arch/x86/xen/efi.c                        |  2 ++
 arch/x86/xen/smp.h                        |  3 +++
 arch/x86/xen/xen-ops.h                    | 14 ++++++++++++++
 include/linux/io.h                        |  5 +++++
 include/linux/olpc-ec.h                   |  2 ++
 include/linux/suspend.h                   |  4 ++++
 include/xen/xen.h                         |  3 +++
 kernel/locking/qspinlock_paravirt.h       | 20 ++++++++++----------
 kernel/power/power.h                      |  5 -----
 mm/internal.h                             |  6 ------
 32 files changed, 79 insertions(+), 31 deletions(-)

-- 
2.39.2

Cc: Thomas Gleixner <tglx@linutronix.de> (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT),commit_signer:1/5=20%,authored:1/5=20%)
Cc: Ingo Molnar <mingo@redhat.com> (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT))
Cc: Borislav Petkov <bp@alien8.de> (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT),commit_signer:1/3=33%,commit_signer:1/5=20%,authored:1/5=20%,removed_lines:40/51=78%)
Cc: Dave Hansen <dave.hansen@linux.intel.com> (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT),commit_signer:1/5=20%)
Cc: x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT))
Cc: "H. Peter Anvin" <hpa@zytor.com> (reviewer:X86 ARCHITECTURE (32-BIT AND 64-BIT))
Cc: Andy Lutomirski <luto@kernel.org> (maintainer:X86 VDSO)
Cc: Steven Rostedt <rostedt@goodmis.org> (maintainer:FUNCTION HOOKS (FTRACE))
Cc: Masami Hiramatsu <mhiramat@kernel.org> (maintainer:FUNCTION HOOKS (FTRACE))
Cc: Mark Rutland <mark.rutland@arm.com> (reviewer:FUNCTION HOOKS (FTRACE))
Cc: Juergen Gross <jgross@suse.com> (supporter:PARAVIRT_OPS INTERFACE,commit_signer:2/5=40%,authored:1/5=20%,added_lines:20/31=65%,removed_lines:27/35=77%)
Cc: "Srivatsa S. Bhat (VMware)" <srivatsa@csail.mit.edu> (supporter:PARAVIRT_OPS INTERFACE)
Cc: Alexey Makhalov <amakhalov@vmware.com> (reviewer:PARAVIRT_OPS INTERFACE)
Cc: VMware PV-Drivers Reviewers <pv-drivers@vmware.com> (reviewer:PARAVIRT_OPS INTERFACE)
Cc: Peter Zijlstra <peterz@infradead.org> (maintainer:X86 MM,commit_signer:4/5=80%,commit_signer:1/2=50%)
Cc: Darren Hart <dvhart@infradead.org> (reviewer:X86 PLATFORM DRIVERS - ARCH)
Cc: Andy Shevchenko <andy@infradead.org> (reviewer:X86 PLATFORM DRIVERS - ARCH)
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com> (reviewer:XEN HYPERVISOR X86)
Cc: "Rafael J. Wysocki" <rafael@kernel.org> (supporter:HIBERNATION (aka Software Suspend, aka swsusp))
Cc: linux-kernel@vger.kernel.org (open list:X86 ARCHITECTURE (32-BIT AND 64-BIT))
Cc: linux-trace-kernel@vger.kernel.org (open list:FUNCTION HOOKS (FTRACE))
Cc: virtualization@lists.linux-foundation.org (open list:PARAVIRT_OPS INTERFACE)
Cc: linux-pci@vger.kernel.org (open list:PCI SUBSYSTEM)
Cc: platform-driver-x86@vger.kernel.org (open list:X86 PLATFORM DRIVERS - ARCH)
Cc: xen-devel@lists.xenproject.org (moderated list:XEN HYPERVISOR X86)
Cc: linux-pm@vger.kernel.org (open list:HIBERNATION (aka Software Suspend, aka swsusp))
Cc: linux-mm@kvack.org (open list:MEMORY MANAGEMENT)


