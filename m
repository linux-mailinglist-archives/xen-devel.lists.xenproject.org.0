Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6399098F5A5
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 20:00:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809690.1222208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swQ79-00009G-0X; Thu, 03 Oct 2024 17:59:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809690.1222208; Thu, 03 Oct 2024 17:59:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swQ78-0008VB-L2; Thu, 03 Oct 2024 17:59:46 +0000
Received: by outflank-mailman (input) for mailman id 809690;
 Thu, 03 Oct 2024 17:59:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d1Re=Q7=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1swQ76-0006qR-7H
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 17:59:44 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 434fc622-81b1-11ef-99a2-01e77a169b0f;
 Thu, 03 Oct 2024 19:59:41 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a8d60e23b33so182225966b.0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 10:59:41 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99104731a5sm111876166b.180.2024.10.03.10.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 10:59:39 -0700 (PDT)
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
X-Inumbo-ID: 434fc622-81b1-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727978380; x=1728583180; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tUCJBvhofnmQKNA8lGIkGO7D/fxxaw9oGLj4xWZ4GLk=;
        b=lbObnK9PMzidM0KTsKc4KRKtljSn+CiwqDhs0JEUqi6w7woUwgIEc2ANWLGf96UCwC
         NqWQdIFcT488d9A/Oz6p+mgMp6CoMeZOKedC8pF0ED3UsqJ00kKxM7Vfs7ekmUzrj752
         iQ4nDYQ3zFbySsxoqf0a3b8qGgBWdqWxLpVgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727978380; x=1728583180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tUCJBvhofnmQKNA8lGIkGO7D/fxxaw9oGLj4xWZ4GLk=;
        b=t81E7PpGNUWIalLL+QQrVXMb4z8Ddv4uPiA60wi6A1E+xO/RoBBhz+LKNhtFaI44BU
         olBC92MSMXq92c4ucCWoQjl0r+FAYisCoqVk8dY4tlniMOCiVLemGnIEKUrSpdJLYmAR
         EPPWHY9MiYFJbvqFpZNQBd/HZQ1UPlk5u5hm/wTkTYXjgozre8SM5a6KnSDwx4PMHGtG
         8mVLZQZ9t/+HZ0iSKXmD5XKNov04GIs6j3q7ZNCm+s4+rFJya9VM6sRMDnlLUGjuECQ+
         EWGywR5VscJLYpoOuOsx/jY5Od4bacG7OU89MlTmk5FH7cCvni9LjalEtX753TwZSNxf
         Ey/w==
X-Gm-Message-State: AOJu0Yw1N4p9AxF0oefvn5CLue1FIKaQC3iQRDRzQw4JPf0NfSX4gobH
	q9wlSKqS06Zql69SftbpN6QME0WZs8cWpPD9g2GLykB2Q51KEF3gg6QLKpSY0k48Zjs+ZP4JfKF
	1
X-Google-Smtp-Source: AGHT+IEgLs3fSh1AFu7vCS5IRA8EZ8IHJtCnA3mTsn85nbRiOOk0ZeUdWbrMNm48WX5qsJSvmRN2vQ==
X-Received: by 2002:a17:907:f1e6:b0:a8c:78a5:8fc4 with SMTP id a640c23a62f3a-a991bd43d13mr19775066b.19.1727978380214;
        Thu, 03 Oct 2024 10:59:40 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 07/19] xen: Update header guards - EFI
Date: Thu,  3 Oct 2024 18:59:07 +0100
Message-Id: <20241003175919.472774-8-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241003175919.472774-1-frediano.ziglio@cloud.com>
References: <20241003175919.472774-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updated headers related to EFI.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/include/asm/x86_64/efibind.h | 4 ++--
 xen/include/efi/efiapi.h                  | 4 ++--
 xen/include/efi/eficapsule.h              | 4 ++--
 xen/include/efi/eficon.h                  | 4 ++--
 xen/include/efi/efidef.h                  | 4 ++--
 xen/include/efi/efidevp.h                 | 4 ++--
 xen/include/efi/efierr.h                  | 4 ++--
 xen/include/efi/efipciio.h                | 6 +++---
 xen/include/efi/efiprot.h                 | 4 ++--
 9 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/xen/arch/x86/include/asm/x86_64/efibind.h b/xen/arch/x86/include/asm/x86_64/efibind.h
index b29342c61c..a4b8ec52b3 100644
--- a/xen/arch/x86/include/asm/x86_64/efibind.h
+++ b/xen/arch/x86/include/asm/x86_64/efibind.h
@@ -16,8 +16,8 @@ Abstract:
 Revision History
 
 --*/
-#ifndef X86_64_EFI_BIND
-#define X86_64_EFI_BIND
+#ifndef ASM__X86__X86_64__EFIBIND_H
+#define ASM__X86__X86_64__EFIBIND_H
 #ifndef __GNUC__
 #pragma pack()
 #endif
diff --git a/xen/include/efi/efiapi.h b/xen/include/efi/efiapi.h
index a616d1238a..c9e6a531ba 100644
--- a/xen/include/efi/efiapi.h
+++ b/xen/include/efi/efiapi.h
@@ -1,5 +1,5 @@
-#ifndef _EFI_API_H
-#define _EFI_API_H
+#ifndef EFI__EFIAPI_H
+#define EFI__EFIAPI_H
 
 /*++
 
diff --git a/xen/include/efi/eficapsule.h b/xen/include/efi/eficapsule.h
index 481af2816a..5764f36e9f 100644
--- a/xen/include/efi/eficapsule.h
+++ b/xen/include/efi/eficapsule.h
@@ -19,8 +19,8 @@ Abstract:
 
 --*/
 
-#ifndef _EFI_CAPSULE_H
-#define _EFI_CAPSULE_H
+#ifndef EFI__EFICAPSULE_H
+#define EFI__EFICAPSULE_H
 
 
 #define CAPSULE_BLOCK_DESCRIPTOR_SIGNATURE  EFI_SIGNATURE_32 ('C', 'B', 'D', 'S')
diff --git a/xen/include/efi/eficon.h b/xen/include/efi/eficon.h
index 089db9816c..952022b734 100644
--- a/xen/include/efi/eficon.h
+++ b/xen/include/efi/eficon.h
@@ -1,5 +1,5 @@
-#ifndef _EFI_CON_H
-#define _EFI_CON_H
+#ifndef EFI__EFICON_H
+#define EFI__EFICON_H
 
 /*++
 
diff --git a/xen/include/efi/efidef.h b/xen/include/efi/efidef.h
index 86a7e111bf..20cf269e8f 100644
--- a/xen/include/efi/efidef.h
+++ b/xen/include/efi/efidef.h
@@ -1,5 +1,5 @@
-#ifndef _EFI_DEF_H
-#define _EFI_DEF_H
+#ifndef EFI__EFIDEF_H
+#define EFI__EFIDEF_H
 
 /*++
 
diff --git a/xen/include/efi/efidevp.h b/xen/include/efi/efidevp.h
index beb5785a45..fd88b66a56 100644
--- a/xen/include/efi/efidevp.h
+++ b/xen/include/efi/efidevp.h
@@ -1,5 +1,5 @@
-#ifndef _DEVPATH_H
-#define _DEVPATH_H
+#ifndef EFI__EFIDEVP_H
+#define EFI__EFIDEVP_H
 
 /*++
 
diff --git a/xen/include/efi/efierr.h b/xen/include/efi/efierr.h
index cdca210414..1d2ed125d8 100644
--- a/xen/include/efi/efierr.h
+++ b/xen/include/efi/efierr.h
@@ -1,5 +1,5 @@
-#ifndef _EFI_ERR_H
-#define _EFI_ERR_H
+#ifndef EFI__EFIERR_H
+#define EFI__EFIERR_H
 
 /*++
 
diff --git a/xen/include/efi/efipciio.h b/xen/include/efi/efipciio.h
index 0724f957a3..8f8c81d043 100644
--- a/xen/include/efi/efipciio.h
+++ b/xen/include/efi/efipciio.h
@@ -1,5 +1,5 @@
-#ifndef _EFI_PCI_IO_H
-#define _EFI_PCI_IO_H
+#ifndef EFI__EFIPCIIO_H
+#define EFI__EFIPCIIO_H
 
 #define EFI_PCI_IO_PROTOCOL \
     { 0x4cf5b200, 0x68b8, 0x4ca5, {0x9e, 0xec, 0xb2, 0x3e, 0x3f, 0x50, 0x02, 0x9a} }
@@ -216,4 +216,4 @@ typedef struct _EFI_PCI_IO {
   VOID                                   *RomImage;
 } EFI_PCI_IO;
 
-#endif /* _EFI_PCI_IO_H */
+#endif /* EFI__EFIPCIIO_H */
diff --git a/xen/include/efi/efiprot.h b/xen/include/efi/efiprot.h
index 56d7636b2b..8a56b3faa5 100644
--- a/xen/include/efi/efiprot.h
+++ b/xen/include/efi/efiprot.h
@@ -1,5 +1,5 @@
-#ifndef _EFI_PROT_H
-#define _EFI_PROT_H
+#ifndef EFI__EFIPROT_H
+#define EFI__EFIPROT_H
 
 /*++
 
-- 
2.34.1


