Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8472DB1EF74
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 22:23:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1075035.1437595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukTcp-00011P-En; Fri, 08 Aug 2025 20:23:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1075035.1437595; Fri, 08 Aug 2025 20:23:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukTco-0000oL-Dy; Fri, 08 Aug 2025 20:23:38 +0000
Received: by outflank-mailman (input) for mailman id 1075035;
 Fri, 08 Aug 2025 20:23:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dtzj=2U=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ukTck-0005tJ-Br
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 20:23:34 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d62ff3e-7495-11f0-b898-0df219b8e170;
 Fri, 08 Aug 2025 22:23:32 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4589b3e3820so26574315e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 08 Aug 2025 13:23:32 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e075047fsm103989805e9.1.2025.08.08.13.23.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 13:23:30 -0700 (PDT)
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
X-Inumbo-ID: 8d62ff3e-7495-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754684611; x=1755289411; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DhpjCRwETK5+wDVQikgEEWpf2jqHKcYBrZS42n+RtV8=;
        b=QJ6pLEKbdP8ljyhSD3rnHOiqFQ21/KhnmGVDOVqyjUjvO87vk70AbN46LyK7DMXUT4
         QwWYONoXOFklFWMx/jrAK35l6G/+EmTMLw2PRLa49jiyIZqTWL7LjLyEpcEHuXxn99ct
         80IJWf5859VtXe8nwU2Ljd8litDb03NXDgXbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754684611; x=1755289411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DhpjCRwETK5+wDVQikgEEWpf2jqHKcYBrZS42n+RtV8=;
        b=R/WeOuYrLcaAdERhurc82LvIFh7sjlqnF1It7QV+gWW8Bus42BFmYRN5OwG/wfm/4n
         hYDlwD4k9nYkL7mHTWDtb+SqQrBx01ifbqpHBgutzL9ffiRWfwxGx2bKGD2+SlEHI8Eb
         DdRfYd4Jumo7eOr8NCPxxQdmSDYIKTVEbm57n3SJYSttgPwB9AgKyYvdk1cMQ0xPEDYh
         D0nLwWWyWt4ykEUV8Mwh8c/bli9yo4HWHWP0UEUZ7Z/tLJNAK7qgw7auXCyBd9i3jS6f
         5ZyQNxGuo5Gniyz1xbeGuh/firXuGkAOOKMt5vGIQZzYnYJytLeaa8xWe+1fNj5B5Yu0
         SO4A==
X-Gm-Message-State: AOJu0YyoLC/SVUns7U39Wy12f3ymgc2caXKiMji5QUMO+WSx/g7q77Tf
	GybydeW8RheCMoyRLB9vysUCEItojr1ZFfs13FR9NIrf72E9PyJN56SFhTVoM+ySJPqpBnLrtil
	+YDVsEnI=
X-Gm-Gg: ASbGncuogLfNBDztZanAGUo+c2RJXBwUBgoONCnDwi09LHWLOkvddoB4i4IwBiNkV8o
	LUn2GwOh5G4B4beRUytjxrBrvHGjgUbNcOF2fxf6gqdcl72AkDTuPCL2lJYL3qWvqL67eaP8pjb
	4Scs3Am862EFIO2XkzUw8peZqdkkh2YnnYKgKx+vUXwG/lnvhBwTnsrHqX1Kw8mACTlrJK5h2rF
	IP4dFMzezNvQHVmidiD/AEVhw/Jk1O+lvsnX4+h8WaXde302m2A9o6mDxDX8NY4Qk0mNNkHAVdZ
	2XohvW2MEGOchJQ/2vpRNQBR+M1kGm1TGnhTKBNP20NskaTLuR6CIJcPs8a4lL+Mv2mzGhmQPC8
	NGfDPe/u3mn74IJMUBg3+p4PWnvE2Qqpb1vzhGA2/MUiVHRArltBNW65V4pxuVo9nHqq1uoVCQy
	Nc
X-Google-Smtp-Source: AGHT+IEKNxT84SXyyCmdr7B91ibNP+tqO5b0I6jUv6ULvgnNTNIVapfHxAOZYXD0pcHgV0ZKovcgWA==
X-Received: by 2002:a05:600c:8216:b0:459:f90e:4f5a with SMTP id 5b1f17b1804b1-459f90e4f9fmr30471795e9.15.1754684611133;
        Fri, 08 Aug 2025 13:23:31 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 15/22] x86/traps: Introduce opt_fred
Date: Fri,  8 Aug 2025 21:23:07 +0100
Message-Id: <20250808202314.1045968-16-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

... disabled by default.  There is a lot of work before FRED can be enabled by
default.

One part of FRED, the LKGS (Load Kernel GS) instruction, is enumerated
separately but is mandatory as FRED disallows the SWAPGS instruction.
Therefore, both CPUID bits must be checked.

FRED formally removes the use of Ring1 and Ring2, meaning we cannot run 32bit
PV guests.  Therefore, don't enable FRED by default in shim mode.  OTOH, if
FRED is active, then PV32 needs disabling like with CET.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
 docs/misc/xen-command-line.pandoc | 10 ++++++++++
 xen/arch/x86/include/asm/traps.h  |  4 ++++
 xen/arch/x86/traps-setup.c        | 31 +++++++++++++++++++++++++++++++
 3 files changed, 45 insertions(+)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 6865a61220ca..f293d973a8e8 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1283,6 +1283,16 @@ requirement can be relaxed.  This option is particularly useful for nested
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
index 37202c17fcea..3b5e4969a375 100644
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
 
+int8_t __ro_after_init opt_fred = 0; /* -1 when supported. */
+boolean_param("fred", opt_fred);
+
 void nocall entry_PF(void);
 void nocall lstar_enter(void);
 void nocall cstar_enter(void);
@@ -305,6 +310,32 @@ void __init traps_init(void)
     /* Replace early pagefault with real pagefault handler. */
     _update_gate_addr_lower(&bsp_idt[X86_EXC_PF], entry_PF);
 
+    if ( !cpu_has_fred || !cpu_has_lkgs )
+    {
+        if ( opt_fred )
+            printk(XENLOG_WARNING "FRED not available, ignoring\n");
+        opt_fred = false;
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


