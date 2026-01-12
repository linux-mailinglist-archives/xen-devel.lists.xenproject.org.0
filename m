Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB11CD1426A
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 17:47:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200789.1516636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfL4Z-0003jJ-OP; Mon, 12 Jan 2026 16:47:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200789.1516636; Mon, 12 Jan 2026 16:47:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfL4Z-0003hn-KZ; Mon, 12 Jan 2026 16:47:19 +0000
Received: by outflank-mailman (input) for mailman id 1200789;
 Mon, 12 Jan 2026 16:47:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X/eV=7R=bounce.vates.tech=bounce-md_30504962.6965258a.v1-5c8b13a73ebf4ddaa406de2a0ff265a9@srs-se1.protection.inumbo.net>)
 id 1vfL4X-0003hB-Mj
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 16:47:17 +0000
Received: from mail137-3.atl71.mandrillapp.com
 (mail137-3.atl71.mandrillapp.com [198.2.137.3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 552e0326-efd6-11f0-9ccf-f158ae23cfc8;
 Mon, 12 Jan 2026 17:47:08 +0100 (CET)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-3.atl71.mandrillapp.com (Mailchimp) with ESMTP id 4dqdZf6ySfzBsV8Zg
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jan 2026 16:47:06 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 5c8b13a73ebf4ddaa406de2a0ff265a9; Mon, 12 Jan 2026 16:47:06 +0000
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
X-Inumbo-ID: 552e0326-efd6-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1768236427; x=1768506427;
	bh=p5kqd4khOY+qV68/kVI7ESMpsYgEQqqOTOVsgjsvx2c=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=m6jdMX8KTBQYQF6/aZcDbmf3ETnDa51Xxs7jVOLky3ZPLaYNGVc1NcnWr0xl3/g6H
	 qq4Kv9BBjhqUAOzVt9LEejJDiw8y7vqxgRWxkSKvogMy9LtYKEUkk9cub8eQ+yr4nb
	 jf8AWQ9LwxIU1HG+tCl4qIFjkmi54u+WYG5WXnfJXTVK+48jHO9CsFmTbM4nV5Rum9
	 q5nx+H+1/uVHm9MQYgzhp9xxwFMVXj33baOUvEjp38sb/ITqohAwQTIuEdxnR3jRhT
	 Qkn0oTWHOucCMdvMgC2rmPac08ZpmHn/A1Zk5E784Bxu5MYYgcrWdqre+JpU6s1NWr
	 D/hwzP0JYI0YQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1768236427; x=1768496927; i=teddy.astie@vates.tech;
	bh=p5kqd4khOY+qV68/kVI7ESMpsYgEQqqOTOVsgjsvx2c=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=TGhx+Hir8WsKv11K/OgnT1ZtVjVFlYJ6iESSxCKg6bCK4fshN1NzGJrg8GKuqsAM2
	 Ak6lPxUWCTIPufo32raa3lKdzh5JrWTjEMaLLYJimp/78ymEIs85eC+ZAunqs3tu1N
	 NeIepgqBxKgjIg/JSGQagBUZQ8SfigV9bZEJEp1Ol74n/dUkAhfW2eO9uZYxl1iraG
	 kcQkhO2ahkzfcYUeST6gxfNeYO+GjLAPxrq+XsDhLKDxofXhVKhah1/9WYkU0VF7S9
	 /REYFKV+ZobsUoepAFXcFLk+uDszKqieFea05CFesZ23Y/BLnShfVD3Q3/dMpc4t/O
	 UM0FETJDn5fRg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v5=201/2]=20x86/platform:=20Expose=20DTS=20sensors=20MSR?=
X-Mailer: git-send-email 2.52.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1768236425925
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <7dfa012b734f3c769da88f0f1c989d07b724bdaa.1768235932.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.5c8b13a73ebf4ddaa406de2a0ff265a9?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260112:md
Date: Mon, 12 Jan 2026 16:47:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Intel provide CPU sensors through "DTS" MSRs. As these MSR are core-specific
(or package-specific), we can't reliably fetch them from Dom0 directly.
Expose these MSR (if supported) through XENPF_resource_op so that it is
accessible through hypercall.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Needs x86/cpu-policy: Infrastructure for CPUID leaf 0x6.

v4: https://lore.kernel.org/xen-devel/cover.1766158766.git.teddy.astie@vates.tech/

v5: Removed trailing whitespace.

 xen/arch/x86/include/asm/msr-index.h | 3 +++
 xen/arch/x86/platform_hypercall.c    | 6 ++++++
 xen/include/xen/lib/x86/cpu-policy.h | 2 +-
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index df52587c85..b92a278611 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -115,6 +115,9 @@
 #define  MCU_OPT_CTRL_GDS_MIT_DIS           (_AC(1, ULL) <<  4)
 #define  MCU_OPT_CTRL_GDS_MIT_LOCK          (_AC(1, ULL) <<  5)
 
+#define MSR_TEMPERATURE_TARGET              0x000001a2
+#define MSR_PACKAGE_THERM_STATUS            0x000001b1
+
 #define MSR_FRED_RSP_SL0                    0x000001cc
 #define MSR_FRED_RSP_SL1                    0x000001cd
 #define MSR_FRED_RSP_SL2                    0x000001ce
diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index 79bb99e0b6..bbd8ce71f5 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -27,6 +27,7 @@
 #include <asm/current.h>
 #include <public/platform.h>
 #include <acpi/cpufreq/processor_perf.h>
+#include <asm/cpu-policy.h>
 #include <asm/edd.h>
 #include <asm/microcode.h>
 #include <asm/mtrr.h>
@@ -86,6 +87,11 @@ static bool msr_read_allowed(unsigned int msr)
 
     case MSR_MCU_OPT_CTRL:
         return cpu_has_srbds_ctrl;
+
+    case MSR_IA32_THERM_STATUS:
+    case MSR_TEMPERATURE_TARGET:
+    case MSR_PACKAGE_THERM_STATUS:
+        return host_cpu_policy.basic.dts;
     }
 
     if ( ppin_msr && msr == ppin_msr )
diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
index 8772ef80e3..0362f1cb24 100644
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -123,7 +123,7 @@ struct cpu_policy
             uint64_t :64, :64; /* Leaf 0x5 - MONITOR. */
 
             /* Leaf 0x6 - Therm/Perf. */
-            bool :1,
+            bool dts:1,
                 turbo:1,
                 arat:1,
                 :1,
-- 
2.52.0



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


