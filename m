Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B51B7695D8
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 14:15:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.572964.897170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQRoS-0004rM-QE; Mon, 31 Jul 2023 12:15:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 572964.897170; Mon, 31 Jul 2023 12:15:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQRoS-0004kt-K0; Mon, 31 Jul 2023 12:15:48 +0000
Received: by outflank-mailman (input) for mailman id 572964;
 Mon, 31 Jul 2023 12:15:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VuP2=DR=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qQRoR-0003r0-Jb
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 12:15:47 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fac2235b-2f9b-11ee-b255-6b7b168915f2;
 Mon, 31 Jul 2023 14:15:46 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4f4b2bc1565so6929750e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 31 Jul 2023 05:15:46 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 l10-20020ac2430a000000b004fbb1bc1ae0sm2028077lfh.163.2023.07.31.05.15.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 05:15:45 -0700 (PDT)
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
X-Inumbo-ID: fac2235b-2f9b-11ee-b255-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690805746; x=1691410546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLAbTbD8REc4gEPXiOhZft6RS/Ams+Y0BUWbmBkKJ7M=;
        b=fnS8900MhsUzDHFIdPTo0VDqH6gyfxILEzrnfE7raqj0J8sxPLOgnXdm9Ly4f5oJG6
         kRbVDiJmxnETDJEWVdZCzy6Qrp3NpW4fw5hb76V75gpnityqLfWvf+K0+W5YU9qPg5eo
         7cI9r2WnWMsFsIH5ZMS9m5ddwMpNKIR7S/ksdkhKBWmsB9FiRxMZH0oj0o+SlaGUKLv3
         oNlyvaxCnvqZ4kztqaYpCX3T5NzjXjWGBlYBGD4HWjiYMvDzOG/fsMLF4ZH3HlkRzNe+
         XddORfZrJeHBGl1KhYH5kYImRWMWW6ElH7FoMzyA7FvgKtjekU3DU3e2B+QuHkrAJN3P
         CB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690805746; x=1691410546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wLAbTbD8REc4gEPXiOhZft6RS/Ams+Y0BUWbmBkKJ7M=;
        b=aiDZUDE5BVNh+DRXfIGuJ2Kuo6MZ9Q64gkAfjDg58+YaVzs4773XPxd+wXVlikiaOZ
         UY261cnMphEyLsunIY6MmHm2JdSCpfy9ZLKiHRO14eMhu4HzCRohqL9X6dqu4C89ehty
         zzHB5RUkrxnNxfYxG6ltqJNmba2FxB0kYoys4wcRgNJbyKVUyxnLFgF3lPuAapV3lPzO
         FMkm7VVzVw/9kWla87/Q57HHYHewbNGLjJuHbe2hDNalT3/3zPU6E4PfVvPF2wQhtnS0
         WzDr5YAAsnwFEiVn0bYvA7pdApD3mFI6PVbKkMp6dzxDBt9tJ7PjxbKvEyK4V+sQ9ypV
         EnZA==
X-Gm-Message-State: ABy/qLZGuXcENqFketbT5sfOjWmerIvN9kzvdnd9Y3rhJhs+ZxHZy1Wf
	JnOSdLzZP9f4w6CQdlema4dXNEgV6hiXG6CDDzk=
X-Google-Smtp-Source: APBJJlGsytHD8uI0JreHbyjyk9r34ALyu+st1rnZRjElyXSmYAMHntSDhxHYpVPlROJC/u4uvNkmpw==
X-Received: by 2002:a05:6512:1c3:b0:4f4:d071:be48 with SMTP id f3-20020a05651201c300b004f4d071be48mr5424879lfp.14.1690805745979;
        Mon, 31 Jul 2023 05:15:45 -0700 (PDT)
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
Subject: [XEN PATCH v11 04/14] xen/arm: ffa: support mapping guest RX/TX buffers
Date: Mon, 31 Jul 2023 14:15:26 +0200
Message-Id: <20230731121536.934239-5-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230731121536.934239-1-jens.wiklander@linaro.org>
References: <20230731121536.934239-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds support in the mediator to map and unmap the RX and TX buffers
provided by the guest using the two FF-A functions FFA_RXTX_MAP and
FFA_RXTX_UNMAP.

These buffer are later used to transmit data that cannot be passed in
registers only.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
v10->v11
- Fixing a typo in a comment and adding a couple of newlines as requested
---
 xen/arch/arm/tee/ffa.c | 140 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 140 insertions(+)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 5af3e5eedc88..6c76c9885774 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -74,6 +74,12 @@
  */
 #define FFA_RXTX_PAGE_COUNT             1
 
+/*
+ * Limit the number of pages RX/TX buffers guests can map.
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
@@ -392,6 +410,108 @@ static void handle_version(struct cpu_user_regs *regs)
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
+
+    /* Only normal RW RAM for now */
+    if ( t != p2m_ram_rw )
+        goto err_put_tx_pg;
+
+    rx_pg = get_page_from_gfn(d, gfn_x(gaddr_to_gfn(rx_addr)), &t, P2M_ALLOC);
+    if ( !tx_pg )
+        goto err_put_tx_pg;
+
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
@@ -448,6 +568,7 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
     uint32_t fid = get_user_reg(regs, 0);
     struct domain *d = current->domain;
     struct ffa_ctx *ctx = d->arch.tee;
+    int e;
 
     if ( !ctx )
         return false;
@@ -460,6 +581,22 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
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
@@ -554,6 +691,9 @@ static int ffa_domain_teardown(struct domain *d)
                    get_vm_id(d), subscr_vm_destroyed[n], res);
     }
 
+    if ( ctx->rx )
+        rxtx_unmap(ctx);
+
     XFREE(d->arch.tee);
 
     return 0;
-- 
2.34.1


