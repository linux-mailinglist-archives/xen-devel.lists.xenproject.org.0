Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4BE968C95
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 19:01:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788308.1197827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slAQl-0003A5-L8; Mon, 02 Sep 2024 17:01:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788308.1197827; Mon, 02 Sep 2024 17:01:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slAQl-000343-GN; Mon, 02 Sep 2024 17:01:31 +0000
Received: by outflank-mailman (input) for mailman id 788308;
 Mon, 02 Sep 2024 17:01:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uz6k=QA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1slAQk-0002dz-DU
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 17:01:30 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff9d6725-694c-11ef-a0b2-8be0dac302b0;
 Mon, 02 Sep 2024 19:01:29 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2f3f0bdbcd9so52191531fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 10:01:29 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-535408410f5sm1677618e87.211.2024.09.02.10.01.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 10:01:27 -0700 (PDT)
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
X-Inumbo-ID: ff9d6725-694c-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725296489; x=1725901289; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VhrBEFGtPZRdWxQy1MAPcPMepK4SQW4esAy9pknAaq4=;
        b=lWVYvoT+tkzrXC//iJdeL867F2qT1gDLeklDUIwR7m6G2TLqHPBOu19OLrOudTkkcA
         g6AXmP5O6uCjs9vZWkJss76rrSMjRPAJAvF4PB6McIhSyIKSOw+pnwyNzEsb/uOc8qJp
         I9yg8VYSF7fGGgkbRVwEoUrKg6NcZsU6b3APZNtQtjHGmKubCgjpgotTN1IcGrFy+LZg
         rIyD7b4iyeaQxFlNFklHXgRbt5KFiQjMMgJh/k5gxiYeXdQVNxIy9rA+hSUOUzJ485I0
         XPmtLDUByJa1LDPOqJTuwH75jidy22FFSthw1fTFfePeEN/DpDjXB1FXbueVMaO869ZT
         MyrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725296489; x=1725901289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VhrBEFGtPZRdWxQy1MAPcPMepK4SQW4esAy9pknAaq4=;
        b=mk5fRidfTqVtwQyYbxyy3/Z2XWkK3NFzQsClyr1XDL5blENqNZn+lIvEbsLC2Lfj7l
         4qZKsY+BvcJXoFRyiE2q3N5YSacjf6rP3CWGg1zjq1Kp/SxtY0uP0U9hTjq03TRWjQfb
         5+fyNke/VcN9yTGedigZQa4K9PvVWz6BaAb20B3DR2chqEl04puLVk9tR9MVfoigdgyo
         L+za93J6fnlKOGdBk512UV6pCstt8usveNODqYv6pHGiAtwN0s/78T5s72U1/ks0skhO
         R8wIdH25ThQpBSQKrrkZQiKqPD6M6IMy2qbVdK+3xGSW+sS2ZjyYGTY1hRW1wT4unuXQ
         2r0w==
X-Gm-Message-State: AOJu0YxonHo6L+Y9umNQ5oNOSbv0hZEJaVqlOgMwCVaPgDNVwjmT7ZIR
	JK/S4ZdefVAuJ9Kx5zSVkCvsvBlkVOgnSManHEI1NDjQfjzv2NuCBU8Ljw==
X-Google-Smtp-Source: AGHT+IFFa1M8ACKBxL1lFnWok+mgQAdnsPXQHjvYLuCwMIgw8/f9HAaKcI6eOp2cHkK1vi3M3bGKFQ==
X-Received: by 2002:a05:6512:3ba5:b0:535:3da2:8a4d with SMTP id 2adb3069b0e04-53546b907f6mr7432708e87.44.1725296488303;
        Mon, 02 Sep 2024 10:01:28 -0700 (PDT)
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
Subject: [PATCH v6 3/9] xen/riscv: allow write_atomic() to work with non-scalar types
Date: Mon,  2 Sep 2024 19:01:16 +0200
Message-ID: <44810c0c3faa4fd2d36a8be9a87c5022088c0e62.1725295716.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1725295716.git.oleksii.kurochko@gmail.com>
References: <cover.1725295716.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the 2nd argument of _write_atomic() from 'unsigned long x'
to 'void *x' to allow write_atomic() to handle non-scalar types,
aligning it with read_atomic(), which can work with non-scalar types.

Additionally, update the implementation of _add_sized() to use
"writeX_cpu(readX_cpu(p) + x, p)" instead of
"write_atomic(ptr, read_atomic(ptr) + x)" because 'ptr' is defined
as 'volatile uintX_t *'.
This avoids a compilation error that occurs when passing the 2nd
argument to _write_atomic() (i.e., "passing argument 2 of '_write_atomic'
discards 'volatile' qualifier from pointer target type") since the 2nd
argument of _write_atomic() is now 'void *' instead of 'unsigned long'.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v6:
 - new patch.
---
 xen/arch/riscv/include/asm/atomic.h | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/xen/arch/riscv/include/asm/atomic.h b/xen/arch/riscv/include/asm/atomic.h
index 3c6bd86406..92b92fb4d4 100644
--- a/xen/arch/riscv/include/asm/atomic.h
+++ b/xen/arch/riscv/include/asm/atomic.h
@@ -54,16 +54,16 @@ static always_inline void read_atomic_size(const volatile void *p,
 })
 
 static always_inline void _write_atomic(volatile void *p,
-                                        unsigned long x,
+                                        void *x,
                                         unsigned int size)
 {
     switch ( size )
     {
-    case 1: writeb_cpu(x, p); break;
-    case 2: writew_cpu(x, p); break;
-    case 4: writel_cpu(x, p); break;
+    case 1: writeb_cpu(*(uint8_t *)x, p); break;
+    case 2: writew_cpu(*(uint16_t *)x, p); break;
+    case 4: writel_cpu(*(uint32_t *)x, p); break;
 #ifndef CONFIG_RISCV_32
-    case 8: writeq_cpu(x, p); break;
+    case 8: writeq_cpu(*(uint64_t *)x, p); break;
 #endif
     default: __bad_atomic_size(); break;
     }
@@ -72,7 +72,7 @@ static always_inline void _write_atomic(volatile void *p,
 #define write_atomic(p, x)                              \
 ({                                                      \
     typeof(*(p)) x_ = (x);                              \
-    _write_atomic(p, x_, sizeof(*(p)));                 \
+    _write_atomic(p, &x_, sizeof(*(p)));                \
 })
 
 static always_inline void _add_sized(volatile void *p,
@@ -82,27 +82,23 @@ static always_inline void _add_sized(volatile void *p,
     {
     case 1:
     {
-        volatile uint8_t *ptr = p;
-        write_atomic(ptr, read_atomic(ptr) + x);
+        writeb_cpu(readb_cpu(p) + x, p);
         break;
     }
     case 2:
     {
-        volatile uint16_t *ptr = p;
-        write_atomic(ptr, read_atomic(ptr) + x);
+        writew_cpu(readw_cpu(p) + x, p);
         break;
     }
     case 4:
     {
-        volatile uint32_t *ptr = p;
-        write_atomic(ptr, read_atomic(ptr) + x);
+        writel_cpu(readl_cpu(p) + x, p);
         break;
     }
 #ifndef CONFIG_RISCV_32
     case 8:
     {
-        volatile uint64_t *ptr = p;
-        write_atomic(ptr, read_atomic(ptr) + x);
+        writeq_cpu(readw_cpu(p) + x, p);
         break;
     }
 #endif
-- 
2.46.0


