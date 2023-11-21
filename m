Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1FB7F3732
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 21:16:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638182.994532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5XA9-0007jP-6t; Tue, 21 Nov 2023 20:16:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638182.994532; Tue, 21 Nov 2023 20:16:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5XA9-0007hK-36; Tue, 21 Nov 2023 20:16:01 +0000
Received: by outflank-mailman (input) for mailman id 638182;
 Tue, 21 Nov 2023 20:15:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T8a9=HC=citrix.com=prvs=682c61bdb=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1r5XA7-0007Bx-1G
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 20:15:59 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7a0f2a2-88aa-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 21:15:57 +0100 (CET)
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
X-Inumbo-ID: c7a0f2a2-88aa-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1700597757;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zhFqeBE6+dVJCflG9ZGRRYk/WpALPCbVG60q2etK4II=;
  b=BW7A2YyFmjWN24+UDkmP12zTh8dNbOAI6w/AEURezRjJ3e5dJ6PERoY9
   jomYta76/Qt9kB15yUCaI8AtSVO/t2PA8ZgeXsX6lcLwtUzDmQ2ULzefs
   ++nSSYaArZczJ2w4WlrdEJzrwFhY+iFHIDrjhTrwfyIa7OMRx1MHATHVX
   I=;
X-CSE-ConnectionGUID: +GZ+UsK9SGatMSUbv7Cxvg==
X-CSE-MsgGUID: H2Ia19A2RQmFFwSxh4AdHQ==
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 127464601
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:/FnTPKuUYR9imAmGJy+qrLoIpufnVLBeMUV32f8akzHdYApBsoF/q
 tZmKW2GafuMMTfye94gbo+080sE7JXUm9RnHgZu/31mH3gS+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVaicfHg3HFc4IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq5Fv0gnRkPaoQ5QaEziFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwax8/LS2YpLON77unb9JRjNp8B9n1M9ZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkAefAhPYH49tL7Aan3XWjtUsl+K44Ew5HDe1ldZ27nxKtvFPNeNQK25m27B/
 D2aoTinWkhy2Nq36WCk+yv9r7X1pCbVdp0pBL3k3/JKuQjGroAUIEJPDgbqyRWjsWauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O88Q5RyJy6HUyx2EHWVCRTlEAPQ9r9M/TzEu0
 l6PnvvqCCZpvbnTTmiSnp+LqRuiNC5TKnUNDQcGUA8E7t/LsIw1yBXVQb5LLqmxidHkHCDq9
 BqDpiM+mrY7gNYC0uOw+lWvqzihvITTRwg5oADeRHu47xhRbZSgIYev7DDz9/FKIZyFSR+Lt
 XcCktKXxOoTAoqAkiPLS+IIdJmv5v2CNDSan1NzBZgn9hyn5nG4cIZfpjp5IS9U3t0sIGGzJ
 hWJ4EUIuc4VYyPCgbJLj5yZSOsYjpX7NoXeefnIS+FzaIYuXx+Z83Q7DaKP5FwBgHTAgIlmZ
 s/DLJb2UClKYZmL2gZaUAv07FPK+szd7TmKLXwD5077uYdynVbMIVv/DHOAb/oi8ISPqxjP/
 tBUOqOikkoHCLCvO3eKoddKcTjmyETX47is86S7kcbacmJb9JwJUaeNkdvNhaQ590iqqgs41
 i7kARIJoLYOrXbGNR+LehhehEDHBP5CQYYAFXV0Zz6AgiFzCbtDGY9DL/Pbi5F7rr08pRO1J
 tFZE/i97gNnE22co21FPcCg8OSPtn2D3GqzAsZsWxBnF7YIeuAD0oaMktfHnMXWMheKiA==
IronPort-HdrOrdr: A9a23:vM7XkK/YPps46ETq925uk+Hvdb1zdoMgy1knxilNoEpuA4Olfq
 eV7YImPH7P+UEssRQb6Kq90ca7MA3hHKBOkPAs1NuZLXjbUEXBFvAE0WLJ+UyDJ8XGntQtsZ
 uJmcBFebvN5CFB/KPHCWuDYqQdKai8gdSVbLzlvg9QpGhRAskKgmsXZGf6LqQRfng3OXMXLu
 vi2iMtnUvURZ14VLXJOpAtZZmMmzUL/KiWAiIuNloI6BSqhTjt0b7iHx2Z2Rtbcz4n+8ZpzU
 H11yL4+4CquLWDygbR0m/V49BslNSJ8KoPOOW8zuYUNxDlgUKQZJ1sXr2EsHQOvemz9ExCqq
 iBnz4Qe+py9lbYdSWNuh3v1wP8uQxeokPK+Bu3gWbHqce8fSk9CMZKmMZ4f3LimgIdleA5/q
 JX+mqT86NNCxDNljm43tDUVnhR5wGJiEtnsekOi3dYFasyAYUh1rD2tCtuYeo99GiT0vFaLM
 BeSOfB+flSeVSZK1TQvmxqyNvEZB4OIis=
X-Talos-CUID: =?us-ascii?q?9a23=3Aog0zG2mjVcoHell2OC0bblIbR6TXOT7y/jTtOGz?=
 =?us-ascii?q?pMklgVJiudFWOp4h0jcU7zg=3D=3D?=
X-Talos-MUID: 9a23:D141jAnqhRS0Xh9Kjj1adnpCbuZhuvWHUno0lLsopPKUNXBZNxek2WE=
X-IronPort-AV: E=Sophos;i="6.04,216,1695700800"; 
   d="scan'208";a="127464601"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Roberto Bagnara <roberto.bagnara@bugseng.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>
Subject: [PATCH v2 3/5] x86/efi: Simplify efi_arch_handle_cmdline()
Date: Tue, 21 Nov 2023 20:15:38 +0000
Message-ID: <20231121201540.1528161-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231121201540.1528161-1-andrew.cooper3@citrix.com>
References: <20231121201540.1528161-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

-Wwrite-strings is unhappy with assigning "xen" to a mutable pointer, but all
this work is useless; it's making a memory allocation just to prepend the
image name which cmdline_cook() intentionally strips back out.

Simply forgo the work and identify EFI_LOADER as one of the loaders which
doesn't prepend the image name.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>

v2:
 * Brand new.

I can't find anything which cares about the image name in the slightest.  This
logic is from bf6501a62e80 ("x86-64: EFI boot code") when EFI was introduced,
at whcih point GRUB2 was the only excluded loader in cmdline_cook().
---
 xen/arch/x86/efi/efi-boot.h | 10 +---------
 xen/arch/x86/setup.c        |  7 +++++--
 2 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index eebc54180bf7..1a2a2dd83c9b 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -309,6 +309,7 @@ static void __init efi_arch_handle_cmdline(CHAR16 *image_name,
 {
     union string name;
 
+    /* NB place_string() prepends, so call in reverse order. */
     if ( cmdline_options )
     {
         name.w = cmdline_options;
@@ -317,15 +318,6 @@ static void __init efi_arch_handle_cmdline(CHAR16 *image_name,
     }
     if ( cfgfile_options )
         place_string(&mbi.cmdline, cfgfile_options);
-    /* Insert image name last, as it gets prefixed to the other options. */
-    if ( image_name )
-    {
-        name.w = image_name;
-        w2s(&name);
-    }
-    else
-        name.s = "xen";
-    place_string(&mbi.cmdline, name.s);
 
     if ( mbi.cmdline )
         mbi.flags |= MBI_CMDLINE;
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index b171a8f4cf84..200520392481 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -850,8 +850,11 @@ static const char *__init cmdline_cook(const char *p, const char *loader_name)
     while ( *p == ' ' )
         p++;
 
-    /* GRUB2 and PVH don't not include image name as first item on command line. */
-    if ( xen_guest || loader_is_grub2(loader_name) )
+    /*
+     * PVH, our EFI loader, and GRUB2 don't not include image name as first
+     * item on command line.
+     */
+    if ( xen_guest || efi_enabled(EFI_LOADER) || loader_is_grub2(loader_name) )
         return p;
 
     /* Strip image name plus whitespace. */
-- 
2.30.2


