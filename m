Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33778AB87C9
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 15:20:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985366.1371358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYW1-0007by-BK; Thu, 15 May 2025 13:20:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985366.1371358; Thu, 15 May 2025 13:20:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYW0-0007UC-Tz; Thu, 15 May 2025 13:20:48 +0000
Received: by outflank-mailman (input) for mailman id 985366;
 Thu, 15 May 2025 13:20:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WRi0=X7=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1uFYVk-0001J6-21
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 13:20:32 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f41ec04-318f-11f0-9eb6-5ba50f476ded;
 Thu, 15 May 2025 15:20:31 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 174731510102267.71929642819794;
 Thu, 15 May 2025 06:18:21 -0700 (PDT)
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
X-Inumbo-ID: 5f41ec04-318f-11f0-9eb6-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; t=1747315103; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZjErjESZmQCdzQGcYKz/tDHTWN/O7qERZsfm2lP4q2LWGD/mwbQV5twK5bvlkGkfkXs8JkQonozwFjbkiNhcI9NdpwH+B9Y608fnafaxiTF98oYkYTtMQKBC/PyzRSdz2sXKjcRGOSRjaW3vBe4XO31m1oJqt1eZnHF2XiWMTpo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747315103; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vJ85DDGywMQZu37DcdO2L0xHkt6GG4rEFGjp+TkyIGY=; 
	b=gY+cVlJXaBORRxSKnaGBm+d07xr0XSbj59GTSAwhqbkEQ47AjMrh0jWLhqmUjTbNsX9MSsbHjph1zo+9lR7GfHRNUDeHW9azY3K0EdRS7kxuYAsclHbHR80FNQKjc2jDGw4yzxVx95ER3cKhBcvpHYi0i1zW1IW4NfCEQNcj8Ss=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747315103;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=vJ85DDGywMQZu37DcdO2L0xHkt6GG4rEFGjp+TkyIGY=;
	b=D9p8SELWqo0wCv97+ADoLWaHggOGrqxhjotCIXUr+vMztfmNFV5PPeM/DQksGmyK
	Ggr5xxPNlmCJeOqVMG8kZg+rrW9XSgAGGABNSo16rlfqe9h8G87ANV11fBSQWTYSg3G
	XpYdezxcaXnR+5UN9dbeoglwZCEgEfIiz42FODKw=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <gwd@xenproject.org>,
	Christopher Clark <christopher.w.clark@gmail.com>
Subject: [RFCv2 15/38] x86/boot: move and rename sched_setup_dom0_vcpus
Date: Thu, 15 May 2025 09:17:21 -0400
Message-Id: <20250515131744.3843-16-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250515131744.3843-1-dpsmith@apertussolutions.com>
References: <20250515131744.3843-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Relocated the function sched_setup_dom0_vcpus(), which was protected by an
ifdef CONFIG_X86, from common/sched to the hyperlaunch domain builder. Rename
it to alloc_dom_vcpus() to better reflect the purpose of the function.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/domain-builder/domain.c | 10 ++++++++++
 xen/arch/x86/hvm/dom0_build.c        |  3 ++-
 xen/arch/x86/pv/dom0_build.c         |  3 ++-
 xen/common/sched/core.c              | 12 ------------
 xen/include/xen/domain-builder.h     |  2 ++
 xen/include/xen/sched.h              |  1 -
 6 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/domain-builder/domain.c b/xen/arch/x86/domain-builder/domain.c
index 258f777cd9ee..d934b240229f 100644
--- a/xen/arch/x86/domain-builder/domain.c
+++ b/xen/arch/x86/domain-builder/domain.c
@@ -45,6 +45,16 @@ struct vcpu *__init domain_vcpu0_create(struct boot_domain *bd)
     return vcpu_create(bd->d, 0);
 }
 
+void __init domain_vcpus_create(struct domain *d)
+{
+    unsigned int i;
+
+    for ( i = 1; i < d->max_vcpus; i++ )
+        vcpu_create(d, i);
+
+    domain_update_node_affinity(d);
+}
+
 unsigned long __init dom_paging_pages(
     const struct boot_domain *bd, unsigned long nr_pages)
 {
diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 6990c1d3a882..a900138b0311 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -8,6 +8,7 @@
  */
 
 #include <xen/acpi.h>
+#include <xen/domain-builder.h>
 #include <xen/init.h>
 #include <xen/libelf.h>
 #include <xen/multiboot.h>
@@ -833,7 +834,7 @@ static int __init pvh_setup_cpus(struct domain *d, paddr_t entry,
         .cpu_regs.x86_32.tr_ar = 0x8b,
     };
 
-    sched_setup_dom0_vcpus(d);
+    domain_vcpus_create(d);
 
     rc = arch_set_info_hvm_guest(v, &cpu_ctx);
     if ( rc )
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index ad4d1cc3520c..195c0902d5a1 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -5,6 +5,7 @@
  */
 
 #include <xen/domain.h>
+#include <xen/domain-builder.h>
 #include <xen/domain_page.h>
 #include <xen/init.h>
 #include <xen/libelf.h>
@@ -827,7 +828,7 @@ static int __init dom0_construct(struct boot_domain *bd)
 
     printk("Dom%u has maximum %u VCPUs\n", d->domain_id, d->max_vcpus);
 
-    sched_setup_dom0_vcpus(d);
+    domain_vcpus_create(d);
 
     d->arch.paging.mode = 0;
 
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 9043414290a8..d679d766a4b6 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -3479,18 +3479,6 @@ void wait(void)
     schedule();
 }
 
-#ifdef CONFIG_X86
-void __init sched_setup_dom0_vcpus(struct domain *d)
-{
-    unsigned int i;
-
-    for ( i = 1; i < d->max_vcpus; i++ )
-        vcpu_create(d, i);
-
-    domain_update_node_affinity(d);
-}
-#endif
-
 #ifdef CONFIG_COMPAT
 #include "compat.c"
 #endif
diff --git a/xen/include/xen/domain-builder.h b/xen/include/xen/domain-builder.h
index d3390d368afb..79e4c50ddf85 100644
--- a/xen/include/xen/domain-builder.h
+++ b/xen/include/xen/domain-builder.h
@@ -6,6 +6,7 @@
 
 struct boot_info;
 struct boot_domain;
+struct domain;
 
 /* Return status of builder_init(). Shows which boot mechanism was detected */
 enum fdt_kind
@@ -37,5 +38,6 @@ int builder_get_cmdline(const struct boot_info *bi, int offset,
 
 unsigned int dom_max_vcpus(struct boot_domain *bd);
 struct vcpu *domain_vcpu0_create(struct boot_domain *bd);
+void domain_vcpus_create(struct domain *d);
 
 #endif /* __XEN_DOMAIN_BUILDER_H__ */
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 559d201e0c7e..4f184cd76206 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -1084,7 +1084,6 @@ static inline bool sched_has_urgent_vcpu(void)
 }
 
 void vcpu_set_periodic_timer(struct vcpu *v, s_time_t value);
-void sched_setup_dom0_vcpus(struct domain *d);
 int vcpu_temporary_affinity(struct vcpu *v, unsigned int cpu, uint8_t reason);
 int vcpu_set_hard_affinity(struct vcpu *v, const cpumask_t *affinity);
 int vcpu_affinity_domctl(struct domain *d, uint32_t cmd,
-- 
2.30.2


