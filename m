Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7D54AE067
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 19:10:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268588.462493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHUwJ-0005By-Qk; Tue, 08 Feb 2022 18:10:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268588.462493; Tue, 08 Feb 2022 18:10:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHUwJ-00052h-DT; Tue, 08 Feb 2022 18:10:07 +0000
Received: by outflank-mailman (input) for mailman id 268588;
 Tue, 08 Feb 2022 18:10:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1rHF=SX=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nHUwG-0004K6-S5
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 18:10:04 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5517281e-890a-11ec-8f75-fffcc8bd4f1a;
 Tue, 08 Feb 2022 19:10:03 +0100 (CET)
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
X-Inumbo-ID: 5517281e-890a-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644343802;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=r07JJ+ieARO/h3VHmKJxMVxJpW20MqnhjuvAZQdZY/U=;
  b=B7gEWGsSsNMDvWw8VTKL0bonmAQpLR/Ec0GRTC7AX6775JrcuM7Iyou1
   I81yf6HWrZdGN+H3V/ksi6tP9MX44ufCcO/UZRn8IdBqJ8ETUM+3mzvq0
   9QiK6TvQAMs9LEPoJD1okAVNLP0S+u0TvupCffPZzRduCLnwblXQy91AP
   U=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: e98P7T2EfM9xyRizm7aIx+aYydt5/N/+qk/Kcxe45UvTVtMEneIMHkXf94hK82WlTXtqq3DObr
 jICYC3tZAViHzEjjUCqCJj46VMtoz55SrKGvRfpIggD2WvF5qeukmpx4lSzDvr+ya8P0hCpBAf
 87gfsQFvWeM64LboY7rZ4D3wSWcEIDoR2AihW30UGRB9Dvokm0n1vj5a9wvKTk8ExOLX8tRmFt
 L/++81aHT950omrtEQKUipCmYiZ49nTlrHobD5EEHISObEwlz3i5rHIkwx8rXJSkgVnbkU0gfk
 E+X1lsz+gpJMRofX+9Z/lblb
X-SBRS: 5.1
X-MesageID: 65977667
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:zdfhNKBDFULg6hVW/wvkw5YqxClBgxIJ4kV8jS/XYbTApGlwgjQCn
 GJJXG3UOqvcZWbwfotxaYi18h8EvpGEmN5jQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WL6s1hxZH1c+En970UI7wYbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/iAXUsu8o6
 eV27bOrTCsSIL+Rx+RFekwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTY+9gnMk8auLsO5sSoCpIxjDFF/c2B5vERs0m4PcGgWZv2Z4QQp4yY
 eIjchNPRUjiMyFxM08rK6IFseWEimDwJmgwRFW9+vNsvjm7IBZK+KjgNp/Zd8KHQe1Rn12Ev
 STW8mLhGBYYOdeDjz2f/RqRavTnxH2hHthITfvhq6As0Ab7KnEv5AM+VmvmjMbgq36FA/1EL
 mAv5Dhz8qhq3Rn+JjXiZCGQrHmBtx8aftNfFewm9Q2AopbpDxal6nssFWAYNoF/3CMibXlzj
 wLSwYu1bdB6mODNERqgGqGoQSRe0MT/BUsLfmc6QAQM+LEPS6lj30uUHr6P/ENY5+AZ+A0cI
 RjX9kDSZJ1J1KbnMplXGnid0lqRSmDhFFJd2+kudjvNAvlFTICkfZe0zlPQ8OxNKo2UJnHY4
 iRYwpnHtb5fV8jW/MBofAnqNOv4j8tpzRWG2QI/d3Xf32jFF4GfkXB4v2gleRYB3jcscj71e
 k7D0T69F7cIVEZGmZRfOtrrY+xzlPCIPY28Cpj8M4ofCrAsJVTv1Hw/Oia4gTu3+GByyv5XB
 HtuWZv1ZZrsIf88l2TeqiZ0+eJD+x3SMkuJHc+ilEn8gePFDJNXIJ9cWGazgikCxPvsiG3oH
 xx3bpbiJ8x3XLKsby/J35QUKFxWf3E3CYqv855cd/KZIxogE2YkUqeDzbQkco1jvqJUiuaXo
 S3tBh4GkALy1S/dNAGHSnF/c7ezD5xxmm02YH43NlGy1nl9PYv2tPUDd4E6dKUM/fB4yaImV
 OEMfsiNW6wdSjnO9zkHQ4P6qYhuKEaiiQ6UZnL3azkjZZ9wAQfO/4a8LAfo8SAPCAuxtNc//
 OL8hl+KH8JbSl07XsjMaf+pw1eghlQnmbp/DxnSP91eWETw64w2eSb/ueA6fpMXIhLZyzrEi
 wvPWUUEpfPAqpMe+cXSgfzWtJ+gFuZzExYIH2Tf6rrqZyDW8nD6nN1FWeeMOzvcSHn16OOpY
 uAMl6PwN/gOnVBrtYtgEuk0kfJitoW3/7IKnB55GHjrbkiwDuIyK3aL6sBDq6lRy+ILogCxQ
 E+OpoFXNLjh1BkJy7LNyN7Jtti+6Mw=
IronPort-HdrOrdr: A9a23:Hqhdeq26/AmlVD1o0YPFTQqjBLYkLtp133Aq2lEZdPRUGvb4qy
 nOpoVi6faaskdzZJhNo7+90ey7MBfhHP1OkPAs1NWZLWvbUQKTRekIh+aP/9SjIVyYygc079
 YHT0EUMr3N5DZB4/oSmDPIduod/A==
X-IronPort-AV: E=Sophos;i="5.88,353,1635220800"; 
   d="scan'208";a="65977667"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 4/6] tests/tsx: Extend test-tsx to check MSR_MCU_OPT_CTRL
Date: Tue, 8 Feb 2022 18:09:40 +0000
Message-ID: <20220208180942.14871-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220208180942.14871-1-andrew.cooper3@citrix.com>
References: <20220208180942.14871-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

This MSR needs to be identical across the system for TSX to have identical
behaviour everywhere.  Furthermore, its CPUID bit (SRBDS_CTRL) shouldn't be
visible to guests.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 tools/tests/tsx/test-tsx.c        | 9 ++++++++-
 xen/arch/x86/platform_hypercall.c | 3 +++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/tools/tests/tsx/test-tsx.c b/tools/tests/tsx/test-tsx.c
index a3d987b6d2ce..f11e8c54e0de 100644
--- a/tools/tests/tsx/test-tsx.c
+++ b/tools/tests/tsx/test-tsx.c
@@ -42,6 +42,7 @@ enum {
 #define  ARCH_CAPS_TSX_CTRL                 (1 <<  7)
 #define MSR_TSX_FORCE_ABORT                 0x0000010f
 #define MSR_TSX_CTRL                        0x00000122
+#define MSR_MCU_OPT_CTRL                    0x00000123
 
 static unsigned int nr_failures;
 #define fail(fmt, ...)                          \
@@ -155,6 +156,10 @@ static void test_tsx_msrs(void)
     printf("Testing MSR_TSX_CTRL consistency\n");
     test_tsx_msr_consistency(
         MSR_TSX_CTRL, host.msr.arch_caps.tsx_ctrl);
+
+    printf("Testing MSR_MCU_OPT_CTRL consistency\n");
+    test_tsx_msr_consistency(
+        MSR_MCU_OPT_CTRL, host.cpuid.feat.srbds_ctrl);
 }
 
 /*
@@ -313,7 +318,8 @@ static void test_guest_policies(const struct xc_cpu_policy *max,
 
     if ( ((cm->feat.raw[0].d | cd->feat.raw[0].d) &
           (bitmaskof(X86_FEATURE_TSX_FORCE_ABORT) |
-           bitmaskof(X86_FEATURE_RTM_ALWAYS_ABORT))) ||
+           bitmaskof(X86_FEATURE_RTM_ALWAYS_ABORT) |
+           bitmaskof(X86_FEATURE_SRBDS_CTRL))) ||
          ((mm->arch_caps.raw | md->arch_caps.raw) & ARCH_CAPS_TSX_CTRL) )
         fail("  Xen-only TSX controls offered to guest\n");
 
@@ -388,6 +394,7 @@ static void test_guest(struct xen_domctl_createdomain *c)
     if ( guest_policy.cpuid.feat.hle ||
          guest_policy.cpuid.feat.tsx_force_abort ||
          guest_policy.cpuid.feat.rtm_always_abort ||
+         guest_policy.cpuid.feat.srbds_ctrl ||
          guest_policy.msr.arch_caps.tsx_ctrl )
         fail("  Unexpected features advertised\n");
 
diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index 284c2dfb9efe..bf4090c94201 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -80,6 +80,9 @@ static bool msr_read_allowed(unsigned int msr)
 
     case MSR_TSX_CTRL:
         return cpu_has_tsx_ctrl;
+
+    case MSR_MCU_OPT_CTRL:
+        return cpu_has_srbds_ctrl;
     }
 
     if ( ppin_msr && msr == ppin_msr )
-- 
2.11.0


