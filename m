Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8D687A9F6
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 16:03:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692495.1079712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkQ8s-0004yX-Al; Wed, 13 Mar 2024 15:03:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692495.1079712; Wed, 13 Mar 2024 15:03:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkQ8s-0004wA-6G; Wed, 13 Mar 2024 15:03:42 +0000
Received: by outflank-mailman (input) for mailman id 692495;
 Wed, 13 Mar 2024 15:03:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fwto=KT=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1rkQ8q-0003t5-HB
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 15:03:40 +0000
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [2607:f8b0:4864:20::832])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dfbba345-e14a-11ee-afdd-a90da7624cb6;
 Wed, 13 Mar 2024 16:03:39 +0100 (CET)
Received: by mail-qt1-x832.google.com with SMTP id
 d75a77b69052e-42f468b62f1so18609091cf.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 08:03:39 -0700 (PDT)
Received: from rossla-lxenia.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 s9-20020ac85ec9000000b0042ef4b5f4fbsm4930034qtx.38.2024.03.13.08.03.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 08:03:37 -0700 (PDT)
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
X-Inumbo-ID: dfbba345-e14a-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710342218; x=1710947018; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QiEx2+FLzW3zGCVQrA43mi0ECENchTli/sSUjekg7XE=;
        b=qZwyMYL1mLpk7EdfkdjdqZKanWej+vjsND+QOl/Rao1w9ewDq+Qn9aBraHZpn9EOpK
         tf6nbrUsMk6SVhbmyVu9e6yhf5u2tYQeooMZT15XeHKQxZKeGTIfaIoGiFKe+CNxtbkA
         AOiSjWaVKUe7i+2gFK4zAX59HhFWuvZlx6N0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710342218; x=1710947018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QiEx2+FLzW3zGCVQrA43mi0ECENchTli/sSUjekg7XE=;
        b=c0EiK4mA/pA3NxeKq5YPN37COjddCA2eDgfemKd8B2aIoqgIBTgI237oslq+whDec8
         oBtv2AWtDg3RzUveUuksAKhLeLTgZc75blavj6s6HIPakrXlxm5TMR2vySQe3BAbi5Tb
         QMiRl9KWg7FQPSi3juLjwk+5x0wORjcR4qCC8eOYPO5o0zwEb+S7eVOpEhgq377ci20R
         +8CTORlRFhTd3Qt7LFtYtY/k+K/unNAkcuYGYOVkEt5JW5fwXFeQWVCKJevnh0j/IG+G
         HlCFH5nJ3XBAgVc1cx+5OjU7zxja196iMwDFhhspVTpp3JJ9fxqpmOtIvueZ9mq6qmu6
         98ZQ==
X-Gm-Message-State: AOJu0YzN/s8fbMgfxn/zNQzNBV4+3GDx+1Gs7Qzbl9FOY0fSBo/7fYrG
	hJNpoIKDKAL06Io8t3oEqMpV4N5h/95MjCTTyuomYXlh/lVkYwNmOG6fGb0Ud7IA+jEdt0bJbrf
	ltQ==
X-Google-Smtp-Source: AGHT+IEY4iMUpxcQkqaJtj9BZiqXpcRfn1PNNn7j6IsH2RqYkSF7CFfot+XPRvFlXjpahBC8IR10pQ==
X-Received: by 2002:a05:622a:653:b0:42e:eb7d:1ab3 with SMTP id a19-20020a05622a065300b0042eeb7d1ab3mr5774242qtb.65.1710342218284;
        Wed, 13 Mar 2024 08:03:38 -0700 (PDT)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 4/4] x86: Call Shim Verify in the multiboot2 path
Date: Wed, 13 Mar 2024 15:04:39 +0000
Message-ID: <20240313150439.791213-5-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240313150439.791213-1-ross.lagerwall@citrix.com>
References: <20240313150439.791213-1-ross.lagerwall@citrix.com>
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
index 84dc8b76b61d..7b6e5d3882ad 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -385,10 +385,12 @@ __efi64_mb2_start:
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


