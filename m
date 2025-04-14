Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE74A887DD
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 17:57:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950716.1346997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4MB5-0001Hr-3h; Mon, 14 Apr 2025 15:56:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950716.1346997; Mon, 14 Apr 2025 15:56:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4MB4-0001AM-QR; Mon, 14 Apr 2025 15:56:54 +0000
Received: by outflank-mailman (input) for mailman id 950716;
 Mon, 14 Apr 2025 15:56:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YdIb=XA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u4MB3-0008KQ-4Q
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 15:56:53 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14c5f803-1949-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 17:56:52 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5e6c18e2c7dso8470894a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 08:56:52 -0700 (PDT)
Received: from fedora.. (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1cb4288sm951760866b.96.2025.04.14.08.56.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 08:56:50 -0700 (PDT)
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
X-Inumbo-ID: 14c5f803-1949-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744646211; x=1745251011; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ZZ/u0hxjggT9kUQsInM8UwdJHGGhdTplVjxpUlrRZk=;
        b=QHaZhUwjCxxz3GyKnxMKs8NUkScPzUNNFQDJSvVszHDW99aDzlSVGQccG1Zr+2ZdI/
         A+UOixBhmkdIGLcfGU3o671Y7pTVCzUOdS5g38AI2BXo7+DCyuGhytnUCua/pQa6suxs
         XQiRMYzbjf+YpktwvOjruya2QWKTRAWGAmkIm8IdvA5c5mP743wYdH5Wy5YQnZh8X/TZ
         WPYodScLcOjmnRfBKrGfjvvGRlxW+IBlVmTt+f6MAFyclqUBoPgYn43nQ+hLj500k9TX
         fuIMMBDn5EqFZ+eS182GsaTLkfNa0r0y28TL/ZTNBBLR7UXslUo65eXiOxSFdeU5jdjg
         fbIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744646211; x=1745251011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ZZ/u0hxjggT9kUQsInM8UwdJHGGhdTplVjxpUlrRZk=;
        b=kKqGMCgMzVYTS9acDZJNnXbHHBl7IDSwF0RXoO6vMGXe13EGGc3MZdsigIPpCHanXJ
         XDT7pVD1UBf50yJuZPZYgY9pi6gci7XIZxT4lcTmAxL48/Ljn116UJt8/d0k7z7zFGxg
         +pa5Y/Tm0axBjywz+bXfwMiBYug5USZD2h866mTnb8mdc0IAfA8OMojKKU2s33iZUe4e
         /76vNIvgfjQHIZfahFhY7G4jlQztE06bw0OZI0/wf+LIigHLOxCSZV++DK32hKMLkxn8
         bfkA+VdjfR4QXZhYpzhU+uRPwPQAPI1z3QIhZbWtmUC2SsWE2srD10Px3JDyzM2wVuQQ
         PDDA==
X-Gm-Message-State: AOJu0Yxo+OWSM9wxS7+RrtwZQWpYSPVVSNOaDvMF8f+VVnF/QdsFvIaD
	ICG7d20zPaX+jQvPpkqArQn3nWQdrzcfx6EGw+ZJireKwge6nzcnECeu4w==
X-Gm-Gg: ASbGncvUgcJ1jClhBA6KFGT5+nyDNv/gnNfPLazkZN61lNeWhrA4yYzNjczAsy7dHdl
	AMGnrKYUvnwBKKGGopBu6vvDHvS/E3eqvVKLbpipX5I7GOeLB1lByuz/2h1X1MEK9YZN3efu+tg
	I90H+5UOtPJ5exwJAGaoiJLKTe6vM56CzxMszt6UDBFcz2yuy9lSzZ0hhCfobblyl4IYNZ2iez7
	SKWO+O6QuPcNdjvyBfyCFzrz/lYE6dElHwZhU8HrhGoNyEtbP/maFXK/WMs0Lx+HsARR869t4Yv
	Anqmn45XiObtk4a3U5Hc6dQD96jlI0oPeO+QXtYPBIYtVygwrDTowaVqkizRtK7UoMHQpY81Gi4
	Vthk7gNlIHg==
X-Google-Smtp-Source: AGHT+IEeNfVxBgh4tiqFXnMpNZk7El2K59Ap6eo71j00Ua28M7HCHIXAxo/7YFQ1dSrQkC+kkdkEzw==
X-Received: by 2002:a17:907:fd0e:b0:aca:de15:f2ad with SMTP id a640c23a62f3a-acade15fc19mr899424566b.60.1744646211037;
        Mon, 14 Apr 2025 08:56:51 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 6/8] xen/common: dom0less: introduce common kernel.c
Date: Mon, 14 Apr 2025 17:56:39 +0200
Message-ID: <beb65be894965d74eac803baac1a9c72caee2b16.1744626032.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744626032.git.oleksii.kurochko@gmail.com>
References: <cover.1744626032.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following functions don't have arch specific things so it is moved to
common:
- kernel_prboe()
- kernel_load()
- output_length()

Functions necessary for dom0less are only moved.

The following changes are done:
- Swap __init and return type of kernel_decompress() function to be
  consistent with defintions of functions in other files. The same
  for output_length().
- Wrap by "ifdef CONFIG_ARM" the call of kernel_uimage_probe() in
  kernel_probe() as uImage isn't really used nowadays thereby leave
  kernel_uimage_probe() call here just for compatability with Arm code.
- Introduce kernel_zimage_probe() to cover the case that arch can have
  different zimage header.
- Add ASSERT() for kernel_load() to check that it argument isn't NULL.
- Make kernel_uimage_probe() non-static in Arm's code as it is used in
  common/kernel.c.

Introduce CONFIG_DOMAIN_BUILD_HELPERS to not provide stubs for archs
which don't provide enough functionality to enable it.
Select CONFIG_DOMAIN_BUILD_HELPERS for CONFIG_ARM as only Arm supports
it, at the moment.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Change in v2:
 - Drop inclusion of asm/kernel.h in kernel.c as everything necessary has
   been moved to xen/fdt-kernel.h.
---
 xen/arch/arm/Kconfig            |   1 +
 xen/arch/arm/kernel.c           | 221 +----------------------------
 xen/common/Kconfig              |   9 +-
 xen/common/device-tree/Makefile |   1 +
 xen/common/device-tree/kernel.c | 242 ++++++++++++++++++++++++++++++++
 xen/include/xen/fdt-kernel.h    |  13 ++
 6 files changed, 271 insertions(+), 216 deletions(-)
 create mode 100644 xen/common/device-tree/kernel.c

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 060389c3c8..d63c0dc669 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -11,6 +11,7 @@ config ARM_64
 
 config ARM
 	def_bool y
+	select DOMAIN_BUILD_HELPERS
 	select FUNCTION_ALIGNMENT_4B
 	select GENERIC_UART_INIT
 	select HAS_ALTERNATIVE if HAS_VMAP
diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
index 164f417e75..1a5ae4b95c 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -161,105 +161,6 @@ static void __init kernel_zimage_load(struct kernel_info *info)
     iounmap(kernel);
 }
 
-static __init uint32_t output_length(char *image, unsigned long image_len)
-{
-    return *(uint32_t *)&image[image_len - 4];
-}
-
-static __init int kernel_decompress(struct bootmodule *mod, uint32_t offset)
-{
-    char *output, *input;
-    char magic[2];
-    int rc;
-    unsigned int kernel_order_out;
-    paddr_t output_size;
-    struct page_info *pages;
-    mfn_t mfn;
-    int i;
-    paddr_t addr = mod->start;
-    paddr_t size = mod->size;
-
-    if ( size < offset )
-        return -EINVAL;
-
-    /*
-     * It might be that gzip header does not appear at the start address
-     * (e.g. in case of compressed uImage) so take into account offset to
-     * gzip header.
-     */
-    addr += offset;
-    size -= offset;
-
-    if ( size < 2 )
-        return -EINVAL;
-
-    copy_from_paddr(magic, addr, sizeof(magic));
-
-    /* only gzip is supported */
-    if ( !gzip_check(magic, size) )
-        return -EINVAL;
-
-    input = ioremap_cache(addr, size);
-    if ( input == NULL )
-        return -EFAULT;
-
-    output_size = output_length(input, size);
-    kernel_order_out = get_order_from_bytes(output_size);
-    pages = alloc_domheap_pages(NULL, kernel_order_out, 0);
-    if ( pages == NULL )
-    {
-        iounmap(input);
-        return -ENOMEM;
-    }
-    mfn = page_to_mfn(pages);
-    output = vmap_contig(mfn, 1 << kernel_order_out);
-
-    rc = perform_gunzip(output, input, size);
-    clean_dcache_va_range(output, output_size);
-    iounmap(input);
-    vunmap(output);
-
-    if ( rc )
-    {
-        free_domheap_pages(pages, kernel_order_out);
-        return rc;
-    }
-
-    mod->start = page_to_maddr(pages);
-    mod->size = output_size;
-
-    /*
-     * Need to free pages after output_size here because they won't be
-     * freed by discard_initial_modules
-     */
-    i = PFN_UP(output_size);
-    for ( ; i < (1 << kernel_order_out); i++ )
-        free_domheap_page(pages + i);
-
-    /*
-     * When using static heap feature, don't give bootmodules memory back to
-     * the heap allocator
-     */
-    if ( using_static_heap )
-        return 0;
-
-    /*
-     * When freeing the kernel, we need to pass the module start address and
-     * size as they were before taking an offset to gzip header into account,
-     * so that the entire region will be freed.
-     */
-    addr -= offset;
-    size += offset;
-
-    /*
-     * Free the original kernel, update the pointers to the
-     * decompressed kernel
-     */
-    fw_unreserved_regions(addr, addr + size, init_domheap_pages, 0);
-
-    return 0;
-}
-
 /*
  * Uimage CPU Architecture Codes
  */
@@ -272,8 +173,8 @@ static __init int kernel_decompress(struct bootmodule *mod, uint32_t offset)
 /*
  * Check if the image is a uImage and setup kernel_info
  */
-static int __init kernel_uimage_probe(struct kernel_info *info,
-                                      struct bootmodule *mod)
+int __init kernel_uimage_probe(struct kernel_info *info,
+                               struct bootmodule *mod)
 {
     struct {
         __be32 magic;   /* Image Header Magic Number */
@@ -503,130 +404,20 @@ static int __init kernel_zimage32_probe(struct kernel_info *info,
     return 0;
 }
 
-int __init kernel_probe(struct kernel_info *info,
-                        const struct dt_device_node *domain)
+int __init kernel_zimage_probe(struct kernel_info *info, paddr_t addr,
+                               paddr_t size)
 {
-    struct bootmodule *mod = NULL;
-    struct bootcmdline *cmd = NULL;
-    struct dt_device_node *node;
-    u64 kernel_addr, initrd_addr, dtb_addr, size;
     int rc;
 
-    /*
-     * We need to initialize start to 0. This field may be populated during
-     * kernel_xxx_probe() if the image has a fixed entry point (for e.g.
-     * uimage.ep).
-     * We will use this to determine if the image has a fixed entry point or
-     * the load address should be used as the start address.
-     */
-    info->entry = 0;
-
-    /* domain is NULL only for the hardware domain */
-    if ( domain == NULL )
-    {
-        ASSERT(is_hardware_domain(info->d));
-
-        mod = boot_module_find_by_kind(BOOTMOD_KERNEL);
-
-        info->kernel_bootmodule = mod;
-        info->initrd_bootmodule = boot_module_find_by_kind(BOOTMOD_RAMDISK);
-
-        cmd = boot_cmdline_find_by_kind(BOOTMOD_KERNEL);
-        if ( cmd )
-            info->cmdline = &cmd->cmdline[0];
-    }
-    else
-    {
-        const char *name = NULL;
-
-        dt_for_each_child_node(domain, node)
-        {
-            if ( dt_device_is_compatible(node, "multiboot,kernel") )
-            {
-                u32 len;
-                const __be32 *val;
-
-                val = dt_get_property(node, "reg", &len);
-                dt_get_range(&val, node, &kernel_addr, &size);
-                mod = boot_module_find_by_addr_and_kind(
-                        BOOTMOD_KERNEL, kernel_addr);
-                info->kernel_bootmodule = mod;
-            }
-            else if ( dt_device_is_compatible(node, "multiboot,ramdisk") )
-            {
-                u32 len;
-                const __be32 *val;
-
-                val = dt_get_property(node, "reg", &len);
-                dt_get_range(&val, node, &initrd_addr, &size);
-                info->initrd_bootmodule = boot_module_find_by_addr_and_kind(
-                        BOOTMOD_RAMDISK, initrd_addr);
-            }
-            else if ( dt_device_is_compatible(node, "multiboot,device-tree") )
-            {
-                uint32_t len;
-                const __be32 *val;
-
-                val = dt_get_property(node, "reg", &len);
-                if ( val == NULL )
-                    continue;
-                dt_get_range(&val, node, &dtb_addr, &size);
-                info->dtb_bootmodule = boot_module_find_by_addr_and_kind(
-                        BOOTMOD_GUEST_DTB, dtb_addr);
-            }
-            else
-                continue;
-        }
-        name = dt_node_name(domain);
-        cmd = boot_cmdline_find_by_name(name);
-        if ( cmd )
-            info->cmdline = &cmd->cmdline[0];
-    }
-    if ( !mod || !mod->size )
-    {
-        printk(XENLOG_ERR "Missing kernel boot module?\n");
-        return -ENOENT;
-    }
-
-    printk("Loading %pd kernel from boot module @ %"PRIpaddr"\n",
-           info->d, info->kernel_bootmodule->start);
-    if ( info->initrd_bootmodule )
-        printk("Loading ramdisk from boot module @ %"PRIpaddr"\n",
-               info->initrd_bootmodule->start);
-
-    /*
-     * uImage header always appears at the top of the image (even compressed),
-     * so it needs to be probed first. Note that in case of compressed uImage,
-     * kernel_decompress is called from kernel_uimage_probe making the function
-     * self-containing (i.e. fall through only in case of a header not found).
-     */
-    rc = kernel_uimage_probe(info, mod);
-    if ( rc != -ENOENT )
-        return rc;
-
-    /*
-     * If it is a gzip'ed image, 32bit or 64bit, uncompress it.
-     * At this point, gzip header appears (if at all) at the top of the image,
-     * so pass 0 as an offset.
-     */
-    rc = kernel_decompress(mod, 0);
-    if ( rc && rc != -EINVAL )
-        return rc;
-
 #ifdef CONFIG_ARM_64
-    rc = kernel_zimage64_probe(info, mod->start, mod->size);
+    rc = kernel_zimage64_probe(info, addr, size);
     if (rc < 0)
 #endif
-        rc = kernel_zimage32_probe(info, mod->start, mod->size);
+        rc = kernel_zimage32_probe(info, addr, size);
 
     return rc;
 }
 
-void __init kernel_load(struct kernel_info *info)
-{
-    info->load(info);
-}
-
 /*
  * Local variables:
  * mode: C
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 2fd79aea5b..b2f915c429 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -14,13 +14,20 @@ config CORE_PARKING
 
 config DOM0LESS_BOOT
 	bool "Dom0less boot support" if EXPERT
-	depends on HAS_DOM0LESS
+	depends on HAS_DOM0LESS && DOMAIN_BUILD_HELPERS
 	default y
 	help
 	  Dom0less boot support enables Xen to create and start domU guests during
 	  Xen boot without the need of a control domain (Dom0), which could be
 	  present anyway.
 
+config DOMAIN_BUILD_HELPERS
+	bool
+	help
+	  Introduce functions necessary for working with domain creation, kernel,
+	  etc. As an examples, these type of functions are going to be used by
+	  CONFIG_DOM0LESS_BOOT.
+
 config GRANT_TABLE
 	bool "Grant table support" if EXPERT
 	default y
diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
index f3dafc9b81..e88a4d5799 100644
--- a/xen/common/device-tree/Makefile
+++ b/xen/common/device-tree/Makefile
@@ -4,3 +4,4 @@ obj-y += device-tree.o
 obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-build.o
 obj-$(CONFIG_OVERLAY_DTB) += dt-overlay.o
 obj-y += intc.o
+obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += kernel.o
diff --git a/xen/common/device-tree/kernel.c b/xen/common/device-tree/kernel.c
new file mode 100644
index 0000000000..1bf3bbf64e
--- /dev/null
+++ b/xen/common/device-tree/kernel.c
@@ -0,0 +1,242 @@
+#include <xen/bootfdt.h>
+#include <xen/device_tree.h>
+#include <xen/fdt-kernel.h>
+#include <xen/errno.h>
+#include <xen/gunzip.h>
+#include <xen/init.h>
+#include <xen/lib.h>
+#include <xen/mm.h>
+#include <xen/pfn.h>
+#include <xen/sched.h>
+#include <xen/types.h>
+#include <xen/vmap.h>
+
+#include <asm/page.h>
+#include <asm/setup.h>
+
+static uint32_t __init output_length(char *image, unsigned long image_len)
+{
+    return *(uint32_t *)&image[image_len - 4];
+}
+
+int __init kernel_decompress(struct bootmodule *mod, uint32_t offset)
+{
+    char *output, *input;
+    char magic[2];
+    int rc;
+    unsigned int kernel_order_out;
+    paddr_t output_size;
+    struct page_info *pages;
+    mfn_t mfn;
+    int i;
+    paddr_t addr = mod->start;
+    paddr_t size = mod->size;
+
+    if ( size < offset )
+        return -EINVAL;
+
+    /*
+     * It might be that gzip header does not appear at the start address
+     * (e.g. in case of compressed uImage) so take into account offset to
+     * gzip header.
+     */
+    addr += offset;
+    size -= offset;
+
+    if ( size < 2 )
+        return -EINVAL;
+
+    copy_from_paddr(magic, addr, sizeof(magic));
+
+    /* only gzip is supported */
+    if ( !gzip_check(magic, size) )
+        return -EINVAL;
+
+    input = ioremap_cache(addr, size);
+    if ( input == NULL )
+        return -EFAULT;
+
+    output_size = output_length(input, size);
+    kernel_order_out = get_order_from_bytes(output_size);
+    pages = alloc_domheap_pages(NULL, kernel_order_out, 0);
+    if ( pages == NULL )
+    {
+        iounmap(input);
+        return -ENOMEM;
+    }
+    mfn = page_to_mfn(pages);
+    output = vmap_contig(mfn, 1 << kernel_order_out);
+
+    rc = perform_gunzip(output, input, size);
+    clean_dcache_va_range(output, output_size);
+    iounmap(input);
+    vunmap(output);
+
+    if ( rc )
+    {
+        free_domheap_pages(pages, kernel_order_out);
+        return rc;
+    }
+
+    mod->start = page_to_maddr(pages);
+    mod->size = output_size;
+
+    /*
+     * Need to free pages after output_size here because they won't be
+     * freed by discard_initial_modules
+     */
+    i = PFN_UP(output_size);
+    for ( ; i < (1 << kernel_order_out); i++ )
+        free_domheap_page(pages + i);
+
+    /*
+     * When using static heap feature, don't give bootmodules memory back to
+     * the heap allocator
+     */
+    if ( using_static_heap )
+        return 0;
+
+    /*
+     * When freeing the kernel, we need to pass the module start address and
+     * size as they were before taking an offset to gzip header into account,
+     * so that the entire region will be freed.
+     */
+    addr -= offset;
+    size += offset;
+
+    /*
+     * Free the original kernel, update the pointers to the
+     * decompressed kernel
+     */
+    fw_unreserved_regions(addr, addr + size, init_domheap_pages, 0);
+
+    return 0;
+}
+
+int __init kernel_probe(struct kernel_info *info,
+                        const struct dt_device_node *domain)
+{
+    struct bootmodule *mod = NULL;
+    struct bootcmdline *cmd = NULL;
+    struct dt_device_node *node;
+    u64 kernel_addr, initrd_addr, dtb_addr, size;
+    int rc;
+
+    /*
+     * We need to initialize start to 0. This field may be populated during
+     * kernel_xxx_probe() if the image has a fixed entry point (for e.g.
+     * uimage.ep).
+     * We will use this to determine if the image has a fixed entry point or
+     * the load address should be used as the start address.
+     */
+    info->entry = 0;
+
+    /* domain is NULL only for the hardware domain */
+    if ( domain == NULL )
+    {
+        ASSERT(is_hardware_domain(info->d));
+
+        mod = boot_module_find_by_kind(BOOTMOD_KERNEL);
+
+        info->kernel_bootmodule = mod;
+        info->initrd_bootmodule = boot_module_find_by_kind(BOOTMOD_RAMDISK);
+
+        cmd = boot_cmdline_find_by_kind(BOOTMOD_KERNEL);
+        if ( cmd )
+            info->cmdline = &cmd->cmdline[0];
+    }
+    else
+    {
+        const char *name = NULL;
+
+        dt_for_each_child_node(domain, node)
+        {
+            if ( dt_device_is_compatible(node, "multiboot,kernel") )
+            {
+                u32 len;
+                const __be32 *val;
+
+                val = dt_get_property(node, "reg", &len);
+                dt_get_range(&val, node, &kernel_addr, &size);
+                mod = boot_module_find_by_addr_and_kind(
+                        BOOTMOD_KERNEL, kernel_addr);
+                info->kernel_bootmodule = mod;
+            }
+            else if ( dt_device_is_compatible(node, "multiboot,ramdisk") )
+            {
+                u32 len;
+                const __be32 *val;
+
+                val = dt_get_property(node, "reg", &len);
+                dt_get_range(&val, node, &initrd_addr, &size);
+                info->initrd_bootmodule = boot_module_find_by_addr_and_kind(
+                        BOOTMOD_RAMDISK, initrd_addr);
+            }
+            else if ( dt_device_is_compatible(node, "multiboot,device-tree") )
+            {
+                uint32_t len;
+                const __be32 *val;
+
+                val = dt_get_property(node, "reg", &len);
+                if ( val == NULL )
+                    continue;
+                dt_get_range(&val, node, &dtb_addr, &size);
+                info->dtb_bootmodule = boot_module_find_by_addr_and_kind(
+                        BOOTMOD_GUEST_DTB, dtb_addr);
+            }
+            else
+                continue;
+        }
+        name = dt_node_name(domain);
+        cmd = boot_cmdline_find_by_name(name);
+        if ( cmd )
+            info->cmdline = &cmd->cmdline[0];
+    }
+    if ( !mod || !mod->size )
+    {
+        printk(XENLOG_ERR "Missing kernel boot module?\n");
+        return -ENOENT;
+    }
+
+    printk("Loading %pd kernel from boot module @ %"PRIpaddr"\n",
+           info->d, info->kernel_bootmodule->start);
+    if ( info->initrd_bootmodule )
+        printk("Loading ramdisk from boot module @ %"PRIpaddr"\n",
+               info->initrd_bootmodule->start);
+
+    /*
+     * uImage isn't really used nowadays thereby leave kernel_uimage_probe()
+     * call here just for compatability with Arm code.
+     */
+#ifdef CONFIG_ARM
+    /*
+     * uImage header always appears at the top of the image (even compressed),
+     * so it needs to be probed first. Note that in case of compressed uImage,
+     * kernel_decompress is called from kernel_uimage_probe making the function
+     * self-containing (i.e. fall through only in case of a header not found).
+     */
+    rc = kernel_uimage_probe(info, mod);
+    if ( rc != -ENOENT )
+        return rc;
+#endif
+
+    /*
+     * If it is a gzip'ed image, 32bit or 64bit, uncompress it.
+     * At this point, gzip header appears (if at all) at the top of the image,
+     * so pass 0 as an offset.
+     */
+    rc = kernel_decompress(mod, 0);
+    if ( rc && rc != -EINVAL )
+        return rc;
+
+    rc = kernel_zimage_probe(info, mod->start, mod->size);
+
+    return rc;
+}
+
+void __init kernel_load(struct kernel_info *info)
+{
+    ASSERT(info && info->load);
+
+    info->load(info);
+}
diff --git a/xen/include/xen/fdt-kernel.h b/xen/include/xen/fdt-kernel.h
index c81e759423..d85324c867 100644
--- a/xen/include/xen/fdt-kernel.h
+++ b/xen/include/xen/fdt-kernel.h
@@ -121,6 +121,19 @@ int kernel_probe(struct kernel_info *info, const struct dt_device_node *domain);
  */
 void kernel_load(struct kernel_info *info);
 
+int kernel_decompress(struct bootmodule *mod, uint32_t offset);
+
+int kernel_zimage_probe(struct kernel_info *info, paddr_t addr, paddr_t size);
+
+/*
+ * uImage isn't really used nowadays thereby leave kernel_uimage_probe()
+ * call here just for compatability with Arm code.
+ */
+#ifdef CONFIG_ARM
+struct bootmodule;
+int kernel_uimage_probe(struct kernel_info *info, struct bootmodule *mod);
+#endif
+
 #endif /* __XEN_FDT_KERNEL_H__ */
 
 /*
-- 
2.49.0


