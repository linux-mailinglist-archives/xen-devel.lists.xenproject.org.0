Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D7C5E6D5A
	for <lists+xen-devel@lfdr.de>; Thu, 22 Sep 2022 22:50:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410455.653454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obT7c-0006AW-ED; Thu, 22 Sep 2022 20:48:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410455.653454; Thu, 22 Sep 2022 20:48:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obT7c-000671-AI; Thu, 22 Sep 2022 20:48:36 +0000
Received: by outflank-mailman (input) for mailman id 410455;
 Thu, 22 Sep 2022 20:48:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f//a=ZZ=intel.com=tamas.lengyel@srs-se1.protection.inumbo.net>)
 id 1obT7b-00066v-3i
 for xen-devel@lists.xenproject.org; Thu, 22 Sep 2022 20:48:35 +0000
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9e1c964-3ab7-11ed-9647-05401a9f4f97;
 Thu, 22 Sep 2022 22:48:31 +0200 (CEST)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 13:48:20 -0700
Received: from denhamka-mobl.amr.corp.intel.com (HELO ubuntu.localdomain)
 ([10.212.34.17])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 13:48:19 -0700
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
X-Inumbo-ID: e9e1c964-3ab7-11ed-9647-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663879711; x=1695415711;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/oOaixrqmiYHuetWlbNHMDz+rF28ogSafa/whKFQpVo=;
  b=ayrHetsEs0BWXtiFF1Kp/qDtW/GrUymKjPP5edWcgkyWwmVbfKhov/Zl
   d5m8jvie9jBw9vJBSsGmx/5ms0lNuB6rRJgY7HgJoqkCd00LKUGT3ugjA
   RVi6w1nA4FtP5N1pzr+wBU4GT+6ifnMJJO04W95sk1B/fwk6/+Npz4+lh
   J7BK/ZtED1ZlDDOEBH6oGTbHI5IzUx/pMF7rGZSek5AuWo69eXZrSn6kn
   fcUTm6y4S6v2Q371SM28Zzge/qlpdcebvTxbkg4w64I3q1lxebVYgz654
   lH5EBqv+HYtfd2nTVeG9qnAFbBX//DesS22gPzx4JOO8pFTPEylYX/QX0
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="299150643"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="299150643"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="865030832"
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2] x86/vpmu: Fix race-condition in vpmu_load
Date: Thu, 22 Sep 2022 16:48:14 -0400
Message-Id: <86f8a095ff18e4dc41ecb9cef5153438158b91ce.1663878942.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vPMU code-bases attempts to perform an optimization on saving/reloading the
PMU context by keeping track of what vCPU ran on each pCPU. When a pCPU is
getting scheduled, checks if the previous vCPU isn't the current one. If so,
attempts a call to vpmu_save_force. Unfortunately if the previous vCPU is
already getting scheduled to run on another pCPU its state will be already
runnable, which results in an ASSERT failure.

Fix this by always performing a pmu context save in vpmu_save when called from
vpmu_switch_from, and do a vpmu_load when called from vpmu_switch_to.

While this presents a minimal overhead in case the same vCPU is getting
rescheduled on the same pCPU, the ASSERT failure is avoided and the code is a
lot easier to reason about.

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
---
 xen/arch/x86/cpu/vpmu.c | 43 +++++------------------------------------
 1 file changed, 5 insertions(+), 38 deletions(-)

diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
index cacc24a30f..64cdbfc48c 100644
--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -376,57 +376,24 @@ void vpmu_save(struct vcpu *v)
     vpmu->last_pcpu = pcpu;
     per_cpu(last_vcpu, pcpu) = v;
 
+    vpmu_set(vpmu, VPMU_CONTEXT_SAVE);
+
     if ( alternative_call(vpmu_ops.arch_vpmu_save, v, 0) )
         vpmu_reset(vpmu, VPMU_CONTEXT_LOADED);
 
+    vpmu_reset(vpmu, VPMU_CONTEXT_SAVE);
+
     apic_write(APIC_LVTPC, PMU_APIC_VECTOR | APIC_LVT_MASKED);
 }
 
 int vpmu_load(struct vcpu *v, bool_t from_guest)
 {
     struct vpmu_struct *vpmu = vcpu_vpmu(v);
-    int pcpu = smp_processor_id(), ret;
-    struct vcpu *prev = NULL;
+    int ret;
 
     if ( !vpmu_is_set(vpmu, VPMU_CONTEXT_ALLOCATED) )
         return 0;
 
-    /* First time this VCPU is running here */
-    if ( vpmu->last_pcpu != pcpu )
-    {
-        /*
-         * Get the context from last pcpu that we ran on. Note that if another
-         * VCPU is running there it must have saved this VPCU's context before
-         * startig to run (see below).
-         * There should be no race since remote pcpu will disable interrupts
-         * before saving the context.
-         */
-        if ( vpmu_is_set(vpmu, VPMU_CONTEXT_LOADED) )
-        {
-            on_selected_cpus(cpumask_of(vpmu->last_pcpu),
-                             vpmu_save_force, (void *)v, 1);
-            vpmu_reset(vpmu, VPMU_CONTEXT_LOADED);
-        }
-    } 
-
-    /* Prevent forced context save from remote CPU */
-    local_irq_disable();
-
-    prev = per_cpu(last_vcpu, pcpu);
-
-    if ( prev != v && prev )
-    {
-        vpmu = vcpu_vpmu(prev);
-
-        /* Someone ran here before us */
-        vpmu_save_force(prev);
-        vpmu_reset(vpmu, VPMU_CONTEXT_LOADED);
-
-        vpmu = vcpu_vpmu(v);
-    }
-
-    local_irq_enable();
-
     /* Only when PMU is counting, we load PMU context immediately. */
     if ( !vpmu_is_set(vpmu, VPMU_RUNNING) ||
          (!has_vlapic(vpmu_vcpu(vpmu)->domain) &&
-- 
2.34.1


