Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFBD5981C4
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 12:56:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389435.626371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOdCE-0004vF-Ii; Thu, 18 Aug 2022 10:56:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389435.626371; Thu, 18 Aug 2022 10:56:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOdCE-0004qk-BJ; Thu, 18 Aug 2022 10:56:18 +0000
Received: by outflank-mailman (input) for mailman id 389435;
 Thu, 18 Aug 2022 10:56:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=avir=YW=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1oOdCC-00040G-Q1
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 10:56:16 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6177fd63-1ee4-11ed-bd2e-47488cf2e6aa;
 Thu, 18 Aug 2022 12:56:15 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id v2so1633870lfi.6
 for <xen-devel@lists.xenproject.org>; Thu, 18 Aug 2022 03:56:15 -0700 (PDT)
Received: from jade.urgonet (h-79-136-84-253.A175.priv.bahnhof.se.
 [79.136.84.253]) by smtp.gmail.com with ESMTPSA id
 y27-20020a0565123f1b00b0048a85334a11sm176837lfa.143.2022.08.18.03.56.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 03:56:14 -0700 (PDT)
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
X-Inumbo-ID: 6177fd63-1ee4-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=RqLPpxdovNEtqVVomQKo0f/+VcrD0Wl7yhZbLe6C164=;
        b=Lp1ORXUIjjXBCUXHShI8Om/tw8A1apy/1D3pCmrxB0crbU1iArP/n64p5uj2MEI7Xv
         uSUUu9C7ksDzqCDWFSS4BRi7VpLSjajxGm/MNvtxBhDFn9+VyVO3t260ZR6oteTFWCJq
         isl9s4PGxKp72kurHkMEF4dJ9os5+22ovajPNrUUDUEnjXpEvgavEUnQ7kGemo6F9kVJ
         XnoqxpGZIVUscVymiGvTXbQzyDJsxhPwlIP3RSj6EyLl63tM0U6EPZCwi/81/D872MtX
         J+yRBVDXY9XA1BdlYNOWoypmp1GxFaTHfe5pRC0tbYcP4JSa/uIPJ7PCybi6brX25rOB
         ZA4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=RqLPpxdovNEtqVVomQKo0f/+VcrD0Wl7yhZbLe6C164=;
        b=I/2FCdLbc9qJiDbx5n3CwfhssEGvZvVrChO1qlvNgu+Vw/HWXsZEw1EhrSHmgCJNlc
         fhL0pfT8DcUTDDGK13wZTn1FZPnW91qlD/+hneaa6DhhWUpJrD+0QYjYH6x5CsKOuGO4
         wkYeif65VLNueiTCnZdFYzVQzUcSAO0Rq8uA66gs4QMHyBcZLhg2ok0Odo0Dh4qcmWi+
         1rcjtw38NgaMEKM2N8PprExmCGu9Xx3vS4/V9ChRvMOTlCiidW1k6AET6b21aNK7xgU4
         27XF19k55A7vsEeCT27iGLbrtmcEgVxi1fyGH09ux9N13S4yAOj/U134l0HCZlcWxTE1
         I4mg==
X-Gm-Message-State: ACgBeo0VlRA4IDkfIu94rW1GtOku76NLXnbd90dQuA2KSeGcBd+fLDcO
	w++mYLkPXrxDBeIMrh/AjBRTh5YAWYdPCw==
X-Google-Smtp-Source: AA6agR77pQ1Wf7XELicTm8GscshX5rkOP1HAPfqJBcdxXXUKqTKbAC6wgXFuxEEukIq/phOhpa6Klg==
X-Received: by 2002:a05:6512:128d:b0:48b:465f:5da8 with SMTP id u13-20020a056512128d00b0048b465f5da8mr743679lfs.683.1660820174868;
        Thu, 18 Aug 2022 03:56:14 -0700 (PDT)
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
Subject: [PATCH v5 4/9] xen/arm: ffa: add direct request support
Date: Thu, 18 Aug 2022 12:55:56 +0200
Message-Id: <20220818105601.1896082-5-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220818105601.1896082-1-jens.wiklander@linaro.org>
References: <20220818105601.1896082-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds support for sending a FF-A direct request.

[1] https://developer.arm.com/documentation/den0077/latest
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/ffa.c | 119 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/xen/arch/arm/ffa.c b/xen/arch/arm/ffa.c
index b85c492928d2..cd5eefb437f8 100644
--- a/xen/arch/arm/ffa.c
+++ b/xen/arch/arm/ffa.c
@@ -189,6 +189,7 @@
 
 struct ffa_ctx {
     uint32_t guest_vers;
+    bool interrupted;
 };
 
 /* Negotiated FF-A version to use with the SPMC */
@@ -214,6 +215,55 @@ static bool ffa_get_version(uint32_t *vers)
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
+    uint32_t ret = ffa_features(id);
+
+    if (ret)
+        printk(XENLOG_ERR "ffa: mandatory feature id %#x missing\n", id);
+
+    return !ret;
+}
+
 static u16 get_vm_id(const struct domain *d)
 {
     /* +1 since 0 is reserved for the hypervisor in FF-A */
@@ -255,6 +305,66 @@ static void handle_version(struct cpu_user_regs *regs)
     set_regs(regs, vers, 0, 0, 0, 0, 0, 0, 0);
 }
 
+static void handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32_t fid)
+{
+    struct arm_smccc_1_2_regs arg = { .a0 = fid, };
+    struct arm_smccc_1_2_regs resp = { };
+    struct domain *d = current->domain;
+    struct ffa_ctx *ctx = d->arch.ffa;
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
+    while ( true )
+    {
+        arm_smccc_1_2_smc(&arg, &resp);
+
+        switch ( resp.a0 )
+        {
+        case FFA_INTERRUPT:
+            ctx->interrupted = true;
+            goto out;
+        case FFA_ERROR:
+        case FFA_SUCCESS_32:
+        case FFA_SUCCESS_64:
+        case FFA_MSG_SEND_DIRECT_RESP_32:
+        case FFA_MSG_SEND_DIRECT_RESP_64:
+            goto out;
+        default:
+            /* Bad fid, report back. */
+            memset(&arg, 0, sizeof(arg));
+            arg.a0 = FFA_ERROR;
+            arg.a1 = src_dst;
+            arg.a2 = FFA_RET_NOT_SUPPORTED;
+            continue;
+        }
+    }
+
+out:
+    set_regs(regs, resp.a0, resp.a1 & mask, resp.a2 & mask, resp.a3 & mask,
+             resp.a4 & mask, resp.a5 & mask, resp.a6 & mask, resp.a7 & mask);
+}
+
 bool ffa_handle_call(struct cpu_user_regs *regs, uint32_t fid)
 {
     struct domain *d = current->domain;
@@ -271,6 +381,12 @@ bool ffa_handle_call(struct cpu_user_regs *regs, uint32_t fid)
     case FFA_ID_GET:
         set_regs_success(regs, get_vm_id(d), 0);
         return true;
+    case FFA_MSG_SEND_DIRECT_REQ_32:
+#ifdef CONFIG_ARM_64
+    case FFA_MSG_SEND_DIRECT_REQ_64:
+#endif
+        handle_msg_send_direct_req(regs, fid);
+        return true;
 
     default:
         printk(XENLOG_ERR "ffa: unhandled fid 0x%x\n", fid);
@@ -346,6 +462,9 @@ static int __init ffa_init(void)
     printk(XENLOG_INFO "ARM FF-A Firmware version %u.%u\n",
            major_vers, minor_vers);
 
+    if ( !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
+        return 0;
+
     ffa_version = vers;
 
     return 0;
-- 
2.31.1


