Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 120DA703050
	for <lists+xen-devel@lfdr.de>; Mon, 15 May 2023 16:43:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534781.832168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyZQB-00026r-O2; Mon, 15 May 2023 14:43:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534781.832168; Mon, 15 May 2023 14:43:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyZQB-00024m-K6; Mon, 15 May 2023 14:43:31 +0000
Received: by outflank-mailman (input) for mailman id 534781;
 Mon, 15 May 2023 14:43:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uWdz=BE=citrix.com=prvs=492993889=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pyZQ9-0000CT-AZ
 for xen-devel@lists.xenproject.org; Mon, 15 May 2023 14:43:29 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dabed41e-f32e-11ed-b229-6b7b168915f2;
 Mon, 15 May 2023 16:43:28 +0200 (CEST)
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
X-Inumbo-ID: dabed41e-f32e-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684161808;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Fr/2qPrv6QELYt0rVeizVvUhPwwfLWM3DN3E6UnacdY=;
  b=Rg8A/N/184UXnPi5ozCmRmy7/CzDXYF1Fig7MtYhgU6o8F7lwy/OOQf6
   t1H3+bA/QnYY44yNV3cJw8o0Fdav9JI50oyEXp5JdrHhn2cPQ24vxbSMA
   OkXP0op0HCkPoWADZwTU+AU3tV21TLy063uoHd5rMAeVoFfvpUohnyXOf
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 111537999
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:Htmy667TGRBKaTyQxxGhegxRtDPHchMFZxGqfqrLsTDasY5as4F+v
 jFKXGiOaanbZmGjfNwgPIXl80NV6JeDzoU3QFc4+yxkHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7ZwehBtC5gZlPa0S4QeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m8
 6QydSwTdQG6lvuR+6iGbeRpu+18I5y+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrlD5fydVtxS+oq0v7nKI5AdwzKLsIJzefdniqcB9xx/B+
 zmZrjWoav0cHNKA2yOU7Vuyv6jWnCXcCbsdNZeg+tc/1TV/wURMUUZLBDNXu8KRlUqWS99Zb
 UsO9UIGvaU0sUCmUNT5dxm5u2Kf+A4RXcJKFO834x3LzbDbiy67LGUZSj9KaPQ9qdQ7Azct0
 ze0c8jBXGI19ufPEDTEq+nS9GnpUcQIEYMcTSlcZ1YZ/cLymZAqqSnVc/FuFZOc0dKgTFkc3
 Au2hCQ5grwSi+sC2KO64U3LjlqQm3TZcuImzl6JBzz4t2uVcKbgPtX1sgaDsZ6sOa7DFjG8U
 G44d99yBQzkJbWEj2SzTeoEB9lFDN7VYWSH0TaD83TMnglBGkJPn6gKulmSx28zaK7onAMFh
 2eN0T69HLcJYBOXgVZfOupd8fgCw6n6DsjCXfvJdNdIaZUZXFbZrH02NR/KgDu9yxBEfUQD1
 XCzIK6R4YsyU/w7nFJauc9HuVPU+szO7TyKHs2qp/hW+bGfeGSUWd84Dbd6VchgtPnsiFyMo
 75i2z6il003vBvWPnOGrub+7DkicRAGOHwBg5YKJ7/efFA3RDlJ5j246epJRrGJVp99zo/gl
 kxRkGcGmTITWVWvxd22V01e
IronPort-HdrOrdr: A9a23:JeYlJ6DFsTaguLPlHelc55DYdb4zR+YMi2TDt3oddfWaSKylfq
 GV7ZAmPHrP4gr5N0tOpTntAse9qBDnhPtICOsqTNSftWDd0QPFEGgL1+DfKlbbak/DH4BmtJ
 uICJIOb+EZDTJB/LrHCAvTKade/DFQmprY+9s3zB1WPHBXg7kL1XYeNu4CeHcGPjWvA/ACZe
 Ohz/sCnRWMU1INYP+2A3EUNtKz2uEixPrdEGY77wdM0nj0sQ+V
X-Talos-CUID: =?us-ascii?q?9a23=3AE9T8v2nv0wE1g2FfdJkhpO3QNuHXOXuF5irMPVS?=
 =?us-ascii?q?pMHdwb4aPdHid/Z5NzMU7zg=3D=3D?=
X-Talos-MUID: 9a23:QLo55wtiVZhqF41PlM2nii5wLdZ3yrqXT1kMl7JXgsalHzR8EmLI
X-IronPort-AV: E=Sophos;i="5.99,277,1677560400"; 
   d="scan'208";a="111537999"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 3/6] x86/cpu-policy: Infrastructure for MSR_ARCH_CAPS
Date: Mon, 15 May 2023 15:42:56 +0100
Message-ID: <20230515144259.1009245-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230515144259.1009245-1-andrew.cooper3@citrix.com>
References: <20230515144259.1009245-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Bits through 24 are already defined, meaning that we're not far off needing
the second word.  Put both in right away.

The bool bitfield names in the arch_caps union are unused, and somewhat out of
date.  They'll shortly be automatically generated.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 tools/misc/xen-cpuid.c                      | 10 ++++++++++
 xen/include/public/arch-x86/cpufeatureset.h |  4 ++++
 xen/include/xen/lib/x86/cpu-policy.h        | 18 ++++++++----------
 xen/lib/x86/cpuid.c                         |  4 ++++
 4 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index 8ec143ebc854..258584aafb9f 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -226,6 +226,14 @@ static const char *const str_7d2[32] =
     [ 4] = "bhi-ctrl",      [ 5] = "mcdt-no",
 };
 
+static const char *const str_10Al[32] =
+{
+};
+
+static const char *const str_10Ah[32] =
+{
+};
+
 static const struct {
     const char *name;
     const char *abbr;
@@ -248,6 +256,8 @@ static const struct {
     { "0x00000007:2.edx", "7d2", str_7d2 },
     { "0x00000007:1.ecx", "7c1", str_7c1 },
     { "0x00000007:1.edx", "7d1", str_7d1 },
+    { "0x0000010a.lo",   "10Al", str_10Al },
+    { "0x0000010a.hi",   "10Ah", str_10Ah },
 };
 
 #define COL_ALIGN "18"
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 8de73aebc3e0..032cec3ccba2 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -307,6 +307,10 @@ XEN_CPUFEATURE(AVX_VNNI_INT8,      15*32+ 4) /*A  AVX-VNNI-INT8 Instructions */
 XEN_CPUFEATURE(AVX_NE_CONVERT,     15*32+ 5) /*A  AVX-NE-CONVERT Instructions */
 XEN_CPUFEATURE(CET_SSS,            15*32+18) /*   CET Supervisor Shadow Stacks safe to use */
 
+/* Intel-defined CPU features, MSR_ARCH_CAPS 0x10a.eax, word 16 */
+
+/* Intel-defined CPU features, MSR_ARCH_CAPS 0x10a.edx, word 17 */
+
 #endif /* XEN_CPUFEATURE */
 
 /* Clean up from a default include.  Close the enum (for C). */
diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
index bfa425060464..9b51f8330f92 100644
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -20,6 +20,8 @@
 #define FEATURESET_7d2   13 /* 0x00000007:2.edx    */
 #define FEATURESET_7c1   14 /* 0x00000007:1.ecx    */
 #define FEATURESET_7d1   15 /* 0x00000007:1.edx    */
+#define FEATURESET_10Al  16 /* 0x0000010a.eax      */
+#define FEATURESET_10Ah  17 /* 0x0000010a.edx      */
 
 struct cpuid_leaf
 {
@@ -350,17 +352,13 @@ struct cpu_policy
      * fixed in hardware.
      */
     union {
-        uint32_t raw;
+        uint64_t raw;
+        struct {
+            uint32_t lo, hi;
+        };
         struct {
-            bool rdcl_no:1;
-            bool ibrs_all:1;
-            bool rsba:1;
-            bool skip_l1dfl:1;
-            bool ssb_no:1;
-            bool mds_no:1;
-            bool if_pschange_mc_no:1;
-            bool tsx_ctrl:1;
-            bool taa_no:1;
+            DECL_BITFIELD(10Al);
+            DECL_BITFIELD(10Ah);
         };
     } arch_caps;
 
diff --git a/xen/lib/x86/cpuid.c b/xen/lib/x86/cpuid.c
index 68aafb404927..a9f31858aeff 100644
--- a/xen/lib/x86/cpuid.c
+++ b/xen/lib/x86/cpuid.c
@@ -79,6 +79,8 @@ void x86_cpu_policy_to_featureset(
     fs[FEATURESET_7d2]       = p->feat._7d2;
     fs[FEATURESET_7c1]       = p->feat._7c1;
     fs[FEATURESET_7d1]       = p->feat._7d1;
+    fs[FEATURESET_10Al]      = p->arch_caps.lo;
+    fs[FEATURESET_10Ah]      = p->arch_caps.hi;
 }
 
 void x86_cpu_featureset_to_policy(
@@ -100,6 +102,8 @@ void x86_cpu_featureset_to_policy(
     p->feat._7d2             = fs[FEATURESET_7d2];
     p->feat._7c1             = fs[FEATURESET_7c1];
     p->feat._7d1             = fs[FEATURESET_7d1];
+    p->arch_caps.lo          = fs[FEATURESET_10Al];
+    p->arch_caps.hi          = fs[FEATURESET_10Ah];
 }
 
 void x86_cpu_policy_recalc_synth(struct cpu_policy *p)
-- 
2.30.2


