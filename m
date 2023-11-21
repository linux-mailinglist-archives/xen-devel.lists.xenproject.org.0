Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E28C47F3731
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 21:16:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638183.994543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5XAA-00083L-Hd; Tue, 21 Nov 2023 20:16:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638183.994543; Tue, 21 Nov 2023 20:16:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5XAA-0007zE-EZ; Tue, 21 Nov 2023 20:16:02 +0000
Received: by outflank-mailman (input) for mailman id 638183;
 Tue, 21 Nov 2023 20:16:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T8a9=HC=citrix.com=prvs=682c61bdb=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1r5XA9-0007Bx-0j
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 20:16:01 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8d1d8ff-88aa-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 21:15:59 +0100 (CET)
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
X-Inumbo-ID: c8d1d8ff-88aa-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1700597759;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nNPFHrgxp9pbQ7IeeSDyd3YSSCnHXwpkDDz03xLZZ0Y=;
  b=eszsf461HSGmtNP+BXu+7/JC0U6e1ftnH+KNlIYDk5NOQfcSjk70uRpf
   lRb2/NE/OiaQmRkrXWIkYFhdJgBeCn+kbHouusn4Iqes1En2crjemE8nl
   GF8d+2M1IKXjO6dtPnFJHsbQm9e8v/S/7F9nXSMtMOvWJzlMChgXXGQws
   4=;
X-CSE-ConnectionGUID: BxdPn14FSKGZsTscOECGPg==
X-CSE-MsgGUID: mpsQ+mzbStynQezYRkbRFQ==
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 127464603
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:GBbuEq2dKvZbLGtYufbD5TVxkn2cJEfYwER7XKvMYLTBsI5bpzACy
 mocD2+HP/uDamT2fdt1aozn9UMO7JXUx9RhQQc+pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliOfQAOK6UbaYUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb9HuDgNyo4GlD5wVkPKgR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfK3FCz
 fpBdB42TT+xnN6ty5WWYcZUiZF2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGc+KkuYC/FMEg5/5JYWteGknHTgNRZfr0qYv/Ef6GnP1g1hlrPqNbI5f/TTH5oJwBrG/
 jmuE2LRBwkBDZ+a2zC+7mOqv+LdrBn4Urg8LejtnhJtqALKnTFCYPEMbnOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHsljw2VsdUEuY6wBqQ0aeS6AGcbkAfVSJIYtEisM4wRBQp2
 0WPktevAiZg2JWKTVqN+7HSqim9UQAXMGsDaCksXQYDpd75r+kbsBXLSdpyFb+vuff8Ezrw3
 jOioTA3gvMYistj/6+250zdijSg4J3AVBco5x7/V3igqAh+YeaNfYui5ELH6rBKJYmfR0OIl
 HIZlNOT6u9IBpaI/ASLQe4KGLjv+fuZKjzagHZlApY6+jKivXWkeOhtDCpWfRkzdJxeIHmwP
 R6V5ls5CIJv0GWCR797W4ToV+oR7ofSDuj+Xdf5RfV2bc0kHOOYxx2CdXJ8zki0zxB0zPFlZ
 MjLGftAG0r2HkiO8dZXewv++eVyrszG7TmPLa0XNjz+uVZkWFabSK0eLHyFZf0j4aWPrW39q
 okHb5bbkksCALSnPkE7FLL/y3hQdRDX4riv+6RqmhOreFI6SAnN9deNqV/eR2CVt/sMzbqZl
 p1MckRZ1ED+lRX6xfaiMxhehEfUdc8n9xoTZHV8VWtELlB/Oe5DGo9DLcpoFVTmncQ/pcNJo
 w4tIpzbWq0XGm2ap1zwr/DV9eRfSfhivirWVwLNXdT1V8cIq9DhkjM8QjbSyQ==
IronPort-HdrOrdr: A9a23:zoRAa6kDfY3CTFmNXPHkWMirhnXpDfMbimdD5ihNYBxZY6Wkfp
 aV7bsmPHjP+UAssRAb6Ke90cy7MAnhHPFOkPcs1ImZLXDbUQeTXfBfBaWL+UyGJ8TVzJ8+6U
 9YG5IObOEZ5zBB/KDHCXCDYrMdKbu8gdKVbJblvgNQpFpRGtldBm5CY27xfyEYKmgnOXNeLu
 vt2iNpnUveRZ19VLXPOpBqZZmxmzTjruOpXfbGbyRXizWmvHeH6KPeGxPd5xcGXzZOxrtn0W
 WtqX2y2oyT99+61zrV3Cvr741bndvnxp95CMPksLlZFhzcziipeaFoUPm6vCk4peGp5BIRjd
 HQvw1IBbU+11rhOk+0vD7k0E3YyzAs53X+oGXoyEfLkIjWRC8eA8EEvJlecRfS9g4BsbhHoe
 p29lPcmZpLKBvK2B3n4dvFXQwvr0KooBMZ4KUupk0acYwDbLRW6awzlXkla6vpVErBmf0a+K
 MHNrCh2N9mNXWHcn/dtm5shPilXnE2FhDueCI/hvA=
X-Talos-CUID: 9a23:CErM2G914nEtJqSshCSVv2QEFvgjKyHz91T/EVSEEm1OZZa6cVDFrQ==
X-Talos-MUID: 9a23:jOKeQQuah1bq4WNNzc2ngSl5DYRt8a6VFFELqJgUivOHPxZeAmLI
X-IronPort-AV: E=Sophos;i="6.04,216,1695700800"; 
   d="scan'208";a="127464603"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Roberto Bagnara <roberto.bagnara@bugseng.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>
Subject: [PATCH v2 2/5] x86/setup: Rework cmdline_cook() to be compatible with -Wwrite-strings
Date: Tue, 21 Nov 2023 20:15:37 +0000
Message-ID: <20231121201540.1528161-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231121201540.1528161-1-andrew.cooper3@citrix.com>
References: <20231121201540.1528161-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Rework the logic in __start_xen() to not potentially pass NULL into
cmdline_cook().  This makes the logic easier to follow too, and the rest of
__start_xen() is safe when initialising cmdline to the empty string.

Update cmdline_cook() to take and return const pointers, and write a
description of what it does.  It now requires a non-NULL input and guarentees
to return a pointer somewhere in the 'p' string.

Note this only compiles because strstr() launders the const off the pointer
when assigning to the mutable kextra, but that logic only mutates the
mbi->cmdline buffer.

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
 * create_dom0() changes split out into a previous patch
 * Remove the logic for a NULL input, now that all callers have been adjusted
---
 xen/arch/x86/setup.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index c0302c6bdd62..b171a8f4cf84 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -837,10 +837,15 @@ static bool __init loader_is_grub2(const char *loader_name)
     return (p != NULL) && (p[5] != '0');
 }
 
-static char * __init cmdline_cook(char *p, const char *loader_name)
+/*
+ * Clean up a command line string passed to us by a bootloader.  Strip leading
+ * whitespace, and optionally strip the first parameter if our divination of
+ * the bootloader suggests that it prepended the image name.
+ *
+ * Always returns a pointer within @p.
+ */
+static const char *__init cmdline_cook(const char *p, const char *loader_name)
 {
-    p = p ? : "";
-
     /* Strip leading whitespace. */
     while ( *p == ' ' )
         p++;
@@ -969,8 +974,8 @@ static struct domain *__init create_dom0(const module_t *image,
 /* SAF-1-safe */
 void __init noreturn __start_xen(unsigned long mbi_p)
 {
-    const char *memmap_type = NULL, *loader;
-    char *cmdline, *kextra;
+    const char *memmap_type = NULL, *loader, *cmdline = "";
+    char *kextra;
     void *bsp_stack;
     struct cpu_info *info = get_cpu_info(), *bsp_info;
     unsigned int initrdidx, num_parked = 0;
@@ -1025,9 +1030,9 @@ void __init noreturn __start_xen(unsigned long mbi_p)
                                            : "unknown";
 
     /* Parse the command-line options. */
-    cmdline = cmdline_cook((mbi->flags & MBI_CMDLINE) ?
-                           __va(mbi->cmdline) : NULL,
-                           loader);
+    if ( mbi->flags & MBI_CMDLINE )
+        cmdline = cmdline_cook(__va(mbi->cmdline), loader);
+
     if ( (kextra = strstr(cmdline, " -- ")) != NULL )
     {
         /*
-- 
2.30.2


