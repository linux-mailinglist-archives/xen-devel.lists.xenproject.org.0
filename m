Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D34AB8810
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 15:33:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985517.1371480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYiY-0001Di-U4; Thu, 15 May 2025 13:33:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985517.1371480; Thu, 15 May 2025 13:33:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYiY-0001BZ-Qa; Thu, 15 May 2025 13:33:46 +0000
Received: by outflank-mailman (input) for mailman id 985517;
 Thu, 15 May 2025 13:33:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WRi0=X7=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1uFYYg-0006hT-QA
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 13:23:34 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cbd39df7-318f-11f0-9ffb-bf95429c2676;
 Thu, 15 May 2025 15:23:33 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 174731520773082.3377972809584;
 Thu, 15 May 2025 06:20:07 -0700 (PDT)
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
X-Inumbo-ID: cbd39df7-318f-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; t=1747315210; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nR7df+HcgBiLj27QZVJKsv+MjKGQBvRdHKlomAHuYqg4vmXdw0q9PLEQN/criklGSUKQA+gR0KQ3+8VoTL6EFyzNyjM9QZeOa0NmPleaULKYIIB5pxPdrGcCQ189nv5L/z7BHz1p/8QqlZIkn1wx0v+O54491o9OrIWMWwrA8i0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747315210; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=70vSR3+LOWhc2kZFcDiKYHYh5u4bPgYcG0obDnNvaLQ=; 
	b=jY6pw3b2JWwl4hDQqxq0/SUfx8WrG5vEN23bB+B8yMOmDUdQ71xXTg0vA4kr24sTfSAhXJujV7FBFRjnUrT62JIYuwxCtTvfXru31GrDrt9f97niA/s1n06yCe2oU+wYX6VJtnZ1NRiBoDs7SgGIkrG66Tj8LICV9wuzZNtMVTk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747315210;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=70vSR3+LOWhc2kZFcDiKYHYh5u4bPgYcG0obDnNvaLQ=;
	b=TH5AJREHDt+6JxG/AnYRVJ+6W5ANoArKpRYS3EhUXbctyYtlSI6k9WEUAFWPYY3d
	ZPGLEeQIt//8GXd1TdgpZS4ySK1ZqL7dsKpf8N6TtiQ2uyNDZH9s4Qpt2Ief83PRM6s
	gBnZGhZu3+qaG35U4tEj3h+iQcsVnQBe3LgXRXg4=
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
Subject: [RFCv2 34/38] x86/hyperlaunch: introduce multidomain kconfig option
Date: Thu, 15 May 2025 09:19:46 -0400
Message-Id: <20250515131951.5594-5-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250515131951.5594-1-dpsmith@apertussolutions.com>
References: <20250515131951.5594-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This adds the MULTIDOMAIN_BUILDER kconfig option that will be used to enable
the domain construction path to be called multiple times. With the idea of
being able to construct multiple domains now introduced, rename construct_dom0()
to construct_dom().

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/dom0_build.c            |  9 +++++----
 xen/arch/x86/domain-builder/domain.c |  2 +-
 xen/arch/x86/include/asm/bootinfo.h  |  2 +-
 xen/arch/x86/include/asm/setup.h     |  2 +-
 xen/common/domain-builder/Kconfig    | 12 ++++++++++++
 5 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 75969887b933..8f7615afb3f2 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -558,15 +558,16 @@ int __init dom0_setup_permissions(struct domain *d)
     return rc;
 }
 
-int __init construct_dom0(struct boot_domain *bd)
+int __init construct_dom(struct boot_domain *bd)
 {
     int rc;
     const struct domain *d = bd->d;
 
     /* Sanity! */
-    BUG_ON(!pv_shim && d->domain_id != 0);
-    BUG_ON(d->vcpu[0] == NULL);
-    BUG_ON(d->vcpu[0]->is_initialised);
+    if ( ! IS_ENABLED(CONFIG_MULTIDOMAIN_BUILDER) )
+        BUG_ON(!pv_shim && bd->d->domain_id != 0);
+    BUG_ON(bd->d->vcpu[0] == NULL);
+    BUG_ON(bd->d->vcpu[0]->is_initialised);
 
     process_pending_softirqs();
 
diff --git a/xen/arch/x86/domain-builder/domain.c b/xen/arch/x86/domain-builder/domain.c
index deff6c8efaf1..c453629700c1 100644
--- a/xen/arch/x86/domain-builder/domain.c
+++ b/xen/arch/x86/domain-builder/domain.c
@@ -397,7 +397,7 @@ struct domain *__init arch_create_dom(
         bd->cmdline = cmdline;
     }
 
-    if ( construct_dom0(bd) != 0 )
+    if ( construct_dom(bd) != 0 )
         panic("Could not construct domain 0\n");
 
     bd->cmdline = NULL;
diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 430ae08cf5ef..298cff303673 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -17,7 +17,7 @@
 #define MAX_NR_BOOTMODS 63
 
 /* Max number of boot domains that Xen can construct */
-#define MAX_NR_BOOTDOMS 1
+#define MAX_NR_BOOTDOMS 64
 
 /* Boot module binary type / purpose */
 enum bootmod_type {
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index 4b8fbdc67e05..3f6850d40d04 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -27,7 +27,7 @@ void subarch_init_memory(void);
 void init_IRQ(void);
 
 struct boot_domain;
-int construct_dom0(struct boot_domain *bd);
+int construct_dom(struct boot_domain *bd);
 
 const char *cmdline_cook(const char *p, const char *loader_name);
 
diff --git a/xen/common/domain-builder/Kconfig b/xen/common/domain-builder/Kconfig
index 44b8351af8ab..898a592a6340 100644
--- a/xen/common/domain-builder/Kconfig
+++ b/xen/common/domain-builder/Kconfig
@@ -12,4 +12,16 @@ config DOMAIN_BUILDER
 
 	  If unsure, say N.
 
+config MULTIDOMAIN_BUILDER
+	bool "Multiple domain building (UNSUPPORTED)" if UNSUPPORTED
+	depends on DOMAIN_BUILDER
+	default n
+	help
+      Enables the domain builder capability to build multiple domains
+	  using a flattened device tree.
+
+	  This feature is currently experimental.
+
+	  If unsure, say N.
+
 endmenu
-- 
2.30.2


