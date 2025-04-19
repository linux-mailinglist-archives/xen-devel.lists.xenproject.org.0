Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D74DBA945C1
	for <lists+xen-devel@lfdr.de>; Sun, 20 Apr 2025 00:21:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.960252.1352336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GYu-0004TZ-Ul; Sat, 19 Apr 2025 22:21:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 960252.1352336; Sat, 19 Apr 2025 22:21:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GYu-0004SO-P9; Sat, 19 Apr 2025 22:21:24 +0000
Received: by outflank-mailman (input) for mailman id 960252;
 Sat, 19 Apr 2025 22:21:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nqik=XF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1u6GRT-0004yY-T6
 for xen-devel@lists.xenproject.org; Sat, 19 Apr 2025 22:13:43 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8cf644d5-1d6b-11f0-9eb0-5ba50f476ded;
 Sun, 20 Apr 2025 00:13:42 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1745100563151665.1808490006621;
 Sat, 19 Apr 2025 15:09:23 -0700 (PDT)
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
X-Inumbo-ID: 8cf644d5-1d6b-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; t=1745100571; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=anWjUrDEW6/RaRHcc8BAKESuY1HNFS30V8ANqIDZoiceXVZn27xsv2RbJGuRHjZ0IaHMwVcRu+7zVHlohroibwI22bER1d9BKQ7UmDclWChyY9EIMIqYzJx3bcF8Ub6dIFllkJMVDwY9r8kMt1rizFTKJ9Xgl0TtBN96UMxFTEQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745100571; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xTTdPfDolfNjAS0Qvmz0FxzFVp9V69k5pb2zgYetYhg=; 
	b=PI1y5fbyqhMuuMmwVBO8UJrEUHmh4QVtiKXtKZhnR+yLI2gVTRsAGHtg/UaQ9XUMqwPw+NE/Oq77sRiKnZl4hcuH0BpDY1Cd57xEZCsZ0WEEzgnLybG0nUozddfdJsiKEVuv6O0uej/qnY/vNbEo3qWTOpxVUwB6SnQNoHiVtes=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745100571;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=xTTdPfDolfNjAS0Qvmz0FxzFVp9V69k5pb2zgYetYhg=;
	b=a0ooV0zfRFp3A8MxgK6mqydxzeHTgOL5Q1RQyvzbHmvHexjOjiQzhaq1hgEwkBoq
	lXkTx2EcQsmi6a2xkWAmCTooNLxvsARFZ1rA+kwhdlmH2BOk76lJMGc8OmUH+3Lz5Nb
	194UsoKNenheT+hrBN0Fc6rWTHN0n8zgjf7uNGgo=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC 30/38] x86/hyperlaunch: allocate xenstore for domu
Date: Sat, 19 Apr 2025 18:08:12 -0400
Message-Id: <20250419220820.4234-31-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250419220820.4234-1-dpsmith@apertussolutions.com>
References: <20250419220820.4234-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

During domU construction, a page of memory and an event channel must be setup
for xenstore connection. In this commit, a page from the special page region of
domU is setup as the xenstore page along with an event channel. The page
address and event channel are published in the HVM parameters, so the domain
can be announced to Xenstore.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/domain-builder/domain.c   | 38 ++++++++++++++++++++++++--
 xen/arch/x86/hvm/dom_build.c           | 32 ++++++++++++++++++++++
 xen/arch/x86/include/asm/boot-domain.h |  2 +-
 3 files changed, 69 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/domain-builder/domain.c b/xen/arch/x86/domain-builder/domain.c
index 7ce069a57c5d..b413a87cc9c9 100644
--- a/xen/arch/x86/domain-builder/domain.c
+++ b/xen/arch/x86/domain-builder/domain.c
@@ -240,6 +240,38 @@ static int __init alloc_console_evtchn(
     return 0;
 }
 
+static int __init alloc_store_evtchn(
+    const struct boot_info *bi, struct boot_domain *bd)
+{
+    evtchn_alloc_unbound_t evtchn_req;
+    const struct boot_domain *xsdom;
+    int idx, rc;
+
+    idx = first_boot_domain_index(bi, BUILD_CAPS_XENSTORE);
+    if ( idx < 0 )
+    {
+        printk(XENLOG_WARNING "No backing xenstore domain for %pdv\n",
+               bd->d);
+        return -EINVAL;
+    }
+
+    if ( bi->domains[idx].d )
+        xsdom = &bi->domains[idx];
+    else
+    {
+        printk(XENLOG_WARNING "Xenstore domain for %pd console not constructed\n",
+               bd->d);
+        return -EINVAL;
+    }
+
+    if ( (rc = alloc_dom_evtchn(bd, xsdom, &evtchn_req)) < 0 )
+        return rc;
+
+    bd->store.evtchn = evtchn_req.port;
+
+    return 0;
+}
+
 static size_t __init domain_cmdline_size(
     struct boot_info *bi, struct boot_domain *bd)
 {
@@ -362,8 +394,10 @@ struct domain *__init arch_create_dom(
         bd->cmdline = cmdline;
     }
 
-   if ( !(bd->capabilities & BUILD_CAPS_HARDWARE) )
-       alloc_console_evtchn(bi, bd);
+    if ( !(bd->capabilities & BUILD_CAPS_XENSTORE) )
+        alloc_store_evtchn(bi, bd);
+    if ( !(bd->capabilities & BUILD_CAPS_HARDWARE) )
+        alloc_console_evtchn(bi, bd);
 
     if ( construct_dom0(bd) != 0 )
         panic("Could not construct domain 0\n");
diff --git a/xen/arch/x86/hvm/dom_build.c b/xen/arch/x86/hvm/dom_build.c
index 934ae138e58f..2798542e5483 100644
--- a/xen/arch/x86/hvm/dom_build.c
+++ b/xen/arch/x86/hvm/dom_build.c
@@ -930,6 +930,35 @@ static int __init alloc_console_page(struct boot_domain *bd)
     return 0;
 }
 
+static int __init alloc_xenstore_page(struct boot_domain *bd)
+{
+    paddr_t xs_addr = special_pfn(SPECIALPAGE_XENSTORE) << PAGE_SHIFT;
+    uint32_t fields[7] = { 0, 0, 0, 0, 0, 1, 0};
+
+    if ( !port_is_valid(bd->d, bd->store.evtchn) )
+    {
+        printk("No event channel available for %pd xenstore\n", bd->d);
+        return -EINVAL;
+    }
+
+    /*
+     * Set connection field to XENSTORE_RECONNECT, where the
+     * xenstore_domain_interface fields are located after the 2 1024 buffers
+     */
+    if ( hvm_copy_to_guest_phys(xs_addr + 2048, fields, sizeof(fields),
+                                bd->d->vcpu[0]) )
+    {
+        printk("Unable to set xenstore connection state\n");
+        return -EFAULT;
+    }
+
+    bd->store.gfn = gfn_x(gaddr_to_gfn(xs_addr));
+    bd->d->arch.hvm.params[HVM_PARAM_STORE_PFN] = bd->store.gfn;
+    bd->d->arch.hvm.params[HVM_PARAM_STORE_EVTCHN] = bd->store.evtchn;
+
+    return 0;
+}
+
 int __init dom_construct_pvh(struct boot_domain *bd)
 {
     paddr_t entry, start_info;
@@ -1009,6 +1038,9 @@ int __init dom_construct_pvh(struct boot_domain *bd)
     if ( !is_hardware_domain(bd->d) )
         alloc_console_page(bd);
 
+    if ( !is_xenstore_domain(bd->d) )
+        alloc_xenstore_page(bd);
+
     if ( opt_dom0_verbose )
     {
         printk("Dom%u memory map:\n", bd->domid);
diff --git a/xen/arch/x86/include/asm/boot-domain.h b/xen/arch/x86/include/asm/boot-domain.h
index cb6e1fab23ba..df2bfa0c94fa 100644
--- a/xen/arch/x86/include/asm/boot-domain.h
+++ b/xen/arch/x86/include/asm/boot-domain.h
@@ -41,7 +41,7 @@ struct boot_domain {
     struct {
         xen_pfn_t gfn;
         evtchn_port_t evtchn;
-    } console;
+    } console, store;
 };
 
 #endif
-- 
2.30.2


