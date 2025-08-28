Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBADCB3A3B9
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 17:11:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099194.1453162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureHd-00029J-Uq; Thu, 28 Aug 2025 15:11:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099194.1453162; Thu, 28 Aug 2025 15:11:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureHd-00023u-QZ; Thu, 28 Aug 2025 15:11:25 +0000
Received: by outflank-mailman (input) for mailman id 1099194;
 Thu, 28 Aug 2025 15:11:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FrxM=3I=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ureCA-00035A-HP
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 15:05:46 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 783d1277-8420-11f0-8dd7-1b34d833f44b;
 Thu, 28 Aug 2025 17:05:44 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-45b618e067eso15231085e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 08:05:44 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b6f0c6fe5sm78394535e9.5.2025.08.28.08.05.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 08:05:03 -0700 (PDT)
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
X-Inumbo-ID: 783d1277-8420-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756393543; x=1756998343; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z66lRYN/mLU8duIBhkfKFbwOLnIKPi9ItG27/8oZ5BQ=;
        b=SyQsKjPGw2at6leSnUtAc+cnBr6YsLN5MDqLXMBpPRI/NWnUo8H+uwGTxQqurXKxoQ
         VsMpp0gA2wEWId5Zd0Ok4PlkIEI9w35L0ISLkLDop34csUaoTkPXFmZ9SfDmx03jX9vQ
         su+IoaVgMLga6luC2FJOMonHQYFWLNiPcDy4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756393543; x=1756998343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z66lRYN/mLU8duIBhkfKFbwOLnIKPi9ItG27/8oZ5BQ=;
        b=plpAwRYgN4obrANnIRrVW9qLWDQ5Ikulnh7OnOmy4MUmhSY+AHwQpt36+JU43Wu1i3
         v7la7toeR5rlqYK2u471LIThMyvC7Jt2zqm5ouTq/kNdH96A59HmaNCUM2ENeIAxy/nA
         PfLnUPiAr7lT8/+QZL5nBri9p70RmVtl/d5RdRXugZKh/+0Jh5lxotfEP87pkSbX5yGG
         56zwtV22P88CmWMCkm7y8UX5qAJftHDFnbFS8lyVDeBgEUu15wIxkGxCieA/VglUMpIy
         JjKZwmKOUx7XevKBuB/yhO+sMxT8pcVm/EJPpbGfqKTs6vB/585iryI8b9hIAPeYlbdQ
         FWHA==
X-Gm-Message-State: AOJu0Yy8jGFz41ht9eqtw0wDtxn88eluk9fLXxZHnhSOj6RYbbXdI28U
	q80w/urxX6qMVbmHUPT/ezulP2TbMMuMAq8KZ60ii8e3gSsbU7un6dREyWao0ku2QDcgZ2pNwgd
	KRcEs
X-Gm-Gg: ASbGncs+LeUAxNjdQ/TlPHNCMe18GyY6l3wrSpYrQ3r0qnKF0sameKd5j8VSPngJiUx
	Xpv/KOr2zwhKSXEOmlE0LfAgx5Q27p/y0eOcTJfIQaBykqdAGjJ/EV+k+u214F/hU69IDH/wnJ3
	CHI+ff9q1H0gT6ZZcPt1IxMVASJipjULKOlPHZuvTl7Teooa6Tmnb9ISK3huD2vT0Y6ylevVQtH
	J5pVWOjMBXZqGnxTc7Qhx9Q3z2M9YOAlxGctXSHnLq5e6IrFsySbGX6EBDT8Ln8b+WIM7R1rgtk
	6pZDafr02uXI2bHSVNW0FRHrhXDQ1wVnovYzxdK1Lg5rmg4ed6/vg1ku54WR7RwbMVjgFniyYgQ
	Vx2iF8d/Ruya2T3y0WcYWrlU0mWQHQtLPPVL5Gfef9iBVxUuRMYiZd6ITj/3MgC3GbG8fkOhaMD
	+imAq6wyYivBaEvSivsPTurg==
X-Google-Smtp-Source: AGHT+IHfMVVaWeyLXjy86sncGtaY/J1QtG6GWfYEL+UhEdGettgAeC+4Hrq5ntkug4w9b7Cp3bC1JQ==
X-Received: by 2002:a05:600c:8b21:b0:456:189e:223a with SMTP id 5b1f17b1804b1-45b6f48575amr57939235e9.10.1756393543201;
        Thu, 28 Aug 2025 08:05:43 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 03/23] x86/traps: Introduce opt_fred
Date: Thu, 28 Aug 2025 16:03:49 +0100
Message-Id: <20250828150409.901315-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250828150409.901315-1-andrew.cooper3@citrix.com>
References: <20250828150409.901315-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... disabled by default.  There is a lot of work before FRED can be enabled by
default.

One part of FRED, the LKGS (Load Kernel GS) instruction, is enumerated
separately but is mandatory as FRED disallows the SWAPGS instruction.
Normally, we'd have to check both CPUID bits, but Xen does not use GS like
most other software, and can manage without the LKGS instruction.

FRED formally removes the use of Ring1 and Ring2, meaning we cannot run 32bit
PV guests.  Therefore, don't enable FRED by default in shim mode.  OTOH, if
FRED is active, then PV32 needs disabling like with CET.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Fix check for warning.
 * Drop check for LKGS.
---
 docs/misc/xen-command-line.pandoc | 10 +++++++++
 xen/arch/x86/include/asm/traps.h  |  4 ++++
 xen/arch/x86/traps-setup.c        | 36 +++++++++++++++++++++++++++++++
 3 files changed, 50 insertions(+)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index a75b6c930195..25cebdc1110f 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1284,6 +1284,16 @@ requirement can be relaxed.  This option is particularly useful for nested
 virtualization, to allow the L1 hypervisor to use EPT even if the L0 hypervisor
 does not provide `VM_ENTRY_LOAD_GUEST_PAT`.
 
+### fred (x86)
+> `= <bool>`
+
+> Default: `false`
+
+Flexible Return and Event Delivery is an overhaul of interrupt, exception and
+system call handling, fixing many corner cases in the x86 architecture, and
+expected in hardware from 2025.  Support in Xen is a work in progress and
+disabled by default.
+
 ### gnttab
 > `= List of [ max-ver:<integer>, transitive=<bool>, transfer=<bool> ]`
 
diff --git a/xen/arch/x86/include/asm/traps.h b/xen/arch/x86/include/asm/traps.h
index 6ae451d3fc70..73097e957d05 100644
--- a/xen/arch/x86/include/asm/traps.h
+++ b/xen/arch/x86/include/asm/traps.h
@@ -7,6 +7,10 @@
 #ifndef ASM_TRAP_H
 #define ASM_TRAP_H
 
+#include <xen/types.h>
+
+extern int8_t opt_fred;
+
 void bsp_early_traps_init(void);
 void traps_init(void);
 void bsp_traps_reinit(void);
diff --git a/xen/arch/x86/traps-setup.c b/xen/arch/x86/traps-setup.c
index c89280270fbb..6e2af58ba0a5 100644
--- a/xen/arch/x86/traps-setup.c
+++ b/xen/arch/x86/traps-setup.c
@@ -9,6 +9,8 @@
 #include <asm/endbr.h>
 #include <asm/idt.h>
 #include <asm/msr.h>
+#include <asm/pv/domain.h>
+#include <asm/pv/shim.h>
 #include <asm/shstk.h>
 #include <asm/stubs.h>
 #include <asm/traps.h>
@@ -20,6 +22,9 @@ unsigned int __ro_after_init ler_msr;
 static bool __initdata opt_ler;
 boolean_param("ler", opt_ler);
 
+int8_t __ro_after_init opt_fred = 0;
+boolean_param("fred", opt_fred);
+
 void nocall entry_PF(void);
 void nocall lstar_enter(void);
 void nocall cstar_enter(void);
@@ -299,6 +304,37 @@ void __init traps_init(void)
     /* Replace early pagefault with real pagefault handler. */
     _update_gate_addr_lower(&bsp_idt[X86_EXC_PF], entry_PF);
 
+    /*
+     * Xen doesn't use GS like most software does, and doesn't need the LKGS
+     * instruction in order to manage PV guests.  No need to check for it.
+     */
+    if ( !cpu_has_fred )
+    {
+        if ( opt_fred == 1 )
+            printk(XENLOG_WARNING "FRED not available, ignoring\n");
+        opt_fred = 0;
+    }
+
+    if ( opt_fred == -1 )
+        opt_fred = !pv_shim;
+
+    if ( opt_fred )
+    {
+#ifdef CONFIG_PV32
+        if ( opt_pv32 )
+        {
+            opt_pv32 = 0;
+            printk(XENLOG_INFO "Disabling PV32 due to FRED\n");
+        }
+#endif
+        setup_force_cpu_cap(X86_FEATURE_XEN_FRED);
+        printk("Using FRED event delivery\n");
+    }
+    else
+    {
+        printk("Using IDT event delivery\n");
+    }
+
     load_system_tables();
 
     init_ler();
-- 
2.39.5


