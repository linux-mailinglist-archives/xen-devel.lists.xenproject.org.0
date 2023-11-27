Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DAD7FA222
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 15:14:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642131.1001429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7cMy-000113-RE; Mon, 27 Nov 2023 14:13:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642131.1001429; Mon, 27 Nov 2023 14:13:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7cMy-0000p5-Fo; Mon, 27 Nov 2023 14:13:52 +0000
Received: by outflank-mailman (input) for mailman id 642131;
 Mon, 27 Nov 2023 14:13:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+WV=HI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r7cMw-0005XE-7e
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 14:13:50 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2fa4ea2b-8d2f-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 15:13:49 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5094cb3a036so5768083e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 Nov 2023 06:13:49 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 x29-20020ac259dd000000b00507b869b068sm1494100lfn.302.2023.11.27.06.13.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 06:13:48 -0800 (PST)
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
X-Inumbo-ID: 2fa4ea2b-8d2f-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701094429; x=1701699229; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r0iOf2hTMhBZexTObReAkFaeeSyAcKp7YhGZC/f1qqo=;
        b=IKxGI901CiRxhXPOjVdmC3QmHJE+UzR0w8eEEmcV+3RQ7597Ag8S1yaC4EnN3xOpez
         P1DPTjhIRrZtxMvRryNcxx3uuxLHTfO0w69AeUoAz6gD3YRp1r5Bp0CkLp8JFpnxf+fO
         CisahWQ9u/lm1N8zu7jhU1ScGXx79pfDhe2GLbJTxF8w/6/S3OQPqTIquaxNUZQZ9p6S
         aiHX89z9kJgLV2LqWzUpJO5HJcCPLTtbrPfEOfXpG6NBQm4YZLaQI5XAqJQaKrpBiHxr
         BvbpKgj0ESMIKT8KMvoBp5vIQVWUCQL9EzVD8KLxqqJfZ+NDgI0w+LtryZJtaTw/u8Lf
         BWaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701094429; x=1701699229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r0iOf2hTMhBZexTObReAkFaeeSyAcKp7YhGZC/f1qqo=;
        b=MaOkf4Ya1XvW2Gu/ZUWH0Rz72X4+X+M70bX2KU8AQMTR5IRwnyROVZAVkbaATIY9CY
         Dmjxer6sJ2Napfpr2FFBZXi9e8N6/K83f8ZI4Wc3iRKaAR4cM1LKfBIpw2V7KkgGubRr
         6j7rnM8U9PFSPuPe8gLq2wILuGmvFG9o82ofDEQgR7qjfl9VwpqaxTJ7kSM0VRL3qZ0n
         6MvMBwDPDsyEVVx0rZWmM6e7AXO3HzL97Xglug8FbcbKIcfSjPMrdDKY7U7mHtiYLMm9
         VkXmRSjz+Y1xsd1/36kv0MU1eUGuewoKkt/Wh/cTn0ymfMuSh1xQwO/qKSdv+VH8lBGx
         kDIQ==
X-Gm-Message-State: AOJu0YziFF89onLU7dfaLeomqYYgXbr6yaT1tkub7GDWF0VaSicEIl0B
	qDaAKSbjhUfv+0KoYkUGf+joLWH6s9KNwQ==
X-Google-Smtp-Source: AGHT+IEn+2Umx1QwZQfZosBAm8En1WuFDBDCAyHpi2S4U21cq4UkU/GGWMJwz0BiPihG4x1eHoNoXw==
X-Received: by 2002:a05:6512:3694:b0:50a:7640:6a83 with SMTP id d20-20020a056512369400b0050a76406a83mr6658554lfs.32.1701094429022;
        Mon, 27 Nov 2023 06:13:49 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4 14/14] xen/asm-generic: ifdef inclusion of <asm/mem_access.h>
Date: Mon, 27 Nov 2023 16:13:27 +0200
Message-ID: <c89f80900a0e2dc6188cea79b60a68604938f7c9.1701093907.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1701093907.git.oleksii.kurochko@gmail.com>
References: <cover.1701093907.git.oleksii.kurochko@gmail.com>
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
Changes in V4:
 - Nothing changed. Only rebase.
---
Changes in V3:
 - Remove unnecessary comment.
---
 xen/arch/arm/p2m.c                    | 1 +
 xen/arch/arm/traps.c                  | 1 +
 xen/arch/ppc/include/asm/mem_access.h | 5 -----
 xen/include/xen/mem_access.h          | 2 ++
 4 files changed, 4 insertions(+), 5 deletions(-)
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
index 8492e2b7bb..0ad056b89b 100644
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


