Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A025A7EF299
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 13:25:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635121.990965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3xuB-0003bN-03; Fri, 17 Nov 2023 12:25:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635121.990965; Fri, 17 Nov 2023 12:25:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3xuA-0003UA-Fd; Fri, 17 Nov 2023 12:25:02 +0000
Received: by outflank-mailman (input) for mailman id 635121;
 Fri, 17 Nov 2023 12:25:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c3wv=G6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r3xu8-0000ZQ-5o
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 12:25:00 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5348235b-8544-11ee-98dc-6d05b1d4d9a1;
 Fri, 17 Nov 2023 13:24:59 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-507f1c29f25so2659776e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 17 Nov 2023 04:24:59 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a18-20020ac25e72000000b005094d95e8bcsm209811lfr.218.2023.11.17.04.24.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 04:24:58 -0800 (PST)
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
X-Inumbo-ID: 5348235b-8544-11ee-98dc-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700223898; x=1700828698; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YsnMnx3qJnhyBXB1udD6ESspWS/fknMucSDv+GOY/fs=;
        b=AkljVgjeVkb3b+Q3GFDXhYLRyf8R9zQic3L9DcVBhZiicJyhwtyaIb86Uf2qvAIuOi
         4NMTgpY0ZglofOQIgsX0IhqAke7EQib+0Qubee+mvLQy/XYoOd2fkMX5tEPmuV45R8pi
         JceBtFWGSCX2NIN7mhlCQTCc0PlsvuAhI3YtyPChgHMIKH9y8iPWhX8xfPrlmSjzB63x
         7NXlQPnQkNTE9LlyuFcUiyfor2k5Am1KvmAVSRnxG/3UF5PBaIgwXax6SwNSUUeEZLzz
         AhzRTHjgLO6BxI1yMhvyLkPKfV0Aj6NrM8AOPydD7+RodizA+7OWQtIrbxjCGuvftf/j
         wd5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700223898; x=1700828698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YsnMnx3qJnhyBXB1udD6ESspWS/fknMucSDv+GOY/fs=;
        b=Q/eldrAhPY+7UNxlX08kv0gkEwlgmaU7i15Gd76x5JKpgdvANW7h//QJpteja75wvk
         HCllShncAYi8EMpcPTmGni89Xl0Yyz+LduHc6n/qXTTUj9gPm8Ctp0Kx8g2PZCDiZ1Vu
         j3hkeFIpFEiJi/EzvYZtmqMKs4DKLi9y8pCcspoyA0BwoYs++Rf9k7CJ5XnU849Lc42E
         QJq3bDgSMdlCwnxZXTPW511Q+bruOaRkC+NqeEGi0pazULVy9ctv9CclaNgWX+gkSVHi
         U30Q0ebslE4Oul2/MEZ52SfVy5DHodDa2cB/aQGO93Dfd2iIOsL60RRdY9tqX5On5IF6
         Hk9Q==
X-Gm-Message-State: AOJu0Yy6rDb2Cu1xVhOjBA3FP3LO5uEQJqJ5JVQD0FLKrJf3y5GfZZdq
	2CAiG91OHyztUc/32pjsWz6prBz8ylI=
X-Google-Smtp-Source: AGHT+IEwrI59ykOOh0OZRtckIxEPSenLZxQMITCBvRfEyqfF1KwNUKBBo1VkLPcpX+iCMbo0xi1mKg==
X-Received: by 2002:a05:6512:94e:b0:509:1227:ca71 with SMTP id u14-20020a056512094e00b005091227ca71mr11881967lft.17.1700223898553;
        Fri, 17 Nov 2023 04:24:58 -0800 (PST)
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
Subject: [PATCH v3 11/14] xen/asm-generic: introduce stub header numa.h
Date: Fri, 17 Nov 2023 14:24:35 +0200
Message-ID: <7ae3b2dbdb8e711b2462af511e1f64c2700113d7.1700221559.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1700221559.git.oleksii.kurochko@gmail.com>
References: <cover.1700221559.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

<asm/numa.h> is common through some archs so it is moved
to asm-generic.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
 - Remove old header inclusion in asm-generic numa.h and include
   <xen/mm-frame.h> and <xen/stdint.h>
 - Drop Arm and PPC's numa.h and use asm-generic version instead.
---
Changes in V2:
	- update the commit message.
	- change u8 to uint8_t.
	- add ifnded CONFIG_NUMA.
---
 xen/arch/arm/include/asm/Makefile             |  1 +
 xen/arch/ppc/include/asm/Makefile             |  1 +
 xen/arch/ppc/include/asm/numa.h               | 26 -------------------
 .../asm => include/asm-generic}/numa.h        | 13 ++++++----
 4 files changed, 10 insertions(+), 31 deletions(-)
 delete mode 100644 xen/arch/ppc/include/asm/numa.h
 rename xen/{arch/arm/include/asm => include/asm-generic}/numa.h (75%)

diff --git a/xen/arch/arm/include/asm/Makefile b/xen/arch/arm/include/asm/Makefile
index 8221429c2c..0c855a798a 100644
--- a/xen/arch/arm/include/asm/Makefile
+++ b/xen/arch/arm/include/asm/Makefile
@@ -2,6 +2,7 @@
 generic-y += altp2m.h
 generic-y += hardirq.h
 generic-y += iocap.h
+generic-y += numa.h
 generic-y += paging.h
 generic-y += percpu.h
 generic-y += random.h
diff --git a/xen/arch/ppc/include/asm/Makefile b/xen/arch/ppc/include/asm/Makefile
index 9bbae4cec8..d5a94bc718 100644
--- a/xen/arch/ppc/include/asm/Makefile
+++ b/xen/arch/ppc/include/asm/Makefile
@@ -5,6 +5,7 @@ generic-y += hardirq.h
 generic-y += hypercall.h
 generic-y += iocap.h
 generic-y += monitor.h
+generic-y += numa.h
 generic-y += paging.h
 generic-y += percpu.h
 generic-y += random.h
diff --git a/xen/arch/ppc/include/asm/numa.h b/xen/arch/ppc/include/asm/numa.h
deleted file mode 100644
index 7fdf66c3da..0000000000
--- a/xen/arch/ppc/include/asm/numa.h
+++ /dev/null
@@ -1,26 +0,0 @@
-#ifndef __ASM_PPC_NUMA_H__
-#define __ASM_PPC_NUMA_H__
-
-#include <xen/types.h>
-#include <xen/mm.h>
-
-typedef uint8_t nodeid_t;
-
-/* Fake one node for now. See also node_online_map. */
-#define cpu_to_node(cpu) 0
-#define node_to_cpumask(node)   (cpu_online_map)
-
-/*
- * TODO: make first_valid_mfn static when NUMA is supported on PPC, this
- * is required because the dummy helpers are using it.
- */
-extern mfn_t first_valid_mfn;
-
-/* XXX: implement NUMA support */
-#define node_spanned_pages(nid) (max_page - mfn_x(first_valid_mfn))
-#define node_start_pfn(nid) (mfn_x(first_valid_mfn))
-#define __node_distance(a, b) (20)
-
-#define arch_want_default_dmazone() (false)
-
-#endif /* __ASM_PPC_NUMA_H__ */
diff --git a/xen/arch/arm/include/asm/numa.h b/xen/include/asm-generic/numa.h
similarity index 75%
rename from xen/arch/arm/include/asm/numa.h
rename to xen/include/asm-generic/numa.h
index e2bee2bd82..c5b522dee8 100644
--- a/xen/arch/arm/include/asm/numa.h
+++ b/xen/include/asm-generic/numa.h
@@ -1,9 +1,11 @@
-#ifndef __ARCH_ARM_NUMA_H
-#define __ARCH_ARM_NUMA_H
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ARCH_GENERIC_NUMA_H
+#define __ARCH_GENERIC_NUMA_H
 
-#include <xen/mm.h>
+#include <xen/mm-frame.h>
+#include <xen/stdint.h>
 
-typedef u8 nodeid_t;
+typedef uint8_t nodeid_t;
 
 #ifndef CONFIG_NUMA
 
@@ -26,7 +28,8 @@ extern mfn_t first_valid_mfn;
 
 #define arch_want_default_dmazone() (false)
 
-#endif /* __ARCH_ARM_NUMA_H */
+#endif /* __ARCH_GENERIC_NUMA_H */
+
 /*
  * Local variables:
  * mode: C
-- 
2.41.0


