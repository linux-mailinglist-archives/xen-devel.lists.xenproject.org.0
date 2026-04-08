Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPhAHBuE1mmwFwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 18:36:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D76F43BEE99
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 18:36:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1276336.1561847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAVsh-0004WP-UR; Wed, 08 Apr 2026 16:35:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276336.1561847; Wed, 08 Apr 2026 16:35:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAVsh-0004UK-Rh; Wed, 08 Apr 2026 16:35:55 +0000
Received: by outflank-mailman (input) for mailman id 1276336;
 Wed, 08 Apr 2026 16:35:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wAVsf-0004UE-Un
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 16:35:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAVsd-006NwQ-BB
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 18:35:52 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69d683b6-2eae-0a2a0a5409dd-0a2a4501ddc8-34
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 18:35:52 +0200
Received: from [209.85.128.67] (helo=mail-wm1-f67.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69d683e8-6fc9-0a2a45010019-d1558043d0db-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 18:35:52 +0200
Received: by mail-wm1-f67.google.com with SMTP id
 5b1f17b1804b1-4889e045bc6so113215e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 09:35:52 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4d2738sm61201338f8f.24.2026.04.08.09.35.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2026 09:35:51 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1775666152; x=1776270952; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UN00C5w8mxxKS6BZsJBcm/d7Q6sznRAtUQSRYmu6l/8=;
        b=Bp8npXhrI4YjYq1Bj6SQMBRI4jk4GhUQ/bT87MLgs9i1kSXieNxUyGYxxlprzGGm4z
         UXLIYHkMDsY7VqmBc7QvxApxBCYHp5odkIKzi/5R8sk9M87PAtn1ld9NeqXvLmIYfSdp
         F0BjBiT/T+9zDv57DP8vlz1rhpZnuMz+XIXCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775666152; x=1776270952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UN00C5w8mxxKS6BZsJBcm/d7Q6sznRAtUQSRYmu6l/8=;
        b=ZR+aRKt+bdcJtGJKdU8FoyrGJvge1UK650N65Uk0Yv5X69y/9NLFEfZISYnGf/uTEc
         sTeeUstHwqi6dLHT9JVWjjrF2AzT/PvrbkPKDo9tYzCEbDydVDcv3gXZvO35EMbMi1ye
         0YXY/tV8n+Br+mINsB/VdibXN/9qGTG51lqU9IAbjydZhKF7uO2RjW0zV3T7h1ifO31E
         ZTB8aAnERxilWyP8N5dvjnvrlQbuIp3SHS/E959C/lNtiaWAKiUkHWrC7svdfwwhENrR
         NAGG3erFGL6Rsf/3PmE+BObNsdNDRLmMVGQkk/HJioSmP4Hsdpgqb9MNNFbPc9cfV/rn
         fiRw==
X-Gm-Message-State: AOJu0YwIbcE/GLeP8PghA9WGlammfBxP/8wKJWDeh9xr/d1aHgwcFs8l
	/r6a9nZS2wYhN5EWllAC7nKN/34I20CBCDcDM6kuCOlzTSow+DBKyuqs49oQipeKVvyLjoEmgUJ
	V3+vKbJFs6hf4
X-Gm-Gg: AeBDievE6OBve+oCRS7tpDatpaX1F+8sEkuEA6lc6BmrV/jeGI7c7j99ZL8EYukw0Nk
	4Qdoptyx6PMLUvXK5Wj5P61EW7n3L9Qe50cnRWpy3U/ewPSnobw8N78JQ9N70gHbdJ18ioonXjV
	dBaz7Eb+wwKlCsU8qvdKzphTGtNlAN1Rm6HXzfTCJVDkCYy5NN0tnIrZ4G4NR2+tm/+8hT9wcxU
	Zhwi+YcsmxfNviDW7DhDyBzAhMBRLZdQMrYZa3E3KVEb8Gypon4xoipDzEjwhz6Qa8y5HjKJ+Ef
	UTD4z9MB5U8HdY/Y8pzdkB82OHcsbE98WRFq45f1BrjVXxZpx3rogBOzrdh2nhitfOEy8ZpAfxP
	iLs6U7bddZcIGk1NrfAQKGagiSXaoVdvFbOpUo1236XCAvS7CPJi8GobkdzCtiVZxAMGC9F130K
	8nGJmHVF+C7gv/BbGvlqi8XFHfwV6fBXdnk4xDTVF3Gb+CXDkIlLGdDCvk39bi6ZGReiCVCYk5i
	L/v
X-Received: by 2002:a05:600c:858c:b0:488:9439:880d with SMTP id 5b1f17b1804b1-488cd087322mr5197785e9.29.1775666151565;
        Wed, 08 Apr 2026 09:35:51 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] x86/gen-cpuid: Split deep_features by vendor
Date: Wed,  8 Apr 2026 17:35:49 +0100
Message-Id: <20260408163549.135245-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1775666152-150E0185-2BB1BED4/0/0
X-purgate-type: clean
X-purgate-size: 8689
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:email,citrix.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D76F43BEE99
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

AMD CPUs need LKGS depend on NSCB, but this dependency cannot be unconditional
as it will break FRED on Intel CPUs which don't need to enumerate the absence
of a bug.

The deep dependecy logic is formed of two parts; a deep_features bitmap
indicating which features have dependencies, and deep_deps; the mapping of
feature to dependent features.  Given that NSCB is an unconnected root of a
dependency, we can have the row in deep_deps and conditionally exclude it the
deep_features level.

Rename INIT_DEEP_FEATURES to INIT_ALL_DEEP_FEATURES and add AMD and INTEL
forms too.  In both xc_cpuid_apply_policy() and sanitise_featureset(), choose
the appropriate {amd,intel}_deep_features based on vendor.

Introduce the NSCB <-> LKGS dependency and exclude the NSCB row from
intel_deep_features.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Teddy Astie <teddy.astie@vates.tech>

Only compile tested so far.
---
 tools/libs/guest/xg_cpuid_x86.c             | 14 +++++++++++++-
 xen/arch/x86/cpu-policy.c                   | 16 ++++++++++++++--
 xen/arch/x86/lib/cpu-policy/cpuid.c         |  2 +-
 xen/include/public/arch-x86/cpufeatureset.h |  2 +-
 xen/tools/gen-cpuid.py                      | 20 +++++++++++++++++---
 5 files changed, 46 insertions(+), 8 deletions(-)

diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 0db6d77cd801..0b00672c4762 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -650,9 +650,12 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
 
     if ( featureset )
     {
+        static const uint32_t amd_deep_features[] =  INIT_AMD_DEEP_FEATURES;
+        static const uint32_t intel_deep_features[] =  INIT_INTEL_DEEP_FEATURES;
+
+        const uint32_t *deep_features;
         uint32_t disabled_features[FEATURESET_NR_ENTRIES],
             feat[FEATURESET_NR_ENTRIES] = {};
-        static const uint32_t deep_features[] = INIT_DEEP_FEATURES;
         unsigned int i, b;
 
         /*
@@ -670,6 +673,15 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
 
         memcpy(feat, featureset, sizeof(*featureset) * user_len);
 
+        /*
+         * At the time of writing, amd_deep_features contains one extra
+         * dependency over intel for a "hardware no longer has this bug" bit.
+         */
+        if ( p->policy.x86_vendor & (X86_VENDOR_AMD|X86_VENDOR_HYGON) )
+            deep_features = amd_deep_features;
+        else
+            deep_features = intel_deep_features;
+
         /* Disable deep dependencies of disabled features. */
         for ( i = 0; i < ARRAY_SIZE(disabled_features); ++i )
             disabled_features[i] = ~feat[i] & deep_features[i];
diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 5273fe0ae435..2228c52ffc79 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -39,7 +39,8 @@ static const uint32_t __initconst hvm_shadow_def_featuremask[] =
     INIT_HVM_SHADOW_DEF_FEATURES;
 static const uint32_t __initconst hvm_hap_def_featuremask[] =
     INIT_HVM_HAP_DEF_FEATURES;
-static const uint32_t deep_features[] = INIT_DEEP_FEATURES;
+static const uint32_t amd_deep_features[] = INIT_AMD_DEEP_FEATURES;
+static const uint32_t intel_deep_features[] = INIT_INTEL_DEEP_FEATURES;
 
 static const struct feature_name {
     const char *name;
@@ -158,11 +159,21 @@ static void zero_leaves(struct cpuid_leaf *l,
 
 static void sanitise_featureset(uint32_t *fs)
 {
+    const uint32_t *deep_features;
     /* bitmap_for_each() uses unsigned longs.  Extend with zeroes. */
     uint32_t disabled_features[
         ROUNDUP(FSCAPINTS, sizeof(unsigned long)/sizeof(uint32_t))] = {};
     unsigned int i;
 
+    /*
+     * At the time of writing, amd_deep_features contains one extra dependency
+     * over intel for a "hardware no longer has this bug" bit.
+     */
+    if ( boot_cpu_data.vendor & (X86_VENDOR_AMD|X86_VENDOR_HYGON) )
+        deep_features = amd_deep_features;
+    else
+        deep_features = intel_deep_features;
+
     for ( i = 0; i < FSCAPINTS; ++i )
     {
         /* Clamp to known mask. */
@@ -1110,7 +1121,8 @@ static void __init __maybe_unused build_assertions(void)
     BUILD_BUG_ON(ARRAY_SIZE(pv_max_featuremask) != FSCAPINTS);
     BUILD_BUG_ON(ARRAY_SIZE(hvm_shadow_max_featuremask) != FSCAPINTS);
     BUILD_BUG_ON(ARRAY_SIZE(hvm_hap_max_featuremask) != FSCAPINTS);
-    BUILD_BUG_ON(ARRAY_SIZE(deep_features) != FSCAPINTS);
+    BUILD_BUG_ON(ARRAY_SIZE(amd_deep_features) != FSCAPINTS);
+    BUILD_BUG_ON(ARRAY_SIZE(intel_deep_features) != FSCAPINTS);
 
     /* Find some more clever allocation scheme if this trips. */
     BUILD_BUG_ON(sizeof(struct cpu_policy) > PAGE_SIZE);
diff --git a/xen/arch/x86/lib/cpu-policy/cpuid.c b/xen/arch/x86/lib/cpu-policy/cpuid.c
index 3162e795bc21..73ea68690b4a 100644
--- a/xen/arch/x86/lib/cpu-policy/cpuid.c
+++ b/xen/arch/x86/lib/cpu-policy/cpuid.c
@@ -293,7 +293,7 @@ void x86_cpu_policy_clear_out_of_range_leaves(struct cpu_policy *p)
 
 const uint32_t *x86_cpu_policy_lookup_deep_deps(uint32_t feature)
 {
-    static const uint32_t deep_features[] = INIT_DEEP_FEATURES;
+    static const uint32_t deep_features[] = INIT_ALL_DEEP_FEATURES;
     static const struct {
         uint32_t feature;
         uint32_t fs[FEATURESET_NR_ENTRIES];
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index c4d3276f2f89..acee5a0544a0 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -326,7 +326,7 @@ XEN_CPUFEATURE(NO_NEST_BP,         11*32+ 0) /*A  No Nested Data Breakpoints */
 XEN_CPUFEATURE(FS_GS_NS,           11*32+ 1) /*S| FS/GS base MSRs non-serialising */
 XEN_CPUFEATURE(LFENCE_DISPATCH,    11*32+ 2) /*A  LFENCE always serializing */
 XEN_CPUFEATURE(VERW_CLEAR,         11*32+ 5) /*!A| VERW clears microarchitectural buffers */
-XEN_CPUFEATURE(NSCB,               11*32+ 6) /*A  Null Selector Clears Base (and limit too) */
+XEN_CPUFEATURE(NSCB,               11*32+ 6) /*!A Null Selector Clears Base (and limit too) */
 XEN_CPUFEATURE(AUTO_IBRS,          11*32+ 8) /*S  Automatic IBRS */
 XEN_CPUFEATURE(AMD_FSRS,           11*32+10) /*A  Fast Short REP STOSB */
 XEN_CPUFEATURE(AMD_FSRC,           11*32+11) /*A  Fast Short REP CMPSB */
diff --git a/xen/tools/gen-cpuid.py b/xen/tools/gen-cpuid.py
index 13d85a43482a..a0fff6c45676 100755
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -344,6 +344,12 @@ def crunch_numbers(state):
         # The ARCH_CAPS CPUID bit enumerates the availability of the whole register.
         ARCH_CAPS: feat_range(RDCL_NO, RDCL_NO + 63),
 
+        # AMD-only special case.  NullSelectorClearsBase is really a "hardware
+        # doesn't have this bug any more" bit.  All FRED-capable hardware has
+        # NSCB properties, so disallow configurations which would cause LGKS
+        # to behave unexpectedly.
+        NSCB: [LKGS],
+
         # The behaviour described by RRSBA depend on eIBRS being active.
         EIBRS: [RRSBA],
 
@@ -383,9 +389,13 @@ def crunch_numbers(state):
 
         state.deep_deps[feat] = seen
 
-    state.deep_features = deps.keys()
     state.nr_deep_deps = len(state.deep_deps.keys())
 
+    # deep_features is split per vendor to exlcude certain rows from
+    # processing.
+    state.all_deep_features = set(deps.keys())
+    state.intel_deep_features = state.all_deep_features - set((NSCB, ))
+
     # Calculate the bitfield name declarations.  Leave 4 placeholders on the end
     for word in range(state.nr_entries + 4):
 
@@ -447,7 +457,10 @@ def write_results(state):
 
 #define NR_DEEP_DEPS %sU
 
-#define INIT_DEEP_FEATURES { \\\n%s\n}
+#define INIT_ALL_DEEP_FEATURES { \\\n%s\n}
+
+#define INIT_AMD_DEEP_FEATURES INIT_ALL_DEEP_FEATURES
+#define INIT_INTEL_DEEP_FEATURES { \\\n%s\n}
 
 #define INIT_DEEP_DEPS { \\
 """ % (state.nr_entries,
@@ -462,7 +475,8 @@ def write_results(state):
        format_uint32s(state, state.hvm_hap_def, 4),
        format_uint32s(state, state.hvm_hap_max, 4),
        state.nr_deep_deps,
-       format_uint32s(state, state.deep_features, 4),
+       format_uint32s(state, state.all_deep_features, 4),
+       format_uint32s(state, state.intel_deep_features, 4),
        ))
 
     for dep in sorted(state.deep_deps.keys()):
-- 
2.39.5


