Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1262869F802
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 16:34:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499547.770797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUr8C-0003FL-GL; Wed, 22 Feb 2023 15:34:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499547.770797; Wed, 22 Feb 2023 15:34:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUr8B-00031j-TQ; Wed, 22 Feb 2023 15:34:07 +0000
Received: by outflank-mailman (input) for mailman id 499547;
 Wed, 22 Feb 2023 15:34:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvgA=6S=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pUr88-0001MH-O3
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 15:34:04 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5540a006-b2c6-11ed-93b6-47a8fe42b414;
 Wed, 22 Feb 2023 16:34:02 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id f18so10544187lfa.3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Feb 2023 07:34:03 -0800 (PST)
Received: from localhost.localdomain (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 q9-20020ac25289000000b004db0d26adb4sm927746lfm.182.2023.02.22.07.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 07:34:02 -0800 (PST)
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
X-Inumbo-ID: 5540a006-b2c6-11ed-93b6-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kkuvt9UXNHNkVAS/s0VFcET0eufVzl6U4CDVsy+uJVk=;
        b=x4CHeQVoB/gXPv4A4zyctWjL31vbD1kfqcBY3qLXtFmefh7ew6OVmaP4Vk1eZk0XFB
         1unpgsf/zq2oM05no+wr34qzXZ2K1mg7qjMck3c7E4LDAl8Xwg1LUzFOBViI7NfrI71t
         IPeool/FV+xSeJwrGWZHuAVYkyXwEHxDHadmasEdQ0964YvVGytqlGcX6z4QxcJnGsXs
         veZO5cy85ofIpYmkIjTECfbvVy605ADh4PzL9mEgtYZMdUhV46H4tZwHvwvgu3IY/u0d
         FqBft1E3btju1jSF+8tnYg52S7LngoeG+JPe6U0bCh2UESkx8lmzlVswBHXIbdXzaKEj
         SBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kkuvt9UXNHNkVAS/s0VFcET0eufVzl6U4CDVsy+uJVk=;
        b=XbKwlvUo9aBGbMa3hKdZI+HtxxLt9ESTbXUo1+HFDoCcpFbV3GgNjfZZYdWJhzckIf
         QaY4MVGvy5bIrfueJvpKL+9RDSM6eBxVHPKo9C1sK1Zf8UB/ZrIFQNhPTxorzC4aAAZU
         UOSEhjgh+NlGJorTNTcJd/LaUxnfUBaWDOgqukzW5RQMRrQM8iN6o7oi0nGf7wmP0SVI
         PC0tmWA/kvSEKYP5TFqxSZHQfw/dEWzcss9kk4oYOBRldrAkJG2HzigseTBVQmK+i1SB
         WzFo7MNhWfVLWiynJnHwQpWhWzwEgQBeg6fahlUsHXw/akZNWrG2jiKCp3njs8zQYUfM
         cGUA==
X-Gm-Message-State: AO0yUKU8HNpotzhWLvEnfpcu7QnOIrAt4uUg0BrgeiNdB9CiccQKl9Ty
	gOUvZ3laCanyyfYjzH4MWAOak4GeA3TjfnQMTTA=
X-Google-Smtp-Source: AK7set9MBF+cgaDazaqsWQaTxBA/fD7CzrvHmWOKRiZpG84l7B6lwQ56kwpuzjVn65GmxYxseRPcgA==
X-Received: by 2002:a19:5517:0:b0:4db:26d3:e2f8 with SMTP id n23-20020a195517000000b004db26d3e2f8mr2748068lfe.22.1677080042624;
        Wed, 22 Feb 2023 07:34:02 -0800 (PST)
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
Subject: [XEN PATCH v7 10/20] xen/arm: ffa: add direct request support
Date: Wed, 22 Feb 2023 16:33:07 +0100
Message-Id: <3332563e64568b2ffd236b1f428c27aa4cdf9790.1677079672.git.jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677079671.git.jens.wiklander@linaro.org>
References: <cover.1677079671.git.jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds support for sending a FF-A direct request. Checks that the SP also
supports handling a 32-bit direct request. 64-bit direct requests are
not used by the mediator itself so there is not need to check for that.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/tee/ffa.c | 119 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 463fd7730573..a5d8a12635b6 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -142,6 +142,7 @@
 
 struct ffa_ctx {
     uint32_t guest_vers;
+    bool interrupted;
 };
 
 /* Negotiated FF-A version to use with the SPMC */
@@ -167,6 +168,55 @@ static bool ffa_get_version(uint32_t *vers)
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
 static uint16_t get_vm_id(const struct domain *d)
 {
     /* +1 since 0 is reserved for the hypervisor in FF-A */
@@ -208,6 +258,66 @@ static void handle_version(struct cpu_user_regs *regs)
     set_regs(regs, vers, 0, 0, 0, 0, 0, 0, 0);
 }
 
+static void handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32_t fid)
+{
+    struct arm_smccc_1_2_regs arg = { .a0 = fid, };
+    struct arm_smccc_1_2_regs resp = { };
+    struct domain *d = current->domain;
+    struct ffa_ctx *ctx = d->arch.tee;
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
 static bool ffa_handle_call(struct cpu_user_regs *regs)
 {
     uint32_t fid = get_user_reg(regs, 0);
@@ -225,6 +335,12 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
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
@@ -310,6 +426,9 @@ static bool ffa_probe(void)
     printk(XENLOG_INFO "ARM FF-A Firmware version %u.%u\n",
            major_vers, minor_vers);
 
+    if ( !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
+        return false;
+
     ffa_version = vers;
 
     return true;
-- 
2.34.1


