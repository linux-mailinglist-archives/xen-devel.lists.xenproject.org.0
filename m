Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A6CA945B3
	for <lists+xen-devel@lfdr.de>; Sun, 20 Apr 2025 00:13:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.960114.1352206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GR0-0004rN-27; Sat, 19 Apr 2025 22:13:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 960114.1352206; Sat, 19 Apr 2025 22:13:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GQz-0004p0-VD; Sat, 19 Apr 2025 22:13:13 +0000
Received: by outflank-mailman (input) for mailman id 960114;
 Sat, 19 Apr 2025 22:13:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nqik=XF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1u6GQy-0004oZ-Ku
 for xen-devel@lists.xenproject.org; Sat, 19 Apr 2025 22:13:12 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79c93cdc-1d6b-11f0-9ffb-bf95429c2676;
 Sun, 20 Apr 2025 00:13:10 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1745100552863208.68927810979392;
 Sat, 19 Apr 2025 15:09:12 -0700 (PDT)
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
X-Inumbo-ID: 79c93cdc-1d6b-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; t=1745100556; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LHcEECMDjJj3dC1RqieD9Wr7XiwZxrVMvdlaLg9Xxgx0jSazAiWW/miGr06eWR1/1dwfR3RWIwelv+cIxcij2O7HGraU0P5T86QKyMfnxBEXNkLh5vfr+qL2J7kMDmsKHvCze6woX6nCxuwTYZFq0H9MvtOo6VLAQ2JzIwsyqYY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745100556; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5FUmF1YRY9NDE1umkBI15/zKKYB7vvic5T3QpbucTJ0=; 
	b=fzTYjYL1wH7w0gBmq5H0mV1sJyq3I/1Gxg02/oKnjCFM4mGp/+mBhvQuzkcEQI2+SOQ9eGqP5hYnnDeX7JwwK6Ua+EjlMbvo/37y8aQvBF9Wwv8ew3Ue46ZlxEkWzMW/f3Z8QATAI62VeJeZ3/5grvll3s0oPqJBTp0XxSxv5Bk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745100556;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=5FUmF1YRY9NDE1umkBI15/zKKYB7vvic5T3QpbucTJ0=;
	b=Oj9T8XhxwGoAp7n/4JvkPILnnCIQ6wc4eL+RcluTNx36iQLN4CXQl2pOc1y8rq1N
	vnWz81HiJA9PPTxzfcYQ3WFpnczBiEDBaNigwJc9sjOEC3tEFQXyrUI+MtwMa0hjqWZ
	1aFTz+Od1BWHjUYqhawfx3lQU3KOopzkQU7dbt8U=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC 28/38] x86/hyperlaunch: add xenstore boot capabilities flag
Date: Sat, 19 Apr 2025 18:08:10 -0400
Message-Id: <20250419220820.4234-29-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250419220820.4234-1-dpsmith@apertussolutions.com>
References: <20250419220820.4234-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Add the ability to designate a domain as the Xenstore domain via the
hyperlaunch configuration.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/domain-builder/core.c     | 2 +-
 xen/arch/x86/domain-builder/domain.c   | 2 ++
 xen/arch/x86/domain-builder/fdt.c      | 2 ++
 xen/arch/x86/include/asm/boot-domain.h | 1 +
 4 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/domain-builder/core.c b/xen/arch/x86/domain-builder/core.c
index 2f0b8bd82c3a..e21f5efbfe62 100644
--- a/xen/arch/x86/domain-builder/core.c
+++ b/xen/arch/x86/domain-builder/core.c
@@ -98,7 +98,7 @@ void __init builder_init(struct boot_info *bi)
         bi->mods[i].type = BOOTMOD_KERNEL;
         bi->domains[0].kernel = &bi->mods[i];
         bi->domains[0].capabilities |=
-            (BUILD_CAPS_CONTROL | BUILD_CAPS_HARDWARE);
+            (BUILD_CAPS_CONTROL | BUILD_CAPS_HARDWARE | BUILD_CAPS_XENSTORE);
         bi->nr_domains = 1;
     }
 }
diff --git a/xen/arch/x86/domain-builder/domain.c b/xen/arch/x86/domain-builder/domain.c
index 13f99111a3a9..c1b2e011aaa0 100644
--- a/xen/arch/x86/domain-builder/domain.c
+++ b/xen/arch/x86/domain-builder/domain.c
@@ -250,6 +250,8 @@ struct domain *__init arch_create_dom(
     if ( bd->domid == DOMID_INVALID )
         /* Create initial domain.  Not d0 for pvshim. */
         bd->domid = get_initial_domain_id();
+    if ( bd->capabilities & BUILD_CAPS_XENSTORE )
+        dom_cfg.flags |= XEN_DOMCTL_CDF_xs_domain;
     if ( bd->capabilities & BUILD_CAPS_CONTROL )
         create_flags |= CDF_privileged | CDF_hardware;
     d = domain_create(bd->domid, &dom_cfg,
diff --git a/xen/arch/x86/domain-builder/fdt.c b/xen/arch/x86/domain-builder/fdt.c
index 1af58ed4eb86..9c6c0ae09a24 100644
--- a/xen/arch/x86/domain-builder/fdt.c
+++ b/xen/arch/x86/domain-builder/fdt.c
@@ -269,6 +269,8 @@ static int __init process_domain_node(
                 printk("c");
             if ( bd->capabilities & BUILD_CAPS_HARDWARE )
                 printk(" h");
+            if ( bd->capabilities & BUILD_CAPS_XENSTORE )
+                printk(" x");
             printk("\n");
         }
     }
diff --git a/xen/arch/x86/include/asm/boot-domain.h b/xen/arch/x86/include/asm/boot-domain.h
index 18d144de2fea..32f1f8fbc4e8 100644
--- a/xen/arch/x86/include/asm/boot-domain.h
+++ b/xen/arch/x86/include/asm/boot-domain.h
@@ -16,6 +16,7 @@ struct boot_domain {
 #define BUILD_CAPS_NONE          (0)
 #define BUILD_CAPS_CONTROL       (1 << 0)
 #define BUILD_CAPS_HARDWARE      (1 << 1)
+#define BUILD_CAPS_XENSTORE      (1 << 2)
     uint32_t capabilities;
 
                                           /* On     | Off    */
-- 
2.30.2


