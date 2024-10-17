Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A60D99A2AC3
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 19:21:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821059.1234891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1UBO-0007zs-3z; Thu, 17 Oct 2024 17:21:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821059.1234891; Thu, 17 Oct 2024 17:21:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1UBN-0007tz-T4; Thu, 17 Oct 2024 17:21:05 +0000
Received: by outflank-mailman (input) for mailman id 821059;
 Thu, 17 Oct 2024 17:21:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KqF2=RN=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t1U04-0008TH-IH
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 17:09:24 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8dc2d6f9-8caa-11ef-a0be-8be0dac302b0;
 Thu, 17 Oct 2024 19:09:23 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729184667892741.9331042535918;
 Thu, 17 Oct 2024 10:04:27 -0700 (PDT)
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
X-Inumbo-ID: 8dc2d6f9-8caa-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1729184670; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WVR/lDK+04iVOVW/0H/mHVl9L6kUHWCNJWWyghZxCuhKlHc4yQfq8WpNiXnkMQugs8k+RIccLmVyDuEDFkMARnlnSPqKZPEAl64FEOlraHKZDogGGgAEF6HzAU9IxcfVwSUHYV8ZJ/A4jhv4/cONHMBDlcbNF156qAXxTUhe268=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729184670; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+1GsfAAD9TH3Wlh8fsiZ1qgiG1+d1IF1Bk8zaWFZI9U=; 
	b=ebrqyv3CKounmHSUNcjhbQviXOLghOgMdrTbkGE8+YK5rCsdZgkVnYdXASMvjl+x0Nh5ONlzRWzExGSyV2L60T4JDofJbdFIG+bdw4YLtZom81jdKrm0JJekFdYCO9TqHWZ60EcsMVNfIn44RY1Yyi9nSuSh1gDrfB6KVq6TuIk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729184670;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=+1GsfAAD9TH3Wlh8fsiZ1qgiG1+d1IF1Bk8zaWFZI9U=;
	b=l53SLPqO/UvAc2AhBCNFOElQLLyAgDloPG62jPyUtOMKRBeTGvV5kg6bPyC6K/19
	ap1KP+Q7nlw1wpt/H1/w+HUzBw2YdaKixh25040M4VyxfJFQG5/Wktq63PkIp/dm4AT
	tpq7/5t2Uh90tGiSRMfz3G3gCVBEIxKvvW2yHvpg=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 42/44] x86/boot: convert construct_dom0 to struct boot_domain
Date: Thu, 17 Oct 2024 13:03:22 -0400
Message-Id: <20241017170325.3842-43-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241017170325.3842-1-dpsmith@apertussolutions.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
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
index 494e48a7c836..d9ad27093611 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1014,7 +1014,7 @@ static struct domain *__init create_dom0(struct boot_info *bi)
 
     bd->d = d;
 
-    if ( construct_dom0(d, bd->kernel, bd->ramdisk, bd->cmdline) != 0 )
+    if ( construct_dom0(bd) != 0 )
         panic("Could not construct domain 0\n");
 
     return bd->d;
-- 
2.30.2


