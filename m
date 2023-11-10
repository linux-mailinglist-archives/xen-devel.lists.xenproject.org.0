Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A91127E7DC6
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 17:31:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630609.983634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1UPH-0005al-Sq; Fri, 10 Nov 2023 16:30:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630609.983634; Fri, 10 Nov 2023 16:30:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1UPH-0005XC-M1; Fri, 10 Nov 2023 16:30:55 +0000
Received: by outflank-mailman (input) for mailman id 630609;
 Fri, 10 Nov 2023 16:30:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zww5=GX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r1UPG-0005Bj-4D
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 16:30:54 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 839d361c-7fe6-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 17:30:52 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-9d2d8343dc4so376404966b.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Nov 2023 08:30:52 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 lv19-20020a170906bc9300b009a9fbeb15f5sm4128966ejb.46.2023.11.10.08.30.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 08:30:51 -0800 (PST)
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
X-Inumbo-ID: 839d361c-7fe6-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699633851; x=1700238651; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SaO7fIOpmwMvSOOVv+9GugvV3C5eIj3jBG0s6tb0akw=;
        b=Iofty/ATYBqNhBYTGgAED+JcADJBdVzvhKT+felrbyHR4/q7ZJ2SfS6VgOAYRS2lRa
         gRQHIJOlIu7Lqk9/GhO17Z1EXD/96HKvvc5NZMpO2iduQDEEbGIHjtqXpRlsJ7lN4qxQ
         T3p6+k34luKfI26vf6SZqhjPe4PE/GP7nM9L0GdF0ilE9NK1G72DlPgbGOrc9ldh2bWW
         ByFv/1LewwZoN5nnjyT+uGIbm8Wxsb0N6M+Y37p6aNzrkEpAqNsFN0ZMNVwhUITzSWOL
         KXgj6lb9enl5mqL705Qb/C2om18+p8GCCRCoFw3zUdOeAYFYVGTxz7Afe/3DqJBLXmo9
         gpWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699633851; x=1700238651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SaO7fIOpmwMvSOOVv+9GugvV3C5eIj3jBG0s6tb0akw=;
        b=RhGKCG4twhVyg1M4m/3aXPKrr4mlHox4dN4lBidQQjbfHnGebpq9/R7M1U4TzyfWlB
         8x1oja4+mKNmrIb2fprgh6KqjApHi+M526pWqjUMS0rWnutRZ1sTKDRPcS/cPV0yNQan
         HFsbo9LMPEIT1FAFdsxuB+A9JvvK4d84ElrUdEheXSb1RQXwkY1zjFt5KXAZkhfeKIwl
         bTczLj0mknIfT79JEcIXfyIUIqRpf/qHBot6Jb9byhRVpeZW7iIkb5d4C/tFBlFyiJCp
         tJPtxnGS3Yusci3aQRghj3NaWDPx48YXX3qak7EHF9B6zg0gtAM2h5fnz1JyyQ4zbq6S
         mCCA==
X-Gm-Message-State: AOJu0Yx98NMVZyZ6ZTmDTDkIFHq8enGHEC2EmhK32bKlAi17M0WyvIWt
	WEWooz99MjdWnVApfuKALr8lOrxBj4U=
X-Google-Smtp-Source: AGHT+IH+xcDPUGvhxUL7XPfTgnwH6P9VjIpFGNUdCjKDm/hmpQ/KAUx0bbQ/Uy+KxXOw+C6blQJzIg==
X-Received: by 2002:a17:907:3ea8:b0:9a1:f10d:9746 with SMTP id hs40-20020a1709073ea800b009a1f10d9746mr7048085ejc.20.1699633851469;
        Fri, 10 Nov 2023 08:30:51 -0800 (PST)
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
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v2 01/15] xen/asm-generic: introduce stub header paging.h
Date: Fri, 10 Nov 2023 18:30:27 +0200
Message-ID: <c945fd8e0f92e3e325be77009a34aafcc6cc3a0a.1699633310.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1699633310.git.oleksii.kurochko@gmail.com>
References: <cover.1699633310.git.oleksii.kurochko@gmail.com>
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
index 821addb0bf..2128bb015f 100644
--- a/xen/arch/arm/include/asm/Makefile
+++ b/xen/arch/arm/include/asm/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 generic-y += vm_event.h
+generic-y += paging.h
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
index 821addb0bf..2128bb015f 100644
--- a/xen/arch/ppc/include/asm/Makefile
+++ b/xen/arch/ppc/include/asm/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 generic-y += vm_event.h
+generic-y += paging.h
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
2.41.0


