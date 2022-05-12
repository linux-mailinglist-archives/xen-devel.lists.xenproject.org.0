Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2DF524F08
	for <lists+xen-devel@lfdr.de>; Thu, 12 May 2022 15:58:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327696.550570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1np9Ks-0006uu-ND; Thu, 12 May 2022 13:58:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327696.550570; Thu, 12 May 2022 13:58:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1np9Ks-0006sI-Ie; Thu, 12 May 2022 13:58:34 +0000
Received: by outflank-mailman (input) for mailman id 327696;
 Thu, 12 May 2022 13:58:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ErCJ=VU=amazon.de=prvs=124fe2d2c=mheyne@srs-se1.protection.inumbo.net>)
 id 1np9Kr-0005De-JA
 for xen-devel@lists.xenproject.org; Thu, 12 May 2022 13:58:33 +0000
Received: from smtp-fw-9102.amazon.com (smtp-fw-9102.amazon.com
 [207.171.184.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9455707d-d1fb-11ec-8fc4-03012f2f19d4;
 Thu, 12 May 2022 15:58:21 +0200 (CEST)
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-iad-1d-10222bbc.us-east-1.amazon.com) ([10.25.36.214])
 by smtp-border-fw-9102.sea19.amazon.com with ESMTP; 12 May 2022 13:58:10 +0000
Received: from EX13D08EUB002.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-iad-1d-10222bbc.us-east-1.amazon.com (Postfix) with
 ESMTPS id 217C31A0AE3; Thu, 12 May 2022 13:58:01 +0000 (UTC)
Received: from EX13MTAUEB002.ant.amazon.com (10.43.60.12) by
 EX13D08EUB002.ant.amazon.com (10.43.166.232) with Microsoft SMTP Server (TLS)
 id 15.0.1497.32; Thu, 12 May 2022 13:58:00 +0000
Received: from dev-dsk-mheyne-1b-c1524648.eu-west-1.amazon.com (10.15.60.66)
 by mail-relay.amazon.com (10.43.60.234) with Microsoft SMTP Server id
 15.0.1497.32 via Frontend Transport; Thu, 12 May 2022 13:57:59 +0000
Received: by dev-dsk-mheyne-1b-c1524648.eu-west-1.amazon.com (Postfix,
 from userid 5466572)
 id DDC9E41131; Thu, 12 May 2022 13:57:59 +0000 (UTC)
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
X-Inumbo-ID: 9455707d-d1fb-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1652363912; x=1683899912;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LcBCa7IjI6XtJDgdMuUyaVbxzp9zN8ViQS6A7OjaIjg=;
  b=cNap//AbOCjugIHYvG0sNGY8uL5V0o8/HhrlIUqfSHih0BVuc0i4v6it
   7AvUuHIqd70PfmmbNBcLMmk4jHWP7W/zsGVzgGq40Vm0C1o/cfNLcMCu2
   NPClaMaoi+3ykvvxXocrEOGZXDCfCJBYeh5i+xj54hjhdoa1FHDlsNWHo
   U=;
X-IronPort-AV: E=Sophos;i="5.91,220,1647302400"; 
   d="scan'208";a="218537903"
From: Maximilian Heyne <mheyne@amazon.de>
To: <stable@vger.kernel.org>
CC: Masami Hiramatsu <mhiramat@kernel.org>, Peter Zijlstra
	<peterz@infradead.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Juergen Gross
	<jgross@suse.com>, <x86@kernel.org>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, Ingo Molnar <mingo@kernel.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Borislav Petkov <bp@alien8.de>,
	<xen-devel@lists.xenproject.org>, Randy Dunlap <rdunlap@infradead.org>,
	Maximilian Heyne <mheyne@amazon.de>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Paolo
 Bonzini <pbonzini@redhat.com>, =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?=
	<rkrcmar@redhat.com>, Sean Christopherson <sean.j.christopherson@intel.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
	Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, Arnaldo
 Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa
	<jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>, Sasha Levin
	<sashal@kernel.org>, <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>
Subject: [PATCH 3/4] x86: xen: insn: Decode Xen and KVM emulate-prefix signature
Date: Thu, 12 May 2022 13:56:50 +0000
Message-ID: <20220512135654.119791-4-mheyne@amazon.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220512135654.119791-1-mheyne@amazon.de>
References: <20220512135654.119791-1-mheyne@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Masami Hiramatsu <mhiramat@kernel.org>

commit 4d65adfcd1196818659d3bd9b42dccab291e1751 upstream

Decode Xen and KVM's emulate-prefix signature by x86 insn decoder.
It is called "prefix" but actually not x86 instruction prefix, so
this adds insn.emulate_prefix_size field instead of reusing
insn.prefixes.

If x86 decoder finds a special sequence of instructions of
XEN_EMULATE_PREFIX and 'ud2a; .ascii "kvm"', it just counts the
length, set insn.emulate_prefix_size and fold it with the next
instruction. In other words, the signature and the next instruction
is treated as a single instruction.

Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Acked-by: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: x86@kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: xen-devel@lists.xenproject.org
Cc: Randy Dunlap <rdunlap@infradead.org>
Link: https://lkml.kernel.org/r/156777564986.25081.4964537658500952557.stgit@devnote2
[mheyne: resolved contextual conflict in tools/objtools/sync-check.sh]
Signed-off-by: Maximilian Heyne <mheyne@amazon.de>
Cc: stable@vger.kernel.org # 5.4.x
---
 arch/x86/include/asm/insn.h                 |  6 ++++
 arch/x86/lib/insn.c                         | 34 +++++++++++++++++++++
 tools/arch/x86/include/asm/emulate_prefix.h | 14 +++++++++
 tools/arch/x86/include/asm/insn.h           |  6 ++++
 tools/arch/x86/lib/insn.c                   | 34 +++++++++++++++++++++
 tools/objtool/sync-check.sh                 |  3 +-
 tools/perf/check-headers.sh                 |  3 +-
 7 files changed, 98 insertions(+), 2 deletions(-)
 create mode 100644 tools/arch/x86/include/asm/emulate_prefix.h

diff --git a/arch/x86/include/asm/insn.h b/arch/x86/include/asm/insn.h
index a51ffeea6d87..a8c3d284fa46 100644
--- a/arch/x86/include/asm/insn.h
+++ b/arch/x86/include/asm/insn.h
@@ -45,6 +45,7 @@ struct insn {
 		struct insn_field immediate2;	/* for 64bit imm or seg16 */
 	};
 
+	int	emulate_prefix_size;
 	insn_attr_t attr;
 	unsigned char opnd_bytes;
 	unsigned char addr_bytes;
@@ -128,6 +129,11 @@ static inline int insn_is_evex(struct insn *insn)
 	return (insn->vex_prefix.nbytes == 4);
 }
 
+static inline int insn_has_emulate_prefix(struct insn *insn)
+{
+	return !!insn->emulate_prefix_size;
+}
+
 /* Ensure this instruction is decoded completely */
 static inline int insn_complete(struct insn *insn)
 {
diff --git a/arch/x86/lib/insn.c b/arch/x86/lib/insn.c
index 0b5862ba6a75..404279563891 100644
--- a/arch/x86/lib/insn.c
+++ b/arch/x86/lib/insn.c
@@ -13,6 +13,8 @@
 #include <asm/inat.h>
 #include <asm/insn.h>
 
+#include <asm/emulate_prefix.h>
+
 /* Verify next sizeof(t) bytes can be on the same instruction */
 #define validate_next(t, insn, n)	\
 	((insn)->next_byte + sizeof(t) + n <= (insn)->end_kaddr)
@@ -58,6 +60,36 @@ void insn_init(struct insn *insn, const void *kaddr, int buf_len, int x86_64)
 		insn->addr_bytes = 4;
 }
 
+static const insn_byte_t xen_prefix[] = { __XEN_EMULATE_PREFIX };
+static const insn_byte_t kvm_prefix[] = { __KVM_EMULATE_PREFIX };
+
+static int __insn_get_emulate_prefix(struct insn *insn,
+				     const insn_byte_t *prefix, size_t len)
+{
+	size_t i;
+
+	for (i = 0; i < len; i++) {
+		if (peek_nbyte_next(insn_byte_t, insn, i) != prefix[i])
+			goto err_out;
+	}
+
+	insn->emulate_prefix_size = len;
+	insn->next_byte += len;
+
+	return 1;
+
+err_out:
+	return 0;
+}
+
+static void insn_get_emulate_prefix(struct insn *insn)
+{
+	if (__insn_get_emulate_prefix(insn, xen_prefix, sizeof(xen_prefix)))
+		return;
+
+	__insn_get_emulate_prefix(insn, kvm_prefix, sizeof(kvm_prefix));
+}
+
 /**
  * insn_get_prefixes - scan x86 instruction prefix bytes
  * @insn:	&struct insn containing instruction
@@ -76,6 +108,8 @@ void insn_get_prefixes(struct insn *insn)
 	if (prefixes->got)
 		return;
 
+	insn_get_emulate_prefix(insn);
+
 	nb = 0;
 	lb = 0;
 	b = peek_next(insn_byte_t, insn);
diff --git a/tools/arch/x86/include/asm/emulate_prefix.h b/tools/arch/x86/include/asm/emulate_prefix.h
new file mode 100644
index 000000000000..70f5b98a5286
--- /dev/null
+++ b/tools/arch/x86/include/asm/emulate_prefix.h
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
diff --git a/tools/arch/x86/include/asm/insn.h b/tools/arch/x86/include/asm/insn.h
index d7f0ae8f3c44..52c6262e6bfd 100644
--- a/tools/arch/x86/include/asm/insn.h
+++ b/tools/arch/x86/include/asm/insn.h
@@ -45,6 +45,7 @@ struct insn {
 		struct insn_field immediate2;	/* for 64bit imm or seg16 */
 	};
 
+	int	emulate_prefix_size;
 	insn_attr_t attr;
 	unsigned char opnd_bytes;
 	unsigned char addr_bytes;
@@ -128,6 +129,11 @@ static inline int insn_is_evex(struct insn *insn)
 	return (insn->vex_prefix.nbytes == 4);
 }
 
+static inline int insn_has_emulate_prefix(struct insn *insn)
+{
+	return !!insn->emulate_prefix_size;
+}
+
 /* Ensure this instruction is decoded completely */
 static inline int insn_complete(struct insn *insn)
 {
diff --git a/tools/arch/x86/lib/insn.c b/tools/arch/x86/lib/insn.c
index 79e048f1d902..0151dfc6da61 100644
--- a/tools/arch/x86/lib/insn.c
+++ b/tools/arch/x86/lib/insn.c
@@ -13,6 +13,8 @@
 #include "../include/asm/inat.h"
 #include "../include/asm/insn.h"
 
+#include "../include/asm/emulate_prefix.h"
+
 /* Verify next sizeof(t) bytes can be on the same instruction */
 #define validate_next(t, insn, n)	\
 	((insn)->next_byte + sizeof(t) + n <= (insn)->end_kaddr)
@@ -58,6 +60,36 @@ void insn_init(struct insn *insn, const void *kaddr, int buf_len, int x86_64)
 		insn->addr_bytes = 4;
 }
 
+static const insn_byte_t xen_prefix[] = { __XEN_EMULATE_PREFIX };
+static const insn_byte_t kvm_prefix[] = { __KVM_EMULATE_PREFIX };
+
+static int __insn_get_emulate_prefix(struct insn *insn,
+				     const insn_byte_t *prefix, size_t len)
+{
+	size_t i;
+
+	for (i = 0; i < len; i++) {
+		if (peek_nbyte_next(insn_byte_t, insn, i) != prefix[i])
+			goto err_out;
+	}
+
+	insn->emulate_prefix_size = len;
+	insn->next_byte += len;
+
+	return 1;
+
+err_out:
+	return 0;
+}
+
+static void insn_get_emulate_prefix(struct insn *insn)
+{
+	if (__insn_get_emulate_prefix(insn, xen_prefix, sizeof(xen_prefix)))
+		return;
+
+	__insn_get_emulate_prefix(insn, kvm_prefix, sizeof(kvm_prefix));
+}
+
 /**
  * insn_get_prefixes - scan x86 instruction prefix bytes
  * @insn:	&struct insn containing instruction
@@ -76,6 +108,8 @@ void insn_get_prefixes(struct insn *insn)
 	if (prefixes->got)
 		return;
 
+	insn_get_emulate_prefix(insn);
+
 	nb = 0;
 	lb = 0;
 	b = peek_next(insn_byte_t, insn);
diff --git a/tools/objtool/sync-check.sh b/tools/objtool/sync-check.sh
index c3ae1e8ae119..2a1261bfbb62 100755
--- a/tools/objtool/sync-check.sh
+++ b/tools/objtool/sync-check.sh
@@ -4,6 +4,7 @@
 FILES='
 arch/x86/include/asm/inat_types.h
 arch/x86/include/asm/orc_types.h
+arch/x86/include/asm/emulate_prefix.h
 arch/x86/lib/x86-opcode-map.txt
 arch/x86/tools/gen-insn-attr-x86.awk
 '
@@ -46,4 +47,4 @@ done
 check arch/x86/include/asm/inat.h     '-I "^#include [\"<]\(asm/\)*inat_types.h[\">]"'
 check arch/x86/include/asm/insn.h     '-I "^#include [\"<]\(asm/\)*inat.h[\">]"'
 check arch/x86/lib/inat.c             '-I "^#include [\"<]\(../include/\)*asm/insn.h[\">]"'
-check arch/x86/lib/insn.c             '-I "^#include [\"<]\(../include/\)*asm/in\(at\|sn\).h[\">]"'
+check arch/x86/lib/insn.c             '-I "^#include [\"<]\(../include/\)*asm/in\(at\|sn\).h[\">]" -I "^#include [\"<]\(../include/\)*asm/emulate_prefix.h[\">]"'
diff --git a/tools/perf/check-headers.sh b/tools/perf/check-headers.sh
index cea13cb987d0..499235a41162 100755
--- a/tools/perf/check-headers.sh
+++ b/tools/perf/check-headers.sh
@@ -28,6 +28,7 @@ arch/x86/include/asm/disabled-features.h
 arch/x86/include/asm/required-features.h
 arch/x86/include/asm/cpufeatures.h
 arch/x86/include/asm/inat_types.h
+arch/x86/include/asm/emulate_prefix.h
 arch/x86/include/uapi/asm/prctl.h
 arch/x86/lib/x86-opcode-map.txt
 arch/x86/tools/gen-insn-attr-x86.awk
@@ -116,7 +117,7 @@ check lib/ctype.c		      '-I "^EXPORT_SYMBOL" -I "^#include <linux/export.h>" -B
 check arch/x86/include/asm/inat.h     '-I "^#include [\"<]\(asm/\)*inat_types.h[\">]"'
 check arch/x86/include/asm/insn.h     '-I "^#include [\"<]\(asm/\)*inat.h[\">]"'
 check arch/x86/lib/inat.c	      '-I "^#include [\"<]\(../include/\)*asm/insn.h[\">]"'
-check arch/x86/lib/insn.c	      '-I "^#include [\"<]\(../include/\)*asm/in\(at\|sn\).h[\">]"'
+check arch/x86/lib/insn.c             '-I "^#include [\"<]\(../include/\)*asm/in\(at\|sn\).h[\">]" -I "^#include [\"<]\(../include/\)*asm/emulate_prefix.h[\">]"'
 
 # diff non-symmetric files
 check_2 tools/perf/arch/x86/entry/syscalls/syscall_64.tbl arch/x86/entry/syscalls/syscall_64.tbl
-- 
2.32.0




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




