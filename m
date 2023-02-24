Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8B96A22A5
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 20:59:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501534.773324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVeDg-0004Df-I3; Fri, 24 Feb 2023 19:59:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501534.773324; Fri, 24 Feb 2023 19:59:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVeDg-0004AH-FL; Fri, 24 Feb 2023 19:59:04 +0000
Received: by outflank-mailman (input) for mailman id 501534;
 Fri, 24 Feb 2023 19:59:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V4+4=6U=citrix.com=prvs=412e064f8=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pVeDf-0004AA-Hk
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 19:59:03 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aba2c2d8-b47d-11ed-a82a-c9ca1d2f71af;
 Fri, 24 Feb 2023 20:58:58 +0100 (CET)
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
X-Inumbo-ID: aba2c2d8-b47d-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677268738;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PI+v5Dw4mRi5sdZsaH2koVPYCg9fqaOuR5R8xbwq2f0=;
  b=g8o7vptxZOarXlZ5mh5APJTwSAKRuBTGg3nvnlt/kL1DTnc+m8X/DHJP
   Z3u0Z4907yLrTjMIwffZ+T16u9PNssdC+s7zMcVT8ndZUr5lzISteRnnq
   IzByxSO7XxmJI4EJ5ihBVO65g2t53uDHcuvoIBnxuatOIfIbl7R/dPnUq
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 100887586
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:C74hTq5suHP9cXBIgTGkVwxRtCDHchMFZxGqfqrLsTDasY5as4F+v
 mYaC2rQPP/ZYDbyf9B0bNzg9x5XscWHmIAxSQo4qXpnHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+45wehBtC5gZlPaoR4AeF/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mx
 KZGBwAAKUG6tsWHmeKKU7VOlM4CBZy+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrlD5fydVtxS+oq0v7nKI5AdwzKLsIJzefdniqcB9xx7A9
 jKZojSnav0cHILG6CuAtXKHv8KMtyTZUbkwSuaT0PE/1TV/wURMUUZLBDNXu8KRqGSzRtZeI
 Ew84Tc1oO4580nDZtPgRQ+xpHmIuQEVc9VVGuw+rgqKz8L88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIU9x7Z/N82n0Y3JMazZfO2ldF1BtD8TfTJ8bv0iRYeZuV/+Mv/rEQGHB2
 myoviIfruBG5SIU7JmT8VfCijOqg5HGSA8p+wnaNl6YAhNFiJ2NPNLxtwWChRpUBMPAFwTa4
 iBY8ySLxLpWZaxhghBhVwnk8FuBw/+eeAPRjld0d3XK32T8oiXzFWy8DdwXGauIDirmUWW0C
 KMwkVkLjHO2AJdNRf4fXm5JI552pZUM7Py8PhwuUvJAY4JqaCiM9zx0aEib0gjFyRZzzvthY
 snKKJjxUh727JiLKxLsGo8gPUIDnHhilQs/u7imp/hY7VZuTCHMEupUWLd/Rus48LmFsG3oH
 yV3bqO3J+FkeLSmOEH/qNdDRW3m2FBnXfgaXeQLLL/cSuencUl9Y8LsLUQJK9A1wfQNyb6Sl
 px/M2cBoGfCabT8AV3iQhhehHnHBP6TcVpT0fQQAGuV
IronPort-HdrOrdr: A9a23:gyjosKGndcXdrgoVpLqEi8eALOsnbusQ8zAXPiFKKSC9F/byqy
 nAppkmPHPP4gr5O0tApTn/Asa9qBrnnPZICOIqUYtKMjOJhFeV
X-IronPort-AV: E=Sophos;i="5.97,325,1669093200"; 
   d="scan'208";a="100887586"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, Xenia Ragiadakou <burzalodowa@gmail.com>
Subject: [PATCH v3 04/14 - ALT] x86/svm: Remove the asm/hvm/svm/emulate.h header
Date: Fri, 24 Feb 2023 19:58:47 +0000
Message-ID: <20230224195847.2762464-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230224185010.3692754-5-burzalodowa@gmail.com>
References: <20230224185010.3692754-5-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

These days, this is just two length helpers.  Move into the private svm.h

No functional change intended.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/arch/x86/hvm/svm/emulate.c             |  3 +-
 xen/arch/x86/hvm/svm/nestedsvm.c           |  1 -
 xen/arch/x86/hvm/svm/svm.c                 |  1 -
 xen/arch/x86/hvm/svm/svm.h                 | 33 +++++++++++
 xen/arch/x86/include/asm/hvm/svm/emulate.h | 66 ----------------------
 5 files changed, 35 insertions(+), 69 deletions(-)
 delete mode 100644 xen/arch/x86/include/asm/hvm/svm/emulate.h

diff --git a/xen/arch/x86/hvm/svm/emulate.c b/xen/arch/x86/hvm/svm/emulate.c
index 16fc134883cf..391f0255162e 100644
--- a/xen/arch/x86/hvm/svm/emulate.c
+++ b/xen/arch/x86/hvm/svm/emulate.c
@@ -24,7 +24,8 @@
 #include <asm/hvm/hvm.h>
 #include <asm/hvm/svm/svm.h>
 #include <asm/hvm/svm/vmcb.h>
-#include <asm/hvm/svm/emulate.h>
+
+#include "svm.h"
 
 static unsigned long svm_nextrip_insn_length(struct vcpu *v)
 {
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index a341ccc8760e..c0b5474756f4 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -17,7 +17,6 @@
  */
 
 #include <asm/hvm/support.h>
-#include <asm/hvm/svm/emulate.h>
 #include <asm/hvm/svm/svm.h>
 #include <asm/hvm/svm/vmcb.h>
 #include <asm/hvm/nestedhvm.h>
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 46ae0b6602e2..97783b7f1118 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -37,7 +37,6 @@
 #include <asm/hvm/monitor.h>
 #include <asm/hvm/nestedhvm.h>
 #include <asm/hvm/support.h>
-#include <asm/hvm/svm/emulate.h>
 #include <asm/hvm/svm/nestedsvm.h>
 #include <asm/hvm/svm/svm.h>
 #include <asm/hvm/svm/svmdebug.h>
diff --git a/xen/arch/x86/hvm/svm/svm.h b/xen/arch/x86/hvm/svm/svm.h
index b8178f62161b..d2a781fc3fb5 100644
--- a/xen/arch/x86/hvm/svm/svm.h
+++ b/xen/arch/x86/hvm/svm/svm.h
@@ -13,6 +13,7 @@
 
 struct cpu_user_regs;
 struct cpuinfo_x86;
+struct vcpu;
 
 void svm_asid_init(const struct cpuinfo_x86 *c);
 void svm_asid_handle_vmrun(void);
@@ -43,6 +44,38 @@ static inline void svm_invlpga(unsigned long linear, uint32_t asid)
         "a" (linear), "c" (asid) );
 }
 
+/*
+ * Encoding for svm_get_insn_len().  We take X86EMUL_OPC() for the main
+ * opcode, shifted left to make room for the ModRM byte.
+ *
+ * The Grp7 instructions have their ModRM byte expressed in octal for easier
+ * cross referencing with the opcode extension table.
+ */
+#define INSTR_ENC(opc, modrm) (((opc) << 8) | (modrm))
+
+#define INSTR_PAUSE       INSTR_ENC(X86EMUL_OPC_F3(0, 0x90), 0)
+#define INSTR_INT3        INSTR_ENC(X86EMUL_OPC(   0, 0xcc), 0)
+#define INSTR_ICEBP       INSTR_ENC(X86EMUL_OPC(   0, 0xf1), 0)
+#define INSTR_HLT         INSTR_ENC(X86EMUL_OPC(   0, 0xf4), 0)
+#define INSTR_XSETBV      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0321)
+#define INSTR_VMRUN       INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0330)
+#define INSTR_VMCALL      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0331)
+#define INSTR_VMLOAD      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0332)
+#define INSTR_VMSAVE      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0333)
+#define INSTR_STGI        INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0334)
+#define INSTR_CLGI        INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0335)
+#define INSTR_INVLPGA     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0337)
+#define INSTR_RDTSCP      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0371)
+#define INSTR_INVD        INSTR_ENC(X86EMUL_OPC(0x0f, 0x08), 0)
+#define INSTR_WBINVD      INSTR_ENC(X86EMUL_OPC(0x0f, 0x09), 0)
+#define INSTR_WRMSR       INSTR_ENC(X86EMUL_OPC(0x0f, 0x30), 0)
+#define INSTR_RDTSC       INSTR_ENC(X86EMUL_OPC(0x0f, 0x31), 0)
+#define INSTR_RDMSR       INSTR_ENC(X86EMUL_OPC(0x0f, 0x32), 0)
+#define INSTR_CPUID       INSTR_ENC(X86EMUL_OPC(0x0f, 0xa2), 0)
+
+unsigned int svm_get_insn_len(struct vcpu *v, unsigned int instr_enc);
+unsigned int svm_get_task_switch_insn_len(void);
+
 /* TSC rate */
 #define DEFAULT_TSC_RATIO       0x0000000100000000ULL
 #define TSC_RATIO_RSVD_BITS     0xffffff0000000000ULL
diff --git a/xen/arch/x86/include/asm/hvm/svm/emulate.h b/xen/arch/x86/include/asm/hvm/svm/emulate.h
deleted file mode 100644
index eb1a8c24af6d..000000000000
--- a/xen/arch/x86/include/asm/hvm/svm/emulate.h
+++ /dev/null
@@ -1,66 +0,0 @@
-/*
- * emulate.h: SVM instruction emulation bits.
- * Copyright (c) 2005, AMD Corporation.
- * Copyright (c) 2004, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
- */
-
-#ifndef __ASM_X86_HVM_SVM_EMULATE_H__
-#define __ASM_X86_HVM_SVM_EMULATE_H__
-
-/*
- * Encoding for svm_get_insn_len().  We take X86EMUL_OPC() for the main
- * opcode, shifted left to make room for the ModRM byte.
- *
- * The Grp7 instructions have their ModRM byte expressed in octal for easier
- * cross referencing with the opcode extension table.
- */
-#define INSTR_ENC(opc, modrm) (((opc) << 8) | (modrm))
-
-#define INSTR_PAUSE       INSTR_ENC(X86EMUL_OPC_F3(0, 0x90), 0)
-#define INSTR_INT3        INSTR_ENC(X86EMUL_OPC(   0, 0xcc), 0)
-#define INSTR_ICEBP       INSTR_ENC(X86EMUL_OPC(   0, 0xf1), 0)
-#define INSTR_HLT         INSTR_ENC(X86EMUL_OPC(   0, 0xf4), 0)
-#define INSTR_XSETBV      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0321)
-#define INSTR_VMRUN       INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0330)
-#define INSTR_VMCALL      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0331)
-#define INSTR_VMLOAD      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0332)
-#define INSTR_VMSAVE      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0333)
-#define INSTR_STGI        INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0334)
-#define INSTR_CLGI        INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0335)
-#define INSTR_INVLPGA     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0337)
-#define INSTR_RDTSCP      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0371)
-#define INSTR_INVD        INSTR_ENC(X86EMUL_OPC(0x0f, 0x08), 0)
-#define INSTR_WBINVD      INSTR_ENC(X86EMUL_OPC(0x0f, 0x09), 0)
-#define INSTR_WRMSR       INSTR_ENC(X86EMUL_OPC(0x0f, 0x30), 0)
-#define INSTR_RDTSC       INSTR_ENC(X86EMUL_OPC(0x0f, 0x31), 0)
-#define INSTR_RDMSR       INSTR_ENC(X86EMUL_OPC(0x0f, 0x32), 0)
-#define INSTR_CPUID       INSTR_ENC(X86EMUL_OPC(0x0f, 0xa2), 0)
-
-struct vcpu;
-
-unsigned int svm_get_insn_len(struct vcpu *v, unsigned int instr_enc);
-unsigned int svm_get_task_switch_insn_len(void);
-
-#endif /* __ASM_X86_HVM_SVM_EMULATE_H__ */
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * tab-width: 4
- * indent-tabs-mode: nil
- * End:
- */
-- 
2.30.2


