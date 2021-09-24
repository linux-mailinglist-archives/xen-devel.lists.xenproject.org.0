Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD57D41709A
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 13:06:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195311.347960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTj1Y-0001xZ-Cm; Fri, 24 Sep 2021 11:05:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195311.347960; Fri, 24 Sep 2021 11:05:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTj1Y-0001vS-8V; Fri, 24 Sep 2021 11:05:48 +0000
Received: by outflank-mailman (input) for mailman id 195311;
 Fri, 24 Sep 2021 11:05:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cs4H=OO=citrix.com=Kevin.Stefanov@srs-us1.protection.inumbo.net>)
 id 1mTj1W-0001vM-U3
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 11:05:46 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5d6c40f0-1d27-11ec-bac0-12813bfff9fa;
 Fri, 24 Sep 2021 11:05:45 +0000 (UTC)
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
X-Inumbo-ID: 5d6c40f0-1d27-11ec-bac0-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632481545;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=S/lyUAQUW4OkBE8yiINlYYf99gt7ImS4tR3CM7RQMgM=;
  b=TCXJuL5sgBJ/wwJjTOfwve0XnEykZpLlRrr6I0+Ym42Gfq7yGETXJZkY
   aSVh5v+Epuz6OGP46JKi7QYesUUFMmRV3cyDtrPbuJX8vo2toM3JzxErE
   jgVLbu/cvEob0ftC4AGX4UF5VLKNpO2rF2R79/6mpnnOVzU30E/k5GI9d
   Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: EIXpkoCH/Ri/lzEy6/7Z4GlyUaSrEh6IkhLDlVqAkqCtlMuKYkrvnz8TpOaKn44nggwoNDxZH7
 aWKsGqsK68LUNslZDPakfT2+J+Q79/GnuCHjTk/uGpVyeUQ9/1anXrOV+xg8jMyobF6WCMZCje
 zPLWlQUXGnjsS4yp9+YfzeFsMFHMMg+ZzFxjj+LwOjhKIk0nKHlLgnqP4xcBp2daRoeFyenGQb
 6K/sqmsN6PL0cTMbH2z6tF97bG086HoRe9ls4mGwCS544NMkGpJYxYXKOrD6kJ9mFiHL4Rj6mk
 gqE25Q1QwX3PwQcTgn8qyiMJ
X-SBRS: 5.1
X-MesageID: 53524765
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:0iXL/6s+e2T67fBZ92HNR3WTg+fnVJlZMUV32f8akzHdYApBsoF/q
 tZmKW7SOKmNYjP8ftB+aIq/oBsAvJXTzoM2GgRprH9gRSwU+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHpJZS5LwbZj29Y524ThWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplsqS+WDwGOKvwwe09WF58SAdhFo1k5+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DH44Bu3cm9i3UA/8gRo7rSKTW/95Imjw3g6iiGN6DP
 JdDNWUxMXwsZTVMJEVIUbkHxtvroXKmKBBH+FSyp404tj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKhAFNvSPxDyd6HWui+TT2yThV+o6BLC+s/JnnlCX7mgSEwENE0u2p+GjjUyzUM4ZL
 FYbkhfCtoBrqhbtFIOkGUTl/jjU5XbwRua8DcU90A+c8YXS5TrAD0gPCRoaTsMNlO0pEGlCO
 kCyo/vlAjlmsbuwQH2b96uJoT7aBRX5PVPudgdfElBYuYeLTJUby0uVF4c+TPfdYsjdRGmoq
 w1muhTSkFn6YSQj7Ky94VmPqDalvJGhouUdt1iPAzrNAu+UYueYi22UBbrzsaoowGWxFADpU
 J04dy62trtm4XalznDlfQn1NOv1j8tpyRWF6bKVI7Ev9i6251modp1K7Td1KS9Ba5hfI2OzO
 hKM5F8Nvve/2UdGi4ctOOpd7OxwkcDd+SnNDKiIPrKinLArHON4wM2eTRHJhD28+KTduao+J
 Y2aYa6R4YUyU8xaIM6Nb75Fi9cDn3lmrUuKHMyT50n3gNK2OS/OIZ9YYQTmUwzMxP7dyOkj2
 40EbJXiJtQ2eLCWXxQ7BqZJdg1VcShnW8qmwyGVH8baSjdb9KgaI6e56dscl0ZNxsy5T8/Eo
 SOwXFF20l36iSGVIAmGcCk7OrjuQYx+vTQwOil1ZQSk3H0qYICO6qYDdsRoIel7pbI7lfMkH
 eMYf8igA+hUTmiV8ToqcpSg/pdpcw6mhFzSMnP9MiQ/ZZNpWyfA5sTgIln07CALAyfu7Zk+r
 rSs2xn1W50GQwg+Xs/aZOj2lwG6vGQHmfI0VEzNe4EBdELp+YlsCirwkv5ofJ1cdUSdnmOXj
 l/EDw0ZqO/Bp54O3OPI3a3U/Z20F+ZeH1ZBGzWJ57iBKiSHrHGoxpVNUbjUcGmFBn/04qire
 c5c0+r4bK8chF9PvodxT+RrwKY564e9rrNW1F05TnDCblDtAbJ8OHiWm8JIs/QVlLNevAK3X
 GOJ+8VbZurVaJ+0TgZJKVp3dPmH2NEVhiLWvKY8L0jN7SNq+KaKDBdJNB6WhS0BdLZ4PevJG
 wv6VBL6P+BnticXDw==
IronPort-HdrOrdr: A9a23:lji7Kq8kmCLZ7ACUje9uk+DWI+orL9Y04lQ7vn2YSXRuE/Bw8P
 re+8jztCWE8Qr5N0tQ+uxoVJPufZq+z+8Q3WByB8bBYOCOggLBR+sOgbcKqweQfREWndQ86U
 4PScZD4aXLfD1Hsfo=
X-IronPort-AV: E=Sophos;i="5.85,319,1624334400"; 
   d="scan'208";a="53524765"
From: Kevin Stefanov <kevin.stefanov@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Kevin Stefanov <kevin.stefanov@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] tools/libxl: Remove page_size and page_shift from struct libxl_acpi_ctxt
Date: Fri, 24 Sep 2021 12:05:00 +0100
Message-ID: <20210924110500.25412-1-kevin.stefanov@citrix.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

As a result of recent work, two members of struct libxl_acpi_ctxt were
left with only one user. Thus, it becomes illogical for them to be
members of the struct at all.

Drop the two struct members and instead let the only function using
them have them as local variables.

Signed-off-by: Kevin Stefanov <kevin.stefanov@citrix.com>
---
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libs/light/libxl_x86_acpi.c | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/tools/libs/light/libxl_x86_acpi.c b/tools/libs/light/libxl_x86_acpi.c
index 57a6b63790..68902e7809 100644
--- a/tools/libs/light/libxl_x86_acpi.c
+++ b/tools/libs/light/libxl_x86_acpi.c
@@ -25,9 +25,6 @@
 struct libxl_acpi_ctxt {
     struct acpi_ctxt c;
 
-    unsigned int page_size;
-    unsigned int page_shift;
-
     /* Memory allocator */
     unsigned long guest_start;
     unsigned long guest_curr;
@@ -159,12 +156,13 @@ int libxl__dom_load_acpi(libxl__gc *gc,
     struct acpi_config config = {0};
     struct libxl_acpi_ctxt libxl_ctxt;
     int rc = 0, acpi_pages_num;
+    unsigned int page_size, page_shift;
 
     if (b_info->type != LIBXL_DOMAIN_TYPE_PVH)
         goto out;
 
-    libxl_ctxt.page_size = XC_DOM_PAGE_SIZE(dom);
-    libxl_ctxt.page_shift =  XC_DOM_PAGE_SHIFT(dom);
+    page_size = XC_DOM_PAGE_SIZE(dom);
+    page_shift = XC_DOM_PAGE_SHIFT(dom);
 
     libxl_ctxt.c.mem_ops.alloc = mem_alloc;
     libxl_ctxt.c.mem_ops.v2p = virt_to_phys;
@@ -176,20 +174,19 @@ int libxl__dom_load_acpi(libxl__gc *gc,
         goto out;
     }
 
-    config.rsdp = (unsigned long)libxl__malloc(gc, libxl_ctxt.page_size);
-    config.infop = (unsigned long)libxl__malloc(gc, libxl_ctxt.page_size);
+    config.rsdp = (unsigned long)libxl__malloc(gc, page_size);
+    config.infop = (unsigned long)libxl__malloc(gc, page_size);
     /* Pages to hold ACPI tables */
-    libxl_ctxt.buf = libxl__malloc(gc, NUM_ACPI_PAGES *
-                                   libxl_ctxt.page_size);
+    libxl_ctxt.buf = libxl__malloc(gc, NUM_ACPI_PAGES * page_size);
 
     /*
      * Set up allocator memory.
      * Start next to acpi_info page to avoid fracturing e820.
      */
     libxl_ctxt.guest_start = libxl_ctxt.guest_curr = libxl_ctxt.guest_end =
-        ACPI_INFO_PHYSICAL_ADDRESS + libxl_ctxt.page_size;
+        ACPI_INFO_PHYSICAL_ADDRESS + page_size;
 
-    libxl_ctxt.guest_end += NUM_ACPI_PAGES * libxl_ctxt.page_size;
+    libxl_ctxt.guest_end += NUM_ACPI_PAGES * page_size;
 
     /* Build the tables. */
     rc = acpi_build_tables(&libxl_ctxt.c, &config);
@@ -199,8 +196,8 @@ int libxl__dom_load_acpi(libxl__gc *gc,
     }
 
     /* Calculate how many pages are needed for the tables. */
-    acpi_pages_num = (ALIGN(libxl_ctxt.guest_curr, libxl_ctxt.page_size) -
-                      libxl_ctxt.guest_start) >> libxl_ctxt.page_shift;
+    acpi_pages_num = (ALIGN(libxl_ctxt.guest_curr, page_size) -
+                      libxl_ctxt.guest_start) >> page_shift;
 
     dom->acpi_modules[0].data = (void *)config.rsdp;
     dom->acpi_modules[0].length = 64;
@@ -212,7 +209,7 @@ int libxl__dom_load_acpi(libxl__gc *gc,
     if (strcmp(xc_dom_guest_os(dom), "linux") ||
         xc_dom_feature_get(dom, XENFEAT_linux_rsdp_unrestricted))
         dom->acpi_modules[0].guest_addr_out = ACPI_INFO_PHYSICAL_ADDRESS +
-            (1 + acpi_pages_num) * libxl_ctxt.page_size;
+            (1 + acpi_pages_num) * page_size;
     else
         dom->acpi_modules[0].guest_addr_out = 0x100000 - 64;
 
@@ -221,9 +218,9 @@ int libxl__dom_load_acpi(libxl__gc *gc,
     dom->acpi_modules[1].guest_addr_out = ACPI_INFO_PHYSICAL_ADDRESS;
 
     dom->acpi_modules[2].data = libxl_ctxt.buf;
-    dom->acpi_modules[2].length = acpi_pages_num  << libxl_ctxt.page_shift;
+    dom->acpi_modules[2].length = acpi_pages_num << page_shift;
     dom->acpi_modules[2].guest_addr_out = ACPI_INFO_PHYSICAL_ADDRESS +
-        libxl_ctxt.page_size;
+        page_size;
 
 out:
     return rc;
-- 
2.25.1


