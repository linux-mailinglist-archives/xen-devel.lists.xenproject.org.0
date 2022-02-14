Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 905834B5162
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:16:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271930.466690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbDb-0003Pm-Md; Mon, 14 Feb 2022 13:16:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271930.466690; Mon, 14 Feb 2022 13:16:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbDb-0003NT-Fy; Mon, 14 Feb 2022 13:16:39 +0000
Received: by outflank-mailman (input) for mailman id 271930;
 Mon, 14 Feb 2022 13:16:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb3m-0008IH-0Q
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:06:30 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb2b0ec9-8d96-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:06:27 +0100 (CET)
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
X-Inumbo-ID: eb2b0ec9-8d96-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843987;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=GWauAq5Hi4t0sVZGrU3/q6tMpZvbMlc+nyZ6uD+AkRI=;
  b=Ay0CCB9Kz/uvcRFfhiLSB3FuZDpAMadFy6IrAJFC8UMVbsMpgeXyMube
   ZvsvsJb5xhRogwpn4PXuGdH878DFwAvEvZergm9mxrIiwf5bHIdV29+QM
   YNeBpuFUM8hpBErbvUWgoTOWR/IzkvWNxnkTwFim7DqRGu09B2XT9xQR0
   0=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: o4lSuCzDEusyVfSInkyFoHW4DgsPAKeUwFYa6tsXxSB0jgSnx/3zwHDm161r/7oMdBA0f212v0
 0sSY+qJAZRTzrax9S5ujZSAWaWtZjKM4PLDUDnejA6F6izTMDj3EwXkIHONTE4NMkMIW/j28Wl
 6/zwDaGnHAzxYHxsC4g65ZOyGUyBbCEVnGj+PD6DsqwP4QgXGwbtqXUlzBuy1SpmQ94IPUW/By
 oBvLqf4ZXIK5gajkxkkbu49X6G5shjOQnawJA+LofFqUMjAMqU+RtZt/s3uvNe2Wh5IJATPTGc
 yFnRCnF5ImrkU+N539g2xh3h
X-SBRS: 5.1
X-MesageID: 64050683
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Rn4lV65YTRTMTU2Ztge6hQxRtCHAchMFZxGqfqrLsTDasY5as4F+v
 mtJDG+HOvaPNzOjc40kbtyy/E0O68WAzt8yTAI+rygwHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZj29Iw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z9
 /hXmMXrYiYSEaSVu8MhXzgBOCNmMvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gQQa6DP
 5RJMlKDajyHTCxMHwoGMakDp7nxpynmVj8fpVaa8P9fD2/7k1UqjemF3MDuUsyHQ4BZk1iVo
 krC/n/lGVcKOdqH0z2H/3mwwOjVkkvGtJk6TePisKQw2RvKmzJVWEZ+uUaHTeeRtWOkdosEA
 G0v1SN3jo8O+G3yZdvlUEjtyJKbhSI0V91VGuw8zQiCzKvI/gqUblQ5oi59hM8O75FvG2Fzv
 rOdt5awXGE07uXJIZ6I3urM9VuP1T4pwXjujMPuZS8M+JHdrY46lXojpf4zQffu3rUZ9dwdq
 g1mTRTSZZ1O16bnNI3hpDgrZg5AQbCTEGYICv3/BD7N0++ATNfNi3aUwVba9+1cC42SU0OMu
 nMJ8+DHsrxSUsHdyXHVGb5XdF1M2xpiGGeC6WOD4rF7r2j9k5JdVdw4DM5CyLdBbZ9fJG6Bj
 L77sgJN/p5DVEZGnocsC79d//8ClPC6ffy8D6i8RoMXPvBZKV/WlAkzNBX49z28zyARfVQXZ
 M7znTCEVi1BV8yKDVOeGo8g7FPc7n5ilD2DHcihl3xKE9O2PRaodFvMC3PWBshR0U9OiF+Nm
 zqGH8fVmRhZTsPkZSzbrdwaIVwQdCBpDpHqsc1HMOWEJ1M+Sm0mDvbQx5InepBkwPsJxruZo
 CnlVx8K0kf7iF3GNR6ONiJpZoTwUMsttnk8JyEtYwqlgiBxfYa14a4DXJIrZr17pvd7xPt5Q
 qBdKcWNC/hCUBrd/DEZYcWvpYBubk3z1wmPIzCkcH40eJs5H17F/drtfw3O8igSD3Xo6Zti8
 uP4jg6CGMgNXQVvCsrSecmD9VLpsChPgv92UmvJPsJXJBfm/r91JnGjlfQwOcwNd0nOn2PIy
 waMDB4EjuDRuItposLRjKWJoor1QetzGk1WQzvS4bqsbHSI+2OixclLUfqSfCCbX2Txof3wa
 eJQxvD6EfsGgFcV7NYsT+c1lfozt4n1urtX7gV4B3GaPV2kB4RpLmSCwcQS5LZGwaVUuFfuV
 0+CkjWA1W5l5C8x/IYtGTcY
IronPort-HdrOrdr: A9a23:uUxSV6GC3MTHEZd/pLqE6seALOsnbusQ8zAXP0AYc3Jom62j5r
 mTdZsgtSMc5Ax8ZJhko6HkBEDiewK7yXcW2/hzAV7KZmCP0wHEEGgh1/qH/9SJIVyYygc378
 ZdmsZFZ+EYdWIK7/rH3A==
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64050683"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 34/70] x86/emul: CFI hardening
Date: Mon, 14 Feb 2022 12:50:51 +0000
Message-ID: <20220214125127.17985-35-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Control Flow Integrity schemes use toolchain and optionally hardware support
to help protect against call/jump/return oriented programming attacks.

Use cf_check to annotate function pointer targets for the toolchain.

pv_emul_is_mem_write() is only used in a single file.  Having it as a static
inline is pointless because it can't be inlined to begin with.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v2:
 * Correct details in commit message.
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
index 9b9de4c6bef7..a684ffabfaae 100644
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
index 4b6956c5be78..4d0bebbf8aab 100644
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
index 824af9d899b5..5cdef535affd 100644
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
@@ -12318,7 +12318,7 @@ x86_insn_operand_ea(const struct x86_emulate_state *state,
  * memory operand (like POP), but it does not mean e.g. segment selector
  * loads, where the descriptor table access is considered an implicit one.
  */
-bool
+bool cf_check
 x86_insn_is_mem_access(const struct x86_emulate_state *state,
                        const struct x86_emulate_ctxt *ctxt)
 {
@@ -12410,7 +12410,7 @@ x86_insn_is_mem_access(const struct x86_emulate_state *state,
  * loads, where the (possible) descriptor table write is considered an
  * implicit access.
  */
-bool
+bool cf_check
 x86_insn_is_mem_write(const struct x86_emulate_state *state,
                       const struct x86_emulate_ctxt *ctxt)
 {
@@ -12582,7 +12582,7 @@ x86_insn_is_mem_write(const struct x86_emulate_state *state,
     return false;
 }
 
-bool
+bool cf_check
 x86_insn_is_portio(const struct x86_emulate_state *state,
                    const struct x86_emulate_ctxt *ctxt)
 {
@@ -12597,7 +12597,7 @@ x86_insn_is_portio(const struct x86_emulate_state *state,
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


