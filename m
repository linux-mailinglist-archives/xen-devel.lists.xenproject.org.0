Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5339D6AD1
	for <lists+xen-devel@lfdr.de>; Sat, 23 Nov 2024 19:31:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842185.1257656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEuuC-0003xq-8g; Sat, 23 Nov 2024 18:30:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842185.1257656; Sat, 23 Nov 2024 18:30:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEuuC-0003vP-1E; Sat, 23 Nov 2024 18:30:52 +0000
Received: by outflank-mailman (input) for mailman id 842185;
 Sat, 23 Nov 2024 18:30:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=waGT=SS=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tEunD-0006MT-Hw
 for xen-devel@lists.xenproject.org; Sat, 23 Nov 2024 18:23:39 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d839d35-a9c8-11ef-a0cc-8be0dac302b0;
 Sat, 23 Nov 2024 19:23:37 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1732386074952625.5918532207943;
 Sat, 23 Nov 2024 10:21:14 -0800 (PST)
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
X-Inumbo-ID: 0d839d35-a9c8-11ef-a0cc-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6IjBkODM5ZDM1LWE5YzgtMTFlZi1hMGNjLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMzg2MjE3LjU3MDk5Nywic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1732386079; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JfjUzRuVdgu03JmMJ5s2O0voxRwbLJ4CBYjs3PrFIMUo88e9iNtvVL1L+OFGNHhYT94FoIq72vGrI96jmy8ArAJRs/qmc7JA1n0W2fw185eflojlr2SEhNgFRfFzbrCTznDSV5j+Fud7r3rtxLeoKfV89Sc4R6h0IY+GH702ttg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1732386079; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QKzJS5eFtECZxvuLdDMttAltTe8m1ybZIito+adUWcs=; 
	b=lVOALTE35FkFWXsyQ6e06tDp/mGh/sYIAdoEicwRCaEG4zFWBJejQkbWE3+OX7KRD59N5TcKr2MigVEDzY0ZK2Ifid8u3ASewIIJmpI7yiv2Jysik0cnoQo7qDW/nstV7Wk+KPjyQTdkkovK+sn6CMFldF/KjSKM48XwI0ALVyo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732386079;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=QKzJS5eFtECZxvuLdDMttAltTe8m1ybZIito+adUWcs=;
	b=M6pe5kk4JKInmhmAxvKDezN1KYBLvsWBIvhyOjWo/VOpWSiKjFOrcWrWJyLq8NyA
	kzfE57oAC+F0MgaULEbNNFxcxOWNy5mBFMdWD/AjnwzjgfSgqUIYfcIFCML4gJC9f4L
	P2h3DHF+2yUBF3PtHqNfhmCXX0nR65guQvqqkpoM=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 14/15] x86/hyperlaunch: add max vcpu parsing of hyperlaunch device tree
Date: Sat, 23 Nov 2024 13:20:43 -0500
Message-Id: <20241123182044.30687-15-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241123182044.30687-1-dpsmith@apertussolutions.com>
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Introduce the `cpus` property, named as such for dom0less compatibility, that
represents the maximum number of vpcus to allocate for a domain. In the device
tree, it will be encoded as a u32 value.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/dom0_build.c             |  3 +++
 xen/arch/x86/domain_builder/fdt.c     | 12 ++++++++++++
 xen/arch/x86/include/asm/bootdomain.h |  2 ++
 3 files changed, 17 insertions(+)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 1c3b7ff0e658..7ff052016bfd 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -617,6 +617,9 @@ int __init construct_dom0(struct boot_domain *bd)
     if ( !get_memsize(&dom0_max_size, LONG_MAX) && bd->max_pages )
         dom0_size.nr_pages = bd->max_pages;
 
+    if ( opt_dom0_max_vcpus_max == UINT_MAX && bd->max_vcpus )
+        opt_dom0_max_vcpus_max = bd->max_vcpus;
+
     if ( is_hvm_domain(d) )
         rc = dom0_construct_pvh(bd);
     else if ( is_pv_domain(d) )
diff --git a/xen/arch/x86/domain_builder/fdt.c b/xen/arch/x86/domain_builder/fdt.c
index b8ace5c18c6a..d24e265f2378 100644
--- a/xen/arch/x86/domain_builder/fdt.c
+++ b/xen/arch/x86/domain_builder/fdt.c
@@ -197,6 +197,18 @@ static int __init process_domain_node(
             bd->max_pages = PFN_DOWN(kb * SZ_1K);
             printk("  max memory: %ld\n", bd->max_pages << PAGE_SHIFT);
         }
+        if ( match_fdt_property(fdt, prop, "cpus" ) )
+        {
+            uint32_t val = UINT_MAX;
+            if ( fdt_prop_as_u32(prop, &val) != 0 )
+            {
+                printk("  failed processing max_vcpus for domain %s\n",
+                       name == NULL ? "unknown" : name);
+                return -EINVAL;
+            }
+            bd->max_vcpus = val;
+            printk("  max vcpus: %d\n", bd->max_vcpus);
+        }
     }
 
     fdt_for_each_subnode(node, fdt, dom_node)
diff --git a/xen/arch/x86/include/asm/bootdomain.h b/xen/arch/x86/include/asm/bootdomain.h
index 9a5ba2931665..d144d6173400 100644
--- a/xen/arch/x86/include/asm/bootdomain.h
+++ b/xen/arch/x86/include/asm/bootdomain.h
@@ -28,6 +28,8 @@ struct boot_domain {
     unsigned long min_pages;
     unsigned long max_pages;
 
+    unsigned int max_vcpus;
+
     struct boot_module *kernel;
     struct boot_module *ramdisk;
 
-- 
2.30.2


