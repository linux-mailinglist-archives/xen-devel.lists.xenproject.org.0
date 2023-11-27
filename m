Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C3C7FA21A
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 15:13:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642119.1001312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7cMj-0005sO-HO; Mon, 27 Nov 2023 14:13:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642119.1001312; Mon, 27 Nov 2023 14:13:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7cMj-0005oF-Bf; Mon, 27 Nov 2023 14:13:37 +0000
Received: by outflank-mailman (input) for mailman id 642119;
 Mon, 27 Nov 2023 14:13:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+WV=HI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r7cMh-0005in-OQ
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 14:13:35 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25ef3fd3-8d2f-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 15:13:33 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-50aab0ca90aso6114007e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Nov 2023 06:13:33 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 x29-20020ac259dd000000b00507b869b068sm1494100lfn.302.2023.11.27.06.13.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 06:13:31 -0800 (PST)
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
X-Inumbo-ID: 25ef3fd3-8d2f-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701094413; x=1701699213; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U9O7jlW2ke1lTOAYgSQUjqDX45LjkP4J1X6mHCR3nQ8=;
        b=FQL9/NQQyCSzklikVdYX+c+6LryAW3MCeKkC0zOD8IN+f4vQU9iuT/vmm2QoIm1q3F
         yYsFnto1v6qtLvO7qaWwTEpKloZJwkI/Rbns3Xnuw+BZa8MaRfOoi5TiSOEAAELYXxjC
         9d60NehMjAr8fYUOp5JYV5qpwGeiOfCwmt2i2E4vY4rzVrhmHzifVzKWXmJEwKBR1Om7
         zwgWQlO5NM6xfWj9ED6eGh1iz/sNpShtkdcPHS/Ssa03G206rGxHLfo+JNcmR3COeqW8
         N9KX3tJX38E2vi5JXqpJTHwz6/OQxqUW1kP7dpnXIY4kcAhHAQkNuQOmbjZ2n+bpoCPs
         XZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701094413; x=1701699213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U9O7jlW2ke1lTOAYgSQUjqDX45LjkP4J1X6mHCR3nQ8=;
        b=O9SM2aXn43S6YiW9tQS5rc6YWbzgp0HgLdB10NwDF0SB4EFHQbW93jgmuKDNjLWU7A
         nNUL9VT34SgKFxOk5BQnKzlPLxp1ea/eVouepLkjdWKxfkIhPyDkwswVJkngmFTVhZu8
         W9h7HVLr3MZeUHeiJPFiwPHKwjODAuQi1B7jwUd8mf/zX4wSfssKRLTBj7dZEFwoVeZm
         yS3ki1o6rBu/Z8vHIkXlbBoffpduqNxN2prlcVZ8B+BvXd6OdFn2IzGrhWMCMEACcgl2
         yhwvaUyz+VsOUmAxsPN6irzXR1mcLHn4XM1O+5x3xFPudc9APcLJF6tIWaJMGdkFuyFU
         707w==
X-Gm-Message-State: AOJu0Yxf2RtimdMbP5UClcuCvn1qnj+x/EU0NHn91cp0aW7BnqSnkdhv
	m4EzQd0Him4MOzAwSZ2Y+VWR975oguiGfA==
X-Google-Smtp-Source: AGHT+IHUpefJlm8io5BjsZw06/4eH4Ux24My5p1bmY1fI2IT6oNJBg5n2kcJyvqUuUYk3v2PhpwUiw==
X-Received: by 2002:a05:6512:1592:b0:507:ab58:7f7a with SMTP id bp18-20020a056512159200b00507ab587f7amr10227140lfb.10.1701094411951;
        Mon, 27 Nov 2023 06:13:31 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v4 01/14] xen/asm-generic: introduce stub header paging.h
Date: Mon, 27 Nov 2023 16:13:14 +0200
Message-ID: <78608aaa8108f1dd56758c098f64534580c54cc3.1701093907.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1701093907.git.oleksii.kurochko@gmail.com>
References: <cover.1701093907.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces generic paging.h header for Arm, PPC and
RISC-V.

All mentioned above architectures use hardware virt extensions
and hardware pagetable extensions thereby it makes sense to set
paging_mode_translate and paging_mode_external by default.

Also in this patch Arm and PPC architectures are switched to
generic paging.h header.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
Changes in V4:
 - Added Acked-by: Julien Grall <jgrall@amazon.com>.
---
Changes in V3:
 - Sort xen/arch/{arm,ppc}/include/asm/Makefile alphabetically.
 - Add Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V2:
	- evaluate argument of macros
	- covert macros to true
	- use proper tabs
	- switch Arm & PPC to generic paging.h
	- update commit message
---
 xen/arch/arm/include/asm/Makefile |  1 +
 xen/arch/arm/include/asm/paging.h | 16 ----------------
 xen/arch/ppc/include/asm/Makefile |  1 +
 xen/arch/ppc/include/asm/paging.h |  7 -------
 xen/include/asm-generic/paging.h  | 19 +++++++++++++++++++
 5 files changed, 21 insertions(+), 23 deletions(-)
 delete mode 100644 xen/arch/arm/include/asm/paging.h
 delete mode 100644 xen/arch/ppc/include/asm/paging.h
 create mode 100644 xen/include/asm-generic/paging.h

diff --git a/xen/arch/arm/include/asm/Makefile b/xen/arch/arm/include/asm/Makefile
index 821addb0bf..ece7fa66dd 100644
--- a/xen/arch/arm/include/asm/Makefile
+++ b/xen/arch/arm/include/asm/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
+generic-y += paging.h
 generic-y += vm_event.h
diff --git a/xen/arch/arm/include/asm/paging.h b/xen/arch/arm/include/asm/paging.h
deleted file mode 100644
index 6d1a000246..0000000000
--- a/xen/arch/arm/include/asm/paging.h
+++ /dev/null
@@ -1,16 +0,0 @@
-#ifndef _XEN_PAGING_H
-#define _XEN_PAGING_H
-
-#define paging_mode_translate(d)              (1)
-#define paging_mode_external(d)               (1)
-
-#endif /* XEN_PAGING_H */
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * indent-tabs-mode: nil
- * End:
- */
diff --git a/xen/arch/ppc/include/asm/Makefile b/xen/arch/ppc/include/asm/Makefile
index 821addb0bf..ece7fa66dd 100644
--- a/xen/arch/ppc/include/asm/Makefile
+++ b/xen/arch/ppc/include/asm/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
+generic-y += paging.h
 generic-y += vm_event.h
diff --git a/xen/arch/ppc/include/asm/paging.h b/xen/arch/ppc/include/asm/paging.h
deleted file mode 100644
index eccacece29..0000000000
--- a/xen/arch/ppc/include/asm/paging.h
+++ /dev/null
@@ -1,7 +0,0 @@
-#ifndef __ASM_PPC_PAGING_H__
-#define __ASM_PPC_PAGING_H__
-
-#define paging_mode_translate(d)              (1)
-#define paging_mode_external(d)               (1)
-
-#endif /* __ASM_PPC_PAGING_H__ */
diff --git a/xen/include/asm-generic/paging.h b/xen/include/asm-generic/paging.h
new file mode 100644
index 0000000000..8df534cfdc
--- /dev/null
+++ b/xen/include/asm-generic/paging.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_PAGING_H__
+#define __ASM_GENERIC_PAGING_H__
+
+#include <xen/stdbool.h>
+
+#define paging_mode_translate(d)    ((void)(d), true)
+#define paging_mode_external(d)     ((void)(d), true)
+
+#endif /* __ASM_GENERIC_PAGING_H__ */
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
2.43.0


