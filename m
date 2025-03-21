Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE74CA6BF92
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 17:18:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.924275.1327553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvf4M-0003kK-M5; Fri, 21 Mar 2025 16:18:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 924275.1327553; Fri, 21 Mar 2025 16:18:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvf4M-0003iR-J9; Fri, 21 Mar 2025 16:18:02 +0000
Received: by outflank-mailman (input) for mailman id 924275;
 Fri, 21 Mar 2025 16:18:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lMoj=WI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tvf4L-0003iL-I8
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 16:18:01 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f62aff11-066f-11f0-9ffa-bf95429c2676;
 Fri, 21 Mar 2025 17:17:19 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5e6f4b3ebe5so3727508a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 21 Mar 2025 09:17:19 -0700 (PDT)
Received: from fedora.. (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ebccfb4471sm1596006a12.47.2025.03.21.09.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Mar 2025 09:17:17 -0700 (PDT)
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
X-Inumbo-ID: f62aff11-066f-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742573838; x=1743178638; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SZzyajWiW/Z/3tgYFJ64xmugqH4ILb34Uv95ykdmDZA=;
        b=FmG/jzqwQRD+EGqHVALAvEvhLr8RIDWfGX1z1x/Ca5Es0BLiSDQqZ5S2hi2tU3/weo
         QB42/V665dCKYCvdIrjukBsgXtXk8jFMTQ8VQwlEtlBfnrja4ZE3sanwqMLKmPqtXIMF
         MNgD/DWI0+JJaKKfQ6huUFsjWBW80Rw5k7GVmGjSavPSGm0BXu+ZtX1csbmsupqbWCI2
         6WApGLy0uCc76XX7cF8CbZcztBRzcKhzhiRNtD1niPXN0CUUXbj+hAgNHGhL6NHzYsIT
         kiAkv0mR2Bcqb9HnJ3clflyx8+a05uzqWw8JO6FaZKWkYIcsf50rP438AVQc/3TMn33d
         irVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742573838; x=1743178638;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SZzyajWiW/Z/3tgYFJ64xmugqH4ILb34Uv95ykdmDZA=;
        b=E/Ja0yQGZBrUGILSd54l5z4bqU2QxBESm1WnSSSwdPu0GXqvF20wwZymkzJ3wGzQOu
         2YQq8d9TX5uI/V7abnC/1EMVGONb+/8txExoLg/kLNLUOEq9QkchGP6UzXqvH7wIhcXo
         mMjEVs95uJF7JwOD+wbPbRYNsh7yxG/8NRCPDcnXq2hmPbuXodMG9ziyIfRLkfJrvESz
         uzuZUCP8JfyqzFpNe1C13OmnPh9l2Ej+QTnYVebtsHwE5RUlFXREdfK9ESwK9xcKufof
         Ifqsx6dnDfyML51ultAsPRiBzVLMLYmR27isE3/EeefSVwkoTfdU0VaAtFnxEUXZ9ARv
         M7sg==
X-Gm-Message-State: AOJu0YzJmZo0M+QIW8EwxAUKqYdtiycOR2U4H0BSUB5toXatKRGuB6Mr
	e9lYYl3INEGSWfomzPExJ6pKSibCYbIRUPnG9YTCfkpSFV1y2m4lzeCr4Q==
X-Gm-Gg: ASbGncvwqD2CvQDNBuiASnebelBcfJ5PPeFnNY3gNZElz2b6W/Le8Kfzs/Vn4ELa/KE
	/eeLLpfRkUIoQ0ZbPQNpVBNosguON3vmewUxptbQbIN55+304jFM0kQtECcAUaM/6Q9SLXkz5fS
	XSHQNO0DrK1KRJJjRlPsYcf5eObxd6Gks0mEnmDgnMiWh8bEScPuGOfuE4j1RSOj5z8gvf40wIc
	segGiam6pJglWjRWSG1zbynu3FYHgHHeaR/BmLuYbSjiN1sfW30KpLzbjv1I1oqTjfWaqQnblUV
	YcmGs+okBL+41BjG+4bn62629ITgST616UPxGZvhFQkf+p4QQg5n4h4Nw1u+heBcbxxFYebAyki
	Cv2ppokz/duPow1Qjf+orlRJO
X-Google-Smtp-Source: AGHT+IFrXfezooAuRdb8t6XIiQhwniKeEYXtqShxtBBudT5xqNcQ0D5dk+xycWqKI7n+SAqQXl/Low==
X-Received: by 2002:a05:6402:3584:b0:5e8:bf2b:a5ab with SMTP id 4fb4d7f45d1cf-5ebcd4f3852mr3605725a12.25.1742573837878;
        Fri, 21 Mar 2025 09:17:17 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Milan Djokic <milandjokic1995@gmail.com>,
	Slavisa Petrovic <Slavisa.Petrovic@rt-rk.com>
Subject: [PATCH v2] xen/riscv: add H extenstion to -march
Date: Fri, 21 Mar 2025 17:17:14 +0100
Message-ID: <0a072ab36b54ea7c4f9a6f94465fb7b79f9f49b2.1742573085.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

H provides additional instructions and CSRs that control the new stage of
address translation and support hosting a guest OS in virtual S-mode
(VS-mode).

According to the Unprivileged Architecture (version 20240411) specification:
```
Table 74 summarizes the standardized extension names. The table also defines
the canonical order in which extension names must appear in the name string,
with top-to-bottom in table indicating first-to-last in the name string, e.g.,
RV32IMACV is legal, whereas RV32IMAVC is not.
```
According to Table 74, the h extension is placed last in the one-letter
extensions name part of the ISA string.

`h` is a standalone extension based on the patch [1] but it wasn't so
before.
As the minimal supported GCC version to build Xen for RISC-V is 12.2.0,
and for that version it will be needed to encode H extensions instructions
explicitly by checking if __risv_h is defined.

[1] https://github.com/gcc-mirror/gcc/commit/0cd11d301013af50a3fae0694c909952e94e20d5#diff-d6f7db0db31bfb339b01bec450f1b905381eb4730cc5ab2b2794971e34647d64R148

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - Update the commit message.
 - Use check-extension macros to verify that 'H' extension is available.
   
   Also it works for clang.
   I verified this by compiling Xen with Clang-17 (the minimal necessary
   version for Xen, as RISC-V64 support for Clang starts from 17.0.0:
   f873029386("[BOLT] Add minimal RISC-V 64-bit support")).
   The changes can be found here:
   https://paste.vates.tech/?015af79b1e7413e6#3fsRb4QbjYDPseK7FU8wbaCWbsuu8xhANUmuChCfDoFD
---
 docs/misc/riscv/booting.txt | 4 ++++
 xen/arch/riscv/arch.mk      | 6 ++++--
 xen/arch/riscv/cpufeature.c | 1 +
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/docs/misc/riscv/booting.txt b/docs/misc/riscv/booting.txt
index cb4d79f12c..3a8474a27d 100644
--- a/docs/misc/riscv/booting.txt
+++ b/docs/misc/riscv/booting.txt
@@ -3,6 +3,10 @@ System requirements
 
 The following extensions are expected to be supported by a system on which
 Xen is run:
+- H:
+  Provides additional instructions and CSRs that control the new stage of
+  address translation and support hosting a guest OS in virtual S-mode
+  (VS-mode).
 - Zbb:
   RISC-V doesn't have a CLZ instruction in the base ISA.
   As a consequence, __builtin_ffs() emits a library call to ffs() on GCC,
diff --git a/xen/arch/riscv/arch.mk b/xen/arch/riscv/arch.mk
index 236ea7c8a6..f29ad332c1 100644
--- a/xen/arch/riscv/arch.mk
+++ b/xen/arch/riscv/arch.mk
@@ -9,7 +9,6 @@ riscv-abi-$(CONFIG_RISCV_64) := -mabi=lp64
 riscv-march-$(CONFIG_RISCV_64) := rv64
 riscv-march-y += ima
 riscv-march-$(CONFIG_RISCV_ISA_C) += c
-riscv-march-y += _zicsr_zifencei_zbb
 
 riscv-generic-flags := $(riscv-abi-y) -march=$(subst $(space),,$(riscv-march-y))
 
@@ -25,10 +24,13 @@ $(eval $(1) := \
 	$(call as-insn,$(CC) $(riscv-generic-flags)_$(1),$(value $(1)-insn),_$(1)))
 endef
 
+h-insn := "hfence.gvma"
+$(call check-extension,h)
+
 zihintpause-insn := "pause"
 $(call check-extension,zihintpause)
 
-extensions := $(zihintpause)
+extensions := $(h) $(zihintpause) _zicsr_zifencei_zbb
 
 extensions := $(subst $(space),,$(extensions))
 
diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
index bf09aa1170..5aafab0f49 100644
--- a/xen/arch/riscv/cpufeature.c
+++ b/xen/arch/riscv/cpufeature.c
@@ -146,6 +146,7 @@ static const struct riscv_isa_ext_data __initconst required_extensions[] = {
 #ifdef CONFIG_RISCV_ISA_C
     RISCV_ISA_EXT_DATA(c),
 #endif
+    RISCV_ISA_EXT_DATA(h),
     RISCV_ISA_EXT_DATA(zicsr),
     RISCV_ISA_EXT_DATA(zifencei),
     RISCV_ISA_EXT_DATA(zihintpause),
-- 
2.48.1


