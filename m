Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6659FCC45
	for <lists+xen-devel@lfdr.de>; Thu, 26 Dec 2024 18:10:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863332.1274790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQrNX-0003bh-9u; Thu, 26 Dec 2024 17:10:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863332.1274790; Thu, 26 Dec 2024 17:10:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQrNX-0003Ya-6t; Thu, 26 Dec 2024 17:10:31 +0000
Received: by outflank-mailman (input) for mailman id 863332;
 Thu, 26 Dec 2024 17:10:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vkhu=TT=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tQrEE-0005x0-Te
 for xen-devel@lists.xenproject.org; Thu, 26 Dec 2024 17:00:54 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7093153-c3aa-11ef-a0da-8be0dac302b0;
 Thu, 26 Dec 2024 18:00:54 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 17352322892101014.8069874254229;
 Thu, 26 Dec 2024 08:58:09 -0800 (PST)
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
X-Inumbo-ID: f7093153-c3aa-11ef-a0da-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1735232294; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bEsb+5V8TjawamDf4z6EdBZYmMuMB8eV7fPNaaqsUTzeVgaDz+pQvztXqs8r6j8ey2D495Jd9DFUjQcv47Pb173T5J1wycjQXE0jjuSKFgCx/5RtiixRofKtLtFPnM9JrEKNDhie4HW03G0U880Gw1bzqp3ubiuXRtLi3taGa80=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1735232294; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hXdbAJzSfNTcSeY3krNKNli9zbh1A0XPeYZ31pxiNfM=; 
	b=KkNlPFMSTV2k0JrSlbRi5SCLP6+BFG2AWtz5PGLF/o4GVKgjMb7wFOczd4h8hjLmrsr/fxS1kmdC9sYhsCdeUalbRqckAL7XHGnpZS3ZfSqVv9Ap7VelpXiYwA3ZOBwHHbhdqqajmuQtHC6tM+tiZd5PX+ZFERXjJiNRxkO/d7Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1735232294;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=hXdbAJzSfNTcSeY3krNKNli9zbh1A0XPeYZ31pxiNfM=;
	b=AHp9SqhMtXqFD/cwJHnmmy7w3dsFJpdG7fYX8NpgqugAiE3wa77MNYfsMaUmG39K
	EEoquxwGq46Tw4XuicLIogV4X9FfI9NdaMOTtIKbCILQkXynSrZqWm1bsg9MUB5be3R
	E7KN2YQ3/kU+BnQRaGmzSar8VAgiMYxtPNSXci68=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 14/15] x86/hyperlaunch: add max vcpu parsing of hyperlaunch device tree
Date: Thu, 26 Dec 2024 11:57:39 -0500
Message-Id: <20241226165740.29812-15-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241226165740.29812-1-dpsmith@apertussolutions.com>
References: <20241226165740.29812-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Introduce the `cpus` property, named as such for dom0less compatibility, that
represents the maximum number of vpcus to allocate for a domain. In the device
tree, it will be encoded as a u32 value.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
Changes since v1:
- switched from match_fdt to strncmp
- switched to nested else if
- dropped ternary for name selection
---
 xen/arch/x86/dom0_build.c             |  3 +++
 xen/arch/x86/domain-builder/fdt.c     | 11 +++++++++++
 xen/arch/x86/include/asm/bootdomain.h |  2 ++
 3 files changed, 16 insertions(+)

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
diff --git a/xen/arch/x86/domain-builder/fdt.c b/xen/arch/x86/domain-builder/fdt.c
index aff1b8c3235d..70a793db199b 100644
--- a/xen/arch/x86/domain-builder/fdt.c
+++ b/xen/arch/x86/domain-builder/fdt.c
@@ -147,6 +147,17 @@ static int __init process_domain_node(
             bd->max_pages = PFN_DOWN(kb * SZ_1K);
             printk("  max memory: %ld kb\n", kb);
         }
+        else if ( strncmp(prop_name, "cpus", name_len) == 0 )
+        {
+            uint32_t val = UINT_MAX;
+            if ( fdt_prop_as_u32(prop, &val) != 0 )
+            {
+                printk("  failed processing max_vcpus for domain %s\n", name);
+                return -EINVAL;
+            }
+            bd->max_vcpus = val;
+            printk("  max vcpus: %d\n", bd->max_vcpus);
+        }
     }
 
     fdt_for_each_subnode(node, fdt, dom_node)
diff --git a/xen/arch/x86/include/asm/bootdomain.h b/xen/arch/x86/include/asm/bootdomain.h
index d7092bc32ad7..1a15273043f5 100644
--- a/xen/arch/x86/include/asm/bootdomain.h
+++ b/xen/arch/x86/include/asm/bootdomain.h
@@ -24,6 +24,8 @@ struct boot_domain {
     unsigned long min_pages;
     unsigned long max_pages;
 
+    unsigned int max_vcpus;
+
     struct boot_module *kernel;
     struct boot_module *ramdisk;
 
-- 
2.30.2


