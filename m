Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5668A9FF712
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2025 09:46:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863730.1275098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTGpu-0004wX-GH; Thu, 02 Jan 2025 08:45:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863730.1275098; Thu, 02 Jan 2025 08:45:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTGpu-0004se-8k; Thu, 02 Jan 2025 08:45:46 +0000
Received: by outflank-mailman (input) for mailman id 863730;
 Thu, 02 Jan 2025 08:45:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BpyQ=T2=bounce.vates.tech=bounce-md_30504962.67765235.v1-d628a30899f042d695a6c136380c8c92@srs-se1.protection.inumbo.net>)
 id 1tTGps-0004rF-EC
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2025 08:45:44 +0000
Received: from mail180-43.suw31.mandrillapp.com
 (mail180-43.suw31.mandrillapp.com [198.2.180.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2e07578-c8e5-11ef-a0db-8be0dac302b0;
 Thu, 02 Jan 2025 09:45:42 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-43.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4YP0fF5Mh3zLfHBGS
 for <xen-devel@lists.xenproject.org>; Thu,  2 Jan 2025 08:45:41 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 d628a30899f042d695a6c136380c8c92; Thu, 02 Jan 2025 08:45:41 +0000
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
X-Inumbo-ID: f2e07578-c8e5-11ef-a0db-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1735807541; x=1736068041;
	bh=R32ivPZ8JUTitnv8cnvvzU3Su0yCpWPGxSwsBLOjoMQ=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=FOZPufxURTOJy7jIkSOWuXuzFjoTT6HtVVRLQZXjWLU2rGd4rxAKTsQK1RH1aKLBP
	 OCZQVmacuF27CIiKezl1StZeWVwSBHy6Y2AFrO5rs2HVWEk4azJg3gxxNZBwdnga9c
	 XQssrH2yJxpiYUaVlpWJfMSB8Pi6ng7oTU3DnJ0zcnNTMAJurlfS+6cf2yyu0dmDp4
	 ks/BJUcjyqrZoslDwUKUeYlbdWcf3N5gzCiVjqoHtNqZm6+6azL8tHKK8mkoydWw2o
	 h5clkv9woQ/CPdcyRJ1TR/JQqehG+NPbXictUbGLw3TLbCemVp/vnjLZt81Vof35fm
	 wS/xMw1b6vcig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1735807541; x=1736068041; i=ngoc-tu.dinh@vates.tech;
	bh=R32ivPZ8JUTitnv8cnvvzU3Su0yCpWPGxSwsBLOjoMQ=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=TeEufgR2NQZPge6us8mIOYWSDG5iDl4P3Bz+153exU8Ee8nbhAfzDljnr6veMuVCM
	 A3xg/8RWs34txfq9KsxIiPhC2//5iF6xizgYg9AKWxdiuzdyt4GkmBfWWQpFdDYgq5
	 Q3PAkqeQQOX6DqvRkjlsp8CqHhannave30oTYkBUu2osvm5hhPWR0PBV83fWanyKt9
	 Mhehk3xJIQo8hXbaWTOpX9PzSdPGbldVdhgzhjVt9FJzECNnM1IvLAO1b8KlfQe/r4
	 JyKZSk0oZ4keEGrj/i6/d6LkCZR/79U8jTSdf8CyL7EW6z1fTFNygLxtxe8fCQd5af
	 v9m8S5NFaBs3g==
From: "Tu Dinh" <ngoc-tu.dinh@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=20v2=2008/10]=20x86/emulate:=20Implement=20XSAVES/XRSTORS=20for=20arch=20LBR?=
X-Mailer: git-send-email 2.43.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1735807540507
To: xen-devel@lists.xenproject.org
Cc: "Tu Dinh" <ngoc-tu.dinh@vates.tech>, "Anthony PERARD" <anthony.perard@vates.tech>, "Juergen Gross" <jgross@suse.com>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <20250102084413.102-9-ngoc-tu.dinh@vates.tech>
In-Reply-To: <20250102084413.102-1-ngoc-tu.dinh@vates.tech>
References: <20250102084413.102-1-ngoc-tu.dinh@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.d628a30899f042d695a6c136380c8c92?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250102:md
Date: Thu, 02 Jan 2025 08:45:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Add new set_lbr_depth HVM function and emulate ops to support LBR
XSAVES/XRSTORS emulation.

Add the appropriate instruction hooks to 0fc7.c. Translate LBR registers
using cs.base within a large block emulator operation.

Signed-off-by: Tu Dinh <ngoc-tu.dinh@vates.tech>
---
 tools/tests/x86_emulator/x86-emulate.h |   2 +
 xen/arch/x86/hvm/emulate.c             |  11 ++
 xen/arch/x86/include/asm/hvm/hvm.h     |   3 +
 xen/arch/x86/x86_emulate/0fc7.c        | 260 ++++++++++++++++++-------
 xen/arch/x86/x86_emulate/blk.c         | 142 ++++++++++++++
 xen/arch/x86/x86_emulate/private.h     |   8 +
 xen/arch/x86/x86_emulate/util-xen.c    |  14 ++
 xen/arch/x86/x86_emulate/x86_emulate.c |  19 ++
 xen/arch/x86/x86_emulate/x86_emulate.h |  33 ++++
 9 files changed, 422 insertions(+), 70 deletions(-)

diff --git a/tools/tests/x86_emulator/x86-emulate.h b/tools/tests/x86_emulator/x86-emulate.h
index 929c1a72ae..75a9a65ae7 100644
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -218,6 +218,8 @@ void wrpkru(unsigned int val);
 #define cpu_has_fma4                (cpu_policy.extd.fma4 && xcr0_mask(6))
 #define cpu_has_tbm                  cpu_policy.extd.tbm
 
+#define current_cpu_has_lbr_lip      cpu_policy.basic.lbr_1Ca.ip_contains_lip
+
 int emul_test_cpuid(
     uint32_t leaf,
     uint32_t subleaf,
diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index a1935a1748..c3b0bd4cbe 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -2562,6 +2562,16 @@ static int cf_check hvmemul_vmfunc(
     return rc;
 }
 
+static int cf_check hvmemul_set_lbr_depth(
+    uint32_t depth,
+    struct x86_emulate_ctxt *ctxt)
+{
+    if ( !hvm_funcs.set_lbr_depth )
+        return X86EMUL_UNHANDLEABLE;
+    alternative_vcall(hvm_funcs.set_lbr_depth, current, depth);
+    return X86EMUL_OKAY;
+}
+
 static const struct x86_emulate_ops hvm_emulate_ops = {
     .read          = hvmemul_read,
     .insn_fetch    = hvmemul_insn_fetch,
@@ -2590,6 +2600,7 @@ static const struct x86_emulate_ops hvm_emulate_ops = {
     .get_fpu       = hvmemul_get_fpu,
     .put_fpu       = hvmemul_put_fpu,
     .vmfunc        = hvmemul_vmfunc,
+    .set_lbr_depth = hvmemul_set_lbr_depth,
 };
 
 static const struct x86_emulate_ops hvm_emulate_ops_no_write = {
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index cad3a94278..bfce78952f 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -238,6 +238,9 @@ struct hvm_function_table {
     int (*vmtrace_get_option)(struct vcpu *v, uint64_t key, uint64_t *value);
     int (*vmtrace_reset)(struct vcpu *v);
 
+    /* Arch LBR */
+    void (*set_lbr_depth)(struct vcpu *v, uint32_t depth);
+
     uint64_t (*get_reg)(struct vcpu *v, unsigned int reg);
     void (*set_reg)(struct vcpu *v, unsigned int reg, uint64_t val);
 
diff --git a/xen/arch/x86/x86_emulate/0fc7.c b/xen/arch/x86/x86_emulate/0fc7.c
index 5268d5cafd..bb2b308afe 100644
--- a/xen/arch/x86/x86_emulate/0fc7.c
+++ b/xen/arch/x86/x86_emulate/0fc7.c
@@ -10,6 +10,10 @@
 
 #include "private.h"
 
+#if defined(__XEN__) && !defined(X86EMUL_NO_FPU)
+# include <asm/xstate.h>
+#endif
+
 /* Avoid namespace pollution. */
 #undef cmpxchg
 
@@ -107,87 +111,203 @@ int x86emul_0fc7(struct x86_emulate_state *s,
     }
     else
     {
-        union {
-            uint32_t u32[2];
-            uint64_t u64[2];
-        } *old, *aux;
-
-        /* cmpxchg8b/cmpxchg16b */
-        generate_exception_if((s->modrm_reg & 7) != 1, X86_EXC_UD);
-        fail_if(!ops->cmpxchg);
-        if ( s->rex_prefix & REX_W )
-        {
-            host_and_vcpu_must_have(cx16);
-            generate_exception_if(!is_aligned(s->ea.mem.seg, s->ea.mem.off, 16,
-                                              ctxt, ops),
-                                  X86_EXC_GP, 0);
-            s->op_bytes = 16;
-        }
-        else
+        switch ( s->modrm_reg & 7 )
         {
-            vcpu_must_have(cx8);
-            s->op_bytes = 8;
-        }
+            default:
+                return X86EMUL_UNRECOGNIZED;
 
-        old = container_of(&mmvalp->ymm[0], typeof(*old), u64[0]);
-        aux = container_of(&mmvalp->ymm[2], typeof(*aux), u64[0]);
+            case 1: /* cmpxchg8b/cmpxchg16b */
+            {
+                union {
+                    uint32_t u32[2];
+                    uint64_t u64[2];
+                } *old, *aux;
 
-        /* Get actual old value. */
-        if ( (rc = ops->read(s->ea.mem.seg, s->ea.mem.off, old, s->op_bytes,
-                             ctxt)) != X86EMUL_OKAY )
-            goto done;
+                fail_if(!ops->cmpxchg);
+                if ( s->rex_prefix & REX_W )
+                {
+                    host_and_vcpu_must_have(cx16);
+                    generate_exception_if(!is_aligned(s->ea.mem.seg, s->ea.mem.off, 16,
+                                                      ctxt, ops),
+                                          X86_EXC_GP, 0);
+                    s->op_bytes = 16;
+                }
+                else
+                {
+                    vcpu_must_have(cx8);
+                    s->op_bytes = 8;
+                }
 
-        /* Get expected value. */
-        if ( s->op_bytes == 8 )
-        {
-            aux->u32[0] = regs->eax;
-            aux->u32[1] = regs->edx;
-        }
-        else
-        {
-            aux->u64[0] = regs->r(ax);
-            aux->u64[1] = regs->r(dx);
-        }
+                old = container_of(&mmvalp->ymm[0], typeof(*old), u64[0]);
+                aux = container_of(&mmvalp->ymm[2], typeof(*aux), u64[0]);
 
-        if ( memcmp(old, aux, s->op_bytes) )
-        {
-        cmpxchgNb_failed:
-            /* Expected != actual: store actual to rDX:rAX and clear ZF. */
-            regs->r(ax) = s->op_bytes == 8 ? old->u32[0] : old->u64[0];
-            regs->r(dx) = s->op_bytes == 8 ? old->u32[1] : old->u64[1];
-            regs->eflags &= ~X86_EFLAGS_ZF;
-        }
-        else
-        {
-            /*
-             * Expected == actual: Get proposed value, attempt atomic cmpxchg
-             * and set ZF if successful.
-             */
-            if ( s->op_bytes == 8 )
-            {
-                aux->u32[0] = regs->ebx;
-                aux->u32[1] = regs->ecx;
-            }
-            else
-            {
-                aux->u64[0] = regs->r(bx);
-                aux->u64[1] = regs->r(cx);
+                /* Get actual old value. */
+                if ( (rc = ops->read(s->ea.mem.seg, s->ea.mem.off, old, s->op_bytes,
+                                     ctxt)) != X86EMUL_OKAY )
+                    goto done;
+
+                /* Get expected value. */
+                if ( s->op_bytes == 8 )
+                {
+                    aux->u32[0] = regs->eax;
+                    aux->u32[1] = regs->edx;
+                }
+                else
+                {
+                    aux->u64[0] = regs->r(ax);
+                    aux->u64[1] = regs->r(dx);
+                }
+
+                if ( memcmp(old, aux, s->op_bytes) )
+                {
+                cmpxchgNb_failed:
+                    /* Expected != actual: store actual to rDX:rAX and clear ZF. */
+                    regs->r(ax) = s->op_bytes == 8 ? old->u32[0] : old->u64[0];
+                    regs->r(dx) = s->op_bytes == 8 ? old->u32[1] : old->u64[1];
+                    regs->eflags &= ~X86_EFLAGS_ZF;
+                }
+                else
+                {
+                    /*
+                    * Expected == actual: Get proposed value, attempt atomic cmpxchg
+                    * and set ZF if successful.
+                    */
+                    if ( s->op_bytes == 8 )
+                    {
+                        aux->u32[0] = regs->ebx;
+                        aux->u32[1] = regs->ecx;
+                    }
+                    else
+                    {
+                        aux->u64[0] = regs->r(bx);
+                        aux->u64[1] = regs->r(cx);
+                    }
+
+                    switch ( rc = ops->cmpxchg(s->ea.mem.seg, s->ea.mem.off, old, aux,
+                                               s->op_bytes, s->lock_prefix, ctxt) )
+                    {
+                    case X86EMUL_OKAY:
+                        regs->eflags |= X86_EFLAGS_ZF;
+                        break;
+
+                    case X86EMUL_CMPXCHG_FAILED:
+                        rc = X86EMUL_OKAY;
+                        goto cmpxchgNb_failed;
+
+                    default:
+                        goto done;
+                    }
+                }
+                break;
             }
 
-            switch ( rc = ops->cmpxchg(s->ea.mem.seg, s->ea.mem.off, old, aux,
-                                       s->op_bytes, s->lock_prefix, ctxt) )
+#if defined(__XEN__) && !defined(X86EMUL_NO_FPU)
+            case 3: /* xrstors */
+            case 5: /* xsaves */
             {
-            case X86EMUL_OKAY:
-                regs->eflags |= X86_EFLAGS_ZF;
-                break;
+                unsigned long cr0, cr4;
+                unsigned long xcr0, xss;
+                struct segment_register cs;
 
-            case X86EMUL_CMPXCHG_FAILED:
-                rc = X86EMUL_OKAY;
-                goto cmpxchgNb_failed;
+                generate_exception_if(s->vex.pfx, X86_EXC_UD);
+                host_and_vcpu_must_have(xsaves);
+                generate_exception_if(s->ea.type != OP_MEM, X86_EXC_UD);
+                generate_exception_if(!is_aligned(s->ea.mem.seg, s->ea.mem.off,
+                                                  64, ctxt, ops),
+                                      X86_EXC_GP, 0);
+                fail_if(!ops->blk || !ops->read_cr || !ops->read_xcr ||
+                        !ops->read_msr || !ops->write_msr ||
+                        !ops->read_segment);
+                fail_if(vcpu_has_arch_lbr() && !ops->set_lbr_depth);
 
-            default:
-                goto done;
+                if ( ops->read_cr(4, &cr4, ctxt) != X86EMUL_OKAY ||
+                     ops->read_cr(0, &cr0, ctxt) != X86EMUL_OKAY )
+                     cr0 = cr4 = 0;
+                generate_exception_if(!(cr4 & X86_CR4_OSXSAVE), X86_EXC_UD);
+                generate_exception_if(cr0 & X86_CR0_TS, X86_EXC_NM);
+                generate_exception_if(!mode_ring0(), X86_EXC_GP, 0);
+
+                if ( (rc = ops->read_segment(x86_seg_cs,
+                                             &cs, ctxt)) != X86EMUL_OKAY ||
+                     (rc = ops->read_xcr(0, &xcr0, ctxt)) != X86EMUL_OKAY ||
+                     (rc = ops->read_msr(MSR_IA32_XSS,
+                                         &xss, ctxt)) != X86EMUL_OKAY )
+                    goto done;
+
+                if ( vcpu_has_arch_lbr() &&
+                     ((rc = ops->read_msr(MSR_LBR_CTL, &ctxt->xsaves.lbr_ctl,
+                                          ctxt)) != X86EMUL_OKAY ||
+                      (rc = ops->read_msr(MSR_LBR_DEPTH, &ctxt->xsaves.lbr_depth,
+                                          ctxt)) != X86EMUL_OKAY) )
+                    goto done;
+
+                s->blk = (s->modrm_reg & 7) == 3 ? blk_xrstors : blk_xsaves;
+                ctxt->xsaves.rfbm = ((uint64_t)regs->edx << 32) | regs->eax;
+                ctxt->xsaves.rfbm &= xcr0 | xss;
+
+                if ( s->blk == blk_xrstors )
+                {
+                    struct xsave_struct hdr;
+                    int i;
+
+                    if ( (rc = ops->read(s->ea.mem.seg, s->ea.mem.off, &hdr,
+                                         sizeof(hdr), ctxt)) != X86EMUL_OKAY )
+                        goto done;
+                    /*
+                     * We must validate xcomp_bv at this stage to get a
+                     * stable XSAVE area size.
+                     */
+                    generate_exception_if(!xsave_area_compressed(&hdr),
+                                          X86_EXC_GP, 0);
+                    generate_exception_if(hdr.xsave_hdr.xcomp_bv &
+                                          ~XSTATE_COMPACTION_ENABLED &
+                                          ~(xcr0 | xss),
+                                          X86_EXC_GP, 0);
+                    generate_exception_if(hdr.xsave_hdr.xstate_bv &
+                                          ~hdr.xsave_hdr.xcomp_bv,
+                                          X86_EXC_GP, 0);
+                    for ( i = 0; i < ARRAY_SIZE(hdr.xsave_hdr.reserved); i++ )
+                        generate_exception_if(hdr.xsave_hdr.reserved[i],
+                                              X86_EXC_GP, 0);
+                    ctxt->xsaves.size = xstate_compressed_size(
+                            hdr.xsave_hdr.xcomp_bv &
+                            ~XSTATE_COMPACTION_ENABLED);
+                }
+                else
+                {
+                    ctxt->xsaves.size =
+                            xstate_compressed_size(ctxt->xsaves.rfbm);
+                }
+
+                if ( (rc = ops->blk(s->ea.mem.seg, s->ea.mem.off, NULL,
+                                    ctxt->xsaves.size, &regs->eflags,
+                                    s, ctxt)) != X86EMUL_OKAY )
+                    goto done;
+
+                if ( s->blk == blk_xrstors && vcpu_has_arch_lbr() )
+                {
+                    if ( (rc = ops->write_msr(MSR_LBR_CTL,
+                                              ctxt->xsaves.lbr_ctl,
+                                              ctxt)) != X86EMUL_OKAY ||
+                         (rc = ops->set_lbr_depth(ctxt->xsaves.lbr_depth,
+                                                  ctxt)) != X86EMUL_OKAY )
+                        goto done;
+                    /*
+                     * Even if xstate_bv[LBR]=0, XRSTORS will still clear
+                     * LBR/LER MSRs.
+                     */
+                    if ( !(ctxt->xsaves.xstate_bv & X86_XSS_LBR) &&
+                         ((rc = ops->write_msr(MSR_IA32_LASTINTFROMIP, 0,
+                                               ctxt)) != X86EMUL_OKAY ||
+                          (rc = ops->write_msr(MSR_IA32_LASTINTTOIP, 0,
+                                               ctxt)) != X86EMUL_OKAY ||
+                          (rc = ops->write_msr(MSR_LER_INFO, 0,
+                                               ctxt)) != X86EMUL_OKAY) )
+                        goto done;
+                }
+                break;
             }
+#endif /* __XEN__ && X86EMUL_NO_FPU */
         }
     }
 
diff --git a/xen/arch/x86/x86_emulate/blk.c b/xen/arch/x86/x86_emulate/blk.c
index 08a05f8453..ed85a58f30 100644
--- a/xen/arch/x86/x86_emulate/blk.c
+++ b/xen/arch/x86/x86_emulate/blk.c
@@ -17,6 +17,29 @@
 # endif
 #endif
 
+#if defined(__XEN__) && !defined(X86EMUL_NO_FPU)
+static struct xstate_lbr *
+x86_translate_lbr(struct x86_emulate_state *s,
+                  struct x86_emulate_ctxt *ctxt,
+                  const struct segment_register *cs,
+                  bool saving,
+                  struct xstate_lbr *lbr)
+{
+    uint64_t cs_offset;
+    uint32_t i;
+    
+    cs_offset = x86_get_lbr_cs_offset(ctxt->cpuid, mode_64bit(), cs, saving);
+    lbr->ler_from_ip += cs_offset;
+    lbr->ler_to_ip += cs_offset;
+    for ( i = 0; i < ctxt->xsaves.lbr_depth; i++ )
+    {
+        lbr->entries[i].lbr_from_ip += cs_offset;
+        lbr->entries[i].lbr_to_ip += cs_offset;
+    }
+    return lbr;
+}
+#endif
+
 int x86_emul_blk(
     void *ptr,
     void *data,
@@ -373,6 +396,125 @@ int x86_emul_blk(
         }
         break;
 
+/*
+ * XSAVES/XRSTORS emulation uses the host's XSS instructions and therefore
+ * can't be used in an usermode emulator.
+ */
+#if defined(__XEN__) && !defined(X86EMUL_NO_FPU)
+
+#define _xrstors(pfx, mem, eax, edx, faulted) \
+        asm volatile ( "1: .byte " pfx "0x0f,0xc7,0x1f\n" \
+                       "3:\n" \
+                       "   .section .fixup,\"ax\"\n" \
+                       "2: incl %[faulted]\n" \
+                       "   jmp 3b\n" \
+                       "   .previous\n" \
+                       _ASM_EXTABLE(1b, 2b) \
+                       : "+m" (*mem), [faulted] "+g" (faulted) \
+                       : "a" (eax), "d" (edx), "D" (mem) )
+#define _xsaves(pfx, mem, eax, edx, faulted) \
+        asm volatile ( "1: .byte " pfx "0x0f,0xc7,0x2f\n" \
+                       "3:\n" \
+                       "   .section .fixup,\"ax\"\n" \
+                       "2: incl %[faulted]\n" \
+                       "   jmp 3b\n" \
+                       "   .previous\n" \
+                       _ASM_EXTABLE(1b, 2b) \
+                       : "+m" (*mem), [faulted] "+g" (faulted) \
+                       : "a" (eax), "d" (edx), "D" (mem) )
+
+    case blk_xrstors:
+    {
+        struct xsave_struct *xstate = ptr;
+        unsigned int faulted;
+
+        ASSERT(!data);
+
+        if ( ctxt->xsaves.rfbm & xstate->xsave_hdr.xcomp_bv & X86_XSS_LBR )
+        {
+            struct xstate_lbr *lbr;
+
+            lbr = get_xstate_component_comp(xstate, bytes, X86_XSS_LBR);
+            generate_exception_if(!lbr, X86_EXC_GP, 0);
+            if ( xstate->xsave_hdr.xstate_bv & X86_XSS_LBR )
+            {
+                generate_exception_if(lbr->lbr_ctl & ~LBR_CTL_VALID,
+                                      X86_EXC_GP, 0);
+                generate_exception_if(lbr->lbr_depth == 0 ||
+                                      lbr->lbr_depth >
+                                       NUM_MSR_ARCH_LBR_FROM_TO ||
+                                      lbr->lbr_depth % 8 != 0,
+                                      X86_EXC_GP, 0);
+
+                if ( !mode_64bit() )
+                    x86_translate_lbr(s, ctxt, data, false, lbr);
+                ctxt->xsaves.lbr_ctl = lbr->lbr_ctl;
+                ctxt->xsaves.lbr_depth = lbr->lbr_depth;
+                lbr->lbr_ctl = 0;
+            }
+            else
+            {
+                ctxt->xsaves.lbr_ctl = 0;
+                /* Don't touch the previous LBR depth */
+            }
+        }
+
+        faulted = 0;
+        if ( s->rex_prefix & REX_W )
+            _xrstors("0x48,", xstate, ctxt->xsaves.rfbm & UINT32_MAX,
+                     ctxt->xsaves.rfbm >> 32, faulted);
+        else
+            _xrstors("", xstate, ctxt->xsaves.rfbm & UINT32_MAX,
+                     ctxt->xsaves.rfbm >> 32, faulted);
+        generate_exception_if(faulted, X86_EXC_GP, 0);
+
+        ctxt->xsaves.xstate_bv = xstate->xsave_hdr.xstate_bv;
+
+        break;
+    }
+
+    case blk_xsaves:
+    {
+        struct xsave_struct *xstate = ptr;
+        unsigned int faulted;
+
+        ASSERT(!data);
+
+        /* Defeat XSAVES modified optimization using XRSTORS with EDX=EAX=0 */
+        memset(xstate, 0, sizeof(*xstate));
+        xstate->xsave_hdr.xcomp_bv = XSTATE_COMPACTION_ENABLED;
+        faulted = 0;
+        _xrstors("", xstate, 0, 0, faulted);
+        generate_exception_if(faulted, X86_EXC_GP, 0);
+
+        faulted = 0;
+        if ( s->rex_prefix & REX_W )
+            _xsaves("0x48,", xstate, ctxt->xsaves.rfbm & UINT32_MAX,
+                    ctxt->xsaves.rfbm >> 32, faulted);
+        else
+            _xsaves("", xstate, ctxt->xsaves.rfbm & UINT32_MAX,
+                    ctxt->xsaves.rfbm >> 32, faulted);
+        generate_exception_if(faulted, X86_EXC_GP, 0);
+
+        if ( ctxt->xsaves.rfbm & xstate->xsave_hdr.xcomp_bv & X86_XSS_LBR )
+        {
+            struct xstate_lbr *lbr;
+
+            lbr = get_xstate_component_comp(xstate, bytes, X86_XSS_LBR);
+            generate_exception_if(!lbr, X86_EXC_GP, 0);
+            if ( !mode_64bit() && (xstate->xsave_hdr.xstate_bv & X86_XSS_LBR) )
+                x86_translate_lbr(s, ctxt, data, true, lbr);
+            lbr->lbr_ctl = ctxt->xsaves.lbr_ctl;
+            lbr->lbr_depth = ctxt->xsaves.lbr_depth;
+        }
+
+        break;
+    }
+#undef _xsaves
+#undef _xrstors
+
+#endif /* __XEN__ && X86EMUL_NO_FPU */
+
     default:
         ASSERT_UNREACHABLE();
         return X86EMUL_UNHANDLEABLE;
diff --git a/xen/arch/x86/x86_emulate/private.h b/xen/arch/x86/x86_emulate/private.h
index ef4745f56e..a48d647df7 100644
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -295,6 +295,10 @@ struct x86_emulate_state {
         blk_fxsave,
 #endif
         blk_movdir,
+#ifndef X86EMUL_NO_FPU
+        blk_xrstors,
+        blk_xsaves,
+#endif
     } blk;
     uint8_t modrm, modrm_mod, modrm_reg, modrm_rm;
     uint8_t sib_index, sib_scale;
@@ -537,6 +541,7 @@ amd_like(const struct x86_emulate_ctxt *ctxt)
 #define vcpu_has_avx()         (ctxt->cpuid->basic.avx)
 #define vcpu_has_f16c()        (ctxt->cpuid->basic.f16c)
 #define vcpu_has_rdrand()      (ctxt->cpuid->basic.rdrand)
+#define vcpu_has_lbr_lip()     (ctxt->cpuid->basic.lbr_1Ca.ip_contains_lip)
 
 #define vcpu_has_mmxext()      (ctxt->cpuid->extd.mmxext || vcpu_has_sse())
 #define vcpu_has_3dnow_ext()   (ctxt->cpuid->extd._3dnowext)
@@ -587,6 +592,7 @@ amd_like(const struct x86_emulate_ctxt *ctxt)
 #define vcpu_has_avx512_vp2intersect() (ctxt->cpuid->feat.avx512_vp2intersect)
 #define vcpu_has_serialize()   (ctxt->cpuid->feat.serialize)
 #define vcpu_has_tsxldtrk()    (ctxt->cpuid->feat.tsxldtrk)
+#define vcpu_has_arch_lbr()    (ctxt->cpuid->feat.arch_lbr)
 #define vcpu_has_avx512_fp16() (ctxt->cpuid->feat.avx512_fp16)
 #define vcpu_has_sha512()      (ctxt->cpuid->feat.sha512)
 #define vcpu_has_sm3()         (ctxt->cpuid->feat.sm3)
@@ -600,6 +606,8 @@ amd_like(const struct x86_emulate_ctxt *ctxt)
 #define vcpu_has_avx_ne_convert() (ctxt->cpuid->feat.avx_ne_convert)
 #define vcpu_has_avx_vnni_int16() (ctxt->cpuid->feat.avx_vnni_int16)
 
+#define vcpu_has_xsaves()       (ctxt->cpuid->xstate.xsaves)
+
 #define vcpu_must_have(feat) \
     generate_exception_if(!vcpu_has_##feat(), X86_EXC_UD)
 
diff --git a/xen/arch/x86/x86_emulate/util-xen.c b/xen/arch/x86/x86_emulate/util-xen.c
index 5e90818010..e5c34b5b42 100644
--- a/xen/arch/x86/x86_emulate/util-xen.c
+++ b/xen/arch/x86/x86_emulate/util-xen.c
@@ -96,6 +96,20 @@ bool cf_check x86_insn_is_cr_access(const struct x86_emulate_state *s,
     return false;
 }
 
+bool cf_check x86_insn_is_xsaves(const struct x86_emulate_state *s,
+                                 const struct x86_emulate_ctxt *ctxt)
+{
+    return ctxt->opcode == X86EMUL_OPC(0x0f, 0xc7) && s->ea.type == OP_MEM &&
+           (s->modrm_reg & 7) == 5;
+}
+
+bool cf_check x86_insn_is_xrstors(const struct x86_emulate_state *s,
+                                  const struct x86_emulate_ctxt *ctxt)
+{
+    return ctxt->opcode == X86EMUL_OPC(0x0f, 0xc7) && s->ea.type == OP_MEM &&
+           (s->modrm_reg & 7) == 3;
+}
+
 unsigned long x86_insn_immediate(const struct x86_emulate_state *s,
                                  unsigned int nr)
 {
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
index b89d440133..92c23006e5 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -8592,6 +8592,25 @@ int x86_emul_rmw(
 }
 #undef stub_exn
 
+uint64_t x86_get_lbr_cs_offset(const struct cpu_policy *cp,
+                               bool is_long_mode,
+                               const struct segment_register *cs,
+                               bool saving)
+{
+    bool host_lip, guest_lip;
+    
+    host_lip = current_cpu_has_lbr_lip;
+    guest_lip = !!cp->basic.lbr_1Ca.ip_contains_lip;
+
+    if ( host_lip == guest_lip || is_long_mode )
+        return 0;
+    else if ( (host_lip && !guest_lip && saving) ||
+              (!host_lip && guest_lip && !saving) )
+        return -cs->base;
+    else
+        return cs->base;
+}
+
 static void __init __maybe_unused build_assertions(void)
 {
     /* Check the values against SReg3 encoding in opcode/ModRM bytes. */
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.h b/xen/arch/x86/x86_emulate/x86_emulate.h
index d75658eba0..cc86ec3cee 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.h
+++ b/xen/arch/x86/x86_emulate/x86_emulate.h
@@ -534,6 +534,10 @@ struct x86_emulate_ops
     /* vmfunc: Emulate VMFUNC via given set of EAX ECX inputs */
     int (*vmfunc)(
         struct x86_emulate_ctxt *ctxt);
+
+    int (*set_lbr_depth)(
+        uint32_t depth,
+        struct x86_emulate_ctxt *ctxt);
 };
 
 struct cpu_user_regs;
@@ -572,6 +576,22 @@ struct x86_emulate_ctxt
     /* Long mode active? */
     bool lma;
 
+    struct {
+        /* In */
+        uint64_t rfbm;
+        unsigned int size;
+        /* Inout */
+        /*
+         * MSR_LBR_{CTL,DEPTH} don't match guest state, so we need to pass
+         * them to the emulator.
+         */
+        uint64_t lbr_ctl;
+        uint64_t lbr_depth;
+        /* Out */
+        /* XRSTORS */
+        uint64_t xstate_bv;
+    } xsaves;
+
     /*
      * Output-only state:
      */
@@ -763,6 +783,14 @@ bool cf_check
 x86_insn_is_cr_access(const struct x86_emulate_state *s,
                       const struct x86_emulate_ctxt *ctxt);
 
+bool cf_check
+x86_insn_is_xsaves(const struct x86_emulate_state *s,
+                   const struct x86_emulate_ctxt *ctxt);
+
+bool cf_check
+x86_insn_is_xrstors(const struct x86_emulate_state *s,
+                    const struct x86_emulate_ctxt *ctxt);
+
 #if !defined(__XEN__) || defined(NDEBUG)
 static inline void x86_emulate_free_state(struct x86_emulate_state *s) {}
 #else
@@ -802,6 +830,11 @@ x86_emul_blk(
     struct x86_emulate_state *s,
     struct x86_emulate_ctxt *ctxt);
 
+uint64_t x86_get_lbr_cs_offset(const struct cpu_policy *cp,
+                               bool is_long_mode,
+                               const struct segment_register *cs,
+                               bool reading);
+
 static inline void x86_emul_hw_exception(
     unsigned int vector, int error_code, struct x86_emulate_ctxt *ctxt)
 {
-- 
2.43.0



Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

