Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 109BC76E5A4
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 12:27:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576218.902131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRVYC-0001C8-A3; Thu, 03 Aug 2023 10:27:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576218.902131; Thu, 03 Aug 2023 10:27:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRVYC-00016L-6d; Thu, 03 Aug 2023 10:27:24 +0000
Received: by outflank-mailman (input) for mailman id 576218;
 Thu, 03 Aug 2023 10:27:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nYgs=DU=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qRVYB-0000aV-0i
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 10:27:23 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54644258-31e8-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 12:27:21 +0200 (CEST)
Received: from beta.station (net-188-218-251-179.cust.vodafonedsl.it
 [188.218.251.179])
 by support.bugseng.com (Postfix) with ESMTPSA id BD84F4EE0737;
 Thu,  3 Aug 2023 12:27:20 +0200 (CEST)
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
X-Inumbo-ID: 54644258-31e8-11ee-8613-37d641c3527e
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Gianluca Luparini <gianluca.luparini@bugseng.com>,
	Paul Durrant <paul@xen.org>,
	Wei Liu <wl@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [XEN PATCH 10/13] x86/viridian: address violations of MISRA C:2012 Rule 7.3
Date: Thu,  3 Aug 2023 12:22:25 +0200
Message-Id: <63f0d6385f302517244604af5536ffebd74ba589.1691053438.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691053438.git.simone.ballarin@bugseng.com>
References: <cover.1691053438.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gianluca Luparini <gianluca.luparini@bugseng.com>

The xen sources contain violations of MISRA C:2012 Rule 7.3 whose headline
states:
"The lowercase character 'l' shall not be used in a literal suffix".

Use the "L" suffix instead of the "l" suffix, to avoid potential ambiguity.
If the "u" suffix is used near "L", use the "U" suffix instead, for consistency.

The changes in this patch are mechanical.

Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
---
 xen/arch/x86/hvm/viridian/synic.c |  2 +-
 xen/arch/x86/hvm/viridian/time.c  | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/hvm/viridian/synic.c b/xen/arch/x86/hvm/viridian/synic.c
index 83d7addfc3..8cf600cec6 100644
--- a/xen/arch/x86/hvm/viridian/synic.c
+++ b/xen/arch/x86/hvm/viridian/synic.c
@@ -233,7 +233,7 @@ int viridian_synic_rdmsr(const struct vcpu *v, uint32_t idx, uint64_t *val)
          * should be set to. Assume everything but the bottom bit
          * should be zero.
          */
-        *val = 1ul;
+        *val = 1UL;
         break;
 
     case HV_X64_MSR_SIEFP:
diff --git a/xen/arch/x86/hvm/viridian/time.c b/xen/arch/x86/hvm/viridian/time.c
index a3ea3fa067..137577384f 100644
--- a/xen/arch/x86/hvm/viridian/time.c
+++ b/xen/arch/x86/hvm/viridian/time.c
@@ -66,7 +66,7 @@ static void update_reference_tsc(const struct domain *d, bool initialize)
      * The offset value is calculated on restore after migration and
      * ensures that Windows will not see a large jump in ReferenceTime.
      */
-    p->tsc_scale = ((10000ul << 32) / d->arch.tsc_khz) << 32;
+    p->tsc_scale = ((10000UL << 32) / d->arch.tsc_khz) << 32;
     p->tsc_offset = trc->off;
     smp_wmb();
 
@@ -79,7 +79,7 @@ static uint64_t trc_val(const struct domain *d, int64_t offset)
     uint64_t tsc, scale;
 
     tsc = hvm_get_guest_tsc(pt_global_vcpu_target(d));
-    scale = ((10000ul << 32) / d->arch.tsc_khz) << 32;
+    scale = ((10000UL << 32) / d->arch.tsc_khz) << 32;
 
     return hv_scale_tsc(tsc, scale, offset);
 }
@@ -201,7 +201,7 @@ static void start_stimer(struct viridian_stimer *vs)
     ASSERT(expiration - now > 0);
 
     vs->expiration = expiration;
-    timeout = (expiration - now) * 100ull;
+    timeout = (expiration - now) * 100ULL;
 
     vs->started = true;
     clear_bit(stimerx, &vv->stimer_pending);
@@ -413,14 +413,14 @@ int viridian_time_rdmsr(const struct vcpu *v, uint32_t idx, uint64_t *val)
         if ( viridian_feature_mask(d) & HVMPV_no_freq )
             return X86EMUL_EXCEPTION;
 
-        *val = (uint64_t)d->arch.tsc_khz * 1000ull;
+        *val = (uint64_t)d->arch.tsc_khz * 1000ULL;
         break;
 
     case HV_X64_MSR_APIC_FREQUENCY:
         if ( viridian_feature_mask(d) & HVMPV_no_freq )
             return X86EMUL_EXCEPTION;
 
-        *val = 1000000000ull / APIC_BUS_CYCLE_NS;
+        *val = 1000000000ULL / APIC_BUS_CYCLE_NS;
         break;
 
     case HV_X64_MSR_REFERENCE_TSC:
-- 
2.34.1


