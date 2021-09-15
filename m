Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC91240C775
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 16:31:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187726.336694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQVw5-0005b9-Cx; Wed, 15 Sep 2021 14:30:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187726.336694; Wed, 15 Sep 2021 14:30:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQVw5-0005Xy-9l; Wed, 15 Sep 2021 14:30:53 +0000
Received: by outflank-mailman (input) for mailman id 187726;
 Wed, 15 Sep 2021 14:30:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WSgo=OF=citrix.com=Kevin.Stefanov@srs-us1.protection.inumbo.net>)
 id 1mQVw3-0005Xq-EF
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 14:30:51 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 36e509f7-e9ba-476d-96cd-f83c0f3eb406;
 Wed, 15 Sep 2021 14:30:49 +0000 (UTC)
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
X-Inumbo-ID: 36e509f7-e9ba-476d-96cd-f83c0f3eb406
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631716249;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=K4mRVCnyoPHsjrfxdV+wp76sCfCx7m8LYcuTMrox51k=;
  b=clKqww9lnOzrd5DXENB+LEZaMHo9T8sysPecAECieKtV09igYecrrLRm
   yTW/FQZg84zaO2WrcmGZ63ihFrtYQQczlsWs+m8MMHmdxAcIjDqwdRZiJ
   Yf4mR7gLItFQB5lcM6rjKrqbCIC19Jpq9XhpZwPljYGB3ToghsMX1VYdJ
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 5+oSUXDwJcrE8KlF9cUAt6yzz9DECW/JqoWR5oBP2F5WzwwNS/nqq40/MI7dGCCcz/uoC9m7d8
 umQjgvyz/1uZkhHL6L+D5CwIrKb7N5NoQVkzphOcj9ehwBWAHa2OK5X4VggUxIDkvEAp+wqjXN
 8CKXqULhpWICVnkicplorfLjE+IVzN4hk/i09MbbdiO/OB3b7KMdDveUWSJlQE1qPC3AhTjawW
 V+RWjVPo7yMHS2BISv/Jq6nH50pv9ZPhi0sVmPR3Uj4lvnAHlLLakGitB+ioZIafn242dJFmNf
 M0f4T7xlun0r+F9TGsi9fcAM
X-SBRS: 5.1
X-MesageID: 52806655
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:srAw5KMak16DBwbvrR29kMFynXyQoLVcMsEvi/4bfWQNrUpz1WABz
 2NKXmGHPa7YamT9f9B1O4+/8RkDupbdzNFlSQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6ZUsxNbVU8En552Es+w7VRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoy7Zvfpel
 PgWj7GhGBwgMPPdwLs+UyANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YsphmMUlavL3MY0WvHZ+5TrYEewnUdbIRKCiCdpwgW1g3p4QQKu2i
 8wxd3lvXC2dYTl1AnwVFc4snLmRpXvNfGgNwL6SjfVuuDWCpOBr65DsL9j9atGMXd9SnEuTu
 iTB5WuRKg4eHMySz3yC6H3Erv/Cm2b3VZwfEJW89+V2mxuDy2oLEhoUWFCn5/6jhSaWWdhSN
 kgV8SoGtrUp+QqgSdyVYvGjiCfa5FhGAYMWSrBkrlHWokbJ3+qHLnNUbBRuNPF9juInFCcj2
 AGYx4zKBQU65dV5VkmhGqeoQSKaYHZOdDJTOnBaFGPp8PG4/9pi1UunosJLVffv14yrQ2mYL
 yWi8XBm74j/m/LnwElSEbrvuDuqupGBZQo8/Ay/somNv14hOdLNi2BF7zHmARd8wGSxFQLpU
 JsswZH2AAUy4XalznflfQn1NOv1j8tpyRWF6bKVI3XEywlBBlb5JdwAiN2BGKuZGpldImK4C
 KMikShQ+IVSLBOXUEODWKroU55C5fG5TbzND6mIBvITMskZXFLWp0lGOB/Pt10BZWBxyMnTz
 7/AKp3yZZvbYIw6pAeLqxA1iuNynXFimjqIHPgWDX2PiNKjWZJccp9dWHPmUwzzxPrsTNz9/
 4kNOs2U5Q9YVeGiMCDb/ZRKdQIBLGQhBICwoMtSL7bRLg1jEWAnKvnQ3bJ+JNA1w/ULzr/Fr
 iOnR0tV6Fvjnnmbew+EXW9uNeH0VpFloHNlYSF1ZQS022IuaJqE5bsEc8dlZqEu8eFulKYmT
 /QMd8iaLO5ITzDLp2YUYZXn9dQwfxW3nwOeeSGiZWFnLZJnQgXI/P7ifxfuq3ZSXnbm65Nmr
 uT5hA3BQJcFSwBzN+rsaaqinwGroHwQuONuRE+UcNNdT1rhrdpxICvrg/5pf8xVcUffxiGX3
 hq9CAsDobWfuJc89dTEiPzWr4qtFOciTENWE3OCsOSzPCjeuGGi3ZVBQKCDejWEDDH4/6CrZ
 ON0yfDgMaJYwAYW4tQkS7s7n7gj49bPpqNBylU2FXrGWF2nF7d8LyTUxsJIrKBMmudUtAbet
 phjITWG1WFl4P/YLWM=
IronPort-HdrOrdr: A9a23:oqtJvaPv8958n8BcTjujsMiBIKoaSvp037BK7S1MoNJuEvBw9v
 re+MjzsCWftN9/Yh4dcLy7VpVoIkmskKKdg7NhXotKNTOO0AeVxelZhrcKqAeQeREWmNQ96U
 9hGZIOdeEZDzJB/LrHCN/TKade/DGFmprY+9s31x1WPGZXgzkL1XYDNu6ceHcGIjVuNN4CO7
 e3wNFInDakcWR/VLXAOpFUN9Kz3uEijfjdEGY7OyI=
X-IronPort-AV: E=Sophos;i="5.85,295,1624334400"; 
   d="scan'208";a="52806655"
From: Kevin Stefanov <kevin.stefanov@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Kevin Stefanov <kevin.stefanov@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [PATCH v3] tools/libxl: Correctly align the ACPI tables
Date: Wed, 15 Sep 2021 15:30:00 +0100
Message-ID: <20210915143000.36353-1-kevin.stefanov@citrix.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The memory allocator currently calculates alignment in libxl's virtual
address space, rather than guest physical address space. This results
in the FACS being commonly misaligned.

Furthermore, the allocator has several other bugs.

The opencoded align-up calculation is currently susceptible to a bug
that occurs in the corner case that the buffer is already aligned to
begin with. In that case, an align-sized memory hole is introduced.

The while loop is dead logic because its effects are entirely and
unconditionally overwritten immediately after it.

Rework the memory allocator to align in guest physical address space
instead of libxl's virtual memory and improve the calculation, drop
errant extra page in allocated buffer for ACPI tables, and give some
of the variables better names/types.

Fixes: 14c0d328da2b ("libxl/acpi: Build ACPI tables for HVMlite guests")
Signed-off-by: Kevin Stefanov <kevin.stefanov@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>

v2: Rewrite completely, to align in guest physical address space

v3: Drop the now-unused local variable page_mask
---
 tools/libs/light/libxl_x86_acpi.c | 49 ++++++++++++-------------------
 1 file changed, 19 insertions(+), 30 deletions(-)

diff --git a/tools/libs/light/libxl_x86_acpi.c b/tools/libs/light/libxl_x86_acpi.c
index 3eca1c7a9f..57a6b63790 100644
--- a/tools/libs/light/libxl_x86_acpi.c
+++ b/tools/libs/light/libxl_x86_acpi.c
@@ -20,6 +20,7 @@
 
  /* Number of pages holding ACPI tables */
 #define NUM_ACPI_PAGES 16
+#define ALIGN(p, a) (((p) + ((a) - 1)) & ~((a) - 1))
 
 struct libxl_acpi_ctxt {
     struct acpi_ctxt c;
@@ -28,10 +29,10 @@ struct libxl_acpi_ctxt {
     unsigned int page_shift;
 
     /* Memory allocator */
-    unsigned long alloc_base_paddr;
-    unsigned long alloc_base_vaddr;
-    unsigned long alloc_currp;
-    unsigned long alloc_end;
+    unsigned long guest_start;
+    unsigned long guest_curr;
+    unsigned long guest_end;
+    void *buf;
 };
 
 extern const unsigned char dsdt_pvh[];
@@ -43,8 +44,7 @@ static unsigned long virt_to_phys(struct acpi_ctxt *ctxt, void *v)
     struct libxl_acpi_ctxt *libxl_ctxt =
         CONTAINER_OF(ctxt, struct libxl_acpi_ctxt, c);
 
-    return (((unsigned long)v - libxl_ctxt->alloc_base_vaddr) +
-            libxl_ctxt->alloc_base_paddr);
+    return libxl_ctxt->guest_start + (v - libxl_ctxt->buf);
 }
 
 static void *mem_alloc(struct acpi_ctxt *ctxt,
@@ -58,20 +58,16 @@ static void *mem_alloc(struct acpi_ctxt *ctxt,
     if (align < 16)
         align = 16;
 
-    s = (libxl_ctxt->alloc_currp + align) & ~((unsigned long)align - 1);
+    s = ALIGN(libxl_ctxt->guest_curr, align);
     e = s + size - 1;
 
     /* TODO: Reallocate memory */
-    if ((e < s) || (e >= libxl_ctxt->alloc_end))
+    if ((e < s) || (e >= libxl_ctxt->guest_end))
         return NULL;
 
-    while (libxl_ctxt->alloc_currp >> libxl_ctxt->page_shift != 
-           e >> libxl_ctxt->page_shift)
-        libxl_ctxt->alloc_currp += libxl_ctxt->page_size;
+    libxl_ctxt->guest_curr = e;
 
-    libxl_ctxt->alloc_currp = e;
-
-    return (void *)s;
+    return libxl_ctxt->buf + (s - libxl_ctxt->guest_start);
 }
 
 static void acpi_mem_free(struct acpi_ctxt *ctxt,
@@ -163,15 +159,12 @@ int libxl__dom_load_acpi(libxl__gc *gc,
     struct acpi_config config = {0};
     struct libxl_acpi_ctxt libxl_ctxt;
     int rc = 0, acpi_pages_num;
-    void *acpi_pages;
-    unsigned long page_mask;
 
     if (b_info->type != LIBXL_DOMAIN_TYPE_PVH)
         goto out;
 
     libxl_ctxt.page_size = XC_DOM_PAGE_SIZE(dom);
     libxl_ctxt.page_shift =  XC_DOM_PAGE_SHIFT(dom);
-    page_mask = (1UL << libxl_ctxt.page_shift) - 1;
 
     libxl_ctxt.c.mem_ops.alloc = mem_alloc;
     libxl_ctxt.c.mem_ops.v2p = virt_to_phys;
@@ -186,19 +179,17 @@ int libxl__dom_load_acpi(libxl__gc *gc,
     config.rsdp = (unsigned long)libxl__malloc(gc, libxl_ctxt.page_size);
     config.infop = (unsigned long)libxl__malloc(gc, libxl_ctxt.page_size);
     /* Pages to hold ACPI tables */
-    acpi_pages =  libxl__malloc(gc, (NUM_ACPI_PAGES + 1) *
-                                libxl_ctxt.page_size);
+    libxl_ctxt.buf = libxl__malloc(gc, NUM_ACPI_PAGES *
+                                   libxl_ctxt.page_size);
 
     /*
      * Set up allocator memory.
      * Start next to acpi_info page to avoid fracturing e820.
      */
-    libxl_ctxt.alloc_base_paddr = ACPI_INFO_PHYSICAL_ADDRESS +
-        libxl_ctxt.page_size;
-    libxl_ctxt.alloc_base_vaddr = libxl_ctxt.alloc_currp =
-        (unsigned long)acpi_pages;
-    libxl_ctxt.alloc_end = (unsigned long)acpi_pages +
-        (NUM_ACPI_PAGES * libxl_ctxt.page_size);
+    libxl_ctxt.guest_start = libxl_ctxt.guest_curr = libxl_ctxt.guest_end =
+        ACPI_INFO_PHYSICAL_ADDRESS + libxl_ctxt.page_size;
+
+    libxl_ctxt.guest_end += NUM_ACPI_PAGES * libxl_ctxt.page_size;
 
     /* Build the tables. */
     rc = acpi_build_tables(&libxl_ctxt.c, &config);
@@ -208,10 +199,8 @@ int libxl__dom_load_acpi(libxl__gc *gc,
     }
 
     /* Calculate how many pages are needed for the tables. */
-    acpi_pages_num =
-        ((libxl_ctxt.alloc_currp - (unsigned long)acpi_pages)
-         >> libxl_ctxt.page_shift) +
-        ((libxl_ctxt.alloc_currp & page_mask) ? 1 : 0);
+    acpi_pages_num = (ALIGN(libxl_ctxt.guest_curr, libxl_ctxt.page_size) -
+                      libxl_ctxt.guest_start) >> libxl_ctxt.page_shift;
 
     dom->acpi_modules[0].data = (void *)config.rsdp;
     dom->acpi_modules[0].length = 64;
@@ -231,7 +220,7 @@ int libxl__dom_load_acpi(libxl__gc *gc,
     dom->acpi_modules[1].length = 4096;
     dom->acpi_modules[1].guest_addr_out = ACPI_INFO_PHYSICAL_ADDRESS;
 
-    dom->acpi_modules[2].data = acpi_pages;
+    dom->acpi_modules[2].data = libxl_ctxt.buf;
     dom->acpi_modules[2].length = acpi_pages_num  << libxl_ctxt.page_shift;
     dom->acpi_modules[2].guest_addr_out = ACPI_INFO_PHYSICAL_ADDRESS +
         libxl_ctxt.page_size;
-- 
2.25.1


