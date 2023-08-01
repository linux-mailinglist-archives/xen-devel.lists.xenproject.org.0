Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DA776BE6D
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 22:21:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574505.899858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQvry-0001uI-VY; Tue, 01 Aug 2023 20:21:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574505.899858; Tue, 01 Aug 2023 20:21:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQvry-0001rF-SP; Tue, 01 Aug 2023 20:21:26 +0000
Received: by outflank-mailman (input) for mailman id 574505;
 Tue, 01 Aug 2023 20:21:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B3Rc=DS=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qQvrx-0000Vh-8u
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 20:21:25 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fbb9076f-30a8-11ee-b25c-6b7b168915f2;
 Tue, 01 Aug 2023 22:21:24 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1690921224303856.0970233237165;
 Tue, 1 Aug 2023 13:20:24 -0700 (PDT)
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
X-Inumbo-ID: fbb9076f-30a8-11ee-b25c-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1690921226; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=g2IEczmY3ijXZ1YHho3IZfu6YTmF4eaEB/eX7H499qCJcVzbN3siHaE30Z50NywMmdX/UUQyM1pQ5ROIMmims1eH4GYG8VXFEO9w7f8zeCKV0lco35/iZ/zJVOi5VlhNlVOhrh1rib2T/ymt43cWzxAKPJ90RIO2/H3BilYHwN4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1690921226; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=7ND+sooMpw5YPJbP1s16uk5VZG1QVw0bGyicpPO6T2Q=; 
	b=iDypGFFju+iorCRbCu1v6Vydraf2VoFooKlXDnMMoCxatBohmqq7MLXRYZ6EvtmVhIRCYTY0IcJB5IJDGRDlxn7kLmSvzMRBSzc+ny80UReQAQhMEadFq6EkpXbM3vmFzBt76dVh+RKHgwoft2HdbzBhIW79uR/xA9iFW29V51E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1690921226;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=7ND+sooMpw5YPJbP1s16uk5VZG1QVw0bGyicpPO6T2Q=;
	b=oCTDWLjidEWDIMQf7q7AdaFYNGMNs8thaCk/9VpBUqfOOxXI0I0yoAZywHIrnxPJ
	/NSZn9/wo5V2ec8POU4XZMIsUtO7/uVT7+PXa+8UhtGVTcJzYgtjmXssgOfK9VEc+Hx
	Q/5HXKNq+cQNyRErpZBxGle0x/6EUtFtv67tOfdc=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC 5/6] capabilities: add dom0 cpu faulting disable
Date: Tue,  1 Aug 2023 16:20:05 -0400
Message-Id: <20230801202006.20322-6-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230801202006.20322-1-dpsmith@apertussolutions.com>
References: <20230801202006.20322-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This encapsulates disableing cpu faulting for PV dom0 as a capability.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/cpu-policy.c |  2 +-
 xen/arch/x86/cpu/common.c | 82 +++++++++++++++++++--------------------
 xen/arch/x86/setup.c      |  4 ++
 xen/include/xen/sched.h   |  8 +++-
 4 files changed, 52 insertions(+), 44 deletions(-)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 1f954d4e59..42c3193938 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -912,7 +912,7 @@ void __init init_dom0_cpuid_policy(struct domain *d)
      * If the domain is getting unfiltered CPUID, don't let the guest kernel
      * play with CPUID faulting either, as Xen's CPUID path won't cope.
      */
-    if ( !opt_dom0_cpuid_faulting && is_control_domain(d) && is_pv_domain(d) )
+    if ( domain_has_cap(d, CAP_DISABLE_CPU_FAULT) )
         p->platform_info.cpuid_faulting = false;
 
     recalculate_cpuid_policy(d);
diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index cfcdaace12..937581e353 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -164,48 +164,46 @@ static void set_cpuid_faulting(bool enable)
 
 void ctxt_switch_levelling(const struct vcpu *next)
 {
-	const struct domain *nextd = next ? next->domain : NULL;
-	bool enable_cpuid_faulting;
-
-	if (cpu_has_cpuid_faulting ||
-	    boot_cpu_has(X86_FEATURE_CPUID_USER_DIS)) {
-		/*
-		 * No need to alter the faulting setting if we are switching
-		 * to idle; it won't affect any code running in idle context.
-		 */
-		if (nextd && is_idle_domain(nextd))
-			return;
-		/*
-		 * We *should* be enabling faulting for PV control domains.
-		 *
-		 * The domain builder has now been updated to not depend on
-		 * seeing host CPUID values.  This makes it compatible with
-		 * PVH toolstack domains, and lets us enable faulting by
-		 * default for all PV domains.
-		 *
-		 * However, as PV control domains have never had faulting
-		 * enforced on them before, there might plausibly be other
-		 * dependenices on host CPUID data.  Therefore, we have left
-		 * an interim escape hatch in the form of
-		 * `dom0=no-cpuid-faulting` to restore the older behaviour.
-		 */
-		enable_cpuid_faulting = nextd && (opt_dom0_cpuid_faulting ||
-		                                  !is_control_domain(nextd) ||
-		                                  !is_pv_domain(nextd)) &&
-		                        (is_pv_domain(nextd) ||
-		                         next->arch.msrs->
-		                         misc_features_enables.cpuid_faulting);
-
-		if (cpu_has_cpuid_faulting)
-			set_cpuid_faulting(enable_cpuid_faulting);
-		else
-			amd_set_cpuid_user_dis(enable_cpuid_faulting);
-
-		return;
-	}
-
-	if (ctxt_switch_masking)
-		alternative_vcall(ctxt_switch_masking, next);
+    const struct domain *nextd = next ? next->domain : NULL;
+    bool enable_cpuid_faulting;
+
+    if ( cpu_has_cpuid_faulting ||
+         boot_cpu_has(X86_FEATURE_CPUID_USER_DIS) ) {
+        /*
+        * No need to alter the faulting setting if we are switching
+        * to idle; it won't affect any code running in idle context.
+        */
+        if (nextd && is_idle_domain(nextd))
+            return;
+        /*
+        * We *should* be enabling faulting for PV control domains.
+        *
+        * The domain builder has now been updated to not depend on
+        * seeing host CPUID values.  This makes it compatible with
+        * PVH toolstack domains, and lets us enable faulting by
+        * default for all PV domains.
+        *
+        * However, as PV control domains have never had faulting
+        * enforced on them before, there might plausibly be other
+        * dependenices on host CPUID data.  Therefore, we have left
+        * an interim escape hatch in the form of
+        * `dom0=no-cpuid-faulting` to restore the older behaviour.
+        */
+        enable_cpuid_faulting = nextd &&
+            domain_has_cap(nextd, CAP_DISABLE_CPU_FAULT) &&
+            (is_pv_domain(nextd) ||
+            next->arch.msrs->misc_features_enables.cpuid_faulting);
+
+        if (cpu_has_cpuid_faulting)
+            set_cpuid_faulting(enable_cpuid_faulting);
+        else
+            amd_set_cpuid_user_dis(enable_cpuid_faulting);
+
+        return;
+    }
+
+    if (ctxt_switch_masking)
+        alternative_vcall(ctxt_switch_masking, next);
 }
 
 bool_t opt_cpu_info;
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 4e20edc3bf..d65144da01 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -907,6 +907,10 @@ static struct domain *__init create_dom0(const module_t *image,
 
     d->role |= ROLE_UNBOUNDED_DOMAIN;
 
+    if ( !opt_dom0_cpuid_faulting &&
+         !domain_set_cap(d, CAP_DISABLE_CPU_FAULT) )
+        printk(XENLOG_WARNING "failed to set CPU faulting on Dom %pd\n", d);
+
     init_dom0_cpuid_policy(d);
 
     if ( alloc_dom0_vcpu0(d) == NULL )
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index b04fbe0565..ebfe65cd73 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -472,7 +472,8 @@ struct domain
 #define ROLE_HARDWARE_DOMAIN   (1U<<2)
 #define ROLE_XENSTORE_DOMAIN   (1U<<3)
     uint8_t          role;
-#define CAP_CONSOLE_IO  (1U<<0)
+#define CAP_CONSOLE_IO         (1U<<0)
+#define CAP_DISABLE_CPU_FAULT  (1U<<1)
     uint8_t          capabilities;
     /* Is this guest being debugged by dom0? */
     bool             debugger_attached;
@@ -1160,6 +1161,11 @@ static always_inline bool domain_set_cap(
     case CAP_CONSOLE_IO:
         d->capabilities |= cap;
         break;
+    case CAP_DISABLE_CPU_FAULT:
+        /* Disabling cpu faulting is only allowed for a PV control domain. */
+        if ( is_pv_domain(d) && is_control_domain(d) )
+            d->capabilities |= cap;
+        break;
     default:
         return false;
     }
-- 
2.20.1


