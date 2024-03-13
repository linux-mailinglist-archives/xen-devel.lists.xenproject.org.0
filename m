Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FFB87AD2B
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 18:27:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692669.1080006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkSNx-0001uJ-9v; Wed, 13 Mar 2024 17:27:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692669.1080006; Wed, 13 Mar 2024 17:27:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkSNx-0001oL-79; Wed, 13 Mar 2024 17:27:25 +0000
Received: by outflank-mailman (input) for mailman id 692669;
 Wed, 13 Mar 2024 17:27:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M9/O=KT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rkSNw-0001lR-0k
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 17:27:24 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3206778-e15e-11ee-a1ee-f123f15fe8a2;
 Wed, 13 Mar 2024 18:27:21 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a466a1f9ea0so11607266b.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 10:27:21 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 f15-20020a170906048f00b00a42ee62b634sm5005732eja.106.2024.03.13.10.27.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 10:27:19 -0700 (PDT)
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
X-Inumbo-ID: f3206778-e15e-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710350840; x=1710955640; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/bXHNWyZkTLicGysMRuS+mhbdjAEJwJyFIm3Wfcg6A=;
        b=PBaPTIjeHQfhYt3S01T0O1dQwOA9fFVtYeF7mirFDdDbl43ITmtKXPmepfXq/r5WWX
         Ydc3cWAEeTV8F0ItQ2GE2N6Hz3bFKKjLed9sb29Ps92ERQZiQ4fOccrg+jDT6sN55Jgv
         9LHfdoX5gccWmqJFLvkrNyhWtrhhmjBDiPo4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710350840; x=1710955640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z/bXHNWyZkTLicGysMRuS+mhbdjAEJwJyFIm3Wfcg6A=;
        b=n9ocQOz6S+kYUcy0wRHUGawr3L9WcdAnaLXDLPdZFvmKGmCsAIUm3/TVNOXp5d00bH
         0Uu5JsO5QyJRwzi4HdhiM/KUJfKeXYLCcM/2YrlceIn1fOgR2m56IQRR5VMqtjftWKOl
         n1lwefK7+q7A1hmAvCZ0cS6TjvQLlnZUBJ2Eku6u/PJAT7j9jLFchvWF5NqqfTV/Xhbk
         p/mQMf6+oe3yHvuULVO74TsK9WCzoYr7m11X7ZMc4eZ/fQiKHtXPTgb0PXTX9sZD8QA4
         jyPfk/+283Ov9aC7ef1flRX7QOeFRmTRQXf/iXBNtyVP4jcGnWCsydvRx0dBlFNGMCzt
         fE1w==
X-Gm-Message-State: AOJu0Yx+6/LKWuhOOARTlfS3v7qeRN+buJcIG3XFeQfeYnjLmMqQ1sLD
	G1Hl7Ybmfw6LO53rHMoI0Z/+OYHPl6QdMmb3yeSJhIVB8HBR4iNTK6e6WhEWLeK/c2AYWEhBBtn
	l
X-Google-Smtp-Source: AGHT+IG5eOM/N8WPQ+tLKnromzM4xSu+1XcAJsvPgdf1Zalb2TQYPjNhcC8YFhYbXe6S0A8CFLD9yw==
X-Received: by 2002:a17:907:a093:b0:a45:54f3:b44d with SMTP id hu19-20020a170907a09300b00a4554f3b44dmr9508916ejc.8.1710350840553;
        Wed, 13 Mar 2024 10:27:20 -0700 (PDT)
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
Subject: [PATCH 1/7] xen/bitops: Cleanup ahead of rearrangements
Date: Wed, 13 Mar 2024 17:27:10 +0000
Message-Id: <20240313172716.2325427-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240313172716.2325427-1-andrew.cooper3@citrix.com>
References: <20240313172716.2325427-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

 * Rename __attribute_pure__ to just __pure before it gains users.
 * Identify the areas of xen/bitops.h which are a mess.
 * Create common/bitops.c for compile and runtime testing.  This provides a
   statement of the ABI, and a confirmation that arch-specific implementations
   behave as expected.

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

I expect MISRA will have something to say about the macros here, but they are
in aid of better testing.
---
 xen/common/Makefile        |  1 +
 xen/common/bitops.c        | 41 ++++++++++++++++++++++++++++++++++++++
 xen/include/xen/bitops.h   | 13 +++++++++---
 xen/include/xen/compiler.h |  3 ++-
 4 files changed, 54 insertions(+), 4 deletions(-)
 create mode 100644 xen/common/bitops.c

diff --git a/xen/common/Makefile b/xen/common/Makefile
index e5eee19a8537..1f8ca9a2f4f8 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -1,5 +1,6 @@
 obj-$(CONFIG_ARGO) += argo.o
 obj-y += bitmap.o
+obj-y += bitops.o
 obj-$(CONFIG_GENERIC_BUG_FRAME) += bug.o
 obj-$(CONFIG_HYPFS_CONFIG) += config_data.o
 obj-$(CONFIG_CORE_PARKING) += core_parking.o
diff --git a/xen/common/bitops.c b/xen/common/bitops.c
new file mode 100644
index 000000000000..4c07191b4030
--- /dev/null
+++ b/xen/common/bitops.c
@@ -0,0 +1,41 @@
+#include <xen/bitops.h>
+#include <xen/bug.h>
+#include <xen/init.h>
+
+/* Hide a value from the optimiser. */
+#define HIDE(x) ({ typeof(x) _x = x; asm volatile ( "" : "+r" (_x) ); _x; })
+
+/*
+ * Check that fn(val) can be calcuated by the compiler, and that it gives the
+ * expected answer.
+ */
+#define COMPILE_CHECK(fn, val, res)                                     \
+    do {                                                                \
+        if ( fn(val) != res )                                           \
+            asm (".error \"Compile time check '" STR(fn(val) == res) "' failed\""); \
+    } while ( 0 )
+
+/*
+ * Check that Xen's runtime logic for fn(val) gives the expected answer.  This
+ * requires using HIDE() to prevent the optimiser from emitting the full
+ * calculation.
+ */
+#define RUNTIME_CHECK(fn, val, res)             \
+    do {                                        \
+        BUG_ON(fn(HIDE(val)) != res);           \
+    } while ( 0 )
+
+/*
+ * Perform compiletime and runtime checks for fn(val) == res.
+ */
+#define CHECK(fn, val, res)                     \
+    do {                                        \
+        COMPILE_CHECK(fn, val, res);            \
+        RUNTIME_CHECK(fn, val, res);            \
+    } while ( 0 )
+
+static int __init cf_check test_bitops(void)
+{
+    return 0;
+}
+__initcall(test_bitops);
diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
index e3c5a4ccf321..9b40f20381a2 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -1,5 +1,7 @@
-#ifndef _LINUX_BITOPS_H
-#define _LINUX_BITOPS_H
+#ifndef XEN_BITOPS_H
+#define XEN_BITOPS_H
+
+#include <xen/compiler.h>
 #include <xen/types.h>
 
 /*
@@ -103,8 +105,13 @@ static inline int generic_flsl(unsigned long x)
  * Include this here because some architectures need generic_ffs/fls in
  * scope
  */
+
+/* --------------------- Please tidy above here --------------------- */
+
 #include <asm/bitops.h>
 
+/* --------------------- Please tidy below here --------------------- */
+
 #ifndef find_next_bit
 /**
  * find_next_bit - find the next set bit in a memory region
@@ -294,4 +301,4 @@ static inline __u32 ror32(__u32 word, unsigned int shift)
 
 #define BIT_WORD(nr) ((nr) / BITS_PER_LONG)
 
-#endif
+#endif /* XEN_BITOPS_H */
diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
index 16d554f2a593..972719df55b3 100644
--- a/xen/include/xen/compiler.h
+++ b/xen/include/xen/compiler.h
@@ -85,7 +85,8 @@
 #define inline inline __init
 #endif
 
-#define __attribute_pure__  __attribute__((__pure__))
+#define __pure  __attribute__((__pure__))
+
 #define __attribute_const__ __attribute__((__const__))
 #define __transparent__     __attribute__((__transparent_union__))
 
-- 
2.30.2


