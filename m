Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 000729BA1B4
	for <lists+xen-devel@lfdr.de>; Sat,  2 Nov 2024 18:27:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829575.1244586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7Htm-0006qY-6I; Sat, 02 Nov 2024 17:26:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829575.1244586; Sat, 02 Nov 2024 17:26:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7Htm-0006n9-2w; Sat, 02 Nov 2024 17:26:54 +0000
Received: by outflank-mailman (input) for mailman id 829575;
 Sat, 02 Nov 2024 17:26:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RajI=R5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t7Htk-0005zO-8V
 for xen-devel@lists.xenproject.org; Sat, 02 Nov 2024 17:26:52 +0000
Received: from sender3-of-o57.zoho.com (sender3-of-o57.zoho.com
 [136.143.184.57]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a396f37c-993f-11ef-a0c5-8be0dac302b0;
 Sat, 02 Nov 2024 18:26:49 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1730568365486995.6070687004028;
 Sat, 2 Nov 2024 10:26:05 -0700 (PDT)
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
X-Inumbo-ID: a396f37c-993f-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg0LjU3IiwiaGVsbyI6InNlbmRlcjMtb2YtbzU3LnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6ImEzOTZmMzdjLTk5M2YtMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwNTY4NDA5LjYyODEzLCJzZW5kZXIiOiJkcHNtaXRoQGFwZXJ0dXNzb2x1dGlvbnMuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=1; a=rsa-sha256; t=1730568372; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=h/d0e3JJo5w/7SvCKkTsi3kCw1xMIg8Phnq0Njv6Wl0Q/9BrhL158pOX3T7pZQ+0H2UUPYcYfMZgc2gc268WkKjjkWpxUQXxNoJX2cTzijobcWKoMbeMDSTVGUxNue9K9j4GRWgdCfieDnfbhSfohV9gL4QyA2IKDHFIGg2b2lE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1730568372; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hUGH3RDsDf1IJruHP2Kvrv3CdfGhOfh0xY63XM5AYas=; 
	b=gZZtJEuxMXMNrVyxcAP6O2chvCiJfrc7gsDUVuXG9MI1lPLJndg5ATz/qck2kl3CaQiS3cK4WX5enpk/8nwFN2cIFk/9kVcqr6z+uGKMSDMJtMpdPBOiBquLCGRSaKmzY9qMdcm9bPurx42zCODzr59yZeghm6ZP+YAE1NTMAcM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730568372;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=hUGH3RDsDf1IJruHP2Kvrv3CdfGhOfh0xY63XM5AYas=;
	b=MckSqtGkfpRDMv8MtYbE5UcHK+4ijbl57rLme/js6NhApym2d9OrnAlDLbdpVFZQ
	dD4mis2Fi5VWLQ/WNfERxuLCVoL+F0mNMPeG4MT1Vt8R+WCefZlrgzeIvGrh2jHQdnd
	ctZ7oZ9a4DOzO7S4dxVNcJXI2FK513pmX3PTqLsE=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 04/12] x86/boot: introduce module release
Date: Sat,  2 Nov 2024 13:25:43 -0400
Message-Id: <20241102172551.17233-5-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241102172551.17233-1-dpsmith@apertussolutions.com>
References: <20241102172551.17233-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

A precarious approach was used to release the pages used to hold a boot module.
The precariousness stemmed from the fact that in the case of PV dom0, the
initrd module pages may be either mapped or explicitly copied into the dom0
address space. So to handle this situation, the PV dom0 construction code will
set the size of the module to zero, relying on discard_initial_images() to skip
any modules with a size of zero.

A function is introduced to release a module when it is no longer needed that
accepts a boolean parameter, free_mem, to indicate if the corresponding pages
can be freed. To track that a module has been released, the boot module flag
`released` is introduced.

The previous release model was a free all at once except those of size zeros,
which would handle any unused modules passed. The new model is one of, free
consumed module after usage is complete, thus unconsumed modules do not have a
consumer to free them. To address this, the discard_uknown_boot_modules() is
introduced and called after the last module identification occurs, initrd, to
free the pages of any boot modules that are identified as not being released.
After domain construction completes, all modules should be freed. A walk of the
boot modules is added after domain construction to validate and notify if a
module is found not to have been released.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
Changes since v7:
- This is a new approach as an alternative to the `consumed` flag.
---
 xen/arch/x86/cpu/microcode/core.c   |  4 ++
 xen/arch/x86/hvm/dom0_build.c       |  7 ++--
 xen/arch/x86/include/asm/bootinfo.h |  2 +
 xen/arch/x86/include/asm/setup.h    |  3 +-
 xen/arch/x86/pv/dom0_build.c        | 20 ++--------
 xen/arch/x86/setup.c                | 57 +++++++++++++++++++++++------
 xen/xsm/xsm_core.c                  |  5 +++
 7 files changed, 67 insertions(+), 31 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index b09cf83249f6..349e857f539a 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -756,6 +756,10 @@ static int __init cf_check microcode_init_cache(void)
         return rc;
     }
 
+    /* If raw module, we can free it now */
+    if ( !opt_scan )
+        release_boot_module(&bi->mods[early_mod_idx], true);
+
     if ( !patch )
         return -ENOENT;
 
diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 3dd913bdb029..a4ac262db463 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -704,6 +704,8 @@ static int __init pvh_load_kernel(struct domain *d, const module_t *image,
         return rc;
     }
 
+    release_module(image, true);
+
     /*
      * Find a RAM region big enough (and that doesn't overlap with the loaded
      * kernel) in order to load the initrd and the metadata. Note it could be
@@ -751,10 +753,9 @@ static int __init pvh_load_kernel(struct domain *d, const module_t *image,
             last_addr += len;
         }
         last_addr = ROUNDUP(last_addr, PAGE_SIZE);
-    }
 
-    /* Free temporary buffers. */
-    discard_initial_images();
+        release_module(initrd, true);
+    }
 
     if ( cmdline != NULL )
     {
diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 0fbf36739782..b1549d8c8f93 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -33,8 +33,10 @@ struct boot_module {
     /*
      * Module State Flags:
      *   relocated: indicates module has been relocated in memory.
+     *   released:  indicates module's pages have been freed.
      */
     bool relocated:1;
+    bool released:1;
 };
 
 /*
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index d7ed4f40024c..d68d37a5293b 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -36,12 +36,13 @@ void setup_io_bitmap(struct domain *d);
 extern struct boot_info xen_boot_info;
 
 unsigned long initial_images_nrpages(nodeid_t node);
-void discard_initial_images(void);
+void release_module(const module_t *m, bool mapped);
 
 struct boot_module;
 void *bootstrap_map_bm(const struct boot_module *bm);
 void *bootstrap_map(const module_t *mod);
 void bootstrap_unmap(void);
+void release_boot_module(struct boot_module *bm, bool mapped);
 
 struct rangeset;
 int remove_xen_ranges(struct rangeset *r);
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index cc882bee61c3..c1f44502a1ac 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -630,9 +630,7 @@ static int __init dom0_construct(struct domain *d,
                 }
             memcpy(page_to_virt(page), mfn_to_virt(initrd->mod_start),
                    initrd_len);
-            mpt_alloc = (paddr_t)initrd->mod_start << PAGE_SHIFT;
-            init_domheap_pages(mpt_alloc,
-                               mpt_alloc + PAGE_ALIGN(initrd_len));
+            release_module(initrd, true);
             initrd->mod_start = initrd_mfn = mfn_x(page_to_mfn(page));
         }
         else
@@ -640,18 +638,9 @@ static int __init dom0_construct(struct domain *d,
             while ( count-- )
                 if ( assign_pages(mfn_to_page(_mfn(mfn++)), 1, d, 0) )
                     BUG();
+            release_module(initrd, false);
         }
 
-        /*
-         * We have either:
-         * - Mapped the initrd directly into dom0, or
-         * - Copied it and freed the module.
-         *
-         * Either way, tell discard_initial_images() to not free it a second
-         * time.
-         */
-        initrd->mod_end = 0;
-
         iommu_memory_setup(d, "initrd", mfn_to_page(_mfn(initrd_mfn)),
                            PFN_UP(initrd_len), &flush_flags);
     }
@@ -839,7 +828,9 @@ static int __init dom0_construct(struct domain *d,
         printk("Failed to load the kernel binary\n");
         goto out;
     }
+    /* All done with kernel, release the module pages */
     bootstrap_unmap();
+    release_module(image, true);
 
     if ( UNSET_ADDR != parms.virt_hypercall )
     {
@@ -854,9 +845,6 @@ static int __init dom0_construct(struct domain *d,
         init_hypercall_page(d, _p(parms.virt_hypercall));
     }
 
-    /* Free temporary buffers. */
-    discard_initial_images();
-
     /* Set up start info area. */
     si = (start_info_t *)vstartinfo_start;
     clear_page(si);
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index d061ece0541f..e6d2d25fd038 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -341,27 +341,55 @@ unsigned long __init initial_images_nrpages(nodeid_t node)
     return nr;
 }
 
-void __init discard_initial_images(void) /* a.k.a. Free boot modules */
+void __init release_boot_module(struct boot_module *bm, bool free_mem)
+{
+    uint64_t start = pfn_to_paddr(bm->mod->mod_start);
+    uint64_t size  = bm->mod->mod_end;
+
+    if ( bm->released )
+    {
+        printk(XENLOG_WARNING "Attempt second release boot module of type %d\n",
+               bm->type);
+        return;
+    }
+
+    if ( free_mem )
+        init_domheap_pages(start, start + PAGE_ALIGN(size));
+
+    bm->released = true;
+}
+
+void __init release_module(const module_t *m, bool free_mem)
 {
     struct boot_info *bi = &xen_boot_info;
     unsigned int i;
 
-    for ( i = 0; i < bi->nr_modules; ++i )
+    for ( i = 0; i < bi->nr_modules; i++ )
     {
-        uint64_t start = pfn_to_paddr(bi->mods[i].mod->mod_start);
-        uint64_t size  = bi->mods[i].mod->mod_end;
+        if ( bi->mods[i].mod == m )
+            release_boot_module(&bi->mods[i], free_mem);
+    }
+}
 
-        /*
-         * Sometimes the initrd is mapped, rather than copied, into dom0.
-         * Size being 0 is how we're instructed to leave the module alone.
-         */
-        if ( size == 0 )
+static void __init discard_unknown_boot_modules(void)
+{
+    struct boot_info *bi = &xen_boot_info;
+    unsigned int i, count = 0;
+
+    for_each_boot_module_by_type(i, bi, BOOTMOD_UNKNOWN)
+    {
+        struct boot_module *bm = &bi->mods[i];
+
+        if ( bm == NULL || bm->released )
             continue;
 
-        init_domheap_pages(start, start + PAGE_ALIGN(size));
+        release_boot_module(bm, true);
+        count++;
     }
 
-    bi->nr_modules = 0;
+    if ( count )
+        printk(XENLOG_DEBUG "Releasing pages for uknown boot module %d\n",
+               count);
 }
 
 static void __init init_idle_domain(void)
@@ -2111,6 +2139,8 @@ void asmlinkage __init noreturn __start_xen(void)
                    initrdidx);
     }
 
+    discard_unknown_boot_modules();
+
     /*
      * We're going to setup domain0 using the module(s) that we stashed safely
      * above our heap. The second module, if present, is an initrd ramdisk.
@@ -2122,6 +2152,11 @@ void asmlinkage __init noreturn __start_xen(void)
     if ( !dom0 )
         panic("Could not set up DOM0 guest OS\n");
 
+    /* Check and warn if any modules did not get released */
+    for ( i = 0; i < bi->nr_modules; i++ )
+        if ( !bi->mods[i].released )
+            printk(XENLOG_ERR "Boot module %d not released, memory leaked", i);
+
     heap_init_late();
 
     init_trace_bufs();
diff --git a/xen/xsm/xsm_core.c b/xen/xsm/xsm_core.c
index f255fb63bf6f..d5875599b63a 100644
--- a/xen/xsm/xsm_core.c
+++ b/xen/xsm/xsm_core.c
@@ -162,6 +162,11 @@ int __init xsm_multiboot_init(struct boot_info *bi)
     ret = xsm_core_init(policy_buffer, policy_size);
     bootstrap_unmap();
 
+    /* If the policy was loaded from a boot module, release it's memory */
+    ret = first_boot_module_index(bi, BOOTMOD_XSM_POLICY);
+    if ( ret >= 0 && ret < bi->nr_modules )
+        release_boot_module(&bi->mods[ret], true);
+
     return 0;
 }
 #endif
-- 
2.30.2


