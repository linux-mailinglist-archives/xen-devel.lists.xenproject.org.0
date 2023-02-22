Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9618569F809
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 16:34:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499546.770790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUr8B-00032Q-Ry; Wed, 22 Feb 2023 15:34:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499546.770790; Wed, 22 Feb 2023 15:34:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUr8B-0002oX-5g; Wed, 22 Feb 2023 15:34:07 +0000
Received: by outflank-mailman (input) for mailman id 499546;
 Wed, 22 Feb 2023 15:34:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvgA=6S=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pUr87-0001MH-TG
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 15:34:04 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54c90f4c-b2c6-11ed-93b6-47a8fe42b414;
 Wed, 22 Feb 2023 16:34:01 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id m6so10601812lfq.5
 for <xen-devel@lists.xenproject.org>; Wed, 22 Feb 2023 07:34:02 -0800 (PST)
Received: from localhost.localdomain (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 q9-20020ac25289000000b004db0d26adb4sm927746lfm.182.2023.02.22.07.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 07:34:01 -0800 (PST)
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
X-Inumbo-ID: 54c90f4c-b2c6-11ed-93b6-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qlRarVPuGGMxZJ7O9DysTL7l0g/2Vw4D9Z/5pFVB9eY=;
        b=v6eOR64rfNhuETorAOP32Qsll4kvQB9Dgr24SH4+6NC8LyDPcWLA9Txni/P313Yu84
         ijBsLthYJCWX8rLhn0AZ8WgHJiggxz0OGHcnjWi2ELDHpC2tyY5sjFg4SaKglJPE2y1c
         OobXeDx38ZOfnjIXy+5uSycUzKX7aEJpk3gHYsyDn4ocAJLGOMijC1kkxh69COT7r5Gv
         lH/yW2Ce/ylH/JdyjppsFcQtZ2pQyVQQXOWN8LdFvaqOMxYOXXRMBcpk3qDA3PhXE5oG
         Br/N22skns/Tggkr1hYsnjSxVvbB9YQGoa15L0qL5UuQ4A3ZVsDot0SudVgBewchl/1E
         FeMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qlRarVPuGGMxZJ7O9DysTL7l0g/2Vw4D9Z/5pFVB9eY=;
        b=VVLb35Nd3O61M+MnaZxMV+/QwVY+l9eLgyzQNlZ/dIXXC0M52l/uB5QuLDx4+oNOQ7
         3/lsmpmmkGsXZEVCCVtKMin+jAr2S+0KCJR+CR8AKjEvcTViYDdH8+oS3Wwfv1ubuBA4
         AnLjA/+09bRvtLbcd3v7PpNNlCzhlapqgrLutiNPYbxi83phfw9ZilmoXRhEy5m+N5KZ
         5KUi4BhTBxalYNWUk4JfVoGLO2q2xsP3BJ4WWytuRwiqSSZ0w4ZLTIGV6Znv3pk1Wxh6
         ji9SM40NrZI8KeugFGMozAzWzDus1KDkqpgVtnlO3LcDpCcH6VFoLjrf1NS4Zp3UUeQu
         dvJQ==
X-Gm-Message-State: AO0yUKVVqPs6MV5+NJfJGrqsnY4wl57gC359P/mF4AOs9faFPcFr3Irm
	nHwAHwKEXJ6+7l+TNNlTPKMX9QOSpETNd6RxMmQ=
X-Google-Smtp-Source: AK7set/IEh/V1KX9mwsFk0gNb3edbAK94pykYyZvOLSlTnGOfCA8Xl0pLjrnvD6r9JW5sb3plOEDfA==
X-Received: by 2002:ac2:4893:0:b0:4db:44e1:d8a1 with SMTP id x19-20020ac24893000000b004db44e1d8a1mr3484319lfc.0.1677080041867;
        Wed, 22 Feb 2023 07:34:01 -0800 (PST)
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
Subject: [XEN PATCH v7 09/20] xen/arm: ffa: add support for FFA_ID_GET
Date: Wed, 22 Feb 2023 16:33:06 +0100
Message-Id: <82e4e0c3ac1614822fddd90336c22e6fad5b485e.1677079672.git.jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677079671.git.jens.wiklander@linaro.org>
References: <cover.1677079671.git.jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds support for the FF-A function FFA_ID_GET to return the ID of the
calling client.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/tee/ffa.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 8b0b80ce1ff5..463fd7730573 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -167,6 +167,12 @@ static bool ffa_get_version(uint32_t *vers)
     return true;
 }
 
+static uint16_t get_vm_id(const struct domain *d)
+{
+    /* +1 since 0 is reserved for the hypervisor in FF-A */
+    return d->domain_id + 1;
+}
+
 static void set_regs(struct cpu_user_regs *regs, register_t v0, register_t v1,
                      register_t v2, register_t v3, register_t v4, register_t v5,
                      register_t v6, register_t v7)
@@ -181,6 +187,12 @@ static void set_regs(struct cpu_user_regs *regs, register_t v0, register_t v1,
         set_user_reg(regs, 7, v7);
 }
 
+static void set_regs_success(struct cpu_user_regs *regs, uint32_t w2,
+                             uint32_t w3)
+{
+    set_regs(regs, FFA_SUCCESS_32, 0, w2, w3, 0, 0, 0, 0);
+}
+
 static void handle_version(struct cpu_user_regs *regs)
 {
     struct domain *d = current->domain;
@@ -210,6 +222,9 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
     case FFA_VERSION:
         handle_version(regs);
         return true;
+    case FFA_ID_GET:
+        set_regs_success(regs, get_vm_id(d), 0);
+        return true;
 
     default:
         gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
@@ -221,7 +236,11 @@ static int ffa_domain_init(struct domain *d)
 {
     struct ffa_ctx *ctx;
 
-    if ( !ffa_version )
+     /*
+      * We can't use that last possible domain ID or get_vm_id() would cause
+      * an overflow.
+      */
+    if ( !ffa_version || d->domain_id == UINT16_MAX)
         return -ENODEV;
 
     ctx = xzalloc(struct ffa_ctx);
-- 
2.34.1


