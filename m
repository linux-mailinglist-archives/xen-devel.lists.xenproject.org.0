Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF342DCE56
	for <lists+xen-devel@lfdr.de>; Thu, 17 Dec 2020 10:32:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55774.97202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kppdW-0006SV-Ad; Thu, 17 Dec 2020 09:31:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55774.97202; Thu, 17 Dec 2020 09:31:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kppdW-0006S9-72; Thu, 17 Dec 2020 09:31:50 +0000
Received: by outflank-mailman (input) for mailman id 55774;
 Thu, 17 Dec 2020 09:31:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gjir=FV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kppdV-0006RQ-45
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 09:31:49 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1121d495-8f55-40c8-85d7-06bd245deb82;
 Thu, 17 Dec 2020 09:31:47 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 44FF5B1A1;
 Thu, 17 Dec 2020 09:31:46 +0000 (UTC)
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
X-Inumbo-ID: 1121d495-8f55-40c8-85d7-06bd245deb82
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608197506; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=E7FpqkqnD5unmDeE4sjWFYeLFL2ZgXDe6/5+3YmBT64=;
	b=a9yFTfK79u+NFXUZ4zWV8aHPpDUcRPDVvBCcSa9sHMiOYeRnwQj4sILTaezMzm4EYJQG+K
	gWtQy41s+pv/TtoyNIh8/P2b5G/eZiIFhJyS9RJs098dCw6tqaN2AHvfO5MUEHUwEaUz34
	+nKJxIVkWwafsJ2frUmJ4ePnkcxTR4M=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-hyperv@vger.kernel.org,
	kvm@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andy Lutomirski <luto@kernel.org>,
	Deep Shah <sdeep@vmware.com>,
	"VMware, Inc." <pv-drivers@vmware.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Stephen Hemminger <sthemmin@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Jim Mattson <jmattson@google.com>,
	Joerg Roedel <joro@8bytes.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Daniel Bristot de Oliveira <bristot@redhat.com>,
	Josh Poimboeuf <jpoimboe@redhat.com>
Subject: [PATCH v3 00/15] x86: major paravirt cleanup
Date: Thu, 17 Dec 2020 10:31:18 +0100
Message-Id: <20201217093133.1507-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a major cleanup of the paravirt infrastructure aiming at
eliminating all custom code patching via paravirt patching.

This is achieved by using ALTERNATIVE instead, leading to the ability
to give objtool access to the patched in instructions.

In order to remove most of the 32-bit special handling from pvops the
time related operations are switched to use static_call() instead.

At the end of this series all paravirt patching has to do is to
replace indirect calls with direct ones. In a further step this could
be switched to static_call(), too, but that would require a major
header file disentangling.

Changes in V3:
- added patches 7 and 12
- addressed all comments

Changes in V2:
- added patches 5-12

Juergen Gross (14):
  x86/xen: use specific Xen pv interrupt entry for MCE
  x86/xen: use specific Xen pv interrupt entry for DF
  x86/pv: switch SWAPGS to ALTERNATIVE
  x86/xen: drop USERGS_SYSRET64 paravirt call
  x86: rework arch_local_irq_restore() to not use popf
  x86/paravirt: switch time pvops functions to use static_call()
  x86/alternative: support "not feature" and ALTERNATIVE_TERNARY
  x86: add new features for paravirt patching
  x86/paravirt: remove no longer needed 32-bit pvops cruft
  x86/paravirt: simplify paravirt macros
  x86/paravirt: switch iret pvops to ALTERNATIVE
  x86/paravirt: add new macros PVOP_ALT* supporting pvops in
    ALTERNATIVEs
  x86/paravirt: switch functions with custom code to ALTERNATIVE
  x86/paravirt: have only one paravirt patch function

Peter Zijlstra (1):
  objtool: Alternatives vs ORC, the hard way

 arch/x86/Kconfig                       |   1 +
 arch/x86/entry/entry_32.S              |   4 +-
 arch/x86/entry/entry_64.S              |  26 ++-
 arch/x86/include/asm/alternative-asm.h |   3 +
 arch/x86/include/asm/alternative.h     |   7 +
 arch/x86/include/asm/cpufeatures.h     |   2 +
 arch/x86/include/asm/idtentry.h        |   6 +
 arch/x86/include/asm/irqflags.h        |  51 ++----
 arch/x86/include/asm/mshyperv.h        |  11 --
 arch/x86/include/asm/paravirt.h        | 157 ++++++------------
 arch/x86/include/asm/paravirt_time.h   |  38 +++++
 arch/x86/include/asm/paravirt_types.h  | 220 +++++++++----------------
 arch/x86/kernel/Makefile               |   3 +-
 arch/x86/kernel/alternative.c          |  59 ++++++-
 arch/x86/kernel/asm-offsets.c          |   7 -
 arch/x86/kernel/asm-offsets_64.c       |   3 -
 arch/x86/kernel/cpu/vmware.c           |   5 +-
 arch/x86/kernel/irqflags.S             |  11 --
 arch/x86/kernel/kvm.c                  |   3 +-
 arch/x86/kernel/kvmclock.c             |   3 +-
 arch/x86/kernel/paravirt.c             |  83 +++-------
 arch/x86/kernel/paravirt_patch.c       | 109 ------------
 arch/x86/kernel/tsc.c                  |   3 +-
 arch/x86/xen/enlighten_pv.c            |  36 ++--
 arch/x86/xen/irq.c                     |  23 ---
 arch/x86/xen/time.c                    |  12 +-
 arch/x86/xen/xen-asm.S                 |  52 +-----
 arch/x86/xen/xen-ops.h                 |   3 -
 drivers/clocksource/hyperv_timer.c     |   5 +-
 drivers/xen/time.c                     |   3 +-
 kernel/sched/sched.h                   |   1 +
 tools/objtool/check.c                  | 180 ++++++++++++++++++--
 tools/objtool/check.h                  |   5 +
 tools/objtool/orc_gen.c                | 178 +++++++++++++-------
 34 files changed, 627 insertions(+), 686 deletions(-)
 create mode 100644 arch/x86/include/asm/paravirt_time.h
 delete mode 100644 arch/x86/kernel/paravirt_patch.c

-- 
2.26.2


