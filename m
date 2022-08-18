Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9136C5981C7
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 12:56:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389438.626408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOdCJ-00062G-Ne; Thu, 18 Aug 2022 10:56:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389438.626408; Thu, 18 Aug 2022 10:56:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOdCJ-0005zA-Ia; Thu, 18 Aug 2022 10:56:23 +0000
Received: by outflank-mailman (input) for mailman id 389438;
 Thu, 18 Aug 2022 10:56:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=avir=YW=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1oOdCG-0003wI-S1
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 10:56:20 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6421fb85-1ee4-11ed-9250-1f966e50362f;
 Thu, 18 Aug 2022 12:56:20 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id by6so1327877ljb.11
 for <xen-devel@lists.xenproject.org>; Thu, 18 Aug 2022 03:56:20 -0700 (PDT)
Received: from jade.urgonet (h-79-136-84-253.A175.priv.bahnhof.se.
 [79.136.84.253]) by smtp.gmail.com with ESMTPSA id
 y27-20020a0565123f1b00b0048a85334a11sm176837lfa.143.2022.08.18.03.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 03:56:18 -0700 (PDT)
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
X-Inumbo-ID: 6421fb85-1ee4-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=lDuRX+SstIf75iFFLa/jm8bkDViMNpwMKk2fFzsI/eE=;
        b=ZowgXl6oYija/3iM3rBeTy+wNeNyiFRfjsjqyTzaUbEKElWYWkHxNTe5tlt4/cYdUm
         LSBfmzS8A6+OwcqjVnL/0oXAdvz7Iu7zJIdl0uy2+badTjLfGvmACeEWXMOHxtBxQx30
         1mm1R6mPO3W/WT2rB/DOre7wqEdaike2TkPzAJCw4DNqH5Xu1QaDb3PC0FBZOkwoaKqK
         M//SrD6ObWc5LvUDNW5y6fwMugyXIJgaJcI1PPQRIv6X91Lqc/HrXciPjPtfBgdj33Dy
         DvxBCo8Ap1d6FpRielgtMquVriW+UT3AdIDOO2PoVWgo7hG4kXYKPhbOidNuqFQt0rKZ
         65cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=lDuRX+SstIf75iFFLa/jm8bkDViMNpwMKk2fFzsI/eE=;
        b=3hX05aAB7WMTCRJAeaUV3ZIoGFVlCrVwXkTW7hzHV9ZLQ3PkqjljKoD661Bszzzd2y
         QWQ+d1DXboszd6+00OO2TbNuNHyw1QIUKNNi3UMmj3qR+/UKpZNw/NeeUKGVlTompPB0
         b1GVjdT5QYlHC3NVMREXnggXMfuox4FOAZyw/gM8WlrXnYIx0QiX95HPaaLXUHjuR1f8
         XJ7ks2tc3imibWjRBexJYUg9Z1Fv1yURF+ckr1R+SL7hP9x/01+m4it/sndBULhl/Fci
         N1Czi7zPFX1h+olDHMIaAN4zSdMqb979nKZWgqUWsjjaSmzDpeigMXm5BBo0erQ++TeJ
         3nbw==
X-Gm-Message-State: ACgBeo38PdFeUtWZbG85mOa/rJUWORYXOPQYOUR/My7dkeCHZ067XIh8
	KtpXysyExmQxi0//NFYYAqJ8zsC33idV4w==
X-Google-Smtp-Source: AA6agR5mcqhU7mwDk0sLS8XPepcQpOQ4NqaWy6tlhea5wb3A1e5eRj9IuDHbO2f41x8l5zSpaHg7CA==
X-Received: by 2002:a2e:b8ce:0:b0:261:ada1:d803 with SMTP id s14-20020a2eb8ce000000b00261ada1d803mr684504ljp.143.1660820179382;
        Thu, 18 Aug 2022 03:56:19 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand.Marquis@arm.com,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v5 7/9] xen/arm: ffa: support mapping guest RX/TX buffers
Date: Thu, 18 Aug 2022 12:55:59 +0200
Message-Id: <20220818105601.1896082-8-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220818105601.1896082-1-jens.wiklander@linaro.org>
References: <20220818105601.1896082-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds support in the mediator to map and unmap the RX and TX buffers
provided by the guest using the two FF-A functions FFA_RXTX_MAP and
FFA_RXTX_UNMAP.

These buffer are later used to to transmit data that cannot be passed in
registers only.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/ffa.c | 127 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 127 insertions(+)

diff --git a/xen/arch/arm/ffa.c b/xen/arch/arm/ffa.c
index a829379ad176..5e7211f0b4f6 100644
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
 static uint32_t ffa_version __read_mostly;
 
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
@@ -556,6 +680,9 @@ int ffa_relinquish_resources(struct domain *d)
                    get_vm_id(d), subscr_vm_destroyed[n], res);
     }
 
+    if ( ctx->rx )
+        rxtx_unmap(ctx);
+
     XFREE(d->arch.ffa);
 
     return 0;
-- 
2.31.1


