Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B398F8902AC
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 16:09:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698949.1091239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rprNS-00084g-6x; Thu, 28 Mar 2024 15:09:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698949.1091239; Thu, 28 Mar 2024 15:09:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rprNS-00082Q-3i; Thu, 28 Mar 2024 15:09:14 +0000
Received: by outflank-mailman (input) for mailman id 698949;
 Thu, 28 Mar 2024 15:09:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jyVg=LC=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1rprNQ-0007WX-Tg
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 15:09:12 +0000
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [2607:f8b0:4864:20::f2c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21682a13-ed15-11ee-a1ef-f123f15fe8a2;
 Thu, 28 Mar 2024 16:09:11 +0100 (CET)
Received: by mail-qv1-xf2c.google.com with SMTP id
 6a1803df08f44-69682bdf1d5so6040366d6.2
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 08:09:11 -0700 (PDT)
Received: from rossla-lxenia.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4-20020a0562140d0400b00690bfb6aac7sm722826qvh.51.2024.03.28.08.09.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Mar 2024 08:09:08 -0700 (PDT)
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
X-Inumbo-ID: 21682a13-ed15-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1711638549; x=1712243349; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ebxGpBAV+p8Oi5D0bNnjpfaR9Xudz8+PMZfjdeRGehs=;
        b=myWkc8sjKfN09qClXOYi0sqxXBvAUamVYYy04j1b/fXUUI7Xn/FOj40aZ5msGM9FuV
         6WpeeHf211a3qIj82gTgpTLH6dQMb7m9ReRB0p04Qt1c2efPRynGjbVkfIuhelvQDR9D
         1IczmUuYRDAEvcSyXP6S2xEVY4pEGrJ9ilz2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711638549; x=1712243349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ebxGpBAV+p8Oi5D0bNnjpfaR9Xudz8+PMZfjdeRGehs=;
        b=C0Gb1PK+bNpGglGgcBAwaYp1HrZNLCf5G8vmVpFfku1AA3xwHVbimqZdb+hIDYr8jk
         CBFzuwT8pI/alqwAmdhjwdT1knGRWp1RbC40Ouz4ItNwfRyQAj1dUL4U1lR4XxkxYt/w
         BhJ3SwOd/xpWSC6Q8eo/XAInAW0xYbTVyGCfS5VjLfHenzOjVaWbZtHtES2NSgeoSyXi
         aExnR9pXOeua9yKdO2qI8+onl53qqZCk4kpkvBiX/yxsqS/s/COng7jMlxnEr5UZsOXh
         WLaOrDprRyZP1QNfaLmCDSm8d9u3D49nIXRxRS8zCugBDQIP/eJvC8OXNh4CTp6hcRf9
         5jfQ==
X-Gm-Message-State: AOJu0YyMMuBd7qMOH3082Ml626NaLNGvt2ptvlX0jIUJtGlkEP8ON62X
	AkzFPUT9hh+0++Y1vUe7FaZgQ/OEfwi374q79K3vyQrFN7fw/sqk1EdBzm/27wXHWy8LShsecYu
	vjQ==
X-Google-Smtp-Source: AGHT+IFsKsWKm6RgDqOLDAdGtIAVfjpTZVutmQZOD+xZmcxgA51W/+HOXphe1ATF9EC5abAC08kong==
X-Received: by 2002:a05:6214:9c2:b0:696:b089:9d6c with SMTP id dp2-20020a05621409c200b00696b0899d6cmr2780590qvb.52.1711638549450;
        Thu, 28 Mar 2024 08:09:09 -0700 (PDT)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 2/2] x86: Call Shim Verify in the multiboot2 path
Date: Thu, 28 Mar 2024 15:11:06 +0000
Message-ID: <20240328151106.1451104-3-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240328151106.1451104-1-ross.lagerwall@citrix.com>
References: <20240328151106.1451104-1-ross.lagerwall@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that the multiboot2 binary can be verified by Shim, ensure that the
dom0 kernel is verified when using the multiboot2 path. If the Shim
protocol is not available and the SecureBoot variable is not set to 0
(or the state cannot be determined), abort the boot.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/boot/head.S    |  4 ++-
 xen/arch/x86/efi/efi-boot.h | 65 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 67 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index d8ac0f0494db..e03ae19bdafb 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -349,10 +349,12 @@ __efi64_mb2_start:
         /* Keep the stack aligned. Do not pop a single item off it. */
         mov     (%rsp),%rdi
 
+        mov     %rbx, %rcx
+
         /*
          * efi_multiboot2() is called according to System V AMD64 ABI:
          *   - IN:  %rdi - EFI ImageHandle, %rsi - EFI SystemTable,
-         *          %rdx - MB2 cmdline
+         *          %rdx - MB2 cmdline, %rcx - Multiboot information.
          */
         call    efi_multiboot2
 
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 8ea64e31cdc2..a9569e150e08 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -3,6 +3,7 @@
  * is intended to be included by common/efi/boot.c _only_, and
  * therefore can define arch specific global variables.
  */
+#include <xen/multiboot2.h>
 #include <xen/vga.h>
 #include <asm/e820.h>
 #include <asm/edd.h>
@@ -808,9 +809,69 @@ static const char *__init get_option(const char *cmd, const char *opt)
     return o;
 }
 
+#define ALIGN_UP(arg, align) \
+                (((arg) + (align) - 1) & ~((typeof(arg))(align) - 1))
+
+static void __init efi_verify_dom0(uint64_t mbi_in)
+{
+    uint64_t ptr;
+    const multiboot2_tag_t *tag;
+    EFI_SHIM_LOCK_PROTOCOL *shim_lock;
+    EFI_STATUS status;
+    const multiboot2_tag_module_t *kernel = NULL;
+    const multiboot2_fixed_t *mbi_fix = _p(mbi_in);
+    static EFI_GUID __initdata shim_lock_guid = SHIM_LOCK_PROTOCOL_GUID;
+    static EFI_GUID __initdata global_variable_guid = EFI_GLOBAL_VARIABLE;
+
+    ptr = ALIGN_UP(mbi_in + sizeof(*mbi_fix), MULTIBOOT2_TAG_ALIGN);
+
+    for ( tag = _p(ptr); (uint64_t)tag - mbi_in < mbi_fix->total_size;
+          tag = _p(ALIGN_UP((uint64_t)tag + tag->size, MULTIBOOT2_TAG_ALIGN)) )
+    {
+        if ( tag->type == MULTIBOOT2_TAG_TYPE_MODULE )
+        {
+            kernel = (const multiboot2_tag_module_t *)tag;
+            break;
+        }
+        else if ( tag->type == MULTIBOOT2_TAG_TYPE_END )
+            break;
+    }
+
+    if ( !kernel )
+        return;
+
+    if ( (status = efi_bs->LocateProtocol(&shim_lock_guid, NULL,
+                                          (void **)&shim_lock)) != EFI_SUCCESS )
+    {
+        UINT32 attr;
+        UINT8 data;
+        UINTN size = sizeof(data);
+
+        status = efi_rs->GetVariable((CHAR16 *)L"SecureBoot", &global_variable_guid,
+                                     &attr, &size, &data);
+        if ( status == EFI_NOT_FOUND )
+            return;
+
+        if ( EFI_ERROR(status) )
+            PrintErrMesg(L"Could not get SecureBoot variable", status);
+
+        if ( attr != (EFI_VARIABLE_BOOTSERVICE_ACCESS | EFI_VARIABLE_RUNTIME_ACCESS) )
+            PrintErrMesg(L"Unexpected SecureBoot attributes", attr);
+
+        if ( size == 1 && data == 0 )
+            return;
+
+        blexit(L"Could not locate shim but Secure Boot is enabled");
+    }
+
+    if ( (status = shim_lock->Verify(_p(kernel->mod_start),
+                                     kernel->mod_end - kernel->mod_start)) != EFI_SUCCESS )
+        PrintErrMesg(L"Dom0 kernel image could not be verified", status);
+}
+
 void asmlinkage __init efi_multiboot2(EFI_HANDLE ImageHandle,
                                       EFI_SYSTEM_TABLE *SystemTable,
-                                      const char *cmdline)
+                                      const char *cmdline, uint64_t mbi_in)
 {
     EFI_GRAPHICS_OUTPUT_PROTOCOL *gop;
     EFI_HANDLE gop_handle;
@@ -902,6 +963,8 @@ void asmlinkage __init efi_multiboot2(EFI_HANDLE ImageHandle,
 
     efi_relocate_esrt(SystemTable);
 
+    efi_verify_dom0(mbi_in);
+
     efi_exit_boot(ImageHandle, SystemTable);
 }
 
-- 
2.43.0


