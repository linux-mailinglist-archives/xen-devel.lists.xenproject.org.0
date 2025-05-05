Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85750AA9B38
	for <lists+xen-devel@lfdr.de>; Mon,  5 May 2025 20:11:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976211.1363462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uC0HB-00077R-U3; Mon, 05 May 2025 18:10:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976211.1363462; Mon, 05 May 2025 18:10:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uC0HB-00073D-M2; Mon, 05 May 2025 18:10:49 +0000
Received: by outflank-mailman (input) for mailman id 976211;
 Mon, 05 May 2025 18:10:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cdRb=XV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uC0HA-000675-0c
 for xen-devel@lists.xenproject.org; Mon, 05 May 2025 18:10:48 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4432708b-29dc-11f0-9ffb-bf95429c2676;
 Mon, 05 May 2025 20:10:46 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5e5e63162a0so7249287a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 05 May 2025 11:10:46 -0700 (PDT)
Received: from fedora.. (user-109-243-69-225.play-internet.pl.
 [109.243.69.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad189146fcbsm530372366b.34.2025.05.05.11.10.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 May 2025 11:10:45 -0700 (PDT)
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
X-Inumbo-ID: 4432708b-29dc-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746468646; x=1747073446; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ncF17W3CTTSQUsFN9MAsJJRH+seNVqW8TKw5sOfUUk=;
        b=CICBgHkEBEKNYhJSrescW1P+Pb2gsSuSNqQkFkZJlOfwMLvWnUoK266xt5VRkj8Rgs
         VvGRVju3LqgIZ/1UeFdYB73Z569Lg3lB8yjjEc4rJiGAmsWSp1ZUAtubZ5CmfKgvh05g
         1BH3gT2Bhl4OpsodzzgH0bfvhGZPvDIRfsAdV6jTCVQjRFF/Z6HT5J//lmPqkae433CS
         Dp8JwCLn9wSpSAdobO6N7ag4s+nrNQOJ/MqoDaHyoRlsDcqRNFUG6MEolM26YFZhLKfr
         xzYt4sNhrC7JMU32njTIW2EcBDF1QgYkQlRSOf+n3nYvAqcEWFxJkRzW8fpJa/RaupvR
         K6pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746468646; x=1747073446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ncF17W3CTTSQUsFN9MAsJJRH+seNVqW8TKw5sOfUUk=;
        b=usn77UfCn7oiEQd1JiG0rEax4WqxgpFQTBo6UnR1UTo7EGGyx0ZqG3K+8fEFm7KdcX
         nY5NqcrqN/NcI6OKDyLulGoKX+HpNaqCxnzltWsr4oRpI0wnC9iK86lmXHm70TCYNHXg
         DmAna6UzLXzLcTLjz+0t1YC2vprb8wWkDanjRD2yuZZ3MZDHUz1nXs85oFKDNjiXb1Cv
         Jk0QNfncSx+V12KWiV7+RuydOK7ZhKTNUv0Yuy2c7DoRwFtYU5tni1/wIqQtIc98lBvF
         s3f8Egi13BVh1s05tATMUmFnmNUroq7sLV4dBGYDFx52v4PciBSb3tjZzIK2//G0WI0T
         kKzg==
X-Gm-Message-State: AOJu0YwuxYYFs9Nw/DNBXJzIIpZ90Ban3DdnWEZU0Kr1kK/4c9MCQ7jK
	hyBdUva+6A0tO1D8AElwV+m/7jqS6uq4OmMJLx/K0RvTbEsL4jLMM/JIcg==
X-Gm-Gg: ASbGncuIS0Bl+gB3H1JWSz1WzRnPnA7zRHSx/ssS1BrQWnDFtH7+Yu5l5KA+6YAiQVw
	tGc+KWLdasGts9sws/eTBto6INrPyky4XaUJBrxWqxdYZKcAstnirSUhkAn74JDNAovkwE/Bhtx
	edvhCyoVkmukCPI5O2gqjznUP8H6SP8TurUHMQDFwN3xOdkyMTmKsuIwJObde3ig0YPZrzBrVUz
	FdSb9I23rEbXf9sxq6IlceeP9fLTeLsAYDElSZZazvypctARHqKq46E4kvT6Iud7z84P6poLCA+
	DJ87e5FoUzM2HM0NQr4rS2qgKW0oYTcEQZIEk+eKtfhc1u7MEvgoQueflbp8M0z6GmKIobgugmE
	f0tfmZ0+M1Q==
X-Google-Smtp-Source: AGHT+IHlpoXXo/hazRC6lYETJ0cFIISQhotBD+PG0qpU6XO/GSq2Cm/zo7gnZ1IqTpTuCaZGj1xiLQ==
X-Received: by 2002:a17:906:a0c:b0:ad1:8e69:e838 with SMTP id a640c23a62f3a-ad18e69e87bmr776144866b.52.1746468645332;
        Mon, 05 May 2025 11:10:45 -0700 (PDT)
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
Subject: [PATCH v4 6/8] xen/common: dom0less: introduce common kernel.c
Date: Mon,  5 May 2025 20:10:36 +0200
Message-ID: <854e4ce870e07add71a4fe429bee1e83a5f6958d.1746468003.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746468003.git.oleksii.kurochko@gmail.com>
References: <cover.1746468003.git.oleksii.kurochko@gmail.com>
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
Change in v4:
 - Drop 'help' for CONFIG_DOMAIN_BUILD_HELPERS to make
   CONFIG_DOMAIN_BUILD_HELPERS silent option.
 - Remove asm-generic/kernel.h as it is a duplication of xen/fdt-kernel.h and
   I just missed to remove it earler after xen/fdt-kernel.h has been
   introduced.
---
Change in v3:
 - Empty line after license tag for newly introduced files.
---
Change in v2:
 - Drop inclusion of asm/kernel.h in kernel.c as everything necessary has
   been moved to xen/fdt-kernel.h.
---
 xen/arch/arm/Kconfig            |   1 +
 xen/arch/arm/kernel.c           | 221 +----------------------------
 xen/common/Kconfig              |   5 +-
 xen/common/device-tree/Makefile |   1 +
 xen/common/device-tree/kernel.c | 242 ++++++++++++++++++++++++++++++++
 xen/include/xen/fdt-kernel.h    |  13 ++
 6 files changed, 267 insertions(+), 216 deletions(-)
 create mode 100644 xen/common/device-tree/kernel.c

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index d0e0a7753c..3321d89068 100644
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
index aea8f44413..cb1efb19e7 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -162,105 +162,6 @@ static void __init kernel_zimage_load(struct kernel_info *info)
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
@@ -273,8 +174,8 @@ static __init int kernel_decompress(struct bootmodule *mod, uint32_t offset)
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
@@ -504,130 +405,20 @@ static int __init kernel_zimage32_probe(struct kernel_info *info,
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
index f291a5c1c7..4bec78c6f2 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -14,13 +14,16 @@ config CORE_PARKING
 
 config DOM0LESS_BOOT
 	bool "Dom0less boot support" if EXPERT
-	depends on HAS_DOM0LESS && HAS_DEVICE_TREE
+	depends on HAS_DOM0LESS && HAS_DEVICE_TREE && DOMAIN_BUILD_HELPERS
 	default y
 	help
 	  Dom0less boot support enables Xen to create and start domU guests during
 	  Xen boot without the need of a control domain (Dom0), which could be
 	  present anyway.
 
+config DOMAIN_BUILD_HELPERS
+	bool
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
index 516cc68e90..7a6cd67c22 100644
--- a/xen/include/xen/fdt-kernel.h
+++ b/xen/include/xen/fdt-kernel.h
@@ -120,6 +120,19 @@ int kernel_probe(struct kernel_info *info, const struct dt_device_node *domain);
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


