Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1DC7480F4
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 11:35:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558894.873469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGyv7-0000HF-VB; Wed, 05 Jul 2023 09:35:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558894.873469; Wed, 05 Jul 2023 09:35:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGyv7-00009P-Oe; Wed, 05 Jul 2023 09:35:33 +0000
Received: by outflank-mailman (input) for mailman id 558894;
 Wed, 05 Jul 2023 09:35:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hy0b=CX=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qGyv6-0006bq-59
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 09:35:32 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48d8192e-1b17-11ee-b237-6b7b168915f2;
 Wed, 05 Jul 2023 11:35:31 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2b69dcf45faso105696701fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Jul 2023 02:35:31 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 q22-20020a2e84d6000000b002b6d8cfb6d2sm2910625ljh.140.2023.07.05.02.35.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 02:35:30 -0700 (PDT)
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
X-Inumbo-ID: 48d8192e-1b17-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688549731; x=1691141731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DSBg2xryTcGQSIhkiAk5XZ42VUodB1h52U56N4DUxBw=;
        b=haix9goqTFpeMCgdTNcgcuJZeX+0YMjDXLAQnkf1/sLdppJVDOj+/tcCGGpSE4G8EH
         vQPmx4Yyj5Bsq5d7NH26qdkt0k1KVHYKA+/Q/hxhwNJN3XTSoJPzvhtR0pCSQblTvC+f
         1Ef6o05MuYwmQWRhYVLbF9tIgQx6VW0Fq73Z14/bO+VN6XjhGqoUGGXlZ6KaPAAr3cpQ
         k8WrX1aPPmAX21Abp6bAZEhIbyGgH7I2Hxpc4jYlaITLXWSqvYRqT47RWAAfvSF6S9MX
         kC7r1DeLDmttUjKlKn7GAoGJhJp2uAtbqYay9Et9hYwQ8u2GQ+qmjJQR1w5Hn/WgMkkb
         9PMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688549731; x=1691141731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DSBg2xryTcGQSIhkiAk5XZ42VUodB1h52U56N4DUxBw=;
        b=dtw2enCkMov8bn/UlslcnBZKzXN3/H6sZZF/U9+YUNTSgnZ25Mbfq1OBjDATyX3937
         FInXpN3Ob9Sz4V3LjhPaVCrCzAPqyhFrkD3GHdi/sfbt9QtFWAF1iu5Drhoh4wzFSbBe
         ICGfRkjZq5lUrgSZmdvNixWojp3Wjlw3L6wgun+US8PUKzEbWH6L73RI0UtY1UJEdwuL
         SVibVdg6XVaibXGcmtYrF+pgnoJRt/L/LN1KX28ElK6yKpGWUvEl4X6U+ZJB67sY07zr
         z7rgNn102x3STTGM78ZbRIJ9UZsuEjpmCDneuvhdAxh1NKRlyOwYc86RuTAZTh9zlGPx
         GYqA==
X-Gm-Message-State: ABy/qLbKIGS6FK/+BuFMvkEVTsMD0i9C1rUd+OdNuPd5Uz93Uo+hBlkF
	qNNStUxWZGICdPSNA/qsYaNwo4esrSMXeXy7qFU=
X-Google-Smtp-Source: APBJJlGVz+GGr1BGYhTewNovKl6bOEcgQCxFMYm0WJ6fzZSavWHZSOqfa3zc0++sJavG17h6yVNjHw==
X-Received: by 2002:a2e:b0d2:0:b0:2b6:d9dd:f65f with SMTP id g18-20020a2eb0d2000000b002b6d9ddf65fmr8142941ljl.17.1688549730903;
        Wed, 05 Jul 2023 02:35:30 -0700 (PDT)
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
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [XEN PATCH v9 13/24] xen/arm: ffa: support mapping guest RX/TX buffers
Date: Wed,  5 Jul 2023 11:34:22 +0200
Message-Id: <20230705093433.2514898-14-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230705093433.2514898-1-jens.wiklander@linaro.org>
References: <20230705093433.2514898-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds support in the mediator to map and unmap the RX and TX buffers
provided by the guest using the two FF-A functions FFA_RXTX_MAP and
FFA_RXTX_UNMAP.

These buffer are later used to transmit data that cannot be passed in
registers only.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/tee/ffa.c | 138 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 138 insertions(+)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index d755363de686..ffabb5ed0a80 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -74,6 +74,12 @@
  */
 #define FFA_RXTX_PAGE_COUNT             1
 
+/*
+ * Limits the number of pages RX/TX buffers guests can map.
+ * TODO support a larger number.
+ */
+#define FFA_MAX_RXTX_PAGE_COUNT         1
+
 /*
  * Flags and field values used for the MSG_SEND_DIRECT_REQ/RESP:
  * BIT(31): Framework or partition message
@@ -169,6 +175,12 @@ struct ffa_partition_info_1_1 {
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
     /*
@@ -176,6 +188,7 @@ struct ffa_ctx {
      * ffa_domain_teardown() to know which SPs need to be signalled.
      */
     uint16_t create_signal_count;
+    bool rx_is_free;
 };
 
 /* Negotiated FF-A version to use with the SPMC */
@@ -371,6 +384,11 @@ static void set_regs(struct cpu_user_regs *regs, register_t v0, register_t v1,
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
@@ -392,6 +410,106 @@ static void handle_version(struct cpu_user_regs *regs)
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
+    if ( page_count > FFA_MAX_RXTX_PAGE_COUNT )
+    {
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
+    /* Only normal RW RAM for now */
+    if ( t != p2m_ram_rw )
+        goto err_put_tx_pg;
+
+    rx_pg = get_page_from_gfn(d, gfn_x(gaddr_to_gfn(rx_addr)), &t, P2M_ALLOC);
+    if ( !tx_pg )
+        goto err_put_tx_pg;
+    /* Only normal RW RAM for now */
+    if ( t != p2m_ram_rw )
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
+    ctx->rx_is_free = true;
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
+    ctx->rx_is_free = false;
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
@@ -448,6 +566,7 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
     uint32_t fid = get_user_reg(regs, 0);
     struct domain *d = current->domain;
     struct ffa_ctx *ctx = d->arch.tee;
+    int e;
 
     if ( !ctx )
         return false;
@@ -460,6 +579,22 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
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
@@ -551,6 +686,9 @@ static int ffa_domain_teardown(struct domain *d)
                    get_vm_id(d), subscr_vm_destroyed[n], res);
     }
 
+    if ( ctx->rx )
+        rxtx_unmap(ctx);
+
     XFREE(d->arch.tee);
 
     return 0;
-- 
2.34.1


