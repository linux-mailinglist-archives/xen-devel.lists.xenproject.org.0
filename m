Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D40849EBC
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 16:49:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676342.1052492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX1Dr-00044u-Dk; Mon, 05 Feb 2024 15:49:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676342.1052492; Mon, 05 Feb 2024 15:49:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX1Dr-00043D-AQ; Mon, 05 Feb 2024 15:49:27 +0000
Received: by outflank-mailman (input) for mailman id 676342;
 Mon, 05 Feb 2024 15:49:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jdDv=JO=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1rX1Dq-0003z0-GY
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 15:49:26 +0000
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [2607:f8b0:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22b2eb8d-c43e-11ee-8a46-1f161083a0e0;
 Mon, 05 Feb 2024 16:49:25 +0100 (CET)
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-5cdf76cde78so4083109a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 07:49:25 -0800 (PST)
Received: from localhost.localdomain (h-217-31-164-171.A175.priv.bahnhof.se.
 [217.31.164.171]) by smtp.gmail.com with ESMTPSA id
 h35-20020a635763000000b005d651d4236dsm69184pgm.86.2024.02.05.07.49.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 07:49:22 -0800 (PST)
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
X-Inumbo-ID: 22b2eb8d-c43e-11ee-8a46-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707148163; x=1707752963; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x0jQSs+xMp/AYCnSyfvm8mzv7aEdRMeM6lVxU/SiBzI=;
        b=IahC1+KwCBk/mFo4se9lDvIgPpLceWsderCRcZ/D1YlOJLtgV2oqvSzYeQvtfccYpv
         cZUGr+wiLQ59bI0xYQH4A/19Q+hEHrHXsIKQ7bDk1svao9nt3GGqCbTw/5RocIChuVTz
         +VE66xp0ZzMHK1fr9bfSqXHBIIJWQS5GWEZfIZKdY0r3YSWoO9YkzPhfth8gGLn+t7of
         JL67rXSyVVvp/eQLGsYPn/wTmnChq39ZHfi00mVvsiQ3MqMRwCdff1iaakMS20IDEcvO
         sKGEajVIm2AcoY35Yyzidc9Iz+D5ToHkrjFZRYyN/rSxhJeJXPIgSCIKO9+gLwjhfZoo
         0raQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707148163; x=1707752963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x0jQSs+xMp/AYCnSyfvm8mzv7aEdRMeM6lVxU/SiBzI=;
        b=kMKHjv+Zspou+qcNR9nNIaCccjGZ3xqXL7dMoF9C93QZKEcEiRUgvq7yBkJRV+tC9Q
         2rDT9rmjUUJRGHpSkSSMuqBk5xn9AKRaoGg119NckLioTxwXzWfCxO1fc9s1xXzDi61A
         nVUvfGltaCW5ddnTLbJd97sjK0IRAdnaKps+NHyv7i3K+WmSWQXYg6LobJZ5bXY8tMcR
         Lcq9nDk8jAptObBSjL+SosOSUySCBKJH0iRg9m8p1l5rCzKfD4LSxA//MLrdgQakf6A9
         5b41PI3KlbHHfUeJAy/yV514TbbDtzxgX4HCqGz8z75F+tjW5MHf0x10V4toQJOycpzx
         XQng==
X-Gm-Message-State: AOJu0YzgB8OKXle0UZ73CZ9i2K+jZ4ksq0xOAkFFl5emkO+AXJKfO5Xb
	9rmtyyvVBrVliLGa7+ho1B4b5EronFjVJh9M4YuO+0AmWb32NTZaIX1AO+fCPT35vJwnesgdFre
	0
X-Google-Smtp-Source: AGHT+IFfabSLrxkpkxLEuQudPIXI8NorlRh9x2u1XpsVWHNL2uys0t746eB8FRDVgN/awy2Okclwhw==
X-Received: by 2002:a05:6a20:9c97:b0:19c:9c9a:1b09 with SMTP id mj23-20020a056a209c9700b0019c9c9a1b09mr9678959pzb.10.1707148163378;
        Mon, 05 Feb 2024 07:49:23 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUesF0V/mXcz0KWIfH7HXtsKW+/Ha9lyYjSGxdk5SrsxFRpurqYhs/fldEk19gyiIJdu3+DzXK2lfIYK02C3T/uqaDsKxG2ZGhIsjD9AiAwd2qFLSsZNOpbtjT10o0dxv9hfKV2pPyoswIDP7y9dEexhxcgQFBOb3vN06cVc8hzBXGyIN6R81yEEXrBdfft9k9pde+neEIBYB0eKJFu5+wrtAmX0d1CbvBuIrX4nLYmyWjRViWrqyGpD1LAMhwReIi5HIPHfGUumeB2TUHTmi2TwI0/GqLC6gE=
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: patches@linaro.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [XEN PATCH v4] xen/arm: ffa: reclaim shared memory on guest destroy
Date: Mon,  5 Feb 2024 16:49:09 +0100
Message-Id: <20240205154909.2392231-1-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When an FF-A enabled guest is destroyed it may leave behind memory
shared with SPs. This memory must be reclaimed before it's reused or an
SP may make changes to memory used by a new unrelated guest. So when the
domain is teared down add FF-A requests to reclaim all remaining shared
memory.

SPs in the secure world are notified using VM_DESTROYED that a guest has
been destroyed. An SP is supposed to relinquish all shared memory to allow
reclaiming the memory. The relinquish operation may need to be delayed if
the shared memory is for instance part of a DMA operation.

The domain reference counter is increased when the first FF-A shared
memory is registered and the counter is decreased again when the last
shared memory is reclaimed. If FF-A shared memory registrations remain
at the end of of ffa_domain_teardown() a timer is set to try to reclaim
the shared memory every second until the memory is reclaimed.

A few minor style fixes with a removed empty line here and an added new
line there.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---

v4:
- Retry FFA_MSG_SEND_VM_DESTROYED on the returned errors
  FFA_RET_INTERRUPTED and FFA_RET_RETRY even after all shared memory
  handles has been reclaimed.
- Retry ffa_mem_reclaim() only on temporary returned errors, permanent
  errors like FFA_RET_INVALID_PARAMETERS is dealt with in recovery mode
  instead since the SPMC isn't expected to use that error under normal
  circumstances.

v3:
- Mentioning in the commit message that there are some style fixes
- Addressing review comments
- Refactor the ffa_domain_teardown() path to let
  ffa_domain_teardown_continue() do most of the work.

v2:
- Update commit message to match the new implementation
- Using a per domain bitfield to keep track of which SPs has been notified
  with VM_DESTROYED
- Holding a domain reference counter to keep the domain as a zombie domain
  while there still is shared memory registrations remaining to be reclaimed
- Using a timer to retry reclaiming remaining shared memory registrations
---
 xen/arch/arm/tee/ffa.c | 285 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 236 insertions(+), 49 deletions(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 0793c1c7585d..bbb6b819ee2b 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -54,6 +54,7 @@
 #include <xen/mm.h>
 #include <xen/sched.h>
 #include <xen/sizes.h>
+#include <xen/timer.h>
 #include <xen/types.h>
 
 #include <asm/event.h>
@@ -144,6 +145,12 @@
  */
 #define FFA_MAX_SHM_COUNT               32
 
+/*
+ * The time we wait until trying to tear down a domain again if it was
+ * blocked initially.
+ */
+#define FFA_CTX_TEARDOWN_DELAY          SECONDS(1)
+
 /* FF-A-1.1-REL0 section 10.9.2 Memory region handle, page 167 */
 #define FFA_HANDLE_HYP_FLAG             BIT(63, ULL)
 #define FFA_HANDLE_INVALID              0xffffffffffffffffULL
@@ -384,11 +391,6 @@ struct ffa_ctx {
     unsigned int page_count;
     /* FF-A version used by the guest */
     uint32_t guest_vers;
-    /*
-     * Number of SPs that we have sent a VM created signal to, used in
-     * ffa_domain_teardown() to know which SPs need to be signalled.
-     */
-    uint16_t create_signal_count;
     bool rx_is_free;
     /* Used shared memory objects, struct ffa_shm_mem */
     struct list_head shm_list;
@@ -402,6 +404,15 @@ struct ffa_ctx {
     spinlock_t tx_lock;
     spinlock_t rx_lock;
     spinlock_t lock;
+    /* Used if domain can't be torn down immediately */
+    struct domain *teardown_d;
+    struct list_head teardown_list;
+    s_time_t teardown_expire;
+    /*
+     * Used for ffa_domain_teardown() to keep track of which SPs should be
+     * notified that this guest is being destroyed.
+     */
+    unsigned long vm_destroy_bitmap[];
 };
 
 struct ffa_shm_mem {
@@ -436,6 +447,12 @@ static void *ffa_tx __read_mostly;
 static DEFINE_SPINLOCK(ffa_rx_buffer_lock);
 static DEFINE_SPINLOCK(ffa_tx_buffer_lock);
 
+
+/* Used to track domains that could not be torn down immediately. */
+static struct timer ffa_teardown_timer;
+static struct list_head ffa_teardown_head;
+static DEFINE_SPINLOCK(ffa_teardown_lock);
+
 static bool ffa_get_version(uint32_t *vers)
 {
     const struct arm_smccc_1_2_regs arg = {
@@ -853,7 +870,6 @@ static int32_t handle_partition_info_get(uint32_t w1, uint32_t w2, uint32_t w3,
             goto out_rx_release;
         }
 
-
         memcpy(ctx->rx, ffa_rx, sz);
     }
     ctx->rx_is_free = false;
@@ -992,53 +1008,75 @@ static void put_shm_pages(struct ffa_shm_mem *shm)
     }
 }
 
-static bool inc_ctx_shm_count(struct ffa_ctx *ctx)
+static bool inc_ctx_shm_count(struct domain *d, struct ffa_ctx *ctx)
 {
     bool ret = true;
 
     spin_lock(&ctx->lock);
+
+    /*
+     * If this is the first shm added, increase the domain reference
+     * counter as we need to keep domain around a bit longer to reclaim the
+     * shared memory in the teardown path.
+     */
+    if ( !ctx->shm_count )
+        get_knownalive_domain(d);
+
     if (ctx->shm_count >= FFA_MAX_SHM_COUNT)
         ret = false;
     else
         ctx->shm_count++;
+
     spin_unlock(&ctx->lock);
 
     return ret;
 }
 
-static void dec_ctx_shm_count(struct ffa_ctx *ctx)
+static void dec_ctx_shm_count(struct domain *d, struct ffa_ctx *ctx)
 {
     spin_lock(&ctx->lock);
+
     ASSERT(ctx->shm_count > 0);
     ctx->shm_count--;
+
+    /*
+     * If this was the last shm removed, let go of the domain reference we
+     * took in inc_ctx_shm_count() above.
+     */
+    if ( !ctx->shm_count )
+        put_domain(d);
+
     spin_unlock(&ctx->lock);
 }
 
-static struct ffa_shm_mem *alloc_ffa_shm_mem(struct ffa_ctx *ctx,
+static struct ffa_shm_mem *alloc_ffa_shm_mem(struct domain *d,
                                              unsigned int page_count)
 {
+    struct ffa_ctx *ctx = d->arch.tee;
     struct ffa_shm_mem *shm;
 
     if ( page_count >= FFA_MAX_SHM_PAGE_COUNT )
         return NULL;
-    if ( !inc_ctx_shm_count(ctx) )
+    if ( !inc_ctx_shm_count(d, ctx) )
         return NULL;
 
     shm = xzalloc_flex_struct(struct ffa_shm_mem, pages, page_count);
     if ( shm )
         shm->page_count = page_count;
     else
-        dec_ctx_shm_count(ctx);
+        dec_ctx_shm_count(d, ctx);
 
     return shm;
 }
 
-static void free_ffa_shm_mem(struct ffa_ctx *ctx, struct ffa_shm_mem *shm)
+static void free_ffa_shm_mem(struct domain *d, struct ffa_shm_mem *shm)
 {
+    struct ffa_ctx *ctx = d->arch.tee;
+
     if ( !shm )
         return;
 
-    dec_ctx_shm_count(ctx);
+    dec_ctx_shm_count(d, ctx);
     put_shm_pages(shm);
     xfree(shm);
 }
@@ -1306,7 +1344,7 @@ static void handle_mem_share(struct cpu_user_regs *regs)
         goto out_unlock;
     }
 
-    shm = alloc_ffa_shm_mem(ctx, page_count);
+    shm = alloc_ffa_shm_mem(d, page_count);
     if ( !shm )
     {
         ret = FFA_RET_NO_MEMORY;
@@ -1350,7 +1388,7 @@ static void handle_mem_share(struct cpu_user_regs *regs)
 
 out:
     if ( ret )
-        free_ffa_shm_mem(ctx, shm);
+        free_ffa_shm_mem(d, shm);
 out_unlock:
     spin_unlock(&ctx->tx_lock);
 
@@ -1401,7 +1439,7 @@ static int handle_mem_reclaim(uint64_t handle, uint32_t flags)
     }
     else
     {
-        free_ffa_shm_mem(ctx, shm);
+        free_ffa_shm_mem(d, shm);
     }
 
     return ret;
@@ -1486,6 +1524,41 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
     }
 }
 
+static bool is_in_subscr_list(const uint16_t *subscr, uint16_t start,
+                              uint16_t end, uint16_t sp_id)
+{
+    unsigned int n;
+
+    for ( n = start; n < end; n++ )
+    {
+        if ( subscr[n] == sp_id )
+            return true;
+    }
+
+    return false;
+}
+
+static void vm_destroy_bitmap_init(struct ffa_ctx *ctx,
+                                   unsigned int create_signal_count)
+{
+    unsigned int n;
+
+    for ( n = 0; n < subscr_vm_destroyed_count; n++ )
+    {
+        /*
+         * Skip SPs subscribed to the VM created event that never was
+         * notified of the VM creation due to an error during
+         * ffa_domain_init().
+         */
+        if ( is_in_subscr_list(subscr_vm_created, create_signal_count,
+                               subscr_vm_created_count,
+                               subscr_vm_destroyed[n]) )
+            continue;
+
+        set_bit(n, ctx->vm_destroy_bitmap);
+    }
+}
+
 static int ffa_domain_init(struct domain *d)
 {
     struct ffa_ctx *ctx;
@@ -1501,11 +1574,14 @@ static int ffa_domain_init(struct domain *d)
     if ( d->domain_id >= UINT16_MAX)
         return -ERANGE;
 
-    ctx = xzalloc(struct ffa_ctx);
+    ctx = xzalloc_flex_struct(struct ffa_ctx, vm_destroy_bitmap,
+                              BITS_TO_LONGS(subscr_vm_destroyed_count));
     if ( !ctx )
         return -ENOMEM;
 
     d->arch.tee = ctx;
+    ctx->teardown_d = d;
+    INIT_LIST_HEAD(&ctx->shm_list);
 
     for ( n = 0; n < subscr_vm_created_count; n++ )
     {
@@ -1515,65 +1591,173 @@ static int ffa_domain_init(struct domain *d)
         {
             printk(XENLOG_ERR "ffa: Failed to report creation of vm_id %u to  %u: res %d\n",
                    get_vm_id(d), subscr_vm_created[n], res);
-            ctx->create_signal_count = n;
-            return -EIO;
+            break;
         }
     }
-    ctx->create_signal_count = subscr_vm_created_count;
-
-    INIT_LIST_HEAD(&ctx->shm_list);
+    vm_destroy_bitmap_init(ctx, n);
+    if ( n != subscr_vm_created_count )
+        return -EIO;
 
     return 0;
 }
 
-static bool is_in_subscr_list(const uint16_t *subscr, uint16_t start,
-                              uint16_t end, uint16_t sp_id)
+static void send_vm_destroyed(struct domain *d)
 {
+    struct ffa_ctx *ctx = d->arch.tee;
     unsigned int n;
+    int32_t res;
 
-    for ( n = start; n < end; n++ )
+    for ( n = 0; n < subscr_vm_destroyed_count; n++ )
     {
-        if ( subscr[n] == sp_id )
-            return true;
-    }
+        if ( !test_bit(n, ctx->vm_destroy_bitmap) )
+            continue;
 
-    return false;
+        res = ffa_direct_req_send_vm(subscr_vm_destroyed[n], get_vm_id(d),
+                                     FFA_MSG_SEND_VM_DESTROYED);
+
+        if ( res )
+        {
+            printk(XENLOG_ERR "%pd: ffa: Failed to report destruction of vm_id %u to %u: res %d\n",
+                   d, get_vm_id(d), subscr_vm_destroyed[n], res);
+        }
+
+        /*
+         * For these two error codes the hypervisor is expected to resend
+         * the destruction message. For the rest it is expected that the
+         * error is permanent and that is doesn't help to resend the
+         * destruction message.
+         */
+        if ( res != FFA_RET_INTERRUPTED && res != FFA_RET_RETRY )
+            clear_bit(n, ctx->vm_destroy_bitmap);
+    }
 }
 
-/* This function is supposed to undo what ffa_domain_init() has done */
-static int ffa_domain_teardown(struct domain *d)
+static void reclaim_shms(struct domain *d)
 {
     struct ffa_ctx *ctx = d->arch.tee;
-    unsigned int n;
+    struct ffa_shm_mem *shm, *tmp;
     int32_t res;
 
-    if ( !ctx )
-        return 0;
+    list_for_each_entry_safe(shm, tmp, &ctx->shm_list, list)
+    {
+        register_t handle_hi;
+        register_t handle_lo;
+
+        uint64_to_regpair(&handle_hi, &handle_lo, shm->handle);
+        res = ffa_mem_reclaim(handle_lo, handle_hi, 0);
+        switch ( res ) {
+        case FFA_RET_OK:
+            printk(XENLOG_G_DEBUG "%pd: ffa: Reclaimed handle %#lx\n",
+                   d, shm->handle);
+            list_del(&shm->list);
+            free_ffa_shm_mem(d, shm);
+            break;
+        case FFA_RET_DENIED:
+            /*
+             * A temporary error that may get resolved a bit later, it's
+             * worth retrying.
+             */
+            printk(XENLOG_G_INFO "%pd: ffa: Failed to reclaim handle %#lx : %d\n",
+                   d, shm->handle, res);
+            break; /* We will retry later */
+        default:
+            /*
+             * The rest of the error codes are not expected and are assumed
+             * to be of a permanent nature. It not in our control to handle
+             * the error properly so the object in this case is to try to
+             * minimize the damage.
+             *
+             * FFA_RET_NO_MEMORY might be a temporary error as it it could
+             * succeed if retried later, but treat it as permanent for now.
+             */
+            printk(XENLOG_G_INFO "%pd: ffa: Permanent failure to reclaim handle %#lx : %d\n",
+                   d, shm->handle, res);
 
-    for ( n = 0; n < subscr_vm_destroyed_count; n++ )
+            /*
+             * Remove the shm from the list and free it, but don't drop
+             * references. This results in having the shared physical pages
+             * permanently allocate and also keeps the domain as a zombie
+             * domain.
+             */
+            list_del(&shm->list);
+            xfree(shm);
+            break;
+        }
+    }
+}
+
+static void ffa_domain_teardown_continue(struct ffa_ctx *ctx, bool first_time)
+{
+    struct ffa_ctx *next_ctx = NULL;
+
+    send_vm_destroyed(ctx->teardown_d);
+    reclaim_shms(ctx->teardown_d);
+
+    if ( ctx->shm_count ||
+         !bitmap_empty(ctx->vm_destroy_bitmap, subscr_vm_destroyed_count) )
+    {
+        printk(XENLOG_G_INFO "%pd: ffa: Remaining cleanup, retrying\n", ctx->teardown_d);
+
+        ctx->teardown_expire = NOW() + FFA_CTX_TEARDOWN_DELAY;
+
+        spin_lock(&ffa_teardown_lock);
+        list_add_tail(&ctx->teardown_list, &ffa_teardown_head);
+        /* Need to set a new timer for the next ctx in line */
+        next_ctx = list_first_entry(&ffa_teardown_head, struct ffa_ctx,
+                                    teardown_list);
+        spin_unlock(&ffa_teardown_lock);
+    }
+    else
     {
         /*
-         * Skip SPs subscribed to the VM created event that never was
-         * notified of the VM creation due to an error during
-         * ffa_domain_init().
+         * domain_destroy() might have been called (via put_domain() in
+         * reclaim_shms()), so we can't touch the domain structure anymore.
          */
-        if ( is_in_subscr_list(subscr_vm_created, ctx->create_signal_count,
-                               subscr_vm_created_count,
-                               subscr_vm_destroyed[n]) )
-            continue;
+        xfree(ctx);
 
-        res = ffa_direct_req_send_vm(subscr_vm_destroyed[n], get_vm_id(d),
-                                     FFA_MSG_SEND_VM_DESTROYED);
-
-        if ( res )
-            printk(XENLOG_ERR "ffa: Failed to report destruction of vm_id %u to  %u: res %d\n",
-                   get_vm_id(d), subscr_vm_destroyed[n], res);
+        /* Only check if there has been a change to the teardown queue */
+        if ( !first_time )
+        {
+            spin_lock(&ffa_teardown_lock);
+            next_ctx = list_first_entry_or_null(&ffa_teardown_head,
+                                                struct ffa_ctx, teardown_list);
+            spin_unlock(&ffa_teardown_lock);
+        }
     }
 
+    if ( next_ctx )
+        set_timer(&ffa_teardown_timer, next_ctx->teardown_expire);
+}
+
+static void ffa_teardown_timer_callback(void *arg)
+{
+    struct ffa_ctx *ctx;
+
+    spin_lock(&ffa_teardown_lock);
+    ctx = list_first_entry_or_null(&ffa_teardown_head, struct ffa_ctx,
+                                   teardown_list);
+    if ( ctx )
+        list_del(&ctx->teardown_list);
+    spin_unlock(&ffa_teardown_lock);
+
+    if ( ctx )
+        ffa_domain_teardown_continue(ctx, false /* !first_time */);
+    else
+        printk(XENLOG_G_ERR "%s: teardown list is empty\n", __func__);
+}
+
+/* This function is supposed to undo what ffa_domain_init() has done */
+static int ffa_domain_teardown(struct domain *d)
+{
+    struct ffa_ctx *ctx = d->arch.tee;
+
+    if ( !ctx )
+        return 0;
+
     if ( ctx->rx )
         rxtx_unmap(ctx);
 
-    XFREE(d->arch.tee);
+    ffa_domain_teardown_continue(ctx, true /* first_time */);
 
     return 0;
 }
@@ -1739,6 +1923,9 @@ static bool ffa_probe(void)
     if ( !init_sps() )
         goto err_free_ffa_tx;
 
+    INIT_LIST_HEAD(&ffa_teardown_head);
+    init_timer(&ffa_teardown_timer, ffa_teardown_timer_callback, NULL, 0);
+
     return true;
 
 err_free_ffa_tx:
-- 
2.34.1


