Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE15C5719C
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 12:08:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160986.1489013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJVBg-0006Ya-JB; Thu, 13 Nov 2025 11:08:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160986.1489013; Thu, 13 Nov 2025 11:08:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJVBg-0006Vr-Fz; Thu, 13 Nov 2025 11:08:24 +0000
Received: by outflank-mailman (input) for mailman id 1160986;
 Thu, 13 Nov 2025 11:08:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJVBe-0006Vc-VW
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 11:08:22 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10ba1ad9-c081-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 12:08:21 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-640b4a52950so977620a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 03:08:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a3d82cfsm1218407a12.2.2025.11.13.03.08.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 03:08:20 -0800 (PST)
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
X-Inumbo-ID: 10ba1ad9-c081-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763032101; x=1763636901; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=S2UYFN6yYiokysvt0u9vsy7o90dfh/ypuxlmafL+NtQ=;
        b=GqXYFQh15PdQTex46f/7bWAY36/P3DGuA1mpq2+GvubjZzdPom6NQ1j7LQwyDxxiAQ
         dMPb3U8A6qj3bElOJroSK+S4EzcCQ5c2IOtfAuqdYAG7FFyBmMaqWND0dlsx1zSpd18f
         ppVTf0Ji0cmu7KPvzD8ieSWbCf4j1jsoKcl/PgKJiDh/CvjnUkZK0gZYpQlZs7sDXyp1
         qes7EjA31WBILNai4+cxeGaU75YBHV8H78KagDJBN/A+KXGeoUPuCE55DffUwDMN2Ajw
         nD8XajVIftxtkjR+5HF4wTthix1UpNQTBCVl5q33WXuwGtOX4zDN7qNzKrpgYwDrLfKO
         83PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763032101; x=1763636901;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S2UYFN6yYiokysvt0u9vsy7o90dfh/ypuxlmafL+NtQ=;
        b=le+CW0eJScbVJxeFnfNrJfcLwnfqSfZ56T/tXgmGpLBo2V5qj5jtCcgEMIOgHNAt3v
         fKSHk+vzVaUWFYnwKzVEximCwgIGqHzZx6KaZon+BYpRmFALLjr8Wxz9MCYYun1kN2M9
         7hPj08uBeufK8OqrtTTMv1eh1VEcsR42h2OPGa+gj8aLhiv6kCaGBq7cn3kQsREzLJ+h
         GOgbt1kIurRB6wvhYAoyTCmEAcIFFrOTDp+vOo6DeBaCV3leCYIwtGJlvFMw4Fg29wON
         /Y3lT2BYdKJbNnr5HVBZ0zyyq4xxQxHhfi8oeZAtwDSoeBNX2x/bADUxxgssZRInfpZQ
         PJOA==
X-Gm-Message-State: AOJu0YzqIla6MDmHRip5kCMPWFWAv97+VLIKKzjpdoa2q49P9uUEnQRc
	/mppMoKEGJtloue8nk6eUZZVIIKXfZKK7W9ps3oDy+9WZjcGb9VNE/OPs1xS9LXPSdUJm/7vZaV
	bjvc=
X-Gm-Gg: ASbGncvNMii/ROtH2XyAvww4tjeGA18fZfAC6HQF3Cl6nQJZ0r3VLAKnLK6IWwLBiaA
	cV+28sjznrPuv1QrTtxi5XHvTSb0ddb/ditAmk1mEeEz9rIqQXBH41+yEG+idSvoH3lkPOQxd+3
	ZoeTSXQA6kLx7A68bhdR9EZ0RRTMHhkYRFStIbVnzj4Fm/I5gORTAQXacY+Xc4swipMtrIAZDLv
	UCLhlZ5eG2jTgA4Lq4UjrbvC8t4myRkBlltXCz/2KVANswur7mSMKYgZroklEYk75A4URBcfHao
	Bx/XNiuftjvpndRnR+5e0XTqn/o5advlH6eqeXq9vSjrVEz7P67q6dtR8QUPBb7bFtpyoDm/XL8
	68bhnZ3fG9YOphGSyKem/xbq4Z0LcpHV/td3ox/ZjVCu3FF/lPCRKUuEr9kcUR1b76aoE8Pr1b7
	aWxEMKaF9IzdXTfELtA5Uw2MtoA+kQahsQUxJ4gH8P8upEY7h9K+0h927bx+YbfwG/JPUCYj2ki
	bk=
X-Google-Smtp-Source: AGHT+IHk2TCKhIrULeEnrNiaqVuyU9XRrPVMRnp6fZo9vR8OYv1AHu3OIULBKyqagSa0MVz/72/Bew==
X-Received: by 2002:a05:6402:518d:b0:640:cc76:ae35 with SMTP id 4fb4d7f45d1cf-6431a53071dmr5609782a12.21.1763032100740;
        Thu, 13 Nov 2025 03:08:20 -0800 (PST)
Message-ID: <7a3eb7f3-db3e-4c2f-a231-cdf05a14be26@suse.com>
Date: Thu, 13 Nov 2025 12:08:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/3] x86: introduce "brk" allocator
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <bdbb2884-c2d2-415a-8891-a598d112e34c@suse.com>
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
In-Reply-To: <bdbb2884-c2d2-415a-8891-a598d112e34c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

... to replace ebmalloc(), and then to find further use(s) to allow
recovering memory which is needed very early (and hence needs setting up
statically), but may not fully be used (or not used at all).

Note that unlike free_ebmalloc_unused_mem(), brk_free_unused() (once
other code is converted) will be able to free part of the BRK space even
in the xen.efi case. That would happen if BRK space extends across a 2Mb
boundary, and actual use stops before that boundary.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Changing setup.c's reserve_e820_ram() uses would be cumbersome when done
right here. That'll be done when ebmalloc() is replaced, and hence
what's there can also simply be replaced.

The xen.efi detection may want separating out into a helper.

When linking xen.efi, ld produces a base relocation for the reference to
__subsystem__, which is wrong (that's an absolute symbol, after all).
While that will need fixing there, it does no harm for our purposes.

--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -1,4 +1,5 @@
 obj-bin-y += head.o
+obj-bin-y += brk.init.o
 obj-bin-y += built-in-32.o
 obj-bin-y += $(obj64)
 
--- /dev/null
+++ b/xen/arch/x86/boot/brk.c
@@ -0,0 +1,72 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include <xen/efi.h>
+#include <xen/lib.h>
+#include <xen/mm.h>
+#include <xen/page-defs.h>
+
+#include <asm/brk.h>
+
+extern char __brk_start[];
+extern const char __bss_end[];
+
+static unsigned long __initdata allocated;
+static bool __initdata finished;
+
+void *__init brk_alloc(size_t size)
+{
+    void *ptr = __brk_start + allocated;
+
+    if ( finished )
+        return NULL;
+
+    /* Allocations PAGE_SIZE and up will be page-aligned. */
+    if ( size >= PAGE_SIZE )
+        allocated = ROUNDUP(allocated, PAGE_SIZE);
+
+    allocated += ROUNDUP(size, sizeof(void *));
+
+    if ( allocated > __bss_end - __brk_start )
+        return NULL;
+
+    return ptr;
+}
+
+unsigned long __init brk_get_unused_start(void)
+{
+    finished = true;
+
+    allocated = ROUNDUP(allocated, PAGE_SIZE);
+
+    return (unsigned long)__brk_start + allocated;
+}
+
+void __init brk_free_unused(void)
+{
+    unsigned long start = brk_get_unused_start(),
+                  end = (unsigned long)__bss_end;
+    unsigned int subsys;
+
+    /*
+     * Only xen.efi will have the symbol __subsystem__ available, and it'll
+     * be non-zero (10) there.  In ELF the symbol will be undefined, and
+     * hence zero will be loaded into the register.
+     */
+    asm ( ".weak __subsystem__; mov $__subsystem__, %0" : "=r" (subsys) );
+
+    /* using_2M_mapping() isn't available here. */
+    if ( IS_ENABLED(CONFIG_XEN_ALIGN_2M) || subsys )
+        start = PAGE_ALIGN_2M(start);
+
+    if ( start >= end )
+        return;
+
+    destroy_xen_mappings(start, PAGE_ALIGN_2M(end));
+
+    /*
+     * By reserving needed space early in the E820 map, excess space gets freed
+     * way before we make it here. Don't free the range a 2nd time.
+     */
+
+    printk(XENLOG_INFO "Freed %lukB unused BRK memory\n", (end - start) >> 10);
+}
--- /dev/null
+++ b/xen/arch/x86/include/asm/brk.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include <xen/types.h>
+
+void *brk_alloc(size_t size);
+unsigned long brk_get_unused_start(void);
+void brk_free_unused(void);
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -331,7 +331,11 @@ SECTIONS
        __bss_start = .;
        *(.bss.page_aligned*)
        PERCPU_BSS
-       *(.bss .bss.*)
+       *(.bss .bss.[a-zA-Z0-9_]*)
+       . = ALIGN(PAGE_SIZE);
+       __brk_start = .;
+       *(.bss..brk.page_aligned*)
+       *(.bss..brk*)
        . = ALIGN(POINTER_ALIGN);
        __bss_end = .;
   } PHDR(text)
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -112,6 +112,7 @@
 #include <xen/vmap.h>
 #include <xen/xmalloc.h>
 
+#include <asm/brk.h>
 #include <asm/e820.h>
 #include <asm/fixmap.h>
 #include <asm/flushtlb.h>
@@ -337,6 +338,8 @@ void __init arch_init_memory(void)
 
     efi_init_memory();
 
+    brk_free_unused();
+
 #ifndef NDEBUG
     if ( highmem_start )
     {


