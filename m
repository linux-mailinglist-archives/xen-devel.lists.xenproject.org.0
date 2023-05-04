Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 473396F7339
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 21:39:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530039.825272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pueng-0006M6-Tw; Thu, 04 May 2023 19:39:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530039.825272; Thu, 04 May 2023 19:39:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pueng-0006Gh-Iv; Thu, 04 May 2023 19:39:36 +0000
Received: by outflank-mailman (input) for mailman id 530039;
 Thu, 04 May 2023 19:39:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jZxo=AZ=citrix.com=prvs=48139b1ea=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1puenf-00069W-P1
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 19:39:35 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 650fb147-eab3-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 21:39:33 +0200 (CEST)
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
X-Inumbo-ID: 650fb147-eab3-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683229173;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8aejV8Ms7L6eLYNlIrFeJCAd+u3GgX1dUF2hUOuDAqc=;
  b=bMSQa8HD9Y18I4fZhvRN50W3irUMT2e5OkugtiVFEZE4Z08s0osCLB4d
   HELX/3mbHSlNMjclQvB6gSOsw1BvdnyGtPb1elFhhtfroxLORJgJTpMkt
   uIhxLmTPrB6IjEYxqmM04ClpxrojiJAjmd5z9xWvixpV09Y1ss8n6ORPB
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 107797743
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:JkhA6Ki0Gqj2jcP4KvVDUeTmX161ERAKZh0ujC45NGQN5FlHY01je
 htvWmvUa/uPM2L1e41zYI7go0tSvpPQm9c2SQZvqSBjEigb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWj0N8klgZmP6sT4QeCzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tRCCQ8DUBahqd7mxavnRPBrxeYKC+/CadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XWjtUsl+K44Ew5HDe1ldZ27nxKtvFPNeNQK25m27B/
 j2ZrjumXkpy2Nq31Xmhz2m2xcbzmj7/YqIMF4+p+/pnjwjGroAUIEJPDgbqyRWjsWahX/pPJ
 kpS/TAhxYAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxLkouQyNFadcmnNQrXjFs3
 ViM9+4FHhQ27ufTEyjEsO7J83XrY3N9wXI+iTEsFyo67eflgq8P3hfWEth6F+2Xp/rTMGSlq
 9yVlxTSl4n/nOZSifXgpQmd023zznTaZlVrv1uKBwpJ+is8Pdf4PNLwtDA3+N4adO6kok+9U
 G/ociR0xMQHFtmzmSOEW43h95n5tq/eYFUwbbOCdqTNFghBGFb5J+i8GBkkeC9U3j8sIFcFm
 nP7twJL/4N0N3C3d6JxaI/ZI510nfO6T4q5D6GMNYUmjn1NSeN61Hs2OR74M57FySDAbp3Ty
 b/EKJ3xXB72+IxszSasRvd17ILHMhsWnDuJLbiilkTP7FZrTCLNIVvzGAfUP79RAWLtiFm9z
 uuzwOPQlk4BDbekOXGImWPRRHhTRUUG6VnNg5Q/Xoa+zsBOQgnN19e5LWsdRrFY
IronPort-HdrOrdr: A9a23:eEuL2qBISPMCaULlHemW55DYdb4zR+YMi2TC1yhKKCC9Ffbo7/
 xG/c5rrCMc5wxhO03I9eruBEDEewK5yXcX2/h2AV7BZniFhILAFugLhuGOrwEIWReOkdK1vZ
 0QCJSWY+eRMbEVt6jHCXGDYrMd/OU=
X-Talos-CUID: 9a23:ePTaoW5hLF61aKfludssrm8rFP4jUFPhnHLJf0GhDiVLYZqzYArF
X-Talos-MUID: 9a23:klefQgWJbJvTq6Xq/COvoAx5LoRB36OzDHotj5Y0qsSAOCMlbg==
X-IronPort-AV: E=Sophos;i="5.99,250,1677560400"; 
   d="scan'208";a="107797743"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 2/6] x86/cpuid: Rename NCAPINTS to X86_NR_CAPS
Date: Thu, 4 May 2023 20:39:20 +0100
Message-ID: <20230504193924.3305496-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230504193924.3305496-1-andrew.cooper3@citrix.com>
References: <20230504193924.3305496-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The latter is more legible, and consistent with X86_NR_{SYNTH,BUG} which
already exist.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/alternative.c             |  2 +-
 xen/arch/x86/cpu/common.c              | 12 ++++++------
 xen/arch/x86/cpuid.c                   |  2 +-
 xen/arch/x86/include/asm/cpufeature.h  |  2 +-
 xen/arch/x86/include/asm/cpufeatures.h |  2 +-
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
index 99482766b51f..0434030693a9 100644
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -200,7 +200,7 @@ static void init_or_livepatch _apply_alternatives(struct alt_instr *start,
 
         BUG_ON(a->repl_len > total_len);
         BUG_ON(total_len > sizeof(buf));
-        BUG_ON(a->cpuid >= NCAPINTS * 32);
+        BUG_ON(a->cpuid >= X86_NR_CAPS * 32);
 
         /*
          * Detect sequences of alt_instr's patching the same origin site, and
diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index edc4db1335eb..1be049e332ce 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -55,8 +55,8 @@ unsigned int paddr_bits __read_mostly = 36;
 unsigned int hap_paddr_bits __read_mostly = 36;
 unsigned int vaddr_bits __read_mostly = VADDR_BITS;
 
-static unsigned int cleared_caps[NCAPINTS];
-static unsigned int forced_caps[NCAPINTS];
+static unsigned int cleared_caps[X86_NR_CAPS];
+static unsigned int forced_caps[X86_NR_CAPS];
 
 DEFINE_PER_CPU(bool, full_gdt_loaded);
 
@@ -501,7 +501,7 @@ void identify_cpu(struct cpuinfo_x86 *c)
 
 #ifdef NOISY_CAPS
 	printk(KERN_DEBUG "CPU: After vendor identify, caps:");
-	for (i = 0; i < NCAPINTS; i++)
+	for (i = 0; i < X86_NR_CAPS; i++)
 		printk(" %08x", c->x86_capability[i]);
 	printk("\n");
 #endif
@@ -530,7 +530,7 @@ void identify_cpu(struct cpuinfo_x86 *c)
 	for (i = 0; i < FSCAPINTS; ++i)
 		c->x86_capability[i] &= known_features[i];
 
-	for (i = 0 ; i < NCAPINTS ; ++i) {
+	for (i = 0 ; i < X86_NR_CAPS ; ++i) {
 		c->x86_capability[i] |= forced_caps[i];
 		c->x86_capability[i] &= ~cleared_caps[i];
 	}
@@ -548,7 +548,7 @@ void identify_cpu(struct cpuinfo_x86 *c)
 
 #ifdef NOISY_CAPS
 	printk(KERN_DEBUG "CPU: After all inits, caps:");
-	for (i = 0; i < NCAPINTS; i++)
+	for (i = 0; i < X86_NR_CAPS; i++)
 		printk(" %08x", c->x86_capability[i]);
 	printk("\n");
 #endif
@@ -585,7 +585,7 @@ void identify_cpu(struct cpuinfo_x86 *c)
 	 */
 	if ( c != &boot_cpu_data ) {
 		/* AND the already accumulated flags with these */
-		for ( i = 0 ; i < NCAPINTS ; i++ )
+		for ( i = 0 ; i < X86_NR_CAPS ; i++ )
 			boot_cpu_data.x86_capability[i] &= c->x86_capability[i];
 
 		mcheck_init(c, false);
diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 455a09b2dd22..fd8021c6f16c 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -19,7 +19,7 @@ bool recheck_cpu_features(unsigned int cpu)
 
     identify_cpu(&c);
 
-    for ( i = 0; i < NCAPINTS; ++i )
+    for ( i = 0; i < X86_NR_CAPS; ++i )
     {
         if ( !(~c.x86_capability[i] & bsp->x86_capability[i]) )
             continue;
diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
index 4140ec0938b2..66bd4e296a18 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -26,7 +26,7 @@ struct cpuinfo_x86 {
     unsigned char x86_mask;
     int cpuid_level;                   /* Maximum supported CPUID level, -1=no CPUID */
     unsigned int extended_cpuid_level; /* Maximum supported CPUID extended level */
-    unsigned int x86_capability[NCAPINTS];
+    unsigned int x86_capability[X86_NR_CAPS];
     char x86_vendor_id[16];
     char x86_model_id[64];
     unsigned int x86_cache_size;       /* in KB - valid only when supported */
diff --git a/xen/arch/x86/include/asm/cpufeatures.h b/xen/arch/x86/include/asm/cpufeatures.h
index da0593de8542..e982ee920ce1 100644
--- a/xen/arch/x86/include/asm/cpufeatures.h
+++ b/xen/arch/x86/include/asm/cpufeatures.h
@@ -53,4 +53,4 @@ XEN_CPUFEATURE(IBPB_ENTRY_HVM,    X86_SYNTH(29)) /* MSR_PRED_CMD used by Xen for
 #define X86_BUG_IBPB_NO_RET       X86_BUG( 3) /* IBPB doesn't flush the RSB/RAS */
 
 /* Total number of capability words, inc synth and bug words. */
-#define NCAPINTS (FSCAPINTS + X86_NR_SYNTH + X86_NR_BUG) /* N 32-bit words worth of info */
+#define X86_NR_CAPS (FSCAPINTS + X86_NR_SYNTH + X86_NR_BUG) /* N 32-bit words worth of info */
-- 
2.30.2


