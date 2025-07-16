Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C99BB076EB
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 15:29:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045187.1415297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc2Bp-0008NU-49; Wed, 16 Jul 2025 13:28:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045187.1415297; Wed, 16 Jul 2025 13:28:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc2Bo-0008Iu-Uv; Wed, 16 Jul 2025 13:28:52 +0000
Received: by outflank-mailman (input) for mailman id 1045187;
 Wed, 16 Jul 2025 13:28:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uFaK=Z5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uc2Bn-00089u-MM
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 13:28:51 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf0109aa-6248-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 15:28:50 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-45629703011so12849915e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 06:28:50 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e8075d6sm21076205e9.16.2025.07.16.06.28.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 06:28:48 -0700 (PDT)
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
X-Inumbo-ID: cf0109aa-6248-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752672529; x=1753277329; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lUKrRD4z8ysA1AG25EoVkKP8oZZDthT1l+2496pCcS8=;
        b=DDur3oEpd47xauNittgyRSrjrbg5qJnB72jv9spWUvPFVC8iyCtIgvYoT4gnJVLfI7
         ECtOvl0ZvW3fXcNKwjzS03pJV//S5Df/QKrOjoRQKP5FRu/WQcI7UhrUYER/JsHNT8Rz
         YMFRtEH2/QRj/m/E8VzHaJa8wvA73gnRNIsTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752672529; x=1753277329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lUKrRD4z8ysA1AG25EoVkKP8oZZDthT1l+2496pCcS8=;
        b=OGaeuYx5mtp/SoC8VJ29LjyFiZfny0/jkHkEXd5Fnlpfmaz/YjcyEU9y3ird8BPgp7
         KmeVhdNgdm3pBvw8bm1VFuWPwS6C6mYyF3Lii/Dx6AE35Al8X71vjLtIs+v3zRRg8ZSb
         xvSz/IlfFLpbqNdNksF4wiWq9oABXnAxRzhFvJgWZGDfjjWbLRvwM74KF3/x1y3AY46M
         Rs/qV7+/LmFfxLMtdFCJBdTP1ulJwsl8gpvEl41tEr6owdcCBOtHezSMisPYXFnQJlki
         g6r2IZoBUqSd1pkoO/991TOuAgooDNLpz1mWf+R2Z4uZYl7Es8lGPWgykOdXXhVbPR3q
         ya9Q==
X-Gm-Message-State: AOJu0YyKvEbnEo9/F0e8OzaRPiuH5omByMYfY7JxOz9vbQ6xPbMCHuBf
	U5DkwjeJHtjT4WL7KfB72vgm/dJSftedH4Ffw0mQ4rH7u+RkhQXAKpCaKVqvmtRc19xNuww7bbC
	YQGBOe38RPA==
X-Gm-Gg: ASbGncs8YncPCjJF3eXez4h+YQppAqBMR0ZMHiPdnRbnH3OfPeFyxq2Fy6e5cFr4d1a
	RzoQpE4goyGZulSAD28sgHNbTRDHuFPynymwBA3+EgZEfg7Bt6XS35inWa0f+As6EcLTu102enS
	TQteSkBkqDtIQsKiJWxnQJiMBUabfC7IZoXvUkA7HrBD3tvqUjcn6hONClckQndumMKoxmMrj4E
	1R4X+igGEyiSH+0BBL5EItLNWQ6Q0ipitr8k5Hly22kmIw4tzAKVvkv0Am822GazFQpw0Vz281R
	0Jlpp6bQtE2hPsXpe6ZUBeHWi05W6inMc4J/4Ls5M+JXoYh6XXogRz3M6+Ca8LWrjki2DEB1b+g
	LL/4LJ9d0ieCyhBeWK25Qf12NnrHLSYwNK7QtTXWYbRdSonUzI36AfOJdGMyzPR+cQroxOCFaj9
	u0
X-Google-Smtp-Source: AGHT+IGme90Uo3hFxf0bgB2TfEI0SpjpAPeoEB0YSNYkXr9ir3vPDZJy+EsxvPoqB66dy7iOMCA5kw==
X-Received: by 2002:a05:600c:a00e:b0:442:d9fc:7de with SMTP id 5b1f17b1804b1-4562eb66b57mr21111015e9.22.1752672529143;
        Wed, 16 Jul 2025 06:28:49 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 3/3] x86/vtd: Switch model check to VFM
Date: Wed, 16 Jul 2025 14:28:43 +0100
Message-Id: <20250716132843.2086965-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250716132843.2086965-1-andrew.cooper3@citrix.com>
References: <20250716132843.2086965-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This form is shorer and more legible.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

As this is the first transformation, an anlysis of the code generation change:

before:
<quirk_iommu_caps>:
	       8b 05 4a 7e 09 00    	mov    0x97e4a(%rip),%eax        # <boot_cpu_data>
	       25 00 ff ff 00       	and    $0xffff00,%eax
	       3d 00 06 01 00       	cmp    $0x10600,%eax
	   /-- 74 0e                	je     <quirk_iommu_caps+0x20>
	/--|-> e9 59 8a dc ff       	jmp    <__x86_return_thunk>
	|  |   66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
	|  |   00 00
	|  \-> 0f b6 05 29 7e 09 00 	movzbl 0x97e29(%rip),%eax        # <boot_cpu_data>
	|      3c 2a                	cmp    $0x2a,%al
	|  /-- 74 04                	je     <quirk_iommu_caps+0x2f>
	|  |   3c 2d                	cmp    $0x2d,%al
	\--|-- 75 e3                	jne    <quirk_iommu_caps+0x12>
	   \-> 48 b8 ff ff ff ff c3 	movabs $0xffffffc3ffffffff,%rax
	       ff ff ff
	       48 21 47 20          	and    %rax,0x20(%rdi)
	       e9 2e 8a dc ff       	jmp    <__x86_return_thunk>

after:
<quirk_iommu_caps>:
	    8b 05 4a 7e 09 00    	mov    0x97e4a(%rip),%eax        # <boot_cpu_data>
	    3d 2a 06 01 00       	cmp    $0x1062a,%eax
	/-- 74 13                	je     <quirk_iommu_caps+0x20>
	|   3d 2d 06 01 00       	cmp    $0x1062d,%eax
	+-- 74 0c                	je     <quirk_iommu_caps+0x20>
	|   e9 57 8a dc ff       	jmp    <__x86_return_thunk>
	|   0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
	\-> 48 b8 ff ff ff ff c3 	movabs $0xffffffc3ffffffff,%rax
	    ff ff ff
	    48 21 47 20          	and    %rax,0x20(%rdi)
	    e9 3d 8a dc ff       	jmp    <__x86_return_thunk>

Previously, GCC managed to merge the "x86_vendor == X86_VENDOR_INTEL && x86 ==
6" condition, but performed a second load for x86_model.

Afterwards, there's a single load, and two compares.

Neither managed to merge the model checks together by playing with bit 2, but
that's something that compilers could learn to and is not suitable to express
at the C level for this kind of logic.

Unrelated to this change, it would be rather better to do `andl $0xc3,
0x24(%rdi)` than to manifest a 64bit constant.
---
 xen/arch/x86/include/asm/cpufeature.h | 2 +-
 xen/drivers/passthrough/vtd/quirks.c  | 7 +++----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
index ba2c1c1c7416..f8b85c0f9520 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -28,7 +28,7 @@
 
 #define VFM_MAKE(v, f, m) (MASK_INSR(v, VFM_VENDOR_MASK) | \
                            MASK_INSR(f, VFM_FAMILY_MASK) | \
-                           MASK_INSR(f, VFM_MODEL_MASK))
+                           MASK_INSR(m, VFM_MODEL_MASK))
 
 #define VFM_MODEL(vfm)  MASK_EXTR(vfm, VFM_MODEL_MASK)
 #define VFM_FAMILY(vfm) MASK_EXTR(vfm, VFM_FAMILY_MASK)
diff --git a/xen/drivers/passthrough/vtd/quirks.c b/xen/drivers/passthrough/vtd/quirks.c
index dc3dac749ce6..0a10a46d90f7 100644
--- a/xen/drivers/passthrough/vtd/quirks.c
+++ b/xen/drivers/passthrough/vtd/quirks.c
@@ -30,6 +30,7 @@
 #include <xen/pci_regs.h>
 #include <xen/keyhandler.h>
 #include <asm/msi.h>
+#include <asm/intel-family.h>
 #include <asm/irq.h>
 #include <asm/pci.h>
 
@@ -630,9 +631,7 @@ void __init quirk_iommu_caps(struct vtd_iommu *iommu)
      * model because the client parts don't expose their IOMMUs as PCI devices
      * we could match with a Device ID.
      */
-    if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL &&
-         boot_cpu_data.x86 == 6 &&
-         (boot_cpu_data.x86_model == 0x2a ||
-          boot_cpu_data.x86_model == 0x2d) )
+    if ( boot_cpu_data.vfm == INTEL_SANDYBRIDGE ||
+         boot_cpu_data.vfm == INTEL_SANDYBRIDGE_X )
         iommu->cap &= ~(0xful << 34);
 }
-- 
2.39.5


