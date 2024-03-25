Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDF1889873
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 10:39:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697652.1088652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rognX-0002Ry-Um; Mon, 25 Mar 2024 09:39:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697652.1088652; Mon, 25 Mar 2024 09:39:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rognX-0002Nk-Oh; Mon, 25 Mar 2024 09:39:19 +0000
Received: by outflank-mailman (input) for mailman id 697652;
 Mon, 25 Mar 2024 09:39:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lWJZ=K7=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1rognV-000193-9s
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 09:39:17 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8bbe3675-ea8b-11ee-afe3-a90da7624cb6;
 Mon, 25 Mar 2024 10:39:16 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-56c0652d37aso1717002a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 25 Mar 2024 02:39:16 -0700 (PDT)
Received: from rayden.urgonet (h-217-31-164-171.A175.priv.bahnhof.se.
 [217.31.164.171]) by smtp.gmail.com with ESMTPSA id
 bw26-20020a170906c1da00b00a4650ec48d0sm2891067ejb.140.2024.03.25.02.39.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 02:39:15 -0700 (PDT)
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
X-Inumbo-ID: 8bbe3675-ea8b-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711359555; x=1711964355; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R//dqaezYULgu2Zm/BSccIHOclqXeRZ8nf6tghKZQ5k=;
        b=qMYZmF6oVlXJqcG0QDCjjaSzW1Xgjn89xzHduMJ3p1I7irq19zN1tFgWeVyOo5uzK/
         u0beJcrkGD7KHQmsyWLafnUfUGPuptioju1gdlGch5n3PFkXAAr2Zzy8L6/jCHhDFHhk
         FlE1a0T8mhQ/grkWCvvsYuHXBtdMnUl+GSvoRpWhNAOo1dQfiioHmTPvKZ3aksUCJn4V
         t28JfW/jSsboV+3Ph5nWHwTd2iNptvE335tCzMjoqTVl2SXwjiWNtUr0eL7vjgh5bfUO
         EBj3WYJhn6W3KWekKYKSv5AAAc49wDwOj0zM+WBw4pL7vDeGGcPDk8tugXVKmHpHmxGS
         5Tsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711359555; x=1711964355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R//dqaezYULgu2Zm/BSccIHOclqXeRZ8nf6tghKZQ5k=;
        b=jeRgnkzL2qWCx5zDpluExoqwAOxpXOMBWHjOG0s/bRTM9E0hyEF1GhcE5kTdrBhIak
         d+OeyVKRRvjYUrbcHFQmzYhOAJM1zRjeEtYD3V9ncLTVWAYtBSuf/kZ7rI8kUArjoB9/
         b0EheR/ygs4C5EDbW4GKIvxzpwI5aJGIrRwUmUaYszYGhnkmM9+vXDXH/6Je4D0WQ7y3
         tcJSZsGzBOb6ccSX6X3QDr2xtfzFzDvwIGC1hdko2a5uBVWJf1B5nGdgBoBh016FpsXJ
         ZMb183u7kdyahbiSfr0EhJqgCRV+8c5ym2+HBFwytR5BTNE7DX1YZeetB85XypiNdUtX
         PmRw==
X-Gm-Message-State: AOJu0Yy8au7oOFTQtF4Zb2ltoX4SvtCpOSe3sYWusAVpu4CkfYSL/+RX
	hkuA5aLR0oSqFDQkaYzP//kM1I+ZUKzyYeCj9mVG0vIfMoSnWecrwHtWgKcbAvT6lR+WGGbvCzD
	N
X-Google-Smtp-Source: AGHT+IHp+/+QUpPfntMFxFrKsbtXhYig9yZ1giP9wj9Kd44YJk/MCgWMOMMAmO3Q/Q0QMZLd9qU6Sw==
X-Received: by 2002:a17:906:4a12:b0:a47:3a99:87c with SMTP id w18-20020a1709064a1200b00a473a99087cmr4982726eju.18.1711359555664;
        Mon, 25 Mar 2024 02:39:15 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: patches@linaro.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [XEN PATCH 6/6] xen/arm: ffa: support FFA_FEATURES
Date: Mon, 25 Mar 2024 10:39:04 +0100
Message-Id: <20240325093904.3466092-7-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240325093904.3466092-1-jens.wiklander@linaro.org>
References: <20240325093904.3466092-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the mandatory FF-A ABI function FFA_FEATURES.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/tee/ffa.c | 57 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 4f7775b8c890..8665201e34a9 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -192,6 +192,60 @@ out:
                  resp.a7 & mask);
 }
 
+static void handle_features(struct cpu_user_regs *regs)
+{
+    uint32_t a1 = get_user_reg(regs, 1);
+    unsigned int n;
+
+    for ( n = 2; n <= 7; n++ )
+    {
+        if ( get_user_reg(regs, n) )
+        {
+            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
+            return;
+        }
+    }
+
+    switch ( a1 )
+    {
+    case FFA_ERROR:
+    case FFA_VERSION:
+    case FFA_SUCCESS_32:
+    case FFA_SUCCESS_64:
+    case FFA_FEATURES:
+    case FFA_ID_GET:
+    case FFA_RX_RELEASE:
+    case FFA_RXTX_UNMAP:
+    case FFA_MEM_RECLAIM:
+    case FFA_PARTITION_INFO_GET:
+    case FFA_MSG_SEND_DIRECT_REQ_32:
+    case FFA_MSG_SEND_DIRECT_REQ_64:
+        ffa_set_regs_success(regs, 0, 0);
+        break;
+    case FFA_MEM_SHARE_64:
+    case FFA_MEM_SHARE_32:
+        /*
+         * We currently don't support dynamically allocated buffers. Report
+         * that with 0 in bit[0] of w2.
+         */
+        ffa_set_regs_success(regs, 0, 0);
+        break;
+    case FFA_RXTX_MAP_64:
+    case FFA_RXTX_MAP_32:
+        /*
+         * We currently support 4k pages only, report that as 00 in
+         * bit[0:1] in w0. This needs to be revised if Xen page size
+         * differs from FFA_PAGE_SIZE (SZ_4K).
+         */
+        BUILD_BUG_ON(PAGE_SIZE != FFA_PAGE_SIZE);
+        ffa_set_regs_success(regs, 0, 0);
+        break;
+    default:
+        ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
+        break;
+    }
+}
+
 static bool ffa_handle_call(struct cpu_user_regs *regs)
 {
     uint32_t fid = get_user_reg(regs, 0);
@@ -212,6 +266,9 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
     case FFA_ID_GET:
         ffa_set_regs_success(regs, ffa_get_vm_id(d), 0);
         return true;
+    case FFA_FEATURES:
+        handle_features(regs);
+        return true;
     case FFA_RXTX_MAP_32:
     case FFA_RXTX_MAP_64:
         e = ffa_handle_rxtx_map(fid, get_user_reg(regs, 1),
-- 
2.34.1


