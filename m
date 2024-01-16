Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCCD82EE8F
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 12:59:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667731.1039278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPi5n-00037d-QD; Tue, 16 Jan 2024 11:58:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667731.1039278; Tue, 16 Jan 2024 11:58:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPi5n-000357-NN; Tue, 16 Jan 2024 11:58:55 +0000
Received: by outflank-mailman (input) for mailman id 667731;
 Tue, 16 Jan 2024 11:58:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vnTh=I2=citrix.com=prvs=738cadf69=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1rPi5m-000351-TG
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 11:58:54 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9da19c34-b466-11ee-98f1-6d05b1d4d9a1;
 Tue, 16 Jan 2024 12:58:53 +0100 (CET)
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
X-Inumbo-ID: 9da19c34-b466-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1705406333;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CXG++peqcTrVae01hLc9GPCtIYnrgjTYYITPCs1EtSs=;
  b=Vr0ZMt1DfmSCIYGcSPdb17uKBcQMQXedTjuizCB2jEYaNHXy3la8y5Bi
   tSWm79XJ4tVpmTzwo4WtuEfGmlNC4EqpucLwLhq4i97h6lZep/cp8gkLc
   wWf/PmsC9mnaZsmW9lolIUjBy4cc3FCiUm54oaigDe6Dk8Cyu1R58swUk
   w=;
X-CSE-ConnectionGUID: mc5dV3RZRAKJOycBacwj5w==
X-CSE-MsgGUID: kVY3adk5T1uIoB227NOYCg==
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 128004259
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:ZrkRQqwUw516GpYEHJZ6t+emxirEfRIJ4+MujC+fZmUNrF6WrkUCz
 GMfW2mEPKqKMzTyfIh/aom/8B4B6p/cnIdmGQVk+CAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjPzOHvykTrecZkidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8E4HUMja4mtC4gRnPK4T5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KWRFq
 PAmcwo/VDmgpcWny5iyQfZu29t2eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyPVKfO3WjOX9OYH46tM6uimPybHtzr1WNqLBsy2PS0BZwwP7mN9+9ltmiHJ8Fxh7E/
 D+Xl4j/KhIkBYeWxTnYziuxp+jlx3mkfqUjP7Lto5aGh3XMnzdOWXX6T2CTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jY+cddNF+wx6CmW17HZpQ2eAwAsVSVdYdYrsMs3Qz0C1
 VKTmd7tQzt1v9W9Vna15rqS6zSoNkA9L3IGZCICZRsI5Z/kuo5bpizIStFvAauklOrfEDv7w
 y2JhCUmjrBVhskOv42x8ErbmTuqqt7MRxQs+wTMdmu/60VyY4vNT4mp4ljS6bBHNpSUSnGIu
 XRCkM+bhMgUCpuAjjCKBu8EE7eg/f+tOiDTmlNpEN8q8DHF03CucY1K4Tp5YlxkKM8KeDnoS
 EXOthhc4pAVN3yvBYd8ZISqFsA2zK7vPd74WevZaNUIaZ90HDJr5wk3OxTWhTq01hFxwOdgY
 f93bPpAE14fAvlr8mGMdd008p0M1ysUzGjMR83kmkHPPaWlWJKFdVsUGALRNr1itvjU+Vq9z
 jpJCyedJ/xivAzCjsr/q9d7wagidyRTOHwPg5U/mhS/CgRnAno9LPTa3KksfYdo94wMyb+Vp
 S3mChEFmAOv7ZEiFelsQio6AF8Idc8gxU/XwAR2ZQr4s5TdSdbHAFgjm2sfIuB8qb0LIQ9cR
 PgZYcSQasmjuRyekwnxmaLV9dQ4HDzy3FLmAsZQSGRnF3KWb1CTq4CMk8qG3HVmMxdbQuNk8
 uD/iF2AHcNTL+mgZe6PAM+SI5qKlSB1sIpPs4Hge7G/pG2EHFBWFhHM
IronPort-HdrOrdr: A9a23:WiCiFajHjLnokf3iPo6H7Ccz6nBQXtYji2hC6mlwRA09TySZ//
 rBoB19726StN9xYgBFpTnuAsm9qB/nmaKdgrNhWItKPjOW21dARbsKheCJrgEIcxeOkNK1vp
 0AT0ERMrLN5CBB/KTH3DU=
X-Talos-CUID: 9a23:2jBYFGFxDRdAiO+uqmJi/xMYJJsfQEf071X3MkSSAG12SuCKHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3A062s7g++3+oCZXtN57bWUo6Qf8RW0v+nBENQrcw?=
 =?us-ascii?q?bms6ub3YvHRCspzviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.05,199,1701147600"; 
   d="scan'208";a="128004259"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Roberto Bagnara
	<roberto.bagnara@bugseng.com>, Federico Serafini
	<federico.serafini@bugseng.com>, "consulting @ bugseng . com"
	<consulting@bugseng.com>
Subject: [PATCH] x86/cpuid: Change cpuid() from a macro to a static inline
Date: Tue, 16 Jan 2024 11:58:38 +0000
Message-ID: <20240116115838.560473-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Fixes MISRA XXX

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
CC: Federico Serafini <federico.serafini@bugseng.com>
CC: consulting@bugseng.com <consulting@bugseng.com>

Can someone please remind me which MISRA rule is the one about macros aliasing
identifiers?
---
 xen/arch/x86/include/asm/processor.h | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index ff62b080afbf..b227cdee8ef3 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -126,14 +126,6 @@ static inline int cpu_nr_siblings(unsigned int cpu)
     return cpu_data[cpu].x86_num_siblings;
 }
 
-/*
- * Generic CPUID function
- * clear %ecx since some cpus (Cyrix MII) do not set or clear %ecx
- * resulting in stale register contents being returned.
- */
-#define cpuid(leaf, eax, ebx, ecx, edx)          \
-        cpuid_count(leaf, 0, eax, ebx, ecx, edx)
-
 /* Some CPUID calls want 'count' to be placed in ecx */
 static inline void cpuid_count(
     unsigned int op,
@@ -148,6 +140,21 @@ static inline void cpuid_count(
           : "0" (op), "c" (count) );
 }
 
+/*
+ * Generic CPUID function
+ * clear %ecx since some cpus (Cyrix MII) do not set or clear %ecx
+ * resulting in stale register contents being returned.
+ */
+static inline void cpuid(
+    unsigned int leaf,
+    unsigned int *eax,
+    unsigned int *ebx,
+    unsigned int *ecx,
+    unsigned int *edx)
+{
+    cpuid_count(leaf, 0, eax, ebx, ecx, edx);
+}
+
 /*
  * CPUID functions returning a single datum
  */

base-commit: f3f6c500e2dbd23af77c207e2cf4b496fffa1b0d
-- 
2.30.2


