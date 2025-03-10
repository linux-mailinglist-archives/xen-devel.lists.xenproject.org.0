Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E37AA58C38
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 07:43:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.905953.1313427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trWqq-0001GR-GD; Mon, 10 Mar 2025 06:43:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 905953.1313427; Mon, 10 Mar 2025 06:43:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trWqq-000195-6W; Mon, 10 Mar 2025 06:43:00 +0000
Received: by outflank-mailman (input) for mailman id 905953;
 Mon, 10 Mar 2025 04:58:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fu2G=V5=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1trVE8-00070S-Mx
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 04:58:56 +0000
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [2607:f8b0:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d8e6c01-fd6c-11ef-9898-31a8f345e629;
 Mon, 10 Mar 2025 05:58:54 +0100 (CET)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-22337bc9ac3so70486625ad.1
 for <xen-devel@lists.xenproject.org>; Sun, 09 Mar 2025 21:58:54 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736d2ae318csm1708308b3a.53.2025.03.09.21.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Mar 2025 21:58:52 -0700 (PDT)
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
X-Inumbo-ID: 5d8e6c01-fd6c-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741582733; x=1742187533; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OGwlDw5fL6/8/4sqaw9ZjtskhrLsqkJfziSvtmiyf9E=;
        b=dYKGUC4ns833MidhHbCiU1Ik8x3AXHorarfhFD9472lELlVv6/UXB9tcZ4jUUobFP/
         rIwqwB/WHu8FqWJnHd4ooWFghp9Cv3HySkwffAE7ucOjh/lSnUSHqJUHIQwGbPz7IR8s
         pb1R62vOqbmyS4BH6oXyncFY/bK7EdnMl6O2WqX3NlP8LG6vQis5HhO3Gpung4HP4cYf
         C+w0Cu0Gu79ut4wjMC3YAYvRs9c2j2+Dt2qqzFhytXbl0QG4cMThpIoGujnnDmS7UHL3
         G4aKCP8vwPBQurLqT5c7hgTk2wPzRe+3Q9f5dZPRKJDwrElpdOx05L7Gh25jyhIUJkNV
         VUYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741582733; x=1742187533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OGwlDw5fL6/8/4sqaw9ZjtskhrLsqkJfziSvtmiyf9E=;
        b=JZ1FSyyFUiCgAriv8Ic2LiUu40XV73xRmgLwban+K2W4Ht0Fe1tForQVhqoS4EvQpY
         WzXFEkI+idPiU2Q9hA++SqfvdqfhBNYqWPF4sRUkDHY4wplfs1UgF4YCfPwi8i+K78Pe
         m61YjtpZXVR7K/IITYQyW0vpOMcwCM9qjuCmcbPvXnntUi1Xy8jlmQmAkr3357TU9AI5
         oGwbutnMhp/uhP4kf/atweuDmh13rAbwbgQ0htvAA1a+TCSsjGkWuoCRMRYz/B9g/6Am
         qyWjswQ5uvUgxS/c0Z04OM4I9dF1TKAs0cKM2uJOPpsTJuYxIzfbtnC3VNuRzJIj3C62
         1OBw==
X-Forwarded-Encrypted: i=1; AJvYcCVbZj/OqMWCoxf3L41Z2p6MVgk5Z0lpu+Jw3jb3Np117sTR92aEZiwHzkDMtBerieNzJtoobWDwlo8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzI5ocD0FITfRSVT0F8M6GvrGr2XFJ3/MP0DEeM06fh99Spf0qy
	WJ/NAhIsyKBE9/X0SwMhuWwWDlAgzAhvhvmqnBmNI9PEVHuk2m86/L/DB9HBJqg=
X-Gm-Gg: ASbGncuwJ8N9xpK35diFlkEsm+r/oEaSaLtMk9vsNMKIRzg5DLXkHxuV/BaKNK6buGl
	ysSf78UT/GyhoDDDzxgPjTufWGyOGmz8vwCzURNwhltsy7IpNw0bPCRtl14kw4YB343/bfkoOKp
	2skVXSqeqd/rZQ76ZLpJbTJmDQtdTLT7G5UaqWmh3YBOrPZOIJdh1KcJZQVldOQBJ8L5vjiFVLh
	vr6Ewn8C1E+7zWj3FQn5TRIvfluUa05vrTJmqX7/MVT4hC1EoLkSmE0dMkRlq4eQx2Q6jOzmiO4
	SshwKpfZvMvF4kz2CPLrgv3QhjYTyFAUCzV07dX6FdYL
X-Google-Smtp-Source: AGHT+IF9OJp4stFJ9k/lsvOwoQRvqqkA/ZzdxglsajfWtO3On0dbMxz5MT0xvVfYC1mLC7gyZMGdug==
X-Received: by 2002:a05:6a00:13a9:b0:736:3be3:3d77 with SMTP id d2e1a72fcca58-736aaac69ddmr15637676b3a.16.1741582733352;
        Sun, 09 Mar 2025 21:58:53 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	alex.bennee@linaro.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	kvm@vger.kernel.org,
	Peter Xu <peterx@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	David Hildenbrand <david@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	manos.pitsidianakis@linaro.org,
	qemu-riscv@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 03/16] include: move target_words_bigendian() from tswap to bswap
Date: Sun,  9 Mar 2025 21:58:29 -0700
Message-Id: <20250310045842.2650784-4-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
References: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is needed for next commits (especially when implementing st/ld
primitives which will use this function).
As well, remove reference to TARGET_BIG_ENDIAN, as we are about to
remove this dependency.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/tswap.h | 11 -----------
 include/qemu/bswap.h | 12 ++++++++++++
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/include/exec/tswap.h b/include/exec/tswap.h
index ecd4faef015..cc662cd8b54 100644
--- a/include/exec/tswap.h
+++ b/include/exec/tswap.h
@@ -10,17 +10,6 @@
 
 #include "qemu/bswap.h"
 
-/**
- * target_words_bigendian:
- * Returns true if the (default) endianness of the target is big endian,
- * false otherwise. Note that in target-specific code, you can use
- * TARGET_BIG_ENDIAN directly instead. On the other hand, common
- * code should normally never need to know about the endianness of the
- * target, so please do *not* use this function unless you know very well
- * what you are doing!
- */
-bool target_words_bigendian(void);
-
 /*
  * If we're in target-specific code, we can hard-code the swapping
  * condition, otherwise we have to do (slower) run-time checks.
diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
index b915835bead..ebf6f9e5f5c 100644
--- a/include/qemu/bswap.h
+++ b/include/qemu/bswap.h
@@ -1,6 +1,8 @@
 #ifndef BSWAP_H
 #define BSWAP_H
 
+#include <stdbool.h>
+
 #undef  bswap16
 #define bswap16(_x) __builtin_bswap16(_x)
 #undef  bswap32
@@ -8,6 +10,16 @@
 #undef  bswap64
 #define bswap64(_x) __builtin_bswap64(_x)
 
+/**
+ * target_words_bigendian:
+ * Returns true if the (default) endianness of the target is big endian,
+ * false otherwise.
+ * Common code should normally never need to know about the endianness of the
+ * target, so please do *not* use this function unless you know very well
+ * what you are doing!
+ */
+bool target_words_bigendian(void);
+
 static inline uint32_t bswap24(uint32_t x)
 {
     return (((x & 0x000000ffU) << 16) |
-- 
2.39.5


