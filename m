Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 332266E077B
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 09:16:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520470.808134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmrBU-0003z4-38; Thu, 13 Apr 2023 07:15:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520470.808134; Thu, 13 Apr 2023 07:15:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmrBT-0003op-Gu; Thu, 13 Apr 2023 07:15:55 +0000
Received: by outflank-mailman (input) for mailman id 520470;
 Thu, 13 Apr 2023 07:15:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UVxt=AE=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pmrBQ-0001gq-6z
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 07:15:52 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05beb46c-d9cb-11ed-b21e-6b7b168915f2;
 Thu, 13 Apr 2023 09:15:51 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id t14so17730665lft.7
 for <xen-devel@lists.xenproject.org>; Thu, 13 Apr 2023 00:15:51 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 n12-20020ac2490c000000b004dc83d04840sm181354lfi.79.2023.04.13.00.15.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 00:15:50 -0700 (PDT)
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
X-Inumbo-ID: 05beb46c-d9cb-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681370151; x=1683962151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pRYh9rViyFOvZCJSQQWOLQPi8YGZ6hqxd9UhBA1/mVQ=;
        b=bGID0BM3IKCyBs9Fb+1qCm7grvNZP5aDga9QzxfN/qFX7WEy7SRlMd81xJeklLXa7J
         98uZFaWKBlZ3aFWumgJ/uZm5Fmhaip+2yGt/pdwc8BmshtqAsIBEiwkiBfwCLodxC5Oo
         X6VUUVdaDUNnLCB+ftfVskw2RB71YMwmk3xdtG+aU+C/2rZ3VRdEPfhxQzCRvT2nq885
         W4keD+/B6xfHT1Ttr9il2iuJThDE+wLRp29p9vmrnSem6prPLe9+ZZmFzi4zJhXyPuSa
         tFRVihRNqdtIPPcJBrgZYbvZmCvqC2AQ4P95iHs0304lx5mSn/eFR8VCw6FYjbFopYR7
         Z51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681370151; x=1683962151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pRYh9rViyFOvZCJSQQWOLQPi8YGZ6hqxd9UhBA1/mVQ=;
        b=KjyzWcSz12Sy8vDlUv5EmF55NXWUgaIGD1EPXix8u68GoNRnFW+uVxDGN8YV9Z87EQ
         Hb0PBURkTn6cGt+aZjNDGDm4VQLqxeDvHyv9T80Z675e24jg8gxVFiE0matYkj7kIkZz
         yaUAiURiMCLR4navEegL1JxAUoi0APf2/s5IoXtVVLOoWKhOOTxJHTPZ0veaNce7YWOV
         XPQiQwN6eTHGjQLiapTPxv43mHUb8liIwiSzkUCglxdTE4ohNf8MTAOhGx6c9qI8sX37
         gpWL8NwMxCYKJJs5uFmKG/ed9pelV36K9eM9r9LGrmnWpOsIZhGRqNCfG8PIYeA3u3FS
         c8xQ==
X-Gm-Message-State: AAQBX9eHO6RoM7zVIUtzpN4JlwRBa2nL0rQ2MurYajoGcywaCV6JgxPF
	5ZThvJwYXlNr2Vd7qYHYbsQkzntXGloDs+yTcow=
X-Google-Smtp-Source: AKy350Zl091Qic1jeEJAh4/nzkT6NnQXBmuUhjxdulYlyB0Q3Uok5N2ISXaclmkeNym5ht4Hh/RUpQ==
X-Received: by 2002:a19:f602:0:b0:4eb:3f80:3ca3 with SMTP id x2-20020a19f602000000b004eb3f803ca3mr471078lfe.48.1681370151154;
        Thu, 13 Apr 2023 00:15:51 -0700 (PDT)
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
Subject: [XEN PATCH v8 10/22] xen/arm: ffa: map SPMC rx/tx buffers
Date: Thu, 13 Apr 2023 09:14:12 +0200
Message-Id: <20230413071424.3273490-11-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230413071424.3273490-1-jens.wiklander@linaro.org>
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When initializing the FF-A mediator map the RX and TX buffers shared with
the SPMC.

These buffer are later used to to transmit data that cannot be passed in
registers only.

Adds a check that the SP supports the needed FF-A features
FFA_RXTX_MAP_64 and FFA_RXTX_UNMAP.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/tee/ffa.c | 50 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index f2cce955d981..054121fe4321 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -12,6 +12,7 @@
 #include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/lib.h>
+#include <xen/mm.h>
 #include <xen/sched.h>
 #include <xen/sizes.h>
 #include <xen/types.h>
@@ -67,6 +68,12 @@
  */
 #define FFA_PAGE_SIZE                   SZ_4K
 
+/*
+ * The number of pages used for each of the RX and TX buffers shared with
+ * the SPMC.
+ */
+#define FFA_RXTX_PAGE_COUNT             1
+
 /*
  * Flags and field values used for the MSG_SEND_DIRECT_REQ/RESP:
  * BIT(31): Framework or partition message
@@ -161,6 +168,13 @@ struct ffa_ctx {
 /* Negotiated FF-A version to use with the SPMC */
 static uint32_t ffa_version __ro_after_init;
 
+/*
+ * Our rx/tx buffers shared with the SPMC. FFA_RXTX_PAGE_COUNT is the
+ * number of pages used in each of these buffers.
+ */
+static void *ffa_rx __read_mostly;
+static void *ffa_tx __read_mostly;
+
 static bool ffa_get_version(uint32_t *vers)
 {
     const struct arm_smccc_1_2_regs arg = {
@@ -231,6 +245,12 @@ static bool check_mandatory_feature(uint32_t id)
     return !ret;
 }
 
+static int32_t ffa_rxtx_map(paddr_t tx_addr, paddr_t rx_addr,
+                            uint32_t page_count)
+{
+    return ffa_simple_call(FFA_RXTX_MAP_64, tx_addr, rx_addr, page_count, 0);
+}
+
 static uint16_t get_vm_id(const struct domain *d)
 {
     /* +1 since 0 is reserved for the hypervisor in FF-A */
@@ -389,6 +409,7 @@ static int ffa_relinquish_resources(struct domain *d)
 static bool ffa_probe(void)
 {
     uint32_t vers;
+    int e;
     unsigned int major_vers;
     unsigned int minor_vers;
 
@@ -435,12 +456,39 @@ static bool ffa_probe(void)
      * TODO save result of checked features and use that information to
      * accept or reject requests from guests.
      */
-    if ( !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
+    if (
+         !check_mandatory_feature(FFA_RXTX_MAP_64) ||
+         !check_mandatory_feature(FFA_RXTX_UNMAP) ||
+         !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
+        return false;
+
+    ffa_rx = alloc_xenheap_pages(get_order_from_pages(FFA_RXTX_PAGE_COUNT), 0);
+    if ( !ffa_rx )
         return false;
 
+    ffa_tx = alloc_xenheap_pages(get_order_from_pages(FFA_RXTX_PAGE_COUNT), 0);
+    if ( !ffa_tx )
+        goto err_free_ffa_rx;
+
+    e = ffa_rxtx_map(__pa(ffa_tx), __pa(ffa_rx), FFA_RXTX_PAGE_COUNT);
+    if ( e )
+    {
+        printk(XENLOG_ERR "ffa: Failed to map rxtx: error %d\n", e);
+        goto err_free_ffa_tx;
+    }
     ffa_version = vers;
 
     return true;
+
+err_free_ffa_tx:
+    free_xenheap_pages(ffa_tx, 0);
+    ffa_tx = NULL;
+err_free_ffa_rx:
+    free_xenheap_pages(ffa_rx, 0);
+    ffa_rx = NULL;
+    ffa_version = 0;
+
+    return false;
 }
 
 static const struct tee_mediator_ops ffa_ops =
-- 
2.34.1


