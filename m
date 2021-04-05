Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C413543E4
	for <lists+xen-devel@lfdr.de>; Mon,  5 Apr 2021 17:57:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.105398.201789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTRbT-0002Hh-DE; Mon, 05 Apr 2021 15:57:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105398.201789; Mon, 05 Apr 2021 15:57:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTRbT-0002GD-66; Mon, 05 Apr 2021 15:57:27 +0000
Received: by outflank-mailman (input) for mailman id 105398;
 Mon, 05 Apr 2021 15:57:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lTRbR-0002D6-ES
 for xen-devel@lists.xenproject.org; Mon, 05 Apr 2021 15:57:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTRbQ-0002o2-JW; Mon, 05 Apr 2021 15:57:24 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTRbQ-00053b-B0; Mon, 05 Apr 2021 15:57:24 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=UP5LznC0lJpah31eRGW2Mg+D4mlUlr8pP6zrBCltxpg=; b=fKxVMUNl5gG7H5iOYrMWGq7B/
	4p1nXE90RFkkuduYWN53HB64IKH3pa5RMwTXxDTvi1CUAIJI2YKX22vcUSR5YKlWhBSGMgi5rFup0
	9yKFSloAfysJdwIXEO4F1qE29cF1ODgxDWlpwNnia2kgV1mV3qiiwtwcwRx5t4TsEmLBc=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 05/14] tools/libs: guest: Use const whenever we point to literal strings
Date: Mon,  5 Apr 2021 16:57:04 +0100
Message-Id: <20210405155713.29754-6-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210405155713.29754-1-julien@xen.org>
References: <20210405155713.29754-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

literal strings are not meant to be modified. So we should use const
*char rather than char * when we want to store a pointer to them.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 tools/include/xenguest.h            | 10 +++++-----
 tools/libs/guest/xg_dom_core.c      |  8 ++++----
 tools/libs/guest/xg_dom_elfloader.c |  4 ++--
 tools/libs/guest/xg_dom_hvmloader.c |  2 +-
 tools/libs/guest/xg_dom_x86.c       |  9 +++++----
 tools/libs/guest/xg_private.h       |  2 +-
 6 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index 217022b6e767..a4492038cf3a 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -108,7 +108,7 @@ struct xc_dom_image {
 
     /* info from (elf) kernel image */
     struct elf_dom_parms *parms;
-    char *guest_type;
+    const char *guest_type;
 
     /* memory layout */
     struct xc_dom_seg kernel_seg;
@@ -266,8 +266,8 @@ struct xc_dom_arch {
     /* arch-specific memory initialization. */
     int (*meminit) (struct xc_dom_image * dom);
 
-    char *guest_type;
-    char *native_protocol;
+    const char *guest_type;
+    const char *native_protocol;
     int page_shift;
     int sizeof_pfn;
     int p2m_base_supported;
@@ -374,9 +374,9 @@ char *xc_dom_strdup(struct xc_dom_image *dom, const char *str);
 
 /* --- alloc memory pool ------------------------------------------- */
 
-xen_pfn_t xc_dom_alloc_page(struct xc_dom_image *dom, char *name);
+xen_pfn_t xc_dom_alloc_page(struct xc_dom_image *dom, const char *name);
 int xc_dom_alloc_segment(struct xc_dom_image *dom,
-                         struct xc_dom_seg *seg, char *name,
+                         struct xc_dom_seg *seg, const char *name,
                          xen_vaddr_t start, xen_vaddr_t size);
 
 /* --- misc bits --------------------------------------------------- */
diff --git a/tools/libs/guest/xg_dom_core.c b/tools/libs/guest/xg_dom_core.c
index 98ef8e8fc9ca..4918ee517bdd 100644
--- a/tools/libs/guest/xg_dom_core.c
+++ b/tools/libs/guest/xg_dom_core.c
@@ -422,7 +422,7 @@ void *xc_dom_pfn_to_ptr_retcount(struct xc_dom_image *dom, xen_pfn_t pfn,
     struct xc_dom_phys *phys;
     xen_pfn_t offset;
     unsigned int page_shift = XC_DOM_PAGE_SHIFT(dom);
-    char *mode = "unset";
+    const char *mode = "unset";
 
     *count_out = 0;
 
@@ -525,7 +525,7 @@ void *xc_dom_pfn_to_ptr_retcount(struct xc_dom_image *dom, xen_pfn_t pfn,
     return phys->ptr;
 }
 
-static int xc_dom_chk_alloc_pages(struct xc_dom_image *dom, char *name,
+static int xc_dom_chk_alloc_pages(struct xc_dom_image *dom, const char *name,
                                   xen_pfn_t pages)
 {
     unsigned int page_size = XC_DOM_PAGE_SIZE(dom);
@@ -576,7 +576,7 @@ static int xc_dom_alloc_pad(struct xc_dom_image *dom, xen_vaddr_t boundary)
 }
 
 int xc_dom_alloc_segment(struct xc_dom_image *dom,
-                         struct xc_dom_seg *seg, char *name,
+                         struct xc_dom_seg *seg, const char *name,
                          xen_vaddr_t start, xen_vaddr_t size)
 {
     unsigned int page_size = XC_DOM_PAGE_SIZE(dom);
@@ -611,7 +611,7 @@ int xc_dom_alloc_segment(struct xc_dom_image *dom,
     return 0;
 }
 
-xen_pfn_t xc_dom_alloc_page(struct xc_dom_image *dom, char *name)
+xen_pfn_t xc_dom_alloc_page(struct xc_dom_image *dom, const char *name)
 {
     xen_vaddr_t start;
     xen_pfn_t pfn;
diff --git a/tools/libs/guest/xg_dom_elfloader.c b/tools/libs/guest/xg_dom_elfloader.c
index 06e713fe1119..0d6247db5d08 100644
--- a/tools/libs/guest/xg_dom_elfloader.c
+++ b/tools/libs/guest/xg_dom_elfloader.c
@@ -50,8 +50,8 @@ void xc_elf_set_logfile(xc_interface *xch, struct elf_binary *elf,
 
 /* ------------------------------------------------------------------------ */
 
-static char *xc_dom_guest_type(struct xc_dom_image *dom,
-                               struct elf_binary *elf)
+static const char *xc_dom_guest_type(struct xc_dom_image *dom,
+                                     struct elf_binary *elf)
 {
     uint64_t machine = elf_uval(elf, elf->ehdr, e_machine);
 
diff --git a/tools/libs/guest/xg_dom_hvmloader.c b/tools/libs/guest/xg_dom_hvmloader.c
index ec6ebad7fd52..4e6f30858a59 100644
--- a/tools/libs/guest/xg_dom_hvmloader.c
+++ b/tools/libs/guest/xg_dom_hvmloader.c
@@ -130,7 +130,7 @@ static elf_errorstatus xc_dom_parse_hvm_kernel(struct xc_dom_image *dom)
 
 static int module_init_one(struct xc_dom_image *dom,
                            struct xc_hvm_firmware_module *module,
-                           char *name)
+                           const char *name)
 {
     struct xc_dom_seg seg;
     void *dest;
diff --git a/tools/libs/guest/xg_dom_x86.c b/tools/libs/guest/xg_dom_x86.c
index 2953aeb90b35..e379b07f9945 100644
--- a/tools/libs/guest/xg_dom_x86.c
+++ b/tools/libs/guest/xg_dom_x86.c
@@ -1148,11 +1148,12 @@ static int vcpu_hvm(struct xc_dom_image *dom)
 
 /* ------------------------------------------------------------------------ */
 
-static int x86_compat(xc_interface *xch, uint32_t domid, char *guest_type)
+static int x86_compat(xc_interface *xch, uint32_t domid,
+                      const char *guest_type)
 {
     static const struct {
-        char           *guest;
-        uint32_t        size;
+        const char      *guest;
+        uint32_t       size;
     } types[] = {
         { "xen-3.0-x86_32p", 32 },
         { "xen-3.0-x86_64",  64 },
@@ -1664,7 +1665,7 @@ static int bootearly(struct xc_dom_image *dom)
 static int bootlate_pv(struct xc_dom_image *dom)
 {
     static const struct {
-        char *guest;
+        const char *guest;
         unsigned long pgd_type;
     } types[] = {
         { "xen-3.0-x86_32",  MMUEXT_PIN_L2_TABLE},
diff --git a/tools/libs/guest/xg_private.h b/tools/libs/guest/xg_private.h
index 8f9b257a2f3d..25e46d7ce195 100644
--- a/tools/libs/guest/xg_private.h
+++ b/tools/libs/guest/xg_private.h
@@ -43,7 +43,7 @@
 #endif
 
 struct xc_dom_loader {
-    char *name;
+    const char *name;
     /* Sadly the error returns from these functions are not consistent: */
     elf_negerrnoval (*probe) (struct xc_dom_image * dom);
     elf_negerrnoval (*parser) (struct xc_dom_image * dom);
-- 
2.17.1


