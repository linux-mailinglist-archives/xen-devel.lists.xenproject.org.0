Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AD2A945AF
	for <lists+xen-devel@lfdr.de>; Sun, 20 Apr 2025 00:10:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.960059.1352166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GOa-0001AI-FN; Sat, 19 Apr 2025 22:10:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 960059.1352166; Sat, 19 Apr 2025 22:10:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GOa-00015C-Ab; Sat, 19 Apr 2025 22:10:44 +0000
Received: by outflank-mailman (input) for mailman id 960059;
 Sat, 19 Apr 2025 22:10:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nqik=XF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1u6GOY-0007X1-RK
 for xen-devel@lists.xenproject.org; Sat, 19 Apr 2025 22:10:42 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20d2f687-1d6b-11f0-9ffb-bf95429c2676;
 Sun, 20 Apr 2025 00:10:41 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1745100529351514.2214468763436;
 Sat, 19 Apr 2025 15:08:49 -0700 (PDT)
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
X-Inumbo-ID: 20d2f687-1d6b-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; t=1745100532; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=T1aF5NN6TQljao9et5SXqFehz11Af9QnkzBQFOWCzNE44VcUVNMM2RbVQs/C8P7PFEAvv6fiocvlGE/YsKM36kniCkssiwi50nlQfb5Lu9ucCzMbs3AiaNEOOhAcyJtXNeL0eVFiCC9zyHdjSCiMykbXZ9XggHq4Gg3mu68lR50=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745100532; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dHzsr1tvYnNwRUTIMNNdv9WOz0SDF5NOBLHUdiE196Q=; 
	b=cQOJOTh99Hm7F629nFKX95odWCD0sT/jjGnI9UsgJZUCPcPylhDT8f+rvcXV32+pt1ZXDBijelAlfD+JYZT6K3utduJkham17dkASvjpsOTsq5ttAQK+29UTr2Z2b03m/UFUcWB5EcRC/rrR/ozcvEIr7q287S9Lcv/Y/hgDDqI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745100532;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=dHzsr1tvYnNwRUTIMNNdv9WOz0SDF5NOBLHUdiE196Q=;
	b=O+2YELmPK+BP1TVrgSsaiHBScKLb1fHZVGyy3WgIojkl6V4VISubM9uyFZa7a/ZZ
	E2V+cmwGPDzkYPlfxx0NAWDn6ZZRWWrWkCuWyFdHvZ5DqU7XKVoLJdCusQZfDbgbEAh
	/PebNTuCwWgQYslioghtUOboqFrcxo9PQVp1uqkw=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC 12/38] x86/boot: generalize compute number of domain pages
Date: Sat, 19 Apr 2025 18:07:54 -0400
Message-Id: <20250419220820.4234-13-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250419220820.4234-1-dpsmith@apertussolutions.com>
References: <20250419220820.4234-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The amount of pages for a domain to be allocated is based on the physical nodes
a domain may be scheduled. For dom0, this can be restricted down from available
nodes via the dom0_nodes command line parameter.

Refactor dom0_compute_nr_pages() such that only apply the dom0_nodes
restriction only if the domain has the control domain or hardware domain
capability flag set. In doing so, also rename the function to
dom_compute_nr_pages().

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/dom0_build.c             | 16 +++++++++++++---
 xen/arch/x86/hvm/dom0_build.c         |  2 +-
 xen/arch/x86/include/asm/dom0_build.h |  2 +-
 xen/arch/x86/pv/dom0_build.c          |  2 +-
 4 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 1413e8c634a7..53ab1afbaa1f 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -377,14 +377,23 @@ static void __init dom0_pv_restrict_pages(
     }
 }
 
-unsigned long __init dom0_compute_nr_pages(
+unsigned long __init dom_compute_nr_pages(
     struct boot_domain *bd, struct elf_dom_parms *parms)
 {
     nodeid_t node;
+    nodemask_t nodes = { 0 };
     struct domain *d = bd->d;
     unsigned long avail = 0, iommu_pages = 0;
 
-    for_each_node_mask ( node, dom0_nodes )
+    nodes_or(nodes, nodes, node_online_map);
+
+    /* If building dom0 or hwdom, apply command line restriction. */
+    if ( bd->capabilities & (BUILD_CAPS_CONTROL | BUILD_CAPS_HARDWARE) )
+        nodes_and(nodes, nodes, dom0_nodes);
+
+    ASSERT(nodes_weight(nodes) != 0);
+
+    for_each_node_mask ( node, nodes )
         avail += avail_domheap_pages_region(node, 0, 0) +
                  initial_images_nrpages(node);
 
@@ -396,7 +405,8 @@ unsigned long __init dom0_compute_nr_pages(
         avail -= d->max_vcpus - 1;
 
     /* Reserve memory for iommu_dom0_init() (rough estimate). */
-    if ( is_iommu_enabled(d) && !iommu_hwdom_passthrough )
+    if ( is_hardware_domain(d) && is_iommu_enabled(d)
+         && !iommu_hwdom_passthrough )
     {
         unsigned int s;
 
diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index d3ad90348a1f..f59af0e72810 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -401,7 +401,7 @@ static __init void pvh_setup_e820(struct domain *d, unsigned long nr_pages)
 
 static void __init pvh_init_p2m(struct boot_domain *bd)
 {
-    unsigned long nr_pages = dom0_compute_nr_pages(bd, NULL);
+    unsigned long nr_pages = dom_compute_nr_pages(bd, NULL);
     bool preempted;
 
     pvh_setup_e820(bd->d, nr_pages);
diff --git a/xen/arch/x86/include/asm/dom0_build.h b/xen/arch/x86/include/asm/dom0_build.h
index 81717b49b4ae..7275bcf9ba6b 100644
--- a/xen/arch/x86/include/asm/dom0_build.h
+++ b/xen/arch/x86/include/asm/dom0_build.h
@@ -13,7 +13,7 @@ void dom0_set_affinity(struct domain *dom0);
 int dom0_setup_permissions(struct domain *d);
 
 struct boot_domain;
-unsigned long dom0_compute_nr_pages(
+unsigned long dom_compute_nr_pages(
     struct boot_domain *bd, struct elf_dom_parms *parms);
 
 int dom0_construct_pv(struct boot_domain *bd);
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index f8844b858082..ad4d1cc3520c 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -504,7 +504,7 @@ static int __init dom0_construct(struct boot_domain *bd)
         }
     }
 
-    nr_pages = dom0_compute_nr_pages(bd, &parms);
+    nr_pages = dom_compute_nr_pages(bd, &parms);
 
 #ifdef CONFIG_PV32
     if ( elf_32bit(&elf) )
-- 
2.30.2


