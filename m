Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8A36E0781
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 09:16:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520468.808124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmrBS-0003kS-Qy; Thu, 13 Apr 2023 07:15:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520468.808124; Thu, 13 Apr 2023 07:15:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmrBS-0003cB-78; Thu, 13 Apr 2023 07:15:54 +0000
Received: by outflank-mailman (input) for mailman id 520468;
 Thu, 13 Apr 2023 07:15:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UVxt=AE=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pmrBP-0001gq-Dc
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 07:15:51 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0550939e-d9cb-11ed-b21e-6b7b168915f2;
 Thu, 13 Apr 2023 09:15:50 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id d7so28946612lfj.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Apr 2023 00:15:50 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 n12-20020ac2490c000000b004dc83d04840sm181354lfi.79.2023.04.13.00.15.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 00:15:50 -0700 (PDT)
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
X-Inumbo-ID: 0550939e-d9cb-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681370150; x=1683962150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/vIqA0Q41NfcSAHoiP+QU7NDN221D0N/8z0QGKDCRsU=;
        b=NZKECmgRCwD3/Qt/bQB0GE/LjYiBu8Q2NiBGD0tYIoffAUzZUEIEg1ZhPAEM7wCIzB
         HVRzL93FmjUV+sQFKE63TqJy5SYL88iVwe0lhTKx8TzLqP5FsngVGv7NwsYdzj95bZkq
         74bNTFshVeGzooHtp9hPQFnB4uaRKEG/Lisi2zZPBdCp48nfvov6kx6pBaF3+rbPaAzr
         SmyHDDmGE4vy/RGBE2uPyLO0X9dMF9dNbI0JYHkyKS1Qzyc6KKfvWp4ukx1qDGyP8Tga
         56Od1+AyTWKqEYvWJ6u5nmVv+eavkqdnMP3m2gs7QCgLCxg0HySO9LooAAMSod4CTMFt
         OznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681370150; x=1683962150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/vIqA0Q41NfcSAHoiP+QU7NDN221D0N/8z0QGKDCRsU=;
        b=I4l2vRPuCadQetVMKL9mQ/0Y+xyxaa2XQIgG9VZDqJj1jAJJFB0hQ8xaKep9BlBHmI
         enCxi0yYmNVl91TWoJDiE4YkvBXSrPxRCtF0wwsk15tyCS/QsroA5P0Ke/d5k9FKIKe/
         yhGTT9u7l0l4WNnkn5bq7YeALK6qGOa726SYzwRzNmwTDbfa7JisUctKunQq2iRAXJH/
         8Oxpk5sFvqYucgpBQ5iZNGOlJjNExUcR4Uk8u46voMRUxeA1+7eIokKAR269rGylOBqJ
         45UxuDXjkolvQKG/y4XdFDEfNThsfUQi/ACoDPcNCooLYI2FXxpNOYMUm5/I7wALkmsS
         cScQ==
X-Gm-Message-State: AAQBX9dCU6fStQ8+Joxv3VV3JlEkgw/qi+bbF620h3GCyomyrb9HPQ9i
	G9uHZlidmK7FpGfl+cI7KAMnEL1N2gcxtNcdVQQ=
X-Google-Smtp-Source: AKy350Yeiq68Y6+HSv/qOyPfcMO+tL0U6l+2JdS8VPoPn1UifZK4LBUiSq/JMu8PwrkWsTEHHs2mfQ==
X-Received: by 2002:a19:f60e:0:b0:4e8:5576:98f4 with SMTP id x14-20020a19f60e000000b004e8557698f4mr563090lfe.45.1681370150463;
        Thu, 13 Apr 2023 00:15:50 -0700 (PDT)
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
Subject: [XEN PATCH v8 09/22] xen/arm: ffa: add direct request support
Date: Thu, 13 Apr 2023 09:14:11 +0200
Message-Id: <20230413071424.3273490-10-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230413071424.3273490-1-jens.wiklander@linaro.org>
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds support for sending a FF-A direct request. Checks that the SP also
supports handling a 32-bit direct request. 64-bit direct requests are
not used by the mediator itself so there is not need to check for that.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/tee/ffa.c | 112 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index f129879c5b81..f2cce955d981 100644
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
+    if (ret)
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
@@ -326,6 +431,13 @@ static bool ffa_probe(void)
     printk(XENLOG_INFO "ARM FF-A Firmware version %u.%u\n",
            major_vers, minor_vers);
 
+    /*
+     * TODO save result of checked features and use that information to
+     * accept or reject requests from guests.
+     */
+    if ( !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
+        return false;
+
     ffa_version = vers;
 
     return true;
-- 
2.34.1


