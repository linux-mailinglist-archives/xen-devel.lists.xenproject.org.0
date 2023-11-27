Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B3B7FA221
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 15:14:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642128.1001405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7cMv-0000FR-R5; Mon, 27 Nov 2023 14:13:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642128.1001405; Mon, 27 Nov 2023 14:13:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7cMv-0000Au-GZ; Mon, 27 Nov 2023 14:13:49 +0000
Received: by outflank-mailman (input) for mailman id 642128;
 Mon, 27 Nov 2023 14:13:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+WV=HI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r7cMs-0005XE-Q4
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 14:13:46 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d7bb9e7-8d2f-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 15:13:46 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-50baa1ca01cso2655965e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 Nov 2023 06:13:46 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 x29-20020ac259dd000000b00507b869b068sm1494100lfn.302.2023.11.27.06.13.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 06:13:43 -0800 (PST)
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
X-Inumbo-ID: 2d7bb9e7-8d2f-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701094425; x=1701699225; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4bUm713lDLCEJ2dvdCey6eXivZPe2wBORV5zk7ydBpk=;
        b=JlyGcqPo+DwBzWs5Af2IgHUrjUzecFJlprbhtOxyQTsmGBsCRCYQ78VLby6L9PWX8A
         453e3XGVvWFC9zRn2l01w/NQmrvKDiny5wHpRtKQRTsD2lcB/Lr0Ead1IKHHgN7c1vFY
         ebIzVhQraI5ZZdw49qV838ANQeGSWwtaU6aB95DkGVk3D6yVP6Bj7tzrKLjANMhdDFI1
         7gVG853OOGdwEO6o7nIadaWZWCuv28/ZUwrBKebJxfjZufBosS/mm7MSKhEAR3MURsDd
         bI3yKEsZ8EGfQEog49/aBXe0M9XttH6a4VLb5IzrO4Z7EpPB6F/Owa9rscXOX65Iz+Kd
         WPrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701094425; x=1701699225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4bUm713lDLCEJ2dvdCey6eXivZPe2wBORV5zk7ydBpk=;
        b=pNf/8zNDbVq0nxbN74/B3coRRUQURUYJgtYPHEx5fQNmJtrXiLHiluBu53J7QOpbXy
         tAhvArHKNNKHqkTY6udgGdn7dKQDVnA+G8lAgJ5Wq/j+FjDCrt57U7EYGql2KrsJIrHh
         70ww/1xzyNgweBlpxUrzsUXaVV5duPILkIqvf6snqZt30PXrohEli6RiLy1Lp6TS28NU
         jyLoACIkr+uSZjMc3O80a7oUOEafe42If+Gqbm65ttXXkAIGl/m1IVR/HPeI/H2/u0V+
         ZD+O24OT8wQ03xc+9sfAnuLlcPrdQzjEBRVqGX7M9q+4b6Opp3FAog+xbixHs0g7laFH
         amCw==
X-Gm-Message-State: AOJu0Yx9dC0zuH1dB58dcVrHB9+NG3HX31rU7c0MQB8ZNXUUJLnL7yp0
	wW38uh8TqAi82A2TxffXO4I3CtJs3FKt/Q==
X-Google-Smtp-Source: AGHT+IEutomLAHesztCjy6aoYueTcP3YR8O+2sj2jEHca65VzhdmRPVVuTEfc3Fu8l4ECyaqLw3AZA==
X-Received: by 2002:ac2:44b2:0:b0:50b:aee4:ab12 with SMTP id c18-20020ac244b2000000b0050baee4ab12mr2615799lfm.53.1701094425004;
        Mon, 27 Nov 2023 06:13:45 -0800 (PST)
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
Subject: [PATCH v4 11/14] xen/asm-generic: introduce stub header numa.h
Date: Mon, 27 Nov 2023 16:13:24 +0200
Message-ID: <44bb374738ad0cae041a0164812dfd33d091d954.1701093907.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1701093907.git.oleksii.kurochko@gmail.com>
References: <cover.1701093907.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

<asm/numa.h> is common through some archs so it is moved
to asm-generic.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in V4:
 - Updated guards name: *ARCH_GENERIC* -> *ASM_GENERIC*.
 - Moved inclusion of xen/mm-frame.h under "#ifndef CONFIG_NUMA".
 - Added Reviewed-by: Michal Orzel <michal.orzel@amd.com>.
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
 .../asm => include/asm-generic}/numa.h        | 14 ++++++----
 4 files changed, 11 insertions(+), 31 deletions(-)
 delete mode 100644 xen/arch/ppc/include/asm/numa.h
 rename xen/{arch/arm/include/asm => include/asm-generic}/numa.h (76%)

diff --git a/xen/arch/arm/include/asm/Makefile b/xen/arch/arm/include/asm/Makefile
index 55d153ed82..b8e0763c77 100644
--- a/xen/arch/arm/include/asm/Makefile
+++ b/xen/arch/arm/include/asm/Makefile
@@ -3,6 +3,7 @@ generic-y += altp2m.h
 generic-y += device.h
 generic-y += hardirq.h
 generic-y += iocap.h
+generic-y += numa.h
 generic-y += paging.h
 generic-y += percpu.h
 generic-y += random.h
diff --git a/xen/arch/ppc/include/asm/Makefile b/xen/arch/ppc/include/asm/Makefile
index bcddcc181a..a4188dce1d 100644
--- a/xen/arch/ppc/include/asm/Makefile
+++ b/xen/arch/ppc/include/asm/Makefile
@@ -6,6 +6,7 @@ generic-y += hardirq.h
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
similarity index 76%
rename from xen/arch/arm/include/asm/numa.h
rename to xen/include/asm-generic/numa.h
index e2bee2bd82..b00fca4978 100644
--- a/xen/arch/arm/include/asm/numa.h
+++ b/xen/include/asm-generic/numa.h
@@ -1,12 +1,15 @@
-#ifndef __ARCH_ARM_NUMA_H
-#define __ARCH_ARM_NUMA_H
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_NUMA_H
+#define __ASM_GENERIC_NUMA_H
 
-#include <xen/mm.h>
+#include <xen/stdint.h>
 
-typedef u8 nodeid_t;
+typedef uint8_t nodeid_t;
 
 #ifndef CONFIG_NUMA
 
+#include <xen/mm-frame.h>
+
 /* Fake one node for now. See also node_online_map. */
 #define cpu_to_node(cpu) 0
 #define node_to_cpumask(node)   (cpu_online_map)
@@ -26,7 +29,8 @@ extern mfn_t first_valid_mfn;
 
 #define arch_want_default_dmazone() (false)
 
-#endif /* __ARCH_ARM_NUMA_H */
+#endif /* __ASM_GENERIC_NUMA_H */
+
 /*
  * Local variables:
  * mode: C
-- 
2.43.0


