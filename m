Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 171C3220A4E
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 12:41:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jveqN-000222-0A; Wed, 15 Jul 2020 10:40:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9G22=A2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jveqM-00021v-4J
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 10:40:54 +0000
X-Inumbo-ID: a7d60e16-c687-11ea-93b5-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a7d60e16-c687-11ea-93b5-12813bfff9fa;
 Wed, 15 Jul 2020 10:40:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8A10BB1F7;
 Wed, 15 Jul 2020 10:40:55 +0000 (UTC)
Subject: [PATCH 6/8] x86: move domain_cpu_policy_changed()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3375cacd-d3b7-9f06-44a7-4b684b6a77d6@suse.com>
Message-ID: <2ec231cd-a6bb-af88-1019-695eefced925@suse.com>
Date: Wed, 15 Jul 2020 12:40:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3375cacd-d3b7-9f06-44a7-4b684b6a77d6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is in preparation of making the building of domctl.c conditional.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -294,6 +294,173 @@ void update_guest_memory_policy(struct v
     }
 }
 
+void domain_cpu_policy_changed(struct domain *d)
+{
+    const struct cpuid_policy *p = d->arch.cpuid;
+    struct vcpu *v;
+
+    if ( is_pv_domain(d) )
+    {
+        if ( ((levelling_caps & LCAP_1cd) == LCAP_1cd) )
+        {
+            uint64_t mask = cpuidmask_defaults._1cd;
+            uint32_t ecx = p->basic._1c;
+            uint32_t edx = p->basic._1d;
+
+            /*
+             * Must expose hosts HTT and X2APIC value so a guest using native
+             * CPUID can correctly interpret other leaves which cannot be
+             * masked.
+             */
+            if ( cpu_has_x2apic )
+                ecx |= cpufeat_mask(X86_FEATURE_X2APIC);
+            if ( cpu_has_htt )
+                edx |= cpufeat_mask(X86_FEATURE_HTT);
+
+            switch ( boot_cpu_data.x86_vendor )
+            {
+            case X86_VENDOR_INTEL:
+                /*
+                 * Intel masking MSRs are documented as AND masks.
+                 * Experimentally, they are applied after OSXSAVE and APIC
+                 * are fast-forwarded from real hardware state.
+                 */
+                mask &= ((uint64_t)edx << 32) | ecx;
+
+                if ( ecx & cpufeat_mask(X86_FEATURE_XSAVE) )
+                    ecx = cpufeat_mask(X86_FEATURE_OSXSAVE);
+                else
+                    ecx = 0;
+                edx = cpufeat_mask(X86_FEATURE_APIC);
+
+                mask |= ((uint64_t)edx << 32) | ecx;
+                break;
+
+            case X86_VENDOR_AMD:
+            case X86_VENDOR_HYGON:
+                mask &= ((uint64_t)ecx << 32) | edx;
+
+                /*
+                 * AMD masking MSRs are documented as overrides.
+                 * Experimentally, fast-forwarding of the OSXSAVE and APIC
+                 * bits from real hardware state only occurs if the MSR has
+                 * the respective bits set.
+                 */
+                if ( ecx & cpufeat_mask(X86_FEATURE_XSAVE) )
+                    ecx = cpufeat_mask(X86_FEATURE_OSXSAVE);
+                else
+                    ecx = 0;
+                edx = cpufeat_mask(X86_FEATURE_APIC);
+
+                /*
+                 * If the Hypervisor bit is set in the policy, we can also
+                 * forward it into real CPUID.
+                 */
+                if ( p->basic.hypervisor )
+                    ecx |= cpufeat_mask(X86_FEATURE_HYPERVISOR);
+
+                mask |= ((uint64_t)ecx << 32) | edx;
+                break;
+            }
+
+            d->arch.pv.cpuidmasks->_1cd = mask;
+        }
+
+        if ( ((levelling_caps & LCAP_6c) == LCAP_6c) )
+        {
+            uint64_t mask = cpuidmask_defaults._6c;
+
+            if ( boot_cpu_data.x86_vendor == X86_VENDOR_AMD )
+                mask &= (~0ULL << 32) | p->basic.raw[6].c;
+
+            d->arch.pv.cpuidmasks->_6c = mask;
+        }
+
+        if ( ((levelling_caps & LCAP_7ab0) == LCAP_7ab0) )
+        {
+            uint64_t mask = cpuidmask_defaults._7ab0;
+
+            /*
+             * Leaf 7[0].eax is max_subleaf, not a feature mask.  Take it
+             * wholesale from the policy, but clamp the features in 7[0].ebx
+             * per usual.
+             */
+            if ( boot_cpu_data.x86_vendor &
+                 (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
+                mask = (((uint64_t)p->feat.max_subleaf << 32) |
+                        ((uint32_t)mask & p->feat._7b0));
+
+            d->arch.pv.cpuidmasks->_7ab0 = mask;
+        }
+
+        if ( ((levelling_caps & LCAP_Da1) == LCAP_Da1) )
+        {
+            uint64_t mask = cpuidmask_defaults.Da1;
+            uint32_t eax = p->xstate.Da1;
+
+            if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
+                mask &= (~0ULL << 32) | eax;
+
+            d->arch.pv.cpuidmasks->Da1 = mask;
+        }
+
+        if ( ((levelling_caps & LCAP_e1cd) == LCAP_e1cd) )
+        {
+            uint64_t mask = cpuidmask_defaults.e1cd;
+            uint32_t ecx = p->extd.e1c;
+            uint32_t edx = p->extd.e1d;
+
+            /*
+             * Must expose hosts CMP_LEGACY value so a guest using native
+             * CPUID can correctly interpret other leaves which cannot be
+             * masked.
+             */
+            if ( cpu_has_cmp_legacy )
+                ecx |= cpufeat_mask(X86_FEATURE_CMP_LEGACY);
+
+            /*
+             * If not emulating AMD or Hygon, clear the duplicated features
+             * in e1d.
+             */
+            if ( !(p->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
+                edx &= ~CPUID_COMMON_1D_FEATURES;
+
+            switch ( boot_cpu_data.x86_vendor )
+            {
+            case X86_VENDOR_INTEL:
+                mask &= ((uint64_t)edx << 32) | ecx;
+                break;
+
+            case X86_VENDOR_AMD:
+            case X86_VENDOR_HYGON:
+                mask &= ((uint64_t)ecx << 32) | edx;
+
+                /*
+                 * Fast-forward bits - Must be set in the masking MSR for
+                 * fast-forwarding to occur in hardware.
+                 */
+                ecx = 0;
+                edx = cpufeat_mask(X86_FEATURE_APIC);
+
+                mask |= ((uint64_t)ecx << 32) | edx;
+                break;
+            }
+
+            d->arch.pv.cpuidmasks->e1cd = mask;
+        }
+    }
+
+    for_each_vcpu ( d, v )
+    {
+        cpuid_policy_updated(v);
+
+        /* If PMU version is zero then the guest doesn't have VPMU */
+        if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL &&
+             p->basic.pmu_version == 0 )
+            vpmu_destroy(v);
+    }
+}
+
 #ifndef CONFIG_BIGMEM
 /*
  * The hole may be at or above the 44-bit boundary, so we need to determine
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -49,173 +49,6 @@ static int gdbsx_guest_mem_io(domid_t do
 }
 #endif
 
-void domain_cpu_policy_changed(struct domain *d)
-{
-    const struct cpuid_policy *p = d->arch.cpuid;
-    struct vcpu *v;
-
-    if ( is_pv_domain(d) )
-    {
-        if ( ((levelling_caps & LCAP_1cd) == LCAP_1cd) )
-        {
-            uint64_t mask = cpuidmask_defaults._1cd;
-            uint32_t ecx = p->basic._1c;
-            uint32_t edx = p->basic._1d;
-
-            /*
-             * Must expose hosts HTT and X2APIC value so a guest using native
-             * CPUID can correctly interpret other leaves which cannot be
-             * masked.
-             */
-            if ( cpu_has_x2apic )
-                ecx |= cpufeat_mask(X86_FEATURE_X2APIC);
-            if ( cpu_has_htt )
-                edx |= cpufeat_mask(X86_FEATURE_HTT);
-
-            switch ( boot_cpu_data.x86_vendor )
-            {
-            case X86_VENDOR_INTEL:
-                /*
-                 * Intel masking MSRs are documented as AND masks.
-                 * Experimentally, they are applied after OSXSAVE and APIC
-                 * are fast-forwarded from real hardware state.
-                 */
-                mask &= ((uint64_t)edx << 32) | ecx;
-
-                if ( ecx & cpufeat_mask(X86_FEATURE_XSAVE) )
-                    ecx = cpufeat_mask(X86_FEATURE_OSXSAVE);
-                else
-                    ecx = 0;
-                edx = cpufeat_mask(X86_FEATURE_APIC);
-
-                mask |= ((uint64_t)edx << 32) | ecx;
-                break;
-
-            case X86_VENDOR_AMD:
-            case X86_VENDOR_HYGON:
-                mask &= ((uint64_t)ecx << 32) | edx;
-
-                /*
-                 * AMD masking MSRs are documented as overrides.
-                 * Experimentally, fast-forwarding of the OSXSAVE and APIC
-                 * bits from real hardware state only occurs if the MSR has
-                 * the respective bits set.
-                 */
-                if ( ecx & cpufeat_mask(X86_FEATURE_XSAVE) )
-                    ecx = cpufeat_mask(X86_FEATURE_OSXSAVE);
-                else
-                    ecx = 0;
-                edx = cpufeat_mask(X86_FEATURE_APIC);
-
-                /*
-                 * If the Hypervisor bit is set in the policy, we can also
-                 * forward it into real CPUID.
-                 */
-                if ( p->basic.hypervisor )
-                    ecx |= cpufeat_mask(X86_FEATURE_HYPERVISOR);
-
-                mask |= ((uint64_t)ecx << 32) | edx;
-                break;
-            }
-
-            d->arch.pv.cpuidmasks->_1cd = mask;
-        }
-
-        if ( ((levelling_caps & LCAP_6c) == LCAP_6c) )
-        {
-            uint64_t mask = cpuidmask_defaults._6c;
-
-            if ( boot_cpu_data.x86_vendor == X86_VENDOR_AMD )
-                mask &= (~0ULL << 32) | p->basic.raw[6].c;
-
-            d->arch.pv.cpuidmasks->_6c = mask;
-        }
-
-        if ( ((levelling_caps & LCAP_7ab0) == LCAP_7ab0) )
-        {
-            uint64_t mask = cpuidmask_defaults._7ab0;
-
-            /*
-             * Leaf 7[0].eax is max_subleaf, not a feature mask.  Take it
-             * wholesale from the policy, but clamp the features in 7[0].ebx
-             * per usual.
-             */
-            if ( boot_cpu_data.x86_vendor &
-                 (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
-                mask = (((uint64_t)p->feat.max_subleaf << 32) |
-                        ((uint32_t)mask & p->feat._7b0));
-
-            d->arch.pv.cpuidmasks->_7ab0 = mask;
-        }
-
-        if ( ((levelling_caps & LCAP_Da1) == LCAP_Da1) )
-        {
-            uint64_t mask = cpuidmask_defaults.Da1;
-            uint32_t eax = p->xstate.Da1;
-
-            if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
-                mask &= (~0ULL << 32) | eax;
-
-            d->arch.pv.cpuidmasks->Da1 = mask;
-        }
-
-        if ( ((levelling_caps & LCAP_e1cd) == LCAP_e1cd) )
-        {
-            uint64_t mask = cpuidmask_defaults.e1cd;
-            uint32_t ecx = p->extd.e1c;
-            uint32_t edx = p->extd.e1d;
-
-            /*
-             * Must expose hosts CMP_LEGACY value so a guest using native
-             * CPUID can correctly interpret other leaves which cannot be
-             * masked.
-             */
-            if ( cpu_has_cmp_legacy )
-                ecx |= cpufeat_mask(X86_FEATURE_CMP_LEGACY);
-
-            /*
-             * If not emulating AMD or Hygon, clear the duplicated features
-             * in e1d.
-             */
-            if ( !(p->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
-                edx &= ~CPUID_COMMON_1D_FEATURES;
-
-            switch ( boot_cpu_data.x86_vendor )
-            {
-            case X86_VENDOR_INTEL:
-                mask &= ((uint64_t)edx << 32) | ecx;
-                break;
-
-            case X86_VENDOR_AMD:
-            case X86_VENDOR_HYGON:
-                mask &= ((uint64_t)ecx << 32) | edx;
-
-                /*
-                 * Fast-forward bits - Must be set in the masking MSR for
-                 * fast-forwarding to occur in hardware.
-                 */
-                ecx = 0;
-                edx = cpufeat_mask(X86_FEATURE_APIC);
-
-                mask |= ((uint64_t)ecx << 32) | edx;
-                break;
-            }
-
-            d->arch.pv.cpuidmasks->e1cd = mask;
-        }
-    }
-
-    for_each_vcpu ( d, v )
-    {
-        cpuid_policy_updated(v);
-
-        /* If PMU version is zero then the guest doesn't have VPMU */
-        if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL &&
-             p->basic.pmu_version == 0 )
-            vpmu_destroy(v);
-    }
-}
-
 static int update_domain_cpu_policy(struct domain *d,
                                     xen_domctl_cpu_policy_t *xdpc)
 {


