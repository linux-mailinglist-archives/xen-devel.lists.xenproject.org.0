Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C07742C8263
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 11:42:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.40899.73948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjgdV-0003BI-T3; Mon, 30 Nov 2020 10:42:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 40899.73948; Mon, 30 Nov 2020 10:42:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjgdV-00039z-L3; Mon, 30 Nov 2020 10:42:25 +0000
Received: by outflank-mailman (input) for mailman id 40899;
 Mon, 30 Nov 2020 10:42:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=avKr=FE=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kjgUJ-0000Uu-DQ
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 10:32:55 +0000
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8aebbba1-fb08-4028-bcdd-c48910c5b2f7;
 Mon, 30 Nov 2020 10:32:11 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id u18so20569916lfd.9
 for <xen-devel@lists.xenproject.org>; Mon, 30 Nov 2020 02:32:11 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id 136sm2399393lfb.62.2020.11.30.02.32.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Nov 2020 02:32:09 -0800 (PST)
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
X-Inumbo-ID: 8aebbba1-fb08-4028-bcdd-c48910c5b2f7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=eshuqDSj3zEarimOkB2aX4FZ33jnTSOjPB7bKmk+eE8=;
        b=MFZ8mhig+TzPLkg9FVgiE/SfHSeO8ODXrKXW4kqmOB95vTeL5UAS+2I4Vz0BOyj+AH
         0xlh0lCifbdqvZw7SXb/MT0lWzEFe1fqWnHRsRgeXzM7kCme5YX0YK9toxjS8GJd579Q
         6od0sZ8NkW7nG4nq4sMeJM6Oa52VyP/K7y21EQT/mNnD9+Kq6SPn9K4vZMPQ13GBEF0e
         RNxSRN8sRT7i8M92eMV1vxaFdkTgAj43vFDeFO1kw7wuCYilDr4nwDXkICzbN/fDrl3q
         dwjpRiAauK+qhcfnug/6z1qsLXpYtsNy5IG9vmSY5isVusL2oNm7a/WsxS1zmxHblFO1
         3vzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=eshuqDSj3zEarimOkB2aX4FZ33jnTSOjPB7bKmk+eE8=;
        b=ovZLJphYBIuRYMfKB7YFcuf15fwKs0tYwWFXOKSQJGU+P6Vr8fxNrBOyYlHNo7couS
         j6JBGJAj0AWFy6VnUPFd2Q6wYq9xbi/hwYf1tytA8HpA4crB2AUMT7Gxt+0aRqb+8WnU
         Ki8NAW+o2Dbg7k2WqpAlXWfAuvfCMUEmcyW2zpzQ19VHEP6kure+4EFgvijUwSNMFNPb
         2fhu7uBFkh/fa7i81L3kP7/f94XXVVawJx507OpMH4PXxCIx2WhLq8TrsgNzV0IOTyrg
         MskPalRj+ughu2CczWd4U4ohJIUJ8QsYGZ/VU6yF6lBU7ynxKwamYSDeobv1dnCWQiOL
         YD5Q==
X-Gm-Message-State: AOAM533tzSotW9Yvghm9vuRaGyXKksr9oaLCa3lwtEQqOz/LwgXQFUAY
	fuBUF9TKlQU8o+W95TMgykaBmZwnCKNe8Q==
X-Google-Smtp-Source: ABdhPJwjEuWwAuuzHD/sq1bzikOS6pgc5KOC+joPhA5v8wz4/g6AyMOkWFCmMDhURCb2oUyGFEzbsQ==
X-Received: by 2002:ac2:431a:: with SMTP id l26mr7157890lfh.196.1606732329822;
        Mon, 30 Nov 2020 02:32:09 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Julien Grall <julien.grall@arm.com>
Subject: [PATCH V3 11/23] xen/ioreq: Move x86's io_completion/io_req fields to struct vcpu
Date: Mon, 30 Nov 2020 12:31:26 +0200
Message-Id: <1606732298-22107-12-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

The IOREQ is a common feature now and these fields will be used
on Arm as is. Move them to common struct vcpu as a part of new
struct vcpu_io and drop duplicating "io" prefixes. Also move
enum hvm_io_completion to xen/sched.h and remove "hvm" prefixes.

This patch completely removes layering violation in the common code.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
CC: Julien Grall <julien.grall@arm.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Changes V1 -> V2:
   - new patch

Changes V2 -> V3:
   - update patch according the "legacy interface" is x86 specific
   - update patch description
   - drop the "io" prefixes from the field names
   - wrap IO_realmode_completion
---
---
 xen/arch/x86/hvm/emulate.c        | 72 +++++++++++++++++++--------------------
 xen/arch/x86/hvm/hvm.c            |  2 +-
 xen/arch/x86/hvm/io.c             |  8 ++---
 xen/arch/x86/hvm/ioreq.c          |  4 +--
 xen/arch/x86/hvm/svm/nestedsvm.c  |  2 +-
 xen/arch/x86/hvm/vmx/realmode.c   |  6 ++--
 xen/common/ioreq.c                | 22 ++++++------
 xen/include/asm-x86/hvm/emulate.h |  2 +-
 xen/include/asm-x86/hvm/ioreq.h   |  2 +-
 xen/include/asm-x86/hvm/vcpu.h    | 11 ------
 xen/include/xen/sched.h           | 19 +++++++++++
 11 files changed, 79 insertions(+), 71 deletions(-)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index 4746d5a..04e4994 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -142,8 +142,8 @@ void hvmemul_cancel(struct vcpu *v)
 {
     struct hvm_vcpu_io *vio = &v->arch.hvm.hvm_io;
 
-    vio->io_req.state = STATE_IOREQ_NONE;
-    vio->io_completion = HVMIO_no_completion;
+    v->io.req.state = STATE_IOREQ_NONE;
+    v->io.completion = IO_no_completion;
     vio->mmio_cache_count = 0;
     vio->mmio_insn_bytes = 0;
     vio->mmio_access = (struct npfec){};
@@ -159,7 +159,7 @@ static int hvmemul_do_io(
 {
     struct vcpu *curr = current;
     struct domain *currd = curr->domain;
-    struct hvm_vcpu_io *vio = &curr->arch.hvm.hvm_io;
+    struct vcpu_io *vio = &curr->io;
     ioreq_t p = {
         .type = is_mmio ? IOREQ_TYPE_COPY : IOREQ_TYPE_PIO,
         .addr = addr,
@@ -184,13 +184,13 @@ static int hvmemul_do_io(
         return X86EMUL_UNHANDLEABLE;
     }
 
-    switch ( vio->io_req.state )
+    switch ( vio->req.state )
     {
     case STATE_IOREQ_NONE:
         break;
     case STATE_IORESP_READY:
-        vio->io_req.state = STATE_IOREQ_NONE;
-        p = vio->io_req;
+        vio->req.state = STATE_IOREQ_NONE;
+        p = vio->req;
 
         /* Verify the emulation request has been correctly re-issued */
         if ( (p.type != (is_mmio ? IOREQ_TYPE_COPY : IOREQ_TYPE_PIO)) ||
@@ -238,7 +238,7 @@ static int hvmemul_do_io(
     }
     ASSERT(p.count);
 
-    vio->io_req = p;
+    vio->req = p;
 
     rc = hvm_io_intercept(&p);
 
@@ -247,12 +247,12 @@ static int hvmemul_do_io(
      * our callers and mirror this into latched state.
      */
     ASSERT(p.count <= *reps);
-    *reps = vio->io_req.count = p.count;
+    *reps = vio->req.count = p.count;
 
     switch ( rc )
     {
     case X86EMUL_OKAY:
-        vio->io_req.state = STATE_IOREQ_NONE;
+        vio->req.state = STATE_IOREQ_NONE;
         break;
     case X86EMUL_UNHANDLEABLE:
     {
@@ -305,7 +305,7 @@ static int hvmemul_do_io(
                 if ( s == NULL )
                 {
                     rc = X86EMUL_RETRY;
-                    vio->io_req.state = STATE_IOREQ_NONE;
+                    vio->req.state = STATE_IOREQ_NONE;
                     break;
                 }
 
@@ -316,7 +316,7 @@ static int hvmemul_do_io(
                 if ( dir == IOREQ_READ )
                 {
                     rc = hvm_process_io_intercept(&ioreq_server_handler, &p);
-                    vio->io_req.state = STATE_IOREQ_NONE;
+                    vio->req.state = STATE_IOREQ_NONE;
                     break;
                 }
             }
@@ -329,14 +329,14 @@ static int hvmemul_do_io(
         if ( !s )
         {
             rc = hvm_process_io_intercept(&null_handler, &p);
-            vio->io_req.state = STATE_IOREQ_NONE;
+            vio->req.state = STATE_IOREQ_NONE;
         }
         else
         {
             rc = hvm_send_ioreq(s, &p, 0);
             if ( rc != X86EMUL_RETRY || currd->is_shutting_down )
-                vio->io_req.state = STATE_IOREQ_NONE;
-            else if ( !ioreq_needs_completion(&vio->io_req) )
+                vio->req.state = STATE_IOREQ_NONE;
+            else if ( !ioreq_needs_completion(&vio->req) )
                 rc = X86EMUL_OKAY;
         }
         break;
@@ -1854,7 +1854,7 @@ static int hvmemul_rep_movs(
           * cheaper than multiple round trips through the device model. Yet
           * when processing a response we can always re-use the translation.
           */
-         (vio->io_req.state == STATE_IORESP_READY ||
+         (curr->io.req.state == STATE_IORESP_READY ||
           ((!df || *reps == 1) &&
            PAGE_SIZE - (saddr & ~PAGE_MASK) >= *reps * bytes_per_rep)) )
         sgpa = pfn_to_paddr(vio->mmio_gpfn) | (saddr & ~PAGE_MASK);
@@ -1870,7 +1870,7 @@ static int hvmemul_rep_movs(
     if ( vio->mmio_access.write_access &&
          (vio->mmio_gla == (daddr & PAGE_MASK)) &&
          /* See comment above. */
-         (vio->io_req.state == STATE_IORESP_READY ||
+         (curr->io.req.state == STATE_IORESP_READY ||
           ((!df || *reps == 1) &&
            PAGE_SIZE - (daddr & ~PAGE_MASK) >= *reps * bytes_per_rep)) )
         dgpa = pfn_to_paddr(vio->mmio_gpfn) | (daddr & ~PAGE_MASK);
@@ -2007,7 +2007,7 @@ static int hvmemul_rep_stos(
     if ( vio->mmio_access.write_access &&
          (vio->mmio_gla == (addr & PAGE_MASK)) &&
          /* See respective comment in MOVS processing. */
-         (vio->io_req.state == STATE_IORESP_READY ||
+         (curr->io.req.state == STATE_IORESP_READY ||
           ((!df || *reps == 1) &&
            PAGE_SIZE - (addr & ~PAGE_MASK) >= *reps * bytes_per_rep)) )
         gpa = pfn_to_paddr(vio->mmio_gpfn) | (addr & ~PAGE_MASK);
@@ -2613,13 +2613,13 @@ static const struct x86_emulate_ops hvm_emulate_ops_no_write = {
 };
 
 /*
- * Note that passing HVMIO_no_completion into this function serves as kind
+ * Note that passing IO_no_completion into this function serves as kind
  * of (but not fully) an "auto select completion" indicator.  When there's
  * no completion needed, the passed in value will be ignored in any case.
  */
 static int _hvm_emulate_one(struct hvm_emulate_ctxt *hvmemul_ctxt,
     const struct x86_emulate_ops *ops,
-    enum hvm_io_completion completion)
+    enum io_completion completion)
 {
     const struct cpu_user_regs *regs = hvmemul_ctxt->ctxt.regs;
     struct vcpu *curr = current;
@@ -2634,11 +2634,11 @@ static int _hvm_emulate_one(struct hvm_emulate_ctxt *hvmemul_ctxt,
      */
     if ( vio->cache->num_ents > vio->cache->max_ents )
     {
-        ASSERT(vio->io_req.state == STATE_IOREQ_NONE);
+        ASSERT(curr->io.req.state == STATE_IOREQ_NONE);
         vio->cache->num_ents = 0;
     }
     else
-        ASSERT(vio->io_req.state == STATE_IORESP_READY);
+        ASSERT(curr->io.req.state == STATE_IORESP_READY);
 
     hvm_emulate_init_per_insn(hvmemul_ctxt, vio->mmio_insn,
                               vio->mmio_insn_bytes);
@@ -2649,25 +2649,25 @@ static int _hvm_emulate_one(struct hvm_emulate_ctxt *hvmemul_ctxt,
     if ( rc == X86EMUL_OKAY && vio->mmio_retry )
         rc = X86EMUL_RETRY;
 
-    if ( !ioreq_needs_completion(&vio->io_req) )
-        completion = HVMIO_no_completion;
-    else if ( completion == HVMIO_no_completion )
-        completion = (vio->io_req.type != IOREQ_TYPE_PIO ||
-                      hvmemul_ctxt->is_mem_access) ? HVMIO_mmio_completion
-                                                   : HVMIO_pio_completion;
+    if ( !ioreq_needs_completion(&curr->io.req) )
+        completion = IO_no_completion;
+    else if ( completion == IO_no_completion )
+        completion = (curr->io.req.type != IOREQ_TYPE_PIO ||
+                      hvmemul_ctxt->is_mem_access) ? IO_mmio_completion
+                                                   : IO_pio_completion;
 
-    switch ( vio->io_completion = completion )
+    switch ( curr->io.completion = completion )
     {
-    case HVMIO_no_completion:
-    case HVMIO_pio_completion:
+    case IO_no_completion:
+    case IO_pio_completion:
         vio->mmio_cache_count = 0;
         vio->mmio_insn_bytes = 0;
         vio->mmio_access = (struct npfec){};
         hvmemul_cache_disable(curr);
         break;
 
-    case HVMIO_mmio_completion:
-    case HVMIO_realmode_completion:
+    case IO_mmio_completion:
+    case IO_realmode_completion:
         BUILD_BUG_ON(sizeof(vio->mmio_insn) < sizeof(hvmemul_ctxt->insn_buf));
         vio->mmio_insn_bytes = hvmemul_ctxt->insn_buf_bytes;
         memcpy(vio->mmio_insn, hvmemul_ctxt->insn_buf, vio->mmio_insn_bytes);
@@ -2716,7 +2716,7 @@ static int _hvm_emulate_one(struct hvm_emulate_ctxt *hvmemul_ctxt,
 
 int hvm_emulate_one(
     struct hvm_emulate_ctxt *hvmemul_ctxt,
-    enum hvm_io_completion completion)
+    enum io_completion completion)
 {
     return _hvm_emulate_one(hvmemul_ctxt, &hvm_emulate_ops, completion);
 }
@@ -2754,7 +2754,7 @@ int hvm_emulate_one_mmio(unsigned long mfn, unsigned long gla)
                           guest_cpu_user_regs());
     ctxt.ctxt.data = &mmio_ro_ctxt;
 
-    switch ( rc = _hvm_emulate_one(&ctxt, ops, HVMIO_no_completion) )
+    switch ( rc = _hvm_emulate_one(&ctxt, ops, IO_no_completion) )
     {
     case X86EMUL_UNHANDLEABLE:
     case X86EMUL_UNIMPLEMENTED:
@@ -2782,7 +2782,7 @@ void hvm_emulate_one_vm_event(enum emul_kind kind, unsigned int trapnr,
     {
     case EMUL_KIND_NOWRITE:
         rc = _hvm_emulate_one(&ctx, &hvm_emulate_ops_no_write,
-                              HVMIO_no_completion);
+                              IO_no_completion);
         break;
     case EMUL_KIND_SET_CONTEXT_INSN: {
         struct vcpu *curr = current;
@@ -2803,7 +2803,7 @@ void hvm_emulate_one_vm_event(enum emul_kind kind, unsigned int trapnr,
     /* Fall-through */
     default:
         ctx.set_context = (kind == EMUL_KIND_SET_CONTEXT_DATA);
-        rc = hvm_emulate_one(&ctx, HVMIO_no_completion);
+        rc = hvm_emulate_one(&ctx, IO_no_completion);
     }
 
     switch ( rc )
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 54e32e4..cc46909 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -3800,7 +3800,7 @@ void hvm_ud_intercept(struct cpu_user_regs *regs)
         return;
     }
 
-    switch ( hvm_emulate_one(&ctxt, HVMIO_no_completion) )
+    switch ( hvm_emulate_one(&ctxt, IO_no_completion) )
     {
     case X86EMUL_UNHANDLEABLE:
     case X86EMUL_UNIMPLEMENTED:
diff --git a/xen/arch/x86/hvm/io.c b/xen/arch/x86/hvm/io.c
index b220d6b..327a6a2 100644
--- a/xen/arch/x86/hvm/io.c
+++ b/xen/arch/x86/hvm/io.c
@@ -85,7 +85,7 @@ bool hvm_emulate_one_insn(hvm_emulate_validate_t *validate, const char *descr)
 
     hvm_emulate_init_once(&ctxt, validate, guest_cpu_user_regs());
 
-    switch ( rc = hvm_emulate_one(&ctxt, HVMIO_no_completion) )
+    switch ( rc = hvm_emulate_one(&ctxt, IO_no_completion) )
     {
     case X86EMUL_UNHANDLEABLE:
         hvm_dump_emulation_state(XENLOG_G_WARNING, descr, &ctxt, rc);
@@ -122,7 +122,7 @@ bool handle_mmio_with_translation(unsigned long gla, unsigned long gpfn,
 bool handle_pio(uint16_t port, unsigned int size, int dir)
 {
     struct vcpu *curr = current;
-    struct hvm_vcpu_io *vio = &curr->arch.hvm.hvm_io;
+    struct vcpu_io *vio = &curr->io;
     unsigned int data;
     int rc;
 
@@ -135,8 +135,8 @@ bool handle_pio(uint16_t port, unsigned int size, int dir)
 
     rc = hvmemul_do_pio_buffer(port, size, dir, &data);
 
-    if ( ioreq_needs_completion(&vio->io_req) )
-        vio->io_completion = HVMIO_pio_completion;
+    if ( ioreq_needs_completion(&vio->req) )
+        vio->completion = IO_pio_completion;
 
     switch ( rc )
     {
diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index 009a95a..7808b75 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -41,11 +41,11 @@ bool ioreq_complete_mmio(void)
     return handle_mmio();
 }
 
-bool arch_vcpu_ioreq_completion(enum hvm_io_completion io_completion)
+bool arch_vcpu_ioreq_completion(enum io_completion io_completion)
 {
     switch ( io_completion )
     {
-    case HVMIO_realmode_completion:
+    case IO_realmode_completion:
     {
         struct hvm_emulate_ctxt ctxt;
 
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index fcfccf7..6d90630 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -1266,7 +1266,7 @@ enum hvm_intblk nsvm_intr_blocked(struct vcpu *v)
          * Delay the injection because this would result in delivering
          * an interrupt *within* the execution of an instruction.
          */
-        if ( v->arch.hvm.hvm_io.io_req.state != STATE_IOREQ_NONE )
+        if ( v->io.req.state != STATE_IOREQ_NONE )
             return hvm_intblk_shadow;
 
         if ( !nv->nv_vmexit_pending && n2vmcb->exit_int_info.v )
diff --git a/xen/arch/x86/hvm/vmx/realmode.c b/xen/arch/x86/hvm/vmx/realmode.c
index 768f01e..3033143 100644
--- a/xen/arch/x86/hvm/vmx/realmode.c
+++ b/xen/arch/x86/hvm/vmx/realmode.c
@@ -101,7 +101,7 @@ void vmx_realmode_emulate_one(struct hvm_emulate_ctxt *hvmemul_ctxt)
 
     perfc_incr(realmode_emulations);
 
-    rc = hvm_emulate_one(hvmemul_ctxt, HVMIO_realmode_completion);
+    rc = hvm_emulate_one(hvmemul_ctxt, IO_realmode_completion);
 
     if ( rc == X86EMUL_UNHANDLEABLE )
     {
@@ -188,7 +188,7 @@ void vmx_realmode(struct cpu_user_regs *regs)
 
         vmx_realmode_emulate_one(&hvmemul_ctxt);
 
-        if ( vio->io_req.state != STATE_IOREQ_NONE || vio->mmio_retry )
+        if ( curr->io.req.state != STATE_IOREQ_NONE || vio->mmio_retry )
             break;
 
         /* Stop emulating unless our segment state is not safe */
@@ -202,7 +202,7 @@ void vmx_realmode(struct cpu_user_regs *regs)
     }
 
     /* Need to emulate next time if we've started an IO operation */
-    if ( vio->io_req.state != STATE_IOREQ_NONE )
+    if ( curr->io.req.state != STATE_IOREQ_NONE )
         curr->arch.hvm.vmx.vmx_emulate = 1;
 
     if ( !curr->arch.hvm.vmx.vmx_emulate && !curr->arch.hvm.vmx.vmx_realmode )
diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index b7c2d5a..caf4543 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -159,7 +159,7 @@ static bool hvm_wait_for_io(struct ioreq_vcpu *sv, ioreq_t *p)
         break;
     }
 
-    p = &sv->vcpu->arch.hvm.hvm_io.io_req;
+    p = &sv->vcpu->io.req;
     if ( ioreq_needs_completion(p) )
         p->data = data;
 
@@ -171,10 +171,10 @@ static bool hvm_wait_for_io(struct ioreq_vcpu *sv, ioreq_t *p)
 bool handle_hvm_io_completion(struct vcpu *v)
 {
     struct domain *d = v->domain;
-    struct hvm_vcpu_io *vio = &v->arch.hvm.hvm_io;
+    struct vcpu_io *vio = &v->io;
     struct ioreq_server *s;
     struct ioreq_vcpu *sv;
-    enum hvm_io_completion io_completion;
+    enum io_completion io_completion;
 
     if ( has_vpci(d) && vpci_process_pending(v) )
     {
@@ -186,26 +186,26 @@ bool handle_hvm_io_completion(struct vcpu *v)
     if ( sv && !hvm_wait_for_io(sv, get_ioreq(s, v)) )
         return false;
 
-    vio->io_req.state = ioreq_needs_completion(&vio->io_req) ?
+    vio->req.state = ioreq_needs_completion(&vio->req) ?
         STATE_IORESP_READY : STATE_IOREQ_NONE;
 
     msix_write_completion(v);
     vcpu_end_shutdown_deferral(v);
 
-    io_completion = vio->io_completion;
-    vio->io_completion = HVMIO_no_completion;
+    io_completion = vio->completion;
+    vio->completion = IO_no_completion;
 
     switch ( io_completion )
     {
-    case HVMIO_no_completion:
+    case IO_no_completion:
         break;
 
-    case HVMIO_mmio_completion:
+    case IO_mmio_completion:
         return ioreq_complete_mmio();
 
-    case HVMIO_pio_completion:
-        return handle_pio(vio->io_req.addr, vio->io_req.size,
-                          vio->io_req.dir);
+    case IO_pio_completion:
+        return handle_pio(vio->req.addr, vio->req.size,
+                          vio->req.dir);
 
     default:
         return arch_vcpu_ioreq_completion(io_completion);
diff --git a/xen/include/asm-x86/hvm/emulate.h b/xen/include/asm-x86/hvm/emulate.h
index 1620cc7..131cdf4 100644
--- a/xen/include/asm-x86/hvm/emulate.h
+++ b/xen/include/asm-x86/hvm/emulate.h
@@ -65,7 +65,7 @@ bool __nonnull(1, 2) hvm_emulate_one_insn(
     const char *descr);
 int hvm_emulate_one(
     struct hvm_emulate_ctxt *hvmemul_ctxt,
-    enum hvm_io_completion completion);
+    enum io_completion completion);
 void hvm_emulate_one_vm_event(enum emul_kind kind,
     unsigned int trapnr,
     unsigned int errcode);
diff --git a/xen/include/asm-x86/hvm/ioreq.h b/xen/include/asm-x86/hvm/ioreq.h
index 854dc77..ca3bf29 100644
--- a/xen/include/asm-x86/hvm/ioreq.h
+++ b/xen/include/asm-x86/hvm/ioreq.h
@@ -21,7 +21,7 @@
 
 #include <xen/ioreq.h>
 
-bool arch_vcpu_ioreq_completion(enum hvm_io_completion io_completion);
+bool arch_vcpu_ioreq_completion(enum io_completion io_completion);
 int arch_ioreq_server_map_pages(struct ioreq_server *s);
 void arch_ioreq_server_unmap_pages(struct ioreq_server *s);
 void arch_ioreq_server_enable(struct ioreq_server *s);
diff --git a/xen/include/asm-x86/hvm/vcpu.h b/xen/include/asm-x86/hvm/vcpu.h
index 6c1feda..8adf455 100644
--- a/xen/include/asm-x86/hvm/vcpu.h
+++ b/xen/include/asm-x86/hvm/vcpu.h
@@ -28,13 +28,6 @@
 #include <asm/mtrr.h>
 #include <public/hvm/ioreq.h>
 
-enum hvm_io_completion {
-    HVMIO_no_completion,
-    HVMIO_mmio_completion,
-    HVMIO_pio_completion,
-    HVMIO_realmode_completion
-};
-
 struct hvm_vcpu_asid {
     uint64_t generation;
     uint32_t asid;
@@ -52,10 +45,6 @@ struct hvm_mmio_cache {
 };
 
 struct hvm_vcpu_io {
-    /* I/O request in flight to device model. */
-    enum hvm_io_completion io_completion;
-    ioreq_t                io_req;
-
     /*
      * HVM emulation:
      *  Linear address @mmio_gla maps to MMIO physical frame @mmio_gpfn.
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 62cbcdb..8269f84 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -145,6 +145,21 @@ void evtchn_destroy_final(struct domain *d); /* from complete_domain_destroy */
 
 struct waitqueue_vcpu;
 
+enum io_completion {
+    IO_no_completion,
+    IO_mmio_completion,
+    IO_pio_completion,
+#ifdef CONFIG_X86
+    IO_realmode_completion,
+#endif
+};
+
+struct vcpu_io {
+    /* I/O request in flight to device model. */
+    enum io_completion   completion;
+    ioreq_t              req;
+};
+
 struct vcpu
 {
     int              vcpu_id;
@@ -256,6 +271,10 @@ struct vcpu
     struct vpci_vcpu vpci;
 
     struct arch_vcpu arch;
+
+#ifdef CONFIG_IOREQ_SERVER
+    struct vcpu_io io;
+#endif
 };
 
 struct sched_unit {
-- 
2.7.4


