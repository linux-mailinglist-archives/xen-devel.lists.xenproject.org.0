Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76956A3F3A2
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2025 13:05:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894421.1303122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlRm7-0000QL-Uo; Fri, 21 Feb 2025 12:04:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894421.1303122; Fri, 21 Feb 2025 12:04:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlRm7-0000Ot-RU; Fri, 21 Feb 2025 12:04:59 +0000
Received: by outflank-mailman (input) for mailman id 894421;
 Fri, 21 Feb 2025 12:04:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RQ+l=VM=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tlRm6-0000On-MZ
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2025 12:04:58 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11011950-f04c-11ef-9896-31a8f345e629;
 Fri, 21 Feb 2025 13:04:56 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5dec817f453so3359623a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 21 Feb 2025 04:04:56 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece2709ffsm13534400a12.60.2025.02.21.04.04.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 04:04:55 -0800 (PST)
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
X-Inumbo-ID: 11011950-f04c-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740139496; x=1740744296; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i08e+qkuMbbKyfrlPRaWhMw+Bo9ejH/m6+4gwa9q9ro=;
        b=Lk4GdQ0GmIaa8jUkyPlr17JATGCHLgQBL71254ADhKd5jbrhG4cejnpR3nXkFBRoBB
         L9gvGi6IZlgyiuMBkq4nxMdNekgJfTFNc4G4OQ3OV46DQ9Ao6E/7TtsGhLS7Yg+FYRRh
         +8GBxWLYqvL090bAAY5j3w0gowwbaP6laJh0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740139496; x=1740744296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i08e+qkuMbbKyfrlPRaWhMw+Bo9ejH/m6+4gwa9q9ro=;
        b=EcRhsIC3rMTh32jtXs6NXiZRjy1mji2+1hTXaxZuvKln4PNnNet1Efjk/giBwL9dwL
         kEUALaJJWrG6ckmUGnF6lZ8ErBdUyUKLCeYp2ceDtca/YBRhplfCW09/CmgvPrfIuSq9
         bmCGPHV14nn4HKtd6/ddJkQgRCN8iqw4X4feZEfwukqhVAeV8LOd7z6i38KQYL8pvoh1
         76MORTnVdc7ZwQ2dwSvfl3tPx7Wo7MsanB96Xc3u6+/qsEz+DFVNQLEaZKaFy4XzRZIM
         FCpZoKCNS/tWSh7MxDl3Osu3vAuxoMbEAdsp1ML+Jt+aNRJIY9Gt7sl5k/3L9V1OiByL
         HQXg==
X-Gm-Message-State: AOJu0Yx5vVHXsZK0FTD/e/L0yMOllC57xXuL8tcCL7N4pF2VqUbiOxSM
	4aRkzTXaU0NzA8P826czoL/8czTPepTqcaEjyOEoY9SowqAI0wNTbs1h4zxeXSqIxSdth/hcC1z
	a
X-Gm-Gg: ASbGncsJfX2yQDMHovtgAT9MM1MWNItSwpgLoFyA45RVu0CN6SnVihbbamZaHd+JEOl
	7s/phfFinpELntZBXOcee4t4YJvIcUCidgdWzV4eJUrQ49bvjTRJWFrMshtAex3FcRmUrZ2kkjJ
	fHQZfvvD4AXIdCmeDm/hRj0R0XIsST0mil3Wt0Vt6jMtRPWpaRtZ5s4sYmgKgSsBDndDp2N/YlF
	lpxFGhK28jD7YbkJRWLDPbeihdGkVD3xDC7X5ze5UT02A/1luWnUELFMzXPkUN/scnyCL3HbQty
	nnqUs2eKJvx20yK2ROcOWqizZPLy+ZE=
X-Google-Smtp-Source: AGHT+IEcZK48Snm7Cb3+Za0NQrCqEASzzwp5lSAXgo9iiFc9dEGfXyvJl3nwpakmjEkqbGK5yy9KJA==
X-Received: by 2002:a05:6402:35d1:b0:5dc:c9ce:b01b with SMTP id 4fb4d7f45d1cf-5e0b70e8f6cmr2023158a12.8.1740139495653;
        Fri, 21 Feb 2025 04:04:55 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] x86/msr: expose MSR_FAM10H_MMIO_CONF_BASE on AMD
Date: Fri, 21 Feb 2025 13:04:17 +0100
Message-ID: <20250221120417.20431-1-roger.pau@citrix.com>
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

Fix by allowing access to the MSR on AMD systems, returning 0 for
unprivileged domains (MMIO configuration space disabled), and the native
value for the hardware domain.

The non hardware domain logic will need to be adjusted if in the future we
expose an MCFG region to such domains.

Write attempts to the MSR will still result in #GP for all domain types.

Fixes: 84e848fd7a16 ('x86/hvm: disallow access to unknown MSRs')
Fixes: 322ec7c89f66 ('x86/pv: disallow access to unknown MSRs')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/msr.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 289cf10b783a..c588c9131337 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -245,6 +245,21 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
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


