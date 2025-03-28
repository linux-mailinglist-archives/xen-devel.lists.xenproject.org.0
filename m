Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1745A74F92
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 18:37:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.931040.1333522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyDdD-0003x3-LG; Fri, 28 Mar 2025 17:36:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931040.1333522; Fri, 28 Mar 2025 17:36:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyDdD-0003um-Hp; Fri, 28 Mar 2025 17:36:35 +0000
Received: by outflank-mailman (input) for mailman id 931040;
 Fri, 28 Mar 2025 17:36:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IZL4=WP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tyDdB-0003ug-K8
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 17:36:33 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d19569b-0bfb-11f0-9ffa-bf95429c2676;
 Fri, 28 Mar 2025 18:36:27 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3913b539aabso1458756f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 28 Mar 2025 10:36:27 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b66ab86sm3322652f8f.51.2025.03.28.10.36.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 10:36:25 -0700 (PDT)
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
X-Inumbo-ID: 2d19569b-0bfb-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743183386; x=1743788186; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ueJlsKLJkxEXFgZQaRhI/br6w8/vNs+jY9tzcpOs6oY=;
        b=sgPqX+wT9TUSicBkLWoTDMkTAogp1XzOvP13ISdYNjqW1QB2zvnmq1hDadrP+hWBzo
         EdD/xUABlcovzUfd8G/MGne6uAJL2jnM0M+Mk6pYjTGXZuKvuoes2eKFf++4qsfH6Ot4
         37lL3J4LnlYtqwh8gdbv99KYKwLhNY4b+c8Hk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743183386; x=1743788186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ueJlsKLJkxEXFgZQaRhI/br6w8/vNs+jY9tzcpOs6oY=;
        b=ugEQn1gxVdW4wDGzLehENTAm/uPzv1UGfjiP6GpBPeU8wlio34xxWv+blW//5Gi/1G
         felRB/U2J8wX4DmFbSHOxes3cdAmIlrp/68mrYdaAMjwYH0LzbyrXcpOylmLBR5u2XIW
         LlgC1aqYD0LoLwcpK5fCctzPcTs94OEqtB2NeCFZft2jUT//F51yLJmCydbcmrnrB7mL
         BT8IA0csolrZ5erJbtwIgeIl1B4jdVhc6+ox39aQiNp4VXtBC9odt/MH3/eLWsdlHGJ3
         UcdSmY0qIpzjgsCRZzS9OkT9sHcmkjGtS13hKbwDLgpcBkS/EixaWS9uuAFzwO1pLAmt
         D55g==
X-Gm-Message-State: AOJu0Yx/WoI8rSbnHJQkWqfd8eaoaaUItplxgabC4VQtoeWeJR9pDrQw
	IpgZwYQZPdFkt6roK6zy5M6CkFqnwLo4dtxqQ2qHdLisdiufT5UIMIS1nQ415skbD8PECgsuPHC
	yods=
X-Gm-Gg: ASbGncviK4YnCdnDxUVd5jKnoeUkniM1Bl9ZQn1Ow9/HD9MZkyIybpTRz61TCBII4w+
	Jo8+KflrnK9Qc83eH7w8R7kQSLmKUsj8DDpKegFP0kRlECNH3SAiCqI/qJQtFDsyYBJtbB9Xv/L
	/b9vN8dan3X7NNurbE4lypUjPEyKPrcQD+iIHNqtojpND7WG5Kfg6q55KKyOQC4fBdXZYycFfJr
	8y5ya7l8xgdHP+zMBuDFyQsR14UeKiZs3Jlg0PPhM+xZJz1MVbPXccB6Kre6tXKPtyHQl5hUe/W
	Fy1SPKy/pxMqnzNG3LOTfic5+PTsDISuVM3FrBcWFPy3j8cV5mJH/rpZbqoPafeEihFfHOT1mFS
	6bcEweySi3Uwk1ehQaQ==
X-Google-Smtp-Source: AGHT+IESleC0WTEPcPPrg1QmNhPbAizZQSvltcOk1rIrPxbYvYabBft4iPOCJcDACiACiMovEZuv7g==
X-Received: by 2002:a05:6000:23c2:b0:391:2f15:c1f4 with SMTP id ffacd0b85a97d-39ad1784ae9mr5671351f8f.55.1743183386183;
        Fri, 28 Mar 2025 10:36:26 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/types: Drop compatibility for GCC < 4.4
Date: Fri, 28 Mar 2025 17:36:23 +0000
Message-Id: <20250328173623.892770-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We now have compiler types for every standard type we use.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/include/xen/stdint.h | 19 -------------------
 xen/include/xen/types.h  |  3 +--
 2 files changed, 1 insertion(+), 21 deletions(-)

diff --git a/xen/include/xen/stdint.h b/xen/include/xen/stdint.h
index a40165c6ae33..dde12964bfe6 100644
--- a/xen/include/xen/stdint.h
+++ b/xen/include/xen/stdint.h
@@ -2,23 +2,6 @@
 #ifndef __XEN_STDINT_H__
 #define __XEN_STDINT_H__
 
-#ifndef __INT8_TYPE__ /* GCC <= 4.4 */
-
-/*
- * Define the types using GCC internal notation.  Clang understands this too.
- * https://gcc.gnu.org/onlinedocs/gcc/Common-Variable-Attributes.html
- */
-typedef   signed __attribute__((__mode__(__QI__)))     int8_t;
-typedef unsigned __attribute__((__mode__(__QI__)))    uint8_t;
-typedef   signed __attribute__((__mode__(__HI__)))    int16_t;
-typedef unsigned __attribute__((__mode__(__HI__)))   uint16_t;
-typedef   signed __attribute__((__mode__(__SI__)))    int32_t;
-typedef unsigned __attribute__((__mode__(__SI__)))   uint32_t;
-typedef   signed __attribute__((__mode__(__DI__)))    int64_t;
-typedef unsigned __attribute__((__mode__(__DI__)))   uint64_t;
-
-#else
-
 typedef __INT8_TYPE__        int8_t;
 typedef __UINT8_TYPE__      uint8_t;
 typedef __INT16_TYPE__      int16_t;
@@ -28,6 +11,4 @@ typedef __UINT32_TYPE__    uint32_t;
 typedef __INT64_TYPE__      int64_t;
 typedef __UINT64_TYPE__    uint64_t;
 
-#endif
-
 #endif /* __XEN_STDINT_H__ */
diff --git a/xen/include/xen/types.h b/xen/include/xen/types.h
index 543bfb2159b1..e8d419b95412 100644
--- a/xen/include/xen/types.h
+++ b/xen/include/xen/types.h
@@ -17,6 +17,7 @@ typedef __SIZE_TYPE__ size_t;
 typedef signed long ssize_t;
 
 typedef __PTRDIFF_TYPE__ ptrdiff_t;
+typedef __UINTPTR_TYPE__ uintptr_t;
 
 /*
  * Users of this macro are expected to pass a positive value.
@@ -58,8 +59,6 @@ typedef uint32_t __be32;
 typedef uint64_t __le64;
 typedef uint64_t __be64;
 
-typedef unsigned int __attribute__((__mode__(__pointer__))) uintptr_t;
-
 #define test_and_set_bool(b)   xchg(&(b), true)
 #define test_and_clear_bool(b) xchg(&(b), false)
 
-- 
2.39.5


