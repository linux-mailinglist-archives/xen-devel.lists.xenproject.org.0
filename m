Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE978CEAAD
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 22:04:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729756.1135105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAb8y-0001m0-Dh; Fri, 24 May 2024 20:04:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729756.1135105; Fri, 24 May 2024 20:04:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAb8x-0001e3-TQ; Fri, 24 May 2024 20:03:59 +0000
Received: by outflank-mailman (input) for mailman id 729756;
 Fri, 24 May 2024 20:03:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PGXh=M3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sAb8v-000773-Eb
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 20:03:57 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c01d67a2-1a08-11ef-b4bb-af5377834399;
 Fri, 24 May 2024 22:03:55 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a59a609dd3fso649410766b.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 May 2024 13:03:55 -0700 (PDT)
Received: from andrewcoop.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626c9377d8sm173553066b.55.2024.05.24.13.03.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 13:03:54 -0700 (PDT)
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
X-Inumbo-ID: c01d67a2-1a08-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716581035; x=1717185835; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0OUrbEItmp/7smeXVfEuek5P5UjrbBJNpLNlS999tow=;
        b=u+aF8XMjIi9Fnwe7rnYtGFtvSyasc/4Qvlnxsuz4Ubw+8Y4TfXwt7RvTNBKwerXNB+
         zVlnRRtoGYJdivfzyYAg/kzQFenKpxMMOv7VL+gdZt5bNPiUZqf2+5YS+xgt2B4hAtjQ
         Q72uhwQ7EJxf1QX1BfUhhrZMf9UdnIAXsAfyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716581035; x=1717185835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0OUrbEItmp/7smeXVfEuek5P5UjrbBJNpLNlS999tow=;
        b=c9sRBk9pReIdHVEmlzB3wAluzBEeWXksyATgeV0zxOFN2CjranK1Z6cHQ1yqxEnFt2
         equzeV+cmwB8REz0HOWA0rPFUMlA2NyFSYuN/39JzLw0mFKm+MsIBur47tamaz5lBvIU
         rUwOrlBX/i+wI7mg5lDQFtW0V0MpJpEhRharIsRKQ7e4N/kgnARiZqS9GS0itTUosSU2
         w9OYP3B9p+6WVe+iXUuZrZ7TEMn/VtC578GGghKmO7W/LObHedwt7Pzo52EnOmLPwrht
         62SpIs+NkZTEJP4Zik3YNhemaxt05cLPhjJbrLm/YvF39cauSLTZc2zWj2sKadL4XrNg
         8qvQ==
X-Gm-Message-State: AOJu0YyXLGoJ9to+O3CBg5HLoh6A5HvBbKylEsTspt9skiYHqmY5z2Du
	dr2GxnIQW0HBFsz9ZDWY9jxR7j8x6x/qTqMLWXFEYtjA2dPyu/k6PYzUbOSwbix4zVvsdzP7rj+
	4HA8=
X-Google-Smtp-Source: AGHT+IFDepIWI/VDxApQZRZYemyfm2VE+hQJWb/SbSRzW6+QTax//5EAno8CL93TfAhRjnW5+HYXQQ==
X-Received: by 2002:a17:906:a04e:b0:a62:44e1:3f56 with SMTP id a640c23a62f3a-a6244e14068mr444618466b.37.1716581035180;
        Fri, 24 May 2024 13:03:55 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Federico Serafini <federico.serafini@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH v2 12/13] xen/bitops: Clean up ffs64()/fls64() definitions
Date: Fri, 24 May 2024 21:03:37 +0100
Message-Id: <20240524200338.1232391-13-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240524200338.1232391-1-andrew.cooper3@citrix.com>
References: <20240524200338.1232391-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Implement ffs64() and fls64() as plain static inlines, dropping the ifdefary
and intermediate generic_f?s64() forms.

Add tests for all interesting bit positions at 32bit boundaries.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
CC: consulting@bugseng.com <consulting@bugseng.com>
CC: Simone Ballarin <simone.ballarin@bugseng.com>
CC: Federico Serafini <federico.serafini@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>

v2:
 * Use ULL rather than a uint64_t cast.
 * Extend to fls64() too.
---
 xen/common/bitops.c      | 32 ++++++++++++++++++++++++++++++
 xen/include/xen/bitops.h | 42 +++++++++++++++++++---------------------
 2 files changed, 52 insertions(+), 22 deletions(-)

diff --git a/xen/common/bitops.c b/xen/common/bitops.c
index b4845d9e84d1..5482e5a1218d 100644
--- a/xen/common/bitops.c
+++ b/xen/common/bitops.c
@@ -24,6 +24,22 @@ static void __init test_ffs(void)
     CHECK(ffsl, 1UL << 32, 33);
     CHECK(ffsl, 1UL << 63, 64);
 #endif
+
+    /*
+     * unsigned int ffs64(uint64_t)
+     *
+     * 32-bit builds of Xen have to split this into two adjacent operations,
+     * so test all interesting bit positions across the divide.
+     */
+    CHECK(ffs64, 0, 0);
+    CHECK(ffs64, 1, 1);
+    CHECK(ffs64, 3, 1);
+    CHECK(ffs64, 7, 1);
+    CHECK(ffs64, 6, 2);
+
+    CHECK(ffs64, 0x8000000080000000ULL, 32);
+    CHECK(ffs64, 0x8000000100000000ULL, 33);
+    CHECK(ffs64, 0x8000000000000000ULL, 64);
 }
 
 static void __init test_fls(void)
@@ -48,6 +64,22 @@ static void __init test_fls(void)
     CHECK(flsl, 1 | (1UL << 32), 33);
     CHECK(flsl, 1 | (1UL << 63), 64);
 #endif
+
+    /*
+     * unsigned int ffl64(uint64_t)
+     *
+     * 32-bit builds of Xen have to split this into two adjacent operations,
+     * so test all interesting bit positions across the divide.
+     */
+    CHECK(fls64, 0, 0);
+    CHECK(fls64, 1, 1);
+    CHECK(fls64, 3, 2);
+    CHECK(fls64, 7, 3);
+    CHECK(fls64, 6, 3);
+
+    CHECK(fls64, 0x0000000080000001ULL, 32);
+    CHECK(fls64, 0x0000000100000001ULL, 33);
+    CHECK(fls64, 0x8000000000000001ULL, 64);
 }
 
 static void __init __constructor test_bitops(void)
diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
index e7df6377372d..c5518d2c8552 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -60,6 +60,14 @@ static always_inline __pure unsigned int ffsl(unsigned long x)
 #endif
 }
 
+static always_inline __pure unsigned int ffs64(uint64_t x)
+{
+    if ( BITS_PER_LONG == 64 )
+        return ffsl(x);
+    else
+        return !x || (uint32_t)x ? ffs(x) : ffs(x >> 32) + 32;
+}
+
 static always_inline __pure unsigned int fls(unsigned int x)
 {
     if ( __builtin_constant_p(x) )
@@ -84,6 +92,18 @@ static always_inline __pure unsigned int flsl(unsigned long x)
 #endif
 }
 
+static always_inline __pure unsigned int fls64(uint64_t x)
+{
+    if ( BITS_PER_LONG == 64 )
+        return flsl(x);
+    else
+    {
+        uint32_t h = x >> 32;
+
+        return h ? fls(h) + 32 : fls(x);
+    }
+}
+
 /* --------------------- Please tidy below here --------------------- */
 
 #ifndef find_next_bit
@@ -134,28 +154,6 @@ extern unsigned long find_first_zero_bit(const unsigned long *addr,
                                          unsigned long size);
 #endif
 
-#if BITS_PER_LONG == 64
-# define fls64 flsl
-# define ffs64 ffsl
-#else
-# ifndef ffs64
-static inline int generic_ffs64(__u64 x)
-{
-    return !x || (__u32)x ? ffs(x) : ffs(x >> 32) + 32;
-}
-#  define ffs64 generic_ffs64
-# endif
-# ifndef fls64
-static inline int generic_fls64(__u64 x)
-{
-    __u32 h = x >> 32;
-
-    return h ? fls(h) + 32 : fls(x);
-}
-#  define fls64 generic_fls64
-# endif
-#endif
-
 static inline int get_bitmask_order(unsigned int count)
 {
     int order;
-- 
2.30.2


