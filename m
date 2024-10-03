Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C199898EF04
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 14:19:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809330.1221622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swKnr-0005D3-1Z; Thu, 03 Oct 2024 12:19:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809330.1221622; Thu, 03 Oct 2024 12:19:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swKnq-00058u-QP; Thu, 03 Oct 2024 12:19:30 +0000
Received: by outflank-mailman (input) for mailman id 809330;
 Thu, 03 Oct 2024 12:19:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d1Re=Q7=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1swKno-00043W-Vy
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 12:19:28 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bbf31952-8181-11ef-a0ba-8be0dac302b0;
 Thu, 03 Oct 2024 14:19:27 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a8a897bd4f1so106757866b.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 05:19:27 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a991047319asm77328366b.184.2024.10.03.05.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 05:19:26 -0700 (PDT)
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
X-Inumbo-ID: bbf31952-8181-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727957967; x=1728562767; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tUCJBvhofnmQKNA8lGIkGO7D/fxxaw9oGLj4xWZ4GLk=;
        b=fkokL2729YzTHJ5KIMcmb1w9ZSoe+0hG9ZigF2XlkUFKZt0Bx7V97IoPq87xfQItx2
         kvapwujvnEi8Lbl7KKo3bdVcMUzzonPc8PB12X13jg3X1n88HmwfHofcVVWNCDHhk4b1
         Q3TkylMSTedczkvPB6pb3EG/y11l16Y8+Hzc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727957967; x=1728562767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tUCJBvhofnmQKNA8lGIkGO7D/fxxaw9oGLj4xWZ4GLk=;
        b=bDyhHQNUfwGI/LXtP4lYxA+iYRZ5pkqcLqnYVoEiAvBmq9E7sSt4wW1WxDdyw3O+pI
         2cKPCT8YDaWeWfPvNld8tl05w0YQVE8dtueejXjAm6rYTs7eKJcMwbHT+EC4UtfnrCQ9
         WmEfk1wspHmC6PGJbXwiEM8R9Q8/qhpc8tvD+egIk6bJ3ePj4Op3Yzpv6RvlmmREHsrk
         7LibYItCnui8Q/px6UiXd/pSzbhH+ILbQawg105r1Ak2SoLfozCjOwTr6GszzJ1WZawq
         wECVse5LQ+DOyROrzsT30dzW+XcD1YIif2PqEXuGLdF134txim2wBH2rWzXXFaQIVsux
         /QEw==
X-Gm-Message-State: AOJu0YxUZIUgMIifkgHobwuITpIj4QbQNRff4tPNh1ZA7uW+311U1MRg
	x2xcKaAM8AQauRKhZTCdTtRyPceU/k+IwBqe2c6hOCMHburbB5h70UjGy2bDjUS75XlFQlGGnhJ
	k
X-Google-Smtp-Source: AGHT+IF9HWYBWomtbqBJzKEQPfkfWmWQVkjG6intW8V3qmacgkvcsiHGusnys5RuBbDNwLswEX59Vg==
X-Received: by 2002:a17:907:9706:b0:a8a:8cdb:83a7 with SMTP id a640c23a62f3a-a98f838a302mr579494166b.54.1727957966839;
        Thu, 03 Oct 2024 05:19:26 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 07/20] xen: Update header guards - EFI
Date: Thu,  3 Oct 2024 13:18:55 +0100
Message-Id: <20241003121908.362888-8-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241003121908.362888-1-frediano.ziglio@cloud.com>
References: <20241003121908.362888-1-frediano.ziglio@cloud.com>
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


