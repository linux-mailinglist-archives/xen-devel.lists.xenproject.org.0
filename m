Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E8AA8B808
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 13:59:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955726.1349421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u51QE-0000LT-IK; Wed, 16 Apr 2025 11:59:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955726.1349421; Wed, 16 Apr 2025 11:59:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u51QD-000063-V3; Wed, 16 Apr 2025 11:59:17 +0000
Received: by outflank-mailman (input) for mailman id 955726;
 Wed, 16 Apr 2025 11:59:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9TmO=XC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u51QA-0006At-J7
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 11:59:14 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37285338-1aba-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 13:59:14 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-39bf44be22fso4319763f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Apr 2025 04:59:14 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4405b5a9846sm18761905e9.35.2025.04.16.04.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 04:59:13 -0700 (PDT)
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
X-Inumbo-ID: 37285338-1aba-11f0-9eaf-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744804753; x=1745409553; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aJ5V0P88d1F7HxoaZFwruMbGQzYzPCa7L7yGSkYModM=;
        b=cHZx5n2lp2Ktb4Cq56nT3oJ5tckEHN7zN1qwJ3hgiGh+xXZElYOOleVQ8fPlAgBEUl
         /U6BV93Gw1tzoCUfZJXu0ySxpF1Y+1ReWfOJVbC/GMukmcQT7kU5F1/kJJUKEFHG+KqF
         FPPHwP629vvfIYwVtp3EV24e2lfrVX8YO4Dow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744804753; x=1745409553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aJ5V0P88d1F7HxoaZFwruMbGQzYzPCa7L7yGSkYModM=;
        b=tbTXlQkxbEGCRBm1jaoOL0Vuqt/MHogsVR/1wJNGUERLzEXjS5texMDXV3hCiLHeD6
         xKQUtyxMXzly7dE8BgRI2tBKYuxG0GhtopNEYzinSFIT7U0PL3PWrAcCGTEuS94b9oAn
         516tWvQg7hEqghHIC5YYbkTSqqWyik9TWLGjk41buLSMl1jXnuslMJx3uApVLRf5jN8j
         1U2wFlVMx+RQKp89OnXt1WSHi3sGMXGP/rbF9QO7peBABwFzfZHzWtMC1AYRjB47Qh0U
         F4zoaIUJMRucatkXySqThLQJg7aCkfys4hVZGrxdO/Dli3vREf5UsR4WnMTiEgqQr2B5
         ujhQ==
X-Gm-Message-State: AOJu0Yyz92/PwGE4wwlUMqwlF5jTYb8pUzqqvwK9EvTFWEhM73Hi6oKK
	3vqgMEQG+Ng/rsB4zTgKYoGgqbzU/r/5WZdoMwGNAuF/Le0FphFFgFkzFrTo0BId0a7BVTmEDQU
	ne+8=
X-Gm-Gg: ASbGncvwgbaiyGHNT/BdDoxb7cDXEraUopdbC+F6cA21CRRSM2HJAqzk4hJ0ln05Pn3
	8iQ7c6J0B2xt4UB/HS0hchfzX0fGtvWPPlqr9HOtoWwKaDu+m9bOIArOVm8wyeDjGGE+u3CpGLY
	oW4iqocZz5CyzRR6vBwzrEFhBRkGWiBNky5j4+He7Ox0bJEEmdm1cXUDoHLGwu1c+TXyy6BX03y
	jPT3faMjKXSUM7XzzZAtu/Y45r2anZAiRU5GXI5E2Ed5b340gmNqQrJUEIpBJxuPL0r0+sPSwf3
	PJhXyU0OHtFA/5BxilxSqOgUGB6IWJXaSeNQTxUF08OzEGcekhKtFiFQxYOpR5UTfBzLU2hLReJ
	wu0idzze3g5LI7Q==
X-Google-Smtp-Source: AGHT+IF9+/KHvB9FAAE/VaTgaEdTj1u6zaTbU7LY/Qac2HW1lWpp1QvowZK5q4BisVdQzSHEqjCMUw==
X-Received: by 2002:a05:6000:420e:b0:39e:e3ef:5cbf with SMTP id ffacd0b85a97d-39ee5b16a16mr1481144f8f.24.1744804753341;
        Wed, 16 Apr 2025 04:59:13 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Lin Liu <lin.liu@citrix.com>
Subject: [PATCH v6 11/15] xen/common: Switch {asm -> xen}/byteorder.h
Date: Wed, 16 Apr 2025 12:58:56 +0100
Message-Id: <20250416115900.2491661-12-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250416115900.2491661-1-andrew.cooper3@citrix.com>
References: <20250416115900.2491661-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Sort the includes.  Drop useless includes of xen/types.h

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
CC: Lin Liu <lin.liu@citrix.com>

v5:
 * New
---
 xen/common/bitmap.c                 | 5 ++---
 xen/common/libelf/libelf-private.h  | 3 ++-
 xen/drivers/char/ehci-dbgp.c        | 4 +++-
 xen/include/xen/bitmap.h            | 2 +-
 xen/include/xen/device_tree.h       | 3 ++-
 xen/include/xen/libfdt/libfdt_env.h | 3 +--
 xen/include/xen/unaligned.h         | 3 +--
 7 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/xen/common/bitmap.c b/xen/common/bitmap.c
index 6c4af09c18cb..bf1a7fd91e36 100644
--- a/xen/common/bitmap.c
+++ b/xen/common/bitmap.c
@@ -5,14 +5,13 @@
  * This source code is licensed under the GNU General Public License,
  * Version 2.  See the file COPYING for more details.
  */
-#include <xen/types.h>
-#include <xen/errno.h>
 #include <xen/bitmap.h>
 #include <xen/bitops.h>
+#include <xen/byteorder.h>
 #include <xen/cpumask.h>
+#include <xen/errno.h>
 #include <xen/guest_access.h>
 #include <xen/lib.h>
-#include <asm/byteorder.h>
 
 /*
  * bitmaps provide an array of bits, implemented using an an
diff --git a/xen/common/libelf/libelf-private.h b/xen/common/libelf/libelf-private.h
index 65417dffc8a0..e5c9cc109972 100644
--- a/xen/common/libelf/libelf-private.h
+++ b/xen/common/libelf/libelf-private.h
@@ -17,10 +17,11 @@
 
 #ifdef __XEN__
 
+#include <xen/byteorder.h>
 #include <xen/lib.h>
 #include <xen/libelf.h>
 #include <xen/softirq.h>
-#include <asm/byteorder.h>
+
 #include <public/elfnote.h>
 
 /* we would like to use elf->log_callback but we can't because
diff --git a/xen/drivers/char/ehci-dbgp.c b/xen/drivers/char/ehci-dbgp.c
index 1ad3c6bebf87..e9cd59b25463 100644
--- a/xen/drivers/char/ehci-dbgp.c
+++ b/xen/drivers/char/ehci-dbgp.c
@@ -5,15 +5,17 @@
  * Linux; see the Linux source for authorship and copyrights.
  */
 
+#include <xen/byteorder.h>
 #include <xen/console.h>
 #include <xen/delay.h>
 #include <xen/errno.h>
 #include <xen/param.h>
 #include <xen/pci.h>
 #include <xen/serial.h>
-#include <asm/byteorder.h>
+
 #include <asm/io.h>
 #include <asm/fixmap.h>
+
 #include <public/physdev.h>
 
 /* #define DBGP_DEBUG */
diff --git a/xen/include/xen/bitmap.h b/xen/include/xen/bitmap.h
index 4b642cd4207b..b5e9cdd3db86 100644
--- a/xen/include/xen/bitmap.h
+++ b/xen/include/xen/bitmap.h
@@ -230,7 +230,7 @@ static inline unsigned int bitmap_weight(const unsigned long *src,
 	return __bitmap_weight(src, nbits);
 }
 
-#include <asm/byteorder.h>
+#include <xen/byteorder.h>
 
 #ifdef __LITTLE_ENDIAN
 #define BITMAP_MEM_ALIGNMENT 8
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 0ff80fda04da..6dc1fb5159cd 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -10,7 +10,8 @@
 #ifndef __XEN_DEVICE_TREE_H__
 #define __XEN_DEVICE_TREE_H__
 
-#include <asm/byteorder.h>
+#include <xen/byteorder.h>
+
 #include <asm/device.h>
 #include <public/xen.h>
 #include <public/device_tree_defs.h>
diff --git a/xen/include/xen/libfdt/libfdt_env.h b/xen/include/xen/libfdt/libfdt_env.h
index 8368787391b7..04abc6bb68c6 100644
--- a/xen/include/xen/libfdt/libfdt_env.h
+++ b/xen/include/xen/libfdt/libfdt_env.h
@@ -7,9 +7,8 @@
  * Copyright 2012 Kim Phillips, Freescale Semiconductor.
  */
 
-#include <xen/types.h>
+#include <xen/byteorder.h>
 #include <xen/string.h>
-#include <asm/byteorder.h>
 
 #ifdef __CHECKER__
 #define FDT_FORCE __attribute__((force))
diff --git a/xen/include/xen/unaligned.h b/xen/include/xen/unaligned.h
index 8c8b08338b8d..e64813ab4b20 100644
--- a/xen/include/xen/unaligned.h
+++ b/xen/include/xen/unaligned.h
@@ -3,8 +3,7 @@
 #define __XEN_UNALIGNED_H__
 
 #ifdef __XEN__
-#include <xen/types.h>
-#include <asm/byteorder.h>
+#include <xen/byteorder.h>
 #endif
 
 /*
-- 
2.39.5


