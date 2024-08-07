Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C65E94A8EE
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2024 15:49:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773501.1183964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbh1y-0005uG-T1; Wed, 07 Aug 2024 13:48:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773501.1183964; Wed, 07 Aug 2024 13:48:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbh1y-0005pG-OL; Wed, 07 Aug 2024 13:48:46 +0000
Received: by outflank-mailman (input) for mailman id 773501;
 Wed, 07 Aug 2024 13:48:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nE80=PG=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sbh1x-0005AD-7r
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2024 13:48:45 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2d5edc2-54c3-11ef-8776-851b0ebba9a2;
 Wed, 07 Aug 2024 15:48:43 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5af51684d52so2139034a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 07 Aug 2024 06:48:43 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5b83960f353sm7017710a12.15.2024.08.07.06.48.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Aug 2024 06:48:42 -0700 (PDT)
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
X-Inumbo-ID: c2d5edc2-54c3-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723038523; x=1723643323; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ss20XkPoOS/17MJ2dIfZqErwnJ4zQ6MM+H++oOIE0s=;
        b=RsJ/oxCBXDZjOo6aTCy7P52KXLoHF0bMgk3jQCQuPmRxpDzo1dSkDk5Nmi4d/zrf4x
         Py37kFqTczOaBcS7dZLcM141TeAQKkoB4JlrxDUvbIKtjIC7h2sGVcLFMedSpdymynXY
         kolwpFcbCjui/g6sPOkSlKgWYNOJRsxNZWc6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723038523; x=1723643323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ss20XkPoOS/17MJ2dIfZqErwnJ4zQ6MM+H++oOIE0s=;
        b=JVHKYraNbwEtI8D+cLoRtnWPBZj+wJPCA7AXrASwjL+JhzEd3ydOMjwRD+TC/42Nrc
         ZEUsFMHMvXO/giEBO30xEkcVtkd7BrDtLYC8wzE+oijXrh0qB7ghdKPUZdRyEfFaKqtf
         JSQvNGp7XnfWy+pCXNH4dWBqxeqslmd4m/u5Cx6NaeU9jtSKuUAjxeXeBsZjDfvCDVqX
         j/l7ZMLTYGEEkrRK0ofxXxaI5GHtRob/URrMGxPPx99s5/axwntEzIo2JhZUN/M/mjfr
         usla7QhOYRgeQXDBIlufE/PlzUJ/qlI46BLtXRUpckDIllVPLEaxfv68hcbeLzLAUhCl
         A5mg==
X-Gm-Message-State: AOJu0Yw0NRT+kziN9Ip7ahNDKXo9DlnNiAFATbWPjr1WKza70fUfW5k2
	qcaLtPhpN4MJcCi9wvUdrc+uFkm8U62ibfedmOTs7yEUNdHzRwW6pUSaRKLo51mnLuB/TOyiKcR
	C
X-Google-Smtp-Source: AGHT+IHCXTM5fGaE9/iFzHECw4HaTuzn5M6eXxe17YBVWA7pFfxIaCBP3tiSHOseOczCK8WOgg8Oog==
X-Received: by 2002:a50:ff0b:0:b0:5a0:f8a2:9cf4 with SMTP id 4fb4d7f45d1cf-5b7f5129b4bmr12290625a12.25.1723038522669;
        Wed, 07 Aug 2024 06:48:42 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 3/5] x86: Set xen_phys_start and trampoline_xen_phys_start earlier
Date: Wed,  7 Aug 2024 14:48:17 +0100
Message-ID: <20240807134819.8987-4-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240807134819.8987-1-alejandro.vallejo@cloud.com>
References: <20240807134819.8987-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No reason to wait, if Xen image is loaded by EFI (not multiboot
EFI path) these are set in efi_arch_load_addr_check, but
not in the multiboot EFI code path.
This change makes the 2 code paths more similar and allows
the usage of these variables if needed.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/head.S | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 296f76146a..5b82221038 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -259,6 +259,11 @@ __efi64_mb2_start:
         jmp     x86_32_switch
 
 .Lefi_multiboot2_proto:
+        /* Save Xen image load base address for later use. */
+        lea     __image_base__(%rip),%rsi
+        movq    %rsi, xen_phys_start(%rip)
+        movl    %esi, trampoline_xen_phys_start(%rip)
+
         /* Zero EFI SystemTable, EFI ImageHandle addresses and cmdline. */
         xor     %esi,%esi
         xor     %edi,%edi
@@ -605,10 +610,6 @@ trampoline_setup:
          * Called on legacy BIOS and EFI platforms.
          */
 
-        /* Save Xen image load base address for later use. */
-        mov     %esi, sym_esi(xen_phys_start)
-        mov     %esi, sym_esi(trampoline_xen_phys_start)
-
         /* Get bottom-most low-memory stack address. */
         mov     sym_esi(trampoline_phys), %ecx
         add     $TRAMPOLINE_SPACE,%ecx
-- 
2.45.2


