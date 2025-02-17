Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 861DBA38915
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 17:27:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890662.1299811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk3xf-0005rG-Np; Mon, 17 Feb 2025 16:27:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890662.1299811; Mon, 17 Feb 2025 16:27:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk3xf-0005pC-Ka; Mon, 17 Feb 2025 16:27:11 +0000
Received: by outflank-mailman (input) for mailman id 890662;
 Mon, 17 Feb 2025 16:27:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IPKs=VI=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tk3xe-000531-TP
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 16:27:10 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 094bb192-ed4c-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 17:27:10 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43984e9cc90so6396725e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 08:27:10 -0800 (PST)
Received: from localhost.localdomain (172.74.6.51.dyn.plus.net. [51.6.74.172])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5ef9sm12651334f8f.76.2025.02.17.08.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 08:27:09 -0800 (PST)
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
X-Inumbo-ID: 094bb192-ed4c-11ef-9aa6-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1739809629; x=1740414429; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d6mmCdnEK4WLbCua9qHCvfFVcXpvOHJMVDWGCqinwp8=;
        b=F2LbYCGTj5zFtNsX+6QGvAVlg9Ilm4mjo+vB4DwCILPslzo50n7zWZpRKiUYsXUI0F
         tQ5F5DJYjvJPyABbr3a6wzFvEiQ5ZSrifvCRqY6usjrBlmg6CorKRlix8lLz7z1Yp3FD
         6vBdMOp+oXHHC0froD9vjuGIEkdrO1kePQT34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739809629; x=1740414429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d6mmCdnEK4WLbCua9qHCvfFVcXpvOHJMVDWGCqinwp8=;
        b=xEpAw9qhVF6Hf3dRxeaIUGEl6LPs+7oouKeO+TVcjusIyY7aINU/NbIGGg3MJ7N2/V
         y9OMVSoagvBjUDZCT2FO+brEapN6hwMv8HHxx/xcGtBhzFm0xX1q4ZOtZKCEilV/YL7U
         b/KWnXVw6keW9FyWaLIvciH8xH+8JGh8l8SLuXA/syrvNINCjFnHaS1e9KmHd+r82OyH
         M7gVqEGF/JS0AzU6O5IQg4bGjNpiIHW7DScMrO56MLqZQOJROB5GMGGHQ1Brogi3d8+i
         mAZeN8pjdwYcKAaMq8IJf0YWjC2xTCREbXsd67krvQewMvlmNpTXpEhrmiwd6MfO3tRO
         3pFg==
X-Gm-Message-State: AOJu0YyjMttojaWIgOGMObbe4davAWZ+D/XthkcdPNOYuSRJ111XVojh
	JeXIq5EGxr9glSmtSOCSznZxbazZcvYTsL8A89wnfP2RnqXINQffqcLNtYdn8RKZnFKvrrsSSCU
	Y
X-Gm-Gg: ASbGncsmLyddg6Wv7j32ml1A80yWtyrAvy8dV/yUBGm81LZ8WaquXYb+DCG4UjpwxhV
	RV0iQmrGqtu5HSn8qQRTeggw+F1xI0EOlMKB3DRuZcCTWujcpFGAiv8IIC72VYzy9wSRf5gOQ5o
	m4nLuO4NzJb3PrACEut+sBVmn01Z4iC/npnD4skyDaLYDD+pvtM1RUkMoqyZP0jf1rtvudHr192
	GeoVxSouiwz0Y7FDDFfsku8HsmYOqMU6Gwkkjry3BcLCYTzsc2nXvT3+hjcobHf2IsLM1hcAQ65
	6pctqjPY95+FtYravHJPu5miGIF6LZtT5BPyPhAp1YND2dv/O6nHLjZb
X-Google-Smtp-Source: AGHT+IHLO/8WOm2XzsbHdshyqk+1zpOW9OvRO63dLt/8AVw1vcT/P4NdQEHiwdwCG1hXG7KJmdJjZw==
X-Received: by 2002:a5d:64e6:0:b0:38d:e3da:8b4f with SMTP id ffacd0b85a97d-38f3398735amr10222788f8f.0.1739809629395;
        Mon, 17 Feb 2025 08:27:09 -0800 (PST)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v6] Avoid crash calling PrintErrMesg from efi_multiboot2
Date: Mon, 17 Feb 2025 16:26:59 +0000
Message-Id: <20250217162659.151232-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Although code is compiled with -fpic option data is not position
independent. This causes data pointer to become invalid if
code is not relocated properly which is what happens for
efi_multiboot2 which is called by multiboot entry code.

Code tested adding
   PrintErrMesg(L"Test message", EFI_BUFFER_TOO_SMALL);
in efi_multiboot2 before calling efi_arch_edd (this function
can potentially call PrintErrMesg).

Before the patch (XenServer installation on Qemu, xen replaced
with vanilla xen.gz):
  Booting `XenServer (Serial)'Booting `XenServer (Serial)'
  Test message: !!!! X64 Exception Type - 0E(#PF - Page-Fault)  CPU Apic ID - 00000000 !!!!
  ExceptionData - 0000000000000000  I:0 R:0 U:0 W:0 P:0 PK:0 SS:0 SGX:0
  RIP  - 000000007EE21E9A, CS  - 0000000000000038, RFLAGS - 0000000000210246
  RAX  - 000000007FF0C1B5, RCX - 0000000000000050, RDX - 0000000000000010
  RBX  - 0000000000000000, RSP - 000000007FF0C180, RBP - 000000007FF0C210
  RSI  - FFFF82D040467CE8, RDI - 0000000000000000
  R8   - 000000007FF0C1C8, R9  - 000000007FF0C1C0, R10 - 0000000000000000
  R11  - 0000000000001020, R12 - FFFF82D040467CE8, R13 - 000000007FF0C1B8
  R14  - 000000007EA33328, R15 - 000000007EA332D8
  DS   - 0000000000000030, ES  - 0000000000000030, FS  - 0000000000000030
  GS   - 0000000000000030, SS  - 0000000000000030
  CR0  - 0000000080010033, CR2 - FFFF82D040467CE8, CR3 - 000000007FC01000
  CR4  - 0000000000000668, CR8 - 0000000000000000
  DR0  - 0000000000000000, DR1 - 0000000000000000, DR2 - 0000000000000000
  DR3  - 0000000000000000, DR6 - 00000000FFFF0FF0, DR7 - 0000000000000400
  GDTR - 000000007F9DB000 0000000000000047, LDTR - 0000000000000000
  IDTR - 000000007F48E018 0000000000000FFF,   TR - 0000000000000000
  FXSAVE_STATE - 000000007FF0BDE0
  !!!! Find image based on IP(0x7EE21E9A) (No PDB)  (ImageBase=000000007EE20000, EntryPoint=000000007EE23935) !!!!

After the patch:
  Booting `XenServer (Serial)'Booting `XenServer (Serial)'
  Test message: Buffer too small
  BdsDxe: loading Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-AAEA-3EE4AF6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)
  BdsDxe: starting Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-AAEA-3EE4AF6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)

This partially rollback commit 00d5d5ce23e6.

Fixes: 9180f5365524 ("x86: add multiboot2 protocol support for EFI platforms")
Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
Changes since v1:
- added "Fixes:" tag;
- fixed cast style change.

Changes since v2:
- wrap long line.

Changes since v3:
- fixed "Fixes:" tag.

Changes since v4:
- use switch instead of tables.

Changes since v5:
- added -fno-jump-tables option.
---
 xen/common/efi/boot.c        | 58 ++++++++++++++++++++++++------------
 xen/common/efi/efi-common.mk |  1 +
 2 files changed, 40 insertions(+), 19 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index efbec00af9..143b5681ba 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -287,33 +287,53 @@ static bool __init match_guid(const EFI_GUID *guid1, const EFI_GUID *guid2)
 /* generic routine for printing error messages */
 static void __init PrintErrMesg(const CHAR16 *mesg, EFI_STATUS ErrCode)
 {
-    static const CHAR16* const ErrCodeToStr[] __initconstrel = {
-        [~EFI_ERROR_MASK & EFI_NOT_FOUND]           = L"Not found",
-        [~EFI_ERROR_MASK & EFI_NO_MEDIA]            = L"The device has no media",
-        [~EFI_ERROR_MASK & EFI_MEDIA_CHANGED]       = L"Media changed",
-        [~EFI_ERROR_MASK & EFI_DEVICE_ERROR]        = L"Device error",
-        [~EFI_ERROR_MASK & EFI_VOLUME_CORRUPTED]    = L"Volume corrupted",
-        [~EFI_ERROR_MASK & EFI_ACCESS_DENIED]       = L"Access denied",
-        [~EFI_ERROR_MASK & EFI_OUT_OF_RESOURCES]    = L"Out of resources",
-        [~EFI_ERROR_MASK & EFI_VOLUME_FULL]         = L"Volume is full",
-        [~EFI_ERROR_MASK & EFI_SECURITY_VIOLATION]  = L"Security violation",
-        [~EFI_ERROR_MASK & EFI_CRC_ERROR]           = L"CRC error",
-        [~EFI_ERROR_MASK & EFI_COMPROMISED_DATA]    = L"Compromised data",
-        [~EFI_ERROR_MASK & EFI_BUFFER_TOO_SMALL]    = L"Buffer too small",
-    };
-    EFI_STATUS ErrIdx = ErrCode & ~EFI_ERROR_MASK;
-
     StdOut = StdErr;
     PrintErr(mesg);
     PrintErr(L": ");
 
-    if( (ErrIdx < ARRAY_SIZE(ErrCodeToStr)) && ErrCodeToStr[ErrIdx] )
-        mesg = ErrCodeToStr[ErrIdx];
-    else
+    switch (ErrCode)
     {
+    case EFI_NOT_FOUND:
+        mesg = L"Not found";
+        break;
+    case EFI_NO_MEDIA:
+        mesg = L"The device has no media";
+        break;
+    case EFI_MEDIA_CHANGED:
+        mesg = L"Media changed";
+        break;
+    case EFI_DEVICE_ERROR:
+        mesg = L"Device error";
+        break;
+    case EFI_VOLUME_CORRUPTED:
+        mesg = L"Volume corrupted";
+        break;
+    case EFI_ACCESS_DENIED:
+        mesg = L"Access denied";
+        break;
+    case EFI_OUT_OF_RESOURCES:
+        mesg = L"Out of resources";
+        break;
+    case EFI_VOLUME_FULL:
+        mesg = L"Volume is full";
+        break;
+    case EFI_SECURITY_VIOLATION:
+        mesg = L"Security violation";
+        break;
+    case EFI_CRC_ERROR:
+        mesg = L"CRC error";
+        break;
+    case EFI_COMPROMISED_DATA:
+        mesg = L"Compromised data";
+        break;
+    case EFI_BUFFER_TOO_SMALL:
+        mesg = L"Buffer too small";
+        break;
+    default:
         PrintErr(L"ErrCode: ");
         DisplayUint(ErrCode, 0);
         mesg = NULL;
+        break;
     }
     blexit(mesg);
 }
diff --git a/xen/common/efi/efi-common.mk b/xen/common/efi/efi-common.mk
index 23cafcf20c..06b1c19674 100644
--- a/xen/common/efi/efi-common.mk
+++ b/xen/common/efi/efi-common.mk
@@ -2,6 +2,7 @@ EFIOBJ-y := boot.init.o pe.init.o ebmalloc.o runtime.o
 EFIOBJ-$(CONFIG_COMPAT) += compat.o
 
 CFLAGS-y += -fshort-wchar
+CFLAGS-y += -fno-jump-tables
 CFLAGS-y += -iquote $(srctree)/common/efi
 CFLAGS-y += -iquote $(srcdir)
 
-- 
2.34.1


