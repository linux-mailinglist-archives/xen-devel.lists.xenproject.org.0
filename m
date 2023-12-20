Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E98381A0C2
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 15:09:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657918.1027051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFxFg-0005y5-IY; Wed, 20 Dec 2023 14:08:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657918.1027051; Wed, 20 Dec 2023 14:08:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFxFg-0005sE-BM; Wed, 20 Dec 2023 14:08:48 +0000
Received: by outflank-mailman (input) for mailman id 657918;
 Wed, 20 Dec 2023 14:08:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RD2L=H7=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rFxFf-0004kf-Fo
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 14:08:47 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49db9176-9f41-11ee-9b0f-b553b5be7939;
 Wed, 20 Dec 2023 15:08:45 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2ca0715f0faso69704361fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 06:08:45 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 d19-20020a05651c089300b002cc83c337absm593892ljq.70.2023.12.20.06.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 06:08:44 -0800 (PST)
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
X-Inumbo-ID: 49db9176-9f41-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703081325; x=1703686125; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ILg80GpPtrLjK/GDu/egRBjnqwnshJth8WFMEojdQNQ=;
        b=XFj53WTxA4bLsdxuw67Uyj8ug6W65c5+KwxJUq+v/lkFNscrUl7omvf3mWJ/eS1/85
         O+Q3mc0vbFgMKIoLmOamjw8DnT70Li+XBfYwERX70hhMaHZheSWKD91+c54b8OSY5JhJ
         fCg3Fm1LrGA48jAWFfqsvu+p+C7AcQLXTLRiQU803QcWZDs/+4Om/oxZimCVHilySFRo
         BuuxHTEYlGM8YS30SFH7fay3toxtGTUKVEBDcf1UpZb0IMj1dnH70lJt+qrufmgFScli
         XIYXTt4GdN/3RFsmGfJSJKJ6iC+qTO/6KANuD9Ruy6cvRbFzUxi1dUzoy8SvrIiYATON
         iPEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703081325; x=1703686125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ILg80GpPtrLjK/GDu/egRBjnqwnshJth8WFMEojdQNQ=;
        b=PL9yzVLe8kAuWIZ+3Prf/xwDYRtNxQ3jeDqdmjWkBNw6un2ZU9FmnOGgphlroW2fma
         SoXSlcTlho13vB5OAxtyxcAIJPN6qrIIH2IHk2PBn9XsHMxboGh7ymCRFZcoZ/O0V6x0
         sYO+e01K08qoezjxKUEMux06WvAq8uxbfrBx+6aLJbtKYobmRT+nH86Ye1VYu4oF0JJG
         UT5KpMAdsRtH55yuA3aLChyh9GyIVjgkURcKbPMnTxvwimNHax98NekdJ5+KkKOdAqYc
         jqFotItmg6ehTvYzxrYIt75KRnslFNwmG4gNo6EI5yP1h8FGJ3A6uPx22m+22ICT7diq
         N9rw==
X-Gm-Message-State: AOJu0YxFFPasEDIoZOj9lBuo27uoy5wmQU9OpVbMsYvlpjyyWS+PLEN1
	H+xS9p+GnJOyXYB47XrIcgjtOwb+tbdu4A==
X-Google-Smtp-Source: AGHT+IGcPv0azV6t4fDEFPg/d6JC+i7zv+P7H6/F+52hBHMP1YYTuLgIID6wBj6LJhjMgZuA3AW1Kw==
X-Received: by 2002:a05:651c:2207:b0:2cc:21eb:f14b with SMTP id y7-20020a05651c220700b002cc21ebf14bmr7960037ljq.64.1703081324863;
        Wed, 20 Dec 2023 06:08:44 -0800 (PST)
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
Subject: [PATCH v6 5/9] xen/asm-generic: introduce stub header numa.h
Date: Wed, 20 Dec 2023 16:08:27 +0200
Message-ID: <08bca9a4158a190a0a953e5bc071a512cfe5f0f8.1703072575.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1703072575.git.oleksii.kurochko@gmail.com>
References: <cover.1703072575.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

<asm/numa.h> is common through some archs so it is moved
to asm-generic.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
Changes in V6:
 - Rebase only.
---
Changes in V5:
  - Added Acked-by: Jan Beulich <jbeulich@suse.com>
  - Updated the comment around first_valid_mfn. ( Arm -> GENERIC )
  - Added Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>
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
 .../asm => include/asm-generic}/numa.h        | 16 +++++++-----
 4 files changed, 12 insertions(+), 32 deletions(-)
 delete mode 100644 xen/arch/ppc/include/asm/numa.h
 rename xen/{arch/arm/include/asm => include/asm-generic}/numa.h (67%)

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
index a8e848d4d0..f09c5ea8a1 100644
--- a/xen/arch/ppc/include/asm/Makefile
+++ b/xen/arch/ppc/include/asm/Makefile
@@ -4,6 +4,7 @@ generic-y += div64.h
 generic-y += hardirq.h
 generic-y += hypercall.h
 generic-y += iocap.h
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
similarity index 67%
rename from xen/arch/arm/include/asm/numa.h
rename to xen/include/asm-generic/numa.h
index e2bee2bd82..7f95a77e89 100644
--- a/xen/arch/arm/include/asm/numa.h
+++ b/xen/include/asm-generic/numa.h
@@ -1,18 +1,21 @@
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
 
 /*
- * TODO: make first_valid_mfn static when NUMA is supported on Arm, this
+ * TODO: make first_valid_mfn static when NUMA is supported on GENERIC, this
  * is required because the dummy helpers are using it.
  */
 extern mfn_t first_valid_mfn;
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


