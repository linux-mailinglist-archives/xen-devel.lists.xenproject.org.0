Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41680C1BE1D
	for <lists+xen-devel@lfdr.de>; Wed, 29 Oct 2025 16:59:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152913.1483438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE8aP-0007hF-42; Wed, 29 Oct 2025 15:59:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152913.1483438; Wed, 29 Oct 2025 15:59:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE8aP-0007fT-0L; Wed, 29 Oct 2025 15:59:45 +0000
Received: by outflank-mailman (input) for mailman id 1152913;
 Wed, 29 Oct 2025 15:59:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ufu9=5G=bounce.vates.tech=bounce-md_30504962.690239e5.v1-afb8864a290e453a817b2593eea3e1f7@srs-se1.protection.inumbo.net>)
 id 1vE8aM-0006vP-Rc
 for xen-devel@lists.xenproject.org; Wed, 29 Oct 2025 15:59:42 +0000
Received: from mail187-33.suw11.mandrillapp.com
 (mail187-33.suw11.mandrillapp.com [198.2.187.33])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 430e942c-b4e0-11f0-9d16-b5c5bf9af7f9;
 Wed, 29 Oct 2025 16:59:34 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-33.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4cxX4P22nLzBsTkj3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Oct 2025 15:59:33 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 afb8864a290e453a817b2593eea3e1f7; Wed, 29 Oct 2025 15:59:33 +0000
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
X-Inumbo-ID: 430e942c-b4e0-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1761753573; x=1762023573;
	bh=fX3FQuwJNcVnrtIjh9/0e8sasKI627tRhXFxwIbZXVI=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=oVfsFR0cSu5vn9AbovxZA3Xye3mi9d9CjhjzPRyqn74IE+qaKjTHEYbDasUgQeK0p
	 89TaT2HLfS/5GPIUFDXFenzbfq5s35lvKVBMSH8h9fRd31WOOKD+qxRwbXd91KMq9S
	 ELf070yqwk4MNCsZV8PoE/ijfNXTbaYEWmF8TvBOEeKwE2n+jchNPQDZ1fkUS7jpTT
	 8eZmpoc5p+Tb0/usMyi3STh5wGriaFQ3FKxp9UoLq+QrLzc1/3Fd9tvXK3D4zIW9i2
	 bKgklBWy+dLrJk6MYvGM4z6oirOyp+1nMCkOHjCrQs3/xlqAPiS012vSPhK5/Z6mf9
	 9sTL9/+OxSS2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1761753573; x=1762014073; i=teddy.astie@vates.tech;
	bh=fX3FQuwJNcVnrtIjh9/0e8sasKI627tRhXFxwIbZXVI=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=mx+otb9E04VeomKWpOp0/PgV5Tz6gHwUnACikxaS0Zu3lW99NV0GcNv3+W9rVrjzO
	 1GJRAv0SYQucrgmh+Cjs9DaXBHQDGUQXmmAPckaf+zDZ6G9iCHbyz0yYL2kUuLxWcI
	 VL67+4Q9QVab6AJO15s3z3jETd8dkHBOecz7gviedNyGpEizvW9C8ROvZYfJQHn60f
	 2NUFJk1fLp0pojibvOMo/I3Vv+z5aEYll5Xqrnu3wTjcpioAWnaA9MkFGHTGSzsK4e
	 0ku1oS2SMut/kezBmhxH3WNRdx5M1hhj33uIYYHVxOcrwc0S3UGeEPsolFl/W6olxB
	 MEXZzQ39ezZdw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=20for-4.22=20v2=202/3]=20x86/platform:=20Expose=20DTS=20sensors=20MSR?=
X-Mailer: git-send-email 2.51.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1761753572425
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <1001287258cf9652c749c66c6565478085a8657c.1761752801.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1761752801.git.teddy.astie@vates.tech>
References: <cover.1761752801.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.afb8864a290e453a817b2593eea3e1f7?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251029:md
Date: Wed, 29 Oct 2025 15:59:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Intel provide CPU sensors through "DTS" MSRs. As there MSR are core-specific
(or package-specific), we can't reliably fetch them from Dom0 directly.
Expose these MSR (if supported) through XENPF_resource_op so that it is
accessible through hypercall.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
v2:
 - move DTS MSR out of legacy list, review MSR naming
 - use CPU policy instead of inline CPUID

 xen/arch/x86/include/asm/msr-index.h | 3 +++
 xen/arch/x86/platform_hypercall.c    | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index df52587c85..7c6af7bd4d 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -115,6 +115,9 @@
 #define  MCU_OPT_CTRL_GDS_MIT_DIS           (_AC(1, ULL) <<  4)
 #define  MCU_OPT_CTRL_GDS_MIT_LOCK          (_AC(1, ULL) <<  5)
 
+#define MSR_DTS_TEMPERATURE_TARGET          0x000001a2
+#define MSR_DTS_PACKAGE_THERM_STATUS        0x000001b1
+
 #define MSR_FRED_RSP_SL0                    0x000001cc
 #define MSR_FRED_RSP_SL1                    0x000001cd
 #define MSR_FRED_RSP_SL2                    0x000001ce
diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index 79bb99e0b6..d9872ddd3e 100644
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
+    case MSR_DTS_TEMPERATURE_TARGET:
+    case MSR_DTS_PACKAGE_THERM_STATUS:
+        return raw_cpu_policy.basic.pm.dts;
     }
 
     if ( ppin_msr && msr == ppin_msr )
-- 
2.51.2



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


