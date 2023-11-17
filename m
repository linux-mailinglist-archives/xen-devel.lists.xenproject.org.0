Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF46D7EF294
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 13:25:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635114.990907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3xu1-0001vK-RX; Fri, 17 Nov 2023 12:24:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635114.990907; Fri, 17 Nov 2023 12:24:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3xu1-0001pa-NB; Fri, 17 Nov 2023 12:24:53 +0000
Received: by outflank-mailman (input) for mailman id 635114;
 Fri, 17 Nov 2023 12:24:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c3wv=G6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r3xu0-0000iK-Lu
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 12:24:52 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e2627db-8544-11ee-9b0e-b553b5be7939;
 Fri, 17 Nov 2023 13:24:51 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-5094727fa67so2727460e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Nov 2023 04:24:51 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a18-20020ac25e72000000b005094d95e8bcsm209811lfr.218.2023.11.17.04.24.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 04:24:49 -0800 (PST)
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
X-Inumbo-ID: 4e2627db-8544-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700223890; x=1700828690; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i1dFNOxKIfpxe4fbqyq4aYiHJEk/IRyQX0YWJ3IS3kY=;
        b=aN5tHBU8cUyOT74PB0luPsRwb0vJQIbn72IOCyH3W84NmkkmfoWgVsQ1v9DYVz3CeD
         iraEBOy2GbPG8YD2TZDrLCk5/MZJdCs3Z8VCoN1zS/Il5b2OxTFo4yutSh/mTur+M+XT
         u1l6kbMwKqhwgjVY81Hs+aSlVMrLddaVZyf4yr1hWxpBDzvlR6aTL1cHuOH4IVTsesOX
         VW7kmbnoBp0hqSSyTG89ycwjWAgpmRX8ENT9X/ocoyDlgtEjlsy1MlBJatJTAzY6gBWb
         5gQMliO+tGazNmWy+VYds9Fq0HjFlOzYh0u05CjBESZgbMLC7RoIWY/akNdre5b8OU14
         0sxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700223890; x=1700828690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i1dFNOxKIfpxe4fbqyq4aYiHJEk/IRyQX0YWJ3IS3kY=;
        b=ZHyUvv2ABvQqk//XtEvuU93YcZtOeao/bsISO/vNhiAG5031JPGlXbqoB1bbw+gdu3
         yVAHpVgXiDAEWx+/ZVnUOrUrDnu3IHDg6o+QBDWEKZ0MSkclV0DL6d9SdP9ihzosKE4M
         fGQ1H9uR7r7Crub7zAdYHHX8/jp4E12UuVW9pcUjyMHtqPuB8T8r8AhOSYlFs2vlsNFu
         nNYs3vqRkQvROeMeqDm9Iq6HnlCHSL0Xhp7+22BZIINp+lEZefv3QlJiaDjYVufz7brk
         9WqxEE7LU9hKZNqbPw+ZeP4P6sEc2iWvHZst0mpUVGSF32iBboPRlEx/Rm95dgI8yrSU
         G6BQ==
X-Gm-Message-State: AOJu0YwiaujMRHHQNr1GqtypWDV166tyKikC4AAPEWVQUgTvNyeXLwXs
	hyU9ZZZZL4jCj6iQUmfpCvKLnSH1EH8=
X-Google-Smtp-Source: AGHT+IH3+reAVmfVJJN0NjtOL7cn6V0nBW6vS3nAoCQBvotNB9uWzEmohcLUH0aW+uHS3u2OPyMS1w==
X-Received: by 2002:a05:6512:a96:b0:509:8e7f:b46c with SMTP id m22-20020a0565120a9600b005098e7fb46cmr4729902lfu.56.1700223889890;
        Fri, 17 Nov 2023 04:24:49 -0800 (PST)
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
Subject: [PATCH v3 05/14] xen/asm-generic: introduce stub header <asm/random.h>
Date: Fri, 17 Nov 2023 14:24:29 +0200
Message-ID: <9a2b8920df291915ac6be0d14e6e9896e81ea9bd.1700221559.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1700221559.git.oleksii.kurochko@gmail.com>
References: <cover.1700221559.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

<asm/random.h> is common for Arm, PPC and RISC-V thereby it
is moved to asm-generic.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 xen/include/asm-generic/random.h  | 20 ++++++++++++++++++++
 5 files changed, 22 insertions(+), 18 deletions(-)
 delete mode 100644 xen/arch/arm/include/asm/random.h
 delete mode 100644 xen/arch/ppc/include/asm/random.h
 create mode 100644 xen/include/asm-generic/random.h

diff --git a/xen/arch/arm/include/asm/Makefile b/xen/arch/arm/include/asm/Makefile
index 96e3aa6b6c..cac6d5e3df 100644
--- a/xen/arch/arm/include/asm/Makefile
+++ b/xen/arch/arm/include/asm/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
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
index 9f5a0dfb31..d8f2a1453c 100644
--- a/xen/arch/ppc/include/asm/Makefile
+++ b/xen/arch/ppc/include/asm/Makefile
@@ -2,4 +2,5 @@
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
index 0000000000..cd2307e70b
--- /dev/null
+++ b/xen/include/asm-generic/random.h
@@ -0,0 +1,20 @@
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
2.41.0


