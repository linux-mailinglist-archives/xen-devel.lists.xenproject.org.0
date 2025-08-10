Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5C4B1FA15
	for <lists+xen-devel@lfdr.de>; Sun, 10 Aug 2025 15:07:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1076671.1437993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ul5kq-0001se-2D; Sun, 10 Aug 2025 13:06:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1076671.1437993; Sun, 10 Aug 2025 13:06:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ul5kp-0001ql-TL; Sun, 10 Aug 2025 13:06:27 +0000
Received: by outflank-mailman (input) for mailman id 1076671;
 Sun, 10 Aug 2025 13:05:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AkvK=2W=gmail.com=nicola.vetrini@bugseng.com>)
 id 1ul5jj-0001pP-10
 for xen-devel@lists.xenproject.org; Sun, 10 Aug 2025 13:05:19 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a93a15e4-75ea-11f0-a325-13f23c93f187;
 Sun, 10 Aug 2025 15:05:17 +0200 (CEST)
Received: from nico.tail79467d.ts.net (unknown [46.228.253.214])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPSA id D4BC64EE0744;
 Sun, 10 Aug 2025 15:05:13 +0200 (CEST)
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
X-Inumbo-ID: a93a15e4-75ea-11f0-a325-13f23c93f187
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=46.228.253.214
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1754831116;
	b=fpKYXOsawbT/B0gieMLHTKuUgi3fgyM1C8YDH7ksLEPdgalPDTveiYFF474U3Y6Q3BMy
	 1Z82uxdVNPVQwVFQRYpU0dMdiw9/Ylz6W5US+TjW7B2RFyY7habJHyL4AwHvVnOI+Awfg
	 o0X28Mv51m8ZQ9bR6lXRjRLW/gGW8ZmU00H52MdFw7h2DXhQDGOvkHLjf1W20gRTqap2i
	 cWI8D0PZNXvpOGaXYnmztLIipm6wQuB+D3TIpfKPsPDVzhMYw9QWC6yEifk54hx+/bbKq
	 w7pMFPSQiFt2Qy//ixFwC8+YGI60QjCkfFkrgWn4Pw2KIIFJvzmd+1MkhUIMnM8Gk7WU4
	 us0g0i5BoPAGDjmVItW+rMfZPkRyDPhFm1mxIyaO1Kr/NO6sXJFIyndm6SxKG6bvyg1pj
	 ezrw4yRwxRgMP++dyeXYcHfLpfaofPuxM3Ndph4EXLYDvL05Vd1Bu/UjxNRCKN+PNQU9H
	 MM6RkficDc1Ry8bSrt4/P1m8khtCqKXpQCWrbIKt1LwyMvFK+dn+H2yxwEqqq+ZR3noxQ
	 jl5Z/8jrXgCGKjNSG79zFG9pVFbE0JaG0dC4+qDzRFt07aWjQkhYKS0+1rYerDkyPgS1F
	 kE/xF7GZgp5zL9mcTJOvwuBcY7vcmw0eHXHdV/wS7ivrUKWukkYuA6yvMbr/s4o=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1754831116;
	h=From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Wmwa6eEi2HUkBCkPAQOZ2YgwGrySmusYzIvJZGl4xUw=;
	b=tS8oeWr19VM4yJtAZKh+tUG0Zfg45inl5Vw6x5GteVziHGXPAPKDY8Okk2wF+fjO5RI0
	 rM/nQXocpjyOiOMpbyeZc4f5XjkpKSUIaSIR0wzBFrqRMLJbflOqDy6hsstazC4Q09Bz2
	 UnEtUmqON5kd/T9L3I9xYfX3pFmLpsdA2X7sd7gxnMxOu9ljLI33clk9L30v+1A++vxl8
	 9mvyVwn+9me4EMkx3nfmCZn8sBsM10IfMNBoARJx/SciJXjefKp3muHXgGpWuEYOXjSqy
	 bNuPA9GRpc9S92xeI30gzJ/gAcx79P7onqMeUsIO+lYPnjPfwJTnkruuSK+JYrDrmcghs
	 +7IYCxW/v2KnpaWigr9S4tBzXl6TmyNQpPyqZcOzQJhkC2CmNQ/bNFuMZZ/4gb2XdkMSz
	 H7CTmdIvTHYNZ4jTYzBK4NB8IND3JVL60lldcjDBoOYlWRri3+ETvTQjQXyx3vZhZd/n3
	 YBaJoOE0eU47fjYswIbKbIe70Yrot3fKEXlEJQBOw3dp8FSFIBXTKGbgGjLAc5WqeCe/d
	 6LNrYnJDV4dBuZ/g+jY1WQFGBg4hxkD6HRCDvCVqe0yz1jV7sBVOZnHIa0+CWC1sLG8Pc
	 99DZ6VHFhm4jdEfS6xHBkCHP8ftG86vpkZNdyPPh+TWTrOfM+z3xqfXgw+5d4FM=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=46.228.253.214
From: nicola.vetrini@gmail.com
To: xen-devel@lists.xenproject.org
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Nicola Vetrini <nicola.vetrini@gmail.com>
Subject: [XEN PATCH] xen: Drop logic for old clang versions.
Date: Sun, 10 Aug 2025 15:03:53 +0200
Message-ID: <e8bb42876317c19aca79f81c3fc48dc3a4fdaf71.1754830862.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nicola Vetrini <nicola.vetrini@bugseng.com>

The enforced toolchain baseline for clang is version 11,
therefore this logic is effectively dead code.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@gmail.com>
---
Mentioned in https://gitlab.com/xen-project/xen/-/issues/201
---
 xen/common/coverage/llvm.c   | 4 ----
 xen/include/xen/self-tests.h | 9 +--------
 2 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/xen/common/coverage/llvm.c b/xen/common/coverage/llvm.c
index 50d7a3c5d301..517b2aa8c202 100644
--- a/xen/common/coverage/llvm.c
+++ b/xen/common/coverage/llvm.c
@@ -44,12 +44,8 @@
     ((uint64_t)'f' << 16) | ((uint64_t)'R' << 8)  | ((uint64_t)129)
 #endif
 
-#if __clang_major__ >= 4 || (__clang_major__ == 3 && __clang_minor__ >= 9)
 #define LLVM_PROFILE_VERSION    4
 #define LLVM_PROFILE_NUM_KINDS  2
-#else
-#error "clang version not supported with coverage"
-#endif
 
 struct llvm_profile_data {
     uint64_t name_ref;
diff --git a/xen/include/xen/self-tests.h b/xen/include/xen/self-tests.h
index bd8a4867aa40..c57cceb3b962 100644
--- a/xen/include/xen/self-tests.h
+++ b/xen/include/xen/self-tests.h
@@ -10,16 +10,12 @@
 #include <xen/lib.h>
 
 /*
- * Check that fn(val) can be calcuated by the compiler, and that it gives the
+ * Check that fn(val) can be calculated by the compiler, and that it gives the
  * expected answer.
  *
- * Clang < 8 can't fold constants through static inlines, causing this to
- * fail.  Simply skip it for incredibly old compilers.
- *
  * N.B. fn is intentionally not bracketed to allow us to test function-like
  * macros too.
  */
-#if !defined(CONFIG_CC_IS_CLANG) || CONFIG_CLANG_VERSION >= 80000
 #define COMPILE_CHECK(fn, val, res)                                     \
     do {                                                                \
         typeof(fn(val)) real = fn(val);                                 \
@@ -29,9 +25,6 @@
         else if ( real != (res) )                                       \
             BUILD_ERROR("Compile time check '" STR(fn(val) == res) "' failed"); \
     } while ( 0 )
-#else
-#define COMPILE_CHECK(fn, val, res)
-#endif
 
 /*
  * Check that Xen's runtime logic for fn(val) gives the expected answer.  This
-- 
2.43.0


