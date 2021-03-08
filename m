Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FBD330D84
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 13:29:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94856.178756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJF0W-00057L-2i; Mon, 08 Mar 2021 12:29:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94856.178756; Mon, 08 Mar 2021 12:29:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJF0V-00056A-UB; Mon, 08 Mar 2021 12:29:07 +0000
Received: by outflank-mailman (input) for mailman id 94856;
 Mon, 08 Mar 2021 12:29:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7wcm=IG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lJF0U-0004nW-AG
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 12:29:06 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 26545cf8-4a4f-41b9-bb9f-1b7c120a9b36;
 Mon, 08 Mar 2021 12:28:52 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EE520ADCD;
 Mon,  8 Mar 2021 12:28:50 +0000 (UTC)
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
X-Inumbo-ID: 26545cf8-4a4f-41b9-bb9f-1b7c120a9b36
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615206531; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Pj0+lsoXMYSDviFMNu3CfGDulAqhBZd0duxurV0jt/k=;
	b=ullbjypHk4a2OSdXRZBXV7LzXx1wRPq0P3DUkuf3g00TxnX2Kvmikn2mvZgT5yu1bK+GT9
	Pb18L02feaPu+UmwjPoQNvBkbpJDORl8H6ArZ/XWAobYvxZmsd1kHtOeWcA3mN+bVvHI/I
	evXt2ltyGZ054ZgETkOoGM4IjjxGEog=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hyperv@vger.kernel.org,
	kvm@vger.kernel.org,
	clang-built-linux@googlegroups.com
Cc: Juergen Gross <jgross@suse.com>,
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
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
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
	Andy Lutomirski <luto@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH v5 00/12] x86: major paravirt cleanup
Date: Mon,  8 Mar 2021 13:28:32 +0100
Message-Id: <20210308122844.30488-1-jgross@suse.com>
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

Juergen Gross (12):
  staticcall: move struct static_call_key definition to
    static_call_types.h
  x86/paravirt: switch time pvops functions to use static_call()
  x86/alternative: drop feature parameter from ALTINSTR_REPLACEMENT()
  x86/alternative: support not-feature
  x86/alternative: support ALTERNATIVE_TERNARY
  x86: add new features for paravirt patching
  x86/paravirt: remove no longer needed 32-bit pvops cruft
  x86/paravirt: simplify paravirt macros
  x86/paravirt: switch iret pvops to ALTERNATIVE
  x86/paravirt: add new macros PVOP_ALT* supporting pvops in
    ALTERNATIVEs
  x86/paravirt: switch functions with custom code to ALTERNATIVE
  x86/paravirt: have only one paravirt patch function

 arch/arm/include/asm/paravirt.h               |  14 +-
 arch/arm/kernel/paravirt.c                    |   9 +-
 arch/arm64/include/asm/paravirt.h             |  14 +-
 arch/arm64/kernel/paravirt.c                  |  13 +-
 arch/x86/Kconfig                              |   1 +
 arch/x86/entry/entry_32.S                     |   4 +-
 arch/x86/entry/entry_64.S                     |   2 +-
 arch/x86/include/asm/alternative-asm.h        |  10 +
 arch/x86/include/asm/alternative.h            |  28 ++-
 arch/x86/include/asm/cpufeature.h             |   2 +
 arch/x86/include/asm/cpufeatures.h            |   2 +
 arch/x86/include/asm/irqflags.h               |   7 +-
 arch/x86/include/asm/mshyperv.h               |   2 +-
 arch/x86/include/asm/paravirt.h               | 167 +++++++-------
 arch/x86/include/asm/paravirt_types.h         | 210 +++++++-----------
 arch/x86/kernel/Makefile                      |   3 +-
 arch/x86/kernel/alternative.c                 |  37 ++-
 arch/x86/kernel/asm-offsets.c                 |   7 -
 arch/x86/kernel/cpu/vmware.c                  |   5 +-
 arch/x86/kernel/kvm.c                         |   2 +-
 arch/x86/kernel/kvmclock.c                    |   2 +-
 arch/x86/kernel/paravirt-spinlocks.c          |   9 +
 arch/x86/kernel/paravirt.c                    |  78 ++-----
 arch/x86/kernel/paravirt_patch.c              |  99 ---------
 arch/x86/kernel/tsc.c                         |   2 +-
 arch/x86/xen/enlighten_pv.c                   |   4 +-
 arch/x86/xen/time.c                           |  11 +-
 drivers/xen/time.c                            |   3 +-
 include/linux/static_call.h                   |  18 --
 include/linux/static_call_types.h             |  18 ++
 tools/include/linux/static_call_types.h       |  18 ++
 tools/objtool/arch/x86/include/arch/special.h |   6 +-
 32 files changed, 339 insertions(+), 468 deletions(-)
 delete mode 100644 arch/x86/kernel/paravirt_patch.c

-- 
2.26.2


