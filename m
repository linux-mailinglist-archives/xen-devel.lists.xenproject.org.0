Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2AF98891C
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 18:33:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806400.1217763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suDtx-0001nG-E2; Fri, 27 Sep 2024 16:33:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806400.1217763; Fri, 27 Sep 2024 16:33:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suDtx-0001fe-6Y; Fri, 27 Sep 2024 16:33:05 +0000
Received: by outflank-mailman (input) for mailman id 806400;
 Fri, 27 Sep 2024 16:33:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xL9K=QZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1suDtv-0001aC-I3
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2024 16:33:03 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 296d5a43-7cee-11ef-99a2-01e77a169b0f;
 Fri, 27 Sep 2024 18:33:01 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a8d4979b843so312315066b.3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Sep 2024 09:33:01 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c27c59bdsm150607166b.50.2024.09.27.09.32.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2024 09:32:59 -0700 (PDT)
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
X-Inumbo-ID: 296d5a43-7cee-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727454780; x=1728059580; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nzAWnVE+25sXlcSpnmj7o00ZWNIuoO0eLwRBHFjtKEM=;
        b=QnYd+stomPUKtX4Rf8vxJnK50Dq+QUmseS2wmqorcn5s38TW9hpD7uSkRb0Fe2vIaB
         Qy+GXc4/ZotxCCJ6b6AUw49b5P/0ro1kzCqT6ZL6uNjB01Yij23KARhMZLJBZsZePV5X
         w8jhhw3QSv707Jaa4ojgvLe1CqNx1+q+WwyJL6mwyTmtF0ooFggijkP1DbnMwlmTYXG0
         zzfGVMhY90P+UG/KBjC9SIn+gYc9v7uASLCYyhEZ8FVkA7pz+I7GMXcNHfMtH/4A2cUM
         WfazGfZqLFPpQ216eFGYL3Vt9Gsgh9AlxS6W75ArkS30ir1/LCgHtPR9nnbe+34QRQ+H
         HBaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727454780; x=1728059580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nzAWnVE+25sXlcSpnmj7o00ZWNIuoO0eLwRBHFjtKEM=;
        b=MBzCA3sqIhrq7TsgdLNBuFZnUC/3u9HyTw6s34Ap56Jp/kBlYDiFSD4NU2PDq77L7Z
         +we3qTSZkUdEJkyNqq81sVzTagiwG/S8sGbOdHRTVUtE4gyroMULk44qzkG+Gdp7UefL
         nY+dzXrU0pw+CuUPH0Kg9VsjueG8j27yU2VC5X+3bZCc0dURTBGZQHBs0DFNerHAlJXO
         l7jExAjOhUnMdVjNdG0+iM32rki1wpnVp6qotpyNWRfKE1fetbVwVaT5VkNAHucLi8vG
         XtPaaRzZ1wdmFpM9mzMmpaN1qt9IUc/2Og5B8/jzL6ODM1KeGe5e4FUaXjEkhrpNDwg5
         J9Nw==
X-Gm-Message-State: AOJu0YwJHzmufFvefzWn5Gqh5G0kl6lzZQxzW/Nfdt6jupjCSfawN9XJ
	qNLGteant8j23Ex4Afgi0KoRCOtWFt1WqdZIuOrq6Hry+4YPvKMeY+bW4Q==
X-Google-Smtp-Source: AGHT+IFXHO9VrrpRGbMSzTVKjhVmVf7mxR5JFaneIy5RuHsDNT47WjtuZ0HG/ZLAxrbjeAkA057dAw==
X-Received: by 2002:a17:907:743:b0:a8d:42c3:5f68 with SMTP id a640c23a62f3a-a93c492189fmr270848366b.23.1727454779991;
        Fri, 27 Sep 2024 09:32:59 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 1/6] xen: introduce DECL_SECTION_WITH_LADDR
Date: Fri, 27 Sep 2024 18:32:51 +0200
Message-ID: <e835f07478a528266f72d9ac99c090464522bbdf.1727452451.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <cover.1727452451.git.oleksii.kurochko@gmail.com>
References: <cover.1727452451.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce DECL_SECTION_WITH_LADDR in order to signal whether
DECL_SECTION() should specify a load address or not.

Update {ppc,x86}/xen.lds.S to use DECL_SECTION_WITH_LADDR.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V5:
 - s/SIMPLE_DECL_SECTION/DECL_SECTION_WITH_LADDR.
 - add space between # and define in x86/xen.lds.S.
 - use DECL_SECTION_WITH_LADDR in ppc/xen.lds.S.
 - update the commit message.
 - add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in V4:
 - new patch
---
 xen/arch/ppc/xen.lds.S    | 2 ++
 xen/arch/x86/xen.lds.S    | 6 ++++--
 xen/include/xen/xen.lds.h | 6 ++++++
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
index 0c4b94814b..30b4a6ced8 100644
--- a/xen/arch/ppc/xen.lds.S
+++ b/xen/arch/ppc/xen.lds.S
@@ -1,4 +1,6 @@
 #include <xen/lib.h>
+
+#define DECL_SECTION_WITH_LADDR
 #include <xen/xen.lds.h>
 
 OUTPUT_ARCH(powerpc:common64)
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index b60d2f0d82..7d2aa2d801 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -3,6 +3,10 @@
 
 #include <xen/cache.h>
 #include <xen/lib.h>
+
+#ifndef EFI
+# define DECL_SECTION_WITH_LADDR
+#endif
 #include <xen/xen.lds.h>
 #include <asm/page.h>
 #undef ENTRY
@@ -12,9 +16,7 @@
 
 #define FORMAT "pei-x86-64"
 #undef __XEN_VIRT_START
-#undef DECL_SECTION
 #define __XEN_VIRT_START __image_base__
-#define DECL_SECTION(x) x :
 
 ENTRY(efi_start)
 
diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
index 24b8900ffe..c6178bdc42 100644
--- a/xen/include/xen/xen.lds.h
+++ b/xen/include/xen/xen.lds.h
@@ -5,6 +5,8 @@
  * Common macros to be used in architecture specific linker scripts.
  */
 
+#ifdef DECL_SECTION_WITH_LADDR
+
 /*
  * Declare a section whose load address is based at PA 0 rather than
  * Xen's virtual base address.
@@ -15,6 +17,10 @@
 # define DECL_SECTION(x) x : AT(ADDR(x) - __XEN_VIRT_START)
 #endif
 
+#else /* !DECL_SECTION_WITH_LADDR */
+#define DECL_SECTION(x) x :
+#endif
+
 /*
  * To avoid any confusion, please note that the EFI macro does not correspond
  * to EFI support and is used when linking a native EFI (i.e. PE/COFF) binary,
-- 
2.46.1


