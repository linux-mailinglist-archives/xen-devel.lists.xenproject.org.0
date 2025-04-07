Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4F6A7DB71
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 12:46:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.939650.1339683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1jzC-0000PP-1G; Mon, 07 Apr 2025 10:45:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 939650.1339683; Mon, 07 Apr 2025 10:45:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1jzB-0000NJ-Up; Mon, 07 Apr 2025 10:45:49 +0000
Received: by outflank-mailman (input) for mailman id 939650;
 Mon, 07 Apr 2025 10:45:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZxXC=WZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u1jzA-0000NB-Sy
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 10:45:48 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 767b9a9e-139d-11f0-9ffb-bf95429c2676;
 Mon, 07 Apr 2025 12:45:46 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-39c1efbefc6so2326263f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Apr 2025 03:45:46 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c30226cf6sm11543213f8f.87.2025.04.07.03.45.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 03:45:45 -0700 (PDT)
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
X-Inumbo-ID: 767b9a9e-139d-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744022746; x=1744627546; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5MJBZtKinssoenxBVB/hvQhmPdAGPzTkuVnEecMVycM=;
        b=YSLFB0o2vQVd/s2B//NcgV9HluWHwLHcUWegMBtSSko46BKxMT0BAduIFy1YWEjvMc
         G5R8qH7Adw8qXEVl8CmuSKU3rrssWgvnVCagbe2CHzWxXB1wEuP8Fid+xMuv+Z5UyGed
         pOv0uUo7u2n81nxFw9GyjHwRL83/JOFR/mYWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744022746; x=1744627546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5MJBZtKinssoenxBVB/hvQhmPdAGPzTkuVnEecMVycM=;
        b=NEzHFacGSqIdyuoHeHlZND3NV1Uq1Ka3zIW9UWut8csnvYT+w1PwL4SmzIPCK8qmt4
         lFCm7t313VAQoH0PDwmhc+RLOeJ/MOjzW5MZAOXnpoZv6VTKs2KYAtkxW6Nqw82MSBU2
         qKyCKYVxvHCN2KUGJnyAbc0YPr0cU021Z1QpOtWJR2nHegy+CBjtpdvTg8XtReQEeZJD
         slAUip8hWeyCy32s/bM/cG902mNnpSqIIrSY/8OJad/mQUyvqiqm5OQ/UzbncAQalp7M
         UkXIvUiQXYICXa6iEghqgw9FPMZ2UYYpPMHvI4Y/1KI0kl4J7QkA9m7Y2GwszQq9YIyZ
         G34g==
X-Gm-Message-State: AOJu0Yw96zIcfKsErwCeBhXzjFpH4v8FPnTft730Dj5Cy2so7ksFP0I1
	gBy/y2fusOtVrIra4SYZ49OIPVURldhW+45W6oHzvvwAFni47nRVvkJFjQb9U20pWrg2NN9Ke+b
	QXBY=
X-Gm-Gg: ASbGncuzlGrovXGybN/JowYCU4Q9qhz9thK5LsWiFfb0kNnlPQCdxy0a9V5dCKUGiFq
	F9viKcKkmCIffg+94qGZVL8pn+30Sq8NMnVAIwSIH+qISCwCr9qyzp7MIahwrlh+mmz5ZcaM9yf
	e7D18n0m59AmlwN2wFXpN9tzWyMGgY/o9t0ywiGbUOsNmZue7GyVE8IxAGbSTfQLAPjGCq3PjIk
	UR755LzXxGa/g3p7Xv3UVryVZCESgAsMU9XKZNgZf/sEzMCUBlpwEaEwrEwwlndVLq7xfv7aXvK
	vV/TJwOO0IHRj3j/1GwyF6vkF/VRN0Lz15/R0Dl92q+Pr5yFgNw9IsbLM4f+cVV703vhwV9eqgm
	MgoGau8ImamwS296j4Q==
X-Google-Smtp-Source: AGHT+IHrhRT3EprAH+2arwQn/ox/yV8fQcSf6hOCsufOC/aPij0Qj+1s4XUFS7fRrau5s3rmhILfLw==
X-Received: by 2002:a05:6000:144c:b0:39c:1258:2dc7 with SMTP id ffacd0b85a97d-39d6fd07696mr7267580f8f.56.1744022746023;
        Mon, 07 Apr 2025 03:45:46 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/vmx: Drop memory clobbers on VMX instruction wrappers
Date: Mon,  7 Apr 2025 11:45:44 +0100
Message-Id: <20250407104544.1823150-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The use, or not, of memory clobbers on the VMX instructions is complicated.

There are two separate aspects to consider:

1. Originally, the VMX instructions used hardcoded bytes, including memory
   encodings.  Therefore, the compiler couldn't see the correct relationship
   between parameters.  The memory clobber for this purpose should have been
   dropped when switching to mnemonics.

   This covers INVEPT and INVVPID, each of which has no change in memory, nor
   in fact the current address space in use.

2. Most of these instructions operate on a VMCS region.  This is a (mostly)
   opaque data structure, operated on by physical address.  Again, this hides
   the relationship between the instructions and the VMCS from the compiler.

   The processor might use internal state to cache the VMCS (writing it back
   to memory on VMCLEAR), or it might operate on memory directly.

   Because the VMCS is opaque (so the compiler has nothing interesting to know
   about it), and because VMREAD/VMWRITE have chosen not to use a memory
   clobber (to tell the compiler that something changed), none of the other
   VMX instructions should use a memory clobber either.

   This covers VMXON, VMXOFF, VMPTRLD and VMPTCLEAR.

Make the use of memory clobbers consistent for all VMX instructions.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

Based on top of the posted cleanup.
---
 xen/arch/x86/hvm/vmx/vmcs.c            | 4 ++--
 xen/arch/x86/include/asm/hvm/vmx/vmx.h | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index a44475ae15bd..6daaeaa656a8 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -754,7 +754,7 @@ static int _vmx_cpu_up(bool bsp)
                _ASM_EXTABLE(1b, %l[vmxon_fault])
                :
                : [addr] "m" (this_cpu(vmxon_region))
-               : "memory"
+               :
                : vmxon_fail, vmxon_fault );
 
     this_cpu(vmxon) = 1;
@@ -811,7 +811,7 @@ void cf_check vmx_cpu_down(void)
 
     BUG_ON(!(read_cr4() & X86_CR4_VMXE));
     this_cpu(vmxon) = 0;
-    asm volatile ( "vmxoff" ::: "memory" );
+    asm volatile ( "vmxoff" );
 
     local_irq_restore(flags);
 }
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
index 33d3d43a3851..86349d4a5431 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -298,7 +298,7 @@ static always_inline void __vmptrld(u64 addr)
                "jbe %l[vmfail]"
                :
                : [addr] "m" (addr)
-               : "memory"
+               :
                : vmfail );
     return;
 
@@ -312,7 +312,7 @@ static always_inline void __vmpclear(u64 addr)
                "jbe %l[vmfail]"
                :
                : [addr] "m" (addr)
-               : "memory"
+               :
                : vmfail );
     return;
 
@@ -408,7 +408,7 @@ static always_inline void __invept(unsigned long type, uint64_t eptp)
                "jbe %l[vmfail]"
                :
                : [operand] "m" (operand), [type] "r" (type)
-               : "memory"
+               :
                : vmfail );
     return;
 
@@ -430,7 +430,7 @@ static always_inline void __invvpid(unsigned long type, u16 vpid, u64 gva)
                "2:" _ASM_EXTABLE(1b, 2b)
                :
                : [operand] "m" (operand), [type] "r" (type)
-               : "memory"
+               :
                : vmfail );
     return;
 

base-commit: befc384d21784affa3daf2abc85b02500e4dc545
prerequisite-patch-id: 727f158a737c65bca1e4210a6bc132302037f55c
prerequisite-patch-id: 3f88b36cbba121e9893b4c8b52df9aea4f58e8ad
prerequisite-patch-id: c0b199b9ceb1ddd659e27ec8571741bd78ae6265
-- 
2.39.5


