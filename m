Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3340476D038
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 16:38:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574977.900682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRCzt-0007vq-Hp; Wed, 02 Aug 2023 14:38:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574977.900682; Wed, 02 Aug 2023 14:38:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRCzt-0007ly-4x; Wed, 02 Aug 2023 14:38:45 +0000
Received: by outflank-mailman (input) for mailman id 574977;
 Wed, 02 Aug 2023 14:38:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YIS5=DT=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qRCzr-0007ap-7l
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 14:38:43 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45e7e813-3142-11ee-8613-37d641c3527e;
 Wed, 02 Aug 2023 16:38:40 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id BFDC64EE0743;
 Wed,  2 Aug 2023 16:38:39 +0200 (CEST)
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
X-Inumbo-ID: 45e7e813-3142-11ee-8613-37d641c3527e
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 04/11] x86emul: move variable definitions to address MISRA C:2012 Rule 2.1
Date: Wed,  2 Aug 2023 16:38:10 +0200
Message-Id: <e958e4831a5363efe2a3902171fe5d7a37908e69.1690985045.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690985045.git.nicola.vetrini@bugseng.com>
References: <cover.1690985045.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Variable declarations between a switch statement guard and before
any case label are unreachable code, and hence violate Rule 2.1:
"A project shall not contain unreachable code".

Therefore the variable declarations are moved in the only clause
scope that uses it.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/hvm/emulate.c             |  9 ++++-----
 xen/arch/x86/hvm/hvm.c                 | 10 ++++------
 xen/arch/x86/x86_emulate/0f01.c        |  7 +++----
 xen/arch/x86/x86_emulate/blk.c         | 17 ++++++++---------
 xen/arch/x86/x86_emulate/decode.c      |  3 ++-
 xen/arch/x86/x86_emulate/fpu.c         |  3 +--
 xen/arch/x86/x86_emulate/util-xen.c    |  4 ++--
 xen/arch/x86/x86_emulate/x86_emulate.c | 14 +++++++-------
 8 files changed, 31 insertions(+), 36 deletions(-)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index 75ee98a73b..2261e8655b 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -1994,6 +1994,7 @@ static int cf_check hvmemul_rep_stos(
     bool_t df = !!(ctxt->regs->eflags & X86_EFLAGS_DF);
     int rc = hvmemul_virtual_to_linear(seg, offset, bytes_per_rep, reps,
                                        hvm_access_write, hvmemul_ctxt, &addr);
+    char *buf;
 
     if ( rc != X86EMUL_OKAY )
         return rc;
@@ -2025,7 +2026,6 @@ static int cf_check hvmemul_rep_stos(
     switch ( p2mt )
     {
         unsigned long bytes;
-        char *buf;
 
     default:
         /* Allocate temporary buffer. */
@@ -2289,16 +2289,15 @@ static int cf_check hvmemul_cache_op(
     struct hvm_emulate_ctxt *hvmemul_ctxt =
         container_of(ctxt, struct hvm_emulate_ctxt, ctxt);
     uint32_t pfec = PFEC_page_present;
+    unsigned long addr;
+    int rc;
+    void *mapping;
 
     if ( !cache_flush_permitted(current->domain) )
         return X86EMUL_OKAY;
 
     switch ( op )
     {
-        unsigned long addr;
-        int rc;
-        void *mapping;
-
     case x86emul_clflush:
     case x86emul_clflushopt:
     case x86emul_clwb:
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 2180abeb33..4170343b34 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1494,10 +1494,10 @@ static int cf_check hvm_load_cpu_msrs(struct domain *d, hvm_domain_context_t *h)
 
     for ( i = 0; i < ctxt->count; ++i )
     {
+        int rc;
+
         switch ( ctxt->msr[i].index )
         {
-            int rc;
-
         case MSR_SPEC_CTRL:
         case MSR_INTEL_MISC_FEATURES_ENABLES:
         case MSR_PKRS:
@@ -3522,6 +3522,7 @@ int hvm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
     struct domain *d = v->domain;
     uint64_t *var_range_base, *fixed_range_base;
     int ret;
+    unsigned int index;
 
     var_range_base = (uint64_t *)v->arch.hvm.mtrr.var_ranges;
     fixed_range_base = (uint64_t *)v->arch.hvm.mtrr.fixed_ranges;
@@ -3533,8 +3534,6 @@ int hvm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
 
     switch ( msr )
     {
-        unsigned int index;
-
     case MSR_EFER:
         *msr_content = v->arch.hvm.guest_efer;
         break;
@@ -3636,6 +3635,7 @@ int hvm_msr_write_intercept(unsigned int msr, uint64_t msr_content,
     struct vcpu *v = current;
     struct domain *d = v->domain;
     int ret;
+    unsigned int index;
 
     HVMTRACE_3D(MSR_WRITE, msr,
                (uint32_t)msr_content, (uint32_t)(msr_content >> 32));
@@ -3668,8 +3668,6 @@ int hvm_msr_write_intercept(unsigned int msr, uint64_t msr_content,
 
     switch ( msr )
     {
-        unsigned int index;
-
     case MSR_EFER:
         if ( hvm_set_efer(msr_content) )
            return X86EMUL_EXCEPTION;
diff --git a/xen/arch/x86/x86_emulate/0f01.c b/xen/arch/x86/x86_emulate/0f01.c
index ba43fc394b..22a14b12c3 100644
--- a/xen/arch/x86/x86_emulate/0f01.c
+++ b/xen/arch/x86/x86_emulate/0f01.c
@@ -24,13 +24,12 @@ int x86emul_0f01(struct x86_emulate_state *s,
 {
     enum x86_segment seg = (s->modrm_reg & 1) ? x86_seg_idtr : x86_seg_gdtr;
     int rc;
+    unsigned long base, limit, cr0, cr0w, cr4;
+    struct segment_register sreg;
+    uint64_t msr_val;
 
     switch ( s->modrm )
     {
-        unsigned long base, limit, cr0, cr0w, cr4;
-        struct segment_register sreg;
-        uint64_t msr_val;
-
     case 0xc6:
         switch ( s->vex.pfx )
         {
diff --git a/xen/arch/x86/x86_emulate/blk.c b/xen/arch/x86/x86_emulate/blk.c
index e790f4f900..f2956c0d52 100644
--- a/xen/arch/x86/x86_emulate/blk.c
+++ b/xen/arch/x86/x86_emulate/blk.c
@@ -26,19 +26,18 @@ int x86_emul_blk(
     struct x86_emulate_ctxt *ctxt)
 {
     int rc = X86EMUL_OKAY;
-
-    switch ( s->blk )
-    {
-        bool zf;
+    bool zf;
 #ifndef X86EMUL_NO_FPU
+    struct {
+        struct x87_env32 env;
         struct {
-            struct x87_env32 env;
-            struct {
-               uint8_t bytes[10];
-            } freg[8];
-        } fpstate;
+           uint8_t bytes[10];
+        } freg[8];
+    } fpstate;
 #endif
 
+    switch ( s->blk )
+    {
         /*
          * Throughout this switch(), memory clobbers are used to compensate
          * that other operands may not properly express the (full) memory
diff --git a/xen/arch/x86/x86_emulate/decode.c b/xen/arch/x86/x86_emulate/decode.c
index f58ca3984e..daebf3a9bd 100644
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -1758,9 +1758,9 @@ int x86emul_decode(struct x86_emulate_state *s,
     /* Fetch the immediate operand, if present. */
     switch ( d & SrcMask )
     {
+    case SrcImm: {
         unsigned int bytes;
 
-    case SrcImm:
         if ( !(d & ByteOp) )
         {
             if ( mode_64bit() && !amd_like(ctxt) &&
@@ -1785,6 +1785,7 @@ int x86emul_decode(struct x86_emulate_state *s,
     case SrcImm16:
         s->imm1 = insn_fetch_type(uint16_t);
         break;
+		}
     }
 
     ctxt->opcode = opcode;
diff --git a/xen/arch/x86/x86_emulate/fpu.c b/xen/arch/x86/x86_emulate/fpu.c
index 480d879657..002d5e1253 100644
--- a/xen/arch/x86/x86_emulate/fpu.c
+++ b/xen/arch/x86/x86_emulate/fpu.c
@@ -84,11 +84,10 @@ int x86emul_fpu(struct x86_emulate_state *s,
     uint8_t b;
     int rc;
     struct x86_emulate_stub stub = {};
+    unsigned long dummy;
 
     switch ( b = ctxt->opcode )
     {
-        unsigned long dummy;
-
     case 0x9b:  /* wait/fwait */
         host_and_vcpu_must_have(fpu);
         get_fpu(X86EMUL_FPU_wait);
diff --git a/xen/arch/x86/x86_emulate/util-xen.c b/xen/arch/x86/x86_emulate/util-xen.c
index 5e90818010..7ab2ac712f 100644
--- a/xen/arch/x86/x86_emulate/util-xen.c
+++ b/xen/arch/x86/x86_emulate/util-xen.c
@@ -77,10 +77,10 @@ bool cf_check x86_insn_is_portio(const struct x86_emulate_state *s,
 bool cf_check x86_insn_is_cr_access(const struct x86_emulate_state *s,
                                     const struct x86_emulate_ctxt *ctxt)
 {
+    unsigned int ext;
+
     switch ( ctxt->opcode )
     {
-        unsigned int ext;
-
     case X86EMUL_OPC(0x0f, 0x01):
         if ( x86_insn_modrm(s, NULL, &ext) >= 0
              && (ext & 5) == 4 ) /* SMSW / LMSW */
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
index e88245eae9..d6c04fd5f3 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -1479,15 +1479,15 @@ x86_emulate(
         break;
     }
 
+    enum x86_segment seg;
+    struct segment_register cs, sreg;
+    struct cpuid_leaf leaf;
+    uint64_t msr_val;
+    unsigned int i, n;
+    unsigned long dummy;
+
     switch ( ctxt->opcode )
     {
-        enum x86_segment seg;
-        struct segment_register cs, sreg;
-        struct cpuid_leaf leaf;
-        uint64_t msr_val;
-        unsigned int i, n;
-        unsigned long dummy;
-
     case 0x00: case 0x01: add: /* add reg,mem */
         if ( ops->rmw && dst.type == OP_MEM )
             state->rmw = rmw_add;
-- 
2.34.1


