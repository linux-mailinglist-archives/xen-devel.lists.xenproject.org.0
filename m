Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BF95BC519
	for <lists+xen-devel@lfdr.de>; Mon, 19 Sep 2022 11:13:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408580.651393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaCpk-0000Yz-S9; Mon, 19 Sep 2022 09:12:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408580.651393; Mon, 19 Sep 2022 09:12:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaCpk-0000Va-Nh; Mon, 19 Sep 2022 09:12:56 +0000
Received: by outflank-mailman (input) for mailman id 408580;
 Mon, 19 Sep 2022 09:12:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3sJ0=ZW=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1oaCpi-0007S6-DQ
 for xen-devel@lists.xenproject.org; Mon, 19 Sep 2022 09:12:54 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3dff489f-37fb-11ed-9647-05401a9f4f97;
 Mon, 19 Sep 2022 11:12:53 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id f14so44929945lfg.5
 for <xen-devel@lists.xenproject.org>; Mon, 19 Sep 2022 02:12:53 -0700 (PDT)
Received: from jade.urgonet (h-79-136-84-253.A175.priv.bahnhof.se.
 [79.136.84.253]) by smtp.gmail.com with ESMTPSA id
 f3-20020a05651c02c300b0025fdf1af42asm4815394ljo.78.2022.09.19.02.12.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 02:12:52 -0700 (PDT)
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
X-Inumbo-ID: 3dff489f-37fb-11ed-9647-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=d/lfQmPa7aVwv3c0xxQhp+oc8I6qS6gZxD1dn3anQyY=;
        b=BOKWfiyggmTLWBl+TwAnuXcPiTGAnmUlypFRpm20Ks3avTq3GIUt3jXtkumA3qadmn
         syTSWRuh3WezxtiDzUFx/BbEnP1LvNalmO+Bu5ZdLv5LkCrGJz5yRHev2Ji1DqY+j0dL
         bYqHTvHOEGcfNmMUhR1srZA9Mw6bkWXE4PklQ2iXfyCsalX/MJefSStFkZXeweuC8J70
         PD8ELb5Z5tC3ytBk5OsvcQwt8XnTNiG4v0vqFvO/GkVhP+9rwqebykSxZ1Ua5E8+Kt6Y
         4xo8GMJDWj9gnqF94CCgUH9HWs+yYlN6mbT/gOefypu+YxqSXndyncE2qMGcipQdiQkL
         J74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=d/lfQmPa7aVwv3c0xxQhp+oc8I6qS6gZxD1dn3anQyY=;
        b=EheXvRw6NKXIWDL9zGYnOmESvdgdHFFC+k+P0qQ60tqOMkUwJVaApMN4Gn+VtDxGM4
         ZBjBuCwARRWpSwmW4WSeMexbJa6J/VBPqpo7PIJjGiV4aBIZOn0bY0SbS2hZys0sI06k
         jNNvOrmzqtC3VAzRSZv7+J1i+u06klTQUX8MVAU90WLNI4AA3HaBhJCEaaiV4VdlnJMU
         GZ1vndzcGiF4OASm5TLlpfE1s31SzxCrFLxX08c8cE6oad/gjSEqKj1t1X99nAswq1Kh
         v5nEwbVfpCTJtvgDoLMDjiuGUGcYDQ80pAG2PkG0rlvhbi0GT7EY2QiPo2UigBHDB95H
         fezw==
X-Gm-Message-State: ACrzQf0CHUAYL2SAu0Ux1Vzq2Q6LiEp/OrNUKZYeDRjtoArW04oRO5KT
	/iURMvmYh4LQOz0Jf8xEADgje23hi9Al5KKf
X-Google-Smtp-Source: AMsMyM6aF0Ag3BpGisebgyaixDUAp747EzlUvzOJAhp3V8Gy2jIps3yZP6qB0MT44RnehoMwoK30VQ==
X-Received: by 2002:a05:6512:3d25:b0:49a:d2a0:7208 with SMTP id d37-20020a0565123d2500b0049ad2a07208mr5834398lfv.82.1663578772807;
        Mon, 19 Sep 2022 02:12:52 -0700 (PDT)
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
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v6 6/9] xen/arm: ffa: support mapping guest RX/TX buffers
Date: Mon, 19 Sep 2022 11:12:35 +0200
Message-Id: <20220919091238.2068052-7-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220919091238.2068052-1-jens.wiklander@linaro.org>
References: <20220919091238.2068052-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds support in the mediator to map and unmap the RX and TX buffers
provided by the guest using the two FF-A functions FFA_RXTX_MAP and
FFA_RXTX_UNMAP.

These buffer are later used to to transmit data that cannot be passed in
registers only.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/ffa.c | 131 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 129 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/ffa.c b/xen/arch/arm/ffa.c
index 1e94113b20bd..60157a696a9a 100644
--- a/xen/arch/arm/ffa.c
+++ b/xen/arch/arm/ffa.c
@@ -196,10 +196,17 @@ struct ffa_partition_info_1_1 {
 };
 
 struct ffa_ctx {
+    void *rx;
+    const void *tx;
+    struct page_info *rx_pg;
+    struct page_info *tx_pg;
+    unsigned int page_count;
     uint32_t guest_vers;
+    bool tx_is_mine;
     bool interrupted;
 };
 
+
 /* Negotiated FF-A version to use with the SPMC */
 static uint32_t ffa_version __ro_after_init;
 
@@ -384,6 +391,11 @@ static void set_regs(struct cpu_user_regs *regs, register_t v0, register_t v1,
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
@@ -405,6 +417,99 @@ static void handle_version(struct cpu_user_regs *regs)
     set_regs(regs, vers, 0, 0, 0, 0, 0, 0, 0);
 }
 
+static uint32_t handle_rxtx_map(uint32_t fid, register_t tx_addr,
+                                register_t rx_addr, uint32_t page_count)
+{
+    uint32_t ret = FFA_RET_INVALID_PARAMETERS;
+    struct domain *d = current->domain;
+    struct ffa_ctx *ctx = d->arch.ffa;
+    struct page_info *tx_pg;
+    struct page_info *rx_pg;
+    p2m_type_t t;
+    void *rx;
+    void *tx;
+
+    if ( !smccc_is_conv_64(fid) )
+    {
+        tx_addr &= UINT32_MAX;
+        rx_addr &= UINT32_MAX;
+    }
+
+    /* For now to keep things simple, only deal with a single page */
+    if ( page_count != 1 )
+        return FFA_RET_NOT_SUPPORTED;
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
+    ctx->page_count = 1;
+    ctx->tx_is_mine = true;
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
+    ctx->tx_is_mine = false;
+}
+
+static uint32_t handle_rxtx_unmap(void)
+{
+    struct domain *d = current->domain;
+    struct ffa_ctx *ctx = d->arch.ffa;
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
@@ -469,6 +574,7 @@ bool ffa_handle_call(struct cpu_user_regs *regs, uint32_t fid)
 {
     struct domain *d = current->domain;
     struct ffa_ctx *ctx = d->arch.ffa;
+    int e;
 
     if ( !ctx )
         return false;
@@ -481,6 +587,24 @@ bool ffa_handle_call(struct cpu_user_regs *regs, uint32_t fid)
     case FFA_ID_GET:
         set_regs_success(regs, get_vm_id(d), 0);
         return true;
+    case FFA_RXTX_MAP_32:
+#ifdef CONFIG_ARM_64
+    case FFA_RXTX_MAP_64:
+#endif
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
 #ifdef CONFIG_ARM_64
     case FFA_MSG_SEND_DIRECT_REQ_64:
@@ -501,8 +625,8 @@ uint32_t ffa_get_call_count(void)
     if ( IS_ENABLED(CONFIG_FFA) )
     {
         if ( IS_ENABLED(CONFIG_ARM_64) )
-            count += 1;
-        count += 3;
+            count += 2;
+        count += 5;
     }
 
     return count;
@@ -571,6 +695,9 @@ void ffa_domain_destroy(struct domain *d)
                    get_vm_id(d), subscr_vm_destroyed[n], res);
     }
 
+    if ( ctx->rx )
+        rxtx_unmap(ctx);
+
     XFREE(d->arch.ffa);
 }
 
-- 
2.31.1


