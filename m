Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A874CAE8DC
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 01:39:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181183.1504272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSlk3-00086f-89; Tue, 09 Dec 2025 00:38:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181183.1504272; Tue, 09 Dec 2025 00:38:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSlk3-00084a-5U; Tue, 09 Dec 2025 00:38:11 +0000
Received: by outflank-mailman (input) for mailman id 1181183;
 Tue, 09 Dec 2025 00:38:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N5PS=6P=gmail.com=samaan.dehghan@srs-se1.protection.inumbo.net>)
 id 1vSlk2-00084U-5L
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 00:38:10 +0000
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [2607:f8b0:4864:20::735])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54177241-d497-11f0-9cce-f158ae23cfc8;
 Tue, 09 Dec 2025 01:38:07 +0100 (CET)
Received: by mail-qk1-x735.google.com with SMTP id
 af79cd13be357-8b220ddc189so590080985a.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 16:38:07 -0800 (PST)
Received: from localhost.localdomain
 (host-154-4.mdu.ilcmifre.champaign.il.us.clients.pavlovmedia.net.
 [66.253.154.4]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8b6252a0711sm1143723885a.5.2025.12.08.16.38.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 08 Dec 2025 16:38:05 -0800 (PST)
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
X-Inumbo-ID: 54177241-d497-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765240685; x=1765845485; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7jIAEnht+M7ZKhB06WnNTKtAU7kKn5ahWxbqWONaN48=;
        b=CMvmyeDYRlkQkJPQWuI4mIK4U7KLz7Sb5gt+kJaNNahxF5Ozj9YPPVEM0vWpkDK22Z
         K4uQE+9kBMsH2Bw9rAfOmuKo03TbWMhNEJlcqehTWrMjWmQb2ReaT+ltcTPvHF2VIug5
         mZmHpVKwtkXYuWs33GTQ/vzi/SGoFOl5QMJ708rCl57xObC6jo1Z4VUbn8Eolikx8sXZ
         9kzIFIqRbzwsiMgKEpKEZ4bOTCEx6opVkFwIJ34k43pZ1OSLO7EDP9zL+QofNY3IPHJs
         MxQp98UkKn5WvDAWx82/YDZPHhgQ5JYAED+6pIVqWLcfkQ2XNexCJa0eQAhPI4ovvJ0g
         4ijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765240685; x=1765845485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7jIAEnht+M7ZKhB06WnNTKtAU7kKn5ahWxbqWONaN48=;
        b=mkhN1eN6isrNggVGZMcJ6uAcKFqyd0QbjD62l8Glc7YLMWz1YBB5UzcquIb9zE0GsF
         LRKlDV+WT322h8b0bKVnAVK4nMKot1ZONrmvSAYNEJydu1nc/J9uJ5hyhdX6rUua8qeg
         zBLpEZmzzWr1nptTP7aNY5JapSKBDZaJV698a320LaIsbpJO5ULnElD4flSaBkGjm08n
         mFPJnzh+WRV6El8+5pyN9OiHordXyEE6PFsya5qAZ7RPwnBjnsjVLqlkAxbSUfkN8bZq
         0ro9qHzvjEH8yXqPrJkQsE5+PbXrHdpuGQwtw64NHcq5reuv41h7YIrLVpOQi7NMFB7K
         gllg==
X-Gm-Message-State: AOJu0YxSHfs8X/b66Xyq3FPVCc/g4W/yd7uzjm479UDZLZDj/HUAGK8A
	bmQtqFLN/3prc9LanzHNtQBjhEuF6p3gzCBh0UiyIOczkKe+frPQfpPuk3pJckQ=
X-Gm-Gg: ASbGnctQMrn+hZ9vkmKhVvTAOQuRok1MFh29JCppmv4TuJgdWssDYOrgir5y6lUgfY+
	Fr4H3srR4ASIlYE6BiFeUzryEdfabZeGghD591asA5gpi6lILK3RrhqHbUntHb2J1k+Du6XUTux
	Go9/t5DRqeLF0vOL72oP3y6yTAk8J+rPtfb9Eqxree6eiXocd0J7ZcNsLt87FlJ+pgrlHHGFcwR
	66vVUgdztVmRS+amOb2lpx1rvczookn9hlIwE3EVQXA7BXTSovFoKJQfxkVzXWe5OnOZXyResQm
	z1Cm4uJ2i0KsNqrYw00zMrPtq2LrWFj3LflbMuifyrd+Sx6mxWuKP87Vtv7Tvu69ucOOi9wR6Hg
	rUucs7oWOUU64E+Q2jlrkA7xCUKQYuYhm1W48L/N3q3OBdJxA2T4Ripo0yHR8BBEwFRER56a4UM
	4BN2PEMA7nIqqNAoIc4LceZFZfirdQp44MeW0mtLFfXg5005shtQG7aaS5o/QRrDwynCii5BQNN
	Z4Je33Kd9xyf93hjzkCzWdOk6l3KujltQfVOePONjpq4djb5liBcIPb7t6q5c8gA3GRX87TQA==
X-Google-Smtp-Source: AGHT+IEeEklWujPAByP4dW1pz5tIC02c/9IzYQHwsR8qE/HPnygQ7BhRbG6U9QI6VbYcjVlKyA013A==
X-Received: by 2002:a05:620a:2589:b0:8b2:f1f3:901e with SMTP id af79cd13be357-8b6a23dc96emr1306175185a.65.1765240685536;
        Mon, 08 Dec 2025 16:38:05 -0800 (PST)
From: Saman Dehghan <samaan.dehghan@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm64: Add support Clang build on arm64
Date: Mon,  8 Dec 2025 18:37:57 -0600
Message-ID: <bd6686e7fc0756e929334792b94ddd66bde125c4.1765239102.git.samaan.dehghan@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch enables building Xen on arm64 architecture using the Clang compiler.
Changes include:
- Add explicit -march=armv8 flag for arm64 builds.
- Add `__attribute__((target("fp-armv8")))` to `vfp_save_state` and
  `vfp_restore_state` functions when building with Clang to allow
  FP instructions despite `-mgeneral-regs-only`.

Signed-off-by: Saman Dehghan <samaan.dehghan@gmail.com>
---
 xen/arch/arm/arch.mk     | 1 +
 xen/arch/arm/arm64/vfp.c | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/xen/arch/arm/arch.mk b/xen/arch/arm/arch.mk
index 9c4bedfb3b..bcf548069b 100644
--- a/xen/arch/arm/arch.mk
+++ b/xen/arch/arm/arch.mk
@@ -13,6 +13,7 @@ ifeq ($(CONFIG_MPU),y)
 CFLAGS-$(CONFIG_ARM_64) += -march=armv8-r
 else
 CFLAGS-$(CONFIG_ARM_64) += -mcpu=generic
+CFLAGS-$(CONFIG_ARM_64) += -march=armv8
 endif
 CFLAGS-$(CONFIG_ARM_64) += -mgeneral-regs-only # No fp registers etc
 $(call cc-option-add,CFLAGS-$(CONFIG_ARM_64),CC,-mno-outline-atomics)
diff --git a/xen/arch/arm/arm64/vfp.c b/xen/arch/arm/arm64/vfp.c
index c4f89c7b0e..51fd2ddc54 100644
--- a/xen/arch/arm/arm64/vfp.c
+++ b/xen/arch/arm/arm64/vfp.c
@@ -46,6 +46,9 @@ static inline void restore_state(const uint64_t *fpregs)
                  : : "Q" (*fpregs), "r" (fpregs));
 }
 
+#if defined(CONFIG_CC_IS_CLANG)
+__attribute__((target("fp-armv8")))
+#endif
 void vfp_save_state(struct vcpu *v)
 {
     if ( !cpu_has_fp )
@@ -62,6 +65,9 @@ void vfp_save_state(struct vcpu *v)
         v->arch.vfp.fpexc32_el2 = READ_SYSREG(FPEXC32_EL2);
 }
 
+#if defined(CONFIG_CC_IS_CLANG)
+__attribute__((target("fp-armv8")))
+#endif
 void vfp_restore_state(struct vcpu *v)
 {
     if ( !cpu_has_fp )
-- 
2.49.0


