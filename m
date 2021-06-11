Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 843693A4697
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jun 2021 18:37:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.140550.259667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrk9H-0000Fw-Ld; Fri, 11 Jun 2021 16:36:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 140550.259667; Fri, 11 Jun 2021 16:36:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrk9H-0000Dz-IV; Fri, 11 Jun 2021 16:36:47 +0000
Received: by outflank-mailman (input) for mailman id 140550;
 Fri, 11 Jun 2021 16:36:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pdcj=LF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lrk9G-0008Of-5R
 for xen-devel@lists.xenproject.org; Fri, 11 Jun 2021 16:36:46 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0d874748-0eb0-41e7-bfe0-e803891e92b6;
 Fri, 11 Jun 2021 16:36:40 +0000 (UTC)
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
X-Inumbo-ID: 0d874748-0eb0-41e7-bfe0-e803891e92b6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623429400;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IFZX+h/NDurQeM2yQU3pr/ixDTqiEiHIAboJj1hyhp4=;
  b=H90I6vXRjFrL1ZQ35dIRuffGdJz363fl6rligaEvX4mXuXOX5D5Hut/o
   JPLbs9qfvCQVnz9BkObO5L8CYoJF7GwxIKzLcY1oEV7RyXFS10v1Thw3b
   OVXPEzHCHGPy0awpSNe6UOQ/ma9NiArD+4DJIoA5jVP4O3EZ1ZbiqcpNH
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: xrSGWtslKYaKBq4K6IL5VyQMKgp6haUR+g8xAsBarllu5V+3lM9qe7FIAw+6U5RjHBW0ycZywg
 FDCWD1a1Z5OWnlkIg4kuVGnpGqIfZvioF/QGFjiwS24CtJ8wrfXCeLxfahX8ID5m8RldEBiXE9
 ahR5WaN3SDqohtxF8F07vO0Ls3QQBCkBZx1zrYpv0DlTAst3fuNmTAmFtyo9CwTuoiLfMgXF8P
 6sD+DvxQvW0jd9pPyPk3A9Cp/0elYQRy0Hx+s3W4JugOxcjXNyRh3ryEDpEBGxHw2sHfVQYrI3
 nxk=
X-SBRS: 5.1
X-MesageID: 45692781
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:S3ZKOa2L7Fr689kvE6CDQgqjBcpxeYIsimQD101hICG9Lfbo8v
 xGzc5rtyMc1gxhO03IwerwSZVohEmsgaKdkrNhTYtKPTOGhILMFupfBOTZskDd8kHFh4hgPO
 JbAtZD4b7LfBpHZKTBkXWF+r8bqbHsnc7J9IOuqEuBVTsEV0gj1XYHNu/yKDwxeOAsP+tAKH
 Po3Ls8m9PWQwVtUi3UPAh9Y8Hz4/fMmZ7afxhDIxI88gGBgROEgYSKVySw71M1VT5C/KklyH
 PCmQDi/Kmv2svLjSM041Wjtqi+1eGRlueqy6S3+4YowmGHsGqVTbUkf4fHkCE+oemp5lpvus
 LLuQ0cM8N67G6UVn2poDP2sjOQhQoG2jvH8xu1kHHjqcv2SHYREMxan79UdRPf9g4JoMx86q
 RWxGiU3qAnXy8opB6Ns+QgaisaxnZc4EBSwNL7tkYvD7f2vYUh/rD2/ytuYdo99WzBmcVXR9
 WHyqnnla5rmBihHgPkV1JUsZWRtq5aJGbcfqFLgL3m79F3pgEi86JK/r1Dop/3nKhNBKWt2Y
 z/Q+9VfEYndL5bUUs6PpZffSP8YFa9NC7kISaXOxDqBasHM3XCp9r+56g0/vijfNgNwIEpkJ
 rMXVtEvSpqEnieSfGmzdlO6FTAUW+9VTPixoVX4IV4oKT1QP7uPTeYQF4jnsO8q7EUA9HdWf
 y0JJVKasWTbFcGPLw5nDEWaqMiY0X2CvdlzOrTc2j+6v4jBLeawdDmTA==
X-IronPort-AV: E=Sophos;i="5.83,265,1616472000"; 
   d="scan'208";a="45692781"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Igor Druzhinin <igor.druzhinin@citrix.com>, Edwin Torok
	<edvin.torok@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Jan
 Beulich" <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 3/5] x86/msr: Expose MSR_ARCH_CAPS in the raw and host policies
Date: Fri, 11 Jun 2021 17:36:25 +0100
Message-ID: <20210611163627.4878-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210611163627.4878-1-andrew.cooper3@citrix.com>
References: <20210611163627.4878-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

MSR_ARCH_CAPS is still not supported for guests (other than the hardware
domain) yet, until the toolstack learns how to construct an MSR policy.

However, we want access to the host ARCH_CAPS_TSX_CTRL value in particular for
testing purposes.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/msr.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 374f92b2c5..6dbb4744e7 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -47,8 +47,13 @@ struct msr_policy __read_mostly hvm_def_msr_policy;
 
 static void __init calculate_raw_policy(void)
 {
+    struct msr_policy *mp = &raw_msr_policy;
+
     /* 0x000000ce  MSR_INTEL_PLATFORM_INFO */
     /* Was already added by probe_cpuid_faulting() */
+
+    if ( cpu_has_arch_caps )
+        rdmsrl(MSR_ARCH_CAPABILITIES, mp->arch_caps.raw);
 }
 
 static void __init calculate_host_policy(void)
@@ -60,6 +65,11 @@ static void __init calculate_host_policy(void)
     /* 0x000000ce  MSR_INTEL_PLATFORM_INFO */
     /* probe_cpuid_faulting() sanity checks presence of MISC_FEATURES_ENABLES */
     mp->platform_info.cpuid_faulting = cpu_has_cpuid_faulting;
+
+    mp->arch_caps.raw &=
+        (ARCH_CAPS_RDCL_NO | ARCH_CAPS_IBRS_ALL | ARCH_CAPS_RSBA |
+         ARCH_CAPS_SKIP_L1DFL | ARCH_CAPS_SSB_NO | ARCH_CAPS_MDS_NO |
+         ARCH_CAPS_IF_PSCHANGE_MC_NO | ARCH_CAPS_TSX_CTRL | ARCH_CAPS_TAA_NO);
 }
 
 static void __init calculate_pv_max_policy(void)
@@ -67,6 +77,8 @@ static void __init calculate_pv_max_policy(void)
     struct msr_policy *mp = &pv_max_msr_policy;
 
     *mp = host_msr_policy;
+
+    mp->arch_caps.raw = 0; /* Not supported yet. */
 }
 
 static void __init calculate_pv_def_policy(void)
@@ -84,6 +96,8 @@ static void __init calculate_hvm_max_policy(void)
 
     /* It's always possible to emulate CPUID faulting for HVM guests */
     mp->platform_info.cpuid_faulting = true;
+
+    mp->arch_caps.raw = 0; /* Not supported yet. */
 }
 
 static void __init calculate_hvm_def_policy(void)
-- 
2.11.0


