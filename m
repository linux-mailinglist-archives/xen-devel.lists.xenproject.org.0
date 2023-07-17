Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C22755CDC
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 09:27:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564238.881687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLIdm-0000nv-IB; Mon, 17 Jul 2023 07:27:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564238.881687; Mon, 17 Jul 2023 07:27:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLIdm-0000ms-CX; Mon, 17 Jul 2023 07:27:30 +0000
Received: by outflank-mailman (input) for mailman id 564238;
 Mon, 17 Jul 2023 07:27:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xV9D=DD=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qLIYD-0005A3-3C
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 07:21:45 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9553fe70-2472-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 09:21:44 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2b70bfc8db5so60800931fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jul 2023 00:21:44 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 l10-20020ac24a8a000000b004f846cd74bcsm2658938lfp.245.2023.07.17.00.21.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 00:21:43 -0700 (PDT)
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
X-Inumbo-ID: 9553fe70-2472-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689578504; x=1692170504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZoIi1uajGrKh0qyhlJNpu9qRdkH7y35FjQEkn4RminE=;
        b=B3+jrIb0yXT2XMzdgNvrSdrhzstZgxuQREa4YdQovrihqXzLqXVBKks+NdSzkS/MRh
         Yc/e2pMmDJGiHYYfgXpz66TQBs8Bc6oIz6unRqQe4vJI0HWCMFQ4muAiFAAyLnjzuU6f
         XUp2Vc7vD7kesS9LVYqyxLLEYYUTFQuR8Nzh3C9rflGIuaHVQsF3AUVDcZR4uzUznngI
         5N1A8GaQD1sfHXU5e5lwQ183Lhebdlv/fkiC9zWQJiQrivI9fPunDoFqvLmWAiF1wqyP
         T3FdNobRdc5nYygX49bU+oxTeC2yJHSGECv/yE6zirYF6Q9IHMRTSVb1u8Oxxt8oGC/f
         fkvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689578504; x=1692170504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZoIi1uajGrKh0qyhlJNpu9qRdkH7y35FjQEkn4RminE=;
        b=K9g4NV73Rufk7Yu0afCAGlEFN1w1te6m0jNod+4mTYH2RW/pBuKD6ShhAZqGTfC/IC
         Ggzmfj4me70KcZnej1c1prPjWir9ZIgHUPhpx2U205MAx0RXaE49bp+s0fPctkc5QIbo
         NApxujP08ofOdI3Pc3cRuAQnewWlF4bw1z7AN3sE05pGrMFQqeYuC2/qzUGP2xrfXk27
         2vpVw7mNLduksrjl01nA4Ct2MAp9xJj5iC0Ex3T0ZR8pHqBKR00R9rk6qWtB77LyH6tJ
         nGPha2G2CUE8wjAc9srxjAY798lbRRPvvcjqiDDLTRNckSZ3HyuivNjpNDzxMRFHFZoq
         F/9A==
X-Gm-Message-State: ABy/qLb0sWbvZjLXUzLfeh5WqAIW7fFPQuE0VAlZA3w3DiaBUzUZ8/vc
	MH7SMEglbfmOgCsPtui7xMBnPkOqttzIF1Nfcaw=
X-Google-Smtp-Source: APBJJlGqOE0FmP3e2RxIrGtRAMVbmvZEGyOGEKApJB0D87k0xucsrK25ps7L++4vOStziweRuDfcMw==
X-Received: by 2002:a05:6512:3da6:b0:4f8:68a3:38e2 with SMTP id k38-20020a0565123da600b004f868a338e2mr9253650lfv.0.1689578503838;
        Mon, 17 Jul 2023 00:21:43 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand.Marquis@arm.com,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Marc Bonnici <marc.bonnici@arm.com>,
	Achin Gupta <achin.gupta@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [XEN PATCH v10 21/24] xen/arm: ffa: improve lock granularity
Date: Mon, 17 Jul 2023 09:21:04 +0200
Message-Id: <20230717072107.753304-22-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230717072107.753304-1-jens.wiklander@linaro.org>
References: <20230717072107.753304-1-jens.wiklander@linaro.org>
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
 xen/arch/arm/tee/ffa.c | 121 ++++++++++++++++++++++++++++++-----------
 1 file changed, 89 insertions(+), 32 deletions(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index ac23b9edc74c..59832f73c2be 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -365,6 +365,13 @@ struct ffa_ctx {
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
 
@@ -815,7 +822,9 @@ static int32_t handle_partition_info_get(uint32_t w1, uint32_t w2, uint32_t w3,
     if ( !ffa_rx )
         return FFA_RET_DENIED;
 
-    spin_lock(&ctx->lock);
+    if ( !spin_trylock(&ctx->rx_lock) )
+        return FFA_RET_BUSY;
+
     if ( !ctx->page_count || !ctx->rx_is_free )
         goto out;
     spin_lock(&ffa_rx_buffer_lock);
@@ -866,7 +875,7 @@ out_rx_release:
 out_rx_buf_unlock:
     spin_unlock(&ffa_rx_buffer_lock);
 out:
-    spin_unlock(&ctx->lock);
+    spin_unlock(&ctx->rx_lock);
 
     return ret;
 }
@@ -877,13 +886,15 @@ static int32_t handle_rx_release(void)
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
@@ -994,21 +1005,43 @@ static void put_shm_pages(struct ffa_shm_mem *shm)
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
@@ -1018,8 +1051,7 @@ static void free_ffa_shm_mem(struct ffa_ctx *ctx, struct ffa_shm_mem *shm)
     if ( !shm )
         return;
 
-    ASSERT(ctx->shm_count > 0);
-    ctx->shm_count--;
+    dec_ctx_shm_count(ctx);
     put_shm_pages(shm);
     xfree(shm);
 }
@@ -1299,7 +1331,11 @@ static void handle_mem_share(struct cpu_user_regs *regs)
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
@@ -1421,7 +1457,9 @@ static void handle_mem_share(struct cpu_user_regs *regs)
     if ( ret )
         goto out;
 
+    spin_lock(&ctx->lock);
     list_add_tail(&shm->list, &ctx->shm_list);
+    spin_unlock(&ctx->lock);
 
     uint64_to_regpair(&handle_hi, &handle_lo, shm->handle);
 
@@ -1429,7 +1467,7 @@ out:
     if ( ret )
         free_ffa_shm_mem(ctx, shm);
 out_unlock:
-    spin_unlock(&ctx->lock);
+    spin_unlock(&ctx->tx_lock);
 
 out_set_ret:
     if ( ret > 0 )
@@ -1464,7 +1502,12 @@ static void handle_mem_frag_tx(struct cpu_user_regs *regs)
     uint16_t sender_id = 0;
     int ret;
 
-    spin_lock(&ctx->lock);
+    if ( !spin_trylock(&ctx->tx_lock) )
+    {
+        ret = FFA_RET_BUSY;
+        goto out_set_ret;
+    }
+
     s = find_frag_state(ctx, handle);
     if ( !s )
     {
@@ -1489,15 +1532,20 @@ static void handle_mem_frag_tx(struct cpu_user_regs *regs)
     spin_unlock(&ffa_tx_buffer_lock);
     if ( ret < 0 )
         goto out_free_s;
+
+    spin_lock(&ctx->lock);
     list_add_tail(&s->shm->list, &ctx->shm_list);
+    spin_unlock(&ctx->lock);
+
 out_free_s:
     if ( ret < 0 )
         free_ffa_shm_mem(ctx, s->shm);
     list_del(&s->list);
     xfree(s);
 out:
-    spin_unlock(&ctx->lock);
+    spin_unlock(&ctx->tx_lock);
 
+out_set_ret:
     if ( ret > 0 )
             set_regs_frag_rx(regs, handle_lo, handle_hi, ret, sender_id);
     else if ( ret == 0)
@@ -1506,6 +1554,18 @@ out:
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
@@ -1516,29 +1576,26 @@ static int handle_mem_reclaim(uint64_t handle, uint32_t flags)
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


