Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2EA956AF6
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2024 14:35:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.779630.1189343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg1bX-0004FZ-Km; Mon, 19 Aug 2024 12:35:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 779630.1189343; Mon, 19 Aug 2024 12:35:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg1bX-0004Do-Gq; Mon, 19 Aug 2024 12:35:23 +0000
Received: by outflank-mailman (input) for mailman id 779630;
 Mon, 19 Aug 2024 12:35:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lvcB=PS=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sg1bW-0004Di-O3
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2024 12:35:22 +0000
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [2607:f8b0:4864:20::f30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f914a73-5e27-11ef-a506-bb4a2ccca743;
 Mon, 19 Aug 2024 14:35:21 +0200 (CEST)
Received: by mail-qv1-xf30.google.com with SMTP id
 6a1803df08f44-6bf6ea1d34aso23593816d6.1
 for <xen-devel@lists.xenproject.org>; Mon, 19 Aug 2024 05:35:21 -0700 (PDT)
Received: from fziglio-xenia-fedora.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bf6fec61fbsm41530346d6.103.2024.08.19.05.35.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 05:35:19 -0700 (PDT)
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
X-Inumbo-ID: 7f914a73-5e27-11ef-a506-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724070920; x=1724675720; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HJGpMDTvKgH/4CK3WqC47Q0qOJyIK4iJaP0Dbsss8Bw=;
        b=ZIxcX88od07Lm4mL8og8rau0Y0ocKJywjrXIEFO2bv4yKJmiWnlhTzsHIXaixL2FYm
         NOceR44qbTfwQMh3tvxWcNmBJQs6Zq244JonwQ6B4oEeH0K0+Y6Ui6Gege6LMyydrjZg
         1vl6ROf7gaReXc+vB80I/Hn8uuoifCLesgS2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724070920; x=1724675720;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HJGpMDTvKgH/4CK3WqC47Q0qOJyIK4iJaP0Dbsss8Bw=;
        b=KY090lV3lPYp3+GCvAjslSD/fAjAFT4ezCsmI8z4i2XeWPVWtlfdWdTBK+FFDFF0dz
         SMLlIEUXa0J81RMv6Kt1FHzb4HXtyxbRt2nAfKNZ9BMciI0VvCgs5k+axVPAW3IcVsfO
         LXaV2voP6Dp1SCJqPqfU08YI8os9QxsUruVuNUm1C8jmSHBjyi8FBI4zpqj+CqRm5s9B
         /EJXqXmhqmFwfGN7BWPsPYzGYwZLjdtkGeHBcM6JHHSnaGGRNhpn2wr2Id9fOA0cakPI
         57Sg8uwSs99lxgUiZ6xhRRU/4m4shAbPLDoo5g7whIe9R5MNOt7qEcQlv6zMrEOxO/cE
         3m7Q==
X-Gm-Message-State: AOJu0YxLf4Pnz9hCNbKg5Miv+rCR/zl0ENUHrw6OyjNHur6j35LdFFC0
	pyJwWRlfZtktNqC7JNgArOQG/5kpPjt+qcQnYR2zMSgs5b4eSUqTftxzplCBqgNMXmBfdetIaWT
	u
X-Google-Smtp-Source: AGHT+IGnnC4tfaF5lPH3GjU8ZKotquTpfKqgVIwKymoa8O3FrAGbvjvRR8j3pAU0SxFFJr1umAlP0A==
X-Received: by 2002:a05:6214:451d:b0:6bb:9b66:f262 with SMTP id 6a1803df08f44-6bf7ce5b492mr114937456d6.41.1724070920094;
        Mon, 19 Aug 2024 05:35:20 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2] Avoid crash calling PrintErrMesg from efi_multiboot2
Date: Mon, 19 Aug 2024 13:35:06 +0100
Message-ID: <20240819123508.217444-1-frediano.ziglio@cloud.com>
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
 xen/common/efi/boot.c | 45 +++++++++++++++++++++++++++++--------------
 1 file changed, 31 insertions(+), 14 deletions(-)
---
Changes since v1:
- added "Fixes:" tag;
- fixed cast style change.

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index efbec00af9..bbcd9263e1 100644
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
+        mesg = (const CHAR16 *)((const void *)&ErrorStrings + ErrCodeToStr[ErrIdx]);
     else
     {
         PrintErr(L"ErrCode: ");
-- 
2.46.0


