Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C8DA8B806
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 13:59:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955720.1349364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u51Q8-0007CJ-5R; Wed, 16 Apr 2025 11:59:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955720.1349364; Wed, 16 Apr 2025 11:59:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u51Q7-00078t-RY; Wed, 16 Apr 2025 11:59:11 +0000
Received: by outflank-mailman (input) for mailman id 955720;
 Wed, 16 Apr 2025 11:59:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9TmO=XC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u51Q5-0006At-GP
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 11:59:09 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 343109fa-1aba-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 13:59:09 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43cfe63c592so72078725e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Apr 2025 04:59:09 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4405b5a9846sm18761905e9.35.2025.04.16.04.59.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 04:59:07 -0700 (PDT)
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
X-Inumbo-ID: 343109fa-1aba-11f0-9eaf-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744804748; x=1745409548; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1daQrbWI9UKwuEhY3SZBXcJke4ogYtrZfiRlr7lZLK8=;
        b=QB1m3j6aJ0qa30+P6+dyHHCNS8MMeJvmIRD0OzSt3C3KMjRCDmqmL4QWbPFRntR1vK
         XZVoihQj/yUYZT9O78kfFKeJGbkGRdYkefwKp53AOPA5StPkZS3XRy3IxPulCU0H80Jd
         O3lwpdykuKBD9vNs8bOP+RTxa3+V3izGK7zhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744804748; x=1745409548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1daQrbWI9UKwuEhY3SZBXcJke4ogYtrZfiRlr7lZLK8=;
        b=DE7v0aITNHUM9DSVdjexNnlOaScaYWDyo4vYEjuyMIQjRfRvGWCEH3gEXnPp2KN/lE
         /1dmWnZHrJPWr/toMdsA3nj+BK+g1jE0iH3kAsf/RTeZmFEIHO34S7FwdotBZLz51HRN
         /nZUjdxukcovCvOk+72UPmcgfc1cY8pn13iM0ibFscNjHRvWO8CJX5H4r+N9bQ+EVOff
         Qv9pAZIncK8YUKOszc4vRCo/aEfrCoyzSiLa8t9Y0BY8GsoFUHYIvwa1FYiyz62vn0+6
         USRd9fFLB5ge5giOYYcRVdidLON5jLbXWUk6fX5WI8iUyjlb2dm7XBWGIkutVS1aWRzD
         K9uA==
X-Gm-Message-State: AOJu0YwnrU9PKvkfacbBWSfBG+IOHMV1YZHaWL0STAxkLx9AWTfP4l21
	ye5v7smUpIemKMo1VPQn7qO5Ywl7iM9FnTUnk6lMUdoviTr/Yhi0NPCodcGaoA4RV8TRVuh3tBm
	MpkA=
X-Gm-Gg: ASbGncujSKvuBKa3QlU0p8cJ/hJV3JnO+dH735QafY+o7uSgDoe3PoJyEgBZLmip7FP
	sYvANKAU3sX3uk0UljJtaaD2055u3oaQuYyj7deS/5GjBXBL9s3tX49YShK0JyU47dyaoFtO3kV
	5RtZtnLfvsPPglJ2THvNY8WrStDonTWirEufS08y6mMxyoDWT9Oey+Qfrh4tCtKz+TyyTdw7egL
	QGcrgNPvuEu0VGFkQJBmOPrrOFvayns8ShvTBSqi4KZHuwWR9KaiJOKjNzdG5NijjsX9PtTfOj+
	ebyBd0/TL87ubjd6AGQ6PFIukTam5FAAr/5u/3WUD7y7SYD/zxzKG5PY+xD7cq/8CKuWV5REwK6
	xRwtRUlADiWGttg==
X-Google-Smtp-Source: AGHT+IFgpfcqBIvlugUUmrvz/YH5fAtZyyY+frKoounRJDMbxOfMjexVXjUUxjtZ+ntbvBpdiGHb+A==
X-Received: by 2002:a05:600c:1c1c:b0:43d:82c:2b23 with SMTP id 5b1f17b1804b1-4405d6ad1a1mr14089215e9.23.1744804748260;
        Wed, 16 Apr 2025 04:59:08 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Lin Liu <lin.liu@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
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
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v6 06/15] xen/arch: Switch to new byteorder infrastructure
Date: Wed, 16 Apr 2025 12:58:51 +0100
Message-Id: <20250416115900.2491661-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250416115900.2491661-1-andrew.cooper3@citrix.com>
References: <20250416115900.2491661-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lin Liu <lin.liu@citrix.com>

This needs to be done in several steps, because of common vs arch issues.
Start by using the new common infastructure inside the arch infrastructure.

libelf-private.h is awkward, and the only thing in Xen using swab??()
directly.  It needs updating at the same time.

Signed-off-by: Lin Liu <lin.liu@citrix.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
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


