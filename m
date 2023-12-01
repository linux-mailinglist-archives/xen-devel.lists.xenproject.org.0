Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA348014C9
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 21:48:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645740.1008025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9AQv-0007tM-MR; Fri, 01 Dec 2023 20:48:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645740.1008025; Fri, 01 Dec 2023 20:48:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9AQv-0007mc-HS; Fri, 01 Dec 2023 20:48:21 +0000
Received: by outflank-mailman (input) for mailman id 645740;
 Fri, 01 Dec 2023 20:48:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yVFl=HM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r9AQu-0007Cg-S5
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 20:48:20 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6032f4d-908a-11ee-98e5-6d05b1d4d9a1;
 Fri, 01 Dec 2023 21:48:20 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2c9bd3ec4f6so32579011fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 01 Dec 2023 12:48:20 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 i18-20020a2ea372000000b002c6ed7e546esm511142ljn.124.2023.12.01.12.48.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Dec 2023 12:48:18 -0800 (PST)
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
X-Inumbo-ID: f6032f4d-908a-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701463699; x=1702068499; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/UjRVghE9J4L7xQTZkvPdVbMV4X+mNlL7EmIYrZm+io=;
        b=iEWljsrN7irkOrODpaFCArSB04ycQtj694iIdpnOfybDFafP6smzsTairpq8ca5nZr
         3PmHV15hiVbh3vdKzBnvL8HOZCjTexszq52cfk2Z4jr7NwLg0W9B8YgNRbVq2MgSm675
         5jL+n9EH7BL6qzMYlf4rWIuCti7gF17zZMbye1f/+lP0DoSdDAY4HfdiJ7d+xW9BpMNg
         DEZ5w0JHQGoraOGz2hd05I0WHNqcs3qUPFWyZG+IuBD24ib/AY+ynPbaqw85LJkocVb2
         hc/WSI/f37j4G96zx/qiYnF2+3mba77EVJz6pmUeE0GCMDJOwa6x7B9x3i1z/X9JUsL4
         W9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701463699; x=1702068499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/UjRVghE9J4L7xQTZkvPdVbMV4X+mNlL7EmIYrZm+io=;
        b=qQg8oH+H/sw1XkSZEk+sbaj+ELI22rsFtgVDMKDtH9fuuWUJAw8AEsVpIvbZ9KxoX0
         kD+vODmNCLK3vAMWU5A6UU4uE0TMTsmQJG8InoJH2hLPwZcb7Ptmd4U+Yjn969EsSP9p
         13zAfqXeDEyugDjfhzvh56NKK5mGDQ3Ij7u9Gb63skz/G+zLb2NfbmTgTwdssYqWBoV8
         ofAnam5OU9fbng8THzQyMz/p/Zhl9dAHY6xcQVUvf/0CNJwjzd+92YrbiN1gE9CxiaYW
         TGRAgH4w0kKxhJnrcl5Q7F0nd++sD14CKCTDclQY2HtXO8p81i77X/PxsHhYjvEDz91k
         DZVg==
X-Gm-Message-State: AOJu0YwLkGgr9ARyMV4ObQ6OGovspFhUJnnIv58Kh6z+Fb6TA6bFCy2I
	F/z9FCHM3YSUThDRzLEM//TiscCUZUj1Tw==
X-Google-Smtp-Source: AGHT+IH5vurx8p7bWFO45XGaaJms9rqDfrneohtT4L7xQU+8npR3XxsnunrAzVyVIbOVjPlzKUXlpQ==
X-Received: by 2002:a2e:9ec1:0:b0:2c9:c05b:9870 with SMTP id h1-20020a2e9ec1000000b002c9c05b9870mr1096802ljk.23.1701463698941;
        Fri, 01 Dec 2023 12:48:18 -0800 (PST)
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
Subject: [PATCH v5 3/7] xen/asm-generic: introduce stub header numa.h
Date: Fri,  1 Dec 2023 22:48:06 +0200
Message-ID: <d6dfb3f110376026e089ddf9eb850307aeed37e8.1701453087.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1701453087.git.oleksii.kurochko@gmail.com>
References: <cover.1701453087.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

<asm/numa.h> is common through some archs so it is moved
to asm-generic.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>
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


