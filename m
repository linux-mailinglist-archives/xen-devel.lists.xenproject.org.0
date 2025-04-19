Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E0AA945AC
	for <lists+xen-devel@lfdr.de>; Sun, 20 Apr 2025 00:10:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.960054.1352134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GOW-000062-AB; Sat, 19 Apr 2025 22:10:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 960054.1352134; Sat, 19 Apr 2025 22:10:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GOV-0008Sa-W2; Sat, 19 Apr 2025 22:10:39 +0000
Received: by outflank-mailman (input) for mailman id 960054;
 Sat, 19 Apr 2025 22:10:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nqik=XF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1u6GNU-0004ik-Kq
 for xen-devel@lists.xenproject.org; Sat, 19 Apr 2025 22:09:36 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f95b684d-1d6a-11f0-9ffb-bf95429c2676;
 Sun, 20 Apr 2025 00:09:35 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1745100513263991.7777778756324;
 Sat, 19 Apr 2025 15:08:33 -0700 (PDT)
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
X-Inumbo-ID: f95b684d-1d6a-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; t=1745100516; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=efqKFhmcoG5CWJTP8QZaneW/AuCNBU3qodA6+4pfFr8a9ikNCAHFULjIl+3QnJZ7LvkHwS+I3BORSA7ovrcSdvxNRDQbuWXDdsH/oQl/KQ6QQGWnHaGCqzcbTaz2K/mxzJHC0huMQf6nXAYXa2h8BCjDggCS3jD6wQK+S/pn/gk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745100516; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=RMChXQEbn8VdNk3SfUK0sU6zoeUdrE3WHdblV3zR214=; 
	b=mBoxjwbrXklJQ/ifOeMI7JI3hCA68235zuqJC8Rr+LyMi40qIJxoYHxNG4RRmnFfHuwQDIwjtm+bP+MiZeE+jTFwhFhEGehN4i+ulAqUPKkqPREtQnrQ+TksudguWwUdQiSrm+B/CxZ0rfbY7qOmUIB0OuRzg5+96wH+a3XXkv8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745100516;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=RMChXQEbn8VdNk3SfUK0sU6zoeUdrE3WHdblV3zR214=;
	b=E4nhnPjAKD58SIln8nfWbFzIX6XLbeGfftzUzadtVbUlfsUpB4AJHj01C33A7ll4
	rM/uP5iY98xryRfqf7yCtqNt+m+VaawEiSKUmgOgi8JW9Jw00jCJaiGSNGJB52KjL4c
	LI37EFuU8FUvB9jZuUelnBw3sL39NvnT5pbQJe88=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC 04/38] x86/hyperlaunch: convert vcpu0 creation to domain builder
Date: Sat, 19 Apr 2025 18:07:46 -0400
Message-Id: <20250419220820.4234-5-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250419220820.4234-1-dpsmith@apertussolutions.com>
References: <20250419220820.4234-1-dpsmith@apertussolutions.com>
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
 xen/arch/x86/dom0_build.c                 |  4 +---
 xen/arch/x86/domain-builder/domain.c      | 11 +++++++++++
 xen/arch/x86/include/asm/dom0_build.h     |  2 ++
 xen/arch/x86/include/asm/domain-builder.h |  1 +
 xen/arch/x86/setup.c                      |  5 +++--
 5 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 7b3e31a08f7d..77386cd1e20c 100644
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
index f2277b9e3cf3..619d36ea0b87 100644
--- a/xen/arch/x86/domain-builder/domain.c
+++ b/xen/arch/x86/domain-builder/domain.c
@@ -9,6 +9,7 @@
 #include <xen/sched.h>
 
 #include <asm/bootinfo.h>
+#include <asm/dom0_build.h>
 
 unsigned int __init dom_max_vcpus(struct boot_domain *bd)
 {
@@ -27,6 +28,16 @@ unsigned int __init dom_max_vcpus(struct boot_domain *bd)
     return bd->max_vcpus;
 }
 
+struct vcpu *__init alloc_dom_vcpu0(struct boot_domain *bd)
+{
+    if ( bd->capabilities & BUILD_CAPS_CONTROL )
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
diff --git a/xen/arch/x86/include/asm/domain-builder.h b/xen/arch/x86/include/asm/domain-builder.h
index f37f73e2255b..dd47e9ac0dc6 100644
--- a/xen/arch/x86/include/asm/domain-builder.h
+++ b/xen/arch/x86/include/asm/domain-builder.h
@@ -9,5 +9,6 @@ int __init builder_get_cmdline(
 
 void builder_init(struct boot_info *bi);
 unsigned int dom_max_vcpus(struct boot_domain *bd);
+struct vcpu *alloc_dom_vcpu0(struct boot_domain *bd);
 
 #endif
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 86bbd7c72ccd..8ba9d592ed5a 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1048,9 +1048,11 @@ static struct domain *__init create_dom0(struct boot_info *bi)
     if ( IS_ERR(d) )
         panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
 
+    bd->d = d;
+
     init_dom0_cpuid_policy(d);
 
-    if ( alloc_dom0_vcpu0(d) == NULL )
+    if ( alloc_dom_vcpu0(bd) == NULL )
         panic("Error creating %pd vcpu 0\n", d);
 
     cmdline_size = domain_cmdline_size(bi, bd);
@@ -1090,7 +1092,6 @@ static struct domain *__init create_dom0(struct boot_info *bi)
         bd->cmdline = cmdline;
     }
 
-    bd->d = d;
     if ( construct_dom0(bd) != 0 )
         panic("Could not construct domain 0\n");
 
-- 
2.30.2


