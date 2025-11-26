Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A20CEC89FFC
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 14:25:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172666.1497784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOFVy-0000Yg-Er; Wed, 26 Nov 2025 13:24:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172666.1497784; Wed, 26 Nov 2025 13:24:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOFVy-0000Wf-BM; Wed, 26 Nov 2025 13:24:58 +0000
Received: by outflank-mailman (input) for mailman id 1172666;
 Wed, 26 Nov 2025 13:24:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOFVx-0008TQ-93
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 13:24:57 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4cd9473e-cacb-11f0-9d18-b5c5bf9af7f9;
 Wed, 26 Nov 2025 14:24:56 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-47796a837c7so44615515e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Nov 2025 05:24:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4790adc8bbbsm46836655e9.3.2025.11.26.05.24.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Nov 2025 05:24:55 -0800 (PST)
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
X-Inumbo-ID: 4cd9473e-cacb-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764163496; x=1764768296; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=csSilqIENwrRsXwOdI/awgHJ7LfG+gCF8u6TRvD5JG8=;
        b=IDgvl3TO/rEjDoFr4ibOVU/J4yzIE7zkFGiEfqiz1pCZgyc7jaOsmv4dPn3fTc6bE6
         z3bA/rfvcbn6dJ5+GlKwp4ysKZAP9w1bJrfi9wvzT8Ut+Y8/L8xUQ/LH51h+IHWDhBQy
         VNqlWwGnB18lcR8h3r4qPSim8BcNrJNUMEbgiLqwCqU4iY3lWJHYyYWZrFP5w4vvFh6P
         BzKH7s9T32mOvAYoQeoQxc/RStS+GgULBdKm/RvWMM5CVQ3IZCzu1/lSCAo2Ml/MTXdV
         qnkhJKqQMzI76MRMsqLV60f/X4o5LcL6TaEpBQzJYROVhmoq7ZiEv8dlLODt7LNMzLJ8
         JwcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764163496; x=1764768296;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=csSilqIENwrRsXwOdI/awgHJ7LfG+gCF8u6TRvD5JG8=;
        b=F0gZ5RWEVuloINHLI3ZnwPQsp0nFjTOPZ2EPFniHCWdJIDB8v8Rx9tXmNXdJQGpyhG
         TRXfNnOIUfedGlYwYyGgQNzSLq8Kb3F+6sLTeWaWnldNBctdOGpx+yEqabGYMhxxU1wh
         dM7vOynQNGLocC8mzp2sqTYfevyuE98ZU6cBHQSR/mGhSIILVwQlXNe68sy1s0XfFwDu
         cLQ8ZPx4/wQhNQpdfUhqTNDCBKtmmuXekRQcCE/SgS6QRwd/rp+B+ioTIox1SITbhbqW
         NgGc3cCEXOj4eJfhBSjzLM4WaVsKTQ2sDJ43PSLKEOX9qCQQMod7aaK7SlBfaCrCA4lg
         RAEA==
X-Gm-Message-State: AOJu0Yx7jU6ngkGJoVPLO6FfL+x0GEvTfS0w+ZjnXXZ63l4vfcprUX/O
	39zgNRcW8igahS23PMdZwlANCPhxcPvVc02iB6VOD231XdPxtv/8IbafP37k72C6Gmyc+BQe7pU
	UqqM=
X-Gm-Gg: ASbGncvXsVG7eHPsX0GGMuEuZeaFyjBfdQMNBOHsrec5o/rBiKvWkyUURzgx+W0Qa6Q
	epiFXoPgG+z3mtRTftaEiQQGpV5eNIHn8EqNrhnd74w+7BRQHO4Oc+JLycHU5JE65qRdf9mnpzQ
	I4uuFJJiHoV5uzDkFRLa/3Atl+7Y4McS+PzWx5qkKo7kgMVaiB6jzoxWPmlJh9pwJceKWcUSjCK
	c5LodQJFQEPRg+2Fa7U2LGX7ZuT+hGvGGFgGmAoewkoajp1Eg7d45IoNZeDRjKKD6EsH0pGbwmg
	9yaBgVKgVEH9837MVySgZ2jiyen3MxFqi/PNARWhWSYZPV7r41LyVc/zrUTHnGQJaJ/hDfqwGDG
	zCBIJLnxjtFe3xJ6Hvc4vA2UsB4r3Hy+9PahGo4Crk52v5Jw8Fe2JquVYS4sHMnQUgEHw6y7/EC
	0kpuAaaE81ip8uYl81xM69ltU3CG9rNeH/7OkEDlC6JHdZE665OvRmxacjwSCV7/nqIsl8Xgmou
	qI=
X-Google-Smtp-Source: AGHT+IFznyd2DP+zPsoh848TzXl8EiMT3iR2rSoy1bL/DixcGejfvLrxJ6hlemronjnYA/JAeieR8g==
X-Received: by 2002:a05:600c:4f88:b0:46e:506b:20c5 with SMTP id 5b1f17b1804b1-477c01c0c9cmr171607795e9.26.1764163495936;
        Wed, 26 Nov 2025 05:24:55 -0800 (PST)
Message-ID: <fd3609bd-6259-4336-905b-732a2f171996@suse.com>
Date: Wed, 26 Nov 2025 14:24:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/2] x86: move / split usercopy.c to / into arch-specific
 library
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
References: <245fbc16-924b-4fd9-8cbc-a539b569edac@suse.com>
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
In-Reply-To: <245fbc16-924b-4fd9-8cbc-a539b569edac@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The file wasn't correctly named for our purposes anyway. Split it into its
"guest" and "unsafe" parts, thus allowing the latter to not be linked in
at all (for presently having no caller). The building of the "guest" part
can then (later) become conditional upon PV=y.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/Makefile                         |  1 -
 xen/arch/x86/lib/Makefile                     |  2 ++
 xen/arch/x86/{usercopy.c => lib/copy-guest.c} | 12 +---------
 xen/arch/x86/lib/copy-unsafe.c                | 22 +++++++++++++++++++
 4 files changed, 25 insertions(+), 12 deletions(-)
 rename xen/arch/x86/{usercopy.c => lib/copy-guest.c} (94%)
 create mode 100644 xen/arch/x86/lib/copy-unsafe.c

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 61e2293a467e..76540d77e55f 100644
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
-- 
2.48.2



