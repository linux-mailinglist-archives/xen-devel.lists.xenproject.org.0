Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F112B659FA9
	for <lists+xen-devel@lfdr.de>; Sat, 31 Dec 2022 01:31:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.469951.729408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pBPlY-0001lZ-RJ; Sat, 31 Dec 2022 00:30:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 469951.729408; Sat, 31 Dec 2022 00:30:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pBPlY-0001im-My; Sat, 31 Dec 2022 00:30:24 +0000
Received: by outflank-mailman (input) for mailman id 469951;
 Sat, 31 Dec 2022 00:30:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cPaP=45=citrix.com=prvs=3576bb3e1=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pBPlX-0001TX-4y
 for xen-devel@lists.xenproject.org; Sat, 31 Dec 2022 00:30:23 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4db5038e-88a2-11ed-91b6-6bf2151ebd3b;
 Sat, 31 Dec 2022 01:30:20 +0100 (CET)
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
X-Inumbo-ID: 4db5038e-88a2-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672446620;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OgocD+ObouQq8QNH5GDFFIUKa/VfXCi8dkLMnUgQGhc=;
  b=b8LtxGuw0+VGReQ+AV4hYdCMs+TJzlgTF/GyotjqpgD/R7Mbbc3WPIux
   5leYJ/uTiN60WbtLjN3bmBMB9syQlfDhbkr6GcEvRLC/72uj9Vg7L0Esy
   mXYJKd2+EP0oDN0DQH26+ZyvgTelQi1tWdxxduXlO22W5pXQ3WgZG7ewB
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 90645874
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:eE0waKMgBvY1NFjvrR2rl8FynXyQoLVcMsEvi/4bfWQNrUojgjQHx
 mQWCjuCP/rYZ2X9KYp+Oo3l9R8O7JbWydY2Swto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvzrRC9H5qyo4mpC5QRmOZingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0utWWWpRp
 fUFEgocTwzcofyxxK6jFfY506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w/N3wsYDUWUrsTILs4kP2lmT/UdDpApUjOjaE2/3LS3Ep6172F3N/9K4TUGZgFwRrwS
 mTu1DiiIB8wG+Ok7zej72OngM7EoCXaV9dHfFG/3qEz2wDCroAJMzUJUXOrrP//jVSxM/pPJ
 kpR9icwoKwa8E2wUsK7TxC+uGSDvBMXR5xXCeJSwCOnx7fQ4g2ZLnMZVTMHY9sj3PLaXhRzi
 AXPxYmwQ2Uy7vvFEhpx64t4sxu/GHAeMj8LeBU+XCoZvP/9p4Uvlk3QG4ML/LGOsvX5HjT5w
 javpSc4hqkOgcNj65hX7WwrkBr3+MGXE1ddChH/Gzv8s1gnPNLNi5mAswCz0BpWEGqOorBtV
 lAgktPW0u0BBIrleMelELRUR+HBCxpo3VThbb9T83sJrW/FF52LJ9o4DNRCyKBBbK45lcfBO
 hO7hO+ozMY70IGWRaF2eZmtLM8h0LLtE9/oPtiNMIUUPsIsLlPXrHszDaJ144wKuBF2+ZzTx
 L/BKZr8ZZrkIf8PIMWKqxc1juZwm3FWKZL7TpHn1RW3uYejiIquYe5dajOmN7lphJ5oVS2Jq
 76zwePWkUQAOAA/CwGLmbMuwacidylqXsCq8ZIGL4Zu4GNOQQkcNhMY+pt5E6QNokifvr6gE
 q2VMqOA9GfCuA==
IronPort-HdrOrdr: A9a23:xkUxF6wxsB1ktMO6h/tJKrPwEr1zdoMgy1knxilNoHtuH/Bw9v
 rDoB1/73XJYVkqOU3I9erwWpVoa0msjKKdmLNhW4tKPzOHhILLFu9fBOLZqlXd8kvFh4lgPM
 xbAstD4bPLYmSTtqzBkWyF+twbsb26GfCT7tvj8w==
X-IronPort-AV: E=Sophos;i="5.96,288,1665460800"; 
   d="scan'208";a="90645874"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 2/2] x86/shskt: Disable CET-SS on parts succeptable to fractured updates
Date: Sat, 31 Dec 2022 00:30:07 +0000
Message-ID: <20221231003007.26916-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20221231003007.26916-1-andrew.cooper3@citrix.com>
References: <20221231003007.26916-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Refer to Intel SDM Rev 70 (Dec 2022), Vol3 17.2.3 "Supervisor Shadow Stack
Token".

Architecturally, an event delivery which starts in CPL>3 and switches shadow
stack will first validate the Supervisor Shstk Token and set the busy bit,
then pushes LIP/CS/SSP.  One example of this is an NMI interrupting Xen.

Some CPUs suffer from an issue called fracturing, whereby a fault/vmexit/etc
between setting the busy bit and completing the event injection renders the
action non-restartable, because when it comes time to restart, the busy bit is
found to be already set.

This is far more easily encountered under virt, yet it is not the fault of the
hypervisor, nor the fault of the guest kernel.  The fault lies somewhere
between the architectural specification, and the uarch behaviour.

Intel have allocated CPUID.7[1].ecx[18] CET_SSS to enumerate that supervisor
shadow stacks are safe to use.  Because of how Xen lays out its shadow stacks,
fracturing is not expected to be a problem on native.

Detect this case on boot and default to not using shstk if virtualised.
Specifying `cet=shstk` on the command line will override this heurstic and
enable shadow stacks irrespective.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

I've got a query out with AMD, but so far it is only Intel CPUs known to be
impacted.

This ideally wants backporting to Xen 4.14.  I have no idea how likely it is
to need to backport the prerequisite patch for new feature words, but we've
already had to do that once for security patches...
---
 docs/misc/xen-command-line.pandoc           |  7 +++++-
 tools/libs/light/libxl_cpuid.c              |  2 ++
 tools/misc/xen-cpuid.c                      |  1 +
 xen/arch/x86/cpu/common.c                   | 11 +++++++--
 xen/arch/x86/setup.c                        | 37 ++++++++++++++++++++++++++---
 xen/include/public/arch-x86/cpufeatureset.h |  1 +
 6 files changed, 53 insertions(+), 6 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 923910f553c5..19d4d815bdee 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -287,10 +287,15 @@ can be maintained with the pv-shim mechanism.
     protection.
 
     The option is available when `CONFIG_XEN_SHSTK` is compiled in, and
-    defaults to `true` on hardware supporting CET-SS.  Specifying
+    generally defaults to `true` on hardware supporting CET-SS.  Specifying
     `cet=no-shstk` will cause Xen not to use Shadow Stacks even when support
     is available in hardware.
 
+    Some hardware suffers from an issue known as Supervisor Shadow Stack
+    Fracturing.  On such hardware, Xen will default to not using Shadow Stacks
+    when virtualised.  Specifying `cet=shstk` will override this heuristic and
+    enable Shadow Stacks unilaterally.
+
 *   The `ibt=` boolean controls whether Xen uses Indirect Branch Tracking for
     its own protection.
 
diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index 2aa23225f42c..d97a2f3338bc 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -235,6 +235,8 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str)
         {"fsrs",         0x00000007,  1, CPUID_REG_EAX, 11,  1},
         {"fsrcs",        0x00000007,  1, CPUID_REG_EAX, 12,  1},
 
+        {"cet-sss",      0x00000007,  1, CPUID_REG_EDX, 18,  1},
+
         {"intel-psfd",   0x00000007,  2, CPUID_REG_EDX,  0,  1},
         {"mcdt-no",      0x00000007,  2, CPUID_REG_EDX,  5,  1},
 
diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index 0091a11a67bc..ea33b587665d 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -208,6 +208,7 @@ static const char *const str_7c1[32] =
 
 static const char *const str_7d1[32] =
 {
+    [18] = "cet-sss",
 };
 
 static const char *const str_7d2[32] =
diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index b3fcf4680f3a..d962f384a995 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -346,11 +346,18 @@ void __init early_cpu_init(void)
 	       x86_cpuid_vendor_to_str(c->x86_vendor), c->x86, c->x86,
 	       c->x86_model, c->x86_model, c->x86_mask, eax);
 
-	if (c->cpuid_level >= 7)
-		cpuid_count(7, 0, &eax, &ebx,
+	if (c->cpuid_level >= 7) {
+		uint32_t max_subleaf;
+
+		cpuid_count(7, 0, &max_subleaf, &ebx,
 			    &c->x86_capability[FEATURESET_7c0],
 			    &c->x86_capability[FEATURESET_7d0]);
 
+                if (max_subleaf >= 1)
+			cpuid_count(7, 1, &eax, &ebx, &ecx,
+				    &c->x86_capability[FEATURESET_7d1]);
+        }
+
 	eax = cpuid_eax(0x80000000);
 	if ((eax >> 16) == 0x8000 && eax >= 0x80000008) {
 		ebx = eax >= 0x8000001f ? cpuid_ebx(0x8000001f) : 0;
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 566422600d94..e052b7b748fa 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -96,7 +96,7 @@ size_param("highmem-start", highmem_start);
 #endif
 
 #ifdef CONFIG_XEN_SHSTK
-static bool __initdata opt_xen_shstk = true;
+static int8_t __initdata opt_xen_shstk = -1;
 #else
 #define opt_xen_shstk false
 #endif
@@ -1101,9 +1101,40 @@ void __init noreturn __start_xen(unsigned long mbi_p)
     /* Choose shadow stack early, to set infrastructure up appropriately. */
     if ( opt_xen_shstk && boot_cpu_has(X86_FEATURE_CET_SS) )
     {
-        printk("Enabling Supervisor Shadow Stacks\n");
+        /*
+         * Some CPUs suffer from Shadow Stack Fracturing, an issue whereby a
+         * fault/VMExit/etc between setting a Supervisor Busy bit and the
+         * event delivery completing renders the operation non-restartable.
+         * On restart, event delivery will find the Busy bit already set.
+         *
+         * This is a problem on native, but outside of synthetic cases, only
+         * with #MC against a stack access (in which case we're dead anyway).
+         * It is a much bigger problem under virt, because we can VMExit for a
+         * number of legitimate reasons and tickle this bug.
+         *
+         * CPUs with this addressed enumerate CET-SSS to indicate that
+         * supervisor shadow stacks are now safe to use.
+         */
+        bool cpu_has_bug_shstk_fracture =
+            boot_cpu_data.x86_vendor == X86_VENDOR_INTEL &&
+            !boot_cpu_has(X86_FEATURE_CET_SSS);
+
+        /*
+         * On native, assume that Xen won't be impacted by shstk fracturing
+         * problems.  Under virt, be more conservative and disable shstk by
+         * default.
+         */
+        if ( opt_xen_shstk == -1 )
+            opt_xen_shstk =
+                cpu_has_hypervisor ? !cpu_has_bug_shstk_fracture
+                                   : true;
+
+        if ( opt_xen_shstk )
+        {
+            printk("Enabling Supervisor Shadow Stacks\n");
 
-        setup_force_cpu_cap(X86_FEATURE_XEN_SHSTK);
+            setup_force_cpu_cap(X86_FEATURE_XEN_SHSTK);
+        }
     }
 
     if ( opt_xen_ibt && boot_cpu_has(X86_FEATURE_CET_IBT) )
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 7a896f0e2d92..f6a46f62a549 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -290,6 +290,7 @@ XEN_CPUFEATURE(INTEL_PPIN,         12*32+ 0) /*   Protected Processor Inventory
 
 /* Intel-defined CPU features, CPUID level 0x00000007:1.ecx, word 14 */
 /* Intel-defined CPU features, CPUID level 0x00000007:1.edx, word 15 */
+XEN_CPUFEATURE(CET_SSS,            15*32+18) /*   CET Supervisor Shadow Stacks safe to use */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:2.edx, word 13 */
 XEN_CPUFEATURE(INTEL_PSFD,         13*32+ 0) /*A  MSR_SPEC_CTRL.PSFD */
-- 
2.11.0


