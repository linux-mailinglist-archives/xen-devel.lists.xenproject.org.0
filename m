Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD9ECAD0A1
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 13:05:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180419.1503606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSZzU-0006RV-VZ; Mon, 08 Dec 2025 12:05:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180419.1503606; Mon, 08 Dec 2025 12:05:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSZzU-0006PE-RT; Mon, 08 Dec 2025 12:05:20 +0000
Received: by outflank-mailman (input) for mailman id 1180419;
 Mon, 08 Dec 2025 12:05:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vSZzT-0005PH-So
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 12:05:19 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 299aa921-d42e-11f0-980a-7dc792cee155;
 Mon, 08 Dec 2025 13:05:18 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-477b91680f8so48805355e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 04:05:18 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-479311e7142sm240639485e9.11.2025.12.08.04.05.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 04:05:16 -0800 (PST)
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
X-Inumbo-ID: 299aa921-d42e-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765195517; x=1765800317; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xrAup4vUp6nYzKqWbBt/etineahYQEJgciYvLWhouQc=;
        b=QmR0N6gdsluqQgcZ+eci4mcnxPLf0FHbJ4PevIYXKG6XiMRhanbpcuAV/+WduQNeoc
         JN/6f6gOyUeEMDWpNlYBW2istw/nfaJqZ40XnqG+wuw1uo+XCNf7CTTYt05c+7hpKn/Q
         8ulUEc4lbqnMaG0RPbJRQnQUhomF6zB8AsSiqmFb3ZTSgIOR/Nwm2YAp0KJdgY7S6h3m
         zpNMyN0poKRfAbba2wtU4urdliGTCD16J3kZEK3JppBFrnY0x+zuBHNQXuUOVISmXX7W
         q8K5GJa43E3s+zgH9vYUktwL22sEXLI5NIId1rxa5j6Jwk0OWpC45snNjgck5g49819h
         xikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765195517; x=1765800317;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xrAup4vUp6nYzKqWbBt/etineahYQEJgciYvLWhouQc=;
        b=I22UwCaiC2FwVeOzA7zWm1ezYbQq9tUCLi+QNzvRcuXpt6aT6cGWAOSfQ/X72/sAeQ
         Rm8vZDGVeCTHFIvt/9FzQmVx3zOcryk+pwKQZ2aikbfX2BrU8rpbCjOfr55THo6cmd4U
         O9Ja94+8Z8YcFS9xH7Lj4GGmjvgK4zaoTLZKHDUsUJKqkwIDutlrmy4pgcKWby8829KK
         y1z+Gl/ykl88fGWGWiULuOh0DoBGAdLaUDxi4XCV7Q55filWlcu01q2jDwt2eaLdalx+
         9nYD/crUeDU5HPcOgZ3407ZiKNC1nwRgO72IlQFq8zYG2DuZaA2aEFaK+ZMQHwig8wUa
         1ldg==
X-Gm-Message-State: AOJu0YwWvQZQi17f5cnsCoQT9s2NmY+E5oG1A01ceFtN4hbmrvI9xMH9
	+8NgmsvqLAXg+wz9IPFNeOkDi5QT6Mb6JQ1sY4qXcf2cKmtqeREu1NmhWqTblJrNj5zP5jufFtM
	M4Ig=
X-Gm-Gg: ASbGncvnDXdCDvXqXtiFNZRK1Ve7H9OzuriNRyPtBxHLVRMLgh6WyZQAnZd6dzixMLL
	Eofqio8c81kvTZeNRHbrnMOk/qF1+HTwzAEHyxvWpXfw063TGmmo1p+ylnWPPz8UMxlGyUKAcW5
	xE4E/UdLqpjq7zSWWOiDxHhuE0C96AzgsogwgJklt13Mqhu9hQQ0noUvDMYlOBoqtCZbrefvukM
	gZcaugFiD685CsirakCz1YdRYrxlzt6Fv3LcK7snSC7uJz1pg/K8AO5Ef5gtJmGiowRUqEyoLyG
	FU2kswjSS+wAB4Tqtmt48G0X3t6tWt6gnzFHigLZ0PPnq2JM44N4MLyEKrLLpkr3X3hqRHkNEHO
	xESf50xfbqORo5MASzAGynJVYss3aSCeoZW8rDnRjyJRggYM8TIwVWeUIIvwo+719KB/XcpQ/uZ
	pSTsnKWov1aQmvNqzC9LxfhMvVWRxGdmb3h4WvtuR2+XjBE7uOoOkq5FqYvvJJVN+jfM3I7Rb/X
	MA=
X-Google-Smtp-Source: AGHT+IFXQ8V1P767Zzi9RxllZsdVsMTJ1OkPjjft1oy2VQPfMvCtYHgsH6p1XyiyuqoeD7CpTDdKTw==
X-Received: by 2002:a05:600c:354a:b0:477:9b4a:a82 with SMTP id 5b1f17b1804b1-47939e49390mr90143445e9.35.1765195517511;
        Mon, 08 Dec 2025 04:05:17 -0800 (PST)
Message-ID: <12852eae-849b-4576-a8e1-85edf401b455@suse.com>
Date: Mon, 8 Dec 2025 13:05:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 2/3] x86: move / split usercopy.c to / into arch-specific
 library
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
References: <f46f89f6-242b-4433-958e-36088e567ccd@suse.com>
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
In-Reply-To: <f46f89f6-242b-4433-958e-36088e567ccd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The file wasn't correctly named for our purposes anyway. Split it into its
"guest" and "unsafe" parts, thus allowing the latter to not be linked in
at all (for presently having no caller). The building of the "guest" part
can then (later) become conditional upon PV=y.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/Makefile                         |  4 ----
 xen/arch/x86/lib/Makefile                     |  2 ++
 xen/arch/x86/{usercopy.c => lib/copy-guest.c} | 12 +---------
 xen/arch/x86/lib/copy-unsafe.c                | 22 +++++++++++++++++++
 4 files changed, 25 insertions(+), 15 deletions(-)
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
index a24b52cc66c1..25eeb35427e2 100644
--- a/xen/arch/x86/usercopy.c
+++ b/xen/arch/x86/lib/copy-guest.c
@@ -1,4 +1,4 @@
-/* 
+/*
  * User address space access functions.
  *
  * Copyright 1997 Andi Kleen <ak@muc.de>
@@ -6,8 +6,6 @@
  * Copyright 2002 Andi Kleen <ak@suse.de>
  */
 
-#include <xen/lib.h>
-#include <xen/sched.h>
 #include <asm/uaccess.h>
 
 #ifndef GUARD
@@ -139,14 +137,6 @@ unsigned int copy_from_guest_pv(void *to, const void __user *from,
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


