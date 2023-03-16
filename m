Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8CF6BD0B1
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 14:22:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510592.788523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcnYw-0004Op-85; Thu, 16 Mar 2023 13:22:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510592.788523; Thu, 16 Mar 2023 13:22:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcnYw-0004KE-19; Thu, 16 Mar 2023 13:22:34 +0000
Received: by outflank-mailman (input) for mailman id 510592;
 Thu, 16 Mar 2023 13:22:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NB6E=7I=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pcnYu-0004I2-Gi
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 13:22:32 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b296b40-c3fd-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 14:22:31 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id z21so7622698edb.4
 for <xen-devel@lists.xenproject.org>; Thu, 16 Mar 2023 06:22:31 -0700 (PDT)
Received: from fedora.. (46.204.101.131.nat.umts.dynamic.t-mobile.pl.
 [46.204.101.131]) by smtp.gmail.com with ESMTPSA id
 u20-20020a50d514000000b004bd1fe2cc02sm3861728edi.16.2023.03.16.06.22.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 06:22:31 -0700 (PDT)
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
X-Inumbo-ID: 9b296b40-c3fd-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678972951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pxu23kp/Co+g/jvR7fkvKvV5XJ2nKBCMi+VMmTAzjTg=;
        b=JuPxK5JmZ1XRoZbrPERdvkj8ANr/IAYDVuqpN5+qXyxQdTva8B7XWJDBh1pzUIDn6o
         OpRYR+SG1QHl2ISi8A5iu35Sq1kXrBiMmQuqr5zjgMpUZR/7Y3AWr61A8Qxch6OT/F4P
         cwIzlcjZbva14tRb3s+NbKMxLMtNKFxym0QOv+Na3nAWqfsgk3u/e5p/KbuMdvWEGy7l
         3RB+PZfl8b0n5++Ob+usOxRMTcihzFV5lcjokIhePN3QLniuic8FRk0dRAHVBOLv7e/J
         QzkJJ9O6J+9ILWouevK6BH0EmdDTY/YDMPFs4MiA49lUWKrDcSnaeGfZcTf9q5WDUST1
         Pc/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678972951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pxu23kp/Co+g/jvR7fkvKvV5XJ2nKBCMi+VMmTAzjTg=;
        b=ulNIgfogcbnsAsekADNl7NtKhYrs58GOqVHVyrFRSHZ6JeGPCcEIv0V1dOJ8ySwBVh
         U5fc4z/FZLli/DyLw5r6e0l/ENqu3H/ur42PWXIvgz9EphcW0KzV4jpC6DmL0sQp2nKt
         L8m6RFXlTSTwctbKvW2b64u/Pu1ZjOJvuYdV5ZyQC1YxtYYxEYYPNfu/B4M8K2j8jtNU
         i5QXD5bbCn+6GRHzXb0rnBJ+OCBYuwch1aaERKJcOA4pzU0BK6upndUMmTKkC9GYvWc+
         YEPAjJxrVoPGRygVSKps85BbYhwgoKp4edHFPO2SBMdAgkXFUGb51VRcoIKRzE92HU6k
         ajUQ==
X-Gm-Message-State: AO0yUKWWRebJ8botK9B1368yH39eiL6b6HwJIxuCavNnfedMeyxGZJQP
	ua3SPye6es3CklWDV9JKf93R5/aucb1I3w==
X-Google-Smtp-Source: AK7set+wyuSBR8OMebkYVdgBkeDaNMzb/ir5HPfsX5t1/CNu9GwjIBms+Va+5nrDd8/IGyRXgpHryQ==
X-Received: by 2002:a50:fe89:0:b0:4cf:c2f6:ca1 with SMTP id d9-20020a50fe89000000b004cfc2f60ca1mr6268399edt.1.1678972951339;
        Thu, 16 Mar 2023 06:22:31 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v2 1/2] xen/riscv: add EMBEDDED_EXTRA_CFLAGS to CFLAGS
Date: Thu, 16 Mar 2023 15:22:24 +0200
Message-Id: <2785518800dce64fafb3096480a5ae4c4e026bcb.1678970065.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1678970065.git.oleksii.kurochko@gmail.com>
References: <cover.1678970065.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch is needed to keep all address of cpu0_boot_stack
PC-relative.

Pseudoinstruction 'la' can be transformed to 'auipc/addi' or
'auipc/l{w|d}'. It depends on the .option directive: nopic and pic
or compiler flags.

Right now, 'la' transforms to 'auipc/l{w|d}', which in case of
cpu0_boot_stack[] will lead to the usage of _GLOBAL_OFFSET_TABLE_
where all addresses will be without counting that it might happen
that linker address != load address ( so addresses inside got
sections will be relative to linker time ).

It happens becuase the compiler from riscv64 docker compiled with
--enable-default-pie:
  [user@49295ae49cbe build]$ riscv64-linux-gnu-gcc -v
  Using built-in specs.
  COLLECT_GCC=riscv64-linux-gnu-gcc
  COLLECT_LTO_WRAPPER=/usr/lib/gcc/riscv64-linux-gnu/12.2.0/lto-wrapper
  Target: riscv64-linux-gnu
  Configured with: /build/riscv64-linux-gnu-gcc/src/gcc-12.2.0/configure
  --prefix=/usr --program-prefix=riscv64-linux-gnu- --with-local-
  prefix=/usr/riscv64-linux-gnu --with-sysroot=/usr/riscv64-linux-gnu --
  with-build-sysroot=/usr/riscv64-linux-gnu --libdir=/usr/lib --
  libexecdir=/usr/lib --target=riscv64-linux-gnu --host=x86_64-pc-linux-
  gnu --build=x86_64-pc-linux-gnu --with-system-zlib --with-isl --with-
  linker-hash-style=gnu --disable-nls --disable-libunwind-exceptions --
  disable-libstdcxx-pch --disable-libssp --disable-multilib --disable-
  werror --enable-languages=c,c++ --enable-shared --enable-threads=posix
  --enable-__cxa_atexit --enable-clocale=gnu --enable-gnu-unique-object -
  -enable-linker-build-id --enable-lto --enable-plugin --enable-install-
  libiberty --enable-gnu-indirect-function --enable-default-pie --enable-
  checking=release
  Thread model: posix
  Supported LTO compression algorithms: zlib zstd
  gcc version 12.2.0 (GCC)

Looking at gcc spec file for the RISC-V architecture:
  [user@49295ae49cbe build]$ riscv64-linux-gnu-gcc -dumpspecs | grep -i
  pic
  --traditional-format %(subtarget_asm_debugging_spec) %{fno-pie|fno-
  PIE|fno-pic|fno-PIC:;:-fpic} %{march=*} %{mabi=*} %{mno-relax} %{mbig-
  endian} %{mlittle-endian} %(subtarget_asm_spec)%{misa-spec=*}
which means that -fpic is enabled if none of the following options are
present on the command line:
    -fno-pie
    -fno-PIE
    -fno-pic
    -fno-PIC

That's the reasons why 'la' is transformed to 'aupic/l{w|d} GOT' and
not be dependent on the toolchain used.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 Changes in V2:
 * instead of changing 'la' to 'lla' to keep cpu0_boot_stack PC-relative
   it was updated CFLAGS with EMBEDDED_EXTRA_CFLAGS which contains
   -fno-PIE thereby 'la' will be transformed to 'auipc/addi' without
   GOT usage.
 * update the commit message with additional details.
---
 xen/arch/riscv/arch.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/riscv/arch.mk b/xen/arch/riscv/arch.mk
index 45fe858ee0..7448f759b4 100644
--- a/xen/arch/riscv/arch.mk
+++ b/xen/arch/riscv/arch.mk
@@ -1,6 +1,8 @@
 ########################################
 # RISCV-specific definitions
 
+$(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
+
 CFLAGS-$(CONFIG_RISCV_64) += -mabi=lp64
 
 riscv-march-$(CONFIG_RISCV_ISA_RV64G) := rv64g
-- 
2.39.2


