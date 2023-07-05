Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AD37480F5
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 11:35:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558890.873448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGyv5-00086H-7d; Wed, 05 Jul 2023 09:35:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558890.873448; Wed, 05 Jul 2023 09:35:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGyv4-000825-Ua; Wed, 05 Jul 2023 09:35:30 +0000
Received: by outflank-mailman (input) for mailman id 558890;
 Wed, 05 Jul 2023 09:35:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hy0b=CX=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qGyv2-0005bC-DQ
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 09:35:28 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4603b5a3-1b17-11ee-8611-37d641c3527e;
 Wed, 05 Jul 2023 11:35:26 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2b69f958ef3so104571781fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Jul 2023 02:35:26 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 q22-20020a2e84d6000000b002b6d8cfb6d2sm2910625ljh.140.2023.07.05.02.35.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 02:35:25 -0700 (PDT)
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
X-Inumbo-ID: 4603b5a3-1b17-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688549726; x=1691141726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x0GAChav/BgZruQ3EPU8Qo2tQ1sDnkEZR3Mc3i3hmhg=;
        b=B7NNbw/vy6w4tKLRiLZWwvU8hljfohWfyEwbBn5sSoQWTjZr8y/jX5iaAZwpmb9h5w
         EdzzZOicphG2Ac7ttvHMErFT6+3Skp4xynxoPAzxEww1cbhisDNKRyYH5Yr/kDGXR+K8
         J5miq7s0+zDgptmEUVCh7RWtNuWjt7Hw2wiSEuVsZMEr57JqCyzP/mQRJi2wYirrMUlt
         HO+JSjZ2eRsv5DHGS6H7wj6aTuJr6C2TmlogkK5Uy22KXuETaGqk+4JocCNpK433FEyD
         68egJnjz72Plv/q6Mlp71/VRdGo93gv4n9LDK9hJcBavwyJxhFw0U7OF+m11QT7LC+0N
         JXNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688549726; x=1691141726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x0GAChav/BgZruQ3EPU8Qo2tQ1sDnkEZR3Mc3i3hmhg=;
        b=XEwhhYedMFU+x9rQwYCUO4xgEs3oDuvvMWBG4L7WKcBNauZPafmA15LuwbPuGX+0db
         9p2PeTK3qBjeKIHXNbS7M6Z0yM6zo1BSi53rgdRYmkBx0yL/vmpXeZE0xWOa8nzFzQ2Q
         7wuaAnAQlgDL39jH26mqMwBCfXE0zeB+TBRtvEiSraPfcZcK7fH0E+ZpfIK5FN5YZavq
         gcaK7K4XFlttWYKtRb1hSARBWI7mXoET62ay0F2jhJVZleMoosITFRfh+Y9EWJKRyi1X
         tx9GIHT7dih1RhGW1abzN85ah076XB7eRLcODRhWnvjx0OwzTtLpERD/4MlpIATdEbOq
         TSjg==
X-Gm-Message-State: ABy/qLaWyETbXtLe1NSHxCUHksSt5OXB8QJbK9y952huPug8FVNqq+RA
	XHAj+mQ0t32WE+fcj5GlMG/QSfg7lJkpAx201uc=
X-Google-Smtp-Source: APBJJlFOVK027Xr13cYrFNIVHsgMnH0tYA85EQAiduYKdHJhh8oelr0qTEPlmLcdJtkcm7XZnqt20w==
X-Received: by 2002:a2e:93d6:0:b0:2b6:fe54:2a4b with SMTP id p22-20020a2e93d6000000b002b6fe542a4bmr1072946ljh.37.1688549726106;
        Wed, 05 Jul 2023 02:35:26 -0700 (PDT)
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
Subject: [XEN PATCH v9 09/24] xen/arm: ffa: add support for FFA_ID_GET
Date: Wed,  5 Jul 2023 11:34:18 +0200
Message-Id: <20230705093433.2514898-10-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230705093433.2514898-1-jens.wiklander@linaro.org>
References: <20230705093433.2514898-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds support for the FF-A function FFA_ID_GET to return the ID of the
calling client.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/tee/ffa.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index f0a2715d4bbf..e157ed20ad8b 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -181,6 +181,12 @@ static bool ffa_get_version(uint32_t *vers)
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
@@ -195,6 +201,12 @@ static void set_regs(struct cpu_user_regs *regs, register_t v0, register_t v1,
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
@@ -224,6 +236,9 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
     case FFA_VERSION:
         handle_version(regs);
         return true;
+    case FFA_ID_GET:
+        set_regs_success(regs, get_vm_id(d), 0);
+        return true;
 
     default:
         gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
@@ -237,6 +252,12 @@ static int ffa_domain_init(struct domain *d)
 
     if ( !ffa_version )
         return -ENODEV;
+     /*
+      * We can't use that last possible domain ID or get_vm_id() would cause
+      * an overflow.
+      */
+    if ( d->domain_id >= UINT16_MAX)
+        return -ERANGE;
 
     ctx = xzalloc(struct ffa_ctx);
     if ( !ctx )
-- 
2.34.1


