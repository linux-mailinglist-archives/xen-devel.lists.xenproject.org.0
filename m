Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B069144EC9E
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 19:29:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225359.389172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlbI3-0001oj-2i; Fri, 12 Nov 2021 18:28:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225359.389172; Fri, 12 Nov 2021 18:28:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlbI2-0001mu-VT; Fri, 12 Nov 2021 18:28:42 +0000
Received: by outflank-mailman (input) for mailman id 225359;
 Fri, 12 Nov 2021 18:28:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=26E1=P7=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mlbI1-0001mj-9I
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 18:28:41 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a013735-43e6-11ec-a9d2-d9f7a1cc8784;
 Fri, 12 Nov 2021 19:28:39 +0100 (CET)
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
X-Inumbo-ID: 5a013735-43e6-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636741719;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bGdAXjFWHFJW93FqAFwh110hexLa/qf+khlOa4jllWM=;
  b=VTOkft7mVBAQP3coZ4JuhlSqJzladCivlieJ9n1wVrfNPQo/McBsDHSw
   /OOY8JTVcYC5FWfHyDi9fyq/DbHnCHKjr99e/D4043mOrI7VCr4ZEpGNm
   CukLLi2UXls7+WU0lrPFieqbP+mYCJH22A1x5fUW2ytyBTyZivYGxGr1Q
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: toTxyN/112DyqEDfWVehQ8zWjIV7Umo92ynfVz/OLMyJApcxvAY83rOpkltNsUy61k3vNINDLl
 taKt56BqTjEmkfKLpzoSDl6jJQPRqySw2jGIr5mcv6hWbFyhNzFTcyCQMApZS+0/okUuTxnq8g
 UHv26VH0P1CCvBbHlpM8tWVDDy2nzNHh8lgXzkpOcTrqnGQxT7bKt+ooFcAqlBCA9313oc20hr
 Zd9c//mZ9vBO2Eg5hUEZfy5Hra/DGIB/2cQT86ZDRMOR7oFloaXdS335nkZBxQjPxUJU9IPgWJ
 VUUIjqDbxvvrQDNaC9Z0wm+k
X-SBRS: 5.1
X-MesageID: 57240371
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:KLgj/qLGBs77+0HYFE+RHJIlxSXFcZb7ZxGr2PjKsXjdYENS1zVWn
 TcWC2qOafvYZDSmL9F1YNvk9khUupHXzoJjGlBlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZUideSc+EH140Es6wbZi6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2vlIFg7
 sUSjKWLZixwIajRuv5eFDRHRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFFgMg5IdatF4QYonx6lhnSDOo8QICFSKLPjTNd9Gpv3JwWRqmHD
 yYfQT1CbjrJOx1iAFQ4JLQakMP2t3ujUjIN/Tp5ooJoujOOnWSdyoPFL979atGMA8JPkS6wh
 EjL4mD4CREyL8GExHyO9XfErv/Cm2b3VZwfEJW89+V2mxuDy2oLEhoUWFCn5/6jhSaDt8l3c
 hJOvHB09O5rqRLtHoKVswCETGCsmBVNSvxATNQD0y6mk7XR/iSDRS8pUWsUADA5j/MeSTsv3
 16PutrmAz1zrbGYIU6gGqeoQSCaYnZMczJbDcMQZU5cuoS4/tlv5v7aZo87SPbdszHjJd3nL
 9lmRgAajq5bs8ME3r7TEbvv02P1/cihouLYC2zqsoOZAuFRONHNi2+AswGzARN8wGCxFATpU
 J8swZj20Qz2JcvR/BFhuc1UdF1T296LMSfHnXlkFIQ7+jKm9haLJN4Lvm8jeh0yaZdZI1cFh
 XM/XysLufe/21PwPcdKj3+ZUZx2ncAM6/y5PhwrUja+SscoL1LWlM2fTUWRw3rsgCARfVIXY
 v+mnTKXJS9CU8xPlWPuL89EiOND7n1ulAv7GMGgpzz6gOX2WZJgYepcWLd4Rrtit/3sTcS82
 4s3CvZmPD0DCrCjOXeOrtZIRb3IRFBiba3LRwVsXrbrCmJb9KsJUZc9GJstJN5ombp7jODN8
 i3vU0NU0gOn13bGNR+LejZob7a2BcRzqncyPCoNO1e02id8PdbzvflHL5ZnL6M68OFDzOJvS
 6VXccu3HfkSGC/M/C4QbMehodU6Jgirnw+HIwGsfCM7I8x7XwXM99K9Jlnv+SACAzCZr8w7p
 7H8hArXTYBaH1ZpDdrMaeLpxFS05CBPlOV3VkrOA99SZESzr9Q6d32v1qc6epheJw/Cyz2W0
 xetLS0Z/eSd8ZUo9NTphLyfq9v7GeVJAUcHTXLQ6qy7NHeG8zP7k5NASuuBYRvUSHjwpPe5f
 exQwvzxbK8HkVJNv9YuGrpn1/tjtd7mprscxQV4BnTbKV+sD+o4cHWB2MBOsIxLx6NY5lTqC
 h7epIECNOXbIt7hHX4QOBEhP7aK2vwjkzXP6eg4fRfh7yht8bvbCUhfMnFgUsCGwGeZ5G/9/
 dochQ==
IronPort-HdrOrdr: A9a23:Mpn87qqcSOCV30egA0FC53waV5oleYIsimQD101hICG9E/b1qy
 nKpp8mPHDP5wr5NEtPpTnjAsm9qALnlKKdiLN5Vd3OYOCMghrKEGgN1/qG/xTQXwH46+5Bxe
 NBXsFFebnN5IFB/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.87,230,1631592000"; 
   d="scan'208";a="57240371"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 3/3] x86/cpufreq: Drop opencoded CPUID handling from powernow
Date: Fri, 12 Nov 2021 18:28:18 +0000
Message-ID: <20211112182818.30223-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211112182818.30223-1-andrew.cooper3@citrix.com>
References: <20211112182818.30223-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Xen already collects CPUID.0x80000007.edx by default, meaning that we can
refer to per-cpu data directly.  This also avoids the need IPI the onlining
CPU to identify whether Core Performance Boost is available.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

I don't think the printk() is very helpful.  I could be talked into retaining
it as a prink_once(), but (irrespective of cpufreq_verbose), it doesn't want
repeating on each CPU because it will either be all or none of them.
---
 tools/misc/xen-cpuid.c                      |  3 ++-
 xen/arch/x86/acpi/cpufreq/powernow.c        | 26 ++++----------------------
 xen/include/asm-x86/cpufeature.h            |  1 +
 xen/include/public/arch-x86/cpufeatureset.h |  2 ++
 4 files changed, 9 insertions(+), 23 deletions(-)

diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index 37989e4a12f0..9b59fec26371 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -139,7 +139,8 @@ static const char *const str_7c0[32] =
 
 static const char *const str_e7d[32] =
 {
-    [ 8] = "itsc",
+    /* 6 */                    [ 7] = "hw-pstate",
+    [ 8] = "itsc",             [ 9] = "cpb",
     [10] = "efro",
 };
 
diff --git a/xen/arch/x86/acpi/cpufreq/powernow.c b/xen/arch/x86/acpi/cpufreq/powernow.c
index 82d7827e17c1..c39af2e23d1a 100644
--- a/xen/arch/x86/acpi/cpufreq/powernow.c
+++ b/xen/arch/x86/acpi/cpufreq/powernow.c
@@ -32,9 +32,6 @@
 #include <acpi/acpi.h>
 #include <acpi/cpufreq/cpufreq.h>
 
-#define CPUID_FREQ_VOLT_CAPABILITIES    0x80000007
-#define CPB_CAPABLE             0x00000200
-#define USE_HW_PSTATE           0x00000080
 #define HW_PSTATE_MASK          0x00000007
 #define HW_PSTATE_VALID_MASK    0x80000000
 #define HW_PSTATE_MAX_MASK      0x000000f0
@@ -200,21 +197,6 @@ static int powernow_cpufreq_verify(struct cpufreq_policy *policy)
     return cpufreq_frequency_table_verify(policy, data->freq_table);
 }
 
-static void feature_detect(void *info)
-{
-    struct cpufreq_policy *policy = info;
-    unsigned int edx;
-
-    edx = cpuid_edx(CPUID_FREQ_VOLT_CAPABILITIES);
-    if ((edx & CPB_CAPABLE) == CPB_CAPABLE) {
-        policy->turbo = CPUFREQ_TURBO_ENABLED;
-        if (cpufreq_verbose)
-            printk(XENLOG_INFO
-                   "CPU%u: Core Boost/Turbo detected and enabled\n",
-                   smp_processor_id());
-    }
-}
-
 static int powernow_cpufreq_cpu_init(struct cpufreq_policy *policy)
 {
     unsigned int i;
@@ -300,9 +282,9 @@ static int powernow_cpufreq_cpu_init(struct cpufreq_policy *policy)
     if (result)
         goto err_freqfree;
 
-    if (c->cpuid_level >= 6)
-        on_selected_cpus(cpumask_of(cpu), feature_detect, policy, 1);
-      
+    if ( cpu_has(c, X86_FEATURE_CPB) )
+        policy->turbo = CPUFREQ_TURBO_ENABLED;
+
     /*
      * the first call to ->target() should result in us actually
      * writing something to the appropriate registers.
@@ -348,7 +330,7 @@ unsigned int __init powernow_register_driver(void)
     if ( !(boot_cpu_data.x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
         return -ENODEV;
 
-    if ( !(cpuid_edx(CPUID_FREQ_VOLT_CAPABILITIES) & USE_HW_PSTATE) )
+    if ( !cpu_has_hw_pstate )
         return -ENODEV;
 
     return cpufreq_register_driver(&powernow_cpufreq_driver);
diff --git a/xen/include/asm-x86/cpufeature.h b/xen/include/asm-x86/cpufeature.h
index ba0fe7c0aa5f..4754940e23f3 100644
--- a/xen/include/asm-x86/cpufeature.h
+++ b/xen/include/asm-x86/cpufeature.h
@@ -122,6 +122,7 @@
 #define cpu_has_enqcmd          boot_cpu_has(X86_FEATURE_ENQCMD)
 
 /* CPUID level 0x80000007.edx */
+#define cpu_has_hw_pstate       boot_cpu_has(X86_FEATURE_HW_PSTATE)
 #define cpu_has_itsc            boot_cpu_has(X86_FEATURE_ITSC)
 
 /* CPUID level 0x80000008.ebx */
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index f11d5439aef7..d6260c801ab5 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -247,7 +247,9 @@ XEN_CPUFEATURE(MOVDIR64B,     6*32+28) /*a  MOVDIR64B instruction */
 XEN_CPUFEATURE(ENQCMD,        6*32+29) /*   ENQCMD{,S} instructions */
 
 /* AMD-defined CPU features, CPUID level 0x80000007.edx, word 7 */
+XEN_CPUFEATURE(HW_PSTATE,     7*32+ 7) /*   Hardware Pstates */
 XEN_CPUFEATURE(ITSC,          7*32+ 8) /*a  Invariant TSC */
+XEN_CPUFEATURE(CPB,           7*32+ 9) /*   Core Performance Boost (Turbo) */
 XEN_CPUFEATURE(EFRO,          7*32+10) /*   APERF/MPERF Read Only interface */
 
 /* AMD-defined CPU features, CPUID level 0x80000008.ebx, word 8 */
-- 
2.11.0


