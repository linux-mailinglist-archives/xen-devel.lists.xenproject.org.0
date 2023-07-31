Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 586D67695DB
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 14:16:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.572962.897144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQRoQ-000455-N7; Mon, 31 Jul 2023 12:15:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 572962.897144; Mon, 31 Jul 2023 12:15:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQRoQ-00041L-GZ; Mon, 31 Jul 2023 12:15:46 +0000
Received: by outflank-mailman (input) for mailman id 572962;
 Mon, 31 Jul 2023 12:15:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VuP2=DR=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qQRoP-0003r6-Mc
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 12:15:45 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f90d4d6c-2f9b-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 14:15:44 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4fe0eb0ca75so7035137e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 31 Jul 2023 05:15:44 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 l10-20020ac2430a000000b004fbb1bc1ae0sm2028077lfh.163.2023.07.31.05.15.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 05:15:42 -0700 (PDT)
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
X-Inumbo-ID: f90d4d6c-2f9b-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690805743; x=1691410543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IuPpDETKsd9EJlCiQj7fwJqFCPyxOJBlZOFnIaGXlq0=;
        b=iOTLKtvQETxTMalLcdecJT/sHdrrm5WB3/2sAZHm1rFIfG3n9EU4BTAhUbvsxZDs0t
         gPmZBjx/gwuRdAQIcIYmsgsgHt17Va1D2yzo2ILTG2UgC+iuyh/pvVkv6WJdDvYMyO8J
         P5FzTDyuSrRe5GLTEdfrwVcgdA1Y+mQV8bhRnuX/BWm5Z1F5xhxbQ3sngy6qx2/zZ5PM
         tCXbVOxC7N49qal9hJIXT4I1UoietrdrU6AzGjw0WbRJbMFQ09ZVM++yFiYWtxizQxMQ
         /cwIjb6CEY+87tKasTbAvDrsz4JO/TesBEIHUXppSepUxW5PZrg2dCyK4LRFMGujQdxl
         7FYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690805743; x=1691410543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IuPpDETKsd9EJlCiQj7fwJqFCPyxOJBlZOFnIaGXlq0=;
        b=Eluw1HOH88/eHc+/L93iR3NCQpMfTsCkyGVKtEJEYcHEU/9psUxG+o3z/Gd1d3hGyV
         PHlJh08uTyAazOHwOq41Z57NEUIK5W5KhMkjJ53xknDBiPF1JVN3NERyX/TMDK8exXmI
         6fCDB8QSx8tmcl2D+BywgmzAGTxm/Dv1iJx5y/NOwZFPkiTK135vBbnwNFXinsaUmuRH
         1BepTKgM5WsFYj6kBRpwFXBC5Y8YDjCvUK/PGLft+M9IhmM0LuFABJoDU+DoXrvryrP9
         CpnLtJGU8NkIon/6YzZUf3YKNGIR8r/8Q4bkIgajatup8QZIE0tGm2Qmuu9FjnEmtx88
         0Mqw==
X-Gm-Message-State: ABy/qLayML9A2IhnkveqcYxR+wmxZfwCcJZC6VDapf6LKMRFT0yPBf7b
	2vurS/FwFa8fKi/eWfEz6Ev7fJQCgN9SyBYKzu8=
X-Google-Smtp-Source: APBJJlFGXJpsvWNFf2xF1DleAbjD+fJafx2vX2SmChqHWEBQGXJ9Ducp6skAwEtEmdTsL2U78f490Q==
X-Received: by 2002:a19:ca44:0:b0:4fe:193c:de74 with SMTP id h4-20020a19ca44000000b004fe193cde74mr4900973lfj.18.1690805743019;
        Mon, 31 Jul 2023 05:15:43 -0700 (PDT)
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
Subject: [XEN PATCH v11 02/14] xen/arm: ffa: map SPMC rx/tx buffers
Date: Mon, 31 Jul 2023 14:15:24 +0200
Message-Id: <20230731121536.934239-3-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230731121536.934239-1-jens.wiklander@linaro.org>
References: <20230731121536.934239-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When initializing the FF-A mediator map the RX and TX buffers shared with
the SPMC.

These buffer are later used to to transmit data that cannot be passed in
registers only.

Adds a check that the SP supports the needed FF-A features
FFA_RXTX_MAP_64 and FFA_RXTX_UNMAP.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
v10->v11
- Adding Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/tee/ffa.c | 50 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 961a8c052f59..072198a1326d 100644
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
 static uint32_t __ro_after_init ffa_version;
 
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
@@ -394,6 +414,7 @@ static int ffa_relinquish_resources(struct domain *d)
 static bool ffa_probe(void)
 {
     uint32_t vers;
+    int e;
     unsigned int major_vers;
     unsigned int minor_vers;
 
@@ -441,12 +462,39 @@ static bool ffa_probe(void)
      * TODO: Rework the code to allow domain to use a subset of the
      * features supported.
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


