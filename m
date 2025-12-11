Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 830B9CB6DB1
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 19:05:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184492.1506917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTl1y-0004b2-Al; Thu, 11 Dec 2025 18:04:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184492.1506917; Thu, 11 Dec 2025 18:04:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTl1y-0004Yo-81; Thu, 11 Dec 2025 18:04:46 +0000
Received: by outflank-mailman (input) for mailman id 1184492;
 Thu, 11 Dec 2025 18:04:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oCI8=6R=gmail.com=samaan.dehghan@srs-se1.protection.inumbo.net>)
 id 1vTl1w-0004Yg-EC
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 18:04:44 +0000
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [2607:f8b0:4864:20::82a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd86614a-d6bb-11f0-9cce-f158ae23cfc8;
 Thu, 11 Dec 2025 19:04:41 +0100 (CET)
Received: by mail-qt1-x82a.google.com with SMTP id
 d75a77b69052e-4ee4c64190cso2611601cf.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 10:04:41 -0800 (PST)
Received: from wirelessprv-10-195-113-235.near.illinois.edu
 (mobile-130-126-255-145.near.illinois.edu. [130.126.255.145])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4f1bd6b504csm23434601cf.19.2025.12.11.10.04.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 11 Dec 2025 10:04:39 -0800 (PST)
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
X-Inumbo-ID: dd86614a-d6bb-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765476280; x=1766081080; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+vYfskH8zOcau01PfYhVtuVtrctZjdSbs9m0dZHvRNg=;
        b=BcN6o0v0V4ZV1XcIX7p9c/If2mqla1JowdrPoS62mCDqlKYCTkgCKwx5EwiAEoJS5k
         PjGAJmliTDcwY6z1/yTzOfFiTumUBtDEfOoB9KbsFOvn7Q3jrBfLzZYpjxq/AN/z4lXE
         6L/3XimOy5aM0Ko3Dthd6kPbeoC6MAMjnm4PGitO8mJp5hvHGxuCgAT9BkK0d2lIFoPX
         qO3AbsB1X+kOGzIQgBB5der9LluA0X6aXcBTIZcG4+RWxE9yMNXBxEfBA6i0VCPUHhYY
         OaA9cfAZXGgWZM7/h8a7jvISg06Vrji8rfCb9Ewx14kX+Qk/Z2upumMOj14EC6aDlG8Q
         5xFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765476280; x=1766081080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+vYfskH8zOcau01PfYhVtuVtrctZjdSbs9m0dZHvRNg=;
        b=PK8SydZVvyjZo/aY15ScUTA8sTpq3F/EtztSp+tUZUHyizTsp4bSxLOuHYDVTKujQL
         bQ8Jalr6aVVIVCsWw+bGA6JjcRuj7nrochT6v1Cp2x2qpDNib2er6+sTsYIAVMmxtf8g
         45NNyCaIKiBYTyU69FQwBEOiHbFlPqUarYVBcw2eucRjh6pzoW+Vkv06LqF3+YUA25QB
         51tJ8TWFzoPCtfB5Nng05WupyMxBlSpWgiSTrlYbZTY9jBKRaMx9zeks4cjjrLPqQFXQ
         GFCpAqFRpktPA9ls+EE42/rt0tA6sZcYp4tU852Sch1C3MDCHjvIP0WywZTtfddGVCkd
         OJ3g==
X-Gm-Message-State: AOJu0YztHNc89d6Ol/2U00L0zGkqKMBBI4glbRyx9ynP4XIVaOSlBxCD
	7kgyPLFnUxv8DJgwzHSDB6OfNcjYuRaq1xMBsHnMKmnSQskzwqXejAAguLxTLk8=
X-Gm-Gg: AY/fxX5ZmayndShyu7IDDMfeHbWpy+GLmttmfo+5Si87Ec0u8qyR8NNOR47fhEb0/l+
	YF2yemYuvPB21UsTszHyN8iCe2nIc/8ipwKgm7gEc+GalwB9XhEHihzHT3vUbst2eD5Ap5gPfPo
	5fLHRiHlID7FOxVRMfsispat1VtpwqG4xbNmj5sEn94sgQ5YAu+HNx3bb0imty1Dj3yospcJ6RX
	74eTnZn9DDlK1Zq7exxweiSNCpvHG42P7vBkWYsQ5Mv6HtehXrfJIaPqL3/0JR+58oAMNBM6Q/6
	sRdx+LiMqQlz3mZWfQsJA84C1VYAJhurHh/Eb+f0xx5Lh+0kB0y3Tso3LVdShSoFV6lXXN166Tr
	0oDerJzSnFIt4o0bFNJDA/ttRD5F/+Y2b90b6RJ1XWz5tLRkcgVhamKHm6jfm8HbkwKF8rwQ2cZ
	oqz1IaWr9XJy7ZB2VImLL72RZTQ89GKfgWsBZd3EqQoNNYU0zrrq34T2JPJm/VfB8LgQ8pq4ctl
	U+5b2OcvR5SagPWm/4hW9mAQqKLT4R3ugau7Y0CFLrjFkcmVMhKUyVjZsjZAG4ziLa/grqUBt68
	U0vpYSwjOp98yfHrgQ==
X-Google-Smtp-Source: AGHT+IEuzUeFlSeeWruvyRUPMGsquOlx9fbmGJ6QYyIBtGJ3wM1PXPXuFYGbaYpCGdSvwxgae6RopA==
X-Received: by 2002:a05:622a:ca:b0:4ee:28b8:f110 with SMTP id d75a77b69052e-4f1b19d4bc0mr105700091cf.29.1765476280240;
        Thu, 11 Dec 2025 10:04:40 -0800 (PST)
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
Subject: [PATCH v4] xen/arm64: Add support Clang build on arm64
Date: Thu, 11 Dec 2025 12:04:34 -0600
Message-ID: <da1f2ca7a651a5c482a68f6a4377250fcbbce715.1765465950.git.samaan.dehghan@gmail.com>
X-Mailer: git-send-email 2.49.0
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
 xen/arch/arm/arm64/vfp.c | 34 ++++++++++++++++++++++++++--------
 3 files changed, 29 insertions(+), 8 deletions(-)

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
index c4f89c7b0e..cd5c97cfd0 100644
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
@@ -22,12 +23,14 @@ static inline void save_state(uint64_t *fpregs)
                  "stp q26, q27, [%1, #16 * 26]\n\t"
                  "stp q28, q29, [%1, #16 * 28]\n\t"
                  "stp q30, q31, [%1, #16 * 30]\n\t"
+                 ".arch_extension nofp\n\t"
                  : "=Q" (*fpregs) : "r" (fpregs));
 }
 
 static inline void restore_state(const uint64_t *fpregs)
 {
-    asm volatile("ldp q0, q1, [%1, #16 * 0]\n\t"
+    asm volatile(".arch_extension fp\n\t"
+                 "ldp q0, q1, [%1, #16 * 0]\n\t"
                  "ldp q2, q3, [%1, #16 * 2]\n\t"
                  "ldp q4, q5, [%1, #16 * 4]\n\t"
                  "ldp q6, q7, [%1, #16 * 6]\n\t"
@@ -43,9 +46,24 @@ static inline void restore_state(const uint64_t *fpregs)
                  "ldp q26, q27, [%1, #16 * 26]\n\t"
                  "ldp q28, q29, [%1, #16 * 28]\n\t"
                  "ldp q30, q31, [%1, #16 * 30]\n\t"
+                 ".arch_extension nofp\n\t"
                  : : "Q" (*fpregs), "r" (fpregs));
 }
 
+#define WRITE_FP_SYSREG(v, name) do {                   \
+     uint64_t _r = (v);                                 \
+     asm volatile(".arch_extension fp\n\t"              \
+                  "msr "__stringify(name)", %0\n\t"     \
+                  ".arch_extension nofp" : : "r" (_r)); \
+} while (0)
+
+#define READ_FP_SYSREG(name) ({                         \
+     uint64_t _r;                                       \
+     asm volatile(".arch_extension fp\n\t"              \
+                  "mrs  %0, "__stringify(name)"\n\t"    \
+                  ".arch_extension nofp" : "=r" (_r));  \
+_r; })
+
 void vfp_save_state(struct vcpu *v)
 {
     if ( !cpu_has_fp )
@@ -56,10 +74,10 @@ void vfp_save_state(struct vcpu *v)
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
@@ -72,8 +90,8 @@ void vfp_restore_state(struct vcpu *v)
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


