Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 774F34AE066
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 19:10:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268586.462473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHUwH-0004Z8-Lk; Tue, 08 Feb 2022 18:10:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268586.462473; Tue, 08 Feb 2022 18:10:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHUwH-0004MA-7P; Tue, 08 Feb 2022 18:10:05 +0000
Received: by outflank-mailman (input) for mailman id 268586;
 Tue, 08 Feb 2022 18:10:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1rHF=SX=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nHUwF-0003Sy-8I
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 18:10:03 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 556eab12-890a-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 19:10:02 +0100 (CET)
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
X-Inumbo-ID: 556eab12-890a-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644343801;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=g1RCjDDHjvfnqi0gWZply1NwpJ3g8mhDOmKHxuxunaU=;
  b=YNigv7NUKC92uoYDVpCcGO1N/GDVbSL7ZU2mb15D4jy1nYYQWSvDdgVz
   jHlgYKu8iBFaxM4e7+CdHbugnwk2DhLm7Dl2wyHir7jnsWnnncR4r0/Nb
   7/zXhAfxVmDu6KLBu3p/MLUhmDR3CZ29PQS13bVJk9Ww1GVmemPoWduMG
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: PeEkcvONsdQdzoHVRVqMhiksONHdZ43648AKJhApLzEufq3XLmeSFgUunjiEofJUQmB0THWPZ4
 SkxE4MFyMQuxaysvW0dyOnrgPVkWWpOhUvSGr9YnfATARq2KWVda1p6IkVrG28grF0o7G37wNk
 +FRNFdmOnxW3Ndz1c3gVfPCPSiyw089wtNwG5S8eFBxy9qBTiG1AUzNBlanfLUKO4KtgOCsUsa
 tUUXKUsiR4BjsbiT0GLpo1i6x9UojawRusiI7CKUoIPWuLzvKmXD00bGMyAzZWFdMrX6VPjj/2
 iw5uIJDUw7vHj0JEoVr71T3b
X-SBRS: 5.1
X-MesageID: 63762636
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:RJxsDaC9O6K1WRVW/wrkw5YqxClBgxIJ4kV8jS/XYbTApGgigzIHn
 2tJUW+Aa/eDYDSgL4pxPIyy8BwO78DczYM3QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WL6s1hxZH1c+En970UI7wYbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/iDm1hO18w
 s9xk6ezFyAtDvzFtvUPekwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTY+9gnMk8auLsO5sSoCpIxjDFF/c2B5vERs0m4PcGh2hu3J4VQ54yY
 eJCcAdeRyj9RSdyAQ83WbUYhru21n7wJmgwRFW9+vNsvjm7IBZK+KjgNp/Zd8KHQe1Rn12Ev
 STW8mLhGBYYOdeDjz2f/RqRavTnxH2hHthITfvhq6As0Ab7KnEv5AM+VleHusS0gFSCfelcd
 WsQynsng7kg3Rn+JjXiZCGQrHmBtx8aftNfFewm9Q2AopbpDxal6nssFWAYNoF/3CMibXlzj
 wLSwYu1bdB6mODNERqgGqGoQSRe0MT/BUsLfmc6QAQM+LEPS6lj30uUHr6P/ENY5+AZ+A0cI
 RjX9kDSZJ1J1KbnMplXGnid0lqRSmDhFFJd2+kudjvNAvlFTICkfZe0zlPQ8OxNKo2UJnHY4
 iRYwpnHtb5fV8jW/MBofAnqNOv4j8tpzRWG2QI/d3Xf32jFF4GfkXB4v2gleRYB3jcscj71e
 k7D0T69F7cIVEZGmZRfOtrrY+xzlPCIPY28Cpj8M4ofCrAsJVTv1Hw/Oia4gTu3+GByyv5XB
 HtuWZv1ZZrsIf88l2TeqiZ0+eJD+x3SMkuJHc+ilEn8gePFDJNXIJ9cWGazgikCxPvsiG3oH
 xx3baNmEj1TD7/zZDf564kWIQxYJHQ3H8mu+cdWavSCMkxtH2R4U63dxrYoeopEmaVJl7iXo
 iHhCxEAkFev12faLQiqa2x4bO+9V5hIsn9mbzcnOkyl2iZ/bN/3vrsfbZY+YZIu6PdnkaxvV
 /AAdsjZWqZPRz3L9i4zd574qIA+Jh2niRjXZ3iuYSQlfo4mTAvMo4e2cgzq/SgILyy2qcph/
 OHwilKFGcIOHl0wAtzXZfSjy0KKkUIcwO8iDVHVJtRzeVn39NQ4ISLGkfJqcdoHLg/Ox2XG2
 l/OUwsYv+TEv6Q87MLN2fKft46sHuZzQhhaEm3c4erkPCXW5DP+k4pJUeLOdjHBTmLkvq6lY
 LwNnf37NfQGmndMspZ9TOk3nf5vuYO3qu8I1BlgEVXKc0+vW+FpLXSx1MVSsrFAm+1CsgysV
 0PTotRXNN1l4i8+/IL98Ob9Utm+6A==
IronPort-HdrOrdr: A9a23:B2eSJ6DcKqA/HJvlHemu55DYdb4zR+YMi2TC1yhKJyC9E/bo7v
 xG88566faZslossTQb6LW90cq7MBXhHPxOkOos1N6ZNWGM0gaVxcNZnO/fKlXbakrDH4VmtJ
 uIHZIQNDSJNykZsfrH
X-IronPort-AV: E=Sophos;i="5.88,353,1635220800"; 
   d="scan'208";a="63762636"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 5/6] x86/cpuid: Infrastructure for cpuid word 7:2.edx
Date: Tue, 8 Feb 2022 18:09:41 +0000
Message-ID: <20220208180942.14871-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220208180942.14871-1-andrew.cooper3@citrix.com>
References: <20220208180942.14871-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

While in principle it would be nice to keep leaf 7 in order, that would
involve having an extra 5 words of zeros in a featureset.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 tools/misc/xen-cpuid.c                      |  5 +++++
 xen/arch/x86/cpu/common.c                   |  4 ++++
 xen/include/public/arch-x86/cpufeatureset.h |  2 ++
 xen/include/xen/lib/x86/cpuid.h             | 13 ++++++++++++-
 4 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index 3c8f3ed1bad1..40626296984b 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -200,6 +200,10 @@ static const char *const str_7b1[32] =
     [ 0] = "ppin",
 };
 
+static const char *const str_7d2[32] =
+{
+};
+
 static const struct {
     const char *name;
     const char *abbr;
@@ -219,6 +223,7 @@ static const struct {
     { "0x00000007:1.eax", "7a1", str_7a1 },
     { "0x80000021.eax",  "e21a", str_e21a },
     { "0x00000007:1.ebx", "7b1", str_7b1 },
+    { "0x00000007:2.edx", "7d2", str_7d2 },
 };
 
 #define COL_ALIGN "18"
diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index d4f5028fa2ec..c4f07f2d1da4 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -447,6 +447,10 @@ static void generic_identify(struct cpuinfo_x86 *c)
 				    &c->x86_capability[FEATURESET_7a1],
 				    &c->x86_capability[FEATURESET_7b1],
 				    &tmp, &tmp);
+		if (max_subleaf >= 2)
+			cpuid_count(7, 2,
+				    &tmp, &tmp, &tmp,
+				    &c->x86_capability[FEATURESET_7d2]);
 	}
 
 	if (c->cpuid_level >= 0xd)
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 957df23b65f2..81b0f5e0aad3 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -302,6 +302,8 @@ XEN_CPUFEATURE(NSCB,               11*32+ 6) /*A  Null Selector Clears Base (and
 /* Intel-defined CPU features, CPUID level 0x00000007:1.ebx, word 12 */
 XEN_CPUFEATURE(INTEL_PPIN,         12*32+ 0) /*   Protected Processor Inventory Number */
 
+/* Intel-defined CPU features, CPUID level 0x00000007:2.edx, word 13 */
+
 #endif /* XEN_CPUFEATURE */
 
 /* Clean up from a default include.  Close the enum (for C). */
diff --git a/xen/include/xen/lib/x86/cpuid.h b/xen/include/xen/lib/x86/cpuid.h
index e87036b30380..50be07c0eba0 100644
--- a/xen/include/xen/lib/x86/cpuid.h
+++ b/xen/include/xen/lib/x86/cpuid.h
@@ -17,6 +17,7 @@
 #define FEATURESET_7a1   10 /* 0x00000007:1.eax    */
 #define FEATURESET_e21a  11 /* 0x80000021.eax      */
 #define FEATURESET_7b1   12 /* 0x00000007:1.ebx    */
+#define FEATURESET_7d2   13 /* 0x80000007:2.edx    */
 
 struct cpuid_leaf
 {
@@ -82,7 +83,7 @@ const char *x86_cpuid_vendor_to_str(unsigned int vendor);
 
 #define CPUID_GUEST_NR_BASIC      (0xdu + 1)
 #define CPUID_GUEST_NR_CACHE      (5u + 1)
-#define CPUID_GUEST_NR_FEAT       (1u + 1)
+#define CPUID_GUEST_NR_FEAT       (2u + 1)
 #define CPUID_GUEST_NR_TOPO       (1u + 1)
 #define CPUID_GUEST_NR_XSTATE     (62u + 1)
 #define CPUID_GUEST_NR_EXTD_INTEL (0x8u + 1)
@@ -193,6 +194,14 @@ struct cpuid_policy
                 uint32_t _7b1;
                 struct { DECL_BITFIELD(7b1); };
             };
+            uint32_t /* c */:32, /* d */:32;
+
+            /* Subleaf 2. */
+            uint32_t /* a */:32, /* b */:32, /* c */:32;
+            union {
+                uint32_t _7d2;
+                struct { DECL_BITFIELD(7d2); };
+            };
         };
     } feat;
 
@@ -333,6 +342,7 @@ static inline void cpuid_policy_to_featureset(
     fs[FEATURESET_7a1] = p->feat._7a1;
     fs[FEATURESET_e21a] = p->extd.e21a;
     fs[FEATURESET_7b1] = p->feat._7b1;
+    fs[FEATURESET_7d2] = p->feat._7d2;
 }
 
 /* Fill in a CPUID policy from a featureset bitmap. */
@@ -352,6 +362,7 @@ static inline void cpuid_featureset_to_policy(
     p->feat._7a1  = fs[FEATURESET_7a1];
     p->extd.e21a  = fs[FEATURESET_e21a];
     p->feat._7b1  = fs[FEATURESET_7b1];
+    p->feat._7d2  = fs[FEATURESET_7d2];
 }
 
 static inline uint64_t cpuid_policy_xcr0_max(const struct cpuid_policy *p)
-- 
2.11.0


