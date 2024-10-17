Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDB39A2ACF
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 19:23:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821098.1234945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1UDN-0003ni-Fb; Thu, 17 Oct 2024 17:23:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821098.1234945; Thu, 17 Oct 2024 17:23:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1UDN-0003m6-CC; Thu, 17 Oct 2024 17:23:09 +0000
Received: by outflank-mailman (input) for mailman id 821098;
 Thu, 17 Oct 2024 17:23:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KqF2=RN=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t1U0L-0008TH-Ha
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 17:09:41 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97e63093-8caa-11ef-a0be-8be0dac302b0;
 Thu, 17 Oct 2024 19:09:40 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729184670345139.97769028146377;
 Thu, 17 Oct 2024 10:04:30 -0700 (PDT)
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
X-Inumbo-ID: 97e63093-8caa-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1729184675; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=h8JXQBZOZrM2p6qZgH3hMcCxqAAhiixQy6xbyCWesNaNXQN80/EoWjREk/VI4hDsVigYxkD2cQ8AWqduewxCD5jRc9TkAdrcKSEashepCRAb/m0Ym8UNCKuq0qL9f8Adqf//U+mfFAaCanF/YULp/tRvrQhhC14nOL69QDayGJE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729184675; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=q6fEPJY/wmWNpsEBUPTBtfhYBFq0uC8xsS/EzPvmcH0=; 
	b=MFL9pWy5djDH5+3K4yX5AHL7Q7OgPzSp/eaJU1VyVEbpNOY4B/4AY8Um7E1ThcNAkIDYWElCNv20YHe5BHMbXH4xccMFbfayUVtPMXBDdGjuNX5yVMei+qNLYwbSFl4DS95C/xcMqt1tUn/VLaLhP6zPQpILQh8remgPbrH9COc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729184675;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=q6fEPJY/wmWNpsEBUPTBtfhYBFq0uC8xsS/EzPvmcH0=;
	b=mm2pa+tS7CPFYPUsuJOT7JtnoBisxyxfn+6/rrXOOFhjav1oHkM9jdlazrPhrwVU
	l3NR4r2XV5Erynnui2pZUWfWUXUjx1e3Dya2JJHWqw5R9w3uj9YWEO8MpHdy1CJgAmb
	kliwcbxi327WlCD1HjcWBwygDmSDfjTURYVwAKjc=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 44/44] x86/boot: convert dom0_construct_pvh to struct boot_domain
Date: Thu, 17 Oct 2024 13:03:24 -0400
Message-Id: <20241017170325.3842-45-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241017170325.3842-1-dpsmith@apertussolutions.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

With construct_dom0 consuming struct boot_domain, continue passing the
structure down to dom0_construct_pvh.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
Changes since v5:
- revert back to using *d as local reference for struct domain
---
 xen/arch/x86/dom0_build.c             | 2 +-
 xen/arch/x86/hvm/dom0_build.c         | 8 ++++----
 xen/arch/x86/include/asm/dom0_build.h | 4 +---
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 96cd1154b037..f0d2c349095b 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -610,7 +610,7 @@ int __init construct_dom0(struct boot_domain *bd)
     process_pending_softirqs();
 
     if ( is_hvm_domain(d) )
-        rc = dom0_construct_pvh(bd->d, bd->kernel, bd->ramdisk, bd->cmdline);
+        rc = dom0_construct_pvh(bd);
     else if ( is_pv_domain(d) )
         rc = dom0_construct_pv(bd);
     else
diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index a3fd5e762dc4..720e08f9346f 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -1299,10 +1299,9 @@ static void __hwdom_init pvh_setup_mmcfg(struct domain *d)
     }
 }
 
-int __init dom0_construct_pvh(
-    struct domain *d, const struct boot_module *image,
-    struct boot_module *initrd, const char *cmdline)
+int __init dom0_construct_pvh(const struct boot_domain *bd)
 {
+    struct domain *d = bd->d;
     paddr_t entry, start_info;
     int rc;
 
@@ -1345,7 +1344,8 @@ int __init dom0_construct_pvh(
         return rc;
     }
 
-    rc = pvh_load_kernel(d, image, initrd, bootstrap_map_bm(image), cmdline,
+    rc = pvh_load_kernel(d, bd->kernel, bd->ramdisk,
+                         bootstrap_map_bm(bd->kernel), bd->cmdline,
                          &entry, &start_info);
     if ( rc )
     {
diff --git a/xen/arch/x86/include/asm/dom0_build.h b/xen/arch/x86/include/asm/dom0_build.h
index 60e9cb21f14d..adbe90bfd034 100644
--- a/xen/arch/x86/include/asm/dom0_build.h
+++ b/xen/arch/x86/include/asm/dom0_build.h
@@ -16,9 +16,7 @@ int dom0_setup_permissions(struct domain *d);
 
 int dom0_construct_pv(struct boot_domain *bd);
 
-int dom0_construct_pvh(
-    struct domain *d, const struct boot_module *image,
-    struct boot_module *initrd, const char *cmdline);
+int dom0_construct_pvh(const struct boot_domain *bd);
 
 unsigned long dom0_paging_pages(const struct domain *d,
                                 unsigned long nr_pages);
-- 
2.30.2


