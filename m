Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 001037EF28E
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 13:25:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635111.990878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3xty-000178-Nk; Fri, 17 Nov 2023 12:24:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635111.990878; Fri, 17 Nov 2023 12:24:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3xty-00014Z-KF; Fri, 17 Nov 2023 12:24:50 +0000
Received: by outflank-mailman (input) for mailman id 635111;
 Fri, 17 Nov 2023 12:24:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c3wv=G6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r3xtx-0000iK-1d
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 12:24:49 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ad88f3f-8544-11ee-9b0e-b553b5be7939;
 Fri, 17 Nov 2023 13:24:45 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-507975d34e8so2722782e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 17 Nov 2023 04:24:45 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a18-20020ac25e72000000b005094d95e8bcsm209811lfr.218.2023.11.17.04.24.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 04:24:43 -0800 (PST)
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
X-Inumbo-ID: 4ad88f3f-8544-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700223884; x=1700828684; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LHOrg4p/PNWg+936iRt5+lse+XOyF9c01hq1h4Eo2Gw=;
        b=b8e1ldL7WVWwZ3RYIvenymdVb7P44vgcYA+fyk7QhD8EOdfffFf2mmK7wD826vmO9B
         C9SX1rSN3gnyA4Q4jEoHOsxofSjHYb20jfcov0rTU5f68/cc19Xoo6jTRl6hxcxTt5Wd
         70xpja6pE5Btv/AMoixt4Z17g8pdvjgicrpLK/fCT/k5cNGZcEUqnyJP4+ASOvYZ63HQ
         fqTOfG5rnj/nvvF9LnwT6IombleTaKNszEqLAcL8B3/0PYYz9WNQ7U4zi+NvapludCN1
         FIIhZfY+AP+kxTThozf36tfxCh5mMuYObpM1kBrScJrbaft0oL0QBBp0RwQTNuJ5VKOw
         jT+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700223884; x=1700828684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LHOrg4p/PNWg+936iRt5+lse+XOyF9c01hq1h4Eo2Gw=;
        b=MFp+Tb8rj2QFBGNdZpRtROujcUUTw7487lXt9zGOn7MrEF8gd4y7Akb+zoF0P4WiEh
         jilOlsb5O0PbSg/0hwwEKpeX66/DtvDxfvR0+FKpzYoCMHrbWDksHUb0XckgSgfAFMRi
         qSWiNnqpOVbIe7WZe/a2aF+uQqPVKiPIYrGxzMozpIyjR47/30Q9pBehb5EDcO+wmYLV
         ytJ3ZyuOSavhzyx1XVSzdodH7lHLTlRO9KoMgznAMSGRG74GPFznuIThwXiik0c1LQxi
         Sh7PZolGi8VJeNXJ0s8Bu4n00A2L+mAwAQsBmPcBAeGicrs7Pu7I0rYJgc/DeHkuETzL
         H1DA==
X-Gm-Message-State: AOJu0Yy8cDMhHyy5w2wI3+xjD/L1/cnsyq08zJpflIlZ8GtkTJIMO6Lc
	OskJVqN9YbeqF0VSa3o/z81JuUJfk/0=
X-Google-Smtp-Source: AGHT+IE7zHSkYQJAgwcPbwF3gopucwtESZyeJ5XW/zsr6SbKhhZ8ZIoLAW6dX67JHlCVNyZy09kfxw==
X-Received: by 2002:ac2:5451:0:b0:509:7915:a1d6 with SMTP id d17-20020ac25451000000b005097915a1d6mr12893884lfn.58.1700223884060;
        Fri, 17 Nov 2023 04:24:44 -0800 (PST)
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
Subject: [PATCH v3 01/14] xen/asm-generic: introduce stub header paging.h
Date: Fri, 17 Nov 2023 14:24:25 +0200
Message-ID: <01807c303ef000d6316f71bc4bad93d1b6c03830.1700221559.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1700221559.git.oleksii.kurochko@gmail.com>
References: <cover.1700221559.git.oleksii.kurochko@gmail.com>
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
2.41.0


