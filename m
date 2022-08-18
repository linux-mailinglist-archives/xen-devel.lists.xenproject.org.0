Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B8C5981C2
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 12:56:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389439.626416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOdCK-0006DU-I7; Thu, 18 Aug 2022 10:56:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389439.626416; Thu, 18 Aug 2022 10:56:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOdCK-000659-CK; Thu, 18 Aug 2022 10:56:24 +0000
Received: by outflank-mailman (input) for mailman id 389439;
 Thu, 18 Aug 2022 10:56:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=avir=YW=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1oOdCI-00040G-2u
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 10:56:22 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64f9110b-1ee4-11ed-bd2e-47488cf2e6aa;
 Thu, 18 Aug 2022 12:56:21 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id v2so1634179lfi.6
 for <xen-devel@lists.xenproject.org>; Thu, 18 Aug 2022 03:56:21 -0700 (PDT)
Received: from jade.urgonet (h-79-136-84-253.A175.priv.bahnhof.se.
 [79.136.84.253]) by smtp.gmail.com with ESMTPSA id
 y27-20020a0565123f1b00b0048a85334a11sm176837lfa.143.2022.08.18.03.56.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 03:56:20 -0700 (PDT)
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
X-Inumbo-ID: 64f9110b-1ee4-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=pf7HP/OCbwnWchVju6GNdXTQSDE48F6ElvQDHzbdRk4=;
        b=WJqDeV6bmgbjUNYm8bHLoViQidJCfXnNR1tjvf67jkg6Klw8iBWW2mwQOjdHI2HBSK
         oIXbIDZov0kSQzEUTnav6hyerUjKOLJ8rfRv4Fqb1AerNlcnpQpiongdDyT+0BPikVmy
         18xPH7F9MOZVqty0KxfT/aoCRwYxRP3i+OYeP/Gz4Hz1bQ9jumG+yXIA4C8S8Ivd8Irn
         hshOMFx/nPOaSqEdIqhplHKD6NtdBFtkPMEGl/Bjzf2UApYXJyaAqquPEX47Sj8GD3xX
         5xysxpWhhMCtzlwnBBOEuGbSHr37kZaEYBmFQct9RwqZS7aDljXgNpa5BTEhDhZH/jos
         BYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=pf7HP/OCbwnWchVju6GNdXTQSDE48F6ElvQDHzbdRk4=;
        b=jGugSdl6aFPwCYJuk5c/RV6e95VlcDIOR8icVKb349xSowsqpgqBhDXNNSUdB2xDtc
         xMV66aD9xysZ3Mq2EwCj4HvnmPjsLWzAVRK6gno9L5BjLSWII8TjwlPmXJ1ppxgJ9WAd
         0i1DRt7aU28Sqw/pI51z5cCoEGAJmo8hX9ej80rMpuUIYMKw/8DiKUiUSNgfS2OOI0z1
         him/04o6SgSvKz/V2zC3avwoICoVAnK7ZQlAEf0Z+W0YD3DQV4Houly++rtZfCp5cuqL
         /r9Gm3Y43FnCdFnraDNOSVxxd8u9h9LwEUiKFLiiB7I7kSCprXV/Z8YpS2RVtIH+G/Kk
         0aTA==
X-Gm-Message-State: ACgBeo3K5blrSPA/09FtjU1B32beXR2nWip0JknjkOp6SkJiryIDxjGH
	fWRtRAA9Px+r9MMqaK4+dXrvsAiSr107Uw==
X-Google-Smtp-Source: AA6agR7Wnbnmr3BoQnSHvmXZDr2MSdOPfFwb8WV+/Vxhjy4cy1K8EMvI3s4uVeXtpKqQ3K0a+V+hAA==
X-Received: by 2002:a05:6512:23a5:b0:491:1fef:7f8f with SMTP id c37-20020a05651223a500b004911fef7f8fmr754220lfv.125.1660820180779;
        Thu, 18 Aug 2022 03:56:20 -0700 (PDT)
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
Subject: [PATCH v5 8/9] xen/arm: ffa: support guest FFA_PARTITION_INFO_GET
Date: Thu, 18 Aug 2022 12:56:00 +0200
Message-Id: <20220818105601.1896082-9-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220818105601.1896082-1-jens.wiklander@linaro.org>
References: <20220818105601.1896082-1-jens.wiklander@linaro.org>
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
 xen/arch/arm/ffa.c | 126 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 124 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/ffa.c b/xen/arch/arm/ffa.c
index 5e7211f0b4f6..d2872acc3474 100644
--- a/xen/arch/arm/ffa.c
+++ b/xen/arch/arm/ffa.c
@@ -188,6 +188,12 @@
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
@@ -204,9 +210,8 @@ struct ffa_ctx {
     uint32_t guest_vers;
     bool tx_is_mine;
     bool interrupted;
+    spinlock_t lock;
 };
-
-
 /* Negotiated FF-A version to use with the SPMC */
 static uint32_t ffa_version __read_mostly;
 
@@ -220,10 +225,16 @@ static unsigned int subscr_vm_destroyed_count __read_mostly;
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
@@ -510,6 +521,98 @@ static uint32_t handle_rxtx_unmap(void)
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
+    struct ffa_ctx *ctx = d->arch.ffa;
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
+    struct ffa_ctx *ctx = d->arch.ffa;
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
@@ -574,6 +677,7 @@ bool ffa_handle_call(struct cpu_user_regs *regs, uint32_t fid)
 {
     struct domain *d = current->domain;
     struct ffa_ctx *ctx = d->arch.ffa;
+    uint32_t count;
     int e;
 
     if ( !ctx )
@@ -605,6 +709,24 @@ bool ffa_handle_call(struct cpu_user_regs *regs, uint32_t fid)
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
2.31.1


