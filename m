Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 574DE28F73B
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 18:53:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7619.20142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT6VI-0007SI-Sb; Thu, 15 Oct 2020 16:53:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7619.20142; Thu, 15 Oct 2020 16:53:24 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT6VH-0007OG-PB; Thu, 15 Oct 2020 16:53:23 +0000
Received: by outflank-mailman (input) for mailman id 7619;
 Thu, 15 Oct 2020 16:53:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YEeM=DW=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kT6Ny-0004yr-6m
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:45:50 +0000
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 82abcbad-658a-46ea-bdc7-8244eb16a9ab;
 Thu, 15 Oct 2020 16:45:05 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id r127so4314370lff.12
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 09:45:05 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id v13sm1482495ljh.66.2020.10.15.09.45.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Oct 2020 09:45:03 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=YEeM=DW=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kT6Ny-0004yr-6m
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:45:50 +0000
X-Inumbo-ID: 82abcbad-658a-46ea-bdc7-8244eb16a9ab
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 82abcbad-658a-46ea-bdc7-8244eb16a9ab;
	Thu, 15 Oct 2020 16:45:05 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id r127so4314370lff.12
        for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 09:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=GIFa+EcRcUxKPr2Jpa1jfhOfy5HsLRU2xEhliboMdRU=;
        b=UB0MpQUyBFx0qhLWnadeL1UXzp33IaWRUriTv4CK4hiHV8QQsOhShN8Ry5bycZ1ocz
         jI21J4JlDvFJFXsLeNaZmAdZKDkTAvst9UHyKM+KpsM88AgFv72UYLYFZXJVSpOuIpwE
         mO7hMeygJpeQHd0gG0nPK1I2BNoC4s9H55wHOrLmT/iLpfWBvgQLKWDlM7YQWwnRwAuz
         ndxe5JxiZ3uxrlMBciaKrbKQXqf1dE5shLh/Hi3xpMsF9i1WkW5+aUUQz6sYbta+hor7
         LX3BpM/wrnxfFoXQisKl81neK5J8XQzerMW+yquGpT0YWmf98XhB3+7SIfLfDLZQQ220
         fIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=GIFa+EcRcUxKPr2Jpa1jfhOfy5HsLRU2xEhliboMdRU=;
        b=Vow/5GMxmh6oOrjDBsxYZVaPxivClyY2yNKxHzkunOxnorg09L7jBm8sEtYnL43t6L
         jolmCte2+gvw0STRH+eR4H+C4Iwz8Jwd9seVZ8N3odPM5k80joBKspbbDFIoqSPveRLS
         UiorDTGDIjGtD1HTUxeFwigR4SL3G/xg7CuR/HWmfe/jtDvCV0bkiyOhpK8NO2fEFk6n
         kHQCC9h7yNBJXYtTlfJ5x00yj8P5acX0UyEuxlNsJjCzQPlyJMWyevFcgG8dGbcsCtDo
         LhQc9nkUy8WHE05IIDIDi7FZzbEWAV0vuaO2qzlprixonWYLj7EB+p96V+pLzsq+g/iv
         c1KA==
X-Gm-Message-State: AOAM533bHk5b217HLIkkxVUIyDjbQAOiHFblf2Mnwz17R81aCkcDVnV2
	qI7EAHWIcWcIK/LbvbIqa9fXd5vQq6pMGQ==
X-Google-Smtp-Source: ABdhPJxuegf36jDJMZnb4uqeaF5mSemQuPEeLn4XCufxv1K20iqFeDNtPrA2vNZhJzFktUL0chy2hw==
X-Received: by 2002:ac2:4dad:: with SMTP id h13mr1457757lfe.351.1602780304203;
        Thu, 15 Oct 2020 09:45:04 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
        by smtp.gmail.com with ESMTPSA id v13sm1482495ljh.66.2020.10.15.09.45.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Oct 2020 09:45:03 -0700 (PDT)
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
Subject: [PATCH V2 11/23] xen/ioreq: Move x86's io_completion/io_req fields to struct vcpu
Date: Thu, 15 Oct 2020 19:44:22 +0300
Message-Id: <1602780274-29141-12-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

The IOREQ is a common feature now and these fields will be used
on Arm as is. Move them to common struct vcpu as a part of new
struct vcpu_io. Also move enum hvm_io_completion to xen/sched.h
and remove "hvm" prefixes.

This patch completely removes layering violation in the common code.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
CC: Julien Grall <julien.grall@arm.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

***
I was thinking that it may be better to place these two fields
into struct vcpu directly (without intermediate "io" struct).
I think, this way the code which operates with these fields
would become cleaner. Another possible option would be either
to rename "io" struct (I failed to think of a better name) or
to drop(replace?) duplicating "io" prefixes from these fields.
***

Changes V1 -> V2:
   - new patch
---
 xen/arch/x86/hvm/emulate.c        | 50 +++++++++++++++++++--------------------
 xen/arch/x86/hvm/hvm.c            |  2 +-
 xen/arch/x86/hvm/io.c             |  6 ++---
 xen/arch/x86/hvm/svm/nestedsvm.c  |  2 +-
 xen/arch/x86/hvm/vmx/realmode.c   |  6 ++---
 xen/common/ioreq.c                | 14 +++++------
 xen/include/asm-x86/hvm/emulate.h |  2 +-
 xen/include/asm-x86/hvm/ioreq.h   |  4 ++--
 xen/include/asm-x86/hvm/vcpu.h    | 11 ---------
 xen/include/xen/sched.h           | 17 +++++++++++++
 10 files changed, 60 insertions(+), 54 deletions(-)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index 4746d5a..f6a4eef 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -142,8 +142,8 @@ void hvmemul_cancel(struct vcpu *v)
 {
     struct hvm_vcpu_io *vio = &v->arch.hvm.hvm_io;
 
-    vio->io_req.state = STATE_IOREQ_NONE;
-    vio->io_completion = HVMIO_no_completion;
+    v->io.io_req.state = STATE_IOREQ_NONE;
+    v->io.io_completion = IO_no_completion;
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
@@ -1854,7 +1854,7 @@ static int hvmemul_rep_movs(
           * cheaper than multiple round trips through the device model. Yet
           * when processing a response we can always re-use the translation.
           */
-         (vio->io_req.state == STATE_IORESP_READY ||
+         (curr->io.io_req.state == STATE_IORESP_READY ||
           ((!df || *reps == 1) &&
            PAGE_SIZE - (saddr & ~PAGE_MASK) >= *reps * bytes_per_rep)) )
         sgpa = pfn_to_paddr(vio->mmio_gpfn) | (saddr & ~PAGE_MASK);
@@ -1870,7 +1870,7 @@ static int hvmemul_rep_movs(
     if ( vio->mmio_access.write_access &&
          (vio->mmio_gla == (daddr & PAGE_MASK)) &&
          /* See comment above. */
-         (vio->io_req.state == STATE_IORESP_READY ||
+         (curr->io.io_req.state == STATE_IORESP_READY ||
           ((!df || *reps == 1) &&
            PAGE_SIZE - (daddr & ~PAGE_MASK) >= *reps * bytes_per_rep)) )
         dgpa = pfn_to_paddr(vio->mmio_gpfn) | (daddr & ~PAGE_MASK);
@@ -2007,7 +2007,7 @@ static int hvmemul_rep_stos(
     if ( vio->mmio_access.write_access &&
          (vio->mmio_gla == (addr & PAGE_MASK)) &&
          /* See respective comment in MOVS processing. */
-         (vio->io_req.state == STATE_IORESP_READY ||
+         (curr->io.io_req.state == STATE_IORESP_READY ||
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
+        ASSERT(curr->io.io_req.state == STATE_IOREQ_NONE);
         vio->cache->num_ents = 0;
     }
     else
-        ASSERT(vio->io_req.state == STATE_IORESP_READY);
+        ASSERT(curr->io.io_req.state == STATE_IORESP_READY);
 
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
+    if ( !ioreq_needs_completion(&curr->io.io_req) )
+        completion = IO_no_completion;
+    else if ( completion == IO_no_completion )
+        completion = (curr->io.io_req.type != IOREQ_TYPE_PIO ||
+                      hvmemul_ctxt->is_mem_access) ? IO_mmio_completion
+                                                   : IO_pio_completion;
 
-    switch ( vio->io_completion = completion )
+    switch ( curr->io.io_completion = completion )
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
index 20376ce..341093b 100644
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
index b220d6b..36584de 100644
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
 
@@ -136,7 +136,7 @@ bool handle_pio(uint16_t port, unsigned int size, int dir)
     rc = hvmemul_do_pio_buffer(port, size, dir, &data);
 
     if ( ioreq_needs_completion(&vio->io_req) )
-        vio->io_completion = HVMIO_pio_completion;
+        vio->io_completion = IO_pio_completion;
 
     switch ( rc )
     {
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index fcfccf7..787d4a0 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -1266,7 +1266,7 @@ enum hvm_intblk nsvm_intr_blocked(struct vcpu *v)
          * Delay the injection because this would result in delivering
          * an interrupt *within* the execution of an instruction.
          */
-        if ( v->arch.hvm.hvm_io.io_req.state != STATE_IOREQ_NONE )
+        if ( v->io.io_req.state != STATE_IOREQ_NONE )
             return hvm_intblk_shadow;
 
         if ( !nv->nv_vmexit_pending && n2vmcb->exit_int_info.v )
diff --git a/xen/arch/x86/hvm/vmx/realmode.c b/xen/arch/x86/hvm/vmx/realmode.c
index 768f01e..f5832a0 100644
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
+        if ( curr->io.io_req.state != STATE_IOREQ_NONE || vio->mmio_retry )
             break;
 
         /* Stop emulating unless our segment state is not safe */
@@ -202,7 +202,7 @@ void vmx_realmode(struct cpu_user_regs *regs)
     }
 
     /* Need to emulate next time if we've started an IO operation */
-    if ( vio->io_req.state != STATE_IOREQ_NONE )
+    if ( curr->io.io_req.state != STATE_IOREQ_NONE )
         curr->arch.hvm.vmx.vmx_emulate = 1;
 
     if ( !curr->arch.hvm.vmx.vmx_emulate && !curr->arch.hvm.vmx.vmx_realmode )
diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index a07f1d7..57ddaaa 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -158,7 +158,7 @@ static bool hvm_wait_for_io(struct ioreq_vcpu *sv, ioreq_t *p)
         break;
     }
 
-    p = &sv->vcpu->arch.hvm.hvm_io.io_req;
+    p = &sv->vcpu->io.io_req;
     if ( ioreq_needs_completion(p) )
         p->data = data;
 
@@ -170,10 +170,10 @@ static bool hvm_wait_for_io(struct ioreq_vcpu *sv, ioreq_t *p)
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
@@ -192,17 +192,17 @@ bool handle_hvm_io_completion(struct vcpu *v)
     vcpu_end_shutdown_deferral(v);
 
     io_completion = vio->io_completion;
-    vio->io_completion = HVMIO_no_completion;
+    vio->io_completion = IO_no_completion;
 
     switch ( io_completion )
     {
-    case HVMIO_no_completion:
+    case IO_no_completion:
         break;
 
-    case HVMIO_mmio_completion:
+    case IO_mmio_completion:
         return ioreq_complete_mmio();
 
-    case HVMIO_pio_completion:
+    case IO_pio_completion:
         return handle_pio(vio->io_req.addr, vio->io_req.size,
                           vio->io_req.dir);
 
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
index 0fccac5..5ed977e 100644
--- a/xen/include/asm-x86/hvm/ioreq.h
+++ b/xen/include/asm-x86/hvm/ioreq.h
@@ -26,11 +26,11 @@
 
 #include <public/hvm/params.h>
 
-static inline bool arch_hvm_io_completion(enum hvm_io_completion io_completion)
+static inline bool arch_hvm_io_completion(enum io_completion io_completion)
 {
     switch ( io_completion )
     {
-    case HVMIO_realmode_completion:
+    case IO_realmode_completion:
     {
         struct hvm_emulate_ctxt ctxt;
 
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
index 78761cd..f9ce14c 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -143,6 +143,19 @@ void evtchn_destroy_final(struct domain *d); /* from complete_domain_destroy */
 
 struct waitqueue_vcpu;
 
+enum io_completion {
+    IO_no_completion,
+    IO_mmio_completion,
+    IO_pio_completion,
+    IO_realmode_completion
+};
+
+struct vcpu_io {
+    /* I/O request in flight to device model. */
+    enum io_completion   io_completion;
+    ioreq_t              io_req;
+};
+
 struct vcpu
 {
     int              vcpu_id;
@@ -254,6 +267,10 @@ struct vcpu
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


