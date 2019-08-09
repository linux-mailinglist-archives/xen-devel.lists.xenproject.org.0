Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E177687DAF
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 17:05:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw6PQ-0003Kj-74; Fri, 09 Aug 2019 15:02:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dfSS=WF=merlin.srs.infradead.org=batv+726623fc28cc57e4ef8a+5829+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1hw6PO-0003Jv-NN
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 15:02:22 +0000
X-Inumbo-ID: af1de4f6-bab6-11e9-8980-bc764e045a96
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id af1de4f6-bab6-11e9-8980-bc764e045a96;
 Fri, 09 Aug 2019 15:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Mime-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BJvnGtzq7uy9Q/thG44bTkRUyltJvb22XsNtknj4sBk=; b=f9hcEK2UDmMqhSxF68gKopZlk
 aS7lMkUM3+iaZHGAtdZrARN2UY+8Jskg0eh4SvMzTWAQN8FEcSlgJk+N2suDQ1An47f+b0WgqawTH
 lzlX2Url0RKv9JYc6dyybApY0K+ta1D8ubRYxhtM6Yp31eLmO/kHLbS48Q0wMCbXkJhGMyIavPhic
 fo+EtLTFe4i6howlR0r4sQwVszL/yBBhToxrL+nzvzcEEtq4cfKeGxKd0x3wFOyK2RL4eZaQcQ4T/
 1OAGcvdtGcG8eNbARDBKNN/UuQAEJ2Z93tXhmxO9AlbiWlN26jh5SchYVab8yEHY8N360/iDmG6oA
 sq/NnA8qw==;
Received: from [2001:8b0:10b:1:4a2a:e3ff:fe14:8625]
 (helo=u3832b3a9db3152.ant.amazon.com)
 by merlin.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hw6PL-0007jP-06; Fri, 09 Aug 2019 15:02:19 +0000
Message-ID: <c0e531fc665c9ad7595d853e2ce631a13974c022.camel@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 09 Aug 2019 16:02:17 +0100
In-Reply-To: <cover.1565362089.git.dwmw@amazon.co.uk>
References: <cover.1565362089.git.dwmw@amazon.co.uk>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 merlin.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [PATCH v2 6/6] x86/boot: Do not use trampoline for
 no-real-mode boot paths
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============7546722600878387838=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============7546722600878387838==
Content-Type: multipart/signed; micalg="sha-256";
	protocol="application/x-pkcs7-signature";
	boundary="=-Ap+y1wi+CHZrudoYOpFd"


--=-Ap+y1wi+CHZrudoYOpFd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: David Woodhouse <dwmw@amazon.co.uk>

Where booted from EFI or with no-real-mode, there is no need to stomp
on low memory with the 16-boot code. Instead, just go straight to
trampoline_protmode_entry() at its physical location within the Xen
image.

For now, the boot code (including the EFI loader path) still determines
what the trampoline_phys address should be. The trampoline is actually
relocated for that address and copied into low memory, from a
relocate_trampoline() call made from __start_xen().

For subsequent AP startup and wakeup, the 32-bit trampoline can't
trivially be used in-place as that region isn't mapped. So copy it
down to low memory too, having relocated it (again) to work from
there.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 xen/arch/x86/acpi/power.c      |  6 +--
 xen/arch/x86/boot/head.S       | 67 ++++++++++++++++------------------
 xen/arch/x86/boot/trampoline.S | 32 ++++++++++++----
 xen/arch/x86/cpu/common.c      |  2 +-
 xen/arch/x86/cpu/intel.c       |  2 +-
 xen/arch/x86/efi/efi-boot.h    | 31 ++--------------
 xen/arch/x86/setup.c           | 43 ++++++++++++++++++++--
 xen/arch/x86/smpboot.c         |  6 +--
 xen/arch/x86/tboot.c           |  6 +--
 xen/arch/x86/x86_64/mm.c       |  2 +-
 xen/include/asm-x86/acpi.h     |  2 +-
 xen/include/asm-x86/config.h   | 10 ++---
 12 files changed, 118 insertions(+), 91 deletions(-)

diff --git a/xen/arch/x86/acpi/power.c b/xen/arch/x86/acpi/power.c
index aecc754fdb..d2a355429e 100644
--- a/xen/arch/x86/acpi/power.c
+++ b/xen/arch/x86/acpi/power.c
@@ -152,9 +152,9 @@ static void acpi_sleep_prepare(u32 state)
         return;
=20
     if ( acpi_sinfo.vector_width =3D=3D 32 )
-        *(uint32_t *)wakeup_vector_va =3D bootsym_phys(wakeup_start);
+        *(uint32_t *)wakeup_vector_va =3D trampsym_phys(wakeup_start);
     else
-        *(uint64_t *)wakeup_vector_va =3D bootsym_phys(wakeup_start);
+        *(uint64_t *)wakeup_vector_va =3D trampsym_phys(wakeup_start);
 }
=20
 static void acpi_sleep_post(u32 state) {}
@@ -388,7 +388,7 @@ static void tboot_sleep(u8 sleep_state)
     g_tboot_shared->acpi_sinfo.wakeup_vector =3D acpi_sinfo.wakeup_vector;
     g_tboot_shared->acpi_sinfo.vector_width =3D acpi_sinfo.vector_width;
     g_tboot_shared->acpi_sinfo.kernel_s3_resume_vector =3D
-                                              bootsym_phys(wakeup_start);
+                                              trampsym_phys(wakeup_start);
=20
     switch ( sleep_state )
     {
diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 104eb0eb3c..2268ec99ed 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -697,16 +697,23 @@ trampoline_setup:
         lea     __PAGE_HYPERVISOR+sym_esi(l1_identmap),%edi
         mov     %edi,sym_fs(l2_bootmap)
=20
-        /* Apply relocations to bootstrap trampoline. */
-        mov     sym_fs(trampoline_phys),%edx
-        mov     $sym_offs(__trampoline_rel_start),%edi
-1:
-        mov     %fs:(%edi),%eax
-        add     %edx,%fs:(%edi,%eax)
-        add     $4,%edi
-        cmp     $sym_offs(__trampoline_rel_stop),%edi
-        jb      1b
+        /* Do not parse command line on EFI platform here. */
+        cmpb    $0,sym_fs(efi_platform)
+        jnz     1f
=20
+        /* Bail if there is no command line to parse. */
+        mov     sym_fs(multiboot_ptr),%ebx
+        testl   $MBI_CMDLINE,MB_flags(%ebx)
+        jz      1f
+
+        lea     sym_esi(early_boot_opts),%eax
+        push    %eax
+        pushl   MB_cmdline(%ebx)
+        call    cmdline_parse_early
+
+1:
+        /* Apply relocations to 32-bit trampoline for execution in place. =
*/
+        lea     sym_esi(perm_trampoline_start),%edx
         mov     $sym_offs(__trampoline32_rel_start),%edi
 1:
         mov     %fs:(%edi),%eax
@@ -715,6 +722,21 @@ trampoline_setup:
         cmp     $sym_offs(__trampoline32_rel_stop),%edi
         jb      1b
=20
+        cmp     $0,sym_esi(skip_realmode)
+        jz      .Ldo_realmode
+
+        /* Go directly to trampoline_protmode_entry at its physical addres=
s */
+        lea     trampoline_protmode_entry-__XEN_VIRT_START(%esi),%eax
+        pushl   $BOOT_CS32
+        push    %eax
+
+        /* EBX =3D=3D 0 indicates we are the BP (Boot Processor). */
+        xor     %ebx,%ebx
+        retl
+
+.Ldo_realmode:
+        /* Apply relocations to 16-bit boot code. */
+        mov     sym_fs(trampoline_phys),%edx
         mov     $sym_offs(__bootsym_rel_start),%edi
 1:
         mov     %fs:(%edi),%eax
@@ -744,35 +766,12 @@ trampoline_setup:
         cmp     $sym_offs(__bootdatasym_rel_stop),%edi
         jb      1b
=20
-        /* Do not parse command line on EFI platform here. */
-        cmpb    $0,sym_fs(efi_platform)
-        jnz     1f
-
-        /* Bail if there is no command line to parse. */
-        mov     sym_fs(multiboot_ptr),%ebx
-        testl   $MBI_CMDLINE,MB_flags(%ebx)
-        jz      1f
-
-        lea     sym_esi(early_boot_opts),%eax
-        push    %eax
-        pushl   MB_cmdline(%ebx)
-        call    cmdline_parse_early
-
-1:
         /* Switch to low-memory stack which lives at the end of trampoline=
 region. */
         mov     sym_fs(trampoline_phys),%edi
         lea     TRAMPOLINE_SPACE+TRAMPOLINE_STACK_SPACE(%edi),%esp
-        cmpb    $0, sym_fs(skip_realmode)
-        jz      1f
-        /* If no-real-mode, jump straight to trampoline_protmode_entry */
-        lea     trampoline_protmode_entry-boot_trampoline_start(%edi),%eax
-        /* EBX =3D=3D 0 indicates we are the BP (Boot Processor). */
-        xor     %ebx,%ebx
-        jmp     2f
-1:
+
         /* Go via 16-bit code in trampoline_boot_cpu_entry */
         lea     trampoline_boot_cpu_entry-boot_trampoline_start(%edi),%eax
-2:
         pushl   $BOOT_CS32
         push    %eax
=20
@@ -795,8 +794,6 @@ cmdline_parse_early:
 reloc:
 #include "reloc.S"
=20
-ENTRY(boot_trampoline_start)
 #include "trampoline.S"
-ENTRY(boot_trampoline_end)
=20
 #include "x86_64.S"
diff --git a/xen/arch/x86/boot/trampoline.S b/xen/arch/x86/boot/trampoline.=
S
index b5517a44bb..7b9ebb6172 100644
--- a/xen/arch/x86/boot/trampoline.S
+++ b/xen/arch/x86/boot/trampoline.S
@@ -60,7 +60,7 @@ GLOBAL(bootdata_start)
         .popsection
=20
 #undef trampsym
-#define trampsym(s) ((s)-boot_trampoline_start)
+#define trampsym(s) ((s)-perm_trampoline_start)
=20
 #define trampsym_rel(sym, off, opnd...)    \
         trampsym(sym),##opnd;              \
@@ -70,7 +70,7 @@ GLOBAL(bootdata_start)
         .popsection
=20
 #undef tramp32sym
-#define tramp32sym(s) ((s)-boot_trampoline_start)
+#define tramp32sym(s) ((s)-perm_trampoline_start)
=20
 #define tramp32sym_rel(sym, off, opnd...)  \
         tramp32sym(sym),##opnd;            \
@@ -83,6 +83,8 @@ GLOBAL(bootdata_start)
=20
         .code16
=20
+ENTRY(perm_trampoline_start)
+
 /*
  * do_boot_cpu() programs the Startup-IPI to point here.  Due to the SIPI
  * format, the relocated entrypoint must be 4k aligned.
@@ -90,6 +92,7 @@ GLOBAL(bootdata_start)
  * It is entered in Real Mode, with %cs =3D trampoline_realmode_entry >> 4=
 and
  * %ip =3D 0.
  */
+
 GLOBAL(trampoline_realmode_entry)
         mov     %cs,%ax
         mov     %ax,%ds
@@ -97,7 +100,7 @@ GLOBAL(trampoline_realmode_entry)
         cld
         cli
         lidt    trampsym(idt_48)
-        lgdt    trampsym(gdt_48)
+        lgdtl   trampsym(gdt_48)
         mov     $1,%bl                    # EBX !=3D 0 indicates we are an=
 AP
         xor     %ax, %ax
         inc     %ax
@@ -236,11 +239,23 @@ gdt_48: .word   7*8-1
=20
 /* The first page of trampoline is permanent, the rest boot-time only. */
 /* Reuse the boot trampoline on the 1st trampoline page as stack for wakeu=
p. */
-        .equ    wakeup_stack, boot_trampoline_start + PAGE_SIZE
+        .equ    wakeup_stack, perm_trampoline_start + PAGE_SIZE
         .global wakeup_stack
=20
+ENTRY(perm_trampoline_end)
+
 /* From here on early boot only. */
=20
+ENTRY(boot_trampoline_start)
+
+        .word   0
+boot16_idt:
+        .word   0, 0, 0 # base =3D limit =3D 0
+        .word   0
+boot16_gdt:
+        .word   7*8-1
+        .long   tramp32sym_rel(trampoline_gdt,4)
+
         .code32
 trampoline_boot_cpu_entry:
         /* Load pseudo-real-mode segments. */
@@ -304,8 +319,8 @@ trampoline_boot_cpu_entry:
         cli
=20
         /* Reset GDT and IDT. Some BIOSes clobber GDTR. */
-        lidt    bootsym(idt_48)
-        lgdt    bootsym(gdt_48)
+        lidt    bootsym(boot16_idt)
+        lgdtl   bootsym(boot16_gdt)
=20
         /* Enter protected mode, and flush insn queue. */
         xor     %ax,%ax
@@ -343,7 +358,8 @@ trampoline_boot_cpu_entry:
         xor     %ebx,%ebx
=20
         /* Jump to the common bootstrap entry point. */
-        jmp     trampoline_protmode_entry
+        mov     $tramp32sym_rel(trampoline_protmode_entry,4,%eax)
+        jmp     *%eax
=20
 #include "video.h"
=20
@@ -379,6 +395,8 @@ rm_idt: .word   256*4-1, 0, 0
 #include "video.S"
 #endif
=20
+ENTRY(boot_trampoline_end)
+
         .pushsection .data.boot16, "aw", @progbits
 GLOBAL(bootdata_end)
         .popsection
diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 7478e21177..d202216739 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -389,7 +389,7 @@ static void generic_identify(struct cpuinfo_x86 *c)
 		      &c->x86_capability[cpufeat_word(X86_FEATURE_LAHF_LM)],
 		      &c->x86_capability[cpufeat_word(X86_FEATURE_SYSCALL)]);
 	if (c =3D=3D &boot_cpu_data)
-		bootsym(cpuid_ext_features) =3D
+		trampsym(cpuid_ext_features) =3D
 			c->x86_capability[cpufeat_word(X86_FEATURE_NX)];
=20
 	if (c->extended_cpuid_level >=3D 0x80000004)
diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
index 5356a6ae10..1970eb1848 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -269,7 +269,7 @@ static void early_init_intel(struct cpuinfo_x86 *c)
 				 MSR_IA32_MISC_ENABLE_XD_DISABLE);
 	if (disable) {
 		wrmsrl(MSR_IA32_MISC_ENABLE, misc_enable & ~disable);
-		bootsym(trampoline_misc_enable_off) |=3D disable;
+		trampsym(trampoline_misc_enable_off) |=3D disable;
 	}
=20
 	if (disable & MSR_IA32_MISC_ENABLE_LIMIT_CPUID)
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index fc2ea554b5..e7418894a4 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -98,29 +98,6 @@ static void __init efi_arch_relocate_image(unsigned long=
 delta)
     }
 }
=20
-extern const s32 __trampoline_rel_start[], __trampoline_rel_stop[];
-extern const s32 __trampoline32_rel_start[], __trampoline32_rel_stop[];
-
-static void __init relocate_trampoline(unsigned long phys)
-{
-    const s32 *trampoline_ptr;
-
-    trampoline_phys =3D phys;
-
-    if ( !efi_enabled(EFI_LOADER) )
-        return;
-
-    /* Apply relocations to trampoline. */
-    for ( trampoline_ptr =3D __trampoline_rel_start;
-          trampoline_ptr < __trampoline_rel_stop;
-          ++trampoline_ptr )
-        *(u32 *)(*trampoline_ptr + (long)trampoline_ptr) +=3D phys;
-    for ( trampoline_ptr =3D __trampoline32_rel_start;
-          trampoline_ptr < __trampoline32_rel_stop;
-          ++trampoline_ptr )
-        *(u32 *)(*trampoline_ptr + (long)trampoline_ptr) +=3D phys;
-}
-
 static void __init place_string(u32 *addr, const char *s)
 {
     char *alloc =3D NULL;
@@ -223,7 +200,7 @@ static void __init efi_arch_pre_exit_boot(void)
     {
         if ( !cfg.addr )
             blexit(L"No memory for trampoline");
-        relocate_trampoline(cfg.addr);
+        trampoline_phys =3D cfg.addr;
     }
 }
=20
@@ -232,7 +209,6 @@ static void __init noreturn efi_arch_post_exit_boot(voi=
d)
     u64 cr4 =3D XEN_MINIMAL_CR4 & ~X86_CR4_PGE, efer;
=20
     efi_arch_relocate_image(__XEN_VIRT_START - xen_phys_start);
-    memcpy((void *)trampoline_phys, boot_trampoline_start, cfg.size);
=20
     /* Set system registers and transfer control. */
     asm volatile("pushq $0\n\tpopfq");
@@ -566,14 +542,14 @@ static void __init efi_arch_memory_setup(void)
     cfg.addr =3D 0x100000;
=20
     if ( efi_enabled(EFI_LOADER) )
-        cfg.size =3D boot_trampoline_end - boot_trampoline_start;
+        cfg.size =3D perm_trampoline_end - perm_trampoline_start;
     else
         cfg.size =3D TRAMPOLINE_SPACE + TRAMPOLINE_STACK_SPACE;
=20
     status =3D efi_bs->AllocatePages(AllocateMaxAddress, EfiLoaderData,
                                    PFN_UP(cfg.size), &cfg.addr);
     if ( status =3D=3D EFI_SUCCESS )
-        relocate_trampoline(cfg.addr);
+        trampoline_phys =3D cfg.addr;
     else
     {
         cfg.addr =3D 0;
@@ -665,7 +641,6 @@ static void __init efi_arch_load_addr_check(EFI_LOADED_=
IMAGE *loaded_image)
         blexit(L"Xen must be loaded below 4Gb.");
     if ( xen_phys_start & ((1 << L2_PAGETABLE_SHIFT) - 1) )
         blexit(L"Xen must be loaded at a 2Mb boundary.");
-    trampoline_xen_phys_start =3D xen_phys_start;
 }
=20
 static bool __init efi_arch_use_config_file(EFI_SYSTEM_TABLE *SystemTable)
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 101c9dd272..eb8bc7e33b 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -682,6 +682,42 @@ static unsigned int __init copy_bios_e820(struct e820e=
ntry *map, unsigned int li
     return n;
 }
=20
+extern const s32 __trampoline_rel_start[], __trampoline_rel_stop[];
+extern const s32 __trampoline32_rel_start[], __trampoline32_rel_stop[];
+
+static void __init relocate_trampoline(unsigned long phys)
+{
+    const s32 *trampoline_ptr;
+    uint32_t tramp32_delta =3D 0;
+
+    /* Apply relocations to trampoline. */
+    for ( trampoline_ptr =3D __trampoline_rel_start;
+          trampoline_ptr < __trampoline_rel_stop;
+          ++trampoline_ptr )
+        *(u32 *)(*trampoline_ptr + (long)trampoline_ptr) +=3D phys;
+
+    tramp32_delta =3D phys;
+    if (!efi_enabled(EFI_LOADER)) {
+        /*
+         * The non-EFI boot code uses the 32-bit trampoline in place
+         * so will have relocated it to the physical address of
+         * perm_trampoline_start already. Undo that as it needs to
+         * run from low memory for AP startup, because the Xen
+         * physical address range won't be mapped.
+         */
+        tramp32_delta -=3D trampoline_xen_phys_start;
+        tramp32_delta -=3D (unsigned long)(perm_trampoline_start - __XEN_V=
IRT_START);
+    }
+    for ( trampoline_ptr =3D __trampoline32_rel_start;
+          trampoline_ptr < __trampoline32_rel_stop;
+          ++trampoline_ptr )
+        *(u32 *)(*trampoline_ptr + (long)trampoline_ptr) +=3D tramp32_delt=
a;
+    trampoline_xen_phys_start =3D xen_phys_start;
+
+    memcpy(trampsym(perm_trampoline_start), perm_trampoline_start,
+           perm_trampoline_end - perm_trampoline_start);
+}
+
 void __init noreturn __start_xen(unsigned long mbi_p)
 {
     char *memmap_type =3D NULL;
@@ -1076,7 +1112,6 @@ void __init noreturn __start_xen(unsigned long mbi_p)
             /* Select relocation address. */
             e =3D end - reloc_size;
             xen_phys_start =3D e;
-            bootsym(trampoline_xen_phys_start) =3D e;
=20
             /*
              * No PTEs pointing above this address are candidates for relo=
cation.
@@ -1509,6 +1544,8 @@ void __init noreturn __start_xen(unsigned long mbi_p)
     else
         end_boot_allocator();
=20
+    relocate_trampoline(trampoline_phys);
+
     system_state =3D SYS_STATE_boot;
     /*
      * No calls involving ACPI code should go between the setting of
@@ -1879,8 +1916,8 @@ int __hwdom_init xen_in_range(unsigned long mfn)
     if ( !xen_regions[0].s )
     {
         /* S3 resume code (and other real mode trampoline code) */
-        xen_regions[region_s3].s =3D bootsym_phys(boot_trampoline_start);
-        xen_regions[region_s3].e =3D bootsym_phys(boot_trampoline_end);
+        xen_regions[region_s3].s =3D trampsym_phys(perm_trampoline_start);
+        xen_regions[region_s3].e =3D trampsym_phys(perm_trampoline_end);
=20
         /*
          * This needs to remain in sync with the uses of the same symbols =
in
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 65e9ceeece..0410331a9e 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -47,7 +47,7 @@
 #include <asm/tboot.h>
 #include <mach_apic.h>
=20
-#define setup_trampoline()    (bootsym_phys(trampoline_realmode_entry))
+#define setup_trampoline()    (trampsym_phys(trampoline_realmode_entry))
=20
 unsigned long __read_mostly trampoline_phys;
=20
@@ -598,7 +598,7 @@ static int do_boot_cpu(int apicid, int cpu)
         {
             boot_error =3D 1;
             smp_mb();
-            if ( bootsym(trampoline_cpu_started) =3D=3D 0xA5 )
+            if ( trampsym(trampoline_cpu_started) =3D=3D 0xA5 )
                 /* trampoline started but...? */
                 printk("Stuck ??\n");
             else
@@ -614,7 +614,7 @@ static int do_boot_cpu(int apicid, int cpu)
     }
=20
     /* mark "stuck" area as not stuck */
-    bootsym(trampoline_cpu_started) =3D 0;
+    trampsym(trampoline_cpu_started) =3D 0;
     smp_mb();
=20
     return rc;
diff --git a/xen/arch/x86/tboot.c b/xen/arch/x86/tboot.c
index 325d94d23a..daf19d346a 100644
--- a/xen/arch/x86/tboot.c
+++ b/xen/arch/x86/tboot.c
@@ -369,9 +369,9 @@ void tboot_shutdown(uint32_t shutdown_type)
          */
         g_tboot_shared->num_mac_regions =3D 3;
         /* S3 resume code (and other real mode trampoline code) */
-        g_tboot_shared->mac_regions[0].start =3D bootsym_phys(boot_trampol=
ine_start);
-        g_tboot_shared->mac_regions[0].size =3D bootsym_phys(boot_trampoli=
ne_end) -
-                                              bootsym_phys(boot_trampoline=
_start);
+        g_tboot_shared->mac_regions[0].start =3D trampsym_phys(perm_trampo=
line_start);
+        g_tboot_shared->mac_regions[0].size =3D trampsym_phys(perm_trampol=
ine_end) -
+                                              trampsym_phys(perm_trampolin=
e_start);
         /* hypervisor .text + .rodata */
         g_tboot_shared->mac_regions[1].start =3D (uint64_t)__pa(&_stext);
         g_tboot_shared->mac_regions[1].size =3D __pa(&__2M_rodata_end) -
diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index 149cc4f7b5..05d476c423 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -697,7 +697,7 @@ void __init zap_low_mappings(void)
=20
     /* Replace with mapping of the boot trampoline only. */
     map_pages_to_xen(trampoline_phys, maddr_to_mfn(trampoline_phys),
-                     PFN_UP(boot_trampoline_end - boot_trampoline_start),
+                     PFN_UP(perm_trampoline_end - perm_trampoline_start),
                      __PAGE_HYPERVISOR);
 }
=20
diff --git a/xen/include/asm-x86/acpi.h b/xen/include/asm-x86/acpi.h
index 7032f3a001..8c5381aa47 100644
--- a/xen/include/asm-x86/acpi.h
+++ b/xen/include/asm-x86/acpi.h
@@ -106,7 +106,7 @@ extern int acpi_scan_nodes(u64 start, u64 end);
 #define NR_NODE_MEMBLKS (MAX_NUMNODES*2)
=20
 extern struct acpi_sleep_info acpi_sinfo;
-#define acpi_video_flags bootsym(video_flags)
+#define acpi_video_flags trampsym(video_flags)
 struct xenpf_enter_acpi_sleep;
 extern int acpi_enter_sleep(struct xenpf_enter_acpi_sleep *sleep);
 extern int acpi_enter_state(u32 state);
diff --git a/xen/include/asm-x86/config.h b/xen/include/asm-x86/config.h
index ada8c7b4f6..78634296b5 100644
--- a/xen/include/asm-x86/config.h
+++ b/xen/include/asm-x86/config.h
@@ -89,12 +89,12 @@
=20
 #ifndef __ASSEMBLY__
 extern unsigned long trampoline_phys;
-#define bootsym_phys(sym)                                 \
-    (((unsigned long)&(sym)-(unsigned long)&boot_trampoline_start)+trampol=
ine_phys)
-#define bootsym(sym)                                      \
+#define trampsym_phys(sym)                                 \
+    (((unsigned long)&(sym)-(unsigned long)&perm_trampoline_start)+trampol=
ine_phys)
+#define trampsym(sym)                                      \
     (*RELOC_HIDE((typeof(&(sym)))__va(__pa(&(sym))),      \
-                 trampoline_phys-__pa(boot_trampoline_start)))
-extern char boot_trampoline_start[], boot_trampoline_end[];
+                 trampoline_phys-__pa(perm_trampoline_start)))
+extern char perm_trampoline_start[], perm_trampoline_end[];
 extern char trampoline_realmode_entry[];
 extern unsigned int trampoline_xen_phys_start;
 extern unsigned char trampoline_cpu_started;


--=-Ap+y1wi+CHZrudoYOpFd
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCECow
ggUcMIIEBKADAgECAhEA4rtJSHkq7AnpxKUY8ZlYZjANBgkqhkiG9w0BAQsFADCBlzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0EwHhcNMTkwMTAyMDAwMDAwWhcNMjIwMTAxMjM1
OTU5WjAkMSIwIAYJKoZIhvcNAQkBFhNkd213MkBpbmZyYWRlYWQub3JnMIIBIjANBgkqhkiG9w0B
AQEFAAOCAQ8AMIIBCgKCAQEAsv3wObLTCbUA7GJqKj9vHGf+Fa+tpkO+ZRVve9EpNsMsfXhvFpb8
RgL8vD+L133wK6csYoDU7zKiAo92FMUWaY1Hy6HqvVr9oevfTV3xhB5rQO1RHJoAfkvhy+wpjo7Q
cXuzkOpibq2YurVStHAiGqAOMGMXhcVGqPuGhcVcVzVUjsvEzAV9Po9K2rpZ52FE4rDkpDK1pBK+
uOAyOkgIg/cD8Kugav5tyapydeWMZRJQH1vMQ6OVT24CyAn2yXm2NgTQMS1mpzStP2ioPtTnszIQ
Ih7ASVzhV6csHb8Yrkx8mgllOyrt9Y2kWRRJFm/FPRNEurOeNV6lnYAXOymVJwIDAQABo4IB0zCC
Ac8wHwYDVR0jBBgwFoAUgq9sjPjF/pZhfOgfPStxSF7Ei8AwHQYDVR0OBBYEFLfuNf820LvaT4AK
xrGK3EKx1DE7MA4GA1UdDwEB/wQEAwIFoDAMBgNVHRMBAf8EAjAAMB0GA1UdJQQWMBQGCCsGAQUF
BwMEBggrBgEFBQcDAjBGBgNVHSAEPzA9MDsGDCsGAQQBsjEBAgEDBTArMCkGCCsGAQUFBwIBFh1o
dHRwczovL3NlY3VyZS5jb21vZG8ubmV0L0NQUzBaBgNVHR8EUzBRME+gTaBLhklodHRwOi8vY3Js
LmNvbW9kb2NhLmNvbS9DT01PRE9SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFuZFNlY3VyZUVtYWls
Q0EuY3JsMIGLBggrBgEFBQcBAQR/MH0wVQYIKwYBBQUHMAKGSWh0dHA6Ly9jcnQuY29tb2RvY2Eu
Y29tL0NPTU9ET1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcnQwJAYI
KwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmNvbW9kb2NhLmNvbTAeBgNVHREEFzAVgRNkd213MkBpbmZy
YWRlYWQub3JnMA0GCSqGSIb3DQEBCwUAA4IBAQALbSykFusvvVkSIWttcEeifOGGKs7Wx2f5f45b
nv2ghcxK5URjUvCnJhg+soxOMoQLG6+nbhzzb2rLTdRVGbvjZH0fOOzq0LShq0EXsqnJbbuwJhK+
PnBtqX5O23PMHutP1l88AtVN+Rb72oSvnD+dK6708JqqUx2MAFLMevrhJRXLjKb2Mm+/8XBpEw+B
7DisN4TMlLB/d55WnT9UPNHmQ+3KFL7QrTO8hYExkU849g58Dn3Nw3oCbMUgny81ocrLlB2Z5fFG
Qu1AdNiBA+kg/UxzyJZpFbKfCITd5yX49bOriL692aMVDyqUvh8fP+T99PqorH4cIJP6OxSTdxKM
MIIFHDCCBASgAwIBAgIRAOK7SUh5KuwJ6cSlGPGZWGYwDQYJKoZIhvcNAQELBQAwgZcxCzAJBgNV
BAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAY
BgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRo
ZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMB4XDTE5MDEwMjAwMDAwMFoXDTIyMDEwMTIz
NTk1OVowJDEiMCAGCSqGSIb3DQEJARYTZHdtdzJAaW5mcmFkZWFkLm9yZzCCASIwDQYJKoZIhvcN
AQEBBQADggEPADCCAQoCggEBALL98Dmy0wm1AOxiaio/bxxn/hWvraZDvmUVb3vRKTbDLH14bxaW
/EYC/Lw/i9d98CunLGKA1O8yogKPdhTFFmmNR8uh6r1a/aHr301d8YQea0DtURyaAH5L4cvsKY6O
0HF7s5DqYm6tmLq1UrRwIhqgDjBjF4XFRqj7hoXFXFc1VI7LxMwFfT6PStq6WedhROKw5KQytaQS
vrjgMjpICIP3A/CroGr+bcmqcnXljGUSUB9bzEOjlU9uAsgJ9sl5tjYE0DEtZqc0rT9oqD7U57My
ECIewElc4VenLB2/GK5MfJoJZTsq7fWNpFkUSRZvxT0TRLqznjVepZ2AFzsplScCAwEAAaOCAdMw
ggHPMB8GA1UdIwQYMBaAFIKvbIz4xf6WYXzoHz0rcUhexIvAMB0GA1UdDgQWBBS37jX/NtC72k+A
CsaxitxCsdQxOzAOBgNVHQ8BAf8EBAMCBaAwDAYDVR0TAQH/BAIwADAdBgNVHSUEFjAUBggrBgEF
BQcDBAYIKwYBBQUHAwIwRgYDVR0gBD8wPTA7BgwrBgEEAbIxAQIBAwUwKzApBggrBgEFBQcCARYd
aHR0cHM6Ly9zZWN1cmUuY29tb2RvLm5ldC9DUFMwWgYDVR0fBFMwUTBPoE2gS4ZJaHR0cDovL2Ny
bC5jb21vZG9jYS5jb20vQ09NT0RPUlNBQ2xpZW50QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFp
bENBLmNybDCBiwYIKwYBBQUHAQEEfzB9MFUGCCsGAQUFBzAChklodHRwOi8vY3J0LmNvbW9kb2Nh
LmNvbS9DT01PRE9SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFuZFNlY3VyZUVtYWlsQ0EuY3J0MCQG
CCsGAQUFBzABhhhodHRwOi8vb2NzcC5jb21vZG9jYS5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5m
cmFkZWFkLm9yZzANBgkqhkiG9w0BAQsFAAOCAQEAC20spBbrL71ZEiFrbXBHonzhhirO1sdn+X+O
W579oIXMSuVEY1LwpyYYPrKMTjKECxuvp24c829qy03UVRm742R9Hzjs6tC0oatBF7KpyW27sCYS
vj5wbal+TttzzB7rT9ZfPALVTfkW+9qEr5w/nSuu9PCaqlMdjABSzHr64SUVy4ym9jJvv/FwaRMP
gew4rDeEzJSwf3eeVp0/VDzR5kPtyhS+0K0zvIWBMZFPOPYOfA59zcN6AmzFIJ8vNaHKy5QdmeXx
RkLtQHTYgQPpIP1Mc8iWaRWynwiE3ecl+PWzq4i+vdmjFQ8qlL4fHz/k/fT6qKx+HCCT+jsUk3cS
jDCCBeYwggPOoAMCAQICEGqb4Tg7/ytrnwHV2binUlYwDQYJKoZIhvcNAQEMBQAwgYUxCzAJBgNV
BAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAY
BgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMSswKQYDVQQDEyJDT01PRE8gUlNBIENlcnRpZmljYXRp
b24gQXV0aG9yaXR5MB4XDTEzMDExMDAwMDAwMFoXDTI4MDEwOTIzNTk1OVowgZcxCzAJBgNVBAYT
AkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAYBgNV
BAoTEUNPTU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRoZW50
aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC
AQEAvrOeV6wodnVAFsc4A5jTxhh2IVDzJXkLTLWg0X06WD6cpzEup/Y0dtmEatrQPTRI5Or1u6zf
+bGBSyD9aH95dDSmeny1nxdlYCeXIoymMv6pQHJGNcIDpFDIMypVpVSRsivlJTRENf+RKwrB6vcf
WlP8dSsE3Rfywq09N0ZfxcBa39V0wsGtkGWC+eQKiz4pBZYKjrc5NOpG9qrxpZxyb4o4yNNwTqza
aPpGRqXB7IMjtf7tTmU2jqPMLxFNe1VXj9XB1rHvbRikw8lBoNoSWY66nJN/VCJv5ym6Q0mdCbDK
CMPybTjoNCQuelc0IAaO4nLUXk0BOSxSxt8kCvsUtQIDAQABo4IBPDCCATgwHwYDVR0jBBgwFoAU
u69+Aj36pvE8hI6t7jiY7NkyMtQwHQYDVR0OBBYEFIKvbIz4xf6WYXzoHz0rcUhexIvAMA4GA1Ud
DwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMBEGA1UdIAQKMAgwBgYEVR0gADBMBgNVHR8E
RTBDMEGgP6A9hjtodHRwOi8vY3JsLmNvbW9kb2NhLmNvbS9DT01PRE9SU0FDZXJ0aWZpY2F0aW9u
QXV0aG9yaXR5LmNybDBxBggrBgEFBQcBAQRlMGMwOwYIKwYBBQUHMAKGL2h0dHA6Ly9jcnQuY29t
b2RvY2EuY29tL0NPTU9ET1JTQUFkZFRydXN0Q0EuY3J0MCQGCCsGAQUFBzABhhhodHRwOi8vb2Nz
cC5jb21vZG9jYS5jb20wDQYJKoZIhvcNAQEMBQADggIBAHhcsoEoNE887l9Wzp+XVuyPomsX9vP2
SQgG1NgvNc3fQP7TcePo7EIMERoh42awGGsma65u/ITse2hKZHzT0CBxhuhb6txM1n/y78e/4ZOs
0j8CGpfb+SJA3GaBQ+394k+z3ZByWPQedXLL1OdK8aRINTsjk/H5Ns77zwbjOKkDamxlpZ4TKSDM
KVmU/PUWNMKSTvtlenlxBhh7ETrN543j/Q6qqgCWgWuMAXijnRglp9fyadqGOncjZjaaSOGTTFB+
E2pvOUtY+hPebuPtTbq7vODqzCM6ryEhNhzf+enm0zlpXK7q332nXttNtjv7VFNYG+I31gnMrwfH
M5tdhYF/8v5UY5g2xANPECTQdu9vWPoqNSGDt87b3gXb1AiGGaI06vzgkejL580ul+9hz9D0S0U4
jkhJiA7EuTecP/CFtR72uYRBcunwwH3fciPjviDDAI9SnC/2aPY8ydehzuZutLbZdRJ5PDEJM/1t
yZR2niOYihZ+FCbtf3D9mB12D4ln9icgc7CwaxpNSCPt8i/GqK2HsOgkL3VYnwtx7cJUmpvVdZ4o
gnzgXtgtdk3ShrtOS1iAN2ZBXFiRmjVzmehoMof06r1xub+85hFQzVxZx5/bRaTKTlL8YXLI8nAb
R9HWdFqzcOoB/hxfEyIQpx9/s81rgzdEZOofSlZHynoSMYIDyjCCA8YCAQEwga0wgZcxCzAJBgNV
BAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAY
BgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRo
ZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEA4rtJSHkq7AnpxKUY8ZlYZjANBglghkgB
ZQMEAgEFAKCCAe0wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMTkw
ODA5MTUwMjE3WjAvBgkqhkiG9w0BCQQxIgQgTlMCnGvlglGqjJppGv7dzNmLsIdbYzlZgDgAfkaU
djowgb4GCSsGAQQBgjcQBDGBsDCBrTCBlzELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIg
TWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQx
PTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1h
aWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMIHABgsqhkiG9w0BCRACCzGBsKCBrTCBlzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMA0GCSqGSIb3
DQEBAQUABIIBAFVTeI658AcrKclbP9mfY/j3vmJ3w8QDFKzcIgyGpK9O9BQ8YCnB5Gf16PLmuMTa
Pqm5PwgZM0tdqqRC1Lp8eQCzgTHqYG0TthU6bWR3FOAs4iSDDx2aMXfF9uBF4wDru3Y7sz1qu1Od
Bg7plY1NPlBwmJA/j3ic0ONsSOe5Fl6+qvEqkwQj2AqiJ8eLSPiDyI/c/bMavgNyaPUnqY2kxCS8
LG6OAdxTeT+kQaxk9TQ18dFx/N5ZSGeer8A9gDwjJGcFRzB3NX3ZQ3vnkjPE7ERnPEL8/XEo8acW
0oUb1czjeyuG+95qpZfhMh4yVyMzYzqZYVVgatSrI1jVJ2ZYqV0AAAAAAAA=


--=-Ap+y1wi+CHZrudoYOpFd--



--===============7546722600878387838==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7546722600878387838==--


