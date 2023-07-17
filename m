Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F08C755CB7
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 09:22:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564188.881579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLIY7-0000Mj-SX; Mon, 17 Jul 2023 07:21:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564188.881579; Mon, 17 Jul 2023 07:21:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLIY7-0000C5-I1; Mon, 17 Jul 2023 07:21:39 +0000
Received: by outflank-mailman (input) for mailman id 564188;
 Mon, 17 Jul 2023 07:21:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xV9D=DD=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qLIY5-0005A3-IT
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 07:21:37 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90e6f746-2472-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 09:21:37 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4fb7589b187so6466236e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jul 2023 00:21:37 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 l10-20020ac24a8a000000b004f846cd74bcsm2658938lfp.245.2023.07.17.00.21.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 00:21:35 -0700 (PDT)
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
X-Inumbo-ID: 90e6f746-2472-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689578496; x=1692170496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yGDYqeByXV8bSEztmWgee0JK3pFxnI7HN01UFyB4olQ=;
        b=OIZFFuTGAtZmeKjST/n6DeRljPjk2acHhAkyrWuRPC3tj2Sucl9X/WYuOkB0ZrbAUw
         1XrOFO4iYXb4iQ5HSLZ9Qcl16KCU21E/2lzRRHFrI5I6Vs9xgy+uSjyW61JtgAtmL6D4
         OlcKXt0Ba+jkzWTmiQ/pExxDF4xgys1e06ITWeH7ZCZl+xFAaqyXAjT6QKYjGF5uJWtf
         f9pBlRGjHn2gmLDZTSn1uIWwQsogSZO62tu2cLUaSV8sn7wlzkHsPsgAjfLLKIdW2xxH
         e23MR7lzjRwqEVeVm92+alZA9erf1oLHfG0Qq8/aMWCaqdfHWrxPXKtFCqf9nwtt3hUO
         wE1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689578496; x=1692170496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yGDYqeByXV8bSEztmWgee0JK3pFxnI7HN01UFyB4olQ=;
        b=Ah6EtxsEq13b7MpXDea6+hK1o2xITBVxkFjTSTaZKj/9lmcXYef332Qp0tL7QklZZi
         WGF4ipJreAs1YnqKD3xuxlvE5sbXqPl4wqMsgkSIlMILdvKzKiUhBK7Ozbq4knWSKk1q
         ft91e4QzuXUHenFRtrrnFHEpWUMffc6tyMmV2O03BlFEr4aE9T8LJQ3N4m0zipgka2V9
         hwd7+R9qDmsBJ0J+VY5Qp9kpp34bpaEHmdszk5pFYqN9ikaOXGZIZO9stGBgJCIKMsR8
         14HuFMNzhAGZtpaeIVYNM85t3wRJRMJZ+tDV5GAIg79YfrbqMVMVpJ7UphO8AslcNzlJ
         cseQ==
X-Gm-Message-State: ABy/qLZiyxHdgaC/S1rEWctF9qi4covurjgPn2njVT48QoYPoPdV9M+q
	5QtD/CaqDFh1k4H8euX7Sv4Msj0lMF4cWGXoZNQ=
X-Google-Smtp-Source: APBJJlFvMF9sKJ05ylGz+WoP/8dMl7wwvn0bfoZtSSw2bLeWWbzmADI1sZPqGifTfzAoEY6+Ufkgxw==
X-Received: by 2002:a05:6512:304a:b0:4fa:a0c3:ef9d with SMTP id b10-20020a056512304a00b004faa0c3ef9dmr8538752lfb.18.1689578496323;
        Mon, 17 Jul 2023 00:21:36 -0700 (PDT)
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
Subject: [XEN PATCH v10 14/24] xen/arm: ffa: support guest FFA_PARTITION_INFO_GET
Date: Mon, 17 Jul 2023 09:20:57 +0200
Message-Id: <20230717072107.753304-15-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230717072107.753304-1-jens.wiklander@linaro.org>
References: <20230717072107.753304-1-jens.wiklander@linaro.org>
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
 xen/arch/arm/tee/ffa.c | 131 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 131 insertions(+)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index ffabb5ed0a80..d5748b9ce88c 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -166,7 +166,18 @@
 #define FFA_MSG_SEND                    0x8400006EU
 #define FFA_MSG_POLL                    0x8400006AU
 
+/*
+ * Structs below ending with _1_0 are defined in FF-A-1.0-REL and
+ * struct ending with _1_1 are defined in FF-A-1.1-REL0.
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
@@ -510,6 +528,100 @@ static uint32_t handle_rxtx_unmap(void)
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
@@ -566,6 +678,7 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
     uint32_t fid = get_user_reg(regs, 0);
     struct domain *d = current->domain;
     struct ffa_ctx *ctx = d->arch.tee;
+    uint32_t count;
     int e;
 
     if ( !ctx )
@@ -595,6 +708,24 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
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


