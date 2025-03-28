Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8DDA74B6F
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 14:45:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930666.1333310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyA0r-000724-Bl; Fri, 28 Mar 2025 13:44:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930666.1333310; Fri, 28 Mar 2025 13:44:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyA0r-0006rH-69; Fri, 28 Mar 2025 13:44:45 +0000
Received: by outflank-mailman (input) for mailman id 930666;
 Fri, 28 Mar 2025 13:44:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IZL4=WP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tyA0p-0005Dj-3E
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 13:44:43 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ccbf01d9-0bda-11f0-9ffa-bf95429c2676;
 Fri, 28 Mar 2025 14:44:41 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4394345e4d5so14393375e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 28 Mar 2025 06:44:41 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8314f5c6sm73339085e9.40.2025.03.28.06.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 06:44:40 -0700 (PDT)
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
X-Inumbo-ID: ccbf01d9-0bda-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743169481; x=1743774281; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ttvNpcZmlBfIkEET7nitOsFbwOtCvrXrDSn+XhUAciM=;
        b=A4rudLNTJQ9ipjkNpXeEuERMiSMQnBxyVxLVKSIeOgrHJxD/PTSFKszYb+YBQcADBv
         4djEXrqOB7hEFmzvzTGjAOoPjyYnWqQkhG2TOuGrgdfPN81ko55dXSUYhLoXFjbT2Ui+
         HgMIFwdOyVbF9xgxUZAXIeKIBMPKMC9LiOQ78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743169481; x=1743774281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ttvNpcZmlBfIkEET7nitOsFbwOtCvrXrDSn+XhUAciM=;
        b=feXN7XhosrHV0KFfER6Si1WbplE+5w/aQ3A/yOru01SADOpRVVDOpT/sjUse1mOmXS
         z6IpiJE4egyTP/w9LPk8WUmlMoCQImQdUM1A9dH7gAGPGVNUrLfDJVE8OZgSZXO58aQ2
         tOOM4zXOqaJ4Sb9XVdAMUHog+Ujfl8w9DI57xEVqo7d2FPz/naUL+42JdWb1Pc39r5Vs
         Q7Rlni7bPW0PSGLgND+v5giGWxYRY+YNcI63c7klCsU8BeRxPDo+gqGkud88GxjPBhBj
         2fwnrCerSiESe/pzYLf4OSlM28VsYvyj68+U7l38RNlumf1PHyd0VKskW5ZPSkVPlGvV
         RVEw==
X-Gm-Message-State: AOJu0Yye+xmOVZtikRXBwnSqrEE9CQd6TzIvsB46KCZWlrVmdcF651Yn
	BiwqMSnqdvqZJhspqQfcCbB4ZP8M5k5JxWecdABum7B4PuZBEckpKJb1jq9XC+AR9dYOf2Y0uSq
	PLA4=
X-Gm-Gg: ASbGncuYNd49BSS9JdFT08Zh/F5d3TV6CiYAGW4G4/SkzzuO8oo0Vg5zTatiLILrxPy
	X6+Y28JgpC3VD/mI/HziJ16XSdloP6zhQsCwiOZmnlQp7cwr+G3k67RYyU5zUy6pjiPAhbmKK/0
	7D7M8EA6x4lgvbDwcgNdSUtpV1ak8FUSTrfXLz4idJsxU9kzNFI7hbb0TWJuz7Hj7PYhw+lFFDq
	sX1sx9DIkCbW0LQUwIE/ZJJh733hqlEhisxhnFEiYBPxXJlT8mwCJgyB2bfXaNnCyG7IIz4pd5G
	DplK9qjqFpus4OxOzD7IB13+stnYbfe56/tlQh/tIahzTvujpd9HlWvt2wJH+1HtKgLz2H1yoAk
	9xT/0t+s7eGApWjjwnA==
X-Google-Smtp-Source: AGHT+IHxyI3XzFh9MqhUZDwTWwDjJcgZpOYlwzU+RbIpRWqU0+t94NeoTUNuuOrBRzyA3jxcIovDNA==
X-Received: by 2002:a05:600c:1e17:b0:43c:fe15:41d4 with SMTP id 5b1f17b1804b1-43d84fd517dmr91210845e9.18.1743169480662;
        Fri, 28 Mar 2025 06:44:40 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Lin Liu <lin.liu@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v5 07/16] xen/arch: Switch to new byteorder infrastructure
Date: Fri, 28 Mar 2025 13:44:18 +0000
Message-Id: <20250328134427.874848-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250328134427.874848-1-andrew.cooper3@citrix.com>
References: <20250328134427.874848-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lin Liu <lin.liu@citrix.com>

This needs to be done in several steps, because of common vs arch issues.
Start by using the new common infastructure inside the arch infrastructure.

libelf-private.h is awkward, and the only thing in Xen using swabXX()
directly.  It needs updating at the same time.

Signed-off-by: Lin Liu <lin.liu@citrix.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
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
 * Rebase
 * Rearange from other patches to maintain bisectability
---
 xen/arch/arm/include/asm/byteorder.h   |  4 +---
 xen/arch/ppc/include/asm/byteorder.h   |  8 +-------
 xen/arch/riscv/include/asm/byteorder.h |  4 +---
 xen/arch/x86/include/asm/byteorder.h   | 25 +------------------------
 xen/common/libelf/libelf-private.h     |  6 +++---
 5 files changed, 7 insertions(+), 40 deletions(-)

diff --git a/xen/arch/arm/include/asm/byteorder.h b/xen/arch/arm/include/asm/byteorder.h
index 9c712c47884a..7f1419c45a16 100644
--- a/xen/arch/arm/include/asm/byteorder.h
+++ b/xen/arch/arm/include/asm/byteorder.h
@@ -1,9 +1,7 @@
 #ifndef __ASM_ARM_BYTEORDER_H__
 #define __ASM_ARM_BYTEORDER_H__
 
-#define __BYTEORDER_HAS_U64__
-
-#include <xen/byteorder/little_endian.h>
+#include <xen/byteorder.h>
 
 #endif /* __ASM_ARM_BYTEORDER_H__ */
 /*
diff --git a/xen/arch/ppc/include/asm/byteorder.h b/xen/arch/ppc/include/asm/byteorder.h
index 2b5f6b9f6321..8df6adbf0d7d 100644
--- a/xen/arch/ppc/include/asm/byteorder.h
+++ b/xen/arch/ppc/include/asm/byteorder.h
@@ -1,12 +1,6 @@
 #ifndef _ASM_PPC_BYTEORDER_H
 #define _ASM_PPC_BYTEORDER_H
 
-#define __arch__swab16 __builtin_bswap16
-#define __arch__swab32 __builtin_bswap32
-#define __arch__swab64 __builtin_bswap64
-
-#define __BYTEORDER_HAS_U64__
-
-#include <xen/byteorder/little_endian.h>
+#include <xen/byteorder.h>
 
 #endif /* _ASM_PPC_BYTEORDER_H */
diff --git a/xen/arch/riscv/include/asm/byteorder.h b/xen/arch/riscv/include/asm/byteorder.h
index 8ca65e1b330e..a32bca02df38 100644
--- a/xen/arch/riscv/include/asm/byteorder.h
+++ b/xen/arch/riscv/include/asm/byteorder.h
@@ -1,9 +1,7 @@
 #ifndef ASM__RISCV__BYTEORDER_H
 #define ASM__RISCV__BYTEORDER_H
 
-#define __BYTEORDER_HAS_U64__
-
-#include <xen/byteorder/little_endian.h>
+#include <xen/byteorder.h>
 
 #endif /* ASM__RISCV__BYTEORDER_H */
 /*
diff --git a/xen/arch/x86/include/asm/byteorder.h b/xen/arch/x86/include/asm/byteorder.h
index 44c240376d3a..3524a6cee741 100644
--- a/xen/arch/x86/include/asm/byteorder.h
+++ b/xen/arch/x86/include/asm/byteorder.h
@@ -1,29 +1,6 @@
 #ifndef __ASM_X86_BYTEORDER_H__
 #define __ASM_X86_BYTEORDER_H__
 
-#include <xen/types.h>
-#include <xen/compiler.h>
-
-static inline attr_const uint32_t ___arch__swab32(uint32_t x)
-{
-    asm("bswap %0" : "=r" (x) : "0" (x));
-    return x;
-}
-
-static inline attr_const uint64_t ___arch__swab64(uint64_t x)
-{ 
-    asm ( "bswap %0" : "+r" (x) );
-    return x;
-} 
-
-/* Do not define swab16.  Gcc is smart enough to recognize "C" version and
-   convert it into rotation or exhange.  */
-
-#define __arch__swab64(x) ___arch__swab64(x)
-#define __arch__swab32(x) ___arch__swab32(x)
-
-#define __BYTEORDER_HAS_U64__
-
-#include <xen/byteorder/little_endian.h>
+#include <xen/byteorder.h>
 
 #endif /* __ASM_X86_BYTEORDER_H__ */
diff --git a/xen/common/libelf/libelf-private.h b/xen/common/libelf/libelf-private.h
index 197d7a7623a3..65417dffc8a0 100644
--- a/xen/common/libelf/libelf-private.h
+++ b/xen/common/libelf/libelf-private.h
@@ -31,9 +31,9 @@
    printk(fmt, ## args )
 
 #define strtoull(str, end, base) simple_strtoull(str, end, base)
-#define bswap_16(x) swab16(x)
-#define bswap_32(x) swab32(x)
-#define bswap_64(x) swab64(x)
+#define bswap_16(x) bswap16(x)
+#define bswap_32(x) bswap32(x)
+#define bswap_64(x) bswap64(x)
 
 #else /* !__XEN__ */
 
-- 
2.39.5


