Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C31E7956901
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2024 13:09:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.779543.1189253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg0Em-0001ut-I5; Mon, 19 Aug 2024 11:07:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 779543.1189253; Mon, 19 Aug 2024 11:07:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg0Em-0001tA-FJ; Mon, 19 Aug 2024 11:07:48 +0000
Received: by outflank-mailman (input) for mailman id 779543;
 Mon, 19 Aug 2024 11:07:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lvcB=PS=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sg0El-0001t4-Hl
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2024 11:07:47 +0000
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [2607:f8b0:4864:20::730])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42d785eb-5e1b-11ef-a506-bb4a2ccca743;
 Mon, 19 Aug 2024 13:07:45 +0200 (CEST)
Received: by mail-qk1-x730.google.com with SMTP id
 af79cd13be357-7a1dd2004e1so273458685a.3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Aug 2024 04:07:45 -0700 (PDT)
Received: from fziglio-xenia-fedora.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a4ff0523a6sm422551785a.46.2024.08.19.04.07.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 04:07:43 -0700 (PDT)
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
X-Inumbo-ID: 42d785eb-5e1b-11ef-a506-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724065664; x=1724670464; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m5hLKDiIf8PbFnL1WGqPzQt3Tm1PjWyBXlXM01uhQds=;
        b=EKS91nWU9fARSRIeZkMdzrLQGTB7UYyxtpqYV7Lx3fO4k/a2AXu9NKiMPA09HEl2AY
         Bl84xuYjzJLc9PFb77nxb6+aytSyRKQ76e+CtxHbgO9cxuEvVHFH2o3GHpjuVs5BF9Vr
         vfKrRNn7q84QvxY40qHiEE7UEowObA/O9v+OQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724065664; x=1724670464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m5hLKDiIf8PbFnL1WGqPzQt3Tm1PjWyBXlXM01uhQds=;
        b=ni0Qojd+ncdN14tW08rihfguLMEiYGKJkDJPxoWs+bhmo3ZN2e6OGhy3zMcyro4NJL
         fU2IKvYV9ratFQMwApYEc8TPYL4G4vbMEo2Hp5Yy+00NMpmOuRbzsMh3UdEh6ak6wcEO
         cYc9rO8UttrB6ChneZcHSds02pupmj7Mz6CARMSf6iX7N4hbq9yM9n9YlDttDkZmG9b1
         nvAqfOwvP8ExhNlFiQFn5atwQMnF5VmxZ1MA52rYPQHMVncvv6lsfjLqXN+z+gYUyENf
         i25tjIdUJ+yGpn+xNWxbjzyGm4ywIJIJ+UhPNE5mhQeM2Ks40bfPWToYi0fOALfPQpQp
         GQzw==
X-Gm-Message-State: AOJu0YyjmsHA+AbQUG44zUJQspccWnFE9hcce6brBolYedcQpewBbMzw
	eAK8M1zG7Dx0ZXWm7X7OaKnxsJ8jffYhqbJUv2w/CuOdrKlvrQSAza3YwLWNQzLoR8/ZFC940e8
	n
X-Google-Smtp-Source: AGHT+IFiYu8NmTurdnjjwALk9gyyAM1B8lKl01Kb2o/S2b2+d1ZJK5to1rjYVboITbPpKWak2/Qe0w==
X-Received: by 2002:a05:620a:150:b0:79f:2cb:86a1 with SMTP id af79cd13be357-7a5069bfbc2mr1163838585a.54.1724065664207;
        Mon, 19 Aug 2024 04:07:44 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] Avoid crash calling PrintErrMesg from efi_multiboot2
Date: Mon, 19 Aug 2024 12:07:19 +0100
Message-ID: <20240819110729.205707-1-frediano.ziglio@cloud.com>
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

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/common/efi/boot.c | 45 +++++++++++++++++++++++++++++--------------
 1 file changed, 31 insertions(+), 14 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index efbec00af9..e6aa9271ed 100644
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
 
@@ -308,7 +325,7 @@ static void __init PrintErrMesg(const CHAR16 *mesg, EFI_STATUS ErrCode)
     PrintErr(L": ");
 
     if( (ErrIdx < ARRAY_SIZE(ErrCodeToStr)) && ErrCodeToStr[ErrIdx] )
-        mesg = ErrCodeToStr[ErrIdx];
+        mesg = (CHAR16*) ((char*) &ErrorStrings + ErrCodeToStr[ErrIdx]);
     else
     {
         PrintErr(L"ErrCode: ");
-- 
2.46.0


