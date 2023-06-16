Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEBC73380F
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 20:24:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550364.859397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qAE6N-0008PR-A0; Fri, 16 Jun 2023 18:23:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550364.859397; Fri, 16 Jun 2023 18:23:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qAE6N-0008Ml-6C; Fri, 16 Jun 2023 18:23:15 +0000
Received: by outflank-mailman (input) for mailman id 550364;
 Fri, 16 Jun 2023 18:23:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a4sU=CE=citrix.com=prvs=524b4a1dd=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qAE6L-0008Mf-JY
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 18:23:13 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7f1a88e-0c72-11ee-8611-37d641c3527e;
 Fri, 16 Jun 2023 20:23:10 +0200 (CEST)
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
X-Inumbo-ID: d7f1a88e-0c72-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686939790;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FftawUOo4lgeYeNvfblFloX62u6ugh3iT3j0C8i6E1Q=;
  b=HL3nRf3ps8+tr8N0c0+hu7qqFcN3hU9b5PAcg2UhrBMJCHxPuUTMduPp
   B8QF8sVgNrWA0W4sYKioovjg0F0ehdLiiSp4SKVaVhHwMq9D/eT8+26pY
   UlRXK+JfHkb/Z3qa1RbYTjn8s2nk1/KL+G/DQBjEmYeZ9vKWtCRMj9t7I
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 112988182
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:S2yGTKMxnQ/voPbvrR2ll8FynXyQoLVcMsEvi/4bfWQNrUp23zAPz
 zEbCjiGP6mJN2byLtknYI6x9BgP7ZPRn9E3Swto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/rrRC9H5qyo42tG5wJmPpingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0s1eX0Jt7
 dw1ESsqdRucouadmOzjVuY506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLoXmuuyi2a5WDpfsF+P/oI84nTJzRw327/oWDbQUoXTH5QFzh/I/
 Aoq+UzLDE8YH9in7gCHrC2xr+/thjjQZdodQejQGvlC3wTImz175ActfUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxasnDQRRt5RGO0S8xyWx+zf5APxLncAZi5MbpohrsBeeNAx/
 gbXxZWzX2Up6eDLDyvHrd94sA9eJwA+BDEhRjckYDIexMLov6Q3pUqRFspsRfvdYsLOJd3g/
 9ybhHFg1+tC1pBXh/zTEUPv2Gz1+MWQJuIhzkCOBz/+sFskDGKwT9bwgWU3+8qsO2pworOpm
 HEf0/aT4+kVZX1mvHzcGb5ddF1FChvsDdE9vbKMN8N7n9hV0yT/Fb28GRknTKuTDu4KeCXyf
 GjYsh5L6ZlYMROCNPEnPdLsUZhwkvaxSLwJs8w4iPIUOvCdkyfdpklTibO4hTixwCDAb4lhU
 XtkTSpcJSlDUvk2pNZHb+wczaUq1kgDKZD7HPjGI+Cc+ePGPha9EO5VWGZim8hltMtoVi2Jq
 YcAXyZLoj0DONDDjt7/q99OfQFWdilhXvgbaaV/L4a+H+avI0l5Y9e5/F/rU9UNc3h9/gsQw
 kyAZw==
IronPort-HdrOrdr: A9a23:BACyIq7Fy+cBoHCeWwPXwPDXdLJyesId70hD6qhwISY6TiX+rb
 HWoB17726TtN9/YhEdcLy7VJVoBEmskKKdgrNhWotKPjOW21dARbsKheCJrgEIWReOktK1vZ
 0QC5SWY+eQMbEVt6nHCXGDYrQd/OU=
X-Talos-CUID: 9a23:zyqo3G5WReqtTpch3Nss32dKOeM9UlDk11DLKFCdDU0xFuWJRgrF
X-Talos-MUID: 9a23:+bF68QWLDXym1rbq/A3i2jNJMP9P2abwV10kkbcdoOK5bSMlbg==
X-IronPort-AV: E=Sophos;i="6.00,248,1681185600"; 
   d="scan'208";a="112988182"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Alejandro Vallejo
	<alejandro.vallejo@cloud.com>
Subject: [PATCH 0.5/2] x86/boot: Clean up early error asm
Date: Fri, 16 Jun 2023 19:23:03 +0100
Message-ID: <20230616182303.3546262-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230615153157.444-1-alejandro.vallejo@cloud.com>
References: <20230615153157.444-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The asm forming early error handling is a mix of local and non-local symbols,
and has some pointless comments.  Drop the "# Error message" comments,
tweaking the style on modified lines, and make the symbols local.

However, leave behind one real symbol so this logic disassembles nicely
without merging in to acpi_boot_init(), which is the thing that happens to be
immediately prior in my build.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Done in order to simplfy Alejandro's NX series a little.
---
 xen/arch/x86/boot/head.S | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 09bebf8635d0..d52dbc752e29 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -142,25 +142,27 @@ efi_platform:
 
         .section .init.text, "ax", @progbits
 
-bad_cpu:
-        add     $sym_offs(.Lbad_cpu_msg),%esi   # Error message
+early_error:
+
+.Lbad_cpu:
+        add     $sym_offs(.Lbad_cpu_msg), %esi
         jmp     .Lget_vtb
-not_multiboot:
-        add     $sym_offs(.Lbad_ldr_msg),%esi   # Error message
+.Lnot_multiboot:
+        add     $sym_offs(.Lbad_ldr_msg), %esi
         jmp     .Lget_vtb
 .Lnot_aligned:
-        add     $sym_offs(.Lbag_alg_msg),%esi   # Error message
+        add     $sym_offs(.Lbag_alg_msg), %esi
         jmp     .Lget_vtb
 .Lmb2_no_st:
         /*
          * Here we are on EFI platform. vga_text_buffer was zapped earlier
          * because there is pretty good chance that VGA is unavailable.
          */
-        add     $sym_offs(.Lbad_ldr_nst),%esi   # Error message
+        add     $sym_offs(.Lbad_ldr_nst), %esi
         jmp     .Lget_vtb
 .Lmb2_no_ih:
         /* Ditto. */
-        add     $sym_offs(.Lbad_ldr_nih),%esi   # Error message
+        add     $sym_offs(.Lbad_ldr_nih), %esi
         jmp     .Lget_vtb
 .Lmb2_no_bs:
         /*
@@ -168,7 +170,7 @@ not_multiboot:
          * via start label. Then reliable vga_text_buffer zap is impossible
          * in Multiboot2 scanning loop and we have to zero %edi below.
          */
-        add     $sym_offs(.Lbad_ldr_nbs),%esi   # Error message
+        add     $sym_offs(.Lbad_ldr_nbs), %esi
         xor     %edi,%edi                       # No VGA text buffer
         jmp     .Lprint_err
 .Lmb2_efi_ia_32:
@@ -176,11 +178,11 @@ not_multiboot:
          * Here we are on EFI IA-32 platform. Then reliable vga_text_buffer zap is
          * impossible in Multiboot2 scanning loop and we have to zero %edi below.
          */
-        add     $sym_offs(.Lbad_efi_msg),%esi   # Error message
+        add     $sym_offs(.Lbad_efi_msg), %esi
         xor     %edi,%edi                       # No VGA text buffer
         jmp     .Lprint_err
 .Lget_vtb:
-        mov     sym_esi(vga_text_buffer),%edi
+        mov     sym_esi(vga_text_buffer), %edi
 .Lprint_err:
         lodsb
         test    %al,%al        # Terminate on '\0' sentinel
@@ -202,6 +204,9 @@ not_multiboot:
 .Lhalt: hlt
         jmp     .Lhalt
 
+        .size early_error, . - early_error
+        .type early_error, @function
+
         .code64
 
 __efi64_mb2_start:
@@ -221,8 +226,8 @@ __efi64_mb2_start:
         cmp     $MULTIBOOT2_BOOTLOADER_MAGIC,%eax
         je      .Lefi_multiboot2_proto
 
-        /* Jump to not_multiboot after switching CPU to x86_32 mode. */
-        lea     not_multiboot(%rip),%r15
+        /* Jump to .Lnot_multiboot after switching CPU to x86_32 mode. */
+        lea     .Lnot_multiboot(%rip), %r15
         jmp     x86_32_switch
 
 .Lefi_multiboot2_proto:
@@ -464,7 +469,7 @@ __start:
 
         /* Check for Multiboot bootloader. */
         cmp     $MULTIBOOT_BOOTLOADER_MAGIC,%eax
-        jne     not_multiboot
+        jne     .Lnot_multiboot
 
         /* Get mem_lower from Multiboot information. */
         testb   $MBI_MEMLIMITS,MB_flags(%ebx)
@@ -655,7 +660,7 @@ trampoline_setup:
 
         /* Check for availability of long mode. */
         bt      $cpufeat_bit(X86_FEATURE_LM),%edx
-        jnc     bad_cpu
+        jnc     .Lbad_cpu
 
         /* Stash TSC to calculate a good approximation of time-since-boot */
         rdtsc
-- 
2.30.2


