Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9744CE9D10
	for <lists+xen-devel@lfdr.de>; Tue, 30 Dec 2025 14:51:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1194179.1512638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaa7q-0004zx-1W; Tue, 30 Dec 2025 13:51:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1194179.1512638; Tue, 30 Dec 2025 13:51:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaa7p-0004qt-N1; Tue, 30 Dec 2025 13:51:01 +0000
Received: by outflank-mailman (input) for mailman id 1194179;
 Tue, 30 Dec 2025 13:50:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=owPK=7E=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vaa7n-0004Hp-QX
 for xen-devel@lists.xenproject.org; Tue, 30 Dec 2025 13:50:59 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9243bd90-e586-11f0-b15c-2bf370ae4941;
 Tue, 30 Dec 2025 14:50:59 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-47d493a9b96so15241485e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Dec 2025 05:50:59 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193d4f09sm609436115e9.12.2025.12.30.05.50.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 05:50:57 -0800 (PST)
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
X-Inumbo-ID: 9243bd90-e586-11f0-b15c-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1767102658; x=1767707458; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BA95S3BhSIKto2edzOKUoBHlxbVHXxGpOHtfMAICa9E=;
        b=OX6Qz1SjNO2ia+XIOznlQAuD20OlUeULYcUW5wuWRODxOcev+slGvGyvGVtZKwGoU8
         jtwuxVXOFPTUPl/njO3PaGDwx6G1lxQqCsjDg7IC+tIK+Miowuvk4EVinl068mKKA/ix
         tQ3LSp/o1NUI0V9S5/Vlypq8jGJc9W8+hYsDo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767102658; x=1767707458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BA95S3BhSIKto2edzOKUoBHlxbVHXxGpOHtfMAICa9E=;
        b=RUeVkdxXCHejDL6VjI27hGFQEf72DS+FrWxTGnzkuq9XdkyOlt/BLKMisscYL8pZfa
         apVrTHXHZz81TvUS8/uqyyJUEDk5XFK9B5ETUFS/D1sw6UWRWM3eYmd5I6qCrB8rdUaL
         FUoKrfJlp4L8qOwJ44chrnzKCSYF8Sm0cRtRPwaC09BxEt9mMBOFAbFuWp1N5xmkfwJM
         PVFUn2ClioXg1wVFaSTI4+oV97ej0kOwTg/Il1eqfWNwm45OcuKuwXcO7BPiigzdu5/k
         jMVp8CRXukyzLVjOVSjUHsFlJaFgXcnvWaqjL7qKXv8/ar+TQl5mVhEWpDES/eD3k7Zr
         A5Kw==
X-Gm-Message-State: AOJu0Ywi7OJUy28nGhFTm4Hx0799+E3wDdc90fL36K10QH959/bsEkCZ
	7vkYitKTmPO6xi6FJjGddtBVLD0bT3qgvzQZpSCNNHzDZWFRiYGwkJVNKjKw74+h27rxm+lOEd9
	VLbFQ
X-Gm-Gg: AY/fxX4L8vMftTx4GWCSbPM8r0fh2wrxfKbx1zBn6nPvEedjhbDrweEP16XaBzOnTgI
	2BSK7KSuzMjESB9yQSiIqh+ykEiGkgroMp9i8j4I0GTFUw4KpjCk14wAyGpAd66uCfPf+hwBbQk
	CNcA9lZYOLzmsKPMq65NgeBxWuekVdAc9JL6MmqriXsnUhL8579aVATa51uQH7423CEbNcUDWwS
	yJ02NxULbIaFPxZI9kmelLBLBGaFpdDMkRno8VNRVeG812McXGUCLho+3jA7GWYajnMo6VeblL5
	zTKVsQbilJHdqZ9LGB1RAUKIJjWnEOxviGl0E19K3QCfmfwNo8WEVH+MIftk58KUudde4grpFp/
	Qm4bRMzP+OBTM1TKEcJAJtsdtNB141f/E5Nmi38ecIoZyQq8Qwxz+AOmBpa0jYBrCM8jImPYAQH
	sJmOhft4Wzmih3wSs6MKTSdkCKgaEd+o6eTJhtnV7YcQVL/cOEqulm7+gr6sYQtw==
X-Google-Smtp-Source: AGHT+IGHHSTZHncvNOn5fM7OrVg5QV+HhJ37AY1we+U46sqn0o99VgKmX7EW8/pGnd+VQat7Trgrng==
X-Received: by 2002:a05:600c:45d3:b0:47d:4044:4ada with SMTP id 5b1f17b1804b1-47d40444b44mr238890195e9.13.1767102658310;
        Tue, 30 Dec 2025 05:50:58 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 4/5] xen: Split muldiv64() out of lib.h
Date: Tue, 30 Dec 2025 13:50:49 +0000
Message-Id: <20251230135050.188191-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251230135050.188191-1-andrew.cooper3@citrix.com>
References: <20251230135050.188191-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

muldiv64() has 7 users across all architectures, and is limited to time
handling functions.  Therefore, move it's declaration out of lib.h into a
dedicated header.

Rename the library function to generic_muldiv64(), as x86 is going to provide
an arch_muldiv64() in a subsequent change.

Explain what the function does, including the limitations; x86's version will
suffer a divide error rather than truncate the result to 64 bits.

Annotate it with attr_const, not that this allows the optimiser to improve any
of Xen's current users.  Add one selftest to check the internal precision,
putting it in bitops.c for want of any better place to locate it.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

The reason the selftest can't go in lib/muldiv64.c is because doing so would
exclude the test when the arch variant is used.
---
 xen/arch/arm/time.c               |  2 +-
 xen/arch/riscv/include/asm/time.h |  4 ++--
 xen/arch/x86/emul-i8254.c         |  2 +-
 xen/arch/x86/time.c               |  2 +-
 xen/common/bitops.c               | 12 ++++++++++++
 xen/include/xen/lib.h             |  2 --
 xen/include/xen/muldiv.h          | 18 ++++++++++++++++++
 xen/lib/muldiv64.c                |  5 ++---
 8 files changed, 37 insertions(+), 10 deletions(-)
 create mode 100644 xen/include/xen/muldiv.h

diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
index 03dc5b51a890..7d8b9c0032c1 100644
--- a/xen/arch/arm/time.c
+++ b/xen/arch/arm/time.c
@@ -16,8 +16,8 @@
 #include <xen/event.h>
 #include <xen/init.h>
 #include <xen/irq.h>
-#include <xen/lib.h>
 #include <xen/mm.h>
+#include <xen/muldiv.h>
 #include <xen/notifier.h>
 #include <xen/sched.h>
 #include <xen/sched.h>
diff --git a/xen/arch/riscv/include/asm/time.h b/xen/arch/riscv/include/asm/time.h
index 63bdd471ccac..34e46353cce5 100644
--- a/xen/arch/riscv/include/asm/time.h
+++ b/xen/arch/riscv/include/asm/time.h
@@ -3,8 +3,8 @@
 #define ASM__RISCV__TIME_H
 
 #include <xen/bug.h>
-#include <xen/lib.h>
-#include <xen/types.h>
+#include <xen/muldiv.h>
+
 #include <asm/csr.h>
 
 /* Clock cycles count at Xen startup */
diff --git a/xen/arch/x86/emul-i8254.c b/xen/arch/x86/emul-i8254.c
index c16ed0bead87..5e90a14a5957 100644
--- a/xen/arch/x86/emul-i8254.c
+++ b/xen/arch/x86/emul-i8254.c
@@ -25,8 +25,8 @@
  */
 
 #include <xen/errno.h>
-#include <xen/lib.h>
 #include <xen/mm.h>
+#include <xen/muldiv.h>
 #include <xen/sched.h>
 #include <xen/trace.h>
 #include <xen/xmalloc.h>
diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index 1aeb144c837a..c6323143eaf8 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -17,7 +17,7 @@
 #include <xen/init.h>
 #include <xen/irq.h>
 #include <xen/keyhandler.h>
-#include <xen/lib.h>
+#include <xen/muldiv.h>
 #include <xen/param.h>
 #include <xen/pci_ids.h>
 #include <xen/sched.h>
diff --git a/xen/common/bitops.c b/xen/common/bitops.c
index 14e6265037f1..1ed88c966cfd 100644
--- a/xen/common/bitops.c
+++ b/xen/common/bitops.c
@@ -247,3 +247,15 @@ static void __init __constructor test_bitops(void)
     test_multiple_bits_set();
     test_hweight();
 }
+
+#include <xen/muldiv.h>
+
+/* Not a bitop, but here in lieu of any any better location */
+static void __init __constructor test_muldiv64(void)
+{
+    uint64_t res = muldiv64(0xffffffffffffffffULL,
+                            HIDE(0xffffffffU),
+                            HIDE(0xffffffffU));
+    if ( res != 0xffffffffffffffffULL )
+        panic("muldiv64(), expecting -1ULL, got 0x%"PRIx64"\n", res);
+}
diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
index 559e87636c02..bb0fd446b484 100644
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -136,8 +136,6 @@ unsigned long long simple_strtoull(
 
 unsigned long long parse_size_and_unit(const char *s, const char **ps);
 
-uint64_t muldiv64(uint64_t a, uint32_t b, uint32_t c);
-
 /*
  * A slightly more typesafe variant of cmpxchg() when the entities dealt with
  * are pointers.
diff --git a/xen/include/xen/muldiv.h b/xen/include/xen/muldiv.h
new file mode 100644
index 000000000000..8ed2c68caf84
--- /dev/null
+++ b/xen/include/xen/muldiv.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef XEN_MULDIV_H
+#define XEN_MULDIV_H
+
+#include <xen/stdint.h>
+
+uint64_t attr_const generic_muldiv64(uint64_t a, uint32_t b, uint32_t c);
+
+/*
+ * Calculate a * b / c using at least 96-bit internal precision.  The
+ * behaviour is undefined if the end result does not fit in a uint64_t.
+ */
+static inline uint64_t attr_const muldiv64(uint64_t a, uint32_t b, uint32_t c)
+{
+    return generic_muldiv64(a, b, c);
+}
+
+#endif /* XEN_MULDIV_H */
diff --git a/xen/lib/muldiv64.c b/xen/lib/muldiv64.c
index f281578c09a4..5e6db1b2f4d2 100644
--- a/xen/lib/muldiv64.c
+++ b/xen/lib/muldiv64.c
@@ -1,7 +1,6 @@
-#include <xen/lib.h>
+#include <xen/muldiv.h>
 
-/* Compute with 96 bit intermediate result: (a*b)/c */
-uint64_t muldiv64(uint64_t a, uint32_t b, uint32_t c)
+uint64_t generic_muldiv64(uint64_t a, uint32_t b, uint32_t c)
 {
 #ifdef CONFIG_X86
     asm ( "mulq %1; divq %2" : "+a" (a)
-- 
2.39.5


