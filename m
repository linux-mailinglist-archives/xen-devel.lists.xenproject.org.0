Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6B34B9CAA
	for <lists+xen-devel@lfdr.de>; Thu, 17 Feb 2022 11:02:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274580.470095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKdc8-0003Vp-JU; Thu, 17 Feb 2022 10:02:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274580.470095; Thu, 17 Feb 2022 10:02:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKdc8-0003Tp-Fr; Thu, 17 Feb 2022 10:02:16 +0000
Received: by outflank-mailman (input) for mailman id 274580;
 Thu, 17 Feb 2022 10:02:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W+1Z=TA=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nKdc6-0003Tj-Cx
 for xen-devel@lists.xenproject.org; Thu, 17 Feb 2022 10:02:14 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab32a6cb-8fd8-11ec-b215-9bbe72dcb22c;
 Thu, 17 Feb 2022 11:02:10 +0100 (CET)
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
X-Inumbo-ID: ab32a6cb-8fd8-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645092132;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GMU8LsN/3Pxq78qL9996Dptilzd5w89xVJXi9VTdYfI=;
  b=YxpzR8+mSemDdtYBt7arL6HzL/pNR3TCnRr1hDIJGv7E7yu7H9HwS0Gv
   5YC6mvHj17LaCiZACvy/8Dk0cYadTISUUwr47nVjKRyUlaGRkQkFDxNnx
   H7mZrAelOLUc5ZGq+il1jAoaDiqRFtR02NUwc2NW12ZjgVgOJqWbJT0sz
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: e3tKdMLDgMD4cmrSo3bQqbb3IOiAmvd8tP/z/S7DAulTflI0ai1izY773zlo3el5TudJqz6d/H
 CJx3ZdBBA0BDOKNlJlQQcYEcTiAl1Rnd4oDbRVP7espBbt10ggmQSyfffwUQO3lHwER+Q16Gl6
 nns0lVWbMFDFfvAviL5kGs8AzpOs7M109sCU6IwtpMur+h1eHj6+4IjtPgJxiMOoxthZ+hnTT8
 9Cyo4wOgs8bEYnZns0tcxVsZi0YkBZ4Cvt3maYHe1bOslCyzsTWi/oaFKdP1q4yZYWksNaLkvM
 M3LKDwacXvRdzCyz3rN2FPkF
X-SBRS: 5.1
X-MesageID: 64418586
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:/POyTannM4d2Ue3RgAX1ySvo5gxDIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xJJDTqGP6rba2KhetFwaNi29EhT75TQy95lQVZuqHo0QyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh2Nc32YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 NtLi5eUbQYjB5+PiP05bjhxOTNuMrITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQ6qCP
 ppEOWQHgBLoM0ISNF48V5UFvKSDoUOubm17qwuPjP9ii4TU5FMoi+W8WDbPQfSVQe1Fk0Deo
 XjJl0zbKBwHMN2UyRKe72mhwOTImEvTSI8UUbG16PNuqFmS3XAITg0bU0Ohpvu0gVL4XMhQQ
 3H44QJ38/J0rhbyCICgAVvo+xZooyLwRfJeFdMxzCWMwJPmoBaAIlUlZxRTeNM54ZpeqSMR6
 neFmNbgBDpKubKTSG6A+rr8kQ5eKRT5PkdZO3ZaEFJtD83L5dhq00mRFooL/Lud04WtcQwc1
 Qxmu8TXa187qccQn5u28lnc695HjsiYF1Vljuk7s4/M0++YWGJHT9D5gbQ4xawZRGp8crVnl
 CJb8yR5xLpTZaxhbATXHI0w8EiBvp5pygH0j191BIUG/D+w4XOldo04yGggeBoxaZlaJWKyP
 xK7VeZtCHl7ZiTCgUhfOd/ZNijX5fK4SYSNug78NbKinaSdhCfYpXozNCZ8LkjmkVQ2kLFXB
 HtoWZ3EMJruMow+lGDeb75EidcDn3lirUuOFcGT50n2itK2OS/KIYrpxXPTN4jVGovf+16Lm
 zueXuPXoyhivBrWOXiNrtBNfAtbdhDWx/ne8qRqSwJKGSI+cElJNhMb6epJl1VNk/sHm+HW0
 Gu6X0MEmlPziWeecVeBa2x5aaOpVpF69CppMSspNFeu+n4ifYfws/tPK8ppJeEqpL550Pp5b
 /gZYMHcUP5BfSvKpmYGZp7noY08KBny3VCSPzCoaSQUdoJ7Q1Cb4cftewbirXFcDie+ucYkj
 aen0wfXHcgKSwh4VZ6EY/Oz1VKh+3ManbsqDUfPJ9BSfmTq8ZRrdHOt3qNmfZlUJEyalDWA1
 guQDRMJnsX3otc4oIvTmKSJj4a1CO8iTEBUKHbWsOStPi7A82v9nYIZCLSUfSrQXX/f8bm5Y
 bkH1On1NfAKkQoYs4d4FLo3n6sy68G2+u1fxwVgWn7Kc06qGvVrJXzfhZtDsahEx7l4vwqqW
 x3QpokGaOvRYM61QkQMIAcFb/iY0aBGkzbf2v05PUHm6XIl57GAS0hTY0GBhSE1wGGZ62/5L
 TPNYPIr1jE=
IronPort-HdrOrdr: A9a23:p/YIyqnsH8XT7LvMsb09wNSdvIvpDfIU3DAbv31ZSRFFG/Fxl6
 iV8sjzsiWE8Qr5OUtQ/+xoV5PhfZqxz/JICMwqTNKftWrdyQyVxeNZnOjfKlTbckWUnINgPO
 VbAsxD4bXLfCBHZK3BgTVQfexO/DD+ytHLudvj
X-IronPort-AV: E=Sophos;i="5.88,375,1635220800"; 
   d="scan'208";a="64418586"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2.1 6.5/70] x86/kexec: Annotate embedded data with ELF metadata
Date: Thu, 17 Feb 2022 10:01:58 +0000
Message-ID: <20220217100158.22402-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
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

Most data just gains type and size metadata.  The reloc_stack label is the
wrong end of the data block to have a size, so move it to the lowest address
and introduce .Lreloc_stack_base as a replacement.

While kexec_reloc_size could gain metadata, it's use in the linker
assertion (while correct) is deeply confusing to follow.  Drop it entirely,
using a linker symbol instead to denote the end of the trampoline.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

The remainder of the 32bit code has mode-invariant lengths, so disassembles
safely as 64bit.  The only differences come from 32/64bit implicit register
sizes.

v2.1:
 * New
---
 xen/arch/x86/include/asm/machine_kexec.h |  2 +-
 xen/arch/x86/machine_kexec.c             |  2 +-
 xen/arch/x86/x86_64/kexec_reloc.S        | 22 +++++++++++++++++-----
 xen/arch/x86/xen.lds.S                   |  3 ++-
 4 files changed, 21 insertions(+), 8 deletions(-)

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
index d488d127cfb9..05bf8810cee6 100644
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
@@ -186,16 +192,22 @@ compat_mode_gdt:
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
 reloc_stack:
+        .fill 16,8,0
+.Lreloc_stack_base:
 
-        .globl kexec_reloc_size
-kexec_reloc_size:
-        .long . - kexec_reloc
+        .type reloc_stack, @object
+        .size reloc_stack, . - reloc_stack
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index c399178ac123..13fc7ee008c1 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -87,6 +87,7 @@ SECTIONS
        *(.text.unlikely)
        *(.fixup)
        *(.text.kexec)
+       kexec_reloc_end = .;
        *(.gnu.warning)
        _etext = .;             /* End of text section */
   } PHDR(text) = 0x9090
@@ -433,7 +434,7 @@ ASSERT(__2M_rwdata_end <= XEN_VIRT_END - XEN_VIRT_START + __XEN_VIRT_START -
        "Xen image overlaps stubs area")
 
 #ifdef CONFIG_KEXEC
-ASSERT(kexec_reloc_size - kexec_reloc <= PAGE_SIZE, "kexec_reloc is too large")
+ASSERT(kexec_reloc_end - kexec_reloc <= PAGE_SIZE, "kexec_reloc is too large")
 #endif
 
 /* The Multiboot setup paths relies on this to simplify superpage PTE creation. */
-- 
2.11.0


