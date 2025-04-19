Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24ABBA945B6
	for <lists+xen-devel@lfdr.de>; Sun, 20 Apr 2025 00:13:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.960124.1352235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GRM-0005y9-QF; Sat, 19 Apr 2025 22:13:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 960124.1352235; Sat, 19 Apr 2025 22:13:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GRM-0005vl-Mz; Sat, 19 Apr 2025 22:13:36 +0000
Received: by outflank-mailman (input) for mailman id 960124;
 Sat, 19 Apr 2025 22:13:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nqik=XF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1u6GRL-0004oZ-Sp
 for xen-devel@lists.xenproject.org; Sat, 19 Apr 2025 22:13:35 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87e8e708-1d6b-11f0-9ffb-bf95429c2676;
 Sun, 20 Apr 2025 00:13:34 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1745100564099317.7051324884495;
 Sat, 19 Apr 2025 15:09:24 -0700 (PDT)
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
X-Inumbo-ID: 87e8e708-1d6b-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; t=1745100571; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ACFX41L7aYz26PiP6maGudGgR0vSKrM9BZh+cxVP9DokHpRGb11saJoTLwY+riTWZ/3lttDGtj7Wee23bsfMaDKHb0JGfHDONCkjT032rem08ghPN0yryofM8YO5+fyfizxgCNwPSNf0eyDUqqFaj5vt+PuAxN7PD687bNtBlZE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745100571; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=DQEG8mIjNUEnBFfKy/NUA5oCT0cynfg6veEbEk7wCvA=; 
	b=XtRj1fE1S+3oSdcgO5sH9TkC3OSk/HLsOc3XQ/jaunuJMdvyodkphu6hYBTVtz8ZH7f1JuPXctBW99t15Kt0uH8ERrqZZNJ1V8fV9kpgoiKcpUWuStXO8/SEIeOGXMRM/t8tQIfn+ymn3ZERFQxXsfreG97RobxlZsKdJBxRDz8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745100571;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=DQEG8mIjNUEnBFfKy/NUA5oCT0cynfg6veEbEk7wCvA=;
	b=apSo9iKutTJzbuPWj4NB1FYsAQ7yfqohRdp8HQDepjzF4aMhbD29Ybf1h/xFpRw0
	YBfP0sXkt7YcQruh9mriCb94Na9C+II3wZ+aeFhmuaJp0svyN79WZ/2vj8ofN2UUzQl
	1m4jKFpQbMlvhDHeqFbQc+xez9nludp0Ysaj8UWw=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC 31/38] x86/hyperlaunch: move boot module discard to domain builder
Date: Sat, 19 Apr 2025 18:08:13 -0400
Message-Id: <20250419220820.4234-32-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250419220820.4234-1-dpsmith@apertussolutions.com>
References: <20250419220820.4234-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Relocate the call to discard boot modules from inside the domain
construction logic to the top level domain builder. This will
ensure modules are not discarded until after all domains have been
constructed.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/domain-builder/core.c | 5 ++++-
 xen/arch/x86/hvm/dom_build.c       | 3 ---
 xen/arch/x86/pv/dom0_build.c       | 3 ---
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/domain-builder/core.c b/xen/arch/x86/domain-builder/core.c
index e21f5efbfe62..901efce62a61 100644
--- a/xen/arch/x86/domain-builder/core.c
+++ b/xen/arch/x86/domain-builder/core.c
@@ -8,8 +8,8 @@
 #include <xen/lib.h>
 
 #include <asm/bootinfo.h>
-#include <asm/setup.h>
 #include <asm/domain-builder.h>
+#include <asm/setup.h>
 
 #include "fdt.h"
 
@@ -116,6 +116,9 @@ unsigned int __init builder_create_domains(struct boot_info *bi)
     if ( bd->d )
         build_count++;
 
+    /* Free temporary buffers. */
+    free_boot_modules();
+
     return build_count;
 }
 
diff --git a/xen/arch/x86/hvm/dom_build.c b/xen/arch/x86/hvm/dom_build.c
index 2798542e5483..a847c2cb16d9 100644
--- a/xen/arch/x86/hvm/dom_build.c
+++ b/xen/arch/x86/hvm/dom_build.c
@@ -854,9 +854,6 @@ static int __init pvh_load_kernel(
         last_addr = ROUNDUP(last_addr, PAGE_SIZE);
     }
 
-    /* Free temporary buffers. */
-    free_boot_modules();
-
     if ( bd->cmdline )
     {
         rc = hvm_copy_to_guest_phys(last_addr, bd->cmdline,
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index c3d269438313..8d941ff4486e 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -865,9 +865,6 @@ static int __init dom0_construct(struct boot_domain *bd)
         init_hypercall_page(d, _p(parms.virt_hypercall));
     }
 
-    /* Free temporary buffers. */
-    free_boot_modules();
-
     /* Set up start info area. */
     si = (start_info_t *)vstartinfo_start;
     clear_page(si);
-- 
2.30.2


