Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72068AB880B
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 15:33:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985499.1371460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYi6-00008W-E3; Thu, 15 May 2025 13:33:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985499.1371460; Thu, 15 May 2025 13:33:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYi6-0008WV-Au; Thu, 15 May 2025 13:33:18 +0000
Received: by outflank-mailman (input) for mailman id 985499;
 Thu, 15 May 2025 13:33:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WRi0=X7=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1uFYXn-0006hT-Mc
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 13:22:39 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aac4ca46-318f-11f0-9ffb-bf95429c2676;
 Thu, 15 May 2025 15:22:37 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 17473151748641009.1612467793848;
 Thu, 15 May 2025 06:19:34 -0700 (PDT)
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
X-Inumbo-ID: aac4ca46-318f-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; t=1747315178; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RGp/50pqPKu5D8LmRJqPf2A7s3rFWp7UgP0ImR6+IvRugIYxm+NPvatduNRVxqukKK29JdobvQ8L8AoDhKiDLVHW2oSXgAFhh8wrXKAqvw/Tg1+BBmV3FJie4tujAykq67KYPyGJ6wqD1QLjXe0CftILHgNq6TpzoEmMf4D5xdE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747315178; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6T1Z5XGS9ysURjGTHl7V7vt25/W8+XJnWeYBM57YXlo=; 
	b=g3OuP1e/3kiufNc6opq1dJnYQcLgkhbRIPeqnZCY0gmoVAPN/tmTxitz84B1YHwwnjEx/cQkLT1658jC5VqbhfIDotqXlXLqbKMpJppL0EScpW0NfNgM0M2GXdVBUutQd4drGrfUMKY+16718xMV7D8vwfwcwAeCIDcosrpsnhg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747315178;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=6T1Z5XGS9ysURjGTHl7V7vt25/W8+XJnWeYBM57YXlo=;
	b=oRn9wqcT5C3pNHULn2uIaxjHgKrgXlDXUo9qLJEo1IzYvprvplwjrfVtBHTTXPYs
	UdqZyMvvyhIrD+RLjK0n7TZBj/eTTQW5uuW2+ggbuU1AOHSnG18UE5n5OaTz72PONNF
	gW7hor+9z9KdQFR1CPoPjIZRK8f2PqLJpKGdbYmc=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFCv2 29/38] x86/hyperlaunch: allocate console for domu
Date: Thu, 15 May 2025 09:19:12 -0400
Message-Id: <20250515131912.5019-10-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250515131912.5019-1-dpsmith@apertussolutions.com>
References: <20250515131912.5019-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

During domU construction, a page of memory and an event channel must be setup
for the console connection. In this commit, a page from the special page region
of domU is setup as the console page along with an event channel. The page
address and event channel are published in the HVM parameters, so they may be
published in Xenstore once it is online.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

---

Changes in RFCv2:
- rewrote inline with xenstore changes for event chan
---
 xen/arch/x86/domain-builder/domain.c   | 24 +++++++++++++++++++++++-
 xen/arch/x86/hvm/dom_build.c           | 24 ++++++++++++++++++++++++
 xen/arch/x86/include/asm/boot-domain.h |  2 +-
 3 files changed, 48 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/domain-builder/domain.c b/xen/arch/x86/domain-builder/domain.c
index de0ee0fcd62c..673fc5b16ed3 100644
--- a/xen/arch/x86/domain-builder/domain.c
+++ b/xen/arch/x86/domain-builder/domain.c
@@ -355,7 +355,7 @@ struct domain *__init arch_create_dom(
 int __init arch_builder_finalize(struct boot_info *bi)
 {
     unsigned int i;
-    struct boot_domain *xs_bd = NULL;
+    struct boot_domain *xs_bd = NULL, *hw_bd = NULL;
 
     i = first_boot_domain_index(bi, DOMAIN_CAPS_XENSTORE);
     if ( i > MAX_NR_BOOTDOMS )
@@ -363,6 +363,12 @@ int __init arch_builder_finalize(struct boot_info *bi)
     else
         xs_bd = &bi->domains[i];
 
+    i = first_boot_domain_index(bi, DOMAIN_CAPS_HARDWARE);
+    if ( i > MAX_NR_BOOTDOMS )
+        printk(XENLOG_WARNING "No xenstore domain configured\n");
+    else
+        hw_bd = &bi->domains[i];
+
     for ( i = 0; i < bi->nr_domains; i++ )
     {
         struct boot_domain *bd = &bi->domains[i];
@@ -382,6 +388,22 @@ int __init arch_builder_finalize(struct boot_info *bi)
                 params[HVM_PARAM_STORE_EVTCHN] = xs_evtchn;
             }
         }
+
+        if ( hw_bd && hw_bd->d && (bd != hw_bd) && bd->cons_page )
+        {
+            evtchn_port_t ec = 0;
+
+            if ( alloc_dom_evtchn(bd, hw_bd, &ec) < 0 )
+                continue;
+
+            /* Is HVM/PVH */
+            if ( !(bd->mode & BUILD_MODE_PARAVIRT) )
+            {
+                uint64_t *params = bd->d->arch.hvm.params;
+                params[HVM_PARAM_CONSOLE_PFN] = bd->cons_page;
+                params[HVM_PARAM_CONSOLE_EVTCHN] = ec;
+            }
+        }
     }
 
     /* Free temporary buffers. */
diff --git a/xen/arch/x86/hvm/dom_build.c b/xen/arch/x86/hvm/dom_build.c
index aec356cb2e46..3eab97b5288b 100644
--- a/xen/arch/x86/hvm/dom_build.c
+++ b/xen/arch/x86/hvm/dom_build.c
@@ -919,6 +919,27 @@ static int __init alloc_xenstore_page(struct boot_domain *bd)
     return 0;
 }
 
+static int __init alloc_console_page(struct boot_domain *bd)
+{
+    paddr_t con_addr = special_pfn(SPECIALPAGE_CONSOLE) << PAGE_SHIFT;
+    uint32_t fields[4] = { 0 };
+
+    /*
+     * Clear the xencons_interface fields that are located after a 1024 rx and
+     * a 2048 tx buffer, 3072 bytes.
+     */
+    if ( hvm_copy_to_guest_phys(con_addr + 3072, fields, sizeof(fields),
+                                bd->d->vcpu[0]) )
+    {
+        printk("Unable to set xenstore connection state\n");
+        return -EFAULT;
+    }
+
+    bd->cons_page = PFN_DOWN(con_addr);
+
+    return 0;
+}
+
 int __init dom_construct_pvh(struct boot_domain *bd)
 {
     paddr_t entry, start_info;
@@ -998,6 +1019,9 @@ int __init dom_construct_pvh(struct boot_domain *bd)
     if ( !is_xenstore_domain(bd->d) )
         alloc_xenstore_page(bd);
 
+    if ( !is_hardware_domain(bd->d) )
+        alloc_console_page(bd);
+
     if ( opt_dom0_verbose )
     {
         printk("Dom%u memory map:\n", bd->domid);
diff --git a/xen/arch/x86/include/asm/boot-domain.h b/xen/arch/x86/include/asm/boot-domain.h
index a527342768de..66f3a71fd597 100644
--- a/xen/arch/x86/include/asm/boot-domain.h
+++ b/xen/arch/x86/include/asm/boot-domain.h
@@ -35,7 +35,7 @@ struct boot_domain {
 
     struct domain *d;
 
-    xen_pfn_t xs_page;
+    xen_pfn_t xs_page, cons_page;
 };
 
 static inline bool __init has_dom0_caps(const struct boot_domain *bd)
-- 
2.30.2


