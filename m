Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3029889871
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 10:39:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697650.1088638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rognW-00024e-Nk; Mon, 25 Mar 2024 09:39:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697650.1088638; Mon, 25 Mar 2024 09:39:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rognW-00020j-IH; Mon, 25 Mar 2024 09:39:18 +0000
Received: by outflank-mailman (input) for mailman id 697650;
 Mon, 25 Mar 2024 09:39:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lWJZ=K7=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1rognU-000193-9Z
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 09:39:16 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b2f9576-ea8b-11ee-afe3-a90da7624cb6;
 Mon, 25 Mar 2024 10:39:15 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a4715991c32so482271366b.1
 for <xen-devel@lists.xenproject.org>; Mon, 25 Mar 2024 02:39:15 -0700 (PDT)
Received: from rayden.urgonet (h-217-31-164-171.A175.priv.bahnhof.se.
 [217.31.164.171]) by smtp.gmail.com with ESMTPSA id
 bw26-20020a170906c1da00b00a4650ec48d0sm2891067ejb.140.2024.03.25.02.39.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 02:39:14 -0700 (PDT)
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
X-Inumbo-ID: 8b2f9576-ea8b-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711359555; x=1711964355; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ktHTOHPhZw2ERZCbIiZrCqqyY587Z370raI9TG92v+s=;
        b=yEP6T+18eaYVZdoALuo/IDevPszFdavJnEEp7t4W8RHG+A4C4+8Bs/JM1zrQg/kxpp
         3h2vGVGEA9qAyt/laghm1HGnuvUzgwYbReiofyEq/t2BdnX8WhkEBCMwYyxj8GaFgM7u
         G4FwFh1QiLCG5d6+KpPOnKFLBq/uhejPrFyK9VNF3RVRokgAWjVOgRIq+RaprxRiWZJs
         3ZUyVm1w3IJO0g4ZbhBHXd5rGl/Tgnb6s/R0MOHBC9IcQc1WMxZuYwlvS+bP39XS7a0c
         +p2qrdK1uFtveO9VUcH3UTNTVrMo01V6qYs+I22JZEPjSRKjKHec2Y/SmjlBsSPAcYj5
         55CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711359555; x=1711964355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ktHTOHPhZw2ERZCbIiZrCqqyY587Z370raI9TG92v+s=;
        b=W1fIUGrAa1FKVTfbO0b+u44NBiK/+vO6dX1f9DYV0Dn+VPD8IHtd0F5ay2pwsd2YBY
         BU3n4zdhq8yuX712k53iRinEq7jY7rwLP063EDm3WBDuKIz1k76A0SMQm+sZ0TJc0mbP
         8t1ES+SNTkMFhsTBvH1Iy7ZvcO/qbGHnMtwS6iiB6AMy5WOifdH0JP+eQ0GujuIBLJWA
         a7bgURZ9vgntMyGoAtbHipC4dku3Em4zew8a6gxU34puH9a+XC2UOdEdbEiIoegsuBv2
         kjeQeM/4DobNp48kX4qx5Fq3BH8qyem9vbctZf5On5TncHBb+Wj33IXipAWoss/YsNWU
         9WQQ==
X-Gm-Message-State: AOJu0YwL5XtV917M9EU84MSMIcYv/AeEPUm6G6wtsDWQEV+4JVlVMxx7
	F7Q31satr+l41FV3tfwJMbcwV/0flug1xG5wgmzdZd9T7LlBwex6NLegUdtYBxmi+Hz9a0lM07S
	X
X-Google-Smtp-Source: AGHT+IEOGVY6EyKr+I/yJdd39jUyvRqBVgESrP7PFiLL/4YlDZRoDQR0ajVYjp5mXVwH3HmNwSEKUw==
X-Received: by 2002:a17:907:944f:b0:a49:56d4:d643 with SMTP id dl15-20020a170907944f00b00a4956d4d643mr2186112ejc.36.1711359554661;
        Mon, 25 Mar 2024 02:39:14 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: patches@linaro.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [XEN PATCH 5/6] xen/arm: ffa: separate rxtx buffer routines
Date: Mon, 25 Mar 2024 10:39:03 +0100
Message-Id: <20240325093904.3466092-6-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240325093904.3466092-1-jens.wiklander@linaro.org>
References: <20240325093904.3466092-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move rxtx buffer routines into a spearate file for easier navigation in
the source code.

Add ffa_rxtx_init(), ffa_rxtx_destroy(), and ffa_rxtx_domain_destroy() to
handle the ffa_rxtx internal things on initialization and teardown.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/tee/Makefile      |   1 +
 xen/arch/arm/tee/ffa.c         | 174 +-------------------------
 xen/arch/arm/tee/ffa_private.h |   7 ++
 xen/arch/arm/tee/ffa_rxtx.c    | 216 +++++++++++++++++++++++++++++++++
 4 files changed, 229 insertions(+), 169 deletions(-)
 create mode 100644 xen/arch/arm/tee/ffa_rxtx.c

diff --git a/xen/arch/arm/tee/Makefile b/xen/arch/arm/tee/Makefile
index be644fba8055..f0112a2f922d 100644
--- a/xen/arch/arm/tee/Makefile
+++ b/xen/arch/arm/tee/Makefile
@@ -1,5 +1,6 @@
 obj-$(CONFIG_FFA) += ffa.o
 obj-$(CONFIG_FFA) += ffa_shm.o
 obj-$(CONFIG_FFA) += ffa_partinfo.o
+obj-$(CONFIG_FFA) += ffa_rxtx.o
 obj-y += tee.o
 obj-$(CONFIG_OPTEE) += optee.o
diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 7a2803881420..4f7775b8c890 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -65,26 +65,6 @@
 
 #include "ffa_private.h"
 
-/*
- * Structs below ending with _1_0 are defined in FF-A-1.0-REL and
- * structs ending with _1_1 are defined in FF-A-1.1-REL0.
- */
-
-/* Endpoint RX/TX descriptor */
-struct ffa_endpoint_rxtx_descriptor_1_0 {
-    uint16_t sender_id;
-    uint16_t reserved;
-    uint32_t rx_range_count;
-    uint32_t tx_range_count;
-};
-
-struct ffa_endpoint_rxtx_descriptor_1_1 {
-    uint16_t sender_id;
-    uint16_t reserved;
-    uint32_t rx_region_offs;
-    uint32_t tx_region_offs;
-};
-
 /* Negotiated FF-A version to use with the SPMC */
 static uint32_t __ro_after_init ffa_version;
 
@@ -145,12 +125,6 @@ static bool check_mandatory_feature(uint32_t id)
     return !ret;
 }
 
-static int32_t ffa_rxtx_map(paddr_t tx_addr, paddr_t rx_addr,
-                            uint32_t page_count)
-{
-    return ffa_simple_call(FFA_RXTX_MAP_64, tx_addr, rx_addr, page_count, 0);
-}
-
 static void handle_version(struct cpu_user_regs *regs)
 {
     struct domain *d = current->domain;
@@ -166,127 +140,6 @@ static void handle_version(struct cpu_user_regs *regs)
     ffa_set_regs(regs, vers, 0, 0, 0, 0, 0, 0, 0);
 }
 
-static uint32_t ffa_handle_rxtx_map(uint32_t fid, register_t tx_addr,
-				    register_t rx_addr, uint32_t page_count)
-{
-    uint32_t ret = FFA_RET_INVALID_PARAMETERS;
-    struct domain *d = current->domain;
-    struct ffa_ctx *ctx = d->arch.tee;
-    struct page_info *tx_pg;
-    struct page_info *rx_pg;
-    p2m_type_t t;
-    void *rx;
-    void *tx;
-
-    if ( !smccc_is_conv_64(fid) )
-    {
-        /*
-         * Calls using the 32-bit calling convention must ignore the upper
-         * 32 bits in the argument registers.
-         */
-        tx_addr &= UINT32_MAX;
-        rx_addr &= UINT32_MAX;
-    }
-
-    if ( page_count > FFA_MAX_RXTX_PAGE_COUNT )
-    {
-        printk(XENLOG_ERR "ffa: RXTX_MAP: error: %u pages requested (limit %u)\n",
-               page_count, FFA_MAX_RXTX_PAGE_COUNT);
-        return FFA_RET_INVALID_PARAMETERS;
-    }
-
-    /* Already mapped */
-    if ( ctx->rx )
-        return FFA_RET_DENIED;
-
-    tx_pg = get_page_from_gfn(d, gfn_x(gaddr_to_gfn(tx_addr)), &t, P2M_ALLOC);
-    if ( !tx_pg )
-        return FFA_RET_INVALID_PARAMETERS;
-
-    /* Only normal RW RAM for now */
-    if ( t != p2m_ram_rw )
-        goto err_put_tx_pg;
-
-    rx_pg = get_page_from_gfn(d, gfn_x(gaddr_to_gfn(rx_addr)), &t, P2M_ALLOC);
-    if ( !tx_pg )
-        goto err_put_tx_pg;
-
-    /* Only normal RW RAM for now */
-    if ( t != p2m_ram_rw )
-        goto err_put_rx_pg;
-
-    tx = __map_domain_page_global(tx_pg);
-    if ( !tx )
-        goto err_put_rx_pg;
-
-    rx = __map_domain_page_global(rx_pg);
-    if ( !rx )
-        goto err_unmap_tx;
-
-    ctx->rx = rx;
-    ctx->tx = tx;
-    ctx->rx_pg = rx_pg;
-    ctx->tx_pg = tx_pg;
-    ctx->page_count = page_count;
-    ctx->rx_is_free = true;
-    return FFA_RET_OK;
-
-err_unmap_tx:
-    unmap_domain_page_global(tx);
-err_put_rx_pg:
-    put_page(rx_pg);
-err_put_tx_pg:
-    put_page(tx_pg);
-
-    return ret;
-}
-
-static void rxtx_unmap(struct ffa_ctx *ctx)
-{
-    unmap_domain_page_global(ctx->rx);
-    unmap_domain_page_global(ctx->tx);
-    put_page(ctx->rx_pg);
-    put_page(ctx->tx_pg);
-    ctx->rx = NULL;
-    ctx->tx = NULL;
-    ctx->rx_pg = NULL;
-    ctx->tx_pg = NULL;
-    ctx->page_count = 0;
-    ctx->rx_is_free = false;
-}
-
-static uint32_t ffa_handle_rxtx_unmap(void)
-{
-    struct domain *d = current->domain;
-    struct ffa_ctx *ctx = d->arch.tee;
-
-    if ( !ctx->rx )
-        return FFA_RET_INVALID_PARAMETERS;
-
-    rxtx_unmap(ctx);
-
-    return FFA_RET_OK;
-}
-
-static int32_t ffa_handle_rx_release(void)
-{
-    int32_t ret = FFA_RET_DENIED;
-    struct domain *d = current->domain;
-    struct ffa_ctx *ctx = d->arch.tee;
-
-    if ( !spin_trylock(&ctx->rx_lock) )
-        return FFA_RET_BUSY;
-
-    if ( !ctx->page_count || ctx->rx_is_free )
-        goto out;
-    ret = FFA_RET_OK;
-    ctx->rx_is_free = true;
-out:
-    spin_unlock(&ctx->rx_lock);
-
-    return ret;
-}
-
 static void handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32_t fid)
 {
     struct arm_smccc_1_2_regs arg = { .a0 = fid, };
@@ -522,8 +375,7 @@ static int ffa_domain_teardown(struct domain *d)
     if ( !ctx )
         return 0;
 
-    if ( ctx->rx )
-        rxtx_unmap(ctx);
+    ffa_rxtx_domain_destroy(d);
 
     ffa_domain_teardown_continue(ctx, true /* first_time */);
 
@@ -538,7 +390,6 @@ static int ffa_relinquish_resources(struct domain *d)
 static bool ffa_probe(void)
 {
     uint32_t vers;
-    int e;
     unsigned int major_vers;
     unsigned int minor_vers;
 
@@ -596,36 +447,21 @@ static bool ffa_probe(void)
          !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
         return false;
 
-    ffa_rx = alloc_xenheap_pages(get_order_from_pages(FFA_RXTX_PAGE_COUNT), 0);
-    if ( !ffa_rx )
+    if ( !ffa_rxtx_init() )
         return false;
 
-    ffa_tx = alloc_xenheap_pages(get_order_from_pages(FFA_RXTX_PAGE_COUNT), 0);
-    if ( !ffa_tx )
-        goto err_free_ffa_rx;
-
-    e = ffa_rxtx_map(__pa(ffa_tx), __pa(ffa_rx), FFA_RXTX_PAGE_COUNT);
-    if ( e )
-    {
-        printk(XENLOG_ERR "ffa: Failed to map rxtx: error %d\n", e);
-        goto err_free_ffa_tx;
-    }
     ffa_version = vers;
 
     if ( !ffa_partinfo_init() )
-        goto err_free_ffa_tx;
+        goto err_rxtx_destroy;
 
     INIT_LIST_HEAD(&ffa_teardown_head);
     init_timer(&ffa_teardown_timer, ffa_teardown_timer_callback, NULL, 0);
 
     return true;
 
-err_free_ffa_tx:
-    free_xenheap_pages(ffa_tx, 0);
-    ffa_tx = NULL;
-err_free_ffa_rx:
-    free_xenheap_pages(ffa_rx, 0);
-    ffa_rx = NULL;
+err_rxtx_destroy:
+    ffa_rxtx_destroy();
     ffa_version = 0;
 
     return false;
diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_private.h
index 6b32b69cfe90..98236cbf14a3 100644
--- a/xen/arch/arm/tee/ffa_private.h
+++ b/xen/arch/arm/tee/ffa_private.h
@@ -263,6 +263,13 @@ int32_t ffa_handle_partition_info_get(uint32_t w1, uint32_t w2, uint32_t w3,
                                       uint32_t w4, uint32_t w5, uint32_t *count,
                                       uint32_t *fpi_size);
 
+bool ffa_rxtx_init(void);
+void ffa_rxtx_destroy(void);
+void ffa_rxtx_domain_destroy(struct domain *d);
+uint32_t ffa_handle_rxtx_map(uint32_t fid, register_t tx_addr,
+			     register_t rx_addr, uint32_t page_count);
+uint32_t ffa_handle_rxtx_unmap(void);
+int32_t ffa_handle_rx_release(void);
 
 static inline uint16_t ffa_get_vm_id(const struct domain *d)
 {
diff --git a/xen/arch/arm/tee/ffa_rxtx.c b/xen/arch/arm/tee/ffa_rxtx.c
new file mode 100644
index 000000000000..661764052e67
--- /dev/null
+++ b/xen/arch/arm/tee/ffa_rxtx.c
@@ -0,0 +1,216 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2024  Linaro Limited
+ */
+
+#include <xen/const.h>
+#include <xen/domain_page.h>
+#include <xen/mm.h>
+#include <xen/sizes.h>
+#include <xen/types.h>
+
+#include <asm/smccc.h>
+#include <asm/regs.h>
+
+#include "ffa_private.h"
+
+/* Endpoint RX/TX descriptor defined in FF-A-1.0-REL */
+struct ffa_endpoint_rxtx_descriptor_1_0 {
+    uint16_t sender_id;
+    uint16_t reserved;
+    uint32_t rx_range_count;
+    uint32_t tx_range_count;
+};
+
+/* Endpoint RX/TX descriptor defined in FF-A-1.1-REL0 */
+struct ffa_endpoint_rxtx_descriptor_1_1 {
+    uint16_t sender_id;
+    uint16_t reserved;
+    uint32_t rx_region_offs;
+    uint32_t tx_region_offs;
+};
+
+uint32_t ffa_handle_rxtx_map(uint32_t fid, register_t tx_addr,
+			     register_t rx_addr, uint32_t page_count)
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
+        return FFA_RET_INVALID_PARAMETERS;
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
+uint32_t ffa_handle_rxtx_unmap(void)
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
+int32_t ffa_handle_rx_release(void)
+{
+    int32_t ret = FFA_RET_DENIED;
+    struct domain *d = current->domain;
+    struct ffa_ctx *ctx = d->arch.tee;
+
+    if ( !spin_trylock(&ctx->rx_lock) )
+        return FFA_RET_BUSY;
+
+    if ( !ctx->page_count || ctx->rx_is_free )
+        goto out;
+    ret = FFA_RET_OK;
+    ctx->rx_is_free = true;
+out:
+    spin_unlock(&ctx->rx_lock);
+
+    return ret;
+}
+
+static int32_t ffa_rxtx_map(paddr_t tx_addr, paddr_t rx_addr,
+                            uint32_t page_count)
+{
+    return ffa_simple_call(FFA_RXTX_MAP_64, tx_addr, rx_addr, page_count, 0);
+}
+
+static int32_t ffa_rxtx_unmap(void)
+{
+    return ffa_simple_call(FFA_RXTX_UNMAP, 0, 0, 0, 0);
+}
+
+void ffa_rxtx_domain_destroy(struct domain *d)
+{
+    struct ffa_ctx *ctx = d->arch.tee;
+
+    if ( ctx->rx )
+        rxtx_unmap(ctx);
+}
+
+void ffa_rxtx_destroy(void)
+{
+    bool need_unmap = ffa_tx && ffa_rx;
+
+    if ( ffa_tx )
+    {
+        free_xenheap_pages(ffa_tx, 0);
+        ffa_tx = NULL;
+    }
+    if ( ffa_rx )
+    {
+        free_xenheap_pages(ffa_rx, 0);
+        ffa_rx = NULL;
+    }
+
+    if ( need_unmap )
+        ffa_rxtx_unmap();
+}
+
+bool ffa_rxtx_init(void)
+{
+    int e;
+
+    ffa_rx = alloc_xenheap_pages(get_order_from_pages(FFA_RXTX_PAGE_COUNT), 0);
+    if ( !ffa_rx )
+        return false;
+
+    ffa_tx = alloc_xenheap_pages(get_order_from_pages(FFA_RXTX_PAGE_COUNT), 0);
+    if ( !ffa_tx )
+        goto err;
+
+    e = ffa_rxtx_map(__pa(ffa_tx), __pa(ffa_rx), FFA_RXTX_PAGE_COUNT);
+    if ( e )
+    {
+        printk(XENLOG_ERR "ffa: Failed to map rxtx: error %d\n", e);
+        goto err;
+    }
+    return true;
+
+err:
+    ffa_rxtx_destroy();
+
+    return false;
+}
-- 
2.34.1


