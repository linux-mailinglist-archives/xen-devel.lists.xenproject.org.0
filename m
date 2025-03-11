Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2C6A5C891
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 16:45:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908393.1315519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts1ni-0000uA-8l; Tue, 11 Mar 2025 15:45:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908393.1315519; Tue, 11 Mar 2025 15:45:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts1ni-0000rg-4w; Tue, 11 Mar 2025 15:45:50 +0000
Received: by outflank-mailman (input) for mailman id 908393;
 Tue, 11 Mar 2025 15:45:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JHpu=V6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ts1ng-0000Dw-RN
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 15:45:48 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2395b40-fe8f-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 16:45:40 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-ac2c663a3daso142273166b.2
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 08:45:40 -0700 (PDT)
Received: from fedora.. (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac239485d55sm946785066b.67.2025.03.11.08.45.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 08:45:38 -0700 (PDT)
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
X-Inumbo-ID: e2395b40-fe8f-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741707939; x=1742312739; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mIJbgt7IrUs9KjyNsFbMDWvna1vjE52x/ZJvHbiTdeI=;
        b=Xo1qu6NhQjwzOsbCIhXn6bdHoUTsEz/XZWWoTMXdZsuqN/ghy+tddja2TDo1PKbAhF
         zEyBn+pr2FqQELqkwzFUgotWLsU1ar8Q6jsa5zFBzxytbBH6hTuIiPG9VqE2ZXjKrTSC
         NGvVDaIrlakhp14N/D73QRsWswTk3z6WSddwcqlkFuibTCxmt6mai+ZqqTiWI5yaysuw
         qaDPSw0KSbwKH5q57pw+kumEv6FrZYtT5ua6bedWhBWsCxfX2yy3AelQzSYO/iMiaIOB
         IiOW6L76qUhQgOXcT+VxmKRJxVUarQ0Xj6X1PXGttXHBZxWcEDkxC1dCnF/GqAhuhK0P
         P+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741707939; x=1742312739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mIJbgt7IrUs9KjyNsFbMDWvna1vjE52x/ZJvHbiTdeI=;
        b=rXRBej5ePoNSOswJ28HqwVWi28GoBIC/k9x2SZ6yuCBLScVYPK2p11lWZJUZIGH5Bn
         E/jsaWXeahPRKc33q0ptrpqmIgoFdA3MX0SikLxfRgavLR7Xu8M6xTdit6soqLT5kj+y
         Zc9Ov9ex0jYt61bTwEqb7fi3M6G4sf4tj8Sy8B1IXZWu0558/g7NrIStaab+w2q/diqE
         eGE+wGDrMWuvcbfNcbuHyT4SdYylo7Q+CAD/Lj+UMPVHxrAMzKrWRKszP6FrazHhK19K
         JasgYCej+vx8AGUW8TtvaWBGbEBPpO4ElOCK3QT+uNiS6TX1Ngsh5oflZR9shcXcQjhZ
         5gYg==
X-Gm-Message-State: AOJu0Yw41W2CgUKaO9W3noKHoMdsPAFODrAAZCW+TsmUsZ5KbkE4Xem8
	NRaUjZbqTix/cQdV0T6AhgCdHH12cxFYDJhCwFV/P2u0x0pat5qC9H3qHg==
X-Gm-Gg: ASbGncs4D/V2ryBZaGqMMwAV4feVY34gznRG6GwI+xUyBKuBRFD2DWA5CwSfY25xKWx
	zfldtB71Ua3eCFLSjLBQ9L7ODB5QgfT3h3hVlV7mzar3AkyGx3MMVEwuBq4VWi1rCYzi8cF9QvD
	ywuUZMQzIDxz6+obLja4GXOV0d65KSmdOGrFPNjwwS+TKGTIhmXyTqrD38nEKUfsetpfEwxta6O
	iGa+5PznQzLxrU7XXnoJM/PGHY/u6UL6j/iFKCw32oxe+N3QuGcpH+mRFRo+MT3QvP6AIgyVpml
	2W9/IoPwahSCu5YegmUttFVYJ0KA/CO2ZCCi2JOsqhS3DPxhm/862v1Qk2rm63D84O0RPcJ0LEH
	RAvMgZCljVUz7dQ==
X-Google-Smtp-Source: AGHT+IGUorZZIHRO8/zim1V9oGRIvUVD1C/LxAbhpqBUZ7SvQQcDZKXajDIxA84ESodmqzsvVhqLlw==
X-Received: by 2002:a17:906:cecb:b0:ac2:8118:27e7 with SMTP id a640c23a62f3a-ac2811831a3mr1528203866b.50.1741707939134;
        Tue, 11 Mar 2025 08:45:39 -0700 (PDT)
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
Subject: [PATCH v1] xen/riscv: add H extenstion to -march
Date: Tue, 11 Mar 2025 16:45:34 +0100
Message-ID: <32ebe4032b7968157d5cadbc2f6aa1d9f2d363c9.1741707803.git.oleksii.kurochko@gmail.com>
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

To implement this, the h-extension-name is introduced, which is filled with
hh or h depending on the GCC version.

[1] https://github.com/gcc-mirror/gcc/commit/0cd11d301013af50a3fae0694c909952e94e20d5#diff-d6f7db0db31bfb339b01bec450f1b905381eb4730cc5ab2b2794971e34647d64R148

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 docs/misc/riscv/booting.txt | 4 ++++
 xen/arch/riscv/arch.mk      | 3 ++-
 xen/arch/riscv/cpufeature.c | 1 +
 3 files changed, 7 insertions(+), 1 deletion(-)

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
index 236ea7c8a6..14d1f0ada0 100644
--- a/xen/arch/riscv/arch.mk
+++ b/xen/arch/riscv/arch.mk
@@ -9,7 +9,8 @@ riscv-abi-$(CONFIG_RISCV_64) := -mabi=lp64
 riscv-march-$(CONFIG_RISCV_64) := rv64
 riscv-march-y += ima
 riscv-march-$(CONFIG_RISCV_ISA_C) += c
-riscv-march-y += _zicsr_zifencei_zbb
+h-extension-name := $(call cc-ifversion,-lt,1301, hh, h)
+riscv-march-y += $(h-extension-name)_zicsr_zifencei_zbb
 
 riscv-generic-flags := $(riscv-abi-y) -march=$(subst $(space),,$(riscv-march-y))
 
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


