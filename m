Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C8870F530
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 13:26:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538972.839444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1mcn-0007nO-Bw; Wed, 24 May 2023 11:25:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538972.839444; Wed, 24 May 2023 11:25:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1mcn-0007g3-7R; Wed, 24 May 2023 11:25:49 +0000
Received: by outflank-mailman (input) for mailman id 538972;
 Wed, 24 May 2023 11:25:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KTJK=BN=citrix.com=prvs=501cbbf32=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q1mcl-0006dp-86
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 11:25:47 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8be0275-fa25-11ed-8611-37d641c3527e;
 Wed, 24 May 2023 13:25:45 +0200 (CEST)
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
X-Inumbo-ID: b8be0275-fa25-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684927545;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wH9OWbCjMtjVvBDJDgEnYY93dMh+0saP5eOPD5fBQ2Q=;
  b=UkJqOY3Cs1Bhc5UXqCQGRE0buql3rLCVWUCnhB61tWy+PeFq7mNWHcqk
   B8eT5qStL1d2zT19x6JO/w1zk++JDv/+v9jGqBCiu6hEHn+kmWf+MryKC
   kmuiRtmaRzpriIEsAB4kzgv2vIetiUnO1NGsIE1Yq0871Me6w+pxV5Tgm
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 110226278
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:tomPLagrxQlYzaXd02yFPLYWX161aBAKZh0ujC45NGQN5FlHY01je
 htvXW/UOvyCN2P1KNAkYdy39hkO6JTSytdgHAVoriszEC4b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyq0N8klgZmP6sT4QWCzyJ94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQhdQ5KMjmxvNuw74+dVPVuu/Y6b830adZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XWjtUsl+K44Ew5HDe1ldZ27nxKtvFPNeNQK25m27B/
 zqcpTqjXUFy2Nq35xmC3Gmvoff1ki74Z6MsLJyRq/tojwjGroAUIEJPDgbqyRWjsWauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O+8w5RyJy6HUyx2EHWVCRTlEAPQ5sOcmSDps0
 UWG9+4FHhQ27ufTEyjEsO7J83XrY3N9wXI+iTEsdFY7pIXKkroKiD3yaMh/EpOHl57xBmSlq
 9yVlxQWi7IWhM8N8qy0+1Hbnj6hzqT0oh4JChb/BTz8sF4gDGKxT8nxsAWAs64cRGqMZgPZ1
 EXojfRy+wzn4XulsCWWCNsAE7iyjxpuGG2N2AU/d3XNGtnExpJCQWyyyGsmTKuKGpxeEdMMX
 KM0kV052XOrFCH2BZKbmqroYyjQ8YDuFM7+StffZcdUb556eWevpX8+OR7OgTCxyxZ9y8nT3
 Kt3lu71Vx4n5VlPlmLqF4/xL5dwrszB+Y8jbc+ilEn2uVZvTHWUVa0EIDOzUwzN14vd+F+92
 48GZ6O3J+B3DLWWjt//rdRCcjjn7BETWfjLliCgXrHee1U/QT1wVJc8A9oJIuRYokicrc+Ql
 lnVZ6OS4ACXaaHvQelSVk1eVQ==
IronPort-HdrOrdr: A9a23:z2TrkalLGKL8IPFzhZLjPPJNlXPpDfLo3DAbv31ZSRFFG/Fw9/
 rCoB17726QtN91YhsdcL+7V5VoLUmzyXcX2/hyAV7BZmnbUQKTRekP0WKL+Vbd8kbFh41gPM
 lbEpSXCLfLfCJHZcSR2njELz73quP3jJxBho3lvghQpRkBUdAF0+/gYDzranGfQmN9dP0EPa
 vZ3OVrjRy6d08aa8yqb0N1JNQq97Xw5fTbiQdtPW9f1DWz
X-Talos-CUID: 9a23:3P1k6GBFSgPutLX6ExA6yglIM/IeS3vy8VHOP02FO38qTKLAHA==
X-Talos-MUID: 9a23:goc8Wgqt2kaMpi7bUy8ezx9BM+lz4IO2Mk8AkqonhfGlHHF1OTjI2Q==
X-IronPort-AV: E=Sophos;i="6.00,189,1681185600"; 
   d="scan'208";a="110226278"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v2 09/10] x86/tsx: Remove opencoded MSR_ARCH_CAPS check
Date: Wed, 24 May 2023 12:25:25 +0100
Message-ID: <20230524112526.3475200-10-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230524112526.3475200-1-andrew.cooper3@citrix.com>
References: <20230524112526.3475200-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The current cpu_has_tsx_ctrl tristate is serving double pupose; to signal the
first pass through tsx_init(), and the availability of MSR_TSX_CTRL.

Drop the variable, replacing it with a once boolean, and altering
cpu_has_tsx_ctrl to come out of the feature information.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
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
index e3154ec5800d..9047ea43f503 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -184,6 +184,7 @@ static inline bool boot_cpu_has(unsigned int feat)
 
 /* MSR_ARCH_CAPS */
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


