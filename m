Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0D187DAE
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 17:04:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw6P3-00030V-Kg; Fri, 09 Aug 2019 15:02:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dfSS=WF=merlin.srs.infradead.org=batv+726623fc28cc57e4ef8a+5829+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1hw6P2-0002zj-4C
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 15:02:00 +0000
X-Inumbo-ID: a1d81baa-bab6-11e9-8980-bc764e045a96
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a1d81baa-bab6-11e9-8980-bc764e045a96;
 Fri, 09 Aug 2019 15:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Mime-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YHFuCgQZVp0A1w42kTsktjFy86Dq4C8noy5FKxuB7sA=; b=iplDAegJVmZejoSDhfnWbmRLT
 0rm3Z0bNE5vh0P8aXErfbDNkHLqaQQktrne39uxwWsktP1I52SsMXXfEZcVVOx69D9CCaXV3UUi0G
 6aFz7hCrMMblZcluR8qREEedy4P5g3VzQfh0tY5e+Lhe0SodQMwcG12csPIhwH6NsRIszAhjtTVlz
 kd73jv0MH79aya7wFI5msT6BcGnEVF2ETbdUPayyotRiR9rJMPzZA+GdkYjuZ/pqI7QVjDLeYc2ag
 eC5PP3qSw4LH7Wk9/gReRFDtzpVdOJlt2dHOAjswFDY4jTHl2xQruhwFSAQyuViJ1X1hcf2UXkrLv
 YJfkO1Xlg==;
Received: from [2001:8b0:10b:1:4a2a:e3ff:fe14:8625]
 (helo=u3832b3a9db3152.ant.amazon.com)
 by merlin.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hw6Oy-0007it-OF; Fri, 09 Aug 2019 15:01:57 +0000
Message-ID: <b14f575d4445e439e3d4fd7d385aab7f7f2bedd5.camel@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 09 Aug 2019 16:01:55 +0100
In-Reply-To: <cover.1565362089.git.dwmw@amazon.co.uk>
References: <cover.1565362089.git.dwmw@amazon.co.uk>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 merlin.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [PATCH v2 3/6] x86/boot: Split bootsym() into four
 types of relocations
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
Content-Type: multipart/mixed; boundary="===============6799826414783278095=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============6799826414783278095==
Content-Type: multipart/signed; micalg="sha-256";
	protocol="application/x-pkcs7-signature";
	boundary="=-C6+PB5zGR7Jw03cwfpxg"


--=-C6+PB5zGR7Jw03cwfpxg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: David Woodhouse <dwmw@amazon.co.uk>

As a first step toward using the low-memory trampoline only when necessary
for a legacy boot without no-real-mode, clean up the relocations into
three separate groups.

 =E2=80=A2 bootsym() is now used only at boot time when no-real-mode isn't =
set.

 =E2=80=A2 bootdatasym() is for variables containing information discovered=
 by
   the 16-bit boot code. This is currently accessed directly in place
   in low memory by Xen at runtime, but will be copied back to its
   location in high memory to avoid the pointer gymnastics (and because
   a subsequent patch will stop copying the 16-bit boot code into low
   memory at all when it isn't being used).

 =E2=80=A2 trampsym() is for the permanent 16-bit trampoline used for AP st=
artup
   and for wake from sleep. This is not used at boot, and can be copied
   into (properly allocated) low memory once the system is running.

 =E2=80=A2 tramp32sym() is used both at boot and for AP startup/wakeup. Dur=
ing
   boot it can be used in-place, running from the physical address of
   the Xen image. For AP startup it can't, because at that point there
   isn't a full 1:1 mapping of all memory; only the low trampoline page
   is mapped.

No (intentional) functional change yet; just a "cleanup" to allow the
various parts to be treated separately in subsequent patches.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 xen/arch/x86/boot/edd.S        | 16 +++----
 xen/arch/x86/boot/head.S       | 22 +++++++--
 xen/arch/x86/boot/mem.S        | 12 ++---
 xen/arch/x86/boot/trampoline.S | 85 ++++++++++++++++++++++++++--------
 xen/arch/x86/boot/video.S      |  6 +--
 xen/arch/x86/boot/wakeup.S     | 12 ++---
 xen/arch/x86/efi/efi-boot.h    |  8 ++--
 xen/arch/x86/xen.lds.S         | 15 ++++--
 8 files changed, 122 insertions(+), 54 deletions(-)

diff --git a/xen/arch/x86/boot/edd.S b/xen/arch/x86/boot/edd.S
index 3df712bce1..434bbbd960 100644
--- a/xen/arch/x86/boot/edd.S
+++ b/xen/arch/x86/boot/edd.S
@@ -41,7 +41,7 @@ get_edd:
 # This code is sensitive to the size of the structs in edd.h
 edd_start:
         /* ds:si points at fn48 results. Fn41 results go immediately befor=
e. */
-        movw    $bootsym(boot_edd_info)+EDDEXTSIZE, %si
+        movw    $bootdatasym(boot_edd_info)+EDDEXTSIZE, %si
         movb    $0x80, %dl                      # BIOS device 0x80
=20
 edd_check_ext:
@@ -56,7 +56,7 @@ edd_check_ext:
         movb    %dl, %ds:-8(%si)                # store device number
         movb    %ah, %ds:-7(%si)                # store version
         movw    %cx, %ds:-6(%si)                # store extensions
-        incb    bootsym(boot_edd_info_nr)       # note that we stored some=
thing
+        incb    bootdatasym(boot_edd_info_nr)   # note that we stored some=
thing
=20
 edd_get_device_params:
         movw    $EDDPARMSIZE, %ds:(%si)         # put size
@@ -97,7 +97,7 @@ edd_legacy_done:
 edd_next:
         incb    %dl                             # increment to next device
         jz      edd_done
-        cmpb    $EDD_INFO_MAX,bootsym(boot_edd_info_nr)
+        cmpb    $EDD_INFO_MAX,bootdatasym(boot_edd_info_nr)
         jb      edd_check_ext
=20
 edd_done:
@@ -108,11 +108,11 @@ edd_done:
 .Ledd_mbr_sig_start:
         pushw   %es
         movb    $0x80, %dl                      # from device 80
-        movw    $bootsym(boot_mbr_signature), %bx # store buffer ptr in bx
+        movw    $bootdatasym(boot_mbr_signature), %bx # store buffer ptr i=
n bx
 .Ledd_mbr_sig_read:
         pushw   %bx
-        movw    $bootsym(boot_edd_info), %bx
-        movzbw  bootsym(boot_edd_info_nr), %cx
+        movw    $bootdatasym(boot_edd_info), %bx
+        movzbw  bootdatasym(boot_edd_info_nr), %cx
         jcxz    .Ledd_mbr_sig_default
 .Ledd_mbr_sig_find_info:
         cmpb    %dl, (%bx)
@@ -151,12 +151,12 @@ edd_done:
         jne     .Ledd_mbr_sig_next
         movb    %dl, (%bx)                      # store BIOS drive number
         movl    %ecx, 4(%bx)                    # store signature from MBR
-        incb    bootsym(boot_mbr_signature_nr)  # note that we stored some=
thing
+        incb    bootdatasym(boot_mbr_signature_nr) # note that we stored s=
omething
         addw    $8, %bx                         # increment sig buffer ptr
 .Ledd_mbr_sig_next:
         incb    %dl                             # increment to next device
         jz      .Ledd_mbr_sig_done
-        cmpb    $EDD_MBR_SIG_MAX, bootsym(boot_mbr_signature_nr)
+        cmpb    $EDD_MBR_SIG_MAX, bootdatasym(boot_mbr_signature_nr)
         jb      .Ledd_mbr_sig_read
 .Ledd_mbr_sig_done:
         popw    %es
diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index e3b42e3263..07621d1a30 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -707,14 +707,30 @@ trampoline_setup:
         cmp     $sym_offs(__trampoline_rel_stop),%edi
         jb      1b
=20
-        /* Patch in the trampoline segment. */
+        mov     $sym_offs(__trampoline32_rel_start),%edi
+1:
+        mov     %fs:(%edi),%eax
+        add     %edx,%fs:(%edi,%eax)
+        add     $4,%edi
+        cmp     $sym_offs(__trampoline32_rel_stop),%edi
+        jb      1b
+
+        mov     $sym_offs(__bootsym_rel_start),%edi
+1:
+        mov     %fs:(%edi),%eax
+        add     %edx,%fs:(%edi,%eax)
+        add     $4,%edi
+        cmp     $sym_offs(__bootsym_rel_stop),%edi
+        jb      1b
+
+        /* Patch in the boot trampoline segment. */
         shr     $4,%edx
-        mov     $sym_offs(__trampoline_seg_start),%edi
+        mov     $sym_offs(__bootsym_seg_start),%edi
 1:
         mov     %fs:(%edi),%eax
         mov     %dx,%fs:(%edi,%eax)
         add     $4,%edi
-        cmp     $sym_offs(__trampoline_seg_stop),%edi
+        cmp     $sym_offs(__bootsym_seg_stop),%edi
         jb      1b
=20
         /* Do not parse command line on EFI platform here. */
diff --git a/xen/arch/x86/boot/mem.S b/xen/arch/x86/boot/mem.S
index 2d61d28835..aa39608442 100644
--- a/xen/arch/x86/boot/mem.S
+++ b/xen/arch/x86/boot/mem.S
@@ -7,7 +7,7 @@ get_memory_map:
=20
 .Lmeme820:
         xorl    %ebx, %ebx                      # continuation counter
-        movw    $bootsym(bios_e820map), %di     # point into the whitelist
+        movw    $bootdatasym(bios_e820map), %di # point into the whitelist
                                                 # so we can have the bios
                                                 # directly write into it.
=20
@@ -22,8 +22,8 @@ get_memory_map:
         cmpl    $SMAP,%eax                      # check the return is `SMA=
P'
         jne     .Lmem88
=20
-        incw    bootsym(bios_e820nr)
-        cmpw    $E820_BIOS_MAX,bootsym(bios_e820nr) # up to this many entr=
ies
+        incw    bootdatasym(bios_e820nr)
+        cmpw    $E820_BIOS_MAX,bootdatasym(bios_e820nr) # up to this many =
entries
         jae     .Lmem88
=20
         movw    %di,%ax
@@ -35,7 +35,7 @@ get_memory_map:
 .Lmem88:
         movb    $0x88, %ah
         int     $0x15
-        movw    %ax,bootsym(highmem_kb)
+        movw    %ax,bootdatasym(highmem_kb)
=20
 .Lmeme801:
         stc                                     # fix to work around buggy
@@ -58,11 +58,11 @@ get_memory_map:
         shll    $6,%edx                         # and go from 64k to 1k ch=
unks
         movzwl  %cx, %ecx
         addl    %ecx, %edx                      # add in lower memory
-        movl    %edx,bootsym(highmem_kb)        # store extended memory si=
ze
+        movl    %edx,bootdatasym(highmem_kb)    # store extended memory si=
ze
=20
 .Lint12:
         int     $0x12
-        movw    %ax,bootsym(lowmem_kb)
+        movw    %ax,bootdatasym(lowmem_kb)
=20
         ret
=20
diff --git a/xen/arch/x86/boot/trampoline.S b/xen/arch/x86/boot/trampoline.=
S
index 429a088b19..95a4bef553 100644
--- a/xen/arch/x86/boot/trampoline.S
+++ b/xen/arch/x86/boot/trampoline.S
@@ -16,21 +16,62 @@
  * not guaranteed to persist.
  */
=20
-/* NB. bootsym() is only usable in real mode, or via BOOT_PSEUDORM_DS. */
+/*
+ * There are four sets of relocations:
+ *
+ * bootsym():     Boot-time code relocated to low memory and run only once=
.
+ *                Only usable at boot, in real mode or via BOOT_PSEUDORM_D=
S.
+ * bootdatasym(): Boot-time BIOS-discovered data, relocated back up to Xen
+ *                image after discovery.
+ * trampsym():    Trampoline code relocated into low memory for AP startup
+ *                and wakeup.
+ * tramp32sym():  32-bit trampoline code which at boot can be used directl=
y
+ *                from the Xen image in memory, but which will need to be
+ *                relocated into low (well, into *mapped*) memory in order
+ *                to be used for AP startup.
+ */
 #undef bootsym
 #define bootsym(s) ((s)-trampoline_start)
=20
 #define bootsym_rel(sym, off, opnd...)     \
         bootsym(sym),##opnd;               \
 111:;                                      \
-        .pushsection .trampoline_rel, "a"; \
+        .pushsection .bootsym_rel, "a";    \
         .long 111b - (off) - .;            \
         .popsection
=20
 #define bootsym_segrel(sym, off)           \
         $0,$bootsym(sym);                  \
 111:;                                      \
-        .pushsection .trampoline_seg, "a"; \
+        .pushsection .bootsym_seg, "a";    \
+        .long 111b - (off) - .;            \
+        .popsection
+
+#define bootdatasym(s) ((s)-trampoline_start)
+#define bootdatasym_rel(sym, off, opnd...) \
+        bootdatasym(sym),##opnd;           \
+111:;                                      \
+        .pushsection .bootdatasym_rel, "a";\
+        .long 111b - (off) - .;            \
+        .popsection
+
+#undef trampsym
+#define trampsym(s) ((s)-trampoline_start)
+
+#define trampsym_rel(sym, off, opnd...)    \
+        trampsym(sym),##opnd;              \
+111:;                                      \
+        .pushsection .trampsym_rel, "a";   \
+        .long 111b - (off) - .;            \
+        .popsection
+
+#undef tramp32sym
+#define tramp32sym(s) ((s)-trampoline_start)
+
+#define tramp32sym_rel(sym, off, opnd...)  \
+        tramp32sym(sym),##opnd;            \
+111:;                                      \
+        .pushsection .tramp32sym_rel, "a"; \
         .long 111b - (off) - .;            \
         .popsection
=20
@@ -48,16 +89,19 @@
 GLOBAL(trampoline_realmode_entry)
         mov     %cs,%ax
         mov     %ax,%ds
-        movb    $0xA5,bootsym(trampoline_cpu_started)
+        movb    $0xA5,trampsym(trampoline_cpu_started)
         cld
         cli
-        lidt    bootsym(idt_48)
-        lgdt    bootsym(gdt_48)
+        lidt    trampsym(idt_48)
+        lgdt    trampsym(gdt_48)
         mov     $1,%bl                    # EBX !=3D 0 indicates we are an=
 AP
         xor     %ax, %ax
         inc     %ax
         lmsw    %ax                       # CR0.PE =3D 1 (enter protected =
mode)
-        ljmpl   $BOOT_CS32,$bootsym_rel(trampoline_protmode_entry,6)
+        ljmpl   $BOOT_CS32,$tramp32sym_rel(trampoline_protmode_entry,6)
+
+GLOBAL(trampoline_cpu_started)
+        .byte   0
=20
 trampoline_gdt:
         /* 0x0000: unused */
@@ -79,8 +123,12 @@ trampoline_gdt:
          * address is computed at runtime.
          */
         .quad   0x00c0920000000fff
-
-        .pushsection .trampoline_rel, "a"
+        /*
+         * BOOT_PSEUDORM_CS and BOOT_PSEUDORM_DS are usable only at boot t=
ime,
+         * and their base addresses must reference the low location to whi=
ch
+         * the boot-time code was loaded. Hence bootsym.
+         */
+        .pushsection .bootsym_rel, "a"
         .long   trampoline_gdt + BOOT_PSEUDORM_CS + 2 - .
         .long   trampoline_gdt + BOOT_PSEUDORM_DS + 2 - .
         .popsection
@@ -94,9 +142,6 @@ GLOBAL(cpuid_ext_features)
 GLOBAL(trampoline_xen_phys_start)
         .long   0
=20
-GLOBAL(trampoline_cpu_started)
-        .byte   0
-
         .code32
 trampoline_protmode_entry:
         /* Set up a few descriptors: on entry only CS is guaranteed good. =
*/
@@ -113,12 +158,12 @@ trampoline_protmode_entry:
=20
         /* Load pagetable base register. */
         mov     $sym_offs(idle_pg_table),%eax
-        add     bootsym_rel(trampoline_xen_phys_start,4,%eax)
+        add     tramp32sym_rel(trampoline_xen_phys_start,4,%eax)
         mov     %eax,%cr3
=20
         /* Adjust IA32_MISC_ENABLE if needed (for NX enabling below). */
-        mov     bootsym_rel(trampoline_misc_enable_off,4,%esi)
-        mov     bootsym_rel(trampoline_misc_enable_off+4,4,%edi)
+        mov     tramp32sym_rel(trampoline_misc_enable_off,4,%esi)
+        mov     tramp32sym_rel(trampoline_misc_enable_off+4,4,%edi)
         mov     %esi,%eax
         or      %edi,%eax
         jz      1f
@@ -132,7 +177,7 @@ trampoline_protmode_entry:
 1:
=20
         /* Set up EFER (Extended Feature Enable Register). */
-        mov     bootsym_rel(cpuid_ext_features,4,%edi)
+        mov     tramp32sym_rel(cpuid_ext_features,4,%edi)
         movl    $MSR_EFER,%ecx
         rdmsr
         or      $EFER_LME|EFER_SCE,%eax   /* Long Mode + SYSCALL/SYSRET */
@@ -148,7 +193,7 @@ trampoline_protmode_entry:
 1:
=20
         /* Now in compatibility mode. Long-jump into 64-bit mode. */
-        ljmp    $BOOT_CS64,$bootsym_rel(start64,6)
+        ljmp    $BOOT_CS64,$tramp32sym_rel(start64,6)
=20
         .code64
 start64:
@@ -183,7 +228,7 @@ start64:
 idt_48: .word   0, 0, 0 # base =3D limit =3D 0
         .word   0
 gdt_48: .word   6*8-1
-        .long   bootsym_rel(trampoline_gdt,4)
+        .long   tramp32sym_rel(trampoline_gdt,4)
=20
 /* The first page of trampoline is permanent, the rest boot-time only. */
 /* Reuse the boot trampoline on the 1st trampoline page as stack for wakeu=
p. */
@@ -249,7 +294,7 @@ trampoline_boot_cpu_entry:
=20
         mov     $0x0200,%ax
         int     $0x16
-        mov     %al,bootsym(kbd_shift_flags)
+        mov     %al,bootdatasym(kbd_shift_flags)
=20
         /* Disable irqs before returning to protected mode. */
         cli
@@ -294,7 +339,7 @@ opt_edid:
         .byte   0
=20
 #ifdef CONFIG_VIDEO
-GLOBAL(boot_vid_mode)
+boot_vid_mode:
         .word   VIDEO_80x25                     /* If we don't run at all,=
 assume basic video mode 3 at 80x25. */
 vesa_size:
         .word   0,0,0                           /* width x depth x height =
*/
diff --git a/xen/arch/x86/boot/video.S b/xen/arch/x86/boot/video.S
index 335a51c9b5..03907e9e9a 100644
--- a/xen/arch/x86/boot/video.S
+++ b/xen/arch/x86/boot/video.S
@@ -45,7 +45,7 @@
 #define PARAM_VESAPM_SEG        0x24
 #define PARAM_VESAPM_OFF        0x26
 #define PARAM_VESA_ATTRIB       0x28
-#define _param(param) bootsym(boot_vid_info)+(param)
+#define _param(param) bootdatasym(boot_vid_info)+(param)
=20
 video:  xorw    %ax, %ax
         movw    %ax, %gs        # GS is zero
@@ -917,7 +917,7 @@ store_edid:
         cmpw    $0x004f, %ax            # Call failed?
         jne     .Lno_edid
=20
-        movw    %bx, bootsym(boot_edid_caps)
+        movw    %bx, bootdatasym(boot_edid_caps)
=20
         cmpb    $2, bootsym(opt_edid)   # EDID forced on cmdline (edid=3Df=
orce)?
         je      .Lforce_edid
@@ -933,7 +933,7 @@ store_edid:
         movw    $0x01, %bx
         movw    $0x00, %cx
         movw    $0x00, %dx
-        movw    $bootsym(boot_edid_info), %di
+        movw    $bootdatasym(boot_edid_info), %di
         int     $0x10
=20
 .Lno_edid:
diff --git a/xen/arch/x86/boot/wakeup.S b/xen/arch/x86/boot/wakeup.S
index e3cb9e033a..95bedddd0f 100644
--- a/xen/arch/x86/boot/wakeup.S
+++ b/xen/arch/x86/boot/wakeup.S
@@ -53,7 +53,7 @@ ENTRY(wakeup_start)
=20
         movw    $1, %ax
         lmsw    %ax             # Turn on CR0.PE=20
-        ljmpl   $BOOT_CS32, $bootsym_rel(wakeup_32, 6)
+        ljmpl   $BOOT_CS32, $trampsym_rel(wakeup_32, 6)
=20
 /* This code uses an extended set of video mode numbers. These include:
  * Aliases for standard modes
@@ -118,11 +118,11 @@ wakeup_32:
         mov     $BOOT_DS, %eax
         mov     %eax, %ds
         mov     %eax, %ss
-        mov     $bootsym_rel(wakeup_stack, 4, %esp)
+        mov     $trampsym_rel(wakeup_stack, 4, %esp)
=20
         # check saved magic again
         mov     $sym_offs(saved_magic),%eax
-        add     bootsym_rel(trampoline_xen_phys_start, 4, %eax)
+        add     trampsym_rel(trampoline_xen_phys_start, 4, %eax)
         mov     (%eax), %eax
         cmp     $0x9abcdef0, %eax
         jne     bogus_saved_magic
@@ -135,12 +135,12 @@ wakeup_32:
=20
         /* Load pagetable base register */
         mov     $sym_offs(idle_pg_table),%eax
-        add     bootsym_rel(trampoline_xen_phys_start,4,%eax)
+        add     trampsym_rel(trampoline_xen_phys_start,4,%eax)
         mov     %eax,%cr3
=20
         /* Will cpuid feature change after resume? */
         /* Set up EFER (Extended Feature Enable Register). */
-        mov     bootsym_rel(cpuid_ext_features,4,%edi)
+        mov     trampsym_rel(cpuid_ext_features,4,%edi)
         test    $0x20100800,%edi /* SYSCALL/SYSRET, No Execute, Long Mode?=
 */
         jz      .Lskip_eferw
         movl    $MSR_EFER,%ecx
@@ -162,7 +162,7 @@ wakeup_32:
 1:
=20
         /* Now in compatibility mode. Long-jump to 64-bit mode */
-        ljmp    $BOOT_CS64, $bootsym_rel(wakeup_64,6)
+        ljmp    $BOOT_CS64, $trampsym_rel(wakeup_64,6)
=20
         .code64
 wakeup_64:
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 7a13a30bc0..556942482e 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -99,7 +99,7 @@ static void __init efi_arch_relocate_image(unsigned long =
delta)
 }
=20
 extern const s32 __trampoline_rel_start[], __trampoline_rel_stop[];
-extern const s32 __trampoline_seg_start[], __trampoline_seg_stop[];
+extern const s32 __trampoline32_rel_start[], __trampoline32_rel_stop[];
=20
 static void __init relocate_trampoline(unsigned long phys)
 {
@@ -115,10 +115,10 @@ static void __init relocate_trampoline(unsigned long =
phys)
           trampoline_ptr < __trampoline_rel_stop;
           ++trampoline_ptr )
         *(u32 *)(*trampoline_ptr + (long)trampoline_ptr) +=3D phys;
-    for ( trampoline_ptr =3D __trampoline_seg_start;
-          trampoline_ptr < __trampoline_seg_stop;
+    for ( trampoline_ptr =3D __trampoline32_rel_start;
+          trampoline_ptr < __trampoline32_rel_stop;
           ++trampoline_ptr )
-        *(u16 *)(*trampoline_ptr + (long)trampoline_ptr) =3D phys >> 4;
+        *(u32 *)(*trampoline_ptr + (long)trampoline_ptr) +=3D phys;
 }
=20
 static void __init place_string(u32 *addr, const char *s)
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index a73139cd29..400dffaf23 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -237,11 +237,18 @@ SECTIONS
        *(.init.data.rel.*)
        . =3D ALIGN(4);
        __trampoline_rel_start =3D .;
-       *(.trampoline_rel)
+       *(.trampsym_rel)
        __trampoline_rel_stop =3D .;
-       __trampoline_seg_start =3D .;
-       *(.trampoline_seg)
-       __trampoline_seg_stop =3D .;
+       __trampoline32_rel_start =3D .;
+       *(.tramp32sym_rel)
+       __trampoline32_rel_stop =3D .;
+       __bootsym_rel_start =3D .;
+       *(.bootsym_rel)
+       *(.bootdatasym_rel)
+       __bootsym_rel_stop =3D .;
+       __bootsym_seg_start =3D .;
+       *(.bootsym_seg)
+       __bootsym_seg_stop =3D .;
        /*
         * struct alt_inst entries. From the header (alternative.h):
         * "Alternative instructions for different CPU types or capabilitie=
s"


--=-C6+PB5zGR7Jw03cwfpxg
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
ODA5MTUwMTU1WjAvBgkqhkiG9w0BCQQxIgQgsrqUvGwXJnchC1P/ZjwjkY8fJA6a82fO97lUkEjw
f5Mwgb4GCSsGAQQBgjcQBDGBsDCBrTCBlzELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIg
TWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQx
PTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1h
aWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMIHABgsqhkiG9w0BCRACCzGBsKCBrTCBlzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMA0GCSqGSIb3
DQEBAQUABIIBAG8z6GVzn0N/e4oTdKWHQLthO8E4DV7q6W/rIquCExCs0DgyPfmhFZgTVMLeX4GJ
yiCCsC7GPp/TcosKsU29d9Vp9wTxYkn4jWbrI16Wu/9Yjpamq1v5rRdCgtVbt6L8dA0nrAsRBtsl
0toezhmrlsp4rGZqWNhECR+i3Bp06I3T9bYGixiHTlcoCkrkpZbgxe5+d6mezPm8GGwtZykdV1N3
sYeykPltZrpd6Z4yO6G0ii99P94c4mJKpnZw3IrrvgjLaGALVGYMhT6eda3fcE2dJttEIpuYaIep
Z2nHyf2DEhDiv1ylc6ZON8qPwyPhuPkd+T0WgeJq7my8sCaEJ4oAAAAAAAA=


--=-C6+PB5zGR7Jw03cwfpxg--



--===============6799826414783278095==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6799826414783278095==--


