Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE7CCD08E7
	for <lists+xen-devel@lfdr.de>; Fri, 19 Dec 2025 16:42:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1190778.1511071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWccb-0007OA-Db; Fri, 19 Dec 2025 15:42:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1190778.1511071; Fri, 19 Dec 2025 15:42:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWccb-0007Lm-66; Fri, 19 Dec 2025 15:42:25 +0000
Received: by outflank-mailman (input) for mailman id 1190778;
 Fri, 19 Dec 2025 15:42:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iSaV=6Z=bounce.vates.tech=bounce-md_30504962.69457259.v1-4c58b2a4835640a0bbfaf06e01e56b5f@srs-se1.protection.inumbo.net>)
 id 1vWccZ-0006gj-Ar
 for xen-devel@lists.xenproject.org; Fri, 19 Dec 2025 15:42:23 +0000
Received: from mail179-28.suw41.mandrillapp.com
 (mail179-28.suw41.mandrillapp.com [198.2.179.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f4a5d33-dcf1-11f0-b15b-2bf370ae4941;
 Fri, 19 Dec 2025 16:42:22 +0100 (CET)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-28.suw41.mandrillapp.com (Mailchimp) with ESMTP id
 4dXsGx64BNzMQxZx2
 for <xen-devel@lists.xenproject.org>; Fri, 19 Dec 2025 15:42:17 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 4c58b2a4835640a0bbfaf06e01e56b5f; Fri, 19 Dec 2025 15:42:17 +0000
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
X-Inumbo-ID: 4f4a5d33-dcf1-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1766158937; x=1766428937;
	bh=7xVUdRF8zsjQLBrOasgnpmrVwohD/+GH3wtuo62wSW8=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=MHqxFPjgXgRIZmOtgpLR78SHHIbeAOIj5REB0rBJPby7vez+QD340FC7nPQHNr4pP
	 ReaoV2mxTapgs3E0HVnykgPnhf7DFmh8TWOFY68vGRUDnZdhC5BNnCJOaUNn8B+oOo
	 IF9wwxEfbvvUYRB34/iGC9LY/J9ThylhsFKi0UuIpArN+O21919ZjENJU+J7KFSKgM
	 DSjooQqEHjyh906zZwGEgAFvGAhyPn0k7iJBIoOpwuZyWkJGnMuM+b42gycFris67N
	 qHrCso8qA3oFDkeohtxnho/2KnRkKjdeuHVnhXvvy1YPplVWc3aTe58nktzdTZM9pC
	 a9l/sIjVcS11g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1766158937; x=1766419437; i=teddy.astie@vates.tech;
	bh=7xVUdRF8zsjQLBrOasgnpmrVwohD/+GH3wtuo62wSW8=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Y1Kd2SnzQmQ4quLZBXIsusqYcHsWt4eEwtwU2SkxgdBnC1kHGnbPyX+q/F7rfQ8GO
	 Am8gIVs/RRhLpXTCzOFXd+4n754jdIMfRPKa8KqMZmeUlbxRgy3TkJLFs+J/FKwO+O
	 vD9KdqrCgG8ci84NjpLSfDkB29NQnLPa+n8MKPUnfrPgoYfQcNKBIHtojoJRl2FuOv
	 f3y0enRtnLqF6D4I1RnHh2CW7sl/l77J1emPL9eU8DFKDcbKcWKXgwmBB38h+vzuLL
	 TC1vVwg2ysNI7UZUTzX05Zck7m7CItUKqkh0O13JFNOZAjl/pblM/pPGfUD33B83H6
	 t9xOz3LBMuWKA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v4=203/4]=20x86/platform:=20Expose=20DTS=20sensors=20MSR?=
X-Mailer: git-send-email 2.51.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1766158936882
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <829177fefa7b2e2edeb8121357b5b3372ad1c092.1766158766.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1766158766.git.teddy.astie@vates.tech>
References: <cover.1766158766.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.4c58b2a4835640a0bbfaf06e01e56b5f?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251219:md
Date: Fri, 19 Dec 2025 15:42:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Intel provide CPU sensors through "DTS" MSRs. As these MSR are core-specific
(or package-specific), we can't reliably fetch them from Dom0 directly.
Expose these MSR (if supported) through XENPF_resource_op so that it is
accessible through hypercall.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
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
index 79bb99e0b6..2f84494759 100644
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
2.51.2



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


