Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF6F4B5103
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:05:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271647.466239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb2H-0001jc-4R; Mon, 14 Feb 2022 13:04:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271647.466239; Mon, 14 Feb 2022 13:04:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb2G-0001d3-T7; Mon, 14 Feb 2022 13:04:56 +0000
Received: by outflank-mailman (input) for mailman id 271647;
 Mon, 14 Feb 2022 13:04:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb2E-0008IH-EI
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:04:54 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b253348c-8d96-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:04:53 +0100 (CET)
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
X-Inumbo-ID: b253348c-8d96-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843893;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=ipAxHYrAKEzK9SFgAkUSAhz6N1h8OI0W6ZrwtK0U1gA=;
  b=P/DyMK0yomKaNBSVSgfoXEmDe9eUlGZu91PE+aKcc78M15aIAsqQDBA/
   DlbUifezqwFpzAPX8/ek2DeM2PCPTjy1cvUfi2lGspnhdLIBOAvdMuujL
   pir86Gz2ZBZnepTpgVF4J3YdKFjW2ZpLa52u7qqACDEa8BR7k8AME43Y4
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: spdufPN7QL5caJcmVWTXNMp5zXVwJqXGVqJ8c49c8TGoa49DhSj9cthVBz2xX32eXHySfnrz3h
 8RbwRuDOI6g/4sXW7ADlK5rW4F1/N77aJOmQtKUgEe30Lprf6UMQODg/E/qb5BgffjialJrY7J
 hLV+9dkO2+iMpGnqOvODt2WsIcpklG/TwJrkO5YeZ3O1VNyOiP0AmK7QLyvInylX762a3CDeL3
 BtzBMrYI4xOP04RfM2mcM/9vDtLqabCKNw9PNbH04IhSo2BxgFpkL+yPI79Iu3qOyzwCmoP6Ya
 RSENZGY+W2QttGzQ38y4sf5K
X-SBRS: 5.1
X-MesageID: 66374750
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:9VU2t6v7QXDun761HSGkfdk2dOfnVElZMUV32f8akzHdYApBsoF/q
 tZmKTuAPaqCYWXyedknOtm/pEsFusDdmNdhHARk+3owHyMb+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYy2IThWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl6MObaT5yAqHw27oef0hDSChDDPd80eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6AO
 ZFGNWUyNHwsZTVxOwYPFLISs9v53HelWhlk81Ks/Kk4tj27IAtZj+G2bYu9lsaxbdVYmAOUq
 3zL+0z9AwoGL5qPxDyd6HWui+TT2yThV+ov+KaQr6AwxgfJnypKVUNQBQDTTeSFZlCWBo10C
 3VPxiYS7vYx2B2wFdDAbkeCiSvR1vIDYOZ4H+o/4QCL76Pb5QeFG2QJJgJ8hMwaWNweHmJzi
 ALQ9z/9LXk26eDOFyrBnluBhW7qYUAowXk+iTjopOfvy/3qu8kNgx3GVb6P+4bl34SuSVkcL
 91nxRXSZon/b+ZWjc1XHnid2lpAQ6QlqSZvuG3qspqNtF8RWWJcT9XABaLnxfhBNp2FaVKKo
 WIJncOThMhXU83Ry3zdHbhVRerzjxpgDNE7qQQxd6TNChz3oyLzFWyuyG0WyLhV3jYsJmayP
 R67VfJ5755PJnq6BZKbkKrqY/nGOZPITIy/PtiNN4ImSsEoKGevoXE/DWbNjjuFuBV9zskC1
 WKzLJ/E4YAyUv88klJbho41jNcW+8zJ7T2PG86rlUn7uVdcDVbMIYo43JK1RrhRxMu5TM/9q
 r6z7uOGlEdSVvPQeC7S/dJBJFwGNyFjV5v3t9ZWZqiIJQ8/QDMtDPrYwLUAfY15nvsKyreUr
 y/lAkIImkDigXDnKBmRbiwxYr3YQpsi/2kwOjYhPAj01iF7M5qv9qoWa7A+YaIjqL541fdxQ
 vRcI5eAD/1DRy7p4TMYaZWh/oVueA7y3VCFPja/YSh5dJllHlSb9tjhdwrp1S8PEivo6pdu/
 +z+jlvWGMNRSR5jAcDabOOU42mw5XVNyvhvW0boI8VIfBm++oZdNCGs3OQ8JNsBKEufy2LCh
 RqWGxoRucLEv5QxrIvSnamBooqkT7l+E05dEzWJ5Lq6L3CHrG+qwIsGW+eUZzHNEmjz/fz6N
 +lSyvj9NtwBnUpL7NUgQ+o6k/pm6ou9vaJewyRlAG7PPgaiBb5XK3Wb2dVC6/9WzbhDtArqA
 k+C97G241lS1B8JxLLJGDcYUw==
IronPort-HdrOrdr: A9a23:fRCDYa8SRoZtE6D/+hBuk+DaI+orL9Y04lQ7vn2YSXRuHPBw9v
 re5cjzuiWVtN98Yh0dcJW7Scy9qBDnhPhICOsqTNSftWDd0QPCRuxfBMnZslnd8kXFh4lgPM
 xbEpSWZueeMbEDt7eZ3DWF
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="66374750"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 45/70] x86/cpu: CFI hardening
Date: Mon, 14 Feb 2022 12:51:02 +0000
Message-ID: <20220214125127.17985-46-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Control Flow Integrity schemes use toolchain and optionally hardware support
to help protect against call/jump/return oriented programming attacks.

Use cf_check to annotate function pointer targets for the toolchain.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/cpu/amd.c      | 6 +++---
 xen/arch/x86/cpu/centaur.c  | 2 +-
 xen/arch/x86/cpu/common.c   | 2 +-
 xen/arch/x86/cpu/cpu.h      | 2 +-
 xen/arch/x86/cpu/hygon.c    | 2 +-
 xen/arch/x86/cpu/intel.c    | 6 +++---
 xen/arch/x86/cpu/shanghai.c | 2 +-
 7 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 2d18223f20ef..4999f8be2b11 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -208,7 +208,7 @@ static void __init noinline probe_masking_msrs(void)
  * parameter of NULL is used to context switch to the default host state (by
  * the cpu bringup-code, crash path, etc).
  */
-static void amd_ctxt_switch_masking(const struct vcpu *next)
+static void cf_check amd_ctxt_switch_masking(const struct vcpu *next)
 {
 	struct cpuidmasks *these_masks = &this_cpu(cpuidmasks);
 	const struct domain *nextd = next ? next->domain : NULL;
@@ -634,7 +634,7 @@ void amd_log_freq(const struct cpuinfo_x86 *c)
 #undef FREQ
 }
 
-void early_init_amd(struct cpuinfo_x86 *c)
+void cf_check early_init_amd(struct cpuinfo_x86 *c)
 {
 	if (c == &boot_cpu_data)
 		amd_init_levelling();
@@ -744,7 +744,7 @@ void __init detect_zen2_null_seg_behaviour(void)
 
 }
 
-static void init_amd(struct cpuinfo_x86 *c)
+static void cf_check init_amd(struct cpuinfo_x86 *c)
 {
 	u32 l, h;
 
diff --git a/xen/arch/x86/cpu/centaur.c b/xen/arch/x86/cpu/centaur.c
index 34a5bfcaeef2..eac49d78db62 100644
--- a/xen/arch/x86/cpu/centaur.c
+++ b/xen/arch/x86/cpu/centaur.c
@@ -48,7 +48,7 @@ static void init_c3(struct cpuinfo_x86 *c)
 	display_cacheinfo(c);
 }
 
-static void init_centaur(struct cpuinfo_x86 *c)
+static void cf_check init_centaur(struct cpuinfo_x86 *c)
 {
 	if (c->x86 == 6)
 		init_c3(c);
diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index c4f07f2d1da4..6b674bf15e8b 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -104,7 +104,7 @@ bool __init is_forced_cpu_cap(unsigned int cap)
 	return test_bit(cap, forced_caps);
 }
 
-static void default_init(struct cpuinfo_x86 * c)
+static void cf_check default_init(struct cpuinfo_x86 * c)
 {
 	/* Not much we can do here... */
 	/* Check if at least it has cpuid */
diff --git a/xen/arch/x86/cpu/cpu.h b/xen/arch/x86/cpu/cpu.h
index b593bd85f04f..a228087f9157 100644
--- a/xen/arch/x86/cpu/cpu.h
+++ b/xen/arch/x86/cpu/cpu.h
@@ -18,7 +18,7 @@ extern void display_cacheinfo(struct cpuinfo_x86 *c);
 extern void detect_ht(struct cpuinfo_x86 *c);
 extern bool detect_extended_topology(struct cpuinfo_x86 *c);
 
-void early_init_amd(struct cpuinfo_x86 *c);
+void cf_check early_init_amd(struct cpuinfo_x86 *c);
 void amd_log_freq(const struct cpuinfo_x86 *c);
 void amd_init_lfence(struct cpuinfo_x86 *c);
 void amd_init_ssbd(const struct cpuinfo_x86 *c);
diff --git a/xen/arch/x86/cpu/hygon.c b/xen/arch/x86/cpu/hygon.c
index cdc94130dd2e..3c8516e014c3 100644
--- a/xen/arch/x86/cpu/hygon.c
+++ b/xen/arch/x86/cpu/hygon.c
@@ -28,7 +28,7 @@ static void hygon_get_topology(struct cpuinfo_x86 *c)
 	                        c->phys_proc_id, c->cpu_core_id);
 }
 
-static void init_hygon(struct cpuinfo_x86 *c)
+static void cf_check init_hygon(struct cpuinfo_x86 *c)
 {
 	unsigned long long value;
 
diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
index 06b0e552cc8f..ff7c02223687 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -176,7 +176,7 @@ static void __init probe_masking_msrs(void)
  * parameter of NULL is used to context switch to the default host state (by
  * the cpu bringup-code, crash path, etc).
  */
-static void intel_ctxt_switch_masking(const struct vcpu *next)
+static void cf_check intel_ctxt_switch_masking(const struct vcpu *next)
 {
 	struct cpuidmasks *these_masks = &this_cpu(cpuidmasks);
 	const struct domain *nextd = next ? next->domain : NULL;
@@ -286,7 +286,7 @@ static void __init noinline intel_init_levelling(void)
 		ctxt_switch_masking = intel_ctxt_switch_masking;
 }
 
-static void early_init_intel(struct cpuinfo_x86 *c)
+static void cf_check early_init_intel(struct cpuinfo_x86 *c)
 {
 	u64 misc_enable, disable;
 
@@ -500,7 +500,7 @@ static void intel_log_freq(const struct cpuinfo_x86 *c)
     }
 }
 
-static void init_intel(struct cpuinfo_x86 *c)
+static void cf_check init_intel(struct cpuinfo_x86 *c)
 {
 	/* Detect the extended topology information if available */
 	detect_extended_topology(c);
diff --git a/xen/arch/x86/cpu/shanghai.c b/xen/arch/x86/cpu/shanghai.c
index 08a81f0f0c8e..95ae544f8c54 100644
--- a/xen/arch/x86/cpu/shanghai.c
+++ b/xen/arch/x86/cpu/shanghai.c
@@ -3,7 +3,7 @@
 #include <asm/processor.h>
 #include "cpu.h"
 
-static void init_shanghai(struct cpuinfo_x86 *c)
+static void cf_check init_shanghai(struct cpuinfo_x86 *c)
 {
     if ( cpu_has(c, X86_FEATURE_ITSC) )
     {
-- 
2.11.0


