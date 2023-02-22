Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE4669F813
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 16:34:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499551.770842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUr8J-0004VX-8P; Wed, 22 Feb 2023 15:34:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499551.770842; Wed, 22 Feb 2023 15:34:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUr8H-0004CY-Cg; Wed, 22 Feb 2023 15:34:13 +0000
Received: by outflank-mailman (input) for mailman id 499551;
 Wed, 22 Feb 2023 15:34:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvgA=6S=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pUr8B-0001MC-A9
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 15:34:07 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 579dbb43-b2c6-11ed-a089-e9535cc0f9c3;
 Wed, 22 Feb 2023 16:34:06 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id f41so10501931lfv.13
 for <xen-devel@lists.xenproject.org>; Wed, 22 Feb 2023 07:34:06 -0800 (PST)
Received: from localhost.localdomain (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 q9-20020ac25289000000b004db0d26adb4sm927746lfm.182.2023.02.22.07.34.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 07:34:05 -0800 (PST)
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
X-Inumbo-ID: 579dbb43-b2c6-11ed-a089-e9535cc0f9c3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PKen3qJPmkTvDeSAkak1h6D6WS5xyInpmZTn/4tNUg8=;
        b=a6V1ggfXAR5GzGDCNUPBm18CgChnXa1ayRPDFApfPH9Pgwg5cmjbYd2l0wkfBDDDkW
         N0v4szwyfOBMZJ7ONe1XLyjf8zh5XScn2DuE19tmjBOFW8t3Gzmsi+NFpdAcz5WuTAIX
         mNrYRanN3NLBG19vo6ES/EHVmuCx0NOnew2aCSEXARn23Ny4zfi2B8ywQEDWcK8JjMEj
         DPurICq7hEUbkgEZLLX2xR/SJEnf7IRbwvKpHxkkgck1lwxsx6xpwzfM2Z2jS5WegLry
         4laj1Y+Hl8DaZY0pjSOtBsJ93HeyivCzJSpPaGu9vOm73X9HlVOTYmZv69tw00izK01+
         QREQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PKen3qJPmkTvDeSAkak1h6D6WS5xyInpmZTn/4tNUg8=;
        b=yn/7naHkl1qJglGUTKepVITi1uAnSD7J76rv9fSLUNVQllLFI+9dQUR6nptKMM1n2U
         G2mt0MJxzEZpOe4M/+iarJxYMKUDMIQAkfCWyRHoqEkLgyV4itgZ+PwV761EfN+YWofF
         dzDCUA+phPv1zI+RZgFotc+lC1AWPjkkVMm/JfG3gSdlOpmaKjdIasZz15TyQ0JGfIhs
         ANLvQXyHwpgdFsuFMOZ3bGUQRB4flNuX+r+9+7P9qdlyXGTmL0bNRT1sMcFaIYtoPbnE
         alj++2PkASQw6BKgSvTBy9blmi5305D+RYI6/ucYTGiR4+Q/imde4kJVt9oYIctPHktu
         dnWA==
X-Gm-Message-State: AO0yUKUhTCAN9D6GQEwHjouJVEdwhbbSD02UGq4S6dwkLW+MM0NFmnZF
	kfDrsTQ6bMTN1FQTj20C4WTU+6CM83/UjVPqEOw=
X-Google-Smtp-Source: AK7set+0o0Ptn4JK86nuCdJ1Z4yrG0grXUD+actcFpHCgn3J/tEoAMIddbOZsMfrFPicXzS30zyXwA==
X-Received: by 2002:ac2:4479:0:b0:4da:ffb1:9872 with SMTP id y25-20020ac24479000000b004daffb19872mr3228121lfl.4.1677080045700;
        Wed, 22 Feb 2023 07:34:05 -0800 (PST)
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
Subject: [XEN PATCH v7 14/20] xen/arm: ffa: support guest FFA_PARTITION_INFO_GET
Date: Wed, 22 Feb 2023 16:33:11 +0100
Message-Id: <fc8e8f1d2d8dbefffd28f6ff1dff600094be8182.1677079672.git.jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677079671.git.jens.wiklander@linaro.org>
References: <cover.1677079671.git.jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds support in the mediator to handle FFA_PARTITION_INFO_GET requests
from a guest. The requests are forwarded to the SPMC and the response is
translated according to the FF-A version in use by the guest.

Using FFA_PARTITION_INFO_GET changes the owner of the RX buffer to the
caller (the guest in this case), so once it is done with the buffer it
must be released using FFA_RX_RELEASE before another call can be made.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/tee/ffa.c | 126 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 124 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 953b6dfd5eca..3571817c0bcd 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -141,6 +141,12 @@
 #define FFA_MSG_POLL                    0x8400006AU
 
 /* Partition information descriptor */
+struct ffa_partition_info_1_0 {
+    uint16_t id;
+    uint16_t execution_context;
+    uint32_t partition_properties;
+};
+
 struct ffa_partition_info_1_1 {
     uint16_t id;
     uint16_t execution_context;
@@ -157,9 +163,8 @@ struct ffa_ctx {
     uint32_t guest_vers;
     bool tx_is_mine;
     bool interrupted;
+    spinlock_t lock;
 };
-
-
 /* Negotiated FF-A version to use with the SPMC */
 static uint32_t ffa_version __ro_after_init;
 
@@ -173,10 +178,16 @@ static unsigned int subscr_vm_destroyed_count __read_mostly;
  * Our rx/tx buffers shared with the SPMC.
  *
  * ffa_page_count is the number of pages used in each of these buffers.
+ *
+ * The RX buffer is protected from concurrent usage with ffa_rx_buffer_lock.
+ * Note that the SPMC is also tracking the ownership of our RX buffer so
+ * for calls which uses our RX buffer to deliver a result we must call
+ * ffa_rx_release() to let the SPMC know that we're done with the buffer.
  */
 static void *ffa_rx __read_mostly;
 static void *ffa_tx __read_mostly;
 static unsigned int ffa_page_count __read_mostly;
+static DEFINE_SPINLOCK(ffa_rx_buffer_lock);
 
 static bool ffa_get_version(uint32_t *vers)
 {
@@ -463,6 +474,98 @@ static uint32_t handle_rxtx_unmap(void)
     return FFA_RET_OK;
 }
 
+static uint32_t handle_partition_info_get(uint32_t w1, uint32_t w2, uint32_t w3,
+                                          uint32_t w4, uint32_t w5,
+                                          uint32_t *count)
+{
+    bool query_count_only = w5 & FFA_PARTITION_INFO_GET_COUNT_FLAG;
+    uint32_t w5_mask = 0;
+    uint32_t ret = FFA_RET_DENIED;
+    struct domain *d = current->domain;
+    struct ffa_ctx *ctx = d->arch.tee;
+
+    /*
+     * FF-A v1.0 has w5 MBZ while v1.1 allows
+     * FFA_PARTITION_INFO_GET_COUNT_FLAG to be non-zero.
+     */
+    if ( ctx->guest_vers == FFA_VERSION_1_1 )
+        w5_mask = FFA_PARTITION_INFO_GET_COUNT_FLAG;
+    if ( w5 & ~w5_mask )
+        return FFA_RET_INVALID_PARAMETERS;
+
+    if ( query_count_only )
+        return ffa_partition_info_get(w1, w2, w3, w4, w5, count);
+
+    if ( !ffa_page_count )
+        return FFA_RET_DENIED;
+
+    spin_lock(&ctx->lock);
+    spin_lock(&ffa_rx_buffer_lock);
+    if ( !ctx->page_count || !ctx->tx_is_mine )
+        goto out;
+    ret = ffa_partition_info_get(w1, w2, w3, w4, w5, count);
+    if ( ret )
+        goto out;
+
+    if ( ctx->guest_vers == FFA_VERSION_1_0 )
+    {
+        size_t n;
+        struct ffa_partition_info_1_1 *src = ffa_rx;
+        struct ffa_partition_info_1_0 *dst = ctx->rx;
+
+        if ( ctx->page_count * FFA_PAGE_SIZE < *count * sizeof(*dst) )
+        {
+            ret = FFA_RET_NO_MEMORY;
+            goto out_rx_release;
+        }
+
+        for ( n = 0; n < *count; n++ )
+        {
+            dst[n].id = src[n].id;
+            dst[n].execution_context = src[n].execution_context;
+            dst[n].partition_properties = src[n].partition_properties;
+        }
+    }
+    else
+    {
+        size_t sz = *count * sizeof(struct ffa_partition_info_1_1);
+
+        if ( ctx->page_count * FFA_PAGE_SIZE < sz )
+        {
+            ret = FFA_RET_NO_MEMORY;
+            goto out_rx_release;
+        }
+
+
+        memcpy(ctx->rx, ffa_rx, sz);
+    }
+    ctx->tx_is_mine = false;
+out_rx_release:
+    ffa_rx_release();
+out:
+    spin_unlock(&ffa_rx_buffer_lock);
+    spin_unlock(&ctx->lock);
+
+    return ret;
+}
+
+static uint32_t handle_rx_release(void)
+{
+    uint32_t ret = FFA_RET_DENIED;
+    struct domain *d = current->domain;
+    struct ffa_ctx *ctx = d->arch.tee;
+
+    spin_lock(&ctx->lock);
+    if ( !ctx->page_count || ctx->tx_is_mine )
+        goto out;
+    ret = FFA_RET_OK;
+    ctx->tx_is_mine = true;
+out:
+    spin_unlock(&ctx->lock);
+
+    return ret;
+}
+
 static void handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32_t fid)
 {
     struct arm_smccc_1_2_regs arg = { .a0 = fid, };
@@ -528,6 +631,7 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
     uint32_t fid = get_user_reg(regs, 0);
     struct domain *d = current->domain;
     struct ffa_ctx *ctx = d->arch.tee;
+    uint32_t count;
     int e;
 
     if ( !ctx )
@@ -559,6 +663,24 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
         else
             set_regs_success(regs, 0, 0);
         return true;
+    case FFA_PARTITION_INFO_GET:
+        e = handle_partition_info_get(get_user_reg(regs, 1),
+                                      get_user_reg(regs, 2),
+                                      get_user_reg(regs, 3),
+                                      get_user_reg(regs, 4),
+                                      get_user_reg(regs, 5), &count);
+        if ( e )
+            set_regs_error(regs, e);
+        else
+            set_regs_success(regs, count, 0);
+        return true;
+    case FFA_RX_RELEASE:
+        e = handle_rx_release();
+        if ( e )
+            set_regs_error(regs, e);
+        else
+            set_regs_success(regs, 0, 0);
+        return true;
     case FFA_MSG_SEND_DIRECT_REQ_32:
 #ifdef CONFIG_ARM_64
     case FFA_MSG_SEND_DIRECT_REQ_64:
-- 
2.34.1


