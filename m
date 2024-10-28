Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5259B2B33
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 10:19:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826298.1240537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5Lu4-0006a4-O1; Mon, 28 Oct 2024 09:19:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826298.1240537; Mon, 28 Oct 2024 09:19:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5Lu4-0006Wc-Jy; Mon, 28 Oct 2024 09:19:12 +0000
Received: by outflank-mailman (input) for mailman id 826298;
 Mon, 28 Oct 2024 09:19:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/lrK=RY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t5Lu3-0005yk-94
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 09:19:11 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afe37ec1-950d-11ef-99a3-01e77a169b0f;
 Mon, 28 Oct 2024 10:19:09 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a9a850270e2so677426566b.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 02:19:09 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1f05deb6sm355961566b.88.2024.10.28.02.19.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 02:19:06 -0700 (PDT)
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
X-Inumbo-ID: afe37ec1-950d-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730107148; x=1730711948; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oICYqe4yhMzxG8joOnpcuB9tYuO3zHV62gOFfMxJa7M=;
        b=W3KafJDx2IkapzBEPdM/Kv/m6YdPTmMCwrJJrd5jp/65m5rtoyCK5qXgstTZdj+2Es
         FhGUJCFvzFHC5zPb13U5VfM8x5yn0wXQ5d4xSzhNZeTlGNlc+c0sitTidZ2jEUfqptuZ
         GTEowN+QGdF0w5nnQITXk7yv12ymuPV6bAabc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730107148; x=1730711948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oICYqe4yhMzxG8joOnpcuB9tYuO3zHV62gOFfMxJa7M=;
        b=cJnp22mqe0X/ECd6QCx5/caPAkC1npv7PSNMSUULbD9kqI+nmLZBvm7KNFEcehDO7Q
         NQ7iuJ02H61DD5qq6JiIb0Y0/Eyej3cfGbCPnpKDoRNJhMZZie9g/GVSxe1/Dxcijfdk
         ElSqoMRHlW5707HT8IxPb7KEFzWIuecIsFq7tUL772asuLKORN3kB9LLe95pF1TMzmEB
         W0hOz+U5tH0yoGBFoJ3OJeN11yua0ex9jKpX8IH8QMYsBsMzPczL5PEuJ8+lVy1GfEgf
         dAVIh0K8OmFsrefEBaDZF8IKm8M+L9hUk3ZrCO8yHrLmoxT26VAy8lLZK0OUv8mLkB22
         V1DQ==
X-Gm-Message-State: AOJu0YyfQG6yZMIoQMtJ4uS0oxxkizbsPqaoM/Kpk6338MH5vSJkU4OA
	aNCfaml6JFGY95TI8FMkQBua/kUskBF4NSvrIUYlur9AFjozwpXM+itPr4G+8yStpY12OiDfRk6
	h
X-Google-Smtp-Source: AGHT+IFPmRBctsKkbYZfwJ/wA3cEUyI1GBO58kJ5TMNvnj+8riKv+CKvmi65G6mLHSuZnD3+BsL2RA==
X-Received: by 2002:a17:907:a07:b0:a99:4ebc:82d4 with SMTP id a640c23a62f3a-a9de6192c15mr813457466b.55.1730107148172;
        Mon, 28 Oct 2024 02:19:08 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 05/10] x86/ucode: Fold microcode_grab_module() into its single caller
Date: Mon, 28 Oct 2024 09:18:51 +0000
Message-Id: <20241028091856.2151603-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241028091856.2151603-1-andrew.cooper3@citrix.com>
References: <20241028091856.2151603-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/cpu/microcode/core.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 0b00e70f3b07..4c4003bf9687 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -205,19 +205,6 @@ static void __init microcode_scan_module(struct boot_info *bi)
     }
 }
 
-static void __init microcode_grab_module(struct boot_info *bi)
-{
-    if ( ucode_mod_idx < 0 )
-        ucode_mod_idx += bi->nr_modules;
-    if ( ucode_mod_idx <= 0 || ucode_mod_idx >= bi->nr_modules ||
-         !__test_and_clear_bit(ucode_mod_idx, bi->module_map) )
-        goto scan;
-    ucode_mod = *bi->mods[ucode_mod_idx].mod;
-scan:
-    if ( ucode_scan )
-        microcode_scan_module(bi);
-}
-
 static struct microcode_ops __ro_after_init ucode_ops;
 
 static DEFINE_SPINLOCK(microcode_mutex);
@@ -831,7 +818,15 @@ static int __init early_microcode_load(struct boot_info *bi)
     size_t size;
     struct microcode_patch *patch;
 
-    microcode_grab_module(bi);
+    if ( ucode_mod_idx < 0 )
+        ucode_mod_idx += bi->nr_modules;
+    if ( ucode_mod_idx <= 0 || ucode_mod_idx >= bi->nr_modules ||
+         !__test_and_clear_bit(ucode_mod_idx, bi->module_map) )
+        goto scan;
+    ucode_mod = *bi->mods[ucode_mod_idx].mod;
+ scan:
+    if ( ucode_scan )
+        microcode_scan_module(bi);
 
     if ( !ucode_mod.mod_end && !ucode_blob.size )
         return 0;
-- 
2.39.5


