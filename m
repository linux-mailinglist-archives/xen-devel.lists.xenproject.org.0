Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BEB69F80B
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 16:34:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499548.770808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUr8E-0003ZR-12; Wed, 22 Feb 2023 15:34:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499548.770808; Wed, 22 Feb 2023 15:34:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUr8C-0003Ft-Uq; Wed, 22 Feb 2023 15:34:08 +0000
Received: by outflank-mailman (input) for mailman id 499548;
 Wed, 22 Feb 2023 15:34:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvgA=6S=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pUr89-0001MC-9m
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 15:34:05 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56b60095-b2c6-11ed-a089-e9535cc0f9c3;
 Wed, 22 Feb 2023 16:34:04 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id k14so9541792lfj.7
 for <xen-devel@lists.xenproject.org>; Wed, 22 Feb 2023 07:34:04 -0800 (PST)
Received: from localhost.localdomain (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 q9-20020ac25289000000b004db0d26adb4sm927746lfm.182.2023.02.22.07.34.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 07:34:03 -0800 (PST)
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
X-Inumbo-ID: 56b60095-b2c6-11ed-a089-e9535cc0f9c3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NJzaZctbLN0X37KKF3Aj2PkBCjDMgRDd+78/Gv1GG98=;
        b=xW0vwRbqy+Pj5n+CkSZhIHnFgo7jW37etlbDh+MBLwGfNouZ1wHYvefyhsCl6XIezR
         MkpBOzKjOMVGpR4Knf3TTFFWoezZiLyAVTvBAyFPEQoKcrTpYgP1i4e5TqK/5kdIvw3a
         XhYK8HUYcodRDDVwQhcaoDbndxLV518PCJk/aNl7Uq/sV3yXmsfpo++GSRoaYX6GvEL5
         huJYZgDf+uqbD1Z/2lO3YTnoE3JeGiwl6kqZRM151xjUK6LCxRgfDMnMCt1tbbIMSkeW
         BuiM/4rd6hSwWaSUQzQAmszU5TiVa8MpXTEpZKQQ1oQ7otVPClvPYLs+DyVYB0li21t4
         1YEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NJzaZctbLN0X37KKF3Aj2PkBCjDMgRDd+78/Gv1GG98=;
        b=tlaqueQ9jYQFKqkMrFHW+82TDXoRDZTjuee63R58Awcfeu7Zqx9YhfW6QMQfd9cfMD
         uvgZFYXIZhkSnodsWmVVwzoAeizJ0NFHkiCK98/cOPHjnbXtFrENRAop/FS9w+/TOUa3
         5ck6ZuqTO6pJVDyy/6wnsSxEgN+D5/HJHj2SUUlXyYvAE8NITLCHD/r4jPjQikt6qSjV
         YWVWjW/nkwlyToZP/Wh9uzFMCIDJZuS3z6XGQSieIaYfGNKXHxhNTOlOEZZetBF71laE
         U929eJB41jrrimG4WfsdDnwSno2EhBIwI5/9jhrxhXv1BePm93eBEAhzsA8xRRdG/42t
         YO1g==
X-Gm-Message-State: AO0yUKViLc6z+2E19yEiLWAsjcU2WgzeK5c7i1Hd5tHlqk2ctK98y9DQ
	kLDeTy2zLXftZZcBkcUF1iT/rinDKQecPXgwyYw=
X-Google-Smtp-Source: AK7set+kbgkO0xYcIfALEaMQ3URs/Gg48aA5WIJtUSrrOKjk1+heIZ1I7EoUZOCEb4HMmQ0fJRPLFQ==
X-Received: by 2002:ac2:5229:0:b0:4da:b5d4:efd5 with SMTP id i9-20020ac25229000000b004dab5d4efd5mr2902410lfl.60.1677080044182;
        Wed, 22 Feb 2023 07:34:04 -0800 (PST)
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
Subject: [XEN PATCH v7 12/20] xen/arm: ffa: send guest events to Secure Partitions
Date: Wed, 22 Feb 2023 16:33:09 +0100
Message-Id: <cfd9ae67bdf24bee796b418937dd1486018fd188.1677079672.git.jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677079671.git.jens.wiklander@linaro.org>
References: <cover.1677079671.git.jens.wiklander@linaro.org>
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
 xen/arch/arm/tee/ffa.c | 191 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 190 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 07dd5c36d54b..f1b014b6c7f4 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -140,6 +140,14 @@
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
@@ -148,6 +156,12 @@ struct ffa_ctx {
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
@@ -237,6 +251,72 @@ static int32_t ffa_rxtx_map(register_t tx_addr, register_t rx_addr,
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
 static uint16_t get_vm_id(const struct domain *d)
 {
     /* +1 since 0 is reserved for the hypervisor in FF-A */
@@ -371,6 +451,10 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
 static int ffa_domain_init(struct domain *d)
 {
     struct ffa_ctx *ctx;
+    unsigned int n;
+    unsigned int m;
+    unsigned int c_pos;
+    int32_t res;
 
      /*
       * We can't use that last possible domain ID or get_vm_id() would cause
@@ -383,24 +467,121 @@ static int ffa_domain_init(struct domain *d)
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
+    return -ENOMEM;
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
 
+static bool init_subscribers(void)
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
 static bool ffa_probe(void)
 {
     uint32_t vers;
@@ -447,7 +628,8 @@ static bool ffa_probe(void)
     printk(XENLOG_INFO "ARM FF-A Firmware version %u.%u\n",
            major_vers, minor_vers);
 
-    if (
+    if ( !check_mandatory_feature(FFA_PARTITION_INFO_GET) ||
+         !check_mandatory_feature(FFA_RX_RELEASE) ||
 #ifdef CONFIG_ARM_64
          !check_mandatory_feature(FFA_RXTX_MAP_64) ||
 #endif
@@ -475,6 +657,9 @@ static bool ffa_probe(void)
     ffa_page_count = 1;
     ffa_version = vers;
 
+    if ( !init_subscribers() )
+        goto err_free_ffa_tx;
+
     return true;
 
 err_free_ffa_tx:
@@ -485,6 +670,10 @@ err_free_ffa_rx:
     ffa_rx = NULL;
     ffa_page_count = 0;
     ffa_version = 0;
+    XFREE(subscr_vm_created);
+    subscr_vm_created_count = 0;
+    XFREE(subscr_vm_destroyed);
+    subscr_vm_destroyed_count = 0;
 
     return false;
 }
-- 
2.34.1


