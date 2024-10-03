Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 322A298EF03
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 14:19:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809328.1221605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swKnp-0004tH-SF; Thu, 03 Oct 2024 12:19:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809328.1221605; Thu, 03 Oct 2024 12:19:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swKnp-0004nv-K8; Thu, 03 Oct 2024 12:19:29 +0000
Received: by outflank-mailman (input) for mailman id 809328;
 Thu, 03 Oct 2024 12:19:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d1Re=Q7=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1swKnn-00043W-VY
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 12:19:27 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb68b45a-8181-11ef-a0ba-8be0dac302b0;
 Thu, 03 Oct 2024 14:19:26 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a8b155b5e9eso125044466b.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 05:19:26 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a991047319asm77328366b.184.2024.10.03.05.19.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 05:19:25 -0700 (PDT)
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
X-Inumbo-ID: bb68b45a-8181-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727957966; x=1728562766; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a/7R4MvznIwbKLMj3J7Q74kL2tb8WLc8B3HYmuuXkgk=;
        b=Flnn1TyrI3hhS+KhzbqKz4Qn1EyYONsMDIHp8evhEWnM9nZQgRqKIs8LxXUGwmmhJH
         sD7rZYg1Zm3YNMlI1UtaMxguhUf10UbZZwLF/mPV/M6BIkb9JhOvwIlXKu80YzH5C8Gz
         qUo/jOj3wbO+sbDn0cbefM29mApz9JIrAumYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727957966; x=1728562766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a/7R4MvznIwbKLMj3J7Q74kL2tb8WLc8B3HYmuuXkgk=;
        b=mSHy1XWlMbmpKK0ZW2e0SFJcOCQbuiR1HpqbKNZ+qTB95/oU6QwxaaBKBIuEgFsDv9
         r1qem/fRO4EAv754FUFOWvvwfiKMxItdef7EkZS7jSUoiA7MmsvHH19jXMElbIcbR6MJ
         /bWsQc19MyLxa7i+VTne5XXae46zQR6LNZPXzRE54iXyqLMlush7gYYwGQdXONqa6nO1
         VVoQI/6ND/SZqHw++MbXe3vx3WYChF4YwyjP4f01bqWXsYn4wNns3VbIDD7pwhX+ZuDQ
         FYHuskx1NOYbiCE8iW2f+cy889+YJWOXOfrxtaw0g0JIDjYz/nIwWvx9YKk2dkPkoPtR
         09mQ==
X-Gm-Message-State: AOJu0YyaVb+//n8HvAgwwbs8hWS4zPBXw3ZQoPDyrkd5aKKK0VNU2NgB
	DCr8wWXQIDGaQVoU5AeFyQlilSoz2VgMm0Z+3soDOjOdWqd5/vvohvPtxmA/dqDXn1iJbwnl1X9
	C
X-Google-Smtp-Source: AGHT+IHR+xjcdswutJxhH7ycnq1/Y6O6R6s5OwZ8J5FmdDQRCTBdoO5aN99nxH33M+RpK3skXjGLkQ==
X-Received: by 2002:a17:907:7ea7:b0:a8d:fa3:bb24 with SMTP id a640c23a62f3a-a98f823cc05mr516443466b.23.1727957965883;
        Thu, 03 Oct 2024 05:19:25 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 06/20] xen: Update header guards - Device tree
Date: Thu,  3 Oct 2024 13:18:54 +0100
Message-Id: <20241003121908.362888-7-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241003121908.362888-1-frediano.ziglio@cloud.com>
References: <20241003121908.362888-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updated headers related to device tree.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/common/libfdt/libfdt_internal.h | 6 +++---
 xen/include/xen/bootfdt.h           | 6 +++---
 xen/include/xen/device_tree.h       | 4 ++--
 xen/include/xen/libfdt/fdt.h        | 6 +++---
 xen/include/xen/libfdt/libfdt-xen.h | 6 +++---
 xen/include/xen/libfdt/libfdt.h     | 6 +++---
 xen/include/xen/libfdt/libfdt_env.h | 6 +++---
 7 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/xen/common/libfdt/libfdt_internal.h b/xen/common/libfdt/libfdt_internal.h
index 16bda1906a..ba4d6527b0 100644
--- a/xen/common/libfdt/libfdt_internal.h
+++ b/xen/common/libfdt/libfdt_internal.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
-#ifndef LIBFDT_INTERNAL_H
-#define LIBFDT_INTERNAL_H
+#ifndef COMMON__LIBFDT__LIBFDT_INTERNAL_H
+#define COMMON__LIBFDT__LIBFDT_INTERNAL_H
 /*
  * libfdt - Flat Device Tree manipulation
  * Copyright (C) 2006 David Gibson, IBM Corporation.
@@ -189,4 +189,4 @@ static inline bool can_assume_(int mask)
 /** helper macros for checking assumptions */
 #define can_assume(_assume)	can_assume_(ASSUME_ ## _assume)
 
-#endif /* LIBFDT_INTERNAL_H */
+#endif /* COMMON__LIBFDT__LIBFDT_INTERNAL_H */
diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
index 16fa05f38f..7cb01dbb1b 100644
--- a/xen/include/xen/bootfdt.h
+++ b/xen/include/xen/bootfdt.h
@@ -1,5 +1,5 @@
-#ifndef XEN_BOOTFDT_H
-#define XEN_BOOTFDT_H
+#ifndef XEN__BOOTFDT_H
+#define XEN__BOOTFDT_H
 
 #include <xen/types.h>
 #include <xen/kernel.h>
@@ -206,4 +206,4 @@ static inline struct shmem_membank_extra *bootinfo_get_shmem_extra(void)
 }
 #endif
 
-#endif /* XEN_BOOTFDT_H */
+#endif /* XEN__BOOTFDT_H */
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index e6287305a7..5c4a419781 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -7,8 +7,8 @@
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation.
  */
-#ifndef __XEN_DEVICE_TREE_H__
-#define __XEN_DEVICE_TREE_H__
+#ifndef XEN__DEVICE_TREE_H
+#define XEN__DEVICE_TREE_H
 
 #include <asm/byteorder.h>
 #include <asm/device.h>
diff --git a/xen/include/xen/libfdt/fdt.h b/xen/include/xen/libfdt/fdt.h
index f2e68807f2..6a53d4705b 100644
--- a/xen/include/xen/libfdt/fdt.h
+++ b/xen/include/xen/libfdt/fdt.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
-#ifndef FDT_H
-#define FDT_H
+#ifndef XEN__LIBFDT__FDT_H
+#define XEN__LIBFDT__FDT_H
 /*
  * libfdt - Flat Device Tree manipulation
  * Copyright (C) 2006 David Gibson, IBM Corporation.
@@ -63,4 +63,4 @@ struct fdt_property {
 #define FDT_V16_SIZE	FDT_V3_SIZE
 #define FDT_V17_SIZE	(FDT_V16_SIZE + sizeof(fdt32_t))
 
-#endif /* FDT_H */
+#endif /* XEN__LIBFDT__FDT_H */
diff --git a/xen/include/xen/libfdt/libfdt-xen.h b/xen/include/xen/libfdt/libfdt-xen.h
index a5340bc9f4..7cab9cef66 100644
--- a/xen/include/xen/libfdt/libfdt-xen.h
+++ b/xen/include/xen/libfdt/libfdt-xen.h
@@ -8,8 +8,8 @@
  * Copyright (C) 2023, Advanced Micro Devices, Inc. All Rights Reserved.
  */
 
-#ifndef LIBFDT_XEN_H
-#define LIBFDT_XEN_H
+#ifndef XEN__LIBFDT__LIBFDT_XEN_H
+#define XEN__LIBFDT__LIBFDT_XEN_H
 
 #include <xen/libfdt/libfdt.h>
 
@@ -43,7 +43,7 @@ static inline int fdt_get_mem_rsv_paddr(const void *fdt, int n,
     return ret;
 }
 
-#endif /* LIBFDT_XEN_H */
+#endif /* XEN__LIBFDT__LIBFDT_XEN_H */
 
 /*
  * Local variables:
diff --git a/xen/include/xen/libfdt/libfdt.h b/xen/include/xen/libfdt/libfdt.h
index fabddbee8c..9ed4ee1705 100644
--- a/xen/include/xen/libfdt/libfdt.h
+++ b/xen/include/xen/libfdt/libfdt.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
-#ifndef LIBFDT_H
-#define LIBFDT_H
+#ifndef XEN__LIBFDT__LIBFDT_H
+#define XEN__LIBFDT__LIBFDT_H
 /*
  * libfdt - Flat Device Tree manipulation
  * Copyright (C) 2006 David Gibson, IBM Corporation.
@@ -2137,4 +2137,4 @@ const char *fdt_strerror(int errval);
 }
 #endif
 
-#endif /* LIBFDT_H */
+#endif /* XEN__LIBFDT__LIBFDT_H */
diff --git a/xen/include/xen/libfdt/libfdt_env.h b/xen/include/xen/libfdt/libfdt_env.h
index 8368787391..3b0d121a78 100644
--- a/xen/include/xen/libfdt/libfdt_env.h
+++ b/xen/include/xen/libfdt/libfdt_env.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
-#ifndef LIBFDT_ENV_H
-#define LIBFDT_ENV_H
+#ifndef XEN__LIBFDT__LIBFDT_ENV_H
+#define XEN__LIBFDT__LIBFDT_ENV_H
 /*
  * libfdt - Flat Device Tree manipulation
  * Copyright (C) 2006 David Gibson, IBM Corporation.
@@ -93,4 +93,4 @@ static inline size_t fdt_strnlen(const char *string, size_t max_count)
 
 #endif /* __APPLE__ */
 
-#endif /* LIBFDT_ENV_H */
+#endif /* XEN__LIBFDT__LIBFDT_ENV_H */
-- 
2.34.1


