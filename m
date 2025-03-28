Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D191EA74B60
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 14:45:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930660.1333246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyA0m-0005R3-0z; Fri, 28 Mar 2025 13:44:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930660.1333246; Fri, 28 Mar 2025 13:44:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyA0l-0005Lk-S0; Fri, 28 Mar 2025 13:44:39 +0000
Received: by outflank-mailman (input) for mailman id 930660;
 Fri, 28 Mar 2025 13:44:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IZL4=WP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tyA0k-0005Dp-5i
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 13:44:38 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca3bd7d6-0bda-11f0-9ea3-5ba50f476ded;
 Fri, 28 Mar 2025 14:44:37 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43d04ea9d9aso9910575e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Mar 2025 06:44:37 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8314f5c6sm73339085e9.40.2025.03.28.06.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 06:44:35 -0700 (PDT)
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
X-Inumbo-ID: ca3bd7d6-0bda-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743169476; x=1743774276; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SnmFGZh2rWbEy7OVP//9VnfXl8YcAR4cPveLI05OgG8=;
        b=oukTryhz2N+E26GnKvoZohLGKQk4H74xRzqqk6pQpGilyQNFAOC5X9hw1+0sQWwXrI
         FILXX1zcpnXtDy1uOBBXnFI3XqfkfNNIL+xReQ/FeaJkv6Iq02Oj7RdYVDtXWlChiIJH
         GReTGxJ/+FPXC8b7s1TLRL7Ys+sJkfdn51KQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743169476; x=1743774276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SnmFGZh2rWbEy7OVP//9VnfXl8YcAR4cPveLI05OgG8=;
        b=LOr5Pjn8h/ZqCAGP/yOMlmsnrA9Cm+uIzuaCAXUPXeyTzmPmciwI85U3KXNR77WGb0
         wDJ2/ZtZ6NKv1CkUB9SoXLJDBOYOESiPf7zpQ8jxIE9IOCnEutuFB64NLHaCAXoXANd1
         T5zsszfr4k6n124xMlNQrq7D7rgSP/Nba7QlkjnjRNq9go8u+2PfhKPw6jQi/TBJPq58
         vYxagrs6Lh1vOz31xfByORBf7uOfGOQHipUCnd0UtDSvqlpoDyE2W7UH/QcbqUZ1I/vt
         nkU/8OuxJUeG6IvTx3XC2s/7V6qGVWC6TkltA63/fnGxw6LMGCHjp95pX6S+UkfRQsS7
         PtdA==
X-Gm-Message-State: AOJu0YxsxDNXDkxEsd/SGJXxyMF9pScpWG4AlPH3HcQOmr2U4BLT0b5d
	dmJbJOxbefjlguaUN4wrVNL3GwXXzDOnCqb91wtjJL56YfdEGXjKzdQ7TjJveLU3ojspeB8bNCN
	qJN8=
X-Gm-Gg: ASbGncuE5M4+HR3WusOlM2qNE4Dpm7+P5q2WmiiFdTFr47DeT5ii9gxKCEuQUrylD+/
	VNH9no4Rph1kb7Ha00unjmxD2FT+cnCjYAMXy0/oQmj9m7bI6R0b5mZM2AuBlxw9sa7WgR7E2LW
	3zrz2o7dRT+zlyllkmMlnxiBMW5TSpYA9DdYx/sp2z6L+ngbedp/yWyjMZYLfq1pHx7yQIww8jZ
	L46ewDKrU53rpVsVCab/SAbqTWolWQ8bsNMXdOGjU+geDJEv0ZhTfuoML3hvmnRRVh36dTJ10+9
	8Xejk2oZb8YOTeumv1x+CnuRyRJ2OIgXbgh5waFKKXect9qoeoZtOy6W4+A2Syd2MPXtgEbtJhv
	CB9j3K2CfBHRd3GFWng==
X-Google-Smtp-Source: AGHT+IG0L24lXhaREFMHxWE7TkKiPdJJLa25T1zFmm+87C1wfPYQvQrBSAHNDtw8hOILYL/dRPC8wg==
X-Received: by 2002:a05:600c:1388:b0:43d:b3:fb1 with SMTP id 5b1f17b1804b1-43d8528c38cmr53745725e9.27.1743169476335;
        Fri, 28 Mar 2025 06:44:36 -0700 (PDT)
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
Subject: [PATCH v5 03/16] xen: Implement common byte{order,swap}.h
Date: Fri, 28 Mar 2025 13:44:14 +0000
Message-Id: <20250328134427.874848-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250328134427.874848-1-andrew.cooper3@citrix.com>
References: <20250328134427.874848-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lin Liu <lin.liu@citrix.com>

The current swab??() infrastructure is unecesserily complicated, and can be
repated entirely with compiler builtins.

All supported compilers provide __BYTE_ORDER__ and __builtin_bswap??().

Nothing in Xen cares about the values of __{BIG,LITTLE}_ENDIAN; just that one
of them is defined.  Therefore, centralise their definitions in xen/config.h

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
 * Rebase substantially
 * Drop PASTE().  It doesn't work when BITS_PER_LONG isn't a plain integer
 * Simplify in light of new toolchain baseline
---
 xen/include/xen/byteorder.h               | 44 +++++++++++++++++++++++
 xen/include/xen/byteorder/big_endian.h    |  4 ---
 xen/include/xen/byteorder/little_endian.h |  4 ---
 xen/include/xen/byteswap.h                | 15 ++++++++
 xen/include/xen/config.h                  |  6 ++++
 5 files changed, 65 insertions(+), 8 deletions(-)
 create mode 100644 xen/include/xen/byteorder.h
 create mode 100644 xen/include/xen/byteswap.h

diff --git a/xen/include/xen/byteorder.h b/xen/include/xen/byteorder.h
new file mode 100644
index 000000000000..570a7fe027e5
--- /dev/null
+++ b/xen/include/xen/byteorder.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef XEN_BYTEORDER_H
+#define XEN_BYTEORDER_H
+
+#include <xen/byteswap.h>
+#include <xen/types.h>
+
+#if defined(__LITTLE_ENDIAN)
+
+# define cpu_to_le64(x) (uint64_t)(x)
+# define le64_to_cpu(x) (uint64_t)(x)
+# define cpu_to_le32(x) (uint32_t)(x)
+# define le32_to_cpu(x) (uint32_t)(x)
+# define cpu_to_le16(x) (uint16_t)(x)
+# define le16_to_cpu(x) (uint16_t)(x)
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
+# define cpu_to_be64(x) (uint64_t)(x)
+# define be64_to_cpu(x) (uint64_t)(x)
+# define cpu_to_be32(x) (uint32_t)(x)
+# define be32_to_cpu(x) (uint32_t)(x)
+# define cpu_to_be16(x) (uint16_t)(x)
+# define be16_to_cpu(x) (uint16_t)(x)
+
+#else
+# error Unknown Endianness
+#endif /* __*_ENDIAN */
+
+#endif /* XEN_BYTEORDER_H */
diff --git a/xen/include/xen/byteorder/big_endian.h b/xen/include/xen/byteorder/big_endian.h
index 9cfb567d51d5..512291c76f1b 100644
--- a/xen/include/xen/byteorder/big_endian.h
+++ b/xen/include/xen/byteorder/big_endian.h
@@ -1,10 +1,6 @@
 #ifndef __XEN_BYTEORDER_BIG_ENDIAN_H__
 #define __XEN_BYTEORDER_BIG_ENDIAN_H__
 
-#ifndef __BIG_ENDIAN
-#define __BIG_ENDIAN 4321
-#endif
-
 #include <xen/types.h>
 #include <xen/byteorder/swab.h>
 
diff --git a/xen/include/xen/byteorder/little_endian.h b/xen/include/xen/byteorder/little_endian.h
index 96c80eab2b12..bd1afc6a67c3 100644
--- a/xen/include/xen/byteorder/little_endian.h
+++ b/xen/include/xen/byteorder/little_endian.h
@@ -1,10 +1,6 @@
 #ifndef __XEN_BYTEORDER_LITTLE_ENDIAN_H__
 #define __XEN_BYTEORDER_LITTLE_ENDIAN_H__
 
-#ifndef __LITTLE_ENDIAN
-#define __LITTLE_ENDIAN 1234
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
index d888b2314daf..6815a0ef0c1a 100644
--- a/xen/include/xen/config.h
+++ b/xen/include/xen/config.h
@@ -98,4 +98,10 @@
 #define ZERO_BLOCK_PTR ((void *)-1L)
 #endif
 
+#if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
+# define __LITTLE_ENDIAN
+#elif __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
+# define __BIG_ENDIAN
+#endif
+
 #endif /* __XEN_CONFIG_H__ */
-- 
2.39.5


