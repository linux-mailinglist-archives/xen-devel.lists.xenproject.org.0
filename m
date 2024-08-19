Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45671956D50
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2024 16:30:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.779773.1189456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg3Oe-0006Zu-0A; Mon, 19 Aug 2024 14:30:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 779773.1189456; Mon, 19 Aug 2024 14:30:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg3Od-0006YP-Ti; Mon, 19 Aug 2024 14:30:11 +0000
Received: by outflank-mailman (input) for mailman id 779773;
 Mon, 19 Aug 2024 14:30:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lvcB=PS=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sg3Ob-0006YJ-R6
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2024 14:30:09 +0000
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [2607:f8b0:4864:20::82d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 882bb2f4-5e37-11ef-8776-851b0ebba9a2;
 Mon, 19 Aug 2024 16:30:07 +0200 (CEST)
Received: by mail-qt1-x82d.google.com with SMTP id
 d75a77b69052e-44feaa08040so24128291cf.2
 for <xen-devel@lists.xenproject.org>; Mon, 19 Aug 2024 07:30:07 -0700 (PDT)
Received: from fziglio-xenia-fedora.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4536a07667fsm39827261cf.93.2024.08.19.07.30.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 07:30:06 -0700 (PDT)
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
X-Inumbo-ID: 882bb2f4-5e37-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724077806; x=1724682606; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WvhEFpFEZitUDnn8XmXXXarBrCnZ17sXZuHR7Tqwj2w=;
        b=hY24oA/Dc9CXESrV+A+6sqG6Uqc4Fm79h64fXpv2x/sFXVVrrc8ODsy9HvRS2bMiCu
         f/YjVCIiOoU+/UPjgvjBAr0lSa8bQX4I0csOHloBMU68SsZIXir7c9syoaAC3+TdQHXj
         NR/+FKjzaFVslaV+YuSdLmFbyRaq/fUOacKHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724077806; x=1724682606;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WvhEFpFEZitUDnn8XmXXXarBrCnZ17sXZuHR7Tqwj2w=;
        b=OXGiYGoC4USOhAQRSLZuXG2hEhilguTw9T3gQET5N8bdA4vAHjlJGXs4RG85iTNcSd
         /MwUE9a7xXYQTen8J623X8fHpxYNX1y56RlcU4sJkACEqZTXrOkkNij1SNkLg2mQtok+
         6Ea1Gsd3JDoPsl4j5Fn9EuYFYlsUePrE7XO62fmDINWRuCFLUL1E7bJBs4wymyU7jtG7
         m0w5BJzFK3uqACM68JitU5eRKUUe3h2s1HeqGyo2mxlhz8c41DBhkpa56yY2qNNOj9sH
         3KKBFofCxJYKk1pQHJer0p+RAH3mT1lhDezQnOmkmrrFr6lSsOs3yaIRS+U5VOVPLbjR
         yCfg==
X-Gm-Message-State: AOJu0Yw/Xtcv6i+Abi/cZxmMIgRK/KxxjcoA6O6ypJhKX9cjbJxL1dnS
	KMJ5cbXMyk6N3M2zww+Hl1MZiSvJ80W76PTKgJYqzZ1gYExkZxQ+pTLJCd9c/YQfFO9AnPZWN0C
	0
X-Google-Smtp-Source: AGHT+IFb90nhZGmi5xzv/yIh5X7R3ga9l7E7Jf+G4mNOa1gORiXdczsJLB8P61B18OxbDjj3zKNzvw==
X-Received: by 2002:ac8:5497:0:b0:453:74cd:a919 with SMTP id d75a77b69052e-45374cdaa8emr92118361cf.1.1724077806246;
        Mon, 19 Aug 2024 07:30:06 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v4] Avoid crash calling PrintErrMesg from efi_multiboot2
Date: Mon, 19 Aug 2024 15:29:52 +0100
Message-ID: <20240819142953.415817-1-frediano.ziglio@cloud.com>
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

Fixes: 9180f5365524 ("x86: add multiboot2 protocol support for EFI platforms")
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

Changes since v3:
- fixed "Fixes:" tag.

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


