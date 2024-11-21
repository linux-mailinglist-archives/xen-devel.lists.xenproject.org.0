Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BC89D4F17
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2024 15:51:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841544.1257031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE8VY-0008Dy-4W; Thu, 21 Nov 2024 14:50:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841544.1257031; Thu, 21 Nov 2024 14:50:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE8VY-0008CI-1x; Thu, 21 Nov 2024 14:50:12 +0000
Received: by outflank-mailman (input) for mailman id 841544;
 Thu, 21 Nov 2024 14:50:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XSdi=SQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tE8VW-0008CA-St
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2024 14:50:10 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4d18fd4-a817-11ef-a0cc-8be0dac302b0;
 Thu, 21 Nov 2024 15:50:05 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5cfa1ec3b94so1255904a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2024 06:50:05 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cff454f905sm1918263a12.87.2024.11.21.06.50.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 06:50:03 -0800 (PST)
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
X-Inumbo-ID: e4d18fd4-a817-11ef-a0cc-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzYiLCJoZWxvIjoibWFpbC1lZDEteDUzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImU0ZDE4ZmQ0LWE4MTctMTFlZi1hMGNjLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMjAwNjA1LjE4MTYwMiwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732200604; x=1732805404; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FLxDW78Evs4vbLxthbNP1M7wd0kSNpfLNBWorWpiKos=;
        b=C8TJ4FOBb80fKfsx28PRYakhufCdGZvEXmsj1ejhTbNx66nBuNVx1b0/7OoDDpulzS
         DhP39irY5o2OLVMEN1IjnJDclzaP69nPubQ5PycqA6WoWLY9lbgq8kzhYaxMDTma225U
         Iq3Ic2X3gHRK1xnJEhe9tv9fSSr2JGNWf3d1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732200604; x=1732805404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FLxDW78Evs4vbLxthbNP1M7wd0kSNpfLNBWorWpiKos=;
        b=ANulgsZ3B5tYAHs9QWpvvSwD8CVS5Pibs9QBG9HY+KW3GWV/0O+NvaBikDftOK8oBF
         7z4nZEHnXJu/M6v0GQRjJQOlQVOMM7q7oYvSDRhcLoOasRT5jhA3zqz3mXQMul3oHwrg
         BFG1Xe60hAFgrOpx7Jgu+rds1EQyAfgm0kmL8NXKv3MabMuZjlrconCEkWMn22lvZ3Iq
         G5xLWTqzYcXUVbVcCbwDpGRTiI0NWRV98lZAPib5o3coBwXFwKLU+NWcrK67lkeZWIZy
         sl1Zl4KJs4vXCN8KTJGUhJtPI1/afnHCdfq2xCdY7+SlWZekMCVl7Q/XB3M+yfU17Rjg
         dDuA==
X-Gm-Message-State: AOJu0YyOHpgHcOcCInMIm+LOeCPPLKojFjgkPcwyE4okdPEPZKb8a//i
	u9DeQfSjlHIL02wJSHmHWguaBJyQg4PmNPY6EI+j89sP87kM6YjEYSWJZvncCQ8zfpfR8vqpMvn
	X
X-Gm-Gg: ASbGncvVDimULJZ86OWSZO0YsC1WdH37CAie4D/EwWpTNc8rWlTLZxl5Ixq6aCWmNv9
	U3Paunt82ECQZ8423CpRvYbAM79e1A25F/fmKqNMRC6unNja6sj2lcz1pG4d65/Hnxd+814a+0Q
	F1w8TdGx6SiEw7kril+EJmtAXxG+LGUvAiLS03qREkEhveE+GBL8pXQv0dLmatJzufG9gTe8upR
	qDJc3UDsN5IGzWnjrXCIECjdstnk3omZ0B5Uv6FqFJF3Pdpn7CX9fhAqTScolhE9ogISyaSOifi
X-Google-Smtp-Source: AGHT+IFNGquWo6o+yBJEmIMazjnVvxeA0Nv7KGN3vii+yokFL/TCuYl8xtfmk0/Am5op9UihAJeVjw==
X-Received: by 2002:a05:6402:42c6:b0:5cf:a1c1:526e with SMTP id 4fb4d7f45d1cf-5cff4b1ffdfmr5763646a12.10.1732200604494;
        Thu, 21 Nov 2024 06:50:04 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH] xen/bitops: Fix break with in a for_each_set_bit() loop
Date: Thu, 21 Nov 2024 14:50:00 +0000
Message-Id: <20241121145000.3107723-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

for_each_set_bit()'s use of a double for loop had an accidental bug with a
break in the inner loop leading to an infinite outer loop.

Adjust for_each_set_bit() to avoid this behaviour, and add extend
test_for_each_set_bit() with a test case for this.

Fixes: ed26376f20bf ("xen/bitops: Introduce for_each_set_bit()")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Frediano Ziglio <frediano.ziglio@cloud.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>

Both GCC and Clang seem happy with this, even at -O1:

  https://godbolt.org/z/o6ohjrzsY
---
 xen/common/bitops.c      | 16 ++++++++++++++++
 xen/include/xen/bitops.h |  2 +-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/xen/common/bitops.c b/xen/common/bitops.c
index 91ae961440af..0edd62d25c28 100644
--- a/xen/common/bitops.c
+++ b/xen/common/bitops.c
@@ -110,6 +110,22 @@ static void __init test_for_each_set_bit(void)
 
     if ( ull != ull_res )
         panic("for_each_set_bit(uint64) expected %#"PRIx64", got %#"PRIx64"\n", ull, ull_res);
+
+    /* Check that we break from the middle of the loop */
+    ui = HIDE(0x80001008U);
+    ui_res = 0;
+    for_each_set_bit ( i, ui )
+    {
+        static __initdata unsigned int count;
+
+        if ( count++ > 1 )
+            break;
+
+        ui_res |= 1U << i;
+    }
+
+    if ( ui_res != 0x1008 )
+        panic("for_each_set_bit(break) expected 0x1008, got %#x\n", ui_res);
 }
 
 static void __init test_multiple_bits_set(void)
diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
index 79615fb89d04..448b2d3e0937 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -299,7 +299,7 @@ static always_inline attr_const unsigned int fls64(uint64_t x)
  * A copy of @val is taken internally.
  */
 #define for_each_set_bit(iter, val)                     \
-    for ( typeof(val) __v = (val); __v; )               \
+    for ( typeof(val) __v = (val); __v; __v = 0 )       \
         for ( unsigned int (iter);                      \
               __v && ((iter) = ffs_g(__v) - 1, true);   \
               __v &= __v - 1 )

base-commit: e0058760a0c7935ad0690d8b9babb9050eceedf0
-- 
2.39.5


