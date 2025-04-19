Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 895C8A945CA
	for <lists+xen-devel@lfdr.de>; Sun, 20 Apr 2025 00:21:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.960306.1352425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GZK-0001Fo-Cm; Sat, 19 Apr 2025 22:21:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 960306.1352425; Sat, 19 Apr 2025 22:21:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GZK-00019u-76; Sat, 19 Apr 2025 22:21:50 +0000
Received: by outflank-mailman (input) for mailman id 960306;
 Sat, 19 Apr 2025 22:21:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nqik=XF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1u6GRb-0004yY-4k
 for xen-devel@lists.xenproject.org; Sat, 19 Apr 2025 22:13:51 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91665486-1d6b-11f0-9eb0-5ba50f476ded;
 Sun, 20 Apr 2025 00:13:50 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1745100567355726.0607417322368;
 Sat, 19 Apr 2025 15:09:27 -0700 (PDT)
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
X-Inumbo-ID: 91665486-1d6b-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; t=1745100571; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YQ8uzkmpyPlCFPyazWDIbwPOSyCAsWMBRW9+8kLSGG2F6TedD9RJkPmFFpsl6AcSIjuYGivBmQCpJwI2BE6b0w+l4OFKm2IbEKFDIlh8X65yPNkOxZkRkQG92mHFHdIASnU/CgsRIOgDDF11581qNzOs/bhA+omkhgFkM1tBJ1c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745100571; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=E9G74MndY9ZXEk+L1cKEhZ2Ussr5gQpteSfUtOKkupg=; 
	b=CmD9K4OA1Tbbx0GZGexDCYspuFdY3Rd0GuF8H2aPAhbYUWy/XgfhrXBbg1eiuAS7L/lr6T6va4+/dz0/1dybBakCVS+5KiP2gvijoOIPUumN3UKJEXd+BSqGKkGFgetmF8SpRf7K1ahoKCQwAcwUkfexOMKcO1q48pz+dEwtQDs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745100571;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=E9G74MndY9ZXEk+L1cKEhZ2Ussr5gQpteSfUtOKkupg=;
	b=Ak7kH6RAScWmzL2O9SyT749raI8ggkrjE8Z2jZo2KvWds8rpIehLrPNFlLwJrDlg
	rP7p5JHXv5QODLyQlx3fsTn8Yz/NBMv3Ct5VuoVFLOM6t8UF2RNasCeQR/opsqGaKoI
	R4ttPJlwATDjxg1wB5+dIjOJB2U2bQCQh7gMIyhI=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC 35/38] x86/hyperlaunch: add multidomain construction logic
Date: Sat, 19 Apr 2025 18:08:17 -0400
Message-Id: <20250419220820.4234-36-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250419220820.4234-1-dpsmith@apertussolutions.com>
References: <20250419220820.4234-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Introduce the logic to loop over boot_info->domains and construct
each valid entry in the array.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/domain-builder/core.c   | 32 ++++++++++++++++++++++++----
 xen/arch/x86/domain-builder/domain.c |  7 ++++--
 xen/arch/x86/hvm/dom_build.c         |  5 ++++-
 xen/arch/x86/setup.c                 | 11 ++++++----
 4 files changed, 44 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/domain-builder/core.c b/xen/arch/x86/domain-builder/core.c
index f693aa46d278..2712703e17e6 100644
--- a/xen/arch/x86/domain-builder/core.c
+++ b/xen/arch/x86/domain-builder/core.c
@@ -166,16 +166,40 @@ static int  __init build_core_domains(struct boot_info *bi)
 unsigned int __init builder_create_domains(struct boot_info *bi)
 {
     unsigned int build_count = 0;
-    struct boot_domain *bd = &bi->domains[0];
+    int i;
 
     if ( bi->nr_domains == 0 )
         panic("%s: no domains defined\n", __func__);
 
-    if ( bd->kernel == NULL && bd->capabilities & BUILD_CAPS_CONTROL )
-        panic("%s: control domain missing kernel\n", __func__);
-
     build_count = build_core_domains(bi);
 
+    if ( ! IS_ENABLED(CONFIG_MULTIDOMAIN_BUILDER) )
+        goto out;
+
+    for ( i = 0; i < bi->nr_domains; i++ )
+    {
+        struct boot_domain *bd = &bi->domains[i];
+
+        if ( bd->constructed )
+            continue;
+
+        if ( bd->mode & BUILD_MODE_PARAVIRT )
+        {
+            printk(XENLOG_WARNING "don't support PV DomU, skipping %d\n", i);
+            continue;
+        }
+
+        arch_create_dom(bi, bd);
+        if ( bd->d )
+        {
+            bd->constructed = true;
+            build_count++;
+        }
+        else
+            printk(XENLOG_WARNING "failed to construct build domain %d\n", i);
+    }
+
+ out:
     /* Free temporary buffers. */
     free_boot_modules();
 
diff --git a/xen/arch/x86/domain-builder/domain.c b/xen/arch/x86/domain-builder/domain.c
index 919df1ffb1c3..7f5bee0dc759 100644
--- a/xen/arch/x86/domain-builder/domain.c
+++ b/xen/arch/x86/domain-builder/domain.c
@@ -321,8 +321,11 @@ struct domain *__init arch_create_dom(
                            ((hvm_hap_supported() && !opt_dom0_shadow) ?
                             XEN_DOMCTL_CDF_hap : 0));
 
-        dom_cfg.arch.emulation_flags |=
-            XEN_X86_EMU_LAPIC | XEN_X86_EMU_IOAPIC | XEN_X86_EMU_VPCI;
+        if ( bd->capabilities & BUILD_CAPS_HARDWARE )
+            dom_cfg.arch.emulation_flags |=
+                XEN_X86_EMU_LAPIC | XEN_X86_EMU_IOAPIC | XEN_X86_EMU_VPCI;
+        else
+            dom_cfg.arch.emulation_flags |= X86_EMU_LAPIC;
     }
 
     if ( bd->capabilities & BUILD_CAPS_HARDWARE )
diff --git a/xen/arch/x86/hvm/dom_build.c b/xen/arch/x86/hvm/dom_build.c
index 4f614aea34c3..db7bf9a6934a 100644
--- a/xen/arch/x86/hvm/dom_build.c
+++ b/xen/arch/x86/hvm/dom_build.c
@@ -885,7 +885,10 @@ static int __init pvh_load_kernel(
     }
 
     start_info.magic = XEN_HVM_START_MAGIC_VALUE;
-    start_info.flags = SIF_PRIVILEGED | SIF_INITDOMAIN;
+    if ( is_control_domain(d) )
+        start_info.flags = SIF_PRIVILEGED;
+    if ( is_hardware_domain(d) )
+        start_info.flags = SIF_INITDOMAIN;
     rc = hvm_copy_to_guest_phys(last_addr, &start_info, sizeof(start_info), v);
     if ( rc )
     {
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index da5a8e8d8ed3..09b1fc94426d 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1319,10 +1319,13 @@ void asmlinkage __init noreturn __start_xen(void)
         xen->size  = __2M_rwdata_end - _stext;
     }
 
-    bi->domains[0].kernel->headroom =
-        bzimage_headroom(bootstrap_map_bm(bi->domains[0].kernel),
-                         bi->domains[0].kernel->size);
-    bootstrap_unmap();
+    for ( i = 0; i < bi->nr_domains; i++ )
+    {
+        bi->domains[i].kernel->headroom =
+            bzimage_headroom(bootstrap_map_bm(bi->domains[i].kernel),
+                             bi->domains[i].kernel->size);
+        bootstrap_unmap();
+    }
 
 #ifndef highmem_start
     /* Don't allow split below 4Gb. */
-- 
2.30.2


