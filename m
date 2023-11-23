Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C94E17F5DE9
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 12:37:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639647.997213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r681O-0000Jj-8u; Thu, 23 Nov 2023 11:37:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639647.997213; Thu, 23 Nov 2023 11:37:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r681O-0000G7-5w; Thu, 23 Nov 2023 11:37:26 +0000
Received: by outflank-mailman (input) for mailman id 639647;
 Thu, 23 Nov 2023 11:37:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UBXZ=HE=citrix.com=prvs=684edd595=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1r681M-0000Ap-Ue
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 11:37:24 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9d7ff4e-89f4-11ee-9b0e-b553b5be7939;
 Thu, 23 Nov 2023 12:37:22 +0100 (CET)
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
X-Inumbo-ID: a9d7ff4e-89f4-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1700739442;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9rv2ata5GYXSyDW9o8Ki1D33XgygvSygq4Ui9dXRBr0=;
  b=IzOZbCEWtCfl7ZH+5bIhuFrv0wFxUgY5L786JBJXgbRTozqQSKN2ARqC
   ClaXfi/rF4JWYZAqZsXOZJ04+Zq79vPPFXiWs37gBOe649CT0/oER36e6
   2/MVf/RdEmEyBwSzhGRSgLk5G0Y9ElExkun4Pd3U7LY9NtNzZd8GZdOtS
   w=;
X-CSE-ConnectionGUID: 6yeXaNbFTsiB9DKlXs03Kg==
X-CSE-MsgGUID: zBrIBWznQDK4LChTiv/caA==
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 128163486
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:L05oqqqH9uo5wGP5hbKW6hpsExBeBmLdZRIvgKrLsJaIsI4StFCzt
 garIBnTb6mCMDSjeY1xbYzno0MB75bVmN5kHlFppCFhEi4UoJuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbOCYmYpA1Y8FE/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04G9wUmAWP6gR5waHzSJNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAG4cYyCKoeiY/Km6YLhApcATN5GwH4xK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSaxFIUPrSn8/x7pX7WxRepEiYuuwc5G/LwRYq+LPsLMDUapqBQsA9ckOw/
 ziWpjqiXkFEXDCZ4Siv6FOGuf3JpA/YBKY5FIG56LlhiXTGkwT/DzVJDADm8JFVkHWWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8UYwgyQzqvf4y6CG3MJCDVGbbQOr9QqTDYn0
 luImdLBBjF1trCRD3WH+d+8sjeaKSUTa2gYakcsTxYB4tTliJE+iFTIVNkLOJCyitr5CDTh2
 QegpSI1h6gQpcMT3qD99lfC6xqmq4LVVAcz6kPSV3i88wJiTIe/Ysqj7l2zxfNBJ4aQSh+Gp
 moJn+CX6exIBpaI/BFhW81UQuvvvazcdmSB0BgwR/HN6ghB5Vb9bI1g6Rd0CntyM+xVVRztU
 FSL4iBesco70GSRUUNnX26gI511lfC+S4S0Cau8UzZYXnRmmOa6EMBSia24hTmFfLAEy/1XB
 HtiWZ/E4YwmIapm1iGqYOwWzKUmwCszrUuKGsijkUv4gevFOyDKIVvgDLdoRrpihE9jiFyFm
 +uzyuPQk0kPOAEASnW/HXEvwaAiciFgWMGeRz1/fe+fOAt2cFzN+NeIqY7Nj7dNxvwP/s+Rp
 yHVZ6Ot4Aan7ZExAVnQOy8LhXKGdcoXkE/XygR2bAz0hCVzOdb3hErdHrNuFYQaGCVY5aYcZ
 5E4lw+oW5yjlhyvF+whUKTA
IronPort-HdrOrdr: A9a23:UpxFaKx1yi0n6Arz0FmtKrPwIL1zdoMgy1knxilNoRw8SKKlfq
 eV7ZMmPH7P+VIssR4b+exoVJPtfZq+z+8R3WByB8bAYOCOggLBR+sO0WKL+UyHJ8SUzI9gPM
 lbHJSWcOeAb2RHsQ==
X-Talos-CUID: 9a23:5M4KQmNJbaLow+5DBjhqxEcyEO4ZaXz3nVvzJ3+jUT1KR+jA
X-Talos-MUID: 9a23:7GTdLwU9xPNj2MHq/C3GnhBIC9Vu2oiNVGQmkakHpY6PPAUlbg==
X-IronPort-AV: E=Sophos;i="6.04,221,1695700800"; 
   d="scan'208";a="128163486"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH] xen/efi: Drop image_name from efi_arch_handle_cmdline()
Date: Thu, 23 Nov 2023 11:37:12 +0000
Message-ID: <20231123113712.1933421-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

With all architectures no longer wanting an image name in the command line
handling, drop the parameter and forgo making one up.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/efi/efi-boot.h |  3 +--
 xen/arch/x86/efi/efi-boot.h |  3 +--
 xen/common/efi/boot.c       | 15 +--------------
 3 files changed, 3 insertions(+), 18 deletions(-)

diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index 59d217667ff3..6e6db2445566 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -454,8 +454,7 @@ static void __init efi_arch_memory_setup(void)
 {
 }
 
-static void __init efi_arch_handle_cmdline(CHAR16 *image_name,
-                                           CHAR16 *cmdline_options,
+static void __init efi_arch_handle_cmdline(CHAR16 *cmdline_options,
                                            const char *cfgfile_options)
 {
     union string name;
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 1a2a2dd83c9b..86467da301e5 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -303,8 +303,7 @@ static void __init efi_arch_cfg_file_late(const EFI_LOADED_IMAGE *image,
     }
 }
 
-static void __init efi_arch_handle_cmdline(CHAR16 *image_name,
-                                           CHAR16 *cmdline_options,
+static void __init efi_arch_handle_cmdline(CHAR16 *cmdline_options,
                                            const char *cfgfile_options)
 {
     union string name;
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index e5e86f22b2b2..61108199188f 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -1462,21 +1462,8 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
             }
         }
 
-        /*
-         * EFI_LOAD_OPTION does not supply an image name as first component:
-         * Make one up.
-         */
-        if ( argc && !*argv )
-        {
-            EFI_FILE_HANDLE handle = get_parent_handle(loaded_image,
-                                                       &file_name);
-
-            handle->Close(handle);
-            *argv = file_name;
-        }
-
         name.s = get_value(&cfg, section.s, "options");
-        efi_arch_handle_cmdline(argc ? *argv : NULL, options, name.s);
+        efi_arch_handle_cmdline(options, name.s);
 
         if ( !base_video )
         {

base-commit: f96e2f64576cdbb147391c7cb399d393385719a9
-- 
2.30.2


