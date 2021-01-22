Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8812FF99D
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 01:56:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72509.130642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2kjz-00036Z-MZ; Fri, 22 Jan 2021 00:55:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72509.130642; Fri, 22 Jan 2021 00:55:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2kjz-00035s-Ha; Fri, 22 Jan 2021 00:55:55 +0000
Received: by outflank-mailman (input) for mailman id 72509;
 Fri, 22 Jan 2021 00:55:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0NXE=GZ=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1l2kjx-0002iW-F1
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 00:55:53 +0000
Received: from mail-pg1-x52a.google.com (unknown [2607:f8b0:4864:20::52a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0d9f985f-418d-43ce-9d7d-ca8dfe616b4f;
 Fri, 22 Jan 2021 00:55:29 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id n7so2549880pgg.2
 for <xen-devel@lists.xenproject.org>; Thu, 21 Jan 2021 16:55:29 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:4f00:c640:3cc1:5f60:de20:49b1])
 by smtp.gmail.com with ESMTPSA id j23sm6930632pgj.34.2021.01.21.16.55.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 16:55:27 -0800 (PST)
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
X-Inumbo-ID: 0d9f985f-418d-43ce-9d7d-ca8dfe616b4f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tC+Ha12V0dpfa9Cu5M+i6p2NWUFLttttFdqrSG/YBi8=;
        b=lmVBI3kuMZwYWqwxhZkaqFCK5KXLZsst1Ea0eRfZRg6oZIktVdWtVudJ3JBi763V7A
         1oXfEdztcSORt0x5RdDv8lLWEoLarXqBwebKdTGQjM/r6jIAl+2+RriVGA19a5Vl/qgq
         SGWJA+EuIOMVYOfQsFKcfV+KiFyidlY234YMJQPH/wjLuNi9CV7ot1BP93puwRtooqRX
         WFt9DrWA18nOgPVtq1WeYYHgoy9pzYEjgst+2rwlZ6lpMfYqtcKSTOb7kidGIfJXzSot
         kgwSIpb9gVu3Hdih5NozmzF4FsWfVNfAviV5gnhdkC4FC+JxHD7VISHxyY/euzbOuhrQ
         nX7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tC+Ha12V0dpfa9Cu5M+i6p2NWUFLttttFdqrSG/YBi8=;
        b=XCTe2UWIX/vY4Fbe4bQBTDcHV2CuzcmJSUlbc8KGjV7Z/sj1gWcT3TAJTi7wR9ui4q
         KeT+zV2x/MSU37nRked99GIz6lQYFkE1xAh2lgzKrRbV0+JeBR72Wx1rG4DVxxlllVmU
         ZEE9dyizz5SSerx3XZboioNamsMB/XPsrp7Wdr6bLnzt4fE4MniiHo4WQLcSZzz6jL2a
         3Zv9iQJEk3L3kyTSH7WYDevmzZ+CQwh9D5mDppRG85jFr3QzOo0KggJf/eej2FXXO+pM
         5fNqeSEsXG814Sq63xJpSUMz5afOH6UbdSkwwtzpTwwJ1l8KBuJh0/8c+BUgamppQVoS
         YvWA==
X-Gm-Message-State: AOAM532p9sycLrv9hiWCEArK/KM02hyEPNSIqLYUa8NDS2vpKQeLDYY4
	an5gPsjmXU7Oq5mNfZuVOVQHe1ZjGR+Tc5GG
X-Google-Smtp-Source: ABdhPJzAzZ4zoqgFJQX0gYqaTtqSjoMsKCocYfA8QnBDUuWY9ZN9X7NDzYoWXEFbDAh4+7GG8w7GGQ==
X-Received: by 2002:aa7:8d86:0:b029:19e:cb57:2849 with SMTP id i6-20020aa78d860000b029019ecb572849mr2417925pfr.54.1611276928218;
        Thu, 21 Jan 2021 16:55:28 -0800 (PST)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Daniel Kiper <daniel.kiper@oracle.com>,
	Bobby Eshleman <bobbyeshleman@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 5/5] xen/x86/efi: Verify dom0 kernel with SHIM_LOCK protocol in efi_multiboot2()
Date: Thu, 21 Jan 2021 16:51:44 -0800
Message-Id: <44cb9567aa17d6255beadaa48defccd246b35669.1611273359.git.bobbyeshleman@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <cover.1611273359.git.bobbyeshleman@gmail.com>
References: <cover.1611273359.git.bobbyeshleman@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Kiper <daniel.kiper@oracle.com>

This splits out efi_shim_lock() into common code and uses it to verify
the dom0 kernel in efi_multiboot2().

Signed-off-by: Daniel Kiper <daniel.kiper@oracle.com>
Signed-off-by: Bobby Eshleman <bobbyeshleman@gmail.com>
---
 xen/arch/x86/boot/head.S    | 20 ++++++++++++++++++--
 xen/arch/x86/efi/efi-boot.h |  6 ++++++
 xen/arch/x86/efi/stub.c     |  5 ++++-
 xen/common/efi/boot.c       | 19 +++++++++++++------
 4 files changed, 41 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index f2edd182a5..943792eb43 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -244,9 +244,13 @@ __efi64_mb2_start:
         jmp     x86_32_switch
 
 .Lefi_multiboot2_proto:
-        /* Zero EFI SystemTable and EFI ImageHandle addresses. */
+        /*
+         * Zero EFI SystemTable, EFI ImageHandle and
+         * dom0 kernel module struct addresses.
+         */
         xor     %esi,%esi
         xor     %edi,%edi
+        xor     %r14d, %r14d
 
         /* Skip Multiboot2 information fixed part. */
         lea     (MB2_fixed_sizeof+MULTIBOOT2_TAG_ALIGN-1)(%rbx),%ecx
@@ -284,6 +288,15 @@ __efi64_mb2_start:
         cmove   MB2_efi64_ih(%rcx),%rdi
         je      .Lefi_mb2_next_tag
 
+        /* Get Dom0 kernel module struct address from Multiboot2 information. */
+        cmpl    $MULTIBOOT2_TAG_TYPE_MODULE,MB2_tag_type(%rcx)
+        jne     .Lefi_mb2_end
+
+        test    %r14d, %r14d
+        cmovz   %ecx, %r14d
+        jmp     .Lefi_mb2_next_tag
+
+.Lefi_mb2_end:
         /* Is it the end of Multiboot2 information? */
         cmpl    $MULTIBOOT2_TAG_TYPE_END,MB2_tag_type(%rcx)
         je      .Lrun_bs
@@ -345,9 +358,12 @@ __efi64_mb2_start:
         /* Keep the stack aligned. Do not pop a single item off it. */
         mov     (%rsp),%rdi
 
+        mov     %r14d, %edx
+
         /*
          * efi_multiboot2() is called according to System V AMD64 ABI:
-         *   - IN:  %rdi - EFI ImageHandle, %rsi - EFI SystemTable.
+         *   - IN: %rdi - EFI ImageHandle, %rsi - EFI SystemTable,
+         *         %rdx - Dom0 kernel module struct address.
          */
         call    efi_multiboot2
 
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index f694a069c9..0d025ad9a5 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -3,6 +3,8 @@
  * is intended to be included by common/efi/boot.c _only_, and
  * therefore can define arch specific global variables.
  */
+#include <xen/types.h>
+#include <xen/multiboot2.h>
 #include <xen/vga.h>
 #include <asm/e820.h>
 #include <asm/edd.h>
@@ -762,6 +764,10 @@ void __init efi_multiboot2(EFI_HANDLE ImageHandle,
 
     gop = efi_get_gop();
 
+    if ( dom0_kernel && dom0_kernel->mod_end > dom0_kernel->mod_start )
+        efi_shim_lock((VOID *)(unsigned long)dom0_kernel->mod_start,
+                      dom0_kernel->mod_end - dom0_kernel->mod_start);
+
     if ( gop )
         gop_mode = efi_find_gop_mode(gop, 0, 0, 0);
 
diff --git a/xen/arch/x86/efi/stub.c b/xen/arch/x86/efi/stub.c
index 9bd6355ec3..7d459905fa 100644
--- a/xen/arch/x86/efi/stub.c
+++ b/xen/arch/x86/efi/stub.c
@@ -1,7 +1,9 @@
+#include <xen/types.h>
 #include <xen/efi.h>
 #include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/lib.h>
+#include <xen/multiboot2.h>
 #include <asm/asm_defns.h>
 #include <asm/efibind.h>
 #include <asm/page.h>
@@ -29,7 +31,8 @@ asm (
     );
 
 void __init noreturn efi_multiboot2(EFI_HANDLE ImageHandle,
-                                    EFI_SYSTEM_TABLE *SystemTable)
+                                    EFI_SYSTEM_TABLE *SystemTable,
+                                    multiboot2_tag_module_t *dom0_kernel)
 {
     static const CHAR16 __initconst err[] =
         L"Xen does not have EFI code build in!\r\nSystem halted!\r\n";
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 63e289ab85..8ce6715b59 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -133,6 +133,7 @@ static void efi_console_set_mode(void);
 static EFI_GRAPHICS_OUTPUT_PROTOCOL *efi_get_gop(void);
 static UINTN efi_find_gop_mode(EFI_GRAPHICS_OUTPUT_PROTOCOL *gop,
                                UINTN cols, UINTN rows, UINTN depth);
+static void efi_shim_lock(const VOID *Buffer, UINT32 Size);
 static void efi_tables(void);
 static void setup_efi_pci(void);
 static void efi_variables(void);
@@ -830,6 +831,17 @@ static UINTN __init efi_find_gop_mode(EFI_GRAPHICS_OUTPUT_PROTOCOL *gop,
     return gop_mode;
 }
 
+static void __init efi_shim_lock(const VOID *Buffer, UINT32 Size)
+{
+    static EFI_GUID __initdata shim_lock_guid = SHIM_LOCK_PROTOCOL_GUID;
+    EFI_SHIM_LOCK_PROTOCOL *shim_lock;
+    EFI_STATUS status;
+
+    if ( !EFI_ERROR(efi_bs->LocateProtocol(&shim_lock_guid, NULL, (void **)&shim_lock)) &&
+         (status = shim_lock->Verify(Buffer, Size)) != EFI_SUCCESS )
+        PrintErrMesg(L"Dom0 kernel image could not be verified", status);
+}
+
 static void __init efi_tables(void)
 {
     unsigned int i;
@@ -1123,13 +1135,11 @@ void EFIAPI __init noreturn
 efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
 {
     static EFI_GUID __initdata loaded_image_guid = LOADED_IMAGE_PROTOCOL;
-    static EFI_GUID __initdata shim_lock_guid = SHIM_LOCK_PROTOCOL_GUID;
     EFI_LOADED_IMAGE *loaded_image;
     EFI_STATUS status;
     unsigned int i, argc;
     CHAR16 **argv, *file_name, *cfg_file_name = NULL, *options = NULL;
     UINTN gop_mode = ~0;
-    EFI_SHIM_LOCK_PROTOCOL *shim_lock;
     EFI_GRAPHICS_OUTPUT_PROTOCOL *gop = NULL;
     union string section = { NULL }, name;
     bool base_video = false;
@@ -1296,10 +1306,7 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
             read_file(dir_handle, s2w(&name), &kernel, option_str);
             efi_bs->FreePool(name.w);
 
-            if ( !EFI_ERROR(efi_bs->LocateProtocol(&shim_lock_guid, NULL,
-                            (void **)&shim_lock)) &&
-                 (status = shim_lock->Verify(kernel.ptr, kernel.size)) != EFI_SUCCESS )
-                PrintErrMesg(L"Dom0 kernel image could not be verified", status);
+            efi_shim_lock(kernel.ptr, kernel.size);
         }
 
         if ( !read_section(loaded_image, L"ramdisk", &ramdisk, NULL) )
-- 
2.30.0


