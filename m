Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE2D474D25
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 22:16:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247093.426102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxF9z-00077J-CN; Tue, 14 Dec 2021 21:16:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247093.426102; Tue, 14 Dec 2021 21:16:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxF9z-000745-8k; Tue, 14 Dec 2021 21:16:31 +0000
Received: by outflank-mailman (input) for mailman id 247093;
 Tue, 14 Dec 2021 21:16:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0izq=Q7=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mxF9x-00073z-MW
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 21:16:29 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 186a4ff5-5d23-11ec-85d3-df6b77346a89;
 Tue, 14 Dec 2021 22:16:27 +0100 (CET)
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
X-Inumbo-ID: 186a4ff5-5d23-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639516587;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4bkx3TwcUrdcOyHKGlZDOQ8jcimHx5KjsB2hX06YZ+w=;
  b=AgLLQ+KQAt41mgyXx9dUvi4XV7IHlV13/6e0E7x2MpoLngbP7lNPJMvH
   YD35wOyiqb22FIGadLXpRs0g4E0j6c7SlowXx/ILgdHWShd2bzFOz7Naw
   PyRbnPFjZR659f+DdyuerpQwgBRQ2tS1kk7f2fzNfa9OUXIvd02R/Zl4A
   k=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: yc5EX/TepT8qErSTbH/kFzv5IVH8vEsdsFvwsICzdzgm10SRZ3YIityZwzlHWnvAEuu6xgGSid
 HhEPWmJSJ1ILt6qO3xIIEaiR8IEPXQKJgQcjoOLIf0F4202xU4YjnUiBIQIvQlOXIEjCKVqSNo
 B+UVDRfTZKE7slYjerzBprF+Fc5jHuglBg63U4XC/br4QD0gQidqki4aNmI31YSRJx/Gx27aQX
 VNrk0aYz21dU4lT4f37rT2sxxzA6LZtXZTgJYSwG2HSlY/vIGOoZCLfE9j5oojfD8jHXAO3ES8
 4u6bWytdbS6s6i2LQm3DvdRM
X-SBRS: 5.1
X-MesageID: 59527717
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:vXI7KKwAh+y7lO7SoiV6t+fUwSrEfRIJ4+MujC+fZmUNrF6WrkUAx
 mNLWGHSbviNZGXxLtgja4+1p0gCvpbdmNU3TlQ++yAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500s6wbdl2tUAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt49Py
 tJ1v5aQcws0H7HXmcocbDpzIwgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVoru0lINPmI8U0vXZ4wCuCJf0nXYrCU+PB4towMDIY25ETR6mBP
 pVxhTxHcRjYeDBTan4rI7UvmLf4mz6jcGJSgQfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krK53/8Aw0aHNWHxCCZ72m3gevSgSL8XplUH7q9ntZ6jVvWymENBRk+UVqgveL/mkO4Q8hYK
 UEf5mwpt6da3G6BQ8T5Xha4iGWZpRNaUN1Ve9DW8ynUlPCSuVzAQDFZEHgRM7TKqfPaWxR16
 F2Op9njJQZjrZyJUnOz94i3hgObbH19wXA5WQcISg4M4t/GqY41jw7SQtsLLJNZnuEZChmrn
 WnU8XFWa6E7yJdSiv7lpQyvbyeE/8CRFmYIChPrsnVJB++TTKqsfMSW5FfS9p6sx67JHwDa7
 BDodyVzhd3i7K1hdgTREI3h/5nzvp5p1QEwZ3Y2TvHNEBz3pBaekXh4um0WGauQGp9slcXVS
 EHSoxhNw5RYIWGna6R6C6roVZ97kPC+S4S4Bq6OBjarXnSXXFXZlM2JTRTPt10BbWB2yf1vU
 XtlWZjE4Ykm5VRPk2PtGrZ1PU4DzSEi32LDLa0XPDz8uYdykEW9EO9fWHPXN7hRxPrd/G39r
 ocHX+PXmk43eLCvPUHqHXs7cAliwY4TXsut9aS6t4erf2JbJY3WI6OLnO56JdU6x/89eyWh1
 ijVZ3K0AWHX3RXvQThmoFg5AF82dZog/389IwI2OlOkhyoqbYq1tf9NfJorZ7g3sudkyKcsH
 fUCfsyBBNVJSyjGpGtBPcWs8tQ6eUT5nx+KMgqkfCM7I8xqSTvW94K2ZQDo7iQPUHa67JNsv
 7262wrHapMfXAA+Xt3OYfeiwgrp73gQke5/RWXSJdxXdBm++YRmMXWp3PQ2P9sNOVPIwT7Dj
 1SaBhIRpO/spY4p8YaW2fDY/tnxS+YnRxhUBWjW67qyJBL2xGv7zN8SSvuMcBDcSHjwpPeoa
 9JKwqyuK/YAhltL7dZxSu450aIk6tLzjLZG1QA4Tm7TZlGmB748cHmL2c5D6v9EyrND4FbkX
 0uO/p9ROKmTOdOjG1kUfVJ3YuOG3PASuz/T8fVqfxmquH4ppOKKARdIIh2BqC1BN78kYooqz
 NAotNMS9wHi2AEhNcyLj3wM+mmBRpDav37Lan3O7FfXtzcW
IronPort-HdrOrdr: A9a23:8VTiFaiP3Yf/k4tTvngCoGDglXBQXtYji2hC6mlwRA09TySZ//
 rBoB19726StN9xYgBFpTnuAsm9qB/nmaKdgrNhWItKPjOW21dARbsKheCJrgEIcxeOkNK1vp
 0AT0ERMrLN5CBB/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.88,206,1635220800"; 
   d="scan'208";a="59527717"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Daniel Smith
	<dpsmith@apertussolutions.com>
Subject: [PATCH] x86/cpuid: Introduce dom0-cpuid command line option
Date: Tue, 14 Dec 2021 21:16:00 +0000
Message-ID: <20211214211600.2751-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Specifically, this lets the user opt in to non-default for dom0.

Split features[] out of parse_xen_cpuid(), giving it a lightly more
appropraite name, so it can be shared with parse_xen_cpuid().

Collect all dom0 settings together in dom0_{en,dis}able_feat[], and apply it
to dom0's policy when other tweaks are being made.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Daniel Smith <dpsmith@apertussolutions.com>

RFC, because I think we've got a preexisting error with late hwdom here.  We
really should not be cobbering a late hwdom's settings (which were provided in
the usual way by the toolstack in dom0).

Furthermore, the distinction gets more murky in a hyperlaunch future where
multiple domains may be constructed by Xen, and there is reason to expect that
a full toolstack-like configuration is made available for them.

One option might be to remove the special case from init_domain_cpuid_policy()
and instead make a call into the cpuid code from create_dom0().  It would have
to be placed between domain_create() and alloc_dom0_vcpu0() for dynamic sizing
of the FPU block to work.  Thoughts?
---
 docs/misc/xen-command-line.pandoc |  16 ++++++
 xen/arch/x86/cpuid.c              | 114 +++++++++++++++++++++++++++++++++-----
 2 files changed, 115 insertions(+), 15 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index f7797ea233f9..1278f9c27597 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -801,6 +801,22 @@ Controls for how dom0 is constructed on x86 systems.
 
     If using this option is necessary to fix an issue, please report a bug.
 
+### dom0-cpuid
+    = List of comma separated booleans
+
+    Applicability: x86
+
+This option allows for fine tuning of the facilities dom0 will use, after
+accounting for hardware capabilities and Xen settings as enumerated via CPUID.
+
+Options are accepted in positive and negative form, to enable or disable
+specific features.  All selections via this mechanism are subject to normal
+CPU Policy safety logic.
+
+This option is intended for developers to opt dom0 into non-default features,
+and is not intended for use in production circumstances.  If using this option
+is necessary to fix an issue, please report a bug.
+
 ### dom0-iommu
     = List of [ passthrough=<bool>, strict=<bool>, map-inclusive=<bool>,
                 map-reserved=<bool>, none ]
diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 151944f65702..896bc1595317 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -26,17 +26,18 @@ static const uint32_t __initconst hvm_hap_def_featuremask[] =
     INIT_HVM_HAP_DEF_FEATURES;
 static const uint32_t deep_features[] = INIT_DEEP_FEATURES;
 
+static const struct feature_name {
+    const char *name;
+    unsigned int bit;
+} feature_names[] __initconstrel = INIT_FEATURE_NAMES;
+
 static int __init parse_xen_cpuid(const char *s)
 {
     const char *ss;
     int val, rc = 0;
 
     do {
-        static const struct feature {
-            const char *name;
-            unsigned int bit;
-        } features[] __initconstrel = INIT_FEATURE_NAMES;
-        const struct feature *lhs, *rhs, *mid = NULL /* GCC... */;
+        const struct feature_name *lhs, *rhs, *mid = NULL /* GCC... */;
         const char *feat;
 
         ss = strchr(s, ',');
@@ -49,8 +50,8 @@ static int __init parse_xen_cpuid(const char *s)
             feat += 3;
 
         /* (Re)initalise lhs and rhs for binary search. */
-        lhs = features;
-        rhs = features + ARRAY_SIZE(features);
+        lhs = feature_names;
+        rhs = feature_names + ARRAY_SIZE(feature_names);
 
         while ( lhs < rhs )
         {
@@ -97,6 +98,73 @@ static int __init parse_xen_cpuid(const char *s)
 }
 custom_param("cpuid", parse_xen_cpuid);
 
+static uint32_t __hwdom_initdata dom0_enable_feat[FSCAPINTS];
+static uint32_t __hwdom_initdata dom0_disable_feat[FSCAPINTS];
+
+static int __init parse_dom0_cpuid(const char *s)
+{
+    const char *ss;
+    int val, rc = 0;
+
+    do {
+        const struct feature_name *lhs, *rhs, *mid = NULL /* GCC... */;
+        const char *feat;
+
+        ss = strchr(s, ',');
+        if ( !ss )
+            ss = strchr(s, '\0');
+
+        /* Skip the 'no-' prefix for name comparisons. */
+        feat = s;
+        if ( strncmp(s, "no-", 3) == 0 )
+            feat += 3;
+
+        /* (Re)initalise lhs and rhs for binary search. */
+        lhs = feature_names;
+        rhs = feature_names + ARRAY_SIZE(feature_names);
+
+        while ( lhs < rhs )
+        {
+            int res;
+
+            mid = lhs + (rhs - lhs) / 2;
+            res = cmdline_strcmp(feat, mid->name);
+
+            if ( res < 0 )
+            {
+                rhs = mid;
+                continue;
+            }
+            if ( res > 0 )
+            {
+                lhs = mid + 1;
+                continue;
+            }
+
+            if ( (val = parse_boolean(mid->name, s, ss)) >= 0 )
+            {
+                __set_bit(mid->bit,
+                          val ? dom0_enable_feat : dom0_disable_feat);
+                mid = NULL;
+            }
+
+            break;
+        }
+
+        /*
+         * Mid being NULL means that the name and boolean were successfully
+         * identified.  Everything else is an error.
+         */
+        if ( mid )
+            rc = -EINVAL;
+
+        s = ss + 1;
+    } while ( *ss );
+
+    return rc;
+}
+custom_param("dom0-cpuid", parse_dom0_cpuid);
+
 #define EMPTY_LEAF ((struct cpuid_leaf){})
 static void zero_leaves(struct cpuid_leaf *l,
                         unsigned int first, unsigned int last)
@@ -727,17 +795,33 @@ int init_domain_cpuid_policy(struct domain *d)
     if ( !p )
         return -ENOMEM;
 
-    /* The hardware domain can't migrate.  Give it ITSC if available. */
     if ( is_hardware_domain(d) )
+    {
+        uint32_t fs[FSCAPINTS];
+        unsigned int i;
+
+        /* The hardware domain can't migrate.  Give it ITSC if available. */
         p->extd.itsc = cpu_has_itsc;
 
-    /*
-     * Expose the "hardware speculation behaviour" bits of ARCH_CAPS to dom0,
-     * so dom0 can turn off workarounds as appropriate.  Temporary, until the
-     * domain policy logic gains a better understanding of MSRs.
-     */
-    if ( is_hardware_domain(d) && cpu_has_arch_caps )
-        p->feat.arch_caps = true;
+        /*
+         * Expose the "hardware speculation behaviour" bits of ARCH_CAPS to
+         * dom0, so dom0 can turn off workarounds as appropriate.  Temporary,
+         * until the domain policy logic gains a better understanding of MSRs.
+         */
+        if ( cpu_has_arch_caps )
+            p->feat.arch_caps = true;
+
+        /* Apply dom0-cpuid= command line settings. */
+        cpuid_policy_to_featureset(p, fs);
+
+        for ( i = 0; i < ARRAY_SIZE(fs); ++i )
+        {
+            fs[i] |= dom0_enable_feat[i];
+            fs[i] &= ~dom0_disable_feat[i];
+        }
+
+        cpuid_featureset_to_policy(fs, p);
+    }
 
     d->arch.cpuid = p;
 
-- 
2.11.0


