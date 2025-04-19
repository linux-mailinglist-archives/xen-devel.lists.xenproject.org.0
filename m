Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5F1A945C8
	for <lists+xen-devel@lfdr.de>; Sun, 20 Apr 2025 00:21:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.960275.1352393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GZ8-0006zw-4F; Sat, 19 Apr 2025 22:21:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 960275.1352393; Sat, 19 Apr 2025 22:21:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GZ7-0006nr-SD; Sat, 19 Apr 2025 22:21:37 +0000
Received: by outflank-mailman (input) for mailman id 960275;
 Sat, 19 Apr 2025 22:21:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nqik=XF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1u6GP9-0004yY-WA
 for xen-devel@lists.xenproject.org; Sat, 19 Apr 2025 22:11:20 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 377390f8-1d6b-11f0-9eb0-5ba50f476ded;
 Sun, 20 Apr 2025 00:11:19 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1745100534648793.2115318942064;
 Sat, 19 Apr 2025 15:08:54 -0700 (PDT)
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
X-Inumbo-ID: 377390f8-1d6b-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; t=1745100540; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EPa67t7mNi7fF2zt10Ul0B2UoAt8xxdRmVRzHl1ZUlfgt4lyO59jE+L/h3OSf/z7YD8SAo3lOkLi45aH6xgVyBUiqhqEGPu5Ko7h+Hi5Xi4pSIIjFohj1bKdi14JEMRrUEPvETir9cExUs+fRRfe5/ZfFUzfIHnvQTyrKnGHAeg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745100540; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2mkjxzW5Ru2Q92RR48HdEoTcd4H0/JB/kPW2NI5sInE=; 
	b=J4tji14XEmKCceQDiriM56toiiaDpVIvUKZVULx5y7PDUeCabDOKaYOuo/d+VaJkcBKlKFeeL4YdVsM4J0nvWrp96jPHhVip1Pcanqa1A37flOxJzAQDU+NJMvOQcCI2h5TFm+DML2d2mmdcInr/DoVzfAAWTVhe6dQrOSV3r8w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745100540;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=2mkjxzW5Ru2Q92RR48HdEoTcd4H0/JB/kPW2NI5sInE=;
	b=HJYDam8Try/ibd4JiDWljMjg/93cJUlaibk/F0Var7goINrYqEl/8M5SqBdTwhVB
	bv67aafshWF2D5reTbey8gETBoYDkJrs5WBodfVcxllArgjXgJD0cwka8mp6LuMTW52
	6SJEmmG0jHkfWRRADTbbyq9bSfu/xAgQsGrlF0zc=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC 18/38] x86/boot: rename pvh acpi setup function
Date: Sat, 19 Apr 2025 18:08:00 -0400
Message-Id: <20250419220820.4234-19-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250419220820.4234-1-dpsmith@apertussolutions.com>
References: <20250419220820.4234-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The function pvh_setup_acpi() is dom0 specific, renaming it to
dom0_pvh_setup_acpi(). Now export the function so that it may be called by the
domain builder.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/hvm/dom0_build.c         | 4 ++--
 xen/arch/x86/include/asm/dom0_build.h | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index a3b6afc5318a..8ea4c7bd2792 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -1125,7 +1125,7 @@ static int __init pvh_setup_acpi_xsdt(struct domain *d, paddr_t madt_addr,
     return rc;
 }
 
-static int __init pvh_setup_acpi(struct domain *d, paddr_t start_info)
+int __init dom0_pvh_setup_acpi(struct domain *d, paddr_t start_info)
 {
     unsigned long pfn, nr_pages;
     paddr_t madt_paddr, xsdt_paddr, rsdp_paddr;
@@ -1283,7 +1283,7 @@ int __init dom0_construct_pvh(struct boot_domain *bd)
         return rc;
     }
 
-    rc = pvh_setup_acpi(d, start_info);
+    rc = dom0_pvh_setup_acpi(bd->d, start_info);
     if ( rc )
     {
         printk("Failed to setup Dom0 ACPI tables: %d\n", rc);
diff --git a/xen/arch/x86/include/asm/dom0_build.h b/xen/arch/x86/include/asm/dom0_build.h
index e5debd5adf9f..36f563bd9d5b 100644
--- a/xen/arch/x86/include/asm/dom0_build.h
+++ b/xen/arch/x86/include/asm/dom0_build.h
@@ -20,6 +20,8 @@ void dom0_pv_restrict_pages(
 
 void dom0_pvh_setup_e820(struct domain *d, unsigned long nr_pages);
 
+int dom0_pvh_setup_acpi(struct domain *d, paddr_t start_info);
+
 int dom0_construct_pv(struct boot_domain *bd);
 int dom0_construct_pvh(struct boot_domain *bd);
 
-- 
2.30.2


