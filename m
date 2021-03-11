Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 465F5337565
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 15:23:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96573.182831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKMDm-0003aD-VS; Thu, 11 Mar 2021 14:23:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96573.182831; Thu, 11 Mar 2021 14:23:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKMDm-0003ZL-K8; Thu, 11 Mar 2021 14:23:26 +0000
Received: by outflank-mailman (input) for mailman id 96573;
 Thu, 11 Mar 2021 14:23:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+5TX=IJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lKMDl-0003YP-1n
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 14:23:25 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a193490-165a-4615-bed4-c8fa15d56401;
 Thu, 11 Mar 2021 14:23:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DB47BAC23;
 Thu, 11 Mar 2021 14:23:22 +0000 (UTC)
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
X-Inumbo-ID: 4a193490-165a-4615-bed4-c8fa15d56401
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615472603; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=po4QZsHAN+vzX5uvzJmshXlPCac7n69c5r9Fdn0dvCo=;
	b=sjqqOUQpbELgunG51bLYnaAneLdLoAHn6rXcSwK/DsFchfLZJWPal7opKb2RUZtxFSKIEo
	JbtKBiDJ2iWmLlE8dN17PcQJiP6NCqXX2GAZhWcMmbQgbNa+4/4kethaBp09UxMuCAjwFQ
	d8u620eAOSyPtbAZDTHxKFPkybBM2LQ=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hyperv@vger.kernel.org,
	kvm@vger.kernel.org,
	clang-built-linux@googlegroups.com
Cc: Juergen Gross <jgross@suse.com>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Jason Baron <jbaron@akamai.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Deep Shah <sdeep@vmware.com>,
	"VMware, Inc." <pv-drivers@vmware.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
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
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH v7 00/14] x86: major paravirt cleanup
Date: Thu, 11 Mar 2021 15:23:05 +0100
Message-Id: <20210311142319.4723-1-jgross@suse.com>
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
be switched to static_call(), too.

Changes in V7:
- dropped patch 3, as already applied on tip tree
- new patch 3 (patches 1 and 7 have been added to V6 late)
- addressed comments by Boris

Changes in V6:
- switched back to "not" bit in feature value for "not feature"
- other minor comments addressed

Changes in V5:
- patches 1-5 of V4 dropped, as already applied
- new patches 1+3
- fixed patch 2
- split V4 patch 8 into patches 4+5
- use flag byte instead of negative feature bit for "not feature"

Changes in V4:
- fixed several build failures
- removed objtool patch, as objtool patches are in tip now
- added patch 1 for making usage of static_call easier
- even more cleanup

Changes in V3:
- added patches 7 and 12
- addressed all comments

Changes in V2:
- added patches 5-12

Juergen Gross (14):
  x86/alternative: merge include files
  static_call: move struct static_call_key definition to
    static_call_types.h
  static_call: add function to query current function
  x86/paravirt: switch time pvops functions to use static_call()
  x86/alternative: support not-feature
  x86/alternative: support ALTERNATIVE_TERNARY
  x86/alternative: don't open code ALTERNATIVE_TERNARY() in
    _static_cpu_has()
  x86: add new features for paravirt patching
  x86/paravirt: remove no longer needed 32-bit pvops cruft
  x86/paravirt: simplify paravirt macros
  x86/paravirt: switch iret pvops to ALTERNATIVE
  x86/paravirt: add new macros PVOP_ALT* supporting pvops in
    ALTERNATIVEs
  x86/paravirt: switch functions with custom code to ALTERNATIVE
  x86/paravirt: have only one paravirt patch function

 arch/arm/include/asm/paravirt.h          |  14 +-
 arch/arm/kernel/paravirt.c               |   9 +-
 arch/arm64/include/asm/paravirt.h        |  14 +-
 arch/arm64/kernel/paravirt.c             |  13 +-
 arch/x86/Kconfig                         |   1 +
 arch/x86/entry/entry_32.S                |   6 +-
 arch/x86/entry/entry_64.S                |   2 +-
 arch/x86/entry/vdso/vdso32/system_call.S |   2 +-
 arch/x86/include/asm/alternative-asm.h   | 114 ------------
 arch/x86/include/asm/alternative.h       | 126 +++++++++++++-
 arch/x86/include/asm/cpufeature.h        |  41 +----
 arch/x86/include/asm/cpufeatures.h       |   2 +
 arch/x86/include/asm/irqflags.h          |   7 +-
 arch/x86/include/asm/mshyperv.h          |   2 +-
 arch/x86/include/asm/nospec-branch.h     |   1 -
 arch/x86/include/asm/paravirt.h          | 167 ++++++++----------
 arch/x86/include/asm/paravirt_types.h    | 210 +++++++++--------------
 arch/x86/include/asm/smap.h              |   5 +-
 arch/x86/kernel/Makefile                 |   3 +-
 arch/x86/kernel/alternative.c            |  52 +++++-
 arch/x86/kernel/asm-offsets.c            |   7 -
 arch/x86/kernel/cpu/vmware.c             |   5 +-
 arch/x86/kernel/kvm.c                    |   2 +-
 arch/x86/kernel/kvmclock.c               |   2 +-
 arch/x86/kernel/paravirt-spinlocks.c     |   9 +
 arch/x86/kernel/paravirt.c               |  75 ++------
 arch/x86/kernel/paravirt_patch.c         |  99 -----------
 arch/x86/kernel/tsc.c                    |   3 +-
 arch/x86/lib/atomic64_386_32.S           |   2 +-
 arch/x86/lib/atomic64_cx8_32.S           |   2 +-
 arch/x86/lib/copy_page_64.S              |   2 +-
 arch/x86/lib/copy_user_64.S              |   2 +-
 arch/x86/lib/memcpy_64.S                 |   2 +-
 arch/x86/lib/memmove_64.S                |   2 +-
 arch/x86/lib/memset_64.S                 |   2 +-
 arch/x86/lib/retpoline.S                 |   2 +-
 arch/x86/xen/enlighten_pv.c              |   4 +-
 arch/x86/xen/time.c                      |  26 +--
 drivers/xen/time.c                       |   3 +-
 include/linux/static_call.h              |  26 +--
 include/linux/static_call_types.h        |  18 ++
 tools/include/linux/static_call_types.h  |  18 ++
 42 files changed, 473 insertions(+), 631 deletions(-)
 delete mode 100644 arch/x86/include/asm/alternative-asm.h
 delete mode 100644 arch/x86/kernel/paravirt_patch.c

-- 
2.26.2


