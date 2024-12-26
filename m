Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B53D9FCC0E
	for <lists+xen-devel@lfdr.de>; Thu, 26 Dec 2024 18:00:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863282.1274724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQrDq-0006lo-QF; Thu, 26 Dec 2024 17:00:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863282.1274724; Thu, 26 Dec 2024 17:00:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQrDq-0006hh-NA; Thu, 26 Dec 2024 17:00:30 +0000
Received: by outflank-mailman (input) for mailman id 863282;
 Thu, 26 Dec 2024 17:00:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vkhu=TT=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tQrDo-0004jO-NU
 for xen-devel@lists.xenproject.org; Thu, 26 Dec 2024 17:00:28 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e6b3e858-c3aa-11ef-99a3-01e77a169b0f;
 Thu, 26 Dec 2024 18:00:26 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1735232286454203.59311331231754;
 Thu, 26 Dec 2024 08:58:06 -0800 (PST)
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
X-Inumbo-ID: e6b3e858-c3aa-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1735232291; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=P90n+tIGktjv3xZShWRRrejWe/HJ6Rq81+5MAzWjf9QaxZjbsE5AKH84oZCodLG8s8iQwi0iN3G/NV47C8QycNZslrDj8VWHbp8TcyHp3ucqO+1xoar4N+glIKcvFus71uKR+DGovv0z2x31FOXpNA7XcTgMseX7v36cW/Xx51s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1735232291; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ikPFYKTKplN0c3xIGklLy3D15rucauyk9qCtpxMJhbU=; 
	b=hszDpf2JJ7VQsMetB8M3LK4UkCP7rsdCzPhMvW9lH4nmDvXQ8rGVyfwWSBEILOdnDvfOTVlby897VvbkEZuDBjEm2jo9axjKqMSc8WpQ+IMsn2C7Bnjb3cjrH38ehsTvQBIWj/WxIEXaI+ne5BTYpGI/QfjW4fmK3nweO9ekMts=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1735232291;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=ikPFYKTKplN0c3xIGklLy3D15rucauyk9qCtpxMJhbU=;
	b=WcLEIFqT/hmgAmgcDIFeNGS7LXsVWtVTuISeySL3HCrzavpdsRatHARQN56uW2Xl
	lMHIEp1in7R+G+R1Yb57fXRaqh+xsSJE63MI3oBalPkkxOEDo5LLKUPtCKgyVwd+RHe
	NPQYWLCXGDUazPgahpK1aoTp21XbqiKcneG61qUo=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 12/15] x86/hyperlaunch: specify dom0 mode with device tree
Date: Thu, 26 Dec 2024 11:57:37 -0500
Message-Id: <20241226165740.29812-13-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241226165740.29812-1-dpsmith@apertussolutions.com>
References: <20241226165740.29812-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Enable selecting the mode in which the domain will be built and ran. This
includes:

- whether it will be either a 32/64 bit domain
- if it will be run as a PV or HVM domain
- and if it will require a device model (not applicable for dom0)

In the device tree, this will be represented as a bit map that will be carried
through into struct boot_domain.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
Changes since v1:
- switched to nested else if
- dropped ternary op for reporting domain name
- switch to strncmp for the check for mode prop
- drop BUILD_MODE_LONG until PV construction series
---
 xen/arch/x86/domain-builder/fdt.c     | 19 +++++++++++++++++++
 xen/arch/x86/include/asm/bootdomain.h |  5 +++++
 xen/arch/x86/setup.c                  |  3 ++-
 3 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/domain-builder/fdt.c b/xen/arch/x86/domain-builder/fdt.c
index efce0927c645..db584ba78e92 100644
--- a/xen/arch/x86/domain-builder/fdt.c
+++ b/xen/arch/x86/domain-builder/fdt.c
@@ -94,6 +94,25 @@ static int __init process_domain_node(
             bd->domid = (domid_t)val;
             printk("  domid: %d\n", bd->domid);
         }
+        else if ( strncmp(prop_name, "mode", name_len) == 0 )
+        {
+            if ( fdt_prop_as_u32(prop, &bd->mode) != 0 )
+            {
+                printk("  failed processing mode for domain %s\n", name);
+                return -EINVAL;
+            }
+
+            printk("  mode: ");
+            if ( !(bd->mode & BUILD_MODE_PARAVIRT) )
+            {
+                if ( bd->mode & BUILD_MODE_ENABLE_DM )
+                    printk("HVM\n");
+                else
+                    printk("PVH\n");
+            }
+            else
+                printk("PV\n");
+        }
     }
 
     fdt_for_each_subnode(node, fdt, dom_node)
diff --git a/xen/arch/x86/include/asm/bootdomain.h b/xen/arch/x86/include/asm/bootdomain.h
index 101a0c643d74..5918aaf6bb63 100644
--- a/xen/arch/x86/include/asm/bootdomain.h
+++ b/xen/arch/x86/include/asm/bootdomain.h
@@ -15,6 +15,11 @@ struct boot_domain {
 
     domid_t domid;
 
+                                          /* On     | Off    */
+#define BUILD_MODE_PARAVIRT      (1 << 0) /* PV     | PVH/HVM */
+#define BUILD_MODE_ENABLE_DM     (1 << 1) /* HVM    | PVH     */
+    uint32_t mode;
+
     struct boot_module *kernel;
     struct boot_module *ramdisk;
 
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 027b224151d1..a87e122b5a61 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1016,7 +1016,8 @@ static struct domain *__init create_dom0(struct boot_info *bi)
     struct boot_domain *bd = &bi->domains[0];
     struct domain *d;
 
-    if ( opt_dom0_pvh )
+    if ( opt_dom0_pvh ||
+         (bi->hyperlaunch_enabled && !(bd->mode & BUILD_MODE_PARAVIRT)) )
     {
         dom0_cfg.flags |= (XEN_DOMCTL_CDF_hvm |
                            ((hvm_hap_supported() && !opt_dom0_shadow) ?
-- 
2.30.2


