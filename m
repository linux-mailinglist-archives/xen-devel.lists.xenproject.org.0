Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 418197FA215
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 15:13:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642122.1001345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7cMo-0006tN-Bc; Mon, 27 Nov 2023 14:13:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642122.1001345; Mon, 27 Nov 2023 14:13:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7cMo-0006rV-6v; Mon, 27 Nov 2023 14:13:42 +0000
Received: by outflank-mailman (input) for mailman id 642122;
 Mon, 27 Nov 2023 14:13:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+WV=HI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r7cMm-0005in-6D
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 14:13:40 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28df9258-8d2f-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 15:13:38 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-5079f6efd64so5736092e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 Nov 2023 06:13:38 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 x29-20020ac259dd000000b00507b869b068sm1494100lfn.302.2023.11.27.06.13.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 06:13:36 -0800 (PST)
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
X-Inumbo-ID: 28df9258-8d2f-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701094418; x=1701699218; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iArxO5Q+e25GnaSqlqRKwaYLFQZh1QQBQsbgx4QCxvE=;
        b=TkmFCuPjvERm7zHhMnga0i795JMPzF7IIStd5uFrO7ZADZCp39Inug7UntDP43ZSf4
         gA46TGCJv08GoXpErmK9Nc7B0LaANBHIq6jVxSD8oLrYc3Z8zMXRkUpA0x5QZUwI17CF
         +LfZdprFZlnszzMJ0hb2I8oVHqCCuKSDljyVJioU6fh6p8n2n7ztnUthQKaMseP+8rkY
         NaTyi17UhJi8BctdiSoSXYMQuhYtuYrT+ugmvKPCR0wYPJs2JQj+NzFkxTkseOwFsePz
         /oEe66tFrlxmKgU26nKsFGxSlDeenMp/FlgOa17Osfs18yIcyfO4n6L6/do+Dqne1FMb
         et3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701094418; x=1701699218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iArxO5Q+e25GnaSqlqRKwaYLFQZh1QQBQsbgx4QCxvE=;
        b=n58Lsq9aFhvAUJLFxxFDF8O/yiAeiOQMQv0uI7TdXuTbPHLxPEQFRKWO66srFjw8qM
         bKk7Hp9NuevIqYJX4q+7pKmGgT8183GWqIdMM++RsUiFELKV/NBMxQHnQLcGcQskallE
         zETGm5fuMQA/LSy2chZyxAq+RncDJ8J5/0K4VbUM6lOzs2odLnBsLe+R+CzvmUdkKJC4
         z2qCEOSQzCO6zvVjlrDRmRY1O3Ltdmh4PcNsYFLEY6MkdnVBxawTjWRQWJ1ZTx6dXTmq
         LarH5grPlA0I17WYfuauBGRIHY9QKNzLbuSqhVVjqrSwQaXsmminUMdJIdQN2CIsPQm5
         wddQ==
X-Gm-Message-State: AOJu0YynBQ23iEuL/ki5pERcQVbxFiW8uKD2bC+VQLV9hz/XiwJMPRi9
	qqjgv3beL63UT19YPV5xPQpoaZwB+oCa6g==
X-Google-Smtp-Source: AGHT+IH/exedbxyFOf3LS6xovtduxEpwge7jrCOrzVMj28WIz07/xbb24ot6oHAdSP2YExPkcHhwPA==
X-Received: by 2002:ac2:456a:0:b0:507:a0d6:f178 with SMTP id k10-20020ac2456a000000b00507a0d6f178mr7027439lfm.35.1701094417655;
        Mon, 27 Nov 2023 06:13:37 -0800 (PST)
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
Subject: [PATCH v4 05/14] xen/asm-generic: introduce stub header <asm/random.h>
Date: Mon, 27 Nov 2023 16:13:18 +0200
Message-ID: <6025959eee0b7c140b97a7866c6c762e74eee1a7.1701093907.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1701093907.git.oleksii.kurochko@gmail.com>
References: <cover.1701093907.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

<asm/random.h> is common for Arm, PPC and RISC-V thereby it
is moved to asm-generic.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
Changes in V4:
 - Added Reviewed-by: Jan Beulich <jbeulich@suse.com>
 - Added Acked-by: Julien Grall <jgrall@amazon.com>
---
Changes in V3:
 - Drop Arm and PPC's random.h and switch to asm-generic verison.
---
Changes in V2:
 - update the commit messages
---
 xen/arch/arm/include/asm/Makefile |  1 +
 xen/arch/arm/include/asm/random.h |  9 ---------
 xen/arch/ppc/include/asm/Makefile |  1 +
 xen/arch/ppc/include/asm/random.h |  9 ---------
 xen/include/asm-generic/random.h  | 19 +++++++++++++++++++
 5 files changed, 21 insertions(+), 18 deletions(-)
 delete mode 100644 xen/arch/arm/include/asm/random.h
 delete mode 100644 xen/arch/ppc/include/asm/random.h
 create mode 100644 xen/include/asm-generic/random.h

diff --git a/xen/arch/arm/include/asm/Makefile b/xen/arch/arm/include/asm/Makefile
index 2d036045e8..7593c4e8ee 100644
--- a/xen/arch/arm/include/asm/Makefile
+++ b/xen/arch/arm/include/asm/Makefile
@@ -2,4 +2,5 @@
 generic-y += device.h
 generic-y += iocap.h
 generic-y += paging.h
+generic-y += random.h
 generic-y += vm_event.h
diff --git a/xen/arch/arm/include/asm/random.h b/xen/arch/arm/include/asm/random.h
deleted file mode 100644
index b4acee276b..0000000000
--- a/xen/arch/arm/include/asm/random.h
+++ /dev/null
@@ -1,9 +0,0 @@
-#ifndef __ASM_RANDOM_H__
-#define __ASM_RANDOM_H__
-
-static inline unsigned int arch_get_random(void)
-{
-    return 0;
-}
-
-#endif /* __ASM_RANDOM_H__ */
diff --git a/xen/arch/ppc/include/asm/Makefile b/xen/arch/ppc/include/asm/Makefile
index 209c3e74d8..039b0eb5ee 100644
--- a/xen/arch/ppc/include/asm/Makefile
+++ b/xen/arch/ppc/include/asm/Makefile
@@ -3,4 +3,5 @@ generic-y += device.h
 generic-y += hypercall.h
 generic-y += iocap.h
 generic-y += paging.h
+generic-y += random.h
 generic-y += vm_event.h
diff --git a/xen/arch/ppc/include/asm/random.h b/xen/arch/ppc/include/asm/random.h
deleted file mode 100644
index 2f9e9bbae4..0000000000
--- a/xen/arch/ppc/include/asm/random.h
+++ /dev/null
@@ -1,9 +0,0 @@
-#ifndef __ASM_PPC_RANDOM_H__
-#define __ASM_PPC_RANDOM_H__
-
-static inline unsigned int arch_get_random(void)
-{
-    return 0;
-}
-
-#endif /* __ASM_PPC_RANDOM_H__ */
diff --git a/xen/include/asm-generic/random.h b/xen/include/asm-generic/random.h
new file mode 100644
index 0000000000..d0d35dd217
--- /dev/null
+++ b/xen/include/asm-generic/random.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_RANDOM_H__
+#define __ASM_GENERIC_RANDOM_H__
+
+static inline unsigned int arch_get_random(void)
+{
+    return 0;
+}
+
+#endif /* __ASM_GENERIC_RANDOM_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: BSD
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.43.0


