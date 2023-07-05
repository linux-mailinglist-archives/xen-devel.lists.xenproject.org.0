Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C05B1748100
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 11:35:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558893.873464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGyv7-00008r-G8; Wed, 05 Jul 2023 09:35:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558893.873464; Wed, 05 Jul 2023 09:35:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGyv7-0008VA-4J; Wed, 05 Jul 2023 09:35:33 +0000
Received: by outflank-mailman (input) for mailman id 558893;
 Wed, 05 Jul 2023 09:35:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hy0b=CX=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qGyv4-0005bC-P7
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 09:35:30 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 476e6fdc-1b17-11ee-8611-37d641c3527e;
 Wed, 05 Jul 2023 11:35:29 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2b6a16254a4so97375261fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Jul 2023 02:35:29 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 q22-20020a2e84d6000000b002b6d8cfb6d2sm2910625ljh.140.2023.07.05.02.35.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 02:35:28 -0700 (PDT)
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
X-Inumbo-ID: 476e6fdc-1b17-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688549728; x=1691141728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6PcGNOj2uFVtSWdI80VqpOM3Tw157fUaqVtYpkv27I=;
        b=DEvL+q710F8tk41SRkTdh0e+4CAz6gsiuAYF2/Qh1nvPJxeVsuvtBY46qIR5CL0W9D
         DjS/xDuPmq1FnFAVKMREGGaifsozQsDRxgtqUCdvqzNMF2M/9RgQXgf8cRuZgLHQFa51
         MwGM8Lr6IekmzgYvu0doaUHDACAA5NRfmPLW/Ek4CMFhPErsIVFs7iqFaYJ4ktDpnU95
         VJDPIMVpw6mOE5WrZomfynZzMwzSPw7xeahQekjrwEphGyFTV6twzsnI5qoco0fL2riG
         nWajvs6prZVdlRGuydjorhG7Q/GIM/W/DufKThXPZObMIWTJf8Jzl+KfIfrfYA31VFvb
         YT8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688549728; x=1691141728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I6PcGNOj2uFVtSWdI80VqpOM3Tw157fUaqVtYpkv27I=;
        b=ayyvKsoxRGxlBaxi/ezWKv6I2Gdg67b8x6z/ENbPvwt9hvrUP10e80kLtz37JSV1b5
         RErH7oUtV6MbH/et2zkPHMjFGIQshnObyffy/oL3IAL6g+nsR5yalfLKGtDSoxoFJzq1
         +HzoSgWGmvb8zJRKDrA2WmDhQ9KMi2bF09lFjpFatT37N1xKFnUzxPIDfS1zGcbeVrAM
         w/MEFV78MX7xA+dHZzGzObycu4ZUB3ShlEAw68qT3B/nby+aeLyx4CYZM5/Q9t/Ha+KH
         1Ld6xpBLgyZtyN37eSJCRrzW4cV9QjnjdIgXqxQlYYkXWB7Kr4gjb73uB7UebUmWfxZo
         D+NA==
X-Gm-Message-State: ABy/qLYs3NEoyhtVvc29T9RGMIIhYTYRA/cb5aWqmXvQucxaCJjSZFZ9
	qVbTc9NQ7zmWS/j5mwuLxWa1zlVFUUQOPzR4uEI=
X-Google-Smtp-Source: APBJJlF1WoV8nmFc2oR5r4szd6sSBwz7KYe0xDqmvDJ4irnPV5Er1nvwLqLtUFmLapP0IzGV+pkxkQ==
X-Received: by 2002:a2e:a41a:0:b0:2b1:a89a:5f2b with SMTP id p26-20020a2ea41a000000b002b1a89a5f2bmr10849559ljn.2.1688549728532;
        Wed, 05 Jul 2023 02:35:28 -0700 (PDT)
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
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [XEN PATCH v9 11/24] xen/arm: ffa: map SPMC rx/tx buffers
Date: Wed,  5 Jul 2023 11:34:20 +0200
Message-Id: <20230705093433.2514898-12-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230705093433.2514898-1-jens.wiklander@linaro.org>
References: <20230705093433.2514898-1-jens.wiklander@linaro.org>
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
index e05d58cf7755..f8ccaabc568d 100644
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


