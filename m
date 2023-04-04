Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1123B6D5C84
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 11:59:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517751.803583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjdRZ-0003mM-Ei; Tue, 04 Apr 2023 09:59:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517751.803583; Tue, 04 Apr 2023 09:59:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjdRZ-0003hq-9s; Tue, 04 Apr 2023 09:59:13 +0000
Received: by outflank-mailman (input) for mailman id 517751;
 Tue, 04 Apr 2023 09:59:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oy2y=73=citrix.com=prvs=4518c43dc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pjdMS-0005bo-R1
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 09:53:56 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b5e9743-d2ce-11ed-85db-49a42c6b2330;
 Tue, 04 Apr 2023 11:53:54 +0200 (CEST)
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
X-Inumbo-ID: 9b5e9743-d2ce-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680602034;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=g6soTwUYllGEYZrZeu6VHps1q/P3LIhMMKfu395S8Yw=;
  b=Nf0ZU6SdlXkjQwjPFuLSMIH3fVlpq3UFTM19kMDfK/O8oWiBivO69uiF
   TqT+bWjNGD1vR+PqRcBqnyol607dnJBz9PgQSZxNJ0ryg8G2KBKDiLZ1L
   OVZ52db+q6jQYdnpFNZGLnSXEmsEf9FCDURWD4Dv/JVIMQrK6Zp0d6njz
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 104161492
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:ZPnmvaN/QfuEnHrvrR3al8FynXyQoLVcMsEvi/4bfWQNrUp2hDRTn
 WtLC2jSMvePNzOhe4t+Pdmw8UoEscXdzNEyGgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvLrRC9H5qyo42tE5gBmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0rd+DUURy
 9IxEQ4ESxqlqvOcwLjqe+Y506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLoXmuuyi2a5WDpfsF+P/oI84nTJzRw327/oWDbQUoXSGZwLxxrJ/
 Aoq+UzEC0gYGoKS2wCOrHi2jOjWwWT8dK4NQejQGvlC3wTImz175ActfUS/iem0jAi5Qd03A
 1wZ/G8ioLY/8GSvT8LhRFuorXicpBkeVtFMVeog52ml6IDZ/gKYDWgsVSNaZZots8peeNAx/
 gbXxZWzX2Up6eDLDyvHrd94sA9eJwBEJGMmOhEqZDI76vzphqwipBLFH+dsRfvdYsLOJd3g/
 9ybhHFg1+1O0pBRiPzTEUPv2Gz1+MWQJuIhzkCOBz/+sFskDGKwT9bwgWU3+8qsO2pworOpm
 HEf0/aT4+kVZX1mvHzcGb5ddF1FChvsDdE9vbKMN8N7n9hV0yT/Fb28GRknTKuTDu4KeCXyf
 GjYsh5L6ZlYMROCNPEnO9/tVZVwlvK+RbwJs8w4ifIXOvBMmPKvpnkyNSZ8IUi2+KTTrU3PE
 cjCKpv9ZZrrIa9m0CC3V48g7FPf/QhnnTm7bcmin3yaPU+2OCb9pUEtbAHfMYjULcqs/G3oz
 jqoH5DVlEkFCbGhO3m/HEx6BQliEEXXzKve86R/HtNv6CI/cI39I5c9GY8cRrE=
IronPort-HdrOrdr: A9a23:fE8LuaNbuPenKsBcTgWjsMiBIKoaSvp037BK7S1MoH1uA6mlfq
 WV9sjzuiWatN98Yh8dcLO7Scu9qBHnlaKdiLN5VduftWHd01dAR7sSjrcKrQeAJ8X/nNQtr5
 uJccJFeaDN5Y4Rt7eH3OG6eexQv+Vu6MqT9IPjJ+8Gd3ATV0lnhT0JbTqzIwlNayRtI4E2L5
 aY7tovnUvaRZxGBv7LYEXsRoL41qT2qK4=
X-IronPort-AV: E=Sophos;i="5.98,317,1673931600"; 
   d="scan'208";a="104161492"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 12/15] x86/emul: Switch x86_emulate_ctxt to cpu_policy
Date: Tue, 4 Apr 2023 10:52:19 +0100
Message-ID: <20230404095222.1373721-13-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230404095222.1373721-1-andrew.cooper3@citrix.com>
References: <20230404095222.1373721-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

As with struct domain, retain cpuid as a valid alias for local code clarity.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * Retain cpuid compatibility alias.
 * Split out of RFC patch.
---
 tools/fuzz/x86_instruction_emulator/fuzz-emul.c | 2 +-
 tools/tests/x86_emulator/test_x86_emulator.c    | 2 +-
 tools/tests/x86_emulator/x86-emulate.c          | 2 +-
 xen/arch/x86/hvm/emulate.c                      | 4 ++--
 xen/arch/x86/mm/shadow/hvm.c                    | 2 +-
 xen/arch/x86/pv/emul-priv-op.c                  | 2 +-
 xen/arch/x86/pv/ro-page-fault.c                 | 2 +-
 xen/arch/x86/x86_emulate/private.h              | 4 ++--
 xen/arch/x86/x86_emulate/x86_emulate.h          | 7 +++++--
 9 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/tools/fuzz/x86_instruction_emulator/fuzz-emul.c b/tools/fuzz/x86_instruction_emulator/fuzz-emul.c
index 966e46bee199..4885a68210d0 100644
--- a/tools/fuzz/x86_instruction_emulator/fuzz-emul.c
+++ b/tools/fuzz/x86_instruction_emulator/fuzz-emul.c
@@ -893,7 +893,7 @@ int LLVMFuzzerTestOneInput(const uint8_t *data_p, size_t size)
     struct x86_emulate_ctxt ctxt = {
         .data = &state,
         .regs = &input.regs,
-        .cpuid = &cp,
+        .cpu_policy = &cp,
         .addr_size = 8 * sizeof(void *),
         .sp_size = 8 * sizeof(void *),
     };
diff --git a/tools/tests/x86_emulator/test_x86_emulator.c b/tools/tests/x86_emulator/test_x86_emulator.c
index 31586f805726..7b7fbaaf45ec 100644
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -909,7 +909,7 @@ int main(int argc, char **argv)
 
     ctxt.regs = &regs;
     ctxt.force_writeback = 0;
-    ctxt.cpuid     = &cp;
+    ctxt.cpu_policy = &cp;
     ctxt.lma       = sizeof(void *) == 8;
     ctxt.addr_size = 8 * sizeof(void *);
     ctxt.sp_size   = 8 * sizeof(void *);
diff --git a/tools/tests/x86_emulator/x86-emulate.c b/tools/tests/x86_emulator/x86-emulate.c
index f6ee09439751..2692404df906 100644
--- a/tools/tests/x86_emulator/x86-emulate.c
+++ b/tools/tests/x86_emulator/x86-emulate.c
@@ -25,7 +25,7 @@
 #endif
 
 uint32_t mxcsr_mask = 0x0000ffbf;
-struct cpuid_policy cp;
+struct cpu_policy cp;
 
 static char fpu_save_area[0x4000] __attribute__((__aligned__((64))));
 static bool use_xsave;
diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index 95364deb1996..5691725d6c6f 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -2771,7 +2771,7 @@ int hvm_emulate_one_mmio(unsigned long mfn, unsigned long gla)
 void hvm_emulate_one_vm_event(enum emul_kind kind, unsigned int trapnr,
     unsigned int errcode)
 {
-    struct hvm_emulate_ctxt ctx = {{ 0 }};
+    struct hvm_emulate_ctxt ctx = {};
     int rc;
 
     hvm_emulate_init_once(&ctx, NULL, guest_cpu_user_regs());
@@ -2846,7 +2846,7 @@ void hvm_emulate_init_once(
 
     hvmemul_ctxt->validate = validate;
     hvmemul_ctxt->ctxt.regs = regs;
-    hvmemul_ctxt->ctxt.cpuid = curr->domain->arch.cpuid;
+    hvmemul_ctxt->ctxt.cpu_policy = curr->domain->arch.cpu_policy;
     hvmemul_ctxt->ctxt.force_writeback = true;
 }
 
diff --git a/xen/arch/x86/mm/shadow/hvm.c b/xen/arch/x86/mm/shadow/hvm.c
index e2ee1c77056f..cc84af01925a 100644
--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -319,7 +319,7 @@ const struct x86_emulate_ops *shadow_init_emulation(
     memset(sh_ctxt, 0, sizeof(*sh_ctxt));
 
     sh_ctxt->ctxt.regs = regs;
-    sh_ctxt->ctxt.cpuid = curr->domain->arch.cpuid;
+    sh_ctxt->ctxt.cpu_policy = curr->domain->arch.cpu_policy;
     sh_ctxt->ctxt.lma = hvm_long_mode_active(curr);
 
     /* Segment cache initialisation. Primed with CS. */
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index 5da00e24e4ff..ab52768271c5 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -1327,7 +1327,7 @@ int pv_emulate_privileged_op(struct cpu_user_regs *regs)
     struct domain *currd = curr->domain;
     struct priv_op_ctxt ctxt = {
         .ctxt.regs = regs,
-        .ctxt.cpuid = currd->arch.cpuid,
+        .ctxt.cpu_policy = currd->arch.cpu_policy,
         .ctxt.lma = !is_pv_32bit_domain(currd),
     };
     int rc;
diff --git a/xen/arch/x86/pv/ro-page-fault.c b/xen/arch/x86/pv/ro-page-fault.c
index 5963f5ee2d51..0d02c7d2ab10 100644
--- a/xen/arch/x86/pv/ro-page-fault.c
+++ b/xen/arch/x86/pv/ro-page-fault.c
@@ -356,7 +356,7 @@ int pv_ro_page_fault(unsigned long addr, struct cpu_user_regs *regs)
     unsigned int addr_size = is_pv_32bit_domain(currd) ? 32 : BITS_PER_LONG;
     struct x86_emulate_ctxt ctxt = {
         .regs      = regs,
-        .cpuid     = currd->arch.cpuid,
+        .cpu_policy = currd->arch.cpu_policy,
         .addr_size = addr_size,
         .sp_size   = addr_size,
         .lma       = addr_size > 32,
diff --git a/xen/arch/x86/x86_emulate/private.h b/xen/arch/x86/x86_emulate/private.h
index 653a298c705b..8dee019731ae 100644
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -505,7 +505,7 @@ in_protmode(
 })
 
 static inline bool
-_amd_like(const struct cpuid_policy *cp)
+_amd_like(const struct cpu_policy *cp)
 {
     return cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON);
 }
@@ -513,7 +513,7 @@ _amd_like(const struct cpuid_policy *cp)
 static inline bool
 amd_like(const struct x86_emulate_ctxt *ctxt)
 {
-    return _amd_like(ctxt->cpuid);
+    return _amd_like(ctxt->cpu_policy);
 }
 
 #define vcpu_has_fpu()         (ctxt->cpuid->basic.fpu)
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.h b/xen/arch/x86/x86_emulate/x86_emulate.h
index 75015104fbdb..0139d16da70c 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.h
+++ b/xen/arch/x86/x86_emulate/x86_emulate.h
@@ -565,8 +565,11 @@ struct x86_emulate_ctxt
      * Input-only state:
      */
 
-    /* CPUID Policy for the domain. */
-    const struct cpuid_policy *cpuid;
+    /* CPU policy for the domain.  Allow aliases for local code clarity. */
+    union {
+        struct cpu_policy *cpu_policy;
+        struct cpu_policy *cpuid;
+    };
 
     /* Set this if writes may have side effects. */
     bool force_writeback;
-- 
2.30.2


