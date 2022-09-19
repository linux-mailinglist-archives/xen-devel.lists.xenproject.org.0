Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7737A5BC51C
	for <lists+xen-devel@lfdr.de>; Mon, 19 Sep 2022 11:13:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408577.651361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaCpg-00087D-Rp; Mon, 19 Sep 2022 09:12:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408577.651361; Mon, 19 Sep 2022 09:12:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaCpg-00084J-OP; Mon, 19 Sep 2022 09:12:52 +0000
Received: by outflank-mailman (input) for mailman id 408577;
 Mon, 19 Sep 2022 09:12:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3sJ0=ZW=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1oaCpe-0007Fl-TF
 for xen-devel@lists.xenproject.org; Mon, 19 Sep 2022 09:12:51 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ed57079-37fb-11ed-bad8-01ff208a15ba;
 Mon, 19 Sep 2022 11:12:28 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id p5so33065449ljc.13
 for <xen-devel@lists.xenproject.org>; Mon, 19 Sep 2022 02:12:49 -0700 (PDT)
Received: from jade.urgonet (h-79-136-84-253.A175.priv.bahnhof.se.
 [79.136.84.253]) by smtp.gmail.com with ESMTPSA id
 f3-20020a05651c02c300b0025fdf1af42asm4815394ljo.78.2022.09.19.02.12.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 02:12:47 -0700 (PDT)
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
X-Inumbo-ID: 2ed57079-37fb-11ed-bad8-01ff208a15ba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=dTuNjXgyBfvzCCDCoc8QvNxOjT9fIIF4QTxOBbjxKnU=;
        b=vOibNR0jsvRxa0U570LXmRFO0UM2Uy2rL0UbI05pfuUz7h9bb8idHhEYPBTypqB0NP
         kKizqz9yBTSKEIaU967BgnN4WCtbYShcajiHTqcssCKJEJQVPpRfmisdtu9nz0x6yVw+
         lcxxXZkPPJ64t/Qhq87zyYJj3zczGVvhj9wtRYdMbLSPMFn/oqYQP9wJmaY7cQvivBMU
         hVHidJvute8DqRCDnlfEZCnFbxQO118s8CH/yIWl4hcEei6Ew15VsY6MAN0GHQGFROvv
         ww2zSGxwvVpooFrk8qPIg/ruN9LjKv3ny3RHh2u2teZtDt58P7PX9t2Fqw7xrvMrQ0Xl
         aDCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=dTuNjXgyBfvzCCDCoc8QvNxOjT9fIIF4QTxOBbjxKnU=;
        b=Xhle93laZinRDuAA3jzQZCTxjDpRUIoj509/MLuOGOZI4E4oIbM85UcOp+abgipjHY
         iBPfczvs+OA3hkaJSeVscJGJfKWFuBWmKGhOUgCHrLSvxvuEVklwD8Lw5QOSPXUwB0Pz
         IPI5uHZ6gFNj0h0dIUad/ZO/iN8P+3HjGSVP1SgZtdvky430Uv1GcXedb/npZm1XTDX6
         +io2uMP37Bhwk+dxPbR8cGbsS+iMW1pzmRZ6g4dnfRUU4PTxBzBiyyzAbYE8O/Gh9Cvn
         JUt4+b87nc9Z8EycaMlLSg1acaV7Ztcc+oPOTvqRRUKA1VjaSdkehearUAeowBlq/bdC
         YU0g==
X-Gm-Message-State: ACrzQf1Q1qXp0bseRviZ0rJXx2ryKr/jUl1IveYupjmi6OMzbtOrQ28r
	Ff8OnQH1cSnJfsOapuoEYc5xC86v43wp+Q==
X-Google-Smtp-Source: AMsMyM7CMGig3UNzqX+bWPXFW4HhKtyfrOldKWaFCcuo2awNTJ7TdKKaYnUOjSimQVWBbZZN5eaKzA==
X-Received: by 2002:a2e:99cf:0:b0:26a:b558:9023 with SMTP id l15-20020a2e99cf000000b0026ab5589023mr5207365ljj.519.1663578768409;
        Mon, 19 Sep 2022 02:12:48 -0700 (PDT)
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
Subject: [PATCH v6 3/9] xen/arm: ffa: add direct request support
Date: Mon, 19 Sep 2022 11:12:32 +0200
Message-Id: <20220919091238.2068052-4-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220919091238.2068052-1-jens.wiklander@linaro.org>
References: <20220919091238.2068052-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds support for sending a FF-A direct request.

[1] https://developer.arm.com/documentation/den0077/latest
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/ffa.c | 125 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 124 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/ffa.c b/xen/arch/arm/ffa.c
index 2c59c1f9b738..90b5aa10a1fa 100644
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
+static bool __init check_mandatory_feature(uint32_t id)
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
         gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
@@ -283,7 +399,11 @@ uint32_t ffa_get_call_count(void)
     uint32_t count = 0;
 
     if ( IS_ENABLED(CONFIG_FFA) )
-        count += 2;
+    {
+        if ( IS_ENABLED(CONFIG_ARM_64) )
+            count += 1;
+        count += 3;
+    }
 
     return count;
 }
@@ -364,6 +484,9 @@ static int __init ffa_init(void)
     printk(XENLOG_INFO "ARM FF-A Firmware version %u.%u\n",
            major_vers, minor_vers);
 
+    if ( !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
+        return 0;
+
     ffa_version = vers;
 
     return 0;
-- 
2.31.1


