Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96006A945B9
	for <lists+xen-devel@lfdr.de>; Sun, 20 Apr 2025 00:20:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.960172.1352256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GYM-0000NB-Qp; Sat, 19 Apr 2025 22:20:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 960172.1352256; Sat, 19 Apr 2025 22:20:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GYM-0000K6-MY; Sat, 19 Apr 2025 22:20:50 +0000
Received: by outflank-mailman (input) for mailman id 960172;
 Sat, 19 Apr 2025 22:20:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nqik=XF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1u6GQp-0004yY-8Y
 for xen-devel@lists.xenproject.org; Sat, 19 Apr 2025 22:13:03 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74ecc5bd-1d6b-11f0-9eb0-5ba50f476ded;
 Sun, 20 Apr 2025 00:13:02 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1745100553667313.49112890011975;
 Sat, 19 Apr 2025 15:09:13 -0700 (PDT)
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
X-Inumbo-ID: 74ecc5bd-1d6b-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; t=1745100556; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QzgX0Y8mWmsz+AsIiWp0nfAjtW0zaD5vB/KouKf3Hf/K464Etr0B32nW8ChHLUIXQ+gkP7ESDKwHvCoZ4O4QYeFQFLiKRdsXaS2sZQVrEE1Rc6nS5dsdlYzeP35AuPHLK/+A2tB4ejwEyjck6P6gkwdogo5qxn1crJLU2Tq7Pe8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745100556; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=OMaTtguVsoafCK0lkNIJcl8+/3XaPHmXDwj/NHsEKbc=; 
	b=Hws8dTO1HmPHgoq6VRIpLLm1V3Swu8XS2TR3Zvv8RSHVkoocqdM1HXimczkcegYwG1F5yCkeDgiJyt4P1QbltD2H57Du44+wWBYRHj2ngi7kjeAH9hNB0mdbw5XsSkLYEnBRjTnR8rGouh52lpyh8mw5InyG/QnG0k5Qz6qJjSI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745100556;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=OMaTtguVsoafCK0lkNIJcl8+/3XaPHmXDwj/NHsEKbc=;
	b=N+ctCWMWQA/vKEzT1Kw1DAvVeChBN6YzmEzDbWw7TI8jdlUFpCFBnu77ea2liOOY
	5B2n+bDZQ5UJbmUqKXNZxVavzb9OczjkaH5Vd4YSSRTEWMTSLFLWQQDEdRBFQMpYro+
	Tu+stkeUTiHvlL+uz984k83XwkvfgLRwltcwpW38=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC 29/38] x86/hyperlaunch: allocate console for domu
Date: Sat, 19 Apr 2025 18:08:11 -0400
Message-Id: <20250419220820.4234-30-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250419220820.4234-1-dpsmith@apertussolutions.com>
References: <20250419220820.4234-1-dpsmith@apertussolutions.com>
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
 xen/arch/x86/domain-builder/domain.c   | 56 ++++++++++++++++++++++++++
 xen/arch/x86/hvm/dom_build.c           | 34 ++++++++++++++++
 xen/arch/x86/include/asm/boot-domain.h |  7 ++++
 3 files changed, 97 insertions(+)

diff --git a/xen/arch/x86/domain-builder/domain.c b/xen/arch/x86/domain-builder/domain.c
index c1b2e011aaa0..7ce069a57c5d 100644
--- a/xen/arch/x86/domain-builder/domain.c
+++ b/xen/arch/x86/domain-builder/domain.c
@@ -6,6 +6,7 @@
 #include <xen/cpumask.h>
 #include <xen/domain.h>
 #include <xen/err.h>
+#include <xen/event.h>
 #include <xen/grant_table.h>
 #include <xen/init.h>
 #include <xen/libelf.h>
@@ -187,6 +188,58 @@ void __init alloc_dom_vcpus(struct domain *d)
     domain_update_node_affinity(d);
 }
 
+static int __init alloc_dom_evtchn(
+    const struct boot_domain *d, const struct boot_domain *r,
+    evtchn_alloc_unbound_t *ec)
+{
+    int rc;
+
+    ec->dom = d->domid;
+    ec->remote_dom = r->domid;
+
+    rc = evtchn_alloc_unbound(ec, 0);
+    if ( rc )
+    {
+        printk(XENLOG_WARNING "Failed allocating event channel for %pd\n",
+               d->d);
+        return rc;
+    }
+
+    return 0;
+}
+
+static int __init alloc_console_evtchn(
+    const struct boot_info *bi, struct boot_domain *bd)
+{
+    evtchn_alloc_unbound_t evtchn_req;
+    const struct boot_domain *hwdom;
+    int idx, rc;
+
+    idx = first_boot_domain_index(bi, BUILD_CAPS_HARDWARE);
+    if ( idx < 0 )
+    {
+        printk(XENLOG_WARNING "No backing hardware domain for %pd console\n",
+               bd->d);
+        return -EINVAL;
+    }
+
+    if ( bi->domains[idx].d )
+        hwdom = &bi->domains[idx];
+    else
+    {
+        printk(XENLOG_WARNING "Hardware domain for %pd console not constructed\n",
+               bd->d);
+        return -EINVAL;
+    }
+
+    if ( (rc = alloc_dom_evtchn(bd, hwdom, &evtchn_req)) < 0 )
+        return rc;
+
+    bd->console.evtchn = evtchn_req.port;
+
+    return 0;
+}
+
 static size_t __init domain_cmdline_size(
     struct boot_info *bi, struct boot_domain *bd)
 {
@@ -309,6 +362,9 @@ struct domain *__init arch_create_dom(
         bd->cmdline = cmdline;
     }
 
+   if ( !(bd->capabilities & BUILD_CAPS_HARDWARE) )
+       alloc_console_evtchn(bi, bd);
+
     if ( construct_dom0(bd) != 0 )
         panic("Could not construct domain 0\n");
 
diff --git a/xen/arch/x86/hvm/dom_build.c b/xen/arch/x86/hvm/dom_build.c
index c482d5c2d974..934ae138e58f 100644
--- a/xen/arch/x86/hvm/dom_build.c
+++ b/xen/arch/x86/hvm/dom_build.c
@@ -9,6 +9,7 @@
  */
 
 #include <xen/acpi.h>
+#include <xen/event.h>
 #include <xen/iommu.h>
 #include <xen/init.h>
 #include <xen/softirq.h>
@@ -19,6 +20,7 @@
 #include <public/arch-x86/hvm/start_info.h>
 #include <public/hvm/e820.h>
 #include <public/hvm/hvm_vcpu.h>
+#include <public/hvm/params.h>
 
 #include <asm/bootinfo.h>
 #include <asm/bzimage.h>
@@ -899,6 +901,35 @@ static int __init pvh_load_kernel(
     return 0;
 }
 
+static int __init alloc_console_page(struct boot_domain *bd)
+{
+    paddr_t con_addr = special_pfn(SPECIALPAGE_CONSOLE) << PAGE_SHIFT;
+    uint32_t fields[4] = { 0 };
+
+    if ( !port_is_valid(bd->d, bd->console.evtchn) )
+    {
+        printk("No event channel available for %pd console\n", bd->d);
+        return -EINVAL;
+    }
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
+    bd->console.gfn = PFN_DOWN(con_addr);
+    bd->d->arch.hvm.params[HVM_PARAM_CONSOLE_PFN] = bd->console.gfn;
+    bd->d->arch.hvm.params[HVM_PARAM_CONSOLE_EVTCHN] = bd->console.evtchn;
+
+    return 0;
+}
+
 int __init dom_construct_pvh(struct boot_domain *bd)
 {
     paddr_t entry, start_info;
@@ -975,6 +1006,9 @@ int __init dom_construct_pvh(struct boot_domain *bd)
         return rc;
     }
 
+    if ( !is_hardware_domain(bd->d) )
+        alloc_console_page(bd);
+
     if ( opt_dom0_verbose )
     {
         printk("Dom%u memory map:\n", bd->domid);
diff --git a/xen/arch/x86/include/asm/boot-domain.h b/xen/arch/x86/include/asm/boot-domain.h
index 32f1f8fbc4e8..cb6e1fab23ba 100644
--- a/xen/arch/x86/include/asm/boot-domain.h
+++ b/xen/arch/x86/include/asm/boot-domain.h
@@ -5,6 +5,9 @@
  * Copyright (c) 2024 Christopher Clark <christopher.w.clark@gmail.com>
  */
 
+#include <public/xen.h>
+#include <public/event_channel.h>
+
 #ifndef __XEN_X86_BOOTDOMAIN_H__
 #define __XEN_X86_BOOTDOMAIN_H__
 
@@ -35,6 +38,10 @@ struct boot_domain {
     const char *cmdline;
 
     struct domain *d;
+    struct {
+        xen_pfn_t gfn;
+        evtchn_port_t evtchn;
+    } console;
 };
 
 #endif
-- 
2.30.2


