Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 202F3737289
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 19:17:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551985.861790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBeyi-0005Sq-VW; Tue, 20 Jun 2023 17:17:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551985.861790; Tue, 20 Jun 2023 17:17:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBeyi-0005QW-Se; Tue, 20 Jun 2023 17:17:16 +0000
Received: by outflank-mailman (input) for mailman id 551985;
 Tue, 20 Jun 2023 17:17:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/wkg=CI=gmail.com=jupham125@srs-se1.protection.inumbo.net>)
 id 1qBeyi-0005QM-4b
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 17:17:16 +0000
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [2607:f8b0:4864:20::b2f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c120d33-0f8e-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 19:17:13 +0200 (CEST)
Received: by mail-yb1-xb2f.google.com with SMTP id
 3f1490d57ef6-bd5f20508f2so4829318276.3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jun 2023 10:17:13 -0700 (PDT)
Received: from joel-Precision-7920-Tower.. ([24.53.71.1])
 by smtp.gmail.com with ESMTPSA id
 f81-20020a25cf54000000b00bcc0f2e4f05sm461938ybg.59.2023.06.20.10.17.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 10:17:11 -0700 (PDT)
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
X-Inumbo-ID: 4c120d33-0f8e-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687281432; x=1689873432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ukzGpEENG0RlgItA22pHLWRfkG/TIG2MuZvDy/EWEFU=;
        b=Ui3x4e2d1x7msUonmnEtV2oZD/YnB5TKiukjofsjZMyaIwsa94EELiqp60Boh7w1Pd
         liSVUEjzvbLj7tNmPLSnwXvkE984RpJyNnkXgYJZxhasBdPPGttj7ZGEV4y39soxZp9c
         N4ZfA42vod69hfNmN9IJ1UuqF00rTRL9LirV/KUu30KsvxUra2WpOikuQNaTy6FXa0jV
         nKpdECVzHl/hIa3mN1mFGSpHgP0PQFsMh30tOsQBMSO9WejSZNk1cKAFk3FzuDiNVIOd
         AaJ0V/WtfyIMRW0c+vwlTxx3oFUinCAo0Uwq+c2hlryeCvv7la++wJp5beXgaNJc1scy
         Jopw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687281432; x=1689873432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ukzGpEENG0RlgItA22pHLWRfkG/TIG2MuZvDy/EWEFU=;
        b=KQiCI/HFAq1BTHOH2Jb157hnKkgSjfLMRpVl8Hludy2nCWRLkBxYdG8wQX4Enmc4kZ
         sJaWgionB+iqfo8hBR1OcYh9V95j0ushUrJz2sKD3sf3yTmV0/UW4M+nnHHSuXfFVZ7l
         jl6mqFtAHrdN+XmB3ysQ6LJbbiEtPxCqlSrXHsE0uRPhDSEyLygTkdDElRwD9hv3rUuT
         R11ajEFJsgdd5clerzerlIDfzIzyKtpBM4A6DeFhBRsLMjlPFqvgvKkoXOszNapkgRYb
         V4++5REnIorYVj38+HcvFEBJALNbmKh29VgfJb1caIoS4Enenditz0KqLKIBlK8q3RR3
         jEDA==
X-Gm-Message-State: AC+VfDwwPsMGEhj7GwmB2uNYvazuOucxwyqLyNmV8TWj75tsjzEukYS/
	7Q9//S7Klqg7rYkJIiQnoC+WMKlePjRr+g==
X-Google-Smtp-Source: ACHHUZ7sEKIwUdOwq8v0ZiXEvcWcwlhyvF7IGBk2nsbUQnRGQM9cgKjioeDKihYNY1gaGXgxfzYrGQ==
X-Received: by 2002:a25:b195:0:b0:b8e:cb88:1b69 with SMTP id h21-20020a25b195000000b00b8ecb881b69mr10005548ybj.34.1687281431908;
        Tue, 20 Jun 2023 10:17:11 -0700 (PDT)
From: Joel Upham <jupham125@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Joel Upham <jupham125@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 01/12] libacpi: new DSDT ACPI table for Q35
Date: Tue, 20 Jun 2023 13:15:41 -0400
Message-Id: <b8b4f8807a6f7f6b5097369ff12b9c7203aa7624.1687215890.git.jupham125@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687215890.git.jupham125@gmail.com>
References: <cover.1687215890.git.jupham125@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds the DSDT table for Q35 (new tools/libacpi/dsdt_q35.asl
file). There are not many differences with dsdt.asl (for i440) at the
moment, namely:

- BDF location of LPC Controller
- Minor changes related to FDC detection
- Addition of _OSC method to inform OSPM about PCIe features supported

As we are still using 4 PCI router links and their corresponding
device/register addresses are same (offset 0x60), no need to change PCI
routing descriptions.

Also, ACPI hotplug is still used to control passed through device hot
(un)plug (as it was for i440).

Signed-off-by: Alexey Gerasimenko <x1917x@xxxxxxxxx>
Signed-off-by: Joel Upham <jupham125@gmail.com>
---
 tools/libacpi/dsdt_q35.asl | 578 +++++++++++++++++++++++++++++++++++++
 1 file changed, 578 insertions(+)
 create mode 100644 tools/libacpi/dsdt_q35.asl

diff --git a/tools/libacpi/dsdt_q35.asl b/tools/libacpi/dsdt_q35.asl
new file mode 100644
index 0000000000..1ec32a8010
--- /dev/null
+++ b/tools/libacpi/dsdt_q35.asl
@@ -0,0 +1,578 @@
+/******************************************************************************
+ * DSDT for Xen with Qemu device model (for Q35 machine)
+ *
+ * Copyright (c) 2004, Intel Corporation.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU Lesser General Public License as published
+ * by the Free Software Foundation; version 2.1 only. with the special
+ * exception on linking described in file LICENSE.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU Lesser General Public License for more details.
+ */
+
+DefinitionBlock ("DSDT.aml", "DSDT", 2, "Xen", "HVM", 0)
+{
+    Name (\PMBS, 0x0C00)
+    Name (\PMLN, 0x08)
+    Name (\IOB1, 0x00)
+    Name (\IOL1, 0x00)
+    Name (\APCB, 0xFEC00000)
+    Name (\APCL, 0x00010000)
+    Name (\PUID, 0x00)
+
+
+    Scope (\_SB)
+    {
+
+        /* Fix HCT test for 0x400 pci memory:
+         * - need to report low 640 MB mem as motherboard resource
+         */
+       Device(MEM0)
+       {
+           Name(_HID, EISAID("PNP0C02"))
+           Name(_CRS, ResourceTemplate() {
+               QWordMemory(
+                    ResourceConsumer, PosDecode, MinFixed,
+                    MaxFixed, Cacheable, ReadWrite,
+                    0x00000000,
+                    0x00000000,
+                    0x0009ffff,
+                    0x00000000,
+                    0x000a0000)
+           })
+       }
+
+       Device (PCI0)
+       {
+           Name (_HID, EisaId ("PNP0A08"))
+           Name(_CID, EisaId("PNP0A03"))
+           Name (_UID, 0x00)
+           Name (_ADR, 0x00)
+           Name (_BBN, 0x00)
+
+           /* _OSC, modified from ASL sample in ACPI spec */
+           Name(SUPP, 0) /* PCI _OSC Support Field value */
+           Name(CTRL, 0) /* PCI _OSC Control Field value */
+           Method(_OSC, 4) {
+               /* Create DWORD-addressable fields from the Capabilities Buffer */
+               CreateDWordField(Arg3, 0, CDW1)
+
+               /* Switch by UUID.
+                * Only PCI Host Bridge Device capabilities UUID used for now
+                */
+               If (LEqual(Arg0, ToUUID("33DB4D5B-1FF7-401C-9657-7441C03DD766"))) {
+                   /* Create DWORD-addressable fields from the Capabilities Buffer */
+                   CreateDWordField(Arg3, 4, CDW2)
+                   CreateDWordField(Arg3, 8, CDW3)
+
+                   /* Save Capabilities DWORD2 & 3 */
+                   Store(CDW2, SUPP)
+                   Store(CDW3, CTRL)
+
+                   /* Validate Revision DWORD */
+                   If (LNotEqual(Arg1, One)) {
+                       /* Unknown revision */
+                       /* Support and Control DWORDs will be returned anyway */
+                       Or(CDW1, 0x08, CDW1)
+                   }
+
+                   /* Control field bits are:
+                    * bit 0    PCI Express Native Hot Plug control
+                    * bit 1    SHPC Native Hot Plug control
+                    * bit 2    PCI Express Native Power Management Events control
+                    * bit 3    PCI Express Advanced Error Reporting control
+                    * bit 4    PCI Express Capability Structure control
+                    */
+
+                   /* Always allow native PME, AER (no dependencies)
+                    * Never allow SHPC (no SHPC controller in this system)
+                    * Do not allow PCIe Capability Structure control for now
+                    * Also, ACPI hotplug is used for now instead of PCIe
+                    * Native Hot Plug
+                    */
+                   And(CTRL, 0x0C, CTRL)
+
+                   If (LNotEqual(CDW3, CTRL)) {
+                       /* Some of Capabilities bits were masked */
+                       Or(CDW1, 0x10, CDW1)
+                   }
+                   /* Update DWORD3 in the buffer */
+                   Store(CTRL, CDW3)
+               } Else {
+                   Or(CDW1, 4, CDW1) /* Unrecognized UUID */
+               }
+               Return (Arg3)
+           }
+           /* end of _OSC */
+
+
+           /* Make cirrues VGA S3 suspend/resume work in Windows XP/2003 */
+           Device (VGA)
+           {
+               Name (_ADR, 0x00020000)
+
+               Method (_S1D, 0, NotSerialized)
+               {
+                   Return (0x00)
+               }
+               Method (_S2D, 0, NotSerialized)
+               {
+                   Return (0x00)
+               }
+               Method (_S3D, 0, NotSerialized)
+               {
+                   Return (0x00)
+               }
+           }
+
+           Method (_CRS, 0, NotSerialized)
+           {
+               Store (ResourceTemplate ()
+               {
+                   /* bus number is from 0 - 255*/
+                   WordBusNumber(
+                        ResourceProducer, MinFixed, MaxFixed, SubDecode,
+                        0x0000,
+                        0x0000,
+                        0x00FF,
+                        0x0000,
+                        0x0100)
+                    IO (Decode16, 0x0CF8, 0x0CF8, 0x01, 0x08)
+                    WordIO(
+                        ResourceProducer, MinFixed, MaxFixed, PosDecode,
+                        EntireRange,
+                        0x0000,
+                        0x0000,
+                        0x0CF7,
+                        0x0000,
+                        0x0CF8)
+                    WordIO(
+                        ResourceProducer, MinFixed, MaxFixed, PosDecode,
+                        EntireRange,
+                        0x0000,
+                        0x0D00,
+                        0xFFFF,
+                        0x0000,
+                        0xF300)
+
+                    /* reserve memory for pci devices */
+                    DWordMemory(
+                        ResourceProducer, PosDecode, MinFixed, MaxFixed,
+                        WriteCombining, ReadWrite,
+                        0x00000000,
+                        0x000A0000,
+                        0x000BFFFF,
+                        0x00000000,
+                        0x00020000)
+
+                    DWordMemory(
+                        ResourceProducer, PosDecode, MinFixed, MaxFixed,
+                        NonCacheable, ReadWrite,
+                        0x00000000,
+                        0xF0000000,
+                        0xF4FFFFFF,
+                        0x00000000,
+                        0x05000000,
+                        ,, _Y01)
+
+                    QWordMemory (
+                        ResourceProducer, PosDecode, MinFixed, MaxFixed,
+                        NonCacheable, ReadWrite,
+                        0x0000000000000000,
+                        0x0000000FFFFFFFF0,
+                        0x0000000FFFFFFFFF,
+                        0x0000000000000000,
+                        0x0000000000000010,
+                        ,, _Y02)
+
+                }, Local1)
+
+                CreateDWordField(Local1, \_SB.PCI0._CRS._Y01._MIN, MMIN)
+                CreateDWordField(Local1, \_SB.PCI0._CRS._Y01._MAX, MMAX)
+                CreateDWordField(Local1, \_SB.PCI0._CRS._Y01._LEN, MLEN)
+
+                Store(\_SB.PMIN, MMIN)
+                Store(\_SB.PLEN, MLEN)
+                Add(MMIN, MLEN, MMAX)
+                Subtract(MMAX, One, MMAX)
+
+                /*
+                 * WinXP / Win2K3 blue-screen for operations on 64-bit values.
+                 * Therefore we need to split the 64-bit calculations needed
+                 * here, but different iasl versions evaluate name references
+                 * to integers differently:
+                 * Year (approximate)          2006    2008    2012
+                 * \_SB.PCI0._CRS._Y02         zero   valid   valid
+                 * \_SB.PCI0._CRS._Y02._MIN   valid   valid    huge
+                 */
+                If(LEqual(Zero, \_SB.PCI0._CRS._Y02)) {
+                    Subtract(\_SB.PCI0._CRS._Y02._MIN, 14, Local0)
+                } Else {
+                    Store(\_SB.PCI0._CRS._Y02, Local0)
+                }
+                CreateDWordField(Local1, Add(Local0, 14), MINL)
+                CreateDWordField(Local1, Add(Local0, 18), MINH)
+                CreateDWordField(Local1, Add(Local0, 22), MAXL)
+                CreateDWordField(Local1, Add(Local0, 26), MAXH)
+                CreateDWordField(Local1, Add(Local0, 38), LENL)
+                CreateDWordField(Local1, Add(Local0, 42), LENH)
+
+                Store(\_SB.LMIN, MINL)
+                Store(\_SB.HMIN, MINH)
+                Store(\_SB.LLEN, LENL)
+                Store(\_SB.HLEN, LENH)
+                Add(MINL, LENL, MAXL)
+                Add(MINH, LENH, MAXH)
+                If(LLess(MAXL, MINL)) {
+                    Add(MAXH, One, MAXH)
+                }
+                If(LOr(MINH, LENL)) {
+                    If(LEqual(MAXL, 0)) {
+                        Subtract(MAXH, One, MAXH)
+                    }
+                    Subtract(MAXL, One, MAXL)
+                }
+
+                Return (Local1)
+            }
+
+            Device(HPET) {
+                Name(_HID,  EISAID("PNP0103"))
+                Name(_UID, 0)
+                Method (_STA, 0, NotSerialized) {
+                    If(LEqual(\_SB.HPET, 0)) {
+                        Return(0x00)
+                    } Else {
+                        Return(0x0F)
+                    }
+                }
+                Name(_CRS, ResourceTemplate() {
+                    DWordMemory(
+                        ResourceConsumer, PosDecode, MinFixed, MaxFixed,
+                        NonCacheable, ReadWrite,
+                        0x00000000,
+                        0xFED00000,
+                        0xFED003FF,
+                        0x00000000,
+                        0x00000400 /* 1K memory: FED00000 - FED003FF */
+                    )
+                })
+            }
+
+
+            /****************************************************************
+             * LPC ISA bridge
+             ****************************************************************/
+
+            Device (ISA)
+            {
+                Name (_ADR, 0x001f0000) /* device 31, fn 0 */
+
+                /* PCI Interrupt Routing Register 1 - PIRQA..PIRQD */
+                OperationRegion(PIRQ, PCI_Config, 0x60, 0x4)
+                Scope(\) {
+                    Field (\_SB.PCI0.ISA.PIRQ, ByteAcc, NoLock, Preserve) {
+                        PIRA, 8,
+                        PIRB, 8,
+                        PIRC, 8,
+                        PIRD, 8
+                    }
+                }
+                /*
+                   PCI Interrupt Routing Register 2 (PIRQE..PIRQH) cannot be
+                   used because of existing Xen IRQ limitations (4 PCI links
+                   only)
+                */
+
+                /* LPC_I/O: I/O Decode Ranges Register */
+                OperationRegion(LPCD, PCI_Config, 0x80, 0x2)
+                Field(LPCD, AnyAcc, NoLock, Preserve) {
+                    COMA,   3,
+                        ,   1,
+                    COMB,   3,
+
+                    Offset(0x01),
+                    LPTD,   2,
+                        ,   2,
+                    FDCD,   2
+                }
+
+                /* LPC_EN: LPC I/F Enables Register */
+                OperationRegion(LPCE, PCI_Config, 0x82, 0x2)
+                Field(LPCE, AnyAcc, NoLock, Preserve) {
+                    CAEN,   1,
+                    CBEN,   1,
+                    LPEN,   1,
+                    FDEN,   1
+                }
+
+                Device (SYSR)
+                {
+                    Name (_HID, EisaId ("PNP0C02"))
+                    Name (_UID, 0x01)
+                    Name (CRS, ResourceTemplate ()
+                    {
+                        /* TODO: list hidden resources */
+                        IO (Decode16, 0x0010, 0x0010, 0x00, 0x10)
+                        IO (Decode16, 0x0022, 0x0022, 0x00, 0x0C)
+                        IO (Decode16, 0x0030, 0x0030, 0x00, 0x10)
+                        IO (Decode16, 0x0044, 0x0044, 0x00, 0x1C)
+                        IO (Decode16, 0x0062, 0x0062, 0x00, 0x02)
+                        IO (Decode16, 0x0065, 0x0065, 0x00, 0x0B)
+                        IO (Decode16, 0x0072, 0x0072, 0x00, 0x0E)
+                        IO (Decode16, 0x0080, 0x0080, 0x00, 0x01)
+                        IO (Decode16, 0x0084, 0x0084, 0x00, 0x03)
+                        IO (Decode16, 0x0088, 0x0088, 0x00, 0x01)
+                        IO (Decode16, 0x008C, 0x008C, 0x00, 0x03)
+                        IO (Decode16, 0x0090, 0x0090, 0x00, 0x10)
+                        IO (Decode16, 0x00A2, 0x00A2, 0x00, 0x1C)
+                        IO (Decode16, 0x00E0, 0x00E0, 0x00, 0x10)
+                        IO (Decode16, 0x08A0, 0x08A0, 0x00, 0x04)
+                        IO (Decode16, 0x0CC0, 0x0CC0, 0x00, 0x10)
+                        IO (Decode16, 0x04D0, 0x04D0, 0x00, 0x02)
+                    })
+                    Method (_CRS, 0, NotSerialized)
+                    {
+                        Return (CRS)
+                    }
+                }
+
+                Device (PIC)
+                {
+                    Name (_HID, EisaId ("PNP0000"))
+                    Name (_CRS, ResourceTemplate ()
+                    {
+                        IO (Decode16, 0x0020, 0x0020, 0x01, 0x02)
+                        IO (Decode16, 0x00A0, 0x00A0, 0x01, 0x02)
+                        IRQNoFlags () {2}
+                    })
+                }
+
+                Device (DMA0)
+                {
+                    Name (_HID, EisaId ("PNP0200"))
+                    Name (_CRS, ResourceTemplate ()
+                    {
+                        DMA (Compatibility, BusMaster, Transfer8) {4}
+                        IO (Decode16, 0x0000, 0x0000, 0x00, 0x10)
+                        IO (Decode16, 0x0081, 0x0081, 0x00, 0x03)
+                        IO (Decode16, 0x0087, 0x0087, 0x00, 0x01)
+                        IO (Decode16, 0x0089, 0x0089, 0x00, 0x03)
+                        IO (Decode16, 0x008F, 0x008F, 0x00, 0x01)
+                        IO (Decode16, 0x00C0, 0x00C0, 0x00, 0x20)
+                        IO (Decode16, 0x0480, 0x0480, 0x00, 0x10)
+                    })
+                }
+
+                Device (TMR)
+                {
+                    Name (_HID, EisaId ("PNP0100"))
+                    Name (_CRS, ResourceTemplate ()
+                    {
+                        IO (Decode16, 0x0040, 0x0040, 0x00, 0x04)
+                        IRQNoFlags () {0}
+                    })
+                }
+
+                Device (RTC)
+                {
+                    Name (_HID, EisaId ("PNP0B00"))
+                    Name (_CRS, ResourceTemplate ()
+                    {
+                        IO (Decode16, 0x0070, 0x0070, 0x00, 0x02)
+                        IRQNoFlags () {8}
+                    })
+                }
+
+                Device (SPKR)
+                {
+                    Name (_HID, EisaId ("PNP0800"))
+                    Name (_CRS, ResourceTemplate ()
+                    {
+                        IO (Decode16, 0x0061, 0x0061, 0x00, 0x01)
+                    })
+                }
+
+                Device (PS2M)
+                {
+                    Name (_HID, EisaId ("PNP0F13"))
+                    Name (_CID, 0x130FD041)
+                    Method (_STA, 0, NotSerialized)
+                    {
+                        Return (0x0F)
+                    }
+
+                    Name (_CRS, ResourceTemplate ()
+                    {
+                        IRQNoFlags () {12}
+                    })
+                }
+
+                Device (PS2K)
+                {
+                    Name (_HID, EisaId ("PNP0303"))
+                    Name (_CID, 0x0B03D041)
+                    Method (_STA, 0, NotSerialized)
+                    {
+                        Return (0x0F)
+                    }
+
+                    Name (_CRS, ResourceTemplate ()
+                    {
+                        IO (Decode16, 0x0060, 0x0060, 0x00, 0x01)
+                        IO (Decode16, 0x0064, 0x0064, 0x00, 0x01)
+                        IRQNoFlags () {1}
+                    })
+                }
+
+                Device(FDC0)
+                {
+                    Name(_HID, EisaId("PNP0700"))
+                    Method(_STA, 0, NotSerialized)
+                    {
+                        Store(FDEN, Local0)
+                        If (LEqual(Local0, 0)) {
+                            Return (0x00)
+                        } Else {
+                            Return (0x0F)
+                        }
+                   }
+
+                   Name(_CRS, ResourceTemplate()
+                   {
+                       IO(Decode16, 0x03F2, 0x03F2, 0x00, 0x04)
+                       IO(Decode16, 0x03F7, 0x03F7, 0x00, 0x01)
+                       IRQNoFlags() { 6 }
+                       DMA(Compatibility, NotBusMaster, Transfer8) { 2 }
+                   })
+                }
+
+                Device (UAR1)
+                {
+                    Name (_HID, EisaId ("PNP0501"))
+                    Name (_UID, 0x01)
+                    Method (_STA, 0, NotSerialized)
+                    {
+                        If(LEqual(\_SB.UAR1, 0)) {
+                            Return(0x00)
+                        } Else {
+                            Return(0x0F)
+                        }
+                    }
+
+                    Name (_CRS, ResourceTemplate()
+                    {
+                        IO (Decode16, 0x03F8, 0x03F8, 8, 8)
+                        IRQNoFlags () {4}
+                    })
+                }
+
+                Device (UAR2)
+                {
+                    Name (_HID, EisaId ("PNP0501"))
+                    Name (_UID, 0x02)
+                    Method (_STA, 0, NotSerialized)
+                    {
+                        If(LEqual(\_SB.UAR2, 0)) {
+                            Return(0x00)
+                        } Else {
+                            Return(0x0F)
+                        }
+                    }
+
+                    Name (_CRS, ResourceTemplate()
+                    {
+                        IO (Decode16, 0x02F8, 0x02F8, 8, 8)
+                        IRQNoFlags () {3}
+                    })
+                }
+
+                Device (LTP1)
+                {
+                    Name (_HID, EisaId ("PNP0400"))
+                    Name (_UID, 0x02)
+                    Method (_STA, 0, NotSerialized)
+                    {
+                        If(LEqual(\_SB.LTP1, 0)) {
+                            Return(0x00)
+                        } Else {
+                            Return(0x0F)
+                        }
+                    }
+
+                    Name (_CRS, ResourceTemplate()
+                    {
+                        IO (Decode16, 0x0378, 0x0378, 0x08, 0x08)
+                        IRQNoFlags () {7}
+                    })
+                }
+
+                Device(VGID) {
+                    Name(_HID, EisaId ("XEN0000"))
+                    Name(_UID, 0x00)
+                    Name(_CID, "VM_Gen_Counter")
+                    Name(_DDN, "VM_Gen_Counter")
+                    Method(_STA, 0, NotSerialized)
+                    {
+                        If(LEqual(\_SB.VGIA, 0x00000000)) {
+                            Return(0x00)
+                        } Else {
+                            Return(0x0F)
+                        }
+                    }
+                    Name(PKG, Package ()
+                    {
+                        0x00000000,
+                        0x00000000
+                    })
+                    Method(ADDR, 0, NotSerialized)
+                    {
+                        Store(\_SB.VGIA, Index(PKG, 0))
+                        Return(PKG)
+                    }
+                }
+
+                /* EHCI Controller 0:1d.0 */
+
+                Device (EHC1)
+                {
+	            Name(_ADR, 0x001d0000)
+
+	            /* Power Resources for Wake */
+	            Name(_PRW, Package() { 13, 4 })
+
+	            /* Highest D state in S3 state */
+	            Name(_S3D, 2)
+
+	            /* Highest D state in S4 state */
+	            Name(_S4D, 2)
+
+	            Device (HUB7)
+	            {
+		        Name(_ADR, 0x00000000)
+
+		        Device(PRT1) { Name(_ADR, 1) }	/* USB Port 0 */
+		        Device(PRT2) { Name(_ADR, 2) }	/* USB Port 1 */
+		        Device(PRT3) { Name(_ADR, 3) }	/* USB Port 2 */
+		        Device(PRT4) { Name(_ADR, 4) }	/* USB Port 3 */
+	            }
+                }
+            }
+        }
+    }
+    /* _S3 and _S4 are in separate SSDTs */
+    Name (\_S5, Package (0x04) {
+        0x00,  /* PM1a_CNT.SLP_TYP */
+        0x00,  /* PM1b_CNT.SLP_TYP */
+        0x00,  /* reserved */
+        0x00   /* reserved */
+    })
+    Name(PICD, 0)
+    Method(_PIC, 1) {
+        Store(Arg0, PICD)
+    }
+}
-- 
2.34.1


