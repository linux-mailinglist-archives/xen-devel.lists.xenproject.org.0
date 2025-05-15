Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7A3AB8820
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 15:35:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985573.1371550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYkX-00050H-Tg; Thu, 15 May 2025 13:35:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985573.1371550; Thu, 15 May 2025 13:35:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYkX-0004y5-QL; Thu, 15 May 2025 13:35:49 +0000
Received: by outflank-mailman (input) for mailman id 985573;
 Thu, 15 May 2025 13:35:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WRi0=X7=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1uFYXd-0006hT-Ui
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 13:22:29 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a50a2967-318f-11f0-9ffb-bf95429c2676;
 Thu, 15 May 2025 15:22:28 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1747315173970122.38765931630746;
 Thu, 15 May 2025 06:19:33 -0700 (PDT)
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
X-Inumbo-ID: a50a2967-318f-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; t=1747315176; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cuq8qduxl/hBaTXhwcGw+1cUGIkYyY9sflAeS/u1rJjJPnLjMf8MqCA9wdAigLF4Y9J885hSIJmRdQ8gyrJboJd3pfzyf2YdMS6ptXeiILfctg1IoCL/NpvAoAUxG5YxpOd41/syULdexblF3Y/UBdKFZjU2PjU+31AZdze9dO8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747315176; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=gYB4y96SIDLxZLUe6mZw8W86OeBS41ZZGc8WGg8cXnk=; 
	b=kPuYUvAwBi7Gv3k3wrlTdQb2QuM3xEk/PGHPrC2MckHcSv+80RuJ/lVxzrnV3ONoDsr0zs20MhxMkPRMgAI9bbvQQMD0+i7RrCrcY1YGlvLkIa2Ywo3xWC0fo3Ujn9WTZWKQG6ymd/IM3MW9/9mOOFEUG3Zd/Eeg1HFZBtfgjYI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747315176;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=gYB4y96SIDLxZLUe6mZw8W86OeBS41ZZGc8WGg8cXnk=;
	b=gvee8Gq3Z+fOhB8geVfFd4S3muzJKHOHmpZmsBIv6Ykn9gb7zmnwtyuuXu6061Ak
	kGSUdkycpSLubcjf4p3FCH0AxlZirm2d8zCtURsXwUZnotDpICdNem5Ls80x6WJkTCi
	4j8uzYaPw6CLME1Yuz7vJDCIEcDvSlQQ+tX+rNXk=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFCv2 28/38] x86/hyperlaunch: allocate xenstore for domu
Date: Thu, 15 May 2025 09:19:11 -0400
Message-Id: <20250515131912.5019-9-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250515131912.5019-1-dpsmith@apertussolutions.com>
References: <20250515131912.5019-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

During domU construction, a page of memory and an event channel must be setup
for xenstore connection. In this commit, a page from the special page region of
domU is setup as the xenstore page along with an event channel. The page
address and event channel are published in the HVM parameters, so the domain
can be announced to Xenstore.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

---

Changes for RFCv2:
- rewrote to setup event chan after construction has finished
- merged the setting of xenstore boot capabilities flag commit
---
 xen/arch/x86/domain-builder/domain.c      | 56 +++++++++++++++++++++++
 xen/arch/x86/hvm/dom_build.c              | 26 +++++++++++
 xen/arch/x86/include/asm/boot-domain.h    |  3 ++
 xen/arch/x86/include/asm/domain-builder.h |  2 +
 4 files changed, 87 insertions(+)

diff --git a/xen/arch/x86/domain-builder/domain.c b/xen/arch/x86/domain-builder/domain.c
index 5b03e3dce228..de0ee0fcd62c 100644
--- a/xen/arch/x86/domain-builder/domain.c
+++ b/xen/arch/x86/domain-builder/domain.c
@@ -7,6 +7,7 @@
 #include <xen/domain.h>
 #include <xen/domain-builder.h>
 #include <xen/err.h>
+#include <xen/event.h>
 #include <xen/grant_table.h>
 #include <xen/init.h>
 #include <xen/lib.h> /* get types.h for libefl.h */
@@ -16,6 +17,7 @@
 #include <xen/sched.h>
 
 #include <public/bootfdt.h>
+#include <public/hvm/params.h>
 
 #include <asm/bootinfo.h>
 #include <asm/cpu-policy.h>
@@ -191,6 +193,28 @@ unsigned long __init dom_compute_nr_pages(
     return bd->mem_pages;
 }
 
+static int __init alloc_dom_evtchn(
+    const struct boot_domain *d, const struct boot_domain *r,
+    evtchn_port_t *port)
+{
+    int rc;
+    evtchn_alloc_unbound_t ec = {
+        .dom = d->domid,
+        .remote_dom = r->domid,
+    };
+
+    rc = evtchn_alloc_unbound(&ec, 0);
+    if ( rc )
+    {
+        printk(XENLOG_WARNING "Failed allocating event channel for %pd\n",
+               d->d);
+        return rc;
+    }
+
+    *port = ec.port;
+    return 0;
+}
+
 static size_t __init domain_cmdline_size(const struct boot_info *bi,
                                          const struct boot_domain *bd)
 {
@@ -258,6 +282,8 @@ struct domain *__init arch_create_dom(
     if ( bd->domid == DOMID_INVALID )
         /* Create initial domain.  Not d0 for pvshim. */
         bd->domid = get_initial_domain_id();
+    if ( bd->capabilities & DOMAIN_CAPS_XENSTORE )
+        dom_cfg.flags |= XEN_DOMCTL_CDF_xs_domain;
     d = domain_create(bd->domid, &dom_cfg,
             ((bd->capabilities & DOMAIN_CAPS_CONTROL)  ? CDF_privileged : 0) |
             ((bd->capabilities & DOMAIN_CAPS_HARDWARE) ? CDF_hardware   : 0));
@@ -328,6 +354,36 @@ struct domain *__init arch_create_dom(
 
 int __init arch_builder_finalize(struct boot_info *bi)
 {
+    unsigned int i;
+    struct boot_domain *xs_bd = NULL;
+
+    i = first_boot_domain_index(bi, DOMAIN_CAPS_XENSTORE);
+    if ( i > MAX_NR_BOOTDOMS )
+        printk(XENLOG_WARNING "No xenstore domain configured\n");
+    else
+        xs_bd = &bi->domains[i];
+
+    for ( i = 0; i < bi->nr_domains; i++ )
+    {
+        struct boot_domain *bd = &bi->domains[i];
+
+        if ( xs_bd && xs_bd->d && (bd != xs_bd) && bd->xs_page )
+        {
+            evtchn_port_t xs_evtchn = 0;
+
+            if ( alloc_dom_evtchn(bd, xs_bd, &xs_evtchn) < 0 )
+                continue;
+
+            /* Is HVM/PVH */
+            if ( !(bd->mode & BUILD_MODE_PARAVIRT) )
+            {
+                uint64_t *params = bd->d->arch.hvm.params;
+                params[HVM_PARAM_STORE_PFN] = bd->xs_page;
+                params[HVM_PARAM_STORE_EVTCHN] = xs_evtchn;
+            }
+        }
+    }
+
     /* Free temporary buffers. */
     free_boot_modules();
 
diff --git a/xen/arch/x86/hvm/dom_build.c b/xen/arch/x86/hvm/dom_build.c
index 58fc40916df5..aec356cb2e46 100644
--- a/xen/arch/x86/hvm/dom_build.c
+++ b/xen/arch/x86/hvm/dom_build.c
@@ -10,6 +10,7 @@
 
 #include <xen/acpi.h>
 #include <xen/domain-builder.h>
+#include <xen/event.h>
 #include <xen/iommu.h>
 #include <xen/init.h>
 #include <xen/softirq.h>
@@ -20,6 +21,7 @@
 #include <public/arch-x86/hvm/start_info.h>
 #include <public/hvm/e820.h>
 #include <public/hvm/hvm_vcpu.h>
+#include <public/hvm/params.h>
 
 #include <asm/bootinfo.h>
 #include <asm/bzimage.h>
@@ -896,6 +898,27 @@ static int __init pvh_load_kernel(
     return 0;
 }
 
+static int __init alloc_xenstore_page(struct boot_domain *bd)
+{
+    paddr_t xs_addr = special_pfn(SPECIALPAGE_XENSTORE) << PAGE_SHIFT;
+    uint32_t fields[7] = { 0, 0, 0, 0, 0, 1, 0};
+
+    /*
+     * Set connection field to XENSTORE_RECONNECT, the
+     * xenstore_domain_interface fields are located after the two 1024 buffers.
+     */
+    if ( hvm_copy_to_guest_phys(xs_addr + 2048, fields, sizeof(fields),
+                                bd->d->vcpu[0]) )
+    {
+        printk("Unable to set xenstore connection state\n");
+        return -EFAULT;
+    }
+
+    bd->xs_page = gfn_x(gaddr_to_gfn(xs_addr));
+
+    return 0;
+}
+
 int __init dom_construct_pvh(struct boot_domain *bd)
 {
     paddr_t entry, start_info;
@@ -972,6 +995,9 @@ int __init dom_construct_pvh(struct boot_domain *bd)
         return rc;
     }
 
+    if ( !is_xenstore_domain(bd->d) )
+        alloc_xenstore_page(bd);
+
     if ( opt_dom0_verbose )
     {
         printk("Dom%u memory map:\n", bd->domid);
diff --git a/xen/arch/x86/include/asm/boot-domain.h b/xen/arch/x86/include/asm/boot-domain.h
index c60b19c58aef..a527342768de 100644
--- a/xen/arch/x86/include/asm/boot-domain.h
+++ b/xen/arch/x86/include/asm/boot-domain.h
@@ -10,6 +10,7 @@
 
 #include <public/xen.h>
 #include <public/bootfdt.h>
+#include <public/event_channel.h>
 
 struct boot_domain {
     domid_t domid;
@@ -33,6 +34,8 @@ struct boot_domain {
     const char *cmdline;
 
     struct domain *d;
+
+    xen_pfn_t xs_page;
 };
 
 static inline bool __init has_dom0_caps(const struct boot_domain *bd)
diff --git a/xen/arch/x86/include/asm/domain-builder.h b/xen/arch/x86/include/asm/domain-builder.h
index 15a0e3b12c02..6ef4776faf9a 100644
--- a/xen/arch/x86/include/asm/domain-builder.h
+++ b/xen/arch/x86/include/asm/domain-builder.h
@@ -15,6 +15,8 @@ int hvm_steal_ram(
     struct domain *d, unsigned long size, unsigned long align, paddr_t limit,
     paddr_t *addr);
 
+int hvm_alloc_xenstore_page(struct boot_domain *bd, xen_pfn_t *xs_gfn);
+
 unsigned long dom_paging_pages(
     const struct boot_domain *d, unsigned long nr_pages);
 
-- 
2.30.2


