Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0921765D139
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 12:12:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471108.730822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD1ge-0005o2-Lf; Wed, 04 Jan 2023 11:12:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471108.730822; Wed, 04 Jan 2023 11:12:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD1ge-0005l2-Hm; Wed, 04 Jan 2023 11:12:00 +0000
Received: by outflank-mailman (input) for mailman id 471108;
 Wed, 04 Jan 2023 11:11:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tpAs=5B=citrix.com=prvs=3612a7559=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pD1gd-0005kw-LH
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 11:11:59 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9962cbb2-8c20-11ed-91b6-6bf2151ebd3b;
 Wed, 04 Jan 2023 12:11:57 +0100 (CET)
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
X-Inumbo-ID: 9962cbb2-8c20-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672830717;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Y4umxcgEQ+iPNN3hZApARntuGd8s3vbDQqyRC58FQsU=;
  b=ebw2b1zj1z+Z+ql8j5S1rVSnFQrceoiWqkfMPBtvJ/lmDyeHFxqiExx7
   LuGlmw7jIBxVQAIPpvo2x3NBeSA4Gc5oKDS9tsoY3rPnhUlFts8ApF7yp
   2CwW/ayEb3yTTsY461VRBxceKo1v3LpRYQUE1OseAkGbKFw5ujf7LsPfF
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 91153120
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:QUVk6agYuSaEWSW8w4oQtFgNX161bhAKZh0ujC45NGQN5FlHY01je
 htvUWyBaKuNYWb0fY1xO9y3/RlQvcXdztdkGlFprnhhQnwb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWs0N8klgZmP6sT5QeCzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQ4OhIHNQyKo9iO2az4G7g8rO0cF+j0adZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJagx/5JEWxY9EglHWdTFCpU3Tjq0w+2XJlyR60aT3McqTcduPLSlQthfB/
 z+dpj6hav0cHNrBywTaySuHvcuVmBLXG5xIF+H7x9c/1TV/wURMUUZLBDNXu8KRlUqWS99Zb
 UsO9UIGvaU0sUCmUNT5dxm5u2Kf+A4RXcJKFO834x3LzbDbiy67LGUZSj9KaPQ9qdQ7Azct0
 ze0c8jBXGI19ufPEDTEq+nS/Wja1TUpwXEqRT0mR1AZ6v3ZmJgtzUOeHvxKL5WUkYigcd3v+
 AyioC87jrQVqMcE0aSn4FzK6w6RSoj1oh0dvVuOAD/8hu9tTMv8PtHztwCHhRpVBNzBJmRtq
 kTojCR3AAomKZiW3BKAT+wWdF1Cz6bUaWaM6bKD8nRIythMx5JBVdoLiN2dDB0zWirhRdMOS
 BG7hO+pzMUPVEZGlIcuC25LN+wkzLL7CfPuXe3OY9xFb/BZLVHYpn4xPR7AhzmxwCDAdJ3T3
 r/CKK6R4YsyU/w7nFJauc9HuVPU+szO7TyKHs2qp/hW+bGfeGSUWd84Dbd6VchgtPnsiFyMo
 75i2z6il003vBvWPnOGrub+7DkicRAGOHwBg5UNLr/beFM5QTFJ5j246epJRrGJVp99zo/gl
 kxRkGcBoLYjrRUr8Tm3V00=
IronPort-HdrOrdr: A9a23:DCTKYqhnDQlvEpstI9xAbQV4aXBQXjwji2hC6mlwRA09TyVXrb
 HKoB0+7268tN9xYgBXpTnkAtjJfZqyz/5ICOMqTMKftWXdyQiVxcRZnPPfKxOJIVyOygd279
 YST0CVYOeAc2SS9PyKnzVQcOxQueVuIcqT9JXjJhVWPGZXgvpbnntE42+geyVLrUt9dPwE/f
 ynl756ThWbCAQqh6+Adx04tob41r/2fVHdEGk777NN0mWzZbTC0s+GL/BNtS1uKQ+nCI1Imw
 Wr/W3EDsnPiYDB9iPh
X-IronPort-AV: E=Sophos;i="5.96,299,1665460800"; 
   d="scan'208";a="91153120"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 2/2] x86/shskt: Disable CET-SS on parts susceptible to fractured updates
Date: Wed, 4 Jan 2023 11:11:46 +0000
Message-ID: <20230104111146.2094-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20230104111146.2094-1-andrew.cooper3@citrix.com>
References: <20230104111146.2094-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Refer to Intel SDM Rev 70 (Dec 2022), Vol3 17.2.3 "Supervisor Shadow Stack
Token".

Architecturally, an event delivery which starts in CPL<3 and switches shadow
stack will first validate the Supervisor Shadow Stack Token (setting the busy
bit), then pushes CS/LIP/SSP.  One example of this is an NMI interrupting Xen.

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
Specifying `cet=shstk` on the command line will override this heuristic and
enable shadow stacks irrespective.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * Confirmation from AMD that their parts are not impacted.
 * Fix pv-shim build.  The "define false" trick doesn't work with tristates.
 * Tweak wording in several places.
 * Fix tabs vs spaces.

This ideally wants backporting to Xen 4.14.  I have no idea how likely it is
to need to backport the prerequisite patch for new feature words, but we've
already had to do that once for security patches.  OTOH, I have no idea how
easy it is to trigger in non-synthetic cases.
---
 docs/misc/xen-command-line.pandoc           |  7 ++++-
 tools/libs/light/libxl_cpuid.c              |  2 ++
 tools/misc/xen-cpuid.c                      |  1 +
 xen/arch/x86/cpu/common.c                   | 11 +++++--
 xen/arch/x86/setup.c                        | 46 ++++++++++++++++++++++++-----
 xen/include/public/arch-x86/cpufeatureset.h |  1 +
 6 files changed, 57 insertions(+), 11 deletions(-)

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
index addb3a39a11a..0248eaef44c1 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -208,6 +208,7 @@ static const char *const str_7c1[32] =
 
 static const char *const str_7d1[32] =
 {
+    [18] = "cet-sss",
 };
 
 static const char *const str_7d2[32] =
diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index b3fcf4680f3a..27f73d3bbe31 100644
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
 
+		if (max_subleaf >= 1)
+			cpuid_count(7, 1, &eax, &ebx, &ecx,
+				    &c->x86_capability[FEATURESET_7d1]);
+	}
+
 	eax = cpuid_eax(0x80000000);
 	if ((eax >> 16) == 0x8000 && eax >= 0x80000008) {
 		ebx = eax >= 0x8000001f ? cpuid_ebx(0x8000001f) : 0;
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 566422600d94..1b8b74599f4a 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -95,11 +95,7 @@ unsigned long __initdata highmem_start;
 size_param("highmem-start", highmem_start);
 #endif
 
-#ifdef CONFIG_XEN_SHSTK
-static bool __initdata opt_xen_shstk = true;
-#else
-#define opt_xen_shstk false
-#endif
+static int8_t __initdata opt_xen_shstk = -IS_ENABLED(CONFIG_XEN_SHSTK);
 
 #ifdef CONFIG_XEN_IBT
 static bool __initdata opt_xen_ibt = true;
@@ -1099,11 +1095,45 @@ void __init noreturn __start_xen(unsigned long mbi_p)
     early_cpu_init();
 
     /* Choose shadow stack early, to set infrastructure up appropriately. */
-    if ( opt_xen_shstk && boot_cpu_has(X86_FEATURE_CET_SS) )
+    if ( !boot_cpu_has(X86_FEATURE_CET_SS) )
+        opt_xen_shstk = 0;
+
+    if ( opt_xen_shstk )
     {
-        printk("Enabling Supervisor Shadow Stacks\n");
+        /*
+         * Some CPUs suffer from Shadow Stack Fracturing, an issue whereby a
+         * fault/VMExit/etc between setting a Supervisor Busy bit and the
+         * event delivery completing renders the operation non-restartable.
+         * On restart, event delivery will find the Busy bit already set.
+         *
+         * This is a problem on bare metal, but outside of synthetic cases or
+         * a very badly timed #MC, it's not believed to problem.  It is a much
+         * bigger problem under virt, because we can VMExit for a number of
+         * legitimate reasons and tickle this bug.
+         *
+         * CPUs with this addressed enumerate CET-SSS to indicate that
+         * supervisor shadow stacks are now safe to use.
+         */
+        bool cpu_has_bug_shstk_fracture =
+            boot_cpu_data.x86_vendor == X86_VENDOR_INTEL &&
+            !boot_cpu_has(X86_FEATURE_CET_SSS);
 
-        setup_force_cpu_cap(X86_FEATURE_XEN_SHSTK);
+        /*
+         * On bare metal, assume that Xen won't be impacted by shstk
+         * fracturing problems.  Under virt, be more conservative and disable
+         * shstk by default.
+         */
+        if ( opt_xen_shstk == -1 )
+            opt_xen_shstk =
+                cpu_has_hypervisor ? !cpu_has_bug_shstk_fracture
+                                   : true;
+
+        if ( opt_xen_shstk )
+        {
+            printk("Enabling Supervisor Shadow Stacks\n");
+
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


