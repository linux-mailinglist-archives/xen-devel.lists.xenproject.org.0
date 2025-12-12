Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CD9CB99CB
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 20:00:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1185680.1507711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vU8NT-00022x-F1; Fri, 12 Dec 2025 19:00:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1185680.1507711; Fri, 12 Dec 2025 19:00:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vU8NT-0001w0-9h; Fri, 12 Dec 2025 19:00:31 +0000
Received: by outflank-mailman (input) for mailman id 1185680;
 Fri, 12 Dec 2025 19:00:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SbWK=6S=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vU8NR-0001RM-TQ
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 19:00:29 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d10319c6-d78c-11f0-9cce-f158ae23cfc8;
 Fri, 12 Dec 2025 20:00:25 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4779a637712so11208865e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 12 Dec 2025 11:00:25 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f4af065sm16863975e9.6.2025.12.12.11.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Dec 2025 11:00:23 -0800 (PST)
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
X-Inumbo-ID: d10319c6-d78c-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1765566024; x=1766170824; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4dLK03IrT6Fyyeaqxy4fKDrRO6QQiKG3aEO82LTQDBc=;
        b=D0DFeOHz+JHF3DSVjfwdtjAHxp43jPaDtEPIoZ3hM3QLFnKLlR1XlWQ/mmvEQPdUJl
         z2KWJGjHcGjXRJsvuMzjhjYW8QujwBFcA33KVvqrEUCGwvTtcKH2RDIKr5Jmk/ybBwFc
         IC2oepPvhDgl51/njtYsfKCj1+BjbEHvMysnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765566024; x=1766170824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4dLK03IrT6Fyyeaqxy4fKDrRO6QQiKG3aEO82LTQDBc=;
        b=fDzDeWnBWXZXdWNr9yPC5WrOjRNAaktsf8JO6XCFGRTjXzK8gBtIqoJmc945sKJ0/1
         dp/esJM/gVa+L7PMofx1NvvFzMog/od1dgxdeZJyIQusQGPA+NL4T3mF6oA50PUazDTB
         ZVWNnYsryMchAxilY9T0811iY4Atuxxp9afw+zNRGk9ebHr43drqYRgIaut5+XW5zqW2
         xHp+F0LHwMYTJgXYNkafnJvTkfn6ZyESh28qCmYx1VLsVt/6oxdJ/SoWzH1jE+yYt+qx
         Y4OxdZO/d2Q/zI0OjlytypK7edrfdZtF6EmHNQCHv+TVIEhojMTILmzynDSEKSLWzD/E
         9BhA==
X-Gm-Message-State: AOJu0YwQ9Es3a0Xaagw2VD+LPsCgVOJW7kevZ1kAPIogLuTF8ILAvBMc
	2zFGvQRa3Lk7zv4M3riMdvAfVDkJ9CE4uI1ph6K39xOXLbhsbJwhT0XVLj3RGrRGty7EZwpMK0b
	d8Ah7
X-Gm-Gg: AY/fxX4ar+fMqZisuIeL5Ln7Hw5RpojRu7JTwLTqUsVHsFeNDVYbWKxvCTMQjpDax7x
	BDYBtqjrSuH58QVdNypGBVjTNSZuiE8THxAa6hai9ouAoIOCy3/ZiyyiguFSPDlnO40cPYmfFTl
	UDb6LG6C6QYs8WeOA44HWL+KGyq4Q+Kos4Mqn5iT6b4qCRZkQwTzdHpraE6D7g01zRyHSYhPwsA
	I5moabl0mjFjsxouoQ+sdTnobz5u5RGwidVlB54XyFxW8Fsmy2oPu5IhHFrbx5MpJkBsSXNQdas
	TJlop0LkDJP+uL5NDv4rFU+lIb10RFJz3SQ6x/8SDRnfeipR0cwQyuXS3u7aKqZKcTHhD2hMOJA
	Px4Q779SnJYdUiZ9WU5QCQccqpDefy0klfDjyDKyI5uT6juvtBDh6g2N33G0CZ4HwueRyslw3lb
	Ss56L2MK2tqASKdxLpLHh6eEV0ATtEw8LnCHL/B5b4Xi/gct6bYcHYCR8hg72cIQ==
X-Google-Smtp-Source: AGHT+IFSu+4j4uKTL7ZzLVe4hYU2KGDe/v8kpe17wS59/wud3nTCjaYW2CY1kTFKgicub3chQXPY0Q==
X-Received: by 2002:a05:600c:8b67:b0:471:14af:c715 with SMTP id 5b1f17b1804b1-47a8f8a6d83mr25900215e9.3.1765566024307;
        Fri, 12 Dec 2025 11:00:24 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 2/5] x86/svm: Move svm_intercept_msr() into svm.h
Date: Fri, 12 Dec 2025 19:00:17 +0000
Message-Id: <20251212190020.2570076-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251212190020.2570076-1-andrew.cooper3@citrix.com>
References: <20251212190020.2570076-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The single user of svm_intercept_msr() outside of the main svm logic is in
vpmu_amd.c.  Currently the declaration is picked up transitively through
xen/sched.h, so include asm/hvm/svm.h explicitly.

Sort the headers while doing so.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/vpmu_amd.c             | 5 ++++-
 xen/arch/x86/include/asm/hvm/svm.h      | 8 ++++++++
 xen/arch/x86/include/asm/hvm/svm/vmcb.h | 8 --------
 3 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/cpu/vpmu_amd.c b/xen/arch/x86/cpu/vpmu_amd.c
index a6117dfebf2a..fa157d45dd01 100644
--- a/xen/arch/x86/cpu/vpmu_amd.c
+++ b/xen/arch/x86/cpu/vpmu_amd.c
@@ -13,10 +13,13 @@
 #include <xen/err.h>
 #include <xen/sched.h>
 #include <xen/xenoprof.h>
+
 #include <asm/apic.h>
-#include <asm/vpmu.h>
 #include <asm/hvm/save.h>
+#include <asm/hvm/svm.h>
 #include <asm/hvm/vlapic.h>
+#include <asm/vpmu.h>
+
 #include <public/pmu.h>
 
 #define MSR_F10H_EVNTSEL_GO_SHIFT   40
diff --git a/xen/arch/x86/include/asm/hvm/svm.h b/xen/arch/x86/include/asm/hvm/svm.h
index 4eeeb25da90c..a6d7e4aed3b1 100644
--- a/xen/arch/x86/include/asm/hvm/svm.h
+++ b/xen/arch/x86/include/asm/hvm/svm.h
@@ -57,4 +57,12 @@ static inline bool cpu_has_svm_feature(unsigned int feat)
 #define cpu_has_svm_sss       cpu_has_svm_feature(SVM_FEATURE_SSS)
 #define cpu_has_svm_spec_ctrl cpu_has_svm_feature(SVM_FEATURE_SPEC_CTRL)
 
+#define MSR_INTERCEPT_NONE    0
+#define MSR_INTERCEPT_READ    1
+#define MSR_INTERCEPT_WRITE   2
+#define MSR_INTERCEPT_RW      (MSR_INTERCEPT_WRITE | MSR_INTERCEPT_READ)
+void svm_intercept_msr(struct vcpu *v, uint32_t msr, int flags);
+#define svm_disable_intercept_for_msr(v, msr) svm_intercept_msr((v), (msr), MSR_INTERCEPT_NONE)
+#define svm_enable_intercept_for_msr(v, msr) svm_intercept_msr((v), (msr), MSR_INTERCEPT_RW)
+
 #endif /* __ASM_X86_HVM_SVM_H__ */
diff --git a/xen/arch/x86/include/asm/hvm/svm/vmcb.h b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
index 41bcc9f0d862..d1e200df564c 100644
--- a/xen/arch/x86/include/asm/hvm/svm/vmcb.h
+++ b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
@@ -42,14 +42,6 @@ struct svm_vcpu {
     uint64_t guest_sysenter_eip;
 };
 
-#define MSR_INTERCEPT_NONE    0
-#define MSR_INTERCEPT_READ    1
-#define MSR_INTERCEPT_WRITE   2
-#define MSR_INTERCEPT_RW      (MSR_INTERCEPT_WRITE | MSR_INTERCEPT_READ)
-void svm_intercept_msr(struct vcpu *v, uint32_t msr, int flags);
-#define svm_disable_intercept_for_msr(v, msr) svm_intercept_msr((v), (msr), MSR_INTERCEPT_NONE)
-#define svm_enable_intercept_for_msr(v, msr) svm_intercept_msr((v), (msr), MSR_INTERCEPT_RW)
-
 #endif /* ASM_X86_HVM_SVM_VMCS_H__ */
 
 /*
-- 
2.39.5


