Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE15A74B6D
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 14:45:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930667.1333317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyA0r-00076U-Vh; Fri, 28 Mar 2025 13:44:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930667.1333317; Fri, 28 Mar 2025 13:44:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyA0r-00071m-HQ; Fri, 28 Mar 2025 13:44:45 +0000
Received: by outflank-mailman (input) for mailman id 930667;
 Fri, 28 Mar 2025 13:44:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IZL4=WP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tyA0p-0005Dp-Rk
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 13:44:43 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cde74abc-0bda-11f0-9ea3-5ba50f476ded;
 Fri, 28 Mar 2025 14:44:43 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43ce70f9afbso21882795e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 28 Mar 2025 06:44:43 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8314f5c6sm73339085e9.40.2025.03.28.06.44.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 06:44:42 -0700 (PDT)
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
X-Inumbo-ID: cde74abc-0bda-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743169483; x=1743774283; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wnf/Nwp4shj5EFcPhUHIkrw4QnU6FSi2i7Zr/xIuM0A=;
        b=lMkCy5uU52m6Nkb9/AOxZXYQWO+U/njjgyb3D7V81+FWrs/ie9M7ERwdp4bHvKi/iH
         tT37DlPfibMJ0bbyJxoMaDoDUc0p7pbrUf0uJzotjAUH5uyqQr4T/CQxZsKsoaqS4fX+
         8TLQEGIVxM3MyvEL3WMOgbzX/qJ4mZ078K9m0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743169483; x=1743774283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wnf/Nwp4shj5EFcPhUHIkrw4QnU6FSi2i7Zr/xIuM0A=;
        b=vmRJUZJ9GmdkeLMqR+sr1/IhMGZ0NrRqvqQFIEVsLeRZRU7u5Jt3YCJHR+V1OylPIL
         xdKTL+OyRANex+GR9ghxBLd5TWYL8d9GydOO/CfQ9/J6d5q/cwX7lqDb4dYRWYHqRkKd
         CnqwuAuJVxDBHb6bfmZKGrov7TJDja1NwU8PwZK+IH9+YROjgiFt6tlyDaS0rgz+z1jO
         rJiFndiNc32iSlfD83pj1DPdbWCGqZ60wSXDbkuytf5o/icyb7FfB90w4NiNmIzW3lcn
         UkeXnSyIHsMRURB5jgcJV/irDItLbjXiBUxEKN64y5/C8NJl4qnU6+gDBErQq8/5YI36
         l/LQ==
X-Gm-Message-State: AOJu0Ywzop/g3sb/jSnNsIgDs0gK/P2Ul3SNa7i1i8lgkGVEoKKzzsWO
	l8SVJxNow1lmhmQj6BKJc4PPayc4eMwwzsx9ZBLxdqGFo1EhTItpqzDUDDkgj70ubvOjuc9kZGy
	NpHo=
X-Gm-Gg: ASbGncu3OrdPw0/198YZF+QPUaxEITCRSh6ol80U/PaVADIbLbGAH/HAjrg2jxj0wwY
	dqKkOnkv2Op3pjhGq7lb3VdnDOp8CnrmcPd05VCEWl3gRG2TJInEsMQDVO0GmJ8ZNIOQm5Ybe4d
	5IVGFMYqbK7un4aPjvM1jJ9jgbraCh54KbXk15ajGOk2KnaVHjIqRtWNmUSPXRGzVU0Z54Z69IZ
	iu6RFsxKpfc8iF5+9sS/ohWSn1u2fMz/S+mjltkX6Ky/u1/Ez4PpPAE12Iq887ZJy6DZFcS/h0s
	iTQnaTDXPcw3tpNp/DcD6qXQ3mvAeMyhm3A+6unoK8jaqe43u1dTrHLPy75ntv0mOlsU/pVMIsz
	C5S1rVZ+pIiv54EGgvw==
X-Google-Smtp-Source: AGHT+IHmmDmZC96ovPd8t2DNUfGnrEAgRE5PI4GTCYcZLnA5alpYNJaPmKyjWDdrQ4ZWUaMpbRimRg==
X-Received: by 2002:a05:600c:1f0c:b0:43c:fbbf:7bf1 with SMTP id 5b1f17b1804b1-43d8509c1b4mr78706855e9.30.1743169482556;
        Fri, 28 Mar 2025 06:44:42 -0700 (PDT)
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
Subject: [PATCH v5 09/16] xen: Remove old byteorder infrastructure
Date: Fri, 28 Mar 2025 13:44:20 +0000
Message-Id: <20250328134427.874848-10-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250328134427.874848-1-andrew.cooper3@citrix.com>
References: <20250328134427.874848-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lin Liu <lin.liu@citrix.com>

It is no longer used.

Signed-off-by: Lin Liu <lin.liu@citrix.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
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
---
 xen/include/xen/byteorder/big_endian.h    |  95 ------------
 xen/include/xen/byteorder/generic.h       |  68 --------
 xen/include/xen/byteorder/little_endian.h |  95 ------------
 xen/include/xen/byteorder/swab.h          | 179 ----------------------
 4 files changed, 437 deletions(-)
 delete mode 100644 xen/include/xen/byteorder/big_endian.h
 delete mode 100644 xen/include/xen/byteorder/generic.h
 delete mode 100644 xen/include/xen/byteorder/little_endian.h
 delete mode 100644 xen/include/xen/byteorder/swab.h

diff --git a/xen/include/xen/byteorder/big_endian.h b/xen/include/xen/byteorder/big_endian.h
deleted file mode 100644
index 512291c76f1b..000000000000
--- a/xen/include/xen/byteorder/big_endian.h
+++ /dev/null
@@ -1,95 +0,0 @@
-#ifndef __XEN_BYTEORDER_BIG_ENDIAN_H__
-#define __XEN_BYTEORDER_BIG_ENDIAN_H__
-
-#include <xen/types.h>
-#include <xen/byteorder/swab.h>
-
-#define __constant_cpu_to_le64(x) ((__force __le64)___constant_swab64((x)))
-#define __constant_le64_to_cpu(x) ___constant_swab64((__force uint64_t)(__le64)(x))
-#define __constant_cpu_to_le32(x) ((__force __le32)___constant_swab32((x)))
-#define __constant_le32_to_cpu(x) ___constant_swab32((__force uint32_t)(__le32)(x))
-#define __constant_cpu_to_le16(x) ((__force __le16)___constant_swab16((x)))
-#define __constant_le16_to_cpu(x) ___constant_swab16((__force uint16_t)(__le16)(x))
-#define __constant_cpu_to_be64(x) ((__force __be64)(uint64_t)(x))
-#define __constant_be64_to_cpu(x) ((__force uint64_t)(__be64)(x))
-#define __constant_cpu_to_be32(x) ((__force __be32)(uint32_t)(x))
-#define __constant_be32_to_cpu(x) ((__force uint32_t)(__be32)(x))
-#define __constant_cpu_to_be16(x) ((__force __be16)(uint16_t)(x))
-#define __constant_be16_to_cpu(x) ((__force uint16_t)(__be16)(x))
-#define __cpu_to_le64(x) ((__force __le64)__swab64((x)))
-#define __le64_to_cpu(x) __swab64((__force uint64_t)(__le64)(x))
-#define __cpu_to_le32(x) ((__force __le32)__swab32((x)))
-#define __le32_to_cpu(x) __swab32((__force uint32_t)(__le32)(x))
-#define __cpu_to_le16(x) ((__force __le16)__swab16((x)))
-#define __le16_to_cpu(x) __swab16((__force uint16_t)(__le16)(x))
-#define __cpu_to_be64(x) ((__force __be64)(uint64_t)(x))
-#define __be64_to_cpu(x) ((__force uint64_t)(__be64)(x))
-#define __cpu_to_be32(x) ((__force __be32)(uint32_t)(x))
-#define __be32_to_cpu(x) ((__force uint32_t)(__be32)(x))
-#define __cpu_to_be16(x) ((__force __be16)(uint16_t)(x))
-#define __be16_to_cpu(x) ((__force uint16_t)(__be16)(x))
-
-static inline __le64 __cpu_to_le64p(const uint64_t *p)
-{
-    return (__force __le64)__swab64p(p);
-}
-static inline uint64_t __le64_to_cpup(const __le64 *p)
-{
-    return __swab64p((const uint64_t *)p);
-}
-static inline __le32 __cpu_to_le32p(const uint32_t *p)
-{
-    return (__force __le32)__swab32p(p);
-}
-static inline uint32_t __le32_to_cpup(const __le32 *p)
-{
-    return __swab32p((const uint32_t *)p);
-}
-static inline __le16 __cpu_to_le16p(const uint16_t *p)
-{
-    return (__force __le16)__swab16p(p);
-}
-static inline uint16_t __le16_to_cpup(const __le16 *p)
-{
-    return __swab16p((const uint16_t *)p);
-}
-static inline __be64 __cpu_to_be64p(const uint64_t *p)
-{
-    return (__force __be64)*p;
-}
-static inline uint64_t __be64_to_cpup(const __be64 *p)
-{
-    return (__force uint64_t)*p;
-}
-static inline __be32 __cpu_to_be32p(const uint32_t *p)
-{
-    return (__force __be32)*p;
-}
-static inline uint32_t __be32_to_cpup(const __be32 *p)
-{
-    return (__force uint32_t)*p;
-}
-static inline __be16 __cpu_to_be16p(const uint16_t *p)
-{
-    return (__force __be16)*p;
-}
-static inline uint16_t __be16_to_cpup(const __be16 *p)
-{
-    return (__force uint16_t)*p;
-}
-#define __cpu_to_le64s(x) __swab64s((x))
-#define __le64_to_cpus(x) __swab64s((x))
-#define __cpu_to_le32s(x) __swab32s((x))
-#define __le32_to_cpus(x) __swab32s((x))
-#define __cpu_to_le16s(x) __swab16s((x))
-#define __le16_to_cpus(x) __swab16s((x))
-#define __cpu_to_be64s(x) do {} while (0)
-#define __be64_to_cpus(x) do {} while (0)
-#define __cpu_to_be32s(x) do {} while (0)
-#define __be32_to_cpus(x) do {} while (0)
-#define __cpu_to_be16s(x) do {} while (0)
-#define __be16_to_cpus(x) do {} while (0)
-
-#include <xen/byteorder/generic.h>
-
-#endif /* __XEN_BYTEORDER_BIG_ENDIAN_H__ */
diff --git a/xen/include/xen/byteorder/generic.h b/xen/include/xen/byteorder/generic.h
deleted file mode 100644
index 8a0006b75594..000000000000
--- a/xen/include/xen/byteorder/generic.h
+++ /dev/null
@@ -1,68 +0,0 @@
-#ifndef __XEN_BYTEORDER_GENERIC_H__
-#define __XEN_BYTEORDER_GENERIC_H__
-
-/*
- * Generic Byte-reordering support
- *
- * The "... p" macros, like le64_to_cpup, can be used with pointers
- * to unaligned data, but there will be a performance penalty on 
- * some architectures.  Use get_unaligned for unaligned data.
- *
- * The following macros are to be defined by <asm/byteorder.h>:
- *
- * Conversion of XX-bit integers (16- 32- or 64-)
- * between native CPU format and little/big endian format
- * 64-bit stuff only defined for proper architectures
- *     cpu_to_[bl]eXX(__uXX x)
- *     [bl]eXX_to_cpu(__uXX x)
- *
- * The same, but takes a pointer to the value to convert
- *     cpu_to_[bl]eXXp(__uXX x)
- *     [bl]eXX_to_cpup(__uXX x)
- *
- * The same, but change in situ
- *     cpu_to_[bl]eXXs(__uXX x)
- *     [bl]eXX_to_cpus(__uXX x)
- *
- * See asm-foo/byteorder.h for examples of how to provide
- * architecture-optimized versions
- */
-
-#define cpu_to_le64 __cpu_to_le64
-#define le64_to_cpu __le64_to_cpu
-#define cpu_to_le32 __cpu_to_le32
-#define le32_to_cpu __le32_to_cpu
-#define cpu_to_le16 __cpu_to_le16
-#define le16_to_cpu __le16_to_cpu
-#define cpu_to_be64 __cpu_to_be64
-#define be64_to_cpu __be64_to_cpu
-#define cpu_to_be32 __cpu_to_be32
-#define be32_to_cpu __be32_to_cpu
-#define cpu_to_be16 __cpu_to_be16
-#define be16_to_cpu __be16_to_cpu
-#define cpu_to_le64p __cpu_to_le64p
-#define le64_to_cpup __le64_to_cpup
-#define cpu_to_le32p __cpu_to_le32p
-#define le32_to_cpup __le32_to_cpup
-#define cpu_to_le16p __cpu_to_le16p
-#define le16_to_cpup __le16_to_cpup
-#define cpu_to_be64p __cpu_to_be64p
-#define be64_to_cpup __be64_to_cpup
-#define cpu_to_be32p __cpu_to_be32p
-#define be32_to_cpup __be32_to_cpup
-#define cpu_to_be16p __cpu_to_be16p
-#define be16_to_cpup __be16_to_cpup
-#define cpu_to_le64s __cpu_to_le64s
-#define le64_to_cpus __le64_to_cpus
-#define cpu_to_le32s __cpu_to_le32s
-#define le32_to_cpus __le32_to_cpus
-#define cpu_to_le16s __cpu_to_le16s
-#define le16_to_cpus __le16_to_cpus
-#define cpu_to_be64s __cpu_to_be64s
-#define be64_to_cpus __be64_to_cpus
-#define cpu_to_be32s __cpu_to_be32s
-#define be32_to_cpus __be32_to_cpus
-#define cpu_to_be16s __cpu_to_be16s
-#define be16_to_cpus __be16_to_cpus
-
-#endif /* __XEN_BYTEORDER_GENERIC_H__ */
diff --git a/xen/include/xen/byteorder/little_endian.h b/xen/include/xen/byteorder/little_endian.h
deleted file mode 100644
index bd1afc6a67c3..000000000000
--- a/xen/include/xen/byteorder/little_endian.h
+++ /dev/null
@@ -1,95 +0,0 @@
-#ifndef __XEN_BYTEORDER_LITTLE_ENDIAN_H__
-#define __XEN_BYTEORDER_LITTLE_ENDIAN_H__
-
-#include <xen/types.h>
-#include <xen/byteorder/swab.h>
-
-#define __constant_cpu_to_le64(x) ((__force __le64)(uint64_t)(x))
-#define __constant_le64_to_cpu(x) ((__force uint64_t)(__le64)(x))
-#define __constant_cpu_to_le32(x) ((__force __le32)(uint32_t)(x))
-#define __constant_le32_to_cpu(x) ((__force uint32_t)(__le32)(x))
-#define __constant_cpu_to_le16(x) ((__force __le16)(uint16_t)(x))
-#define __constant_le16_to_cpu(x) ((__force uint16_t)(__le16)(x))
-#define __constant_cpu_to_be64(x) ((__force __be64)___constant_swab64((x)))
-#define __constant_be64_to_cpu(x) ___constant_swab64((__force uint64_t)(__be64)(x))
-#define __constant_cpu_to_be32(x) ((__force __be32)___constant_swab32((x)))
-#define __constant_be32_to_cpu(x) ___constant_swab32((__force uint32_t)(__be32)(x))
-#define __constant_cpu_to_be16(x) ((__force __be16)___constant_swab16((x)))
-#define __constant_be16_to_cpu(x) ___constant_swab16((__force uint16_t)(__be16)(x))
-#define __cpu_to_le64(x) ((__force __le64)(uint64_t)(x))
-#define __le64_to_cpu(x) ((__force uint64_t)(__le64)(x))
-#define __cpu_to_le32(x) ((__force __le32)(uint32_t)(x))
-#define __le32_to_cpu(x) ((__force uint32_t)(__le32)(x))
-#define __cpu_to_le16(x) ((__force __le16)(uint16_t)(x))
-#define __le16_to_cpu(x) ((__force uint16_t)(__le16)(x))
-#define __cpu_to_be64(x) ((__force __be64)__swab64((x)))
-#define __be64_to_cpu(x) __swab64((__force uint64_t)(__be64)(x))
-#define __cpu_to_be32(x) ((__force __be32)__swab32((x)))
-#define __be32_to_cpu(x) __swab32((__force uint32_t)(__be32)(x))
-#define __cpu_to_be16(x) ((__force __be16)__swab16((x)))
-#define __be16_to_cpu(x) __swab16((__force uint16_t)(__be16)(x))
-
-static inline __le64 __cpu_to_le64p(const uint64_t *p)
-{
-    return (__force __le64)*p;
-}
-static inline uint64_t __le64_to_cpup(const __le64 *p)
-{
-    return (__force uint64_t)*p;
-}
-static inline __le32 __cpu_to_le32p(const uint32_t *p)
-{
-    return (__force __le32)*p;
-}
-static inline uint32_t __le32_to_cpup(const __le32 *p)
-{
-    return (__force uint32_t)*p;
-}
-static inline __le16 __cpu_to_le16p(const uint16_t *p)
-{
-    return (__force __le16)*p;
-}
-static inline uint16_t __le16_to_cpup(const __le16 *p)
-{
-    return (__force uint16_t)*p;
-}
-static inline __be64 __cpu_to_be64p(const uint64_t *p)
-{
-    return (__force __be64)__swab64p(p);
-}
-static inline uint64_t __be64_to_cpup(const __be64 *p)
-{
-    return __swab64p((const uint64_t *)p);
-}
-static inline __be32 __cpu_to_be32p(const uint32_t *p)
-{
-    return (__force __be32)__swab32p(p);
-}
-static inline uint32_t __be32_to_cpup(const __be32 *p)
-{
-    return __swab32p((const uint32_t *)p);
-}
-static inline __be16 __cpu_to_be16p(const uint16_t *p)
-{
-    return (__force __be16)__swab16p(p);
-}
-static inline uint16_t __be16_to_cpup(const __be16 *p)
-{
-    return __swab16p((const uint16_t *)p);
-}
-#define __cpu_to_le64s(x) do {} while (0)
-#define __le64_to_cpus(x) do {} while (0)
-#define __cpu_to_le32s(x) do {} while (0)
-#define __le32_to_cpus(x) do {} while (0)
-#define __cpu_to_le16s(x) do {} while (0)
-#define __le16_to_cpus(x) do {} while (0)
-#define __cpu_to_be64s(x) __swab64s((x))
-#define __be64_to_cpus(x) __swab64s((x))
-#define __cpu_to_be32s(x) __swab32s((x))
-#define __be32_to_cpus(x) __swab32s((x))
-#define __cpu_to_be16s(x) __swab16s((x))
-#define __be16_to_cpus(x) __swab16s((x))
-
-#include <xen/byteorder/generic.h>
-
-#endif /* __XEN_BYTEORDER_LITTLE_ENDIAN_H__ */
diff --git a/xen/include/xen/byteorder/swab.h b/xen/include/xen/byteorder/swab.h
deleted file mode 100644
index ffcf1cf800b2..000000000000
--- a/xen/include/xen/byteorder/swab.h
+++ /dev/null
@@ -1,179 +0,0 @@
-#ifndef __XEN_BYTEORDER_SWAB_H__
-#define __XEN_BYTEORDER_SWAB_H__
-
-/*
- * Byte-swapping, independently from CPU endianness
- *     swabXX[ps]?(foo)
- *
- * Francois-Rene Rideau <fare@tunes.org> 19971205
- *    separated swab functions from cpu_to_XX,
- *    to clean up support for bizarre-endian architectures.
- */
-
-#define ___swab16(x)                                    \
-({                                                      \
-    uint16_t x_ = (x);                                  \
-    (uint16_t)(                                         \
-        (((uint16_t)(x_) & 0x00ffU) << 8) |             \
-        (((uint16_t)(x_) & 0xff00U) >> 8));             \
-})
-
-#define ___swab32(x)                                            \
-({                                                              \
-    uint32_t x_ = (x);                                          \
-    (uint32_t)(                                                 \
-        (((uint32_t)(x_) & 0x000000ffU) << 24) |                \
-        (((uint32_t)(x_) & 0x0000ff00U) <<  8) |                \
-        (((uint32_t)(x_) & 0x00ff0000U) >>  8) |                \
-        (((uint32_t)(x_) & 0xff000000U) >> 24));                \
-})
-
-#define ___swab64(x)                                                       \
-({                                                                         \
-    uint64_t x_ = (x);                                                     \
-    (uint64_t)(                                                            \
-        (((uint64_t)(x_) & 0x00000000000000ffULL) << 56) |                 \
-        (((uint64_t)(x_) & 0x000000000000ff00ULL) << 40) |                 \
-        (((uint64_t)(x_) & 0x0000000000ff0000ULL) << 24) |                 \
-        (((uint64_t)(x_) & 0x00000000ff000000ULL) <<  8) |                 \
-        (((uint64_t)(x_) & 0x000000ff00000000ULL) >>  8) |                 \
-        (((uint64_t)(x_) & 0x0000ff0000000000ULL) >> 24) |                 \
-        (((uint64_t)(x_) & 0x00ff000000000000ULL) >> 40) |                 \
-        (((uint64_t)(x_) & 0xff00000000000000ULL) >> 56));                 \
-})
-
-#define ___constant_swab16(x)                   \
-    ((uint16_t)(                                \
-        (((uint16_t)(x) & 0x00ffU) << 8) |      \
-        (((uint16_t)(x) & 0xff00U) >> 8)))
-#define ___constant_swab32(x)                           \
-    ((uint32_t)(                                        \
-        (((uint32_t)(x) & 0x000000ffU) << 24) |         \
-        (((uint32_t)(x) & 0x0000ff00U) <<  8) |         \
-        (((uint32_t)(x) & 0x00ff0000U) >>  8) |         \
-        (((uint32_t)(x) & 0xff000000U) >> 24)))
-#define ___constant_swab64(x)                                            \
-    ((uint64_t)(                                                         \
-        (((uint64_t)(x) & 0x00000000000000ffULL) << 56) |                \
-        (((uint64_t)(x) & 0x000000000000ff00ULL) << 40) |                \
-        (((uint64_t)(x) & 0x0000000000ff0000ULL) << 24) |                \
-        (((uint64_t)(x) & 0x00000000ff000000ULL) <<  8) |                \
-        (((uint64_t)(x) & 0x000000ff00000000ULL) >>  8) |                \
-        (((uint64_t)(x) & 0x0000ff0000000000ULL) >> 24) |                \
-        (((uint64_t)(x) & 0x00ff000000000000ULL) >> 40) |                \
-        (((uint64_t)(x) & 0xff00000000000000ULL) >> 56)))
-
-/*
- * provide defaults when no architecture-specific optimization is detected
- */
-#ifndef __arch__swab16
-#  define __arch__swab16(x) ___swab16(x)
-#endif
-#ifndef __arch__swab32
-#  define __arch__swab32(x) ___swab32(x)
-#endif
-#ifndef __arch__swab64
-#  define __arch__swab64(x) ___swab64(x)
-#endif
-
-#ifndef __arch__swab16p
-#  define __arch__swab16p(x) __arch__swab16(*(x))
-#endif
-#ifndef __arch__swab32p
-#  define __arch__swab32p(x) __arch__swab32(*(x))
-#endif
-#ifndef __arch__swab64p
-#  define __arch__swab64p(x) __arch__swab64(*(x))
-#endif
-
-#ifndef __arch__swab16s
-#  define __arch__swab16s(x) do { *(x) = __arch__swab16p((x)); } while (0)
-#endif
-#ifndef __arch__swab32s
-#  define __arch__swab32s(x) do { *(x) = __arch__swab32p((x)); } while (0)
-#endif
-#ifndef __arch__swab64s
-#  define __arch__swab64s(x) do { *(x) = __arch__swab64p((x)); } while (0)
-#endif
-
-
-/*
- * Allow constant folding
- */
-#if defined(__GNUC__) && defined(__OPTIMIZE__)
-#  define __swab16(x) \
-(__builtin_constant_p((uint16_t)(x)) ? \
- ___swab16((x)) : \
- __fswab16((x)))
-#  define __swab32(x) \
-(__builtin_constant_p((uint32_t)(x)) ? \
- ___swab32((x)) : \
- __fswab32((x)))
-#  define __swab64(x) \
-(__builtin_constant_p((uint64_t)(x)) ? \
- ___swab64((x)) : \
- __fswab64((x)))
-#else
-#  define __swab16(x) __fswab16(x)
-#  define __swab32(x) __fswab32(x)
-#  define __swab64(x) __fswab64(x)
-#endif /* OPTIMIZE */
-
-
-static inline attr_const uint16_t __fswab16(uint16_t x)
-{
-    return __arch__swab16(x);
-}
-static inline uint16_t __swab16p(const uint16_t *x)
-{
-    return __arch__swab16p(x);
-}
-static inline void __swab16s(uint16_t *addr)
-{
-    __arch__swab16s(addr);
-}
-
-static inline attr_const uint32_t __fswab32(uint32_t x)
-{
-    return __arch__swab32(x);
-}
-static inline uint32_t __swab32p(const uint32_t *x)
-{
-    return __arch__swab32p(x);
-}
-static inline void __swab32s(uint32_t *addr)
-{
-    __arch__swab32s(addr);
-}
-
-#ifdef __BYTEORDER_HAS_U64__
-static inline attr_const uint64_t __fswab64(uint64_t x)
-{
-#  ifdef __SWAB_64_THRU_32__
-    uint32_t h = x >> 32, l = x;
-    return ((uint64_t)__swab32(l) << 32) | __swab32(h);
-#  else
-    return __arch__swab64(x);
-#  endif
-}
-static inline uint64_t __swab64p(const uint64_t *x)
-{
-    return __arch__swab64p(x);
-}
-static inline void __swab64s(uint64_t *addr)
-{
-    __arch__swab64s(addr);
-}
-#endif /* __BYTEORDER_HAS_U64__ */
-
-#define swab16 __swab16
-#define swab32 __swab32
-#define swab64 __swab64
-#define swab16p __swab16p
-#define swab32p __swab32p
-#define swab64p __swab64p
-#define swab16s __swab16s
-#define swab32s __swab32s
-#define swab64s __swab64s
-
-#endif /* __XEN_BYTEORDER_SWAB_H__ */
-- 
2.39.5


