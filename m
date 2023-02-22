Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F2169F81C
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 16:34:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499550.770828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUr8H-0004DR-7m; Wed, 22 Feb 2023 15:34:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499550.770828; Wed, 22 Feb 2023 15:34:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUr8G-0003yw-1G; Wed, 22 Feb 2023 15:34:12 +0000
Received: by outflank-mailman (input) for mailman id 499550;
 Wed, 22 Feb 2023 15:34:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvgA=6S=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pUr8A-0001MC-9x
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 15:34:06 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57258fdd-b2c6-11ed-a089-e9535cc0f9c3;
 Wed, 22 Feb 2023 16:34:05 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id w27so10583569lfu.4
 for <xen-devel@lists.xenproject.org>; Wed, 22 Feb 2023 07:34:05 -0800 (PST)
Received: from localhost.localdomain (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 q9-20020ac25289000000b004db0d26adb4sm927746lfm.182.2023.02.22.07.34.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 07:34:04 -0800 (PST)
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
X-Inumbo-ID: 57258fdd-b2c6-11ed-a089-e9535cc0f9c3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cS+8KCwx/w81eQ/g9wS82HyI0n3UdnJ7LzOtx2RTVL8=;
        b=bQvRcXo07xFoAPdUYDd6yJX5vesisEukCPpmrxVmhT5GYEb4VzZiKujwBo2PHqc2uV
         JX449HIVFh15Qxxwp+FWhevN8Upr/P2WSy2pdrNHk24uxHZYopBxI98GvEzKj2gt7fX7
         5BkfawNB8ZFuZ2/GZqDM0EN4YN+A7f4ghRgl8aEGpT2PMe+ZoAq2XwfkcezRQwK8BR4N
         eeIE+0Akk5LL0/uQsS2xyJUdkVjJsgHgT4uoiCwYk9S8ysOHDtZ1CRZWN04FytCGTIv3
         /p1SyNNGxi+PxgjySWCokiR7CPvOVXUdsY9We+QB2fwohK/qEEj8I34bgTRmk44Aqeo0
         YCnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cS+8KCwx/w81eQ/g9wS82HyI0n3UdnJ7LzOtx2RTVL8=;
        b=fQcWCiOB5c3dhgxqOWo8W9XUkVSYxJyiSftCdwJCLMUkRNg75Q9eEI2Ck8aXURv9xx
         TZsSBj2HPrZ85bazRMQXrXM9e4QhsrjUxJWwHcOkKafR4UrTT4lXE2FBr9bAyj7wH2kc
         Knv+X9czY3hMSNP/3ABiV/Of2Pr98qog1OtcBShkre1nX4REuFldrbKeURCq+0Hn65Bv
         5m2IU0gSANicwQefp7YdFfMZENd7/nMC3sSkJhFjQdSfMbuT1F1SQuJseYvTPzbiAjNh
         /Dl+vN4/BacWdkOkOy9t9zfnlonOyAgALgg/NJOhrP4O97bihNW8hW58MrkJcpt60+c3
         xbvw==
X-Gm-Message-State: AO0yUKUoU75Jypkf01egxfLM/M2oNanqRiHbIpXeFuIB1819t4WfU5Ey
	8UD3tlyOBbrov1yyMdQ8jbLF+ZbIx5X+pnsXrGk=
X-Google-Smtp-Source: AK7set+s2js1Y9IyBYq/3+57C2Q5sWOQATXUGDSMOT3Gxj/f5u8Icwuc5V/KVEXvPSOj1xaGwIG+iQ==
X-Received: by 2002:ac2:5615:0:b0:4d8:6540:a731 with SMTP id v21-20020ac25615000000b004d86540a731mr2937063lfd.47.1677080044956;
        Wed, 22 Feb 2023 07:34:04 -0800 (PST)
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
Subject: [XEN PATCH v7 13/20] xen/arm: ffa: support mapping guest RX/TX buffers
Date: Wed, 22 Feb 2023 16:33:10 +0100
Message-Id: <be5a37c0ec23bf8119f5cb68ec58d8cca16d9812.1677079672.git.jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677079671.git.jens.wiklander@linaro.org>
References: <cover.1677079671.git.jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds support in the mediator to map and unmap the RX and TX buffers
provided by the guest using the two FF-A functions FFA_RXTX_MAP and
FFA_RXTX_UNMAP.

These buffer are later used to to transmit data that cannot be passed in
registers only.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/tee/ffa.c | 127 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 127 insertions(+)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index f1b014b6c7f4..953b6dfd5eca 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -149,10 +149,17 @@ struct ffa_partition_info_1_1 {
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
 
@@ -337,6 +344,11 @@ static void set_regs(struct cpu_user_regs *regs, register_t v0, register_t v1,
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
@@ -358,6 +370,99 @@ static void handle_version(struct cpu_user_regs *regs)
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
@@ -423,6 +528,7 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
     uint32_t fid = get_user_reg(regs, 0);
     struct domain *d = current->domain;
     struct ffa_ctx *ctx = d->arch.tee;
+    int e;
 
     if ( !ctx )
         return false;
@@ -435,6 +541,24 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
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
@@ -515,6 +639,9 @@ static int ffa_relinquish_resources(struct domain *d)
                    get_vm_id(d), subscr_vm_destroyed[n], res);
     }
 
+    if ( ctx->rx )
+        rxtx_unmap(ctx);
+
     XFREE(d->arch.tee);
 
     return 0;
-- 
2.34.1


