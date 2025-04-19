Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E049CA945C7
	for <lists+xen-devel@lfdr.de>; Sun, 20 Apr 2025 00:21:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.960280.1352403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GZ9-0007OC-LO; Sat, 19 Apr 2025 22:21:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 960280.1352403; Sat, 19 Apr 2025 22:21:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GZ9-0007Ii-8Z; Sat, 19 Apr 2025 22:21:39 +0000
Received: by outflank-mailman (input) for mailman id 960280;
 Sat, 19 Apr 2025 22:21:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nqik=XF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1u6GQB-0004yY-HA
 for xen-devel@lists.xenproject.org; Sat, 19 Apr 2025 22:12:23 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d502b86-1d6b-11f0-9eb0-5ba50f476ded;
 Sun, 20 Apr 2025 00:12:22 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1745100532920361.96569688499153;
 Sat, 19 Apr 2025 15:08:52 -0700 (PDT)
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
X-Inumbo-ID: 5d502b86-1d6b-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; t=1745100552; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YfUKKtKb4csvQTdwXPO7rLklEK3/gl9qjNZcNRLoloaNc4ZehP2ukKJOUB8E7ccb22bqCjM+u7GbeCAQWEXOMJaqfuy/lOvQx6tDnIXSYA48t8kQ3AUdCxE25FzcK8xp1KfR6wNVlM+5EIRGmgH/7Ld4T61A7/BVg74jvaDH9j4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745100552; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KtCDPxQ2vryCzA+51vqp2dtiv9M0gWY5QbgCmpBJWTE=; 
	b=X2+jZi5MyUn+Sh2DQdLPGVadrQg3Fu6GQEu/PXb/bRhn+L6h9Leh3WE1ns++qMM4D0xIJM4c0WHVUTReikvv6oTfGScXhSfVcqqJDYBvEDVYj+lzJXgukr3NSxnEefvhuHB+rbEWHchjpfVs4JldmfN3g6LRlR9i+XzuVgirXRY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745100552;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=KtCDPxQ2vryCzA+51vqp2dtiv9M0gWY5QbgCmpBJWTE=;
	b=TXGq9q33tsw1VnE9Z3Sd5ImUaTH0CJZsGF10DxBhuCz7T1Y2IWaYpGb37CtScjkk
	1mts+qiXTRuAqC/gPocvksqUx0bajWFfKQnKu7Mqr3z02gcG9tldfgyGXyHXr71ON0N
	qSw8ojvB5oOI25J5FUNqyISmNMQL6kjQR4b0CQEQ=
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
	George Dunlap <gwd@xenproject.org>
Subject: [RFC 16/38] x86/boot: move and rename sched_setup_dom0_vcpus
Date: Sat, 19 Apr 2025 18:07:58 -0400
Message-Id: <20250419220820.4234-17-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250419220820.4234-1-dpsmith@apertussolutions.com>
References: <20250419220820.4234-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Relocated the function sched_setup_dom0_vcpus(), which was protected by an
ifdef CONFIG_X86, from common/sched to the hyperlaunch domain builder. Rename
it to alloc_dom_vcpus() to better reflect the purpose of the function.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/domain-builder/domain.c      | 10 ++++++++++
 xen/arch/x86/hvm/dom0_build.c             |  2 +-
 xen/arch/x86/include/asm/domain-builder.h |  1 +
 xen/arch/x86/pv/dom0_build.c              |  2 +-
 xen/common/sched/core.c                   | 12 ------------
 xen/include/xen/sched.h                   |  1 -
 6 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/domain-builder/domain.c b/xen/arch/x86/domain-builder/domain.c
index bdb4d9745ff2..764a1af4acd3 100644
--- a/xen/arch/x86/domain-builder/domain.c
+++ b/xen/arch/x86/domain-builder/domain.c
@@ -128,6 +128,16 @@ struct vcpu *__init alloc_dom_vcpu0(struct boot_domain *bd)
     return vcpu_create(bd->d, 0);
 }
 
+void __init alloc_dom_vcpus(struct domain *d)
+{
+    unsigned int i;
+
+    for ( i = 1; i < d->max_vcpus; i++ )
+        vcpu_create(d, i);
+
+    domain_update_node_affinity(d);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index a68474b7856a..2ed2d5fd7326 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -834,7 +834,7 @@ static int __init pvh_setup_cpus(struct domain *d, paddr_t entry,
         .cpu_regs.x86_32.tr_ar = 0x8b,
     };
 
-    sched_setup_dom0_vcpus(d);
+    alloc_dom_vcpus(d);
 
     rc = arch_set_info_hvm_guest(v, &cpu_ctx);
     if ( rc )
diff --git a/xen/arch/x86/include/asm/domain-builder.h b/xen/arch/x86/include/asm/domain-builder.h
index f9b11e06ceb8..af0a24b4edf5 100644
--- a/xen/arch/x86/include/asm/domain-builder.h
+++ b/xen/arch/x86/include/asm/domain-builder.h
@@ -18,6 +18,7 @@ unsigned long dom_compute_nr_pages(
 
 unsigned int dom_max_vcpus(struct boot_domain *bd);
 struct vcpu *alloc_dom_vcpu0(struct boot_domain *bd);
+void alloc_dom_vcpus(struct domain *d);
 
 int dom_construct_pvh(struct boot_domain *bd);
 
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index ad4d1cc3520c..c3d269438313 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -827,7 +827,7 @@ static int __init dom0_construct(struct boot_domain *bd)
 
     printk("Dom%u has maximum %u VCPUs\n", d->domain_id, d->max_vcpus);
 
-    sched_setup_dom0_vcpus(d);
+    alloc_dom_vcpus(d);
 
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


