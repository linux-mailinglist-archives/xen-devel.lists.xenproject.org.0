Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCB8A74B70
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 14:45:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930662.1333275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyA0n-00065u-MQ; Fri, 28 Mar 2025 13:44:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930662.1333275; Fri, 28 Mar 2025 13:44:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyA0n-00062E-HL; Fri, 28 Mar 2025 13:44:41 +0000
Received: by outflank-mailman (input) for mailman id 930662;
 Fri, 28 Mar 2025 13:44:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IZL4=WP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tyA0m-0005Dj-1K
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 13:44:40 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cadc374f-0bda-11f0-9ffa-bf95429c2676;
 Fri, 28 Mar 2025 14:44:38 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso15049135e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 28 Mar 2025 06:44:38 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8314f5c6sm73339085e9.40.2025.03.28.06.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 06:44:36 -0700 (PDT)
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
X-Inumbo-ID: cadc374f-0bda-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743169477; x=1743774277; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a8W5SkdckqpViwNw8B8SNV+vwNGpyKIiESmN47LM7ug=;
        b=k3F71TGlpKWc0h0UociXjUdpjfnQ733SNJamr7weppzYTnkTja9bZ4dPS0TmRO5xhT
         nmEJ2qY0zEqCexIM2gD7hmfUXkP3RWPBwsGHFsloLTB3uZ+WrUk8gvLGt+s65FYtYDAq
         XoerqlLBaeEmajqTowBrv36UPo6M4nX7LltPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743169477; x=1743774277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a8W5SkdckqpViwNw8B8SNV+vwNGpyKIiESmN47LM7ug=;
        b=MNurhW4fKAEbw77x9j0xrgTyzVpgqylhugx3DuOuq6DoysRRYndTitLhvrvhX+EJ6t
         HV51bkpbPZo1tmn1lQxiFKPDK4mqV2nc4qQSkBaUiFK1cRvJ+UmtBTXON1NN6bOc3uc8
         k4itJPtxgGC/C7qdGRr83WHnjqVajznK1QyqRESNVJG6Lk2V0Pd7vWBJB3XivJcYTw2S
         0FeBfiraUjiIMsiUCePagejrud2Qxo/znuMDUnzmsnQv7YTbf1gnxooaYfjQjfa7v0Sq
         oZ32OEDFzRrWdajm6/IWGWtV4g/T9LLUk/8z3B27oX8SWlEK1Ag009vKodFCfNHD+RiD
         4qCg==
X-Gm-Message-State: AOJu0Yxz0N97q6ioa1zB6k0i5vX+gulW4XXKZRNfEs3epUe7/WErJTWK
	j1oLAlnAweNL+rWmLk5gx9sog1ewR1Bcjqb1iXnZr2JSAU1o2B54L3L0iayMQRlvdUpCo4dlBlf
	WzBc=
X-Gm-Gg: ASbGncsLTVrOjOcc+c1IIyfLpOHjwcTh6n4uF7xCY+au/JjjmgxUtu65yKl/uNdfmke
	oSEWWMQ3v8s6arxEX6bPxwOnkOWWALgh3hlix2SuxlddikQGBBq1XBRYHNlk32xlzC8cuklno8B
	dzcpgE52EF49Zj0r+a5XZsrjS6FIdSyGqWsQx5Y2xPU9PdMUSkD2HmJn+tk5EQXsrRfcDWBFTZF
	QTWN+T/okutByBZv7foGnqvHvt0R09ZA+xhZA/hh3kVN3G4/+p1/AHk4pSF5Nww83uGUVTDVjMp
	DMDSEDUze6VbQzaD+RoWXB52PoL6pvS53v/TIUhR5TAINvcqMk/MelcgFYWfzKEW+qn2y+V9x0s
	tYNZVqK5ykgkjrEYRQA==
X-Google-Smtp-Source: AGHT+IG2t1EAyDACSeBb/uY/ZuDdN+wJPR2Z8n9fr2z1771JJWgzWikUg+Oo6d29LOM7vxTz9J1mag==
X-Received: by 2002:a05:600c:1c0e:b0:43c:fffc:7886 with SMTP id 5b1f17b1804b1-43d850a93c9mr72645975e9.8.1743169477478;
        Fri, 28 Mar 2025 06:44:37 -0700 (PDT)
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
Subject: [PATCH v5 04/16] xen/lib: Switch to xen/byteorder.h
Date: Fri, 28 Mar 2025 13:44:15 +0000
Message-Id: <20250328134427.874848-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250328134427.874848-1-andrew.cooper3@citrix.com>
References: <20250328134427.874848-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lin Liu <lin.liu@citrix.com>

In divmod.c, additionally swap xen/lib.h for xen/macros.h as only ABS() is
needed.

In find-next-bit.c, ext2 has nothing to do with this logic.  Despite the
comments, it was a local modification when the logic was imported from Linux,
because Xen didn't have a suitable helper.

The new infrsatructure does have a suitable primitive, so use it.

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

The find-next-bit.c changes, being inside __BIG_ENDIAN aren't even compiled in
any build of Xen.  I manually checked that they compiled.

v5:
 * Rebase
 * Include a fixto divmod.c
 * Explain why even Linux has never had anything by the name ext2_swab()
---
 xen/lib/divmod.c        |  5 ++---
 xen/lib/find-next-bit.c | 39 +++++++--------------------------------
 2 files changed, 9 insertions(+), 35 deletions(-)

diff --git a/xen/lib/divmod.c b/xen/lib/divmod.c
index 0377d62130ae..b5b111dacecc 100644
--- a/xen/lib/divmod.c
+++ b/xen/lib/divmod.c
@@ -1,6 +1,5 @@
-#include <xen/lib.h>
-#include <xen/types.h>
-#include <asm/byteorder.h>
+#include <xen/byteorder.h>
+#include <xen/macros.h>
 
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


