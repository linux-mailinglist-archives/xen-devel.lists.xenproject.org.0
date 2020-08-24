Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF88524FD73
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 14:07:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kABFz-0001c5-If; Mon, 24 Aug 2020 12:07:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIEj=CC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kABFx-0001by-P9
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 12:07:21 +0000
X-Inumbo-ID: 79e7dc83-9342-4113-9996-55df1ffb51f4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 79e7dc83-9342-4113-9996-55df1ffb51f4;
 Mon, 24 Aug 2020 12:07:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BCE17B7DF;
 Mon, 24 Aug 2020 12:07:48 +0000 (UTC)
Subject: [PATCH v2 1/2] build: also check for empty .bss.* in .o -> .init.o
 conversion
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <5dd2fcea-d8ec-1c20-6514-c7733b59047f@suse.com>
Message-ID: <7b51ef64-4393-6076-f00c-3dcafaafcefc@suse.com>
Date: Mon, 24 Aug 2020 14:07:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <5dd2fcea-d8ec-1c20-6514-c7733b59047f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

We're gaining such sections, and like .text.* and .data.* they shouldn't
be present in objects subject to automatic to-init conversion. Oddly
enough for quite some time we did have an instance breaking this rule,
which gets fixed at this occasion, by breaking out the EFI boot
allocator functions into its own translation unit.

Fixes: c5b9805bc1f7 ("efi: create new early memory allocator")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
This depends on "x86/EFI: sanitize build logic" updated to v3 earlier
today, due to the new source file added, as explicit dependencies on the
individual objects in x86/Makefile go away there.

--- a/xen/Makefile
+++ b/xen/Makefile
@@ -355,7 +355,7 @@ $(TARGET): delete-unfresh-files
 	$(MAKE) -C tools
 	$(MAKE) -f $(BASEDIR)/Rules.mk include/xen/compile.h
 	[ -e include/asm ] || ln -sf asm-$(TARGET_ARCH) include/asm
-	[ -e arch/$(TARGET_ARCH)/efi ] && for f in boot.c runtime.c compat.c efi.h;\
+	[ -e arch/$(TARGET_ARCH)/efi ] && for f in $$(cd common/efi; echo *.[ch]); \
 		do test -r arch/$(TARGET_ARCH)/efi/$$f || \
 		   ln -nsf ../../../common/efi/$$f arch/$(TARGET_ARCH)/efi/; \
 		done; \
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -188,7 +188,7 @@ define cmd_obj_init_o
     $(OBJDUMP) -h $< | while read idx name sz rest; do \
         case "$$name" in \
         .*.local) ;; \
-        .text|.text.*|.data|.data.*|.bss) \
+        .text|.text.*|.data|.data.*|.bss|.bss.*) \
             test $$(echo $$sz | sed 's,00*,0,') != 0 || continue; \
             echo "Error: size of $<:$$name is 0x$$sz" >&2; \
             exit $$(expr $$idx + 1);; \
--- a/xen/arch/arm/efi/Makefile
+++ b/xen/arch/arm/efi/Makefile
@@ -1,4 +1,4 @@
 CFLAGS-y += -fshort-wchar
 
-obj-y +=  boot.init.o runtime.o
+obj-y += boot.init.o ebmalloc.o runtime.o
 obj-$(CONFIG_ACPI) +=  efi-dom0.init.o
--- a/xen/arch/x86/efi/Makefile
+++ b/xen/arch/x86/efi/Makefile
@@ -8,7 +8,7 @@ cmd_objcopy_o_ihex = $(OBJCOPY) -I ihex
 
 boot.init.o: buildid.o
 
-EFIOBJ := boot.init.o compat.o runtime.o
+EFIOBJ := boot.init.o ebmalloc.o compat.o runtime.o
 
 $(call cc-option-add,cflags-stack-boundary,CC,-mpreferred-stack-boundary=4)
 $(EFIOBJ): CFLAGS-stack-boundary := $(cflags-stack-boundary)
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -112,7 +112,6 @@ static CHAR16 *FormatDec(UINT64 Val, CHA
 static CHAR16 *FormatHex(UINT64 Val, UINTN Width, CHAR16 *Buffer);
 static void  DisplayUint(UINT64 Val, INTN Width);
 static CHAR16 *wstrcpy(CHAR16 *d, const CHAR16 *s);
-static void noreturn blexit(const CHAR16 *str);
 static void PrintErrMesg(const CHAR16 *mesg, EFI_STATUS ErrCode);
 static char *get_value(const struct file *cfg, const char *section,
                               const char *item);
@@ -155,56 +154,6 @@ static CHAR16 __initdata newline[] = L"\
 #define PrintStr(s) StdOut->OutputString(StdOut, s)
 #define PrintErr(s) StdErr->OutputString(StdErr, s)
 
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
-static unsigned long __initdata ebmalloc_allocated;
-
-/* EFI boot allocator. */
-static void __init __maybe_unused *ebmalloc(size_t size)
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
-static void __init __maybe_unused free_ebmalloc_unused_mem(void)
-{
-#if 0 /* FIXME: Putting a hole in the BSS breaks the IOMMU mappings for dom0. */
-    unsigned long start, end;
-
-    start = (unsigned long)ebmalloc_mem + PAGE_ALIGN(ebmalloc_allocated);
-    end = (unsigned long)ebmalloc_mem + sizeof(ebmalloc_mem);
-
-    destroy_xen_mappings(start, end);
-    init_xenheap_pages(__pa(start), __pa(end));
-
-    printk(XENLOG_INFO "Freed %lukB unused BSS memory\n", (end - start) >> 10);
-#endif
-}
-
 /*
  * Include architecture specific implementation here, which references the
  * static globals defined above.
@@ -321,7 +270,7 @@ static bool __init match_guid(const EFI_
            !memcmp(guid1->Data4, guid2->Data4, sizeof(guid1->Data4));
 }
 
-static void __init noreturn blexit(const CHAR16 *str)
+void __init noreturn blexit(const CHAR16 *str)
 {
     if ( str )
         PrintStr((CHAR16 *)str);
--- /dev/null
+++ b/xen/common/efi/ebmalloc.c
@@ -0,0 +1,52 @@
+#include "efi.h"
+#include <xen/init.h>
+
+#ifdef CONFIG_ARM
+/*
+ * TODO: Enable EFI boot allocator on ARM.
+ * This code can be common for x86 and ARM.
+ * Things TODO on ARM before enabling ebmalloc:
+ *   - estimate required EBMALLOC_SIZE value,
+ *   - where (in which section) ebmalloc_mem[] should live; if in
+ *     .bss.page_aligned, as it is right now, then whole BSS zeroing
+ *     have to be disabled in xen/arch/arm/arm64/head.S; though BSS
+ *     should be initialized somehow before use of variables living there,
+ *   - use ebmalloc() in ARM/common EFI boot code,
+ *   - call free_ebmalloc_unused_mem() somewhere in init code.
+ */
+#define EBMALLOC_SIZE	MB(0)
+#else
+#define EBMALLOC_SIZE	MB(1)
+#endif
+
+static char __section(".bss.page_aligned") __aligned(PAGE_SIZE)
+    ebmalloc_mem[EBMALLOC_SIZE];
+static unsigned long __initdata ebmalloc_allocated;
+
+/* EFI boot allocator. */
+void __init *ebmalloc(size_t size)
+{
+    void *ptr = ebmalloc_mem + ebmalloc_allocated;
+
+    ebmalloc_allocated += ROUNDUP(size, sizeof(void *));
+
+    if ( ebmalloc_allocated > sizeof(ebmalloc_mem) )
+        blexit(L"Out of static memory\r\n");
+
+    return ptr;
+}
+
+void __init free_ebmalloc_unused_mem(void)
+{
+#if 0 /* FIXME: Putting a hole in the BSS breaks the IOMMU mappings for dom0. */
+    unsigned long start, end;
+
+    start = (unsigned long)ebmalloc_mem + PAGE_ALIGN(ebmalloc_allocated);
+    end = (unsigned long)ebmalloc_mem + sizeof(ebmalloc_mem);
+
+    destroy_xen_mappings(start, end);
+    init_xenheap_pages(__pa(start), __pa(end));
+
+    printk(XENLOG_INFO "Freed %lukB unused BSS memory\n", (end - start) >> 10);
+#endif
+}
--- a/xen/common/efi/efi.h
+++ b/xen/common/efi/efi.h
@@ -40,4 +40,10 @@ extern UINT64 efi_boot_max_var_store_siz
 extern UINT64 efi_apple_properties_addr;
 extern UINTN efi_apple_properties_len;
 
+void noreturn blexit(const CHAR16 *str);
+
 const CHAR16 *wmemchr(const CHAR16 *s, CHAR16 c, UINTN n);
+
+/* EFI boot allocator. */
+void *ebmalloc(size_t size);
+void free_ebmalloc_unused_mem(void);


