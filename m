Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B79253EA3
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 09:09:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBC22-0002gD-Jx; Thu, 27 Aug 2020 07:09:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o8NI=CF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kBC20-0002g8-W2
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 07:09:09 +0000
X-Inumbo-ID: 3162ebc3-032a-4c20-8199-04f3c7a9c5a4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3162ebc3-032a-4c20-8199-04f3c7a9c5a4;
 Thu, 27 Aug 2020 07:09:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 26A9EAFB2;
 Thu, 27 Aug 2020 07:09:38 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3] x86/HVM: more consistently set I/O completion
Message-ID: <96a4cc9b-b1fd-494c-9e99-6d3ca733dea9@suse.com>
Date: Thu, 27 Aug 2020 09:09:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Doing this just in hvm_emulate_one_insn() is not enough.
hvm_ud_intercept() and hvm_emulate_one_vm_event() can get invoked for
insns requiring one or more continuations, and at least in principle
hvm_emulate_one_mmio() could, too. Without proper setting of the field,
handle_hvm_io_completion() will do nothing completion-wise, and in
particular the missing re-invocation of the insn emulation paths will
lead to emulation caching not getting disabled in due course, causing
the ASSERT() in {svm,vmx}_vmenter_helper() to trigger.

Reported-by: Don Slutz <don.slutz@gmail.com>

Similar considerations go for the clearing of vio->mmio_access, which
gets moved as well.

Additionally all updating of vio->mmio_* now gets done dependent upon
the new completion value, rather than hvm_ioreq_needs_completion()'s
return value. This is because it is the completion chosen which controls
what path will be taken when handling the completion, not the simple
boolean return value. In particular, PIO completion doesn't involve
going through the insn emulator, and hence emulator state ought to get
cleared early (or it won't get cleared at all).

The new logic, besides allowing for a caller override for the
continuation type to be set (for VMX real mode emulation), will also
avoid setting an MMIO completion when a simpler PIO one will do. This
is a minor optimization only as a side effect - the behavior is strictly
needed at least for hvm_ud_intercept(), as only memory accesses can
successfully complete through handle_mmio(). Care of course needs to be
taken to correctly deal with "mixed" insns (doing both MMIO and PIO at
the same time, i.e. INS/OUTS). For this, hvmemul_validate() now latches
whether the insn being emulated is a memory access, as this information
is no longer easily available at the point where we want to consume it.

Note that the presence of non-NULL .validate fields in the two ops
structures in hvm_emulate_one_mmio() was really necessary even before
the changes here: Without this, passing non-NULL as middle argument to
hvm_emulate_init_once() is meaningless.

The restrictions on when the #UD intercept gets actually enabled are why
it was decided that this is not a security issue:
- the "hvm_fep" option to enable its use is a debugging option only,
- for the cross-vendor case is considered experimental, even if
  unfortunately SUPPORT.md doesn't have an explicit statement about
  this.
The other two affected functions are
- hvm_emulate_one_vm_event(), used for introspection,
- hvm_emulate_one_mmio(), used for Dom0 only,
which aren't qualifying this as needing an XSA either.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Tested-by: Don Slutz <don.slutz@gmail.com>
---
v3: Add comment ahead of _hvm_emulate_one(). Add parentheses in a
    conditional expr. Justify why this does not need an XSA.
v2: Make updating of vio->mmio_* fields fully driven by the new
    completion value.
---
I further think that the entire tail of _hvm_emulate_one() (everything
past the code changed/added there by this patch) wants skipping in case
a completion is needed, at the very least for the mmio and realmode
cases, where we know we'll come back here.

--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -1683,9 +1683,11 @@ static int hvmemul_validate(
     const struct x86_emulate_state *state,
     struct x86_emulate_ctxt *ctxt)
 {
-    const struct hvm_emulate_ctxt *hvmemul_ctxt =
+    struct hvm_emulate_ctxt *hvmemul_ctxt =
         container_of(ctxt, struct hvm_emulate_ctxt, ctxt);
 
+    hvmemul_ctxt->is_mem_access = x86_insn_is_mem_access(state, ctxt);
+
     return !hvmemul_ctxt->validate || hvmemul_ctxt->validate(state, ctxt)
            ? X86EMUL_OKAY : X86EMUL_UNHANDLEABLE;
 }
@@ -2610,8 +2612,13 @@ static const struct x86_emulate_ops hvm_
     .vmfunc        = hvmemul_vmfunc,
 };
 
+/*
+ * Note that passing HVMIO_no_completion into this function serves as kind
+ * of (but not fully) an "auto select completion" indicator.
+ */
 static int _hvm_emulate_one(struct hvm_emulate_ctxt *hvmemul_ctxt,
-    const struct x86_emulate_ops *ops)
+    const struct x86_emulate_ops *ops,
+    enum hvm_io_completion completion)
 {
     const struct cpu_user_regs *regs = hvmemul_ctxt->ctxt.regs;
     struct vcpu *curr = current;
@@ -2642,16 +2649,31 @@ static int _hvm_emulate_one(struct hvm_e
         rc = X86EMUL_RETRY;
 
     if ( !hvm_ioreq_needs_completion(&vio->io_req) )
+        completion = HVMIO_no_completion;
+    else if ( completion == HVMIO_no_completion )
+        completion = (vio->io_req.type != IOREQ_TYPE_PIO ||
+                      hvmemul_ctxt->is_mem_access) ? HVMIO_mmio_completion
+                                                   : HVMIO_pio_completion;
+
+    switch ( vio->io_completion = completion )
     {
+    case HVMIO_no_completion:
+    case HVMIO_pio_completion:
         vio->mmio_cache_count = 0;
         vio->mmio_insn_bytes = 0;
+        vio->mmio_access = (struct npfec){};
         hvmemul_cache_disable(curr);
-    }
-    else
-    {
+        break;
+
+    case HVMIO_mmio_completion:
+    case HVMIO_realmode_completion:
         BUILD_BUG_ON(sizeof(vio->mmio_insn) < sizeof(hvmemul_ctxt->insn_buf));
         vio->mmio_insn_bytes = hvmemul_ctxt->insn_buf_bytes;
         memcpy(vio->mmio_insn, hvmemul_ctxt->insn_buf, vio->mmio_insn_bytes);
+        break;
+
+    default:
+        ASSERT_UNREACHABLE();
     }
 
     if ( hvmemul_ctxt->ctxt.retire.singlestep )
@@ -2692,9 +2714,10 @@ static int _hvm_emulate_one(struct hvm_e
 }
 
 int hvm_emulate_one(
-    struct hvm_emulate_ctxt *hvmemul_ctxt)
+    struct hvm_emulate_ctxt *hvmemul_ctxt,
+    enum hvm_io_completion completion)
 {
-    return _hvm_emulate_one(hvmemul_ctxt, &hvm_emulate_ops);
+    return _hvm_emulate_one(hvmemul_ctxt, &hvm_emulate_ops, completion);
 }
 
 int hvm_emulate_one_mmio(unsigned long mfn, unsigned long gla)
@@ -2703,11 +2726,13 @@ int hvm_emulate_one_mmio(unsigned long m
         .read       = x86emul_unhandleable_rw,
         .insn_fetch = hvmemul_insn_fetch,
         .write      = mmcfg_intercept_write,
+        .validate   = hvmemul_validate,
     };
     static const struct x86_emulate_ops hvm_ro_emulate_ops_mmio = {
         .read       = x86emul_unhandleable_rw,
         .insn_fetch = hvmemul_insn_fetch,
         .write      = mmio_ro_emulated_write,
+        .validate   = hvmemul_validate,
     };
     struct mmio_ro_emulate_ctxt mmio_ro_ctxt = { .cr2 = gla };
     struct hvm_emulate_ctxt ctxt;
@@ -2727,8 +2752,8 @@ int hvm_emulate_one_mmio(unsigned long m
     hvm_emulate_init_once(&ctxt, x86_insn_is_mem_write,
                           guest_cpu_user_regs());
     ctxt.ctxt.data = &mmio_ro_ctxt;
-    rc = _hvm_emulate_one(&ctxt, ops);
-    switch ( rc )
+
+    switch ( rc = _hvm_emulate_one(&ctxt, ops, HVMIO_no_completion) )
     {
     case X86EMUL_UNHANDLEABLE:
     case X86EMUL_UNIMPLEMENTED:
@@ -2755,7 +2780,8 @@ void hvm_emulate_one_vm_event(enum emul_
     switch ( kind )
     {
     case EMUL_KIND_NOWRITE:
-        rc = _hvm_emulate_one(&ctx, &hvm_emulate_ops_no_write);
+        rc = _hvm_emulate_one(&ctx, &hvm_emulate_ops_no_write,
+                              HVMIO_no_completion);
         break;
     case EMUL_KIND_SET_CONTEXT_INSN: {
         struct vcpu *curr = current;
@@ -2776,7 +2802,7 @@ void hvm_emulate_one_vm_event(enum emul_
     /* Fall-through */
     default:
         ctx.set_context = (kind == EMUL_KIND_SET_CONTEXT_DATA);
-        rc = hvm_emulate_one(&ctx);
+        rc = hvm_emulate_one(&ctx, HVMIO_no_completion);
     }
 
     switch ( rc )
@@ -2874,6 +2900,8 @@ void hvm_emulate_init_per_insn(
                                         pfec, NULL) == HVMTRANS_okay) ?
             sizeof(hvmemul_ctxt->insn_buf) : 0;
     }
+
+    hvmemul_ctxt->is_mem_access = false;
 }
 
 void hvm_emulate_writeback(
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -3798,7 +3798,7 @@ void hvm_ud_intercept(struct cpu_user_re
         return;
     }
 
-    switch ( hvm_emulate_one(&ctxt) )
+    switch ( hvm_emulate_one(&ctxt, HVMIO_no_completion) )
     {
     case X86EMUL_UNHANDLEABLE:
     case X86EMUL_UNIMPLEMENTED:
--- a/xen/arch/x86/hvm/io.c
+++ b/xen/arch/x86/hvm/io.c
@@ -81,20 +81,11 @@ void send_invalidate_req(void)
 bool hvm_emulate_one_insn(hvm_emulate_validate_t *validate, const char *descr)
 {
     struct hvm_emulate_ctxt ctxt;
-    struct vcpu *curr = current;
-    struct hvm_vcpu_io *vio = &curr->arch.hvm.hvm_io;
     int rc;
 
     hvm_emulate_init_once(&ctxt, validate, guest_cpu_user_regs());
 
-    rc = hvm_emulate_one(&ctxt);
-
-    if ( hvm_ioreq_needs_completion(&vio->io_req) )
-        vio->io_completion = HVMIO_mmio_completion;
-    else
-        vio->mmio_access = (struct npfec){};
-
-    switch ( rc )
+    switch ( rc = hvm_emulate_one(&ctxt, HVMIO_no_completion) )
     {
     case X86EMUL_UNHANDLEABLE:
         hvm_dump_emulation_state(XENLOG_G_WARNING, descr, &ctxt, rc);
--- a/xen/arch/x86/hvm/vmx/realmode.c
+++ b/xen/arch/x86/hvm/vmx/realmode.c
@@ -97,15 +97,11 @@ static void realmode_deliver_exception(
 void vmx_realmode_emulate_one(struct hvm_emulate_ctxt *hvmemul_ctxt)
 {
     struct vcpu *curr = current;
-    struct hvm_vcpu_io *vio = &curr->arch.hvm.hvm_io;
     int rc;
 
     perfc_incr(realmode_emulations);
 
-    rc = hvm_emulate_one(hvmemul_ctxt);
-
-    if ( hvm_ioreq_needs_completion(&vio->io_req) )
-        vio->io_completion = HVMIO_realmode_completion;
+    rc = hvm_emulate_one(hvmemul_ctxt, HVMIO_realmode_completion);
 
     if ( rc == X86EMUL_UNHANDLEABLE )
     {
--- a/xen/include/asm-x86/hvm/emulate.h
+++ b/xen/include/asm-x86/hvm/emulate.h
@@ -48,6 +48,8 @@ struct hvm_emulate_ctxt {
 
     uint32_t intr_shadow;
 
+    bool is_mem_access;
+
     bool_t set_context;
 };
 
@@ -62,7 +64,8 @@ bool __nonnull(1, 2) hvm_emulate_one_ins
     hvm_emulate_validate_t *validate,
     const char *descr);
 int hvm_emulate_one(
-    struct hvm_emulate_ctxt *hvmemul_ctxt);
+    struct hvm_emulate_ctxt *hvmemul_ctxt,
+    enum hvm_io_completion completion);
 void hvm_emulate_one_vm_event(enum emul_kind kind,
     unsigned int trapnr,
     unsigned int errcode);

