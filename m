Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9809B3190D8
	for <lists+xen-devel@lfdr.de>; Thu, 11 Feb 2021 18:20:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.84030.157446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAFdO-0004Tk-4w; Thu, 11 Feb 2021 17:20:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84030.157446; Thu, 11 Feb 2021 17:20:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAFdO-0004RI-0J; Thu, 11 Feb 2021 17:20:06 +0000
Received: by outflank-mailman (input) for mailman id 84030;
 Thu, 11 Feb 2021 17:20:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kYUG=HN=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1lAFdM-0003q3-Tk
 for xen-devel@lists.xenproject.org; Thu, 11 Feb 2021 17:20:04 +0000
Received: from mail-wr1-x434.google.com (unknown [2a00:1450:4864:20::434])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 616edc7d-819b-49bb-90f0-499f35971b39;
 Thu, 11 Feb 2021 17:19:54 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id b3so4949055wrj.5
 for <xen-devel@lists.xenproject.org>; Thu, 11 Feb 2021 09:19:54 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l1sm9819414wmi.48.2021.02.11.09.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 09:19:50 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AE1E91FF8C;
 Thu, 11 Feb 2021 17:19:46 +0000 (GMT)
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
X-Inumbo-ID: 616edc7d-819b-49bb-90f0-499f35971b39
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t3OFT8GZLSx2s8PIhoV1MKY+HG2WX+w1muUkEk+uEOc=;
        b=jnYha8oxul2sAT33I9n4HYxvBHkU2m5Ig+7LY2M8FP5oTyPkTxZqkWq0YskaDNTih8
         c+0L5cLBONtsrnosF1zy0IMr8LGqeJz56dDlyhZunnPOwuCmxuIb5yjKfReU4Uuv9Ncj
         9/Tski3heTi6sJHoSBenr9YOau3WJ1IAT81dnpNhPG5Ex7vobdrmjYJCorJQ0djlFslO
         6jsJLRrc+fHLa5wKBjH6Zr76+Q1LZZRJERou7VROlcFMIk13/hzX74p341ufYzF5vnQb
         rfGyqPcaeylmOMId3yH+OGjX1PUviN/O18i6+6NuuCjUIKAPW0rxn6ZQY3WS88DITgHp
         l0ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t3OFT8GZLSx2s8PIhoV1MKY+HG2WX+w1muUkEk+uEOc=;
        b=cjkxVQkyI69HDZ8SIPwFxKtcKwuFeVqV6HfzMoNYw5q7LEfnrl8tu4uA9YxfDjHpYD
         N2d83p9G4bb631lgEUtNw9gfTsS9OunjV2BY7d2WexnYV3hObIQ0uv4EAV8uDcVAEvD8
         fbaTnFmrplqqS2xpwvXqzN6FqDAT9fyibLZzi2fgT7heIaYuU9YvdJWHqapEdcw6scyj
         n/IY+YJDBPIBlDNLjtI7noJ4XZ9QarRvBB3PvQw4AzeOfusASbDVjr9pzCLlM8HombdI
         /ZEEnKTjGeqz5nbAggT+HVbKsV8KzrE2I1GcT7umtSPJf6jTfLFvGXJJ+7Dildas6tI8
         Z6aA==
X-Gm-Message-State: AOAM530iNB4cma7vjGe03jXUjOOWBb0lbgOKkiJzD9yu/r1b4+W2zWcf
	rVZQrWk4lTdqrt+9Nw+kXGYSZg==
X-Google-Smtp-Source: ABdhPJy4hZBqYwg1DtCBsL0Xs3oZtCMSprNtTXkS5l8GCnYIalW6zmV+LmO6HhXEH1pfTWKXxOsi3A==
X-Received: by 2002:adf:bb54:: with SMTP id x20mr6691695wrg.112.1613063993294;
        Thu, 11 Feb 2021 09:19:53 -0800 (PST)
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
Subject: [PATCH  v2 2/7] hw/riscv: migrate fdt field to generic MachineState
Date: Thu, 11 Feb 2021 17:19:40 +0000
Message-Id: <20210211171945.18313-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211171945.18313-1-alex.bennee@linaro.org>
References: <20210211171945.18313-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is a mechanical change to make the fdt available through
MachineState.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20201021170842.25762-3-alex.bennee@linaro.org>
Message-Id: <20201105175153.30489-3-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
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


