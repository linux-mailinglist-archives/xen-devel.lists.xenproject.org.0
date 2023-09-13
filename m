Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA35F79F2DB
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 22:28:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601591.937706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgWTP-00078a-H9; Wed, 13 Sep 2023 20:28:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601591.937706; Wed, 13 Sep 2023 20:28:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgWTP-000755-66; Wed, 13 Sep 2023 20:28:31 +0000
Received: by outflank-mailman (input) for mailman id 601591;
 Wed, 13 Sep 2023 20:28:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z4av=E5=citrix.com=prvs=613b8bbe6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qgWTN-0004dA-0e
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 20:28:29 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18084ff1-5274-11ee-8787-cb3800f73035;
 Wed, 13 Sep 2023 22:28:27 +0200 (CEST)
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
X-Inumbo-ID: 18084ff1-5274-11ee-8787-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694636906;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zKE4TU+LF26IXN40K9i0T1Kvr1B0IL2da7a6adH2ZkM=;
  b=S1qExoHxfV/EvjWKQmrK/OhI5jMmGOI3qbdfMh/yZ7llee/jjf2AXlzE
   /YlMEcue5uaeZr4fk+MmeEIw9OfcRGEZrVYodB0eti4bccCnlh8TEJDrw
   +/boftSJZbuEO2Fv4WQnn5ze+ZsD4DsdWmbW29OOiZK9t4l/UumQ/eu89
   o=;
X-CSE-ConnectionGUID: tqLoj7ejQSK+P4DSBC/0tA==
X-CSE-MsgGUID: eGHVzTYyREumYktvs7pQkA==
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 125280892
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:8berC6ilp7e3uL8lL1hZSd1UX161dhAKZh0ujC45NGQN5FlHY01je
 htvWG/UaP+JamvwKoskO96woR4Gv5/QzoM2S1Ft+XhhFHwb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOhTraCYmYoHVMMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyo0N8klgZmP6sT7QaFzyJ94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQEMRQKbE+OhduN4/GDFsVXrO9kdNXCadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XWjtUsl+K44Ew5HDe1ldZ27nxKtvFPNeNQK25m27B/
 D+crzypU0ty2Nq3xBWlzGCQt/71sD7+aYEOCqbn7sdpqQjGroAUIEJPDgbqyRWjsWauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O88Q5RyJy6HUyx2EHWVCRTlEAPQ5sOcmSDps0
 UWG9+4FHhQ27ufTEyjEsO7J83XrY3N9wXI+iTEsURIh5Nu8rYMKtTGMdopPK4SeyYXpMGSlq
 9yVlxQWi7IWhM8N8qy0+1Hbnj6hzqT0oh4JChb/BTz8sF4gDGKxT8nxsAWAs64cRGqMZgPZ1
 EXojfRy+wzn4XulsCWWCNsAE7iyjxpuGG2N2AU/d3XNGtnExpJCQWyyyGsuTKuKGpxeEdMMX
 KM0kVoLjKK/xFPwMcdKj3uZUqzGN5TIG9X/TezzZdFTeJV3fwLv1HgwNBLOhDi1zBZxz/BX1
 XKnnSGEVypyNEia5GDuG7d1PUEDmEjSOl8/tbiklk/6gNJylVaeSKsfMUvmUwzKxPrsnekhy
 P4Gb5Hi40wGAIXDjtz/rdZ7waYicSJqWvgbaqV/Koa+H+aRMD19VKeMmONxI+SIXc19z4/1w
 510YWcAoHKXuJENAVTihqxLAF83YatCkA==
IronPort-HdrOrdr: A9a23:AQDBuao+mdozNWIpurug2hwaV5oTeYIsimQD101hICG8cqSj+f
 xG+85rrCMc6QxhPk3I9urhBEDtex/hHNtOkOws1NSZLW7bUQmTXeJfBOLZqlWKcUDDH6xmpM
 NdmsBFeaXN5DNB7PoSjjPWLz9Z+qjkzJyV
X-Talos-CUID: =?us-ascii?q?9a23=3AoVwCaWtTsT/xnBK8CwvVeiKJ6Is5a1nazijdIXa?=
 =?us-ascii?q?DKiVRFJGuY3TXoL9Nxp8=3D?=
X-Talos-MUID: 9a23:6Y2HCglQRYQHL6p+P6MqdnpvG+dW8ZifGXogjJA3uNWaLnNoAjS02WE=
X-IronPort-AV: E=Sophos;i="6.02,144,1688443200"; 
   d="scan'208";a="125280892"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 3/8] x86/spec-ctrl: Turn the remaining SPEC_CTRL_{ENTRY,EXIT}_* into asm macros
Date: Wed, 13 Sep 2023 21:27:53 +0100
Message-ID: <20230913202758.508225-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230913202758.508225-1-andrew.cooper3@citrix.com>
References: <20230913202758.508225-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

These have grown more complex over time, with some already having been
converted.

Provide full Requires/Clobbers comments, otherwise missing at this level of
indirection.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/include/asm/spec_ctrl_asm.h | 37 ++++++++++++++++++------
 1 file changed, 28 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/include/asm/spec_ctrl_asm.h b/xen/arch/x86/include/asm/spec_ctrl_asm.h
index dd7c5e8bfc79..ee75f2bced42 100644
--- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
+++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
@@ -219,26 +219,45 @@
 .endm
 
 /* Use after an entry from PV context (syscall/sysenter/int80/int82/etc). */
-#define SPEC_CTRL_ENTRY_FROM_PV                                         \
+.macro SPEC_CTRL_ENTRY_FROM_PV
+/*
+ * Requires %rsp=regs/cpuinfo, %rdx=0
+ * Clobbers %rax, %rcx, %rdx
+ */
     ALTERNATIVE "", __stringify(DO_SPEC_CTRL_COND_IBPB maybexen=0),     \
-        X86_FEATURE_IBPB_ENTRY_PV;                                      \
-    ALTERNATIVE "", DO_OVERWRITE_RSB, X86_FEATURE_SC_RSB_PV;            \
+        X86_FEATURE_IBPB_ENTRY_PV
+
+    ALTERNATIVE "", DO_OVERWRITE_RSB, X86_FEATURE_SC_RSB_PV
+
     ALTERNATIVE "", __stringify(DO_SPEC_CTRL_ENTRY maybexen=0),         \
         X86_FEATURE_SC_MSR_PV
+.endm
 
 /* Use in interrupt/exception context.  May interrupt Xen or PV context. */
-#define SPEC_CTRL_ENTRY_FROM_INTR                                       \
+.macro SPEC_CTRL_ENTRY_FROM_INTR
+/*
+ * Requires %rsp=regs, %r14=stack_end, %rdx=0
+ * Clobbers %rax, %rcx, %rdx
+ */
     ALTERNATIVE "", __stringify(DO_SPEC_CTRL_COND_IBPB maybexen=1),     \
-        X86_FEATURE_IBPB_ENTRY_PV;                                      \
-    ALTERNATIVE "", DO_OVERWRITE_RSB, X86_FEATURE_SC_RSB_PV;            \
+        X86_FEATURE_IBPB_ENTRY_PV
+
+    ALTERNATIVE "", DO_OVERWRITE_RSB, X86_FEATURE_SC_RSB_PV
+
     ALTERNATIVE "", __stringify(DO_SPEC_CTRL_ENTRY maybexen=1),         \
         X86_FEATURE_SC_MSR_PV
+.endm
 
 /* Use when exiting to PV guest context. */
-#define SPEC_CTRL_EXIT_TO_PV                                            \
-    ALTERNATIVE "",                                                     \
-        DO_SPEC_CTRL_EXIT_TO_GUEST, X86_FEATURE_SC_MSR_PV;              \
+.macro SPEC_CTRL_EXIT_TO_PV
+/*
+ * Requires %rax=spec_ctrl, %rsp=regs/info
+ * Clobbers %rcx, %rdx
+ */
+    ALTERNATIVE "", DO_SPEC_CTRL_EXIT_TO_GUEST, X86_FEATURE_SC_MSR_PV
+
     DO_SPEC_CTRL_COND_VERW
+.endm
 
 /*
  * Use in IST interrupt/exception context.  May interrupt Xen or PV context.
-- 
2.30.2


