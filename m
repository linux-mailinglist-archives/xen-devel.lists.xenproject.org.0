Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23526524EFE
	for <lists+xen-devel@lfdr.de>; Thu, 12 May 2022 15:58:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327682.550526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1np9KV-0005Gl-8n; Thu, 12 May 2022 13:58:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327682.550526; Thu, 12 May 2022 13:58:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1np9KV-0005Dy-53; Thu, 12 May 2022 13:58:11 +0000
Received: by outflank-mailman (input) for mailman id 327682;
 Thu, 12 May 2022 13:58:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ErCJ=VU=amazon.de=prvs=124fe2d2c=mheyne@srs-se1.protection.inumbo.net>)
 id 1np9KS-0005De-S8
 for xen-devel@lists.xenproject.org; Thu, 12 May 2022 13:58:09 +0000
Received: from smtp-fw-6002.amazon.com (smtp-fw-6002.amazon.com [52.95.49.90])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85d179ce-d1fb-11ec-8fc4-03012f2f19d4;
 Thu, 12 May 2022 15:57:56 +0200 (CEST)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-iad-1a-a31e1d63.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-6002.iad6.amazon.com with ESMTP; 12 May 2022 13:58:05 +0000
Received: from EX13D08EUB003.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-iad-1a-a31e1d63.us-east-1.amazon.com (Postfix) with
 ESMTPS id 446238942B; Thu, 12 May 2022 13:57:56 +0000 (UTC)
Received: from EX13MTAUEE002.ant.amazon.com (10.43.62.24) by
 EX13D08EUB003.ant.amazon.com (10.43.166.117) with Microsoft SMTP Server (TLS)
 id 15.0.1497.32; Thu, 12 May 2022 13:57:55 +0000
Received: from dev-dsk-mheyne-1b-c1524648.eu-west-1.amazon.com (10.15.60.66)
 by mail-relay.amazon.com (10.43.62.224) with Microsoft SMTP Server id
 15.0.1497.32 via Frontend Transport; Thu, 12 May 2022 13:57:54 +0000
Received: by dev-dsk-mheyne-1b-c1524648.eu-west-1.amazon.com (Postfix,
 from userid 5466572)
 id 250F041131; Thu, 12 May 2022 13:57:54 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 85d179ce-d1fb-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1652363888; x=1683899888;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/jlcjyqHJJuyQxaME83nVeMauiezhLHJNpjQ1y9lQkI=;
  b=TF2AGPnjU42jW8xOvYkUvfg3yk3oIW2ZdCGknCJ3yl2Ny0gbMh9R+hAp
   +7Lew7qFbm6JxQvlq9MmClFcB7N5ssQcvvFCWCxn0TCdlAS7CD1qQy3hD
   r5sgOnhfIn4SZA9C1RRzA0AP9NPoJC7I1L3EHXOhnhhSBwq975cg17ihx
   M=;
X-IronPort-AV: E=Sophos;i="5.91,220,1647302400"; 
   d="scan'208";a="201008348"
From: Maximilian Heyne <mheyne@amazon.de>
To: <stable@vger.kernel.org>
CC: Masami Hiramatsu <mhiramat@kernel.org>, Peter Zijlstra
	<peterz@infradead.org>, Juergen Gross <jgross@suse.com>, <x86@kernel.org>,
	Ingo Molnar <mingo@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Borislav Petkov <bp@alien8.de>,
	<xen-devel@lists.xenproject.org>, Randy Dunlap <rdunlap@infradead.org>, Josh
 Poimboeuf <jpoimboe@redhat.com>, Maximilian Heyne <mheyne@amazon.de>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter
 Anvin" <hpa@zytor.com>, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>, Sean
 Christopherson <sean.j.christopherson@intel.com>, Vitaly Kuznetsov
	<vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, Jim Mattson
	<jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, Arnaldo Carvalho de
 Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander
 Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>, Sasha Levin <sashal@kernel.org>,
	<linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>
Subject: [PATCH 2/4] x86: xen: kvm: Gather the definition of emulate prefixes
Date: Thu, 12 May 2022 13:56:49 +0000
Message-ID: <20220512135654.119791-3-mheyne@amazon.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220512135654.119791-1-mheyne@amazon.de>
References: <20220512135654.119791-1-mheyne@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Masami Hiramatsu <mhiramat@kernel.org>

commit b3dc0695fa40c3b280230fb6fb7fb7a94ce28bf4 upstream

Gather the emulate prefixes, which forcibly make the following
instruction emulated on virtualization, in one place.

Suggested-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: Juergen Gross <jgross@suse.com>
Cc: x86@kernel.org
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: xen-devel@lists.xenproject.org
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>
Link: https://lkml.kernel.org/r/156777563917.25081.7286628561790289995.stgit@devnote2
Signed-off-by: Maximilian Heyne <mheyne@amazon.de>
Cc: stable@vger.kernel.org # 5.4.x
---
 arch/x86/include/asm/emulate_prefix.h | 14 ++++++++++++++
 arch/x86/include/asm/xen/interface.h  | 11 ++++-------
 arch/x86/kvm/x86.c                    |  4 +++-
 3 files changed, 21 insertions(+), 8 deletions(-)
 create mode 100644 arch/x86/include/asm/emulate_prefix.h

diff --git a/arch/x86/include/asm/emulate_prefix.h b/arch/x86/include/asm/emulate_prefix.h
new file mode 100644
index 000000000000..70f5b98a5286
--- /dev/null
+++ b/arch/x86/include/asm/emulate_prefix.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_X86_EMULATE_PREFIX_H
+#define _ASM_X86_EMULATE_PREFIX_H
+
+/*
+ * Virt escape sequences to trigger instruction emulation;
+ * ideally these would decode to 'whole' instruction and not destroy
+ * the instruction stream; sadly this is not true for the 'kvm' one :/
+ */
+
+#define __XEN_EMULATE_PREFIX  0x0f,0x0b,0x78,0x65,0x6e  /* ud2 ; .ascii "xen" */
+#define __KVM_EMULATE_PREFIX  0x0f,0x0b,0x6b,0x76,0x6d	/* ud2 ; .ascii "kvm" */
+
+#endif
diff --git a/arch/x86/include/asm/xen/interface.h b/arch/x86/include/asm/xen/interface.h
index 62ca03ef5c65..9139b3e86316 100644
--- a/arch/x86/include/asm/xen/interface.h
+++ b/arch/x86/include/asm/xen/interface.h
@@ -379,12 +379,9 @@ struct xen_pmu_arch {
  * Prefix forces emulation of some non-trapping instructions.
  * Currently only CPUID.
  */
-#ifdef __ASSEMBLY__
-#define XEN_EMULATE_PREFIX .byte 0x0f,0x0b,0x78,0x65,0x6e ;
-#define XEN_CPUID          XEN_EMULATE_PREFIX cpuid
-#else
-#define XEN_EMULATE_PREFIX ".byte 0x0f,0x0b,0x78,0x65,0x6e ; "
-#define XEN_CPUID          XEN_EMULATE_PREFIX "cpuid"
-#endif
+#include <asm/emulate_prefix.h>
+
+#define XEN_EMULATE_PREFIX __ASM_FORM(.byte __XEN_EMULATE_PREFIX ;)
+#define XEN_CPUID          XEN_EMULATE_PREFIX __ASM_FORM(cpuid)
 
 #endif /* _ASM_X86_XEN_INTERFACE_H */
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 1f7dfa5aa42d..6dd77e426889 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -68,6 +68,7 @@
 #include <asm/mshyperv.h>
 #include <asm/hypervisor.h>
 #include <asm/intel_pt.h>
+#include <asm/emulate_prefix.h>
 #include <clocksource/hyperv_timer.h>
 
 #define CREATE_TRACE_POINTS
@@ -5583,6 +5584,7 @@ EXPORT_SYMBOL_GPL(kvm_write_guest_virt_system);
 
 int handle_ud(struct kvm_vcpu *vcpu)
 {
+	static const char kvm_emulate_prefix[] = { __KVM_EMULATE_PREFIX };
 	int emul_type = EMULTYPE_TRAP_UD;
 	char sig[5]; /* ud2; .ascii "kvm" */
 	struct x86_exception e;
@@ -5590,7 +5592,7 @@ int handle_ud(struct kvm_vcpu *vcpu)
 	if (force_emulation_prefix &&
 	    kvm_read_guest_virt(vcpu, kvm_get_linear_rip(vcpu),
 				sig, sizeof(sig), &e) == 0 &&
-	    memcmp(sig, "\xf\xbkvm", sizeof(sig)) == 0) {
+	    memcmp(sig, kvm_emulate_prefix, sizeof(sig)) == 0) {
 		kvm_rip_write(vcpu, kvm_rip_read(vcpu) + sizeof(sig));
 		emul_type = EMULTYPE_TRAP_UD_FORCED;
 	}
-- 
2.32.0




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




