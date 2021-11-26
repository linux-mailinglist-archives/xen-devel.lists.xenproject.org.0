Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A11345EEB3
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:07:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232843.403989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqax3-0004WS-Uq; Fri, 26 Nov 2021 13:07:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232843.403989; Fri, 26 Nov 2021 13:07:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqax3-0004Gd-4J; Fri, 26 Nov 2021 13:07:41 +0000
Received: by outflank-mailman (input) for mailman id 232843;
 Fri, 26 Nov 2021 13:07:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqav6-0002zD-FU
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:05:40 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8cdd30a3-4eb9-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 14:05:38 +0100 (CET)
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
X-Inumbo-ID: 8cdd30a3-4eb9-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637931938;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=izWgzigFmafOWMX4S5OZ2RAoFVxEuqnImtxUKaeis+Q=;
  b=ct1fzlr00rr7ybhs/agi/IUQnTLXMAPm2/JyRioVRn7qWRZg75HX2wpW
   9ipOjelg/KDb4lP/iBmTd342cox+gyGjNHvskBt8QxJ/CUP+YkXiQQ23V
   QUteiLhM4U7FD6kZPIcwDl+hpOQvo+M2U77FgF9pJi66wWzJGYdkAhmkb
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Ro8n5ILYxZ/ug8PPdK97TKOMvPeoamB5J066UCLkq97/cuW2cOTxNCHICw//9Z6tuSW4YoQw3V
 LhKOVoDmI1F5tq4HGu4klMIWPcVHCYnH3l2tUiORbVX8AOJuZHzFJBUpWqZgHT6CmGgoUMvPY2
 kqfkvhSBDoZRH2lYkj3MqSjmuAQUYwcxgGcK+1VPHIAE0wE+fTw17R5WXSa1A2+QC+MTYTOP5Z
 vLX3oAoGSXIpceYTmzfClP4CWNnZ52YBBbytMSTRHcmI/7obX9uP8hoXQOL+XZx5LP6PJFNcLy
 LLyVIpoFmoBq6d02pwxz1lVQ
X-SBRS: 5.1
X-MesageID: 58696015
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:iX9RcaPEV2s+AdHvrR1okMFynXyQoLVcMsEvi/4bfWQNrUoj0jUBy
 TRNW27UbP6NZWXwKY8lPN7l9EsPsZKEy9RqSQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6bUsxNbVU8En540Eg9w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYozWts+pVm
 ZZijoCpFyEtJfbFwOE5bSANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YsBqit4uM4/AO4QHt2s75TrYEewnUdbIRKCiCdpwgWdu154WRKu2i
 8wxdHlgQk7Hbh12BFopIok0s8eRmiH9SmgNwL6SjfVuuDWCpOBr65DyNPLFd9rMQt9a9m66j
 G/b+2XyAjkBKceSjzGC9xqEluLJ2C/2Ro8WPLm57eJxxk2ewHQJDx8bXkf9puO24nNSQPoGd
 RZSoHB36/Fvqgr7FbERQiFUvlaEmjImf4sTPNYm8V+rzrGP6l6cIlY9G2sphMMdiOc6Qjkj1
 1msltzvBCByvLD9dU9x5ot4vhvpZ3FLcDZqiTssCFJcvoK9+N1bYgfnF447SMaIYsvJ9SYcK
 txghAw3nP0tgMECzM1XFniX0mv39vAlouPYjzg7v15JDCslO+ZJhKTysDA3CMqsyq7CFTFtW
 1BexqCjABgmV83lqcB0aLxl8EuVz/iEKibAplVkAoMs8T+gk1b6I9sPsG8jexY1bJpfEdMMX
 KM1kVgKjHO0FCH3BZKbnqrrU5h6pUQePYiNug/ogipmPcEqKV7vENBGbk+MxWH9+HXAYolkU
 ap3hf2EVC5AYYw+lWLeb75EjdcDm3BvrUuOFMuT50n2jtKjiIu9FO5t3K2mNbtisstpYWz9r
 r5iCid940kFDbClPHCIqdV7wJJjBSFTOK0aYvd/LoarSjeK0kl4YxMI6b9+KYFjgYpPkeLEo
 iO0VkNCkQKtjnzbMwSaLHtkbeq3D5p4qHs6Ow0qPEqphCd/Mdr+sv9HestlZ6Qj+cxi0eVwE
 6sPdfKfD6kdUT/A4TkcM8Xw9dQwaBSxiAuSFCO5ezxjLYV4TgnE94a8LAvi/SUDFAStss46r
 +Hy3w/XW8NbFQ9jENzXeLSkyFbo5SoRn+d7Xk3pJNhPeRqzrNg2enKp1vJuepMCMxTOwDeex
 j26OxZAqLmfuZIx/fnImbuA89WjHdxhExcIBGLc97u3a3XXpzLx3Y9aXe+UVjnBT2eoqr66b
 OBYwvygYv0KmFFG79h1H7pxlP9s4tLuo/lRzxh+HWWNZFOuU+syLn6D1MhJl6tM2r4G5lfmB
 hPRooFXaeeTJcfoMF8NPw50PO2M2MYdliTW8flocl7x4zV6/ebfXEhfV/VWZPex8Feh3FsZ/
 Noc
IronPort-HdrOrdr: A9a23:RiYeTq+aENcMDUYxrpBuk+DgI+orL9Y04lQ7vn2YSXRuHPBw8P
 re5cjztCWE7gr5N0tBpTntAsW9qDbnhPtICOoqTNCftWvdyQiVxehZhOOIqVDd8m/Fh4pgPM
 9bAtBD4bbLbGSS4/yU3ODBKadD/OW6
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="58696015"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 41/65] x86/cpu: Annotate fnptr targets
Date: Fri, 26 Nov 2021 12:34:22 +0000
Message-ID: <20211126123446.32324-42-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
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
index f1c32c2787c9..a5f380852b20 100644
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
index 4a163afbfc7e..7c41a21bf07c 100644
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
index 9b011c344636..d63e18100698 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -144,7 +144,7 @@ static void __init probe_masking_msrs(void)
  * parameter of NULL is used to context switch to the default host state (by
  * the cpu bringup-code, crash path, etc).
  */
-static void intel_ctxt_switch_masking(const struct vcpu *next)
+static void cf_check intel_ctxt_switch_masking(const struct vcpu *next)
 {
 	struct cpuidmasks *these_masks = &this_cpu(cpuidmasks);
 	const struct domain *nextd = next ? next->domain : NULL;
@@ -254,7 +254,7 @@ static void __init noinline intel_init_levelling(void)
 		ctxt_switch_masking = intel_ctxt_switch_masking;
 }
 
-static void early_init_intel(struct cpuinfo_x86 *c)
+static void cf_check early_init_intel(struct cpuinfo_x86 *c)
 {
 	u64 misc_enable, disable;
 
@@ -448,7 +448,7 @@ static void intel_log_freq(const struct cpuinfo_x86 *c)
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


