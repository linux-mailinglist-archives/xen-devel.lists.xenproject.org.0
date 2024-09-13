Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 267F3978546
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 17:58:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.798296.1208469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp8gY-0000D3-02; Fri, 13 Sep 2024 15:58:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 798296.1208469; Fri, 13 Sep 2024 15:58:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp8gX-0000AR-S5; Fri, 13 Sep 2024 15:58:13 +0000
Received: by outflank-mailman (input) for mailman id 798296;
 Fri, 13 Sep 2024 15:58:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aSyI=QL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sp8gW-0000A5-H1
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2024 15:58:12 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8e3888c-71e8-11ef-a0b5-8be0dac302b0;
 Fri, 13 Sep 2024 17:58:09 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-53655b9bbcdso2934021e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Sep 2024 08:58:09 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5365f9038e3sm2348008e87.187.2024.09.13.08.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 08:58:08 -0700 (PDT)
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
X-Inumbo-ID: f8e3888c-71e8-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726243089; x=1726847889; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fJg7BHwepPlrOFfGyIMBAxXTIqwMuFC09Emwsc98p9A=;
        b=jp9ZEJNsOgo+lQdrxk99q3hiCN8Hu8AIImpRhECvzxtbnvycpszkysD4Ys66gw10e4
         d314zWkpQNQiyGj7DR7snNwWz9uejE9RMaxwrcppQNl2nhzsQbKZ/08BMj+kEwSUn0qY
         IoIVYKALmWfxueYgAovZKAk6Ndxdq/LWV2zoY4QCUoG4PXe0XMfe9vS+lAf+ydZQ+8cM
         MJUviFDKdAK8YZjlw11ifO2DjuZBRmU4tHVLgT7imNg3u4i3zdOnCzcjTr2bzaciK+vF
         pEXR1MZztHpDi7wOXKGs8GQ/xFkwLoumWUt9IkjuvjIvWVXO3BdwShXPOYFGM42SN3Bf
         3bfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726243089; x=1726847889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fJg7BHwepPlrOFfGyIMBAxXTIqwMuFC09Emwsc98p9A=;
        b=YRU9puhlA5hU9R5CLSWaDsDO7q/cLvVYIjixm5XxtvoM0o6eSS+kPXzWZTkA7Uubh4
         cKwvmNA/8eCP6/H7Dv9B+s19FeU+nUdK+x2ZFCK7jaQOyvhyw1YCic/0sCnqtbp5rJPO
         rXmP8k83rBkz1A2gkur58dMQyApLhNvik9h/Dt+vYukolhADgElsY4bZutr4qAhjOk3S
         azGNOBtmgdwsvlbQPZQEGSisKF68xSsuhA5WHGKYr/TY1/IWSBGklp74w3xdyRqtAtp6
         KVV0dU9C8xUHEjgAuXwI7xX4Y5D3DDnmn5nUvKPDYPryH7uWSmgdk4YXLeHn5wCXm1MR
         tbHw==
X-Gm-Message-State: AOJu0YzBecsGP8BZyTXT7zhLiy7t/TgQrf07g531hZuXgfr9h8/Gq6tg
	tDE/epiICri3UGNRGA+YXzoFgpHH8szIlCVvqUPRXWGvlXMG0mbiZCy85Q==
X-Google-Smtp-Source: AGHT+IGyerPNv3cTkkP8/mhFa7Oun1skPrgXmUdJP4qFrPMpotmkkHOAK1pV1Pbx0FAK+//At8N42Q==
X-Received: by 2002:a05:6512:224c:b0:535:6892:3be3 with SMTP id 2adb3069b0e04-53678fe63c0mr4886633e87.41.1726243088410;
        Fri, 13 Sep 2024 08:58:08 -0700 (PDT)
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
Subject: [PATCH v7 1/8] xen/riscv: use {read,write}{b,w,l,q}_cpu() to define {read,write}_atomic()
Date: Fri, 13 Sep 2024 17:57:39 +0200
Message-ID: <7235612db1c273638263b45c59655328256b8cf2.1726242605.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1726242605.git.oleksii.kurochko@gmail.com>
References: <cover.1726242605.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The functions {read,write}{b,w,l,q}_cpu() do not need to be memory-ordered
atomic operations in Xen, based on their definitions for other architectures.

Therefore, {read,write}{b,w,l,q}_cpu() can be used instead of
{read,write}{b,w,l,q}(), allowing the caller to decide if additional
fences should be applied before or after {read,write}_atomic().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V7:
 - Nothing changed. Only rebase.
---
Changes in V6:
 - revert changes connected to _write_atomic() prototype and in definition of write_atomic().
 - update the commit message.
---
Changes in v5:
 - new patch.
---
 xen/arch/riscv/include/asm/atomic.h | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/xen/arch/riscv/include/asm/atomic.h b/xen/arch/riscv/include/asm/atomic.h
index 41f03b2e0c..95910ebfeb 100644
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
-    case 8: *(uint64_t *)res = readq(p); break;
+    case 8: *(uint64_t *)res = readq_cpu(p); break;
 #endif
     default: __bad_atomic_size(); break;
     }
@@ -58,15 +54,16 @@ static always_inline void read_atomic_size(const volatile void *p,
 })
 
 static always_inline void _write_atomic(volatile void *p,
-                                       unsigned long x, unsigned int size)
+                                        unsigned long x,
+                                        unsigned int size)
 {
     switch ( size )
     {
-    case 1: writeb(x, p); break;
-    case 2: writew(x, p); break;
-    case 4: writel(x, p); break;
+    case 1: writeb_cpu(x, p); break;
+    case 2: writew_cpu(x, p); break;
+    case 4: writel_cpu(x, p); break;
 #ifndef CONFIG_RISCV_32
-    case 8: writeq(x, p); break;
+    case 8: writeq_cpu(x, p); break;
 #endif
     default: __bad_atomic_size(); break;
     }
-- 
2.46.0


