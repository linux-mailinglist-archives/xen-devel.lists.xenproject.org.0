Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 680AACB5F46
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 13:57:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184058.1506602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTgEZ-0005Co-Fx; Thu, 11 Dec 2025 12:57:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184058.1506602; Thu, 11 Dec 2025 12:57:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTgEZ-0005Au-DL; Thu, 11 Dec 2025 12:57:27 +0000
Received: by outflank-mailman (input) for mailman id 1184058;
 Thu, 11 Dec 2025 12:57:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oCI8=6R=gmail.com=samaan.dehghan@srs-se1.protection.inumbo.net>)
 id 1vTgEY-0005Ao-80
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 12:57:26 +0000
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [2607:f8b0:4864:20::f2d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f05fd0b8-d690-11f0-b15b-2bf370ae4941;
 Thu, 11 Dec 2025 13:57:25 +0100 (CET)
Received: by mail-qv1-xf2d.google.com with SMTP id
 6a1803df08f44-8823dfa84c5so279826d6.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 04:57:25 -0800 (PST)
Received: from localhost.localdomain
 (host-154-4.mdu.ilcmifre.champaign.il.us.clients.pavlovmedia.net.
 [66.253.154.4]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8886eef8dcbsm22988176d6.37.2025.12.11.04.57.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 11 Dec 2025 04:57:23 -0800 (PST)
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
X-Inumbo-ID: f05fd0b8-d690-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765457844; x=1766062644; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2kjup8IXurSGnJos/cvAZljvqR45Kt88E1lA50HDgVc=;
        b=K4OLfr8Uwz/YMAji2tPZ71jv8OydADlSUqXnJzXSYv7qwqhrfj0sdladJrbxH/n2QC
         tm67EzbURPFpTiHVXj1BIVBjLYOgKMpHJak22TwUSlXGhTQpqU4u33u2ZOTMYZk7JHji
         YD53KXmmqW0LRiHOs9wdZsj/6thyQ0M1M02w/4NMa/4ImUxSy2lXQBu6EQ+isi+boN8L
         63ZKyCkPOGPIIEFZOMmkNmLkgzjVSbS/OGQ1hMITn3eX4fLjc2ntUG3VfEV7e5vzG2Cy
         tdO0yEGvK9arr8Vd+2SGaZ8hUvSnjQF4X5EevnsvQXrh3PF1UY4r5P4MgBwJwmIIWVkt
         +Rlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765457844; x=1766062644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2kjup8IXurSGnJos/cvAZljvqR45Kt88E1lA50HDgVc=;
        b=BVg6qAbat/9KzZrz8zmQTbMRiRXBangqc2SAgX4BA4zGWGCNZHrP3YKz6y5shi9eej
         t7aSUAt5fxNVkLMMexjUmmBFIC/T6R657N8HDVAWBUwCv/R7vW++zPVKQc1Bxq1TJ1nd
         MRkFaLwXz2iUYlMnSZ+pYbloV+aGDMnBHfXlNuOECjdDowmUJyO73aVVNr+BvUg9KRoD
         PIMslfte/UFVNwEmTeY+at2Zt/7cUBNroMZ/c9FgqmYbl/hBtywM7b4le5L/m2s0x1c+
         mL1TAcfCFmHObLZryaZtIIxIVyBYiaRk4ZX8H/I/gnGf6p97AAzMRyKWXNspwjLrN0et
         d9sQ==
X-Gm-Message-State: AOJu0YymFJXcapMPfcWX9GXx6CmvmGWbnTfoRL9QdDo8mgy/7Nzfp9iF
	oPJXLWHQgTBfVPqhxy8WulhOlThiWcEtUwgJjjNsJ9DVVsZMop5WnvRezOUufH4=
X-Gm-Gg: AY/fxX4q0b92hc0qvkYGmwvd8EiWAx9d3jZhcGz10A1xC1OtcC4R9HSwXWDWLBsTJkn
	2Bz8l7xYtL2f9qKXWZIlf9BtzkBptpmKHqEV655/5QBhQaifLk1owXNVeSlo4fnCHqHEL35U5/7
	bvMZ+7Rary600kEAmS5YAS57MXVelyn/QW46PpZMtnbKw1HvxYW6MnYedLI5Nn4xJzYg2JcuK2p
	P6E/kGrbmdViO4IxE52J8VCUNZ/5rFAovdQz9vGeuRr+IHsJSnWoF4fqiUTxhEJ9VINHkyxBc+M
	hS8zwab16wgOC0aVgTk7JS1XGTc+ikPMsxrZ7C9GNUk2KfjZ8+FB0HveE9zxWxYRLWmJWH0otNN
	EnFyCDungibTNSeInS895eVDY7RzlUHAb4oo0OZ/x0KpQfUg1fholcfEowf5iEGioougQfGqB+f
	cmn6BPG6kM52XanUION6UHh5MmUWV35au5Vz/bJjWvzGojvcA66nTMLKU9yhd/OAx6dootKk1JV
	3VAX8lJTn+9+YXLSO50JcjQKIW+4wgQ1aN2e4XyIN4XuLmYUFjFnCJ3BCneE5/M6hOGBNAlO/0Q
	MR2fuC5B
X-Google-Smtp-Source: AGHT+IFlbZxMZNSJQQ3a7Dp2bbpHm+8RnpjrSNjIidhmYd6RGT+TFyrPBZI/z1rvXEaZlhxJxorkog==
X-Received: by 2002:ad4:5cee:0:b0:880:22f3:3376 with SMTP id 6a1803df08f44-88863a215c6mr90575406d6.10.1765457843482;
        Thu, 11 Dec 2025 04:57:23 -0800 (PST)
From: Saman Dehghan <samaan.dehghan@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3] xen/arm64: Add support Clang build on arm64
Date: Thu, 11 Dec 2025 06:57:17 -0600
Message-ID: <fbb12a9b0aede6dcb398a76018c274a5c76ba1fa.1765456914.git.samaan.dehghan@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <bb575726fe0ac783121e563b1c92f81f51e41f75.1765420376.git.samaan.dehghan@gmail.com>
References: <bb575726fe0ac783121e563b1c92f81f51e41f75.1765420376.git.samaan.dehghan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch enables building Xen for the arm64 using the Clang/LLVM compiler.
Changes include:
- Add explicit -march=armv8 flag for arm64 builds.
- Introduce `READ_FP_SYSREG` and `WRITE_FP_SYSREG` to encapsulate the required
  `.arch_extension fp` directive for system fp register access.
- Add ".arch_extension fp" to the inline assembly for `save_state` and
  `restore_state`.

Signed-off-by: Saman Dehghan <samaan.dehghan@gmail.com>
---
 README                   |  2 ++
 xen/arch/arm/arch.mk     |  1 +
 xen/arch/arm/arm64/vfp.c | 30 ++++++++++++++++++++++--------
 3 files changed, 25 insertions(+), 8 deletions(-)

diff --git a/README b/README
index 889a4ea906..67c1aa7fe6 100644
--- a/README
+++ b/README
@@ -45,6 +45,8 @@ provided by your OS distributor:
       - For ARM:
         - GCC 5.1 or later
         - GNU Binutils 2.25 or later
+        or
+        - Clang/LLVM 11 or later
       - For RISC-V 64-bit:
         - GCC 12.2 or later
         - GNU Binutils 2.39 or later
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
index c4f89c7b0e..ea75c7a2b2 100644
--- a/xen/arch/arm/arm64/vfp.c
+++ b/xen/arch/arm/arm64/vfp.c
@@ -6,7 +6,8 @@
 
 static inline void save_state(uint64_t *fpregs)
 {
-    asm volatile("stp q0, q1, [%1, #16 * 0]\n\t"
+    asm volatile(".arch_extension fp\n\t"
+                 "stp q0, q1, [%1, #16 * 0]\n\t"
                  "stp q2, q3, [%1, #16 * 2]\n\t"
                  "stp q4, q5, [%1, #16 * 4]\n\t"
                  "stp q6, q7, [%1, #16 * 6]\n\t"
@@ -27,7 +28,8 @@ static inline void save_state(uint64_t *fpregs)
 
 static inline void restore_state(const uint64_t *fpregs)
 {
-    asm volatile("ldp q0, q1, [%1, #16 * 0]\n\t"
+    asm volatile(".arch_extension fp\n\t"
+                 "ldp q0, q1, [%1, #16 * 0]\n\t"
                  "ldp q2, q3, [%1, #16 * 2]\n\t"
                  "ldp q4, q5, [%1, #16 * 4]\n\t"
                  "ldp q6, q7, [%1, #16 * 6]\n\t"
@@ -46,6 +48,18 @@ static inline void restore_state(const uint64_t *fpregs)
                  : : "Q" (*fpregs), "r" (fpregs));
 }
 
+#define WRITE_FP_SYSREG(v, name) do {                               \
+    uint64_t _r = (v);                                              \
+    asm volatile(".arch_extension fp\n\t"                           \
+                 "msr "__stringify(name)", %0" : : "r" (_r));       \
+} while (0)
+
+#define READ_FP_SYSREG(name) ({                                     \
+    uint64_t _r;                                                    \
+    asm volatile(".arch_extension fp\n\t"                           \
+                 "mrs  %0, "__stringify(name) : "=r" (_r));         \
+    _r; })
+
 void vfp_save_state(struct vcpu *v)
 {
     if ( !cpu_has_fp )
@@ -56,10 +70,10 @@ void vfp_save_state(struct vcpu *v)
     else
         save_state(v->arch.vfp.fpregs);
 
-    v->arch.vfp.fpsr = READ_SYSREG(FPSR);
-    v->arch.vfp.fpcr = READ_SYSREG(FPCR);
+    v->arch.vfp.fpsr = READ_FP_SYSREG(FPSR);
+    v->arch.vfp.fpcr = READ_FP_SYSREG(FPCR);
     if ( is_32bit_domain(v->domain) )
-        v->arch.vfp.fpexc32_el2 = READ_SYSREG(FPEXC32_EL2);
+        v->arch.vfp.fpexc32_el2 = READ_FP_SYSREG(FPEXC32_EL2);
 }
 
 void vfp_restore_state(struct vcpu *v)
@@ -72,8 +86,8 @@ void vfp_restore_state(struct vcpu *v)
     else
         restore_state(v->arch.vfp.fpregs);
 
-    WRITE_SYSREG(v->arch.vfp.fpsr, FPSR);
-    WRITE_SYSREG(v->arch.vfp.fpcr, FPCR);
+    WRITE_FP_SYSREG(v->arch.vfp.fpsr, FPSR);
+    WRITE_FP_SYSREG(v->arch.vfp.fpcr, FPCR);
     if ( is_32bit_domain(v->domain) )
-        WRITE_SYSREG(v->arch.vfp.fpexc32_el2, FPEXC32_EL2);
+        WRITE_FP_SYSREG(v->arch.vfp.fpexc32_el2, FPEXC32_EL2);
 }
-- 
2.49.0


