Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E497FA21D
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 15:14:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642130.1001423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7cMy-0000qG-5m; Mon, 27 Nov 2023 14:13:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642130.1001423; Mon, 27 Nov 2023 14:13:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7cMx-0000h1-Pb; Mon, 27 Nov 2023 14:13:51 +0000
Received: by outflank-mailman (input) for mailman id 642130;
 Mon, 27 Nov 2023 14:13:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+WV=HI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r7cMv-0005XE-3w
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 14:13:49 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2efbd014-8d2f-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 15:13:48 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-50baa2a278bso2638234e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Nov 2023 06:13:48 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 x29-20020ac259dd000000b00507b869b068sm1494100lfn.302.2023.11.27.06.13.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 06:13:46 -0800 (PST)
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
X-Inumbo-ID: 2efbd014-8d2f-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701094428; x=1701699228; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+K9fYcSeRYeq73qmv3zekjZbm7cEpWWW1b3TdqlhfPg=;
        b=BqMvaPR0PLF41NXF89n9bb5OlRuBdPKIhEJZVsWgwooaeaii3yWcwWLHqRYji0nQ6m
         l1tc/cOrkFqPYc1ZycD3q6F43npcezsT/myPvl6FTcnKROlWFeseXHuuqtqgqjoWqiKm
         81FVIOB8DHl/KChRIiZshZ1q90Fz6ehEOJUzA9cbm1bS6CLK3mOKg9rhv4B6j0BnWqIP
         S0aAa3UJEu71w6V4JpRIEIZv0xXNcsM63ZNsR9kZY0+RXh+gR0CZOkNcM8XO8owSJRNK
         d/47TURUEikV4oQimOcjM265tpx89AUM+AhOsZi6YYpU0x+dbM/t0uYbFzcX3NFoJof7
         +J4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701094428; x=1701699228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+K9fYcSeRYeq73qmv3zekjZbm7cEpWWW1b3TdqlhfPg=;
        b=n0WVKEsZ/OWr1svRWQpQ6LgZZ02xfyoSJBkS33dF2G8f3efOrx969flD99rrRxBf+v
         Xc+fcF/VqYr597VUyDzU9xTWJ5nksVTn9rWvXKp0XSzJb6meY+8iGHCoOwzH6tpDxupW
         YKpGQ1LFrTqAfkdCozLvhIaGZZFddL/M3DCHSyuT3Ue1fCoq8S5+1GSfURt0n2Kl3L+N
         kLseLAGBmI/miFOx2K+ZNlWDNvBI0pN/LqqTcShpA18ggsZRP1c9Q3MlqVE7PY0FPLXx
         8pqBJxbDBSgE/7Dq+dtBchfEWVfNpqljE/2Vn1LJhodfCh77WrVxUfsn3D1MIdrTSKcd
         LirQ==
X-Gm-Message-State: AOJu0YyU3TOjBksFmpKB3L2hgWmT4Iv0DAeny4/TFQfJbsFOgi0rSOBY
	KrrPxGtfyhw5lR9ZB8bLQgvFwT+MD4KQcQ==
X-Google-Smtp-Source: AGHT+IGIcJqUMoKPodavVLftJXyzgym2+XXHilyK7pfv/1E5QyNQPki/WNSmULlxxUiUHUYFnU/9Vg==
X-Received: by 2002:a05:6512:11eb:b0:509:4bb5:ff96 with SMTP id p11-20020a05651211eb00b005094bb5ff96mr6195802lfs.59.1701094427177;
        Mon, 27 Nov 2023 06:13:47 -0800 (PST)
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
Subject: [PATCH v4 13/14] xen: ifdef inclusion of <asm/grant_table.h> in <xen/grant_table.h>
Date: Mon, 27 Nov 2023 16:13:26 +0200
Message-ID: <fdff8da7431ac6e8e44f08c3f95c897be23ec745.1701093907.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1701093907.git.oleksii.kurochko@gmail.com>
References: <cover.1701093907.git.oleksii.kurochko@gmail.com>
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
Changes in V4:
 - Nothing changed. Only rebase.
---
Changes in V3:
 - Remove unnecessary comment.
---
 xen/arch/arm/domain_build.c            | 1 +
 xen/arch/ppc/include/asm/grant_table.h | 5 -----
 xen/include/xen/grant_table.h          | 3 +++
 3 files changed, 4 insertions(+), 5 deletions(-)
 delete mode 100644 xen/arch/ppc/include/asm/grant_table.h

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index a26cbff68e..646862b10e 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -34,6 +34,7 @@
 
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


