Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A02AB87BF
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 15:20:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985339.1371276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYVr-0005DJ-8S; Thu, 15 May 2025 13:20:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985339.1371276; Thu, 15 May 2025 13:20:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYVq-0005Af-W7; Thu, 15 May 2025 13:20:38 +0000
Received: by outflank-mailman (input) for mailman id 985339;
 Thu, 15 May 2025 13:20:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WRi0=X7=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1uFYVF-00017p-Bu
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 13:20:01 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c85656f-318f-11f0-9ffb-bf95429c2676;
 Thu, 15 May 2025 15:19:59 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1747315099866282.80562315486736;
 Thu, 15 May 2025 06:18:19 -0700 (PDT)
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
X-Inumbo-ID: 4c85656f-318f-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; t=1747315101; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aRh+yUXQmYU+RmfETNdrkEGzca5UOD2tTQn91CdoLUbD8mzZZZfp7pt1s+72++uLolHTzggwg7WirPXBxoz/RiWDt7CNZOWfn0zv9JOrOzC7uvevXl+se5Fl2W6QEy7LM+iVtSj6yiLKGw06hOi10iYUzmwig7gLKY7hXalBbv8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747315101; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ICDJmXNIOhJuI8oO8RsNDdgf3Sl+EcMlmuMMxu1kPpc=; 
	b=XCQ1nlQpw37XY25Nk5IXUvZL+aHSb3GGvwMU9Ofj839UtXzrctl94wykUpwwuS0LRc4Fk0z/Ih/AFR1jBtz2jhmCoxQRs8m1qG363GnLNvw8fU1QUDEL1rFQ1PVdpP5yTwtYSIuSyedvk0UT6PcCFI6VZldnMnSf2ZZAocjFB68=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747315101;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=ICDJmXNIOhJuI8oO8RsNDdgf3Sl+EcMlmuMMxu1kPpc=;
	b=U3dpzQzKKLq6sicjzC9VB2uizzorWqiLbMUFzAVoaMb2WJCp2FC7wvunfWxIB3MT
	ZT+Zu0sAUtDaT4ud22yFvnePDhYHod9cV7p8Nuno0wmMQnk537Lw4aW+lQz8tlIMyGx
	l16NWHjx91bhUUy75NCSyPXyyWE7lFbxnGHpRauk=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFCv2 14/38] x86/hyperlaunch: move iommu init to domain builder
Date: Thu, 15 May 2025 09:17:20 -0400
Message-Id: <20250515131744.3843-15-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250515131744.3843-1-dpsmith@apertussolutions.com>
References: <20250515131744.3843-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Move invocation of iommu_hwdom_init() to dom_construct_pvh() and guard it
with a hardware domain check.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/hvm/dom0_build.c | 2 --
 xen/arch/x86/hvm/dom_build.c  | 4 ++++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 378a1f29fb1b..6990c1d3a882 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -1304,8 +1304,6 @@ int __init dom0_construct_pvh(struct boot_domain *bd)
     struct domain *d = bd->d;
     int rc;
 
-    iommu_hwdom_init(d);
-
     rc = pvh_populate_p2m(d);
     if ( rc )
     {
diff --git a/xen/arch/x86/hvm/dom_build.c b/xen/arch/x86/hvm/dom_build.c
index eec65e3e805e..450e77d190a2 100644
--- a/xen/arch/x86/hvm/dom_build.c
+++ b/xen/arch/x86/hvm/dom_build.c
@@ -9,6 +9,7 @@
  */
 
 #include <xen/acpi.h>
+#include <xen/iommu.h>
 #include <xen/init.h>
 #include <xen/softirq.h>
 #include <xen/types.h>
@@ -92,6 +93,9 @@ int __init dom_construct_pvh(struct boot_domain *bd)
      */
     pvh_init_p2m(bd);
 
+    if ( is_hardware_domain(bd->d) )
+        iommu_hwdom_init(bd->d);
+
     return dom0_construct_pvh(bd);
 }
 
-- 
2.30.2


