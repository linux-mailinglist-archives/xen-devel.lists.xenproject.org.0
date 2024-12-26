Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB7A9FCC4D
	for <lists+xen-devel@lfdr.de>; Thu, 26 Dec 2024 18:11:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863362.1274800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQrOM-0004l9-Lj; Thu, 26 Dec 2024 17:11:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863362.1274800; Thu, 26 Dec 2024 17:11:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQrOM-0004if-Ip; Thu, 26 Dec 2024 17:11:22 +0000
Received: by outflank-mailman (input) for mailman id 863362;
 Thu, 26 Dec 2024 17:11:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vkhu=TT=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tQrEM-0005x0-35
 for xen-devel@lists.xenproject.org; Thu, 26 Dec 2024 17:01:02 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb622775-c3aa-11ef-a0da-8be0dac302b0;
 Thu, 26 Dec 2024 18:01:01 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1735232290582938.4677206553228;
 Thu, 26 Dec 2024 08:58:10 -0800 (PST)
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
X-Inumbo-ID: fb622775-c3aa-11ef-a0da-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1735232296; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fTx+RrBVql5Nk7YuBcEIige9Ew7ilaJgqad89L322VysMEZauUppeYqLmTSRtZ4zCd3j1CzQ62u82EFLQBWkXN6it0o86+d4lxZ+uzh8pjqkBO0+aVuMquMCcr9XMFUqM1kFjXc73r8A2mXHtQ62SIkn8moXvlTmQ7p0rTG3Wrs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1735232296; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ZIGHKNiDcj/HqTL/IBZMznrIHbY4YhPeFEesoRFQtNI=; 
	b=M0qUxiC1ouoi2PAeVimJd5aTTMRAX8BA2WkWIG5VtZSTyMjQxUDHl8a40gGap/KCRMKdPKckGd3cO5DnXSToslconFCgv/i8CWF1etC0KBFeiPRLFpoF9ERH4Oc/2f2LFg8T6Ol9rQ7CxLEPNggxCzOyjkRQhb7eXuESMcs1yMo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1735232296;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=ZIGHKNiDcj/HqTL/IBZMznrIHbY4YhPeFEesoRFQtNI=;
	b=dtZ2aAsqfLKFMwAS3FmW2ldAcmpPEHxEeOXqJ3RoFfT7Wg9E0AOzBidWuDvScR/h
	k4Jblh2ksmWmvaTJA2f1ho+tL/QuFtgFcADDU1JT9+e7Bu3n7hurTGxw3UK6I4Cxw/w
	wCttHrveFvzbUqybql8BX9WbCtrmEA5B1CoGsN3g=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 15/15] x86/hyperlaunch: add capabilities to boot domain
Date: Thu, 26 Dec 2024 11:57:40 -0500
Message-Id: <20241226165740.29812-16-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241226165740.29812-1-dpsmith@apertussolutions.com>
References: <20241226165740.29812-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Introduce the ability to assign capabilities to a domain via its definition in
device tree. The first capability enabled to select is the control domain
capability. The capability property is a bitfield in both the device tree and
`struct boot_domain`.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
Changes since v1:
- switch to nested else if
- switch from match_fdt to strncmp
- drop ternary for name selection
- coding style changes
---
 xen/arch/x86/domain-builder/core.c    |  1 +
 xen/arch/x86/domain-builder/fdt.c     | 12 ++++++++++++
 xen/arch/x86/include/asm/bootdomain.h |  4 ++++
 xen/arch/x86/setup.c                  |  6 +++++-
 4 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/domain-builder/core.c b/xen/arch/x86/domain-builder/core.c
index 91d1b7367e76..589496b6a3e1 100644
--- a/xen/arch/x86/domain-builder/core.c
+++ b/xen/arch/x86/domain-builder/core.c
@@ -96,6 +96,7 @@ void __init builder_init(struct boot_info *bi)
         i = first_boot_module_index(bi, BOOTMOD_UNKNOWN);
         bi->mods[i].type = BOOTMOD_KERNEL;
         bi->domains[0].kernel = &bi->mods[i];
+        bi->domains[0].capabilities |= BUILD_CAPS_CONTROL;
         bi->nr_domains = 1;
     }
 }
diff --git a/xen/arch/x86/domain-builder/fdt.c b/xen/arch/x86/domain-builder/fdt.c
index 70a793db199b..e90b230eeffe 100644
--- a/xen/arch/x86/domain-builder/fdt.c
+++ b/xen/arch/x86/domain-builder/fdt.c
@@ -158,6 +158,18 @@ static int __init process_domain_node(
             bd->max_vcpus = val;
             printk("  max vcpus: %d\n", bd->max_vcpus);
         }
+        else if ( strncmp(prop_name, "capabilities", name_len) == 0 )
+        {
+            if ( fdt_prop_as_u32(prop, &bd->capabilities) != 0 )
+            {
+                printk("  failed processing domain id for domain %s\n", name);
+                return -EINVAL;
+            }
+            printk("  caps: ");
+            if ( bd->capabilities & BUILD_CAPS_CONTROL )
+                printk("c");
+            printk("\n");
+        }
     }
 
     fdt_for_each_subnode(node, fdt, dom_node)
diff --git a/xen/arch/x86/include/asm/bootdomain.h b/xen/arch/x86/include/asm/bootdomain.h
index 1a15273043f5..67f43c13e905 100644
--- a/xen/arch/x86/include/asm/bootdomain.h
+++ b/xen/arch/x86/include/asm/bootdomain.h
@@ -15,6 +15,10 @@ struct boot_domain {
 
     domid_t domid;
 
+#define BUILD_CAPS_NONE          (0)
+#define BUILD_CAPS_CONTROL       (1 << 0)
+    uint32_t capabilities;
+
                                           /* On     | Off    */
 #define BUILD_MODE_PARAVIRT      (1 << 0) /* PV     | PVH/HVM */
 #define BUILD_MODE_ENABLE_DM     (1 << 1) /* HVM    | PVH     */
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index a87e122b5a61..0fb8572b7145 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1002,6 +1002,7 @@ static size_t __init domain_cmdline_size(
 static struct domain *__init create_dom0(struct boot_info *bi)
 {
     char *cmdline = NULL;
+    unsigned int create_flags = 0;
     struct xen_domctl_createdomain dom0_cfg = {
         .flags = IS_ENABLED(CONFIG_TBOOT) ? XEN_DOMCTL_CDF_s3_integrity : 0,
         .max_evtchn_port = -1,
@@ -1033,7 +1034,10 @@ static struct domain *__init create_dom0(struct boot_info *bi)
     if ( bd->domid == DOMID_INVALID )
         /* Create initial domain.  Not d0 for pvshim. */
         bd->domid = get_initial_domain_id();
-    d = domain_create(bd->domid, &dom0_cfg, pv_shim ? 0 : CDF_privileged);
+    if ( bd->capabilities & BUILD_CAPS_CONTROL )
+        create_flags |= CDF_privileged;
+    d = domain_create(bd->domid, &dom0_cfg,
+                      pv_shim ? 0 : create_flags);
     if ( IS_ERR(d) )
         panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
 
-- 
2.30.2


