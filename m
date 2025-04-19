Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F14A945AE
	for <lists+xen-devel@lfdr.de>; Sun, 20 Apr 2025 00:10:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.960056.1352145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GOX-0000KN-5t; Sat, 19 Apr 2025 22:10:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 960056.1352145; Sat, 19 Apr 2025 22:10:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GOW-0000Cu-Np; Sat, 19 Apr 2025 22:10:40 +0000
Received: by outflank-mailman (input) for mailman id 960056;
 Sat, 19 Apr 2025 22:10:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nqik=XF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1u6GO3-0004yY-0K
 for xen-devel@lists.xenproject.org; Sat, 19 Apr 2025 22:10:11 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e441cec-1d6b-11f0-9eb0-5ba50f476ded;
 Sun, 20 Apr 2025 00:10:10 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1745100515847991.1522635224128;
 Sat, 19 Apr 2025 15:08:35 -0700 (PDT)
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
X-Inumbo-ID: 0e441cec-1d6b-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; t=1745100518; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FLekLYGKv70f/oLlSKWLJacLb2lbO/uwu0tdWumon7bmSIL3n+eZTg7vH0dm+M9V5vtwEMWC8+vZbnCiEPTlqfaF4CkAREhHft5kHhoQj2j3BoPuAM67D3hmF1LwZvEme0vPd9Ekc2JpaIJ9IScWGYvWN2406jPeraqMWrbgrsE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745100518; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wffNFsu/3o3svqQKlatxNEBU5aErXWps6rcxpmCeDyU=; 
	b=LbEbEzAAJW7fRDyr2a23Z8KNe0FeiIc+qsFxxP0FLibDIpRE2v7CgMnMNwx/3xIRKQOPwETN68FKj0PmhnyTgcHSfDjRUiuIrAk1RZ0gBNd5ZK25d1isNB0j24bj6hbO1WBrGzz6YEEJnyE9kxVr6PZ7zCniSp1m6IepU4GDsmY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745100518;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=wffNFsu/3o3svqQKlatxNEBU5aErXWps6rcxpmCeDyU=;
	b=hLu8TvTQsrEPpMq50NbmahoIR4sOdtzAwxLMlU3q6wvyMQAAytaUHFVRvOHqLBNC
	4JQx3vg0YynZuEGOeEHBCytnWWT6VuypGCIeOYzk6tbpDyc4SCp7PBLm5oznkDEeQwm
	ggPx5KMhWsklzeSi87DIe8pGZfqBjFAgE1qaKvwQ=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC 07/38] x86/hyperlaunch: introduce pvh domain builder
Date: Sat, 19 Apr 2025 18:07:49 -0400
Message-Id: <20250419220820.4234-8-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250419220820.4234-1-dpsmith@apertussolutions.com>
References: <20250419220820.4234-1-dpsmith@apertussolutions.com>
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
 xen/arch/x86/include/asm/domain-builder.h |  2 ++
 xen/arch/x86/include/asm/setup.h          |  2 +-
 5 files changed, 38 insertions(+), 3 deletions(-)
 create mode 100644 xen/arch/x86/hvm/dom_build.c

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 77386cd1e20c..08fde953a1e0 100644
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
index 4c1fa5c6c2bf..2c1662b66897 100644
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
index 000000000000..7206815d64a9
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
+ * Copyright (C) 2024 Apertus Solutions, LLC
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
index dd47e9ac0dc6..ccfa4bd82acd 100644
--- a/xen/arch/x86/include/asm/domain-builder.h
+++ b/xen/arch/x86/include/asm/domain-builder.h
@@ -11,4 +11,6 @@ void builder_init(struct boot_info *bi);
 unsigned int dom_max_vcpus(struct boot_domain *bd);
 struct vcpu *alloc_dom_vcpu0(struct boot_domain *bd);
 
+int dom_construct_pvh(struct boot_domain *bd);
+
 #endif
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


