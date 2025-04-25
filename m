Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A9CA9C76B
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 13:24:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.967686.1357419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8HAN-0001D4-K8; Fri, 25 Apr 2025 11:24:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 967686.1357419; Fri, 25 Apr 2025 11:24:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8HAN-0001Av-Gz; Fri, 25 Apr 2025 11:24:23 +0000
Received: by outflank-mailman (input) for mailman id 967686;
 Fri, 25 Apr 2025 11:24:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6c45=XL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u8HAL-0001A7-RY
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 11:24:21 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d552c605-21c7-11f0-9eb3-5ba50f476ded;
 Fri, 25 Apr 2025 13:24:21 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43d04ea9d9aso9815905e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Apr 2025 04:24:21 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-440a531072csm21743005e9.18.2025.04.25.04.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 04:24:19 -0700 (PDT)
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
X-Inumbo-ID: d552c605-21c7-11f0-9eb3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745580260; x=1746185060; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vhEPjQ0dQZYRoJ0ktNBv9zT4/PmoHcrhpTUaXmh36R0=;
        b=msKsHHLCuIPuOcLK0js/Oo3rRTXzPeCz1k4mfc6WiJIvSnxi17LuplZ7WZmPrJ6/Y4
         wNeJszfR7T1cPWb12PfSIdNEtBllkI80cntKWQ9T+6eb63Gh82gven9WULf1ThaydCrn
         b+GeBbytuXGeDi6pbqwk47dPOfMPBKvTs7hG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745580260; x=1746185060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vhEPjQ0dQZYRoJ0ktNBv9zT4/PmoHcrhpTUaXmh36R0=;
        b=Oo3IxHPhqEK+pYbPgy0lQnBJQJF9fyNqh6eO8QRwSd04+kT9mwAYw/5mN/nCv8DBjM
         Ymiamrt1/Yip8m3GtWDdQJC6AlrXtMVkqyHujAJP33JUkc9Lpum18IqmxO2Rp/+43j4a
         gFxFPXZmMgEorCFsXG+/kMskM8Y3bQPNHw3CS9OQmVStQxjAy+WqdlBMwH+g5WsZQRi3
         9bQG0uRvebZP1xeu7s96YAtsF1dLqyUZ4xdxn/bi73uQqXxlKgxWa9w3qaRHVPWnaMmW
         KplzGbNWUO/ewnUpsEmVEqjwUrrKW55m8aFoVYaLrLMOxAQp6SwPrPPkvnoSMyAwL56F
         lnGw==
X-Gm-Message-State: AOJu0YzqQCJl3q73IWj6DnutafEO/9MR+OdVfgdQVwDnFnv8TY3oDtRB
	bcviUzv0ViBwxqTCFWo8/nK749GctGUgQEoGLFvo3SO07/wsOmpyuGrrMKHPaCnYKrnuODEUw6m
	U
X-Gm-Gg: ASbGnctwXwVzxdev0OBJ5Ss5ZfgySCBBPd85czMwmpThZR95opQcpsjFABKhoUPvahx
	vyUZJr5h9OZE2x8E6DIcjRA3vWx0tdeFBEr88POxFlhu5qmy6fkvanSIsYu734g9XUqcxjTeUFg
	14z6O/bHQV8toAdHZCTT7P1OWjkoEN1Tz8xnNb0v9th+EX+g6vIXPV+gyXRM6a2DyFUF8XiFqLg
	OWMq/iFkJ+1U3igKiv0IAb7azlahAbk6CDUT91D+4tqLdF3dJ/U9Ks02YPZPwNY0mI6hSak7tMK
	lvUUmLVGqeWMsFPDyLSLipxSadsoO9k97jr1uMN/jFvKNRQaBXbrb0V3DOqIIKcCbJDUMyzHZqK
	SRXZLSo019sPYgA==
X-Google-Smtp-Source: AGHT+IGb33P6iew2x/LwHCVVSD/WMU6Rnd/sjM/clhLo2nrZj8J0Qdu+u/nUx/p6WnCLGVbN07MdsQ==
X-Received: by 2002:a05:600c:c88:b0:43d:10c:2f60 with SMTP id 5b1f17b1804b1-440a669c41bmr14772985e9.24.1745580260269;
        Fri, 25 Apr 2025 04:24:20 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v5 1/3] xen/mm: Introduce mm-types.h
Date: Fri, 25 Apr 2025 12:24:13 +0100
Message-Id: <20250425112415.245585-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250425112415.245585-1-andrew.cooper3@citrix.com>
References: <20250425112415.245585-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The type used for pagetable attributes/permissions is currently unsigned int,
but needs to become architecture dependent as PPC needs unsigned long.

Introduce mm-types.h to house pte_attr_t.

Given the new toolchain baseline, we can use __has_include() now to remove the
need for boilerplate on most architectures.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>

__has_include() was one of the justifications for the new toolchain baseline,
and is included in https://gitlab.com/xen-project/xen/-/issues/201
---
 xen/include/xen/mm-types.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 xen/include/xen/mm-types.h

diff --git a/xen/include/xen/mm-types.h b/xen/include/xen/mm-types.h
new file mode 100644
index 000000000000..19f692e9aaa4
--- /dev/null
+++ b/xen/include/xen/mm-types.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef XEN_MM_TYPES_H
+#define XEN_MM_TYPES_H
+
+/*
+ * Types used to abstract away architecture-specific details in the memory
+ * management code.
+ *
+ * Architectures need only provide their own asm/mm-types.h if they want to
+ * override the defaults given here.
+ */
+#if __has_include(<asm/mm-types.h>)
+# include <asm/mm-types.h>
+#else /* !__has_include(<asm/mm-types.h>) */
+
+typedef unsigned int pte_attr_t;
+
+#endif /* !__has_include(<asm/mm-types.h>) */
+#endif /* XEN_MM_TYPES_H */
-- 
2.39.5


