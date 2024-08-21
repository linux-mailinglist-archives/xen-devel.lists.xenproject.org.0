Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7A895A263
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2024 18:06:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781293.1190852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgnqs-0004Cu-2O; Wed, 21 Aug 2024 16:06:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781293.1190852; Wed, 21 Aug 2024 16:06:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgnqr-0004BM-R9; Wed, 21 Aug 2024 16:06:25 +0000
Received: by outflank-mailman (input) for mailman id 781293;
 Wed, 21 Aug 2024 16:06:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Njk=PU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sgnqp-0003uu-EP
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2024 16:06:23 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ead5d6b-5fd7-11ef-8776-851b0ebba9a2;
 Wed, 21 Aug 2024 18:06:21 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-52efd8807aaso8706232e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Aug 2024 09:06:21 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5334c75a2cbsm18101e87.187.2024.08.21.09.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2024 09:06:19 -0700 (PDT)
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
X-Inumbo-ID: 4ead5d6b-5fd7-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724256381; x=1724861181; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MJcUmlEBhml/DSOe7/LwB7DMmIhQg2ECn/XQF26RxOQ=;
        b=aYMUKUWBVeIsGY0nZgav5EwgjquVY9n5ttkAYmXSNL2TQzkMDjqnGjN9VSJGn/iYhi
         H+vpBE3oTlFDH+0sHXDMajB4nejSw31t7CbvVPT1dJE5pLCqJOOWnI9bpgtVHMDKKgV4
         jTA923/ab4drcg73lBeDEcMMAnjol9hWG7ZTraWI2sQ5TVVxVVFWYeCIMDVTOabl1+1m
         Ez+QtOzOIlxVGUWLvQMq/OXFME3LiSCuKEqRB0gP9ubPIRoKWwsasrsNmZ5Hr8t86Ewz
         IG2nFPCB6/zRNfcQGJ2/UE1qdcokaGAQUwHoYM+raELf+DnUX7GJS1X7J/B184e49qmq
         fo8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724256381; x=1724861181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MJcUmlEBhml/DSOe7/LwB7DMmIhQg2ECn/XQF26RxOQ=;
        b=J9wY0ER9ZEulATVrfapKMkDwfPAYyFKpfaw5oEK7S8KMgirsd1C62AxAFEnX50T0Ka
         Pajak1UHA4vOnbEI6mmHqdTXmcYKPgD2MKlDxLOVCoMEjy04zgjDUjwe0corS67lH3uw
         meQPk3aV1tFWw5FHNkIxQbHbE73SOQWyomxkh9Oio08g3c8Q0LGFlQMKiKbfQCgtqlU+
         +gRDLzKroxw8OIH12OUPJD+xcHc+NFlabs01oZIlyxVaJQwTpuxrn++2SKy3k+pXv4Jh
         xKCnk50/2dZTUplulpXIRnkgeX02ppFA1sQ6VtNEDV6SmSWmYVTGJtLww/ZRQvNQDOcw
         B+bw==
X-Gm-Message-State: AOJu0Ywg7NJnXNSQ7JSFz1oxHVO+z7IPoYGBPy/wEFEoU2JYLpJu1+Th
	mnxOWx95J9r6sTnMfBFoY4AJ1RaZ7ocYgWtvERM11VckecS1jaoOlNOwtA==
X-Google-Smtp-Source: AGHT+IHNXlncZxBGdnzMvY3I4TMULDV+gDDUZIYPEq3r5sz55D2tBSipK/7C6CGpcJ+we/eb7sj4JQ==
X-Received: by 2002:a05:6512:a91:b0:52f:ca2b:1d33 with SMTP id 2adb3069b0e04-53348551919mr1686167e87.20.1724256380111;
        Wed, 21 Aug 2024 09:06:20 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 1/7] xen/riscv: use {read,write}{b,w,l,q}_cpu() to define {read,write}_atomic()
Date: Wed, 21 Aug 2024 18:06:10 +0200
Message-ID: <5140f9eb3d1cb0b69e3b1cbbcce6167ff8d59e4c.1724256026.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1724256026.git.oleksii.kurochko@gmail.com>
References: <cover.1724256026.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In Xen, memory-ordered atomic operations are not necessary,
based on {read,write}_atomic() implementations for other architectures.
Therefore, {read,write}{b,w,l,q}_cpu() can be used instead of
{read,write}{b,w,l,q}(), allowing the caller to decide if additional
fences should be applied before or after {read,write}_atomic().

Change the declaration of _write_atomic() to accept a 'volatile void *'
type for the 'x' argument instead of 'unsigned long'.
This prevents compilation errors such as:
1."discards 'volatile' qualifier from pointer target type," which occurs
  due to the initialization of a volatile pointer,
  e.g., `volatile uint8_t *ptr = p;` in _add_sized().
2."incompatible type for argument 2 of '_write_atomic'," which can occur
  when calling write_pte(), where 'x' is of type pte_t rather than
  unsigned long.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v5:
 - new patch.
---
 xen/arch/riscv/include/asm/atomic.h | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/xen/arch/riscv/include/asm/atomic.h b/xen/arch/riscv/include/asm/atomic.h
index 31b91a79c8..446c8c7928 100644
--- a/xen/arch/riscv/include/asm/atomic.h
+++ b/xen/arch/riscv/include/asm/atomic.h
@@ -31,21 +31,17 @@
 
 void __bad_atomic_size(void);
 
-/*
- * Legacy from Linux kernel. For some reason they wanted to have ordered
- * read/write access. Thereby read* is used instead of read*_cpu()
- */
 static always_inline void read_atomic_size(const volatile void *p,
                                            void *res,
                                            unsigned int size)
 {
     switch ( size )
     {
-    case 1: *(uint8_t *)res = readb(p); break;
-    case 2: *(uint16_t *)res = readw(p); break;
-    case 4: *(uint32_t *)res = readl(p); break;
+    case 1: *(uint8_t *)res = readb_cpu(p); break;
+    case 2: *(uint16_t *)res = readw_cpu(p); break;
+    case 4: *(uint32_t *)res = readl_cpu(p); break;
 #ifndef CONFIG_RISCV_32
-    case 8: *(uint32_t *)res = readq(p); break;
+    case 8: *(uint32_t *)res = readq_cpu(p); break;
 #endif
     default: __bad_atomic_size(); break;
     }
@@ -58,15 +54,16 @@ static always_inline void read_atomic_size(const volatile void *p,
 })
 
 static always_inline void _write_atomic(volatile void *p,
-                                       unsigned long x, unsigned int size)
+                                        volatile void *x,
+                                        unsigned int size)
 {
     switch ( size )
     {
-    case 1: writeb(x, p); break;
-    case 2: writew(x, p); break;
-    case 4: writel(x, p); break;
+    case 1: writeb_cpu(*(uint8_t *)x, p); break;
+    case 2: writew_cpu(*(uint16_t *)x, p); break;
+    case 4: writel_cpu(*(uint32_t *)x, p); break;
 #ifndef CONFIG_RISCV_32
-    case 8: writeq(x, p); break;
+    case 8: writeq_cpu(*(uint64_t *)x, p); break;
 #endif
     default: __bad_atomic_size(); break;
     }
@@ -75,7 +72,7 @@ static always_inline void _write_atomic(volatile void *p,
 #define write_atomic(p, x)                              \
 ({                                                      \
     typeof(*(p)) x_ = (x);                              \
-    _write_atomic(p, x_, sizeof(*(p)));                 \
+    _write_atomic(p, &x_, sizeof(*(p)));                \
 })
 
 static always_inline void _add_sized(volatile void *p,
-- 
2.46.0


