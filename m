Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 271A4938D61
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 12:19:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761606.1171596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVq7z-0001A2-P4; Mon, 22 Jul 2024 10:18:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761606.1171596; Mon, 22 Jul 2024 10:18:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVq7z-000166-L3; Mon, 22 Jul 2024 10:18:47 +0000
Received: by outflank-mailman (input) for mailman id 761606;
 Mon, 22 Jul 2024 10:18:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QQNa=OW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sVq7y-00013j-3Q
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 10:18:46 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5efc5b3-4813-11ef-bbfe-fd08da9f4363;
 Mon, 22 Jul 2024 12:18:44 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5a79df5af51so1374847a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 03:18:43 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c7e3f58sm407102766b.91.2024.07.22.03.18.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 03:18:41 -0700 (PDT)
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
X-Inumbo-ID: c5efc5b3-4813-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721643522; x=1722248322; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/QKJsQNAmFzDOmpC8mDlS8GMG5f8sJI2cCIThV9VYDI=;
        b=aeTl2CwW/uD/WmQH+xOOyfbVHGa0eM9GJpK8uF4OvKiY5EzkYfMlJlmf4uvPx6LV2x
         YziQd+RUIWMFK/xfvAnZmmSCk27FP3vZhB/Eyq/EIvKbb5WRNMn/QPsDYj9jNuzBkRgf
         8MWk9pb4dUwV+kA8h1I9XlbJAOc0LYo1JUxvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721643522; x=1722248322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/QKJsQNAmFzDOmpC8mDlS8GMG5f8sJI2cCIThV9VYDI=;
        b=Ekyevv86yvqRrN3Xwbu/ttDHLefr/qxZbNIaAF2YXlOeQkUrpAj7kaVUhUQip5d5uz
         Jp9PUQKYpyjgQC/3x2uaAZWYXZr8iRvwh/uO3BpuSTTtRba5GSb6R/wi+/rDSXgQ+X1/
         vmlQEPl2x4GdtKbBja85ZSBwGJvyDG2DhnT3VV3CrSCKyaBC18LFoVxviKyawxr22yWn
         6AREGxDZP1fvvConUir5uS56+Udq+YE+dwKbIa3PVthDZYWXd9m4150jAkmMzMoyKv3y
         klWizK7HGTXrEFOFwwE4X3VzVvnAIi8Xtjo5JcySW+AeDAtzm4o+WGDAEKk4mJk5B73a
         Qliw==
X-Gm-Message-State: AOJu0YzQJAegzmXuF/1JVg47f6kJPikXVVYYNqcr8zliFVBH2QJWUGWN
	xYZ2ML/k8LKUeIOM4MLiivW4ZOM3gFfNP+uo2lh/Lj/VEZq1OqQx3dkZDz7VNPl3tdGzVOsbAVg
	G
X-Google-Smtp-Source: AGHT+IGSmTPLcV//bA3oPlRIm1NtWI/Uwk4fSOuGpXrOYIbhVm0bLIpEbMMgGVILyLMLDgSuaAMPwg==
X-Received: by 2002:a17:906:164e:b0:a6f:e0f0:d669 with SMTP id a640c23a62f3a-a7a0f10fd8cmr1232480066b.12.1721643522651;
        Mon, 22 Jul 2024 03:18:42 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Gene Bright <gene@cyberlight.us>
Subject: [PATCH 1/2] x86/efi: Simplify efi_arch_cpu() a little
Date: Mon, 22 Jul 2024 11:18:37 +0100
Message-Id: <20240722101838.3946983-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240722101838.3946983-1-andrew.cooper3@citrix.com>
References: <20240722101838.3946983-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Make the "no extended leaves" case fatal and remove one level of indentation.
Defer the max-leaf aquisition until it is first used.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>
CC: Gene Bright <gene@cyberlight.us>
---
 xen/arch/x86/efi/efi-boot.h | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index f282358435f1..4e4be7174751 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -738,29 +738,30 @@ static void __init efi_arch_handle_module(const struct file *file,
 
 static void __init efi_arch_cpu(void)
 {
-    uint32_t eax = cpuid_eax(0x80000000U);
+    uint32_t eax;
     uint32_t *caps = boot_cpu_data.x86_capability;
 
     boot_tsc_stamp = rdtsc();
 
     caps[FEATURESET_1c] = cpuid_ecx(1);
 
-    if ( (eax >> 16) == 0x8000 && eax > 0x80000000U )
-    {
-        caps[FEATURESET_e1d] = cpuid_edx(0x80000001U);
+    eax = cpuid_eax(0x80000000U);
+    if ( (eax >> 16) != 0x8000 || eax < 0x80000000U )
+        blexit(L"In 64bit mode, but no extended CPUID leaves?!?");
 
-        /*
-         * This check purposefully doesn't use cpu_has_nx because
-         * cpu_has_nx bypasses the boot_cpu_data read if Xen was compiled
-         * with CONFIG_REQUIRE_NX
-         */
-        if ( IS_ENABLED(CONFIG_REQUIRE_NX) &&
-             !boot_cpu_has(X86_FEATURE_NX) )
-            blexit(L"This build of Xen requires NX support");
+    caps[FEATURESET_e1d] = cpuid_edx(0x80000001U);
 
-        if ( cpu_has_nx )
-            trampoline_efer |= EFER_NXE;
-    }
+    /*
+     * This check purposefully doesn't use cpu_has_nx because
+     * cpu_has_nx bypasses the boot_cpu_data read if Xen was compiled
+     * with CONFIG_REQUIRE_NX
+     */
+    if ( IS_ENABLED(CONFIG_REQUIRE_NX) &&
+         !boot_cpu_has(X86_FEATURE_NX) )
+        blexit(L"This build of Xen requires NX support");
+
+    if ( cpu_has_nx )
+        trampoline_efer |= EFER_NXE;
 }
 
 static void __init efi_arch_blexit(void)
-- 
2.39.2


