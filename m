Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA12AB87C0
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 15:20:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985341.1371281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYVr-0005Ib-GB; Thu, 15 May 2025 13:20:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985341.1371281; Thu, 15 May 2025 13:20:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYVr-0005Cq-AR; Thu, 15 May 2025 13:20:39 +0000
Received: by outflank-mailman (input) for mailman id 985341;
 Thu, 15 May 2025 13:20:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WRi0=X7=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1uFYUZ-0001J6-Ma
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 13:19:19 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 341bbdc6-318f-11f0-9eb6-5ba50f476ded;
 Thu, 15 May 2025 15:19:18 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1747315079782580.7063259387406;
 Thu, 15 May 2025 06:17:59 -0700 (PDT)
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
X-Inumbo-ID: 341bbdc6-318f-11f0-9eb6-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; t=1747315081; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dc5/a+7nd99mo+A/pV6W9eFXyHt+6cZB6ukowXZSI6up/t0WujVEktWTJvgPi+J/cfN2tVPk13yDKqGfa6T9GvW10GLPBDnN9GahnqjQCmGItg3P4hYNVHPl9h2MMiIAXPIVCgjWVIzFy2Bm2cfaoo2wI0asJ5G3qJ5adUX6fn0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747315081; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=MXwElwy2ea4EYXzf8tWnzaA3L9VVZ1JQGx/m4TNLx/Q=; 
	b=ErrrdEYPwrwq7hhzHPDpDunIlLI80AASTEF2mSOu7RzbuNnWOtoJRfAHrjyH/Dmox+gxUunIg7627PtK3WOIR7gYVuFEtu1oHP7H+qa15AG926waHoLf9J/doqyxjmgvLF8STfKuummW4dG3X+jpz1ZuM+CnxQXZ24Te7rym9G8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747315081;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=MXwElwy2ea4EYXzf8tWnzaA3L9VVZ1JQGx/m4TNLx/Q=;
	b=BHkExP0JTjLJ5tFDxrgxJTNa4C3E6sku9rFZPk1jhpt6GabeS0GP/sHXUTN/TGRD
	YtOzcR1Kf223DgVKWoPeKaWuUxkKkOfk5rHYXjhXSabHprHWcKQ1h3pRjdli1sAVO8S
	/xMWaIS+VjX5RLWAGlbgYoiqflJyQuJ4z4gCtdGY=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFCv2 09/38] x86/boot: refactor dom0 page calculation
Date: Thu, 15 May 2025 09:17:15 -0400
Message-Id: <20250515131744.3843-10-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250515131744.3843-1-dpsmith@apertussolutions.com>
References: <20250515131744.3843-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Caution is needed when dom0 is being constructed as PV using an older kernel
that does not have the elf note XEN_ELFNOTE_INIT_P2M. The logic for handling
this situation is embedded directly and takes into account whether dom0 memory
parameters were specified using the negative allocation syntax. To prepare for
generalizing domain page allocation, isolate this logic to a separate handling
function.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/dom0_build.c | 76 +++++++++++++++++++++------------------
 1 file changed, 41 insertions(+), 35 deletions(-)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 02a3c2d249c3..a72064fbae80 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -353,12 +353,50 @@ static void __init calculate_dom0_pages(
     bd->mem_pages = nr_pages;
 }
 
+static void __init dom0_pv_restrict_pages(
+    struct boot_domain *bd, struct elf_dom_parms *parms)
+{
+    if ( (parms->p2m_base == UNSET_ADDR) && !memsize_gt_zero(&dom0_size) &&
+         (!memsize_gt_zero(&dom0_min_size) || (bd->mem_pages > bd->min_pages)) )
+    {
+        /*
+         * Legacy Linux kernels (i.e. such without a XEN_ELFNOTE_INIT_P2M
+         * note) require that there is enough virtual space beyond the initial
+         * allocation to set up their initial page tables. This space is
+         * roughly the same size as the p2m table, so make sure the initial
+         * allocation doesn't consume more than about half the space that's
+         * available between params.virt_base and the address space end.
+         */
+        unsigned long vstart, vend, end;
+        unsigned long initrd_len = bd->ramdisk ? bd->ramdisk->size : 0;
+        size_t sizeof_long = is_pv_32bit_domain(bd->d) ? sizeof(int) : sizeof(long);
+
+        vstart = parms->virt_base;
+        vend = round_pgup(parms->virt_kend);
+        if ( !parms->unmapped_initrd )
+            vend += round_pgup(initrd_len);
+        end = vend + bd->mem_pages * sizeof_long;
+
+        if ( end > vstart )
+            end += end - vstart;
+        if ( end <= vstart ||
+             (sizeof_long < sizeof(end) && end > (1UL << (8 * sizeof_long))) )
+        {
+            end = sizeof_long >= sizeof(end) ? 0 : 1UL << (8 * sizeof_long);
+            bd->mem_pages = (end - vend) / (2 * sizeof_long);
+            if ( memsize_gt_zero(&dom0_min_size) &&
+                 bd->mem_pages < bd->min_pages )
+                bd->mem_pages = bd->min_pages;
+            printk("Dom0 memory clipped to %lu pages\n", bd->mem_pages);
+        }
+    }
+}
+
 unsigned long __init dom0_compute_nr_pages(
     struct boot_domain *bd, struct elf_dom_parms *parms)
 {
     nodeid_t node;
     struct domain *d = bd->d;
-    unsigned long initrd_len = bd->ramdisk ? bd->ramdisk->size : 0;
     unsigned long avail = 0, iommu_pages = 0;
 
     for_each_node_mask ( node, dom0_nodes )
@@ -404,40 +442,8 @@ unsigned long __init dom0_compute_nr_pages(
     /* Clamp according to min/max limits and available memory (final). */
     calculate_dom0_pages(bd, avail);
 
-    if ( is_pv_domain(d) &&
-         (parms->p2m_base == UNSET_ADDR) && !memsize_gt_zero(&dom0_size) &&
-         (!memsize_gt_zero(&dom0_min_size) || (bd->mem_pages > bd->min_pages)) )
-    {
-        /*
-         * Legacy Linux kernels (i.e. such without a XEN_ELFNOTE_INIT_P2M
-         * note) require that there is enough virtual space beyond the initial
-         * allocation to set up their initial page tables. This space is
-         * roughly the same size as the p2m table, so make sure the initial
-         * allocation doesn't consume more than about half the space that's
-         * available between params.virt_base and the address space end.
-         */
-        unsigned long vstart, vend, end;
-        size_t sizeof_long = is_pv_32bit_domain(d) ? sizeof(int) : sizeof(long);
-
-        vstart = parms->virt_base;
-        vend = round_pgup(parms->virt_kend);
-        if ( !parms->unmapped_initrd )
-            vend += round_pgup(initrd_len);
-        end = vend + bd->mem_pages * sizeof_long;
-
-        if ( end > vstart )
-            end += end - vstart;
-        if ( end <= vstart ||
-             (sizeof_long < sizeof(end) && end > (1UL << (8 * sizeof_long))) )
-        {
-            end = sizeof_long >= sizeof(end) ? 0 : 1UL << (8 * sizeof_long);
-            bd->mem_pages = (end - vend) / (2 * sizeof_long);
-            if ( memsize_gt_zero(&dom0_min_size) &&
-                 bd->mem_pages < bd->min_pages )
-                bd->mem_pages = bd->min_pages;
-            printk("Dom0 memory clipped to %lu pages\n", bd->mem_pages);
-        }
-    }
+    if ( is_pv_domain(d) )
+        dom0_pv_restrict_pages(bd, parms);
 
     d->max_pages = min_t(unsigned long, bd->max_pages, UINT_MAX);
 
-- 
2.30.2


