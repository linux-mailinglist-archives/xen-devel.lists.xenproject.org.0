Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6154BFCB4
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 16:35:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276923.473297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMXBs-0005QK-6I; Tue, 22 Feb 2022 15:35:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276923.473297; Tue, 22 Feb 2022 15:35:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMXBs-0005NT-2E; Tue, 22 Feb 2022 15:35:00 +0000
Received: by outflank-mailman (input) for mailman id 276923;
 Tue, 22 Feb 2022 15:34:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Woib=TF=citrix.com=prvs=045a4fa17=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nMXBq-0005NF-23
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 15:34:58 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb25b33a-93f4-11ec-8eb8-a37418f5ba1a;
 Tue, 22 Feb 2022 16:34:55 +0100 (CET)
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
X-Inumbo-ID: fb25b33a-93f4-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645544095;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=8+CkbbuS9bZ1ruJ4foosAOZaPaI8PjQLHNVZvxxO99c=;
  b=gGbbDh6XZ2LesvGr3oQYaZKUbqoUFZKN/pWQGaPKXvFhn97CtG3nM2O8
   pc6CFPui3tDQA9Qin37N/Jl5HaswPVyaD41bY6MrC+NiRWvYt0VqZ87g2
   u0xYh3Anm32UHtxkI+tM6OUnCZSiMdDAkpZFCtMex/d7dL4ZbNdRHgVK3
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 65138983
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:rDoBcqoaUbSo4Hco2c5MqHF6EC1eBmJ8ZRIvgKrLsJaIsI4StFCzt
 garIBmGPvqCajfxctkgYIiypk4EsZ/QyoJgQARk/n03RXga+JuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8ly75RbrJA24DjWVvX4
 4mq+aUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBPrbiiO47aAhhHmIgG6MX6KWbLEK7mJnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVI5DfVF/s5B7vERL3H/4Rw1zYsnMFeW/3ZY
 qL1bBIxMU2bM0wfYT/7Drpildaxvna8LgRqsXe3n/QJ23DYxiBIhe2F3N39JYXRGJQ9clyjj
 nLL+SH1Dw8XMPSbyCGZ6TS8i+nXhyT5VYkOUrqi+ZZXbEa7nzJJTkdMDB3i/Kf/2hXWt89jx
 1I8+jEAvaIUz12SQ5qjeRPpsGTYsyQYco8FewEl0z2lxq3R6gefI2ELSD9dddAr3PMLqSwWO
 kyhxI2wW2E22FGBYTfEr+rP82vuUcQABTJaPUc5oR05D84PSW3ZpjbGVZ5dHaG8lbUZ8hmgk
 mnR/EDSa1j+5PPnNplXH3ia21pARbCTF2bZAzk7uEr/tWuVg6b/OuSVBaDzt6ooEWpgZgDpU
 II4s8af9vsSKpqGiTaARu4AdJnwuarYbGON3AM1Q8B5n9hIx5JFVdoLiN2ZDB00WvvohBezO
 BOD0e+vzMU70ISWgV9fPNvqVpVCIVnIHtX5TPHEBueikbAqHDJrCBpGPBbKt0i0yRBEufhmZ
 f+zLJb9ZV5HWP8P5GfnGI8gPUoDm3lWKZX7HsugkXxKENO2ORaodFvyGAHQNrtgtPvc+m04M
 b93bqO39vmWa8WmCgG/zGLZBQliwaQTbXwul/FqSw==
IronPort-HdrOrdr: A9a23:3Fby46qTUc5nl1ALAvBNyTEaV5opeYIsimQD101hICG8cqSj+f
 xG/c5rrCMc5wxwZJhNo7y90ey7MBbhHP1OkO8s1NWZLWrbUQKTRekIh+bfKn/baknDH4ZmpM
 BdmsNFaeEYY2IUsS+D2njbL+od
X-IronPort-AV: E=Sophos;i="5.88,387,1635220800"; 
   d="scan'208";a="65138983"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3 33/70] x86/emul: CFI hardening
Date: Tue, 22 Feb 2022 15:26:40 +0000
Message-ID: <20220222152645.8844-11-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220222152645.8844-1-andrew.cooper3@citrix.com>
References: <20220222152645.8844-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Control Flow Integrity schemes use toolchain and optionally hardware support
to help protect against call/jump/return oriented programming attacks.

Use cf_check to annotate function pointer targets for the toolchain.

pv_emul_is_mem_write() is only used in a single file.  Move it out of its
header file, so it doesn't risk being duplicated in multiple translation
units.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v2:
 * Correct details in commit message.
v2:
 * Reword again.
---
 xen/arch/x86/hvm/emulate.c             | 72 +++++++++++++++++-----------------
 xen/arch/x86/hvm/hvm.c                 |  8 ++--
 xen/arch/x86/hvm/svm/svm.c             |  4 +-
 xen/arch/x86/include/asm/hvm/emulate.h |  8 ++--
 xen/arch/x86/include/asm/mm.h          | 16 +++-----
 xen/arch/x86/mm.c                      |  4 +-
 xen/arch/x86/mm/shadow/hvm.c           |  8 ++--
 xen/arch/x86/pv/emul-gate-op.c         |  9 +++--
 xen/arch/x86/pv/emul-priv-op.c         | 64 +++++++++++++++---------------
 xen/arch/x86/pv/emulate.h              |  7 ----
 xen/arch/x86/pv/ro-page-fault.c        | 31 +++++++++------
 xen/arch/x86/x86_emulate.c             | 21 +++++-----
 xen/arch/x86/x86_emulate/x86_emulate.c | 10 ++---
 xen/arch/x86/x86_emulate/x86_emulate.h | 33 ++++++++--------
 14 files changed, 148 insertions(+), 147 deletions(-)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index 39dac7fd9d6d..e8d510e0be91 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -1272,7 +1272,7 @@ static int __hvmemul_read(
     return linear_read(addr, bytes, p_data, pfec, hvmemul_ctxt);
 }
 
-static int hvmemul_read(
+static int cf_check hvmemul_read(
     enum x86_segment seg,
     unsigned long offset,
     void *p_data,
@@ -1290,7 +1290,7 @@ static int hvmemul_read(
         container_of(ctxt, struct hvm_emulate_ctxt, ctxt));
 }
 
-int hvmemul_insn_fetch(
+int cf_check hvmemul_insn_fetch(
     unsigned long offset,
     void *p_data,
     unsigned int bytes,
@@ -1336,7 +1336,7 @@ int hvmemul_insn_fetch(
     return X86EMUL_OKAY;
 }
 
-static int hvmemul_write(
+static int cf_check hvmemul_write(
     enum x86_segment seg,
     unsigned long offset,
     void *p_data,
@@ -1384,7 +1384,7 @@ static int hvmemul_write(
     return X86EMUL_OKAY;
 }
 
-static int hvmemul_rmw(
+static int cf_check hvmemul_rmw(
     enum x86_segment seg,
     unsigned long offset,
     unsigned int bytes,
@@ -1437,7 +1437,7 @@ static int hvmemul_rmw(
     return rc;
 }
 
-static int hvmemul_blk(
+static int cf_check hvmemul_blk(
     enum x86_segment seg,
     unsigned long offset,
     void *p_data,
@@ -1478,7 +1478,7 @@ static int hvmemul_blk(
     return rc;
 }
 
-static int hvmemul_write_discard(
+static int cf_check hvmemul_write_discard(
     enum x86_segment seg,
     unsigned long offset,
     void *p_data,
@@ -1489,7 +1489,7 @@ static int hvmemul_write_discard(
     return X86EMUL_OKAY;
 }
 
-static int hvmemul_rep_ins_discard(
+static int cf_check hvmemul_rep_ins_discard(
     uint16_t src_port,
     enum x86_segment dst_seg,
     unsigned long dst_offset,
@@ -1500,7 +1500,7 @@ static int hvmemul_rep_ins_discard(
     return X86EMUL_OKAY;
 }
 
-static int hvmemul_rep_movs_discard(
+static int cf_check hvmemul_rep_movs_discard(
    enum x86_segment src_seg,
    unsigned long src_offset,
    enum x86_segment dst_seg,
@@ -1512,7 +1512,7 @@ static int hvmemul_rep_movs_discard(
     return X86EMUL_OKAY;
 }
 
-static int hvmemul_rep_stos_discard(
+static int cf_check hvmemul_rep_stos_discard(
     void *p_data,
     enum x86_segment seg,
     unsigned long offset,
@@ -1523,7 +1523,7 @@ static int hvmemul_rep_stos_discard(
     return X86EMUL_OKAY;
 }
 
-static int hvmemul_rep_outs_discard(
+static int cf_check hvmemul_rep_outs_discard(
     enum x86_segment src_seg,
     unsigned long src_offset,
     uint16_t dst_port,
@@ -1534,7 +1534,7 @@ static int hvmemul_rep_outs_discard(
     return X86EMUL_OKAY;
 }
 
-static int hvmemul_cmpxchg_discard(
+static int cf_check hvmemul_cmpxchg_discard(
     enum x86_segment seg,
     unsigned long offset,
     void *p_old,
@@ -1546,7 +1546,7 @@ static int hvmemul_cmpxchg_discard(
     return X86EMUL_OKAY;
 }
 
-static int hvmemul_read_io_discard(
+static int cf_check hvmemul_read_io_discard(
     unsigned int port,
     unsigned int bytes,
     unsigned long *val,
@@ -1555,7 +1555,7 @@ static int hvmemul_read_io_discard(
     return X86EMUL_OKAY;
 }
 
-static int hvmemul_write_io_discard(
+static int cf_check hvmemul_write_io_discard(
     unsigned int port,
     unsigned int bytes,
     unsigned long val,
@@ -1564,7 +1564,7 @@ static int hvmemul_write_io_discard(
     return X86EMUL_OKAY;
 }
 
-static int hvmemul_write_msr_discard(
+static int cf_check hvmemul_write_msr_discard(
     unsigned int reg,
     uint64_t val,
     struct x86_emulate_ctxt *ctxt)
@@ -1572,7 +1572,7 @@ static int hvmemul_write_msr_discard(
     return X86EMUL_OKAY;
 }
 
-static int hvmemul_cache_op_discard(
+static int cf_check hvmemul_cache_op_discard(
     enum x86emul_cache_op op,
     enum x86_segment seg,
     unsigned long offset,
@@ -1581,7 +1581,7 @@ static int hvmemul_cache_op_discard(
     return X86EMUL_OKAY;
 }
 
-static int hvmemul_cmpxchg(
+static int cf_check hvmemul_cmpxchg(
     enum x86_segment seg,
     unsigned long offset,
     void *p_old,
@@ -1675,7 +1675,7 @@ static int hvmemul_cmpxchg(
     return rc;
 }
 
-static int hvmemul_validate(
+static int cf_check hvmemul_validate(
     const struct x86_emulate_state *state,
     struct x86_emulate_ctxt *ctxt)
 {
@@ -1688,7 +1688,7 @@ static int hvmemul_validate(
            ? X86EMUL_OKAY : X86EMUL_UNHANDLEABLE;
 }
 
-static int hvmemul_rep_ins(
+static int cf_check hvmemul_rep_ins(
     uint16_t src_port,
     enum x86_segment dst_seg,
     unsigned long dst_offset,
@@ -1766,7 +1766,7 @@ static int hvmemul_rep_outs_set_context(
     return rc;
 }
 
-static int hvmemul_rep_outs(
+static int cf_check hvmemul_rep_outs(
     enum x86_segment src_seg,
     unsigned long src_offset,
     uint16_t dst_port,
@@ -1807,7 +1807,7 @@ static int hvmemul_rep_outs(
                                !!(ctxt->regs->eflags & X86_EFLAGS_DF), gpa);
 }
 
-static int hvmemul_rep_movs(
+static int cf_check hvmemul_rep_movs(
    enum x86_segment src_seg,
    unsigned long src_offset,
    enum x86_segment dst_seg,
@@ -1977,7 +1977,7 @@ static int hvmemul_rep_movs(
     return X86EMUL_UNHANDLEABLE;
 }
 
-static int hvmemul_rep_stos(
+static int cf_check hvmemul_rep_stos(
     void *p_data,
     enum x86_segment seg,
     unsigned long offset,
@@ -2105,7 +2105,7 @@ static int hvmemul_rep_stos(
     }
 }
 
-static int hvmemul_read_segment(
+static int cf_check hvmemul_read_segment(
     enum x86_segment seg,
     struct segment_register *reg,
     struct x86_emulate_ctxt *ctxt)
@@ -2122,7 +2122,7 @@ static int hvmemul_read_segment(
     return X86EMUL_OKAY;
 }
 
-static int hvmemul_write_segment(
+static int cf_check hvmemul_write_segment(
     enum x86_segment seg,
     const struct segment_register *reg,
     struct x86_emulate_ctxt *ctxt)
@@ -2141,7 +2141,7 @@ static int hvmemul_write_segment(
     return X86EMUL_OKAY;
 }
 
-static int hvmemul_read_io(
+static int cf_check hvmemul_read_io(
     unsigned int port,
     unsigned int bytes,
     unsigned long *val,
@@ -2158,7 +2158,7 @@ static int hvmemul_read_io(
     return hvmemul_do_pio_buffer(port, bytes, IOREQ_READ, val);
 }
 
-static int hvmemul_write_io(
+static int cf_check hvmemul_write_io(
     unsigned int port,
     unsigned int bytes,
     unsigned long val,
@@ -2167,7 +2167,7 @@ static int hvmemul_write_io(
     return hvmemul_do_pio_buffer(port, bytes, IOREQ_WRITE, &val);
 }
 
-static int hvmemul_read_cr(
+static int cf_check hvmemul_read_cr(
     unsigned int reg,
     unsigned long *val,
     struct x86_emulate_ctxt *ctxt)
@@ -2188,7 +2188,7 @@ static int hvmemul_read_cr(
     return X86EMUL_UNHANDLEABLE;
 }
 
-static int hvmemul_write_cr(
+static int cf_check hvmemul_write_cr(
     unsigned int reg,
     unsigned long val,
     struct x86_emulate_ctxt *ctxt)
@@ -2232,7 +2232,7 @@ static int hvmemul_write_cr(
     return rc;
 }
 
-static int hvmemul_read_xcr(
+static int cf_check hvmemul_read_xcr(
     unsigned int reg,
     uint64_t *val,
     struct x86_emulate_ctxt *ctxt)
@@ -2245,7 +2245,7 @@ static int hvmemul_read_xcr(
     return rc;
 }
 
-static int hvmemul_write_xcr(
+static int cf_check hvmemul_write_xcr(
     unsigned int reg,
     uint64_t val,
     struct x86_emulate_ctxt *ctxt)
@@ -2255,7 +2255,7 @@ static int hvmemul_write_xcr(
     return x86emul_write_xcr(reg, val, ctxt);
 }
 
-static int hvmemul_read_msr(
+static int cf_check hvmemul_read_msr(
     unsigned int reg,
     uint64_t *val,
     struct x86_emulate_ctxt *ctxt)
@@ -2268,7 +2268,7 @@ static int hvmemul_read_msr(
     return rc;
 }
 
-static int hvmemul_write_msr(
+static int cf_check hvmemul_write_msr(
     unsigned int reg,
     uint64_t val,
     struct x86_emulate_ctxt *ctxt)
@@ -2281,7 +2281,7 @@ static int hvmemul_write_msr(
     return rc;
 }
 
-static int hvmemul_cache_op(
+static int cf_check hvmemul_cache_op(
     enum x86emul_cache_op op,
     enum x86_segment seg,
     unsigned long offset,
@@ -2353,7 +2353,7 @@ static int hvmemul_cache_op(
     return X86EMUL_OKAY;
 }
 
-static int hvmemul_get_fpu(
+static int cf_check hvmemul_get_fpu(
     enum x86_emulate_fpu_type type,
     struct x86_emulate_ctxt *ctxt)
 {
@@ -2395,7 +2395,7 @@ static int hvmemul_get_fpu(
     return X86EMUL_OKAY;
 }
 
-static void hvmemul_put_fpu(
+static void cf_check hvmemul_put_fpu(
     struct x86_emulate_ctxt *ctxt,
     enum x86_emulate_fpu_type backout,
     const struct x86_emul_fpu_aux *aux)
@@ -2482,7 +2482,7 @@ static void hvmemul_put_fpu(
     }
 }
 
-static int hvmemul_tlb_op(
+static int cf_check hvmemul_tlb_op(
     enum x86emul_tlb_op op,
     unsigned long addr,
     unsigned long aux,
@@ -2539,7 +2539,7 @@ static int hvmemul_tlb_op(
     return rc;
 }
 
-static int hvmemul_vmfunc(
+static int cf_check hvmemul_vmfunc(
     struct x86_emulate_ctxt *ctxt)
 {
     int rc;
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 9e4924649077..e87e809a945d 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -3755,8 +3755,8 @@ void hvm_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
     }
 }
 
-static bool is_sysdesc_access(const struct x86_emulate_state *state,
-                              const struct x86_emulate_ctxt *ctxt)
+static bool cf_check is_sysdesc_access(
+    const struct x86_emulate_state *state, const struct x86_emulate_ctxt *ctxt)
 {
     unsigned int ext;
     int mode = x86_insn_modrm(state, NULL, &ext);
@@ -3796,8 +3796,8 @@ int hvm_descriptor_access_intercept(uint64_t exit_info,
     return X86EMUL_OKAY;
 }
 
-static bool is_cross_vendor(const struct x86_emulate_state *state,
-                            const struct x86_emulate_ctxt *ctxt)
+static bool cf_check is_cross_vendor(
+    const struct x86_emulate_state *state, const struct x86_emulate_ctxt *ctxt)
 {
     switch ( ctxt->opcode )
     {
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 4c4ebda5e6e4..dedb2848e6a1 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2447,8 +2447,8 @@ static void svm_invlpg_intercept(unsigned long linear)
     paging_invlpg(current, linear);
 }
 
-static bool is_invlpg(const struct x86_emulate_state *state,
-                      const struct x86_emulate_ctxt *ctxt)
+static bool cf_check is_invlpg(
+    const struct x86_emulate_state *state, const struct x86_emulate_ctxt *ctxt)
 {
     unsigned int ext;
 
diff --git a/xen/arch/x86/include/asm/hvm/emulate.h b/xen/arch/x86/include/asm/hvm/emulate.h
index e67004060345..d8ba2df4e4a2 100644
--- a/xen/arch/x86/include/asm/hvm/emulate.h
+++ b/xen/arch/x86/include/asm/hvm/emulate.h
@@ -92,10 +92,10 @@ static inline bool handle_mmio(void)
     return hvm_emulate_one_insn(x86_insn_is_mem_access, "MMIO");
 }
 
-int hvmemul_insn_fetch(unsigned long offset,
-                       void *p_data,
-                       unsigned int bytes,
-                       struct x86_emulate_ctxt *ctxt);
+int cf_check hvmemul_insn_fetch(
+    unsigned long offset, void *p_data, unsigned int bytes,
+    struct x86_emulate_ctxt *ctxt);
+
 int hvmemul_do_pio_buffer(uint16_t port,
                           unsigned int size,
                           uint8_t dir,
diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index bdde24d2cec3..f2f7b6902ce4 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -538,16 +538,12 @@ struct mmio_ro_emulate_ctxt {
         unsigned int seg, bdf;
 };
 
-extern int mmio_ro_emulated_write(enum x86_segment seg,
-                                  unsigned long offset,
-                                  void *p_data,
-                                  unsigned int bytes,
-                                  struct x86_emulate_ctxt *ctxt);
-extern int mmcfg_intercept_write(enum x86_segment seg,
-                                 unsigned long offset,
-                                 void *p_data,
-                                 unsigned int bytes,
-                                 struct x86_emulate_ctxt *ctxt);
+int cf_check mmio_ro_emulated_write(
+    enum x86_segment seg, unsigned long offset, void *p_data,
+    unsigned int bytes, struct x86_emulate_ctxt *ctxt);
+int cf_check mmcfg_intercept_write(
+    enum x86_segment seg, unsigned long offset, void *p_data,
+    unsigned int bytes, struct x86_emulate_ctxt *ctxt);
 
 int audit_adjust_pgtables(struct domain *d, int dir, int noisy);
 
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 0665095d2309..2befd0c191ae 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4852,7 +4852,7 @@ long arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     return 0;
 }
 
-int mmio_ro_emulated_write(
+int cf_check mmio_ro_emulated_write(
     enum x86_segment seg,
     unsigned long offset,
     void *p_data,
@@ -4873,7 +4873,7 @@ int mmio_ro_emulated_write(
     return X86EMUL_OKAY;
 }
 
-int mmcfg_intercept_write(
+int cf_check mmcfg_intercept_write(
     enum x86_segment seg,
     unsigned long offset,
     void *p_data,
diff --git a/xen/arch/x86/mm/shadow/hvm.c b/xen/arch/x86/mm/shadow/hvm.c
index f2991bc176f0..c90d326becb3 100644
--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -148,7 +148,7 @@ hvm_read(enum x86_segment seg,
     return X86EMUL_UNHANDLEABLE;
 }
 
-static int
+static int cf_check
 hvm_emulate_read(enum x86_segment seg,
                  unsigned long offset,
                  void *p_data,
@@ -161,7 +161,7 @@ hvm_emulate_read(enum x86_segment seg,
                     container_of(ctxt, struct sh_emulate_ctxt, ctxt));
 }
 
-static int
+static int cf_check
 hvm_emulate_insn_fetch(unsigned long offset,
                        void *p_data,
                        unsigned int bytes,
@@ -181,7 +181,7 @@ hvm_emulate_insn_fetch(unsigned long offset,
     return X86EMUL_OKAY;
 }
 
-static int
+static int cf_check
 hvm_emulate_write(enum x86_segment seg,
                   unsigned long offset,
                   void *p_data,
@@ -234,7 +234,7 @@ hvm_emulate_write(enum x86_segment seg,
     return X86EMUL_OKAY;
 }
 
-static int
+static int cf_check
 hvm_emulate_cmpxchg(enum x86_segment seg,
                     unsigned long offset,
                     void *p_old,
diff --git a/xen/arch/x86/pv/emul-gate-op.c b/xen/arch/x86/pv/emul-gate-op.c
index 68ec4d11f6bb..758a20ad9df4 100644
--- a/xen/arch/x86/pv/emul-gate-op.c
+++ b/xen/arch/x86/pv/emul-gate-op.c
@@ -96,8 +96,9 @@ struct gate_op_ctxt {
     bool insn_fetch;
 };
 
-static int read_mem(enum x86_segment seg, unsigned long offset, void *p_data,
-                    unsigned int bytes, struct x86_emulate_ctxt *ctxt)
+static int cf_check read_mem(
+    enum x86_segment seg, unsigned long offset, void *p_data,
+    unsigned int bytes, struct x86_emulate_ctxt *ctxt)
 {
     const struct gate_op_ctxt *goc =
         container_of(ctxt, struct gate_op_ctxt, ctxt);
@@ -163,8 +164,8 @@ static int read_mem(enum x86_segment seg, unsigned long offset, void *p_data,
     return X86EMUL_OKAY;
 }
 
-static int fetch(unsigned long offset, void *p_data,
-                 unsigned int bytes, struct x86_emulate_ctxt *ctxt)
+static int cf_check fetch(unsigned long offset, void *p_data,
+                          unsigned int bytes, struct x86_emulate_ctxt *ctxt)
 {
     return read_mem(x86_seg_cs, offset, p_data, bytes, ctxt);
 }
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index c78be6d92b21..c46c072f93db 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -358,8 +358,9 @@ static unsigned int check_guest_io_breakpoint(struct vcpu *v,
     return match;
 }
 
-static int read_io(unsigned int port, unsigned int bytes,
-                   unsigned long *val, struct x86_emulate_ctxt *ctxt)
+static int cf_check read_io(
+    unsigned int port, unsigned int bytes, unsigned long *val,
+    struct x86_emulate_ctxt *ctxt)
 {
     struct priv_op_ctxt *poc = container_of(ctxt, struct priv_op_ctxt, ctxt);
     struct vcpu *curr = current;
@@ -462,8 +463,9 @@ static void guest_io_write(unsigned int port, unsigned int bytes,
     }
 }
 
-static int write_io(unsigned int port, unsigned int bytes,
-                    unsigned long val, struct x86_emulate_ctxt *ctxt)
+static int cf_check write_io(
+    unsigned int port, unsigned int bytes, unsigned long val,
+    struct x86_emulate_ctxt *ctxt)
 {
     struct priv_op_ctxt *poc = container_of(ctxt, struct priv_op_ctxt, ctxt);
     struct vcpu *curr = current;
@@ -493,9 +495,9 @@ static int write_io(unsigned int port, unsigned int bytes,
     return X86EMUL_OKAY;
 }
 
-static int read_segment(enum x86_segment seg,
-                        struct segment_register *reg,
-                        struct x86_emulate_ctxt *ctxt)
+static int cf_check read_segment(
+    enum x86_segment seg, struct segment_register *reg,
+    struct x86_emulate_ctxt *ctxt)
 {
     /* Check if this is an attempt to access the I/O bitmap. */
     if ( seg == x86_seg_tr )
@@ -607,10 +609,10 @@ static int pv_emul_virt_to_linear(unsigned long base, unsigned long offset,
     return rc;
 }
 
-static int rep_ins(uint16_t port,
-                   enum x86_segment seg, unsigned long offset,
-                   unsigned int bytes_per_rep, unsigned long *reps,
-                   struct x86_emulate_ctxt *ctxt)
+static int cf_check rep_ins(
+    uint16_t port, enum x86_segment seg, unsigned long offset,
+    unsigned int bytes_per_rep, unsigned long *reps,
+    struct x86_emulate_ctxt *ctxt)
 {
     struct priv_op_ctxt *poc = container_of(ctxt, struct priv_op_ctxt, ctxt);
     struct vcpu *curr = current;
@@ -675,10 +677,10 @@ static int rep_ins(uint16_t port,
     return X86EMUL_OKAY;
 }
 
-static int rep_outs(enum x86_segment seg, unsigned long offset,
-                    uint16_t port,
-                    unsigned int bytes_per_rep, unsigned long *reps,
-                    struct x86_emulate_ctxt *ctxt)
+static int cf_check rep_outs(
+    enum x86_segment seg, unsigned long offset, uint16_t port,
+    unsigned int bytes_per_rep, unsigned long *reps,
+    struct x86_emulate_ctxt *ctxt)
 {
     struct priv_op_ctxt *poc = container_of(ctxt, struct priv_op_ctxt, ctxt);
     struct vcpu *curr = current;
@@ -744,8 +746,8 @@ static int rep_outs(enum x86_segment seg, unsigned long offset,
     return X86EMUL_OKAY;
 }
 
-static int read_cr(unsigned int reg, unsigned long *val,
-                   struct x86_emulate_ctxt *ctxt)
+static int cf_check read_cr(
+    unsigned int reg, unsigned long *val, struct x86_emulate_ctxt *ctxt)
 {
     const struct vcpu *curr = current;
 
@@ -787,8 +789,8 @@ static int read_cr(unsigned int reg, unsigned long *val,
     return X86EMUL_UNHANDLEABLE;
 }
 
-static int write_cr(unsigned int reg, unsigned long val,
-                    struct x86_emulate_ctxt *ctxt)
+static int cf_check write_cr(
+    unsigned int reg, unsigned long val, struct x86_emulate_ctxt *ctxt)
 {
     struct vcpu *curr = current;
 
@@ -871,8 +873,8 @@ static uint64_t guest_efer(const struct domain *d)
     return val;
 }
 
-static int read_msr(unsigned int reg, uint64_t *val,
-                    struct x86_emulate_ctxt *ctxt)
+static int cf_check read_msr(
+    unsigned int reg, uint64_t *val, struct x86_emulate_ctxt *ctxt)
 {
     struct vcpu *curr = current;
     const struct domain *currd = curr->domain;
@@ -1020,8 +1022,8 @@ static int read_msr(unsigned int reg, uint64_t *val,
     return ret;
 }
 
-static int write_msr(unsigned int reg, uint64_t val,
-                     struct x86_emulate_ctxt *ctxt)
+static int cf_check write_msr(
+    unsigned int reg, uint64_t val, struct x86_emulate_ctxt *ctxt)
 {
     struct vcpu *curr = current;
     const struct domain *currd = curr->domain;
@@ -1188,8 +1190,9 @@ static int write_msr(unsigned int reg, uint64_t val,
     return X86EMUL_UNHANDLEABLE;
 }
 
-static int cache_op(enum x86emul_cache_op op, enum x86_segment seg,
-                    unsigned long offset, struct x86_emulate_ctxt *ctxt)
+static int cf_check cache_op(
+    enum x86emul_cache_op op, enum x86_segment seg,
+    unsigned long offset, struct x86_emulate_ctxt *ctxt)
 {
     ASSERT(op == x86emul_wbinvd || op == x86emul_wbnoinvd);
 
@@ -1208,8 +1211,8 @@ static int cache_op(enum x86emul_cache_op op, enum x86_segment seg,
     return X86EMUL_OKAY;
 }
 
-static int validate(const struct x86_emulate_state *state,
-                    struct x86_emulate_ctxt *ctxt)
+static int cf_check validate(
+    const struct x86_emulate_state *state, struct x86_emulate_ctxt *ctxt)
 {
     switch ( ctxt->opcode )
     {
@@ -1258,10 +1261,9 @@ static int validate(const struct x86_emulate_state *state,
     return X86EMUL_UNHANDLEABLE;
 }
 
-static int insn_fetch(unsigned long offset,
-                      void *p_data,
-                      unsigned int bytes,
-                      struct x86_emulate_ctxt *ctxt)
+static int cf_check insn_fetch(
+    unsigned long offset, void *p_data, unsigned int bytes,
+    struct x86_emulate_ctxt *ctxt)
 {
     const struct priv_op_ctxt *poc =
         container_of(ctxt, struct priv_op_ctxt, ctxt);
diff --git a/xen/arch/x86/pv/emulate.h b/xen/arch/x86/pv/emulate.h
index 4b845b08e372..49a4d34832df 100644
--- a/xen/arch/x86/pv/emulate.h
+++ b/xen/arch/x86/pv/emulate.h
@@ -12,13 +12,6 @@ int pv_emul_read_descriptor(unsigned int sel, const struct vcpu *v,
 
 void pv_emul_instruction_done(struct cpu_user_regs *regs, unsigned long rip);
 
-static inline int pv_emul_is_mem_write(const struct x86_emulate_state *state,
-                                       struct x86_emulate_ctxt *ctxt)
-{
-    return x86_insn_is_mem_write(state, ctxt) ? X86EMUL_OKAY
-                                              : X86EMUL_UNHANDLEABLE;
-}
-
 /* Return a pointer to the GDT/LDT descriptor referenced by sel. */
 static inline const seg_desc_t *gdt_ldt_desc_ptr(unsigned int sel)
 {
diff --git a/xen/arch/x86/pv/ro-page-fault.c b/xen/arch/x86/pv/ro-page-fault.c
index ef4d146c1d9e..5963f5ee2d51 100644
--- a/xen/arch/x86/pv/ro-page-fault.c
+++ b/xen/arch/x86/pv/ro-page-fault.c
@@ -26,6 +26,13 @@
 #include "emulate.h"
 #include "mm.h"
 
+static int cf_check pv_emul_is_mem_write(
+    const struct x86_emulate_state *state, struct x86_emulate_ctxt *ctxt)
+{
+    return x86_insn_is_mem_write(state, ctxt) ? X86EMUL_OKAY
+                                              : X86EMUL_UNHANDLEABLE;
+}
+
 /*********************
  * Writable Pagetables
  */
@@ -35,9 +42,9 @@ struct ptwr_emulate_ctxt {
     l1_pgentry_t  pte;
 };
 
-static int ptwr_emulated_read(enum x86_segment seg, unsigned long offset,
-                              void *p_data, unsigned int bytes,
-                              struct x86_emulate_ctxt *ctxt)
+static int cf_check ptwr_emulated_read(
+    enum x86_segment seg, unsigned long offset, void *p_data,
+    unsigned int bytes, struct x86_emulate_ctxt *ctxt)
 {
     unsigned int rc = bytes;
     unsigned long addr = offset;
@@ -52,9 +59,9 @@ static int ptwr_emulated_read(enum x86_segment seg, unsigned long offset,
     return X86EMUL_OKAY;
 }
 
-static int ptwr_emulated_insn_fetch(unsigned long offset,
-                                    void *p_data, unsigned int bytes,
-                                    struct x86_emulate_ctxt *ctxt)
+static int cf_check ptwr_emulated_insn_fetch(
+    unsigned long offset, void *p_data, unsigned int bytes,
+    struct x86_emulate_ctxt *ctxt)
 {
     unsigned int rc = copy_from_guest_pv(p_data, (void *)offset, bytes);
 
@@ -218,9 +225,9 @@ static int ptwr_emulated_update(unsigned long addr, intpte_t *p_old,
     return X86EMUL_OKAY;
 }
 
-static int ptwr_emulated_write(enum x86_segment seg, unsigned long offset,
-                               void *p_data, unsigned int bytes,
-                               struct x86_emulate_ctxt *ctxt)
+static int cf_check ptwr_emulated_write(
+    enum x86_segment seg, unsigned long offset, void *p_data,
+    unsigned int bytes, struct x86_emulate_ctxt *ctxt)
 {
     intpte_t val = 0;
 
@@ -236,9 +243,9 @@ static int ptwr_emulated_write(enum x86_segment seg, unsigned long offset,
     return ptwr_emulated_update(offset, NULL, val, bytes, ctxt);
 }
 
-static int ptwr_emulated_cmpxchg(enum x86_segment seg, unsigned long offset,
-                                 void *p_old, void *p_new, unsigned int bytes,
-                                 bool lock, struct x86_emulate_ctxt *ctxt)
+static int cf_check ptwr_emulated_cmpxchg(
+    enum x86_segment seg, unsigned long offset, void *p_old, void *p_new,
+    unsigned int bytes, bool lock, struct x86_emulate_ctxt *ctxt)
 {
     intpte_t old = 0, new = 0;
     int rc;
diff --git a/xen/arch/x86/x86_emulate.c b/xen/arch/x86/x86_emulate.c
index 1e082e6f3b2d..60191a94dc18 100644
--- a/xen/arch/x86/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate.c
@@ -53,8 +53,8 @@
 
 #include "x86_emulate/x86_emulate.c"
 
-int x86emul_read_xcr(unsigned int reg, uint64_t *val,
-                     struct x86_emulate_ctxt *ctxt)
+int cf_check x86emul_read_xcr(
+    unsigned int reg, uint64_t *val, struct x86_emulate_ctxt *ctxt)
 {
     switch ( reg )
     {
@@ -77,8 +77,8 @@ int x86emul_read_xcr(unsigned int reg, uint64_t *val,
 }
 
 /* Note: May be called with ctxt=NULL. */
-int x86emul_write_xcr(unsigned int reg, uint64_t val,
-                      struct x86_emulate_ctxt *ctxt)
+int cf_check x86emul_write_xcr(
+    unsigned int reg, uint64_t val, struct x86_emulate_ctxt *ctxt)
 {
     switch ( reg )
     {
@@ -100,8 +100,8 @@ int x86emul_write_xcr(unsigned int reg, uint64_t val,
 
 #ifdef CONFIG_PV
 /* Called with NULL ctxt in hypercall context. */
-int x86emul_read_dr(unsigned int reg, unsigned long *val,
-                    struct x86_emulate_ctxt *ctxt)
+int cf_check x86emul_read_dr(
+    unsigned int reg, unsigned long *val, struct x86_emulate_ctxt *ctxt)
 {
     struct vcpu *curr = current;
 
@@ -143,8 +143,8 @@ int x86emul_read_dr(unsigned int reg, unsigned long *val,
     return X86EMUL_OKAY;
 }
 
-int x86emul_write_dr(unsigned int reg, unsigned long val,
-                     struct x86_emulate_ctxt *ctxt)
+int cf_check x86emul_write_dr(
+    unsigned int reg, unsigned long val, struct x86_emulate_ctxt *ctxt)
 {
     struct vcpu *curr = current;
 
@@ -167,8 +167,9 @@ int x86emul_write_dr(unsigned int reg, unsigned long val,
 }
 #endif /* CONFIG_PV */
 
-int x86emul_cpuid(uint32_t leaf, uint32_t subleaf,
-                  struct cpuid_leaf *res, struct x86_emulate_ctxt *ctxt)
+int cf_check x86emul_cpuid(
+    uint32_t leaf, uint32_t subleaf, struct cpuid_leaf *res,
+    struct x86_emulate_ctxt *ctxt)
 {
     guest_cpuid(current, leaf, subleaf, res);
 
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
index 2ba54c61511c..6c0d18954a5f 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -2524,7 +2524,7 @@ static void adjust_bnd(struct x86_emulate_ctxt *ctxt,
  done:;
 }
 
-int x86emul_unhandleable_rw(
+int cf_check x86emul_unhandleable_rw(
     enum x86_segment seg,
     unsigned long offset,
     void *p_data,
@@ -12320,7 +12320,7 @@ x86_insn_operand_ea(const struct x86_emulate_state *state,
  * memory operand (like POP), but it does not mean e.g. segment selector
  * loads, where the descriptor table access is considered an implicit one.
  */
-bool
+bool cf_check
 x86_insn_is_mem_access(const struct x86_emulate_state *state,
                        const struct x86_emulate_ctxt *ctxt)
 {
@@ -12412,7 +12412,7 @@ x86_insn_is_mem_access(const struct x86_emulate_state *state,
  * loads, where the (possible) descriptor table write is considered an
  * implicit access.
  */
-bool
+bool cf_check
 x86_insn_is_mem_write(const struct x86_emulate_state *state,
                       const struct x86_emulate_ctxt *ctxt)
 {
@@ -12584,7 +12584,7 @@ x86_insn_is_mem_write(const struct x86_emulate_state *state,
     return false;
 }
 
-bool
+bool cf_check
 x86_insn_is_portio(const struct x86_emulate_state *state,
                    const struct x86_emulate_ctxt *ctxt)
 {
@@ -12599,7 +12599,7 @@ x86_insn_is_portio(const struct x86_emulate_state *state,
     return false;
 }
 
-bool
+bool cf_check
 x86_insn_is_cr_access(const struct x86_emulate_state *state,
                       const struct x86_emulate_ctxt *ctxt)
 {
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.h b/xen/arch/x86/x86_emulate/x86_emulate.h
index 419def8790a0..4732855c40ed 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.h
+++ b/xen/arch/x86/x86_emulate/x86_emulate.h
@@ -737,7 +737,7 @@ static inline unsigned long *decode_gpr(struct cpu_user_regs *regs,
 }
 
 /* Unhandleable read, write or instruction fetch */
-int
+int cf_check
 x86emul_unhandleable_rw(
     enum x86_segment seg,
     unsigned long offset,
@@ -766,16 +766,16 @@ x86_insn_immediate(const struct x86_emulate_state *state,
 unsigned int
 x86_insn_length(const struct x86_emulate_state *state,
                 const struct x86_emulate_ctxt *ctxt);
-bool
+bool cf_check
 x86_insn_is_mem_access(const struct x86_emulate_state *state,
                        const struct x86_emulate_ctxt *ctxt);
-bool
+bool cf_check
 x86_insn_is_mem_write(const struct x86_emulate_state *state,
                       const struct x86_emulate_ctxt *ctxt);
-bool
+bool cf_check
 x86_insn_is_portio(const struct x86_emulate_state *state,
                    const struct x86_emulate_ctxt *ctxt);
-bool
+bool cf_check
 x86_insn_is_cr_access(const struct x86_emulate_state *state,
                       const struct x86_emulate_ctxt *ctxt);
 
@@ -787,17 +787,18 @@ void x86_emulate_free_state(struct x86_emulate_state *state);
 
 #ifdef __XEN__
 
-int x86emul_read_xcr(unsigned int reg, uint64_t *val,
-                     struct x86_emulate_ctxt *ctxt);
-int x86emul_write_xcr(unsigned int reg, uint64_t val,
-                      struct x86_emulate_ctxt *ctxt);
-
-int x86emul_read_dr(unsigned int reg, unsigned long *val,
-                    struct x86_emulate_ctxt *ctxt);
-int x86emul_write_dr(unsigned int reg, unsigned long val,
-                     struct x86_emulate_ctxt *ctxt);
-int x86emul_cpuid(uint32_t leaf, uint32_t subleaf,
-                  struct cpuid_leaf *res, struct x86_emulate_ctxt *ctxt);
+int cf_check x86emul_read_xcr(
+    unsigned int reg, uint64_t *val, struct x86_emulate_ctxt *ctxt);
+int cf_check x86emul_write_xcr(
+    unsigned int reg, uint64_t val, struct x86_emulate_ctxt *ctxt);
+
+int cf_check x86emul_read_dr(
+    unsigned int reg, unsigned long *val, struct x86_emulate_ctxt *ctxt);
+int cf_check x86emul_write_dr(
+    unsigned int reg, unsigned long val, struct x86_emulate_ctxt *ctxt);
+int cf_check x86emul_cpuid(
+    uint32_t leaf, uint32_t subleaf, struct cpuid_leaf *res,
+    struct x86_emulate_ctxt *ctxt);
 
 #endif
 
-- 
2.11.0


