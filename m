Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 860E0852ED9
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 12:14:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679846.1057572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZqjX-0002i1-33; Tue, 13 Feb 2024 11:13:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679846.1057572; Tue, 13 Feb 2024 11:13:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZqjX-0002fi-00; Tue, 13 Feb 2024 11:13:51 +0000
Received: by outflank-mailman (input) for mailman id 679846;
 Tue, 13 Feb 2024 11:13:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8AlW=JW=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1rZqjV-0002fZ-R9
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 11:13:50 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5120cfb-ca60-11ee-98f5-efadbce2ee36;
 Tue, 13 Feb 2024 12:13:47 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-55a179f5fa1so5705961a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 Feb 2024 03:13:47 -0800 (PST)
Received: from localhost.localdomain (h-217-31-164-171.A175.priv.bahnhof.se.
 [217.31.164.171]) by smtp.gmail.com with ESMTPSA id
 by18-20020a170906a2d200b00a3c8494b9c9sm1187640ejb.9.2024.02.13.03.13.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 03:13:45 -0800 (PST)
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
X-Inumbo-ID: f5120cfb-ca60-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707822826; x=1708427626; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ah2W+Jqw0gjGODmbPx4KrR3Ac+wyRbbfIMKbSN3TmiY=;
        b=AylmvOT9sRFbXq/8AtJh+bOcZACl/bo8symGdGEaHhNedpdtl8VvP8kaWszbGulvEf
         4yQpeQLEyPhcQBmhDZIMHNzlWZoIuTutNnG0NcCrHdaXUF/Dj0yeiCBJ6AmNaY5AIEED
         juFw986z+jzQbE/Cbt1cRdVhf8tcF5zer6J9SFTZ6ZMWIdyM0cYWnUCcKsQrfecnPw7y
         qAHjvwgcj9Y5HOnqvCtb5mac6Opm34ci3OxjNtj1pT8s5y3/4EQH0O6BbTfc28ODz2Fx
         48akDqUSvpHfe6YaZMU7QI2GwFvkwt/9mcc66U9igJX92UD8VuqfDX6hFINe6+7rzTIH
         cFCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707822826; x=1708427626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ah2W+Jqw0gjGODmbPx4KrR3Ac+wyRbbfIMKbSN3TmiY=;
        b=Hu2H/bdmuiH4prWYkqntOWnMZqPG8zFl0yJ0+NpJ1e4XqjqHUzXCdhmqzGoIt7XtuM
         RwDx/q0QWY89WGkNzC5BPdhSLUUndlw4F8IkkXrdzcYaY0Xuyn+enbdjAlIYs8aws5cd
         cepHoz6fkXOxC2UbX6zf1XC/dvS2kYCC4FHt6AB3krThJc3byFiGHscdK1PCPDuhJ4kM
         GeUtvdmqd9P4II8qaxEuZji/9sY2+VAa4/1EztDivCaluAZdQ+8/XHc+qHj9+cr3dQkL
         P0o0zvTnWkFFZJ7lGpyd3Ys0QcW6hb7LzPKIA3j2335LlsBfnb1fvQR2UkQC8S/6XzMr
         xaew==
X-Gm-Message-State: AOJu0Yzvl0x/NFxy5/oa4HDNWFnAWxY51td/0tWx8Lukw5hHQHpqEyTN
	7+JGFf/oKYvbmA+ayVgo79uw8mdwFYzNZI1315POOcZS+d40H5UDFVyaGTtCAJbjPFq4Omposre
	b
X-Google-Smtp-Source: AGHT+IFFZptaPu4QRJPbnM0mWZMAJhROTmtogdtbhPiBM9zg9t+ljajdWElSymRRacZsnFPnZGYuPA==
X-Received: by 2002:a17:906:114b:b0:a3d:18e3:9c52 with SMTP id i11-20020a170906114b00b00a3d18e39c52mr321079eja.4.1707822826200;
        Tue, 13 Feb 2024 03:13:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUWldfdzYm8TNZxEH0eSrKa9Cy8suwSs0b7eRlxZ99FBZ1+FgNdKzIy/z1m24Inrp7R0XDj21xQ8cO8LsU4K2QHEzp0bC0XSFlu5VbhHBdIhry0r3OdZwrhzOgv1G5+EIFb5uQW9DR7escthAb67ygm5DXEE48PdHk7LmXIuF7D91vImu5hVKg254m4RXgRYgNnYrbSg5Xp56IWLc8jVbzT4ZVHVxaiEp6Wsr1Vcsoeh9EqJ4mz6chnXtJ+MR4OltRPgYIPJQMYcrmwgnYNcLfH/4EC+GQMoiI=
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
Subject: [XEN PATCH v5] xen/arm: ffa: reclaim shared memory on guest destroy
Date: Tue, 13 Feb 2024 12:13:36 +0100
Message-Id: <20240213111336.881934-1-jens.wiklander@linaro.org>
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
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
v5:
- Move the put_domain() call after the spinlock section in dec_ctx_shm_count()
- Move the get_knownalive_domain() call into the else statement in
  inc_ctx_shm_count() to make sure it's only performed if ctx->shm_count
  is to be increased

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
 xen/arch/arm/tee/ffa.c | 295 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 245 insertions(+), 50 deletions(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 0793c1c7585d..9a05dcede17a 100644
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
@@ -992,53 +1008,83 @@ static void put_shm_pages(struct ffa_shm_mem *shm)
     }
 }
 
-static bool inc_ctx_shm_count(struct ffa_ctx *ctx)
+static bool inc_ctx_shm_count(struct domain *d, struct ffa_ctx *ctx)
 {
     bool ret = true;
 
     spin_lock(&ctx->lock);
-    if (ctx->shm_count >= FFA_MAX_SHM_COUNT)
+
+    if ( ctx->shm_count >= FFA_MAX_SHM_COUNT )
+    {
         ret = false;
+    }
     else
+    {
+        /*
+         * If this is the first shm added, increase the domain reference
+         * counter as we need to keep domain around a bit longer to reclaim
+         * the shared memory in the teardown path.
+         */
+        if ( !ctx->shm_count )
+            get_knownalive_domain(d);
+
         ctx->shm_count++;
+    }
+
     spin_unlock(&ctx->lock);
 
     return ret;
 }
 
-static void dec_ctx_shm_count(struct ffa_ctx *ctx)
+static void dec_ctx_shm_count(struct domain *d, struct ffa_ctx *ctx)
 {
+    bool drop_ref;
+
     spin_lock(&ctx->lock);
+
     ASSERT(ctx->shm_count > 0);
     ctx->shm_count--;
+
+    /*
+     * If this was the last shm removed, let go of the domain reference we
+     * took in inc_ctx_shm_count() above.
+     */
+    drop_ref = !ctx->shm_count;
+
     spin_unlock(&ctx->lock);
+
+    if ( drop_ref )
+        put_domain(d);
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
@@ -1306,7 +1352,7 @@ static void handle_mem_share(struct cpu_user_regs *regs)
         goto out_unlock;
     }
 
-    shm = alloc_ffa_shm_mem(ctx, page_count);
+    shm = alloc_ffa_shm_mem(d, page_count);
     if ( !shm )
     {
         ret = FFA_RET_NO_MEMORY;
@@ -1350,7 +1396,7 @@ static void handle_mem_share(struct cpu_user_regs *regs)
 
 out:
     if ( ret )
-        free_ffa_shm_mem(ctx, shm);
+        free_ffa_shm_mem(d, shm);
 out_unlock:
     spin_unlock(&ctx->tx_lock);
 
@@ -1401,7 +1447,7 @@ static int handle_mem_reclaim(uint64_t handle, uint32_t flags)
     }
     else
     {
-        free_ffa_shm_mem(ctx, shm);
+        free_ffa_shm_mem(d, shm);
     }
 
     return ret;
@@ -1486,6 +1532,41 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
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
@@ -1501,11 +1582,14 @@ static int ffa_domain_init(struct domain *d)
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
@@ -1515,65 +1599,173 @@ static int ffa_domain_init(struct domain *d)
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
-
-        res = ffa_direct_req_send_vm(subscr_vm_destroyed[n], get_vm_id(d),
-                                     FFA_MSG_SEND_VM_DESTROYED);
+        xfree(ctx);
 
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
@@ -1739,6 +1931,9 @@ static bool ffa_probe(void)
     if ( !init_sps() )
         goto err_free_ffa_tx;
 
+    INIT_LIST_HEAD(&ffa_teardown_head);
+    init_timer(&ffa_teardown_timer, ffa_teardown_timer_callback, NULL, 0);
+
     return true;
 
 err_free_ffa_tx:
-- 
2.34.1


