Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1132BA38AEA
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 18:50:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890789.1299925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk5GF-00081f-Vd; Mon, 17 Feb 2025 17:50:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890789.1299925; Mon, 17 Feb 2025 17:50:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk5GF-0007ya-Sw; Mon, 17 Feb 2025 17:50:27 +0000
Received: by outflank-mailman (input) for mailman id 890789;
 Mon, 17 Feb 2025 17:50:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j0rV=VI=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1tk5GE-0007yU-N4
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 17:50:26 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aad31af3-ed57-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 18:50:25 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-ab771575040so1108041966b.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 09:50:25 -0800 (PST)
Received: from rossla-pc.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abb8190d1b6sm436754966b.36.2025.02.17.09.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 09:50:24 -0800 (PST)
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
X-Inumbo-ID: aad31af3-ed57-11ef-9aa6-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739814625; x=1740419425; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NNduopqrEF5xma/lPYVQ1l/UoUiKg739lA7HBR/lEvI=;
        b=Mxwrkj0pfhYroxmSL6dWTT44378dSsZmlZX2u/MGlPSjUBlXvT0N4ud9UEDFVpn4DT
         YEIpL9M/CEol772zO9QlF2xvQzJk5cSIr6HTpGyQz7vCIMiS7YSrQrNplyu5xj6K9Ebt
         uKx77P+ZvWu6J6aICFnkiRhBCFxWx8+/akxhs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739814625; x=1740419425;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NNduopqrEF5xma/lPYVQ1l/UoUiKg739lA7HBR/lEvI=;
        b=VaPkKQzLDHlsMsFfDY3zDuYomxeqfkuKMyg9r42TFA4Cuz17j8WEUOgHiYgisFlgoU
         uvrBxYFL/aE4MZG22U2XM+h5iNVc4dhARUE3Udv3AMDeif1MrKEWkJzEy9+QrOGL+A4R
         YPxPFwlQV8VfS3vSIiLuONKNzT7xLRDR+KWuIm7dM67ABjrIhLUzYSma0XX+xyoGwegk
         ZFsvpzFn/N59/QJJ+Un3yDQ4+FaV9Jdzz6HwBWdH2SPtXzJFXN6kQFandzxRMoW4FU4Z
         eo97Zan/JUoof7ROtAkPdlJAvWjYaLgjQv5YZmybDCCyGBp+xtRZHym2XRFsTY6Ylzil
         IVpg==
X-Gm-Message-State: AOJu0Yxzwj7GYtjyHrC5CNABegVQXAiSvMFhOlp8rJUwp7joEeIvS8c2
	W15QrVG6BbDHzdAHLpVJFSvDaXF1DosP1ttWTcpQ1+SEItRWAxvp8ud0I2VUP2XdIEm8k4Z+kYQ
	=
X-Gm-Gg: ASbGncsp25akRNNsvUYxa5SwLEeSLNoCNe9A1qaNUTVd/dYXj+9q2UROIfcihTgKwhs
	Ka2XEKHyoHXXAxwVQD79vOvoJlwtwSByA7rjzlTjiGIXZTQJbxeE1QGxhZs6emBV6KBiOyInMfm
	67Rb8s8ytagFA+xcYhDlw+seY4w4u+TKE7Lw0EodLVZQ6wwNcx9HJBNmlODq1ppwgNLIyKgqOQw
	tKTUa9qiHKrKCtPI57V8bttvndhdLI9taZr23AKkaFPc+8z1dHkBTx4jY0caIbxXzWZJCBbLnEJ
	o1IiKWNza8SO/vLzG7X65vk8KVGKCeX40X4+usU=
X-Google-Smtp-Source: AGHT+IFVJkBiVrO9FOM/7vx3YNAx/91SgphLkQmtcZBtiSUiZXLKie9W4Mxdz/Qvl9oI3aQRydyldg==
X-Received: by 2002:a17:907:7209:b0:aa6:bcc2:3f02 with SMTP id a640c23a62f3a-abb70ced371mr1021685166b.29.1739814624714;
        Mon, 17 Feb 2025 09:50:24 -0800 (PST)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v2] x86/ucode: Add option to scan microcode by default
Date: Mon, 17 Feb 2025 17:50:11 +0000
Message-ID: <20250217175011.3175683-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A lot of systems automatically add microcode to the initramfs so it can
be useful as a vendor policy to always scan for microcode. Add a Kconfig
option to allow setting the default behaviour.

The default behaviour is unchanged since the new option defaults to
"no".

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---

* Updated the command-line docs.
* Tweaked Kconfig wording.
* def_bool -> bool

 docs/misc/xen-command-line.pandoc |  5 +++--
 xen/arch/x86/Kconfig              | 10 ++++++++++
 xen/arch/x86/cpu/microcode/core.c |  2 +-
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 9bbd00baef91..0c6225391d55 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2724,7 +2724,7 @@ performance.
 > `= List of [ <integer> | scan=<bool>, nmi=<bool> ]`
 
     Applicability: x86
-    Default: `nmi`
+    Default: `scan` is selectable via Kconfig, `nmi=true`
 
 Controls for CPU microcode loading. For early loading, this parameter can
 specify how and where to find the microcode update blob. For late loading,
@@ -2747,7 +2747,8 @@ microcode in the cpio name space must be:
   - on Intel: kernel/x86/microcode/GenuineIntel.bin
   - on AMD  : kernel/x86/microcode/AuthenticAMD.bin
 When using xen.efi, the `ucode=<filename>` config file setting takes
-precedence over `scan`.
+precedence over `scan`. The default value for `scan` is set with
+`CONFIG_UCODE_SCAN_DEFAULT`.
 
 'nmi' determines late loading is performed in NMI handler or just in
 stop_machine context. In NMI handler, even NMIs are blocked, which is
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 9cdd04721afa..6e41bc0fb435 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -383,6 +383,16 @@ config ALTP2M
 
 	  If unsure, stay with defaults.
 
+config UCODE_SCAN_DEFAULT
+	bool "Scan for microcode by default"
+	help
+	  During boot, Xen can scan the multiboot images for a CPIO archive
+	  containing CPU microcode to be loaded, which is Linux's mechanism for
+	  early microcode loading.
+
+	  Enable if you have a Linux-based dom0 with microcode attached to the
+	  initramfs.
+
 endmenu
 
 source "common/Kconfig"
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 87283cff1de4..de00c22b4bd6 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -100,7 +100,7 @@ static struct microcode_patch *microcode_cache;
  * location we require that they are not both active together.
  */
 static int __initdata opt_mod_idx;
-static bool __initdata opt_scan;
+static bool __initdata opt_scan = IS_ENABLED(CONFIG_UCODE_SCAN_DEFAULT);
 
 /*
  * Used by the EFI path only, when xen.cfg identifies an explicit microcode
-- 
2.48.1


