Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B52DB1B893
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 18:32:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070748.1434404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujKaG-0003kH-En; Tue, 05 Aug 2025 16:32:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070748.1434404; Tue, 05 Aug 2025 16:32:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujKaG-0003gP-Al; Tue, 05 Aug 2025 16:32:16 +0000
Received: by outflank-mailman (input) for mailman id 1070748;
 Tue, 05 Aug 2025 16:32:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FQWd=2R=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1ujKaE-0002Yg-4b
 for xen-devel@lists.xen.org; Tue, 05 Aug 2025 16:32:14 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bdf1b194-7219-11f0-a321-13f23c93f187;
 Tue, 05 Aug 2025 18:32:13 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-af922ab4849so851607166b.3
 for <xen-devel@lists.xen.org>; Tue, 05 Aug 2025 09:32:13 -0700 (PDT)
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
X-Inumbo-ID: bdf1b194-7219-11f0-a321-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754411533; x=1755016333; darn=lists.xen.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L1QqT35WPMNEdKVxqmbRQUpDF5jhPdPInhgcu4VmEpk=;
        b=kMtTWE3TMx3uIJAUZSpBpug1sxlsYJZN0NYrZIoUIIeclFVqzTVD3n+n+LEoa/pzdy
         3aMbAMsX0T9M0iLo30S79bY3OBz39FFrdGDI0eYF3NkBxYoVuAQEBrnL06VMXFIkQiuE
         G1WG/ZmQD29jHiraDdZA2ZbeXQvHTBBLB3WU8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754411533; x=1755016333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L1QqT35WPMNEdKVxqmbRQUpDF5jhPdPInhgcu4VmEpk=;
        b=QKONrDVfD8vVsCqXLJChkUTdgPu6DWZ2HditHpZ6pqUNTtf5IPZjLNSkpqMsE0HyCU
         ZUQur7NFmBLdvm7BHvpFUAku9AbTyOdav/9eEQMi/YD7+MAPem7xBX39zJMYHrafF27/
         gTl8sVQZSDv7b6tVp9+S8vG8TdW1QahSYaSahV+eDNpf7EDat6KZ/+feeJJK12m4anC4
         bpwZMKOKdvPHjeB6nLJDWXMX0vHoWH13mRxyijAKbUt7362JzC1oXKpq98ZQOF4DTjGG
         eGWB8hkkMTnjRlRKUecX1UjHhJHCq9yCVrxa8ml+vSP9zRrWaErdD89Jy6tLnl+e9ybf
         5zqg==
X-Gm-Message-State: AOJu0YwHXDQGG8rKCdMK/kYvQixnUvPOmsb+uFoqOhznoZjI4F+zJxlU
	2leMbS16CegDJqGMOSjvsGLC9vG8cAd/DLUrQZdoyM/6qb7JBMxxMPZEsyqwaQPs06BvwBXSFIL
	yitQ=
X-Gm-Gg: ASbGnctgyfEKiOc4EfnU84m3qZJwP26gPOghuTX5zyvFHLKDI3uxgQADNHlzZ9XBkpl
	mxdxRAB1fQ8BAjoYFwEwLdhAWmhlVCTFDAh9Krp5eCp2/beO6Uu0NHQCyssmbAXU+Ltqtw1ClTS
	5y/DPDR25l38AxB7Z2G5rCV40oSpxZxYqfhdyiCyIBXfoBfDwEV8a7WMt9OYb5FMpRDbpiZwHSv
	gj1k+TW2NLLOVswgGcbOzSnJE3HHP5V9/JGcisixFVVgC4f416vd4YMNdAt7mo+zo5A0/R3c99O
	Uq0XO5EvQ1B8exXCJHh26zxzCP8AU0kAog/rJdjfUL9ASw3rzHCAOhy2oZI0/9e/n0i8PDSE3no
	6SOi9OdLiMdNL1aERfCNTJqhPMT1ssuGIab+9K3hH2UldNw==
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


