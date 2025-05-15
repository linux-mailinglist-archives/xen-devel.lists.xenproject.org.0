Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A020AB87C6
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 15:20:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985359.1371340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYVz-00074i-4k; Thu, 15 May 2025 13:20:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985359.1371340; Thu, 15 May 2025 13:20:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYVy-0006wk-Pc; Thu, 15 May 2025 13:20:46 +0000
Received: by outflank-mailman (input) for mailman id 985359;
 Thu, 15 May 2025 13:20:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WRi0=X7=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1uFYUA-0001J6-KY
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 13:18:54 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 253d6082-318f-11f0-9eb6-5ba50f476ded;
 Thu, 15 May 2025 15:18:53 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 174731507512669.1061206550686;
 Thu, 15 May 2025 06:17:55 -0700 (PDT)
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
X-Inumbo-ID: 253d6082-318f-11f0-9eb6-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; t=1747315077; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JggVgT3lkhZnwh/lXQswfZt0u90GkW/A9ov0/OEVMLTIpP2VPtjUGEA/ALiBzjoSGB4xiOQtGbYBwjnlKS0CGx3btI0gXBVTv3+oc5/Oydohwfv9ydzOaG0EdNx2bpPMCJbBSZ9rpIubHAAm+P80h/SyH55agHdOh9ylalVRv2g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747315077; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=kXLeQEafuzmZpUwx/voiihs2CzxduoImnIkTGOhkmHM=; 
	b=hPdd6gPGBZiqr48sk54TJm8JZpv+PfCrbMaSR7JSuXUkxf1J4Q9MJMuaa49nfpWc4RuCDvSXfuqlKKot4YI9HlUwjHykBZn/3IhYWxHW4CMrsjE+U8qmlEQiknwM/9VXDZAlFiKMcCnqWj4Jyf+C7Xl7idrmW+E4s9Izrmt+T0w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747315077;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=kXLeQEafuzmZpUwx/voiihs2CzxduoImnIkTGOhkmHM=;
	b=ebNAr9yM6RPtTe6bdKIPMI8oEXh5SECfk71UbQW6abeDbkcm+q4O98SxO/sLueHx
	ubaWXqnC1a91+OxDoSnawgImzqAybJ1JCULizwCzbAC2gYQ5eEL29wYQU1Tz+rYTVPG
	XPIqCG1TyAJNfI5mDV8BpLULUaQ+cRk921Cv/qvE=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Christopher Clark <christopher.w.clark@gmail.com>
Subject: [RFCv2 04/38] x86/hyperlaunch: convert vcpu0 creation to domain builder
Date: Thu, 15 May 2025 09:17:10 -0400
Message-Id: <20250515131744.3843-5-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250515131744.3843-1-dpsmith@apertussolutions.com>
References: <20250515131744.3843-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Convert alloc_dom0_vcpu0() to dom0_set_affinity(), making it only set up the
node affinity based on command line parameters passed. At the same time,
introduce alloc_dom_vcpu0() as the replacement for alloc_dom0_vcpu(). Then have
alloc_dom_vcpu0() call dom0_set_affinity() when the boot domain is the control
domain, otherwise set the affinity to auto.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

---

Changes in v2:
- name vcpu0 allocation function domain_vcpu0_create()
---
 xen/arch/x86/dom0_build.c              |  4 +---
 xen/arch/x86/domain-builder/domain.c   | 11 +++++++++++
 xen/arch/x86/include/asm/boot-domain.h |  9 +++++++++
 xen/arch/x86/include/asm/dom0_build.h  |  2 ++
 xen/arch/x86/setup.c                   |  5 +++--
 xen/include/xen/domain-builder.h       |  1 +
 6 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index f734104c7488..22d9ff3f1e8c 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -254,12 +254,10 @@ unsigned int __init dom0_max_vcpus(void)
     return max_vcpus;
 }
 
-struct vcpu *__init alloc_dom0_vcpu0(struct domain *dom0)
+void __init dom0_set_affinity(struct domain *dom0)
 {
     dom0->node_affinity = dom0_nodes;
     dom0->auto_node_affinity = !dom0_nr_pxms;
-
-    return vcpu_create(dom0, 0);
 }
 
 #ifdef CONFIG_SHADOW_PAGING
diff --git a/xen/arch/x86/domain-builder/domain.c b/xen/arch/x86/domain-builder/domain.c
index d8eba73dac28..0512dde54746 100644
--- a/xen/arch/x86/domain-builder/domain.c
+++ b/xen/arch/x86/domain-builder/domain.c
@@ -11,6 +11,7 @@
 #include <public/bootfdt.h>
 
 #include <asm/bootinfo.h>
+#include <asm/dom0_build.h>
 
 unsigned int __init dom_max_vcpus(struct boot_domain *bd)
 {
@@ -29,6 +30,16 @@ unsigned int __init dom_max_vcpus(struct boot_domain *bd)
     return bd->max_vcpus;
 }
 
+struct vcpu *__init domain_vcpu0_create(struct boot_domain *bd)
+{
+    if ( has_dom0_caps(bd) )
+        dom0_set_affinity(bd->d);
+    else
+        bd->d->auto_node_affinity = true;
+
+    return vcpu_create(bd->d, 0);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/include/asm/boot-domain.h b/xen/arch/x86/include/asm/boot-domain.h
index 740bfb74121c..c60b19c58aef 100644
--- a/xen/arch/x86/include/asm/boot-domain.h
+++ b/xen/arch/x86/include/asm/boot-domain.h
@@ -9,6 +9,7 @@
 #define __XEN_X86_BOOTDOMAIN_H__
 
 #include <public/xen.h>
+#include <public/bootfdt.h>
 
 struct boot_domain {
     domid_t domid;
@@ -34,6 +35,14 @@ struct boot_domain {
     struct domain *d;
 };
 
+static inline bool __init has_dom0_caps(const struct boot_domain *bd)
+{
+    unsigned int dom0_caps = (DOMAIN_CAPS_CONTROL | DOMAIN_CAPS_HARDWARE | \
+                             DOMAIN_CAPS_XENSTORE);
+
+    return (bd->capabilities & dom0_caps) == dom0_caps;
+}
+
 #endif
 
 /*
diff --git a/xen/arch/x86/include/asm/dom0_build.h b/xen/arch/x86/include/asm/dom0_build.h
index ff021c24af9d..426def4115ce 100644
--- a/xen/arch/x86/include/asm/dom0_build.h
+++ b/xen/arch/x86/include/asm/dom0_build.h
@@ -8,6 +8,8 @@
 
 extern unsigned int dom0_memflags;
 
+void dom0_set_affinity(struct domain *dom0);
+
 unsigned long dom0_compute_nr_pages(struct domain *d,
                                     struct elf_dom_parms *parms,
                                     unsigned long initrd_len);
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index d3bde6c43e8d..409630089d29 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1057,9 +1057,11 @@ static struct domain *__init create_dom0(struct boot_info *bi)
     if ( IS_ERR(d) )
         panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
 
+    bd->d = d;
+
     init_dom0_cpuid_policy(d);
 
-    if ( alloc_dom0_vcpu0(d) == NULL )
+    if ( domain_vcpu0_create(bd) == NULL )
         panic("Error creating %pdv0\n", d);
 
     cmdline_size = domain_cmdline_size(bi, bd);
@@ -1102,7 +1104,6 @@ static struct domain *__init create_dom0(struct boot_info *bi)
         bd->cmdline = cmdline;
     }
 
-    bd->d = d;
     if ( construct_dom0(bd) != 0 )
         panic("Could not construct domain 0\n");
 
diff --git a/xen/include/xen/domain-builder.h b/xen/include/xen/domain-builder.h
index 82c929cc48a1..d3390d368afb 100644
--- a/xen/include/xen/domain-builder.h
+++ b/xen/include/xen/domain-builder.h
@@ -36,5 +36,6 @@ int builder_get_cmdline(const struct boot_info *bi, int offset,
                         char *cmdline, size_t size);
 
 unsigned int dom_max_vcpus(struct boot_domain *bd);
+struct vcpu *domain_vcpu0_create(struct boot_domain *bd);
 
 #endif /* __XEN_DOMAIN_BUILDER_H__ */
-- 
2.30.2


