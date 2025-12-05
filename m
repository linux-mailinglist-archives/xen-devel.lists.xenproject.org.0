Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 297DECA732E
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 11:38:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1178633.1502386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRTC4-000650-0H; Fri, 05 Dec 2025 10:37:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1178633.1502386; Fri, 05 Dec 2025 10:37:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRTC3-000638-TN; Fri, 05 Dec 2025 10:37:43 +0000
Received: by outflank-mailman (input) for mailman id 1178633;
 Fri, 05 Dec 2025 10:37:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d4nT=6L=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1vRTC2-0005j7-95
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 10:37:42 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 6d02f811-d1c6-11f0-9d1b-b5c5bf9af7f9;
 Fri, 05 Dec 2025 11:37:41 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5262A1063;
 Fri,  5 Dec 2025 02:37:33 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.45.211])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 92EAB3F86F;
 Fri,  5 Dec 2025 02:37:39 -0800 (PST)
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
X-Inumbo-ID: 6d02f811-d1c6-11f0-9d1b-b5c5bf9af7f9
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v1 02/12] xen/arm: ffa: per-VM FFA_VERSION negotiation state
Date: Fri,  5 Dec 2025 11:36:35 +0100
Message-ID: <d66e0935ad46953aa12a0830fc8a0a4947933fe3.1764930353.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <cover.1764930353.git.bertrand.marquis@arm.com>
References: <cover.1764930353.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Track FF-A version negotiation per VM and enforce that no FF-A ABI
(other than FFA_VERSION) is processed before a guest has selected a
version.

Each ffa_ctx gains a dedicated guest_vers_lock, a negotiated version
(guest_vers) and a guest_vers_tmp:
- guest_vers is the version negotiated or 0 if no version has been
  negotiated. This must be used with ACCESS_ONCE when reading it without
  the spinlock taken.
- guest_vers_tmp stores the version currently requested by a VM.

The version requested is the one actually negotiated once a call
different from FFA_VERSION is done to allow several attempts and as
requested by FF-A specification.
We always return our implementation version FFA_MY_VERSION, even if the
version requested was different, as requested by FF-A specification.

Any call other than FFA_VERSION is rejected until a version has been
requested.

Update all places in the code where guest_vers is used to use
ACCESS_ONCE.

This prevents partially initialised contexts from using the mediator
and complies with the FF-A 1.2 FFA_VERSION semantics.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in v1:
- remove the guest_vers_negotiated and use guest_vers = 0 as condition
  for a version being negotiated instead
- introduce guest_vers_tmp to store a requested version until it is
  becoming the one negotiated.
- remove not needed if negotiated condition.
- use ACCESS_ONCE when reading guest_vers and use guest_vers == 0 as
  condition for a version being negotiated.
- Update FF-A version handling comment in ffa_private.h
---
 xen/arch/arm/tee/ffa.c          | 101 +++++++++++++++++++++++++-------
 xen/arch/arm/tee/ffa_msg.c      |   2 +-
 xen/arch/arm/tee/ffa_partinfo.c |   4 +-
 xen/arch/arm/tee/ffa_private.h  |  26 ++++++--
 xen/arch/arm/tee/ffa_shm.c      |   3 +-
 5 files changed, 105 insertions(+), 31 deletions(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 2b4e24750d52..aadd6c21e7f2 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -158,31 +158,38 @@ static bool ffa_abi_supported(uint32_t id)
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
+    spin_lock(&ctx->guest_vers_lock);
+
+    /* If negotiation already published, continue without handling. */
+    if ( ACCESS_ONCE(ctx->guest_vers) )
+        goto out_continue;
+
+    if ( fid != FFA_VERSION )
     {
-        spin_lock(&ctx->lock);
-        old_vers = ctx->guest_vers;
+        if ( !ctx->guest_vers_tmp )
+        {
+            out_vers = 0;
+            goto out_handled;
+        }
 
-        if ( FFA_VERSION_MINOR(vers) > FFA_MY_VERSION_MINOR )
-            ctx->guest_vers = FFA_MY_VERSION;
-        else
-            ctx->guest_vers = vers;
-        spin_unlock(&ctx->lock);
+        /*
+         * A successful FFA_VERSION call does not freeze negotiation. Guests
+         * are allowed to issue multiple FFA_VERSION attempts (e.g. probing
+         * several minor versions). Negotiation becomes final only when a
+         * non-VERSION ABI is invoked, as required by the FF-A specification.
+         * Finalize negotiation: publish guest_vers once, then never change.
+         */
+        ACCESS_ONCE(ctx->guest_vers) = ctx->guest_vers_tmp;
 
-        if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) && !old_vers )
+        if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
         {
             /* One more VM with FF-A support available */
             inc_ffa_vm_count();
@@ -190,8 +197,48 @@ static void handle_version(struct cpu_user_regs *regs)
             list_add_tail(&ctx->ctx_list, &ffa_ctx_head);
             write_unlock(&ffa_ctx_list_rwlock);
         }
+
+        goto out_continue;
     }
-    ffa_set_regs(regs, FFA_MY_VERSION, 0, 0, 0, 0, 0, 0, 0);
+
+    /*
+     * guest_vers_tmp stores the version selected by the guest (lower minor may
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
+        ctx->guest_vers_tmp = FFA_MY_VERSION;
+        goto out_handled;
+    }
+
+    /*
+     * Use our minor version if a greater minor was requested or the requested
+     * minor if it is lower than ours was requested.
+     */
+    if ( FFA_VERSION_MINOR(in_vers) > FFA_MY_VERSION_MINOR )
+        ctx->guest_vers_tmp = FFA_MY_VERSION;
+    else
+        ctx->guest_vers_tmp = in_vers;
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
@@ -274,10 +321,17 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
     if ( !ctx )
         return false;
 
+    /* A version must be negotiated first */
+    if ( !ACCESS_ONCE(ctx->guest_vers) )
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
@@ -371,6 +425,11 @@ static int ffa_domain_init(struct domain *d)
     d->arch.tee = ctx;
     ctx->teardown_d = d;
     INIT_LIST_HEAD(&ctx->shm_list);
+    spin_lock_init(&ctx->lock);
+    spin_lock_init(&ctx->guest_vers_lock);
+    ctx->guest_vers = 0;
+    ctx->guest_vers_tmp = 0;
+    INIT_LIST_HEAD(&ctx->ctx_list);
 
     ctx->ffa_id = ffa_get_vm_id(d);
     ctx->num_vcpus = d->max_vcpus;
@@ -452,7 +511,7 @@ static int ffa_domain_teardown(struct domain *d)
     if ( !ctx )
         return 0;
 
-    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) && ctx->guest_vers )
+    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) && ACCESS_ONCE(ctx->guest_vers) )
     {
         dec_ffa_vm_count();
         write_lock(&ffa_ctx_list_rwlock);
diff --git a/xen/arch/arm/tee/ffa_msg.c b/xen/arch/arm/tee/ffa_msg.c
index c20c5bec0f76..2c2ebc9c5cd6 100644
--- a/xen/arch/arm/tee/ffa_msg.c
+++ b/xen/arch/arm/tee/ffa_msg.c
@@ -113,7 +113,7 @@ static int32_t ffa_msg_send2_vm(uint16_t dst_id, const void *src_buf,
     }
 
     dst_ctx = dst_d->arch.tee;
-    if ( !dst_ctx->guest_vers )
+    if ( !ACCESS_ONCE(dst_ctx->guest_vers) )
     {
         ret = FFA_RET_INVALID_PARAMETERS;
         goto out_unlock;
diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_partinfo.c
index fa56b1587e3b..ec5a53ed1cab 100644
--- a/xen/arch/arm/tee/ffa_partinfo.c
+++ b/xen/arch/arm/tee/ffa_partinfo.c
@@ -238,7 +238,7 @@ void ffa_handle_partition_info_get(struct cpu_user_regs *regs)
      * use the v1.0 structure size in the destination buffer.
      * Otherwise use the size of the highest version we support, here 1.1.
      */
-    if ( ctx->guest_vers == FFA_VERSION_1_0 )
+    if ( ACCESS_ONCE(ctx->guest_vers) == FFA_VERSION_1_0 )
         dst_size = sizeof(struct ffa_partition_info_1_0);
     else
         dst_size = sizeof(struct ffa_partition_info_1_1);
@@ -250,7 +250,7 @@ void ffa_handle_partition_info_get(struct cpu_user_regs *regs)
          * FF-A v1.0 has w5 MBZ while v1.1 allows
          * FFA_PARTITION_INFO_GET_COUNT_FLAG to be non-zero.
          */
-        if ( ctx->guest_vers == FFA_VERSION_1_0 ||
+        if ( ACCESS_ONCE(ctx->guest_vers) == FFA_VERSION_1_0 ||
                 flags != FFA_PARTITION_INFO_GET_COUNT_FLAG )
         {
             ret = FFA_RET_INVALID_PARAMETERS;
diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_private.h
index 8d01da0009d3..4e4ac7fd7bc4 100644
--- a/xen/arch/arm/tee/ffa_private.h
+++ b/xen/arch/arm/tee/ffa_private.h
@@ -355,12 +355,6 @@ struct ffa_ctx {
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
@@ -368,6 +362,26 @@ struct ffa_ctx {
     /* Used shared memory objects, struct ffa_shm_mem */
     struct list_head shm_list;
 
+    /*
+     * FF-A version handling
+     * guest_vers is the single published negotiated version. It is 0 until
+     * negotiation completes, after which it is set once and never changes.
+     * Negotiation uses guest_vers_tmp under guest_vers_lock; when a
+     * non-VERSION ABI is invoked, Xen finalizes negotiation by publishing
+     * guest_vers using ACCESS_ONCE() store.
+     * Readers use ACCESS_ONCE(guest_vers) != 0 to detect availability and
+     * can consume guest_vers without barriers because it never changes once
+     * published.
+     */
+    spinlock_t guest_vers_lock;
+    /*
+     * Published negotiated version. Zero means "not negotiated yet".
+     * Once non-zero, it never changes.
+     */
+    uint32_t guest_vers;
+    /* Temporary version used during negotiation under guest_vers_lock */
+    uint32_t guest_vers_tmp;
+
     /*
      * Rx buffer, accessed with rx_lock locked.
      * rx_is_free is used to serialize access.
diff --git a/xen/arch/arm/tee/ffa_shm.c b/xen/arch/arm/tee/ffa_shm.c
index d628c1b70609..dad3da192247 100644
--- a/xen/arch/arm/tee/ffa_shm.c
+++ b/xen/arch/arm/tee/ffa_shm.c
@@ -495,7 +495,8 @@ void ffa_handle_mem_share(struct cpu_user_regs *regs)
     if ( frag_len > ctx->page_count * FFA_PAGE_SIZE )
         goto out_unlock;
 
-    ret = read_mem_transaction(ctx->guest_vers, ctx->tx, frag_len, &trans);
+    ret = read_mem_transaction(ACCESS_ONCE(ctx->guest_vers), ctx->tx,
+                               frag_len, &trans);
     if ( ret )
         goto out_unlock;
 
-- 
2.51.2


