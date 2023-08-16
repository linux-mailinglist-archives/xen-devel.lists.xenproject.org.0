Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F5577DE76
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:20:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584323.914927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDdX-0004jy-8v; Wed, 16 Aug 2023 10:20:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584323.914927; Wed, 16 Aug 2023 10:20:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDdX-0004gj-0u; Wed, 16 Aug 2023 10:20:23 +0000
Received: by outflank-mailman (input) for mailman id 584323;
 Wed, 16 Aug 2023 10:20:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDdU-0003RA-P0
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:20:20 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8003af44-3c1e-11ee-9b0c-b553b5be7939;
 Wed, 16 Aug 2023 12:20:19 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3fe8a1591c8so48355225e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:19 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:18 -0700 (PDT)
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
X-Inumbo-ID: 8003af44-3c1e-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181218; x=1692786018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DJWipG2iwiDc8bNF9LYa2CYYI/tM24ga7r7eHnwSobI=;
        b=OfrAagmikytP/ddpMG4A4fpfpMYWxVBqOOHVzXgJwDnVdKnzyiZoNLjGm8jhFw24f6
         H794XPgjGCTXcdobtT3CySlTr+xYPV9XZCujlaX/r56kN10tnP4oGMTyCvE7hU1fmILk
         RKycIUzEFA7WvBwWED2AuF1QVq0PAwA0p5N2eM71ODP1sYiwJMAdK20jxTvIuMEQKi8L
         YWuLi1s5vZ94hizMDlHAo06OrtC9jHUwZZthaJzeOGPNitWBfmQu1xCH19Juvr3zIUhQ
         osnsGjAYok2wpBkaX1qkmZQi0OPTlO/h6uoJJdu2EMjIXXGdxT1iHfbSNc1JHpN+lR8p
         LWmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181218; x=1692786018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DJWipG2iwiDc8bNF9LYa2CYYI/tM24ga7r7eHnwSobI=;
        b=b/SlzohIZ7tZ9/7FyOwKFgVUi46xPYQEqqbHEkmErOBDQIdI/kmlvXh2oJcgdSBenw
         rjKTngPx6KL+/y0YMu2+uhHswGTuvSFoHMEnohphKzyoCWm8ybYpKG22uT6aCAhhlybG
         AQ/vTUeDD67NcV+XajIKIqQfZHhFu+CqatvhmCyQIBPc3rBpjsJTDiW9M0LBSBXDskzK
         jtyz14DFVXhRxUzItLgX7mCA410sEJqswukkD0eY6WUp0sLPwIbWhRGyJPZGZmPQRDk6
         huDPVjuZRkglvv301q7CGf07E5DYznjv2C4oywRMATeW33gLd4UrGzlY9TY+D6PG3VvY
         g4zQ==
X-Gm-Message-State: AOJu0YyyXxqLBtT56CSkhK1Nw8OpAxBmLETjQTiSxxN1zjjf9dwGC+U3
	it9EOz0zoqe3TfZGo30Xc/HTQhnuLp27Edxp
X-Google-Smtp-Source: AGHT+IGs9YfgB5tlmvxnnT2tew4+CB/4cQvJKR35QnsO/k8l+npci/LU4LXdbspRf6bTNoNKHfTASw==
X-Received: by 2002:adf:fb44:0:b0:319:7421:fde with SMTP id c4-20020adffb44000000b0031974210fdemr1205356wrs.32.1692181218306;
        Wed, 16 Aug 2023 03:20:18 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1 05/57] xen/riscv: introduce arch-riscv/hvm/save.h
Date: Wed, 16 Aug 2023 13:19:15 +0300
Message-ID: <0f590ab9f08e4c5515cc93067f626f30e5f43172.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/include/public/arch-riscv/hvm/save.h | 22 ++++++++++++++++++++++
 xen/include/public/hvm/save.h            |  2 ++
 2 files changed, 24 insertions(+)
 create mode 100644 xen/include/public/arch-riscv/hvm/save.h

diff --git a/xen/include/public/arch-riscv/hvm/save.h b/xen/include/public/arch-riscv/hvm/save.h
new file mode 100644
index 0000000000..b81e323848
--- /dev/null
+++ b/xen/include/public/arch-riscv/hvm/save.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Structure definitions for HVM state that is held by Xen and must
+ * be saved along with the domain's memory and device-model state.
+ *
+ * Copyright (c) 2012 Citrix Systems Ltd.
+ */
+
+#ifndef __XEN_PUBLIC_HVM_SAVE_RISCV_H__
+#define __XEN_PUBLIC_HVM_SAVE_RISCV_H__
+
+#endif
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/public/hvm/save.h b/xen/include/public/hvm/save.h
index 464ebdb0da..902320abe8 100644
--- a/xen/include/public/hvm/save.h
+++ b/xen/include/public/hvm/save.h
@@ -89,6 +89,8 @@ DECLARE_HVM_SAVE_TYPE(END, 0, struct hvm_save_end);
 #include "../arch-x86/hvm/save.h"
 #elif defined(__arm__) || defined(__aarch64__)
 #include "../arch-arm/hvm/save.h"
+#elif defined(__riscv)
+#include "../arch-riscv/hvm/save.h"
 #else
 #error "unsupported architecture"
 #endif
-- 
2.41.0


