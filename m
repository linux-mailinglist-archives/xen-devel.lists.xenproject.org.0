Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 746AE87DB2
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 17:05:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw6PJ-0003FM-KO; Fri, 09 Aug 2019 15:02:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dfSS=WF=merlin.srs.infradead.org=batv+726623fc28cc57e4ef8a+5829+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1hw6PH-0003Db-I2
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 15:02:15 +0000
X-Inumbo-ID: ab00be6a-bab6-11e9-8980-bc764e045a96
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ab00be6a-bab6-11e9-8980-bc764e045a96;
 Fri, 09 Aug 2019 15:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Mime-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/3lPYlcLUf/V0qA5H2/OrTrVojwWJtbof6sJkKNwcPI=; b=pGcpmGdL9KGSKgATZViy+RP42
 cscIp363eltlGioK4h3DgzcbnLWvn30bPf1adWUFIvEq/mlXhQ54jzpRSAYpNqwWjAnWVjGE7Mh5j
 hN5Yz30Qms0eexevyCy/hF3y9BPl/Wk3HSPcM3AUxYFYd9XW5nURTUgrjk6WV983WeCeqGnMMJz5+
 ffbUf8yeu8y5Zbx7Z4S9RcUu5i97rJaUaj50fYktiLazTgQtuyU8WR1i0R/pGKlO8Yn5uvPa8RLYc
 E9mEQgYjoz0buRmB6xFrIXUbCvo0S7dKOS48dktdMwYMLe9S5raJiaKlI2/VuMZ+i2Vt0Y2xUfAsV
 3EyzHnBlw==;
Received: from [2001:8b0:10b:1:4a2a:e3ff:fe14:8625]
 (helo=u3832b3a9db3152.ant.amazon.com)
 by merlin.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hw6PE-0007jF-4G; Fri, 09 Aug 2019 15:02:12 +0000
Message-ID: <14720122f97667082d27153edd0e50aa6bc29e96.camel@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 09 Aug 2019 16:02:10 +0100
In-Reply-To: <cover.1565362089.git.dwmw@amazon.co.uk>
References: <cover.1565362089.git.dwmw@amazon.co.uk>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 merlin.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [PATCH v2 5/6] x86/boot: Copy 16-bit boot variables
 back up to Xen image
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
Content-Type: multipart/mixed; boundary="===============0768320559374042655=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============0768320559374042655==
Content-Type: multipart/signed; micalg="sha-256";
	protocol="application/x-pkcs7-signature";
	boundary="=-/4iX4RXiPnGb6l1zA4nC"


--=-/4iX4RXiPnGb6l1zA4nC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: David Woodhouse <dwmw@amazon.co.uk>

Ditch the bootsym() access from C code for the variables populated by
16-bit boot code. As well as being cleaner this also paves the way for
not having the 16-bit boot code in low memory for no-real-mode or EFI
loader boots at all.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 xen/arch/x86/boot/edd.S           |  2 ++
 xen/arch/x86/boot/head.S          | 16 +++++++++++++++
 xen/arch/x86/boot/mem.S           |  2 ++
 xen/arch/x86/boot/trampoline.S    | 33 ++++++++++++++++++++++++++++---
 xen/arch/x86/boot/video.S         | 30 +++++++++++++++-------------
 xen/arch/x86/platform_hypercall.c | 18 ++++++++---------
 xen/arch/x86/setup.c              | 22 ++++++++++-----------
 xen/arch/x86/xen.lds.S            |  8 +++++++-
 xen/include/asm-x86/edd.h         |  1 -
 9 files changed, 93 insertions(+), 39 deletions(-)

diff --git a/xen/arch/x86/boot/edd.S b/xen/arch/x86/boot/edd.S
index 434bbbd960..138d04c964 100644
--- a/xen/arch/x86/boot/edd.S
+++ b/xen/arch/x86/boot/edd.S
@@ -163,6 +163,7 @@ edd_done:
 .Ledd_mbr_sig_skip:
         ret
=20
+        .pushsection .data.boot16, "aw", @progbits
 GLOBAL(boot_edd_info_nr)
         .byte   0
 GLOBAL(boot_mbr_signature_nr)
@@ -171,3 +172,4 @@ GLOBAL(boot_mbr_signature)
         .fill   EDD_MBR_SIG_MAX*8,1,0
 GLOBAL(boot_edd_info)
         .fill   EDD_INFO_MAX * (EDDEXTSIZE + EDDPARMSIZE), 1, 0
+        .popsection
diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 556dab127f..104eb0eb3c 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -733,6 +733,17 @@ trampoline_setup:
         cmp     $sym_offs(__bootsym_seg_stop),%edi
         jb      1b
=20
+        /* Relocations for the boot data section. */
+        mov     sym_fs(trampoline_phys),%edx
+        add     $(boot_trampoline_end - boot_trampoline_start),%edx
+        mov     $sym_offs(__bootdatasym_rel_start),%edi
+1:
+        mov     %fs:(%edi),%eax
+        add     %edx,%fs:(%edi,%eax)
+        add     $4,%edi
+        cmp     $sym_offs(__bootdatasym_rel_stop),%edi
+        jb      1b
+
         /* Do not parse command line on EFI platform here. */
         cmpb    $0,sym_fs(efi_platform)
         jnz     1f
@@ -770,6 +781,11 @@ trampoline_setup:
         mov     $((boot_trampoline_end - boot_trampoline_start) / 4),%ecx
         rep movsl %fs:(%esi),%es:(%edi)
=20
+        /* Copy boot data template to low memory. */
+        mov     $sym_offs(bootdata_start),%esi
+        mov     $((bootdata_end - bootdata_start + 3) / 4),%ecx
+        rep movsl %fs:(%esi),%es:(%edi)
+
         /* Jump into the relocated trampoline. */
         lret
=20
diff --git a/xen/arch/x86/boot/mem.S b/xen/arch/x86/boot/mem.S
index aa39608442..86f0fa9af7 100644
--- a/xen/arch/x86/boot/mem.S
+++ b/xen/arch/x86/boot/mem.S
@@ -67,6 +67,7 @@ get_memory_map:
         ret
=20
         .align  4
+        .pushsection .data.boot16, "aw", @progbits
 GLOBAL(bios_e820map)
         .fill   E820_BIOS_MAX*20,1,0
 GLOBAL(bios_e820nr)
@@ -75,3 +76,4 @@ GLOBAL(lowmem_kb)
         .long   0
 GLOBAL(highmem_kb)
         .long   0
+	.popsection
diff --git a/xen/arch/x86/boot/trampoline.S b/xen/arch/x86/boot/trampoline.=
S
index 26af9c6beb..b5517a44bb 100644
--- a/xen/arch/x86/boot/trampoline.S
+++ b/xen/arch/x86/boot/trampoline.S
@@ -47,11 +47,15 @@
         .long 111b - (off) - .;            \
         .popsection
=20
-#define bootdatasym(s) ((s)-boot_trampoline_start)
+        .pushsection .data.boot16, "aw", @progbits
+GLOBAL(bootdata_start)
+        .popsection
+
+#define bootdatasym(s) ((s)-bootdata_start+(boot_trampoline_end-boot_tramp=
oline_start))
 #define bootdatasym_rel(sym, off, opnd...) \
         bootdatasym(sym),##opnd;           \
 111:;                                      \
-        .pushsection .bootdatasym_rel, "a";\
+        .pushsection .bootsym_rel, "a";\
         .long 111b - (off) - .;            \
         .popsection
=20
@@ -227,7 +231,7 @@ start64:
         .word   0
 idt_48: .word   0, 0, 0 # base =3D limit =3D 0
         .word   0
-gdt_48: .word   6*8-1
+gdt_48: .word   7*8-1
         .long   tramp32sym_rel(trampoline_gdt,4)
=20
 /* The first page of trampoline is permanent, the rest boot-time only. */
@@ -318,6 +322,23 @@ trampoline_boot_cpu_entry:
         mov     %eax,%gs
         mov     %eax,%ss
=20
+        /*
+         * Copy locally-gathered data back up into the Xen physical image
+         */
+        mov     $BOOT_FS,%eax
+        mov     %eax,%es
+
+        mov     $sym_offs(bootdata_end),%ecx
+        mov     $sym_offs(bootdata_start),%edi
+        sub     %edi,%ecx
+        mov     $bootdatasym_rel(bootdata_start,4,%esi)
+        rep movsb %ds:(%esi),%es:(%edi)
+
+        /*
+         * %es still points to BOOT_FS but trampoline_protmode_entry
+         * reloads it anyway.
+         */
+
         /* EBX =3D=3D 0 indicates we are the BP (Boot Processor). */
         xor     %ebx,%ebx
=20
@@ -345,8 +366,10 @@ vesa_size:
         .word   0,0,0                           /* width x depth x height =
*/
 #endif
=20
+        .pushsection .data.boot16, "aw", @progbits
 GLOBAL(kbd_shift_flags)
         .byte   0
+        .popsection
=20
 rm_idt: .word   256*4-1, 0, 0
=20
@@ -355,3 +378,7 @@ rm_idt: .word   256*4-1, 0, 0
 #ifdef CONFIG_VIDEO
 #include "video.S"
 #endif
+
+        .pushsection .data.boot16, "aw", @progbits
+GLOBAL(bootdata_end)
+        .popsection
diff --git a/xen/arch/x86/boot/video.S b/xen/arch/x86/boot/video.S
index 5087c6a4d5..4608464b77 100644
--- a/xen/arch/x86/boot/video.S
+++ b/xen/arch/x86/boot/video.S
@@ -15,10 +15,10 @@
=20
 #include "video.h"
=20
-/* Scratch space layout: boot_trampoline_end to boot_trampoline_end+0x1000=
. */
-#define modelist       bootsym(boot_trampoline_end)   /* 2kB (256 entries)=
 */
-#define vesa_glob_info (modelist + 0x800)        /* 1kB */
-#define vesa_mode_info (vesa_glob_info + 0x400)  /* 1kB */
+/* Scratch space layout: bootdata_end to bootdata_end+0x1000. */
+#define modelist(t)       bootdatasym_rel(bootdata_end,2,t)         /* 2Ki=
B (256 entries) */
+#define vesa_glob_info(t) bootdatasym_rel((bootdata_end+0x800),2,t) /* 1Ki=
B */
+#define vesa_mode_info(t) bootdatasym_rel((bootdata_end+0xc00),2,t) /* 1Ki=
B */
=20
 /* Retrieve Extended Display Identification Data. */
 #define CONFIG_FIRMWARE_EDID
@@ -113,7 +113,7 @@ mopar2: movb    %al, _param(PARAM_VIDEO_LINES)
=20
 # Fetching of VESA frame buffer parameters
 mopar_gr:
-        leaw    vesa_mode_info, %di
+        leaw    vesa_mode_info(%di)
         movb    $0x23, _param(PARAM_HAVE_VGA)
         movw    16(%di), %ax
         movw    %ax, _param(PARAM_LFB_LINELENGTH)
@@ -134,7 +134,7 @@ mopar_gr:
         movw    %ax, _param(PARAM_VESA_ATTRIB)
=20
 # get video mem size
-        leaw    vesa_glob_info, %di
+        leaw    vesa_glob_info(%di)
         xorl    %eax, %eax
         movw    18(%di), %ax
         movl    %eax, _param(PARAM_LFB_SIZE)
@@ -226,7 +226,7 @@ an1:    call    prtstr
         leaw    bootsym(listhdr), %si   # Table header
         call    prtstr
         movb    $0x30, %dl              # DL holds mode number
-        leaw    modelist, %si
+        leaw    modelist(%si)
 lm1:    cmpw    $ASK_VGA, (%si)         # End?
         jz      lm2
=20
@@ -435,13 +435,13 @@ setmenu:
         jmp     mode_set
=20
 check_vesa:
-        leaw    vesa_glob_info, %di
+        leaw    vesa_glob_info(%di)
         movw    $0x4f00, %ax
         int     $0x10
         cmpw    $0x004f, %ax
         jnz     setbad
=20
-        leaw    vesa_mode_info, %di
+        leaw    vesa_mode_info(%di)
         subb    $VIDEO_FIRST_VESA>>8, %bh
         movw    %bx, %cx                # Get mode information structure
         movw    $0x4f01, %ax
@@ -509,7 +509,7 @@ inidx:  outb    %al, %dx                # Read from ind=
exed VGA register
=20
 setvesabysize:
         call    mode_table
-        leaw    modelist,%si
+        leaw    modelist(%si)
 1:      add     $8,%si
         cmpw    $ASK_VGA,-8(%si)        # End?
         je      _setbad
@@ -669,7 +669,7 @@ mode_table:
         orw     %di, %di
         jnz     mtab1
=20
-        leaw    modelist, %di           # Store standard modes:
+        leaw    modelist(%di)           # Store standard modes:
         movw    $VIDEO_80x25,(%di)      # The 80x25 mode (ALL)
         movw    $0x50,2(%di)
         movw    $0x19,4(%di)
@@ -684,7 +684,7 @@ mode_table:
=20
         movw    $ASK_VGA, (%di)         # End marker
         movw    %di, bootsym(mt_end)
-mtab1:  leaw    modelist, %si           # SI=3Dmode list, DI=3Dlist end
+mtab1:  leaw    modelist(%si)           # SI=3Dmode list, DI=3Dlist end
 ret0:   ret
=20
 # Modes usable on all standard VGAs
@@ -700,7 +700,7 @@ vga_modes_end:
 # Detect VESA modes.
 vesa_modes:
         movw    %di, %bp                # BP=3Doriginal mode table end
-        leaw    vesa_glob_info, %di
+        leaw    vesa_glob_info(%di)
         movw    $0x4f00, %ax            # VESA Get card info call
         int     $0x10
         movw    %di, %si
@@ -897,7 +897,7 @@ store_edid:
         cmpb    $1, bootsym(opt_edid)   # EDID disabled on cmdline (edid=
=3Dno)?
         je      .Lno_edid
=20
-        leaw    vesa_glob_info, %di
+        leaw    vesa_glob_info(%di)
         movw    $0x4f00, %ax
         int     $0x10
         cmpw    $0x004f, %ax
@@ -990,6 +990,7 @@ name_bann:      .asciz  "Video adapter: "
=20
 force_size:     .word   0       # Use this size instead of the one in BIOS=
 vars
=20
+        .pushsection .data.boot16, "aw", @progbits
 GLOBAL(boot_vid_info)
         .byte   0, 0    /* orig_x, orig_y */
         .byte   3       /* text mode 3    */
@@ -1001,3 +1002,4 @@ GLOBAL(boot_edid_info)
         .fill   128,1,0x13
 GLOBAL(boot_edid_caps)
         .word   0x1313
+        .popsection
diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hype=
rcall.c
index b19f6ec4ed..9a56bd8f84 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -318,10 +318,10 @@ ret_t do_platform_op(XEN_GUEST_HANDLE_PARAM(xen_platf=
orm_op_t) u_xenpf_op)
             u16 length;
=20
             ret =3D -ESRCH;
-            if ( op->u.firmware_info.index >=3D bootsym(boot_edd_info_nr) =
)
+            if ( op->u.firmware_info.index >=3D boot_edd_info_nr )
                 break;
=20
-            info =3D bootsym(boot_edd_info) + op->u.firmware_info.index;
+            info =3D boot_edd_info + op->u.firmware_info.index;
=20
             /* Transfer the EDD info block. */
             ret =3D -EFAULT;
@@ -357,10 +357,10 @@ ret_t do_platform_op(XEN_GUEST_HANDLE_PARAM(xen_platf=
orm_op_t) u_xenpf_op)
             const struct mbr_signature *sig;
=20
             ret =3D -ESRCH;
-            if ( op->u.firmware_info.index >=3D bootsym(boot_mbr_signature=
_nr) )
+            if ( op->u.firmware_info.index >=3D boot_mbr_signature_nr )
                 break;
=20
-            sig =3D bootsym(boot_mbr_signature) + op->u.firmware_info.inde=
x;
+            sig =3D boot_mbr_signature + op->u.firmware_info.index;
=20
             op->u.firmware_info.u.disk_mbr_signature.device =3D sig->devic=
e;
             op->u.firmware_info.u.disk_mbr_signature.mbr_signature =3D
@@ -376,13 +376,13 @@ ret_t do_platform_op(XEN_GUEST_HANDLE_PARAM(xen_platf=
orm_op_t) u_xenpf_op)
 #ifdef CONFIG_VIDEO
             if ( op->u.firmware_info.index !=3D 0 )
                 break;
-            if ( *(u32 *)bootsym(boot_edid_info) =3D=3D 0x13131313 )
+            if ( *(u32 *)boot_edid_info =3D=3D 0x13131313 )
                 break;
=20
             op->u.firmware_info.u.vbeddc_info.capabilities =3D
-                bootsym(boot_edid_caps);
+                boot_edid_caps;
             op->u.firmware_info.u.vbeddc_info.edid_transfer_time =3D
-                bootsym(boot_edid_caps) >> 8;
+                boot_edid_caps >> 8;
=20
             ret =3D 0;
             if ( __copy_field_to_guest(u_xenpf_op, op, u.firmware_info.
@@ -390,7 +390,7 @@ ret_t do_platform_op(XEN_GUEST_HANDLE_PARAM(xen_platfor=
m_op_t) u_xenpf_op)
                  __copy_field_to_guest(u_xenpf_op, op, u.firmware_info.
                                        u.vbeddc_info.edid_transfer_time) |=
|
                  copy_to_compat(op->u.firmware_info.u.vbeddc_info.edid,
-                                bootsym(boot_edid_info), 128) )
+                                boot_edid_info, 128) )
                 ret =3D -EFAULT;
 #endif
             break;
@@ -407,7 +407,7 @@ ret_t do_platform_op(XEN_GUEST_HANDLE_PARAM(xen_platfor=
m_op_t) u_xenpf_op)
             if ( op->u.firmware_info.index !=3D 0 )
                 break;
=20
-            op->u.firmware_info.u.kbd_shift_flags =3D bootsym(kbd_shift_fl=
ags);
+            op->u.firmware_info.u.kbd_shift_flags =3D kbd_shift_flags;
=20
             ret =3D 0;
             if ( __copy_field_to_guest(u_xenpf_op, op,
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 06e779368c..101c9dd272 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -509,7 +509,7 @@ extern struct boot_video_info boot_vid_info;
 static void __init parse_video_info(void)
 {
 #ifdef CONFIG_VIDEO
-    struct boot_video_info *bvi =3D &bootsym(boot_vid_info);
+    struct boot_video_info *bvi =3D &boot_vid_info;
=20
     /* vga_console_info is filled directly on EFI platform. */
     if ( efi_enabled(EFI_BOOT) )
@@ -674,10 +674,10 @@ static char * __init cmdline_cook(char *p, const char=
 *loader_name)
=20
 static unsigned int __init copy_bios_e820(struct e820entry *map, unsigned =
int limit)
 {
-    unsigned int n =3D min(bootsym(bios_e820nr), limit);
+    unsigned int n =3D min(bios_e820nr, limit);
=20
     if ( n )
-        memcpy(map, bootsym(bios_e820map), sizeof(*map) * n);
+        memcpy(map, bios_e820map, sizeof(*map) * n);
=20
     return n;
 }
@@ -818,15 +818,15 @@ void __init noreturn __start_xen(unsigned long mbi_p)
     }
=20
     /* Print VBE/DDC EDID information. */
-    if ( bootsym(boot_edid_caps) !=3D 0x1313 )
+    if ( boot_edid_caps !=3D 0x1313 )
     {
-        u16 caps =3D bootsym(boot_edid_caps);
+        u16 caps =3D boot_edid_caps;
         printk(" VBE/DDC methods:%s%s%s; ",
                (caps & 1) ? " V1" : "",
                (caps & 2) ? " V2" : "",
                !(caps & 3) ? " none" : "");
         printk("EDID transfer time: %d seconds\n", caps >> 8);
-        if ( *(u32 *)bootsym(boot_edid_info) =3D=3D 0x13131313 )
+        if ( *(u32 *)boot_edid_info =3D=3D 0x13131313 )
         {
             printk(" EDID info not retrieved because ");
             if ( !(caps & 3) )
@@ -841,9 +841,9 @@ void __init noreturn __start_xen(unsigned long mbi_p)
=20
     printk("Disc information:\n");
     printk(" Found %d MBR signatures\n",
-           bootsym(boot_mbr_signature_nr));
+           boot_mbr_signature_nr);
     printk(" Found %d EDD information structures\n",
-           bootsym(boot_edd_info_nr));
+           boot_edd_info_nr);
=20
     /* Check that we have at least one Multiboot module. */
     if ( !(mbi->flags & MBI_MODULES) || (mbi->mods_count =3D=3D 0) )
@@ -926,14 +926,14 @@ void __init noreturn __start_xen(unsigned long mbi_p)
             bytes +=3D map->size + 4;
         }
     }
-    else if ( bootsym(lowmem_kb) )
+    else if ( lowmem_kb )
     {
         memmap_type =3D "Xen-e801";
         e820_raw.map[0].addr =3D 0;
-        e820_raw.map[0].size =3D bootsym(lowmem_kb) << 10;
+        e820_raw.map[0].size =3D lowmem_kb << 10;
         e820_raw.map[0].type =3D E820_RAM;
         e820_raw.map[1].addr =3D 0x100000;
-        e820_raw.map[1].size =3D bootsym(highmem_kb) << 10;
+        e820_raw.map[1].size =3D highmem_kb << 10;
         e820_raw.map[1].type =3D E820_RAM;
         e820_raw.nr_map =3D 2;
     }
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 6968262a60..acc1e2d593 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -244,11 +244,13 @@ SECTIONS
        __trampoline32_rel_stop =3D .;
        __bootsym_rel_start =3D .;
        *(.bootsym_rel)
-       *(.bootdatasym_rel)
        __bootsym_rel_stop =3D .;
        __bootsym_seg_start =3D .;
        *(.bootsym_seg)
        __bootsym_seg_stop =3D .;
+       __bootdatasym_rel_start =3D .;
+       *(.bootdatasym_rel)
+       __bootdatasym_rel_stop =3D .;
        /*
         * struct alt_inst entries. From the header (alternative.h):
         * "Alternative instructions for different CPU types or capabilitie=
s"
@@ -291,6 +293,10 @@ SECTIONS
   DECL_SECTION(.data) {
        *(.data.page_aligned)
        *(.data)
+       . =3D ALIGN(16);
+       __bootdata_start =3D .;
+       *(.data.boot16)
+       __bootdata_end =3D .;
        *(.data.rel)
        *(.data.rel.*)
        CONSTRUCTORS
diff --git a/xen/include/asm-x86/edd.h b/xen/include/asm-x86/edd.h
index afaa23732a..a4d6b4d90e 100644
--- a/xen/include/asm-x86/edd.h
+++ b/xen/include/asm-x86/edd.h
@@ -143,7 +143,6 @@ struct __packed mbr_signature {
     u32 signature;
 };
=20
-/* These all reside in the boot trampoline. Access via bootsym(). */
 extern struct mbr_signature boot_mbr_signature[];
 extern u8 boot_mbr_signature_nr;
 extern struct edd_info boot_edd_info[];


--=-/4iX4RXiPnGb6l1zA4nC
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
ODA5MTUwMjEwWjAvBgkqhkiG9w0BCQQxIgQgJvUSAB3+lyfM0dObWkPUrY+4s08krKl0aRi0Gbgd
/0kwgb4GCSsGAQQBgjcQBDGBsDCBrTCBlzELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIg
TWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQx
PTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1h
aWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMIHABgsqhkiG9w0BCRACCzGBsKCBrTCBlzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMA0GCSqGSIb3
DQEBAQUABIIBABCnS09zYrNw6kwD/n32JUC/BI31ETYUXusGOWwdSAYO1PEO74PI1Hsu9fZgmcBd
5qnelXDyCootWWKJvoeonzrvYzL3UmPYREd6f9Y0xVU4hT3XWK028RDU4HS0O3M78pEReLH5UNmo
aT8IAGXMJID8CZJ3SRLqaiZeJquiSCC4cFlPgzcfkc//P9uAewTp0ClxiiLeTNhFJJsLPpIrZEDh
x7CseNTLOYQgxTxP1xtspmq+zG6+FovRz8QKdFu+HmD/B36AgAeajAZVKKE2QI7mRvLISRjCgU9V
YOV0yMBRzX3PPi2+fVLScUgYIChxgJsqyRCAmAz8CJFDRtqWQ2UAAAAAAAA=


--=-/4iX4RXiPnGb6l1zA4nC--



--===============0768320559374042655==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0768320559374042655==--


