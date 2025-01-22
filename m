Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF74CA18F7B
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2025 11:14:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875853.1286268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taXkb-0006og-Hn; Wed, 22 Jan 2025 10:14:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875853.1286268; Wed, 22 Jan 2025 10:14:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taXkb-0006me-Ee; Wed, 22 Jan 2025 10:14:21 +0000
Received: by outflank-mailman (input) for mailman id 875853;
 Wed, 22 Jan 2025 10:14:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sFHA=UO=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1taXka-0006mW-GZ
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2025 10:14:20 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3f73a3a-d8a9-11ef-99a4-01e77a169b0f;
 Wed, 22 Jan 2025 11:14:18 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4361b0ec57aso68989435e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jan 2025 02:14:18 -0800 (PST)
Received: from localhost.localdomain (138.74.6.51.dyn.plus.net. [51.6.74.138])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438b31adbd7sm19001075e9.17.2025.01.22.02.14.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2025 02:14:17 -0800 (PST)
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
X-Inumbo-ID: a3f73a3a-d8a9-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1737540857; x=1738145657; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bq0fItC7RjRBrIPmdbqHQFomEOwcPofRm5EAzxAg2Uo=;
        b=FViZOk5iMZh/DEw+5XwxVrBsNBhv2DB5P6BYQs4j0z89QuF7mdwKhwLR8szeVzz86H
         ayYOnpSV1RxmAAV/JndgyfH3HxJmOyrvfOjesn/RbXFVPJQhAYTBP8nt/7G70CKSGmh0
         8kgyPepTSWhP9jUq4OWWfBTmV/Yr+oaEbKbZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737540857; x=1738145657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bq0fItC7RjRBrIPmdbqHQFomEOwcPofRm5EAzxAg2Uo=;
        b=cPJNt/GL9Ee8wBQavfT5yJwClYfXWapYLz6Q2O0MGLFuvOKVAeA/YvRNnuLKKUukHx
         teNwT2nZj3SaeSX1PJg9ScyRFQWVKlBOgA7GnmN4NyCKdzqbeJtpvmA34ccSiURIJxOB
         mCIp9CbvufilUetqYcHvHM3lf0toe7YsjYZot/Sgn5Jd5aL4sIXHqV9hSSXmtf5FoJQC
         LiRDk71puU5Zr7aGfuMBqccdu2fPkGSherRIrSE+tmMpKqJPZ4h7vaBSOPBQwz8LWSrT
         u63uLMb1m1EFbyz/0XKH8ZvDe5ivNdb8dW58uLgqAK/a83NQW8rjbc5/lfo9Za2gfCko
         hJ1A==
X-Gm-Message-State: AOJu0YwOqUTVwyLxe42ODlSqO/iOdpo1D2cOH0yUGnqW8oeoEvvFXolW
	nY1pG09kfAk25JX3O4Kiy78ntYAHFy7qXy3RLljcMiOaB9IswRaOg+YSGQYhCCjyVOYtit3N3bj
	oin8=
X-Gm-Gg: ASbGncvgsO4uh5rZZujWTZFC4N6zSpWqCM39BLIfQRgHLHTpjGmgZ9ZWTnMKU1Y5mh7
	xwpKdsXdSnNdpbvoJXjZNUoT/0zuJyiztkQFAXa4qxfBSk7oOH3k8EoaTMXwyAZNAkD6WJFNtXv
	WaB2CjRQHVukYY7hUpBRh5k0ikU6/vsJRCJm4/1pbKpma66o5UXI0XwLl87FDDRrsP9RTMDPhcb
	nS3cGFljc5sNEg/7/Guh0NBVcKDYAcHNmnJSONch34c3lTBEgDhcC9aYpdvTAyNZcMB9tqhZlsz
	vjJeVk7p9xB+NRCtnVnAo2kitnGb42gFMu4=
X-Google-Smtp-Source: AGHT+IH5ptnqZs0us7gx6e/DQfTaF0rHpZncxzilCqO1/Tgggj0TikgZ1u59liIvEysCh/YNhHmmNA==
X-Received: by 2002:a05:600c:4f84:b0:434:a90b:94fe with SMTP id 5b1f17b1804b1-438913ca9bamr207463655e9.10.1737540857557;
        Wed, 22 Jan 2025 02:14:17 -0800 (PST)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v5] Avoid crash calling PrintErrMesg from efi_multiboot2
Date: Wed, 22 Jan 2025 10:14:07 +0000
Message-Id: <20250122101407.52282-1-frediano.ziglio@cloud.com>
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
 xen/common/efi/boot.c | 58 +++++++++++++++++++++++++++++--------------
 1 file changed, 39 insertions(+), 19 deletions(-)
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
-- 
2.34.1


