Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EF8A8B802
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 13:59:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955725.1349413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u51QD-0008SQ-5f; Wed, 16 Apr 2025 11:59:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955725.1349413; Wed, 16 Apr 2025 11:59:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u51QC-0008IS-Ki; Wed, 16 Apr 2025 11:59:16 +0000
Received: by outflank-mailman (input) for mailman id 955725;
 Wed, 16 Apr 2025 11:59:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9TmO=XC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u51Q9-0006Ay-Kw
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 11:59:13 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 353f420c-1aba-11f0-9ffb-bf95429c2676;
 Wed, 16 Apr 2025 13:59:11 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-39ee57c0b8cso458289f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Apr 2025 04:59:11 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4405b5a9846sm18761905e9.35.2025.04.16.04.59.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 04:59:09 -0700 (PDT)
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
X-Inumbo-ID: 353f420c-1aba-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744804750; x=1745409550; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wnf/Nwp4shj5EFcPhUHIkrw4QnU6FSi2i7Zr/xIuM0A=;
        b=N36ywz/dN0lETPcR6XsbqyXL6k1buSgv0nuUCITT56MdvDX9uHviDRYL5N1neSSys+
         xjIP/ZErCB9Kl3DU/V0iOeGBMrDVBmC6WKNmwgG7ialCU8cEJ7RIIH0vd+84vxqNPt7a
         NtndlCR2CFWMMihIUtsR+40qZQ+usDDBkvb2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744804750; x=1745409550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wnf/Nwp4shj5EFcPhUHIkrw4QnU6FSi2i7Zr/xIuM0A=;
        b=FeWw9nPsOy2aAtovoPXCdyqTx8sWYqBd/AWJUjct2QtAfKpt2zrEFfKdK+1WxRyRFG
         lxZ1iRNZ7yTdg1gvFIitzIFo6eTl/+6GqpVZEKQvT2UUmu+F6q/yZytCs5mKdwveihEL
         E4IaNIc7KuqBrTRVt2QwOtpy33UPf52cNURE0GnhBrd+C/zsoDdEayO7EzTLKLWh8z8G
         AtgYQR5GcEeCLpkbrQ3F+XYkuqV6NJjdRItmfA/ue/GkfCGcVTV0pD0ow4WN6WseRWj8
         ZllPLGteecstrI0kJXFGOoA6EsjOU/j42RzjgIVRh/mJ2Oz9iAFhC7aQXhplPKJ0mwDB
         xeew==
X-Gm-Message-State: AOJu0Yzrbm1NMoGroMqAtb0c/Etrx57o8Ft8SMp02SxZvcWuclytAtUj
	fmQc6G4JcQguM4kR3hXbLvPH1hfIbWx1kXaGDThB7XGseP5V+Znkuy0URQ7+yIrK8YYM2a+SRtZ
	hrIo=
X-Gm-Gg: ASbGnct80POLRVZ0ZSeCdhqKQ1RgSxZgZCgRUksgfA8cs+v/VuHGoXJ0vsDTo3u4W4m
	sDD0YLfVKbKz56OlrnQZkghdjo4S3Nrf/qPEIDi85Ugg2weh5bDBFFbIETyV7vXejlD1LVJNsYn
	7XcOLIVOXcJ4CtTqSysXU3LijB/Vz1IsiqdlnF+ncxgqlLWcSDuQuIvdPJFmv+/sYxDejSNGOid
	JfhBUJADQp/8MsnPTreiLCYaChbVe8RMSq/B70g5rXOEFZYjlNgnA1k8jZlOcfg8+85Hd8R+dFJ
	e3r0Wirq8UOiN5rjFihCjuvW3MG81y2H7Iw+yRxhZoo9+HDgYwKRlY3KN8f/blj+tRkHfJ5uJU3
	FDveo9XG2Ey5/pw==
X-Google-Smtp-Source: AGHT+IGLE54MCxmGfLRHPR7923SMT/+f9s1dxJukFc0Trom+H/3Dch1mdOSM2YM+b+ianCTw4XlcAw==
X-Received: by 2002:a05:6000:1882:b0:391:4835:d8a8 with SMTP id ffacd0b85a97d-39ee5b13e81mr1525905f8f.1.1744804750089;
        Wed, 16 Apr 2025 04:59:10 -0700 (PDT)
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
Subject: [PATCH v6 08/15] xen: Remove old byteorder infrastructure
Date: Wed, 16 Apr 2025 12:58:53 +0100
Message-Id: <20250416115900.2491661-9-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250416115900.2491661-1-andrew.cooper3@citrix.com>
References: <20250416115900.2491661-1-andrew.cooper3@citrix.com>
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


