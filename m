Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA380CC1B7C
	for <lists+xen-devel@lfdr.de>; Tue, 16 Dec 2025 10:18:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187735.1509066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVRBi-0002zM-NO; Tue, 16 Dec 2025 09:17:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187735.1509066; Tue, 16 Dec 2025 09:17:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVRBi-0002xG-Kc; Tue, 16 Dec 2025 09:17:46 +0000
Received: by outflank-mailman (input) for mailman id 1187735;
 Tue, 16 Dec 2025 09:17:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t3Kb=6W=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vVRBh-0002x8-Fo
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 09:17:45 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13bb2a9d-da60-11f0-9cce-f158ae23cfc8;
 Tue, 16 Dec 2025 10:17:43 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-47775fb6c56so34496735e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 16 Dec 2025 01:17:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47bd994a221sm5168825e9.7.2025.12.16.01.17.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Dec 2025 01:17:42 -0800 (PST)
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
X-Inumbo-ID: 13bb2a9d-da60-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765876663; x=1766481463; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mT5y1doBjol1xTeNjUjhfdne9i1b4Rk9NW6N2DKeGyU=;
        b=X26opvL3kwXVy/rjEeV0cxxEP4a1p45wAZfizDK4XtgPlOVa4MCFGqayLmgytUBCzx
         zyKKvt+TZwONTdkE7Xz/o3sEVzbSAmrdi/7nIL01kSeeCb5PHvOdYgBAODeQVaxlDbJo
         7rgGYQ0AVhqsMLf3ZMBjJsvy5SF3i3z3bAn1HVOzJwfTZtNpH2QTOamQ1pF3GS8/+E76
         e2m7Ydo9C3M5VwzaLGOHKJEH1d3BsndNMmhnMoyIZYgn6wsKOhMGcfHWIK89vjOHG4WQ
         HKDy6b2ODZ9McAH3hIy5tSRWpV1KC+KE0i9XAhAnqGYT6LAXrcE+l5CPEtVmV7+CMsAL
         5v1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765876663; x=1766481463;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mT5y1doBjol1xTeNjUjhfdne9i1b4Rk9NW6N2DKeGyU=;
        b=kxKot6muW219uo3IGTaP34O+mla8Nd41mlCvXXkmWcHQqyR8hILHE77t546LHlshJn
         KKdxpS64k1iaf86LKneWsLQGdh0O0qEcXKIffiSNIRRlKkiOkj5D4YWdsiy2Aoyp42y4
         eft7nOEJuUmNUQrb51rFdoywcYK1V0BH6IjoA5VQWrbp+UYqiy3b4bjy0UoU8xSw4yJY
         cdPBHH0cZXTkdQTjCFqWbw4IADY3yJdC/YdjLbGD/Md5/R46DVL+zAPlbYjoMr8nC2JI
         MXlPo8IE/YtEbsiZ1dk0aSyKYKZmJG+0C44UrQGCftngjsgtOhXSsdz0teLsqR+7C2S3
         5gdw==
X-Gm-Message-State: AOJu0YwCKjekaJfOPCMtlvItClNhIsiBsEDMA8U+dw7iYb+5M26Q+oC8
	I6pCWabqf6yJKjHG9nwIbvKfqNSVqd6cxMigc0dVGVyJnqzP0wGBHpRYz6SLyqFqhg19XyzVvpD
	8gKI=
X-Gm-Gg: AY/fxX4O8SrJE6zyA6k6QOwxxsS6X21GcjYOIeNxHGeVpCd4zVrytnkzWgogHXmfjhk
	+n3c69yiuGlccjsvCAaVmxfMfwU2KmEU3HCWna/QyGRAElWbEK/nFgEDCtpZ9/I+r/pNod9xS1m
	tb/NiDt94ZfE5x1UhOpz0We8YpF2+6qB0P7bd2oRxHn6cZttOC+zD2oOUC7NOZN+5N8DeVs09e8
	LyR4bK5Uk17R4gLXxjzw+IAoK0TjmSyOOKUl/K6E7A+QJe8fRy7jpS9N93bUEkFVgnJDF+OIqEU
	Jr7+Q3JSd39DoaN7D0GjEYoyOPJUY/6W3rPGhdJrcPvB/yQZK/5TIyBkdhmmQbVhCZGBmloVj7X
	Ym2taCvvb6jXaO0SldDTMlf1XCvdZRmRhTI4RXAptvMlWUR57lauU0GRQuJCRiEZ1Rk4XWo9eph
	pCEjndMA3fMe02CgjBo0YlLwgH5oXyexbdRIa9y8VEHcAEwUeW2X8pW+abEZ4Y7fiiMiX4V2WLE
	FU=
X-Google-Smtp-Source: AGHT+IFIlf8eBMdfZOOTZiCrgCkemefiQIJq7j4U0mcKyHYM+8dGEgWaODE39483yOnu0bMm6VNQVA==
X-Received: by 2002:a05:600c:8184:b0:46e:6d5f:f68 with SMTP id 5b1f17b1804b1-47bda6f331emr1503905e9.12.1765876662662;
        Tue, 16 Dec 2025 01:17:42 -0800 (PST)
Message-ID: <0ba4df43-e071-4705-a18e-d41636946d3a@suse.com>
Date: Tue, 16 Dec 2025 10:17:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 1/3] x86: move / split usercopy.c to / into arch-specific
 library
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
References: <f73aa7e9-c176-40c3-b5f5-81c69cb219ac@suse.com>
Content-Language: en-US
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
In-Reply-To: <f73aa7e9-c176-40c3-b5f5-81c69cb219ac@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The file wasn't correctly named for our purposes anyway. Split it into its
"guest" and "unsafe" parts, thus allowing the latter to not be linked in
at all (for presently having no caller). The building of the "guest" part
can then (later) become conditional upon PV=y.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Retain xen/sched.h #include.
---
 xen/arch/x86/Makefile                         |  4 ----
 xen/arch/x86/lib/Makefile                     |  2 ++
 xen/arch/x86/{usercopy.c => lib/copy-guest.c} | 12 ++--------
 xen/arch/x86/lib/copy-unsafe.c                | 22 +++++++++++++++++++
 4 files changed, 26 insertions(+), 14 deletions(-)
 rename xen/arch/x86/{usercopy.c => lib/copy-guest.c} (94%)
 create mode 100644 xen/arch/x86/lib/copy-unsafe.c

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 61e2293a467e..dfb258d7ac1c 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -72,7 +72,6 @@ obj-y += time.o
 obj-y += traps-setup.o
 obj-y += traps.o
 obj-$(CONFIG_INTEL) += tsx.o
-obj-y += usercopy.o
 obj-y += x86_emulate.o
 obj-$(CONFIG_TBOOT) += tboot.o
 obj-y += hpet.o
@@ -93,9 +92,6 @@ hostprogs-y += efi/mkreloc
 
 $(obj)/efi/mkreloc: HOSTCFLAGS += -I$(srctree)/include
 
-# Allows usercopy.c to include itself
-$(obj)/usercopy.o: CFLAGS-y += -iquote .
-
 ifneq ($(CONFIG_HVM),y)
 $(obj)/x86_emulate.o: CFLAGS-y += -Wno-unused-label
 endif
diff --git a/xen/arch/x86/lib/Makefile b/xen/arch/x86/lib/Makefile
index ddf7e19bdc1d..8fe2dfd88553 100644
--- a/xen/arch/x86/lib/Makefile
+++ b/xen/arch/x86/lib/Makefile
@@ -1 +1,3 @@
+lib-y += copy-guest.o
+lib-y += copy-unsafe.o
 lib-y += generic-hweightl.o
diff --git a/xen/arch/x86/usercopy.c b/xen/arch/x86/lib/copy-guest.c
similarity index 94%
rename from xen/arch/x86/usercopy.c
rename to xen/arch/x86/lib/copy-guest.c
index a24b52cc66c1..73284b3f14be 100644
--- a/xen/arch/x86/usercopy.c
+++ b/xen/arch/x86/lib/copy-guest.c
@@ -1,4 +1,4 @@
-/* 
+/*
  * User address space access functions.
  *
  * Copyright 1997 Andi Kleen <ak@muc.de>
@@ -6,8 +6,8 @@
  * Copyright 2002 Andi Kleen <ak@suse.de>
  */
 
-#include <xen/lib.h>
 #include <xen/sched.h>
+
 #include <asm/uaccess.h>
 
 #ifndef GUARD
@@ -139,14 +139,6 @@ unsigned int copy_from_guest_pv(void *to, const void __user *from,
     return n;
 }
 
-# undef GUARD
-# define GUARD UA_DROP
-# define copy_to_guest_ll copy_to_unsafe_ll
-# define copy_from_guest_ll copy_from_unsafe_ll
-# undef __user
-# define __user
-# include __FILE__
-
 #endif /* GUARD(1) */
 
 /*
diff --git a/xen/arch/x86/lib/copy-unsafe.c b/xen/arch/x86/lib/copy-unsafe.c
new file mode 100644
index 000000000000..a51500370fb1
--- /dev/null
+++ b/xen/arch/x86/lib/copy-unsafe.c
@@ -0,0 +1,22 @@
+/*
+ * "Unsafe" access functions.
+ */
+
+#include <asm/uaccess.h>
+
+#define GUARD UA_DROP
+#define copy_to_guest_ll copy_to_unsafe_ll
+#define copy_from_guest_ll copy_from_unsafe_ll
+#undef __user
+#define __user
+#include "copy-guest.c"
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */


