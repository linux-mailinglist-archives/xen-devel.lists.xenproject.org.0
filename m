Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B6E32B9B7
	for <lists+xen-devel@lfdr.de>; Wed,  3 Mar 2021 19:09:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92928.175275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHVQa-0008EF-4s; Wed, 03 Mar 2021 17:36:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92928.175275; Wed, 03 Mar 2021 17:36:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHVQa-0008Dp-1p; Wed, 03 Mar 2021 17:36:52 +0000
Received: by outflank-mailman (input) for mailman id 92928;
 Wed, 03 Mar 2021 17:36:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Voz6=IB=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1lHVQY-0008CL-SJ
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 17:36:50 +0000
Received: from mail-wr1-x430.google.com (unknown [2a00:1450:4864:20::430])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4e806233-47ab-4952-919c-50e0a1938d16;
 Wed, 03 Mar 2021 17:36:45 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id b18so18122692wrn.6
 for <xen-devel@lists.xenproject.org>; Wed, 03 Mar 2021 09:36:45 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m2sm6316827wml.34.2021.03.03.09.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 09:36:43 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7DDF21FF8C;
 Wed,  3 Mar 2021 17:36:42 +0000 (GMT)
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
X-Inumbo-ID: 4e806233-47ab-4952-919c-50e0a1938d16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1mhDoxefyC/VVw7zUuqfiHo+BNITfl2gfYDxMgzesU4=;
        b=y8ZioLIGZvHKVdZXRlv1Zar1mcJF3BAo55XTeclyWG7L1Ra+fookeVnBv1QaxXwyMD
         3/tNFOUq9PlV7eQ+ejutHRg8QEXH8Wk/zTPau7KzdQACukH7fFZDs4AQ0sFK2epAtH9+
         aixZob2k3D61ulHEcxY+dJRI0xinFr9lNeIr35PfAc30pBrfH54QrNhwf89w013Nhr0f
         UDGgJ2pMGm0e+tSXuEj5wAOOAyz/bDgYSQ2A6DtSmWQBquJ0FduvnWFRsPQbjvDJcnFc
         3rQRTqczwqbcwKyUbVbhbhmnEIVMDcK/hLttLiJTnpGOLHl/UmzYsgIwbo2dF/qJZPPU
         sz7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1mhDoxefyC/VVw7zUuqfiHo+BNITfl2gfYDxMgzesU4=;
        b=nr1zFjrOBPIoHy/woUBggjG7XuwGcrBgXlEALS285Eckunh3c8q5U/GH+E77wry2ao
         xFq/S7YwwLAn6S1FvmVqyUVDGbX/ChLvp6nOG8edH5L9dbme06XPhun8w/JE2rL2OI22
         wMDC0omiPJ5fMl8fs6mm3OxkEOIRKVT3k0eLJ349+7trqndwTxBBiUnElkzP5LvQbiv2
         LRslo07qqbyWPkcwhCfm8FkB8iKPuFrLnROwv4Zl84EQ2lS2ccyTGBcHlRlg46PXQM6p
         1AjfICQ7xPXhS4neGB/x5K6/eWqsqvTS4uQ9bGoECtoIBQyespBtTfotUiPJe6KV2H2r
         WQjg==
X-Gm-Message-State: AOAM531fxPDRBP6i8yp8m4eFfD5cV4EBzPGMKiLOCXOKHjhIzUXlcWOW
	CiFVRDr7ChtoJQvqeZnLJNfqXQ==
X-Google-Smtp-Source: ABdhPJyZSxtpc4fcGhtaCFDlXly5Tpm9D42Lg+8EXzRiM52nT+tOhOeLiZfd9lGfRgooTwIG8FgzQg==
X-Received: by 2002:adf:c752:: with SMTP id b18mr5625686wrh.233.1614793004917;
        Wed, 03 Mar 2021 09:36:44 -0800 (PST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: julien@xen.org,
	stefano.stabellini@linaro.org,
	stefano.stabellini@xilinx.com,
	andre.przywara@arm.com,
	stratos-dev@op-lists.linaro.org,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH  v3 2/7] hw/riscv: migrate fdt field to generic MachineState
Date: Wed,  3 Mar 2021 17:36:37 +0000
Message-Id: <20210303173642.3805-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210303173642.3805-1-alex.bennee@linaro.org>
References: <20210303173642.3805-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is a mechanical change to make the fdt available through
MachineState.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210211171945.18313-3-alex.bennee@linaro.org>
---
 include/hw/riscv/virt.h |  1 -
 hw/riscv/virt.c         | 20 ++++++++++----------
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 84b7a3848f..632da52018 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -41,7 +41,6 @@ struct RISCVVirtState {
     DeviceState *plic[VIRT_SOCKETS_MAX];
     PFlashCFI01 *flash[2];
 
-    void *fdt;
     int fdt_size;
 };
 
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 2299b3a6be..8d0ba72d78 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -189,14 +189,14 @@ static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
     hwaddr flashbase = virt_memmap[VIRT_FLASH].base;
 
     if (mc->dtb) {
-        fdt = s->fdt = load_device_tree(mc->dtb, &s->fdt_size);
+        fdt = mc->fdt = load_device_tree(mc->dtb, &s->fdt_size);
         if (!fdt) {
             error_report("load_device_tree() failed");
             exit(1);
         }
         goto update_bootargs;
     } else {
-        fdt = s->fdt = create_device_tree(&s->fdt_size);
+        fdt = mc->fdt = create_device_tree(&s->fdt_size);
         if (!fdt) {
             error_report("create_device_tree() failed");
             exit(1);
@@ -434,12 +434,12 @@ static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
     g_free(name);
 
     name = g_strdup_printf("/soc/flash@%" PRIx64, flashbase);
-    qemu_fdt_add_subnode(s->fdt, name);
-    qemu_fdt_setprop_string(s->fdt, name, "compatible", "cfi-flash");
-    qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
+    qemu_fdt_add_subnode(mc->fdt, name);
+    qemu_fdt_setprop_string(mc->fdt, name, "compatible", "cfi-flash");
+    qemu_fdt_setprop_sized_cells(mc->fdt, name, "reg",
                                  2, flashbase, 2, flashsize,
                                  2, flashbase + flashsize, 2, flashsize);
-    qemu_fdt_setprop_cell(s->fdt, name, "bank-width", 4);
+    qemu_fdt_setprop_cell(mc->fdt, name, "bank-width", 4);
     g_free(name);
 
 update_bootargs:
@@ -631,9 +631,9 @@ static void virt_machine_init(MachineState *machine)
             hwaddr end = riscv_load_initrd(machine->initrd_filename,
                                            machine->ram_size, kernel_entry,
                                            &start);
-            qemu_fdt_setprop_cell(s->fdt, "/chosen",
+            qemu_fdt_setprop_cell(machine->fdt, "/chosen",
                                   "linux,initrd-start", start);
-            qemu_fdt_setprop_cell(s->fdt, "/chosen", "linux,initrd-end",
+            qemu_fdt_setprop_cell(machine->fdt, "/chosen", "linux,initrd-end",
                                   end);
         }
     } else {
@@ -654,12 +654,12 @@ static void virt_machine_init(MachineState *machine)
 
     /* Compute the fdt load address in dram */
     fdt_load_addr = riscv_load_fdt(memmap[VIRT_DRAM].base,
-                                   machine->ram_size, s->fdt);
+                                   machine->ram_size, machine->fdt);
     /* load the reset vector */
     riscv_setup_rom_reset_vec(machine, &s->soc[0], start_addr,
                               virt_memmap[VIRT_MROM].base,
                               virt_memmap[VIRT_MROM].size, kernel_entry,
-                              fdt_load_addr, s->fdt);
+                              fdt_load_addr, machine->fdt);
 
     /* SiFive Test MMIO device */
     sifive_test_create(memmap[VIRT_TEST].base);
-- 
2.20.1


