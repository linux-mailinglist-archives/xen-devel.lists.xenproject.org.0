Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A8D6E0793
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 09:19:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520509.808243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmrET-0004P1-M6; Thu, 13 Apr 2023 07:19:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520509.808243; Thu, 13 Apr 2023 07:19:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmrET-0004Mr-H7; Thu, 13 Apr 2023 07:19:01 +0000
Received: by outflank-mailman (input) for mailman id 520509;
 Thu, 13 Apr 2023 07:19:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UVxt=AE=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pmrCP-0001wd-7V
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 07:16:53 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a5cc3e4-d9cb-11ed-b21e-6b7b168915f2;
 Thu, 13 Apr 2023 09:15:59 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id be27so14525387ljb.12
 for <xen-devel@lists.xenproject.org>; Thu, 13 Apr 2023 00:15:59 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 n12-20020ac2490c000000b004dc83d04840sm181354lfi.79.2023.04.13.00.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 00:15:58 -0700 (PDT)
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
X-Inumbo-ID: 0a5cc3e4-d9cb-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681370159; x=1683962159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AWMfdA9HpSiI1qDObUeAHUi8FAHJApSAQ901NaR8YIk=;
        b=ilktQ26XzJ4n2sJx6Kp+98uQyeKojkT1UGZZHwt26/EHVvDL/hzyJC04WzfdBm51/T
         6fgUEBd84Hg2QaI536ykBWPMyBZfVt5TsBpAnT9Wv1U+AW0EUTRQS0LgD3rDPHlvFG/Y
         tzaqt0zLmnJh8bA2Z9LpITJo9QM4jABS4faREWjii9jhPmOThPvq3WayjcFNe+ojnS6a
         F8QfR8cpV1SZ98n3JXp7rZNlIAQM+gt6rI73g4rF8potof+/3zSt+2dN63aEKWn2R6la
         I6fl3OVBz2U1k9nVbtvB56KLRVTKKmcQeWH8UIuMYUmgizyS/EFCYnDEXM44ETXUwFn1
         zgKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681370159; x=1683962159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AWMfdA9HpSiI1qDObUeAHUi8FAHJApSAQ901NaR8YIk=;
        b=aQc23mOcNzsVfdD6dQeZQx14Zo40Xg2Cw+M3P3116UJ6bAApB27wF5zJ+j5InxQsvg
         oJIWM0qsSrDZFquTqRYUg+onYBXX1nWIjM+qyxsfRVKqIkv81N4mpzGZFY234tLs7ImG
         TEzKxK2lWlXgOh6YqGbDy7wBnzZBDeiLCKgoktBsj8lZ9azBKnenPnrtek3i/AfM10vm
         o30jVXCLGB8PGN4b7xXQc5k63OmxuHGuM0fXrUHWBVyz2GoHc7EwjwX+nnHFR6+v5mhO
         FIsqEV9aUwwn1XPcx3Z1Zx8vWZ1dPf3dHXkXJsLr+xqYAc0TKa6ElMHuAovc3bM7QHqj
         V7sg==
X-Gm-Message-State: AAQBX9cZ8F3SbssddMKOWQvl9lFz55C+aRdapomv/32EIGbm39yjHe0C
	oPRkMLNFqGfevmUVdAFssNkwycKfDX3tpTmzm0A=
X-Google-Smtp-Source: AKy350bGmfrrRvHIGr0xu/AMw2wt+/mtPTeA7AKRuu86fhugHg801zDTzTHURvTo0DZpwjgCsXPKsw==
X-Received: by 2002:a2e:9d4d:0:b0:2a6:1960:4367 with SMTP id y13-20020a2e9d4d000000b002a619604367mr481467ljj.8.1681370158883;
        Thu, 13 Apr 2023 00:15:58 -0700 (PDT)
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
Subject: [XEN PATCH v8 20/22] xen/arm: ffa: improve lock granularity
Date: Thu, 13 Apr 2023 09:14:22 +0200
Message-Id: <20230413071424.3273490-21-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230413071424.3273490-1-jens.wiklander@linaro.org>
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
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
 xen/arch/arm/tee/ffa.c | 124 ++++++++++++++++++++++++++++++-----------
 1 file changed, 91 insertions(+), 33 deletions(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 888e3f9265c2..0948cc636871 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -362,6 +362,13 @@ struct ffa_ctx {
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
 
@@ -796,7 +803,9 @@ static int32_t handle_partition_info_get(uint32_t w1, uint32_t w2, uint32_t w3,
     if ( !ffa_rx )
         return FFA_RET_DENIED;
 
-    spin_lock(&ctx->lock);
+    if ( !spin_trylock(&ctx->rx_lock) )
+        return FFA_RET_BUSY;
+
     if ( !ctx->page_count || !ctx->rx_is_free )
         goto out;
     spin_lock(&ffa_rx_buffer_lock);
@@ -847,7 +856,7 @@ out_rx_release:
 out_rx_buf_unlock:
     spin_unlock(&ffa_rx_buffer_lock);
 out:
-    spin_unlock(&ctx->lock);
+    spin_unlock(&ctx->rx_lock);
 
     return ret;
 }
@@ -858,13 +867,15 @@ static int32_t handle_rx_release(void)
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
@@ -973,30 +984,52 @@ static void put_shm_pages(struct ffa_shm_mem *shm)
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
 
 static void free_ffa_shm_mem(struct ffa_ctx *ctx, struct ffa_shm_mem *shm)
 {
-    if ( shm ) {
-        ASSERT(ctx->shm_count > 0);
-        ctx->shm_count--;
+    if ( shm )
+    {
+        dec_ctx_shm_count(ctx);
         put_shm_pages(shm);
         xfree(shm);
     }
@@ -1277,7 +1310,11 @@ static void handle_mem_share(struct cpu_user_regs *regs)
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
@@ -1399,7 +1436,9 @@ static void handle_mem_share(struct cpu_user_regs *regs)
     if ( ret )
         goto out;
 
+    spin_lock(&ctx->lock);
     list_add_tail(&shm->list, &ctx->shm_list);
+    spin_unlock(&ctx->lock);
 
     uint64_to_regpair(&handle_hi, &handle_lo, shm->handle);
 
@@ -1407,7 +1446,7 @@ out:
     if ( ret )
         free_ffa_shm_mem(ctx, shm);
 out_unlock:
-    spin_unlock(&ctx->lock);
+    spin_unlock(&ctx->tx_lock);
 
 out_set_ret:
     if ( ret > 0 )
@@ -1442,7 +1481,12 @@ static void handle_mem_frag_tx(struct cpu_user_regs *regs)
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
@@ -1467,15 +1511,20 @@ static void handle_mem_frag_tx(struct cpu_user_regs *regs)
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
@@ -1484,6 +1533,18 @@ out:
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
@@ -1494,29 +1555,26 @@ static int handle_mem_reclaim(uint64_t handle, uint32_t flags)
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


