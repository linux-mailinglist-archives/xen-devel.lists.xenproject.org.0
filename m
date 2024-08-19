Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87971956B4A
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2024 14:54:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.779677.1189382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg1to-0001y7-RQ; Mon, 19 Aug 2024 12:54:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 779677.1189382; Mon, 19 Aug 2024 12:54:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg1to-0001w3-Or; Mon, 19 Aug 2024 12:54:16 +0000
Received: by outflank-mailman (input) for mailman id 779677;
 Mon, 19 Aug 2024 12:54:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lvcB=PS=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sg1tn-0001vw-Ea
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2024 12:54:15 +0000
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [2607:f8b0:4864:20::f2c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22bcb0ed-5e2a-11ef-a506-bb4a2ccca743;
 Mon, 19 Aug 2024 14:54:14 +0200 (CEST)
Received: by mail-qv1-xf2c.google.com with SMTP id
 6a1803df08f44-6bf9ddfc2dcso3785236d6.1
 for <xen-devel@lists.xenproject.org>; Mon, 19 Aug 2024 05:54:14 -0700 (PDT)
Received: from fziglio-xenia-fedora.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bf6fec5fdesm42301536d6.99.2024.08.19.05.54.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 05:54:12 -0700 (PDT)
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
X-Inumbo-ID: 22bcb0ed-5e2a-11ef-a506-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724072053; x=1724676853; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P7/Kd+cvXqdMR5NtH/YCv2IUntSfsIYkr4UaFxzYJVY=;
        b=Shsg8dyXGSnwAHm3Q4JSERSyvcJHzv1SbtrcNnJimwBkAIpDFQBtX38FIPdVSOm/qY
         n6imWSh0uczlWd/tCHaJ8JMbMhWkDH3bIQ1zFzMlqw5/FdPtgQYoOSgcEcL3OESv9pt3
         mctBiciNwlS/7qT4BtjJTeC8d17SDjZOa58O4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724072053; x=1724676853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P7/Kd+cvXqdMR5NtH/YCv2IUntSfsIYkr4UaFxzYJVY=;
        b=A5gbWwzcQIlYjntmCznBUgcEY+EDvFFcCK9DnAsTFV1MC2bAXV2HMCQh9pMlK3G+Ac
         EYKtmlv/lmhpnD7l6rmyn/9gMpddVXbrlJoAf9/rDHtq45Z8PzZFji7eeBOxXtrH08Jj
         PS5riaSxp1pLJpWZ4i6A9EE6k1zxugIM7oJ6ufNKXK7NkREJkcdxF3OaCTaR5RDSxBuI
         ZoMHbzLX9Wtc8t2XZ515SIo+r7xMmCWBYQ3AWZjoNi+WpGrFr0w5ZPRPwCUo9VLoW7L/
         y1E9lWZOqB7TYMY0mnPYfbzEjBo4+mYrADtE7Yy90O96fenS/lYkcHxeBm8s/NfPwlYW
         iiow==
X-Gm-Message-State: AOJu0YwMrPuNbZEx3TgSNpFtNQTHslo9vm+gG0gQanUn86IiYvITDoq2
	UCNuD0gJF67Add25fPwnMhIsFsZtyKVcOobFErNQ3f/QEb/1kK++xASGZQhG3KXG9Yzdgef+Gqb
	L
X-Google-Smtp-Source: AGHT+IE28GQb2aRj6rRi3hhG2d0uXzYhFyGpDpxj3nyRFKSL8Pb9s73+hBHH3yAfu9XZxMssTB5kMw==
X-Received: by 2002:a05:6214:5984:b0:6b5:ce93:c3fc with SMTP id 6a1803df08f44-6bf7cd9e505mr137113266d6.18.1724072052832;
        Mon, 19 Aug 2024 05:54:12 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3] Avoid crash calling PrintErrMesg from efi_multiboot2
Date: Mon, 19 Aug 2024 13:54:00 +0100
Message-ID: <20240819125401.218931-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.46.0
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
  RIP  - 000000007DC29E46, CS  - 0000000000000038, RFLAGS - 0000000000210246
  RAX  - 0000000000000000, RCX - 0000000000000050, RDX - 0000000000000000
  RBX  - 000000007DAB4558, RSP - 000000007EFA1200, RBP - 0000000000000000
  RSI  - FFFF82D040467A88, RDI - 0000000000000000
  R8   - 000000007EFA1238, R9  - 000000007EFA1230, R10 - 0000000000000000
  R11  - 000000007CF42665, R12 - FFFF82D040467A88, R13 - 000000007EFA1228
  R14  - 000000007EFA1225, R15 - 000000007DAB45A8
  DS   - 0000000000000030, ES  - 0000000000000030, FS  - 0000000000000030
  GS   - 0000000000000030, SS  - 0000000000000030
  CR0  - 0000000080010033, CR2 - FFFF82D040467A88, CR3 - 000000007EC01000
  CR4  - 0000000000000668, CR8 - 0000000000000000
  DR0  - 0000000000000000, DR1 - 0000000000000000, DR2 - 0000000000000000
  DR3  - 0000000000000000, DR6 - 00000000FFFF0FF0, DR7 - 0000000000000400
  GDTR - 000000007E9E2000 0000000000000047, LDTR - 0000000000000000
  IDTR - 000000007E4E5018 0000000000000FFF,   TR - 0000000000000000
  FXSAVE_STATE - 000000007EFA0E60
  !!!! Find image based on IP(0x7DC29E46) (No PDB)  (ImageBase=000000007DC28000, EntryPoint=000000007DC2B917) !!!!

After the patch:
  Booting `XenServer (Serial)'Booting `XenServer (Serial)'
  Test message: Buffer too small
  BdsDxe: loading Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-AAEA-3EE4AF6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)
  BdsDxe: starting Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-AAEA-3EE4AF6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)

Fixes: 00d5d5ce23e6 ("work around Clang generating .data.rel.ro section for init-only files")
Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/common/efi/boot.c | 46 ++++++++++++++++++++++++++++++-------------
 1 file changed, 32 insertions(+), 14 deletions(-)
---
Changes since v1:
- added "Fixes:" tag;
- fixed cast style change.

Changes since v2:
- wrap long line.

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index efbec00af9..fdbe75005c 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -287,19 +287,36 @@ static bool __init match_guid(const EFI_GUID *guid1, const EFI_GUID *guid2)
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
+#define ERROR_MESSAGE_LIST \
+    ERROR_MESSAGE(EFI_NOT_FOUND, "Not found") \
+    ERROR_MESSAGE(EFI_NO_MEDIA, "The device has no media") \
+    ERROR_MESSAGE(EFI_MEDIA_CHANGED, "Media changed") \
+    ERROR_MESSAGE(EFI_DEVICE_ERROR, "Device error") \
+    ERROR_MESSAGE(EFI_VOLUME_CORRUPTED, "Volume corrupted") \
+    ERROR_MESSAGE(EFI_ACCESS_DENIED, "Access denied") \
+    ERROR_MESSAGE(EFI_OUT_OF_RESOURCES, "Out of resources") \
+    ERROR_MESSAGE(EFI_VOLUME_FULL, "Volume is full") \
+    ERROR_MESSAGE(EFI_SECURITY_VIOLATION, "Security violation") \
+    ERROR_MESSAGE(EFI_CRC_ERROR, "CRC error") \
+    ERROR_MESSAGE(EFI_COMPROMISED_DATA, "Compromised data") \
+    ERROR_MESSAGE(EFI_BUFFER_TOO_SMALL, "Buffer too small")
+
+    static const struct ErrorStrings {
+        CHAR16 start;
+#undef ERROR_MESSAGE
+#define ERROR_MESSAGE(code, str) CHAR16 msg_ ## code[sizeof(str)];
+        ERROR_MESSAGE_LIST
+    } ErrorStrings __initconst = {
+        0
+#undef ERROR_MESSAGE
+#define ERROR_MESSAGE(code, str) , L ## str
+        ERROR_MESSAGE_LIST
+    };
+    static const uint16_t ErrCodeToStr[] __initconst = {
+#undef ERROR_MESSAGE
+#define ERROR_MESSAGE(code, str) \
+        [~EFI_ERROR_MASK & code] = offsetof(struct ErrorStrings, msg_ ## code),
+        ERROR_MESSAGE_LIST
     };
     EFI_STATUS ErrIdx = ErrCode & ~EFI_ERROR_MASK;
 
@@ -308,7 +325,8 @@ static void __init PrintErrMesg(const CHAR16 *mesg, EFI_STATUS ErrCode)
     PrintErr(L": ");
 
     if( (ErrIdx < ARRAY_SIZE(ErrCodeToStr)) && ErrCodeToStr[ErrIdx] )
-        mesg = ErrCodeToStr[ErrIdx];
+        mesg = (const CHAR16 *)((const void *)&ErrorStrings +
+                                ErrCodeToStr[ErrIdx]);
     else
     {
         PrintErr(L"ErrCode: ");
-- 
2.46.0


