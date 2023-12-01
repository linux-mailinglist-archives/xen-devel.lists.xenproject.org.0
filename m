Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D088014CC
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 21:48:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645743.1008059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9AR1-0000UA-M0; Fri, 01 Dec 2023 20:48:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645743.1008059; Fri, 01 Dec 2023 20:48:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9AR1-0000Qm-GW; Fri, 01 Dec 2023 20:48:27 +0000
Received: by outflank-mailman (input) for mailman id 645743;
 Fri, 01 Dec 2023 20:48:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yVFl=HM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r9AQz-0008SX-Dg
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 20:48:25 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f82634ef-908a-11ee-9b0f-b553b5be7939;
 Fri, 01 Dec 2023 21:48:23 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2c9d44b2919so19082571fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 01 Dec 2023 12:48:23 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 i18-20020a2ea372000000b002c6ed7e546esm511142ljn.124.2023.12.01.12.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Dec 2023 12:48:22 -0800 (PST)
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
X-Inumbo-ID: f82634ef-908a-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701463703; x=1702068503; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gkZXGmuGzsXLXktMQsuaQS4qtKJYPDwgQkxhzE80/l8=;
        b=mKFKbijvXUhyabQyNf+yjy0Wd/Xx8mkUj1vaeJUs52Y75Zn/GzkP6v1tBekGyXyNc3
         imxXfFqH9umTySaw1N1n91lNtatUSKEVW/nXTGUJ7QHXK4sJHUxFF9f7CfG7hxZJ0eE+
         UyGYLNKzfyVBZL3gw23kmd1gBWrCjcyiVfm2GClMbyITp8nV+k6R2wDy+szkH2RhYsM7
         1DVvVQvq1UXgM0AAcIULMgKVUrCLTLU8ayfZxURCUGcEiFEen7r7ctekjmQHoj8hbGzb
         ReS0aNnFElzrIo+thYlviCKjB6PpsBma4Lf1OnGt7lvBDUgU1NW+bI0ZOiQ/jy/AwR0Z
         2Bgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701463703; x=1702068503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gkZXGmuGzsXLXktMQsuaQS4qtKJYPDwgQkxhzE80/l8=;
        b=st9+9QmnKVtj54Q6SCTW4asX66wijxsYY2AtOTZoV49b+UvEBkjnA3qcLkN8ecL0ss
         ZGjAlPoVprzpz+fy6tVODErdnGn6J7+VKzbIi58hOk/HBACswXAoMISHfnjjVsoHw3ky
         2W9Ri1zzHKmPZdu1/771MqZL8K36Tq0t47E2CUbxvQ44yvLimhOuplOK6ZHh5UV61jsJ
         xA8zIswIKZhm9N+yAjLCZ1uj4KrbkXjDevQv5goo/olhz+9C7fsaXGm6gqM3Mmpn9abb
         rL/nfBbK0d4VsD0RX8qM1GLABEET3Dcu8/waKO6CzNb2lgsY3NPbeha5iYiKdk0FKK1q
         S8MA==
X-Gm-Message-State: AOJu0YwDkBG604tfrK7vKJxcLWRZuWYBmHO0ustQKHfiscuQpmGOVqNf
	tIIINbPHAOjemtnOMM/QnLgJZWnjrWIAOw==
X-Google-Smtp-Source: AGHT+IHSzvXp41ecTtLxNJopxQEGJM7JxaTiAcad3Y/MtaYOacGIrtstdEpEJMEV1PeJi5oVxmEdNg==
X-Received: by 2002:a05:651c:2124:b0:2c9:cd5c:16a8 with SMTP id a36-20020a05651c212400b002c9cd5c16a8mr1450876ljq.24.1701463703143;
        Fri, 01 Dec 2023 12:48:23 -0800 (PST)
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
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v5 6/7] xen/asm-generic: ifdef inclusion of <asm/mem_access.h>
Date: Fri,  1 Dec 2023 22:48:09 +0200
Message-ID: <d42a34866edc70a12736b5c6976aa1b44b4ebd8a.1701453087.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1701453087.git.oleksii.kurochko@gmail.com>
References: <cover.1701453087.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ifdefing inclusion of <asm/mem_access.h> in <xen/mem_access.h>
allows to avoid generation of empty <asm/mem_access.h> header
for the case when !CONFIG_MEM_ACCESS.

For Arm it was explicitly added inclusion of <asm/mem_access.h> for p2m.c
and traps.c because they require some functions from <asm/mem_access.h> which
aren't available in case of !CONFIG_MEM_ACCESS.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V5:
 - Added dependencies for "Config MEM_ACCESS" to be sure that randconfig will not
   turn on the config.
---
Changes in V4:
 - Nothing changed. Only rebase.
---
Changes in V3:
 - Remove unnecessary comment.
---
 xen/arch/arm/p2m.c                    | 1 +
 xen/arch/arm/traps.c                  | 1 +
 xen/arch/ppc/include/asm/mem_access.h | 5 -----
 xen/common/Kconfig                    | 2 +-
 xen/include/xen/mem_access.h          | 2 ++
 5 files changed, 5 insertions(+), 6 deletions(-)
 delete mode 100644 xen/arch/ppc/include/asm/mem_access.h

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index b991b76ce4..2465c266e9 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -7,6 +7,7 @@
 #include <asm/event.h>
 #include <asm/flushtlb.h>
 #include <asm/guest_walk.h>
+#include <asm/mem_access.h>
 #include <asm/page.h>
 #include <asm/traps.h>
 
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 3784e8276e..37a457f4b1 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -35,6 +35,7 @@
 #include <asm/cpufeature.h>
 #include <asm/event.h>
 #include <asm/hsr.h>
+#include <asm/mem_access.h>
 #include <asm/mmio.h>
 #include <asm/regs.h>
 #include <asm/smccc.h>
diff --git a/xen/arch/ppc/include/asm/mem_access.h b/xen/arch/ppc/include/asm/mem_access.h
deleted file mode 100644
index e7986dfdbd..0000000000
--- a/xen/arch/ppc/include/asm/mem_access.h
+++ /dev/null
@@ -1,5 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_PPC_MEM_ACCESS_H__
-#define __ASM_PPC_MEM_ACCESS_H__
-
-#endif /* __ASM_PPC_MEM_ACCESS_H__ */
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 13e26ca06f..d84e395a0b 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -87,7 +87,7 @@ config MEM_ACCESS_ALWAYS_ON
 config MEM_ACCESS
 	def_bool MEM_ACCESS_ALWAYS_ON
 	prompt "Memory Access and VM events" if !MEM_ACCESS_ALWAYS_ON
-	depends on HVM
+	depends on HVM && (ARM || X86)
 	---help---
 
 	  Framework to configure memory access types for guests and receive
diff --git a/xen/include/xen/mem_access.h b/xen/include/xen/mem_access.h
index 4e4811680d..87d93b31f6 100644
--- a/xen/include/xen/mem_access.h
+++ b/xen/include/xen/mem_access.h
@@ -33,7 +33,9 @@
  */
 struct vm_event_st;
 
+#ifdef CONFIG_MEM_ACCESS
 #include <asm/mem_access.h>
+#endif
 
 /*
  * Additional access types, which are used to further restrict
-- 
2.43.0


