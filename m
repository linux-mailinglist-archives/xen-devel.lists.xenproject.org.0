Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C23FA755CA9
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 09:22:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564187.881572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLIY7-00008U-3W; Mon, 17 Jul 2023 07:21:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564187.881572; Mon, 17 Jul 2023 07:21:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLIY6-0008Sx-PY; Mon, 17 Jul 2023 07:21:38 +0000
Received: by outflank-mailman (input) for mailman id 564187;
 Mon, 17 Jul 2023 07:21:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xV9D=DD=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qLIY4-0005A3-EQ
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 07:21:36 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90301a22-2472-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 09:21:35 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4fba74870abso6463266e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jul 2023 00:21:35 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 l10-20020ac24a8a000000b004f846cd74bcsm2658938lfp.245.2023.07.17.00.21.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 00:21:34 -0700 (PDT)
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
X-Inumbo-ID: 90301a22-2472-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689578495; x=1692170495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DSBg2xryTcGQSIhkiAk5XZ42VUodB1h52U56N4DUxBw=;
        b=WEFo1xCrhPIKQl/EoWN2EbA7RUYk7dZ4eYCvPCFWGH69YNSbobCMAA7B42TzjVfhgo
         tiikNHzgRqPvJBG2OQIDwjlK6qw1XO9x0J5XDZdsiL0pPgP0so653MtX33/Jx2vKSUKJ
         OtikNc0q727N2Wgh5mXEsHQ3z15KErB07GIFBiGCaJ7zvNOqPlZgU4sIy9t2g2oGXmnf
         kwBBsiyssr7uYoscrtJPb1efZ0pon0aBuI5Dguqe8U8Ctt2cTlCxE+WHCL1QHz+0u/uf
         thEkVixZ1uPyfDRHZUO2ng17bfAqiq5OXuKBzaooqdxQXwd4495s/CCOzrbLOSYrgco0
         sr0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689578495; x=1692170495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DSBg2xryTcGQSIhkiAk5XZ42VUodB1h52U56N4DUxBw=;
        b=J6b78hU/2uJzBeZLQoKfNL2GaxXSy4SgndaIGqSnPVOmzx/KolnCgpGEKf+R96fCzJ
         j1Kt9Z3U1USsYvtoUQxsGEkkAQQkwG7gj0ZZ+WnlpnAC84id6bpXxy3UDSoKOXDy9FdU
         TteL4NENszWguHp3JARRpjS8hk5ha67CBW2MWcMkYiIj3t6Vr35EXy+8pmwPoiGqLDyQ
         5mz+0IbLAmNRhkNpcb2EfRPqltxrrxY1XBV2oG351k0PWABZOIfRjHYz+nfwhyaF49io
         JzlhHecnGIUsmB2lfU2LnyfwNmg1e4e6zTYZwQsJsQ5GKDsEnfEV6rbyfgIlaLoTjfoW
         O0jg==
X-Gm-Message-State: ABy/qLZfeZGNjLadHUy10XY9qBWCcy9mMXhok818etxIW7Ig5OqSEgK1
	aJvEU87BjxC3UC5rO5r3pzVWqj954CEe2VeQr08=
X-Google-Smtp-Source: APBJJlHKkTI0NKp536H6xxNI0RfMjn8kGf9vtAkpc1gGkhzDksM/T2J3y7/xbL7evFjx3DbrXyn7Qg==
X-Received: by 2002:ac2:51ae:0:b0:4f9:607a:6508 with SMTP id f14-20020ac251ae000000b004f9607a6508mr6829078lfk.50.1689578494987;
        Mon, 17 Jul 2023 00:21:34 -0700 (PDT)
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
Subject: [XEN PATCH v10 13/24] xen/arm: ffa: support mapping guest RX/TX buffers
Date: Mon, 17 Jul 2023 09:20:56 +0200
Message-Id: <20230717072107.753304-14-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230717072107.753304-1-jens.wiklander@linaro.org>
References: <20230717072107.753304-1-jens.wiklander@linaro.org>
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


