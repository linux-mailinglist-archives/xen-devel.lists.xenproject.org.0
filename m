Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5AEB1B894
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 18:32:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070749.1434412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujKaG-0003re-TJ; Tue, 05 Aug 2025 16:32:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070749.1434412; Tue, 05 Aug 2025 16:32:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujKaG-0003kP-Na; Tue, 05 Aug 2025 16:32:16 +0000
Received: by outflank-mailman (input) for mailman id 1070749;
 Tue, 05 Aug 2025 16:32:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FQWd=2R=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1ujKaE-0002gS-Tq
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 16:32:14 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bdcf687c-7219-11f0-b898-0df219b8e170;
 Tue, 05 Aug 2025 18:32:13 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-af922ab4849so851606366b.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 09:32:13 -0700 (PDT)
Received: from rossla-pc.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af928c84154sm842980766b.84.2025.08.05.09.32.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 09:32:12 -0700 (PDT)
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
X-Inumbo-ID: bdcf687c-7219-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754411533; x=1755016333; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L1QqT35WPMNEdKVxqmbRQUpDF5jhPdPInhgcu4VmEpk=;
        b=ej2KbWAbSK+2vCttlK4/f1a8XT7CJo1SCtpu73V9hHKTYBBY4IUvDsHhmYU3MWKsI4
         3Rnxa6IKc700nX3fC1X1L+YARQ60Zs4JMUAiGAylEBbvjUKK11PQjBCXSUGnu844YIU7
         oh9jqfUj1Phi+EFZZ7+zzYapUv9b/Q2H8IvFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754411533; x=1755016333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L1QqT35WPMNEdKVxqmbRQUpDF5jhPdPInhgcu4VmEpk=;
        b=HF910jmppM3HPm7acwyKKfP1i2KqM48lO4j7H7cQ3ryJ977tefllZgnLoz+UGZHHJC
         YZEqG3GTkQh/xugneZDI7z4CaUjJs277xydgGS5xFgaUNo68X9W/OZ772K19vDLqnGia
         5V+XV4AaMgI3MsoKsx5n0zhTsTf181leI9HnJuON6hUnGv38pIf3rkpYf+DxBd6DgTJV
         biowpqjsa1AuYBf1YRzL/CmAytlGXaceIODK4nSK6TzADwpjRKfzqh6E6ZyY6MiWwrP6
         tmSh5Qp+hoS/TLclice0rjyvtOCNbm6RHldc0l3PlIIIM2Ut/Ei3LhN3o4IcyV7mzt0l
         jBIA==
X-Forwarded-Encrypted: i=1; AJvYcCVdrZo2Ugsk4mHUkV9DjmqpefyWRC9HfHUReureO5kQEIjpHqbnSaevvABxFXF2MrxRiBqWYLr0z1Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxc7BYIlfIzCbMoo6D5wyFJj8nzzOxpNQdECeFDSbxgQYIm+Zmj
	Z9f3W1js4ioEdK7jqJfDxqQEGvUyuF/3+Q6uifsGqyC/5YEVVt9nbOqTtCcAGYcaBA==
X-Gm-Gg: ASbGncvQEfANBWIjmjp/h6Zci2ZYADwnKxoTs54fkap4dFEx6PFc3zptBYBthx0qaIX
	qTHzIlVePoczLPceoFBWyYPG09Ib7ccdmg+4fHE16hMa/WgrndaFuQJvW9WSq92HlglhjvS4n1A
	bj1qA/GefnpDXtWf/ENxMHSpY7ppBNTMXsN61akJUGh6h9QJR0XnEpzM7wsDC+pJinXPpO7BSJ+
	QmobGvBWx9/jN+xPWNuc2b+TG/vCci/mUeoDZFIpCML38KIgZARnrLgC5TTts1xHM2NDZH7p2ae
	OjNuqHMhV8ElrU7J8axwslin3FtQf1P/+6BjK7+c3XumcU6IjMuqe0pJ9+1WsVrwgxBZ0OliMnf
	TTqWjIRRp+0v31ar7KxokwD3pA+4DGa/np/R8/w7pgP6Sng==
X-Google-Smtp-Source: AGHT+IHMLaIm8aahuPreV60FOOmrmpQocxqFSXDfnpp2XbU/+KZwakIBweYK+7LfGmsvOPVCS/FpIw==
X-Received: by 2002:a17:907:1b1d:b0:af9:3116:e110 with SMTP id a640c23a62f3a-af940277761mr1288991366b.58.1754411532702;
        Tue, 05 Aug 2025 09:32:12 -0700 (PDT)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Xen-devel <xen-devel@lists.xen.org>,
	xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 2/2] efi: Stop using StdErr
Date: Tue,  5 Aug 2025 17:32:04 +0100
Message-ID: <20250805163204.3631483-3-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250805163204.3631483-1-ross.lagerwall@citrix.com>
References: <20250805163204.3631483-1-ross.lagerwall@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xen's use of StdErr is inconsistent. Some boot errors are reported using
PrintErr() which uses StdErr and some are reported using blexit() which
uses StdOut.

On my test system using OVMF, StdErr is not displayed on the emulated
screen. Looking at other EFI applications, StdErr is just used for debug
messages if at all.

Therefore, switch all boot output to use StdOut.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/common/efi/boot.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 50ff1d1bd225..6ba486943466 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -153,7 +153,6 @@ static UINT32 __initdata efi_bs_revision;
 static EFI_HANDLE __initdata efi_ih;
 
 static SIMPLE_TEXT_OUTPUT_INTERFACE *__initdata StdOut;
-static SIMPLE_TEXT_OUTPUT_INTERFACE *__initdata StdErr;
 
 static UINT32 __initdata mdesc_ver;
 static bool __initdata map_bs;
@@ -168,11 +167,7 @@ static void __init PrintStr(const CHAR16 *s)
 {
     StdOut->OutputString(StdOut, (CHAR16 *)s );
 }
-
-static void __init PrintErr(const CHAR16 *s)
-{
-    StdErr->OutputString(StdErr, (CHAR16 *)s );
-}
+#define PrintErr PrintStr
 
 static CHAR16 *__init FormatDec(UINT64 Val, CHAR16 *Buffer)
 {
@@ -287,7 +282,6 @@ static bool __init match_guid(const EFI_GUID *guid1, const EFI_GUID *guid2)
 /* generic routine for printing error messages */
 static void __init noreturn PrintErrMesg(const CHAR16 *mesg, EFI_STATUS ErrCode)
 {
-    StdOut = StdErr;
     PrintErr(mesg);
     PrintErr(L": ");
 
@@ -914,7 +908,6 @@ static void __init efi_init(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTabl
     efi_fw_revision = SystemTable->FirmwareRevision;
 
     StdOut = SystemTable->ConOut;
-    StdErr = SystemTable->StdErr ?: StdOut;
 }
 
 static void __init efi_console_set_mode(void)
-- 
2.50.1


