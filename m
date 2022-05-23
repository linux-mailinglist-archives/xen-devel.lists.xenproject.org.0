Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A07530C6C
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 11:53:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.335660.559887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt4kD-0004R7-B7; Mon, 23 May 2022 09:52:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 335660.559887; Mon, 23 May 2022 09:52:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt4kD-0004PJ-4A; Mon, 23 May 2022 09:52:57 +0000
Received: by outflank-mailman (input) for mailman id 335660;
 Mon, 23 May 2022 09:52:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HaIF=V7=citrix.com=prvs=1359a750d=lin.liu@srs-se1.protection.inumbo.net>)
 id 1nt4kB-0002dq-3N
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 09:52:55 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1bf98f02-da7e-11ec-bd2c-47488cf2e6aa;
 Mon, 23 May 2022 11:52:53 +0200 (CEST)
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
X-Inumbo-ID: 1bf98f02-da7e-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653299573;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ENKGHyqakgatMFXhjwFCV+ZEI5TqFZ1FQ890jq+2cI4=;
  b=O6o4MRDHBc5v+CjikR3vegbYg6GkLXYXTiXZ5FEb2ROOfkgnfDsQ4pNF
   +P9z7pVv1Hnk/foFnsKt+6MDBwm+352KsJE74R3SbpNqUQCUjWe/2HFWV
   pkZpDxs52wHSwTqIpWHp7/YV2J6z1h+BAdSTiB03fawlqImS1c/Hq/xGv
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 72327724
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:D4y7FqLsZsgLmUGEFE+RwJUlxSXFcZb7ZxGr2PjKsXjdYENShjEOn
 WVMXDrXbvzbNmqjc990b46//EoCuJSGz9RiS1FlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA149IMsdoUg7wbRh39Qz2YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 OVMipeAY1kRArfvws1afBgAPgx9YbITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBM3qOsUbu2xIxjDFF/c2B5vERs0m4PcHhmxq2Z8UQZ4yY
 eI6Q2pWaRf/RCdNAX4JJc8wh8mvoGXWJmgwRFW9+vNsvjm7IBZK+KP2LNPfd9iORMNUtkWVv
 GTL+yL+GB5yHN6CzTuI9Fq8i+mJmjn0MKoNEJWo+/gsh0ecrkQDBRtTWValrP2Rjk+lR8kZO
 0ES4jApr6U56AqsVNaVdx+yrWOAvxUcc8FNCOB84waIooLe7hyFHGECQnhEYcY/qc4tbTUw0
 xmCmNaBONB0mOTLEzTHrO7S9G7sf3hORYMfWcMaZTsE3NLTit8LsgjsFP8kP6/to/D2RS6ll
 lhmsxMCa6UvYd8jjvvmpgqc02L3/PAlXSZuuFyJAzvNAhdRIdf8Otf2sQWzAeNodt7xc7WXg
 JQTdyFyBsgqBIrFqiGCSf5l8FqBt6fca220bbKC8vAcG9WRF52LJ9k4DMlWfhsBDyr9UWaBj
 LXvkQ1Q/oRPG3ChcLV6ZYm8Y+xzk/W7T4i5CqmONoMeCnSUSONg1HgzDXN8Iki3yBR8+U3BE
 cnznTmQ4YYyVv08kWveqxY12r433CEurV4/triipylLJYG2PSbPIZ9caQPmRrlgvMus/VSOm
 /4CZpTi9vmqeLCnCsUh2dVLfQ5iwLlSLc2elvG7gcbYcls6Qzt4UqC5LHFIU9UNopm5X9zgp
 hmVMnK0AnKi7ZEbAW1mskxeVY4=
IronPort-HdrOrdr: A9a23:9UCHSqAf2AdXZbXlHemW55DYdb4zR+YMi2TC1yhKKCC9Ffbo7v
 xG/c5rriMc5wxhO03I9eruBEDEewK5yXcX2/h2AV7BZniFhILAFugLhuGOrwEIWReOkdK1vZ
 0QC5SWY+eRMbEVt6jHCXGDYrMd/OU=
X-IronPort-AV: E=Sophos;i="5.91,246,1647316800"; 
   d="scan'208";a="72327724"
From: Lin Liu <lin.liu@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Lin Liu <lin.liu@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v4 6/6] byteorder: Remove byteorder
Date: Mon, 23 May 2022 05:52:22 -0400
Message-ID: <8c025497fb679c92e33c036caa705d23ffd18fbb.1653295437.git.lin.liu@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1653295437.git.lin.liu@citrix.com>
References: <cover.1653295437.git.lin.liu@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

include/xen/byteswap.h has simplify the interface, just clean
the old interface

No functional change

Signed-off-by: Lin Liu <lin.liu@citrix.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wl@xen.org>
---
 xen/include/xen/byteorder/big_endian.h    | 102 ------------
 xen/include/xen/byteorder/generic.h       |  68 --------
 xen/include/xen/byteorder/little_endian.h | 102 ------------
 xen/include/xen/byteorder/swab.h          | 183 ----------------------
 4 files changed, 455 deletions(-)
 delete mode 100644 xen/include/xen/byteorder/big_endian.h
 delete mode 100644 xen/include/xen/byteorder/generic.h
 delete mode 100644 xen/include/xen/byteorder/little_endian.h
 delete mode 100644 xen/include/xen/byteorder/swab.h

diff --git a/xen/include/xen/byteorder/big_endian.h b/xen/include/xen/byteorder/big_endian.h
deleted file mode 100644
index 40eb80a390..0000000000
--- a/xen/include/xen/byteorder/big_endian.h
+++ /dev/null
@@ -1,102 +0,0 @@
-#ifndef __XEN_BYTEORDER_BIG_ENDIAN_H__
-#define __XEN_BYTEORDER_BIG_ENDIAN_H__
-
-#ifndef __BIG_ENDIAN
-#define __BIG_ENDIAN 4321
-#endif
-#ifndef __BIG_ENDIAN_BITFIELD
-#define __BIG_ENDIAN_BITFIELD
-#endif
-
-#include <xen/types.h>
-#include <xen/byteorder/swab.h>
-
-#define __constant_cpu_to_le64(x) ((__force __le64)___constant_swab64((x)))
-#define __constant_le64_to_cpu(x) ___constant_swab64((__force __u64)(__le64)(x))
-#define __constant_cpu_to_le32(x) ((__force __le32)___constant_swab32((x)))
-#define __constant_le32_to_cpu(x) ___constant_swab32((__force __u32)(__le32)(x))
-#define __constant_cpu_to_le16(x) ((__force __le16)___constant_swab16((x)))
-#define __constant_le16_to_cpu(x) ___constant_swab16((__force __u16)(__le16)(x))
-#define __constant_cpu_to_be64(x) ((__force __be64)(__u64)(x))
-#define __constant_be64_to_cpu(x) ((__force __u64)(__be64)(x))
-#define __constant_cpu_to_be32(x) ((__force __be32)(__u32)(x))
-#define __constant_be32_to_cpu(x) ((__force __u32)(__be32)(x))
-#define __constant_cpu_to_be16(x) ((__force __be16)(__u16)(x))
-#define __constant_be16_to_cpu(x) ((__force __u16)(__be16)(x))
-#define __cpu_to_le64(x) ((__force __le64)__swab64((x)))
-#define __le64_to_cpu(x) __swab64((__force __u64)(__le64)(x))
-#define __cpu_to_le32(x) ((__force __le32)__swab32((x)))
-#define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
-#define __cpu_to_le16(x) ((__force __le16)__swab16((x)))
-#define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
-#define __cpu_to_be64(x) ((__force __be64)(__u64)(x))
-#define __be64_to_cpu(x) ((__force __u64)(__be64)(x))
-#define __cpu_to_be32(x) ((__force __be32)(__u32)(x))
-#define __be32_to_cpu(x) ((__force __u32)(__be32)(x))
-#define __cpu_to_be16(x) ((__force __be16)(__u16)(x))
-#define __be16_to_cpu(x) ((__force __u16)(__be16)(x))
-
-static inline __le64 __cpu_to_le64p(const __u64 *p)
-{
-    return (__force __le64)__swab64p(p);
-}
-static inline __u64 __le64_to_cpup(const __le64 *p)
-{
-    return __swab64p((__u64 *)p);
-}
-static inline __le32 __cpu_to_le32p(const __u32 *p)
-{
-    return (__force __le32)__swab32p(p);
-}
-static inline __u32 __le32_to_cpup(const __le32 *p)
-{
-    return __swab32p((__u32 *)p);
-}
-static inline __le16 __cpu_to_le16p(const __u16 *p)
-{
-    return (__force __le16)__swab16p(p);
-}
-static inline __u16 __le16_to_cpup(const __le16 *p)
-{
-    return __swab16p((__u16 *)p);
-}
-static inline __be64 __cpu_to_be64p(const __u64 *p)
-{
-    return (__force __be64)*p;
-}
-static inline __u64 __be64_to_cpup(const __be64 *p)
-{
-    return (__force __u64)*p;
-}
-static inline __be32 __cpu_to_be32p(const __u32 *p)
-{
-    return (__force __be32)*p;
-}
-static inline __u32 __be32_to_cpup(const __be32 *p)
-{
-    return (__force __u32)*p;
-}
-static inline __be16 __cpu_to_be16p(const __u16 *p)
-{
-    return (__force __be16)*p;
-}
-static inline __u16 __be16_to_cpup(const __be16 *p)
-{
-    return (__force __u16)*p;
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
index 8a0006b755..0000000000
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
index 4955632793..0000000000
--- a/xen/include/xen/byteorder/little_endian.h
+++ /dev/null
@@ -1,102 +0,0 @@
-#ifndef __XEN_BYTEORDER_LITTLE_ENDIAN_H__
-#define __XEN_BYTEORDER_LITTLE_ENDIAN_H__
-
-#ifndef __LITTLE_ENDIAN
-#define __LITTLE_ENDIAN 1234
-#endif
-#ifndef __LITTLE_ENDIAN_BITFIELD
-#define __LITTLE_ENDIAN_BITFIELD
-#endif
-
-#include <xen/types.h>
-#include <xen/byteorder/swab.h>
-
-#define __constant_cpu_to_le64(x) ((__force __le64)(__u64)(x))
-#define __constant_le64_to_cpu(x) ((__force __u64)(__le64)(x))
-#define __constant_cpu_to_le32(x) ((__force __le32)(__u32)(x))
-#define __constant_le32_to_cpu(x) ((__force __u32)(__le32)(x))
-#define __constant_cpu_to_le16(x) ((__force __le16)(__u16)(x))
-#define __constant_le16_to_cpu(x) ((__force __u16)(__le16)(x))
-#define __constant_cpu_to_be64(x) ((__force __be64)___constant_swab64((x)))
-#define __constant_be64_to_cpu(x) ___constant_swab64((__force __u64)(__be64)(x))
-#define __constant_cpu_to_be32(x) ((__force __be32)___constant_swab32((x)))
-#define __constant_be32_to_cpu(x) ___constant_swab32((__force __u32)(__be32)(x))
-#define __constant_cpu_to_be16(x) ((__force __be16)___constant_swab16((x)))
-#define __constant_be16_to_cpu(x) ___constant_swab16((__force __u16)(__be16)(x))
-#define __cpu_to_le64(x) ((__force __le64)(__u64)(x))
-#define __le64_to_cpu(x) ((__force __u64)(__le64)(x))
-#define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
-#define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
-#define __cpu_to_le16(x) ((__force __le16)(__u16)(x))
-#define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
-#define __cpu_to_be64(x) ((__force __be64)__swab64((x)))
-#define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
-#define __cpu_to_be32(x) ((__force __be32)__swab32((x)))
-#define __be32_to_cpu(x) __swab32((__force __u32)(__be32)(x))
-#define __cpu_to_be16(x) ((__force __be16)__swab16((x)))
-#define __be16_to_cpu(x) __swab16((__force __u16)(__be16)(x))
-
-static inline __le64 __cpu_to_le64p(const __u64 *p)
-{
-    return (__force __le64)*p;
-}
-static inline __u64 __le64_to_cpup(const __le64 *p)
-{
-    return (__force __u64)*p;
-}
-static inline __le32 __cpu_to_le32p(const __u32 *p)
-{
-    return (__force __le32)*p;
-}
-static inline __u32 __le32_to_cpup(const __le32 *p)
-{
-    return (__force __u32)*p;
-}
-static inline __le16 __cpu_to_le16p(const __u16 *p)
-{
-    return (__force __le16)*p;
-}
-static inline __u16 __le16_to_cpup(const __le16 *p)
-{
-    return (__force __u16)*p;
-}
-static inline __be64 __cpu_to_be64p(const __u64 *p)
-{
-    return (__force __be64)__swab64p(p);
-}
-static inline __u64 __be64_to_cpup(const __be64 *p)
-{
-    return __swab64p((__u64 *)p);
-}
-static inline __be32 __cpu_to_be32p(const __u32 *p)
-{
-    return (__force __be32)__swab32p(p);
-}
-static inline __u32 __be32_to_cpup(const __be32 *p)
-{
-    return __swab32p((__u32 *)p);
-}
-static inline __be16 __cpu_to_be16p(const __u16 *p)
-{
-    return (__force __be16)__swab16p(p);
-}
-static inline __u16 __be16_to_cpup(const __be16 *p)
-{
-    return __swab16p((__u16 *)p);
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
index b7e30f0503..0000000000
--- a/xen/include/xen/byteorder/swab.h
+++ /dev/null
@@ -1,183 +0,0 @@
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
-/* casts are necessary for constants, because we never know how for sure
- * how U/UL/ULL map to __u16, __u32, __u64. At least not in a portable way.
- */
-#define ___swab16(x)                                    \
-({                                                      \
-    __u16 __x = (x);                                    \
-    ((__u16)(                                           \
-        (((__u16)(__x) & (__u16)0x00ffU) << 8) |        \
-        (((__u16)(__x) & (__u16)0xff00U) >> 8) ));      \
-})
-
-#define ___swab32(x)                                            \
-({                                                              \
-    __u32 __x = (x);                                            \
-    ((__u32)(                                                   \
-        (((__u32)(__x) & (__u32)0x000000ffUL) << 24) |          \
-        (((__u32)(__x) & (__u32)0x0000ff00UL) <<  8) |          \
-        (((__u32)(__x) & (__u32)0x00ff0000UL) >>  8) |          \
-        (((__u32)(__x) & (__u32)0xff000000UL) >> 24) ));        \
-})
-
-#define ___swab64(x)                                                       \
-({                                                                         \
-    __u64 __x = (x);                                                       \
-    ((__u64)(                                                              \
-        (__u64)(((__u64)(__x) & (__u64)0x00000000000000ffULL) << 56) |     \
-        (__u64)(((__u64)(__x) & (__u64)0x000000000000ff00ULL) << 40) |     \
-        (__u64)(((__u64)(__x) & (__u64)0x0000000000ff0000ULL) << 24) |     \
-        (__u64)(((__u64)(__x) & (__u64)0x00000000ff000000ULL) <<  8) |     \
-            (__u64)(((__u64)(__x) & (__u64)0x000000ff00000000ULL) >>  8) | \
-        (__u64)(((__u64)(__x) & (__u64)0x0000ff0000000000ULL) >> 24) |     \
-        (__u64)(((__u64)(__x) & (__u64)0x00ff000000000000ULL) >> 40) |     \
-        (__u64)(((__u64)(__x) & (__u64)0xff00000000000000ULL) >> 56) ));   \
-})
-
-#define ___constant_swab16(x)                   \
-    ((__u16)(                                   \
-        (((__u16)(x) & (__u16)0x00ffU) << 8) |  \
-        (((__u16)(x) & (__u16)0xff00U) >> 8) ))
-#define ___constant_swab32(x)                           \
-    ((__u32)(                                           \
-        (((__u32)(x) & (__u32)0x000000ffUL) << 24) |    \
-        (((__u32)(x) & (__u32)0x0000ff00UL) <<  8) |    \
-        (((__u32)(x) & (__u32)0x00ff0000UL) >>  8) |    \
-        (((__u32)(x) & (__u32)0xff000000UL) >> 24) ))
-#define ___constant_swab64(x)                                            \
-    ((__u64)(                                                            \
-        (__u64)(((__u64)(x) & (__u64)0x00000000000000ffULL) << 56) |     \
-        (__u64)(((__u64)(x) & (__u64)0x000000000000ff00ULL) << 40) |     \
-        (__u64)(((__u64)(x) & (__u64)0x0000000000ff0000ULL) << 24) |     \
-        (__u64)(((__u64)(x) & (__u64)0x00000000ff000000ULL) <<  8) |     \
-            (__u64)(((__u64)(x) & (__u64)0x000000ff00000000ULL) >>  8) | \
-        (__u64)(((__u64)(x) & (__u64)0x0000ff0000000000ULL) >> 24) |     \
-        (__u64)(((__u64)(x) & (__u64)0x00ff000000000000ULL) >> 40) |     \
-        (__u64)(((__u64)(x) & (__u64)0xff00000000000000ULL) >> 56) ))
-
-/*
- * provide defaults when no architecture-specific optimization is detected
- */
-#ifndef __arch__swab16
-#  define __arch__swab16(x) ({ __u16 __tmp = (x) ; ___swab16(__tmp); })
-#endif
-#ifndef __arch__swab32
-#  define __arch__swab32(x) ({ __u32 __tmp = (x) ; ___swab32(__tmp); })
-#endif
-#ifndef __arch__swab64
-#  define __arch__swab64(x) ({ __u64 __tmp = (x) ; ___swab64(__tmp); })
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
-(__builtin_constant_p((__u16)(x)) ? \
- ___swab16((x)) : \
- __fswab16((x)))
-#  define __swab32(x) \
-(__builtin_constant_p((__u32)(x)) ? \
- ___swab32((x)) : \
- __fswab32((x)))
-#  define __swab64(x) \
-(__builtin_constant_p((__u64)(x)) ? \
- ___swab64((x)) : \
- __fswab64((x)))
-#else
-#  define __swab16(x) __fswab16(x)
-#  define __swab32(x) __fswab32(x)
-#  define __swab64(x) __fswab64(x)
-#endif /* OPTIMIZE */
-
-
-static inline __attribute_const__ __u16 __fswab16(__u16 x)
-{
-    return __arch__swab16(x);
-}
-static inline __u16 __swab16p(const __u16 *x)
-{
-    return __arch__swab16p(x);
-}
-static inline void __swab16s(__u16 *addr)
-{
-    __arch__swab16s(addr);
-}
-
-static inline __attribute_const__ __u32 __fswab32(__u32 x)
-{
-    return __arch__swab32(x);
-}
-static inline __u32 __swab32p(const __u32 *x)
-{
-    return __arch__swab32p(x);
-}
-static inline void __swab32s(__u32 *addr)
-{
-    __arch__swab32s(addr);
-}
-
-#ifdef __BYTEORDER_HAS_U64__
-static inline __attribute_const__ __u64 __fswab64(__u64 x)
-{
-#  ifdef __SWAB_64_THRU_32__
-    __u32 h = x >> 32;
-        __u32 l = x & ((1ULL<<32)-1);
-        return (((__u64)__swab32(l)) << 32) | ((__u64)(__swab32(h)));
-#  else
-    return __arch__swab64(x);
-#  endif
-}
-static inline __u64 __swab64p(const __u64 *x)
-{
-    return __arch__swab64p(x);
-}
-static inline void __swab64s(__u64 *addr)
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
2.27.0


