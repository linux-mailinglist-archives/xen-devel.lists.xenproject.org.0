Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D7F9A5855
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 02:56:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822985.1237004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gj1-0002u0-9C; Mon, 21 Oct 2024 00:56:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822985.1237004; Mon, 21 Oct 2024 00:56:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gj1-0002pM-3x; Mon, 21 Oct 2024 00:56:47 +0000
Received: by outflank-mailman (input) for mailman id 822985;
 Mon, 21 Oct 2024 00:56:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q0x4=RR=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t2gdT-0001i1-8Z
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 00:51:03 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89e10626-8f46-11ef-a0be-8be0dac302b0;
 Mon, 21 Oct 2024 02:51:01 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729471625461841.4722904899356;
 Sun, 20 Oct 2024 17:47:05 -0700 (PDT)
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
X-Inumbo-ID: 89e10626-8f46-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1729471627; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eMa1HRJ1pAyi+naSie41rXJ4ul0tWIH6Mf4h5eXWiaMGb1WtszHSh0FRIeIfbYUSrSAUmnpdGvtXa06ctW+iYcPYSBCXeUAxUozuCXoMRDYY/q65I8iYpPnFPGfvhBUb/XIzO0oCRto+U2R5PAmk7HjPgErldu9D/bPhVv9fI1k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729471627; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Bmio29Z/US+aVmz65/fnIfDiOrUjnKKY2s1SIs0oHx0=; 
	b=FtcGzU9OdEGgDi8JtV8esFwJZdDdYc3FwToszELgJYCKjLI10GiASnswuPw0hk7hEq7e8nvSC+WZq7R2jdAPvn09nqy52EHLCBvJdA/bAUM2iyQ0wmoRHEDTs/yCBAjHRfyLVzmIpic9hO24x6gBpZZRbMCro5Qm/fuBSa+h3EM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729471627;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=Bmio29Z/US+aVmz65/fnIfDiOrUjnKKY2s1SIs0oHx0=;
	b=Uq+pgaMtepxBpvUbdDz5+mnmmL609SPvaVha7e1ZNQ2Ybm2UqTMUuEx8ZNQI4Qm/
	fpUDozbuGyV0n46vcwpX27e8ym2e/3waNyoO5UGlhRMvLrbQ6mPdj+XZ+u6btWdMDoF
	TQ9Nf0W8C6FMXY6E+BPtiWkrmgvUniB6ptze7JSI=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v7 36/38] x86/boot: convert construct_dom0 to struct boot_domain
Date: Sun, 20 Oct 2024 20:46:11 -0400
Message-Id: <20241021004613.18793-37-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241021004613.18793-1-dpsmith@apertussolutions.com>
References: <20241021004613.18793-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

A struct boot_domain now encapsulates the domain reference, kernel, ramdisk,
and command line for the domain being constructed. As a result of this
encapsulation, construct_dom0 can now take a single struct boot_domain instead
of these four parameters.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
Changes since v5:
- moved back to using variable *d to hold domain reference locally
---
 xen/arch/x86/dom0_build.c        | 8 ++++----
 xen/arch/x86/include/asm/setup.h | 4 +---
 xen/arch/x86/setup.c             | 2 +-
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 71b2e3afc1a1..34b4943de3b1 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -597,10 +597,10 @@ int __init dom0_setup_permissions(struct domain *d)
     return rc;
 }
 
-int __init construct_dom0(struct domain *d, const struct boot_module *image,
-                          struct boot_module *initrd, const char *cmdline)
+int __init construct_dom0(struct boot_domain *bd)
 {
     int rc;
+    struct domain *d = bd->d;
 
     /* Sanity! */
     BUG_ON(!pv_shim && d->domain_id != 0);
@@ -610,9 +610,9 @@ int __init construct_dom0(struct domain *d, const struct boot_module *image,
     process_pending_softirqs();
 
     if ( is_hvm_domain(d) )
-        rc = dom0_construct_pvh(d, image, initrd, cmdline);
+        rc = dom0_construct_pvh(bd->d, bd->kernel, bd->ramdisk, bd->cmdline);
     else if ( is_pv_domain(d) )
-        rc = dom0_construct_pv(d, image, initrd, cmdline);
+        rc = dom0_construct_pv(bd->d, bd->kernel, bd->ramdisk, bd->cmdline);
     else
         panic("Cannot construct Dom0. No guest interface available\n");
 
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index f7958b56eab6..b049dc5ee17e 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -26,9 +26,7 @@ void subarch_init_memory(void);
 
 void init_IRQ(void);
 
-int construct_dom0(
-    struct domain *d, const struct boot_module *image,
-    struct boot_module *initrd, const char *cmdline);
+int construct_dom0(struct boot_domain *d);
 void setup_io_bitmap(struct domain *d);
 
 extern struct boot_info xen_boot_info;
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 9423e999990a..ed4bf3d2b62b 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1030,7 +1030,7 @@ static struct domain *__init create_dom0(struct boot_info *bi)
 
     bd->d = d;
 
-    if ( construct_dom0(d, bd->kernel, bd->ramdisk, bd->cmdline) != 0 )
+    if ( construct_dom0(bd) != 0 )
         panic("Could not construct domain 0\n");
 
     return bd->d;
-- 
2.30.2


