Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF26302B61
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 20:20:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74355.133706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l47PA-0002Ki-Eo; Mon, 25 Jan 2021 19:20:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74355.133706; Mon, 25 Jan 2021 19:20:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l47P9-0002Hu-P8; Mon, 25 Jan 2021 19:20:03 +0000
Received: by outflank-mailman (input) for mailman id 74355;
 Mon, 25 Jan 2021 19:20:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DTVL=G4=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l47FL-0008N7-HR
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 19:09:55 +0000
Received: from mail-wr1-x42a.google.com (unknown [2a00:1450:4864:20::42a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a44a0f1-3cec-476d-9480-653689a238c9;
 Mon, 25 Jan 2021 19:09:04 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id c12so14120629wrc.7
 for <xen-devel@lists.xenproject.org>; Mon, 25 Jan 2021 11:09:04 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id k6sm12991031wro.27.2021.01.25.11.09.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Jan 2021 11:09:03 -0800 (PST)
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
X-Inumbo-ID: 5a44a0f1-3cec-476d-9480-653689a238c9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=WLZbCR4gkU6sLTn4NNkQ608UvyBwuWACZ5paSpJruFE=;
        b=rfGYH3GUoppFqAMP68cfP3W83RNpGUmiTOw+gvmcrMr8YOPIKWaNDMbXYCf6AgjopM
         +KuleFkNB0LHkKatiabCHd98TkxEOVqhN59H76gX6mPAD7HpDY4YR1aV8X1erEiMw3MC
         qQusvAoIx+QfFFHxpwrSKr7wzGNUugCXn36vH5Gi4Qo8oEsV87Gn5Wj/DUMQcm2Tt4Jl
         4AczD8h6qJet9rvEy4V0Fy4RS/NinbfJkI3UTbIp0mA1NP2Ejjt8LaVcqiSNGByjmbyu
         QDcLGKOubFemMF4FzWbJmEKp5sfBi6jnOcbN1onYLtZIcqRL3isNTh1nfgVVko2FUH3R
         V0yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=WLZbCR4gkU6sLTn4NNkQ608UvyBwuWACZ5paSpJruFE=;
        b=ervnsG+SJbh+PBfIG3tikinLXRBmTcwFQ3MusYdnidnLiw9BsHNuXKcyo1g7EbNMg4
         MXxNUpvCSeSAfhRiF74ExSUeKErLvf3eLwiwCMC/0Yvx0ocgXnUX/pTGbsL0/Dme/55D
         XrqGqLwdWZp/b0gwHmRyf2JelXXWdPKJSZowTqr8xR8Du+blROr643YdPLf5llUerUbF
         +rg3RIjQhJWkLuL4TEcW9O8bftlPwSi2D1ZL2ym3aVPcODLQXOP4qi2CCzPXzW3Q5doK
         /fXLCSHXQF54q3btqheurJD0QGMIy+IzuLup1Z7ieJnrmpnGM48oqSphNvakFy8LRllm
         Oulw==
X-Gm-Message-State: AOAM531zsgJB5yzYT1N1ys/yu4b2UXNPQTKPhCWWB7ejZiVA0fFrtNQR
	QKZQcjWUh2fMzG5LNdULOWZW+lBNdPcFRQ==
X-Google-Smtp-Source: ABdhPJyOXKtUXpygg+Tv1S8trRlGXIhMh8yf/dp7Zhmbl7Xtx9KZXGRlJz5gUffRBeaMKU4ri/QXWw==
X-Received: by 2002:a5d:5304:: with SMTP id e4mr2530906wrv.167.1611601743586;
        Mon, 25 Jan 2021 11:09:03 -0800 (PST)
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
Subject: [PATCH V5 10/22] xen/ioreq: Move x86's io_completion/io_req fields to struct vcpu
Date: Mon, 25 Jan 2021 21:08:17 +0200
Message-Id: <1611601709-28361-11-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

The IOREQ is a common feature now and these fields will be used
on Arm as is. Move them to common struct vcpu as a part of new
struct vcpu_io and drop duplicating "io" prefixes. Also move
enum hvm_io_completion to xen/sched.h and remove "hvm" prefixes.

This patch completely removes layering violation in the common code.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Paul Durrant <paul@xen.org>
Acked-by: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien.grall@arm.com>
[On Arm only]
Tested-by: Wei Chen <Wei.Chen@arm.com>

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

Changes V3 -> V4:
   - rename all hvm_vcpu_io locals to "hvio"
   - rename according to the new renaming scheme IO_ -> VIO_ (io_ -> vio_)
   - drop "io" prefix from io_completion locals

Changes V4 -> V5:
   - add Julien's and Paul's R-b, Jan's A-b
---
---
 xen/arch/x86/hvm/emulate.c        | 210 +++++++++++++++++++-------------------
 xen/arch/x86/hvm/hvm.c            |   2 +-
 xen/arch/x86/hvm/io.c             |  32 +++---
 xen/arch/x86/hvm/ioreq.c          |   6 +-
 xen/arch/x86/hvm/svm/nestedsvm.c  |   2 +-
 xen/arch/x86/hvm/vmx/realmode.c   |   8 +-
 xen/common/ioreq.c                |  26 ++---
 xen/include/asm-x86/hvm/emulate.h |   2 +-
 xen/include/asm-x86/hvm/vcpu.h    |  11 --
 xen/include/xen/ioreq.h           |   2 +-
 xen/include/xen/sched.h           |  19 ++++
 11 files changed, 164 insertions(+), 156 deletions(-)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index 4d62199..21051ce 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -140,15 +140,15 @@ static const struct hvm_io_handler ioreq_server_handler = {
  */
 void hvmemul_cancel(struct vcpu *v)
 {
-    struct hvm_vcpu_io *vio = &v->arch.hvm.hvm_io;
+    struct hvm_vcpu_io *hvio = &v->arch.hvm.hvm_io;
 
-    vio->io_req.state = STATE_IOREQ_NONE;
-    vio->io_completion = HVMIO_no_completion;
-    vio->mmio_cache_count = 0;
-    vio->mmio_insn_bytes = 0;
-    vio->mmio_access = (struct npfec){};
-    vio->mmio_retry = false;
-    vio->g2m_ioport = NULL;
+    v->io.req.state = STATE_IOREQ_NONE;
+    v->io.completion = VIO_no_completion;
+    hvio->mmio_cache_count = 0;
+    hvio->mmio_insn_bytes = 0;
+    hvio->mmio_access = (struct npfec){};
+    hvio->mmio_retry = false;
+    hvio->g2m_ioport = NULL;
 
     hvmemul_cache_disable(v);
 }
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
@@ -1005,14 +1005,14 @@ static int hvmemul_phys_mmio_access(
  * cache indexed by linear MMIO address.
  */
 static struct hvm_mmio_cache *hvmemul_find_mmio_cache(
-    struct hvm_vcpu_io *vio, unsigned long gla, uint8_t dir, bool create)
+    struct hvm_vcpu_io *hvio, unsigned long gla, uint8_t dir, bool create)
 {
     unsigned int i;
     struct hvm_mmio_cache *cache;
 
-    for ( i = 0; i < vio->mmio_cache_count; i ++ )
+    for ( i = 0; i < hvio->mmio_cache_count; i ++ )
     {
-        cache = &vio->mmio_cache[i];
+        cache = &hvio->mmio_cache[i];
 
         if ( gla == cache->gla &&
              dir == cache->dir )
@@ -1022,13 +1022,13 @@ static struct hvm_mmio_cache *hvmemul_find_mmio_cache(
     if ( !create )
         return NULL;
 
-    i = vio->mmio_cache_count;
-    if( i == ARRAY_SIZE(vio->mmio_cache) )
+    i = hvio->mmio_cache_count;
+    if( i == ARRAY_SIZE(hvio->mmio_cache) )
         return NULL;
 
-    ++vio->mmio_cache_count;
+    ++hvio->mmio_cache_count;
 
-    cache = &vio->mmio_cache[i];
+    cache = &hvio->mmio_cache[i];
     memset(cache, 0, sizeof (*cache));
 
     cache->gla = gla;
@@ -1037,26 +1037,26 @@ static struct hvm_mmio_cache *hvmemul_find_mmio_cache(
     return cache;
 }
 
-static void latch_linear_to_phys(struct hvm_vcpu_io *vio, unsigned long gla,
+static void latch_linear_to_phys(struct hvm_vcpu_io *hvio, unsigned long gla,
                                  unsigned long gpa, bool_t write)
 {
-    if ( vio->mmio_access.gla_valid )
+    if ( hvio->mmio_access.gla_valid )
         return;
 
-    vio->mmio_gla = gla & PAGE_MASK;
-    vio->mmio_gpfn = PFN_DOWN(gpa);
-    vio->mmio_access = (struct npfec){ .gla_valid = 1,
-                                       .read_access = 1,
-                                       .write_access = write };
+    hvio->mmio_gla = gla & PAGE_MASK;
+    hvio->mmio_gpfn = PFN_DOWN(gpa);
+    hvio->mmio_access = (struct npfec){ .gla_valid = 1,
+                                        .read_access = 1,
+                                        .write_access = write };
 }
 
 static int hvmemul_linear_mmio_access(
     unsigned long gla, unsigned int size, uint8_t dir, void *buffer,
     uint32_t pfec, struct hvm_emulate_ctxt *hvmemul_ctxt, bool_t known_gpfn)
 {
-    struct hvm_vcpu_io *vio = &current->arch.hvm.hvm_io;
+    struct hvm_vcpu_io *hvio = &current->arch.hvm.hvm_io;
     unsigned long offset = gla & ~PAGE_MASK;
-    struct hvm_mmio_cache *cache = hvmemul_find_mmio_cache(vio, gla, dir, true);
+    struct hvm_mmio_cache *cache = hvmemul_find_mmio_cache(hvio, gla, dir, true);
     unsigned int chunk, buffer_offset = 0;
     paddr_t gpa;
     unsigned long one_rep = 1;
@@ -1068,7 +1068,7 @@ static int hvmemul_linear_mmio_access(
     chunk = min_t(unsigned int, size, PAGE_SIZE - offset);
 
     if ( known_gpfn )
-        gpa = pfn_to_paddr(vio->mmio_gpfn) | offset;
+        gpa = pfn_to_paddr(hvio->mmio_gpfn) | offset;
     else
     {
         rc = hvmemul_linear_to_phys(gla, &gpa, chunk, &one_rep, pfec,
@@ -1076,7 +1076,7 @@ static int hvmemul_linear_mmio_access(
         if ( rc != X86EMUL_OKAY )
             return rc;
 
-        latch_linear_to_phys(vio, gla, gpa, dir == IOREQ_WRITE);
+        latch_linear_to_phys(hvio, gla, gpa, dir == IOREQ_WRITE);
     }
 
     for ( ;; )
@@ -1122,22 +1122,22 @@ static inline int hvmemul_linear_mmio_write(
 
 static bool known_gla(unsigned long addr, unsigned int bytes, uint32_t pfec)
 {
-    const struct hvm_vcpu_io *vio = &current->arch.hvm.hvm_io;
+    const struct hvm_vcpu_io *hvio = &current->arch.hvm.hvm_io;
 
     if ( pfec & PFEC_write_access )
     {
-        if ( !vio->mmio_access.write_access )
+        if ( !hvio->mmio_access.write_access )
             return false;
     }
     else if ( pfec & PFEC_insn_fetch )
     {
-        if ( !vio->mmio_access.insn_fetch )
+        if ( !hvio->mmio_access.insn_fetch )
             return false;
     }
-    else if ( !vio->mmio_access.read_access )
+    else if ( !hvio->mmio_access.read_access )
             return false;
 
-    return (vio->mmio_gla == (addr & PAGE_MASK) &&
+    return (hvio->mmio_gla == (addr & PAGE_MASK) &&
             (addr & ~PAGE_MASK) + bytes <= PAGE_SIZE);
 }
 
@@ -1145,7 +1145,7 @@ static int linear_read(unsigned long addr, unsigned int bytes, void *p_data,
                        uint32_t pfec, struct hvm_emulate_ctxt *hvmemul_ctxt)
 {
     pagefault_info_t pfinfo;
-    struct hvm_vcpu_io *vio = &current->arch.hvm.hvm_io;
+    struct hvm_vcpu_io *hvio = &current->arch.hvm.hvm_io;
     unsigned int offset = addr & ~PAGE_MASK;
     int rc = HVMTRANS_bad_gfn_to_mfn;
 
@@ -1167,7 +1167,7 @@ static int linear_read(unsigned long addr, unsigned int bytes, void *p_data,
      * we handle this access in the same way to guarantee completion and hence
      * clean up any interim state.
      */
-    if ( !hvmemul_find_mmio_cache(vio, addr, IOREQ_READ, false) )
+    if ( !hvmemul_find_mmio_cache(hvio, addr, IOREQ_READ, false) )
         rc = hvm_copy_from_guest_linear(p_data, addr, bytes, pfec, &pfinfo);
 
     switch ( rc )
@@ -1200,7 +1200,7 @@ static int linear_write(unsigned long addr, unsigned int bytes, void *p_data,
                         uint32_t pfec, struct hvm_emulate_ctxt *hvmemul_ctxt)
 {
     pagefault_info_t pfinfo;
-    struct hvm_vcpu_io *vio = &current->arch.hvm.hvm_io;
+    struct hvm_vcpu_io *hvio = &current->arch.hvm.hvm_io;
     unsigned int offset = addr & ~PAGE_MASK;
     int rc = HVMTRANS_bad_gfn_to_mfn;
 
@@ -1222,7 +1222,7 @@ static int linear_write(unsigned long addr, unsigned int bytes, void *p_data,
      * we handle this access in the same way to guarantee completion and hence
      * clean up any interim state.
      */
-    if ( !hvmemul_find_mmio_cache(vio, addr, IOREQ_WRITE, false) )
+    if ( !hvmemul_find_mmio_cache(hvio, addr, IOREQ_WRITE, false) )
         rc = hvm_copy_to_guest_linear(addr, p_data, bytes, pfec, &pfinfo);
 
     switch ( rc )
@@ -1599,7 +1599,7 @@ static int hvmemul_cmpxchg(
     struct vcpu *curr = current;
     unsigned long addr;
     uint32_t pfec = PFEC_page_present | PFEC_write_access;
-    struct hvm_vcpu_io *vio = &curr->arch.hvm.hvm_io;
+    struct hvm_vcpu_io *hvio = &curr->arch.hvm.hvm_io;
     int rc;
     void *mapping = NULL;
 
@@ -1625,8 +1625,8 @@ static int hvmemul_cmpxchg(
         /* Fix this in case the guest is really relying on r-m-w atomicity. */
         return hvmemul_linear_mmio_write(addr, bytes, p_new, pfec,
                                          hvmemul_ctxt,
-                                         vio->mmio_access.write_access &&
-                                         vio->mmio_gla == (addr & PAGE_MASK));
+                                         hvio->mmio_access.write_access &&
+                                         hvio->mmio_gla == (addr & PAGE_MASK));
     }
 
     switch ( bytes )
@@ -1823,7 +1823,7 @@ static int hvmemul_rep_movs(
     struct hvm_emulate_ctxt *hvmemul_ctxt =
         container_of(ctxt, struct hvm_emulate_ctxt, ctxt);
     struct vcpu *curr = current;
-    struct hvm_vcpu_io *vio = &curr->arch.hvm.hvm_io;
+    struct hvm_vcpu_io *hvio = &curr->arch.hvm.hvm_io;
     unsigned long saddr, daddr, bytes;
     paddr_t sgpa, dgpa;
     uint32_t pfec = PFEC_page_present;
@@ -1846,18 +1846,18 @@ static int hvmemul_rep_movs(
     if ( hvmemul_ctxt->seg_reg[x86_seg_ss].dpl == 3 )
         pfec |= PFEC_user_mode;
 
-    if ( vio->mmio_access.read_access &&
-         (vio->mmio_gla == (saddr & PAGE_MASK)) &&
+    if ( hvio->mmio_access.read_access &&
+         (hvio->mmio_gla == (saddr & PAGE_MASK)) &&
          /*
           * Upon initial invocation don't truncate large batches just because
           * of a hit for the translation: Doing the guest page table walk is
           * cheaper than multiple round trips through the device model. Yet
           * when processing a response we can always re-use the translation.
           */
-         (vio->io_req.state == STATE_IORESP_READY ||
+         (curr->io.req.state == STATE_IORESP_READY ||
           ((!df || *reps == 1) &&
            PAGE_SIZE - (saddr & ~PAGE_MASK) >= *reps * bytes_per_rep)) )
-        sgpa = pfn_to_paddr(vio->mmio_gpfn) | (saddr & ~PAGE_MASK);
+        sgpa = pfn_to_paddr(hvio->mmio_gpfn) | (saddr & ~PAGE_MASK);
     else
     {
         rc = hvmemul_linear_to_phys(saddr, &sgpa, bytes_per_rep, reps, pfec,
@@ -1867,13 +1867,13 @@ static int hvmemul_rep_movs(
     }
 
     bytes = PAGE_SIZE - (daddr & ~PAGE_MASK);
-    if ( vio->mmio_access.write_access &&
-         (vio->mmio_gla == (daddr & PAGE_MASK)) &&
+    if ( hvio->mmio_access.write_access &&
+         (hvio->mmio_gla == (daddr & PAGE_MASK)) &&
          /* See comment above. */
-         (vio->io_req.state == STATE_IORESP_READY ||
+         (curr->io.req.state == STATE_IORESP_READY ||
           ((!df || *reps == 1) &&
            PAGE_SIZE - (daddr & ~PAGE_MASK) >= *reps * bytes_per_rep)) )
-        dgpa = pfn_to_paddr(vio->mmio_gpfn) | (daddr & ~PAGE_MASK);
+        dgpa = pfn_to_paddr(hvio->mmio_gpfn) | (daddr & ~PAGE_MASK);
     else
     {
         rc = hvmemul_linear_to_phys(daddr, &dgpa, bytes_per_rep, reps,
@@ -1892,14 +1892,14 @@ static int hvmemul_rep_movs(
 
     if ( sp2mt == p2m_mmio_dm )
     {
-        latch_linear_to_phys(vio, saddr, sgpa, 0);
+        latch_linear_to_phys(hvio, saddr, sgpa, 0);
         return hvmemul_do_mmio_addr(
             sgpa, reps, bytes_per_rep, IOREQ_READ, df, dgpa);
     }
 
     if ( dp2mt == p2m_mmio_dm )
     {
-        latch_linear_to_phys(vio, daddr, dgpa, 1);
+        latch_linear_to_phys(hvio, daddr, dgpa, 1);
         return hvmemul_do_mmio_addr(
             dgpa, reps, bytes_per_rep, IOREQ_WRITE, df, sgpa);
     }
@@ -1992,7 +1992,7 @@ static int hvmemul_rep_stos(
     struct hvm_emulate_ctxt *hvmemul_ctxt =
         container_of(ctxt, struct hvm_emulate_ctxt, ctxt);
     struct vcpu *curr = current;
-    struct hvm_vcpu_io *vio = &curr->arch.hvm.hvm_io;
+    struct hvm_vcpu_io *hvio = &curr->arch.hvm.hvm_io;
     unsigned long addr, bytes;
     paddr_t gpa;
     p2m_type_t p2mt;
@@ -2004,13 +2004,13 @@ static int hvmemul_rep_stos(
         return rc;
 
     bytes = PAGE_SIZE - (addr & ~PAGE_MASK);
-    if ( vio->mmio_access.write_access &&
-         (vio->mmio_gla == (addr & PAGE_MASK)) &&
+    if ( hvio->mmio_access.write_access &&
+         (hvio->mmio_gla == (addr & PAGE_MASK)) &&
          /* See respective comment in MOVS processing. */
-         (vio->io_req.state == STATE_IORESP_READY ||
+         (curr->io.req.state == STATE_IORESP_READY ||
           ((!df || *reps == 1) &&
            PAGE_SIZE - (addr & ~PAGE_MASK) >= *reps * bytes_per_rep)) )
-        gpa = pfn_to_paddr(vio->mmio_gpfn) | (addr & ~PAGE_MASK);
+        gpa = pfn_to_paddr(hvio->mmio_gpfn) | (addr & ~PAGE_MASK);
     else
     {
         uint32_t pfec = PFEC_page_present | PFEC_write_access;
@@ -2103,7 +2103,7 @@ static int hvmemul_rep_stos(
         return X86EMUL_UNHANDLEABLE;
 
     case p2m_mmio_dm:
-        latch_linear_to_phys(vio, addr, gpa, 1);
+        latch_linear_to_phys(hvio, addr, gpa, 1);
         return hvmemul_do_mmio_buffer(gpa, reps, bytes_per_rep, IOREQ_WRITE, df,
                                       p_data);
     }
@@ -2613,18 +2613,18 @@ static const struct x86_emulate_ops hvm_emulate_ops_no_write = {
 };
 
 /*
- * Note that passing HVMIO_no_completion into this function serves as kind
+ * Note that passing VIO_no_completion into this function serves as kind
  * of (but not fully) an "auto select completion" indicator.  When there's
  * no completion needed, the passed in value will be ignored in any case.
  */
 static int _hvm_emulate_one(struct hvm_emulate_ctxt *hvmemul_ctxt,
     const struct x86_emulate_ops *ops,
-    enum hvm_io_completion completion)
+    enum vio_completion completion)
 {
     const struct cpu_user_regs *regs = hvmemul_ctxt->ctxt.regs;
     struct vcpu *curr = current;
     uint32_t new_intr_shadow;
-    struct hvm_vcpu_io *vio = &curr->arch.hvm.hvm_io;
+    struct hvm_vcpu_io *hvio = &curr->arch.hvm.hvm_io;
     int rc;
 
     /*
@@ -2632,45 +2632,45 @@ static int _hvm_emulate_one(struct hvm_emulate_ctxt *hvmemul_ctxt,
      * untouched if it's already enabled, for re-execution to consume
      * entries populated by an earlier pass.
      */
-    if ( vio->cache->num_ents > vio->cache->max_ents )
+    if ( hvio->cache->num_ents > hvio->cache->max_ents )
     {
-        ASSERT(vio->io_req.state == STATE_IOREQ_NONE);
-        vio->cache->num_ents = 0;
+        ASSERT(curr->io.req.state == STATE_IOREQ_NONE);
+        hvio->cache->num_ents = 0;
     }
     else
-        ASSERT(vio->io_req.state == STATE_IORESP_READY);
+        ASSERT(curr->io.req.state == STATE_IORESP_READY);
 
-    hvm_emulate_init_per_insn(hvmemul_ctxt, vio->mmio_insn,
-                              vio->mmio_insn_bytes);
+    hvm_emulate_init_per_insn(hvmemul_ctxt, hvio->mmio_insn,
+                              hvio->mmio_insn_bytes);
 
-    vio->mmio_retry = 0;
+    hvio->mmio_retry = 0;
 
     rc = x86_emulate(&hvmemul_ctxt->ctxt, ops);
-    if ( rc == X86EMUL_OKAY && vio->mmio_retry )
+    if ( rc == X86EMUL_OKAY && hvio->mmio_retry )
         rc = X86EMUL_RETRY;
 
-    if ( !ioreq_needs_completion(&vio->io_req) )
-        completion = HVMIO_no_completion;
-    else if ( completion == HVMIO_no_completion )
-        completion = (vio->io_req.type != IOREQ_TYPE_PIO ||
-                      hvmemul_ctxt->is_mem_access) ? HVMIO_mmio_completion
-                                                   : HVMIO_pio_completion;
+    if ( !ioreq_needs_completion(&curr->io.req) )
+        completion = VIO_no_completion;
+    else if ( completion == VIO_no_completion )
+        completion = (curr->io.req.type != IOREQ_TYPE_PIO ||
+                      hvmemul_ctxt->is_mem_access) ? VIO_mmio_completion
+                                                   : VIO_pio_completion;
 
-    switch ( vio->io_completion = completion )
+    switch ( curr->io.completion = completion )
     {
-    case HVMIO_no_completion:
-    case HVMIO_pio_completion:
-        vio->mmio_cache_count = 0;
-        vio->mmio_insn_bytes = 0;
-        vio->mmio_access = (struct npfec){};
+    case VIO_no_completion:
+    case VIO_pio_completion:
+        hvio->mmio_cache_count = 0;
+        hvio->mmio_insn_bytes = 0;
+        hvio->mmio_access = (struct npfec){};
         hvmemul_cache_disable(curr);
         break;
 
-    case HVMIO_mmio_completion:
-    case HVMIO_realmode_completion:
-        BUILD_BUG_ON(sizeof(vio->mmio_insn) < sizeof(hvmemul_ctxt->insn_buf));
-        vio->mmio_insn_bytes = hvmemul_ctxt->insn_buf_bytes;
-        memcpy(vio->mmio_insn, hvmemul_ctxt->insn_buf, vio->mmio_insn_bytes);
+    case VIO_mmio_completion:
+    case VIO_realmode_completion:
+        BUILD_BUG_ON(sizeof(hvio->mmio_insn) < sizeof(hvmemul_ctxt->insn_buf));
+        hvio->mmio_insn_bytes = hvmemul_ctxt->insn_buf_bytes;
+        memcpy(hvio->mmio_insn, hvmemul_ctxt->insn_buf, hvio->mmio_insn_bytes);
         break;
 
     default:
@@ -2716,7 +2716,7 @@ static int _hvm_emulate_one(struct hvm_emulate_ctxt *hvmemul_ctxt,
 
 int hvm_emulate_one(
     struct hvm_emulate_ctxt *hvmemul_ctxt,
-    enum hvm_io_completion completion)
+    enum vio_completion completion)
 {
     return _hvm_emulate_one(hvmemul_ctxt, &hvm_emulate_ops, completion);
 }
@@ -2754,7 +2754,7 @@ int hvm_emulate_one_mmio(unsigned long mfn, unsigned long gla)
                           guest_cpu_user_regs());
     ctxt.ctxt.data = &mmio_ro_ctxt;
 
-    switch ( rc = _hvm_emulate_one(&ctxt, ops, HVMIO_no_completion) )
+    switch ( rc = _hvm_emulate_one(&ctxt, ops, VIO_no_completion) )
     {
     case X86EMUL_UNHANDLEABLE:
     case X86EMUL_UNIMPLEMENTED:
@@ -2782,28 +2782,28 @@ void hvm_emulate_one_vm_event(enum emul_kind kind, unsigned int trapnr,
     {
     case EMUL_KIND_NOWRITE:
         rc = _hvm_emulate_one(&ctx, &hvm_emulate_ops_no_write,
-                              HVMIO_no_completion);
+                              VIO_no_completion);
         break;
     case EMUL_KIND_SET_CONTEXT_INSN: {
         struct vcpu *curr = current;
-        struct hvm_vcpu_io *vio = &curr->arch.hvm.hvm_io;
+        struct hvm_vcpu_io *hvio = &curr->arch.hvm.hvm_io;
 
-        BUILD_BUG_ON(sizeof(vio->mmio_insn) !=
+        BUILD_BUG_ON(sizeof(hvio->mmio_insn) !=
                      sizeof(curr->arch.vm_event->emul.insn.data));
-        ASSERT(!vio->mmio_insn_bytes);
+        ASSERT(!hvio->mmio_insn_bytes);
 
         /*
          * Stash insn buffer into mmio buffer here instead of ctx
          * to avoid having to add more logic to hvm_emulate_one.
          */
-        vio->mmio_insn_bytes = sizeof(vio->mmio_insn);
-        memcpy(vio->mmio_insn, curr->arch.vm_event->emul.insn.data,
-               vio->mmio_insn_bytes);
+        hvio->mmio_insn_bytes = sizeof(hvio->mmio_insn);
+        memcpy(hvio->mmio_insn, curr->arch.vm_event->emul.insn.data,
+               hvio->mmio_insn_bytes);
     }
     /* Fall-through */
     default:
         ctx.set_context = (kind == EMUL_KIND_SET_CONTEXT_DATA);
-        rc = hvm_emulate_one(&ctx, HVMIO_no_completion);
+        rc = hvm_emulate_one(&ctx, VIO_no_completion);
     }
 
     switch ( rc )
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index bc96947..4ed929c 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -3800,7 +3800,7 @@ void hvm_ud_intercept(struct cpu_user_regs *regs)
         return;
     }
 
-    switch ( hvm_emulate_one(&ctxt, HVMIO_no_completion) )
+    switch ( hvm_emulate_one(&ctxt, VIO_no_completion) )
     {
     case X86EMUL_UNHANDLEABLE:
     case X86EMUL_UNIMPLEMENTED:
diff --git a/xen/arch/x86/hvm/io.c b/xen/arch/x86/hvm/io.c
index ef8286b..dd733e1 100644
--- a/xen/arch/x86/hvm/io.c
+++ b/xen/arch/x86/hvm/io.c
@@ -85,7 +85,7 @@ bool hvm_emulate_one_insn(hvm_emulate_validate_t *validate, const char *descr)
 
     hvm_emulate_init_once(&ctxt, validate, guest_cpu_user_regs());
 
-    switch ( rc = hvm_emulate_one(&ctxt, HVMIO_no_completion) )
+    switch ( rc = hvm_emulate_one(&ctxt, VIO_no_completion) )
     {
     case X86EMUL_UNHANDLEABLE:
         hvm_dump_emulation_state(XENLOG_G_WARNING, descr, &ctxt, rc);
@@ -109,20 +109,20 @@ bool hvm_emulate_one_insn(hvm_emulate_validate_t *validate, const char *descr)
 bool handle_mmio_with_translation(unsigned long gla, unsigned long gpfn,
                                   struct npfec access)
 {
-    struct hvm_vcpu_io *vio = &current->arch.hvm.hvm_io;
+    struct hvm_vcpu_io *hvio = &current->arch.hvm.hvm_io;
 
-    vio->mmio_access = access.gla_valid &&
-                       access.kind == npfec_kind_with_gla
-                       ? access : (struct npfec){};
-    vio->mmio_gla = gla & PAGE_MASK;
-    vio->mmio_gpfn = gpfn;
+    hvio->mmio_access = access.gla_valid &&
+                        access.kind == npfec_kind_with_gla
+                        ? access : (struct npfec){};
+    hvio->mmio_gla = gla & PAGE_MASK;
+    hvio->mmio_gpfn = gpfn;
     return handle_mmio();
 }
 
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
+        vio->completion = VIO_pio_completion;
 
     switch ( rc )
     {
@@ -175,7 +175,7 @@ static bool_t g2m_portio_accept(const struct hvm_io_handler *handler,
 {
     struct vcpu *curr = current;
     const struct hvm_domain *hvm = &curr->domain->arch.hvm;
-    struct hvm_vcpu_io *vio = &curr->arch.hvm.hvm_io;
+    struct hvm_vcpu_io *hvio = &curr->arch.hvm.hvm_io;
     struct g2m_ioport *g2m_ioport;
     unsigned int start, end;
 
@@ -185,7 +185,7 @@ static bool_t g2m_portio_accept(const struct hvm_io_handler *handler,
         end = start + g2m_ioport->np;
         if ( (p->addr >= start) && (p->addr + p->size <= end) )
         {
-            vio->g2m_ioport = g2m_ioport;
+            hvio->g2m_ioport = g2m_ioport;
             return 1;
         }
     }
@@ -196,8 +196,8 @@ static bool_t g2m_portio_accept(const struct hvm_io_handler *handler,
 static int g2m_portio_read(const struct hvm_io_handler *handler,
                            uint64_t addr, uint32_t size, uint64_t *data)
 {
-    struct hvm_vcpu_io *vio = &current->arch.hvm.hvm_io;
-    const struct g2m_ioport *g2m_ioport = vio->g2m_ioport;
+    struct hvm_vcpu_io *hvio = &current->arch.hvm.hvm_io;
+    const struct g2m_ioport *g2m_ioport = hvio->g2m_ioport;
     unsigned int mport = (addr - g2m_ioport->gport) + g2m_ioport->mport;
 
     switch ( size )
@@ -221,8 +221,8 @@ static int g2m_portio_read(const struct hvm_io_handler *handler,
 static int g2m_portio_write(const struct hvm_io_handler *handler,
                             uint64_t addr, uint32_t size, uint64_t data)
 {
-    struct hvm_vcpu_io *vio = &current->arch.hvm.hvm_io;
-    const struct g2m_ioport *g2m_ioport = vio->g2m_ioport;
+    struct hvm_vcpu_io *hvio = &current->arch.hvm.hvm_io;
+    const struct g2m_ioport *g2m_ioport = hvio->g2m_ioport;
     unsigned int mport = (addr - g2m_ioport->gport) + g2m_ioport->mport;
 
     switch ( size )
diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index 0cadf34..62a4b33 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -40,11 +40,11 @@ bool arch_ioreq_complete_mmio(void)
     return handle_mmio();
 }
 
-bool arch_vcpu_ioreq_completion(enum hvm_io_completion io_completion)
+bool arch_vcpu_ioreq_completion(enum vio_completion completion)
 {
-    switch ( io_completion )
+    switch ( completion )
     {
-    case HVMIO_realmode_completion:
+    case VIO_realmode_completion:
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
index 768f01e..cc23afa 100644
--- a/xen/arch/x86/hvm/vmx/realmode.c
+++ b/xen/arch/x86/hvm/vmx/realmode.c
@@ -101,7 +101,7 @@ void vmx_realmode_emulate_one(struct hvm_emulate_ctxt *hvmemul_ctxt)
 
     perfc_incr(realmode_emulations);
 
-    rc = hvm_emulate_one(hvmemul_ctxt, HVMIO_realmode_completion);
+    rc = hvm_emulate_one(hvmemul_ctxt, VIO_realmode_completion);
 
     if ( rc == X86EMUL_UNHANDLEABLE )
     {
@@ -153,7 +153,7 @@ void vmx_realmode(struct cpu_user_regs *regs)
     struct vcpu *curr = current;
     struct hvm_emulate_ctxt hvmemul_ctxt;
     struct segment_register *sreg;
-    struct hvm_vcpu_io *vio = &curr->arch.hvm.hvm_io;
+    struct hvm_vcpu_io *hvio = &curr->arch.hvm.hvm_io;
     unsigned long intr_info;
     unsigned int emulations = 0;
 
@@ -188,7 +188,7 @@ void vmx_realmode(struct cpu_user_regs *regs)
 
         vmx_realmode_emulate_one(&hvmemul_ctxt);
 
-        if ( vio->io_req.state != STATE_IOREQ_NONE || vio->mmio_retry )
+        if ( curr->io.req.state != STATE_IOREQ_NONE || hvio->mmio_retry )
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
index 84bce36..ce3ef59 100644
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
+    enum vio_completion completion;
 
     if ( has_vpci(d) && vpci_process_pending(v) )
     {
@@ -186,29 +186,29 @@ bool handle_hvm_io_completion(struct vcpu *v)
     if ( sv && !hvm_wait_for_io(sv, get_ioreq(s, v)) )
         return false;
 
-    vio->io_req.state = ioreq_needs_completion(&vio->io_req) ?
+    vio->req.state = ioreq_needs_completion(&vio->req) ?
         STATE_IORESP_READY : STATE_IOREQ_NONE;
 
     msix_write_completion(v);
     vcpu_end_shutdown_deferral(v);
 
-    io_completion = vio->io_completion;
-    vio->io_completion = HVMIO_no_completion;
+    completion = vio->completion;
+    vio->completion = VIO_no_completion;
 
-    switch ( io_completion )
+    switch ( completion )
     {
-    case HVMIO_no_completion:
+    case VIO_no_completion:
         break;
 
-    case HVMIO_mmio_completion:
+    case VIO_mmio_completion:
         return arch_ioreq_complete_mmio();
 
-    case HVMIO_pio_completion:
-        return handle_pio(vio->io_req.addr, vio->io_req.size,
-                          vio->io_req.dir);
+    case VIO_pio_completion:
+        return handle_pio(vio->req.addr, vio->req.size,
+                          vio->req.dir);
 
     default:
-        return arch_vcpu_ioreq_completion(io_completion);
+        return arch_vcpu_ioreq_completion(completion);
     }
 
     return true;
diff --git a/xen/include/asm-x86/hvm/emulate.h b/xen/include/asm-x86/hvm/emulate.h
index 1620cc7..610078b 100644
--- a/xen/include/asm-x86/hvm/emulate.h
+++ b/xen/include/asm-x86/hvm/emulate.h
@@ -65,7 +65,7 @@ bool __nonnull(1, 2) hvm_emulate_one_insn(
     const char *descr);
 int hvm_emulate_one(
     struct hvm_emulate_ctxt *hvmemul_ctxt,
-    enum hvm_io_completion completion);
+    enum vio_completion completion);
 void hvm_emulate_one_vm_event(enum emul_kind kind,
     unsigned int trapnr,
     unsigned int errcode);
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
diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
index 60e864d..eace1d3 100644
--- a/xen/include/xen/ioreq.h
+++ b/xen/include/xen/ioreq.h
@@ -107,7 +107,7 @@ void hvm_ioreq_init(struct domain *d);
 int ioreq_server_dm_op(struct xen_dm_op *op, struct domain *d, bool *const_op);
 
 bool arch_ioreq_complete_mmio(void);
-bool arch_vcpu_ioreq_completion(enum hvm_io_completion io_completion);
+bool arch_vcpu_ioreq_completion(enum vio_completion completion);
 int arch_ioreq_server_map_pages(struct ioreq_server *s);
 void arch_ioreq_server_unmap_pages(struct ioreq_server *s);
 void arch_ioreq_server_enable(struct ioreq_server *s);
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index f437ee3..59e5b6a 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -147,6 +147,21 @@ void evtchn_destroy_final(struct domain *d); /* from complete_domain_destroy */
 
 struct waitqueue_vcpu;
 
+enum vio_completion {
+    VIO_no_completion,
+    VIO_mmio_completion,
+    VIO_pio_completion,
+#ifdef CONFIG_X86
+    VIO_realmode_completion,
+#endif
+};
+
+struct vcpu_io {
+    /* I/O request in flight to device model. */
+    enum vio_completion  completion;
+    ioreq_t              req;
+};
+
 struct vcpu
 {
     int              vcpu_id;
@@ -258,6 +273,10 @@ struct vcpu
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


