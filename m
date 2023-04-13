Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 026596E0779
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 09:16:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520472.808153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmrBW-0004a6-Fb; Thu, 13 Apr 2023 07:15:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520472.808153; Thu, 13 Apr 2023 07:15:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmrBV-0004QD-Ug; Thu, 13 Apr 2023 07:15:57 +0000
Received: by outflank-mailman (input) for mailman id 520472;
 Thu, 13 Apr 2023 07:15:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UVxt=AE=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pmrBR-0001gq-QI
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 07:15:53 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06a81776-d9cb-11ed-b21e-6b7b168915f2;
 Thu, 13 Apr 2023 09:15:53 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id h37so1074263lfv.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Apr 2023 00:15:53 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 n12-20020ac2490c000000b004dc83d04840sm181354lfi.79.2023.04.13.00.15.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 00:15:52 -0700 (PDT)
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
X-Inumbo-ID: 06a81776-d9cb-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681370152; x=1683962152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xuOrFGzp3bQy6WF/rcEt04FHwlM3ACHxMEsVNb5k43M=;
        b=C2cwYx0xgzJnKg9vDH7Al2RhRIpKXc3PMJ5q7dtFkoiIX62/R95NCUz5GZpPvj1xzn
         adjqcbajRJ6eh5vX/MJGIVljuc6wwbmhgBvSjx7eytIIGCI/llssQDclboM0bSTVcUZg
         S2YPoqxUDRRkqVNYrGqa9JmA++d10SF0WEb3XJyBtyIzJePnRBMmTIrS8qmOL5WAl8mK
         Rd9jID2u9u52+AZ7SQOxvvY4pLlB1eHf73RauurMg/aa0Cr+QasTS+t4s0HS1QzhAH7W
         0EqLMngiZl7G8Ka8lyngFzW1F8ZNBnl6mkQcwj7bFEVZGy/t1+4CQZRQfb80YzWX3tlt
         PnvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681370152; x=1683962152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xuOrFGzp3bQy6WF/rcEt04FHwlM3ACHxMEsVNb5k43M=;
        b=JbMRp/BzQ1sWS7MvN0Oxwiz84O7GwNjByqjOMRuJabfZavMHL9Fk1vhj/hTurCknc6
         CpdG9NVmtFAhNGzkNsByWr5fo+BYfJb+3ouoi54KqjD/JA4qCezBYYwQtuk4o26ato7D
         VIMEjDvN/kNuzeoM0VPYZC+BENWQpAOZV6Y2zWF7I+VEhuK5mkKf8N+Lqd0GFGnco3ex
         LaVqaP+B79foiHFrVBaqGyMXHMMjPajdwITZvnXN16BpmxthyAUfDvPV4+sAV90ivmKc
         vdg4DbeT+nWbIXpLXDpE5VhG46o3kDRGGy+Phm0Ic5ruYKEty8oz57gg7eAOHFSwmrpm
         LuBQ==
X-Gm-Message-State: AAQBX9cNYdGmeYNct9IqY1Ng7Se7qhCBYYHjMB5GnnVwZWzAf1tO2eLi
	EMiaZzroLWsjFGOE7f+ULiMwc/cECrJ0N90kLLU=
X-Google-Smtp-Source: AKy350ZTVFbXDHijwkV8Xa+5i4VYHTf+Be6BMZHtsfXpiolxEsUHP1ZKdCCeiS99RxfioLYUbsjClQ==
X-Received: by 2002:ac2:50ca:0:b0:4eb:40d4:e0d3 with SMTP id h10-20020ac250ca000000b004eb40d4e0d3mr563100lfm.35.1681370152689;
        Thu, 13 Apr 2023 00:15:52 -0700 (PDT)
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
Subject: [XEN PATCH v8 12/22] xen/arm: ffa: support mapping guest RX/TX buffers
Date: Thu, 13 Apr 2023 09:14:14 +0200
Message-Id: <20230413071424.3273490-13-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230413071424.3273490-1-jens.wiklander@linaro.org>
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds support in the mediator to map and unmap the RX and TX buffers
provided by the guest using the two FF-A functions FFA_RXTX_MAP and
FFA_RXTX_UNMAP.

These buffer are later used to transmit data that cannot be passed in
registers only.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/tee/ffa.c | 137 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 137 insertions(+)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index b4fea65ce31d..127397d8e448 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -74,6 +74,12 @@
  */
 #define FFA_RXTX_PAGE_COUNT             1
 
+/*
+ * Limits the number of pages RX/TX buffers guests can map. This value has
+ * been chosen arbitrary.
+ */
+#define FFA_MAX_RXTX_PAGE_COUNT         32
+
 /*
  * Flags and field values used for the MSG_SEND_DIRECT_REQ/RESP:
  * BIT(31): Framework or partition message
@@ -169,8 +175,15 @@ struct ffa_partition_info_1_1 {
 };
 
 struct ffa_ctx {
+    void *rx;
+    const void *tx;
+    struct page_info *rx_pg;
+    struct page_info *tx_pg;
+    /* Number of 4kB pages in each of rx/rx_pg and tx/tx_pg */
+    unsigned int page_count;
     /* FF-A version used by the guest */
     uint32_t guest_vers;
+    bool tx_is_free;
 };
 
 /* Negotiated FF-A version to use with the SPMC */
@@ -351,6 +364,11 @@ static void set_regs(struct cpu_user_regs *regs, register_t v0, register_t v1,
         set_user_reg(regs, 7, v7);
 }
 
+static void set_regs_error(struct cpu_user_regs *regs, uint32_t error_code)
+{
+    set_regs(regs, FFA_ERROR, 0, error_code, 0, 0, 0, 0, 0);
+}
+
 static void set_regs_success(struct cpu_user_regs *regs, uint32_t w2,
                              uint32_t w3)
 {
@@ -372,6 +390,105 @@ static void handle_version(struct cpu_user_regs *regs)
     set_regs(regs, vers, 0, 0, 0, 0, 0, 0, 0);
 }
 
+static uint32_t handle_rxtx_map(uint32_t fid, register_t tx_addr,
+                                register_t rx_addr, uint32_t page_count)
+{
+    uint32_t ret = FFA_RET_INVALID_PARAMETERS;
+    struct domain *d = current->domain;
+    struct ffa_ctx *ctx = d->arch.tee;
+    struct page_info *tx_pg;
+    struct page_info *rx_pg;
+    p2m_type_t t;
+    void *rx;
+    void *tx;
+
+    if ( !smccc_is_conv_64(fid) )
+    {
+        /*
+         * Calls using the 32-bit calling convention must ignore the upper
+         * 32 bits in the argument registers.
+         */
+        tx_addr &= UINT32_MAX;
+        rx_addr &= UINT32_MAX;
+    }
+
+    if ( page_count > FFA_MAX_RXTX_PAGE_COUNT ) {
+        printk(XENLOG_ERR "ffa: RXTX_MAP: error: %u pages requested (limit %u)\n",
+               page_count, FFA_MAX_RXTX_PAGE_COUNT);
+        return FFA_RET_NOT_SUPPORTED;
+    }
+
+    /* Already mapped */
+    if ( ctx->rx )
+        return FFA_RET_DENIED;
+
+    tx_pg = get_page_from_gfn(d, gfn_x(gaddr_to_gfn(tx_addr)), &t, P2M_ALLOC);
+    if ( !tx_pg )
+        return FFA_RET_INVALID_PARAMETERS;
+    /* Only normal RAM for now */
+    if ( !p2m_is_ram(t) )
+        goto err_put_tx_pg;
+
+    rx_pg = get_page_from_gfn(d, gfn_x(gaddr_to_gfn(rx_addr)), &t, P2M_ALLOC);
+    if ( !tx_pg )
+        goto err_put_tx_pg;
+    /* Only normal RAM for now */
+    if ( !p2m_is_ram(t) )
+        goto err_put_rx_pg;
+
+    tx = __map_domain_page_global(tx_pg);
+    if ( !tx )
+        goto err_put_rx_pg;
+
+    rx = __map_domain_page_global(rx_pg);
+    if ( !rx )
+        goto err_unmap_tx;
+
+    ctx->rx = rx;
+    ctx->tx = tx;
+    ctx->rx_pg = rx_pg;
+    ctx->tx_pg = tx_pg;
+    ctx->page_count = page_count;
+    ctx->tx_is_free = true;
+    return FFA_RET_OK;
+
+err_unmap_tx:
+    unmap_domain_page_global(tx);
+err_put_rx_pg:
+    put_page(rx_pg);
+err_put_tx_pg:
+    put_page(tx_pg);
+
+    return ret;
+}
+
+static void rxtx_unmap(struct ffa_ctx *ctx)
+{
+    unmap_domain_page_global(ctx->rx);
+    unmap_domain_page_global(ctx->tx);
+    put_page(ctx->rx_pg);
+    put_page(ctx->tx_pg);
+    ctx->rx = NULL;
+    ctx->tx = NULL;
+    ctx->rx_pg = NULL;
+    ctx->tx_pg = NULL;
+    ctx->page_count = 0;
+    ctx->tx_is_free = false;
+}
+
+static uint32_t handle_rxtx_unmap(void)
+{
+    struct domain *d = current->domain;
+    struct ffa_ctx *ctx = d->arch.tee;
+
+    if ( !ctx->rx )
+        return FFA_RET_INVALID_PARAMETERS;
+
+    rxtx_unmap(ctx);
+
+    return FFA_RET_OK;
+}
+
 static void handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32_t fid)
 {
     struct arm_smccc_1_2_regs arg = { .a0 = fid, };
@@ -428,6 +545,7 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
     uint32_t fid = get_user_reg(regs, 0);
     struct domain *d = current->domain;
     struct ffa_ctx *ctx = d->arch.tee;
+    int e;
 
     if ( !ctx )
         return false;
@@ -440,6 +558,22 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
     case FFA_ID_GET:
         set_regs_success(regs, get_vm_id(d), 0);
         return true;
+    case FFA_RXTX_MAP_32:
+    case FFA_RXTX_MAP_64:
+        e = handle_rxtx_map(fid, get_user_reg(regs, 1), get_user_reg(regs, 2),
+                            get_user_reg(regs, 3));
+        if ( e )
+            set_regs_error(regs, e);
+        else
+            set_regs_success(regs, 0, 0);
+        return true;
+    case FFA_RXTX_UNMAP:
+        e = handle_rxtx_unmap();
+        if ( e )
+            set_regs_error(regs, e);
+        else
+            set_regs_success(regs, 0, 0);
+        return true;
     case FFA_MSG_SEND_DIRECT_REQ_32:
     case FFA_MSG_SEND_DIRECT_REQ_64:
         handle_msg_send_direct_req(regs, fid);
@@ -520,6 +654,9 @@ static int ffa_relinquish_resources(struct domain *d)
                    get_vm_id(d), subscr_vm_destroyed[n], res);
     }
 
+    if ( ctx->rx )
+        rxtx_unmap(ctx);
+
     XFREE(d->arch.tee);
 
     return 0;
-- 
2.34.1


