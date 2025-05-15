Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DBAAB87B3
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 15:18:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985322.1371240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYTv-0002Xw-Tf; Thu, 15 May 2025 13:18:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985322.1371240; Thu, 15 May 2025 13:18:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYTv-0002VM-Or; Thu, 15 May 2025 13:18:39 +0000
Received: by outflank-mailman (input) for mailman id 985322;
 Thu, 15 May 2025 13:18:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WRi0=X7=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1uFYTt-0001J6-Sv
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 13:18:37 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b438928-318f-11f0-9eb6-5ba50f476ded;
 Thu, 15 May 2025 15:18:37 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1747315073180787.6888291264746;
 Thu, 15 May 2025 06:17:53 -0700 (PDT)
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
X-Inumbo-ID: 1b438928-318f-11f0-9eb6-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; t=1747315075; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AWzYI7A9X+nkqZGc27q9xk8SmHzOEcLUeMSHEjDhirwuflVQYAjVWRqHI01jDo3ivJJp43SA6MdKBlqt0+pRE2JUDc6Yhf21QTahc6W0k3xLh3ZK6FQZVaiJ3TvxFxg7EaxGpCAhfsAT62qHIIP+6i2gi345dYWAeAapkv3Lw4I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747315075; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=qJ7uYx+Z7nGp4Os0P7DvdOGEpmcyi7yC0rtUJHH0a2w=; 
	b=Y0coMV4kcMOO6Bv041Kh3ve5uB+I0x0cxWz0P3ZiTq+G+yjZd9AqVAhKNdc+8xxmLi/FWUjRf0o0c/c5mH2YyLwV27wMJV3MzuI9101gZEcZ5/RN6Vc3gPqWBJw82rwty3DA7/ashTBMWlAS8tIYPx1LlH7uVKXF/XF/oowQEk4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747315075;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=qJ7uYx+Z7nGp4Os0P7DvdOGEpmcyi7yC0rtUJHH0a2w=;
	b=f09z7cTM547DK0mM1HXtQd8HsqEhh+iIsqOdWTys7MUVhNes6Ak3nFGTUhNvyALS
	FpaFQpozV1dxEfI+IxbYhya6zTU2uDu1Uc7vWGv9i2ONEVuLo62cu8mJoyn46YAoJLy
	pk8W6cos5d/ECj6TVPgrjTRbLRvDQCxjF4L57EOU=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Christopher Clark <christopher.w.clark@gmail.com>
Subject: [RFCv2 02/38] x86/hyperlaunch: correct the naming of domain ramdisk field
Date: Thu, 15 May 2025 09:17:08 -0400
Message-Id: <20250515131744.3843-3-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250515131744.3843-1-dpsmith@apertussolutions.com>
References: <20250515131744.3843-1-dpsmith@apertussolutions.com>
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
 xen/arch/x86/hvm/dom0_build.c          | 2 +-
 xen/arch/x86/include/asm/boot-domain.h | 2 +-
 xen/arch/x86/pv/dom0_build.c           | 2 +-
 xen/arch/x86/setup.c                   | 2 +-
 xen/common/domain-builder/fdt.c        | 8 ++++----
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index a038e58c118b..0664f0543fd6 100644
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
index cb5351241a62..740bfb74121c 100644
--- a/xen/arch/x86/include/asm/boot-domain.h
+++ b/xen/arch/x86/include/asm/boot-domain.h
@@ -28,7 +28,7 @@ struct boot_domain {
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
index 6a1e874b2ecf..afc133b4d562 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -2187,7 +2187,7 @@ void asmlinkage __init noreturn __start_xen(void)
     if ( !bi->hyperlaunch_enabled && initrdidx < MAX_NR_BOOTMODS )
     {
         bi->mods[initrdidx].type = BOOTMOD_RAMDISK;
-        bi->domains[0].module = &bi->mods[initrdidx];
+        bi->domains[0].ramdisk = &bi->mods[initrdidx];
         if ( first_boot_module_index(bi, BOOTMOD_UNKNOWN) < MAX_NR_BOOTMODS )
             printk(XENLOG_WARNING
                    "Multiple initrd candidates, picking module #%u\n",
diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder/fdt.c
index 232621ae46f9..1b3492571b15 100644
--- a/xen/common/domain-builder/fdt.c
+++ b/xen/common/domain-builder/fdt.c
@@ -374,10 +374,10 @@ static int __init fdt_process_domain_node(
         {
             int idx;
 
-            if ( bd->module )
+            if ( bd->ramdisk )
             {
                 printk(XENLOG_WARNING
-                       "Duplicate module for domain %s\n", name);
+                       "Duplicate multiboot,ramdisk for domain %s\n", name);
                 continue;
             }
 
@@ -390,9 +390,9 @@ static int __init fdt_process_domain_node(
                 return idx;
             }
 
-            printk(XENLOG_INFO "  module: multiboot-index=%d\n", idx);
+            printk(XENLOG_INFO "  ramdisk: multiboot-index=%d\n", idx);
             bi->mods[idx].type = BOOTMOD_RAMDISK;
-            bd->module = &bi->mods[idx];
+            bd->ramdisk = &bi->mods[idx];
         }
     }
 
-- 
2.30.2


