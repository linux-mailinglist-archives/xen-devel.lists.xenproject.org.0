Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 440D5A74B6B
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 14:45:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930665.1333305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyA0q-0006rF-Rw; Fri, 28 Mar 2025 13:44:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930665.1333305; Fri, 28 Mar 2025 13:44:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyA0q-0006na-Jd; Fri, 28 Mar 2025 13:44:44 +0000
Received: by outflank-mailman (input) for mailman id 930665;
 Fri, 28 Mar 2025 13:44:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IZL4=WP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tyA0o-0005Dp-QC
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 13:44:42 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd4c8ec6-0bda-11f0-9ea3-5ba50f476ded;
 Fri, 28 Mar 2025 14:44:42 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43cf680d351so18660525e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 28 Mar 2025 06:44:42 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8314f5c6sm73339085e9.40.2025.03.28.06.44.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 06:44:41 -0700 (PDT)
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
X-Inumbo-ID: cd4c8ec6-0bda-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743169482; x=1743774282; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xv/5+f+BWzji1CB1SXmZ+OaK7UeEkWaO0hHsnfSGUeo=;
        b=CxwXeqxN2FYKt8GImqt1zE0dvtvlr0eGblr59YUvgjbBa45l5y5EMUPxVLeQkoOol5
         81PDFsntsKHRTl6ZCW5Zkb+JQwofXDQvcQkyILOzaQ8zX9fLzKhbU+rghiPa3NJTK1PN
         500P1ccGLkJf5bJIq5gnKQc/jy1HMffLY+q1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743169482; x=1743774282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xv/5+f+BWzji1CB1SXmZ+OaK7UeEkWaO0hHsnfSGUeo=;
        b=ZNaQCXxtkjIKVToFbj740rBk6OF7R6ZEEeQNTY/Yi8gpF+9c+BQJCwa7DxCxZ5Jbvn
         joSemzEjRB8Ktsjzw20ljgTqziJg3CPPLNLgi1APZzVoKumBiX5gzb6f3FzxyOSsTWYt
         sFQpntiKmngn2+eJCC72jJ1gcBK6+3Ok7JHsv23bjABHT26AncS8LUoxWGH2oGcwLWlI
         MHZ7GqmY1PvmoZh2QpXgjeL3fBX12vjMDoXlkc7Mu/yRrj57Yq9eVv69w6q/3ByZgMjM
         xwEtQ3qiT+RINNyMgsIQARktqBxnD8AJE3hxFw6QjQlQDlEsyvCqD1ob17QNLddo+m86
         6z4w==
X-Gm-Message-State: AOJu0YyldTvL2wE2jL6VyqzRsKvx9/uM9NUloLxWbd1M1n7sdVwC9Ej6
	ki/aF65LiF2v0xidWUwYShjGRfxX0ds4f4n6CUlUdrzfF2HRoRkyPLVXJq8z5aNNnqlfvHeGIzi
	T+h0=
X-Gm-Gg: ASbGnctEDASsK5lBpqSHWC2Zd3Q/JGgxAOmC9C4IyMRL9lVSdkV22H06lamBF6mTEVV
	8ao1FqakdLejME4XH96CScR3ELVkqaCpsclJ82OQquFRSTns+Fx6FDp8DlKjnLbthbLPjLbZIod
	Twby5MQTfI83tnmN4vU7BniEDP/ds+4U1mvcExpzs7mpKST0Z1Imu4oZQ+U1A9B7g1tY/wNJHib
	CD6xBz0Q8zglUGAfAQP4UZS671GH8g3zMUZ+evqWTe6o+U03kcNFE4VaunZuYpw6+3w9YVO9eAg
	usrK362FlIOwWH9+9ueRu9a8dItbBYfuTVX+UfT8waxSdvPOxq+sRnIsZ1+igQB25WZ9tPGQr+n
	1kpAC8/XKSmpwxFAHMA==
X-Google-Smtp-Source: AGHT+IFe8F1Ghmv2+iYN3jy64ZhwzbMwIzbrHZkvQTMw2sExavxGXaR+RYLUFdw+YWQIFJ5rh045Bw==
X-Received: by 2002:a5d:5f95:0:b0:391:b93:c971 with SMTP id ffacd0b85a97d-39c0c136bc9mr2658967f8f.20.1743169481653;
        Fri, 28 Mar 2025 06:44:41 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Lin Liu <lin.liu@citrix.com>,
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
Subject: [PATCH v5 08/16] xen/decompressors: Use new byteorder infrastructure
Date: Fri, 28 Mar 2025 13:44:19 +0000
Message-Id: <20250328134427.874848-9-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250328134427.874848-1-andrew.cooper3@citrix.com>
References: <20250328134427.874848-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lin Liu <lin.liu@citrix.com>

unaligned.h already inlcudes byteorder.h, so most can simply be dropped.

No functional change.

Signed-off-by: Lin Liu <lin.liu@citrix.com>
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
 tools/libs/guest/xg_dom_decompress_unsafe_zstd.c | 3 +--
 xen/common/lz4/defs.h                            | 1 -
 xen/common/lzo.c                                 | 1 -
 xen/common/unlzo.c                               | 1 -
 xen/common/xz/private.h                          | 1 -
 5 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/tools/libs/guest/xg_dom_decompress_unsafe_zstd.c b/tools/libs/guest/xg_dom_decompress_unsafe_zstd.c
index ff45732a3616..319816a390eb 100644
--- a/tools/libs/guest/xg_dom_decompress_unsafe_zstd.c
+++ b/tools/libs/guest/xg_dom_decompress_unsafe_zstd.c
@@ -30,9 +30,8 @@ typedef uint64_t __be64;
 
 #undef ERROR
 
-#define __BYTEORDER_HAS_U64__
 #define __TYPES_H__ /* xen/types.h guard */
-#include "../../xen/include/xen/byteorder/little_endian.h"
+#include "../../xen/include/xen/byteorder.h"
 #include "../../xen/include/xen/unaligned.h"
 #include "../../xen/include/xen/xxhash.h"
 #include "../../xen/lib/xxhash64.c"
diff --git a/xen/common/lz4/defs.h b/xen/common/lz4/defs.h
index e477806634c1..b697a06c00d7 100644
--- a/xen/common/lz4/defs.h
+++ b/xen/common/lz4/defs.h
@@ -12,7 +12,6 @@
 #define COMMON_LZ4_DEFS_H
 
 #ifdef __XEN__
-#include <asm/byteorder.h>
 #include <xen/unaligned.h>
 #else
 
diff --git a/xen/common/lzo.c b/xen/common/lzo.c
index 07b4017812dc..0393ec5c4472 100644
--- a/xen/common/lzo.c
+++ b/xen/common/lzo.c
@@ -68,7 +68,6 @@
 
 #ifdef __XEN__
 #include <xen/lib.h>
-#include <asm/byteorder.h>
 #include <xen/unaligned.h>
 #else
 #define get_unaligned_le16(_p) (*(u16 *)(_p))
diff --git a/xen/common/unlzo.c b/xen/common/unlzo.c
index acb8dff600fc..d52c1c92548d 100644
--- a/xen/common/unlzo.c
+++ b/xen/common/unlzo.c
@@ -33,7 +33,6 @@
 #include <xen/lzo.h>
 
 #ifdef __XEN__
-#include <asm/byteorder.h>
 #include <xen/unaligned.h>
 #else
 
diff --git a/xen/common/xz/private.h b/xen/common/xz/private.h
index a63379994fd6..3dce124fa743 100644
--- a/xen/common/xz/private.h
+++ b/xen/common/xz/private.h
@@ -12,7 +12,6 @@
 
 #ifdef __XEN__
 #include <xen/kernel.h>
-#include <asm/byteorder.h>
 #include <xen/unaligned.h>
 #else
 
-- 
2.39.5


