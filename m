Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 546AA7695D7
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 14:15:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.572965.897181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQRoU-0005BH-4U; Mon, 31 Jul 2023 12:15:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 572965.897181; Mon, 31 Jul 2023 12:15:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQRoT-00058H-Um; Mon, 31 Jul 2023 12:15:49 +0000
Received: by outflank-mailman (input) for mailman id 572965;
 Mon, 31 Jul 2023 12:15:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VuP2=DR=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qQRoS-0003r0-Ks
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 12:15:48 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb6e64f8-2f9b-11ee-b255-6b7b168915f2;
 Mon, 31 Jul 2023 14:15:48 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4fe21e7f3d1so4304543e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 31 Jul 2023 05:15:48 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 l10-20020ac2430a000000b004fbb1bc1ae0sm2028077lfh.163.2023.07.31.05.15.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 05:15:46 -0700 (PDT)
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
X-Inumbo-ID: fb6e64f8-2f9b-11ee-b255-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690805747; x=1691410547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4AB6A9Fj9vf3tU/KMptcs+JouX3pEtTOo9oFrsEL35s=;
        b=fX1IMNzMLXqAynWPqbnUkV1Rt3C0luOm0RJJStG+L08FeEH7bcQ7VOdpdPjO/M8gkX
         HUF4119LckHAnbQYfjrACz6Qjgc8cWA6q8T9iA0Lb0SOnyybqdUbAl2bkl1WL8CWQCxX
         FBzbQ2BWG+Q2QYjCyfzkjLSjLG4lMcBbyaRQmi+ylNNtod6tZ8P+MhWZ51ysuB3ZfMyv
         QIRJIgvgn5jGRK95vvWs75DfBFCaWS3ps1pCthDQt/QPQ/p49+urIx4bmHOPugnjqjg5
         UZWhJF3cFnmK779Hs5Ju8m1qVSSVymY2/TLrNeGmufkrJZ5q+0LcdFj5HFeGqFC0FCTL
         HJJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690805747; x=1691410547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4AB6A9Fj9vf3tU/KMptcs+JouX3pEtTOo9oFrsEL35s=;
        b=h2vyGbeDMI1wua4TH4p4heNz9h6JW6cOpB4X7dT/qb9Pq8kHuVqMJ7jFyVzi8D/nlV
         uYn27HHBKPjF/0XXudPd6MPhUumoXmkoHzp6zLbntUQn2yfDgvYq5OgdEf8gwRklOXZi
         vbt7AoiYXaF/HqAT2+rdiPg8OMMRpWCL4kUdibLNJGKSNeoIKd+p3fVtc0dE+YsiEzKS
         yPjyKXPXEGM48ktGEQvpKMiVzupJMOYj/VUODzhy6ZEqB4hbPzFxWpaS6gWEc35Z7f84
         DvDqyk94k6keT/Lbi77PP4NYV4uHSU0d+NROD87Sy6gm5xWvAl+XPibGGo1kYJSqjirm
         9e4w==
X-Gm-Message-State: ABy/qLb+rS41GPf46ipIta6KOy9gyDS2GcGtC72a69q6I26OJangPtka
	gjDq0EaK1Glb7eiPRmQEcl3gdxcdu4LaILRP3gk=
X-Google-Smtp-Source: APBJJlHxge4QcUxtlZBi8niviTT+SjTx4A6GMi/eZePSKE3dub2Em06W0e4BqLkfd925t/I0dhh7Yw==
X-Received: by 2002:a19:4f52:0:b0:4fd:d9dd:7a22 with SMTP id a18-20020a194f52000000b004fdd9dd7a22mr5256715lfk.26.1690805747264;
        Mon, 31 Jul 2023 05:15:47 -0700 (PDT)
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
Subject: [XEN PATCH v11 05/14] xen/arm: ffa: support guest FFA_PARTITION_INFO_GET
Date: Mon, 31 Jul 2023 14:15:27 +0200
Message-Id: <20230731121536.934239-6-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230731121536.934239-1-jens.wiklander@linaro.org>
References: <20230731121536.934239-1-jens.wiklander@linaro.org>
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
v10->v11
- Fixing a typo in a comment and adding another comment as requested
---
 xen/arch/arm/tee/ffa.c | 134 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 134 insertions(+)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 6c76c9885774..6c889bf97002 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -166,7 +166,18 @@
 #define FFA_MSG_SEND                    0x8400006EU
 #define FFA_MSG_POLL                    0x8400006AU
 
+/*
+ * Structs below ending with _1_0 are defined in FF-A-1.0-REL and
+ * structs ending with _1_1 are defined in FF-A-1.1-REL0.
+ */
+
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
@@ -189,6 +200,7 @@ struct ffa_ctx {
      */
     uint16_t create_signal_count;
     bool rx_is_free;
+    spinlock_t lock;
 };
 
 /* Negotiated FF-A version to use with the SPMC */
@@ -203,9 +215,15 @@ static uint16_t subscr_vm_destroyed_count __read_mostly;
 /*
  * Our rx/tx buffers shared with the SPMC. FFA_RXTX_PAGE_COUNT is the
  * number of pages used in each of these buffers.
+ *
+ * The RX buffer is protected from concurrent usage with ffa_rx_buffer_lock.
+ * Note that the SPMC is also tracking the ownership of our RX buffer so
+ * for calls which uses our RX buffer to deliver a result we must call
+ * ffa_rx_release() to let the SPMC know that we're done with the buffer.
  */
 static void *ffa_rx __read_mostly;
 static void *ffa_tx __read_mostly;
+static DEFINE_SPINLOCK(ffa_rx_buffer_lock);
 
 static bool ffa_get_version(uint32_t *vers)
 {
@@ -512,6 +530,103 @@ static uint32_t handle_rxtx_unmap(void)
     return FFA_RET_OK;
 }
 
+static int32_t handle_partition_info_get(uint32_t w1, uint32_t w2, uint32_t w3,
+                                         uint32_t w4, uint32_t w5,
+                                         uint32_t *count)
+{
+    int32_t ret = FFA_RET_DENIED;
+    struct domain *d = current->domain;
+    struct ffa_ctx *ctx = d->arch.tee;
+
+    /*
+     * FF-A v1.0 has w5 MBZ while v1.1 allows
+     * FFA_PARTITION_INFO_GET_COUNT_FLAG to be non-zero.
+     *
+     * FFA_PARTITION_INFO_GET_COUNT is only using registers and not the
+     * rxtx buffer so do the partition_info_get directly.
+     */
+    if ( w5 == FFA_PARTITION_INFO_GET_COUNT_FLAG &&
+         ctx->guest_vers == FFA_VERSION_1_1 )
+        return ffa_partition_info_get(w1, w2, w3, w4, w5, count);
+    if ( w5 )
+        return FFA_RET_INVALID_PARAMETERS;
+
+    if ( !ffa_rx )
+        return FFA_RET_DENIED;
+
+    spin_lock(&ctx->lock);
+    if ( !ctx->page_count || !ctx->rx_is_free )
+        goto out;
+    spin_lock(&ffa_rx_buffer_lock);
+    ret = ffa_partition_info_get(w1, w2, w3, w4, w5, count);
+    if ( ret )
+        goto out_rx_buf_unlock;
+    /*
+     * ffa_partition_info_get() succeeded so we now own the RX buffer we
+     * share with the SPMC. We must give it back using ffa_rx_release()
+     * once we've copied the content.
+     */
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
+    ctx->rx_is_free = false;
+out_rx_release:
+    ffa_rx_release();
+out_rx_buf_unlock:
+    spin_unlock(&ffa_rx_buffer_lock);
+out:
+    spin_unlock(&ctx->lock);
+
+    return ret;
+}
+
+static int32_t handle_rx_release(void)
+{
+    int32_t ret = FFA_RET_DENIED;
+    struct domain *d = current->domain;
+    struct ffa_ctx *ctx = d->arch.tee;
+
+    spin_lock(&ctx->lock);
+    if ( !ctx->page_count || ctx->rx_is_free )
+        goto out;
+    ret = FFA_RET_OK;
+    ctx->rx_is_free = true;
+out:
+    spin_unlock(&ctx->lock);
+
+    return ret;
+}
+
 static void handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32_t fid)
 {
     struct arm_smccc_1_2_regs arg = { .a0 = fid, };
@@ -568,6 +683,7 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
     uint32_t fid = get_user_reg(regs, 0);
     struct domain *d = current->domain;
     struct ffa_ctx *ctx = d->arch.tee;
+    uint32_t count;
     int e;
 
     if ( !ctx )
@@ -597,6 +713,24 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
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
     case FFA_MSG_SEND_DIRECT_REQ_64:
         handle_msg_send_direct_req(regs, fid);
-- 
2.34.1


