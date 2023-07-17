Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CF7755CAF
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 09:22:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564183.881543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLIY3-0007f6-8W; Mon, 17 Jul 2023 07:21:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564183.881543; Mon, 17 Jul 2023 07:21:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLIY2-0007bH-UG; Mon, 17 Jul 2023 07:21:34 +0000
Received: by outflank-mailman (input) for mailman id 564183;
 Mon, 17 Jul 2023 07:21:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xV9D=DD=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qLIY0-0005A3-Oi
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 07:21:32 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e0dea5a-2472-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 09:21:32 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4fbc0314a7bso6513295e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jul 2023 00:21:32 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 l10-20020ac24a8a000000b004f846cd74bcsm2658938lfp.245.2023.07.17.00.21.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 00:21:31 -0700 (PDT)
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
X-Inumbo-ID: 8e0dea5a-2472-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689578491; x=1692170491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C+n5gOj+w1Jr5cwaD9TQj7fEu8jpwI0+pO30/yvaxYY=;
        b=IMh+wbIT/TbXwxrvp2ciElkOW/rWU0pEwJZ5O4D2EN6qPqr/egaLJ6xlOT9AMJPcR/
         o0E5CVs3248PdVyhyZHLz6L7/HQHw7oX9mgAl8fW+v2ssl7fgBm6OvPRBK50SmZSPLX7
         1JiHV9JTH5O4rO7EK1ZHlu/Y96JwT5l/xsICFkFXJsx8bqC51f8lA7RE7ZMwlFn9HpKR
         5Ru+Bvv2YmNQXprQ0BZxE53Hu5I3vrrxsF4pVFTYgm6fiMwECjj26onbTX/UGlobRYPm
         lzFwjrotuZFrJx5xNlhDVZhGv+WvIblltDgazCHb1d1i7oMO25bJGl3JflvxhmKZwwAi
         fA1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689578491; x=1692170491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C+n5gOj+w1Jr5cwaD9TQj7fEu8jpwI0+pO30/yvaxYY=;
        b=QVdhh2CNeta/cP5FYbRDTZXwbfqApMrBTd+FXP+J/OvpeWZxQqArd8UUIeqqmY+j2a
         uzKkAm18ro2GL2p6eiNw7NZqwJFT87tonrZ//MP3vXp/Sr7U1X4iKVab+xnia5mSvNX+
         8pdxPydJ/qBCiNvMrjuP3jTMp/Z/R2pVsbWKDjOCCHPCwRJpzX37BS7mzMDbVmdz52z5
         nm3EqypGu9eDd6UtvK/AL+dVl4ieaoO/NWisUVYyd7Qzxfr/0UPP9nvUrhBUGH5IKfbY
         +dKCJISTE76AOKbZ5UU18tYgcHN8Y6NTxqAlvuzzKSLcc/M0ocRs9wCiuZUu+PdOVi6G
         xDZA==
X-Gm-Message-State: ABy/qLaCe7jMKjdErgbRxbE5JMJH8pxxrCGH4gFFN6mJwbrAnZVzaV73
	7lTvlxqb+zPRBn0FMLsuMjd9rtpEq1m3wayEXps=
X-Google-Smtp-Source: APBJJlFvaco7npPz4rr4/KtQq61ejQ/KdDpM1NhtXoFiPR3xecSCFnbvPtFeJJUZa2b/9Nb64XXQrA==
X-Received: by 2002:a05:6512:3710:b0:4fb:7de4:c837 with SMTP id z16-20020a056512371000b004fb7de4c837mr7628433lfr.68.1689578491597;
        Mon, 17 Jul 2023 00:21:31 -0700 (PDT)
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
	Henry Wang <Henry.Wang@arm.com>
Subject: [XEN PATCH v10 10/24] xen/arm: ffa: add direct request support
Date: Mon, 17 Jul 2023 09:20:53 +0200
Message-Id: <20230717072107.753304-11-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230717072107.753304-1-jens.wiklander@linaro.org>
References: <20230717072107.753304-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds support for sending a FF-A direct request. Checks that the SP also
supports handling a 32-bit direct request. 64-bit direct requests are
not used by the mediator itself so there is not need to check for that.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Henry Wang <Henry.Wang@arm.com>
---
 xen/arch/arm/tee/ffa.c | 113 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index e157ed20ad8b..e05d58cf7755 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -181,6 +181,56 @@ static bool ffa_get_version(uint32_t *vers)
     return true;
 }
 
+static int32_t get_ffa_ret_code(const struct arm_smccc_1_2_regs *resp)
+{
+    switch ( resp->a0 )
+    {
+    case FFA_ERROR:
+        if ( resp->a2 )
+            return resp->a2;
+        else
+            return FFA_RET_NOT_SUPPORTED;
+    case FFA_SUCCESS_32:
+    case FFA_SUCCESS_64:
+        return FFA_RET_OK;
+    default:
+        return FFA_RET_NOT_SUPPORTED;
+    }
+}
+
+static int32_t ffa_simple_call(uint32_t fid, register_t a1, register_t a2,
+                               register_t a3, register_t a4)
+{
+    const struct arm_smccc_1_2_regs arg = {
+        .a0 = fid,
+        .a1 = a1,
+        .a2 = a2,
+        .a3 = a3,
+        .a4 = a4,
+    };
+    struct arm_smccc_1_2_regs resp;
+
+    arm_smccc_1_2_smc(&arg, &resp);
+
+    return get_ffa_ret_code(&resp);
+}
+
+static int32_t ffa_features(uint32_t id)
+{
+    return ffa_simple_call(FFA_FEATURES, id, 0, 0, 0);
+}
+
+static bool check_mandatory_feature(uint32_t id)
+{
+    int32_t ret = ffa_features(id);
+
+    if ( ret )
+        printk(XENLOG_ERR "ffa: mandatory feature id %#x missing: error %d\n",
+               id, ret);
+
+    return !ret;
+}
+
 static uint16_t get_vm_id(const struct domain *d)
 {
     /* +1 since 0 is reserved for the hypervisor in FF-A */
@@ -222,6 +272,57 @@ static void handle_version(struct cpu_user_regs *regs)
     set_regs(regs, vers, 0, 0, 0, 0, 0, 0, 0);
 }
 
+static void handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32_t fid)
+{
+    struct arm_smccc_1_2_regs arg = { .a0 = fid, };
+    struct arm_smccc_1_2_regs resp = { };
+    struct domain *d = current->domain;
+    uint32_t src_dst;
+    uint64_t mask;
+
+    if ( smccc_is_conv_64(fid) )
+        mask = GENMASK_ULL(63, 0);
+    else
+        mask = GENMASK_ULL(31, 0);
+
+    src_dst = get_user_reg(regs, 1);
+    if ( (src_dst >> 16) != get_vm_id(d) )
+    {
+        resp.a0 = FFA_ERROR;
+        resp.a2 = FFA_RET_INVALID_PARAMETERS;
+        goto out;
+    }
+
+    arg.a1 = src_dst;
+    arg.a2 = get_user_reg(regs, 2) & mask;
+    arg.a3 = get_user_reg(regs, 3) & mask;
+    arg.a4 = get_user_reg(regs, 4) & mask;
+    arg.a5 = get_user_reg(regs, 5) & mask;
+    arg.a6 = get_user_reg(regs, 6) & mask;
+    arg.a7 = get_user_reg(regs, 7) & mask;
+
+    arm_smccc_1_2_smc(&arg, &resp);
+    switch ( resp.a0 )
+    {
+    case FFA_ERROR:
+    case FFA_SUCCESS_32:
+    case FFA_SUCCESS_64:
+    case FFA_MSG_SEND_DIRECT_RESP_32:
+    case FFA_MSG_SEND_DIRECT_RESP_64:
+        break;
+    default:
+        /* Bad fid, report back. */
+        memset(&arg, 0, sizeof(arg));
+        arg.a0 = FFA_ERROR;
+        arg.a1 = src_dst;
+        arg.a2 = FFA_RET_ABORTED;
+    }
+
+out:
+    set_regs(regs, resp.a0, resp.a1 & mask, resp.a2 & mask, resp.a3 & mask,
+             resp.a4 & mask, resp.a5 & mask, resp.a6 & mask, resp.a7 & mask);
+}
+
 static bool ffa_handle_call(struct cpu_user_regs *regs)
 {
     uint32_t fid = get_user_reg(regs, 0);
@@ -239,6 +340,10 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
     case FFA_ID_GET:
         set_regs_success(regs, get_vm_id(d), 0);
         return true;
+    case FFA_MSG_SEND_DIRECT_REQ_32:
+    case FFA_MSG_SEND_DIRECT_REQ_64:
+        handle_msg_send_direct_req(regs, fid);
+        return true;
 
     default:
         gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
@@ -331,6 +436,14 @@ static bool ffa_probe(void)
     printk(XENLOG_INFO "ARM FF-A Firmware version %u.%u\n",
            major_vers, minor_vers);
 
+    /*
+     * At the moment domains must support the same features used by Xen.
+     * TODO: Rework the code to allow domain to use a subset of the
+     * features supported.
+     */
+    if ( !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
+        return false;
+
     ffa_version = vers;
 
     return true;
-- 
2.34.1


