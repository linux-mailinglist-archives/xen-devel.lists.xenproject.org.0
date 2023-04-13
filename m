Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AC66E0785
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 09:16:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520471.808145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmrBV-0004Qk-EC; Thu, 13 Apr 2023 07:15:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520471.808145; Thu, 13 Apr 2023 07:15:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmrBV-0004EK-7d; Thu, 13 Apr 2023 07:15:57 +0000
Received: by outflank-mailman (input) for mailman id 520471;
 Thu, 13 Apr 2023 07:15:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UVxt=AE=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pmrBR-0001gq-5d
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 07:15:53 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 063a7a26-d9cb-11ed-b21e-6b7b168915f2;
 Thu, 13 Apr 2023 09:15:52 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id t14so17730699lft.7
 for <xen-devel@lists.xenproject.org>; Thu, 13 Apr 2023 00:15:52 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 n12-20020ac2490c000000b004dc83d04840sm181354lfi.79.2023.04.13.00.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 00:15:51 -0700 (PDT)
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
X-Inumbo-ID: 063a7a26-d9cb-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681370152; x=1683962152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LUHuc1SEEBwu3k5oaDgiHqlkqyD0euvjsOMhi6KaWmA=;
        b=rHpQDktneg32sQ9YVbFF0X51AsyYDiifK58Xl6+ydvoAcCLhMgdnDWl5hEGDcekivh
         zeU7sI6uJZ0O1dO9+Udg6oabVH15iMsF5vRxpKMc75/sBa9WFlfpQ1bCPxEa7xSkIM41
         qWEfgPaFjFmsHbHNbx/ePFpnjGMSfJQeae9lCw8W5ZBfN/Vv+CjzSngNOnlG0dM6D8rP
         N+02TE1AhUSXP4+QOnzMk0Y77sKVXrZPluGGccgF1z6hqOk42O8xPvqZUR0Z9zCXxaI3
         QWuNqNQsFMJPmayiVuuNOOBtt6U9NrzW1Thb4ojCGX5+VdIJnvPNfoWfATq+8NaW4//s
         8CBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681370152; x=1683962152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LUHuc1SEEBwu3k5oaDgiHqlkqyD0euvjsOMhi6KaWmA=;
        b=KvtpL24WaElCQw44odIJDkUwgbqnUSiRBMCBRvRYrCu755pRD8MU+jyuGO1fVMat8y
         FpAA+M6aFgLWGWikALCUDSnE5KKwPX5m0ijPhHQDEXFkW1zvs35B0N8AjTu+tdLgDPem
         ukjFKyTrZDOKrhFQtysDDp02ZGCcLAEknDCmBCaU0MqOd1wSYkhRSe1Qm4ICYTwfRQq7
         2KJ9eH5sSS5h0bWikZVJ8n/rPFK5nbsT4oRjD5pBX9ap+Y4hSS2UILbSFW7JQsRkf3Xt
         pAkN8dMu6ka1WhFrRERt2fA5kYkb2D5jSTLkWMXj4xJ7nQpxNZjMctLbPrvXYaVz5Bd0
         mlwA==
X-Gm-Message-State: AAQBX9d3JuggbsSJ+DXmhGXzTfEENEmUDp5/scjWmNeeyfT4HrVvm16l
	hsZgsrtYDX+e6AL4avVVT3bwAWMFzsKbz4Q1MqA=
X-Google-Smtp-Source: AKy350Y1XOnbdxrY/+pdsHCDPtT49ARaxmuTprdYzygYwrCh8xdQWpD3Nq34I2yYJHU8uH8uB6T+CA==
X-Received: by 2002:ac2:5d4e:0:b0:4eb:c18:efae with SMTP id w14-20020ac25d4e000000b004eb0c18efaemr591339lfd.17.1681370151879;
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
Subject: [XEN PATCH v8 11/22] xen/arm: ffa: send guest events to Secure Partitions
Date: Thu, 13 Apr 2023 09:14:13 +0200
Message-Id: <20230413071424.3273490-12-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230413071424.3273490-1-jens.wiklander@linaro.org>
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The FF-A specification defines framework messages sent as direct
requests when certain events occurs. For instance when a VM (guest) is
created or destroyed. Only SPs which have subscribed to these events
will receive them. An SP can subscribe to these messages in its
partition properties.

Adds a check that the SP supports the needed FF-A features
FFA_PARTITION_INFO_GET and FFA_RX_RELEASE.

The partition properties of each SP is retrieved with
FFA_PARTITION_INFO_GET which returns the information in our RX buffer.
Using FFA_PARTITION_INFO_GET changes the owner of the RX buffer to the
caller (us), so once we're done with the buffer it must be released
using FFA_RX_RELEASE before another call can be made.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/tee/ffa.c | 200 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 199 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 054121fe4321..b4fea65ce31d 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -160,6 +160,14 @@
 #define FFA_MSG_SEND                    0x8400006EU
 #define FFA_MSG_POLL                    0x8400006AU
 
+/* Partition information descriptor */
+struct ffa_partition_info_1_1 {
+    uint16_t id;
+    uint16_t execution_context;
+    uint32_t partition_properties;
+    uint8_t uuid[16];
+};
+
 struct ffa_ctx {
     /* FF-A version used by the guest */
     uint32_t guest_vers;
@@ -168,6 +176,12 @@ struct ffa_ctx {
 /* Negotiated FF-A version to use with the SPMC */
 static uint32_t ffa_version __ro_after_init;
 
+/* SPs subscribing to VM_CREATE and VM_DESTROYED events */
+static uint16_t *subscr_vm_created __read_mostly;
+static uint16_t subscr_vm_created_count __read_mostly;
+static uint16_t *subscr_vm_destroyed __read_mostly;
+static uint16_t subscr_vm_destroyed_count __read_mostly;
+
 /*
  * Our rx/tx buffers shared with the SPMC. FFA_RXTX_PAGE_COUNT is the
  * number of pages used in each of these buffers.
@@ -251,6 +265,72 @@ static int32_t ffa_rxtx_map(paddr_t tx_addr, paddr_t rx_addr,
     return ffa_simple_call(FFA_RXTX_MAP_64, tx_addr, rx_addr, page_count, 0);
 }
 
+static int32_t ffa_partition_info_get(uint32_t w1, uint32_t w2, uint32_t w3,
+                                      uint32_t w4, uint32_t w5,
+                                      uint32_t *count)
+{
+    const struct arm_smccc_1_2_regs arg = {
+        .a0 = FFA_PARTITION_INFO_GET,
+        .a1 = w1,
+        .a2 = w2,
+        .a3 = w3,
+        .a4 = w4,
+        .a5 = w5,
+    };
+    struct arm_smccc_1_2_regs resp;
+    uint32_t ret;
+
+    arm_smccc_1_2_smc(&arg, &resp);
+
+    ret = get_ffa_ret_code(&resp);
+    if ( !ret )
+        *count = resp.a2;
+
+    return ret;
+}
+
+static int32_t ffa_rx_release(void)
+{
+    return ffa_simple_call(FFA_RX_RELEASE, 0, 0, 0, 0);
+}
+
+static int32_t ffa_direct_req_send_vm(uint16_t sp_id, uint16_t vm_id,
+                                      uint8_t msg)
+{
+    uint32_t exp_resp = FFA_MSG_FLAG_FRAMEWORK;
+    int32_t res;
+
+    if ( msg == FFA_MSG_SEND_VM_CREATED )
+        exp_resp |= FFA_MSG_RESP_VM_CREATED;
+    else if ( msg == FFA_MSG_SEND_VM_DESTROYED )
+        exp_resp |= FFA_MSG_RESP_VM_DESTROYED;
+    else
+        return FFA_RET_INVALID_PARAMETERS;
+
+    do {
+        const struct arm_smccc_1_2_regs arg = {
+            .a0 = FFA_MSG_SEND_DIRECT_REQ_32,
+            .a1 = sp_id,
+            .a2 = FFA_MSG_FLAG_FRAMEWORK | msg,
+            .a5 = vm_id,
+        };
+        struct arm_smccc_1_2_regs resp;
+
+        arm_smccc_1_2_smc(&arg, &resp);
+        if ( resp.a0 != FFA_MSG_SEND_DIRECT_RESP_32 || resp.a2 != exp_resp )
+        {
+            /*
+             * This is an invalid response, likely due to some error in the
+             * implementation of the ABI.
+             */
+            return FFA_RET_INVALID_PARAMETERS;
+        }
+        res = resp.a3;
+    } while ( res == FFA_RET_INTERRUPTED || res == FFA_RET_RETRY );
+
+    return res;
+}
+
 static uint16_t get_vm_id(const struct domain *d)
 {
     /* +1 since 0 is reserved for the hypervisor in FF-A */
@@ -374,6 +454,10 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
 static int ffa_domain_init(struct domain *d)
 {
     struct ffa_ctx *ctx;
+    unsigned int n;
+    unsigned int m;
+    unsigned int c_pos;
+    int32_t res;
 
     if ( !ffa_version )
         return -ENODEV;
@@ -388,24 +472,134 @@ static int ffa_domain_init(struct domain *d)
     if ( !ctx )
         return -ENOMEM;
 
+    for ( n = 0; n < subscr_vm_created_count; n++ )
+    {
+        res = ffa_direct_req_send_vm(subscr_vm_created[n], get_vm_id(d),
+                                     FFA_MSG_SEND_VM_CREATED);
+        if ( res )
+        {
+            printk(XENLOG_ERR "ffa: Failed to report creation of vm_id %u to  %u: res %d\n",
+                   get_vm_id(d), subscr_vm_created[n], res);
+            c_pos = n;
+            goto err;
+        }
+    }
+
     d->arch.tee = ctx;
 
     return 0;
+
+err:
+    /* Undo any already sent vm created messaged */
+    for ( n = 0; n < c_pos; n++ )
+        for ( m = 0; m < subscr_vm_destroyed_count; m++ )
+            if ( subscr_vm_destroyed[m] == subscr_vm_created[n] )
+                ffa_direct_req_send_vm(subscr_vm_destroyed[n], get_vm_id(d),
+                                       FFA_MSG_SEND_VM_DESTROYED);
+
+    return -EIO;
 }
 
 /* This function is supposed to undo what ffa_domain_init() has done */
 static int ffa_relinquish_resources(struct domain *d)
 {
     struct ffa_ctx *ctx = d->arch.tee;
+    unsigned int n;
+    int32_t res;
 
     if ( !ctx )
         return 0;
 
+    for ( n = 0; n < subscr_vm_destroyed_count; n++ )
+    {
+        res = ffa_direct_req_send_vm(subscr_vm_destroyed[n], get_vm_id(d),
+                                     FFA_MSG_SEND_VM_DESTROYED);
+
+        if ( res )
+            printk(XENLOG_ERR "ffa: Failed to report destruction of vm_id %u to  %u: res %d\n",
+                   get_vm_id(d), subscr_vm_destroyed[n], res);
+    }
+
     XFREE(d->arch.tee);
 
     return 0;
 }
 
+static void uninit_subscribers(void)
+{
+        subscr_vm_created_count = 0;
+        subscr_vm_destroyed_count = 0;
+        XFREE(subscr_vm_created);
+        XFREE(subscr_vm_destroyed);
+}
+
+static bool init_subscribers(struct ffa_partition_info_1_1 *fpi, uint16_t count)
+{
+    uint16_t n;
+    uint16_t c_pos;
+    uint16_t d_pos;
+
+    subscr_vm_created_count = 0;
+    subscr_vm_destroyed_count = 0;
+    for ( n = 0; n < count; n++ )
+    {
+        if (fpi[n].partition_properties & FFA_PART_PROP_NOTIF_CREATED)
+            subscr_vm_created_count++;
+        if (fpi[n].partition_properties & FFA_PART_PROP_NOTIF_DESTROYED)
+            subscr_vm_destroyed_count++;
+    }
+
+    if ( subscr_vm_created_count )
+        subscr_vm_created = xzalloc_array(uint16_t, subscr_vm_created_count);
+    if ( subscr_vm_destroyed_count )
+        subscr_vm_destroyed = xzalloc_array(uint16_t,
+                                            subscr_vm_destroyed_count);
+    if ( (subscr_vm_created_count && !subscr_vm_created) ||
+         (subscr_vm_destroyed_count && !subscr_vm_destroyed) )
+    {
+        printk(XENLOG_ERR "ffa: Failed to allocate subscription lists\n");
+        uninit_subscribers();
+        return false;
+    }
+
+    for ( c_pos = 0, d_pos = 0, n = 0; n < count; n++ )
+    {
+        if ( fpi[n].partition_properties & FFA_PART_PROP_NOTIF_CREATED )
+            subscr_vm_created[c_pos++] = fpi[n].id;
+        if ( fpi[n].partition_properties & FFA_PART_PROP_NOTIF_DESTROYED )
+            subscr_vm_destroyed[d_pos++] = fpi[n].id;
+    }
+
+    return true;
+}
+
+static bool init_sps(void)
+{
+    bool ret = false;
+    uint32_t count;
+    int e;
+
+    e = ffa_partition_info_get(0, 0, 0, 0, 0, &count);
+    if ( e )
+    {
+        printk(XENLOG_ERR "ffa: Failed to get list of SPs: %d\n", e);
+        goto out;
+    }
+
+    if ( count >= UINT16_MAX )
+    {
+        printk(XENLOG_ERR "ffa: Impossible number of SPs: %u\n", count);
+        goto out;
+    }
+
+    ret = init_subscribers(ffa_rx, count);
+
+out:
+    ffa_rx_release();
+
+    return ret;
+}
+
 static bool ffa_probe(void)
 {
     uint32_t vers;
@@ -456,7 +650,8 @@ static bool ffa_probe(void)
      * TODO save result of checked features and use that information to
      * accept or reject requests from guests.
      */
-    if (
+    if ( !check_mandatory_feature(FFA_PARTITION_INFO_GET) ||
+         !check_mandatory_feature(FFA_RX_RELEASE) ||
          !check_mandatory_feature(FFA_RXTX_MAP_64) ||
          !check_mandatory_feature(FFA_RXTX_UNMAP) ||
          !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
@@ -478,6 +673,9 @@ static bool ffa_probe(void)
     }
     ffa_version = vers;
 
+    if ( !init_sps() )
+        goto err_free_ffa_tx;
+
     return true;
 
 err_free_ffa_tx:
-- 
2.34.1


