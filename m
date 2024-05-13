Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC578C42B2
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2024 15:58:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720987.1124135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6WBz-00006Y-O8; Mon, 13 May 2024 13:58:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720987.1124135; Mon, 13 May 2024 13:58:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6WBz-00004r-Kc; Mon, 13 May 2024 13:58:15 +0000
Received: by outflank-mailman (input) for mailman id 720987;
 Mon, 13 May 2024 13:58:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2Lj=MQ=amazon.co.uk=prvs=8568adbc3=eliasely@srs-se1.protection.inumbo.net>)
 id 1s6Vvm-0002lY-3b
 for xen-devel@lists.xenproject.org; Mon, 13 May 2024 13:41:30 +0000
Received: from smtp-fw-9105.amazon.com (smtp-fw-9105.amazon.com
 [207.171.188.204]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f610767-112e-11ef-b4bb-af5377834399;
 Mon, 13 May 2024 15:41:27 +0200 (CEST)
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.25.36.210])
 by smtp-border-fw-9105.sea19.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 13:41:23 +0000
Received: from EX19MTAUEB002.ant.amazon.com [10.0.0.204:13448]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.4.17:2525] with
 esmtp (Farcaster)
 id 4812b6f1-35cd-42d7-8ea7-3c70ed6b4a4d; Mon, 13 May 2024 13:41:22 +0000 (UTC)
Received: from EX19D008UEA001.ant.amazon.com (10.252.134.62) by
 EX19MTAUEB002.ant.amazon.com (10.252.135.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 13 May 2024 13:41:21 +0000
Received: from EX19MTAUWB001.ant.amazon.com (10.250.64.248) by
 EX19D008UEA001.ant.amazon.com (10.252.134.62) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 13 May 2024 13:41:21 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.250.64.254) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28 via Frontend Transport; Mon, 13 May 2024 13:41:18 +0000
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
X-Inumbo-ID: 7f610767-112e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1715607688; x=1747143688;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mKCZV9DzUavScUGAYIjbkqz34voMdE7B7ItlMBncNvQ=;
  b=j+YjueYimKRBlt56RCHaHULTyp4SJTKdUkwrWU8gRKfi0k395dFLNMVt
   hrmvG7o3RjrPGMSSzJUpDqfu91z03AMx0HLBlhCWnRi9HBVWkZ2qz/LM7
   6ss8pTj/Fw0BYBaCt0CpVIZF5HfwEMuMIy0P4gEDVv5z8tX/TphAOuACM
   c=;
X-IronPort-AV: E=Sophos;i="6.08,158,1712620800"; 
   d="scan'208";a="726053718"
X-Farcaster-Flow-ID: 4812b6f1-35cd-42d7-8ea7-3c70ed6b4a4d
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, "Elias El
 Yandouzi" <eliasely@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Lukasz Hawrylko
	<lukasz@hawrylko.pl>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Mateusz=20M=C3=B3wka?= <mateusz.mowka@intel.com>
Subject: [PATCH V3 (resend) 14/19] Rename mfn_to_virt() calls
Date: Mon, 13 May 2024 13:40:41 +0000
Message-ID: <20240513134046.82605-15-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240513134046.82605-1-eliasely@amazon.com>
References: <20240513134046.82605-1-eliasely@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Until directmap gets completely removed, we'd still need to
keep some calls to mfn_to_virt() for xenheap pages or when the
directmap is enabled.

Rename the macro to mfn_to_directmap_virt() to flag them and
prevent further use of mfn_to_virt().

Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>

diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 48538b5337..2bca3f9e87 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -336,6 +336,7 @@ static inline uint64_t gvirt_to_maddr(vaddr_t va, paddr_t *pa,
  */
 #define virt_to_mfn(va)     __virt_to_mfn(va)
 #define mfn_to_virt(mfn)    __mfn_to_virt(mfn)
+#define mfn_to_directmap_virt(mfn) mfn_to_virt(mfn)
 
 /* Convert between Xen-heap virtual addresses and page-info structures. */
 static inline struct page_info *virt_to_page(const void *v)
diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
index 89caefc8a2..62d6fee0f4 100644
--- a/xen/arch/x86/domain_page.c
+++ b/xen/arch/x86/domain_page.c
@@ -81,14 +81,14 @@ void *map_domain_page(mfn_t mfn)
 
 #ifdef NDEBUG
     if ( arch_mfns_in_directmap(mfn_x(mfn), 1) )
-        return mfn_to_virt(mfn_x(mfn));
+        return mfn_to_directmap_virt(mfn_x(mfn));
 #endif
 
     v = mapcache_current_vcpu();
     if ( !v || !v->domain->arch.mapcache.inuse )
     {
         if ( arch_mfns_in_directmap(mfn_x(mfn), 1) )
-            return mfn_to_virt(mfn_x(mfn));
+            return mfn_to_directmap_virt(mfn_x(mfn));
         else
         {
             BUG_ON(system_state >= SYS_STATE_smp_boot);
@@ -324,7 +324,7 @@ void *map_domain_page_global(mfn_t mfn)
 
 #ifdef NDEBUG
     if ( arch_mfn_in_directmap(mfn_x(mfn, 1)) )
-        return mfn_to_virt(mfn_x(mfn));
+        return mfn_to_directmap_virt(mfn_x(mfn));
 #endif
 
     return vmap(&mfn, 1);
diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index b0cb96c3bc..d1482ae2f7 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -439,7 +439,7 @@ static int __init pvh_populate_p2m(struct domain *d)
                                  d->arch.e820[i].addr + d->arch.e820[i].size);
             enum hvm_translation_result res =
                  hvm_copy_to_guest_phys(mfn_to_maddr(_mfn(addr)),
-                                        mfn_to_virt(addr),
+                                        mfn_to_directmap_virt(addr),
                                         end - d->arch.e820[i].addr,
                                         v);
 
@@ -725,7 +725,7 @@ static int __init pvh_load_kernel(struct domain *d, const module_t *image,
 
     if ( initrd != NULL )
     {
-        rc = hvm_copy_to_guest_phys(last_addr, mfn_to_virt(initrd->mod_start),
+        rc = hvm_copy_to_guest_phys(last_addr, mfn_to_directmap_virt(initrd->mod_start),
                                     initrd_len, v);
         if ( rc )
         {
diff --git a/xen/arch/x86/include/asm/page.h b/xen/arch/x86/include/asm/page.h
index 350d1fb110..c6891b52d4 100644
--- a/xen/arch/x86/include/asm/page.h
+++ b/xen/arch/x86/include/asm/page.h
@@ -268,7 +268,7 @@ void copy_page_sse2(void *to, const void *from);
  */
 #define mfn_valid(mfn)      __mfn_valid(mfn_x(mfn))
 #define virt_to_mfn(va)     __virt_to_mfn(va)
-#define mfn_to_virt(mfn)    __mfn_to_virt(mfn)
+#define mfn_to_directmap_virt(mfn)    __mfn_to_virt(mfn)
 #define virt_to_maddr(va)   __virt_to_maddr((unsigned long)(va))
 #define maddr_to_virt(ma)   __maddr_to_virt((unsigned long)(ma))
 #define maddr_to_page(ma)   __maddr_to_page(ma)
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index efdf20f775..337363cf17 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -318,8 +318,8 @@ void __init arch_init_memory(void)
         iostart_pfn = max_t(unsigned long, pfn, 1UL << (20 - PAGE_SHIFT));
         ioend_pfn = min(rstart_pfn, 16UL << (20 - PAGE_SHIFT));
         if ( iostart_pfn < ioend_pfn )
-            destroy_xen_mappings((unsigned long)mfn_to_virt(iostart_pfn),
-                                 (unsigned long)mfn_to_virt(ioend_pfn));
+            destroy_xen_mappings((unsigned long)mfn_to_directmap_virt(iostart_pfn),
+                                 (unsigned long)mfn_to_directmap_virt(ioend_pfn));
 
         /* Mark as I/O up to next RAM region. */
         for ( ; pfn < rstart_pfn; pfn++ )
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 919347d8c2..e0671ab3c3 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -399,7 +399,7 @@ void *__init bootstrap_map(const module_t *mod)
     void *ret;
 
     if ( system_state != SYS_STATE_early_boot )
-        return mod ? mfn_to_virt(mod->mod_start) : NULL;
+        return mod ? mfn_to_directmap_virt(mod->mod_start) : NULL;
 
     if ( !mod )
     {
@@ -1708,7 +1708,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     {
         set_pdx_range(mod[i].mod_start,
                       mod[i].mod_start + PFN_UP(mod[i].mod_end));
-        map_pages_to_xen((unsigned long)mfn_to_virt(mod[i].mod_start),
+        map_pages_to_xen((unsigned long)mfn_to_directmap_virt(mod[i].mod_start),
                          _mfn(mod[i].mod_start),
                          PFN_UP(mod[i].mod_end), PAGE_HYPERVISOR);
     }
diff --git a/xen/arch/x86/tboot.c b/xen/arch/x86/tboot.c
index ba0700d2d5..58df01dfb9 100644
--- a/xen/arch/x86/tboot.c
+++ b/xen/arch/x86/tboot.c
@@ -253,7 +253,7 @@ static void tboot_gen_xenheap_integrity(const uint8_t key[TB_KEY_SIZE],
             continue; /* skip tboot and its page tables */
 
         if ( is_page_in_use(page) && is_special_page(page) )
-            vmac_update(mfn_to_virt(mfn), PAGE_SIZE, &ctx);
+            vmac_update(mfn_to_directmap_virt(mfn), PAGE_SIZE, &ctx);
     }
     *mac = vmac(NULL, 0, nonce, NULL, &ctx);
 
diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index b2a280fba3..1697760d82 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -1247,19 +1247,25 @@ int memory_add(unsigned long spfn, unsigned long epfn, unsigned int pxm)
     i = virt_to_mfn(HYPERVISOR_VIRT_END - 1) + 1;
     if ( spfn < i )
     {
-        ret = map_pages_to_xen((unsigned long)mfn_to_virt(spfn), _mfn(spfn),
-                               min(epfn, i) - spfn, PAGE_HYPERVISOR);
-        if ( ret )
-            goto destroy_directmap;
+        if ( arch_mfns_in_directmap(spfn, min(epfn, i) - spfn ) )
+        {
+            ret = map_pages_to_xen((unsigned long)mfn_to_directmap_virt(spfn), _mfn(spfn),
+                                min(epfn, i) - spfn, PAGE_HYPERVISOR);
+            if ( ret )
+                goto destroy_directmap;
+        }
     }
     if ( i < epfn )
     {
         if ( i < spfn )
             i = spfn;
-        ret = map_pages_to_xen((unsigned long)mfn_to_virt(i), _mfn(i),
-                               epfn - i, __PAGE_HYPERVISOR_RW);
-        if ( ret )
-            goto destroy_directmap;
+        if ( arch_mfns_in_directmap(spfn, epfn - i) )
+        {
+            ret = map_pages_to_xen((unsigned long)mfn_to_directmap_virt(i), _mfn(i),
+                                epfn - i, __PAGE_HYPERVISOR_RW);
+            if ( ret )
+                goto destroy_directmap;
+        }
     }
 
     old_node_start = node_start_pfn(node);
@@ -1348,8 +1354,8 @@ destroy_frametable:
     NODE_DATA(node)->node_start_pfn = old_node_start;
     NODE_DATA(node)->node_spanned_pages = old_node_span;
  destroy_directmap:
-    destroy_xen_mappings((unsigned long)mfn_to_virt(spfn),
-                         (unsigned long)mfn_to_virt(epfn));
+    destroy_xen_mappings((unsigned long)mfn_to_directmap_virt(spfn),
+                         (unsigned long)mfn_to_directmap_virt(epfn));
 
     return ret;
 }
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index efbec00af9..39aed5845d 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -1599,7 +1599,7 @@ static __init void copy_mapping(unsigned long mfn, unsigned long end,
     for ( ; mfn < end; mfn = next )
     {
         l4_pgentry_t l4e = efi_l4t[l4_table_offset(mfn << PAGE_SHIFT)];
-        unsigned long va = (unsigned long)mfn_to_virt(mfn);
+        unsigned long va = (unsigned long)mfn_to_directmap_virt(mfn);
 
         if ( !(mfn & ((1UL << (L4_PAGETABLE_SHIFT - PAGE_SHIFT)) - 1)) )
             UNMAP_DOMAIN_PAGE(l3dst);
@@ -1757,15 +1757,18 @@ void __init efi_init_memory(void)
         if ( pfn_to_pdx(emfn - 1) < (DIRECTMAP_SIZE >> PAGE_SHIFT) &&
              pdx_is_region_compressible(mem_base, mem_npages) )
         {
-            if ( (unsigned long)mfn_to_virt(emfn - 1) >= HYPERVISOR_VIRT_END )
-                prot &= ~_PAGE_GLOBAL;
-            if ( map_pages_to_xen((unsigned long)mfn_to_virt(smfn),
-                                  _mfn(smfn), emfn - smfn, prot) == 0 )
-                desc->VirtualStart =
-                    (unsigned long)maddr_to_virt(desc->PhysicalStart);
-            else
-                printk(XENLOG_ERR "Could not map MFNs %#lx-%#lx\n",
-                       smfn, emfn - 1);
+            if ( arch_mfns_in_directmap(smfn, emfn - smfn) )
+            {
+                if ( (unsigned long)mfn_to_directmap_virt(emfn - 1) >= HYPERVISOR_VIRT_END )
+                    prot &= ~_PAGE_GLOBAL;
+                if ( map_pages_to_xen((unsigned long)mfn_to_directmap_virt(smfn),
+                                    _mfn(smfn), emfn - smfn, prot) == 0 )
+                    desc->VirtualStart =
+                        (unsigned long)maddr_to_virt(desc->PhysicalStart);
+                else
+                    printk(XENLOG_ERR "Could not map MFNs %#lx-%#lx\n",
+                        smfn, emfn - 1);
+            }
         }
         else if ( !((desc->PhysicalStart + len - 1) >> (VADDR_BITS - 1)) &&
                   (extra = xmalloc(struct rt_extra)) != NULL )
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 3c0909f333..e1e98d4d59 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -611,8 +611,8 @@ static unsigned long init_node_heap(int node, unsigned long mfn,
     {
         if ( arch_mfns_in_directmap(mfn + nr - needed, needed) )
         {
-            _heap[node] = mfn_to_virt(mfn + nr - needed);
-            avail[node] = mfn_to_virt(mfn + nr - 1) +
+            _heap[node] = mfn_to_directmap_virt(mfn + nr - needed);
+            avail[node] = mfn_to_directmap_virt(mfn + nr - 1) +
                           PAGE_SIZE - sizeof(**avail) * NR_ZONES;
         }
         else
@@ -631,8 +631,8 @@ static unsigned long init_node_heap(int node, unsigned long mfn,
     {
         if ( arch_mfns_in_directmap(mfn, needed) )
         {
-            _heap[node] = mfn_to_virt(mfn);
-            avail[node] = mfn_to_virt(mfn + needed - 1) +
+            _heap[node] = mfn_to_directmap_virt(mfn);
+            avail[node] = mfn_to_directmap_virt(mfn + needed - 1) +
                           PAGE_SIZE - sizeof(**avail) * NR_ZONES;
         }
         else
diff --git a/xen/common/trace.c b/xen/common/trace.c
index 4e7b080e61..955509a0d8 100644
--- a/xen/common/trace.c
+++ b/xen/common/trace.c
@@ -229,7 +229,7 @@ static int alloc_trace_bufs(unsigned int pages)
         offset = t_info->mfn_offset[cpu];
 
         /* Initialize the buffer metadata */
-        per_cpu(t_bufs, cpu) = buf = mfn_to_virt(t_info_mfn_list[offset]);
+        per_cpu(t_bufs, cpu) = buf = mfn_to_directmap_virt(t_info_mfn_list[offset]);
         buf->cons = buf->prod = 0;
 
         printk(XENLOG_INFO "xentrace: p%d mfn %x offset %u\n",
@@ -268,7 +268,7 @@ out_dealloc:
             if ( !mfn )
                 break;
             ASSERT(!(mfn_to_page(_mfn(mfn))->count_info & PGC_allocated));
-            free_xenheap_pages(mfn_to_virt(mfn), 0);
+            free_xenheap_pages(mfn_to_directmap_virt(mfn), 0);
         }
     }
     free_xenheap_pages(t_info, get_order_from_pages(t_info_pages));
@@ -529,7 +529,7 @@ static unsigned char *next_record(const struct t_buf *buf, uint32_t *next,
     per_cpu_mfn_offset = t_info->mfn_offset[smp_processor_id()];
     mfn_list = (uint32_t *)t_info;
     mfn = mfn_list[per_cpu_mfn_offset + per_cpu_mfn_nr];
-    this_page = mfn_to_virt(mfn);
+    this_page = (unsigned char *)mfn_to_directmap_virt(mfn);
     if (per_cpu_mfn_nr + 1 >= opt_tbuf_size)
     {
         /* reached end of buffer? */
@@ -538,7 +538,7 @@ static unsigned char *next_record(const struct t_buf *buf, uint32_t *next,
     else
     {
         mfn = mfn_list[per_cpu_mfn_offset + per_cpu_mfn_nr + 1];
-        *next_page = mfn_to_virt(mfn);
+        *next_page = mfn_to_directmap_virt(mfn);
     }
     return this_page;
 }
-- 
2.40.1


