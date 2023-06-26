Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D356D73D675
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 05:40:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555031.866653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd53-0000WM-E6; Mon, 26 Jun 2023 03:39:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555031.866653; Mon, 26 Jun 2023 03:39:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd52-0000Ah-JV; Mon, 26 Jun 2023 03:39:56 +0000
Received: by outflank-mailman (input) for mailman id 555031;
 Mon, 26 Jun 2023 03:39:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=24BZ=CO=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qDd1U-0007ej-2x
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 03:36:16 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 9a697aa3-13d2-11ee-b237-6b7b168915f2;
 Mon, 26 Jun 2023 05:36:15 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C0F352F4;
 Sun, 25 Jun 2023 20:36:58 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D28403F64C;
 Sun, 25 Jun 2023 20:36:10 -0700 (PDT)
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
X-Inumbo-ID: 9a697aa3-13d2-11ee-b237-6b7b168915f2
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v3 21/52] xen: introduce CONFIG_HAS_PAGING_MEMPOOL
Date: Mon, 26 Jun 2023 11:34:12 +0800
Message-Id: <20230626033443.2943270-22-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626033443.2943270-1-Penny.Zheng@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ARM MPU system doesn't need to use paging memory pool, as MPU memory mapping
table(xen_mpumap) at most takes only one 4KB page, which is enough to manage
the maximum 255 MPU memory regions, for all EL2 stage 1 translation and EL1
stage 2 translation.

We wrap all paging-memory-pool-related codes with new Kconfig
CONFIG_HAS_PAGING_MEMPOOL in common codes.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v3:
- new patch
---
 xen/arch/arm/Kconfig        | 1 +
 xen/arch/arm/domain.c       | 2 ++
 xen/arch/arm/domain_build.c | 2 ++
 xen/arch/arm/p2m.c          | 2 ++
 xen/arch/x86/Kconfig        | 1 +
 xen/common/Kconfig          | 3 +++
 xen/common/domctl.c         | 2 ++
 7 files changed, 13 insertions(+)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index a88500fb50..b2710c1c31 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -62,6 +62,7 @@ source "arch/Kconfig"
 config HAS_MMU
 	bool "Memory Management Unit support in a VMSA system"
 	default y
+	select HAS_PAGING_MEMPOOL
 	select HAS_PMAP
 	select HAS_VMAP
 	help
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index add9929b79..7993cefceb 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -1072,6 +1072,7 @@ int domain_relinquish_resources(struct domain *d)
          */
         p2m_clear_root_pages(&d->arch.p2m);
 
+#ifdef CONFIG_HAS_PAGING_MEMPOOL
     PROGRESS(p2m):
         ret = p2m_teardown(d);
         if ( ret )
@@ -1081,6 +1082,7 @@ int domain_relinquish_resources(struct domain *d)
         ret = p2m_teardown_allocation(d);
         if( ret )
             return ret;
+#endif
 
     PROGRESS(done):
         break;
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index d0d6be922d..260ef9ba6f 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -3830,11 +3830,13 @@ static int __init construct_domU(struct domain *d,
                 p2m_mem_mb << (20 - PAGE_SHIFT) :
                 domain_p2m_pages(mem, d->max_vcpus);
 
+#ifdef CONFIG_PAGING_MEMPOOL
     spin_lock(&d->arch.paging.lock);
     rc = p2m_set_allocation(d, p2m_pages, NULL);
     spin_unlock(&d->arch.paging.lock);
     if ( rc != 0 )
         return rc;
+#endif
 
     printk("*** LOADING DOMU cpus=%u memory=%#"PRIx64"KB ***\n",
            d->max_vcpus, mem);
diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index b2771e0bed..e29b11334e 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -361,11 +361,13 @@ void p2m_final_teardown(struct domain *d)
      * where relinquish_p2m_mapping() has been called.
      */
 
+#ifdef CONFIG_HAS_PAGING_MEMPOOL
     ASSERT(page_list_empty(&p2m->pages));
 
     while ( p2m_teardown_allocation(d) == -ERESTART )
         continue; /* No preemption support here */
     ASSERT(page_list_empty(&d->arch.paging.p2m_freelist));
+#endif
 
     if ( p2m->root )
         free_domheap_pages(p2m->root, P2M_ROOT_ORDER);
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 033cc2332e..082069f1cc 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -21,6 +21,7 @@ config X86
 	select HAS_IOPORTS
 	select HAS_KEXEC
 	select HAS_NS16550
+	select HAS_PAGING_MEMPOOL
 	select HAS_PASSTHROUGH
 	select HAS_PCI
 	select HAS_PCI_MSI
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 2c29e89b75..019a123320 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -54,6 +54,9 @@ config HAS_IOPORTS
 config HAS_KEXEC
 	bool
 
+config HAS_PAGING_MEMPOOL
+	bool
+
 config HAS_PDX
 	bool
 
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 505e29c0dc..c5442992b9 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -844,6 +844,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
         ret = iommu_do_domctl(op, d, u_domctl);
         break;
 
+#ifdef CONFIG_HAS_PAGING_MEMPOOL
     case XEN_DOMCTL_get_paging_mempool_size:
         ret = arch_get_paging_mempool_size(d, &op->u.paging_mempool.size);
         if ( !ret )
@@ -857,6 +858,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
             ret = hypercall_create_continuation(
                 __HYPERVISOR_domctl, "h", u_domctl);
         break;
+#endif
 
     default:
         ret = arch_do_domctl(op, d, u_domctl);
-- 
2.25.1


