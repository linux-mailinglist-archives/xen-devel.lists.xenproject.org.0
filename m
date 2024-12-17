Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8859F46D3
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 10:05:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858657.1270906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNTVY-0005mO-Rf; Tue, 17 Dec 2024 09:04:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858657.1270906; Tue, 17 Dec 2024 09:04:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNTVY-0005jH-Of; Tue, 17 Dec 2024 09:04:48 +0000
Received: by outflank-mailman (input) for mailman id 858657;
 Tue, 17 Dec 2024 09:04:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DIsX=TK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tNTVX-0005jA-SA
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 09:04:47 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f67a58a1-bc55-11ef-a0d6-8be0dac302b0;
 Tue, 17 Dec 2024 10:04:46 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-434a766b475so53314325e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 01:04:46 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43625553234sm168873715e9.3.2024.12.17.01.04.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 01:04:45 -0800 (PST)
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
X-Inumbo-ID: f67a58a1-bc55-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734426286; x=1735031086; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QhUhfSD222VxNlcXsjSJ/iPbolQEMip+ixbS76EcuCM=;
        b=OYee+/cuz/OIqMgqgQAg8nzzDrs4Q7meE5yYHeRgXilXdGcPm9mYyjuXAMioCbjik4
         weFsYp/hyK/lp5pkEgCwAMeMkT+2wWDZSbMYjj57VUcA/pVaEL9Cc4GbPKmRNXK9X7cs
         4WKwXqceH3Rb19J3SVIlRppgm4CqXb0G2MIQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734426286; x=1735031086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QhUhfSD222VxNlcXsjSJ/iPbolQEMip+ixbS76EcuCM=;
        b=JBfISDrwUsEe07A2Gn4toBSahLsojNxJgCKvjnfTs1MTJM9JoL7/Ru24XwwLOFACpB
         OVD6M6aolq4HiIKl0g5+YaO3NlLvhAbOyqHr2kegEA6Bf2h29yKDlwJ3nz8N3QrLEspy
         IdrxMTLix5pFs7BfHS66HbZaMI+nnMQitPv+guUzgX+gdD//cKWXRlj9yJK3l3W+yMuD
         7MG1YqO3vZo/63wSQTDcKxB+P/w8Rhz2YoAb93z1r8YIEFLVzejnyAXPSrvCa4x1DtiF
         Obh9H+nBkq7ijkBIyaeMT85HlqLMC+CPcYkVtBMqMluVrnNfR+jD7weZFX8M+fP2Caeh
         gZwg==
X-Gm-Message-State: AOJu0YzLpS1xoUJ5h9WAtpenQlgXrfsDWYeqjwzxPoNdfy5+H/cMRlJ0
	DKv+a4eK8Mwm/8qUVsSyNBnxUOlPiNwH+9+D9v95BHPf+duBdSxEzfj+Ao/Hgwce8CsRJWg7Ora
	/
X-Gm-Gg: ASbGncthtCudtjAIWJj87eK/z0SGVWVRhzxhAkOnKr8f71pjEi4bWlT3na11p0Au2YH
	BCIE56uOa3aitI3XPGsyZXPjQO45eEODz9apnAdaAMTgAoNHN3uDBZVu4m1UDoBUr2mu8K1vEqS
	nABv59HPC+dLw9JqmGTq5nz5AIw6L750uL+8BTYk5Fhvu/jue3PTuY5K4cy6eiY1a/38A525M1d
	XCVXCwv0O3i3NhTHOzK3GmOs9JVFddrjRI2bK2Eq2y4dHAjt1VIKTfoKS92nzuGzlc=
X-Google-Smtp-Source: AGHT+IEBO710LCTFWwUAihOCugEA3hGN50uCDGeneSo28meI4yCjdM/bnv32SmYDN5YJfiPuKXeYeA==
X-Received: by 2002:a05:600c:b99:b0:435:9ed3:5698 with SMTP id 5b1f17b1804b1-4362aa9784cmr126683715e9.24.1734426285738;
        Tue, 17 Dec 2024 01:04:45 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Subject: [PATCH] x86/io-apic: prevent early exit from i8259 loop detection
Date: Tue, 17 Dec 2024 10:00:45 +0100
Message-ID: <20241217090045.6251-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Avoid exiting early from the loop when a pin that could be connected to the
i8259 is found, as such early exit would leave the EOI handler translation
array only partially allocated and/or initialized.

Otherwise on systems with multiple IO-APICs and an unmasked ExtINT pin on
any IO-APIC that's no the last one the following NULL pointer dereference
triggers:

(XEN) Enabling APIC mode.  Using 2 I/O APICs
(XEN) ----[ Xen-4.20-unstable  x86_64  debug=y  Not tainted ]----
(XEN) CPU:    0
(XEN) RIP:    e008:[<ffff82d040328046>] __ioapic_write_entry+0x83/0x95
[...]
(XEN) Xen call trace:
(XEN)    [<ffff82d040328046>] R __ioapic_write_entry+0x83/0x95
(XEN)    [<ffff82d04027464b>] F amd_iommu_ioapic_update_ire+0x1ea/0x273
(XEN)    [<ffff82d0402755a1>] F iommu_update_ire_from_apic+0xa/0xc
(XEN)    [<ffff82d040328056>] F __ioapic_write_entry+0x93/0x95
(XEN)    [<ffff82d0403283c1>] F arch/x86/io_apic.c#clear_IO_APIC_pin+0x7c/0x10e
(XEN)    [<ffff82d040328480>] F arch/x86/io_apic.c#clear_IO_APIC+0x2d/0x61
(XEN)    [<ffff82d0404448b7>] F enable_IO_APIC+0x2e3/0x34f
(XEN)    [<ffff82d04044c9b0>] F smp_prepare_cpus+0x254/0x27a
(XEN)    [<ffff82d04044bec2>] F __start_xen+0x1ce1/0x23ae
(XEN)    [<ffff82d0402033ae>] F __high_start+0x8e/0x90
(XEN)
(XEN) Pagetable walk from 0000000000000000:
(XEN)  L4[0x000] = 000000007dbfd063 ffffffffffffffff
(XEN)  L3[0x000] = 000000007dbfa063 ffffffffffffffff
(XEN)  L2[0x000] = 000000007dbcc063 ffffffffffffffff
(XEN)  L1[0x000] = 0000000000000000 ffffffffffffffff
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) FATAL PAGE FAULT
(XEN) [error_code=0002]
(XEN) Faulting linear address: 0000000000000000
(XEN) ****************************************
(XEN)
(XEN) Reboot in five seconds...

Reported-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Fixes: 86001b3970fe ('x86/io-apic: fix directed EOI when using AMD-Vi interrupt remapping')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/io_apic.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index d9db2efc4f58..e4a88a2527d7 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -1389,14 +1389,15 @@ void __init enable_IO_APIC(void)
             /* If the interrupt line is enabled and in ExtInt mode
              * I have found the pin where the i8259 is connected.
              */
-            if ((entry.mask == 0) && (entry.delivery_mode == dest_ExtINT)) {
+            if ( ioapic_i8259.apic == -1 && entry.mask == 0 &&
+                 entry.delivery_mode == dest_ExtINT )
+            {
+                ASSERT(ioapic_i8259.pin == -1);
                 ioapic_i8259.apic = apic;
                 ioapic_i8259.pin  = pin;
-                goto found_i8259;
             }
         }
     }
- found_i8259:
     /* Look to see what if the MP table has reported the ExtINT */
     /* If we could not find the appropriate pin by looking at the ioapic
      * the i8259 probably is not connected the ioapic but give the
-- 
2.46.0


