Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B973377DE7B
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:20:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584335.915020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDdi-0007Vk-RU; Wed, 16 Aug 2023 10:20:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584335.915020; Wed, 16 Aug 2023 10:20:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDdi-00077n-4q; Wed, 16 Aug 2023 10:20:34 +0000
Received: by outflank-mailman (input) for mailman id 584335;
 Wed, 16 Aug 2023 10:20:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDdd-0003RA-RY
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:20:29 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85495f00-3c1e-11ee-9b0c-b553b5be7939;
 Wed, 16 Aug 2023 12:20:27 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-318015ade49so5634143f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:28 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:26 -0700 (PDT)
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
X-Inumbo-ID: 85495f00-3c1e-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181227; x=1692786027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PRRBWp83boHb+zw6sm5d52jnQMLItidtewKC9LBmK0s=;
        b=acbGmCNgJ9BfzSje08D/GyvOXnkTZ6MKs8jLJ8CUZfNBanJDjBeMOUN5BIN7jFX+gI
         ICGv0cUDyLiXWAt5826PFLvpo7RAeuVPKJV7DjPgzUw3xSf2DHJSqB0wVRH1tveuO4UB
         1gsgQQMkOgnYRRFWXJskJseLRo/1J6hBBIpoXC0/T0PXLSaiAlQGtda2ybmcv+AxYQya
         QroNKhvDXogArrwwrl8VSQBLz/iWHqBvmssEkR32Yo01sIBg28mt28K5fdY66kDCwpWc
         L3pVrgS/PafOSgR+ukXy9wHzkI6WdGMJTAysgwwtO6HzvEuKsFGsQdGaVaS1lYnoJk0K
         9YCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181227; x=1692786027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PRRBWp83boHb+zw6sm5d52jnQMLItidtewKC9LBmK0s=;
        b=UGkC+L8I8LKn8zQGJfzTMFYUVonJ7mKd98J3+uNPHW4/4zinzorooNwC0UFybHpnqQ
         l/e0ME3hJ3pWntyKYbaHpyr4q9sYfQYy2+BxzPwmwZfAaYwgs4hMsTGMCqV5Jfm9yTZv
         y2sNprrJZJ+Rrhfmc8QrgOHxChQWZeSA8bP/PZy2XYMOIDnp5Y0ycpT4zx9vjiBXCESP
         UEjdB5wEE3jsfnUDIKyjE9XkmQVZ+pVC9FsTlP0BO/5qT45VmwsiNG/HJOCAEUgHuc0X
         HtI7N5SAqdL376fi+Lf6Nnr0rIw/UvjTshNrDThB+rT2VZR0g49O0suQpHZ34C0p7sO4
         c2GA==
X-Gm-Message-State: AOJu0YzRdSg8nKuaJ7z23F2kVdT+a8UDjmDardqtdfI5ghYyJ6+wnAnF
	JOP9LgS8J7TBiV3yYZzsY2JMenbfwmiQuXm7
X-Google-Smtp-Source: AGHT+IFBPfRX+VhcbMwYOZ7HBeoHmuo12zcgNhpbd6Un+nAGIc1pXN2RRVMVOJjiGbz+QSxC8otRAA==
X-Received: by 2002:a5d:474a:0:b0:319:7c7d:8c1 with SMTP id o10-20020a5d474a000000b003197c7d08c1mr1274785wrs.18.1692181227193;
        Wed, 16 Aug 2023 03:20:27 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 16/57] xen/riscv: introduce asm/nospec.h
Date: Wed, 16 Aug 2023 13:19:26 +0300
Message-ID: <f93d0388d94255de3f40408345192684dd6302af.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/nospec.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/nospec.h

diff --git a/xen/arch/riscv/include/asm/nospec.h b/xen/arch/riscv/include/asm/nospec.h
new file mode 100644
index 0000000000..55087fa831
--- /dev/null
+++ b/xen/arch/riscv/include/asm/nospec.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright 2018 Amazon.com, Inc. or its affiliates. All Rights Reserved. */
+
+#ifndef _ASM_RISCV_NOSPEC_H
+#define _ASM_RISCV_NOSPEC_H
+
+static inline bool evaluate_nospec(bool condition)
+{
+    return condition;
+}
+
+static inline void block_speculation(void)
+{
+}
+
+#endif /* _ASM_RISCV_NOSPEC_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.41.0


