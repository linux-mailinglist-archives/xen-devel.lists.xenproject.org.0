Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCC8968C98
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 19:01:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788307.1197820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slAQl-000310-78; Mon, 02 Sep 2024 17:01:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788307.1197820; Mon, 02 Sep 2024 17:01:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slAQl-0002w8-0C; Mon, 02 Sep 2024 17:01:31 +0000
Received: by outflank-mailman (input) for mailman id 788307;
 Mon, 02 Sep 2024 17:01:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uz6k=QA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1slAQj-0002dz-5E
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 17:01:29 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fedaced3-694c-11ef-a0b2-8be0dac302b0;
 Mon, 02 Sep 2024 19:01:28 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5334c4d6829so5516937e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 10:01:28 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-535408410f5sm1677618e87.211.2024.09.02.10.01.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 10:01:26 -0700 (PDT)
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
X-Inumbo-ID: fedaced3-694c-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725296488; x=1725901288; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zsZPmdsnUQ0g8GNjVOugZDCtnwfYe0WoeUsADZLx6iU=;
        b=OEr7tjSrD3lJFEzyhX3FdUMxsmJR1YyMxpAPETreJmVWCXExOoJT668qHkwtN6wsk4
         zHMfxQavvy0ZJW/NhgAMf4HEaQu26v5fDZIYofS76jNOZrb5G2t0EB+ZY0Wj6SkoFjxQ
         Ogjmq/SEjOXPuZBnzicFxZ98ljhv6qCrDElmH2f/TJn0cLXS6/2qNI5UZLaKdhBLjmLl
         3fTXP6B6KlrUGyVH9SpCg/GMdrBWh2lYjBr98MngnT77CppWleIn2XqLpMZiER+acqHD
         ojKN8ddCdVSYpVuBC9+DHZsswZxa6hSJnKZC86FQzzcXLwwjAl0LNQuAKssC+QK8KnLI
         QpvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725296488; x=1725901288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zsZPmdsnUQ0g8GNjVOugZDCtnwfYe0WoeUsADZLx6iU=;
        b=Wb+cfr4CGTQ1YY8ddkaTOu5yDZ8DCSIt6lmiM9x8ralO9uCgGbF1P/b1FdGCKec8nJ
         +BK/8D2wqHzg/lbl66jwuao9vICq77FniBeByTLdL3DCwbKrcJWzxhOM+R/pjb2xJjd/
         12+6GyyC+GUWgjYTkUhRq5zY2mEpcxGG5rWTizvOydoBCEdf4uv4qAHOROcPMtCYghsZ
         bA27LqjyMYnyY/tSngzpJcQupPf92+o7DH6d/taL4xrydq2s7CsWB5Jfp3M6/LKse7pm
         gbnXtyhpd59hdqXjVIqgDnNmLKu4KANahORHI7ijSo5JedbHXii+GeaDcc3Y4rEuPZBW
         hPzA==
X-Gm-Message-State: AOJu0YzchBB0TWr4BCRKjfqTD/zO/sd4vQkDnfYp5LC2wRNVuN6OKdQ8
	c2SRKfLqHOxaiLKQFZsXVqBZHJXtcEQ7Ui23Q1UNkOgzCbXvcS0h3EdTyw==
X-Google-Smtp-Source: AGHT+IEWGK9oB56pwCiBkBH6KNLMot3k+AocE1a8BqzB1tmMKLmsUFkhDRO1K+eGIN2tjn4oFkGwAw==
X-Received: by 2002:a05:6512:3b8c:b0:52f:159:2dc5 with SMTP id 2adb3069b0e04-53546ba9fd4mr7564023e87.42.1725296487042;
        Mon, 02 Sep 2024 10:01:27 -0700 (PDT)
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
Subject: [PATCH v6 2/9] xen/riscv: use {read,write}{b,w,l,q}_cpu() to define {read,write}_atomic()
Date: Mon,  2 Sep 2024 19:01:15 +0200
Message-ID: <4b62d7e3faa24f6070430607262a3aed1bbf1861.1725295716.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1725295716.git.oleksii.kurochko@gmail.com>
References: <cover.1725295716.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The functions {read,write}{b,w,l,q}_cpu() do not need to be memory-ordered
atomic operations in Xen, based on their definitions for other architectures.

Therefore, {read,write}{b,w,l,q}_cpu() can be used instead of
{read,write}{b,w,l,q}(), allowing the caller to decide if additional
fences should be applied before or after {read,write}_atomic().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
index 31b91a79c8..3c6bd86406 100644
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


