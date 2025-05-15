Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF847AB881F
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 15:35:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985564.1371530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYkP-0004Rb-E8; Thu, 15 May 2025 13:35:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985564.1371530; Thu, 15 May 2025 13:35:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYkP-0004Pa-BE; Thu, 15 May 2025 13:35:41 +0000
Received: by outflank-mailman (input) for mailman id 985564;
 Thu, 15 May 2025 13:35:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WRi0=X7=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1uFYYz-0006hT-5L
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 13:23:53 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6af808e-318f-11f0-9ffb-bf95429c2676;
 Thu, 15 May 2025 15:23:51 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1747315210534223.5685233894054;
 Thu, 15 May 2025 06:20:10 -0700 (PDT)
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
X-Inumbo-ID: d6af808e-318f-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; t=1747315212; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MaZQZVgSGmBm0AONeCXNoLnW18Jojn047+kvWN/Bmf/4I570pEckVQEUY3y8oIZOfUtmpRl4CjG1nb9UDXNmus+P1M+zBfqdtlzOBxSohRT0kodbGZpzh4aZoMu/VNb76Lg66c9ZQXohI1/m9k0DsncXu/QEGw8CFxOOEm8+sbc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747315212; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=TCd5wTbVXQm1/qDiCEzXOZKvySaWqAmfH5oNFsGkQLM=; 
	b=DceaBjWZoB04mP2wLMWNXvihLUqJew91/CMRqGrqhEMnJl5aKE/IJczStqtGlUiStGfiWzkSl4jHxrz93F1Gkf4QHSe1jzQ9dLyyeGBfO/OL5T4RXneytU9fTQXf3Urc+f50Nb8tFlTJ+mR3oo/gsYaWpxsL4d9CywbKKiOEj4M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747315212;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=TCd5wTbVXQm1/qDiCEzXOZKvySaWqAmfH5oNFsGkQLM=;
	b=c14VD8cjBb999JMp5VY5wIet/8z75JR/2F4BJ7UJezZuQh7RMJOPcC2WMhHfawcw
	UG4LU4HWwLsBlsVmYRUnt8ucATVYAm9QuamS6VVgUrQ1GmGhlfYmlB+Z8Ef0UA33oIX
	/551IEoglB00T7SzMBumd0UqC2Nkgei213EeUE94=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Christopher Clark <christopher.w.clark@gmail.com>
Subject: [RFCv2 37/38] x86/hyperlaunch: generalize domid assignment
Date: Thu, 15 May 2025 09:19:49 -0400
Message-Id: <20250515131951.5594-8-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250515131951.5594-1-dpsmith@apertussolutions.com>
References: <20250515131951.5594-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/common/domain-builder/fdt.c | 32 +++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder/fdt.c
index 1b3492571b15..414bbf5d9fb1 100644
--- a/xen/common/domain-builder/fdt.c
+++ b/xen/common/domain-builder/fdt.c
@@ -16,6 +16,21 @@
 
 #include "fdt.h"
 
+#define MAX_DOMID  DOMID_FIRST_RESERVED
+static __initdata DECLARE_BITMAP(domid_alloc, MAX_DOMID);
+
+static domid_t __init find_next_domid(void)
+{
+    unsigned long n = find_next_zero_bit(domid_alloc, MAX_DOMID, 1);
+
+    if ( n == MAX_DOMID )
+        return DOMID_INVALID;
+
+    set_bit(n, domid_alloc);
+
+    return (domid_t) n;
+}
+
 static int __init fdt_prop_as_u32(const struct fdt_property *prop,
                                   uint32_t *val)
 {
@@ -231,18 +246,17 @@ static int __init fdt_process_domain_node(
 
             if ( val >= DOMID_FIRST_RESERVED )
             {
-                printk(XENLOG_ERR "  invalid domain id for domain %s\n", name);
-                return -EINVAL;
-            }
-
-            for ( unsigned int i = 0; i < bi->nr_domains; i++ )
-            {
-                if ( bi->domains[i].domid == val )
+                if ( (val = find_next_domid()) == DOMID_INVALID )
                 {
-                    printk(XENLOG_ERR "  duplicate id for domain %s\n", name);
-                    return -EINVAL;
+                    printk("  unable to allocate domid for domain %s\n", name);
+                    return -EFAULT;
                 }
             }
+            else if ( test_and_set_bit(val, domid_alloc) )
+            {
+                printk(XENLOG_ERR "  duplicate id for domain %s\n", name);
+                return -EINVAL;
+            }
 
             bd->domid = val;
             printk(XENLOG_INFO "  domid: %d\n", bd->domid);
-- 
2.30.2


