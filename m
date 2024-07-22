Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6D2938D63
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 12:19:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761607.1171610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVq86-0001dn-5X; Mon, 22 Jul 2024 10:18:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761607.1171610; Mon, 22 Jul 2024 10:18:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVq86-0001aZ-2E; Mon, 22 Jul 2024 10:18:54 +0000
Received: by outflank-mailman (input) for mailman id 761607;
 Mon, 22 Jul 2024 10:18:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QQNa=OW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sVq84-0001Ys-Jx
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 10:18:52 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9dbf107-4813-11ef-8776-851b0ebba9a2;
 Mon, 22 Jul 2024 12:18:50 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5a167b9df7eso3683921a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 03:18:50 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c7e3f58sm407102766b.91.2024.07.22.03.18.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 03:18:42 -0700 (PDT)
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
X-Inumbo-ID: c9dbf107-4813-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721643529; x=1722248329; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3j2YYKC1Ck9c5srCq004lFLgpbvA/qrQWTg9Ql7DWDc=;
        b=GKDmbwc6Bd0CuBlZimRy1HrIpGk/haKllvw7EXAP13D8B6yu2TBf7azhC/WxMeEmp5
         lPipjfEKhxbJUE+V9wu5PpB0YPeh9zTiwIZK/6oEESZcBTJehSBEObTkDRefXc2UWbqS
         rO5J+BuCZ++ebsNzXU9Uzj4mHZpC3pPgATvfw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721643529; x=1722248329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3j2YYKC1Ck9c5srCq004lFLgpbvA/qrQWTg9Ql7DWDc=;
        b=vtN9g6pybvLWuaMJK0d4pf3xikdMT+V4xwec75s0Z5e4LholWoWqMXjyO2zHk5MPEm
         MV0tEX/xqmxfv7DxKh3h+qho7zNtV3HKIhJofHQvy9ac2DQaZ8f4p0zkWYQ/GjI9tg2n
         ikU2UczItI71JQZQf7hIjtYBln4bw3WjBiRkdbjEYlpL/43Ls6mxQkYQu0q6gvs1H57t
         8PUFnJEGl6/feESiwVws3HsDZ2Bgl3izwMZrsl8SpOWe5xVLNsSMWrZ+ldZfUZ83VMAe
         pDIWcZAcRs6z37e6qX+RZFVXwAj13IbfBT5dIKng2ShSl1bbTeub65F3cP/IRobTh2iV
         /2mg==
X-Gm-Message-State: AOJu0YwSttl5OkAIJd2tnwXYeExKFTbfIiqjBymlZsIRDc39dFmvk9OE
	9FYbW7a1u7R8AqGg+9Db0FSTmJRUV5T6FPrVV7JTJmaOXKSEeJyoyivx2VvCstqxxDymR9Frmph
	5
X-Google-Smtp-Source: AGHT+IFn7ltR/9GzXqf7x3jcra6jNQrGQnLhLEu7CKDQT/pKgI9IFR603+hOujlOOJ5eaQcqNZggMg==
X-Received: by 2002:a17:906:dc8f:b0:a6f:392d:51a9 with SMTP id a640c23a62f3a-a7a4bfe6b79mr464451166b.14.1721643523821;
        Mon, 22 Jul 2024 03:18:43 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Gene Bright <gene@cyberlight.us>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: [PATCH 2/2] x86/efi: Unlock NX if necessary
Date: Mon, 22 Jul 2024 11:18:38 +0100
Message-Id: <20240722101838.3946983-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240722101838.3946983-1-andrew.cooper3@citrix.com>
References: <20240722101838.3946983-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

EFI systems can run with NX disabled, as has been discovered on a Broadwell
Supermicro X10SRM-TF system.

Prior to commit fc3090a47b21 ("x86/boot: Clear XD_DISABLE from the early boot
path"), the logic to unlock NX was common to all boot paths, but that commit
moved it out of the native-EFI booth path.

Have the EFI path attempt to unlock NX, rather than just blindly refusing to
boot when CONFIG_REQUIRE_NX is active.

Fixes: fc3090a47b21 ("x86/boot: Clear XD_DISABLE from the early boot path")
Link: https://xcp-ng.org/forum/post/80520
Reported-by: Gene Bright <gene@cyberlight.us>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>
CC: Gene Bright <gene@cyberlight.us>

Note.  Entirely speculative coding, based only on the forum report.
---
 xen/arch/x86/efi/efi-boot.h | 33 ++++++++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 4e4be7174751..158350aa14e4 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -736,13 +736,33 @@ static void __init efi_arch_handle_module(const struct file *file,
     efi_bs->FreePool(ptr);
 }
 
+static bool __init intel_unlock_nx(void)
+{
+    uint64_t val, disable;
+
+    rdmsrl(MSR_IA32_MISC_ENABLE, val);
+
+    disable = val & MSR_IA32_MISC_ENABLE_XD_DISABLE;
+
+    if ( !disable )
+        return false;
+
+    wrmsrl(MSR_IA32_MISC_ENABLE, val & ~disable);
+    trampoline_misc_enable_off |= disable;
+
+    return true;
+}
+
 static void __init efi_arch_cpu(void)
 {
-    uint32_t eax;
+    uint32_t eax, ebx, ecx, edx;
     uint32_t *caps = boot_cpu_data.x86_capability;
 
     boot_tsc_stamp = rdtsc();
 
+    cpuid(0, &eax, &ebx, &ecx, &edx);
+    boot_cpu_data.x86_vendor = x86_cpuid_lookup_vendor(ebx, ecx, edx);
+
     caps[FEATURESET_1c] = cpuid_ecx(1);
 
     eax = cpuid_eax(0x80000000U);
@@ -752,10 +772,17 @@ static void __init efi_arch_cpu(void)
     caps[FEATURESET_e1d] = cpuid_edx(0x80000001U);
 
     /*
-     * This check purposefully doesn't use cpu_has_nx because
+     * These checks purposefully doesn't use cpu_has_nx because
      * cpu_has_nx bypasses the boot_cpu_data read if Xen was compiled
-     * with CONFIG_REQUIRE_NX
+     * with CONFIG_REQUIRE_NX.
+     *
+     * If NX isn't available, it might be hidden.  Try to reactivate it.
      */
+    if ( !boot_cpu_has(X86_FEATURE_NX) &&
+         boot_cpu_data.x86_vendor == X86_VENDOR_INTEL &&
+         intel_unlock_nx() )
+        caps[FEATURESET_e1d] = cpuid_edx(0x80000001U);
+
     if ( IS_ENABLED(CONFIG_REQUIRE_NX) &&
          !boot_cpu_has(X86_FEATURE_NX) )
         blexit(L"This build of Xen requires NX support");
-- 
2.39.2


