Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E70B919BD93
	for <lists+xen-devel@lfdr.de>; Thu,  2 Apr 2020 10:27:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJv9r-0008Eg-4k; Thu, 02 Apr 2020 08:25:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ugol=5S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jJv9o-0008EQ-Vj
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 08:25:01 +0000
X-Inumbo-ID: 716b2c1c-74bb-11ea-b4f4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 716b2c1c-74bb-11ea-b4f4-bc764e2007e4;
 Thu, 02 Apr 2020 08:25:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9462AADAB;
 Thu,  2 Apr 2020 08:24:59 +0000 (UTC)
Subject: [PATCH v2 2/2] x86/cpuidle: support Cannon Lake (again)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e39d4326-57d1-a4b5-3081-76b5160644ae@suse.com>
Message-ID: <91bbd232-a96c-6b00-fbaa-ac8094eb0cfe@suse.com>
Date: Thu, 2 Apr 2020 10:24:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <e39d4326-57d1-a4b5-3081-76b5160644ae@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

As per SDM rev 071 Cannon Lake has
- no CC3 residency MSR at 3FC,
- a CC1 residency MSR ar 660 (like various Atoms),
- a useless (always zero) CC3 residency MSR at 662.
Hence it needs a separate case label.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Split. This patch is beign submitted more for completeness than with
    the expectation that it would get acked, as per the v1 feedback.
---
Using the MSR cross reference in the same SDM revision one might even
get the impression that further MSRs are unavailable, but newer CPUs
don't appear to be consistently listed there at all, so may rather be a
doc shortcoming. I've pointed this out to Intel, but I'm not expecting
swift feedback.

--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -69,7 +69,7 @@
 #define GET_PC8_RES(val)  GET_HW_RES_IN_NS(0x630, val) /* some Haswells only */
 #define GET_PC9_RES(val)  GET_HW_RES_IN_NS(0x631, val) /* some Haswells only */
 #define GET_PC10_RES(val) GET_HW_RES_IN_NS(0x632, val) /* some Haswells only */
-#define GET_CC1_RES(val)  GET_HW_RES_IN_NS(0x660, val) /* Silvermont only */
+#define GET_CC1_RES(val)  GET_HW_RES_IN_NS(0x660, val)
 #define GET_CC3_RES(val)  GET_HW_RES_IN_NS(0x3FC, val)
 #define GET_CC6_RES(val)  GET_HW_RES_IN_NS(0x3FD, val)
 #define GET_CC7_RES(val)  GET_HW_RES_IN_NS(0x3FE, val) /* SNB onwards */
@@ -201,6 +201,16 @@ static void do_get_hw_residencies(void *
         GET_CC3_RES(hw_res->cc3);
         GET_CC6_RES(hw_res->cc6);
         break;
+    /* Cannon Lake */
+    case 0x66:
+        GET_PC2_RES(hw_res->pc2);
+        GET_PC3_RES(hw_res->pc3);
+        GET_PC6_RES(hw_res->pc6);
+        GET_PC7_RES(hw_res->pc7);
+        GET_CC1_RES(hw_res->cc1);
+        GET_CC6_RES(hw_res->cc6);
+        GET_CC7_RES(hw_res->cc7);
+        break;
     /* Xeon Phi Knights Landing */
     case 0x57:
     /* Xeon Phi Knights Mill */


