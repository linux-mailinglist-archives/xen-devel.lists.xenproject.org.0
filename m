Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F228014CB
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 21:48:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645741.1008040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9AQy-0008LB-2o; Fri, 01 Dec 2023 20:48:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645741.1008040; Fri, 01 Dec 2023 20:48:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9AQx-0008Hg-UU; Fri, 01 Dec 2023 20:48:23 +0000
Received: by outflank-mailman (input) for mailman id 645741;
 Fri, 01 Dec 2023 20:48:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yVFl=HM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r9AQx-0007Cg-0t
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 20:48:23 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7453d72-908a-11ee-98e5-6d05b1d4d9a1;
 Fri, 01 Dec 2023 21:48:22 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-50aab20e828so3568801e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 01 Dec 2023 12:48:22 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 i18-20020a2ea372000000b002c6ed7e546esm511142ljn.124.2023.12.01.12.48.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Dec 2023 12:48:21 -0800 (PST)
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
X-Inumbo-ID: f7453d72-908a-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701463702; x=1702068502; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=98dqye18fLwa72WEQaaSfMetNkq8ERwjcy/m8vcBQK8=;
        b=DO5OIK27pOj1REHF6laIFaDmM/ujXi67SmLwc5OuV+MTgGR6OHTuiIxSe1I6KQ97v5
         YOqOSbZpe/JAwurvB8GGKGeK7SJAn/4sWfLl72GymRh0TTO0XqI1kgol0u+MU2Q3Dy1O
         aNbOTXfRqo8UwXVwdTFBRe3QyfTUv7aNGVruode9I6dXDua4mmcn1kCrupJXAAFf9Y30
         NQ1oBqYICtuSnFgQPi4tvycee3C3jCdSWc6VewMJxwOGsdbk8UEZ82vB2JP/clNxiF0H
         hzeqSVumVQByDW7XMkdwpwvSM6TrnikuTr41FViObdVXsokR8ksoOqLAEHCTVPc0BlCp
         313w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701463702; x=1702068502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=98dqye18fLwa72WEQaaSfMetNkq8ERwjcy/m8vcBQK8=;
        b=IyNJs3k6ZR8Cef/kFK8Aq/vkEIMNxD8Q1RInv0GwiTRfW10IUBLM4wg6XfGOJXKRAy
         KAx/rpbA9xkIUrd2uwYk4QSZXJ+xOQ6w2Ibny1bR717o52EcmLq24zJ1yf3JwlU7psSc
         f8Nn3bMQ83tEjcsDWPLZLPVq4MiNtTozoxhbyZm5DT5tInDqX1qOneY7FhPR4wA9npSA
         QziHlkZ54Noh36vRscEdGBxSiOFyerq+4UHnLb4jf63c5D4LwKVTms2aWb8Ps0WC2JO8
         c2RCKkjWLal2ygUNYkZxCC/k7Wg4LvQX7wR2/8UxiAoqLmnjsydRFd5eavJy33YXh7As
         +H6w==
X-Gm-Message-State: AOJu0Yxke6RDXBC795/kHiHCQRRYuRmIlAl6/ASSxRw+G2+osTviilNV
	NKKyP7jodsBO4hr6ma4BbNOkdDV+6hriGQ==
X-Google-Smtp-Source: AGHT+IEKoeZjYR6H3G2x7WPpojiIkwmASYCXEv2VAgpB6L1AmXxvi4ZmlpfB0myoSwll+u63sIyAHQ==
X-Received: by 2002:a2e:9919:0:b0:2c9:d874:20ce with SMTP id v25-20020a2e9919000000b002c9d87420cemr1409509lji.88.1701463701770;
        Fri, 01 Dec 2023 12:48:21 -0800 (PST)
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
Subject: [PATCH v5 5/7] xen: ifdef inclusion of <asm/grant_table.h> in <xen/grant_table.h>
Date: Fri,  1 Dec 2023 22:48:08 +0200
Message-ID: <cdc20255540a66ba0b6946ac6d48c11029cd3385.1701453087.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1701453087.git.oleksii.kurochko@gmail.com>
References: <cover.1701453087.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ifdef-ing inclusion of <asm/grant_table.h> allows to avoid
generation of empty <asm/grant_table.h> for cases when
CONFIG_GRANT_TABLE is not enabled.

The following changes were done for Arm:
<asm/grant_table.h> should be included directly because it contains
gnttab_dom0_frames() macros which is unique for Arm and is used in
arch/arm/domain_build.c.
<asm/grant_table.h> is #ifdef-ed with CONFIG_GRANT_TABLE in
<xen/grant_table.h> so in case of !CONFIG_GRANT_TABLE gnttab_dom0_frames
won't be available for use in arch/arm/domain_build.c.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V5:
 - Added dependencies for "Config GRANT_TABLE" to be sure that randconfig will not
   turn on the config.
---
Changes in V4:
 - Nothing changed. Only rebase.
---
Changes in V3:
 - Remove unnecessary comment.
---
 xen/arch/arm/domain_build.c            | 1 +
 xen/arch/ppc/include/asm/grant_table.h | 5 -----
 xen/common/Kconfig                     | 1 +
 xen/include/xen/grant_table.h          | 3 +++
 4 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 xen/arch/ppc/include/asm/grant_table.h

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index df66fb88d8..28df515a3d 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -36,6 +36,7 @@
 
 #include <xen/irq.h>
 #include <xen/grant_table.h>
+#include <asm/grant_table.h>
 #include <xen/serial.h>
 
 #define STATIC_EVTCHN_NODE_SIZE_CELLS 2
diff --git a/xen/arch/ppc/include/asm/grant_table.h b/xen/arch/ppc/include/asm/grant_table.h
deleted file mode 100644
index d0ff58dd3d..0000000000
--- a/xen/arch/ppc/include/asm/grant_table.h
+++ /dev/null
@@ -1,5 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_PPC_GRANT_TABLE_H__
-#define __ASM_PPC_GRANT_TABLE_H__
-
-#endif /* __ASM_PPC_GRANT_TABLE_H__ */
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 310ad4229c..13e26ca06f 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -15,6 +15,7 @@ config CORE_PARKING
 config GRANT_TABLE
 	bool "Grant table support" if EXPERT
 	default y
+	depends on ARM || X86
 	---help---
 	  Grant table provides a generic mechanism to memory sharing
 	  between domains. This shared memory interface underpins the
diff --git a/xen/include/xen/grant_table.h b/xen/include/xen/grant_table.h
index 85fe6b7b5e..50edfecfb6 100644
--- a/xen/include/xen/grant_table.h
+++ b/xen/include/xen/grant_table.h
@@ -26,7 +26,10 @@
 #include <xen/mm-frame.h>
 #include <xen/rwlock.h>
 #include <public/grant_table.h>
+
+#ifdef CONFIG_GRANT_TABLE
 #include <asm/grant_table.h>
+#endif
 
 struct grant_table;
 
-- 
2.43.0


