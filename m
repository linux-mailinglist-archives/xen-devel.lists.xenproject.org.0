Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACD3A7085F
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 18:41:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926869.1329719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx8HQ-0005of-N3; Tue, 25 Mar 2025 17:41:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926869.1329719; Tue, 25 Mar 2025 17:41:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx8HQ-0005m6-Hc; Tue, 25 Mar 2025 17:41:36 +0000
Received: by outflank-mailman (input) for mailman id 926869;
 Tue, 25 Mar 2025 17:41:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7VIv=WM=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tx8HP-00045y-GU
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 17:41:35 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65691eab-09a0-11f0-9ea3-5ba50f476ded;
 Tue, 25 Mar 2025 18:41:35 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5dca468c5e4so10370591a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 10:41:35 -0700 (PDT)
Received: from localhost.localdomain ([46.149.103.11])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3efd24e7fsm879592666b.153.2025.03.25.10.41.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 10:41:33 -0700 (PDT)
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
X-Inumbo-ID: 65691eab-09a0-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1742924494; x=1743529294; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jf/uamtgEP6+2QqtlUxelY0IMP0jh/xhbrinl99cFQs=;
        b=YILza9z0m7SLv4jstuWB0rJhVqmNTAkzT777b6KT9FlMVNNHJOnfq2aFZeeyAY9hbW
         br0PljB36rL6xiC92qq4fvr3NlyCJ//lwJNwd88C/FE6O6W30HSm00V53c2+pF5boPgf
         dOz7+NIKj58LD9/CCcjM6p418mAPYSG5KJaQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742924494; x=1743529294;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jf/uamtgEP6+2QqtlUxelY0IMP0jh/xhbrinl99cFQs=;
        b=L6clwqekZVFc5m9wvznPPo7TRKLksvWL7NkxZ1tZHtyYQlEKxZWy/WKEah7QhTZ/yY
         SEiLKir4wCtMVG6cHOCzjwJYy/1XuZY8+Jmx40EZjJjgPzkA3S0PL6Gn7Dhw9SyYCCMT
         7PsECQKS1+Gcu665+K9D2I3Ewp/dSX5Pqs3LaSNPBSXeGQ4uvadnv1fYUg/5F3RNUbQ+
         ZwCVJsaGa/7sw2I5xwKvAfmk1W7EBvSGNCMTpEj83oJwvQ+hlZkUoy0CkTaffSB+H5yG
         io2giEX0f4W0+p2dF4lBMWzwnfIRix+jjXF8g56m6vvOGLbPFBynaLxou9Kx9E8BSw0y
         ruag==
X-Gm-Message-State: AOJu0YwsqBUlcx6n6wbByGCgt5jxSVxGLdHmw8KBlUFDFSwOglMSoZ0q
	ORZsKColc4uimCLk+8AASdBCl/XiofmX9sVd3UAIlXiZTP0UtJbLvgXw0sYffZWaGvSE9k36Q5Q
	q
X-Gm-Gg: ASbGncsuwZUJMrsr3r7pPLCNGVFfC/6Tq9kxAzBhfYtkEKXeGo0Op+Q8rsReIExngVR
	UGSXN3pxmARgzxoMNtXKxmZqDa6UcCraEw4nPHGQI7pZi3WOCxGE/sU3KlnyVNhCIRuAxaVFiVm
	XaiEkYfUxu6y8G5P0tqubLaNhSV7e0k+MP5gHIoESAhjWA82cdClWOPJ+IAdDH1/jRpkqphQmob
	wRHhxo/EG7Fa5QEkKQcxiNy//9wQYam7eWFrIDAWtoHNAZqxTepIKcTp55+ynP699wqx0MA4lOY
	WQOybRnC7F+/UUP2+g5z63O9/h6zQjUj/qEeCAgSg/xLWFZ74BJ30mSLa+MY8Jm8eyU=
X-Google-Smtp-Source: AGHT+IG7IiCq8HbPovNoY9QfTli24Vg9VcQ5x1xudp9ZCzIKIYVdI+ROAE8KuMpQ0Z/JpZOQN/fIRg==
X-Received: by 2002:a17:907:6095:b0:ac3:4138:6ae5 with SMTP id a640c23a62f3a-ac3f24c852dmr1781665666b.46.1742924493820;
        Tue, 25 Mar 2025 10:41:33 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] tools: Remove support for qemu-trad's battery reporting
Date: Tue, 25 Mar 2025 17:41:10 +0000
Message-ID: <20250325174110.467-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The way this undocumented feature works is via qemu-trad (who nobody
uses anymore), by intercepting 3 magic PIOs. 0x88 is one of them, and
it's probed by hvmloader as a means of detecting support for this (so,
on qemu-upstream this check always fails). If hvmloader detects the
feature, it appends an SSDT with AML inherited from some laptop ~20y
ago. QEMU then communicates with a userspace daemon (xenpmd) via an
undocumented xenstore key ("refreshbatterystatus") in order to report
battery levels.

Seeing how no one uses, mantains or cares about qemu-trad anymore, rip
it all out. The hvmloader check, the SSDT generation logic and xenpmd.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
If this feature is truly wanted, it must be implemented in
qemu-upstream. Ideally in a MUCH less roundabout way. And definitely
without involving xenstore.
---
 .gitignore                      |   1 -
 tools/Makefile                  |   1 -
 tools/firmware/hvmloader/util.c |   7 -
 tools/libacpi/Makefile          |   2 +-
 tools/libacpi/build.c           |   9 -
 tools/libacpi/libacpi.h         |   2 +-
 tools/libacpi/ssdt_pm.asl       | 409 -------------------------
 tools/xenpmd/Makefile           |  30 --
 tools/xenpmd/xenpmd.c           | 525 --------------------------------
 9 files changed, 2 insertions(+), 984 deletions(-)
 delete mode 100644 tools/libacpi/ssdt_pm.asl
 delete mode 100644 tools/xenpmd/Makefile
 delete mode 100644 tools/xenpmd/xenpmd.c

diff --git a/.gitignore b/.gitignore
index 53f5df000383..ea716b6dd7e0 100644
--- a/.gitignore
+++ b/.gitignore
@@ -186,7 +186,6 @@ tools/xcutils/readnotes
 tools/xenmon/xentrace_setmask
 tools/xenmon/xenbaked
 tools/xenpaging/xenpaging
-tools/xenpmd/xenpmd
 tools/xentop/xentop
 tools/xentrace/xentrace_setsize
 tools/xentrace/tbctl
diff --git a/tools/Makefile b/tools/Makefile
index e9e1cda3053f..935ba3936dd9 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -28,7 +28,6 @@ SUBDIRS-$(CONFIG_QEMU_TRAD) += qemu-xen-traditional-dir
 SUBDIRS-$(CONFIG_QEMU_XEN) += qemu-xen-dir
 endif
 
-SUBDIRS-y += xenpmd
 SUBDIRS-$(CONFIG_GOLANG) += golang
 SUBDIRS-y += xl
 SUBDIRS-y += helpers
diff --git a/tools/firmware/hvmloader/util.c b/tools/firmware/hvmloader/util.c
index 2d07ce129013..0e6457994595 100644
--- a/tools/firmware/hvmloader/util.c
+++ b/tools/firmware/hvmloader/util.c
@@ -776,11 +776,6 @@ int hpet_exists(unsigned long hpet_base)
     return ((hpet_id >> 16) == 0x8086);
 }
 
-static uint8_t battery_port_exists(void)
-{
-    return (inb(0x88) == 0x1F);
-}
-
 static unsigned long acpi_v2p(struct acpi_ctxt *ctxt, void *v)
 {
     return virt_to_phys(v);
@@ -900,8 +895,6 @@ void hvmloader_acpi_build_tables(struct acpi_config *config,
             config->pt.length = strtoll(s, NULL, 0);
     }
 
-    if ( battery_port_exists() )
-        config->table_flags |= ACPI_HAS_SSDT_PM;
     if ( !strncmp(xenstore_read("platform/acpi_s3", "1"), "1", 1)  )
         config->table_flags |= ACPI_HAS_SSDT_S3;
     if ( !strncmp(xenstore_read("platform/acpi_s4", "1"), "1", 1)  )
diff --git a/tools/libacpi/Makefile b/tools/libacpi/Makefile
index b21a64c6b441..e57873b361f4 100644
--- a/tools/libacpi/Makefile
+++ b/tools/libacpi/Makefile
@@ -15,7 +15,7 @@ C_SRC-$(CONFIG_X86) = dsdt_anycpu.c dsdt_15cpu.c dsdt_anycpu_qemu_xen.c dsdt_pvh
 C_SRC-$(CONFIG_ARM_64) = dsdt_anycpu_arm.c
 DSDT_FILES ?= $(C_SRC-y)
 C_SRC = $(addprefix $(ACPI_BUILD_DIR)/, $(DSDT_FILES))
-H_SRC = $(addprefix $(ACPI_BUILD_DIR)/, ssdt_s3.h ssdt_s4.h ssdt_pm.h)
+H_SRC = $(addprefix $(ACPI_BUILD_DIR)/, ssdt_s3.h ssdt_s4.h)
 H_SRC += $(addprefix $(ACPI_BUILD_DIR)/, ssdt_tpm.h ssdt_tpm2.h ssdt_laptop_slate.h)
 
 MKDSDT_CFLAGS-$(CONFIG_ARM_64) = -DCONFIG_ARM_64
diff --git a/tools/libacpi/build.c b/tools/libacpi/build.c
index 2f29863db154..f91b9a22e95e 100644
--- a/tools/libacpi/build.c
+++ b/tools/libacpi/build.c
@@ -11,7 +11,6 @@
 #include "ssdt_s4.h"
 #include "ssdt_tpm.h"
 #include "ssdt_tpm2.h"
-#include "ssdt_pm.h"
 #include "ssdt_laptop_slate.h"
 #include <xen/hvm/hvm_info_table.h>
 #include <xen/hvm/hvm_xs_strings.h>
@@ -371,14 +370,6 @@ static int construct_secondary_tables(struct acpi_ctxt *ctxt,
         table_ptrs[nr_tables++] = ctxt->mem_ops.v2p(ctxt, waet);
     }
 
-    if ( config->table_flags & ACPI_HAS_SSDT_PM )
-    {
-        ssdt = ctxt->mem_ops.alloc(ctxt, sizeof(ssdt_pm), 16);
-        if (!ssdt) return -1;
-        memcpy(ssdt, ssdt_pm, sizeof(ssdt_pm));
-        table_ptrs[nr_tables++] = ctxt->mem_ops.v2p(ctxt, ssdt);
-    }
-
     if ( config->table_flags & ACPI_HAS_SSDT_S3 )
     {
         ssdt = ctxt->mem_ops.alloc(ctxt, sizeof(ssdt_s3), 16);
diff --git a/tools/libacpi/libacpi.h b/tools/libacpi/libacpi.h
index deda39e5dbc4..79298beccf9e 100644
--- a/tools/libacpi/libacpi.h
+++ b/tools/libacpi/libacpi.h
@@ -15,7 +15,7 @@
 #define ACPI_HAS_COM2              (1<<1)
 #define ACPI_HAS_LPT1              (1<<2)
 #define ACPI_HAS_HPET              (1<<3)
-#define ACPI_HAS_SSDT_PM           (1<<4)
+/* (1<<4) deprecated */
 #define ACPI_HAS_SSDT_S3           (1<<5)
 #define ACPI_HAS_SSDT_S4           (1<<6)
 #define ACPI_HAS_TPM               (1<<7)
diff --git a/tools/libacpi/ssdt_pm.asl b/tools/libacpi/ssdt_pm.asl
deleted file mode 100644
index db578d10ac3e..000000000000
--- a/tools/libacpi/ssdt_pm.asl
+++ /dev/null
@@ -1,409 +0,0 @@
-/* SPDX-License-Identifier: LGPL-2.1-only */
-/*
- * ssdt_pm.asl
- *
- * Copyright (c) 2008  Kamala Narasimhan
- * Copyright (c) 2008  Citrix Systems, Inc.
- */
-
-/*
- * SSDT for extended power management within HVM guest. Power management beyond
- * S3, S4, S5 is handled by this vACPI layer.  
- *
- * Battery Management Implementation -
- * Xen vACPI layer exposes battery information to guest using CMBattery
- * interface. This virtual firmware CMBattery implementation is very similar to
- * the actual firmware CMBattery implementation.  In fact, a good part of the
- * below is heavily borrowed from the underlying firmware to support
- * pass-through and non-pass-through battery management approaches using the
- * same CMBattery interface implementation. When pass-through approach is used,
- * the battery ports are directly mapped using xc_domain_ioport_mapping thus
- * not relying on qemu battery port handling to intercept port reads/writes to
- * feed relevant battery information to the guest.
- *
- * Following are the battery ports read/written to in order to implement
- * battery support:
- * Battery command port - 0xb2
- * Batter data port     - 0x86
- * Battery commands (written to port 0xb2) -
- * 0x7b - Battery operation init
- * 0x7c - Type of battery operation
- * 0x79 - Get battery data length
- * 0x7d - Get battery data
- *
- * Also the following ports are used for debugging/logging:
- * 0xB040, 0xB044, 0xB046, 0xB048 
- */
-
-DefinitionBlock ("SSDT_PM.aml", "SSDT", 2, "Xen", "HVM", 0)
-{
-    Scope (\_SB)
-    {
-        OperationRegion (DBGA, SystemIO, 0xB040, 0x01)
-        Field (DBGA, ByteAcc, NoLock, Preserve)
-        {
-            DBG1,   8,
-        }
-
-        OperationRegion (DBGB, SystemIO, 0xB044, 0x01)
-        Field (DBGB, ByteAcc, NoLock, Preserve)
-        {
-            DBG2,   8,
-        }
-
-        OperationRegion (DBGC, SystemIO, 0xB046, 0x01)
-        Field (DBGC, ByteAcc, NoLock, Preserve)
-        {
-            DBG3,   8,
-        }
-
-        OperationRegion (DBGD, SystemIO, 0xB048, 0x01)
-        Field (DBGD, ByteAcc, NoLock, Preserve)
-        {
-            DBG4,   8,
-        }
-
-        OperationRegion (PRT1, SystemIO, 0xB2, 0x02)
-        Field (PRT1, ByteAcc, NoLock, Preserve)
-        {
-            PB2,   8,
-            PB2A,   8
-        }
-
-        OperationRegion (PRT2, SystemIO, 0x86, 0x01)
-        Field (PRT2, ByteAcc, NoLock, Preserve)
-        {
-            P86,   8
-        }
-
-        OperationRegion (PRT3, SystemIO, 0x88, 0x01)
-        Field (PRT3, ByteAcc, NoLock, Preserve)
-        {
-            P88,  8
-        }
-
-
-        Mutex (SYNC, 0x01)
-        Name (BUF0, Buffer (0x0100) {})
-        Name (BUF1, Buffer (0x08) {})
-        CreateWordField (BUF1, 0x00, BUFA)
-        CreateWordField (BUF1, 0x04, BUFB)
-        Method (ACQR, 0, NotSerialized)
-        {
-            Acquire (SYNC, 0xFFFF)
-            Store (0x00, BUFA)
-        }
-
-        /*
-         * Initialize relevant buffer to indicate what type of
-         * information is being queried and by what object (e.g.
-         * by battery device 0 or 1).
-         */
-        Method (INIT, 1, NotSerialized)
-        {
-            Store (BUFA, Local0)
-            Increment (Local0)
-            If (LLessEqual (Local0, SizeOf (BUF0)))
-            {
-                CreateByteField (BUF0, BUFA, TMP1)
-                Store (Arg0, TMP1)
-                Store (Local0, BUFA)
-            }
-        }
-
-        /*
-         * Write to battery port 0xb2 indicating the type of information
-         * to request, initialize battery data port 0x86 and then return 
-         * value provided through data port 0x86.
-         */
-        Method (WPRT, 2, NotSerialized)
-        {
-            Store (Arg1, \_SB.P86)
-            Store (Arg0, \_SB.PB2)
-            Store (Arg0, \_SB.DBG2)
-            Store (Arg1, \_SB.DBG4)
-            Store (\_SB.PB2, Local0)
-            While (LNotEqual (Local0, 0x00))
-            {
-                Store (\_SB.PB2, Local0)
-            }
-
-            Store (\_SB.P86, Local1)
-            Store (Local1, \_SB.DBG3)
-            Return (\_SB.P86)
-        }
-
-        /*
-         * Helper method 1 to write to battery command and data port. 
-         * 0x7c written to port 0xb2 indicating battery info type command.
-         * Value 1 or 2 written to port 0x86.  1 for BIF (batterry info) and 2 
-         * for BST (battery status).
-         */
-        Method (HLP1, 2, NotSerialized)
-        {
-            If (LLess (Arg1, SizeOf (Arg0)))
-            {
-                CreateByteField (Arg0, Arg1, TMP1)
-                WPRT (0x7C, TMP1)
-            }
-        }
-
-        /*
-         * Helper method 2.  Value 0x7b written to battery command port 0xb2
-         * indicating battery info initialization request.  First thing written
-         * to battery port before querying for further information pertaining
-         * to the battery.
-         */
-        Method (HLP2, 0, NotSerialized)
-        {
-            WPRT (0x7B, 0x00)
-            Store (0x00, Local0)
-            While (LLess (Local0, BUFA))
-            {
-                HLP1 (BUF0, Local0)
-                Increment (Local0)
-            }
-        }
-
-        /*
-         * Helper method 3. 0x7d written to battery command port 0xb2
-         * indicating request of battery data returned through battery data
-         * port 0x86.
-         */
-        Method (HLP3, 2, NotSerialized)
-        {
-            If (LLess (Arg1, SizeOf (Arg0)))
-            {
-                CreateByteField (Arg0, Arg1, TMP1)
-                Store (WPRT (0x7D, 0x00), TMP1)
-            }
-        }
-
-        /*
-         * Helper method 4 to indirectly get battery data and store it in a
-         * local buffer.
-         */
-        Method (HLP4, 0, NotSerialized)
-        {
-            Store (0x00, Local0)
-            While (LLess (Local0, BUFB))
-            {
-                Add (BUFA, Local0, Local1)
-                HLP3 (BUF0, Local1)
-                Increment (Local0)
-            }
-        }
-
-        /*
-         * Helper method 5 to indirectly initialize battery port and get
-         * battery data. Also get battery data length by writing 0x79 to
-         * battery command port and receiving battery data length in port 0x86.
-         */
-        Method (HLP5, 0, NotSerialized)
-        {
-            HLP2 ()
-            Store (WPRT (0x79, 0x00), BUFB)
-            Add (BUFA, BUFB, Local0)
-            If (LLess (SizeOf (BUF0), Local0))
-            {
-                Store (SizeOf (BUF0), Local0)
-                Subtract (Local0, BUFA, Local0)
-                Store (Local0, BUFB)
-            }
-
-            HLP4 ()
-        }
-
-        /* Helper method for local buffer housekeeping... */
-        Method (HLP6, 0, NotSerialized)
-        {
-            Store (BUFA, Local0)
-            Increment (Local0)
-            If (LLessEqual (Local0, SizeOf (BUF0)))
-            {
-                CreateByteField (BUF0, BUFA, TMP1)
-                Store (Local0, BUFA)
-                Return (TMP1)
-            }
-
-            Return (0x00)
-        }
-
-        /* Helper methods to help store battery data retrieved through
-         * battery data port 0x86. */
-
-        Method (HLP7, 0, NotSerialized)
-        {
-            Store (BUFA, Local0)
-            Add (Local0, 0x04, Local0)
-            If (LLessEqual (Local0, SizeOf (BUF0)))
-            {
-                CreateDWordField (BUF0, BUFA, SX22)
-                Store (Local0, BUFA)
-                Return (SX22)
-            }
-
-            Return (0x00)
-        }
-
-        Method (HLP8, 2, NotSerialized)
-        {
-            If (LLess (Arg1, SizeOf (Arg0)))
-            {
-                CreateByteField (Arg0, Arg1, TMP1)
-                Store (HLP6 (), TMP1)
-            }
-        }
-
-        Method (HLP9, 2, NotSerialized)
-        {
-            Store (0x00, Local0)
-            While (LLess (Local0, Arg1))
-            {
-                HLP8 (Arg0, Local0)
-                Increment (Local0)
-            }
-            Return (Arg0)
-        }
-
-        Method (HLPA, 0, NotSerialized)
-        {
-            Store (HLP6 (), Local0)
-            Return (HLP9 (Buffer (Local0) {}, Local0))
-        }
-
-        Method (REL, 0, NotSerialized)
-        {
-            Release (SYNC)
-        }
-
-        /* Future patches will extend AC object to better account for
-         * AC to DC transition and more. */
-        Device (AC)
-        {
-            Name (_HID, "ACPI0003")
-            Name (_PCL, Package (0x03)
-            {
-                \_SB,
-                BAT0,
-                BAT1 
-            })
-            Method (_PSR, 0, NotSerialized)
-            {
-                Return (0x0)
-            }
-
-            Method (_STA, 0, NotSerialized)
-            {
-                Return (0x0F)
-            }
-        }
-
-        /* Main battery information helper method. */
-        Name (BIFP, Package (0x0D) {})
-        Method (BIF, 1, NotSerialized)
-        {
-            ACQR ()
-            INIT (0x01)
-            INIT (Arg0)
-            HLP5 ()
-            Store (HLP7 (), Index (BIFP, 0x00))
-            Store (HLP7 (), Index (BIFP, 0x01))
-            Store (HLP7 (), Index (BIFP, 0x02))
-            Store (HLP7 (), Index (BIFP, 0x03))
-            Store (HLP7 (), Index (BIFP, 0x04))
-            Store (HLP7 (), Index (BIFP, 0x05))
-            Store (HLP7 (), Index (BIFP, 0x06))
-            Store (HLP7 (), Index (BIFP, 0x07))
-            Store (HLP7 (), Index (BIFP, 0x08))
-            Store (HLPA (), Index (BIFP, 0x09))
-            Store (HLPA (), Index (BIFP, 0x0A))
-            Store (HLPA (), Index (BIFP, 0x0B))
-            Store (HLPA (), Index (BIFP, 0x0C))
-            REL ()
-            Return (BIFP)
-        }
-
-        /* Battery object 0 - Always exposed as present. */
-        Device (BAT0)
-        {
-            Name (_HID, EisaId ("PNP0C0A"))
-            Name (_UID, 0x01)
-            Name (_PCL, Package (0x01)
-            {
-                \_SB
-            })
-
-            /* Always returns 0x1f indicating battery present. */
-            Method (_STA, 0, NotSerialized)
-            {
-                Store (\_SB.P88, Local0)
-                Return ( Local0 )
-            }
-
-            /* Battery generic info: design capacity, voltage, model # etc. */
-            Method (_BIF, 0, NotSerialized)
-            {
-                //Store (1, \_SB.DBG1)
-                Store(BIF ( 0x01 ), Local0)
-                //Store (2, \_SB.DBG1)
-                Return( Local0 )
-            }
-
-            /* Battery status including battery charging/discharging rate. */
-            Method (_BST, 0, NotSerialized)
-            {
-                Store (1, \_SB.DBG1)
-                ACQR ()
-                INIT (0x02)
-                INIT (0x01)
-                HLP5 ()
-                Store (Package (0x04) {}, Local0)
-                Store (HLP7 (), Index (Local0, 0x00))
-                Store (HLP7 (), Index (Local0, 0x01))
-                Store (HLP7 (), Index (Local0, 0x02))
-                Store (HLP7 (), Index (Local0, 0x03))
-                REL ()
-                Store (2, \_SB.DBG1)
-                Return (Local0)
-            }
-        }
-
-        /* Battery object 1 - Always exposed as not present. */
-        Device (BAT1)
-        {
-            Name (_HID, EisaId ("PNP0C0A"))
-            Name (_UID, 0x02)
-            Name (_PCL, Package (0x01)
-            {
-                \_SB
-            })
-            Method (_STA, 0, NotSerialized)
-            {
-                Return (0x0F)
-            }
-
-            Method (_BIF, 0, NotSerialized)
-            {
-                Store (\_SB.PB2, Local0)
-                Return (BIF (0x02))
-            }
-
-            Method (_BST, 0, NotSerialized)
-            {
-                ACQR ()
-                INIT (0x02)
-                INIT (0x02)
-                HLP5 ()
-                Store (Package (0x04) {}, Local0)
-                Store (HLP7 (), Index (Local0, 0x00))
-                Store (HLP7 (), Index (Local0, 0x01))
-                Store (HLP7 (), Index (Local0, 0x02))
-                Store (HLP7 (), Index (Local0, 0x03))
-                REL ()
-                Return (Local0)
-            }
-        }
-    }
-}
-
diff --git a/tools/xenpmd/Makefile b/tools/xenpmd/Makefile
deleted file mode 100644
index 8da20510b54a..000000000000
--- a/tools/xenpmd/Makefile
+++ /dev/null
@@ -1,30 +0,0 @@
-XEN_ROOT=$(CURDIR)/../..
-include $(XEN_ROOT)/tools/Rules.mk
-
-CFLAGS += $(CFLAGS_libxenstore)
-
-LDLIBS += $(LDLIBS_libxenstore)
-
-.PHONY: all
-all: xenpmd
-
-.PHONY: install
-install: all
-	$(INSTALL_DIR) $(DESTDIR)$(sbindir)
-	$(INSTALL_PROG) xenpmd $(DESTDIR)$(sbindir)
-
-.PHONY: clean
-clean:
-	$(RM) -f xenpmd xenpmd.o $(DEPS_RM)
-
-.PHONY: distclean
-distclean: clean
-
-.PHONY: uninstall
-uninstall:
-	rm -f $(DESTDIR)$(sbindir)/xenpmd
-
-xenpmd: xenpmd.o Makefile
-	$(CC) $(LDFLAGS) $< -o $@ $(LDLIBS) $(APPEND_LDFLAGS)
-
--include $(DEPS_INCLUDE)
diff --git a/tools/xenpmd/xenpmd.c b/tools/xenpmd/xenpmd.c
deleted file mode 100644
index 15e6169c449d..000000000000
--- a/tools/xenpmd/xenpmd.c
+++ /dev/null
@@ -1,525 +0,0 @@
-/*
- * xenpmd.c
- *
- * xen power management daemon - Facilitates power management 
- * functionality within xen guests.
- *
- * Copyright (c) 2008  Kamala Narasimhan 
- * Copyright (c) 2008  Citrix Systems, Inc.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
- */
-
-/* Xen extended power management support provides HVM guest power management
- * features beyond S3, S4, S5.  For example, it helps expose system level 
- * battery status and battery meter information and in future will be extended
- * to include more power management support.  This extended power management 
- * support is enabled by setting xen_extended_power_mgmt to 1 or 2 in the HVM
- * config file.  When set to 2, non-pass through mode is enabled which heavily
- * relies on this power management daemon to glean battery information from 
- * dom0 and store it xenstore which would then be queries and used by qemu and 
- * passed to the guest when appropriate battery ports are read/written to.
- */
-
-#define _GNU_SOURCE         /* for asprintf() */
-#include <stdio.h>
-#include <stdarg.h>
-#include <string.h>
-#include <stdlib.h>
-#include <dirent.h>
-#include <unistd.h>
-#include <sys/stat.h>
-#include <xenstore.h>
-#include <assert.h>
-
-/* #define RUN_STANDALONE */
-#define RUN_IN_SIMULATE_MODE
-
-enum BATTERY_INFO_TYPE {
-    BIF, 
-    BST 
-};
-
-enum BATTERY_PRESENT {
-    NO, 
-    YES 
-};
-
-enum BATTERY_TECHNOLOGY {
-    NON_RECHARGEABLE, 
-    RECHARGEABLE 
-};
-
-struct battery_info {
-    enum BATTERY_PRESENT    present;
-    unsigned long           design_capacity;
-    unsigned long           last_full_capacity;
-    enum BATTERY_TECHNOLOGY battery_technology;
-    unsigned long           design_voltage;
-    unsigned long           design_capacity_warning;
-    unsigned long           design_capacity_low;
-    unsigned long           capacity_granularity_1;
-    unsigned long           capacity_granularity_2;
-    char                    model_number[32];
-    char                    serial_number[32];
-    char                    battery_type[32];
-    char                    oem_info[32];
-};
-
-struct battery_status {
-    enum BATTERY_PRESENT    present;
-    unsigned long           state;
-    unsigned long           present_rate;
-    unsigned long           remaining_capacity;
-    unsigned long           present_voltage;
-};
-
-static struct xs_handle *xs;
-
-#ifdef RUN_IN_SIMULATE_MODE
-    #define BATTERY_DIR_PATH "/tmp/battery"
-    #define BATTERY_INFO_FILE_PATH "/tmp/battery/%s/info" 
-    #define BATTERY_STATE_FILE_PATH "/tmp/battery/%s/state"
-#else
-    #define BATTERY_DIR_PATH "/proc/acpi/battery"
-    #define BATTERY_INFO_FILE_PATH "/proc/acpi/battery/%s/info"
-    #define BATTERY_STATE_FILE_PATH "/proc/acpi/battery/%s/state"
-#endif
-
-FILE *get_next_battery_file(DIR *battery_dir, 
-                            enum BATTERY_INFO_TYPE battery_info_type)
-{
-    FILE *file = 0;
-    struct dirent *dir_entries;
-    char *file_name;
-    int ret;
-    
-    do 
-    {
-        dir_entries = readdir(battery_dir);
-        if ( !dir_entries ) 
-            return 0;
-        if ( strlen(dir_entries->d_name) < 4 )
-            continue;
-        if ( battery_info_type == BIF ) 
-            ret = asprintf(&file_name, BATTERY_INFO_FILE_PATH,
-                     dir_entries->d_name);
-        else 
-            ret = asprintf(&file_name, BATTERY_STATE_FILE_PATH,
-                     dir_entries->d_name);
-        /* This should not happen but is needed to pass gcc checks */
-        if (ret < 0)
-            continue;
-        file = fopen(file_name, "r");
-        free(file_name);
-    } while ( !file );
-
-    return file;
-}
-
-void set_attribute_battery_info(char *attrib_name,
-                                char *attrib_value,
-                                struct battery_info *info)
-{
-    if ( strstr(attrib_name, "present") ) 
-    {
-        if ( strstr(attrib_value, "yes") ) 
-            info->present = YES;
-        return;
-    }
-
-    if ( strstr(attrib_name, "design capacity warning") ) 
-    {
-        info->design_capacity_warning = strtoull(attrib_value, NULL, 10);
-        return;
-    }
-
-    if ( strstr(attrib_name, "design capacity low") ) 
-    {
-        info->design_capacity_low = strtoull(attrib_value, NULL, 10);
-        return;
-    }
-
-    if ( strstr(attrib_name, "design capacity") ) 
-    { 
-        info->design_capacity = strtoull(attrib_value, NULL, 10);
-        return;
-    }
-
-    if ( strstr(attrib_name, "last full capacity") ) 
-    {
-        info->last_full_capacity = strtoull(attrib_value, NULL, 10);
-        return;
-    }
-
-    if ( strstr(attrib_name, "design voltage") ) 
-    {
-        info->design_voltage = strtoull(attrib_value, NULL, 10);
-        return;
-    }
-
-    if ( strstr(attrib_name, "capacity granularity 1") ) 
-    {
-        info->capacity_granularity_1 = strtoull(attrib_value, NULL, 10);
-        return;
-    }
-
-    if ( strstr(attrib_name, "capacity granularity 2") ) 
-    {
-        info->capacity_granularity_2 = strtoull(attrib_value, NULL, 10);
-        return;
-    }
-
-    if ( strstr(attrib_name, "battery technology") ) 
-    {
-        if ( strncmp(attrib_value, "rechargeable",
-                     strlen("rechargeable")) == 0 ) 
-            info->battery_technology = RECHARGEABLE;
-        else 
-            info->battery_technology = NON_RECHARGEABLE;
-        return;
-    }
-
-    if ( strstr(attrib_name, "model number") ) 
-    {
-        strncpy(info->model_number, attrib_value, 31);
-        info->model_number[31] = '\0';
-        return;
-    }
-
-    if ( strstr(attrib_name, "serial number") ) 
-    {
-        strncpy(info->serial_number, attrib_value, 31);
-        info->serial_number[31] = '\0';
-        return;
-    }
-
-    if ( strstr(attrib_name, "battery type") ) 
-    {
-        strncpy(info->battery_type, attrib_value, 31);
-        info->battery_type[31] = '\0';
-        return;
-    }
-
-    if ( strstr(attrib_name, "OEM info") ) 
-    {
-        strncpy(info->oem_info, attrib_value, 31);
-        info->oem_info[31] = '\0';
-        return;
-    }
-
-    return;
-}
-
-void set_attribute_battery_status(char *attrib_name, 
-                                  char *attrib_value,
-                                  struct battery_status *status)
-{
-    if ( strstr(attrib_name, "charging state") ) 
-    {
-        /* Check this, below is half baked */
-        if ( strstr(attrib_value, "charged") ) 
-            status->state = 0;
-        else 
-            status->state = 1;
-        return;
-    }
-
-    if ( strstr(attrib_name, "present rate") ) 
-    {
-        status->present_rate = strtoull(attrib_value, NULL, 10);
-        return;
-    }
-
-    if ( strstr(attrib_name, "remaining capacity") ) 
-    {
-        status->remaining_capacity = strtoull(attrib_value, NULL, 10);
-        return;
-    }
-
-    if ( strstr(attrib_name, "present voltage") ) 
-    {
-        status->present_voltage = strtoull(attrib_value, NULL, 10);
-        return;
-    }
-
-    if ( strstr(attrib_name, "present") ) 
-    {
-        if ( strstr(attrib_value, "yes") ) 
-            status->present = YES;
-        return;
-    }
-}
-
-void parse_battery_info_or_status(char *line_info,
-                                  enum BATTERY_INFO_TYPE type,
-                                  void *info_or_status)
-{
-    char attrib_name[128];
-    char attrib_value[64];
-    char *delimiter;
-    unsigned long length;
-
-    length = strlen(line_info);
-    delimiter = (char *) strchr( line_info, ':');
-    if ( (!delimiter) || (delimiter == line_info) ||
-         (delimiter == line_info + length) ) 
-        return;
-
-    strncpy(attrib_name, line_info, delimiter-line_info);
-    while ( *(delimiter+1) == ' ' ) 
-    {
-        delimiter++;
-        if ( delimiter+1 == line_info + length)
-            return;
-    }
-    strncpy(attrib_value, delimiter+1, 
-            (unsigned long)line_info + length -(unsigned long)delimiter); 
-    
-    if ( type == BIF ) 
-        set_attribute_battery_info(attrib_name, attrib_value,
-                                   (struct battery_info *)info_or_status);
-    else 
-        set_attribute_battery_status(attrib_name, attrib_value,
-                                     (struct battery_status *)info_or_status);
-
-    return;
-}
-
-int get_next_battery_info_or_status(DIR *battery_dir,
-                                    enum BATTERY_INFO_TYPE type,
-                                    void *info_or_status)
-{
-    FILE *file;
-    char line_info[256];
-
-    if  ( !info_or_status )
-        return 0;
-
-    if (type == BIF) 
-        memset(info_or_status, 0, sizeof(struct battery_info));
-    else 
-        memset(info_or_status, 0, sizeof(struct battery_status));
-
-    file = get_next_battery_file(battery_dir, type);
-    if ( !file )
-        return 0;
-
-    while ( fgets(line_info, sizeof(line_info), file) != NULL ) 
-        parse_battery_info_or_status(line_info, type, info_or_status);
-
-    fclose(file);
-    return 1;
-}
-
-#ifdef RUN_STANDALONE
-void print_battery_info(struct battery_info *info)
-{
-    printf("present:                %d\n", info->present);
-    printf("design capacity:        %d\n", info->design_capacity);
-    printf("last full capacity:     %d\n", info->last_full_capacity);
-    printf("battery technology:     %d\n", info->battery_technology);
-    printf("design voltage:         %d\n", info->design_voltage);
-    printf("design capacity warning:%d\n", info->design_capacity_warning);
-    printf("design capacity low:    %d\n", info->design_capacity_low);
-    printf("capacity granularity 1: %d\n", info->capacity_granularity_1);
-    printf("capacity granularity 2: %d\n", info->capacity_granularity_2);
-    printf("model number:           %s\n", info->model_number);
-    printf("serial number:          %s\n", info->serial_number);
-    printf("battery type:           %s\n", info->battery_type);
-    printf("OEM info:               %s\n", info->oem_info);
-}
-#endif /*RUN_STANDALONE*/
-
-void write_ulong_lsb_first(char *temp_val, unsigned long val)
-{
-    snprintf(temp_val, 9, "%02x%02x%02x%02x", (unsigned int)val & 0xff, 
-    (unsigned int)(val & 0xff00) >> 8, (unsigned int)(val & 0xff0000) >> 16, 
-    (unsigned int)(val & 0xff000000) >> 24);
-}
-
-void write_battery_info_to_xenstore(struct battery_info *info)
-{
-    char val[1024], string_info[256];
-    unsigned int len;
-
-    xs_mkdir(xs, XBT_NULL, "/pm");
-   
-    memset(val, 0, 1024);
-    memset(string_info, 0, 256);
-    /* write 9 dwords (so 9*4) + length of 4 strings + 4 null terminators */
-    len = 9 * 4 + strlen(info->model_number) + strlen(info->serial_number) +
-          strlen(info->battery_type) + strlen(info->oem_info) + 4;
-    assert(len < 255);
-    snprintf(val, 3, "%02x", len);
-    write_ulong_lsb_first(val+2, info->present);
-    write_ulong_lsb_first(val+10, info->design_capacity);
-    write_ulong_lsb_first(val+18, info->last_full_capacity);
-    write_ulong_lsb_first(val+26, info->battery_technology);
-    write_ulong_lsb_first(val+34, info->design_voltage);
-    write_ulong_lsb_first(val+42, info->design_capacity_warning);
-    write_ulong_lsb_first(val+50, info->design_capacity_low);
-    write_ulong_lsb_first(val+58, info->capacity_granularity_1);
-    write_ulong_lsb_first(val+66, info->capacity_granularity_2);
-
-    snprintf(string_info, 256, "%02x%s%02x%s%02x%s%02x%s", 
-             (unsigned int)strlen(info->model_number), info->model_number,
-             (unsigned int)strlen(info->serial_number), info->serial_number,
-             (unsigned int)strlen(info->battery_type), info->battery_type,
-             (unsigned int)strlen(info->oem_info), info->oem_info);
-    strncat(val+73, string_info, 1024-73-1);
-    xs_write(xs, XBT_NULL, "/pm/bif", 
-             val, 73+8+strlen(info->model_number)+strlen(info->serial_number)+
-             strlen(info->battery_type)+strlen(info->oem_info)+1);
-}
-
-int write_one_time_battery_info(void)
-{
-    DIR *dir;
-    int ret = 0;
-    struct battery_info info;
-    
-    dir = opendir(BATTERY_DIR_PATH);
-    if ( !dir )
-        return 0;
-
-    while ( get_next_battery_info_or_status(dir, BIF, (void *)&info) ) 
-    {
-#ifdef RUN_STANDALONE
-        print_battery_info(&info);
-#endif
-        if ( info.present == YES ) 
-        {
-            write_battery_info_to_xenstore(&info);
-            ret = 1;
-            break; /* rethink this... */
-        }
-    }
-
-    closedir(dir);
-    return ret;
-}
-
-#ifdef RUN_STANDALONE
-void print_battery_status(struct battery_status *status)
-{
-    printf("present:                     %d\n", status->present);
-    printf("Battery state                %d\n", status->state);
-    printf("Battery present rate         %d\n", status->present_rate);
-    printf("Battery remining capacity    %d\n", status->remaining_capacity);
-    printf("Battery present voltage      %d\n", status->present_voltage);
-}
-#endif /*RUN_STANDALONE*/
-
-void write_battery_status_to_xenstore(struct battery_status *status)
-{
-    char val[35];
-
-    xs_mkdir(xs, XBT_NULL, "/pm");
-
-    memset(val, 0, 35);
-    snprintf(val, 3, "%02x", 16);
-    write_ulong_lsb_first(val+2, status->state);
-    write_ulong_lsb_first(val+10, status->present_rate);
-    write_ulong_lsb_first(val+18, status->remaining_capacity);
-    write_ulong_lsb_first(val+26, status->present_voltage);
-
-    xs_write(xs, XBT_NULL, "/pm/bst", val, 35);
-}
-
-int wait_for_and_update_battery_status_request(void)
-{
-    DIR *dir;
-    int ret = 0;
-    unsigned int count;
-    struct battery_status status;
-
-    while ( true )
-    {
-        /* KN:@TODO - It is rather inefficient to not cache the file handle.
-         *  Switch to caching file handle. 
-         */
-        dir = opendir(BATTERY_DIR_PATH);
-        if ( !dir )
-            return 0;
-
-        while ( get_next_battery_info_or_status(dir, BST, (void *)&status) ) 
-        {
-#ifdef RUN_STANDALONE
-            print_battery_status(&status);
-#endif
-            if ( status.present == YES ) 
-            {
-                write_battery_status_to_xenstore(&status);
-                ret = 1;
-                /* rethink this; though I have never seen, there might be
-                 * systems out there with more than one battery device 
-                 * present
-                 */
-                break;
-            }
-        }
-        closedir(dir);
-        xs_watch(xs, "/pm/events", "refreshbatterystatus");
-        xs_read_watch(xs, &count); 
-    }
-
-    return ret;
-}
-
-/* Borrowed daemonize from xenstored - Initially written by Stevens. */
-static void daemonize(void)
-{
-    pid_t pid;
-
-    if ( (pid = fork()) < 0 )
-        exit(1);
-
-    if ( pid != 0 )
-        exit(0);
-
-    setsid();
-
-    if ( (pid = fork()) < 0 )
-        exit(1);
-
-    if ( pid != 0 )
-        exit(0);
-
-    if ( chdir("/") == -1 )
-        exit(1);
-
-    umask(0);
-}
-
-int main(int argc, char *argv[])
-{
-#ifndef RUN_STANDALONE
-    daemonize();
-#endif
-    xs = xs_open(0);
-    if ( xs == NULL ) 
-        return -1;
-
-    if ( write_one_time_battery_info() == 0 ) 
-    {
-        xs_close(xs);
-        return -1;
-    }
-
-    wait_for_and_update_battery_status_request();
-    xs_close(xs);
-    return 0;
-}
-
-- 
2.48.1


