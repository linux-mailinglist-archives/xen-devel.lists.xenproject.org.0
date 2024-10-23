Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB0C9ACD0B
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2024 16:45:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824718.1238895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3cbZ-0001Ro-SP; Wed, 23 Oct 2024 14:44:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824718.1238895; Wed, 23 Oct 2024 14:44:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3cbZ-0001Ps-PG; Wed, 23 Oct 2024 14:44:57 +0000
Received: by outflank-mailman (input) for mailman id 824718;
 Wed, 23 Oct 2024 14:44:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jJ8W=RT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t3cbY-0001Pl-Fp
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2024 14:44:56 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ca0e00d-914d-11ef-99a3-01e77a169b0f;
 Wed, 23 Oct 2024 16:44:52 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a9a16b310f5so886027166b.0
 for <xen-devel@lists.xenproject.org>; Wed, 23 Oct 2024 07:44:52 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a9159a231sm485756766b.210.2024.10.23.07.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 07:44:50 -0700 (PDT)
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
X-Inumbo-ID: 5ca0e00d-914d-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729694691; x=1730299491; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cv7BbkM+VyxuZiE18zNfLBSL+qc31CadlEw9GXWIkw0=;
        b=quh+bahj7UU8IoYpzZtgGJQQz1Hxc02QwujUqZmSgR8TKzJK2U7PImXejiHv0ow5z1
         mDqkSvpcs43985wmB+fLBZVB4BSDcCEBeHMlEezELjnUzDyRLSWTNc0XQTenWsRS2745
         3EnS2pOCVRMKirkc9mZGdQsFndAirKSxs2w60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729694691; x=1730299491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cv7BbkM+VyxuZiE18zNfLBSL+qc31CadlEw9GXWIkw0=;
        b=I3P4PrB+08fpY307KMdqFFfR9rmiUZeM9QpzvtyCachvW6f+VInGVWz1xNanC+Ku5Y
         vNpBgJFXyPE3gcRhCK1VfA+j40LND2MQtKC1xF0eO+d96iGuG93VJY801k6CFroxTlkL
         1Lr3e0HFMqNvOptlxcbaNssYWxc9fuX2CIa7YMXY5jT9Au7rtPYmhkToYS/L858daWn8
         uyi4xadNZQJxBboD5TxEHsNQUPQuopxW6BX4r1pnrp8/j//YX66TMHGDAUByRMoiOQoK
         EPTzVW8o+gDcM3GKiI8ipIBIp49afht/3OaFcU/kMSZv1uwC9rcTH+lA9oAd7Vr7Tt/m
         64vA==
X-Gm-Message-State: AOJu0Yxk3UHXf39V0Df6+/dwxMgbzb8vVR9mmCJPjYM4R5BXAPONvXVP
	qxrnVxHNAY54mOaflXPzW827gh2GPiAQafSYn3GaHD7STjHYV2sv5UiDIVNAXEIAUwe4D/jUDHm
	K
X-Google-Smtp-Source: AGHT+IGCS+qrW5WCJrlrmPw8TwvM4/GKq/U1g8u3zg/oeKOXN9F6nTzw21pt1hi0F3/5TKiboKWIlA==
X-Received: by 2002:a17:907:944c:b0:a99:f9e6:1d0 with SMTP id a640c23a62f3a-a9abf8b7bc1mr269118366b.27.1729694691431;
        Wed, 23 Oct 2024 07:44:51 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 4/3] x86/boot: Remove the mbi_p parameter from __start_xen()
Date: Wed, 23 Oct 2024 15:44:48 +0100
Message-Id: <20241023144448.731688-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241023105756.641695-1-andrew.cooper3@citrix.com>
References: <20241023105756.641695-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The use of physical addresses in __start_xen() has proved to be fertile soure
of bugs.

The MB1/2 path stashes the MBI pointer in multiboot_ptr (a setup.c variable
even), then re-loads it immediately before calling __start_xen().  For this,
we can just drop the function parameter and read multiboot_ptr in the one
place it's used.

The EFI path also passes this parameter into __start_xen().  Have the EFI path
set up multiboot_ptr too, and move the explanation of phyiscal-mode pointers.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>

https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1509072662
---
 xen/arch/x86/boot/x86_64.S       |  2 --
 xen/arch/x86/efi/efi-boot.h      |  9 +++++++--
 xen/arch/x86/include/asm/setup.h |  1 +
 xen/arch/x86/setup.c             | 14 +++++---------
 4 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/boot/x86_64.S b/xen/arch/x86/boot/x86_64.S
index 04bb62ae8680..26b9d1c2df9a 100644
--- a/xen/arch/x86/boot/x86_64.S
+++ b/xen/arch/x86/boot/x86_64.S
@@ -77,8 +77,6 @@ ENTRY(__high_start)
         tailcall start_secondary
 
 .L_bsp:
-        /* Pass off the Multiboot info structure to C land (if applicable). */
-        mov     multiboot_ptr(%rip),%edi
         tailcall __start_xen
 
         .section .data.page_aligned, "aw", @progbits
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 94f34433640f..3b26f0b0f500 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -248,6 +248,12 @@ static void __init noreturn efi_arch_post_exit_boot(void)
     efi_arch_relocate_image(__XEN_VIRT_START - xen_phys_start);
     memcpy((void *)trampoline_phys, trampoline_start, cfg.size);
 
+    /*
+     * We're in physical mode right now (i.e. identity map), so a regular
+     * pointer is also a phyiscal address to the rest of Xen.
+     */
+    multiboot_ptr = (unsigned long)&mbi;
+
     /* Set system registers and transfer control. */
     asm volatile("pushq $0\n\tpopfq");
     rdmsrl(MSR_EFER, efer);
@@ -279,8 +285,7 @@ static void __init noreturn efi_arch_post_exit_boot(void)
                      [cr4] "+&r" (cr4)
                    : [cr3] "r" (idle_pg_table),
                      [cs] "i" (__HYPERVISOR_CS),
-                     [ds] "r" (__HYPERVISOR_DS),
-                     "D" (&mbi)
+                     [ds] "r" (__HYPERVISOR_DS)
                    : "memory" );
     unreachable();
 }
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index 3d189521189d..811855e57478 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -14,6 +14,7 @@ extern unsigned long xenheap_initial_phys_start;
 extern uint64_t boot_tsc_stamp;
 
 extern void *stack_start;
+extern unsigned int multiboot_ptr;
 
 void early_cpu_init(bool verbose);
 void early_time_init(void);
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index c5b37bd2112e..c9129c21787b 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -157,8 +157,8 @@ char asmlinkage __section(".init.bss.stack_aligned") __aligned(STACK_SIZE)
 /* Used by the BSP/AP paths to find the higher half stack mapping to use. */
 void *stack_start = cpu0_stack + STACK_SIZE - sizeof(struct cpu_info);
 
-/* Used by the boot asm to stash the relocated multiboot info pointer. */
-unsigned int asmlinkage __initdata multiboot_ptr;
+/* Used by the boot asm and EFI to stash the multiboot_info paddr. */
+unsigned int __initdata multiboot_ptr;
 
 struct cpuinfo_x86 __read_mostly boot_cpu_data = { 0, 0, 0, 0, -1 };
 
@@ -1014,7 +1014,7 @@ static struct domain *__init create_dom0(const module_t *image,
 /* How much of the directmap is prebuilt at compile time. */
 #define PREBUILT_MAP_LIMIT (1 << L2_PAGETABLE_SHIFT)
 
-void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
+void asmlinkage __init noreturn __start_xen(void)
 {
     const char *memmap_type = NULL;
     char *kextra;
@@ -1059,7 +1059,6 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
     if ( pvh_boot )
     {
-        ASSERT(mbi_p == 0);
         pvh_init(&mbi, &mod);
         /*
          * mbi and mod are regular pointers to .initdata.  These remain valid
@@ -1068,7 +1067,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     }
     else
     {
-        mbi = __va(mbi_p);
+        mbi = __va(multiboot_ptr);
         mod = __va(mbi->mods_addr);
 
         /*
@@ -1078,11 +1077,8 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
          * For EFI, these are directmap pointers into the Xen image.  They do
          * not remain valid across move_xen().  EFI boot only functions
          * because a non-zero xen_phys_start inhibits move_xen().
-         *
-         * Don't be fooled by efi_arch_post_exit_boot() passing "D" (&mbi).
-         * This is a EFI physical-mode (i.e. identity map) pointer.
          */
-        ASSERT(mbi_p < MB(1) || xen_phys_start);
+        ASSERT(multiboot_ptr < MB(1) || xen_phys_start);
     }
 
     bi = multiboot_fill_boot_info(mbi, mod);

base-commit: be84e7fe58b51f6b6dd907a038f0ef998a1e281e
prerequisite-patch-id: 795f6e9425cc6a953166b530ae68df466a7a3c2b
-- 
2.39.5


