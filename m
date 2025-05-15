Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0FAAB87C1
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 15:20:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985333.1371260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYVp-0004um-IC; Thu, 15 May 2025 13:20:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985333.1371260; Thu, 15 May 2025 13:20:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYVp-0004sT-EM; Thu, 15 May 2025 13:20:37 +0000
Received: by outflank-mailman (input) for mailman id 985333;
 Thu, 15 May 2025 13:20:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WRi0=X7=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1uFYUR-0001J6-Bp
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 13:19:11 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f50c843-318f-11f0-9eb6-5ba50f476ded;
 Thu, 15 May 2025 15:19:10 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1747315077086430.3181831510035;
 Thu, 15 May 2025 06:17:57 -0700 (PDT)
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
X-Inumbo-ID: 2f50c843-318f-11f0-9eb6-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; t=1747315080; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NtT9ACVh181HluxxaVMaxLDS+33yLsG964fBTaurRrQt57veOSD4fbxCn/ji2z+uFBIvm2E3OzUskUjl5zzSjipibQxzgBGbDNamPzK36oFyFfEg7ug75QcQu8ucx3WuuV36o/HQeyd/va2HN8WAvh+0O96zRfc0ELoF8uQRGXA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747315080; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SXbug0DKOX8Y5Ce3k9H738ujkJ9TrrqxK2HK+AOKWG0=; 
	b=Oj9hx0dX01pSU8sBn83Lr95z4ck9C/ivXQ80c8rROZJqv23PUDouIXsAaMTEEdD4OSnjSZ2BEPY7k+oITozDE/HOHssi5PkGwEI6h7A5xuxCgtAnYbaajJdhpJw7eb2d01NT7qXJxC6/bhk23rGb5NJO+GNSIydEdFeHTDR7Q98=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747315080;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=SXbug0DKOX8Y5Ce3k9H738ujkJ9TrrqxK2HK+AOKWG0=;
	b=usvFGD3YlUOfTBKfXZmtpGiQ7Aq31A5sMn6A3Pz/OQHWbqIAR6W271T4LTbwpcx1
	//jDF/JiZk+BXqx6EjsgsEH/DsZLu7LJqHgI0AyTnO42lLs+6t6ncZ2cFIaN3/+QKmu
	kK/Vr1vOrzAznobQNIsKNnkPPc9575BMoSFNHW1Y=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFCv2 06/38] x86/hyperlaunch: introduce pvh domain builder
Date: Thu, 15 May 2025 09:17:12 -0400
Message-Id: <20250515131744.3843-7-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250515131744.3843-1-dpsmith@apertussolutions.com>
References: <20250515131744.3843-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Introduce dom_construct_pvh() as a wrapper around dom0_construct_pvh(). This
function will be expanded as dom0 specific construction functions are
generalized.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/dom0_build.c                 |  5 ++--
 xen/arch/x86/hvm/Makefile                 |  1 +
 xen/arch/x86/hvm/dom_build.c              | 31 +++++++++++++++++++++++
 xen/arch/x86/include/asm/domain-builder.h |  8 ++++++
 xen/arch/x86/include/asm/setup.h          |  2 +-
 5 files changed, 44 insertions(+), 3 deletions(-)
 create mode 100644 xen/arch/x86/hvm/dom_build.c
 create mode 100644 xen/arch/x86/include/asm/domain-builder.h

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 22d9ff3f1e8c..2cf6535ce190 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -15,6 +15,7 @@
 #include <asm/amd.h>
 #include <asm/bootinfo.h>
 #include <asm/dom0_build.h>
+#include <asm/domain-builder.h>
 #include <asm/guest.h>
 #include <asm/hpet.h>
 #include <asm/hvm/emulate.h>
@@ -613,7 +614,7 @@ int __init dom0_setup_permissions(struct domain *d)
     return rc;
 }
 
-int __init construct_dom0(const struct boot_domain *bd)
+int __init construct_dom0(struct boot_domain *bd)
 {
     int rc;
     const struct domain *d = bd->d;
@@ -637,7 +638,7 @@ int __init construct_dom0(const struct boot_domain *bd)
         opt_dom0_max_vcpus_max = bd->max_vcpus;
 
     if ( is_hvm_domain(d) )
-        rc = dom0_construct_pvh(bd);
+        rc = dom_construct_pvh(bd);
     else if ( is_pv_domain(d) )
         rc = dom0_construct_pv(bd);
     else
diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
index 6ec2c8f2db56..0830a5b2a56f 100644
--- a/xen/arch/x86/hvm/Makefile
+++ b/xen/arch/x86/hvm/Makefile
@@ -5,6 +5,7 @@ obj-y += viridian/
 obj-y += asid.o
 obj-y += dm.o
 obj-bin-y += dom0_build.init.o
+obj-bin-y += dom_build.init.o
 obj-y += domain.o
 obj-y += emulate.o
 obj-$(CONFIG_GRANT_TABLE) += grant_table.o
diff --git a/xen/arch/x86/hvm/dom_build.c b/xen/arch/x86/hvm/dom_build.c
new file mode 100644
index 000000000000..8546cfff1fbf
--- /dev/null
+++ b/xen/arch/x86/hvm/dom_build.c
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * hvm/dom_build.c
+ *
+ * Dom builder for PVH guest.
+ *
+ * Copyright (C) 2017 Citrix Systems R&D
+ * Copyright (C) 2025 Apertus Solutions, LLC
+ */
+
+#include <xen/init.h>
+
+#include <asm/bootinfo.h>
+#include <asm/dom0_build.h>
+
+int __init dom_construct_pvh(struct boot_domain *bd)
+{
+    printk(XENLOG_INFO "*** Building a PVH Dom%d ***\n", bd->domid);
+
+    return dom0_construct_pvh(bd);
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/x86/include/asm/domain-builder.h b/xen/arch/x86/include/asm/domain-builder.h
new file mode 100644
index 000000000000..dd429fc9ff8b
--- /dev/null
+++ b/xen/arch/x86/include/asm/domain-builder.h
@@ -0,0 +1,8 @@
+#ifndef __XEN_X86_DOMBUILDER_H__
+#define __XEN_X86_DOMBUILDER_H__
+
+struct boot_domain;
+
+int dom_construct_pvh(struct boot_domain *bd);
+
+#endif
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index ac34c698551e..b517da6144de 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -27,7 +27,7 @@ void subarch_init_memory(void);
 void init_IRQ(void);
 
 struct boot_domain;
-int construct_dom0(const struct boot_domain *bd);
+int construct_dom0(struct boot_domain *bd);
 
 void setup_io_bitmap(struct domain *d);
 
-- 
2.30.2


