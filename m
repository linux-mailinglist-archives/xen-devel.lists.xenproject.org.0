Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9620EB0BF1D
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 10:37:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051179.1419494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udm1V-0000f9-8j; Mon, 21 Jul 2025 08:37:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051179.1419494; Mon, 21 Jul 2025 08:37:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udm1V-0000c9-5O; Mon, 21 Jul 2025 08:37:25 +0000
Received: by outflank-mailman (input) for mailman id 1051179;
 Mon, 21 Jul 2025 08:37:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7j1p=2C=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1udm1T-0000c3-OT
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 08:37:23 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebc85fe8-660d-11f0-a31d-13f23c93f187;
 Mon, 21 Jul 2025 10:37:22 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4560cdf235cso19669065e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jul 2025 01:37:22 -0700 (PDT)
Received: from localhost.localdomain (111.142.125.91.dyn.plus.net.
 [91.125.142.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4563b74f8a9sm94885515e9.26.2025.07.21.01.37.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 01:37:21 -0700 (PDT)
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
X-Inumbo-ID: ebc85fe8-660d-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1753087042; x=1753691842; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BQ99omTDilNkcVRNLimaOx7TsDamiYv5Ieog4Phx2uk=;
        b=OG5xwV2PTRKRQlIzCWN3M0C99DomFbKPZRas5jA93I/dDIgVzm6pE2X3lMjR3vWH6Q
         ZMFAxLrdovm95jRy2OlmD7H9605mm6kZ3TgwByXpCs74rr43k9EAPYgZXOuMn1hfQxev
         530MQbGcp8+TMuipX+4NGFc/hrT7VTXgBJTck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753087042; x=1753691842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BQ99omTDilNkcVRNLimaOx7TsDamiYv5Ieog4Phx2uk=;
        b=ukiTg7mVerIJeWG3a/Zu2L2kbFjqYkZh1GYav/jiDvADJTwOCV5dYmnC2f5ETn9Q5I
         9ue/96XakFKPWtJxAdJ1iJJCsfnvnw4XTuF1ZDi7IT8sMwYk4iLRSKUrPFNxepF7ic17
         AhOJAh7GLt16qy52O9SkziUWxbTL29hPudTIhdare11iGCYaV16hRyFGscNXdO09wKG0
         JHufM9X64QImbdjlMbGD8z/A3fAbmMXDZahmJXcV20NUXfH9sgN9bSZ+Jy7wAmyHcs7W
         yCncdNw9gjRg6+b9X6b6V2JW5zADhW3mDag7vl0TxD4rxToUSnJw4EWknsYY6+Bh+sqi
         ReYA==
X-Gm-Message-State: AOJu0Yx6vHQpC1N2e9X2BCJUXSsmF1S/DWK9wpFUXHU9fM6HHdph/yJa
	Q7jEyGJSugQbPG+sulb+ZmXcCKbaw81vFtjRlR6yIasSU5aNpq7rPUXDt3aEtYgnJHu0a5PmU3Z
	Vqyqm34Q=
X-Gm-Gg: ASbGnctzefIlvHzM+sw7Tp3cctNgxeLQb/JRzf0rLFJk90flJvgxi6XCxRvx+yeXzbB
	SZHUS9PphFeG1a/++UJ12mF3cC65zj13Ht9Gwcfmb+nEK3EmQ5eU9Oj72zE5FtLLNLZLgszkKKT
	fOLVpwOLCKl6okzCBy72+fOwEVTNbQr7KWRPITK0Dj5y/LAZ0KGwQjIwXS9t/NDsVadIy8IkXYx
	ifAnRkR5pFUSlK2fZpHwsUHnG8MWZhJyV6/qqxDpDv+WLhHctEweZ0t4Z3PHx12eLdrFNs/8KGP
	iU9PmtoIf0Nk0woJRSpR4yXnyTDwJnlBiGGHvbQpIpFj1/shgbNpFJdL63mb3c2B1XamdQuJSNu
	cg7yKzCK0au6ZUWltjAanB1h/BspYjtp3gupFvjIsUestcmXXHkkIHGTGzyEu+r8USsTQaddPi7
	lCdghvUA==
X-Google-Smtp-Source: AGHT+IHMRGT5qNmhKOaKZpBomdApjbz/nWCS0Q2v6glmR+/myNnO0NCqEaijGl/j7owpV520M3ePLQ==
X-Received: by 2002:a05:600c:6207:b0:43d:42b:e186 with SMTP id 5b1f17b1804b1-456352e7865mr141648865e9.8.1753087041804;
        Mon, 21 Jul 2025 01:37:21 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] xen/efi: Reduce variable scope to void compiler warning
Date: Mon, 21 Jul 2025 09:37:06 +0100
Message-ID: <20250721083707.7964-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This change removes some pieve of code working around with
some compiler warnings.
No functional change.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/common/efi/boot.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 6c2ef13bc5..80d60ed54f 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -1320,8 +1320,8 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
     static EFI_GUID __initdata shim_lock_guid = SHIM_LOCK_PROTOCOL_GUID;
     EFI_LOADED_IMAGE *loaded_image;
     EFI_STATUS status;
-    unsigned int i, argc;
-    CHAR16 **argv, *file_name, *cfg_file_name = NULL, *options = NULL;
+    unsigned int i;
+    CHAR16 *file_name, *cfg_file_name = NULL, *options = NULL;
     UINTN gop_mode = ~0;
     EFI_SHIM_LOCK_PROTOCOL *shim_lock;
     EFI_GRAPHICS_OUTPUT_PROTOCOL *gop = NULL;
@@ -1352,6 +1352,8 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
 
     if ( use_cfg_file )
     {
+        unsigned int argc;
+        CHAR16 **argv;
         UINTN offset = 0;
 
         argc = get_argv(0, NULL, loaded_image->LoadOptions,
@@ -1405,15 +1407,6 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
         if ( !base_video )
             efi_console_set_mode();
     }
-    else
-    {
-        /*
-         * Some compilers may emit a false "uninitialized use" warning for argc,
-         * so initialize argc/argv here to avoid the warning.
-         */
-        argc = 0;
-        argv = NULL;
-    }
 
     PrintStr(L"Xen " XEN_VERSION_STRING XEN_EXTRAVERSION
 	     " (c/s " XEN_CHANGESET ") EFI loader\r\n");
-- 
2.43.0


