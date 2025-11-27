Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBAFC8F5AC
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 16:53:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174076.1499065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOeIg-0004KY-AY; Thu, 27 Nov 2025 15:52:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174076.1499065; Thu, 27 Nov 2025 15:52:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOeIg-0004IA-5C; Thu, 27 Nov 2025 15:52:54 +0000
Received: by outflank-mailman (input) for mailman id 1174076;
 Thu, 27 Nov 2025 15:52:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+gQU=6D=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1vOeIf-0003dB-1d
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 15:52:53 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 21965254-cba9-11f0-9d18-b5c5bf9af7f9;
 Thu, 27 Nov 2025 16:52:52 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52CC7176C;
 Thu, 27 Nov 2025 07:52:44 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.89.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5CE9D3F73B;
 Thu, 27 Nov 2025 07:52:50 -0800 (PST)
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
X-Inumbo-ID: 21965254-cba9-11f0-9d18-b5c5bf9af7f9
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 02/10] xen/arm: ffa: per-VM FFA_VERSION negotiation state
Date: Thu, 27 Nov 2025 16:51:33 +0100
Message-ID: <5e66b2991340f010befcaa3a57d0f35ad18d4149.1764254975.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <cover.1764254975.git.bertrand.marquis@arm.com>
References: <cover.1764254975.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Track FF-A version negotiation per VM and enforce that no FF-A ABI
(other than FFA_VERSION) is processed before a guest has selected a
version.

Each ffa_ctx gains a dedicated guest_vers_lock, a negotiated version
(guest_vers) and a guest_vers_negotiated flag. guest_vers records the
version requested by the guest so the mediator can provide data
structures compatible with older minor versions. The value returned to
the guest by FFA_VERSION is always FFA_MY_VERSION, the implementation
version, as required by FF-A.

FFA_VERSION may be issued multiple times. Negotiation becomes final
only when a non-FFA_VERSION ABI is invoked, in accordance with the
FF-A requirement that the version cannot change once any other ABI has
been used. Before this point, non-FFA_VERSION ABIs are rejected if no
valid version has been provided.

Once negotiation completes, the context is added to the global FF-A
VM list (when VM-to-VM is enabled) and the version may not be modified
for the lifetime of the VM. All VM-to-VM paths and teardown logic are
updated to use the guest_vers_negotiated flag.

This prevents partially initialised contexts from using the mediator
and complies with the FF-A 1.2 FFA_VERSION semantics.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/tee/ffa.c         | 115 +++++++++++++++++++++++++--------
 xen/arch/arm/tee/ffa_msg.c     |   2 +-
 xen/arch/arm/tee/ffa_private.h |  21 ++++--
 3 files changed, 104 insertions(+), 34 deletions(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 2b4e24750d52..3309ca875ec4 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -158,40 +158,89 @@ static bool ffa_abi_supported(uint32_t id)
     return !ffa_simple_call(FFA_FEATURES, id, 0, 0, 0);
 }
 
-static void handle_version(struct cpu_user_regs *regs)
+static bool ffa_negotiate_version(struct cpu_user_regs *regs)
 {
     struct domain *d = current->domain;
     struct ffa_ctx *ctx = d->arch.tee;
-    uint32_t vers = get_user_reg(regs, 1);
-    uint32_t old_vers;
+    uint32_t fid = get_user_reg(regs, 0);
+    uint32_t in_vers = get_user_reg(regs, 1);
+    uint32_t out_vers = FFA_MY_VERSION;
 
-    /*
-     * Guest will use the version it requested if it is our major and minor
-     * lower or equals to ours. If the minor is greater, our version will be
-     * used.
-     * In any case return our version to the caller.
-     */
-    if ( FFA_VERSION_MAJOR(vers) == FFA_MY_VERSION_MAJOR )
-    {
-        spin_lock(&ctx->lock);
-        old_vers = ctx->guest_vers;
+    spin_lock(&ctx->guest_vers_lock);
 
-        if ( FFA_VERSION_MINOR(vers) > FFA_MY_VERSION_MINOR )
-            ctx->guest_vers = FFA_MY_VERSION;
-        else
-            ctx->guest_vers = vers;
-        spin_unlock(&ctx->lock);
+    /* Handle FFA_VERSION races from different vCPUs. */
+    if ( ctx->guest_vers_negotiated )
+        goto out_continue;
 
-        if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) && !old_vers )
+    if ( fid != FFA_VERSION )
+    {
+        if ( !ctx->guest_vers )
         {
-            /* One more VM with FF-A support available */
-            inc_ffa_vm_count();
-            write_lock(&ffa_ctx_list_rwlock);
-            list_add_tail(&ctx->ctx_list, &ffa_ctx_head);
-            write_unlock(&ffa_ctx_list_rwlock);
+            out_vers = 0;
+            goto out_handled;
         }
+
+        /*
+         * A successful FFA_VERSION call does not freeze negotiation. Guests
+         * are allowed to issue multiple FFA_VERSION attempts (e.g. probing
+         * several minor versions). Negotiation becomes final only when a
+         * non-VERSION ABI is invoked, as required by the FF-A specification.
+         */
+        if ( !ctx->guest_vers_negotiated )
+        {
+            ctx->guest_vers_negotiated = true;
+
+            if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
+            {
+                /* One more VM with FF-A support available */
+                inc_ffa_vm_count();
+                write_lock(&ffa_ctx_list_rwlock);
+                list_add_tail(&ctx->ctx_list, &ffa_ctx_head);
+                write_unlock(&ffa_ctx_list_rwlock);
+            }
+        }
+
+        goto out_continue;
+    }
+
+    /*
+     * guest_vers stores the version selected by the guest (lower minor may
+     * require reduced data structures). However, the value returned to the
+     * guest via FFA_VERSION is always FFA_MY_VERSION, the implementation
+     * version, as required by FF-A. The two values intentionally differ.
+     */
+
+    /*
+     * Return our highest implementation version on request different than our
+     * major and mark negotiated version as our implementation version.
+     */
+    if ( FFA_VERSION_MAJOR(in_vers) != FFA_MY_VERSION_MAJOR )
+    {
+        ctx->guest_vers = FFA_MY_VERSION;
+        goto out_handled;
     }
-    ffa_set_regs(regs, FFA_MY_VERSION, 0, 0, 0, 0, 0, 0, 0);
+
+    /*
+     * Use our minor version if a greater minor was requested or the requested
+     * minor if it is lower than ours was requested.
+     */
+    if ( FFA_VERSION_MINOR(in_vers) > FFA_MY_VERSION_MINOR )
+        ctx->guest_vers = FFA_MY_VERSION;
+    else
+        ctx->guest_vers = in_vers;
+
+out_handled:
+    spin_unlock(&ctx->guest_vers_lock);
+    if ( out_vers )
+        ffa_set_regs(regs, out_vers, 0, 0, 0, 0, 0, 0, 0);
+    else
+        ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
+    return true;
+
+out_continue:
+    spin_unlock(&ctx->guest_vers_lock);
+
+    return false;
 }
 
 static void handle_features(struct cpu_user_regs *regs)
@@ -274,10 +323,17 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
     if ( !ctx )
         return false;
 
+    /* A version must be negotiated first */
+    if ( !ctx->guest_vers_negotiated )
+    {
+        if ( ffa_negotiate_version(regs) )
+            return true;
+    }
+
     switch ( fid )
     {
     case FFA_VERSION:
-        handle_version(regs);
+        ffa_set_regs(regs, FFA_MY_VERSION, 0, 0, 0, 0, 0, 0, 0);
         return true;
     case FFA_ID_GET:
         ffa_set_regs_success(regs, ffa_get_vm_id(d), 0);
@@ -371,6 +427,11 @@ static int ffa_domain_init(struct domain *d)
     d->arch.tee = ctx;
     ctx->teardown_d = d;
     INIT_LIST_HEAD(&ctx->shm_list);
+    spin_lock_init(&ctx->lock);
+    spin_lock_init(&ctx->guest_vers_lock);
+    ctx->guest_vers = 0;
+    ctx->guest_vers_negotiated = false;
+    INIT_LIST_HEAD(&ctx->ctx_list);
 
     ctx->ffa_id = ffa_get_vm_id(d);
     ctx->num_vcpus = d->max_vcpus;
@@ -452,7 +513,7 @@ static int ffa_domain_teardown(struct domain *d)
     if ( !ctx )
         return 0;
 
-    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) && ctx->guest_vers )
+    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) && ctx->guest_vers_negotiated )
     {
         dec_ffa_vm_count();
         write_lock(&ffa_ctx_list_rwlock);
diff --git a/xen/arch/arm/tee/ffa_msg.c b/xen/arch/arm/tee/ffa_msg.c
index c20c5bec0f76..dec429cbf160 100644
--- a/xen/arch/arm/tee/ffa_msg.c
+++ b/xen/arch/arm/tee/ffa_msg.c
@@ -113,7 +113,7 @@ static int32_t ffa_msg_send2_vm(uint16_t dst_id, const void *src_buf,
     }
 
     dst_ctx = dst_d->arch.tee;
-    if ( !dst_ctx->guest_vers )
+    if ( !dst_ctx->guest_vers_negotiated )
     {
         ret = FFA_RET_INVALID_PARAMETERS;
         goto out_unlock;
diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_private.h
index d7e6b6f5ef45..88b85c7c453a 100644
--- a/xen/arch/arm/tee/ffa_private.h
+++ b/xen/arch/arm/tee/ffa_private.h
@@ -354,12 +354,6 @@ struct ffa_ctx {
      * Global data accessed with lock locked.
      */
     spinlock_t lock;
-    /*
-     * FF-A version negotiated by the guest, only modifications to
-     * this field are done with the lock held as this is expected to
-     * be done once at init by a guest.
-     */
-    uint32_t guest_vers;
     /* Number of 4kB pages in each of rx/rx_pg and tx/tx_pg */
     unsigned int page_count;
     /* Number of allocated shared memory object */
@@ -367,6 +361,21 @@ struct ffa_ctx {
     /* Used shared memory objects, struct ffa_shm_mem */
     struct list_head shm_list;
 
+    /*
+     * FF-A version handling
+     * guest_vers and guest_vers_negotiated are only written with
+     * guest_vers_lock held. Reads do not take the lock, but ordering is
+     * guaranteed because the writer updates guest_vers first and then
+     * guest_vers_negotiated while holding the lock, ensuring any reader
+     * that observes guest_vers_negotiated == true also sees the final
+     * guest_vers value.
+     * The ffa_ctx is added to the ctx_list only when a version
+     * has been negotiated and locked.
+     */
+    spinlock_t guest_vers_lock;
+    uint32_t guest_vers;
+    bool guest_vers_negotiated;
+
     /*
      * Rx buffer, accessed with rx_lock locked.
      * rx_is_free is used to serialize access.
-- 
2.51.2


