Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B289A945B5
	for <lists+xen-devel@lfdr.de>; Sun, 20 Apr 2025 00:13:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.960119.1352226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GRG-0005Zb-ID; Sat, 19 Apr 2025 22:13:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 960119.1352226; Sat, 19 Apr 2025 22:13:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GRG-0005X2-EJ; Sat, 19 Apr 2025 22:13:30 +0000
Received: by outflank-mailman (input) for mailman id 960119;
 Sat, 19 Apr 2025 22:13:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nqik=XF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1u6GRE-0004oZ-G7
 for xen-devel@lists.xenproject.org; Sat, 19 Apr 2025 22:13:28 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83493424-1d6b-11f0-9ffb-bf95429c2676;
 Sun, 20 Apr 2025 00:13:26 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 174510056489920.502879948931422;
 Sat, 19 Apr 2025 15:09:24 -0700 (PDT)
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
X-Inumbo-ID: 83493424-1d6b-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; t=1745100568; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fQHCS4QPnpOILamjvaebZDeR8BHGW0ULo0rQJo3rxIqb4MkyDCZ+n3iUIxxuiH/e/7E/62Qf9G5SQ1RlEFjnbJdMOphQQyexKUiL0u7boabOHPsT2RAufl/xXKDAuFxCoZJNbqNxkm3jYkDekGQOl2wcP07FiHDWHoF69cf687s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745100568; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9J5GpuQpFoOEieUW2L0AylJvJrVRYTI0FgGOBBazw64=; 
	b=mZgHBox8c7XDqYwt+pOI+4q6yiZO1cIuQh86w89fhSNAmU3Gqta0CXccH+hzK7dx/4o02HpOMpXKPqt90HDearHeTdHULzAXiF92tnuqhpi54ZU0kCHOxl/ehDA6YXtD+4oNOI0U/BQ59gUXlJQaCvF3oCm7Nx74BtxRSpF8kxI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745100568;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=9J5GpuQpFoOEieUW2L0AylJvJrVRYTI0FgGOBBazw64=;
	b=SyqHYQcvV0xRaOfXBsErvSiGPB+ge32s7BbiKW0b9/hC7YytSM+Js9VNS6BSjLvB
	Yem6rP0Ym/oX2qUdqLH7KuungAjcHwGR5DTrEOrEJpTVGW4aEiuMUZeSvzoc6lybPZD
	X8eqZouVTojr+QsglPPWUcg7BZoQkmMWfaiJCpqU=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC 32/38] x86/hyperlaunch: introduce concept of core domains
Date: Sat, 19 Apr 2025 18:08:14 -0400
Message-Id: <20250419220820.4234-33-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250419220820.4234-1-dpsmith@apertussolutions.com>
References: <20250419220820.4234-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

When constructing domU, and specifically the event channels for their console
and xenstore event channels, the domid for the backing domain must be known.
Therefore, the control, hardware, and xenstore domains are deemed as core
domains, and must be constructed before any of the other domains.

This commit introduces the build_core_domains() function that will ensure the
core domains are constructed first.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/domain-builder/core.c     | 68 ++++++++++++++++++++++++--
 xen/arch/x86/include/asm/boot-domain.h |  2 +
 2 files changed, 66 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/domain-builder/core.c b/xen/arch/x86/domain-builder/core.c
index 901efce62a61..f693aa46d278 100644
--- a/xen/arch/x86/domain-builder/core.c
+++ b/xen/arch/x86/domain-builder/core.c
@@ -103,18 +103,78 @@ void __init builder_init(struct boot_info *bi)
     }
 }
 
+static int  __init build_core_domains(struct boot_info *bi)
+{
+    int count = 0;
+    struct boot_domain *bd;
+    int hw, cd, xs;
+
+    cd = first_boot_domain_index(bi, BUILD_CAPS_CONTROL);
+    if ( cd > MAX_NR_BOOTDOMS )
+        printk(XENLOG_WARNING "No control domain was defined\n");
+    else
+    {
+        bd = &bi->domains[cd];
+
+        arch_create_dom(bi, bd);
+        if ( bd->d )
+        {
+            bd->constructed = true;
+            count++;
+        }
+    }
+
+    hw = first_boot_domain_index(bi, BUILD_CAPS_HARDWARE);
+    if ( hw > MAX_NR_BOOTDOMS )
+        printk(XENLOG_WARNING "No hardware domain was defined\n");
+    else
+    {
+        if ( hw != cd )
+        {
+            bd = &bi->domains[hw];
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
+    xs = first_boot_domain_index(bi, BUILD_CAPS_XENSTORE);
+    if ( xs > MAX_NR_BOOTDOMS )
+        printk(XENLOG_WARNING "No xenstore domain was defined\n");
+    else
+    {
+        if ( xs != cd && xs != hw )
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
+    return count;
+}
+
 unsigned int __init builder_create_domains(struct boot_info *bi)
 {
     unsigned int build_count = 0;
     struct boot_domain *bd = &bi->domains[0];
 
+    if ( bi->nr_domains == 0 )
+        panic("%s: no domains defined\n", __func__);
+
     if ( bd->kernel == NULL && bd->capabilities & BUILD_CAPS_CONTROL )
         panic("%s: control domain missing kernel\n", __func__);
 
-
-    arch_create_dom(bi, bd);
-    if ( bd->d )
-        build_count++;
+    build_count = build_core_domains(bi);
 
     /* Free temporary buffers. */
     free_boot_modules();
diff --git a/xen/arch/x86/include/asm/boot-domain.h b/xen/arch/x86/include/asm/boot-domain.h
index df2bfa0c94fa..a574f4941ed3 100644
--- a/xen/arch/x86/include/asm/boot-domain.h
+++ b/xen/arch/x86/include/asm/boot-domain.h
@@ -42,6 +42,8 @@ struct boot_domain {
         xen_pfn_t gfn;
         evtchn_port_t evtchn;
     } console, store;
+
+    bool constructed;
 };
 
 #endif
-- 
2.30.2


