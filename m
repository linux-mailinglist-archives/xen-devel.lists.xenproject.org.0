Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B49AEA74B95
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 14:51:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930758.1333375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyA7d-00060e-AA; Fri, 28 Mar 2025 13:51:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930758.1333375; Fri, 28 Mar 2025 13:51:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyA7d-0005y6-7U; Fri, 28 Mar 2025 13:51:45 +0000
Received: by outflank-mailman (input) for mailman id 930758;
 Fri, 28 Mar 2025 13:51:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IZL4=WP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tyA0w-0005Dp-Vu
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 13:44:50 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d10277bf-0bda-11f0-9ea3-5ba50f476ded;
 Fri, 28 Mar 2025 14:44:48 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43cf034d4abso23718445e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Mar 2025 06:44:48 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8314f5c6sm73339085e9.40.2025.03.28.06.44.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 06:44:47 -0700 (PDT)
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
X-Inumbo-ID: d10277bf-0bda-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743169488; x=1743774288; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z+IilGevx5q9qVo7mZ80r/6WWtDlcFRJKDVvVraWG5E=;
        b=miYAZjSOgopZ7er3mpT1Pb6zFMXz5ecOcXh9ZUJUwf9cUrGoFb3N5lIoB5GxcH1h2T
         yZzkScbOChY3Erd1EAKs5/aJnFHJ+kuQ+3Jbd9yClompx8ZsfdzkGKGU2mghqK4FbZ1A
         mmRMLbuJT/NHV7DtulJt6kXfaySbwsahgOrt8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743169488; x=1743774288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z+IilGevx5q9qVo7mZ80r/6WWtDlcFRJKDVvVraWG5E=;
        b=MeRX0YEZR6jdPPHiHsQf8TXjwYCQ72xXhj+HiGsqhYfTPrl6Rq2hE8ztZQj8oHB1D9
         R3Kh4CwSF216P3CXNJ0PKadqHtjkd0lUm9Q/0ZagVWiLlGj04EcUVN0ExRaA8ZsF9MEO
         yrS39/UmF7Glk5LnnfaAC7gesPQnKd1DduinPYmYJ9Tp8eSXTxS6w9yGiBhJhVSvaDxf
         W1RYHk/6Y9AaZZCiqyI6bUrRqZAyoZfaAlrjI+s+1+vYbHWdi7Z+rQGDH/TSYxhCdfVj
         fVQbYKpA3g14nWbx2pyG0gaAhFzl/q18x51J5ybmYCE6nw94k9hZuYvDcBUwnwvIuUDX
         XJqg==
X-Gm-Message-State: AOJu0YzOVGLMlc80bvo9WM9ODLEG7qKsp6nenGymd95sXY6WEJbsCBOl
	zIyG9htFclkvw9Us/wK3vqGe/XAfHqx48qfX4JE8uOn2Kg0mCYk2yt8MRpcMcTrpDXQYNXa3qd1
	PZ8U=
X-Gm-Gg: ASbGnct7xgD56fYYWldq96+Yhl81f8FFZNFZ9SnyNmfIFZeJltkpgTjQ6BIwvpvCVO6
	I/zYxGfsYpqEJF25fJTkAy3/oJnkJdDwt5+fcXUmBpB0H1v8M20sGvzSl0Xm1sVrB4zMsijo9UT
	ZL2DSMPrqon7nyxez5TKnsV0V2VHkqJKlPp0xI5EO+DtlA6adUhLTEkEzVCziZq3BZtjkZ2K4tf
	cuQC8KNVIB34RG7liZMnyuGnRO8Fat2B/Br2cCWQZpFi8o5HLPeUa05mXS3vGqu0PPXxOqd0sFf
	69unE/STJOrZ8h9Dj6WmutCd1RmQqx9IYLAjm84Zft4fH4+7JbKTJD6eKNXjiJhiGe08ROYd2Uw
	ZgEoRIPhOyKsqlqcg5KseOkyBK5MP
X-Google-Smtp-Source: AGHT+IHx3WBGb8B0p0qC21b3Uv+TnBjigba14tinL+ecURm3/tNn9wT516bmb4QZYSGgnCNW0JuRig==
X-Received: by 2002:a05:600c:444c:b0:43c:ed61:2c26 with SMTP id 5b1f17b1804b1-43d84fb27a7mr70300525e9.17.1743169487737;
        Fri, 28 Mar 2025 06:44:47 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Lin Liu <lin.liu@citrix.com>
Subject: [PATCH v5 14/16] ppc: Drop asm/byteorder.h
Date: Fri, 28 Mar 2025 13:44:25 +0000
Message-Id: <20250328134427.874848-15-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250328134427.874848-1-andrew.cooper3@citrix.com>
References: <20250328134427.874848-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With the common code moved fully onto xen/byteorder.h, clean up the dregs.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
CC: Lin Liu <lin.liu@citrix.com>

v5:
 * New
---
 xen/arch/ppc/include/asm/byteorder.h | 6 ------
 xen/arch/ppc/include/asm/page.h      | 4 +---
 xen/arch/ppc/mm-radix.c              | 2 +-
 3 files changed, 2 insertions(+), 10 deletions(-)
 delete mode 100644 xen/arch/ppc/include/asm/byteorder.h

diff --git a/xen/arch/ppc/include/asm/byteorder.h b/xen/arch/ppc/include/asm/byteorder.h
deleted file mode 100644
index 8df6adbf0d7d..000000000000
--- a/xen/arch/ppc/include/asm/byteorder.h
+++ /dev/null
@@ -1,6 +0,0 @@
-#ifndef _ASM_PPC_BYTEORDER_H
-#define _ASM_PPC_BYTEORDER_H
-
-#include <xen/byteorder.h>
-
-#endif /* _ASM_PPC_BYTEORDER_H */
diff --git a/xen/arch/ppc/include/asm/page.h b/xen/arch/ppc/include/asm/page.h
index 6d4cd2611c2b..c6160afcfdb8 100644
--- a/xen/arch/ppc/include/asm/page.h
+++ b/xen/arch/ppc/include/asm/page.h
@@ -3,9 +3,7 @@
 #define _ASM_PPC_PAGE_H
 
 #include <xen/bitops.h>
-#include <xen/types.h>
-
-#include <asm/byteorder.h>
+#include <xen/byteorder.h>
 
 #define PDE_VALID     PPC_BIT(0)
 #define PDE_NLB_MASK  0x1ffffffffffffe0UL
diff --git a/xen/arch/ppc/mm-radix.c b/xen/arch/ppc/mm-radix.c
index 24232f3907aa..9a00ae416af0 100644
--- a/xen/arch/ppc/mm-radix.c
+++ b/xen/arch/ppc/mm-radix.c
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 #include <xen/bitops.h>
+#include <xen/byteorder.h>
 #include <xen/init.h>
 #include <xen/kernel.h>
 #include <xen/mm.h>
@@ -7,7 +8,6 @@
 #include <xen/types.h>
 #include <xen/lib.h>
 
-#include <asm/byteorder.h>
 #include <asm/early_printk.h>
 #include <asm/page.h>
 #include <asm/processor.h>
-- 
2.39.5


