Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C88F9CDFA5
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 14:13:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837562.1253497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBw7x-0007i2-D6; Fri, 15 Nov 2024 13:12:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837562.1253497; Fri, 15 Nov 2024 13:12:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBw7x-0007fq-9o; Fri, 15 Nov 2024 13:12:45 +0000
Received: by outflank-mailman (input) for mailman id 837562;
 Fri, 15 Nov 2024 13:12:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=54cC=SK=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tBw7v-0006v7-KE
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 13:12:43 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 499c6c43-a353-11ef-99a3-01e77a169b0f;
 Fri, 15 Nov 2024 14:12:40 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1731676334302852.445542045448;
 Fri, 15 Nov 2024 05:12:14 -0800 (PST)
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
X-Inumbo-ID: 499c6c43-a353-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6IjQ5OWM2YzQzLWEzNTMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjc2MzYwLjIwMjQ0OSwic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1731676336; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Qhc6IKuwaOSg2pIRjpS1E1UmTqSVt/2essstn4HTMbfY9y0KISmZYfvHpL+SLdc76ox3+cG5LWbf4Qmy6i5xFOB2FGeGjxLHb9EVrFmW230ZIgWaYjIvq/DE9XHkzKCfJuwKMjV6AQ4jnavJvhKK234OmCAQHqphma6mdTT13fI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1731676336; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=45XOFNojx3tCAZbzmL3SALvSEtU+6rTfX9Oyt2Zgwf4=; 
	b=eG2GZPXJeBkITiNIToeUknDBlEI6G0LdtdR0uOso2puOzFtqjX4ERY0DGwvE3MNE9CAjJaD/RVO6p1uL3GwlWg7MXvuCbegLzElmAxoJGZ1cz/v3WZXo3BNS92rlSCrSzqup5YVzPMtEnt2iGgg2CyHoqFSIC+q69Us5vRUEklY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1731676336;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=45XOFNojx3tCAZbzmL3SALvSEtU+6rTfX9Oyt2Zgwf4=;
	b=PARDKyLBPsDDZZcOje/5GaOPZRI4ytZMeaIfQCktIYcO4hVfotNVUJvk3GZEEZjk
	KxLQQx8adxGymV7bY4Y6zXFvPjchLcYFuSLyBx3tAVY9Qn4Sg9b/9JVZ9EUOaMuNP1E
	BChVZEUp+VEM9Re9AIobHIojMMzEGoW9CMy1TKOc=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v9 2/6] x86/boot: introduce module release
Date: Fri, 15 Nov 2024 08:12:00 -0500
Message-Id: <20241115131204.32135-3-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241115131204.32135-1-dpsmith@apertussolutions.com>
References: <20241115131204.32135-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

A precarious approach was used to release the pages used to hold a boot module.
The precariousness stemmed from the fact that in the case of PV dom0, the
initrd module pages may be either mapped or copied into the dom0 address space.
In the former case, the PV dom0 construction code will set the size of the
module to zero, relying on discard_initial_images() to skip any modules with a
size of zero. In the latter case, the pages are freed by the PV dom0
construction code. This freeing of pages is done so that in either case, the
initrd variable can be reused for tracking the initrd location in dom0 memory
through the remaining dom0 construction code.

To encapsulate the logical action of releasing a boot module, the function
release_boot_module() is introduced along with the `released` flag added to
boot module. The boot module flag `released` allows the tracking of when a boot
module has been released by release_boot_module().

As part of adopting release_boot_module() the function discard_initial_images()
is renamed to free_boot_modules(), a name that better reflects the functions
actions.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
Changes since v8:
- completely reworked the commit
  - switch backed to a releasing all but pv initrd approach
  - renamed discard_initial_images to free_boot_modules
---
 xen/arch/x86/hvm/dom0_build.c       |  2 +-
 xen/arch/x86/include/asm/bootinfo.h |  2 ++
 xen/arch/x86/include/asm/setup.h    |  4 +++-
 xen/arch/x86/pv/dom0_build.c        | 27 +++++++++++++--------------
 xen/arch/x86/setup.c                | 27 +++++++++++++++------------
 5 files changed, 34 insertions(+), 28 deletions(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index d1bdf1b14601..d1410e1a02b0 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -755,7 +755,7 @@ static int __init pvh_load_kernel(
     }
 
     /* Free temporary buffers. */
-    discard_initial_images();
+    free_boot_modules();
 
     if ( cmdline != NULL )
     {
diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index b9c94b370d57..f76876386763 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -34,8 +34,10 @@ struct boot_module {
     /*
      * Module State Flags:
      *   relocated: indicates module has been relocated in memory.
+     *   released:  indicates module's pages have been freed.
      */
     bool relocated:1;
+    bool released:1;
 
     /*
      * A boot module may need decompressing by Xen.  Headroom is an estimate of
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index 8a415087e9a4..4ad493637892 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -34,13 +34,15 @@ void setup_io_bitmap(struct domain *d);
 extern struct boot_info xen_boot_info;
 
 unsigned long initial_images_nrpages(nodeid_t node);
-void discard_initial_images(void);
+void free_boot_modules(void);
 
 struct boot_module;
 void *bootstrap_map_bm(const struct boot_module *bm);
 void *bootstrap_map(const module_t *mod);
 void bootstrap_unmap(void);
 
+void release_boot_module(struct boot_module *bm);
+
 struct rangeset;
 int remove_xen_ranges(struct rangeset *r);
 
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 6be3d7745fab..2580162f3df4 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -649,9 +649,12 @@ static int __init dom0_construct(struct boot_info *bi, struct domain *d)
                 }
             memcpy(page_to_virt(page), mfn_to_virt(initrd->mod->mod_start),
                    initrd_len);
-            mpt_alloc = pfn_to_paddr(initrd->mod->mod_start);
-            init_domheap_pages(mpt_alloc,
-                               mpt_alloc + PAGE_ALIGN(initrd_len));
+            /*
+             * The initrd was copied but the initrd variable is reused in the
+             * calculations below. As to not leak the memory used for the
+             * module free at this time.
+             */
+            release_boot_module(initrd);
             initrd_mfn = mfn_x(page_to_mfn(page));
             initrd->mod->mod_start = initrd_mfn;
         }
@@ -660,18 +663,14 @@ static int __init dom0_construct(struct boot_info *bi, struct domain *d)
             while ( count-- )
                 if ( assign_pages(mfn_to_page(_mfn(mfn++)), 1, d, 0) )
                     BUG();
+            /*
+             * We have mapped the initrd directly into dom0, and assigned the
+             * pages. Tell the boot_module handling that we've freed it, so the
+             * memory is left alone.
+             */
+            initrd->released = true;
         }
 
-        /*
-         * We have either:
-         * - Mapped the initrd directly into dom0, or
-         * - Copied it and freed the module.
-         *
-         * Either way, tell discard_initial_images() to not free it a second
-         * time.
-         */
-        initrd->mod->mod_end = 0;
-
         iommu_memory_setup(d, "initrd", mfn_to_page(_mfn(initrd_mfn)),
                            PFN_UP(initrd_len), &flush_flags);
     }
@@ -875,7 +874,7 @@ static int __init dom0_construct(struct boot_info *bi, struct domain *d)
     }
 
     /* Free temporary buffers. */
-    discard_initial_images();
+    free_boot_modules();
 
     /* Set up start info area. */
     si = (start_info_t *)vstartinfo_start;
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 495e90a7e132..0bda1326a485 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -346,27 +346,30 @@ unsigned long __init initial_images_nrpages(nodeid_t node)
     return nr;
 }
 
-void __init discard_initial_images(void) /* a.k.a. Free boot modules */
+void __init release_boot_module(struct boot_module *bm)
+{
+    uint64_t start = pfn_to_paddr(bm->mod->mod_start);
+    uint64_t size  = bm->mod->mod_end;
+
+    ASSERT(!bm->released);
+
+    init_domheap_pages(start, start + PAGE_ALIGN(size));
+
+    bm->released = true;
+}
+
+void __init free_boot_modules(void)
 {
     struct boot_info *bi = &xen_boot_info;
     unsigned int i;
 
     for ( i = 0; i < bi->nr_modules; ++i )
     {
-        uint64_t start = pfn_to_paddr(bi->mods[i].mod->mod_start);
-        uint64_t size  = bi->mods[i].mod->mod_end;
-
-        /*
-         * Sometimes the initrd is mapped, rather than copied, into dom0.
-         * Size being 0 is how we're instructed to leave the module alone.
-         */
-        if ( size == 0 )
+        if ( bi->mods[i].released )
             continue;
 
-        init_domheap_pages(start, start + PAGE_ALIGN(size));
+        release_boot_module(&bi->mods[i]);
     }
-
-    bi->nr_modules = 0;
 }
 
 static void __init init_idle_domain(void)
-- 
2.30.2


