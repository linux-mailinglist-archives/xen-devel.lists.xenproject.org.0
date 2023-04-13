Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DBF6E0787
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 09:16:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520473.808159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmrBX-0004oK-Ga; Thu, 13 Apr 2023 07:15:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520473.808159; Thu, 13 Apr 2023 07:15:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmrBX-0004eX-3j; Thu, 13 Apr 2023 07:15:59 +0000
Received: by outflank-mailman (input) for mailman id 520473;
 Thu, 13 Apr 2023 07:15:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UVxt=AE=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pmrBS-0001gq-QV
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 07:15:54 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 072bf309-d9cb-11ed-b21e-6b7b168915f2;
 Thu, 13 Apr 2023 09:15:54 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id q26so5660539lfe.9
 for <xen-devel@lists.xenproject.org>; Thu, 13 Apr 2023 00:15:54 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 n12-20020ac2490c000000b004dc83d04840sm181354lfi.79.2023.04.13.00.15.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 00:15:53 -0700 (PDT)
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
X-Inumbo-ID: 072bf309-d9cb-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681370153; x=1683962153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GR2XQOhN0lHMXLb5++oGf9JMuFsfS462ejdMhNzV4DY=;
        b=gGIRIObi89IrBahA6+sVARSNDH2wnEHfLGa2RrKoJNoix8BkRVP8wMKo1zIy0o4O6l
         riib/Kkt/TVJF0iHt9qdoHRCHHQ6QZqTR1RwRz+p1X6Vd16TYaCiSjlnDd3gvQXOAXeD
         oEMqSC6wOoZeobzdx9OVckFDx07TSkKlVG05BXl8g0HSzGz4iHjlfkLQY+ZNvak5s0dB
         fJrjUeZQNW/ZSphGIXV+xuNlLq/NZdkg6DaTG+ER8PNiVWiwngan7uN1w8GCM4Y+383/
         E6lHRWyN2GPZ6CSET4S6lCJuBcPby9+uzJifTetCAM/4ns/7cRBrozAOIfINtn5wQ5Fy
         r81Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681370153; x=1683962153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GR2XQOhN0lHMXLb5++oGf9JMuFsfS462ejdMhNzV4DY=;
        b=eopmVtXhuFc8qJchad0YJGfpyNTt31b4EYqh+pTONNJBsuOQrmLhVx3rklNWC+gPIk
         TrlBCZ3QfZU2jSdtYTdNIsD2Kbo9l38N+5kUr1ho8cGiNGi2eUvZdW12xMCfODlbTG3O
         LNHC66Mh3lVuzKiYoxi555Y7tip1UM4MV7yEvBUNGjNE26bbtBb8tzyfWYIpmS6kJleg
         4KUQGkKgbBbUwV4v6n7EZCxLboAFaiV8WLBg3Wa3O6uU9qJXp26/8dNCCozu1mAf7yIL
         ahRoa69JMjMlYx0J1hKlIhJ0jf8Qc8xhIAQs2dcB7mo4w6/YlBSgOGpxwQuhf/Rd1DA2
         HRfg==
X-Gm-Message-State: AAQBX9cHzVHEt1LaRdL9cbdslY9DMfKn//EzA29j8/6oFnVVIIs3a0gA
	XrVqoXVzgpy4X0WdTvWWNj0xUMhjm/rcgmZ7jvM=
X-Google-Smtp-Source: AKy350ab5t5FQhmU9qvLXFWPGFpKyD3JH7lTCDpinTADeMzIc498fZhRGX4cr3+LeonWPEkBuIqvng==
X-Received: by 2002:ac2:515a:0:b0:4ed:5c73:79cb with SMTP id q26-20020ac2515a000000b004ed5c7379cbmr20947lfd.21.1681370153558;
        Thu, 13 Apr 2023 00:15:53 -0700 (PDT)
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
Subject: [XEN PATCH v8 13/22] xen/arm: ffa: support guest FFA_PARTITION_INFO_GET
Date: Thu, 13 Apr 2023 09:14:15 +0200
Message-Id: <20230413071424.3273490-14-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230413071424.3273490-1-jens.wiklander@linaro.org>
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds support in the mediator to handle FFA_PARTITION_INFO_GET requests
from a guest. The requests are forwarded to the SPMC and the response is
translated according to the FF-A version in use by the guest.

Using FFA_PARTITION_INFO_GET changes the owner of the RX buffer to the
caller (the guest in this case), so once it is done with the buffer it
must be released using FFA_RX_RELEASE before another call can be made.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/tee/ffa.c | 137 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 134 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 127397d8e448..74b8c517afb8 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -166,7 +166,18 @@
 #define FFA_MSG_SEND                    0x8400006EU
 #define FFA_MSG_POLL                    0x8400006AU
 
+/*
+ * Structs below ending with _1_0 are defined in FF-A-1.0-REL and
+ * struct ending with _1_1 are defined in FF-A-1.1-REL0.
+ */
+
 /* Partition information descriptor */
+struct ffa_partition_info_1_0 {
+    uint16_t id;
+    uint16_t execution_context;
+    uint32_t partition_properties;
+};
+
 struct ffa_partition_info_1_1 {
     uint16_t id;
     uint16_t execution_context;
@@ -183,7 +194,8 @@ struct ffa_ctx {
     unsigned int page_count;
     /* FF-A version used by the guest */
     uint32_t guest_vers;
-    bool tx_is_free;
+    bool rx_is_free;
+    spinlock_t lock;
 };
 
 /* Negotiated FF-A version to use with the SPMC */
@@ -198,9 +210,15 @@ static uint16_t subscr_vm_destroyed_count __read_mostly;
 /*
  * Our rx/tx buffers shared with the SPMC. FFA_RXTX_PAGE_COUNT is the
  * number of pages used in each of these buffers.
+ *
+ * The RX buffer is protected from concurrent usage with ffa_rx_buffer_lock.
+ * Note that the SPMC is also tracking the ownership of our RX buffer so
+ * for calls which uses our RX buffer to deliver a result we must call
+ * ffa_rx_release() to let the SPMC know that we're done with the buffer.
  */
 static void *ffa_rx __read_mostly;
 static void *ffa_tx __read_mostly;
+static DEFINE_SPINLOCK(ffa_rx_buffer_lock);
 
 static bool ffa_get_version(uint32_t *vers)
 {
@@ -449,7 +467,7 @@ static uint32_t handle_rxtx_map(uint32_t fid, register_t tx_addr,
     ctx->rx_pg = rx_pg;
     ctx->tx_pg = tx_pg;
     ctx->page_count = page_count;
-    ctx->tx_is_free = true;
+    ctx->rx_is_free = true;
     return FFA_RET_OK;
 
 err_unmap_tx:
@@ -473,7 +491,7 @@ static void rxtx_unmap(struct ffa_ctx *ctx)
     ctx->rx_pg = NULL;
     ctx->tx_pg = NULL;
     ctx->page_count = 0;
-    ctx->tx_is_free = false;
+    ctx->rx_is_free = false;
 }
 
 static uint32_t handle_rxtx_unmap(void)
@@ -489,6 +507,100 @@ static uint32_t handle_rxtx_unmap(void)
     return FFA_RET_OK;
 }
 
+static int32_t handle_partition_info_get(uint32_t w1, uint32_t w2, uint32_t w3,
+                                         uint32_t w4, uint32_t w5,
+                                         uint32_t *count)
+{
+    int32_t ret = FFA_RET_DENIED;
+    struct domain *d = current->domain;
+    struct ffa_ctx *ctx = d->arch.tee;
+
+    /*
+     * FF-A v1.0 has w5 MBZ while v1.1 allows
+     * FFA_PARTITION_INFO_GET_COUNT_FLAG to be non-zero.
+     */
+    if ( w5 == FFA_PARTITION_INFO_GET_COUNT_FLAG &&
+         ctx->guest_vers == FFA_VERSION_1_1 )
+        return ffa_partition_info_get(w1, w2, w3, w4, w5, count);
+    if ( w5 )
+        return FFA_RET_INVALID_PARAMETERS;
+
+    if ( !ffa_rx )
+        return FFA_RET_DENIED;
+
+    spin_lock(&ctx->lock);
+    if ( !ctx->page_count || !ctx->rx_is_free )
+        goto out;
+    spin_lock(&ffa_rx_buffer_lock);
+    ret = ffa_partition_info_get(w1, w2, w3, w4, w5, count);
+    if ( ret )
+        goto out_rx_buf_unlock;
+    /*
+     * ffa_partition_info_get() succeeded so we now own the RX buffer we
+     * share with the SPMC. We must give it back using ffa_rx_release()
+     * once we've copied the content.
+     */
+
+    if ( ctx->guest_vers == FFA_VERSION_1_0 )
+    {
+        size_t n;
+        struct ffa_partition_info_1_1 *src = ffa_rx;
+        struct ffa_partition_info_1_0 *dst = ctx->rx;
+
+        if ( ctx->page_count * FFA_PAGE_SIZE < *count * sizeof(*dst) )
+        {
+            ret = FFA_RET_NO_MEMORY;
+            goto out_rx_release;
+        }
+
+        for ( n = 0; n < *count; n++ )
+        {
+            dst[n].id = src[n].id;
+            dst[n].execution_context = src[n].execution_context;
+            dst[n].partition_properties = src[n].partition_properties;
+        }
+    }
+    else
+    {
+        size_t sz = *count * sizeof(struct ffa_partition_info_1_1);
+
+        if ( ctx->page_count * FFA_PAGE_SIZE < sz )
+        {
+            ret = FFA_RET_NO_MEMORY;
+            goto out_rx_release;
+        }
+
+
+        memcpy(ctx->rx, ffa_rx, sz);
+    }
+    ctx->rx_is_free = false;
+out_rx_release:
+    ffa_rx_release();
+out_rx_buf_unlock:
+    spin_unlock(&ffa_rx_buffer_lock);
+out:
+    spin_unlock(&ctx->lock);
+
+    return ret;
+}
+
+static int32_t handle_rx_release(void)
+{
+    int32_t ret = FFA_RET_DENIED;
+    struct domain *d = current->domain;
+    struct ffa_ctx *ctx = d->arch.tee;
+
+    spin_lock(&ctx->lock);
+    if ( !ctx->page_count || ctx->rx_is_free )
+        goto out;
+    ret = FFA_RET_OK;
+    ctx->rx_is_free = true;
+out:
+    spin_unlock(&ctx->lock);
+
+    return ret;
+}
+
 static void handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32_t fid)
 {
     struct arm_smccc_1_2_regs arg = { .a0 = fid, };
@@ -545,6 +657,7 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
     uint32_t fid = get_user_reg(regs, 0);
     struct domain *d = current->domain;
     struct ffa_ctx *ctx = d->arch.tee;
+    uint32_t count;
     int e;
 
     if ( !ctx )
@@ -574,6 +687,24 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
         else
             set_regs_success(regs, 0, 0);
         return true;
+    case FFA_PARTITION_INFO_GET:
+        e = handle_partition_info_get(get_user_reg(regs, 1),
+                                      get_user_reg(regs, 2),
+                                      get_user_reg(regs, 3),
+                                      get_user_reg(regs, 4),
+                                      get_user_reg(regs, 5), &count);
+        if ( e )
+            set_regs_error(regs, e);
+        else
+            set_regs_success(regs, count, 0);
+        return true;
+    case FFA_RX_RELEASE:
+        e = handle_rx_release();
+        if ( e )
+            set_regs_error(regs, e);
+        else
+            set_regs_success(regs, 0, 0);
+        return true;
     case FFA_MSG_SEND_DIRECT_REQ_32:
     case FFA_MSG_SEND_DIRECT_REQ_64:
         handle_msg_send_direct_req(regs, fid);
-- 
2.34.1


