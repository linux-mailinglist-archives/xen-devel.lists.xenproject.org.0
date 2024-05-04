Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 381F98C5C2C
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 22:18:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721731.1125364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6yaj-0003Zo-Ox; Tue, 14 May 2024 20:17:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721731.1125364; Tue, 14 May 2024 20:17:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6yaj-0003XE-LV; Tue, 14 May 2024 20:17:41 +0000
Received: by outflank-mailman (input) for mailman id 721731;
 Tue, 14 May 2024 20:17:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uMtz=MR=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1s6yai-0002pc-L0
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 20:17:40 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03386757-122f-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 22:17:40 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4200ee78f35so26599295e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 13:17:40 -0700 (PDT)
Received: from gmail.com ([213.0.35.158]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fccee9292sm206161835e9.37.2024.05.14.13.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 13:17:37 -0700 (PDT)
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
X-Inumbo-ID: 03386757-122f-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715717858; x=1716322658; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Lep3NQhPdutZe5qkYH7KS+rz9lJgEOzrCQ4vbmoNE8=;
        b=mgGIAupxBcVatInfvQ4BxfHwEEm9p8qdNGVhaXkuJYzCdkbOkH5RG64+bZ0hWuM73H
         7b0XOuUt5ZlmSVdGiu4iVwe40k+EdyUbrwZnmCFU9VuN4rbfCv+mz4js1RkQS5NrkgsK
         K/F/I3qO+3SjjGxtLmZY5q8nyE/AF730eAtfy7XJkbUaURhkN5nMj5yY5YdIuzBrNXYf
         5WIkL4FZgYfUSMcf81Y2xPnYLEdnZs7MWPboi2PDw2VVrVfXt9L7xSwlTiVn5lObthAP
         fmVviM6Jd1pzq/OFaso5mXH3jJjpRYKRAI4QD4WPE8iMXy1Ir2yP0QiDiCOiCz1KFwGw
         59uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715717858; x=1716322658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Lep3NQhPdutZe5qkYH7KS+rz9lJgEOzrCQ4vbmoNE8=;
        b=I8bdI+sB7EH7FN6JjnGlwRGZ7JmjBDjwe6ZnarCQmgr7i2CdjHO0op4DU1yywq2EqY
         wyQyCzh5veEdsYJDDU24dkXoHuCEdyGdaYkXwIoKAzucQmL6vumlMRDIKD6iBPLI1HDW
         oiggX6zMKkSRfFRI0tVJWA4k2Qu1ODHEw7dd+CJzl0q2nk9CHBo2IJp7OtHieTKcPs6J
         Qi0l2d7SMOtjle5X0+iypEOUnXbEM+tjVVSyBgxvybgsLBTZhiT09nOgCmGRTKXS8o0w
         Yrwf739U0FD9DMSNMdmVOX2Mqo+C6pLSZ9FI7B3zkbUqQ35UqmSagXQnKDq0JCpGFBOu
         5uAQ==
X-Gm-Message-State: AOJu0YzfnWiAP24TVSeZyeMEGM7LTOhGHGCArmh2IXzIgZKlboACzsLf
	4YthWo2mBvcxU5+nHJ/5nJ8RcQ5C/Qp9XLxjCVpFrqYehX1+dhEZANCzCJAjtCI=
X-Google-Smtp-Source: AGHT+IG+uxGLVFCc15wbWYAuKJA+85Tw6jQmsZx4mBC2o//DARBcPQ+DWDRVLezNMadyokMM4wsJ5w==
X-Received: by 2002:a05:600c:4f4e:b0:418:a985:3ca with SMTP id 5b1f17b1804b1-41feac556e3mr162350105e9.31.1715717858610;
        Tue, 14 May 2024 13:17:38 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	edgar.iglesias@amd.com
Subject: [PATCH v4 3/9] xen/arm64: sve: Add missing code symbol annotations
Date: Sat,  4 May 2024 13:55:08 +0200
Message-Id: <20240504115514.1063509-4-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240504115514.1063509-1-edgar.iglesias@gmail.com>
References: <20240504115514.1063509-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Use the generic xen/linkage.h macros to annotate code symbols
and add missing annotations.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/arch/arm/arm64/sve-asm.S | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/arm64/sve-asm.S b/xen/arch/arm/arm64/sve-asm.S
index 59dbefbbb2..2d8b895f07 100644
--- a/xen/arch/arm/arm64/sve-asm.S
+++ b/xen/arch/arm/arm64/sve-asm.S
@@ -161,9 +161,10 @@
 .endm
 
 /* Gets the current vector register size in bytes */
-GLOBAL(sve_get_hw_vl)
+FUNC(sve_get_hw_vl)
     _sve_rdvl 0, 1
     ret
+END(sve_get_hw_vl)
 
 /*
  * Save the SVE context
@@ -172,9 +173,10 @@ GLOBAL(sve_get_hw_vl)
  * x1 - pointer to buffer for P0-15
  * x2 - Save FFR if non-zero
  */
-GLOBAL(sve_save_ctx)
+FUNC(sve_save_ctx)
     sve_save 0, 1, x2
     ret
+END(sve_save_ctx)
 
 /*
  * Load the SVE context
@@ -183,9 +185,10 @@ GLOBAL(sve_save_ctx)
  * x1 - pointer to buffer for P0-15
  * x2 - Restore FFR if non-zero
  */
-GLOBAL(sve_load_ctx)
+FUNC(sve_load_ctx)
     sve_load 0, 1, x2
     ret
+END(sve_load_ctx)
 
 /*
  * Local variables:
-- 
2.40.1


