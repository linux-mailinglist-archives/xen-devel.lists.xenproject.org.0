Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 684CB5BC51B
	for <lists+xen-devel@lfdr.de>; Mon, 19 Sep 2022 11:13:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408579.651383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaCpj-0000HC-HQ; Mon, 19 Sep 2022 09:12:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408579.651383; Mon, 19 Sep 2022 09:12:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaCpj-0000DY-DO; Mon, 19 Sep 2022 09:12:55 +0000
Received: by outflank-mailman (input) for mailman id 408579;
 Mon, 19 Sep 2022 09:12:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3sJ0=ZW=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1oaCph-0007Fl-2L
 for xen-devel@lists.xenproject.org; Mon, 19 Sep 2022 09:12:53 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3099e9cf-37fb-11ed-bad8-01ff208a15ba;
 Mon, 19 Sep 2022 11:12:31 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id j16so18854656lfg.1
 for <xen-devel@lists.xenproject.org>; Mon, 19 Sep 2022 02:12:52 -0700 (PDT)
Received: from jade.urgonet (h-79-136-84-253.A175.priv.bahnhof.se.
 [79.136.84.253]) by smtp.gmail.com with ESMTPSA id
 f3-20020a05651c02c300b0025fdf1af42asm4815394ljo.78.2022.09.19.02.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 02:12:50 -0700 (PDT)
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
X-Inumbo-ID: 3099e9cf-37fb-11ed-bad8-01ff208a15ba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=fW+HOuAthe2zj2QR4QYWX0sNZcRkvvPLxIfXZPseyvA=;
        b=nJ992wnIUb+QKl4BkCiXrlnk8R0vYbvYNvYisr0vKT8xg8gmeIcCppwFLN/qypUoyq
         RvXMJKDNUtQR9UoLVpJL+tN3YK7rktI8CWaVqdUGWeV7mcMB29jGWmd29eDU+sBKpK4a
         r05IPt/H3w9rVoBFECvg3+hbWXVQtgJNNlUeh+zgKD7jHwOzS4Chqachdbg1vQX0r4mg
         lCEp8+Ycg9oe7l+nEyUXYJ7h2aJbOP203OHzI8UZ2b2FUfV59a8BBkxKkacj6+wgFxl8
         Zw8kHDtlDmFBaEELGRcqRpnkfXPQ0ugYyYSGvOsVx91vkjkno2aFD5HikJcJ8bBFDBfE
         H0Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=fW+HOuAthe2zj2QR4QYWX0sNZcRkvvPLxIfXZPseyvA=;
        b=5/K41PdTpJWXZ3+F9zhd2dJSLoEBB+WGxEzcyF4dlQonazOJuQRBaeXSUon6k7IrFd
         8xnGK8vN2vNREDBBRTol6zkR66stp9wkATzeXqtCb3dPno+cEq8HPNsBXtkUOpavo7lm
         Qa3KTHkgRGxohkJdd1l2ItlFM8hzbjoYpe/8ayypPAgY2e29kWKTJgn1K5WhGld/lzc3
         P6BEYdiHZFvRD7ef017Kkywfvw8SmhVtxc3DNtOoPo3KvOLTEcjFQNfx9J4jJEVa1OsF
         ExjRp8mzuZYR2hJFll+2yiPtWEuv+sS4vWfLVIbBzKNim5ie9liYAJe4tlg0dzDT2n8e
         snsA==
X-Gm-Message-State: ACrzQf2Nw73Rh//tieDdeJ7wn3K4AqFxSv0KhePF8fyY8bEQkpK0p2pv
	JPHT8907jO6JBe2wSULK1nG5ysFrSbe/UMAU
X-Google-Smtp-Source: AMsMyM6gvPM4SAz1fDLYinKsm/IA6OpO80ZaLT3MBqPMIH4pMJUMn4AN+WvD6ZDUunUi/9CUyrIewQ==
X-Received: by 2002:a05:6512:10d3:b0:499:cce2:37a8 with SMTP id k19-20020a05651210d300b00499cce237a8mr5674929lfg.169.1663578771228;
        Mon, 19 Sep 2022 02:12:51 -0700 (PDT)
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
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v6 5/9] xen/arm: ffa: send guest events to Secure Partitions
Date: Mon, 19 Sep 2022 11:12:34 +0200
Message-Id: <20220919091238.2068052-6-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220919091238.2068052-1-jens.wiklander@linaro.org>
References: <20220919091238.2068052-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The FF-A specification defines framework messages sent as direct
requests when certain events occurs. For instance when a VM (guest) is
created or destroyed. Only SPs which have subscribed to these events
will receive them. An SP can subscribe to these messages in its
partition properties.

The partition properties of each SP is retrieved with
FFA_PARTITION_INFO_GET which returns the information in our RX buffer.
Using FFA_PARTITION_INFO_GET changes the owner of the RX buffer to the
caller (us), so once we're done with the buffer it must be released
using FFA_RX_RELEASE before another call can be made.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/ffa.c | 192 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 191 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/ffa.c b/xen/arch/arm/ffa.c
index 8cb5c829a394..1e94113b20bd 100644
--- a/xen/arch/arm/ffa.c
+++ b/xen/arch/arm/ffa.c
@@ -187,6 +187,14 @@
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
     uint32_t guest_vers;
     bool interrupted;
@@ -195,6 +203,12 @@ struct ffa_ctx {
 /* Negotiated FF-A version to use with the SPMC */
 static uint32_t ffa_version __ro_after_init;
 
+/* SPs subscribing to VM_CREATE and VM_DESTROYED events */
+static uint16_t *subscr_vm_created __read_mostly;
+static unsigned int subscr_vm_created_count __read_mostly;
+static uint16_t *subscr_vm_destroyed __read_mostly;
+static unsigned int subscr_vm_destroyed_count __read_mostly;
+
 /*
  * Our rx/tx buffers shared with the SPMC.
  *
@@ -284,6 +298,72 @@ static int32_t ffa_rxtx_map(register_t tx_addr, register_t rx_addr,
     return ffa_simple_call(fid, tx_addr, rx_addr, page_count, 0);
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
 static u16 get_vm_id(const struct domain *d)
 {
     /* +1 since 0 is reserved for the hypervisor in FF-A */
@@ -431,6 +511,10 @@ uint32_t ffa_get_call_count(void)
 int ffa_domain_init(struct domain *d, uint32_t flags)
 {
     struct ffa_ctx *ctx;
+    unsigned int n;
+    unsigned int m;
+    unsigned int c_pos;
+    int32_t res;
 
     if ( !ffa_version || !(flags & XEN_ARM_FLAGS_FFA) )
         return -ENODEV;
@@ -439,19 +523,54 @@ int ffa_domain_init(struct domain *d, uint32_t flags)
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
     d->arch.ffa = ctx;
 
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
+    return -ENOMEM;
 }
 
 /* This function is supposed to undo what ffa_domain_init() has done */
 void ffa_domain_destroy(struct domain *d)
 {
     struct ffa_ctx *ctx = d->arch.ffa;
+    unsigned int n;
+    int32_t res;
 
     if ( !ctx )
         return;
 
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
     XFREE(d->arch.ffa);
 }
 
@@ -464,6 +583,68 @@ int ffa_relinquish_resources(struct domain *d)
     return 0;
 }
 
+static bool __init init_subscribers(void)
+{
+    struct ffa_partition_info_1_1 *fpi;
+    bool ret = false;
+    uint32_t count;
+    int e;
+    uint32_t n;
+    uint32_t c_pos;
+    uint32_t d_pos;
+
+    if ( ffa_version < FFA_VERSION_1_1 )
+        return true;
+
+    e = ffa_partition_info_get(0, 0, 0, 0, 0, &count);
+    if ( e )
+    {
+        printk(XENLOG_ERR "ffa: Failed to get list of SPs: %d\n", e);
+        goto out;
+    }
+
+    fpi = ffa_rx;
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
+        subscr_vm_created_count = 0;
+        subscr_vm_destroyed_count = 0;
+        XFREE(subscr_vm_created);
+        XFREE(subscr_vm_destroyed);
+        goto out;
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
+    ret = true;
+out:
+    ffa_rx_release();
+
+    return ret;
+}
+
 static int __init ffa_init(void)
 {
     uint32_t vers;
@@ -505,9 +686,11 @@ static int __init ffa_init(void)
     printk(XENLOG_INFO "ARM FF-A Firmware version %u.%u\n",
            major_vers, minor_vers);
 
-    if (
+    if ( !check_mandatory_feature(FFA_PARTITION_INFO_GET) ||
+         !check_mandatory_feature(FFA_RX_RELEASE) ||
 #ifdef CONFIG_ARM_64
          !check_mandatory_feature(FFA_RXTX_MAP_64) ||
+         !check_mandatory_feature(FFA_MEM_SHARE_64) ||
 #endif
 #ifdef CONFIG_ARM_32
          !check_mandatory_feature(FFA_RXTX_MAP_32) ||
@@ -533,6 +716,9 @@ static int __init ffa_init(void)
     ffa_page_count = 1;
     ffa_version = vers;
 
+    if ( !init_subscribers() )
+        goto err_free_ffa_tx;
+
     return 0;
 
 err_free_ffa_tx:
@@ -543,6 +729,10 @@ err_free_ffa_rx:
     ffa_rx = NULL;
     ffa_page_count = 0;
     ffa_version = 0;
+    XFREE(subscr_vm_created);
+    subscr_vm_created_count = 0;
+    XFREE(subscr_vm_destroyed);
+    subscr_vm_destroyed_count = 0;
 
     return 0;
 }
-- 
2.31.1


