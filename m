Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50365810E79
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 11:32:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653839.1020488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDMWl-0001AX-Qj; Wed, 13 Dec 2023 10:31:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653839.1020488; Wed, 13 Dec 2023 10:31:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDMWl-00017t-N6; Wed, 13 Dec 2023 10:31:43 +0000
Received: by outflank-mailman (input) for mailman id 653839;
 Wed, 13 Dec 2023 10:31:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ptd6=HY=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1rDMWk-00017n-BS
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 10:31:42 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd1614bd-99a2-11ee-9b0f-b553b5be7939;
 Wed, 13 Dec 2023 11:31:40 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-55202565d48so551816a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 Dec 2023 02:31:40 -0800 (PST)
Received: from rayden.urgonet (h-217-31-164-171.A175.priv.bahnhof.se.
 [217.31.164.171]) by smtp.gmail.com with ESMTPSA id
 t19-20020a50d713000000b005522da9fdb6sm227151edi.74.2023.12.13.02.31.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Dec 2023 02:31:38 -0800 (PST)
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
X-Inumbo-ID: cd1614bd-99a2-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702463499; x=1703068299; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZIA3UNEPY3fDTKnxgP5EMG590iwOpFZV2ZhUBxBlU0Q=;
        b=AopQPNLSDrGjYTVYZmVLuCP7fcIetYwlHKa9JcXEBQHHeapX0wfcB0LLzfgENYklNz
         hBLxcEVwLm7wqLin9AG5UChwN12pc/ABO4FxCzwagSWQ7Vh7dM+FxKH3iNUsmckigL19
         buzgNlrCTwv7zHfGWFt96NU3ddPqXhNBUx6SNUXWX8srJ6JNlsTGsuXJFG6cHiQeaKXf
         CTq3QmdBftW/rTfY1v0xJ7zafP77vRUIodbiv7GSThm05pg3+CoHJBL0sJ1XYZQDQ7VK
         pRAE7e9Cyi5+XS4aEcwzsC9M7V86XXjrlZ6GT5BNwgxk1dj6KhwmwCKgF8J3PDBCCYaB
         lAYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702463499; x=1703068299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZIA3UNEPY3fDTKnxgP5EMG590iwOpFZV2ZhUBxBlU0Q=;
        b=goskdn0zm291C+0yGxHC5Awr2weAXvD0FrYNLw7OiNHIvQpi4abltcVKNxYi1+Hv1F
         Z2U6TN40UYLP+gVs2Z3RuVTzfugQfaQJjVmZGGrWVUH7ezXi9k+VDRauoJ4RoDdL1TA3
         uMB96ZiZFnsPCXuiTvS+65a+7Puqp1CAUd3yjhZIBfdfvV8vI68cz6Ff2pFmXbQj7A1x
         IgQIirWug+PkkAZx6E4x3RxpFUqNgT8qXdkYpjp7zwH2mfMUJtJx4Ga1j5+9cYJFXF5o
         bZUshu4BxJM7Qg0CfREUYxVN/yuS+A2yQoM9qrItbUgcEeM4JnXfiG38p5iz7FNkwOyJ
         9igg==
X-Gm-Message-State: AOJu0Ywjxvrt5tIW7qwWBnAtk3HBvo3zm97Mq8m30zR1p/8pKH+MenLH
	d+57DDLP5Kvu4lD37pilh2afLQ3L+akTZrVa6HA=
X-Google-Smtp-Source: AGHT+IFeKdUiB5mNydrj+PMkj9LWHgtuIkhTXR+DD9ZKw80UTy/4owp7jAjvltl79poafnCDqcoSbw==
X-Received: by 2002:a05:6402:5c6:b0:54d:2c63:782e with SMTP id n6-20020a05640205c600b0054d2c63782emr4858764edx.44.1702463499240;
        Wed, 13 Dec 2023 02:31:39 -0800 (PST)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: patches@linaro.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [XEN PATCH] xen/arm: ffa: return fpi size from FFA_PARTITION_INFO_GET
Date: Wed, 13 Dec 2023 11:31:35 +0100
Message-Id: <20231213103135.2346238-1-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Until now has FFA_PARTITION_INFO_GET always returned zero in w3, but
FF-A v1.1 requires FFA_PARTITION_INFO_GET to return the size of each
partition information descriptor returned if
FFA_PARTITION_INFO_GET_COUNT_FLAG isn't set.

The SPMC queried with FFA_PARTITION_INFO_GET must also return the each
partition information descriptor returned so fix this by passing along
the same value.

Fixes: caf6491e95a9 ("xen/arm: ffa: support guest FFA_PARTITION_INFO_GET")
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/tee/ffa.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 183528d13388..1d4e0a083006 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -514,7 +514,7 @@ static int32_t ffa_rxtx_map(paddr_t tx_addr, paddr_t rx_addr,
 
 static int32_t ffa_partition_info_get(uint32_t w1, uint32_t w2, uint32_t w3,
                                       uint32_t w4, uint32_t w5,
-                                      uint32_t *count)
+                                      uint32_t *count, uint32_t *fpi_size)
 {
     const struct arm_smccc_1_2_regs arg = {
         .a0 = FFA_PARTITION_INFO_GET,
@@ -531,7 +531,10 @@ static int32_t ffa_partition_info_get(uint32_t w1, uint32_t w2, uint32_t w3,
 
     ret = get_ffa_ret_code(&resp);
     if ( !ret )
+    {
         *count = resp.a2;
+        *fpi_size = resp.a3;
+    }
 
     return ret;
 }
@@ -784,7 +787,7 @@ static uint32_t handle_rxtx_unmap(void)
 
 static int32_t handle_partition_info_get(uint32_t w1, uint32_t w2, uint32_t w3,
                                          uint32_t w4, uint32_t w5,
-                                         uint32_t *count)
+                                         uint32_t *count, uint32_t *fpi_size)
 {
     int32_t ret = FFA_RET_DENIED;
     struct domain *d = current->domain;
@@ -799,7 +802,7 @@ static int32_t handle_partition_info_get(uint32_t w1, uint32_t w2, uint32_t w3,
      */
     if ( w5 == FFA_PARTITION_INFO_GET_COUNT_FLAG &&
          ctx->guest_vers == FFA_VERSION_1_1 )
-        return ffa_partition_info_get(w1, w2, w3, w4, w5, count);
+        return ffa_partition_info_get(w1, w2, w3, w4, w5, count, fpi_size);
     if ( w5 )
         return FFA_RET_INVALID_PARAMETERS;
 
@@ -812,7 +815,7 @@ static int32_t handle_partition_info_get(uint32_t w1, uint32_t w2, uint32_t w3,
     if ( !ctx->page_count || !ctx->rx_is_free )
         goto out;
     spin_lock(&ffa_rx_buffer_lock);
-    ret = ffa_partition_info_get(w1, w2, w3, w4, w5, count);
+    ret = ffa_partition_info_get(w1, w2, w3, w4, w5, count, fpi_size);
     if ( ret )
         goto out_rx_buf_unlock;
     /*
@@ -842,7 +845,7 @@ static int32_t handle_partition_info_get(uint32_t w1, uint32_t w2, uint32_t w3,
     }
     else
     {
-        size_t sz = *count * sizeof(struct ffa_partition_info_1_1);
+        size_t sz = *count * *fpi_size;
 
         if ( ctx->page_count * FFA_PAGE_SIZE < sz )
         {
@@ -1409,6 +1412,7 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
     uint32_t fid = get_user_reg(regs, 0);
     struct domain *d = current->domain;
     struct ffa_ctx *ctx = d->arch.tee;
+    uint32_t fpi_size;
     uint32_t count;
     int e;
 
@@ -1444,11 +1448,11 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
                                       get_user_reg(regs, 2),
                                       get_user_reg(regs, 3),
                                       get_user_reg(regs, 4),
-                                      get_user_reg(regs, 5), &count);
+                                      get_user_reg(regs, 5), &count, &fpi_size);
         if ( e )
             set_regs_error(regs, e);
         else
-            set_regs_success(regs, count, 0);
+            set_regs_success(regs, count, fpi_size);
         return true;
     case FFA_RX_RELEASE:
         e = handle_rx_release();
@@ -1629,10 +1633,11 @@ static bool init_subscribers(struct ffa_partition_info_1_1 *fpi, uint16_t count)
 static bool init_sps(void)
 {
     bool ret = false;
+    uint32_t fpi_size;
     uint32_t count;
     int e;
 
-    e = ffa_partition_info_get(0, 0, 0, 0, 0, &count);
+    e = ffa_partition_info_get(0, 0, 0, 0, 0, &count, &fpi_size);
     if ( e )
     {
         printk(XENLOG_ERR "ffa: Failed to get list of SPs: %d\n", e);
-- 
2.34.1


