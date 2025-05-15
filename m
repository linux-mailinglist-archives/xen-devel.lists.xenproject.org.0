Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B683AB8809
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 15:33:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985494.1371450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYhw-0008CZ-42; Thu, 15 May 2025 13:33:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985494.1371450; Thu, 15 May 2025 13:33:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYhw-0008Ac-0e; Thu, 15 May 2025 13:33:08 +0000
Received: by outflank-mailman (input) for mailman id 985494;
 Thu, 15 May 2025 13:33:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WRi0=X7=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1uFYXy-0006hT-1k
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 13:22:50 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0ef87a9-318f-11f0-9ffb-bf95429c2676;
 Thu, 15 May 2025 15:22:48 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1747315203898774.28914981641;
 Thu, 15 May 2025 06:20:03 -0700 (PDT)
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
X-Inumbo-ID: b0ef87a9-318f-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; t=1747315206; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=d+cKlHslB97Fgzmkuw8WVae7Gg0J20oOIGKDvPqOUaw9s4iah9L52ZwOsIcUwLnX8HED62SK6MspQ1kIqt2AMZ0QOx0v7ICnD6cLa8xpejfFA0JcRUnkJ/ZvpAbbdcOCDk95niqj1ZKNWT2pPHmAQEbECtmUSCssxWYG+Cmc3Iw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747315206; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WDa/Mkj3Tjniuh016pru5/pfbd3GRCwENfg6jnawTYA=; 
	b=dEi1MSi66N0PSmn3KTiyv6qzJVY8RtkBZhUVDGknlPUi+DFz5r6RsYA7cHeMZbWulAcZg2qrfuRcKhAt1hVwVYFu8O2gLuROtBmY7Cy+wzJLaeqyyc1YyDpHbBrw4xHKuTXU9v+VQn1x3+WuS+oxSbY1Mysu2Nxiq7JAgs25cVE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747315206;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=WDa/Mkj3Tjniuh016pru5/pfbd3GRCwENfg6jnawTYA=;
	b=SMJPI1sNgt0DPze3WNar++exrUJ8OEoGESbyIwBnGs3UbhTR60z8wBl5svugpywh
	cuZQ3fvB+jScFo9SY0RFkmhKaSgzNaHVOTQX9cYDClDyCOTMA4XpwD+g/4QSP3JWo+E
	HbQt4o8yHwaLmIjbcfXHp4ouD/dtx7CU84s9+4Go=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFCv2 30/38] x86/hyperlaunch: introduce concept of core domains
Date: Thu, 15 May 2025 09:19:42 -0400
Message-Id: <20250515131951.5594-1-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

When constructing a disaggregated Xen system, there are certain domains with
particular capabilities that must be present and running at start-of-day. The
hardware domain is absolutely required, while a xenstore domain is mostly
required.

The function build_core_domains is introduced to encapsulate the construction
of the core domains.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

---

Changes in RFCv2:
- rewrote build_core_domains due address the reordering event channel creation
---
 xen/arch/x86/domain-builder/core.c     | 66 +++++++++++++++++++++++---
 xen/arch/x86/include/asm/boot-domain.h |  2 +
 2 files changed, 61 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/domain-builder/core.c b/xen/arch/x86/domain-builder/core.c
index 4eaf3a111208..af79792b5316 100644
--- a/xen/arch/x86/domain-builder/core.c
+++ b/xen/arch/x86/domain-builder/core.c
@@ -3,24 +3,76 @@
  * Copyright (C) 2025, Apertus Solutions, LLC
  */
 
+#include <xen/bug.h>
 #include <xen/domain-builder.h>
 #include <xen/init.h>
 #include <xen/lib.h>
 
 #include <asm/bootinfo.h>
+#include <asm/pv/shim.h>
+
+static int  __init build_core_domains(struct boot_info *bi)
+{
+    int count = 0;
+    struct boot_domain *bd;
+    int hw, xs;
+
+    hw = first_boot_domain_index(bi, DOMAIN_CAPS_HARDWARE);
+    if ( hw > MAX_NR_BOOTDOMS )
+        panic("%s: hardware domain missing\n", __func__);
+    else
+    {
+        bd = &bi->domains[hw];
+
+        arch_create_dom(bi, bd);
+        if ( bd->d )
+        {
+            bd->constructed = true;
+            count++;
+        }
+    }
+
+    xs = first_boot_domain_index(bi, DOMAIN_CAPS_XENSTORE);
+    if ( xs > MAX_NR_BOOTDOMS )
+        printk(XENLOG_WARNING "No xenstore domain was defined\n");
+    else
+    {
+        if ( !bi->domains[xs].constructed )
+        {
+            bd = &bi->domains[xs];
+
+            arch_create_dom(bi, bd);
+            if ( bd->d )
+            {
+                bd->constructed = true;
+                count++;
+            }
+        }
+    }
+
+    ASSERT(count <= bi->nr_domains);
+
+    return count;
+}
 
 unsigned int __init builder_create_domains(struct boot_info *bi)
 {
     unsigned int build_count = 0;
-    struct boot_domain *bd = &bi->domains[0];
-
-    if ( bd->capabilities & DOMAIN_CAPS_HARDWARE && bd->kernel == NULL )
-        panic("%s: hardware domain missing kernel\n", __func__);
 
+    if ( bi->nr_domains == 0 )
+        panic("%s: no domains defined\n", __func__);
 
-    arch_create_dom(bi, bd);
-    if ( bd->d )
-        build_count++;
+    if ( pv_shim )
+    {
+        arch_create_dom(bi, &bi->domains[0]);
+        if ( bi->domains[0].d )
+        {
+            bi->domains[0].constructed = true;
+            build_count++;
+        }
+    }
+    else
+        build_count = build_core_domains(bi);
 
     arch_builder_finalize(bi);
 
diff --git a/xen/arch/x86/include/asm/boot-domain.h b/xen/arch/x86/include/asm/boot-domain.h
index 66f3a71fd597..41246f31acce 100644
--- a/xen/arch/x86/include/asm/boot-domain.h
+++ b/xen/arch/x86/include/asm/boot-domain.h
@@ -36,6 +36,8 @@ struct boot_domain {
     struct domain *d;
 
     xen_pfn_t xs_page, cons_page;
+
+    bool constructed;
 };
 
 static inline bool __init has_dom0_caps(const struct boot_domain *bd)
-- 
2.30.2


