Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 874AD889870
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 10:39:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697651.1088644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rognX-0002DA-5u; Mon, 25 Mar 2024 09:39:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697651.1088644; Mon, 25 Mar 2024 09:39:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rognW-00025R-VV; Mon, 25 Mar 2024 09:39:18 +0000
Received: by outflank-mailman (input) for mailman id 697651;
 Mon, 25 Mar 2024 09:39:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lWJZ=K7=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1rognU-0001fs-Tg
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 09:39:17 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8aab2411-ea8b-11ee-a1ef-f123f15fe8a2;
 Mon, 25 Mar 2024 10:39:14 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a46dd7b4bcbso502636966b.3
 for <xen-devel@lists.xenproject.org>; Mon, 25 Mar 2024 02:39:14 -0700 (PDT)
Received: from rayden.urgonet (h-217-31-164-171.A175.priv.bahnhof.se.
 [217.31.164.171]) by smtp.gmail.com with ESMTPSA id
 bw26-20020a170906c1da00b00a4650ec48d0sm2891067ejb.140.2024.03.25.02.39.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 02:39:12 -0700 (PDT)
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
X-Inumbo-ID: 8aab2411-ea8b-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711359554; x=1711964354; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PzsRxNmHMhveXO5ZjFcn97aQMNBLyTGR+eqStIm9hyM=;
        b=rr5WKUBA02YLv9EjwUfd131Nma4cHflQPJihm+rK41c4eUNdM+rgRHFMXxZGH/ezeN
         zaNxqEi86IWNlFsZWKQQJ5zoMnA0bC1W9g5rE+Nr++J2Ql+enibZwJO1eUZ4F6Bfnvn6
         4eSOt5vw7GqP3yI0OgOt7qgRujklIwCG3Mty5MCHXLOexq+IAN/LtDiKCDq7TYpZMqS8
         inVC0rbvG1LqVtjaYXZ7tzaf1pQxcyYFpjMRVM8fjVsCBcL2kQtzayoDUNcsIqXcFnQJ
         pYEbSF6LIwXfQpcOatknI0qXsWiXrVU1NpTgyexu2Ed7nG9KSolFyFtQjABY2q1IOxFv
         BwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711359554; x=1711964354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PzsRxNmHMhveXO5ZjFcn97aQMNBLyTGR+eqStIm9hyM=;
        b=HZT7+GSuEgCINGcW9KvJNAPShkcukTIUwoJtVNTVr2jFqdelf/icdCPGjtLeP0N01l
         clzCyr4EZvCQfDPYIUIDs0Avb1wq1Z87JCiLeOEtYkYxMUyEHpkqXQgwCZ8mp5Xybq4w
         Wk5L/MhyfZ08v/hO5dwHMhjQU4IL3G704QLe73kwKDtjyGqtVM36SfiXjt9VqYxqyTR3
         b/xWoK+omRi6NRRCegaq51rupEN5PX/Wm591R82San9oPJR9Rpz7ne0fiah/kmfK9GZr
         Mn6uoAh79XNDhfkqBuiWHKCrZPxqxIEciG3vyLUp13LNlcV2sxLuXu5hhhlSWXTUUXce
         S4FA==
X-Gm-Message-State: AOJu0Yxm2t5mWdWi8VHWjsa9vCFKGWbpcmaybk3dqc1h8MAGXb7X73U0
	WFk9U3TMyhrp4lLaaJhMeSdPZX55MedR4HwpkQlKreQ6uGkwT+e7JtjkJKz3E+whKkbXIcXxiQr
	y
X-Google-Smtp-Source: AGHT+IHh5mGkgaIVnascEeRce7dQf+zvLCaRAKvMxcd/yEHFecAID8bjugZZ7vmws1WWtbw8XLtUjg==
X-Received: by 2002:a17:906:2a07:b0:a47:ea3:9a09 with SMTP id j7-20020a1709062a0700b00a470ea39a09mr4201697eje.46.1711359553364;
        Mon, 25 Mar 2024 02:39:13 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: patches@linaro.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [XEN PATCH 4/6] xen/arm: ffa: separate partition info get routines
Date: Mon, 25 Mar 2024 10:39:02 +0100
Message-Id: <20240325093904.3466092-5-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240325093904.3466092-1-jens.wiklander@linaro.org>
References: <20240325093904.3466092-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move partition info get routines into a separate file for easier
navigation in the source code.

Add ffa_partinfo_init(), ffa_partinfo_domain_init(), and
ffa_partinfo_domain_destroy() to handle the ffa_partinfo internal things
on initialization and teardown.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/tee/Makefile       |   1 +
 xen/arch/arm/tee/ffa.c          | 359 +-----------------------------
 xen/arch/arm/tee/ffa_partinfo.c | 373 ++++++++++++++++++++++++++++++++
 xen/arch/arm/tee/ffa_private.h  |  14 +-
 4 files changed, 398 insertions(+), 349 deletions(-)
 create mode 100644 xen/arch/arm/tee/ffa_partinfo.c

diff --git a/xen/arch/arm/tee/Makefile b/xen/arch/arm/tee/Makefile
index 0e683d23aa9d..be644fba8055 100644
--- a/xen/arch/arm/tee/Makefile
+++ b/xen/arch/arm/tee/Makefile
@@ -1,4 +1,5 @@
 obj-$(CONFIG_FFA) += ffa.o
 obj-$(CONFIG_FFA) += ffa_shm.o
+obj-$(CONFIG_FFA) += ffa_partinfo.o
 obj-y += tee.o
 obj-$(CONFIG_OPTEE) += optee.o
diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index db36292dc52f..7a2803881420 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -70,20 +70,6 @@
  * structs ending with _1_1 are defined in FF-A-1.1-REL0.
  */
 
-/* Partition information descriptor */
-struct ffa_partition_info_1_0 {
-    uint16_t id;
-    uint16_t execution_context;
-    uint32_t partition_properties;
-};
-
-struct ffa_partition_info_1_1 {
-    uint16_t id;
-    uint16_t execution_context;
-    uint32_t partition_properties;
-    uint8_t uuid[16];
-};
-
 /* Endpoint RX/TX descriptor */
 struct ffa_endpoint_rxtx_descriptor_1_0 {
     uint16_t sender_id;
@@ -102,11 +88,6 @@ struct ffa_endpoint_rxtx_descriptor_1_1 {
 /* Negotiated FF-A version to use with the SPMC */
 static uint32_t __ro_after_init ffa_version;
 
-/* SPs subscribing to VM_CREATE and VM_DESTROYED events */
-static uint16_t *subscr_vm_created __read_mostly;
-static uint16_t subscr_vm_created_count __read_mostly;
-static uint16_t *subscr_vm_destroyed __read_mostly;
-static uint16_t subscr_vm_destroyed_count __read_mostly;
 
 /*
  * Our rx/tx buffers shared with the SPMC. FFA_RXTX_PAGE_COUNT is the
@@ -170,90 +151,6 @@ static int32_t ffa_rxtx_map(paddr_t tx_addr, paddr_t rx_addr,
     return ffa_simple_call(FFA_RXTX_MAP_64, tx_addr, rx_addr, page_count, 0);
 }
 
-static int32_t ffa_partition_info_get(uint32_t w1, uint32_t w2, uint32_t w3,
-                                      uint32_t w4, uint32_t w5,
-                                      uint32_t *count, uint32_t *fpi_size)
-{
-    const struct arm_smccc_1_2_regs arg = {
-        .a0 = FFA_PARTITION_INFO_GET,
-        .a1 = w1,
-        .a2 = w2,
-        .a3 = w3,
-        .a4 = w4,
-        .a5 = w5,
-    };
-    struct arm_smccc_1_2_regs resp;
-    uint32_t ret;
-
-    arm_smccc_1_2_smc(&arg, &resp);
-
-    ret = ffa_get_ret_code(&resp);
-    if ( !ret )
-    {
-        *count = resp.a2;
-        *fpi_size = resp.a3;
-    }
-
-    return ret;
-}
-
-static int32_t ffa_rx_release(void)
-{
-    return ffa_simple_call(FFA_RX_RELEASE, 0, 0, 0, 0);
-}
-
-static int32_t ffa_direct_req_send_vm(uint16_t sp_id, uint16_t vm_id,
-                                      uint8_t msg)
-{
-    uint32_t exp_resp = FFA_MSG_FLAG_FRAMEWORK;
-    unsigned int retry_count = 0;
-    int32_t res;
-
-    if ( msg == FFA_MSG_SEND_VM_CREATED )
-        exp_resp |= FFA_MSG_RESP_VM_CREATED;
-    else if ( msg == FFA_MSG_SEND_VM_DESTROYED )
-        exp_resp |= FFA_MSG_RESP_VM_DESTROYED;
-    else
-        return FFA_RET_INVALID_PARAMETERS;
-
-    do {
-        const struct arm_smccc_1_2_regs arg = {
-            .a0 = FFA_MSG_SEND_DIRECT_REQ_32,
-            .a1 = sp_id,
-            .a2 = FFA_MSG_FLAG_FRAMEWORK | msg,
-            .a5 = vm_id,
-        };
-        struct arm_smccc_1_2_regs resp;
-
-        arm_smccc_1_2_smc(&arg, &resp);
-        if ( resp.a0 != FFA_MSG_SEND_DIRECT_RESP_32 || resp.a2 != exp_resp )
-        {
-            /*
-             * This is an invalid response, likely due to some error in the
-             * implementation of the ABI.
-             */
-            return FFA_RET_INVALID_PARAMETERS;
-        }
-        res = resp.a3;
-        if ( ++retry_count > 10 )
-        {
-            /*
-             * TODO
-             * FFA_RET_INTERRUPTED means that the SPMC has a pending
-             * non-secure interrupt, we need a way of delivering that
-             * non-secure interrupt.
-             * FFA_RET_RETRY is the SP telling us that it's temporarily
-             * blocked from handling the direct request, we need a generic
-             * way to deal with this.
-             * For now in both cases, give up after a few retries.
-             */
-            return res;
-        }
-    } while ( res == FFA_RET_INTERRUPTED || res == FFA_RET_RETRY );
-
-    return res;
-}
-
 static void handle_version(struct cpu_user_regs *regs)
 {
     struct domain *d = current->domain;
@@ -371,88 +268,6 @@ static uint32_t ffa_handle_rxtx_unmap(void)
     return FFA_RET_OK;
 }
 
-static int32_t ffa_handle_partition_info_get(uint32_t w1, uint32_t w2,
-                                             uint32_t w3, uint32_t w4,
-                                             uint32_t w5, uint32_t *count,
-                                             uint32_t *fpi_size)
-{
-    int32_t ret = FFA_RET_DENIED;
-    struct domain *d = current->domain;
-    struct ffa_ctx *ctx = d->arch.tee;
-
-    /*
-     * FF-A v1.0 has w5 MBZ while v1.1 allows
-     * FFA_PARTITION_INFO_GET_COUNT_FLAG to be non-zero.
-     *
-     * FFA_PARTITION_INFO_GET_COUNT is only using registers and not the
-     * rxtx buffer so do the partition_info_get directly.
-     */
-    if ( w5 == FFA_PARTITION_INFO_GET_COUNT_FLAG &&
-         ctx->guest_vers == FFA_VERSION_1_1 )
-        return ffa_partition_info_get(w1, w2, w3, w4, w5, count, fpi_size);
-    if ( w5 )
-        return FFA_RET_INVALID_PARAMETERS;
-
-    if ( !ffa_rx )
-        return FFA_RET_DENIED;
-
-    if ( !spin_trylock(&ctx->rx_lock) )
-        return FFA_RET_BUSY;
-
-    if ( !ctx->page_count || !ctx->rx_is_free )
-        goto out;
-    spin_lock(&ffa_rx_buffer_lock);
-    ret = ffa_partition_info_get(w1, w2, w3, w4, w5, count, fpi_size);
-    if ( ret )
-        goto out_rx_buf_unlock;
-    /*
-     * ffa_partition_info_get() succeeded so we now own the RX buffer we
-     * share with the SPMC. We must give it back using ffa_rx_release()
-     * once we've copied the content.
-     */
-
-    if ( ctx->guest_vers == FFA_VERSION_1_0 )
-    {
-        size_t n;
-        struct ffa_partition_info_1_1 *src = ffa_rx;
-        struct ffa_partition_info_1_0 *dst = ctx->rx;
-
-        if ( ctx->page_count * FFA_PAGE_SIZE < *count * sizeof(*dst) )
-        {
-            ret = FFA_RET_NO_MEMORY;
-            goto out_rx_release;
-        }
-
-        for ( n = 0; n < *count; n++ )
-        {
-            dst[n].id = src[n].id;
-            dst[n].execution_context = src[n].execution_context;
-            dst[n].partition_properties = src[n].partition_properties;
-        }
-    }
-    else
-    {
-        size_t sz = *count * *fpi_size;
-
-        if ( ctx->page_count * FFA_PAGE_SIZE < sz )
-        {
-            ret = FFA_RET_NO_MEMORY;
-            goto out_rx_release;
-        }
-
-        memcpy(ctx->rx, ffa_rx, sz);
-    }
-    ctx->rx_is_free = false;
-out_rx_release:
-    ffa_rx_release();
-out_rx_buf_unlock:
-    spin_unlock(&ffa_rx_buffer_lock);
-out:
-    spin_unlock(&ctx->rx_lock);
-
-    return ret;
-}
-
 static int32_t ffa_handle_rx_release(void)
 {
     int32_t ret = FFA_RET_DENIED;
@@ -604,46 +419,9 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
     }
 }
 
-static bool is_in_subscr_list(const uint16_t *subscr, uint16_t start,
-                              uint16_t end, uint16_t sp_id)
-{
-    unsigned int n;
-
-    for ( n = start; n < end; n++ )
-    {
-        if ( subscr[n] == sp_id )
-            return true;
-    }
-
-    return false;
-}
-
-static void vm_destroy_bitmap_init(struct ffa_ctx *ctx,
-                                   unsigned int create_signal_count)
-{
-    unsigned int n;
-
-    for ( n = 0; n < subscr_vm_destroyed_count; n++ )
-    {
-        /*
-         * Skip SPs subscribed to the VM created event that never was
-         * notified of the VM creation due to an error during
-         * ffa_domain_init().
-         */
-        if ( is_in_subscr_list(subscr_vm_created, create_signal_count,
-                               subscr_vm_created_count,
-                               subscr_vm_destroyed[n]) )
-            continue;
-
-        set_bit(n, ctx->vm_destroy_bitmap);
-    }
-}
-
 static int ffa_domain_init(struct domain *d)
 {
     struct ffa_ctx *ctx;
-    unsigned int n;
-    int32_t res;
 
     if ( !ffa_version )
         return -ENODEV;
@@ -654,8 +432,7 @@ static int ffa_domain_init(struct domain *d)
     if ( d->domain_id >= UINT16_MAX)
         return -ERANGE;
 
-    ctx = xzalloc_flex_struct(struct ffa_ctx, vm_destroy_bitmap,
-                              BITS_TO_LONGS(subscr_vm_destroyed_count));
+    ctx = xzalloc(struct ffa_ctx);
     if ( !ctx )
         return -ENOMEM;
 
@@ -663,66 +440,28 @@ static int ffa_domain_init(struct domain *d)
     ctx->teardown_d = d;
     INIT_LIST_HEAD(&ctx->shm_list);
 
-    for ( n = 0; n < subscr_vm_created_count; n++ )
-    {
-        res = ffa_direct_req_send_vm(subscr_vm_created[n], ffa_get_vm_id(d),
-                                     FFA_MSG_SEND_VM_CREATED);
-        if ( res )
-        {
-            printk(XENLOG_ERR "ffa: Failed to report creation of vm_id %u to  %u: res %d\n",
-                   ffa_get_vm_id(d), subscr_vm_created[n], res);
-            break;
-        }
-    }
-    vm_destroy_bitmap_init(ctx, n);
-    if ( n != subscr_vm_created_count )
+    /*
+     * ffa_domain_teardown() will be called if ffa_domain_init() returns an
+     * error, so no need for cleanup in this function.
+     */
+
+    if ( !ffa_partinfo_domain_init(d) )
         return -EIO;
 
     return 0;
 }
 
-static void send_vm_destroyed(struct domain *d)
-{
-    struct ffa_ctx *ctx = d->arch.tee;
-    unsigned int n;
-    int32_t res;
-
-    for ( n = 0; n < subscr_vm_destroyed_count; n++ )
-    {
-        if ( !test_bit(n, ctx->vm_destroy_bitmap) )
-            continue;
-
-        res = ffa_direct_req_send_vm(subscr_vm_destroyed[n], ffa_get_vm_id(d),
-                                     FFA_MSG_SEND_VM_DESTROYED);
-
-        if ( res )
-        {
-            printk(XENLOG_ERR "%pd: ffa: Failed to report destruction of vm_id %u to %u: res %d\n",
-                   d, ffa_get_vm_id(d), subscr_vm_destroyed[n], res);
-        }
-
-        /*
-         * For these two error codes the hypervisor is expected to resend
-         * the destruction message. For the rest it is expected that the
-         * error is permanent and that is doesn't help to resend the
-         * destruction message.
-         */
-        if ( res != FFA_RET_INTERRUPTED && res != FFA_RET_RETRY )
-            clear_bit(n, ctx->vm_destroy_bitmap);
-    }
-}
-
 static void ffa_domain_teardown_continue(struct ffa_ctx *ctx, bool first_time)
 {
     struct ffa_ctx *next_ctx = NULL;
     bool retry = false;
 
-    send_vm_destroyed(ctx->teardown_d);
+    if ( !ffa_partinfo_domain_destroy(ctx->teardown_d) )
+        retry = true;
     if ( !ffa_shm_domain_destroy(ctx->teardown_d) )
         retry = true;
 
-    if ( retry ||
-         !bitmap_empty(ctx->vm_destroy_bitmap, subscr_vm_destroyed_count) )
+    if ( retry )
     {
         printk(XENLOG_G_INFO "%pd: ffa: Remaining cleanup, retrying\n", ctx->teardown_d);
 
@@ -796,82 +535,6 @@ static int ffa_relinquish_resources(struct domain *d)
     return 0;
 }
 
-static void uninit_subscribers(void)
-{
-        subscr_vm_created_count = 0;
-        subscr_vm_destroyed_count = 0;
-        XFREE(subscr_vm_created);
-        XFREE(subscr_vm_destroyed);
-}
-
-static bool init_subscribers(struct ffa_partition_info_1_1 *fpi, uint16_t count)
-{
-    uint16_t n;
-    uint16_t c_pos;
-    uint16_t d_pos;
-
-    subscr_vm_created_count = 0;
-    subscr_vm_destroyed_count = 0;
-    for ( n = 0; n < count; n++ )
-    {
-        if ( fpi[n].partition_properties & FFA_PART_PROP_NOTIF_CREATED )
-            subscr_vm_created_count++;
-        if ( fpi[n].partition_properties & FFA_PART_PROP_NOTIF_DESTROYED )
-            subscr_vm_destroyed_count++;
-    }
-
-    if ( subscr_vm_created_count )
-        subscr_vm_created = xzalloc_array(uint16_t, subscr_vm_created_count);
-    if ( subscr_vm_destroyed_count )
-        subscr_vm_destroyed = xzalloc_array(uint16_t,
-                                            subscr_vm_destroyed_count);
-    if ( (subscr_vm_created_count && !subscr_vm_created) ||
-         (subscr_vm_destroyed_count && !subscr_vm_destroyed) )
-    {
-        printk(XENLOG_ERR "ffa: Failed to allocate subscription lists\n");
-        uninit_subscribers();
-        return false;
-    }
-
-    for ( c_pos = 0, d_pos = 0, n = 0; n < count; n++ )
-    {
-        if ( fpi[n].partition_properties & FFA_PART_PROP_NOTIF_CREATED )
-            subscr_vm_created[c_pos++] = fpi[n].id;
-        if ( fpi[n].partition_properties & FFA_PART_PROP_NOTIF_DESTROYED )
-            subscr_vm_destroyed[d_pos++] = fpi[n].id;
-    }
-
-    return true;
-}
-
-static bool init_sps(void)
-{
-    bool ret = false;
-    uint32_t fpi_size;
-    uint32_t count;
-    int e;
-
-    e = ffa_partition_info_get(0, 0, 0, 0, 0, &count, &fpi_size);
-    if ( e )
-    {
-        printk(XENLOG_ERR "ffa: Failed to get list of SPs: %d\n", e);
-        goto out;
-    }
-
-    if ( count >= UINT16_MAX )
-    {
-        printk(XENLOG_ERR "ffa: Impossible number of SPs: %u\n", count);
-        goto out;
-    }
-
-    ret = init_subscribers(ffa_rx, count);
-
-out:
-    ffa_rx_release();
-
-    return ret;
-}
-
 static bool ffa_probe(void)
 {
     uint32_t vers;
@@ -949,7 +612,7 @@ static bool ffa_probe(void)
     }
     ffa_version = vers;
 
-    if ( !init_sps() )
+    if ( !ffa_partinfo_init() )
         goto err_free_ffa_tx;
 
     INIT_LIST_HEAD(&ffa_teardown_head);
diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_partinfo.c
new file mode 100644
index 000000000000..dc1059584828
--- /dev/null
+++ b/xen/arch/arm/tee/ffa_partinfo.c
@@ -0,0 +1,373 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2024  Linaro Limited
+ */
+
+#include <xen/const.h>
+#include <xen/sizes.h>
+#include <xen/types.h>
+
+#include <asm/smccc.h>
+#include <asm/regs.h>
+
+#include "ffa_private.h"
+
+/* Partition information descriptor defined in FF-A-1.0-REL */
+struct ffa_partition_info_1_0 {
+    uint16_t id;
+    uint16_t execution_context;
+    uint32_t partition_properties;
+};
+
+/* Partition information descriptor defined in FF-A-1.1-REL0 */
+struct ffa_partition_info_1_1 {
+    uint16_t id;
+    uint16_t execution_context;
+    uint32_t partition_properties;
+    uint8_t uuid[16];
+};
+
+/* SPs subscribing to VM_CREATE and VM_DESTROYED events */
+static uint16_t *subscr_vm_created __read_mostly;
+static uint16_t subscr_vm_created_count __read_mostly;
+static uint16_t *subscr_vm_destroyed __read_mostly;
+static uint16_t subscr_vm_destroyed_count __read_mostly;
+
+static int32_t ffa_partition_info_get(uint32_t w1, uint32_t w2, uint32_t w3,
+                                      uint32_t w4, uint32_t w5, uint32_t *count,
+                                      uint32_t *fpi_size)
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
+    ret = ffa_get_ret_code(&resp);
+    if ( !ret )
+    {
+        *count = resp.a2;
+        *fpi_size = resp.a3;
+    }
+
+    return ret;
+}
+
+int32_t ffa_handle_partition_info_get(uint32_t w1, uint32_t w2, uint32_t w3,
+                                      uint32_t w4, uint32_t w5, uint32_t *count,
+                                      uint32_t *fpi_size)
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
+        return ffa_partition_info_get(w1, w2, w3, w4, w5, count, fpi_size);
+    if ( w5 )
+        return FFA_RET_INVALID_PARAMETERS;
+
+    if ( !ffa_rx )
+        return FFA_RET_DENIED;
+
+    if ( !spin_trylock(&ctx->rx_lock) )
+        return FFA_RET_BUSY;
+
+    if ( !ctx->page_count || !ctx->rx_is_free )
+        goto out;
+    spin_lock(&ffa_rx_buffer_lock);
+    ret = ffa_partition_info_get(w1, w2, w3, w4, w5, count, fpi_size);
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
+        size_t sz = *count * *fpi_size;
+
+        if ( ctx->page_count * FFA_PAGE_SIZE < sz )
+        {
+            ret = FFA_RET_NO_MEMORY;
+            goto out_rx_release;
+        }
+
+        memcpy(ctx->rx, ffa_rx, sz);
+    }
+    ctx->rx_is_free = false;
+out_rx_release:
+    ffa_rx_release();
+out_rx_buf_unlock:
+    spin_unlock(&ffa_rx_buffer_lock);
+out:
+    spin_unlock(&ctx->rx_lock);
+
+    return ret;
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
+        if ( fpi[n].partition_properties & FFA_PART_PROP_NOTIF_CREATED )
+            subscr_vm_created_count++;
+        if ( fpi[n].partition_properties & FFA_PART_PROP_NOTIF_DESTROYED )
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
+
+
+bool ffa_partinfo_init(void)
+{
+    bool ret = false;
+    uint32_t fpi_size;
+    uint32_t count;
+    int e;
+
+    e = ffa_partition_info_get(0, 0, 0, 0, 0, &count, &fpi_size);
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
+static bool is_in_subscr_list(const uint16_t *subscr, uint16_t start,
+                              uint16_t end, uint16_t sp_id)
+{
+    unsigned int n;
+
+    for ( n = start; n < end; n++ )
+    {
+        if ( subscr[n] == sp_id )
+            return true;
+    }
+
+    return false;
+}
+
+static void vm_destroy_bitmap_init(struct ffa_ctx *ctx,
+                                   unsigned int create_signal_count)
+{
+    unsigned int n;
+
+    for ( n = 0; n < subscr_vm_destroyed_count; n++ )
+    {
+        /*
+         * Skip SPs subscribed to the VM created event that never was
+         * notified of the VM creation due to an error during
+         * ffa_domain_init().
+         */
+        if ( is_in_subscr_list(subscr_vm_created, create_signal_count,
+                               subscr_vm_created_count,
+                               subscr_vm_destroyed[n]) )
+            continue;
+
+        set_bit(n, ctx->vm_destroy_bitmap);
+    }
+}
+
+bool ffa_partinfo_domain_init(struct domain *d)
+{
+    unsigned int count = BITS_TO_LONGS(subscr_vm_destroyed_count);
+    struct ffa_ctx *ctx = d->arch.tee;
+    unsigned int n;
+    int32_t res;
+
+    ctx->vm_destroy_bitmap = xzalloc_array(unsigned long, count);
+    if ( !ctx->vm_destroy_bitmap )
+        return false;
+
+    for ( n = 0; n < subscr_vm_created_count; n++ )
+    {
+        res = ffa_direct_req_send_vm(subscr_vm_created[n], ffa_get_vm_id(d),
+                                     FFA_MSG_SEND_VM_CREATED);
+        if ( res )
+        {
+            printk(XENLOG_ERR "ffa: Failed to report creation of vm_id %u to  %u: res %d\n",
+                   ffa_get_vm_id(d), subscr_vm_created[n], res);
+            break;
+        }
+    }
+    vm_destroy_bitmap_init(ctx, n);
+
+    return n == subscr_vm_created_count;
+}
+
+bool ffa_partinfo_domain_destroy(struct domain *d)
+{
+    struct ffa_ctx *ctx = d->arch.tee;
+    unsigned int n;
+    int32_t res;
+
+    if ( !ctx->vm_destroy_bitmap )
+        return true;
+
+    for ( n = 0; n < subscr_vm_destroyed_count; n++ )
+    {
+        if ( !test_bit(n, ctx->vm_destroy_bitmap) )
+            continue;
+
+        res = ffa_direct_req_send_vm(subscr_vm_destroyed[n], ffa_get_vm_id(d),
+                                     FFA_MSG_SEND_VM_DESTROYED);
+
+        if ( res )
+        {
+            printk(XENLOG_ERR "%pd: ffa: Failed to report destruction of vm_id %u to %u: res %d\n",
+                   d, ffa_get_vm_id(d), subscr_vm_destroyed[n], res);
+        }
+
+        /*
+         * For these two error codes the hypervisor is expected to resend
+         * the destruction message. For the rest it is expected that the
+         * error is permanent and that is doesn't help to resend the
+         * destruction message.
+         */
+        if ( res != FFA_RET_INTERRUPTED && res != FFA_RET_RETRY )
+            clear_bit(n, ctx->vm_destroy_bitmap);
+    }
+
+    if ( bitmap_empty(ctx->vm_destroy_bitmap, subscr_vm_destroyed_count) )
+        XFREE(ctx->vm_destroy_bitmap);
+
+    return !ctx->vm_destroy_bitmap;
+}
diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_private.h
index f3e2f42e573e..6b32b69cfe90 100644
--- a/xen/arch/arm/tee/ffa_private.h
+++ b/xen/arch/arm/tee/ffa_private.h
@@ -244,7 +244,7 @@ struct ffa_ctx {
      * Used for ffa_domain_teardown() to keep track of which SPs should be
      * notified that this guest is being destroyed.
      */
-    unsigned long vm_destroy_bitmap[];
+    unsigned long *vm_destroy_bitmap;
 };
 
 extern void *ffa_rx;
@@ -256,6 +256,13 @@ bool ffa_shm_domain_destroy(struct domain *d);
 void ffa_handle_mem_share(struct cpu_user_regs *regs);
 int ffa_handle_mem_reclaim(uint64_t handle, uint32_t flags);
 
+bool ffa_partinfo_init(void);
+bool ffa_partinfo_domain_init(struct domain *d);
+bool ffa_partinfo_domain_destroy(struct domain *d);
+int32_t ffa_handle_partition_info_get(uint32_t w1, uint32_t w2, uint32_t w3,
+                                      uint32_t w4, uint32_t w5, uint32_t *count,
+                                      uint32_t *fpi_size);
+
 
 static inline uint16_t ffa_get_vm_id(const struct domain *d)
 {
@@ -325,4 +332,9 @@ static inline int32_t ffa_simple_call(uint32_t fid, register_t a1,
     return ffa_get_ret_code(&resp);
 }
 
+static inline int32_t ffa_rx_release(void)
+{
+    return ffa_simple_call(FFA_RX_RELEASE, 0, 0, 0, 0);
+}
+
 #endif /*__FFA_PRIVATE_H__*/
-- 
2.34.1


