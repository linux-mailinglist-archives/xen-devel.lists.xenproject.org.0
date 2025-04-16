Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7B5A8B800
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 13:59:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955717.1349333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u51Q5-0006VV-30; Wed, 16 Apr 2025 11:59:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955717.1349333; Wed, 16 Apr 2025 11:59:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u51Q4-0006MV-UZ; Wed, 16 Apr 2025 11:59:08 +0000
Received: by outflank-mailman (input) for mailman id 955717;
 Wed, 16 Apr 2025 11:59:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9TmO=XC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u51Q3-0006At-F3
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 11:59:07 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32adc87c-1aba-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 13:59:06 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3912d2c89ecso6295337f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Apr 2025 04:59:06 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4405b5a9846sm18761905e9.35.2025.04.16.04.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 04:59:05 -0700 (PDT)
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
X-Inumbo-ID: 32adc87c-1aba-11f0-9eaf-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744804746; x=1745409546; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zUNa1Dyx+tMseYVZXh4eCgKt5Xt2Q/iT4S+G6caeN+A=;
        b=gdjnL1HFIg5WY7479hrdIbrnnrnFKekCcADcRVo/ygkMCPHbbmXAqmJVgB7cpjULdx
         U8mpo+++22JFuzIWa0zfGxQ4JK066SpnnaJwv6PRt8+Zx5DC/NII9/zL2jliWII+Q0Rq
         xh+MfVKakwQ7oBSW+zVBAdStYFZoQJKULDrZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744804746; x=1745409546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zUNa1Dyx+tMseYVZXh4eCgKt5Xt2Q/iT4S+G6caeN+A=;
        b=cPzWfFQtu7OeVi4OtT6hR5MR+v0L33uAQtOgCP8dHnGMdtPvwUYs/pcayqZI6fXPDW
         T0twjxGjT0F1+aKqppZ+jX6hIyoDy2mKcn2l4sbtcu0+fF6gA13BkqXHc0uXcL2jkUZl
         nAqXXEh0I3b6nj7eMcwYa49A0p5vqTM3Mp2AEIfSle1ELCZsmHc7sJ7udjHiYGnlZgg6
         K1xNO0ZC9KhA6j6LvdKHPBmR0vCa9FBRmjD1ZKnh/3KVgvR4Rba/2c1CGV2nu5er9wWI
         kxqnGBlxVc5O+eoPueOsOJCiItF23awB7brKjxpgwiPWJxg9T4p0obPK68+8309yMxeL
         TquA==
X-Gm-Message-State: AOJu0YybF82WqppUUOxbJwuHMaFzy04dU82lWrMYrFOuo9LBxUuLjk4F
	ENIApU6HRDBqBx1PnFWjaashM6PaLS8dXr9hzdq+yWxrqQV1dTg6IqHHauA8MUdsJNCt0ZQGXz3
	Qwz4=
X-Gm-Gg: ASbGncsZp86c1nGFGtARE0FqR7MsmliAOqc9irlBcH9nJ26dHcchPsQ5YG3iheIxvag
	hR7R4jbEdoHnPiiILGvOguW4Fas81CUGcpxhs1yRiIjhX6NvxCa1+5rjiuOt+Ie9/ZoCtdwbAdP
	5rbHHugakUFjkcz0LvO1dp6mf4yptGaPcFO+uGJyqA2rWmxMDovDDefqPqvDlGPNLrzjqsoMLZc
	nurllwfggs/n2WJFqD/5NZCGE368PtksS9VU5OL/bDKW4Zg3IGbMybvOJjLPxFx4buTDUANzfD+
	P5QCwWj7DI/jXuWDb/J0wJcsMn+XtRw+bwrWt2ax8vrNYC8oQM0w9Gox2XJYN05r4pRA33px7df
	1PI+A2LwjnuJFBw==
X-Google-Smtp-Source: AGHT+IFC4KxZoundul9p9QvnfODv9XvUcsDB9qkah3he6c9DvXWbth2Ekotn4vNSN2k4PfjCVyFRhw==
X-Received: by 2002:a5d:584d:0:b0:391:41c9:7a87 with SMTP id ffacd0b85a97d-39ee5baf64bmr1447365f8f.51.1744804745744;
        Wed, 16 Apr 2025 04:59:05 -0700 (PDT)
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
Subject: [PATCH v6 03/15] xen/lib: Switch to xen/byteorder.h
Date: Wed, 16 Apr 2025 12:58:48 +0100
Message-Id: <20250416115900.2491661-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250416115900.2491661-1-andrew.cooper3@citrix.com>
References: <20250416115900.2491661-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lin Liu <lin.liu@citrix.com>

In divmod.c, additionally swap xen/lib.h for xen/macros.h as only ABS() is
needed.

In find-next-bit.c, ext2 has nothing to do with this logic.  It was a local
modification when the logic was imported from Linux, because Xen didn't have a
suitable helper.

The new infrastructure does have a suitable primitive, so use it.

No functional change.

Signed-off-by: Lin Liu <lin.liu@citrix.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
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

The find-next-bit.c changes, being inside __BIG_ENDIAN aren't even compiled in
any build of Xen.  I manually checked that they compiled.

v5:
 * Rebase
 * Include a fixto divmod.c
 * Explain why even Linux has never had anything by the name ext2_swab()
---
 xen/lib/divmod.c        |  4 ++--
 xen/lib/find-next-bit.c | 39 +++++++--------------------------------
 2 files changed, 9 insertions(+), 34 deletions(-)

diff --git a/xen/lib/divmod.c b/xen/lib/divmod.c
index 0377d62130ae..063e867a81ed 100644
--- a/xen/lib/divmod.c
+++ b/xen/lib/divmod.c
@@ -1,6 +1,6 @@
-#include <xen/lib.h>
+#include <xen/byteorder.h>
+#include <xen/macros.h>
 #include <xen/types.h>
-#include <asm/byteorder.h>
 
 /*
  * A couple of 64 bit operations ported from FreeBSD.
diff --git a/xen/lib/find-next-bit.c b/xen/lib/find-next-bit.c
index 761b02739841..9b8d7814f20c 100644
--- a/xen/lib/find-next-bit.c
+++ b/xen/lib/find-next-bit.c
@@ -9,8 +9,7 @@
  * 2 of the License, or (at your option) any later version.
  */
 #include <xen/bitops.h>
-
-#include <asm/byteorder.h>
+#include <xen/byteorder.h>
 
 #define __ffs(x) (ffsl(x) - 1)
 #define ffz(x) __ffs(~(x))
@@ -164,30 +163,6 @@ EXPORT_SYMBOL(find_first_zero_bit);
 
 #ifdef __BIG_ENDIAN
 
-/* include/linux/byteorder does not support "unsigned long" type */
-static inline unsigned long ext2_swabp(const unsigned long * x)
-{
-#if BITS_PER_LONG == 64
-	return (unsigned long) __swab64p((u64 *) x);
-#elif BITS_PER_LONG == 32
-	return (unsigned long) __swab32p((u32 *) x);
-#else
-#error BITS_PER_LONG not defined
-#endif
-}
-
-/* include/linux/byteorder doesn't support "unsigned long" type */
-static inline unsigned long ext2_swab(const unsigned long y)
-{
-#if BITS_PER_LONG == 64
-	return (unsigned long) __swab64((u64) y);
-#elif BITS_PER_LONG == 32
-	return (unsigned long) __swab32((u32) y);
-#else
-#error BITS_PER_LONG not defined
-#endif
-}
-
 #ifndef find_next_zero_bit_le
 unsigned long find_next_zero_bit_le(const void *addr, unsigned
 		long size, unsigned long offset)
@@ -202,7 +177,7 @@ unsigned long find_next_zero_bit_le(const void *addr, unsigned
 	size -= result;
 	offset &= (BITS_PER_LONG - 1UL);
 	if (offset) {
-		tmp = ext2_swabp(p++);
+		tmp = bswapl(*p++);
 		tmp |= (~0UL >> (BITS_PER_LONG - offset));
 		if (size < BITS_PER_LONG)
 			goto found_first;
@@ -220,7 +195,7 @@ unsigned long find_next_zero_bit_le(const void *addr, unsigned
 	}
 	if (!size)
 		return result;
-	tmp = ext2_swabp(p);
+	tmp = bswapl(*p);
 found_first:
 	tmp |= ~0UL << size;
 	if (tmp == ~0UL)	/* Are any bits zero? */
@@ -229,7 +204,7 @@ unsigned long find_next_zero_bit_le(const void *addr, unsigned
 	return result + ffz(tmp);
 
 found_middle_swap:
-	return result + ffz(ext2_swab(tmp));
+	return result + ffz(bswapl(tmp));
 }
 EXPORT_SYMBOL(find_next_zero_bit_le);
 #endif
@@ -248,7 +223,7 @@ unsigned long find_next_bit_le(const void *addr, unsigned
 	size -= result;
 	offset &= (BITS_PER_LONG - 1UL);
 	if (offset) {
-		tmp = ext2_swabp(p++);
+		tmp = bswapl(*p++);
 		tmp &= (~0UL << offset);
 		if (size < BITS_PER_LONG)
 			goto found_first;
@@ -267,7 +242,7 @@ unsigned long find_next_bit_le(const void *addr, unsigned
 	}
 	if (!size)
 		return result;
-	tmp = ext2_swabp(p);
+	tmp = bswapl(*p);
 found_first:
 	tmp &= (~0UL >> (BITS_PER_LONG - size));
 	if (tmp == 0UL)		/* Are any bits set? */
@@ -276,7 +251,7 @@ unsigned long find_next_bit_le(const void *addr, unsigned
 	return result + __ffs(tmp);
 
 found_middle_swap:
-	return result + __ffs(ext2_swab(tmp));
+	return result + __ffs(bswapl(tmp));
 }
 EXPORT_SYMBOL(find_next_bit_le);
 #endif
-- 
2.39.5


