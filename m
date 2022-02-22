Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BED4BFC85
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 16:27:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276859.473229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMX4Y-0007Ut-TP; Tue, 22 Feb 2022 15:27:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276859.473229; Tue, 22 Feb 2022 15:27:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMX4Y-0007En-BS; Tue, 22 Feb 2022 15:27:26 +0000
Received: by outflank-mailman (input) for mailman id 276859;
 Tue, 22 Feb 2022 15:27:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Woib=TF=citrix.com=prvs=045a4fa17=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nMX4V-0006Cs-L5
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 15:27:23 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ecbaec81-93f3-11ec-8539-5f4723681683;
 Tue, 22 Feb 2022 16:27:21 +0100 (CET)
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
X-Inumbo-ID: ecbaec81-93f3-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645543642;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=L045W9NEOuIRKd1S32sU0jL0uHWIuPgrAYtbmC4gyoY=;
  b=Et0i6TBuATWyVR2jJ4Z882ybRFKz7q6LVlibL2zAc5hZP+omQ7TLryaH
   pvvtmenUEmO6NAhi8eoquW3qOrqwutmDbjxED5aoOtbxKl9wfgkghVh8F
   ODwDAQO9IaoAd1Lzybvhv+nxnLj4b6XP+9C641icmzM5vHttq+nTh6Hrv
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 64732553
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:EYviNKxYfnJII9KT8Kt6t+cyxirEfRIJ4+MujC+fZmUNrF6WrkVWz
 2odUWvQOvffNmSkfdwnOo+39hwCuJfVyYdmTlE/ryAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYy24LhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl9pyQEVx3Gbf2n8cjUhkFIR1DGIlf9+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6AO
 5VCM2cyN3wsZTVCPnIpGs5lkduYrSKua2xFq1mvipU4tj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKjMwOcGbyDGF2mmxneKJliT+MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO646yFnWlI3O2QG6OGkEEwx9VfkCrcBjEFTGy
 WS1t9/uADVutpicRnSc6qqYoFuOBMQFEYMRTXRaFFVYurEPtKl210uSFYg7TMZZm/WoQWmY/
 tyckMQpa1z/Z+Yv3r7zw13IiinESnPhHl9svVW/so5IA2pEiG+Zi26AtACzARVodt/xory9U
 J4swZP2AAcmV8zlqcB1aL9RdIxFHt7cWNEmvXZhHoM66xOm8GO5cIZb7VlWfRk1b5paKGK0O
 hOK4Wu9AaO/2lPwNsebhKrrVqwXIVXIT4y5Bpg4kPIUCnSOSON31H43PhPBt4wcuEMtjbs+K
 f+mnTWEVh4n5VBc5GPuHY81iOZzrghnnD+7bc2rnnyPjOvFDFbIGOhtDbd7Rr1ghE9yiF6Oq
 Ig32grj40g3bdASlQGNr9ZIdAhSdSJT6FKfg5U/S9Nv6zFOQAkJY8I9C5t7E2C5t8y5Ttv1w
 0w=
IronPort-HdrOrdr: A9a23:wvbKHa5FasUdd7DxaAPXwPDXdLJyesId70hD6qhwISY6TiX+rb
 HWoB17726TtN9/YhEdcLy7VJVoBEmskKKdgrNhWotKPjOW21dARbsKheCJrgEIWReOktK1vZ
 0QC5SWY+eQMbEVt6nHCXGDYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.88,387,1635220800"; 
   d="scan'208";a="64732553"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v3 05/70] x86/kexec: Annotate embedded data with ELF metadata
Date: Tue, 22 Feb 2022 15:26:33 +0000
Message-ID: <20220222152645.8844-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220222152645.8844-1-andrew.cooper3@citrix.com>
References: <20220222152645.8844-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Scanning for embedded endbranch instructions involves parsing the .text
disassembly.  Data in the kexec trampoline has no ELF metadata, so objdump
treats it as instructions and tries to disassemble.  Convert:

  ffff82d040396108 <compatibility_mode_far>:
  ffff82d040396108:       00 00                   add    %al,(%rax)
  ffff82d04039610a:       00 00                   add    %al,(%rax)
  ffff82d04039610c:       10 00                   adc    %al,(%rax)

  ffff82d04039610e <compat_mode_gdt_desc>:
  ffff82d04039610e:       17                      (bad)
          ...

  ffff82d040396118 <compat_mode_gdt>:
          ...
  ffff82d040396120:       ff                      (bad)
  ffff82d040396121:       ff 00                   incl   (%rax)
  ffff82d040396123:       00 00                   add    %al,(%rax)
  ffff82d040396125:       93                      xchg   %eax,%ebx
  ffff82d040396126:       cf                      iret
  ffff82d040396127:       00 ff                   add    %bh,%bh
  ffff82d040396129:       ff 00                   incl   (%rax)
  ffff82d04039612b:       00 00                   add    %al,(%rax)
  ffff82d04039612d:       9b                      fwait
  ffff82d04039612e:       cf                      iret
          ...

  ffff82d040396130 <compat_mode_idt>:
          ...

  ffff82d0403961b6 <kexec_reloc_size>:
  ffff82d0403961b6:       b6 01                   mov    $0x1,%dh
          ...

to:

  ffff82d040396108 <compatibility_mode_far>:
  ffff82d040396108:       00 00 00 00 10 00                               ......

  ffff82d04039610e <compat_mode_gdt_desc>:
  ffff82d04039610e:       17 00 00 00 00 00 00 00 00 00                   ..........

  ffff82d040396118 <compat_mode_gdt>:
          ...
  ffff82d040396120:       ff ff 00 00 00 93 cf 00 ff ff 00 00 00 9b cf 00 ................

  ffff82d040396130 <compat_mode_idt>:
  ffff82d040396130:       00 00 00 00 00 00                               ......

  ffff82d040396136 <reloc_stack>:
          ...

Most data just gains type and size metadata.

The reloc_stack label is the wrong end of the data block to have a size, so
move it to the lowest address and introduce .Lreloc_stack_base as a
replacement.  Also, fix the fact that it is misaligned by 2 bytes.

While kexec_reloc_size could gain metadata, it's use in the linker
assertion (while correct) is deeply confusing to follow.  Drop it entirely,
using a linker symbol instead to denote the end of the trampoline.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

The remainder of the 32bit code has mode-invariant lengths, so disassembles
safely as 64bit.  The only differences come from 32/64bit implicit register
sizes.

v2.1:
 * New
v2.2:
 * Fix stack alignment
---
 xen/arch/x86/include/asm/machine_kexec.h |  2 +-
 xen/arch/x86/machine_kexec.c             |  2 +-
 xen/arch/x86/x86_64/kexec_reloc.S        | 23 ++++++++++++++++++-----
 xen/arch/x86/xen.lds.S                   |  3 ++-
 4 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/include/asm/machine_kexec.h b/xen/arch/x86/include/asm/machine_kexec.h
index ba0d469d077b..d4880818c1d9 100644
--- a/xen/arch/x86/include/asm/machine_kexec.h
+++ b/xen/arch/x86/include/asm/machine_kexec.h
@@ -9,7 +9,7 @@ extern void kexec_reloc(unsigned long reloc_code, unsigned long reloc_pt,
                         unsigned long ind_maddr, unsigned long entry_maddr,
                         unsigned long flags);
 
-extern unsigned int kexec_reloc_size;
+extern const char kexec_reloc_end[];
 
 #endif
 
diff --git a/xen/arch/x86/machine_kexec.c b/xen/arch/x86/machine_kexec.c
index 08ec9fd43b1d..751a9efcaf6a 100644
--- a/xen/arch/x86/machine_kexec.c
+++ b/xen/arch/x86/machine_kexec.c
@@ -117,7 +117,7 @@ int machine_kexec_load(struct kexec_image *image)
     }
 
     code_page = __map_domain_page(image->control_code_page);
-    memcpy(code_page, kexec_reloc, kexec_reloc_size);
+    memcpy(code_page, kexec_reloc, kexec_reloc_end - (char *)kexec_reloc);
     unmap_domain_page(code_page);
 
     /*
diff --git a/xen/arch/x86/x86_64/kexec_reloc.S b/xen/arch/x86/x86_64/kexec_reloc.S
index d488d127cfb9..89316bc3a7ac 100644
--- a/xen/arch/x86/x86_64/kexec_reloc.S
+++ b/xen/arch/x86/x86_64/kexec_reloc.S
@@ -34,7 +34,7 @@ ENTRY(kexec_reloc)
         movq    %rcx, %rbp
 
         /* Setup stack. */
-        leaq    (reloc_stack - kexec_reloc)(%rdi), %rsp
+        leaq    (.Lreloc_stack_base - kexec_reloc)(%rdi), %rsp
 
         /* Load reloc page table. */
         movq    %rsi, %cr3
@@ -175,10 +175,16 @@ compatibility_mode_far:
         .long 0x00000000             /* set in call_32_bit above */
         .word 0x0010
 
+        .type compatibility_mode_far, @object
+        .size compatibility_mode_far, . - compatibility_mode_far
+
 compat_mode_gdt_desc:
         .word .Lcompat_mode_gdt_end - compat_mode_gdt -1
         .quad 0x0000000000000000     /* set in call_32_bit above */
 
+        .type compat_mode_gdt_desc, @object
+        .size compat_mode_gdt_desc, . - compat_mode_gdt_desc
+
         .align 8
 compat_mode_gdt:
         .quad 0x0000000000000000     /* null                              */
@@ -186,16 +192,23 @@ compat_mode_gdt:
         .quad 0x00cf9b000000ffff     /* 0x0010 ring 0 code, compatibility */
 .Lcompat_mode_gdt_end:
 
+        .type compat_mode_gdt, @object
+        .size compat_mode_gdt, . - compat_mode_gdt
+
 compat_mode_idt:
         .word 0                      /* limit */
         .long 0                      /* base */
 
+        .type compat_mode_idt, @object
+        .size compat_mode_idt, . - compat_mode_idt
+
         /*
          * 16 words of stack are more than enough.
          */
-        .fill 16,8,0
+        .align 8
 reloc_stack:
+        .fill 16,8,0
+.Lreloc_stack_base:
 
-        .globl kexec_reloc_size
-kexec_reloc_size:
-        .long . - kexec_reloc
+        .type reloc_stack, @object
+        .size reloc_stack, . - reloc_stack
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 82ad8feb6e99..7ffecd463070 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -84,6 +84,7 @@ SECTIONS
        _etextentry = .;
 
        *(.text.kexec)          /* Page aligned in the object file. */
+       kexec_reloc_end = .;
 
        *(.text.cold)
        *(.text.unlikely)
@@ -428,7 +429,7 @@ ASSERT(__2M_rwdata_end <= XEN_VIRT_END - XEN_VIRT_START + __XEN_VIRT_START -
        "Xen image overlaps stubs area")
 
 #ifdef CONFIG_KEXEC
-ASSERT(kexec_reloc_size - kexec_reloc <= PAGE_SIZE, "kexec_reloc is too large")
+ASSERT(kexec_reloc_end - kexec_reloc <= PAGE_SIZE, "kexec_reloc is too large")
 #endif
 
 /* The Multiboot setup paths relies on this to simplify superpage PTE creation. */
-- 
2.11.0


