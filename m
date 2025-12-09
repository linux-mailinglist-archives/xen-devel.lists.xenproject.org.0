Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D26DCB0B2F
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 18:19:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182037.1504996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT1Mn-00065G-90; Tue, 09 Dec 2025 17:19:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182037.1504996; Tue, 09 Dec 2025 17:19:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT1Mn-00063M-5U; Tue, 09 Dec 2025 17:19:13 +0000
Received: by outflank-mailman (input) for mailman id 1182037;
 Tue, 09 Dec 2025 17:19:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q2e4=6P=bounce.vates.tech=bounce-md_30504962.69385a0b.v1-71b45fdb3d9c48168c0d6ddc909dd279@srs-se1.protection.inumbo.net>)
 id 1vT1Ml-0005cC-DS
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 17:19:11 +0000
Received: from mail132-20.atl131.mandrillapp.com
 (mail132-20.atl131.mandrillapp.com [198.2.132.20])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2bc3a4c7-d523-11f0-9cce-f158ae23cfc8;
 Tue, 09 Dec 2025 18:19:09 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-20.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4dQlvH2ftLzFCWZgT
 for <xen-devel@lists.xenproject.org>; Tue,  9 Dec 2025 17:19:07 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 71b45fdb3d9c48168c0d6ddc909dd279; Tue, 09 Dec 2025 17:19:07 +0000
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
X-Inumbo-ID: 2bc3a4c7-d523-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1765300747; x=1765570747;
	bh=bXiyzxs3iUF4ajO5dnSngv/r6PHtcuT4FUiRa2n+DuM=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=xK2cfOkseAdXCm8DGf4afVYKn+Rdd7KajWw3YoRcQH0EJKOg3vvmE6IC2IZDU+h2i
	 nyR1selZQpnbjt0U6HK8jY0fywgRc/kZMdNQpmN7PW1vrvZ+HOApvq7cKVJScKA3Rg
	 UUzUwASoxbhvD3ChaMBAavYU+FV8TjyjmSZAtN9aqDwlqjfxq8y77RRRgMLugrGPwb
	 J0wFHUQ6AlvnmDjT99UEbaj4QZnJUmHWfP+b09UuGIzJoY6MC+1/e9hm14oMG+EPcm
	 /fCxmKyYR1LGHY8BQGBsGVzDlTFBhWxtsRK/TjC2o5Jimm9UWVQwFjYQhEBZ6pjoUR
	 gjd4f0csS3pZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1765300747; x=1765561247; i=teddy.astie@vates.tech;
	bh=bXiyzxs3iUF4ajO5dnSngv/r6PHtcuT4FUiRa2n+DuM=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=YPtwBke41cGNUfV2fiFNntSdV2wj6epbTM/idYUPN3X+hC7quYux7sSER6rXUUxTs
	 f8zh7ht8bpAZn1yp8/gTR3EnFHdEGsVzhq6tfpR8KXP+9vAQnNPVzDsyQ0R5Pu1bvK
	 Lw9kyNptTPz37K3w4gWrGK9JfOuECsVYiorP3bdjf+ug1LaKVlK7TrTKWXaVH6htQJ
	 uHeQxadSfMH5k4Zl+65xJshZQHuJNZ3p9ckYFWvJHz3H5WTFfASEvhKSgW0/XiSz6o
	 Mw7uYN8sk9IX7WdxQLL7FyueszTDztDp9fgWegWbn66SQFRpr4i5mfgEXDOCEM0fum
	 4waeldQ1PMHAQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v3=202/3]=20x86/platform:=20Expose=20DTS=20sensors=20MSR?=
X-Mailer: git-send-email 2.51.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1765300746413
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <5ae285cb5c494651c1f4842f36891eaf6dc28355.1765300623.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1765300623.git.teddy.astie@vates.tech>
References: <cover.1765300623.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.71b45fdb3d9c48168c0d6ddc909dd279?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251209:md
Date: Tue, 09 Dec 2025 17:19:07 +0000
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
 xen/arch/x86/include/asm/msr-index.h | 3 +++
 xen/arch/x86/platform_hypercall.c    | 6 ++++++
 2 files changed, 9 insertions(+)

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
index 79bb99e0b6..237340ee42 100644
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
+        return raw_cpu_policy.basic.pm.dts;
     }
 
     if ( ppin_msr && msr == ppin_msr )
-- 
2.51.2



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


