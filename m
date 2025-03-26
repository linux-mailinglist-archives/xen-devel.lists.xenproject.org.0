Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D621AA716D7
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 13:43:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927757.1330484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txQ6A-00019g-BA; Wed, 26 Mar 2025 12:43:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927757.1330484; Wed, 26 Mar 2025 12:43:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txQ6A-00017D-8Y; Wed, 26 Mar 2025 12:43:10 +0000
Received: by outflank-mailman (input) for mailman id 927757;
 Wed, 26 Mar 2025 12:43:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+Jq=WN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1txQ68-000177-RB
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 12:43:08 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dda75bb8-0a3f-11f0-9ffa-bf95429c2676;
 Wed, 26 Mar 2025 13:43:06 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5e61d91a087so10348164a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 05:43:06 -0700 (PDT)
Received: from fedora.. (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3efb6588esm1033253566b.90.2025.03.26.05.43.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Mar 2025 05:43:05 -0700 (PDT)
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
X-Inumbo-ID: dda75bb8-0a3f-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742992986; x=1743597786; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zKkqede1vXVof7Aw99IRVBA+q2UKQ52Ux/ErfalGtmE=;
        b=UwglvJtBeuWiHU9tEcaaAqEEp1PsXv5tHOiR8tY+tTes+rDDNHsH8yfDxxQ2XRBDeW
         3uSJHxH4yw1YatVJqs0yWvhK17e4Cg5aQ+EMK5c2bnSeTp0WcHa8RSY80aHhVLsI7bzh
         84LUQiPSFaAeieVzNuIZIdofrmBUBgKiHv3jPYBZtjMWb2bb4l6AQcXIqYe+bq4wKU7O
         i00SmvXtrccitkf+nlAKqFN2Ckbe7m+tWrf0K0ZV2dBtubkdbT5HFkB/mFv7RsB+EBOR
         OxZtyypzxjVmZ6GYLrOKDd9hjjUy+rgF+LaDWsZo/npdsi/KohhN9tnlOSb/K3eBw3LC
         Ek8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742992986; x=1743597786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zKkqede1vXVof7Aw99IRVBA+q2UKQ52Ux/ErfalGtmE=;
        b=hMu3x8okemJSyFGbM8wwFSGpgncYl7ja/veg+1u38lFPrpI7Qnx9/cPB6sfhJIG+eW
         CztHjcgacd9FNWYe12sFguPI50HHS1C91ClZ4f+RE17hoOQ42eCVIXkwK1wlx/1dhOEn
         DFtvZdwUzsgHQYZEMo/yQgVjPEJsdpDVP+Q73xT3KMXWp9rFomf7D4wbBS/3HvghYlTu
         9baT1s3s3LEbwTiWuTg4b74U4B1Gx3R1sUn7+vr38I+GC16teZZG0UD6MTGtwZr5xaLL
         Jh/wKZWOskZBBCz72F2RQKhBumZJsckz7srCgQ78xCvJwo+7IQNsE+RD/dZ7HfOTxfDz
         wTdQ==
X-Gm-Message-State: AOJu0Yz5cnY6D3dr2byCIDtpr6gr8Lg0A9XhVrPodw7vaOCiHE0NXnwB
	34rwLvO3Xz8G1M7uQpocJpd39cCq6vLnbEzxf212wuTAZkjN+7DzZZLCGg==
X-Gm-Gg: ASbGncu4uTNnj+1rLMj2Z4LaCWrRLKHqLj6EfN4wAQzDSay/JrcKbXy/QjVxk7dP8p9
	StVZ+2jp5BvSbnYYOPQUpEtYGpyugpqizxoOjMhLDP5p3G7NzayFjAYIrDza/MaxkKwdqxKTGJr
	19jqHDOGne0xQkIA3fHaqVRExZAsrP5LOv00UW0dxBBZ6HS7I1Ycslp4La97MydBsxfzOHlcMvB
	Qd2Dv1BK7ZwhRM+sgIaAV3pJ0JEwV+2sbCuOZ+ClUtFVzlb/6lYjHzENYxKFTSQGZezfyG4TwSO
	umpa5WwwOTonmyLoCEq+IH16xa3UAPGNsLQGRoMV1lyuLoERUn9EX2jVf4o1q/wEQzX6rDX2jVV
	9uaT2BWihAuBLMg==
X-Google-Smtp-Source: AGHT+IE0d3CyOqYtTZRVJWmUa33rRgqAGCuTrnrl3pOoMMwDqSVY8HMSih2fBUMiy0CZsZjCkEYGDg==
X-Received: by 2002:a17:907:c5c9:b0:ac4:3d8:2e90 with SMTP id a640c23a62f3a-ac403d83d5bmr1791846166b.13.1742992985526;
        Wed, 26 Mar 2025 05:43:05 -0700 (PDT)
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
Subject: [PATCH v3] xen/riscv: add H extenstion to -march
Date: Wed, 26 Mar 2025 13:42:42 +0100
Message-ID: <f03b414909751fd33bb42e984812396289b83b9e.1742992635.git.oleksii.kurochko@gmail.com>
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
and for that version, h is still considered a prefix for the hypervisor
extension but the name of hypervisor extension must be more then 1 letter
extension, a workaround ( with using `hh` as an H extension name ) is
implemented as otherwise the following compilation error will occur:
 error: '-march=rv64gc_h_zbb_zihintpause': name of hypervisor extension
        must be more than 1 letter

After GCC version 13.1.0, the commit [1] introducing H extension support
allows us to drop the workaround with `hh` as hypervisor extension name
and use only one h in -march.

[1] https://github.com/gcc-mirror/gcc/commit/0cd11d301013af50a3fae0694c909952e94e20d5#diff-d6f7db0db31bfb339b01bec450f1b905381eb4730cc5ab2b2794971e34647d64R148

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - Update the commit message.
 - Add one more check-extension macros to deal with gcc compiler versions
   [12.2.0 - 13.1.0).
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
 docs/misc/riscv/booting.txt |  4 ++++
 xen/arch/riscv/arch.mk      | 11 +++++++++--
 xen/arch/riscv/cpufeature.c |  1 +
 3 files changed, 14 insertions(+), 2 deletions(-)

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
index 236ea7c8a6..599544429f 100644
--- a/xen/arch/riscv/arch.mk
+++ b/xen/arch/riscv/arch.mk
@@ -9,7 +9,6 @@ riscv-abi-$(CONFIG_RISCV_64) := -mabi=lp64
 riscv-march-$(CONFIG_RISCV_64) := rv64
 riscv-march-y += ima
 riscv-march-$(CONFIG_RISCV_ISA_C) += c
-riscv-march-y += _zicsr_zifencei_zbb
 
 riscv-generic-flags := $(riscv-abi-y) -march=$(subst $(space),,$(riscv-march-y))
 
@@ -25,10 +24,18 @@ $(eval $(1) := \
 	$(call as-insn,$(CC) $(riscv-generic-flags)_$(1),$(value $(1)-insn),_$(1)))
 endef
 
+h-insn := "hfence.gvma"
+$(call check-extension,h)
+
+ifneq ($(h),_h)
+hh-insn := "hfence.gvma"
+$(call check-extension,hh)
+endif
+
 zihintpause-insn := "pause"
 $(call check-extension,zihintpause)
 
-extensions := $(zihintpause)
+extensions := $(h) $(hh) $(zihintpause) _zicsr_zifencei_zbb
 
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


