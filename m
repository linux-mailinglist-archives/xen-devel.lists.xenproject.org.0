Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF48B1C088B
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 22:50:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUG8K-0004PE-SE; Thu, 30 Apr 2020 20:50:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fL57=6O=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jUG8J-0004Ow-U7
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 20:50:11 +0000
X-Inumbo-ID: 2ed536a2-8b24-11ea-9ab3-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2ed536a2-8b24-11ea-9ab3-12813bfff9fa;
 Thu, 30 Apr 2020 20:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PcycubMAuSqGSuNs6t/y8u3H4ytKIm03X5Wiy+SUCcU=; b=ygXMYmWskqVSzW591ZTOFCGThF
 YklHwIBhupZhlHTHjsqn+y/Un9pUUSrRKv+c5C36KmMe7ZWmbp/jWMhmTbaM67vmZ0fDRJQhUJzy4
 8OZg8fxFJ0iFV3WJXsUQC8HKjLLm3NZTRLSm/3IaNEsxjuOWsFs74oiqKt9Pnb7Jk+cY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jUG8I-0004UV-Es; Thu, 30 Apr 2020 20:50:10 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jUG3B-0005wj-IK; Thu, 30 Apr 2020 20:44:53 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 11/16] x86: add a boot option to enable and disable the direct
 map
Date: Thu, 30 Apr 2020 21:44:20 +0100
Message-Id: <7360b59e8fd39796fee56430a437b20c948d08c2.1588278317.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588278317.git.hongyxia@amazon.com>
References: <cover.1588278317.git.hongyxia@amazon.com>
In-Reply-To: <cover.1588278317.git.hongyxia@amazon.com>
References: <cover.1588278317.git.hongyxia@amazon.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Hongyan Xia <hongyxia@amazon.com>

Also add a helper function to retrieve it. Change arch_mfn_in_direct_map
to check this option before returning.

This is added as a boot command line option, not a Kconfig. We do not
produce different builds for EC2 so this is not introduced as a
compile-time configuration.

Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
---
 docs/misc/xen-command-line.pandoc | 12 ++++++++++++
 xen/arch/x86/mm.c                 |  3 +++
 xen/arch/x86/setup.c              |  2 ++
 xen/include/asm-arm/mm.h          |  5 +++++
 xen/include/asm-x86/mm.h          | 17 ++++++++++++++++-
 5 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index ee12b0f53f..7027e3a15c 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -652,6 +652,18 @@ Specify the size of the console debug trace buffer. By specifying `cpu:`
 additionally a trace buffer of the specified size is allocated per cpu.
 The debug trace feature is only enabled in debugging builds of Xen.
 
+### directmap (x86)
+> `= <boolean>`
+
+> Default: `true`
+
+Enable or disable the direct map region in Xen.
+
+By default, Xen creates the direct map region which maps physical memory
+in that region. Setting this to no will remove the direct map, blocking
+exploits that leak secrets via speculative memory access in the direct
+map.
+
 ### dma_bits
 > `= <integer>`
 
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index b3530d2763..64da997764 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -162,6 +162,9 @@ l1_pgentry_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
 l1_pgentry_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
     l1_fixmap_x[L1_PAGETABLE_ENTRIES];
 
+bool __read_mostly opt_directmap = true;
+boolean_param("directmap", opt_directmap);
+
 paddr_t __read_mostly mem_hotplug;
 
 /* Frame table size in pages. */
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index faca8c9758..60fc4038be 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1282,6 +1282,8 @@ void __init noreturn __start_xen(unsigned long mbi_p)
     if ( highmem_start )
         xenheap_max_mfn(PFN_DOWN(highmem_start - 1));
 
+    printk("Booting with directmap %s\n", arch_has_directmap() ? "on" : "off");
+
     /*
      * Walk every RAM region and map it in its entirety (on x86/64, at least)
      * and notify it to the boot allocator.
diff --git a/xen/include/asm-arm/mm.h b/xen/include/asm-arm/mm.h
index 7df91280bc..e6fd934113 100644
--- a/xen/include/asm-arm/mm.h
+++ b/xen/include/asm-arm/mm.h
@@ -366,6 +366,11 @@ int arch_acquire_resource(struct domain *d, unsigned int type, unsigned int id,
     return -EOPNOTSUPP;
 }
 
+static inline bool arch_has_directmap(void)
+{
+    return true;
+}
+
 #endif /*  __ARCH_ARM_MM__ */
 /*
  * Local variables:
diff --git a/xen/include/asm-x86/mm.h b/xen/include/asm-x86/mm.h
index ef7a20ac7d..7ff99ee8e3 100644
--- a/xen/include/asm-x86/mm.h
+++ b/xen/include/asm-x86/mm.h
@@ -454,6 +454,8 @@ int check_descriptor(const struct domain *d, seg_desc_t *desc);
 
 extern paddr_t mem_hotplug;
 
+extern bool opt_directmap;
+
 /******************************************************************************
  * With shadow pagetables, the different kinds of address start
  * to get get confusing.
@@ -637,13 +639,26 @@ extern const char zero_page[];
 /* Build a 32bit PSE page table using 4MB pages. */
 void write_32bit_pse_identmap(uint32_t *l2);
 
+static inline bool arch_has_directmap(void)
+{
+    return opt_directmap;
+}
+
 /*
  * x86 maps part of physical memory via the directmap region.
  * Return whether the input MFN falls in that range.
+ *
+ * When boot command line sets directmap=no, we will not have a direct map at
+ * all so this will always return false.
  */
 static inline bool arch_mfn_in_directmap(unsigned long mfn)
 {
-    unsigned long eva = min(DIRECTMAP_VIRT_END, HYPERVISOR_VIRT_END);
+    unsigned long eva;
+
+    if ( !arch_has_directmap() )
+        return false;
+
+    eva = min(DIRECTMAP_VIRT_END, HYPERVISOR_VIRT_END);
 
     return mfn <= (virt_to_mfn(eva - 1) + 1);
 }
-- 
2.24.1.AMZN


