Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4B670514F
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 16:54:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535266.832983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyw3q-0007SQ-MP; Tue, 16 May 2023 14:53:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535266.832983; Tue, 16 May 2023 14:53:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyw3q-0007Ny-Fj; Tue, 16 May 2023 14:53:58 +0000
Received: by outflank-mailman (input) for mailman id 535266;
 Tue, 16 May 2023 14:53:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7WEk=BF=citrix.com=prvs=493b78b38=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pyw3o-00067V-Dw
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 14:53:56 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 799ec1ce-f3f9-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 16:53:54 +0200 (CEST)
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
X-Inumbo-ID: 799ec1ce-f3f9-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684248834;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lMkiMk+JiUBw0hNgilS4qSHGS05jFL3O36UzQf8lnjo=;
  b=Z151AEIeZh+lgWZLiUIM5oxx1Z1Y6Jiq2q3620FydbOlm5KvHcC/v/cv
   zq3v6rj3K1jhuSKQXI1Mzuq0sMQUcehBqNbB/ZrKRyzi5hko1+aYvtNaF
   DoRsJFU5dszRLjYQ3PdXsPHQuGj0upCrN3dAO6LOID+hy7r9gwew+vbFV
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 111689032
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:jULSca17vEt4G5MuofbD5dpxkn2cJEfYwER7XKvMYLTBsI5bp2MOy
 GtNCm2EM/2CN2r3Loh2boqy80xUsZKAmoM1QAdrpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+XuDgNyo4GlD5gFnO6gR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfLGh3/
 tUIJwg0Qk6fprOX6oKgT8tgmZF2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tM6uimPybHtzr1WNqLBsy2PS0BZwwP7mN9+9ltmiHJwMwBbJ/
 jmcl4j/KkE4JNaa6yufyF72jcL/mDP4Qp4OTKLto5aGh3XMnzdOWXX6T2CTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jY+cddNF+wx6CmW17HZpQ2eAwAsUTppeNEg8sgsSlQXO
 kShxo2zQ2Y16fvMFCzbr+3Pxd+vBcQLBUILXCQtXQQ92vW9vKBirzj/VdNBHLHg27UZBgrM6
 zyNqSE/gZAagsgKy7i38Dj7vt68mnTaZlVrv1uKBwpJ+is8Pdf4PNLwtTA3+N4adO6kok+9U
 G/ociR0xMQHFtmzmSOEW43h95n5tq/eYFUwbbOCdqTNFghBGVb5Jei8Axkkfi+F1/ronhe3C
 HI/QSsLuPdu0IKCNMebmb6ZBcUw1rTHHt/4TP3SZdcmSsEvJFPeo3wwNBfMgDqFfK0QfUYXa
 P+mnTuEVy5GWcyLMhLsLwvi7VPb7n9nnj6CLXwK5x+mzaCfdBaodFvxC3PXNrpRxPrd8G3oH
 yN3a5PiJ+N3DLevPUE6MOc7cTg3EJTMLc6m9JEHKrHaeWKL2ggJUpfs/F/oQKQ994w9qwsC1
 ijVtpNwoLYnuUD6FA==
IronPort-HdrOrdr: A9a23:LJl+wKjSpoGFeaLJsqaEaHZe7HBQX9J23DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03IwerwXpVoMkmsjKKdgLNhdItKOTOLhILGFvAH0WKP+Vzd8k7Fh6ZgPM
 VbAs9D4bTLZDAU4/oSizPIcOrIteP3lZxA8t2urUuFIzsLV4hQqyNCTiqLGEx/QwdLQbI/CZ
 qn/8JC4xawZHgNacy/J38dG8zOvcfCmp7KaQMPQ0dP0njFsRqYrJrBVzSI1BYXVD1ChZ8k7G
 j+igT8oomzrv2hzRfY9mnLq7BbgsHoxNdvDNGFzuIVNjLvoAC1Y5kJYczIgBkF5MWUrHo6mt
 jFpBkte+5p7WnKQ22zqRzxnyH9zTcH8RbZuBOlqEqmhfa8aCMxCsJHi44cWADe8VAcsNZ117
 8O936FtqBQEQjLkE3Glpf1vlBR5wSJSEgZ4K4uZk9kIMgjgXhq3M4iFXZuYdY99eTBmcUa+a
 dVfYXhDb1tACunhjjizxJSKZqXLzkO9169MzU/UsD56UktoFlpi0Qf38ARhXEG6dY0TIRF/f
 3NNuBymKhJVdJ+V9MIOA4te7rENoX2e2O4DEuCZVD8UK0XMXPErJD6pL0z+eGxYZQNiJ8/go
 7IXl9UvXM7PxuGM7z54LRbthTWBGmtVzXkzc9To5B/p73nXbLudSmOUkonncesq+gWRsfbR/
 GwMpRLBOKLFxqYJa9ZmwnlH5VCI3gXV8MY/t49RlKVu8rObpbns+TKGcyjV4YF0QxUKl8XLk
 FzIgQbfv8wknxDckWI/yT5SjfqZlH1+452HezT4/UTobJ9R7Fxjg==
X-Talos-CUID: =?us-ascii?q?9a23=3ARgzM4mro4N4SQVM0cCe2GszmUe0sS3b03HjoGmP?=
 =?us-ascii?q?mFUc4aZelUlqy9Lwxxg=3D=3D?=
X-Talos-MUID: 9a23:O88yugtWlovu7NLUDs2n1BNyPsJK8r6UJBoGvKUDq8qeKTAoJGLI
X-IronPort-AV: E=Sophos;i="5.99,278,1677560400"; 
   d="scan'208";a="111689032"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 3/4] x86/tsx: Remove opencoded MSR_ARCH_CAPS check
Date: Tue, 16 May 2023 15:53:33 +0100
Message-ID: <20230516145334.1271347-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230516145334.1271347-1-andrew.cooper3@citrix.com>
References: <20230516145334.1271347-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The current cpu_has_tsx_ctrl tristate is serving double pupose; to signal the
first pass through tsx_init(), and the availability of MSR_TSX_CTRL.

Drop the variable, replacing it with a once boolean, and altering
cpu_has_tsx_ctrl to come out of the feature information.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/include/asm/cpufeature.h |  1 +
 xen/arch/x86/include/asm/processor.h  |  2 +-
 xen/arch/x86/tsx.c                    | 13 ++++++++-----
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
index 8446f98625f7..deca5bfc2629 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -185,6 +185,7 @@ static inline bool boot_cpu_has(unsigned int feat)
 
 /* MSR_ARCH_CAPS 10A */
 #define cpu_has_if_pschange_mc_no boot_cpu_has(X86_FEATURE_IF_PSCHANGE_MC_NO)
+#define cpu_has_tsx_ctrl        boot_cpu_has(X86_FEATURE_TSX_CTRL)
 
 /* Synthesized. */
 #define cpu_has_arch_perfmon    boot_cpu_has(X86_FEATURE_ARCH_PERFMON)
diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index 0eaa2c3094d0..f983ff501d95 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -535,7 +535,7 @@ static inline uint8_t get_cpu_family(uint32_t raw, uint8_t *model,
     return fam;
 }
 
-extern int8_t opt_tsx, cpu_has_tsx_ctrl;
+extern int8_t opt_tsx;
 extern bool rtm_disabled;
 void tsx_init(void);
 
diff --git a/xen/arch/x86/tsx.c b/xen/arch/x86/tsx.c
index 41b6092cfe16..fc199815994d 100644
--- a/xen/arch/x86/tsx.c
+++ b/xen/arch/x86/tsx.c
@@ -19,7 +19,6 @@
  * controlling TSX behaviour, and where TSX isn't force-disabled by firmware.
  */
 int8_t __read_mostly opt_tsx = -1;
-int8_t __read_mostly cpu_has_tsx_ctrl = -1;
 bool __read_mostly rtm_disabled;
 
 static int __init cf_check parse_tsx(const char *s)
@@ -37,24 +36,28 @@ custom_param("tsx", parse_tsx);
 
 void tsx_init(void)
 {
+    static bool __read_mostly once;
+
     /*
      * This function is first called between microcode being loaded, and CPUID
      * being scanned generally.  Read into boot_cpu_data.x86_capability[] for
      * the cpu_has_* bits we care about using here.
      */
-    if ( unlikely(cpu_has_tsx_ctrl < 0) )
+    if ( unlikely(!once) )
     {
-        uint64_t caps = 0;
         bool has_rtm_always_abort;
 
+        once = true;
+
         if ( boot_cpu_data.cpuid_level >= 7 )
             boot_cpu_data.x86_capability[FEATURESET_7d0]
                 = cpuid_count_edx(7, 0);
 
         if ( cpu_has_arch_caps )
-            rdmsrl(MSR_ARCH_CAPABILITIES, caps);
+            rdmsr(MSR_ARCH_CAPABILITIES,
+                  boot_cpu_data.x86_capability[FEATURESET_10Al],
+                  boot_cpu_data.x86_capability[FEATURESET_10Ah]);
 
-        cpu_has_tsx_ctrl = !!(caps & ARCH_CAPS_TSX_CTRL);
         has_rtm_always_abort = cpu_has_rtm_always_abort;
 
         if ( cpu_has_tsx_ctrl && cpu_has_srbds_ctrl )
-- 
2.30.2


