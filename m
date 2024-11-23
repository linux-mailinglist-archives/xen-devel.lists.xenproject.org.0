Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD15C9D6AD5
	for <lists+xen-devel@lfdr.de>; Sat, 23 Nov 2024 19:31:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842209.1257682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEuuT-0005d6-At; Sat, 23 Nov 2024 18:31:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842209.1257682; Sat, 23 Nov 2024 18:31:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEuuT-0005Wm-5k; Sat, 23 Nov 2024 18:31:09 +0000
Received: by outflank-mailman (input) for mailman id 842209;
 Sat, 23 Nov 2024 18:31:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=waGT=SS=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tEumt-0006MT-Ib
 for xen-devel@lists.xenproject.org; Sat, 23 Nov 2024 18:23:19 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 019bc668-a9c8-11ef-a0cc-8be0dac302b0;
 Sat, 23 Nov 2024 19:23:17 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1732386071864907.6802124955447;
 Sat, 23 Nov 2024 10:21:11 -0800 (PST)
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
X-Inumbo-ID: 019bc668-a9c8-11ef-a0cc-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6IjAxOWJjNjY4LWE5YzgtMTFlZi1hMGNjLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMzg2MTk3LjYyNTczMSwic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1732386076; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jiDTkyhg1PvFAUImU9Eo45XMlkkg3TroZ5+v4MjHS3CahYpFLkwPj3f22Zx/0497GWdS3WnROUVhPfMTq438fM8CeTa/RSAGbDTcyPdxNq5vf5FeU5EVuBadu3mu2ucFEbeLEAeRIGl4FKXLUb2MljtXUbTthVvqWnlbaEzS9ug=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1732386076; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=P31ngclTABjM2fHDD0BXApDz5VKpKh+1+vkjeCGngCQ=; 
	b=Y9xbEq5vXvq8Xg1tPQmj+65BEzwe0hZEMedD3bDtdI6U19BSiq92TqKEn5cnIVQUvRFLqRyEulHaltnWAwV0mliJWIuNsuMqIC4TH/ZNBhK5B5G8zTWsTTV+yk4qz6vHZDX0hY5+tYY8EAHV1CbipDz90H4t8WLPVZRzUSNLLn8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732386076;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=P31ngclTABjM2fHDD0BXApDz5VKpKh+1+vkjeCGngCQ=;
	b=kORFGEXrPEW+vOCh1FJPls/nJ1VRBxFBecSurziXVRVg71GWTDZAGQ9G6uS61+F3
	TmxBqBlcfXJvQhlO/3ix3o7m31RBYD/kieijkBIXuIG7SJCYyHU+EIaapgHLUfAorLX
	wIC1TVruiDFgnEHLQGha1Z3iScFVVtmc3mz1QTck=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 12/15] x86/hyperlaunch: specify dom0 mode with device tree
Date: Sat, 23 Nov 2024 13:20:41 -0500
Message-Id: <20241123182044.30687-13-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241123182044.30687-1-dpsmith@apertussolutions.com>
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Enable selecting the mode in which the domain will be built and ran. This
includes:

- whether it will be either a 32/64 bit domain
- if it will be run as a PV or HVM domain
- and if it will require a device model (not applicable for dom0)

In the device tree, this will be represented as a bit map that will be carried
through into struct boot_domain.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/domain_builder/fdt.c     | 19 +++++++++++++++++++
 xen/arch/x86/include/asm/bootdomain.h |  6 ++++++
 xen/arch/x86/setup.c                  |  3 ++-
 3 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/domain_builder/fdt.c b/xen/arch/x86/domain_builder/fdt.c
index 3a6b4fbc09a9..09e72d96a752 100644
--- a/xen/arch/x86/domain_builder/fdt.c
+++ b/xen/arch/x86/domain_builder/fdt.c
@@ -141,6 +141,25 @@ static int __init process_domain_node(
             bd->domid = (domid_t)val;
             printk("  domid: %d\n", bd->domid);
         }
+        if ( match_fdt_property(fdt, prop, "mode" ) )
+        {
+            if ( fdt_prop_as_u32(prop, &bd->mode) != 0 )
+            {
+                printk("  failed processing mode for domain %s\n",
+                       name == NULL ? "unknown" : name);
+                return -EINVAL;
+            }
+
+            printk("  mode: ");
+            if ( !(bd->mode & BUILD_MODE_PARAVIRT) ) {
+                if ( bd->mode & BUILD_MODE_ENABLE_DM )
+                    printk("HVM\n");
+                else
+                    printk("PVH\n");
+            }
+            else
+                printk("PV\n");
+        }
     }
 
     fdt_for_each_subnode(node, fdt, dom_node)
diff --git a/xen/arch/x86/include/asm/bootdomain.h b/xen/arch/x86/include/asm/bootdomain.h
index ffda1509a63f..50c33d183e07 100644
--- a/xen/arch/x86/include/asm/bootdomain.h
+++ b/xen/arch/x86/include/asm/bootdomain.h
@@ -18,6 +18,12 @@ struct boot_domain {
 
     domid_t domid;
 
+                                          /* On     | Off    */
+#define BUILD_MODE_PARAVIRT      (1 << 0) /* PV     | PVH/HVM */
+#define BUILD_MODE_ENABLE_DM     (1 << 1) /* HVM    | PVH     */
+#define BUILD_MODE_LONG          (1 << 2) /* 64 BIT | 32 BIT  */
+    uint32_t mode;
+
     struct boot_module *kernel;
     struct boot_module *ramdisk;
 
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 317349b80ac6..dae25721994d 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1006,7 +1006,8 @@ static struct domain *__init create_dom0(struct boot_info *bi)
     struct boot_domain *bd = &bi->domains[0];
     struct domain *d;
 
-    if ( opt_dom0_pvh )
+    if ( opt_dom0_pvh ||
+         (bi->hyperlaunch_enabled && !(bd->mode & BUILD_MODE_PARAVIRT)) )
     {
         dom0_cfg.flags |= (XEN_DOMCTL_CDF_hvm |
                            ((hvm_hap_supported() && !opt_dom0_shadow) ?
-- 
2.30.2


