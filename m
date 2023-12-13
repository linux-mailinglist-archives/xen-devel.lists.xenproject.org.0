Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5845810FDF
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 12:26:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653946.1020567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDNNP-0000rJ-Hc; Wed, 13 Dec 2023 11:26:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653946.1020567; Wed, 13 Dec 2023 11:26:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDNNP-0000op-Es; Wed, 13 Dec 2023 11:26:07 +0000
Received: by outflank-mailman (input) for mailman id 653946;
 Wed, 13 Dec 2023 11:26:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ptd6=HY=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1rDNNO-0000of-3S
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 11:26:06 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64fd955c-99aa-11ee-9b0f-b553b5be7939;
 Wed, 13 Dec 2023 12:26:01 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a1c7d8f89a5so901029066b.2
 for <xen-devel@lists.xenproject.org>; Wed, 13 Dec 2023 03:26:01 -0800 (PST)
Received: from rayden.urgonet (h-217-31-164-171.A175.priv.bahnhof.se.
 [217.31.164.171]) by smtp.gmail.com with ESMTPSA id
 ts7-20020a170907c5c700b00a1dd58874b8sm7598338ejc.119.2023.12.13.03.25.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Dec 2023 03:25:59 -0800 (PST)
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
X-Inumbo-ID: 64fd955c-99aa-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702466760; x=1703071560; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lSv7al3Ioe35SOHIiy2+HuhQYxNK3PVhXMdyK17ixcQ=;
        b=cyS684Wvn4pma1wDY36UuMC/E9oAS4p/wyZVDB0+HgCwwopLZsB0l6ZaogaijtW5mE
         4smyxQToWDYLc7RUrhxEPCrhLcE+Xt2p98c5zIVoSEUhSr/DCt+oyLDyeinyhNbdNest
         rozf+iWJ53OE7CufETFAtRIlgRlPOK91fMdOp4PQN/k6NmT036faa42hM60LaelQbECJ
         LOMP+ejWqwhH6am9PngU3efoQx3puNGah9plCvpQ6D7fSbSNg7mqYVQiBEgxuYskp+a6
         WYdoP2Y8gCSgawJQTYlIUbCxIQLnhqWyJR5i7If6/+DVEnFIMheIs3JX8LuEJgE/D79n
         37OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702466760; x=1703071560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lSv7al3Ioe35SOHIiy2+HuhQYxNK3PVhXMdyK17ixcQ=;
        b=AZ4Dm9mQ8IsGtIWC67QRjXvRceWJX0Z/IuLRLLBrg6HPOdyfVnE7IyXwctIyAwKaIk
         Fg9f0tC2ugbsHVN2lrJk7lEopdsEzCZCLFuCCQoieBcjgCJjCQEmVKLtsTfNnhTUOkWA
         wMtY9rjtdou1x/GghsUiO32/VXsCrajm9v1PzHfZdTjhuW2RMw7DVRwoh+9S7XuT8JJu
         +LBHx3d1rDSgqjPxX1foJOmAZ4KuQmmnoSGd6aTaaCooGFiiRR7mEWQkzlfkW+q4U269
         7gWIEKHzMycdpqXWNK62Pzqbv6NmJzrcauQmPuO0yK36pu/mp4oSeJ9RPmHI+jHByJPb
         M1gA==
X-Gm-Message-State: AOJu0YywTtxejSZX2REqbBUZknh6IkwmXV2Oil67WwzbiuKHRWV34mcE
	eT+T6sQ+yyewcz+R8DrCWzReFvRJkl9UdjOHB2I=
X-Google-Smtp-Source: AGHT+IF2mpvOWCSnE3je8vqy/ytHMm0uRzZ708JG3JngII+pAe4Glq70b9db9XLQkjX89yuGe1w12Q==
X-Received: by 2002:a17:907:d25:b0:a1f:6b64:6a52 with SMTP id gn37-20020a1709070d2500b00a1f6b646a52mr4963865ejc.43.1702466760443;
        Wed, 13 Dec 2023 03:26:00 -0800 (PST)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: patches@linaro.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [XEN PATCH v2] xen/arm: ffa: reclaim shared memory on guest destroy
Date: Wed, 13 Dec 2023 12:25:57 +0100
Message-Id: <20231213112557.2393086-1-jens.wiklander@linaro.org>
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

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
Hi,

This is a follow-up to the RFC patch. In this patch, I take an explicit
reference on the domain when FF-A shared memory is registered. I've
discovered that it might not be strictly necessary until all the shared
pages are released with put_page() they also keep a reference to the
domain.

I'm not entirely sure what is the status of the shared memory when the
domain has turned into a zombie. We still hold references on the shared
pages until put_page() is called on each. Is that enough to guarantee that
they will not be reused?

Thanks,
Jens

v2:
- Update commit message to match the new implementation
- Using a per domain bitfield to keep track of which SPs has been notified
  with VM_DESTROYED
- Holding a domain reference counter to keep the domain as a zombie domain
  while there still is shared memory registrations remaining to be reclaimed
- Using a timer to retry reclaiming remaining shared memory registrations

---
 xen/arch/arm/tee/ffa.c | 270 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 224 insertions(+), 46 deletions(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 183528d13388..22906a6e1cff 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -54,6 +54,7 @@
 #include <xen/mm.h>
 #include <xen/sched.h>
 #include <xen/sizes.h>
+#include <xen/timer.h>
 #include <xen/types.h>
 
 #include <asm/event.h>
@@ -384,11 +385,6 @@ struct ffa_ctx {
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
@@ -402,6 +398,15 @@ struct ffa_ctx {
     spinlock_t tx_lock;
     spinlock_t rx_lock;
     spinlock_t lock;
+    /* Used if domain can't be teared down immediately */
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
@@ -436,6 +441,12 @@ static void *ffa_tx __read_mostly;
 static DEFINE_SPINLOCK(ffa_rx_buffer_lock);
 static DEFINE_SPINLOCK(ffa_tx_buffer_lock);
 
+
+/* Used if domain can't be teared down immediately */
+static struct timer ffa_teardown_timer;
+static struct list_head ffa_teardown_head;
+static DEFINE_SPINLOCK(ffa_teardown_lock);
+
 static bool ffa_get_version(uint32_t *vers)
 {
     const struct arm_smccc_1_2_regs arg = {
@@ -850,7 +861,6 @@ static int32_t handle_partition_info_get(uint32_t w1, uint32_t w2, uint32_t w3,
             goto out_rx_release;
         }
 
-
         memcpy(ctx->rx, ffa_rx, sz);
     }
     ctx->rx_is_free = false;
@@ -989,53 +999,75 @@ static void put_shm_pages(struct ffa_shm_mem *shm)
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
+     * counter as we may need to domain around a bit longer to reclaim the
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
@@ -1303,7 +1335,7 @@ static void handle_mem_share(struct cpu_user_regs *regs)
         goto out_unlock;
     }
 
-    shm = alloc_ffa_shm_mem(ctx, page_count);
+    shm = alloc_ffa_shm_mem(d, page_count);
     if ( !shm )
     {
         ret = FFA_RET_NO_MEMORY;
@@ -1347,7 +1379,7 @@ static void handle_mem_share(struct cpu_user_regs *regs)
 
 out:
     if ( ret )
-        free_ffa_shm_mem(ctx, shm);
+        free_ffa_shm_mem(d, shm);
 out_unlock:
     spin_unlock(&ctx->tx_lock);
 
@@ -1398,7 +1430,7 @@ static int handle_mem_reclaim(uint64_t handle, uint32_t flags)
     }
     else
     {
-        free_ffa_shm_mem(ctx, shm);
+        free_ffa_shm_mem(d, shm);
     }
 
     return ret;
@@ -1481,6 +1513,41 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
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
@@ -1496,11 +1563,14 @@ static int ffa_domain_init(struct domain *d)
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
@@ -1510,64 +1580,169 @@ static int ffa_domain_init(struct domain *d)
         {
             printk(XENLOG_ERR "ffa: Failed to report creation of vm_id %u to  %u: res %d\n",
                    get_vm_id(d), subscr_vm_created[n], res);
-            ctx->create_signal_count = n;
+            vm_destroy_bitmap_init(ctx, n);
             return -EIO;
         }
     }
-    ctx->create_signal_count = subscr_vm_created_count;
-
-    INIT_LIST_HEAD(&ctx->shm_list);
+    vm_destroy_bitmap_init(ctx, subscr_vm_created_count);
 
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
+        else
+        {
+            clear_bit(n, ctx->vm_destroy_bitmap);
+        }
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
 
+    list_for_each_entry_safe(shm, tmp, &ctx->shm_list, list)
+    {
+        register_t handle_hi;
+        register_t handle_lo;
+
+        uint64_to_regpair(&handle_hi, &handle_lo, shm->handle);
+        res = ffa_mem_reclaim(handle_lo, handle_hi, 0);
+        if ( res )
+        {
+            printk(XENLOG_G_INFO "%pd: ffa: Failed to reclaim handle %#lx : %d\n",
+                   d, shm->handle, res);
+        }
+        else
+        {
+            printk(XENLOG_G_DEBUG "%pd: ffa: Reclaimed handle %#lx\n",
+                   d, shm->handle);
+            list_del(&shm->list);
+            free_ffa_shm_mem(d, shm);
+        }
+    }
+}
+
+static bool ffa_domain_teardown_continue(struct ffa_ctx *ctx)
+{
+    send_vm_destroyed(ctx->teardown_d);
+    reclaim_shms(ctx->teardown_d);
+
+    if ( ctx->shm_count )
+    {
+        printk(XENLOG_G_INFO "%pd: ffa: Remaining unclaimed handles, retrying\n", ctx->teardown_d);
+        return false;
+    }
+    else
+    {
+        return true;
+    }
+}
+
+static void ffa_teardown_timer_callback(void *arg)
+{
+    struct ffa_ctx *ctx;
+    bool do_free;
+
+    spin_lock(&ffa_teardown_lock);
+    ctx = list_first_entry_or_null(&ffa_teardown_head, struct ffa_ctx,
+                                   teardown_list);
+    spin_unlock(&ffa_teardown_lock);
+
     if ( !ctx )
-        return 0;
+    {
+        printk(XENLOG_G_ERR "%s: teardown list is empty\n", __func__);
+        return;
+    }
 
-    for ( n = 0; n < subscr_vm_destroyed_count; n++ )
+    do_free = ffa_domain_teardown_continue(ctx);
+
+    spin_lock(&ffa_teardown_lock);
+    list_del(&ctx->teardown_list);
+    if ( !do_free )
+    {
+        ctx->teardown_expire = NOW() + SECONDS(1);
+        list_add_tail(&ctx->teardown_list, &ffa_teardown_head);
+    }
+    spin_unlock(&ffa_teardown_lock);
+
+    if ( do_free )
     {
         /*
-         * Skip SPs subscribed to the VM created event that never was
-         * notified of the VM creation due to an error during
-         * ffa_domain_init().
+         * domain_destroy() has likely been called (via put_domain() in
+         * reclaim_shms()) by now, so we can't touch the domain
+         * structure anymore.
          */
-        if ( is_in_subscr_list(subscr_vm_created, ctx->create_signal_count,
-                               subscr_vm_created_count,
-                               subscr_vm_destroyed[n]) )
-            continue;
+        xfree(ctx);
+    }
 
-        res = ffa_direct_req_send_vm(subscr_vm_destroyed[n], get_vm_id(d),
-                                     FFA_MSG_SEND_VM_DESTROYED);
+    spin_lock(&ffa_teardown_lock);
+    ctx = list_first_entry_or_null(&ffa_teardown_head, struct ffa_ctx,
+                                   teardown_list);
+    spin_unlock(&ffa_teardown_lock);
 
-        if ( res )
-            printk(XENLOG_ERR "ffa: Failed to report destruction of vm_id %u to  %u: res %d\n",
-                   get_vm_id(d), subscr_vm_destroyed[n], res);
-    }
+    if ( ctx )
+        set_timer(&ffa_teardown_timer, ctx->teardown_expire);
+}
+
+static void ffa_queue_ctx_teardown(struct ffa_ctx *ctx)
+{
+    ctx->teardown_expire =  NOW() + SECONDS(1);
+
+    spin_lock(&ffa_teardown_lock);
+
+    /*
+     * The timer is already active if there are queued teardown entries.
+     */
+    if ( list_empty(&ffa_teardown_head) )
+        set_timer(&ffa_teardown_timer, ctx->teardown_expire);
+
+    list_add_tail(&ctx->teardown_list, &ffa_teardown_head);
+
+    spin_unlock(&ffa_teardown_lock);
+}
+
+/* This function is supposed to undo what ffa_domain_init() has done */
+static int ffa_domain_teardown(struct domain *d)
+{
+    struct ffa_ctx *ctx = d->arch.tee;
+
+    if ( !ctx )
+        return 0;
 
     if ( ctx->rx )
         rxtx_unmap(ctx);
 
+    send_vm_destroyed(d);
+    reclaim_shms(d);
+
+    if ( ctx->shm_count )
+    {
+        printk(XENLOG_G_INFO "%pd: ffa: Remaining unclaimed handles, retrying\n", d);
+        ffa_queue_ctx_teardown(ctx);
+        return 0;
+    }
+
     XFREE(d->arch.tee);
 
     return 0;
@@ -1733,6 +1908,9 @@ static bool ffa_probe(void)
     if ( !init_sps() )
         goto err_free_ffa_tx;
 
+    INIT_LIST_HEAD(&ffa_teardown_head);
+    init_timer(&ffa_teardown_timer, ffa_teardown_timer_callback, NULL, 0);
+
     return true;
 
 err_free_ffa_tx:
-- 
2.34.1


