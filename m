Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D1386713C
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 11:35:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685422.1066095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reYJt-0007mr-1V; Mon, 26 Feb 2024 10:34:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685422.1066095; Mon, 26 Feb 2024 10:34:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reYJs-0007kj-Uz; Mon, 26 Feb 2024 10:34:48 +0000
Received: by outflank-mailman (input) for mailman id 685422;
 Mon, 26 Feb 2024 10:34:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPQ6=KD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1reYJq-0007kd-NN
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 10:34:46 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8aa6587-d492-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 11:34:45 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-565c6cf4819so1935683a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 02:34:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 q32-20020a05640224a000b00564fa936b2bsm2237232eda.94.2024.02.26.02.34.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 02:34:44 -0800 (PST)
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
X-Inumbo-ID: a8aa6587-d492-11ee-8a58-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708943685; x=1709548485; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N61N/9GC6VkqLeViNeOTGnAzYqt4hHA7mr7XqgOOGf4=;
        b=d5O0kELCEh88iSWsjPXYMXaGW2BwLPilcN1DPAVov29DVAe1Zc6QgaMH2XSndhL8Mk
         H4eGOSmOzaAbCHQV0E9EOMN87Ro8cfs2YJAAQFhlZ/3W6j79HdnZSyYz8mShC63ctxA3
         Okn1zALi8ib+ZAMirNYFHaq/VcWRpHEnY2ao3Vl5jcRSwm14wM9Wb9wAEVu/euGCfkXV
         LkHmXMSABVcUQBCcfMUeYOOwP3FoqX5mb1a+OpGOL2AhjcuvIZb4xdBsRLEwyQGK6VtD
         0oar2g5BR3Uo/aaGe+7gTe91VAMhD+wX8aSj378Dn/0NRiBLW1uZN+sLV3UfkUPOhSZh
         9I2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708943685; x=1709548485;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N61N/9GC6VkqLeViNeOTGnAzYqt4hHA7mr7XqgOOGf4=;
        b=GiesTM3MHrO9259knOjFKn5vM7G6/nifw5eIsmLJkL6wqVqwfPmkkEwlemZCw/Tw4G
         d7AJ/7+5YrbAAsYwG9tRq+iFrrNC3gjy2+nJ5j0S5ykcyUVxJD15FVjpifYX1OQFRfPX
         9sHyb/S1RO3/uZERwME+66BmK14gBdZShDo5ObAbemUKVEJ50c4VXhqj4GR3IE9wpWfh
         +UboBvRsM9cuvCzJqfnL+1ocDQuNu4Ri0rpHGmY1cRrya5pWXGEuRcYQ2tc0LJdUp479
         KxOjZMopWPwZ0rpSFKzrf8NpM1mxyS6CMP9Ol8Y17Gfbvg4rdx05dZscORWZZkdZDAK7
         GGiw==
X-Gm-Message-State: AOJu0YwqGQGFyGuChLvFzCHaoEYPfItLYz7lPTkVvUkV4z3U1YisvW7Z
	khM1kZ0VSel2MMhE3s+ninBpTxJZDuNNJk9eBTMO8y9xkBCSyw5xCtUI651QybfK1Z4BvhzHeJ8
	=
X-Google-Smtp-Source: AGHT+IHUMlb3j7Aa2H9FUCg1m1kk57GO3nMQ4PqtMNPACiNQ1huk0ClRyrTOvgLFxSLKo0/C8XCD7w==
X-Received: by 2002:a05:6402:3903:b0:561:ea0:e234 with SMTP id fe3-20020a056402390300b005610ea0e234mr5475337edb.16.1708943685158;
        Mon, 26 Feb 2024 02:34:45 -0800 (PST)
Message-ID: <239f2a0a-f1da-4c25-af43-dfac51bb1bd8@suse.com>
Date: Mon, 26 Feb 2024 11:34:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] arch: move array_index_mask_nospec()
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

At the time they were introduced, there were no asm/nospec.h yet, so
they were placed in system.h. Move them to nospec.h and drop
xen/nospec.h's including of asm/system.h; there's one unrelated #include
that needs adding in exchange, on x86.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- /dev/null
+++ b/xen/arch/arm/include/asm/arm32/nospec.h
@@ -0,0 +1,31 @@
+/* Portions taken from Linux arch arm */
+#ifndef __ASM_ARM32_NOSPEC_H
+#define __ASM_ARM32_NOSPEC_H
+
+#define CSDB    ".inst  0xe320f014"
+
+static inline unsigned long array_index_mask_nospec(unsigned long idx,
+                                                    unsigned long sz)
+{
+    unsigned long mask;
+
+    asm volatile( "cmp    %1, %2\n"
+                  "sbc    %0, %1, %1\n"
+                  CSDB
+                  : "=r" (mask)
+                  : "r" (idx), "Ir" (sz)
+                  : "cc" );
+
+    return mask;
+}
+#define array_index_mask_nospec array_index_mask_nospec
+
+#endif /* __ASM_ARM32_NOSPEC_H */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
--- a/xen/arch/arm/include/asm/arm32/system.h
+++ b/xen/arch/arm/include/asm/arm32/system.h
@@ -48,24 +48,6 @@ static inline int local_fiq_is_enabled(v
     return !(flags & PSR_FIQ_MASK);
 }
 
-#define CSDB    ".inst  0xe320f014"
-
-static inline unsigned long array_index_mask_nospec(unsigned long idx,
-                                                    unsigned long sz)
-{
-    unsigned long mask;
-
-    asm volatile( "cmp    %1, %2\n"
-                  "sbc    %0, %1, %1\n"
-                  CSDB
-                  : "=r" (mask)
-                  : "r" (idx), "Ir" (sz)
-                  : "cc" );
-
-    return mask;
-}
-#define array_index_mask_nospec array_index_mask_nospec
-
 #endif
 /*
  * Local variables:
--- /dev/null
+++ b/xen/arch/arm/include/asm/arm64/nospec.h
@@ -0,0 +1,35 @@
+/* Portions taken from Linux arch arm64 */
+#ifndef __ASM_ARM64_NOSPEC_H
+#define __ASM_ARM64_NOSPEC_H
+
+#define csdb()  asm volatile ( "hint #20" : : : "memory" )
+
+/*
+ * Generate a mask for array_index__nospec() that is ~0UL when 0 <= idx < sz
+ * and 0 otherwise.
+ */
+static inline unsigned long array_index_mask_nospec(unsigned long idx,
+                                                    unsigned long sz)
+{
+    unsigned long mask;
+
+    asm volatile ( "cmp     %1, %2\n"
+                   "sbc     %0, xzr, xzr\n"
+                   : "=r" (mask)
+                   : "r" (idx), "Ir" (sz)
+                   : "cc" );
+    csdb();
+
+    return mask;
+}
+#define array_index_mask_nospec array_index_mask_nospec
+
+#endif /* __ASM_ARM64_NOSPEC_H */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
--- a/xen/arch/arm/include/asm/arm64/system.h
+++ b/xen/arch/arm/include/asm/arm64/system.h
@@ -58,28 +58,6 @@ static inline int local_fiq_is_enabled(v
     return !(flags & PSR_FIQ_MASK);
 }
 
-#define csdb()  asm volatile ( "hint #20" : : : "memory" )
-
-/*
- * Generate a mask for array_index__nospec() that is ~0UL when 0 <= idx < sz
- * and 0 otherwise.
- */
-static inline unsigned long array_index_mask_nospec(unsigned long idx,
-                                                    unsigned long sz)
-{
-    unsigned long mask;
-
-    asm volatile ( "cmp     %1, %2\n"
-                   "sbc     %0, xzr, xzr\n"
-                   : "=r" (mask)
-                   : "r" (idx), "Ir" (sz)
-                   : "cc" );
-    csdb();
-
-    return mask;
-}
-#define array_index_mask_nospec array_index_mask_nospec
-
 #endif
 /*
  * Local variables:
--- a/xen/arch/arm/include/asm/nospec.h
+++ b/xen/arch/arm/include/asm/nospec.h
@@ -4,6 +4,14 @@
 #ifndef _ASM_ARM_NOSPEC_H
 #define _ASM_ARM_NOSPEC_H
 
+#if defined(CONFIG_ARM_32)
+# include <asm/arm32/nospec.h>
+#elif defined(CONFIG_ARM_64)
+# include <asm/arm64/nospec.h>
+#else
+# error "unknown ARM variant"
+#endif
+
 static inline bool evaluate_nospec(bool condition)
 {
     return condition;
--- a/xen/arch/x86/include/asm/nospec.h
+++ b/xen/arch/x86/include/asm/nospec.h
@@ -38,6 +38,30 @@ static always_inline void block_speculat
     barrier_nospec_true();
 }
 
+/**
+ * array_index_mask_nospec() - generate a mask that is ~0UL when the
+ *      bounds check succeeds and 0 otherwise
+ * @index: array element index
+ * @size: number of elements in array
+ *
+ * Returns:
+ *     0 - (index < size)
+ */
+static inline unsigned long array_index_mask_nospec(unsigned long index,
+                                                    unsigned long size)
+{
+    unsigned long mask;
+
+    asm volatile ( "cmp %[size], %[index]; sbb %[mask], %[mask];"
+                   : [mask] "=r" (mask)
+                   : [size] "g" (size), [index] "r" (index) );
+
+    return mask;
+}
+
+/* Override default implementation in nospec.h. */
+#define array_index_mask_nospec array_index_mask_nospec
+
 #endif /* _ASM_X86_NOSPEC_H */
 
 /*
--- a/xen/arch/x86/include/asm/system.h
+++ b/xen/arch/x86/include/asm/system.h
@@ -224,30 +224,6 @@ static always_inline unsigned long __xad
 #define smp_mb__before_atomic()    do { } while (0)
 #define smp_mb__after_atomic()     do { } while (0)
 
-/**
- * array_index_mask_nospec() - generate a mask that is ~0UL when the
- *      bounds check succeeds and 0 otherwise
- * @index: array element index
- * @size: number of elements in array
- *
- * Returns:
- *     0 - (index < size)
- */
-static inline unsigned long array_index_mask_nospec(unsigned long index,
-                                                    unsigned long size)
-{
-    unsigned long mask;
-
-    asm volatile ( "cmp %[size], %[index]; sbb %[mask], %[mask];"
-                   : [mask] "=r" (mask)
-                   : [size] "g" (size), [index] "r" (index) );
-
-    return mask;
-}
-
-/* Override default implementation in nospec.h. */
-#define array_index_mask_nospec array_index_mask_nospec
-
 #define local_irq_disable()     asm volatile ( "cli" : : : "memory" )
 #define local_irq_enable()      asm volatile ( "sti" : : : "memory" )
 
--- a/xen/arch/x86/include/asm/x86_emulate.h
+++ b/xen/arch/x86/include/asm/x86_emulate.h
@@ -15,6 +15,7 @@
 #include <xen/types.h>
 #include <xen/lib.h>
 #include <asm/regs.h>
+#include <asm/x86-defns.h>
 
 #include "../../x86_emulate/x86_emulate.h"
 
--- a/xen/include/xen/nospec.h
+++ b/xen/include/xen/nospec.h
@@ -7,7 +7,6 @@
 #ifndef XEN_NOSPEC_H
 #define XEN_NOSPEC_H
 
-#include <asm/system.h>
 #include <asm/nospec.h>
 
 /**

