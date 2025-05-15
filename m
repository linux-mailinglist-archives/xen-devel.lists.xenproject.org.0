Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F080EAB87F7
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 15:31:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985472.1371431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYgK-0006rj-Jm; Thu, 15 May 2025 13:31:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985472.1371431; Thu, 15 May 2025 13:31:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYgK-0006og-Fv; Thu, 15 May 2025 13:31:28 +0000
Received: by outflank-mailman (input) for mailman id 985472;
 Thu, 15 May 2025 13:31:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WRi0=X7=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1uFYVz-0001J6-Dt
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 13:20:47 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6874c8f3-318f-11f0-9eb6-5ba50f476ded;
 Thu, 15 May 2025 15:20:46 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1747315102766617.7586421581187;
 Thu, 15 May 2025 06:18:22 -0700 (PDT)
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
X-Inumbo-ID: 6874c8f3-318f-11f0-9eb6-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; t=1747315107; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=V62vozW4fixzn4GmMXPxn8QV5qJOjO6ZwgDWgZvDU8uei34mLHFqYc64BfV06ecCliHwTbcfv/OugmzthwbnOwb1Ve74kBd8mU3z2mM/fVcCvp9krxq8YkJReVC1j3guYXCPM/OjOX22GmAOTmc2b2/BWWLCYxlLuQdqAl9tyvw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747315107; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=P3H/9i2KknvPDFh0EQzL+jlxmzJaWhM9u6fW8uCKxIU=; 
	b=MOHzUXcjnZfXTX5Cz9rUqE51TqVhlUuIXi6Ven7MrQPd22mRuAEPI0uv4aF/5lOsVPOCFSgqyrxjqppdRH/TNYkW/HVkSXTYSsX1nIzDzBVMVsS2DNi34Q415o9D2Ezp9/RzCbL/D9FkrVzm9RKwzaIpEPw6RNH6t34dhdv9u6k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747315106;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=P3H/9i2KknvPDFh0EQzL+jlxmzJaWhM9u6fW8uCKxIU=;
	b=oQFn78u8Kzs/c1IQAdJZwu+cT4wVjUKekT3PdUmbofD1lwL8gadrsKL55XuvqDuj
	aYAj1uOKOwDryc3Asz88hgDIFiGocOC2DYe267BqTGkCJv66Hm+tvXZiuHNREBnK8wI
	Eqa1f8tHYFr6d4ZbgbOQfy0/Ss8ZQtNZewadgnC8=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFCv2 17/38] x86/boot: rename pvh acpi setup function
Date: Thu, 15 May 2025 09:17:23 -0400
Message-Id: <20250515131744.3843-18-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250515131744.3843-1-dpsmith@apertussolutions.com>
References: <20250515131744.3843-1-dpsmith@apertussolutions.com>
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
index 7b9a2cccabce..9ea8acbb5a02 100644
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


