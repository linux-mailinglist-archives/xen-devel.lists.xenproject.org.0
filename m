Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DBF7FA220
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 15:14:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642129.1001412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7cMw-0000OQ-BT; Mon, 27 Nov 2023 14:13:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642129.1001412; Mon, 27 Nov 2023 14:13:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7cMw-0000GB-3X; Mon, 27 Nov 2023 14:13:50 +0000
Received: by outflank-mailman (input) for mailman id 642129;
 Mon, 27 Nov 2023 14:13:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+WV=HI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r7cMt-0005XE-Q6
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 14:13:47 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2dfd07be-8d2f-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 15:13:47 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-50baa3e5c00so2618142e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 Nov 2023 06:13:47 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 x29-20020ac259dd000000b00507b869b068sm1494100lfn.302.2023.11.27.06.13.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 06:13:45 -0800 (PST)
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
X-Inumbo-ID: 2dfd07be-8d2f-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701094426; x=1701699226; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9kdAs1MJcXuPPHejdAkexStxGmrKeo9/ZkYuTVmb0VU=;
        b=gaR6X+8FRkkQpkK8YaCsEnW0h4u+XRUcTx9NSSAhe1N5/hZ6fuxHOn3b39ykRpLmrz
         TYoYqjaqiDhP2h29lijNnFL6gPpyl8DdHO20aU4J+eSm58wTDoQ6B/6XGBKma2TqmCeS
         6tz+Tu6Mkr+IfUXrXCa/tU7w6iOYO9iQHxdEKkME88QkxuuYaJfZV0gMATcLZSRV4AFd
         E4Du3txlTXTuS2ANR+Difu9lwn6CFpQSkNaICvTSEVUK4QJzwINvHvNelcmml8ZPu7Nx
         Rx6ymppq4F6a7MUnI1y/Gkyq28IYvfZYpHelHA0KoSzhBr/Vgy4dCA6mV2h+e7EPMV+3
         I+WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701094426; x=1701699226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9kdAs1MJcXuPPHejdAkexStxGmrKeo9/ZkYuTVmb0VU=;
        b=NHkO8sBWwHOibSc09KkK96Arhvy8uuKcaiIApuZ2njHgFfkNUjrLe98HPTzHGmIoS1
         7RtJuxgZawMith58zpTK3vEOX30IwzIR1CIgGJ+A32oPQZ2EIpC4FGo1VXgaK8F46Q1G
         gj/nYsF2eYAG4RTSNUaz0IF9/xW0RvfaQYaFxBv7VddSuGXJISo1d76yaKVy/WMr/07L
         37oyRWn19N/AyqKI5wKTmHtciKM5YFQWyPMRGFRxjOB6vTWLSfeQ2mM0NVZsEb6WqKcW
         tvbczZpBL8M8hmM5W7m97ujVRns7ESCdpOoCpiLJGbdeyJz/DS/MzGAGoQUYj6ZfxGJk
         Iopw==
X-Gm-Message-State: AOJu0Yycrc3LBYbIHWJBo+TCHGYVoWxKYGMVop2C0Qfo26O3abfxbHlQ
	gGjcG1vb//QisjgIPMtSeZ1MN7BIOyKtxw==
X-Google-Smtp-Source: AGHT+IF7XO+57hao/i105qRWNU98qqjNFbo7I+jgj+SEKPMIAIYlDITfNqO2ety+PmZfzc29dBzzUg==
X-Received: by 2002:a05:6512:1588:b0:50a:af72:538 with SMTP id bp8-20020a056512158800b0050aaf720538mr5095709lfb.55.1701094426379;
        Mon, 27 Nov 2023 06:13:46 -0800 (PST)
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
Subject: [PATCH v4 12/14] xen/asm-generic: introduce stub header softirq.h
Date: Mon, 27 Nov 2023 16:13:25 +0200
Message-ID: <090991be61252cabefc06da19597e3a86a4cd1da.1701093907.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1701093907.git.oleksii.kurochko@gmail.com>
References: <cover.1701093907.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

<asm/softirq.h> is common between Arm, PPC and RISC-V so it is
moved to asm-generic.

Drop Arm and PPC's softirq.h and use asm-generic version instead.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Added Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V4:
 - Added Reviewed-by: Michal Orzel <michal.orzel@amd.com>
 - Added Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V3:
 - Drop Arm and PPC's softirq.h
 - Update the commit message.
---
Changes in V2:
    - update the commit message.
---
 xen/arch/arm/include/asm/Makefile                         | 1 +
 xen/arch/ppc/include/asm/Makefile                         | 1 +
 xen/arch/ppc/include/asm/softirq.h                        | 8 --------
 .../arm/include/asm => include/asm-generic}/softirq.h     | 7 ++++---
 4 files changed, 6 insertions(+), 11 deletions(-)
 delete mode 100644 xen/arch/ppc/include/asm/softirq.h
 rename xen/{arch/arm/include/asm => include/asm-generic}/softirq.h (56%)

diff --git a/xen/arch/arm/include/asm/Makefile b/xen/arch/arm/include/asm/Makefile
index b8e0763c77..c3f4291ee2 100644
--- a/xen/arch/arm/include/asm/Makefile
+++ b/xen/arch/arm/include/asm/Makefile
@@ -7,4 +7,5 @@ generic-y += numa.h
 generic-y += paging.h
 generic-y += percpu.h
 generic-y += random.h
+generic-y += softirq.h
 generic-y += vm_event.h
diff --git a/xen/arch/ppc/include/asm/Makefile b/xen/arch/ppc/include/asm/Makefile
index a4188dce1d..4da0c70cc0 100644
--- a/xen/arch/ppc/include/asm/Makefile
+++ b/xen/arch/ppc/include/asm/Makefile
@@ -10,4 +10,5 @@ generic-y += numa.h
 generic-y += paging.h
 generic-y += percpu.h
 generic-y += random.h
+generic-y += softirq.h
 generic-y += vm_event.h
diff --git a/xen/arch/ppc/include/asm/softirq.h b/xen/arch/ppc/include/asm/softirq.h
deleted file mode 100644
index a0b28a5e51..0000000000
--- a/xen/arch/ppc/include/asm/softirq.h
+++ /dev/null
@@ -1,8 +0,0 @@
-#ifndef __ASM_PPC_SOFTIRQ_H__
-#define __ASM_PPC_SOFTIRQ_H__
-
-#define NR_ARCH_SOFTIRQS 0
-
-#define arch_skip_send_event_check(cpu) 0
-
-#endif /* __ASM_PPC_SOFTIRQ_H__ */
diff --git a/xen/arch/arm/include/asm/softirq.h b/xen/include/asm-generic/softirq.h
similarity index 56%
rename from xen/arch/arm/include/asm/softirq.h
rename to xen/include/asm-generic/softirq.h
index 976e0ebd70..83be855e50 100644
--- a/xen/arch/arm/include/asm/softirq.h
+++ b/xen/include/asm-generic/softirq.h
@@ -1,11 +1,12 @@
-#ifndef __ASM_SOFTIRQ_H__
-#define __ASM_SOFTIRQ_H__
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_SOFTIRQ_H__
+#define __ASM_GENERIC_SOFTIRQ_H__
 
 #define NR_ARCH_SOFTIRQS       0
 
 #define arch_skip_send_event_check(cpu) 0
 
-#endif /* __ASM_SOFTIRQ_H__ */
+#endif /* __ASM_GENERIC_SOFTIRQ_H__ */
 /*
  * Local variables:
  * mode: C
-- 
2.43.0


