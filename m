Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9BEAB87D8
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 15:23:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985410.1371390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYYB-0003HA-1j; Thu, 15 May 2025 13:23:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985410.1371390; Thu, 15 May 2025 13:23:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYYA-0003FZ-V7; Thu, 15 May 2025 13:23:02 +0000
Received: by outflank-mailman (input) for mailman id 985410;
 Thu, 15 May 2025 13:23:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WRi0=X7=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1uFYY9-0003FO-Qr
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 13:23:01 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8718002-318f-11f0-9eb6-5ba50f476ded;
 Thu, 15 May 2025 15:23:00 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 174731520599024.49651166654428;
 Thu, 15 May 2025 06:20:05 -0700 (PDT)
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
X-Inumbo-ID: b8718002-318f-11f0-9eb6-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; t=1747315208; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dV1p4NYjrYg/Vnx5/k3yl+dgPiaquQyz36AD5QxaXuIjQCdRAraLFfpHybW83+wnUGkZsVUPYoLoMA5IYnd6k150YXu8UPrOKmGO1I5jF+eV9pcEAXpq7EOG5uVYj7cmRUBPAia+Bi3hmYLyab/YTL4ISvaTxW8SDMY9t0Wo1sU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747315208; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=imigURWHglyWIuq1A0YkYk/udC9gzexmxl5Bel/xCFE=; 
	b=HK8kM3SgmQK4el2y3e/8lj42h8DqjNzhdzFlFkC0VJM2WekmXG9kfQCMF2yeuauvAUngyxHgSmK+4cZfPRPSdaU8XQ3+sTk5j1Na04EQDsEsjiRtuIcc2bJZ+VrfC4yUzWAzPD+iWpQsn5TGnYI6ZUwWDb+jDADMePMTSrlDOpY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747315208;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=imigURWHglyWIuq1A0YkYk/udC9gzexmxl5Bel/xCFE=;
	b=Hjok7mmJZNP8X5xQ386/sN4YX5jMO0U1dJbH74qHVr7fyI/jaCLu3OcxpsJgaWzV
	cjY9CGfG2glrvJdguvWYc0RmEJd2rGnJmsrcwrPhe3wyHS3qZkH+BkZxEZbqLyS5C9R
	ZgcDpCcex15UEWtPRUWmzTA+OIxgtek8ErNWeGIg=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFCv2 32/38] x86/hyperlaunch: move headroom under domain builder
Date: Thu, 15 May 2025 09:19:44 -0400
Message-Id: <20250515131951.5594-3-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250515131951.5594-1-dpsmith@apertussolutions.com>
References: <20250515131951.5594-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The function bzimage_headroom attempted to determine the necessary headroom for
all supported kernel types, not just bzImage. The result was convoluted logic
to handle three kernel image types, and then within the bzImage type, also
handle three types of payloads.

This commit moves the generalized headroom determination for the three kernel
types to the domain builder and scopes bziamge_headroom to only doing headroom
calculations for bzimage payload types.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/bzimage.c                    | 43 +++++++++++------------
 xen/arch/x86/domain-builder/domain.c      | 24 +++++++++++++
 xen/arch/x86/include/asm/bzimage.h        |  1 +
 xen/arch/x86/include/asm/domain-builder.h |  2 ++
 xen/arch/x86/setup.c                      |  6 ++--
 xen/include/xen/gunzip.h                  |  9 +++++
 6 files changed, 58 insertions(+), 27 deletions(-)

diff --git a/xen/arch/x86/bzimage.c b/xen/arch/x86/bzimage.c
index eaea64b9c014..ba090b3ef9d6 100644
--- a/xen/arch/x86/bzimage.c
+++ b/xen/arch/x86/bzimage.c
@@ -47,8 +47,10 @@ struct __packed setup_header {
         uint32_t        payload_length;
     };
 
-static __init int bzimage_check(struct setup_header *hdr, unsigned long len)
+int __init bzimage_check(void *image, unsigned long len)
 {
+    struct setup_header *hdr = (struct setup_header *)image;
+
     if ( len < sizeof(struct setup_header) )
         return 0;
 
@@ -56,9 +58,10 @@ static __init int bzimage_check(struct setup_header *hdr, unsigned long len)
         return 0;
 
     if ( hdr->version < VERSION(2,8) ) {
-        printk("Cannot load bzImage v%d.%02d at least v2.08 is required\n",
-           hdr->version >> 8, hdr->version & 0xff);
-        return -EINVAL;
+        printk(XENLOG_ERR
+               "Cannot load bzImage v%d.%02d at least v2.08 is required\n",
+               hdr->version >> 8, hdr->version & 0xff);
+        return 0;
     }
     return 1;
 }
@@ -69,34 +72,28 @@ unsigned long __init bzimage_headroom(void *image_start,
                                       unsigned long image_length)
 {
     struct setup_header *hdr = (struct setup_header *)image_start;
-    int err;
     unsigned long headroom;
 
-    err = bzimage_check(hdr, image_length);
-    if ( err < 0 )
-        return 0;
-
-    if ( err > 0 )
-    {
-        image_start += (hdr->setup_sects + 1) * 512 + hdr->payload_offset;
-        image_length = hdr->payload_length;
-    }
-
-    if ( elf_is_elfbinary(image_start, image_length) )
-        return 0;
+    image_start += (hdr->setup_sects + 1) * 512 + hdr->payload_offset;
+    image_length = hdr->payload_length;
 
     orig_image_len = image_length;
     /* Linux build system mimics gzip isize field for bzip2/lzma algos */
     headroom = gzip_isize(image_start, image_length);
+    /*
+     * Final headroom:
+     *  - gzip: original size + heuristically derived value
+     *  - uncompressed kernel: zero the headroom
+     *  - bzip2 & lzma: original size + payload size
+     */
     if (gzip_check(image_start, image_length))
-    {
-        headroom += headroom >> 12; /* Add 8 bytes for every 32K input block */
-        headroom += (32768 + 18); /* Add 32K + 18 bytes of extra headroom */
-    } else
+        headroom = gzip_headroom(headroom);
+    else if ( elf_is_elfbinary(image_start, image_length) )
+        headroom = 0;
+    else
         headroom += image_length;
-    headroom = (headroom + 4095) & ~4095;
 
-    return headroom;
+    return ROUNDUP(headroom, PAGE_SIZE);
 }
 
 int __init bzimage_parse(void *image_base, void **image_start,
diff --git a/xen/arch/x86/domain-builder/domain.c b/xen/arch/x86/domain-builder/domain.c
index 673fc5b16ed3..9c2f30eee8bd 100644
--- a/xen/arch/x86/domain-builder/domain.c
+++ b/xen/arch/x86/domain-builder/domain.c
@@ -9,6 +9,7 @@
 #include <xen/err.h>
 #include <xen/event.h>
 #include <xen/grant_table.h>
+#include <xen/gunzip.h>
 #include <xen/init.h>
 #include <xen/lib.h> /* get types.h for libefl.h */
 #include <xen/libelf.h>
@@ -20,6 +21,7 @@
 #include <public/hvm/params.h>
 
 #include <asm/bootinfo.h>
+#include <asm/bzimage.h>
 #include <asm/cpu-policy.h>
 #include <asm/dom0_build.h>
 #include <asm/domain-builder.h>
@@ -247,6 +249,28 @@ static size_t __init domain_cmdline_size(const struct boot_info *bi,
     return s;
 }
 
+/* Xen x86 supports two kernel types that requires headroom:
+ *  - Linux bzImage
+ *  - Linux vmlinuz aka vmlinux.gz
+ */
+void __init arch_builder_headroom(struct boot_domain *bd)
+{
+    void *image = bootstrap_map_bm(bd->kernel);
+    unsigned long length = bd->kernel->size;
+
+    if ( bzimage_check(image, length) )
+        bd->kernel->headroom = bzimage_headroom(image, length);
+    else if ( gzip_check(image, length) )
+    {
+        unsigned long headroom = gzip_isize(image, length);
+        bd->kernel->headroom = gzip_headroom(headroom);
+    }
+    else
+        bd->kernel->headroom = 0;
+
+    bootstrap_unmap();
+}
+
 struct domain *__init arch_create_dom(
     struct boot_info *bi, struct boot_domain *bd)
 {
diff --git a/xen/arch/x86/include/asm/bzimage.h b/xen/arch/x86/include/asm/bzimage.h
index 7ed69d39103d..c3a042f177ac 100644
--- a/xen/arch/x86/include/asm/bzimage.h
+++ b/xen/arch/x86/include/asm/bzimage.h
@@ -3,6 +3,7 @@
 
 #include <xen/init.h>
 
+int bzimage_check(void *image, unsigned long len);
 unsigned long bzimage_headroom(void *image_start, unsigned long image_length);
 
 int bzimage_parse(void *image_base, void **image_start,
diff --git a/xen/arch/x86/include/asm/domain-builder.h b/xen/arch/x86/include/asm/domain-builder.h
index 6ef4776faf9a..f1749d2786c6 100644
--- a/xen/arch/x86/include/asm/domain-builder.h
+++ b/xen/arch/x86/include/asm/domain-builder.h
@@ -20,6 +20,8 @@ int hvm_alloc_xenstore_page(struct boot_domain *bd, xen_pfn_t *xs_gfn);
 unsigned long dom_paging_pages(
     const struct boot_domain *d, unsigned long nr_pages);
 
+void arch_builder_headroom(struct boot_domain *bd);
+
 unsigned long dom_compute_nr_pages(
     struct boot_domain *bd, struct elf_dom_parms *parms);
 
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index b2c7846be18f..36e6ba11ddcd 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -38,6 +38,7 @@
 #include <asm/bzimage.h>
 #include <asm/cpu-policy.h>
 #include <asm/desc.h>
+#include <asm/domain-builder.h>
 #include <asm/e820.h>
 #include <asm/edd.h>
 #include <asm/genapic.h>
@@ -1330,10 +1331,7 @@ void asmlinkage __init noreturn __start_xen(void)
         xen->size  = __2M_rwdata_end - _stext;
     }
 
-    bi->domains[0].kernel->headroom =
-        bzimage_headroom(bootstrap_map_bm(bi->domains[0].kernel),
-                         bi->domains[0].kernel->size);
-    bootstrap_unmap();
+    arch_builder_headroom(&bi->domains[0]);
 
 #ifndef highmem_start
     /* Don't allow split below 4Gb. */
diff --git a/xen/include/xen/gunzip.h b/xen/include/xen/gunzip.h
index 1b45350c195f..c8a0d59eef9d 100644
--- a/xen/include/xen/gunzip.h
+++ b/xen/include/xen/gunzip.h
@@ -1,10 +1,19 @@
 #ifndef __XEN_GUNZIP_H
 #define __XEN_GUNZIP_H
 
+#include <xen/macros.h>
+#include <xen/page-size.h>
 #include <xen/types.h>
 
 int gzip_check(char *image, unsigned long image_len);
 uint32_t gzip_isize(char *image, unsigned long image_len);
 int perform_gunzip(char *output, char *image, unsigned long image_len);
 
+static inline unsigned long gzip_headroom(unsigned long headroom)
+{
+    headroom += headroom >> 12; /* Add 8 bytes for every 32K input block */
+    headroom += (32768 + 18); /* Add 32K + 18 bytes of extra headroom */
+
+    return ROUNDUP(headroom, PAGE_SIZE);
+}
 #endif
-- 
2.30.2


