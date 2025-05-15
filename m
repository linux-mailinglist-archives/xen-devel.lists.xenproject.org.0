Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A20AB8815
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 15:34:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985548.1371520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYjT-0003Ce-3G; Thu, 15 May 2025 13:34:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985548.1371520; Thu, 15 May 2025 13:34:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYjS-00039b-VD; Thu, 15 May 2025 13:34:42 +0000
Received: by outflank-mailman (input) for mailman id 985548;
 Thu, 15 May 2025 13:34:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WRi0=X7=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1uFYZH-0006hT-Sm
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 13:24:11 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1ee5744-318f-11f0-9ffb-bf95429c2676;
 Thu, 15 May 2025 15:24:10 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1747315208582495.21756854934097;
 Thu, 15 May 2025 06:20:08 -0700 (PDT)
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
X-Inumbo-ID: e1ee5744-318f-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; t=1747315212; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aDKHUYwn6EnhWEW7vXwM2kfigr2OjwHCQFnjtUQuGLfwDmeKj1Q5rHgV/7b4FXhDWb8FNbaarL8Hz36ZHtcCZuAZUGuebsMsUE5hFwXDlAS0SEgaWu3oQ1CH81WHFv9wcbU0AOYhRlJ5XLNxURrniG21rnWQz74LQwx+CrqfSc0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747315212; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xFWh0LIwTnqw7AT+3wLll5s9wldVWcR9OTEyPHJ0MOc=; 
	b=g8eOj7p8x8FBJC/h/cWO2AorkOt3qfiqna/WpQUQy0laDRnZkQifMne0d6tF0+ec8lZL1IVHQ+FgtOoTc4sbcoZt58ZTxBkLPrQdXDgEKzpr6Vi7pjpy5xwIJFtIqb/4umLxB44a2tVfOS/qGO3qeMbuVE/MEB5enwu4E1DQr4s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747315212;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=xFWh0LIwTnqw7AT+3wLll5s9wldVWcR9OTEyPHJ0MOc=;
	b=hwb5d7sQrKfQKrKwbLjjh9IwFbcMxuW3i8S7W2OqYksBH829xF9RdBCtE/wYIF2Q
	a5WZ178TCJEisKhupgTu6jCCvcBySeO7IBzMo1RggBgJAhg8endT0CFoY2H7oqcwbTW
	lO7S5Ncqfy3b75FXJvJbsRuvJJ3S3eqJHT2PeUT8=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFCv2 35/38] x86/hyperlaunch: add multidomain construction logic
Date: Thu, 15 May 2025 09:19:47 -0400
Message-Id: <20250515131951.5594-6-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250515131951.5594-1-dpsmith@apertussolutions.com>
References: <20250515131951.5594-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Introduce the logic to loop over boot_info->domains and construct
each valid entry in the array.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/domain-builder/core.c   | 30 ++++++++++++++++++++++++++++
 xen/arch/x86/domain-builder/domain.c |  7 +++++--
 xen/arch/x86/hvm/dom_build.c         |  5 ++++-
 xen/arch/x86/setup.c                 |  3 ++-
 4 files changed, 41 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/domain-builder/core.c b/xen/arch/x86/domain-builder/core.c
index af79792b5316..367c0de33cfb 100644
--- a/xen/arch/x86/domain-builder/core.c
+++ b/xen/arch/x86/domain-builder/core.c
@@ -58,6 +58,7 @@ static int  __init build_core_domains(struct boot_info *bi)
 unsigned int __init builder_create_domains(struct boot_info *bi)
 {
     unsigned int build_count = 0;
+    int i;
 
     if ( bi->nr_domains == 0 )
         panic("%s: no domains defined\n", __func__);
@@ -70,10 +71,39 @@ unsigned int __init builder_create_domains(struct boot_info *bi)
             bi->domains[0].constructed = true;
             build_count++;
         }
+
+        goto out;
     }
     else
         build_count = build_core_domains(bi);
 
+    if ( !IS_ENABLED(CONFIG_MULTIDOMAIN_BUILDER) )
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
     arch_builder_finalize(bi);
 
     return build_count;
diff --git a/xen/arch/x86/domain-builder/domain.c b/xen/arch/x86/domain-builder/domain.c
index c453629700c1..9d9901fad505 100644
--- a/xen/arch/x86/domain-builder/domain.c
+++ b/xen/arch/x86/domain-builder/domain.c
@@ -326,8 +326,11 @@ struct domain *__init arch_create_dom(
                            ((hvm_hap_supported() && !opt_dom0_shadow) ?
                             XEN_DOMCTL_CDF_hap : 0));
 
-        dom_cfg.arch.emulation_flags |=
-            XEN_X86_EMU_LAPIC | XEN_X86_EMU_IOAPIC | XEN_X86_EMU_VPCI;
+        if ( bd->capabilities & DOMAIN_CAPS_HARDWARE )
+            dom_cfg.arch.emulation_flags |=
+                XEN_X86_EMU_LAPIC | XEN_X86_EMU_IOAPIC | XEN_X86_EMU_VPCI;
+        else
+            dom_cfg.arch.emulation_flags |= X86_EMU_LAPIC;
     }
 
     if ( iommu_enabled && (bd->capabilities & DOMAIN_CAPS_HARDWARE) )
diff --git a/xen/arch/x86/hvm/dom_build.c b/xen/arch/x86/hvm/dom_build.c
index 170caac6716e..3118e3483e46 100644
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
index 36e6ba11ddcd..422fef7ce02a 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1331,7 +1331,8 @@ void asmlinkage __init noreturn __start_xen(void)
         xen->size  = __2M_rwdata_end - _stext;
     }
 
-    arch_builder_headroom(&bi->domains[0]);
+    for ( i = 0; i < bi->nr_domains; i++ )
+        arch_builder_headroom(&bi->domains[i]);
 
 #ifndef highmem_start
     /* Don't allow split below 4Gb. */
-- 
2.30.2


