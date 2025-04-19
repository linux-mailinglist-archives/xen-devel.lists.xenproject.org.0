Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 312DAA945A6
	for <lists+xen-devel@lfdr.de>; Sun, 20 Apr 2025 00:09:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.960023.1352086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GN5-0005Kx-OK; Sat, 19 Apr 2025 22:09:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 960023.1352086; Sat, 19 Apr 2025 22:09:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GN5-0005I8-LO; Sat, 19 Apr 2025 22:09:11 +0000
Received: by outflank-mailman (input) for mailman id 960023;
 Sat, 19 Apr 2025 22:09:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nqik=XF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1u6GN4-0004ik-5B
 for xen-devel@lists.xenproject.org; Sat, 19 Apr 2025 22:09:10 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e97500c2-1d6a-11f0-9ffb-bf95429c2676;
 Sun, 20 Apr 2025 00:09:08 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1745100511651881.3603769819105;
 Sat, 19 Apr 2025 15:08:31 -0700 (PDT)
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
X-Inumbo-ID: e97500c2-1d6a-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; t=1745100514; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cWeIr/ZaTjTzuFSs20BKmaulJkwDLffqU6l4/4Exd4bwcTicA09gDRrIZ+esjjkGjuBSqeoDFjijGGZNwv9l+t84PKtg+gWkwNEHSQXTomcIOaE6F4dSKlrT/9CGdwSFw+Msd9nq3GMFy7D0M005fBm+6gmckY+B/oOfMfJjcjo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745100514; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7U1Fqb7JL6jeU93el9q9k/XaCyV8bA/5BXhduZX6xMc=; 
	b=Nr6/oxr21Mrk5E8FX+bIsGu4Va3loqycqmcZvP04UMMq/417XkiNPzfSvKAC5sQyStwhBoqY11s01Md5kqp0KcJEhfA66PPpgen68KHH5x58JpstFiTH1o/RINEAhkeNYsudp5ZdItdQB/KQqmw2ylOhAhK5wtJCZq4vK5a4Ing=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745100514;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=7U1Fqb7JL6jeU93el9q9k/XaCyV8bA/5BXhduZX6xMc=;
	b=F/L0fBS+Zo6E2TOzI0mNrNuE6naZsgg2cNz6/6M4jA9X1qJV1h2I/83RS1z+dIvI
	7II99riovleZ6lIcwhDDHBn4JHUJOxHkTtLfXeB212ZTZNTgDsPIm3luRATrh8t0Sax
	a/3N1uxyt1gRZyEJmuKPO2ZTzYcw3+mCXriEJFQI=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC 02/38] x86/hyperlaunch: correct the naming of domain ramdisk field
Date: Sat, 19 Apr 2025 18:07:44 -0400
Message-Id: <20250419220820.4234-3-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250419220820.4234-1-dpsmith@apertussolutions.com>
References: <20250419220820.4234-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The ramdisk field was incorrectly renamed to module without providing a sound
justification. Doing so creates an unnecessary indirection that can cause more
confusion than utility. The only way the field is populated is via a match of a
boot module of type BOOTMOD_RAMDISK. All usages of the field are cast into a
variables named initrd. The attempt to generalize the field name under the
guise that it could be multiplexed for other module types did so without a
valid usage. The result is there is no consideration of how that multiplexing
would even work or be deconflict with the simultaneous presence of a ramdisk.

Moving the field name back to ramdisk to make the current code flow logical. At
a later time should there be a use case that arises where additional modules
need to be passed to a domain, a more appropriate framework will be crafted
that will like be more complicated than just renaming the field to something
other than ramdisk.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/domain-builder/fdt.c      | 4 ++--
 xen/arch/x86/hvm/dom0_build.c          | 2 +-
 xen/arch/x86/include/asm/boot-domain.h | 2 +-
 xen/arch/x86/pv/dom0_build.c           | 2 +-
 xen/arch/x86/setup.c                   | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/domain-builder/fdt.c b/xen/arch/x86/domain-builder/fdt.c
index dbfbcffb0a9c..d2a7e010ea77 100644
--- a/xen/arch/x86/domain-builder/fdt.c
+++ b/xen/arch/x86/domain-builder/fdt.c
@@ -310,7 +310,7 @@ static int __init process_domain_node(
         {
             int idx;
 
-            if ( bd->module )
+            if ( bd->ramdisk )
             {
                 printk(XENLOG_ERR "Duplicate ramdisk module for domain %s)\n",
                        name);
@@ -328,7 +328,7 @@ static int __init process_domain_node(
 
             printk("  ramdisk: boot module %d\n", idx);
             bi->mods[idx].type = BOOTMOD_RAMDISK;
-            bd->module = &bi->mods[idx];
+            bd->ramdisk = &bi->mods[idx];
 
             continue;
         }
diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index ebad5a49b8d4..176b253d3c61 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -648,7 +648,7 @@ static int __init pvh_load_kernel(
 {
     struct domain *d = bd->d;
     struct boot_module *image = bd->kernel;
-    struct boot_module *initrd = bd->module;
+    struct boot_module *initrd = bd->ramdisk;
     void *image_base = bootstrap_map_bm(image);
     void *image_start = image_base + image->headroom;
     unsigned long image_len = image->size;
diff --git a/xen/arch/x86/include/asm/boot-domain.h b/xen/arch/x86/include/asm/boot-domain.h
index 29a7d806de1a..b0f956cd734e 100644
--- a/xen/arch/x86/include/asm/boot-domain.h
+++ b/xen/arch/x86/include/asm/boot-domain.h
@@ -29,7 +29,7 @@ struct boot_domain {
     unsigned int max_vcpus;
 
     struct boot_module *kernel;
-    struct boot_module *module;
+    struct boot_module *ramdisk;
     const char *cmdline;
 
     struct domain *d;
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index e1b78d47c218..3b2baf057b75 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -375,7 +375,7 @@ static int __init dom0_construct(const struct boot_domain *bd)
     struct vcpu *v = d->vcpu[0];
 
     struct boot_module *image = bd->kernel;
-    struct boot_module *initrd = bd->module;
+    struct boot_module *initrd = bd->ramdisk;
     void *image_base;
     unsigned long image_len;
     void *image_start;
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 1e7bbc415e1d..6a939ccede3f 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -2165,7 +2165,7 @@ void asmlinkage __init noreturn __start_xen(void)
     if ( !bi->hyperlaunch_enabled && initrdidx < MAX_NR_BOOTMODS )
     {
         bi->mods[initrdidx].type = BOOTMOD_RAMDISK;
-        bi->domains[0].module = &bi->mods[initrdidx];
+        bi->domains[0].ramdisk = &bi->mods[initrdidx];
         if ( first_boot_module_index(bi, BOOTMOD_UNKNOWN) < MAX_NR_BOOTMODS )
             printk(XENLOG_WARNING
                    "Multiple initrd candidates, picking module #%u\n",
-- 
2.30.2


