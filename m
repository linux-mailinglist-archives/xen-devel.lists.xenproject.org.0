Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E358CA4BAAD
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 10:21:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900039.1307968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp1yQ-00051F-Ke; Mon, 03 Mar 2025 09:20:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900039.1307968; Mon, 03 Mar 2025 09:20:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp1yQ-0004yH-Hx; Mon, 03 Mar 2025 09:20:30 +0000
Received: by outflank-mailman (input) for mailman id 900039;
 Mon, 03 Mar 2025 09:20:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RjBI=VW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tp1yP-0004yB-B8
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 09:20:29 +0000
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [2607:f8b0:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be9e2793-f810-11ef-9ab2-95dc52dad729;
 Mon, 03 Mar 2025 10:20:28 +0100 (CET)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-22339936bbfso60000695ad.1
 for <xen-devel@lists.xenproject.org>; Mon, 03 Mar 2025 01:20:28 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fe828745fasm10609503a91.15.2025.03.03.01.20.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 01:20:25 -0800 (PST)
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
X-Inumbo-ID: be9e2793-f810-11ef-9ab2-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740993626; x=1741598426; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CmlP0FYVwsdsDylzPCiVqTENwkTTT+8lUOWed7LxWbQ=;
        b=g/s9vVFlSYeK3D/NOXDv5R8ai195mKnn+74/x1EmWgZupnhgj65uWpTdFOcefAlmxR
         cu+Ib5Er4lSoPkjfkJpsYZAGhT2JMAY7Fd5T9gIv9ovtX8RbVEyPovZT4v+kt86limwY
         DupPVqFaCG4qtQSUdOPY7dy8QTJk4UYc5aB7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740993626; x=1741598426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CmlP0FYVwsdsDylzPCiVqTENwkTTT+8lUOWed7LxWbQ=;
        b=kRn2LJdx/6QSxvuowXd4GGjDhalL69uXNwP8pgf4xCug41FpHvADpdb7/E+ksPhTik
         9+9ubhvFpffq6waGwCRFg4k40aw51Vn50zbaGHi4AwkMuwi3bBDL4U+EXG+hGMf9tkyL
         C/rdgCW+fWwwDalKrTrlgLfggdhbGeYjOvt0+8pnIGt3OnTCr0rP/WYrT0xi4m8CI6oI
         S3DkkGa/shA/u/BmOrfCsQbbQahqPo/4bHwhAeXVg2HWNJkLLn+h9fcIOmVTVKvgUDk/
         NL9Y5soHsJ9EhkCnCzff+zS2rnPROfvrDDcZAbUAz4FoYa2GFnuQzf2oWUcZz1M89lp/
         WoJw==
X-Gm-Message-State: AOJu0Yy/0I0/dgWTm0pCkcw0L5gndp/Y4W7UlsQvXH8VJ1q8+I9V8qO0
	7KxVzxOwMVvyUP3ihy6koyMgARiRDSmELyW4OKoEbLWG9+W45+LXEKtNFHUoaRCOnudEngeCaO9
	4
X-Gm-Gg: ASbGncu7botApkFJluHumXxKRVthhassyegpDk5HGKYcvEqEQUo/PBcgUIptvYwU/ul
	FQ+x3/KHY3SqUKz9djn2WgvDL0t3CYgJhHN3o+kD4idSrhyLWcxR5ujQ0I9Kl9l/ruowefN/UUF
	4ksCerlvvFaJZfrRGshMhg/4sCSNOfI4uSY7JbU5we7h+m2xG9BzYdUmrB4sPg37gX+tzFqlRLv
	IZ3U+ydU8i7zZqU+yw/in/5DxfF5X3yIRK62+/aeZpIvWzTx7vFVAMvhEz+cBUwca4uj4R/PBjB
	DILVlMXfN0MnkryFcbBnOM+X40q+V9ipDhjq4qJHh9mwDLOUQA==
X-Google-Smtp-Source: AGHT+IGMvWnSNIP6bI6Wu/m0rFM3dVHTcwB48NIxNaLgeTUTxhUYxxMe/q0DFutrP4ISD3oIegw1Fw==
X-Received: by 2002:a17:903:32c8:b0:223:402b:cce2 with SMTP id d9443c01a7336-22369255582mr188769275ad.33.1740993626123;
        Mon, 03 Mar 2025 01:20:26 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2] x86/msr: expose MSR_FAM10H_MMIO_CONF_BASE on AMD
Date: Mon,  3 Mar 2025 10:19:08 +0100
Message-ID: <20250303091908.38846-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The MMIO_CONF_BASE reports the base of the MCFG range on AMD systems.
Currently Linux is unconditionally attempting to read the MSR without a
safe MSR accessor, and since Xen doesn't allow access to it Linux reports
the following error:

unchecked MSR access error: RDMSR from 0xc0010058 at rIP: 0xffffffff8101d19f (xen_do_read_msr+0x7f/0xa0)
Call Trace:
 <TASK>
 ? ex_handler_msr+0x11e/0x150
 ? fixup_exception+0x81/0x300
 ? exc_general_protection+0x138/0x410
 ? asm_exc_general_protection+0x22/0x30
 ? xen_do_read_msr+0x7f/0xa0
 xen_read_msr+0x1e/0x30
 amd_get_mmconfig_range+0x2b/0x80
 quirk_amd_mmconfig_area+0x28/0x100
 ? quirk_system_pci_resources+0x2b/0x150
 pnp_fixup_device+0x39/0x50
 __pnp_add_device+0xf/0x150
 pnp_add_device+0x3d/0x100
 ? __pfx_pnpacpi_allocated_resource+0x10/0x10
 ? __pfx_pnpacpi_allocated_resource+0x10/0x10
 ? acpi_walk_resources+0xbb/0xd0
 pnpacpi_add_device_handler+0x1f9/0x280
 acpi_ns_get_device_callback+0x104/0x1c0
 ? _raw_spin_unlock_irqrestore+0x18/0x20
 ? down_timeout+0x3a/0x60
 ? _raw_spin_lock_irqsave+0x14/0x40
 acpi_ns_walk_namespace+0x1d0/0x260
 ? _raw_spin_unlock_irqrestore+0x18/0x20
 ? __pfx_acpi_ns_get_device_callback+0x10/0x10
 acpi_get_devices+0x8a/0xb0
 ? __pfx_pnpacpi_add_device_handler+0x10/0x10
 ? __pfx_pnpacpi_init+0x10/0x10
 pnpacpi_init+0x50/0x80
 do_one_initcall+0x46/0x2e0
 kernel_init_freeable+0x1da/0x2f0
 ? __pfx_kernel_init+0x10/0x10
 kernel_init+0x16/0x1b0
 ret_from_fork+0x30/0x50
 ? __pfx_kernel_init+0x10/0x10
 ret_from_fork_asm+0x1b/0x30
 </TASK>

Such access is conditional to the presence of a device with PnP ID
"PNP0c01", which triggers the execution of the quirk_amd_mmconfig_area()
function.  Note that prior to commit 3fac3734c43a MSR accesses when running
as a PV guest would always use the safe variant, and thus silently handle
the #GP.

Fix by allowing access to the MSR on AMD systems, returning 0 for
unprivileged domains (MMIO configuration space disabled), and the native
value for the hardware domain.

The non hardware domain logic will need to be adjusted if in the future we
expose an MCFG region to such domains.

Write attempts to the MSR will still result in #GP for all domain types.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Expand commit message to note which device triggers the MSR read.
---
 xen/arch/x86/msr.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 1550fd9ec9f3..c1e616a3a757 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -318,6 +318,21 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
         *val = 0;
         break;
 
+    case MSR_FAM10H_MMIO_CONF_BASE:
+        if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
+            goto gp_fault;
+
+        /*
+         * Report MMIO configuration space is disabled unconditionally for
+         * domUs, as the emulated chipset doesn't support ECAM.  For dom0
+         * return the hardware value.
+         */
+        *val = 0;
+        if ( is_hardware_domain(d) && rdmsr_safe(msr, *val) )
+            goto gp_fault;
+
+        break;
+
     case MSR_VIRT_SPEC_CTRL:
         if ( !cp->extd.virt_ssbd )
             goto gp_fault;
-- 
2.46.0


