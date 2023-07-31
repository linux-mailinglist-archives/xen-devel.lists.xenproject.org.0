Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC377695D5
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 14:15:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.572961.897135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQRoQ-0003w0-9R; Mon, 31 Jul 2023 12:15:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 572961.897135; Mon, 31 Jul 2023 12:15:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQRoQ-0003sx-3x; Mon, 31 Jul 2023 12:15:46 +0000
Received: by outflank-mailman (input) for mailman id 572961;
 Mon, 31 Jul 2023 12:15:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VuP2=DR=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qQRoO-0003r6-J2
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 12:15:44 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f839bb05-2f9b-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 14:15:42 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4fe28e4671dso2692760e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 31 Jul 2023 05:15:42 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 l10-20020ac2430a000000b004fbb1bc1ae0sm2028077lfh.163.2023.07.31.05.15.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 05:15:41 -0700 (PDT)
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
X-Inumbo-ID: f839bb05-2f9b-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690805742; x=1691410542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pJQzvJ0OqzEXs06pXN7HU741HPJ2/SrxAbSMgLekP8w=;
        b=GCHLTJtQ8oGnt0c+OFuGjHgpp6yn/bwRxTpv540FME/hbSXJx+s/z4UA1mqWSEBgHK
         YYXvaMM4ZjePOwnC1AwJkj8uHX2HoM9oAob3YNmwBgTr7ZdYOJ/F8rUYwC6WMAF1TRRe
         vhO3P9UC9eua38l6BciYJ8fP1dCVhrRsm+39868+quIWG6AByGt+kd2RnXlNOkWTnlE+
         rdzm6VR9t54RoC2plCAhkjJO6uO372Zmp5louEoZ5p7YoZqCelYpQQ1iPTdOCDz29vB6
         eBXgUEMDgbZI1uHVUaR2JWKzzWZIOjBhnQUDEJx+zghTsCSnuJvfvnbdb5plR1quoge7
         yTig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690805742; x=1691410542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pJQzvJ0OqzEXs06pXN7HU741HPJ2/SrxAbSMgLekP8w=;
        b=Rc5yLAdY2zqHtj26ubo0ws6MXaBArqnZL1roUX+zdfKd91NDcg3fd/ZN21Rz9zastx
         FjYRQnxbVThYJgMIr0IvKFAGIlT44Nz0lh6ciYIqlSqcFGhYbYQXCLjo6zagld6G0u0p
         CWfEkzG0nFdo8L3BrAZm3+7a+VaMt/bo4VoV7nvMzXU4w39sDk3OHw8HtceFAOGlHkI/
         wrvxRgVZPzCBQWZShJtWLn1UE11hjOmzkMqgdY/21z7mIfIKQTcnBeUtObVNDSpRliDV
         CbikFh8QF/TFD23VStfQAmWmNofos8TAdki1UmVqYtEvb3+tSPHfNudkq5UvfZ+3b6js
         NbFA==
X-Gm-Message-State: ABy/qLaOmbGnGmdQcynWJppSqWfY2XkA7uSPafhYfu358HA3rUH0nppr
	WRj1daH92IHZuXw0nbRqQEM+Aj9HQKq/toc26aM=
X-Google-Smtp-Source: APBJJlFSC/mFSDFmW8bgNee1xzB0UFNA1ks6ln4nHrhOatVk1GOT3ytH+NRVitDpX7lMJcd0nQCnyQ==
X-Received: by 2002:a05:6512:1591:b0:4fb:97e8:bc1c with SMTP id bp17-20020a056512159100b004fb97e8bc1cmr7158804lfb.54.1690805741921;
        Mon, 31 Jul 2023 05:15:41 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com,
	Marc Bonnici <marc.bonnici@arm.com>,
	Achin Gupta <achin.gupta@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [XEN PATCH v11 01/14] xen/arm: ffa: add direct request support
Date: Mon, 31 Jul 2023 14:15:23 +0200
Message-Id: <20230731121536.934239-2-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230731121536.934239-1-jens.wiklander@linaro.org>
References: <20230731121536.934239-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds support for sending a FF-A direct request. Checks that the SP also
supports handling a 32-bit direct request. 64-bit direct requests are
not used by the mediator itself so there is not need to check for that.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Henry Wang <Henry.Wang@arm.com>
---
v10->v11
- In handle_msg_send_direct_req(), replaced the "arg" with "resp" at the
  default: label in the switch statement.
---
 xen/arch/arm/tee/ffa.c | 113 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index e157ed20ad8b..961a8c052f59 100644
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
+        /* Bad fid, report back to the caller. */
+        memset(&resp, 0, sizeof(resp));
+        resp.a0 = FFA_ERROR;
+        resp.a1 = src_dst;
+        resp.a2 = FFA_RET_ABORTED;
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


