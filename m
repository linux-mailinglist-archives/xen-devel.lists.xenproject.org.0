Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA77A74B6A
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 14:45:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930663.1333286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyA0p-0006OJ-20; Fri, 28 Mar 2025 13:44:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930663.1333286; Fri, 28 Mar 2025 13:44:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyA0o-0006MT-P5; Fri, 28 Mar 2025 13:44:42 +0000
Received: by outflank-mailman (input) for mailman id 930663;
 Fri, 28 Mar 2025 13:44:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IZL4=WP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tyA0m-0005Dp-Ua
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 13:44:40 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc26e366-0bda-11f0-9ea3-5ba50f476ded;
 Fri, 28 Mar 2025 14:44:40 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43d04dc73b7so23795025e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Mar 2025 06:44:40 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8314f5c6sm73339085e9.40.2025.03.28.06.44.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 06:44:38 -0700 (PDT)
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
X-Inumbo-ID: cc26e366-0bda-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743169480; x=1743774280; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6vxny9Ua3aG8RjUIz7Wo3MrzwCxL4xJ81L7tEzt2uTw=;
        b=ZBjoV0cPdOC/GgY1bUo/uNXoG5O9VlCxQQNVSaebYlBBXmRse7tX2AJoqy0geq/5aZ
         jhL1BWsSU/8AwHRAy56YKypyDaULTYa4c3ssgSbWiEcpA7sG22lDXxMKSh9O3YIpP4ic
         4qrwqD/6DGaJV6LMfRgMSSzuE5xe8ATrsHBRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743169480; x=1743774280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6vxny9Ua3aG8RjUIz7Wo3MrzwCxL4xJ81L7tEzt2uTw=;
        b=oLcABMPXDXht+c2zt3+MlHRdMls8PHtR1oiP6LN1vGn3W9lijYkMupIEYLHhQRj72M
         7c1N1eaKxgm6uIINkjUpHF2iQp42jrpK9gX4tO10NWmILixPWf6LXmQEreJvkchb2T2W
         8bjpTz02bnHPcNuYja6Fs/+Cm8yAYEnjnklH85J5d5aBAVoPrjf0bIqgec1fkIfz9J5J
         lJVKpKiF/M7xuf/X97Ga/eaThPCL5cjv1/4PoUUhH0z9cQE+gUcnK3ZxiKyLx80TIQY2
         C5Dipx6ao0PZ5yXEkg6EtrqtflgA3Lgz6L409xAS+IIzVcB2gUaoHhBuO+Wp74yU3fkQ
         onxg==
X-Gm-Message-State: AOJu0Yw/xuMymTBEngsNvg/nfGTZ8MDXIt8fUgqBbgUQnti+UVDpHWZE
	HRno2X9WBP5hIWQgwGJ65aL8qtmIVQ9SbvHm6Atq9SdmkNgIz+F3RAGGfxDbN+9HAfjJTFAmCXk
	Oib4=
X-Gm-Gg: ASbGnctgzqMENFZhgvZIpLsb3e8+10WV3Bvk6LDoGxqlr3IDwu9hvZm2BDUyByeHmf4
	rYY3hDypNL5rU834v2TyhC/owGSAwzR/vTAjSzE1oGSkVtlh+kFzlwXrxKDHidcSUhmjECEeYrf
	I4lc6K8rIO1AWwVdIkpxJhrsrgGV513ixOmEn/nQZ9WEbH9NY0wQz4LjpqIs9X2VSRqkn5ukjLi
	GNoBSVOBeyi8EKwhfJeUC3rSM0jyGogchK9wA1s/9yVeJVG0zZQHXYO7ZlkXKU8K6uiifx4d6kv
	O8XF86tucrsz/IuDbGEdXEeHEqDH3Nl1ZyzqJySlWOt4+4MsiuNZTukKp2nipbKKIfAqeF6nwZd
	yaBfYPW+5DeXO1mITUQ==
X-Google-Smtp-Source: AGHT+IE6FLYXaFun3GgwWjRgz9r5idpvAYiFiY/dwWATzywhIDkfAehEApGxMKxnAnaLlCYmB0xfrQ==
X-Received: by 2002:a05:600c:4455:b0:43d:1b95:6d0e with SMTP id 5b1f17b1804b1-43d8506a680mr74359755e9.23.1743169479555;
        Fri, 28 Mar 2025 06:44:39 -0700 (PDT)
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
Subject: [PATCH v5 06/16] xen/decompressors: Remove use of *_to_cpup() helpers
Date: Fri, 28 Mar 2025 13:44:17 +0000
Message-Id: <20250328134427.874848-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250328134427.874848-1-andrew.cooper3@citrix.com>
References: <20250328134427.874848-1-andrew.cooper3@citrix.com>
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

v5:
 * Rebase
 * Rearranged from other patches
---
 tools/libs/guest/xg_dom_decompress_unsafe_xz.c | 13 +++++++------
 xen/common/lz4/defs.h                          |  6 +++++-
 xen/common/xz/private.h                        | 12 +++++++++---
 3 files changed, 21 insertions(+), 10 deletions(-)

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


