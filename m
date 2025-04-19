Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F68A945B4
	for <lists+xen-devel@lfdr.de>; Sun, 20 Apr 2025 00:13:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.960116.1352215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GR8-0005B4-8t; Sat, 19 Apr 2025 22:13:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 960116.1352215; Sat, 19 Apr 2025 22:13:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GR8-00058D-5w; Sat, 19 Apr 2025 22:13:22 +0000
Received: by outflank-mailman (input) for mailman id 960116;
 Sat, 19 Apr 2025 22:13:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nqik=XF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1u6GR6-0004oZ-5l
 for xen-devel@lists.xenproject.org; Sat, 19 Apr 2025 22:13:20 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e840d94-1d6b-11f0-9ffb-bf95429c2676;
 Sun, 20 Apr 2025 00:13:18 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1745100566539673.7790316696628;
 Sat, 19 Apr 2025 15:09:26 -0700 (PDT)
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
X-Inumbo-ID: 7e840d94-1d6b-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; t=1745100570; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QzRaWbeQpwkUFIp4sul5KdDV5Prz7T0mPj68GLFG9CCLF7kc5Ywyv2vbTrH5WXNGgi4sOAk3AjDi+7a0R8dF7ydd0a73KJMzQAB6jyomDPF6vKIIh1TRp5ekJsmuq9/Ypym7fWk7KL36XPeZilk66gqYsDudDrxBLq9lN5idbiQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745100570; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2pfoYx7ufXR5MimMumzHjXA6Uyttums4Ez5tgMk1h/4=; 
	b=NQuHOYgx7Tuts1j2/y+NFEASXsc8GAvtPL04pGoPTHxili+yVcRc3/E2tge4dEna4Z0bFkSXWDtao0ZKBNFLpZ6H9zgFq40Tc/8wClf5nRnZmasKY1n1NwoGjIJWBO5kfPmDerNyF99eLbkvZFd5R/y+W0sazb3bdMhuqx6EzQw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745100570;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=2pfoYx7ufXR5MimMumzHjXA6Uyttums4Ez5tgMk1h/4=;
	b=rR5jPit++B6TRxeO/HzIn+sRw5HczLcZ+n08bCjMDCOXIe8twcjj9z284AWY68AC
	LntuqGder4hkv/YTdnuryMeTvIGRy1eIddYSJlqdz+KS5lAqrd+G4RtlwNXxv+T3IvO
	9Z21b/ZnE+W0aMhptIKv+fWIEkLHiIsCl5cqK/Xo=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC 34/38] x86/hyperlaunch: introduce multidomain kconfig option
Date: Sat, 19 Apr 2025 18:08:16 -0400
Message-Id: <20250419220820.4234-35-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250419220820.4234-1-dpsmith@apertussolutions.com>
References: <20250419220820.4234-1-dpsmith@apertussolutions.com>
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
 xen/arch/x86/domain-builder/Kconfig  | 12 ++++++++++++
 xen/arch/x86/domain-builder/domain.c |  2 +-
 xen/arch/x86/include/asm/bootinfo.h  |  2 +-
 xen/arch/x86/include/asm/setup.h     |  2 +-
 5 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index e488a204372b..8c8cb08a6f7e 100644
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
 
diff --git a/xen/arch/x86/domain-builder/Kconfig b/xen/arch/x86/domain-builder/Kconfig
index 51d549c20df3..05d7859e6b53 100644
--- a/xen/arch/x86/domain-builder/Kconfig
+++ b/xen/arch/x86/domain-builder/Kconfig
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
diff --git a/xen/arch/x86/domain-builder/domain.c b/xen/arch/x86/domain-builder/domain.c
index b413a87cc9c9..919df1ffb1c3 100644
--- a/xen/arch/x86/domain-builder/domain.c
+++ b/xen/arch/x86/domain-builder/domain.c
@@ -399,7 +399,7 @@ struct domain *__init arch_create_dom(
     if ( !(bd->capabilities & BUILD_CAPS_HARDWARE) )
         alloc_console_evtchn(bi, bd);
 
-    if ( construct_dom0(bd) != 0 )
+    if ( construct_dom(bd) != 0 )
         panic("Could not construct domain 0\n");
 
     XFREE(cmdline);
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
 
-- 
2.30.2


