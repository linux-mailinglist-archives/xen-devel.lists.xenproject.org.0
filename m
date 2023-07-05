Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75792748126
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 11:39:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558964.873593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGyz6-0000nM-C7; Wed, 05 Jul 2023 09:39:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558964.873593; Wed, 05 Jul 2023 09:39:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGyz6-0000fv-4s; Wed, 05 Jul 2023 09:39:40 +0000
Received: by outflank-mailman (input) for mailman id 558964;
 Wed, 05 Jul 2023 09:39:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hy0b=CX=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qGyv6-0005bC-8e
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 09:35:32 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48196d2b-1b17-11ee-8611-37d641c3527e;
 Wed, 05 Jul 2023 11:35:30 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4fb761efa7aso10061091e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Jul 2023 02:35:30 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 q22-20020a2e84d6000000b002b6d8cfb6d2sm2910625ljh.140.2023.07.05.02.35.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 02:35:29 -0700 (PDT)
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
X-Inumbo-ID: 48196d2b-1b17-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688549729; x=1691141729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKMZdOi/Dn1qjCZASYiDWBzyjEGqNklqsbHI8w4JIKE=;
        b=Yo5l1JORxuZq/AUfzucBeFEkCWltsrQvif6qfvakkf/kwf/4KYHoc0MC98lzbMGREb
         EfNs/oicp1xaYXvNIWJKg8PyoQLn7y+F2uFlNRg+FF43I0Ba87D2VEyyW90oGX4h76Vs
         rJsenLywtkD+ftIKurzhDSxTwiZdiyAOYEZn+Am7Gm4pRiHjkgYU0poeYdbVt2z7l/XU
         7vuU1FTgN33kJA10NP3o2UBTItvsz3humY+lJLwqs5X7NRQFmr3PwAeSDNgG0BuINNI+
         kufYDlA+lYx7Wp14s7zjTNwMll2Zx2b/HF0lzxsJfkF7+l29zqBtMpgl0AfNDyyWf5/l
         5e8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688549729; x=1691141729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xKMZdOi/Dn1qjCZASYiDWBzyjEGqNklqsbHI8w4JIKE=;
        b=CAPFmpfpP3j0vTFCaLqY7/S+/e30p7Lss1LFzA4L9j6peO3pafYHYcjM0z4u8URQjT
         NpfSuOCziDEE1q5xh7zFPYTfyrxWN94EG8f1GDYSkunmIFnHWL7fmc/UZHACwENBAySv
         wbLNcOnJTSi7qOGhqUXYFdIOYi8vmljDKspCoQ+0Un09+JD+dToxQEJhL/mCVRp4uf9e
         yf8twPqtsp49Bi6M/y+DQzfEHuhudI8P4trWeISzSPqAtRrSDjBOUxodhy443WZtcAw6
         /duJHMkk6YFkJGxcWpHqy99c/OIPnQ2XgyfzS2PSnA+4z+RCTVGUGzTdrgY39p/sbOCi
         CEMQ==
X-Gm-Message-State: ABy/qLYkcq7gaOjUBFZ1Jvm3w6Mo7fau+wQBJO6GiVNO5irb7K84PY1U
	TEexO3HFPcqlKp7lG3UEsu0itKjs7B2srBOxf20=
X-Google-Smtp-Source: APBJJlG1vx41HWZkhZrzm5Al4+cHWA0wwjhNJ5mLa89tKq4ICxneInL0vwVIY3DuVhJznqjeNzdDrA==
X-Received: by 2002:a2e:9599:0:b0:2b6:c818:a9bc with SMTP id w25-20020a2e9599000000b002b6c818a9bcmr11146517ljh.23.1688549729693;
        Wed, 05 Jul 2023 02:35:29 -0700 (PDT)
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
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [XEN PATCH v9 12/24] xen/arm: ffa: send guest events to Secure Partitions
Date: Wed,  5 Jul 2023 11:34:21 +0200
Message-Id: <20230705093433.2514898-13-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230705093433.2514898-1-jens.wiklander@linaro.org>
References: <20230705093433.2514898-1-jens.wiklander@linaro.org>
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
 xen/arch/arm/tee/ffa.c | 233 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 231 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index f8ccaabc568d..d755363de686 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -160,14 +160,33 @@
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
+    /*
+     * Number of SPs that we have sent a VM created signal to, used in
+     * ffa_domain_teardown() to know which SPs need to be signalled.
+     */
+    uint16_t create_signal_count;
 };
 
 /* Negotiated FF-A version to use with the SPMC */
 static uint32_t __ro_after_init ffa_version;
 
+/* SPs subscribing to VM_CREATE and VM_DESTROYED events */
+static uint16_t *subscr_vm_created __read_mostly;
+static uint16_t subscr_vm_created_count __read_mostly;
+static uint16_t *subscr_vm_destroyed __read_mostly;
+static uint16_t subscr_vm_destroyed_count __read_mostly;
+
 /*
  * Our rx/tx buffers shared with the SPMC. FFA_RXTX_PAGE_COUNT is the
  * number of pages used in each of these buffers.
@@ -251,6 +270,87 @@ static int32_t ffa_rxtx_map(paddr_t tx_addr, paddr_t rx_addr,
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
+    unsigned int retry_count = 0;
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
+        if ( ++retry_count > 10 )
+        {
+            /*
+             * TODO
+             * FFA_RET_INTERRUPTED means that the SPMC has a pending
+             * non-secure interrupt, we need a way of delivering that
+             * non-secure interrupt.
+             * FFA_RET_RETRY is the SP telling us that it's temporarily
+             * blocked from handling the direct request, we need a generic
+             * way to deal with this.
+             * For now in both cases, give up after a few retries.
+             */
+            return res;
+        }
+    } while ( res == FFA_RET_INTERRUPTED || res == FFA_RET_RETRY );
+
+    return res;
+}
+
 static uint16_t get_vm_id(const struct domain *d)
 {
     /* +1 since 0 is reserved for the hypervisor in FF-A */
@@ -374,6 +474,8 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
 static int ffa_domain_init(struct domain *d)
 {
     struct ffa_ctx *ctx;
+    unsigned int n;
+    int32_t res;
 
     if ( !ffa_version )
         return -ENODEV;
@@ -387,20 +489,68 @@ static int ffa_domain_init(struct domain *d)
     ctx = xzalloc(struct ffa_ctx);
     if ( !ctx )
         return -ENOMEM;
-
     d->arch.tee = ctx;
 
+    for ( n = 0; n < subscr_vm_created_count; n++ )
+    {
+        res = ffa_direct_req_send_vm(subscr_vm_created[n], get_vm_id(d),
+                                     FFA_MSG_SEND_VM_CREATED);
+        if ( res )
+        {
+            printk(XENLOG_ERR "ffa: Failed to report creation of vm_id %u to  %u: res %d\n",
+                   get_vm_id(d), subscr_vm_created[n], res);
+            ctx->create_signal_count = n;
+            return -EIO;
+        }
+    }
+    ctx->create_signal_count = n;
+
     return 0;
 }
 
+static bool is_in_subscr_list(const uint16_t *subscr, uint16_t start,
+                              uint16_t end, uint16_t vm_id)
+{
+    unsigned int n;
+
+    for (n = start; n < end; n++)
+    {
+        if (subscr[n] == vm_id)
+            return true;
+    }
+
+    return false;
+}
+
 /* This function is supposed to undo what ffa_domain_init() has done */
 static int ffa_domain_teardown(struct domain *d)
 {
     struct ffa_ctx *ctx = d->arch.tee;
+    unsigned int n;
+    int32_t res;
 
     if ( !ctx )
         return 0;
 
+    for ( n = 0; n < subscr_vm_destroyed_count; n++ )
+    {
+        /*
+         * Skip SPs subscribed to the VM created event that never was
+         * notified of the VM creation due to an error during
+         * ffa_domain_init().
+         */
+        if ( is_in_subscr_list(subscr_vm_created, ctx->create_signal_count,
+                               subscr_vm_created_count, get_vm_id(d)) )
+            continue;
+
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
@@ -411,6 +561,81 @@ static int ffa_relinquish_resources(struct domain *d)
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
@@ -462,7 +687,8 @@ static bool ffa_probe(void)
      * TODO: Rework the code to allow domain to use a subset of the
      * features supported.
      */
-    if (
+    if ( !check_mandatory_feature(FFA_PARTITION_INFO_GET) ||
+         !check_mandatory_feature(FFA_RX_RELEASE) ||
          !check_mandatory_feature(FFA_RXTX_MAP_64) ||
          !check_mandatory_feature(FFA_RXTX_UNMAP) ||
          !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
@@ -484,6 +710,9 @@ static bool ffa_probe(void)
     }
     ffa_version = vers;
 
+    if ( !init_sps() )
+        goto err_free_ffa_tx;
+
     return true;
 
 err_free_ffa_tx:
-- 
2.34.1


