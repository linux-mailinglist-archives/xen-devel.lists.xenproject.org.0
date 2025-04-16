Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DECA8B80A
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 13:59:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955722.1349381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u51Q9-0007bg-Kf; Wed, 16 Apr 2025 11:59:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955722.1349381; Wed, 16 Apr 2025 11:59:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u51Q9-0007T0-CL; Wed, 16 Apr 2025 11:59:13 +0000
Received: by outflank-mailman (input) for mailman id 955722;
 Wed, 16 Apr 2025 11:59:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9TmO=XC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u51Q6-0006At-9i
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 11:59:10 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34a39763-1aba-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 13:59:09 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43d0c18e84eso33429075e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Apr 2025 04:59:09 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4405b5a9846sm18761905e9.35.2025.04.16.04.59.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 04:59:08 -0700 (PDT)
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
X-Inumbo-ID: 34a39763-1aba-11f0-9eaf-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744804749; x=1745409549; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bAHFmZ0YTI0ch3CUZiHZjytiZehcl/1327xDDjJIcTI=;
        b=rpxo53rYdax78cZI5TNTV4gX2brpnBpTxVJU5Fm7PGwqexlJkExrL4X06s3wL2u9Fd
         Iki7HyGY4PGJ7cqNoe8EVXbSI4vgURYTp2mfGJhsKXvVR+msMc1/rL0CmhViJKsPuwMM
         2kA0dZUk3230RIoq6ZSfnZU8nVjSwL8SR9jfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744804749; x=1745409549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bAHFmZ0YTI0ch3CUZiHZjytiZehcl/1327xDDjJIcTI=;
        b=kbopPPNnFlfmDxAcocuWj95J7Gli544RremGHJr/Ngo507Efz6H6V92w7xLB3cwuqe
         bDTOmGFNJWhJfFvfd6d7Vp+58Ple9+27G7NjU3ojGi5gUX+FgSbYK/veQOtLkwpKzg/y
         DU+bep84aCpb0xgU7bEqtOvz2LwcsoDotbjD4wV1v1pL2YWf4J8+ISW68Kd9GPELi3+/
         oSJLhMeVVMaAy2xTv83YQaibZOD5SwYbTYlXNGP7grGgeldsEHBX4BRxsaEPJuEj8n2Z
         aVxUDKcYik1tuAI62+xavYDq7YeKBeHa+wFhalgKn3Tg3zKSuQs404tMYEOqTLYdn+SD
         fxxw==
X-Gm-Message-State: AOJu0YxMaynAdxgBghGvEBEjGESsvnxu0fPdH5l5bKQCRcwIcPCfpnAW
	Wv+ua2XdOFrJHTcH4MP+tpunWKhIU/L3Dg5QC/pFdzuLLxXjqMhyvYhqPkCTwgwUA4zkphyz1GH
	q8wc=
X-Gm-Gg: ASbGnctEEOy3mwXpPkErFZ1vmnP3a5G2TlWNsLE3Bhsqle+ieXYmHuSzJZ8EdEqSk8m
	0A6hXYW2jCFCZHx9q0TUYp3tKAL5o7V4nMR4lk73WKO91V68Wr/NvgIHVNxTunqzUaQe0WKXLm5
	TqWAC9kmjSVc5D1M1ksmjpPNG3sQU2Zt1n5I3zcTEogquGmVFTsaQ/tRCeceWANpoAPL73sroYk
	UrnnSH+mg5KrM3QlDdPoY8+0oheWFOaQrrQGOzWKUFhD4UEZgBelf0pFRkY2jPQryIW/S5/FBtw
	xsnjDVmAZPiC+qJrkWFB6x0b3sljMKQmfU7q1dVAzy/iqQa5L64s1dkKke5ID+7CK7z8QtP8gnS
	rbGnw1fim6Pda9g==
X-Google-Smtp-Source: AGHT+IG3f3gIuKL6j33O8Q/WmKOufRM5b+ujOD3HzCxzUtYppN6Oy7/An7BvcbbCGoXrkokkPdTEjQ==
X-Received: by 2002:a05:600c:3487:b0:43c:f70a:2af0 with SMTP id 5b1f17b1804b1-4405d62a49cmr19411175e9.16.1744804749192;
        Wed, 16 Apr 2025 04:59:09 -0700 (PDT)
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
Subject: [PATCH v6 07/15] xen/decompressors: Use new byteorder infrastructure
Date: Wed, 16 Apr 2025 12:58:52 +0100
Message-Id: <20250416115900.2491661-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250416115900.2491661-1-andrew.cooper3@citrix.com>
References: <20250416115900.2491661-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lin Liu <lin.liu@citrix.com>

unaligned.h already inlcudes byteorder.h, so most can simply be dropped.

No functional change.

Signed-off-by: Lin Liu <lin.liu@citrix.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
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
index 17efb1cc8f1d..9a9d39c4239b 100644
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


