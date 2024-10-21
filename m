Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 514339A5853
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 02:56:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822961.1236934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gio-0000Xu-Kb; Mon, 21 Oct 2024 00:56:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822961.1236934; Mon, 21 Oct 2024 00:56:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gio-0000Vx-HY; Mon, 21 Oct 2024 00:56:34 +0000
Received: by outflank-mailman (input) for mailman id 822961;
 Mon, 21 Oct 2024 00:56:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q0x4=RR=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t2gc8-0003Iq-8g
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 00:49:40 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58ae11b6-8f46-11ef-99a3-01e77a169b0f;
 Mon, 21 Oct 2024 02:49:38 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729471612942225.76711816814077;
 Sun, 20 Oct 2024 17:46:52 -0700 (PDT)
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
X-Inumbo-ID: 58ae11b6-8f46-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1729471615; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cpzfKsLPJDHZ+wGCTOoC4bv0ZMt6IHACr0seNBS4v9uf4XTP6KX6QHm61USy5AeXPoIFV9Y6J+Wmt5DjVV3h+HM1gzIUy0c1gLdnbG81p7hHfT+ndnmWODVJRWCmFnMai9kh0DHq7lETG0j5kQWYDPHIUIChVfPmrVOJasdTgfQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729471615; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ebv6FBQmIywtxA6+m9LZfpSXV7xXQCPLvSbFsF4UzmI=; 
	b=VhWSYOZNCvOHiJi9zujPVBL2n676Dp1remqwkSmdT+2zCOmqZPyLnDEqqI+jnV9pxeXhoUjsIdtToneRN8WQs4Fc9OrAoOcs8t5FWk0V0pF46gJPhEOivECy8RxNPwIDvdZ2Vr/ijuzXCgOuac9VYNYB8Ugo6RIEgJprk1RIJzw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729471615;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=ebv6FBQmIywtxA6+m9LZfpSXV7xXQCPLvSbFsF4UzmI=;
	b=KNBDWPXWwZLAphtk14ZshhKlW6khKiP8V1bdBALppv0vUNtNe5etp8JwGRJ9aXYN
	jO0CKtH355qst6GQJhbCU0Az8Q8Ds2X4i0RMqKxH6Ds0b4qGxcBFc7sIavUueTJN2ZA
	Oeyt/WjBrJQ3MyFxmCcI6BQ2oIkwJ/5F9OLHliJ8=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v7 25/38] x86/boot: convert dom0_construct_pvh to struct boot_module
Date: Sun, 20 Oct 2024 20:46:00 -0400
Message-Id: <20241021004613.18793-26-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241021004613.18793-1-dpsmith@apertussolutions.com>
References: <20241021004613.18793-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This changes both the kernel and ramdisk parameters over to struct
boot_module.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
Changes since v6:
- removed unnecessary indentation changes
---
 xen/arch/x86/dom0_build.c             | 3 +--
 xen/arch/x86/hvm/dom0_build.c         | 9 ++++-----
 xen/arch/x86/include/asm/dom0_build.h | 5 ++---
 3 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 1d05ee53a6d8..71b2e3afc1a1 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -610,8 +610,7 @@ int __init construct_dom0(struct domain *d, const struct boot_module *image,
     process_pending_softirqs();
 
     if ( is_hvm_domain(d) )
-        rc = dom0_construct_pvh(d, image->mod, image->headroom, initrd->mod,
-                                cmdline);
+        rc = dom0_construct_pvh(d, image, initrd, cmdline);
     else if ( is_pv_domain(d) )
         rc = dom0_construct_pv(d, image, initrd, cmdline);
     else
diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 3dd913bdb029..0fe63f040936 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -1300,9 +1300,8 @@ static void __hwdom_init pvh_setup_mmcfg(struct domain *d)
     }
 }
 
-int __init dom0_construct_pvh(struct domain *d, const module_t *image,
-                              unsigned long image_headroom,
-                              module_t *initrd,
+int __init dom0_construct_pvh(struct domain *d, const struct boot_module *image,
+                              struct boot_module *initrd,
                               const char *cmdline)
 {
     paddr_t entry, start_info;
@@ -1347,8 +1346,8 @@ int __init dom0_construct_pvh(struct domain *d, const module_t *image,
         return rc;
     }
 
-    rc = pvh_load_kernel(d, image, image_headroom, initrd, bootstrap_map(image),
-                         cmdline, &entry, &start_info);
+    rc = pvh_load_kernel(d, image->mod, image->headroom, initrd->mod,
+                         bootstrap_map_bm(image), cmdline, &entry, &start_info);
     if ( rc )
     {
         printk("Failed to load Dom0 kernel\n");
diff --git a/xen/arch/x86/include/asm/dom0_build.h b/xen/arch/x86/include/asm/dom0_build.h
index 3ddd22fad2ba..5d0c4fd2639a 100644
--- a/xen/arch/x86/include/asm/dom0_build.h
+++ b/xen/arch/x86/include/asm/dom0_build.h
@@ -17,9 +17,8 @@ int dom0_construct_pv(struct domain *d, const struct boot_module *image,
                       struct boot_module *initrd,
                       const char *cmdline);
 
-int dom0_construct_pvh(struct domain *d, const module_t *image,
-                       unsigned long image_headroom,
-                       module_t *initrd,
+int dom0_construct_pvh(struct domain *d, const struct boot_module *image,
+                       struct boot_module *initrd,
                        const char *cmdline);
 
 unsigned long dom0_paging_pages(const struct domain *d,
-- 
2.30.2


