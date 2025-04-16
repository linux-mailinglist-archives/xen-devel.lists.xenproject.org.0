Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CB1A8B7FD
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 13:59:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955721.1349371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u51Q8-0007NA-Km; Wed, 16 Apr 2025 11:59:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955721.1349371; Wed, 16 Apr 2025 11:59:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u51Q8-0007Ck-Ff; Wed, 16 Apr 2025 11:59:12 +0000
Received: by outflank-mailman (input) for mailman id 955721;
 Wed, 16 Apr 2025 11:59:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9TmO=XC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u51Q6-0006Ay-03
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 11:59:10 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33a33b81-1aba-11f0-9ffb-bf95429c2676;
 Wed, 16 Apr 2025 13:59:08 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-39149bccb69so6546101f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Apr 2025 04:59:08 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4405b5a9846sm18761905e9.35.2025.04.16.04.59.06
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
X-Inumbo-ID: 33a33b81-1aba-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744804747; x=1745409547; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o2XegFQnInsmfNXqMeBFji/7yyCuSkRmN52heLn+Rqs=;
        b=JrXB50+lYqhBGxBSw36JiDoj8nz4W5rSB2pk90QC3raJYHrQS7dV630oWhfm77tZNl
         zVCsrG40okgTXDcXZxouo/NQKZi7RZbsHfMsSVh18qyRkvXW50vo+xSzt95UI00qrx6f
         hXKdQDs9q2tS/LWIhDTXZiyaOBxB432N0Fhv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744804747; x=1745409547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o2XegFQnInsmfNXqMeBFji/7yyCuSkRmN52heLn+Rqs=;
        b=vLejQO8TC7HMESzgLHdnOt1tOsd0BpzIxBkmG1VsfmU/aR4ukKRj8SYU0gZJuqSoJh
         PsaS5tbALvDB7LxQnthkw/CtN6jg1OAWVx5xl5gnUXErv4/HuPTrjhZkr3KpD09G8jz+
         OZDPTJfeo2tIRG7pMANr/VNp8MjKYsNb2xvtTjrC2mZeXc4EjGaKGGEKY4BPK/3Ugu8p
         qHEXze0LzTgnqTU1MtJ6ot5ixF9kbkpoNrWa9+54HkriWPsn5I3xjimQrzv9tA4rLCL4
         ikxdGc6UUs8N2jlcxvMYEENBYJ4wHuet7g6aEFvqpuzvYkc2GE7k2E5o+EQw7bQTc2iF
         YaRA==
X-Gm-Message-State: AOJu0YyhHqWUQyDl4unjodrmstmmGXPGqw2wvrlBSirEZ6f3nvGE78+I
	b2VTM7th9yrJnW2NZOPg6cnwctZRnEUBYu8y939B4ayFokbBPffnUXjT3VPpQTDBZCnfgmFaLue
	OL7Y=
X-Gm-Gg: ASbGncsjpoOAJ55D/qDg9Suv42Fp3NRJ8B9km0BHReoFBD+OltwCgJ2j7UO5Hq4gAtS
	aB0T1ae4+r1yvOkvz+bOZs39ONaNNUxsquTQwfXfQh7oD/Ut6WdxYXA3lbAQnAV/IawdFE8iHml
	4Qzg86tAqm9bI28bnUMMuU7SNnRkQ28KDhaHUDBKuVj3yxGvZjcUdcY3Mcw0eSH7FoziDLSBRvV
	SeaTlbn7vtf+YhhKrypuIfW68P0x5Q0FE8Uh44WNHxXhfxw8KNvZgP5u3WFny/bH5S3390oNolc
	y5Ci4lMcqYsE2ovctOhuvD1Skxc205XQbzPnb3yc5WcleSILe1V3Sp8/utlzGqTlCoicCa5Biu7
	kNs8v6AkRGLDvqUalld4FLuaF
X-Google-Smtp-Source: AGHT+IFnpWMeUKpKAYDo8WHZK3az+S0rAtQDGZTNX+eCfLoukZHNePftojb/WNxXpv12ovIM+CpgSA==
X-Received: by 2002:a5d:64ef:0:b0:39c:12ce:67d with SMTP id ffacd0b85a97d-39ee5b0fee4mr1485921f8f.9.1744804747473;
        Wed, 16 Apr 2025 04:59:07 -0700 (PDT)
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
Subject: [PATCH v6 05/15] xen/decompressors: Remove use of *_to_cpup() helpers
Date: Wed, 16 Apr 2025 12:58:50 +0100
Message-Id: <20250416115900.2491661-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250416115900.2491661-1-andrew.cooper3@citrix.com>
References: <20250416115900.2491661-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lin Liu <lin.liu@citrix.com>

These wrappers simply hide a deference, which adds to the cognitive complexity
of reading the code.  As such, they're not going to be included in the new
byteswap infrastructure.

No functional change.

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

v6:
 * Fix lz4 and lzo1x too.

v5:
 * Rebase
 * Rearranged from other patches
---
 tools/libs/guest/xg_dom_decompress_lz4.c          | 10 ++++++++--
 tools/libs/guest/xg_dom_decompress_unsafe_lzo1x.c | 14 ++++----------
 tools/libs/guest/xg_dom_decompress_unsafe_xz.c    | 13 +++++++------
 xen/common/lz4/defs.h                             |  6 +++++-
 xen/common/unlzo.c                                | 12 ++++++++++--
 xen/common/xz/private.h                           | 12 +++++++++---
 6 files changed, 43 insertions(+), 24 deletions(-)

diff --git a/tools/libs/guest/xg_dom_decompress_lz4.c b/tools/libs/guest/xg_dom_decompress_lz4.c
index b26cce3ec532..53ef0bf328ed 100644
--- a/tools/libs/guest/xg_dom_decompress_lz4.c
+++ b/tools/libs/guest/xg_dom_decompress_lz4.c
@@ -3,6 +3,8 @@
 #include <inttypes.h>
 #include <stdint.h>
 
+#include INCLUDE_ENDIAN_H
+
 #define XG_NEED_UNALIGNED
 #include "xg_private.h"
 #include "xg_dom_decompress.h"
@@ -17,9 +19,13 @@ typedef uint64_t u64;
 #define likely(a) a
 #define unlikely(a) a
 
-static inline uint_fast16_t le16_to_cpup(const unsigned char *buf)
+static inline uint16_t le16_to_cpu(uint16_t v)
 {
-    return buf[0] | (buf[1] << 8);
+#if BYTE_ORDER == BIG_ENDIAN
+    return __builtin_bswap16(v);
+#else
+    return v;
+#endif
 }
 
 #include "../../xen/include/xen/lz4.h"
diff --git a/tools/libs/guest/xg_dom_decompress_unsafe_lzo1x.c b/tools/libs/guest/xg_dom_decompress_unsafe_lzo1x.c
index e58c1b95ed17..3f6b133ccf9d 100644
--- a/tools/libs/guest/xg_dom_decompress_unsafe_lzo1x.c
+++ b/tools/libs/guest/xg_dom_decompress_unsafe_lzo1x.c
@@ -16,25 +16,19 @@ typedef uint64_t u64;
 #define noinline
 #define unlikely(a) a
 
-static inline u16 be16_to_cpup(const u16 *p)
+static inline u16 be16_to_cpu(const u16 v)
 {
-	u16 v = *p;
 #if BYTE_ORDER == LITTLE_ENDIAN
-	return (((v & 0x00ffU) << 8) |
-                ((v & 0xff00U) >> 8));
+	return __builtin_bswap16(v);
 #else
 	return v;
 #endif
 }
 
-static inline u32 be32_to_cpup(const u32 *p)
+static inline u32 be32_to_cpup(const u32 v)
 {
-	u32 v = *p;
 #if BYTE_ORDER == LITTLE_ENDIAN
-	return (((v & 0x000000ffUL) << 24) |
-                ((v & 0x0000ff00UL) <<  8) |
-                ((v & 0x00ff0000UL) >>  8) |
-                ((v & 0xff000000UL) >> 24));
+	return __builtin_bswap32(v);
 #else
 	return v;
 #endif
diff --git a/tools/libs/guest/xg_dom_decompress_unsafe_xz.c b/tools/libs/guest/xg_dom_decompress_unsafe_xz.c
index 80eed912dd68..7dbd2622c3b8 100644
--- a/tools/libs/guest/xg_dom_decompress_unsafe_xz.c
+++ b/tools/libs/guest/xg_dom_decompress_unsafe_xz.c
@@ -19,18 +19,19 @@ typedef uint32_t __le32;
 static inline u32 cpu_to_le32(const u32 v)
 {
 #if BYTE_ORDER == BIG_ENDIAN
-	return (((v & 0x000000ffUL) << 24) |
-	        ((v & 0x0000ff00UL) <<  8) |
-	        ((v & 0x00ff0000UL) >>  8) |
-	        ((v & 0xff000000UL) >> 24));
+        return __builtin_bswap32(v);
 #else
 	return v;
 #endif
 }
 
-static inline u32 le32_to_cpup(const u32 *p)
+static inline u32 le32_to_cpu(const u32 p)
 {
-	return cpu_to_le32(*p);
+#if BYTE_ORDER == BIG_ENDIAN
+        return __builtin_bswap32(v);
+#else
+	return v;
+#endif
 }
 
 #define __force
diff --git a/xen/common/lz4/defs.h b/xen/common/lz4/defs.h
index ecfbf07f8323..e477806634c1 100644
--- a/xen/common/lz4/defs.h
+++ b/xen/common/lz4/defs.h
@@ -18,7 +18,11 @@
 
 static inline u16 get_unaligned_le16(const void *p)
 {
-	return le16_to_cpup(p);
+	u16 v;
+
+	memcpy(&v, p, sizeof(v));
+
+	return le16_to_cpu(v);
 }
 
 #endif
diff --git a/xen/common/unlzo.c b/xen/common/unlzo.c
index acb8dff600fc..17efb1cc8f1d 100644
--- a/xen/common/unlzo.c
+++ b/xen/common/unlzo.c
@@ -39,12 +39,20 @@
 
 static inline u16 get_unaligned_be16(const void *p)
 {
-	return be16_to_cpup(p);
+	u16 v;
+
+	memcpy(&v, p, sizeof(v));
+
+	return be16_to_cpu(v);
 }
 
 static inline u32 get_unaligned_be32(const void *p)
 {
-	return be32_to_cpup(p);
+	u32 v;
+
+	memcpy(&v, p, sizeof(v));
+
+	return be32_to_cpu(v);
 }
 
 #endif
diff --git a/xen/common/xz/private.h b/xen/common/xz/private.h
index 2299705378ac..a63379994fd6 100644
--- a/xen/common/xz/private.h
+++ b/xen/common/xz/private.h
@@ -18,17 +18,23 @@
 
 static inline u32 get_unaligned_le32(const void *p)
 {
-	return le32_to_cpup(p);
+	u32 v;
+
+	memcpy(&v, p, sizeof(v));
+
+	return le32_to_cpu(v);
 }
 
 static inline void put_unaligned_le32(u32 val, void *p)
 {
-	*(__force __le32*)p = cpu_to_le32(val);
+	u32 v = cpu_to_le32(val);
+
+	memcpy(p, &v, sizeof(v));
 }
 
 #endif
 
-#define get_le32(p) le32_to_cpup((const uint32_t *)(p))
+#define get_le32(p) le32_to_cpu(*(const uint32_t *)(p))
 
 #define false 0
 #define true 1
-- 
2.39.5


