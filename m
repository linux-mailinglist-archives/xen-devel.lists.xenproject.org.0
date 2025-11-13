Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A24C571AE
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 12:09:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160998.1489023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJVCw-000744-SN; Thu, 13 Nov 2025 11:09:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160998.1489023; Thu, 13 Nov 2025 11:09:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJVCw-00071H-PE; Thu, 13 Nov 2025 11:09:42 +0000
Received: by outflank-mailman (input) for mailman id 1160998;
 Thu, 13 Nov 2025 11:09:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJVCv-00071B-21
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 11:09:41 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f821288-c081-11f0-9d18-b5c5bf9af7f9;
 Thu, 13 Nov 2025 12:09:39 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-6419e6dab7fso999838a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 03:09:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a3d7335sm1220401a12.4.2025.11.13.03.09.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 03:09:38 -0800 (PST)
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
X-Inumbo-ID: 3f821288-c081-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763032179; x=1763636979; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FL0FICzmakeWQSwiOt+QBkhmyqz6vTIP8is0c/IB2xQ=;
        b=f1kSr+jvoCD/ycTzJk2OQk9n2YEYYI3NW7WZfN2+Q6EK2rDB14BvCTFwqWG7vmrKQG
         J5cvxwrvtP1RBN5Q+N89D2a6w+wXceXC0vw+pDx9Syh3ywOBZQ1scWhklINFC69dLh7S
         Dzot59J2qSv1Sa6+yKnd/bJSlDyvRtt2FeIu0UYjyEfOaahpnWwuYdlqUZODwGLb8/sO
         bsrlXl66DSmcF6viGbMnRjtEhbPDRt+XCQiig3LQuQnnp9tcBqqdZhpFhhDcakJI0LyW
         zMtks4dDz8sM4ZnrmiGT1TVQ9GMXPdlP9hwcwQ2n5aEtQMiFtDo5An4vG5L1O8cXVPBn
         6c+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763032179; x=1763636979;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FL0FICzmakeWQSwiOt+QBkhmyqz6vTIP8is0c/IB2xQ=;
        b=tItKeUVnikXsxGJHtIlNs+8Ug2GT3HRZkdubecqmk+Oh6RShorttFMvzKxssan0RzR
         qzsNMJTjKcNJCkPTkHrMj8qpOcQnrGesrJtB5vb9+6SwAmiqQCbiaKGQ/Gj4GJVLUV2x
         q3qfPJHuSy+DWGYpNfekDnMzPgt4isTcTVFr5zx+ftbSH/jmWkQCTGlbInBJepqpEH5x
         NC0m0I9XhAYB6QaYWM6ciINNfbscqCPfFqnJEbDTs2OgziEHCq3yGeF32FVWmL9UJPtE
         AiB98lavZCNBrTztqnQKtAOjiQOUamwgDdSuJNfhrWPebFJsFTEn5r8cec+lIORuD63j
         8I4A==
X-Gm-Message-State: AOJu0YzKoP/MA/XO6f0w+F2bVQDudMZN10F0dXZV41UgWW9GR1/vaoiB
	t4yZg1E8eFMFfP8J9ZvIWh5aRNuFL2Xt5reMQRwbPA58larAm6aZRywzXKltdw4REYxTPMlMsck
	Rt7s=
X-Gm-Gg: ASbGncvLYqCuiotSth/+IIPkRJRE4OXFS5uGjDgZbhKTM+Z9+RYLgulSvvdW6r31Rh/
	OtCgV7KDOkk35j1gFMmxZvDLl/WPZlWSv7skB2/exZgXMLBbIGk61oTypE89y4pfCPxHKV47vwK
	ELBuzN5BoK5tsNepL+XM7SVMx5JVLtIAfs9AlU0dSYJhuUXUMRvoVRmH7jMML/mJ9VnkAA3qqIJ
	M0i56fBvB75t5cg/4q7EGUk0lV1z3mi8Accs719MaWBr4LBZG0WKTB5E79g+4griB9GGolbH9JC
	gCemUl9RhDK3HMaqjHs+V/kA841IM/IU0VfRMqKS4JQrFd+W5i616NK8WUYn6jQ+q7XSEPB3K/I
	WZ041MUbfH8Xmen9duF0e6Gop60uJgqOVkuOu7wz/h/EjXJbjjYLCKzYKfk/V8BHPRa2F5w32FG
	rRgWVFShQivxb3nx7BBRnehNGMXWbbQoh29GfF7qiYSh/g7fcXihkimDc0QwPd0NC1Kd/VES1kg
	kE=
X-Google-Smtp-Source: AGHT+IGg7q/D9GwuBWGMxPhUPl54zwC+G92GrsPaapBaSO0AO/HKdqIgTALzi0uYCvztJsOYAccPvg==
X-Received: by 2002:a05:6402:2707:b0:640:bd90:350d with SMTP id 4fb4d7f45d1cf-6431a4c014fmr5547928a12.1.1763032179224;
        Thu, 13 Nov 2025 03:09:39 -0800 (PST)
Message-ID: <452fdf1f-646a-4bb1-83ea-ac4c998a096b@suse.com>
Date: Thu, 13 Nov 2025 12:09:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/3] x86/EFI: replace ebmalloc()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
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

Use the new brk_alloc() instead, with ebmalloc() merely being a thin
wrapper.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I'm not quite certain whether we ought to permit non-page-granular
reservations. The in-memory image being somewhat larger due to possibly
excessive padding isn't really a big problem, I think.

--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -262,7 +262,7 @@ quiet_cmd_obj_init_o = INIT_O  $@
 define cmd_obj_init_o
     $(OBJDUMP) -h $< | while read idx name sz rest; do \
         case "$$name" in \
-        .*.local) ;; \
+        .*.local|.bss..brk*) ;; \
         .text|.text.*|.data|.data.*|.bss|.bss.*) \
             test $$(echo $$sz | sed 's,00*,0,') != 0 || continue; \
             echo "Error: size of $<:$$name is 0x$$sz" >&2; \
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -10,6 +10,7 @@
 #include <xen/vga.h>
 
 #include <asm/boot-helpers.h>
+#include <asm/brk.h>
 #include <asm/e820.h>
 #include <asm/edd.h>
 #include <asm/microcode.h>
@@ -119,6 +120,18 @@ static void __init relocate_trampoline(u
     reloc_trampoline64();
 }
 
+DEFINE_BRK(efi, MB(1));
+
+static void *__init ebmalloc(size_t size)
+{
+    void *ptr = brk_alloc(size);
+
+    if ( !ptr )
+        blexit(L"Out of BRK memory\r\n");
+
+    return ptr;
+}
+
 static void __init place_string(u32 *addr, const char *s)
 {
     char *alloc = NULL;
--- a/xen/arch/x86/efi/stub.c
+++ b/xen/arch/x86/efi/stub.c
@@ -41,12 +41,4 @@ void __init noreturn efi_multiboot2(EFI_
 
 void __init efi_init_memory(void) { }
 
-bool efi_boot_mem_unused(unsigned long *start, unsigned long *end)
-{
-    /* FIXME: Simplify once the call here with two NULLs goes away. */
-    if ( start || end )
-        *start = *end = (unsigned long)_end;
-    return false;
-}
-
 void efi_update_l4_pgtable(unsigned int l4idx, l4_pgentry_t l4e) { }
--- a/xen/arch/x86/include/asm/brk.h
+++ b/xen/arch/x86/include/asm/brk.h
@@ -2,6 +2,10 @@
 
 #include <xen/types.h>
 
+#define DEFINE_BRK(var, size) \
+    static char __section(".bss..brk.page_aligned") __aligned(PAGE_SIZE) \
+        __used var ## _brk_[size]
+
 void *brk_alloc(size_t size);
 unsigned long brk_get_unused_start(void);
 void brk_free_unused(void);
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -9,6 +9,8 @@ extern const char __2M_rodata_start[], _
 extern char __2M_init_start[], __2M_init_end[];
 extern char __2M_rwdata_start[], __2M_rwdata_end[];
 
+extern unsigned long brk_end;
+
 extern unsigned long xenheap_initial_phys_start;
 extern uint64_t boot_tsc_stamp;
 
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -31,6 +31,7 @@
 #include <asm/alternative.h>
 #include <asm/apic.h>
 #include <asm/bootinfo.h>
+#include <asm/brk.h>
 #include <asm/bzimage.h>
 #include <asm/cpu-policy.h>
 #include <asm/e820.h>
@@ -163,6 +164,8 @@ cpumask_t __read_mostly cpu_present_map;
 
 unsigned long __read_mostly xen_phys_start;
 
+unsigned long __ro_after_init brk_end;
+
 /* Only used in asm code and within this source file */
 char asmlinkage __section(".init.bss.stack_aligned") __aligned(STACK_SIZE)
     cpu0_stack[STACK_SIZE];
@@ -1109,7 +1112,6 @@ void asmlinkage __init noreturn __start_
     struct boot_info *bi;
     unsigned long nr_pages, raw_max_page;
     int i, j, bytes = 0;
-    unsigned long eb_start, eb_end;
     bool acpi_boot_table_init_done = false, relocated = false;
     bool vm_init_done = false;
     int ret;
@@ -1473,7 +1475,7 @@ void asmlinkage __init noreturn __start_
         /*
          * This needs to remain in sync with remove_xen_ranges() and the
          * respective reserve_e820_ram() invocation below. No need to
-         * query efi_boot_mem_unused() here, though.
+         * query brk_get_unused_start() here, though.
          */
         xen->start = virt_to_maddr(_stext);
         xen->size  = __2M_rwdata_end - _stext;
@@ -1616,18 +1618,11 @@ void asmlinkage __init noreturn __start_
     if ( !xen_phys_start )
         panic("Not enough memory to relocate Xen\n");
 
-    /* FIXME: Putting a hole in .bss would shatter the large page mapping. */
-    if ( using_2M_mapping() )
-        efi_boot_mem_unused(NULL, NULL);
-
     /* This needs to remain in sync with remove_xen_ranges(). */
-    if ( efi_boot_mem_unused(&eb_start, &eb_end) )
-    {
-        reserve_e820_ram(&boot_e820, __pa(_stext), __pa(eb_start));
-        reserve_e820_ram(&boot_e820, __pa(eb_end), __pa(__2M_rwdata_end));
-    }
-    else
-        reserve_e820_ram(&boot_e820, __pa(_stext), __pa(__2M_rwdata_end));
+    brk_end = brk_get_unused_start();
+    if ( using_2M_mapping() )
+        brk_end = PAGE_ALIGN_2M(brk_end);
+    reserve_e820_ram(&boot_e820, __pa(_stext), __pa(brk_end));
 
     /* Late kexec reservation (dynamic start address). */
     kexec_reserve_area();
@@ -2231,7 +2226,6 @@ __initcall(init_xen_cap_info);
 
 int __hwdom_init remove_xen_ranges(struct rangeset *r)
 {
-    paddr_t start, end;
     int rc;
 
     /* S3 resume code (and other real mode trampoline code) */
@@ -2253,26 +2247,10 @@ int __hwdom_init remove_xen_ranges(struc
         return rc;
 
     /* hypervisor .data + .bss */
-    if ( efi_boot_mem_unused(&start, &end) )
-    {
-        ASSERT(__pa(start) >= __pa(&__2M_rwdata_start));
-        rc = rangeset_remove_range(r, PFN_DOWN(__pa(&__2M_rwdata_start)),
-                                   PFN_DOWN(__pa(start) - 1));
-        if ( rc )
-            return rc;
-        ASSERT(__pa(end) <= __pa(&__2M_rwdata_end));
-        rc = rangeset_remove_range(r, PFN_DOWN(__pa(end)),
-                                   PFN_DOWN(__pa(&__2M_rwdata_end) - 1));
-        if ( rc )
-            return rc;
-    }
-    else
-    {
-        rc = rangeset_remove_range(r, PFN_DOWN(__pa(&__2M_rwdata_start)),
-                                   PFN_DOWN(__pa(&__2M_rwdata_end) - 1));
-        if ( rc )
-            return rc;
-    }
+    rc = rangeset_remove_range(r, PFN_DOWN(__pa(&__2M_rwdata_start)),
+                               PFN_DOWN(__pa(brk_end) - 1));
+    if ( rc )
+        return rc;
 
     return 0;
 }
--- a/xen/arch/x86/tboot.c
+++ b/xen/arch/x86/tboot.c
@@ -321,8 +321,6 @@ void tboot_shutdown(uint32_t shutdown_ty
     /* if this is S3 then set regions to MAC */
     if ( shutdown_type == TB_SHUTDOWN_S3 )
     {
-        unsigned long s, e;
-
         /*
          * Xen regions for tboot to MAC. This needs to remain in sync with
          * remove_xen_ranges().
@@ -336,16 +334,8 @@ void tboot_shutdown(uint32_t shutdown_ty
         g_tboot_shared->mac_regions[1].size = __2M_rodata_end - _stext;
         /* hypervisor .data + .bss */
         g_tboot_shared->mac_regions[2].start = (uint64_t)__pa(&__2M_rwdata_start);
-        g_tboot_shared->mac_regions[2].size = __2M_rwdata_end - __2M_rwdata_start;
-        if ( efi_boot_mem_unused(&s, &e) )
-        {
-            g_tboot_shared->mac_regions[2].size =
-                s - (unsigned long)__2M_rwdata_start;
-            g_tboot_shared->mac_regions[3].start = __pa(e);
-            g_tboot_shared->mac_regions[3].size =
-                (unsigned long)__2M_rwdata_end - e;
-            g_tboot_shared->num_mac_regions = 4;
-        }
+        g_tboot_shared->mac_regions[2].size =
+            brk_end - (unsigned long)__2M_rwdata_start;
 
         /*
          * MAC domains and other Xen memory
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -1788,8 +1788,6 @@ void __init efi_init_memory(void)
         pte_attr_t prot;
     } *extra, *extra_head = NULL;
 
-    free_ebmalloc_unused_mem();
-
     if ( !efi_enabled(EFI_BOOT) )
         return;
 
--- a/xen/common/efi/ebmalloc.c
+++ /dev/null
@@ -1,74 +0,0 @@
-#include "efi.h"
-#include <xen/init.h>
-#include <xen/mm.h>
-
-#ifdef CONFIG_ARM
-/*
- * TODO: Enable EFI boot allocator on ARM.
- * This code can be common for x86 and ARM.
- * Things TODO on ARM before enabling ebmalloc:
- *   - estimate required EBMALLOC_SIZE value,
- *   - where (in which section) ebmalloc_mem[] should live; if in
- *     .bss.page_aligned, as it is right now, then whole BSS zeroing
- *     have to be disabled in xen/arch/arm/arm64/head.S; though BSS
- *     should be initialized somehow before use of variables living there,
- *   - use ebmalloc() in ARM/common EFI boot code,
- *   - call free_ebmalloc_unused_mem() somewhere in init code.
- */
-#define EBMALLOC_SIZE	MB(0)
-#else
-#define EBMALLOC_SIZE	MB(1)
-#endif
-
-static char __section(".bss.page_aligned") __aligned(PAGE_SIZE)
-    ebmalloc_mem[EBMALLOC_SIZE];
-static unsigned long __read_mostly ebmalloc_allocated;
-
-/* EFI boot allocator. */
-void __init *ebmalloc(size_t size)
-{
-    void *ptr = ebmalloc_mem + ebmalloc_allocated;
-
-    ebmalloc_allocated += ROUNDUP(size, sizeof(void *));
-
-    if ( ebmalloc_allocated > sizeof(ebmalloc_mem) )
-        blexit(L"Out of static memory\r\n");
-
-    return ptr;
-}
-
-bool efi_boot_mem_unused(unsigned long *start, unsigned long *end)
-{
-    /* FIXME: Drop once the call here with two NULLs goes away. */
-    if ( !start && !end )
-    {
-        ebmalloc_allocated = sizeof(ebmalloc_mem);
-        return false;
-    }
-
-    *start = (unsigned long)ebmalloc_mem + PAGE_ALIGN(ebmalloc_allocated);
-    *end = (unsigned long)ebmalloc_mem + sizeof(ebmalloc_mem);
-
-    return *start < *end;
-}
-
-void __init free_ebmalloc_unused_mem(void)
-{
-    unsigned long start, end;
-
-    if ( !efi_boot_mem_unused(&start, &end) )
-        return;
-
-    destroy_xen_mappings(start, end);
-
-#ifdef CONFIG_X86
-    /*
-     * By reserving the space early in the E820 map, it gets freed way before
-     * we make it here. Don't free the range a 2nd time.
-     */
-#else
-    init_xenheap_pages(__pa(start), __pa(end));
-#endif
-
-    printk(XENLOG_INFO "Freed %lukB unused BSS memory\n", (end - start) >> 10);
-}
--- a/xen/common/efi/efi-common.mk
+++ b/xen/common/efi/efi-common.mk
@@ -1,4 +1,4 @@
-EFIOBJ-y := boot.init.o pe.init.o ebmalloc.o runtime.o
+EFIOBJ-y := boot.init.o pe.init.o runtime.o
 EFIOBJ-$(CONFIG_COMPAT) += compat.o
 
 CFLAGS-y += -fshort-wchar
--- a/xen/common/efi/efi.h
+++ b/xen/common/efi/efi.h
@@ -48,10 +48,6 @@ void noreturn blexit(const CHAR16 *str);
 
 const CHAR16 *wmemchr(const CHAR16 *s, CHAR16 c, UINTN n);
 
-/* EFI boot allocator. */
-void *ebmalloc(size_t size);
-void free_ebmalloc_unused_mem(void);
-
 const void *pe_find_section(const void *image, const UINTN image_size,
                             const CHAR16 *section_name, UINTN *size_out);
 
--- a/xen/include/xen/efi.h
+++ b/xen/include/xen/efi.h
@@ -39,7 +39,6 @@ static inline bool efi_enabled(unsigned
 extern bool efi_secure_boot;
 
 void efi_init_memory(void);
-bool efi_boot_mem_unused(unsigned long *start, unsigned long *end);
 bool efi_rs_using_pgtables(void);
 unsigned long efi_get_time(void);
 void efi_halt_system(void);


