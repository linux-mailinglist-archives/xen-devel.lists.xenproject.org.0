Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 338B4A388CE
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 17:09:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890597.1299742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk3fw-0008GE-OI; Mon, 17 Feb 2025 16:08:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890597.1299742; Mon, 17 Feb 2025 16:08:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk3fw-0008EG-Kz; Mon, 17 Feb 2025 16:08:52 +0000
Received: by outflank-mailman (input) for mailman id 890597;
 Mon, 17 Feb 2025 16:08:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j0rV=VI=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1tk3fu-0008EA-Vk
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 16:08:50 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78e381cd-ed49-11ef-9896-31a8f345e629;
 Mon, 17 Feb 2025 17:08:49 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5ded51d31f1so7323735a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 08:08:48 -0800 (PST)
Received: from rossla-pc.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dedddd5b82sm5870764a12.30.2025.02.17.08.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 08:08:47 -0800 (PST)
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
X-Inumbo-ID: 78e381cd-ed49-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739808528; x=1740413328; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wH7ic1zbQm21ChfLYhG1H4cZv4Q6Rqc8dyHPO9BInes=;
        b=siUPWOZ0JUN39uZiiRkE6tvCrcXvpOqMtHnuxuqocw7uchYuRzuXnUTnbpGIcZ5Nge
         eofvAEx8fTDl+oqkuhttYrA8ZL5Y0zsVQ4h3tLfXEGfE8igJCTxmyhTQelO4zSTss5c4
         pYebhitZk1q+RftdwO41g6w3z84UR5D2/I69s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739808528; x=1740413328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wH7ic1zbQm21ChfLYhG1H4cZv4Q6Rqc8dyHPO9BInes=;
        b=NBgSL6rQnQWXAWaR+vLNpVko9tTFCR0hlewpRVFcyfT/R8jCvYoUDkmd62rNWi+jtL
         0bIQGe02fTWEwIXtbPhEoYQDgkLlnd8lM97BS9BeuitM9F6AB8jkH5jVUCPi9D9l2VM7
         7VxjiZYhFSOkbD3v8f2edMunFehd681bsSuUoDT41UaYpbvBqafn3CMFBNKXs8ywkmVa
         alIHgiPEH8zE5EgYpSlIzj+kENMCj6KJj+tkk3qa2mQxQHYcPuRrxMdh1TiULycdJooF
         copqXGHMb+Bznwq704JnnEJrqrSMv3PRofm1RBW17blA98dNE7Ndu6rufmzvecBwoL9D
         Puzg==
X-Gm-Message-State: AOJu0Yy34DNEBWJ2XAaO4nLSY/62QjeMU6BIRnsWTj73mNsYrwUZHdP2
	cJx3FZggg9Yfzi+j/JMAiYCc9c7NZmCZeTC35uFW92u8hYwgqJ+/bW9rfxiNdWUsNpGIYyETc0w
	=
X-Gm-Gg: ASbGncvCa7C9yPfDa4AdL7j3dOKOZY0cmmEHVqrPOMx+gHdyYRY/9RbiWS0z7hH5aCH
	p+2a+OJFT293Jvp8S0NVwtdbcnHpXBEfVs3pWdjZzf2UhkOp5Vb3k7Scyn0Cu7WqUuzHwzochf6
	0C5S8Batx4XesTpIybEol4ao3mAgr2MA+m8sWqOB7MlF2US87bBtQY3crB+EHkFMyC39qJfmEer
	VjHnh1eYqkRMuMwpjL5PbA5hMGXv6SJOPhwsuyAn+MnixENFXBxoxGt5f6593rpJYNS4vPp7WYO
	xcKNHXkjDgL3heDerjAiify3BEqGeU8f3fRFMNk=
X-Google-Smtp-Source: AGHT+IHMsPk0Al9aFusUxGv96SnjdAAMJWGEqru0BXIRZptzSiV5aDgZbWFo7n+I8iollqDHTXACEQ==
X-Received: by 2002:a05:6402:2114:b0:5dc:da2f:9cda with SMTP id 4fb4d7f45d1cf-5e0361ed35emr9301709a12.27.1739808528318;
        Mon, 17 Feb 2025 08:08:48 -0800 (PST)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH] x86/ucode: Add option to scan microcode by default
Date: Mon, 17 Feb 2025 16:08:44 +0000
Message-ID: <20250217160844.3164003-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A lot of systems automatically add microcode to the initrd so it can be
useful as a vendor policy to always scan for microcode. Add a Kconfig
option to allow setting the default behaviour.

The default behaviour is unchanged since the new option defaults to
"no".

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/Kconfig              | 11 +++++++++++
 xen/arch/x86/cpu/microcode/core.c |  2 +-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 9cdd04721afa..b806d8bc3319 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -383,6 +383,17 @@ config ALTP2M
 
 	  If unsure, stay with defaults.
 
+config UCODE_SCAN_DEFAULT
+	def_bool n
+	prompt "Scan for microcode by default"
+	help
+	  During boot, Xen can scan the multiboot images for a CPIO archive
+	  containing CPU microcode to be loaded.
+
+	  Enabling this option will cause Xen to scan for it by default.
+
+	  If unsure, say N.
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


