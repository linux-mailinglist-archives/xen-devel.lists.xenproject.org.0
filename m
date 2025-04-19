Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 944CDA945AD
	for <lists+xen-devel@lfdr.de>; Sun, 20 Apr 2025 00:10:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.960053.1352125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GOV-0008Sd-Rh; Sat, 19 Apr 2025 22:10:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 960053.1352125; Sat, 19 Apr 2025 22:10:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GOV-0008QA-Mb; Sat, 19 Apr 2025 22:10:39 +0000
Received: by outflank-mailman (input) for mailman id 960053;
 Sat, 19 Apr 2025 22:10:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nqik=XF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1u6GNm-0004yY-Qo
 for xen-devel@lists.xenproject.org; Sat, 19 Apr 2025 22:09:54 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04210495-1d6b-11f0-9eb0-5ba50f476ded;
 Sun, 20 Apr 2025 00:09:53 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1745100514979396.05443422958285;
 Sat, 19 Apr 2025 15:08:34 -0700 (PDT)
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
X-Inumbo-ID: 04210495-1d6b-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; t=1745100516; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ito7tew2Glt8XnqoYYHzpIISxZA+yEIUckk8P/PFRv2kD2aRs7E2yg6DBVDDx0VsomyS7qkqet16dX/e4jzlMWsII3wcL5H9QMAVkS9GFoxumVZm7kBn8ACgtv07RRBmZFqxcPTg6CyGRcmUqlXsjcJzmDI/bJv/2Bm3tpwbZ7I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745100516; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KQRQAf1aUXgujyjY1AUdNyPpFSQKcdWAbK0B0zPjexU=; 
	b=RC+sXz9HC3sFhq1jN78fzkER/pYa/n6TTLdMm0aD/tZoP13FwzZiQJDPUDi2qdjz6nBGyUJQ5B5UNIEATo/+4SxzZrCqWjmZA2ubUewn2IDc/DS807JUp7w+qjWNGSL20zDoGv8mFzDtFgWu0C3zCTB9++rfpShdWrvWBB9XILw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745100516;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=KQRQAf1aUXgujyjY1AUdNyPpFSQKcdWAbK0B0zPjexU=;
	b=rB6OwGotvL33oEAvVDXdQcZdLtfmPX7/Yvn+pxbYBkIEmZVLynoyV3GVmtG7S5EJ
	fZh52+u7ZkLYaOFPXrRl+/pX/VOLdC83yi0XRMxNTs1l2It7UfTe1gBg2yX2qmwmDjf
	VzIkfoHwjVyoEOI4Z+3mggyl8qpOPE1jv8gR4/v8=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC 06/38] x86/hyperlaunch: add hardware domain capability support
Date: Sat, 19 Apr 2025 18:07:48 -0400
Message-Id: <20250419220820.4234-7-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250419220820.4234-1-dpsmith@apertussolutions.com>
References: <20250419220820.4234-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Introduce a capability flag to the capabilities property of a domain node in
the hyperlaunch device tree. In the domain construction, use the capability
flag to determine if CDF_hardware should be set on the domain config.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/domain-builder/core.c     | 3 ++-
 xen/arch/x86/domain-builder/fdt.c      | 2 ++
 xen/arch/x86/include/asm/boot-domain.h | 1 +
 xen/arch/x86/setup.c                   | 8 ++++++--
 4 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/domain-builder/core.c b/xen/arch/x86/domain-builder/core.c
index 6ab4e6fe5333..8d137ecaaf84 100644
--- a/xen/arch/x86/domain-builder/core.c
+++ b/xen/arch/x86/domain-builder/core.c
@@ -96,7 +96,8 @@ void __init builder_init(struct boot_info *bi)
         i = first_boot_module_index(bi, BOOTMOD_UNKNOWN);
         bi->mods[i].type = BOOTMOD_KERNEL;
         bi->domains[0].kernel = &bi->mods[i];
-        bi->domains[0].capabilities |= BUILD_CAPS_CONTROL;
+        bi->domains[0].capabilities |=
+            (BUILD_CAPS_CONTROL | BUILD_CAPS_HARDWARE);
         bi->nr_domains = 1;
     }
 }
diff --git a/xen/arch/x86/domain-builder/fdt.c b/xen/arch/x86/domain-builder/fdt.c
index d2a7e010ea77..1af58ed4eb86 100644
--- a/xen/arch/x86/domain-builder/fdt.c
+++ b/xen/arch/x86/domain-builder/fdt.c
@@ -267,6 +267,8 @@ static int __init process_domain_node(
             printk("  caps: ");
             if ( bd->capabilities & BUILD_CAPS_CONTROL )
                 printk("c");
+            if ( bd->capabilities & BUILD_CAPS_HARDWARE )
+                printk(" h");
             printk("\n");
         }
     }
diff --git a/xen/arch/x86/include/asm/boot-domain.h b/xen/arch/x86/include/asm/boot-domain.h
index b0f956cd734e..18d144de2fea 100644
--- a/xen/arch/x86/include/asm/boot-domain.h
+++ b/xen/arch/x86/include/asm/boot-domain.h
@@ -15,6 +15,7 @@ struct boot_domain {
 
 #define BUILD_CAPS_NONE          (0)
 #define BUILD_CAPS_CONTROL       (1 << 0)
+#define BUILD_CAPS_HARDWARE      (1 << 1)
     uint32_t capabilities;
 
                                           /* On     | Off    */
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 41e46f05a520..760262ea3d4c 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1035,8 +1035,12 @@ static struct domain *__init create_dom0(struct boot_info *bi)
             XEN_X86_EMU_LAPIC | XEN_X86_EMU_IOAPIC | XEN_X86_EMU_VPCI;
     }
 
-    if ( iommu_enabled )
-        dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
+    if ( bd->capabilities & BUILD_CAPS_HARDWARE )
+    {
+        create_flags |= CDF_hardware;
+        if ( iommu_enabled )
+            dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
+    }
 
     if ( bd->domid == DOMID_INVALID )
         /* Create initial domain.  Not d0 for pvshim. */
-- 
2.30.2


