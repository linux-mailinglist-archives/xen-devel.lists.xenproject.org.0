Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B2C966B95
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 23:53:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786728.1196447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9YK-0006ki-4c; Fri, 30 Aug 2024 21:53:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786728.1196447; Fri, 30 Aug 2024 21:53:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9YK-0006hP-0H; Fri, 30 Aug 2024 21:53:08 +0000
Received: by outflank-mailman (input) for mailman id 786728;
 Fri, 30 Aug 2024 21:53:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiG6=P5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sk9YJ-0005aM-6M
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 21:53:07 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3bea8550-671a-11ef-a0b1-8be0dac302b0;
 Fri, 30 Aug 2024 23:53:06 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 1725054506125987.9398819733996;
 Fri, 30 Aug 2024 14:48:26 -0700 (PDT)
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
X-Inumbo-ID: 3bea8550-671a-11ef-a0b1-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1725054508; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=O8TRKyhf8CV/yw/RfoC5zy4TtPHUtc8LB3MP+K0p/PkWrMwUrePhHVrH/IYTbujWy/+m9lNOYC2n4/z6q7hCrRRhGXwu+BKcqcNBhLaWde10CTgCPniDi3loDLtduY+9kQql5mWtMSJcIxlRLcy+0acfMIlTuUhMcSJ5VXdAxV8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725054508; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=CRDjJu35KX6V+P191+8yBK+MBAuPjEumeiizl3mdu7o=; 
	b=QFYXEIHnY1ez+yY/vX+3OTTkR5DKVe46LUbPe3xcjyUNthHTXSHNz2Ju3vkekhvFklCLoPF5ddBV2qjUNbH5ft3SjBqNGrkHsLgYHPQg4LL+vMkxTP4ZILXAryhlO6sVW3Pq9vEl7WXnO5EGHpf0D/CQTzUYxNAqPUG6hcRxUlg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725054508;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=CRDjJu35KX6V+P191+8yBK+MBAuPjEumeiizl3mdu7o=;
	b=ANHjI/3uMXWw5dgDKD0wrBI5ouad1BHyIwR0ocGzQEwsaFGPxDaGuD2RSj6M/1F7
	g60NIYcLWlnbJTPhI+rQY9lSEiOj5B3oVZLOsdkdCkXdpfwkco3nrhMaEyc68WKQtBg
	6herQMuzvN2pR68iFQTvhNMKqtQQ4w6Wmkzkoop8=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 42/44] x86/boot: convert construct_dom0 to struct boot_domain
Date: Fri, 30 Aug 2024 17:47:27 -0400
Message-Id: <20240830214730.1621-43-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240830214730.1621-1-dpsmith@apertussolutions.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

A struct boot_domain now encapsulates the domain reference, kernel, ramdisk,
and command line for the domain being constructed. As a result of this
encapsulation, construct_dom0 can now take a single struct boot_domain instead
of these four parameters.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/dom0_build.c        | 19 +++++++++----------
 xen/arch/x86/include/asm/setup.h |  4 +---
 xen/arch/x86/setup.c             |  2 +-
 3 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 71b2e3afc1a1..e552f2e9abef 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -597,22 +597,21 @@ int __init dom0_setup_permissions(struct domain *d)
     return rc;
 }
 
-int __init construct_dom0(struct domain *d, const struct boot_module *image,
-                          struct boot_module *initrd, const char *cmdline)
+int __init construct_dom0(struct boot_domain *bd)
 {
     int rc;
 
     /* Sanity! */
-    BUG_ON(!pv_shim && d->domain_id != 0);
-    BUG_ON(d->vcpu[0] == NULL);
-    BUG_ON(d->vcpu[0]->is_initialised);
+    BUG_ON(!pv_shim && bd->d->domain_id != 0);
+    BUG_ON(bd->d->vcpu[0] == NULL);
+    BUG_ON(bd->d->vcpu[0]->is_initialised);
 
     process_pending_softirqs();
 
-    if ( is_hvm_domain(d) )
-        rc = dom0_construct_pvh(d, image, initrd, cmdline);
-    else if ( is_pv_domain(d) )
-        rc = dom0_construct_pv(d, image, initrd, cmdline);
+    if ( is_hvm_domain(bd->d) )
+        rc = dom0_construct_pvh(bd->d, bd->kernel, bd->ramdisk, bd->cmdline);
+    else if ( is_pv_domain(bd->d) )
+        rc = dom0_construct_pv(bd->d, bd->kernel, bd->ramdisk, bd->cmdline);
     else
         panic("Cannot construct Dom0. No guest interface available\n");
 
@@ -620,7 +619,7 @@ int __init construct_dom0(struct domain *d, const struct boot_module *image,
         return rc;
 
     /* Sanity! */
-    BUG_ON(!d->vcpu[0]->is_initialised);
+    BUG_ON(!bd->d->vcpu[0]->is_initialised);
 
     return 0;
 }
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index 19e2ad95b523..8f54b429b954 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -26,9 +26,7 @@ void subarch_init_memory(void);
 
 void init_IRQ(void);
 
-int construct_dom0(
-    struct domain *d, const struct boot_module *image,
-    struct boot_module *initrd, const char *cmdline);
+int construct_dom0(struct boot_domain *d);
 void setup_io_bitmap(struct domain *d);
 
 unsigned long initial_images_nrpages(nodeid_t node);
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 872d51310628..5d48ebea51d5 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1028,7 +1028,7 @@ static struct domain *__init create_dom0(const struct boot_info *bi)
         write_cr4(read_cr4() & ~X86_CR4_SMAP);
     }
 
-    if ( construct_dom0(bd->d, bd->kernel, bd->ramdisk, bd->cmdline) != 0 )
+    if ( construct_dom0(bd) != 0 )
         panic("Could not construct domain 0\n");
 
     if ( cpu_has_smap )
-- 
2.30.2


