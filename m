Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6098845AC2
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 16:00:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674481.1049429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVYXn-0000JA-Bt; Thu, 01 Feb 2024 14:59:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674481.1049429; Thu, 01 Feb 2024 14:59:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVYXn-0000GJ-9D; Thu, 01 Feb 2024 14:59:59 +0000
Received: by outflank-mailman (input) for mailman id 674481;
 Thu, 01 Feb 2024 14:59:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fxIb=JK=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1rVYXm-0000Ez-FD
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 14:59:58 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 907b3e74-c112-11ee-8a43-1f161083a0e0;
 Thu, 01 Feb 2024 15:59:57 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40eac352733so9228695e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 06:59:57 -0800 (PST)
Received: from fziglio-xenia-fedora.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 t12-20020a05600c450c00b0040d5ae2906esm4737894wmo.30.2024.02.01.06.59.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Feb 2024 06:59:56 -0800 (PST)
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
X-Inumbo-ID: 907b3e74-c112-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1706799597; x=1707404397; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wUDi3+dPODjB9qZn1Kktd29eMC32bAroiLdFB6ZmDys=;
        b=K3/SWa1s4kczFXdltkie+9Xp2m8lRB8OPL9lEVfs1vpo+ZOZv2+wFEGSVq0Tdsyoqk
         unAOWIhHzgpH9DLEM1jpkTE3TCN3TEyvnNIwYqchGzPw3OZQrCYOp792H8soevgDgA+m
         23bL7VS37+Otn7I03yuniVsQXmP35zg0yh21s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706799597; x=1707404397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wUDi3+dPODjB9qZn1Kktd29eMC32bAroiLdFB6ZmDys=;
        b=GZUJA2t+HM3JSmHZYG0LabJYyH2OmfMXubI3+ybGGh1IqfEundjlq4pXEOuG2qQuh+
         YQTD5sF26Sm3dWgEyPYZX6MVoqrTirzsyB274UxP4uDUI5j30BdpGPZNxrKO+j5ge85U
         uvXtJ7CKc9mCy0+ICXe69Dp/54yOVhmRB3UXxZrr6hN3AgN6OKemogHwHUTwEC53SoVQ
         Q7rUlBGNueXvRAi/CiU+Lw2fdaC0R/OXn8jW+hW30Hjg3k1hEj0wJvaNBGcn1/xk/Zmo
         Ar01vId1/dVnNmqIiLUCthOfhAItOTgiGQkJnuddcgJTVibPFYFyX/ifIQRsw3KetakJ
         Wv3g==
X-Gm-Message-State: AOJu0YwUJoMfea7Y/Ha6xVeO81rtbpgLulsJQY2dDPGGg6UVud4olB57
	pLaESkloJjXvvUQKSFuonOhK8Z2cbAZRGWtxZQVm9WzrBRibR9bZwuDPNOVX3D7wp9inIITrkma
	I
X-Google-Smtp-Source: AGHT+IGKXDSVancIaYJuUcE2eBx3guV9apdjao5cLNe+I/ZxtXIKceERhfuR5AI+XVeftejihKvdCg==
X-Received: by 2002:a05:600c:314f:b0:40e:4806:f436 with SMTP id h15-20020a05600c314f00b0040e4806f436mr3815617wmo.3.1706799596826;
        Thu, 01 Feb 2024 06:59:56 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUxxooJNPYJ9HJDdLtqIfzjdUuPvjPLr5HQUUTc2xl5zqJiCxdFIyWrnfY+BxsDrFMtGoSnUGK1LSuOL/tCV3h+VGrq+Tz8r+qulh9KkT9uQIMG+/JmRQvr3H9vcSSRU6emzqDG
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: George Dunlap <george.dunlap@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Frediano Ziglio <frediano.ziglio@cloud.com>
Subject: [PATCH] Fix some typos in comments
Date: Thu,  1 Feb 2024 14:59:43 +0000
Message-ID: <20240201145943.738531-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 arch/x86/include/arch/processor.h | 2 +-
 include/xen/hvm/params.h          | 2 +-
 include/xtf/console.h             | 2 +-
 include/xtf/extable.h             | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/arch/processor.h b/arch/x86/include/arch/processor.h
index 0c33545..1c7e655 100644
--- a/arch/x86/include/arch/processor.h
+++ b/arch/x86/include/arch/processor.h
@@ -101,7 +101,7 @@
 #define X86_EXC_TS            10 /* Invalid TSS. */
 #define X86_EXC_NP            11 /* Segment Not Present. */
 #define X86_EXC_SS            12 /* Stack-Segment Fault. */
-#define X86_EXC_GP            13 /* General Porection Fault. */
+#define X86_EXC_GP            13 /* General Protection Fault. */
 #define X86_EXC_PF            14 /* Page Fault. */
 #define X86_EXC_SPV           15 /* PIC Spurious Interrupt Vector. */
 #define X86_EXC_MF            16 /* Maths fault (x87 FPU). */
diff --git a/include/xen/hvm/params.h b/include/xen/hvm/params.h
index 886b986..0b7c05b 100644
--- a/include/xen/hvm/params.h
+++ b/include/xen/hvm/params.h
@@ -1,5 +1,5 @@
 /*
- * Xen public hvm paramter index
+ * Xen public hvm parameter index
  */
 
 #ifndef XEN_PUBLIC_HVM_PARAMS_H
diff --git a/include/xtf/console.h b/include/xtf/console.h
index caec790..16a6a23 100644
--- a/include/xtf/console.h
+++ b/include/xtf/console.h
@@ -11,7 +11,7 @@
 typedef void (*cons_output_cb)(const char *buf, size_t len);
 
 /*
- * Register a console callback.  Several callbacks can be registered for usful
+ * Register a console callback.  Several callbacks can be registered for useful
  * destinations of console text.
  */
 void register_console_callback(cons_output_cb cb);
diff --git a/include/xtf/extable.h b/include/xtf/extable.h
index e93331e..0668b7d 100644
--- a/include/xtf/extable.h
+++ b/include/xtf/extable.h
@@ -4,8 +4,8 @@
  * Exception table support.
  *
  * Allows code to tag an instruction which might fault, and where to jump to
- * in order to recover.  For more complicated recovery, a cusom handler
- * handler can be registerd.
+ * in order to recover.  For more complicated recovery, a custom handler
+ * can be registered.
  */
 #ifndef XTF_EXTABLE_H
 #define XTF_EXTABLE_H
-- 
2.43.0


