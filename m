Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AD29D6AC5
	for <lists+xen-devel@lfdr.de>; Sat, 23 Nov 2024 19:24:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842146.1257586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEunP-0008Qk-Re; Sat, 23 Nov 2024 18:23:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842146.1257586; Sat, 23 Nov 2024 18:23:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEunP-0008OR-Or; Sat, 23 Nov 2024 18:23:51 +0000
Received: by outflank-mailman (input) for mailman id 842146;
 Sat, 23 Nov 2024 18:23:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=waGT=SS=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tEunN-0008OL-R3
 for xen-devel@lists.xenproject.org; Sat, 23 Nov 2024 18:23:49 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12f8c85e-a9c8-11ef-99a3-01e77a169b0f;
 Sat, 23 Nov 2024 19:23:46 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1732386076488696.0833111040206;
 Sat, 23 Nov 2024 10:21:16 -0800 (PST)
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
X-Inumbo-ID: 12f8c85e-a9c8-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6IjEyZjhjODVlLWE5YzgtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMzg2MjI2LjQ3NTY0NSwic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1732386081; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=T+mA76iBA1TcOBLOKRxAmyDYO7cT37goqM0wyAVnB3jGTpFBGMJH+CYXP1vptb902FhHAtSkWBsayFvWYTQdBJMdDplLYQBXkCNjRLM5R0z0YGm40Vij4auGCI2N5/m1rw64g2OMBIqb38CP69q15OrRGtg7gbDquayuwJ+zm2U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1732386081; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=kGDrQzVGJffHLng67CVtl7JaehFGVtrHTRbUgIidSbY=; 
	b=Gh0kjY7wAwKetrAzgASO0zmvpK5j7LEtxYZ8E0ZncQlONLliPcwV2Rxb+7alua6NQYqDJER2emMob9O6cBTxZ4CWXVvQK6JgJaJ+8OFrpM78yWILtf8hXTKnpabQRbbe3Kym2yPg6zxYWlum/YGbRMcvJmvSJV1bZHwIw656hCg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732386081;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=kGDrQzVGJffHLng67CVtl7JaehFGVtrHTRbUgIidSbY=;
	b=pp1Zn23W/AezqSEvTrK72Wd0GClkVvC62Eov5f65Kgog1ZaEBMu+l0OZQaEsUIgk
	iWV1cAb27Cnmbl1Tf7kMPYmDpw8DbYnNnq5dXsDQX9Z7xfNe51hRASm3cpUTqh3HYDY
	IZ+q4OSbjePDCpdYzWjwqS5RzLydJrxSOUzPn1/Y=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 15/15] x86/hyperlaunch: add capabilities to boot domain
Date: Sat, 23 Nov 2024 13:20:44 -0500
Message-Id: <20241123182044.30687-16-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241123182044.30687-1-dpsmith@apertussolutions.com>
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Introduce the ability to assign capabilities to a domain via its definition in
device tree. The first capability enabled to select is the control domain
capability. The capability property is a bitfield in both the device tree and
`struct boot_domain`.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/domain_builder/core.c    |  2 +-
 xen/arch/x86/domain_builder/fdt.c     | 13 +++++++++++++
 xen/arch/x86/include/asm/bootdomain.h |  4 ++++
 xen/arch/x86/setup.c                  |  6 +++++-
 4 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/domain_builder/core.c b/xen/arch/x86/domain_builder/core.c
index 95cab06e6159..eaa019472724 100644
--- a/xen/arch/x86/domain_builder/core.c
+++ b/xen/arch/x86/domain_builder/core.c
@@ -93,9 +93,9 @@ void __init builder_init(struct boot_info *bi)
         i = first_boot_module_index(bi, BOOTMOD_UNKNOWN);
         bi->mods[i].type = BOOTMOD_KERNEL;
         bi->domains[0].kernel = &bi->mods[i];
+        bi->domains[0].capabilities |= BUILD_CAPS_CONTROL;
         bi->nr_domains = 1;
     }
-
 }
 
 /*
diff --git a/xen/arch/x86/domain_builder/fdt.c b/xen/arch/x86/domain_builder/fdt.c
index d24e265f2378..9499e337938c 100644
--- a/xen/arch/x86/domain_builder/fdt.c
+++ b/xen/arch/x86/domain_builder/fdt.c
@@ -209,6 +209,19 @@ static int __init process_domain_node(
             bd->max_vcpus = val;
             printk("  max vcpus: %d\n", bd->max_vcpus);
         }
+        if ( match_fdt_property(fdt, prop, "capabilities" ) )
+        {
+            if ( fdt_prop_as_u32(prop, &bd->capabilities) != 0 )
+            {
+                printk("  failed processing domain id for domain %s\n",
+                       name == NULL ? "unknown" : name);
+                return -EINVAL;
+            }
+            printk("  caps: ");
+            if ( bd->capabilities & BUILD_CAPS_CONTROL )
+                printk("c");
+            printk("\n");
+        }
     }
 
     fdt_for_each_subnode(node, fdt, dom_node)
diff --git a/xen/arch/x86/include/asm/bootdomain.h b/xen/arch/x86/include/asm/bootdomain.h
index d144d6173400..51ebf1f68189 100644
--- a/xen/arch/x86/include/asm/bootdomain.h
+++ b/xen/arch/x86/include/asm/bootdomain.h
@@ -18,6 +18,10 @@ struct boot_domain {
 
     domid_t domid;
 
+#define BUILD_CAPS_NONE          (0)
+#define BUILD_CAPS_CONTROL       (1 << 0)
+    uint32_t capabilities;
+
                                           /* On     | Off    */
 #define BUILD_MODE_PARAVIRT      (1 << 0) /* PV     | PVH/HVM */
 #define BUILD_MODE_ENABLE_DM     (1 << 1) /* HVM    | PVH     */
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index dae25721994d..28e750a420e8 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -992,6 +992,7 @@ static size_t __init domain_cmdline_size(
 static struct domain *__init create_dom0(struct boot_info *bi)
 {
     char *cmdline = NULL;
+    int create_flags = 0;
     struct xen_domctl_createdomain dom0_cfg = {
         .flags = IS_ENABLED(CONFIG_TBOOT) ? XEN_DOMCTL_CDF_s3_integrity : 0,
         .max_evtchn_port = -1,
@@ -1023,7 +1024,10 @@ static struct domain *__init create_dom0(struct boot_info *bi)
     /* Create initial domain.  Not d0 for pvshim. */
     if ( bd->domid == DOMID_INVALID )
         bd->domid = get_initial_domain_id();
-    d = domain_create(bd->domid, &dom0_cfg, pv_shim ? 0 : CDF_privileged);
+    if ( bd->capabilities & BUILD_CAPS_CONTROL )
+            create_flags |= CDF_privileged;
+    d = domain_create(bd->domid, &dom0_cfg,
+                      pv_shim ? 0 : create_flags);
     if ( IS_ERR(d) )
         panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
 
-- 
2.30.2


