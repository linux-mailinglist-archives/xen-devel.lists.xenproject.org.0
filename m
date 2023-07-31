Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 623A47695E2
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 14:16:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.572971.897236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQRoc-0006y2-Jw; Mon, 31 Jul 2023 12:15:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 572971.897236; Mon, 31 Jul 2023 12:15:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQRoc-0006tS-7t; Mon, 31 Jul 2023 12:15:58 +0000
Received: by outflank-mailman (input) for mailman id 572971;
 Mon, 31 Jul 2023 12:15:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VuP2=DR=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qQRoZ-0003r0-IZ
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 12:15:55 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff9b8268-2f9b-11ee-b255-6b7b168915f2;
 Mon, 31 Jul 2023 14:15:55 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4fe2de785e7so2218098e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 31 Jul 2023 05:15:55 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 l10-20020ac2430a000000b004fbb1bc1ae0sm2028077lfh.163.2023.07.31.05.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 05:15:53 -0700 (PDT)
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
X-Inumbo-ID: ff9b8268-2f9b-11ee-b255-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690805754; x=1691410554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O7Tv43Fw+2yJGd68qd39ntIRSoYO8/W65g1z0p43Q1c=;
        b=HNicUyZ/f8BHG2++n3STRpiLZeJeB53CC2UwqdczD1LpkV0s2EiCtcoDBgtmPGMkvW
         uH04JN45w/JPf7V3Hawlvkc2eUFKpqQt7VzsiZ33l/81iFiGYwGpm/5xiSmuajeIUenx
         sfVTO5tdePuKXLGN10UCv6e4Y8nj2WWm6YxirRWeUguy1UAHwgm6nsgWYcXAVLbRPZAC
         AHCkAafAIaV0baK9XDSWLqISFh75kdRxdbuwtfffT076r2DY9Q/PmgEMru5TOh/0FqDp
         9F3GXcWyqspv9N3FeJuOuxMhH8NWN7xzM0LoggswRWdaXf+mqHjIz44SExIUiW0aujqi
         EH+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690805754; x=1691410554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O7Tv43Fw+2yJGd68qd39ntIRSoYO8/W65g1z0p43Q1c=;
        b=S4Uwp12kH7KPhLx1EiXVIXiJREpzaf8WCQ4knZlf4T1/anTwoDp3h5RpxAk8UAu+ZS
         vZmyThqV26/totY2TMqQW8YTZvagIkp/Ut24gLEi1Y+BDr/iIkqLJmV1ZfesRxzc5GEh
         kyd2r2mDpRrVTJgUCgPDqAA02fcVfx0D6XDy5rANmX3aJ8SFHL70j+uJx5Aw1Q+nRbwg
         cw0Hc0FTY67V5td8OB3JXTxj1pU/V4yBI9vV19ZH/mM2Ds7u32dZU8vRc02jiIeWItnb
         v7Ie+Dl3FqGe5MpOvWP9M8eQHLJykLs4lfNMd1Xehzle7DdBmehmIir8PzR2rH+tazuY
         MFbQ==
X-Gm-Message-State: ABy/qLaT2Stk63+tsverqTrWCDU75opiaPbuhSUVV0Ott+UVxem+OD4b
	rOTELJVPZtby/J6c3DZ5Ql0YPioo0z24UsS1EGc=
X-Google-Smtp-Source: APBJJlHt6A4biBbVLpbbAllO8aE4h4H2Kr0DxMGPdsBcldHgd9k70UTdq+YFs/UC2fXBZOo735pfog==
X-Received: by 2002:a05:6512:2106:b0:4f5:a181:97b8 with SMTP id q6-20020a056512210600b004f5a18197b8mr4652307lfr.25.1690805754348;
        Mon, 31 Jul 2023 05:15:54 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com,
	Marc Bonnici <marc.bonnici@arm.com>,
	Achin Gupta <achin.gupta@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [XEN PATCH v11 11/14] xen/arm: ffa: improve lock granularity
Date: Mon, 31 Jul 2023 14:15:33 +0200
Message-Id: <20230731121536.934239-12-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230731121536.934239-1-jens.wiklander@linaro.org>
References: <20230731121536.934239-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The single lock in struct ffa_ctx is complemented with rx_lock and tx_lock.

The old lock is used for small critical sections, like increasing
shm_count or adding another shm to shm_list.

rx_lock and tx_lock are only acquired using spin_trylock() which for
well-behaving guests should always succeed. Guests using the RX and TX
buffers are expected to serialize accesses before doing the FF-A
request.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
v10->v11
- No changes except resolving conflicts since "xen/arm: ffa: support
  sharing large memory ranges" was dropped.
---
 xen/arch/arm/tee/ffa.c | 107 +++++++++++++++++++++++++++++------------
 1 file changed, 77 insertions(+), 30 deletions(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 75700938c444..eb4a58fec470 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -363,6 +363,13 @@ struct ffa_ctx {
     struct list_head shm_list;
     /* Number of allocated shared memory object */
     unsigned int shm_count;
+    /*
+     * tx_lock is used to serialize access to tx
+     * rx_lock is used to serialize access to rx
+     * lock is used for the rest in this struct
+     */
+    spinlock_t tx_lock;
+    spinlock_t rx_lock;
     spinlock_t lock;
 };
 
@@ -768,7 +775,9 @@ static int32_t handle_partition_info_get(uint32_t w1, uint32_t w2, uint32_t w3,
     if ( !ffa_rx )
         return FFA_RET_DENIED;
 
-    spin_lock(&ctx->lock);
+    if ( !spin_trylock(&ctx->rx_lock) )
+        return FFA_RET_BUSY;
+
     if ( !ctx->page_count || !ctx->rx_is_free )
         goto out;
     spin_lock(&ffa_rx_buffer_lock);
@@ -819,7 +828,7 @@ out_rx_release:
 out_rx_buf_unlock:
     spin_unlock(&ffa_rx_buffer_lock);
 out:
-    spin_unlock(&ctx->lock);
+    spin_unlock(&ctx->rx_lock);
 
     return ret;
 }
@@ -830,13 +839,15 @@ static int32_t handle_rx_release(void)
     struct domain *d = current->domain;
     struct ffa_ctx *ctx = d->arch.tee;
 
-    spin_lock(&ctx->lock);
+    if ( !spin_trylock(&ctx->rx_lock) )
+        return FFA_RET_BUSY;
+
     if ( !ctx->page_count || ctx->rx_is_free )
         goto out;
     ret = FFA_RET_OK;
     ctx->rx_is_free = true;
 out:
-    spin_unlock(&ctx->lock);
+    spin_unlock(&ctx->rx_lock);
 
     return ret;
 }
@@ -947,21 +958,43 @@ static void put_shm_pages(struct ffa_shm_mem *shm)
     }
 }
 
+static bool inc_ctx_shm_count(struct ffa_ctx *ctx)
+{
+    bool ret = true;
+
+    spin_lock(&ctx->lock);
+    if (ctx->shm_count >= FFA_MAX_SHM_COUNT)
+        ret = false;
+    else
+        ctx->shm_count++;
+    spin_unlock(&ctx->lock);
+
+    return ret;
+}
+
+static void dec_ctx_shm_count(struct ffa_ctx *ctx)
+{
+    spin_lock(&ctx->lock);
+    ASSERT(ctx->shm_count > 0);
+    ctx->shm_count--;
+    spin_unlock(&ctx->lock);
+}
+
 static struct ffa_shm_mem *alloc_ffa_shm_mem(struct ffa_ctx *ctx,
                                              unsigned int page_count)
 {
     struct ffa_shm_mem *shm;
 
-    if ( page_count >= FFA_MAX_SHM_PAGE_COUNT ||
-         ctx->shm_count >= FFA_MAX_SHM_COUNT )
+    if ( page_count >= FFA_MAX_SHM_PAGE_COUNT )
+        return NULL;
+    if ( !inc_ctx_shm_count(ctx) )
         return NULL;
 
     shm = xzalloc_flex_struct(struct ffa_shm_mem, pages, page_count);
     if ( shm )
-    {
-        ctx->shm_count++;
         shm->page_count = page_count;
-    }
+    else
+        dec_ctx_shm_count(ctx);
 
     return shm;
 }
@@ -971,8 +1004,7 @@ static void free_ffa_shm_mem(struct ffa_ctx *ctx, struct ffa_shm_mem *shm)
     if ( !shm )
         return;
 
-    ASSERT(ctx->shm_count > 0);
-    ctx->shm_count--;
+    dec_ctx_shm_count(ctx);
     put_shm_pages(shm);
     xfree(shm);
 }
@@ -1180,7 +1212,11 @@ static void handle_mem_share(struct cpu_user_regs *regs)
         goto out_set_ret;
     }
 
-    spin_lock(&ctx->lock);
+    if ( !spin_trylock(&ctx->tx_lock) )
+    {
+        ret = FFA_RET_BUSY;
+        goto out_set_ret;
+    }
 
     if ( frag_len > ctx->page_count * FFA_PAGE_SIZE )
         goto out_unlock;
@@ -1272,7 +1308,9 @@ static void handle_mem_share(struct cpu_user_regs *regs)
     if ( ret )
         goto out;
 
+    spin_lock(&ctx->lock);
     list_add_tail(&shm->list, &ctx->shm_list);
+    spin_unlock(&ctx->lock);
 
     uint64_to_regpair(&handle_hi, &handle_lo, shm->handle);
 
@@ -1280,7 +1318,7 @@ out:
     if ( ret )
         free_ffa_shm_mem(ctx, shm);
 out_unlock:
-    spin_unlock(&ctx->lock);
+    spin_unlock(&ctx->tx_lock);
 
 out_set_ret:
     if ( ret == 0)
@@ -1289,6 +1327,18 @@ out_set_ret:
             set_regs_error(regs, ret);
 }
 
+/* Must only be called with ctx->lock held */
+static struct ffa_shm_mem *find_shm_mem(struct ffa_ctx *ctx, uint64_t handle)
+{
+    struct ffa_shm_mem *shm;
+
+    list_for_each_entry(shm, &ctx->shm_list, list)
+        if ( shm->handle == handle )
+            return shm;
+
+    return NULL;
+}
+
 static int handle_mem_reclaim(uint64_t handle, uint32_t flags)
 {
     struct domain *d = current->domain;
@@ -1299,29 +1349,26 @@ static int handle_mem_reclaim(uint64_t handle, uint32_t flags)
     int ret;
 
     spin_lock(&ctx->lock);
-    list_for_each_entry(shm, &ctx->shm_list, list)
-    {
-        if ( shm->handle == handle )
-            goto found_it;
-    }
-    shm = NULL;
-    ret = FFA_RET_INVALID_PARAMETERS;
-    goto out;
-found_it:
+    shm = find_shm_mem(ctx, handle);
+    if ( shm )
+        list_del(&shm->list);
+    spin_unlock(&ctx->lock);
+    if ( !shm )
+        return FFA_RET_INVALID_PARAMETERS;
 
     uint64_to_regpair(&handle_hi, &handle_lo, handle);
     ret = ffa_mem_reclaim(handle_lo, handle_hi, flags);
+
     if ( ret )
     {
-        shm = NULL;
-        goto out;
+        spin_lock(&ctx->lock);
+        list_add_tail(&shm->list, &ctx->shm_list);
+        spin_unlock(&ctx->lock);
+    }
+    else
+    {
+        free_ffa_shm_mem(ctx, shm);
     }
-
-    list_del(&shm->list);
-
-out:
-    free_ffa_shm_mem(ctx, shm);
-    spin_unlock(&ctx->lock);
 
     return ret;
 }
-- 
2.34.1


