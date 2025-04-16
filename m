Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EC7A8B805
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 13:59:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955716.1349325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u51Q4-0006ML-Nc; Wed, 16 Apr 2025 11:59:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955716.1349325; Wed, 16 Apr 2025 11:59:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u51Q4-0006HK-Jn; Wed, 16 Apr 2025 11:59:08 +0000
Received: by outflank-mailman (input) for mailman id 955716;
 Wed, 16 Apr 2025 11:59:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9TmO=XC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u51Q3-0006Ay-AA
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 11:59:07 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3195a0a3-1aba-11f0-9ffb-bf95429c2676;
 Wed, 16 Apr 2025 13:59:04 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43ed8d32a95so56373815e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Apr 2025 04:59:04 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4405b5a9846sm18761905e9.35.2025.04.16.04.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 04:59:03 -0700 (PDT)
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
X-Inumbo-ID: 3195a0a3-1aba-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744804744; x=1745409544; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LrR2qFw2RhoT1ioWjoOtSsI3tc2/ebxvB/CbMCw2zPk=;
        b=lY19Pb/QkMau1TtctWTGLyJuH0OpsIxrf5XbahmkBta3oNOzELCGVNJN2dO3CIZFNl
         h7PSzkGAuefcN0iWthKb59jgYdqatahk8zxpf8kGemK4EVYDP9qtIXqmE1og3Iyh6z+s
         87+0zrW3PEYZ0LHmiwhCy7nUIuSVC3X8wSUws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744804744; x=1745409544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LrR2qFw2RhoT1ioWjoOtSsI3tc2/ebxvB/CbMCw2zPk=;
        b=Dgz6bfWmgeFLqujwndD8oCDAoi0uDZIyPzQCDXrjIJ372DGMrLKwA2ku+jX3IWNPXD
         iR3yZQ2llwMZPhFrhg2a8C4fjB3/ZLw/cMAfVd3WNKarWjPvQmJeLIIdyR0UfrpoPivZ
         3HJRBuHoE6Q3+fWPVqlMFZDZuo2X5E4/h88BwFTfEDcBPHzZHIzrUbLDNg6KqFo/3fjK
         7RdaswK2lNblG/EvVMHWsS1GRwZeu1y5+KloX2s49IxWP8SQsPpr4k7M8bFxwz/ZaJzN
         lPW34Rl/TlVY7Xk54h4wqhEdudbteQSTdqhoMs1pScuUUb64TbooIvSqe7fsvRLrvx3Q
         ybLg==
X-Gm-Message-State: AOJu0YyGRZAbBca7aPV+MazhYquDFwGSJMPBt2I+42kKo0MlfbDMQzKf
	kwApO+sHpvwjrO/KqsoPNVd4qUKUa3xkUtGthriDxBsmiATc3u2K6wTw/4o0o/KVJ55+QaSHqzG
	pF54=
X-Gm-Gg: ASbGnctiDhi2gXyE4jyIdfSItG9Jh7ssyAlwhhcEKRoHzHpMyfK0+6CN5ZQLEfmGfoj
	54MHmRX3/6d37dO7H0FOcKNxv4E650LYOXK7V5U0US+mjimRw0kJf9o1pUA2NQJDT1gDimuKRRg
	+w4Ftiy3Q11UlNbIniVhEgNaoluE+Wjj9dtK7khdkOnfELI1BFKAi6Bklqm04+MYQQu7DITVsDV
	DM0xErcZPlS21aw7ay+lIgPzsy6Rmyqwnxb2WgIDakDySTwFkhBmzHeN8AeGYxxBl28CVVT3Sep
	Ww/yx2MTw9+GPesT6ibBRhR23uzXrLwunTJ6UQiBgqvYQJ8yrV/w7vQcHgx0WaQvJ2pPuxO/A3D
	wVvQxjz5Z3ZkOVg==
X-Google-Smtp-Source: AGHT+IEgmpj4c+9t4rzrKeUZP9r3Zsv7CNOYMl3PyaY7qkbB+/Oe06vxRPeZ7j85uQVqCPnFx5sCBw==
X-Received: by 2002:a05:600c:811b:b0:43d:ed:ad07 with SMTP id 5b1f17b1804b1-4405d6cc339mr13999945e9.29.1744804743959;
        Wed, 16 Apr 2025 04:59:03 -0700 (PDT)
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
Subject: [PATCH v6 01/15] xen: Implement common byte{order,swap}.h
Date: Wed, 16 Apr 2025 12:58:46 +0100
Message-Id: <20250416115900.2491661-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250416115900.2491661-1-andrew.cooper3@citrix.com>
References: <20250416115900.2491661-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lin Liu <lin.liu@citrix.com>

The current swab??() infrastructure is unecesserily complicated, and can be
replaced entirely with compiler builtins.

All supported compilers provide __BYTE_ORDER__ and __builtin_bswap??().

Nothing in Xen cares about the values of __{BIG,LITTLE}_ENDIAN; just that one
of them is defined.  Therefore, centralise their definitions in xen/config.h

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

v6:
 * Fix typos
 * Retain __{BIG,LITTLE}_ENDIAN_BITFIELDS and set them in common logic.
 * Extra brackets for the non-transformed case.

v5:
 * Rebase substantially
 * Drop PASTE().  It doesn't work when BITS_PER_LONG isn't a plain integer
 * Simplify in light of new toolchain baseline
---
 xen/include/xen/byteorder.h               | 44 +++++++++++++++++++++++
 xen/include/xen/byteorder/big_endian.h    |  7 ----
 xen/include/xen/byteorder/little_endian.h |  7 ----
 xen/include/xen/byteswap.h                | 15 ++++++++
 xen/include/xen/config.h                  |  8 +++++
 5 files changed, 67 insertions(+), 14 deletions(-)
 create mode 100644 xen/include/xen/byteorder.h
 create mode 100644 xen/include/xen/byteswap.h

diff --git a/xen/include/xen/byteorder.h b/xen/include/xen/byteorder.h
new file mode 100644
index 000000000000..2b9b97044478
--- /dev/null
+++ b/xen/include/xen/byteorder.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef XEN_BYTEORDER_H
+#define XEN_BYTEORDER_H
+
+#include <xen/byteswap.h>
+#include <xen/stdint.h>
+
+#if defined(__LITTLE_ENDIAN)
+
+# define cpu_to_le64(x) ((uint64_t)(x))
+# define le64_to_cpu(x) ((uint64_t)(x))
+# define cpu_to_le32(x) ((uint32_t)(x))
+# define le32_to_cpu(x) ((uint32_t)(x))
+# define cpu_to_le16(x) ((uint16_t)(x))
+# define le16_to_cpu(x) ((uint16_t)(x))
+
+# define cpu_to_be64(x) bswap64(x)
+# define be64_to_cpu(x) bswap64(x)
+# define cpu_to_be32(x) bswap32(x)
+# define be32_to_cpu(x) bswap32(x)
+# define cpu_to_be16(x) bswap16(x)
+# define be16_to_cpu(x) bswap16(x)
+
+#elif defined(__BIG_ENDIAN)
+
+# define cpu_to_le64(x) bswap64(x)
+# define le64_to_cpu(x) bswap64(x)
+# define cpu_to_le32(x) bswap32(x)
+# define le32_to_cpu(x) bswap32(x)
+# define cpu_to_le16(x) bswap16(x)
+# define le16_to_cpu(x) bswap16(x)
+
+# define cpu_to_be64(x) ((uint64_t)(x))
+# define be64_to_cpu(x) ((uint64_t)(x))
+# define cpu_to_be32(x) ((uint32_t)(x))
+# define be32_to_cpu(x) ((uint32_t)(x))
+# define cpu_to_be16(x) ((uint16_t)(x))
+# define be16_to_cpu(x) ((uint16_t)(x))
+
+#else
+# error Unknown Endianness
+#endif /* __*_ENDIAN */
+
+#endif /* XEN_BYTEORDER_H */
diff --git a/xen/include/xen/byteorder/big_endian.h b/xen/include/xen/byteorder/big_endian.h
index ce395a17f64b..512291c76f1b 100644
--- a/xen/include/xen/byteorder/big_endian.h
+++ b/xen/include/xen/byteorder/big_endian.h
@@ -1,13 +1,6 @@
 #ifndef __XEN_BYTEORDER_BIG_ENDIAN_H__
 #define __XEN_BYTEORDER_BIG_ENDIAN_H__
 
-#ifndef __BIG_ENDIAN
-#define __BIG_ENDIAN 4321
-#endif
-#ifndef __BIG_ENDIAN_BITFIELD
-#define __BIG_ENDIAN_BITFIELD
-#endif
-
 #include <xen/types.h>
 #include <xen/byteorder/swab.h>
 
diff --git a/xen/include/xen/byteorder/little_endian.h b/xen/include/xen/byteorder/little_endian.h
index 8b118afba5e3..bd1afc6a67c3 100644
--- a/xen/include/xen/byteorder/little_endian.h
+++ b/xen/include/xen/byteorder/little_endian.h
@@ -1,13 +1,6 @@
 #ifndef __XEN_BYTEORDER_LITTLE_ENDIAN_H__
 #define __XEN_BYTEORDER_LITTLE_ENDIAN_H__
 
-#ifndef __LITTLE_ENDIAN
-#define __LITTLE_ENDIAN 1234
-#endif
-#ifndef __LITTLE_ENDIAN_BITFIELD
-#define __LITTLE_ENDIAN_BITFIELD
-#endif
-
 #include <xen/types.h>
 #include <xen/byteorder/swab.h>
 
diff --git a/xen/include/xen/byteswap.h b/xen/include/xen/byteswap.h
new file mode 100644
index 000000000000..46d93f88eac9
--- /dev/null
+++ b/xen/include/xen/byteswap.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef XEN_BYTESWAP_H
+#define XEN_BYTESWAP_H
+
+#define bswap16(x) __builtin_bswap16(x)
+#define bswap32(x) __builtin_bswap32(x)
+#define bswap64(x) __builtin_bswap64(x)
+
+#if BITS_PER_LONG == 64
+# define bswapl(x) bswap64(x)
+#elif BITS_PER_LONG == 32
+# define bswapl(x) bswap32(x)
+#endif
+
+#endif /* XEN_BYTESWAP_H */
diff --git a/xen/include/xen/config.h b/xen/include/xen/config.h
index 7d43159efb56..1d7195066c08 100644
--- a/xen/include/xen/config.h
+++ b/xen/include/xen/config.h
@@ -108,4 +108,12 @@
 /* It is assumed that sizeof(void *) == __alignof(void *) */
 #define POINTER_ALIGN   __SIZEOF_POINTER__
 
+#if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
+# define __LITTLE_ENDIAN
+# define __LITTLE_ENDIAN_BITFIELD
+#elif __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
+# define __BIG_ENDIAN
+# define __BIG_ENDIAN_BITFIELD
+#endif
+
 #endif /* __XEN_CONFIG_H__ */

base-commit: 7f8c2dd829358406dc9e50d5e386e4d2b20b4303
-- 
2.39.5


