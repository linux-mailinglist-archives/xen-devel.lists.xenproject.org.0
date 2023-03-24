Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C70A6C879D
	for <lists+xen-devel@lfdr.de>; Fri, 24 Mar 2023 22:45:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514462.796723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfpDT-0001oj-2Z; Fri, 24 Mar 2023 21:44:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514462.796723; Fri, 24 Mar 2023 21:44:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfpDS-0001mf-Uo; Fri, 24 Mar 2023 21:44:54 +0000
Received: by outflank-mailman (input) for mailman id 514462;
 Fri, 24 Mar 2023 21:44:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GJ5Y=7Q=citrix.com=prvs=4404309fd=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pfpDR-0001mX-Co
 for xen-devel@lists.xenproject.org; Fri, 24 Mar 2023 21:44:53 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1754ef46-ca8d-11ed-b464-930f4c7d94ae;
 Fri, 24 Mar 2023 22:44:47 +0100 (CET)
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
X-Inumbo-ID: 1754ef46-ca8d-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679694287;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hwqhceVCgJAHDmKYPj//gEgTAp3CMZ020MxdnHTp51Y=;
  b=XYqFRDstAgEU+ve7q3VUK/hUMkvqQ4qYbbIRnPNJVvMrgQoiw1HevLY/
   yPOexod4f+xXPsZgLxC0eHazmjU4BXB1ZVsKwae+igLinicUXwCiOKS2W
   TZVIOWbdBgRffEfgCNMhLP2tviL6V9zI9u91DnrpiNnnFph1L5XO1GWiF
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 102189981
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:7ZVrhq/KfH1qMY4GJjuTDrUD/H6TJUtcMsCJ2f8bNWPcYEJGY0x3m
 mtLC2nQaKqDZTT8eY0nOdm19k5U7MDcmtVqT1E6pHg8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI/1BjOkGlA5AdmPqoX5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklL2
 a1BCAopZSy8gvm44qiKeMV0huAKeZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAr3/zaTBH7nmSorI6+TP7xw1tyrn9dtHSf7RmQO0MxhzB9
 jOXrz2R7hcyDv2DyT+50i2QherrvHriQtMVRZLn6as/6LGU7jNKU0BHPbehmtGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c/h6HvA+6QqN4rHJ+AvfDW8BJhZebPQ2uclwQiYlv
 mJlhPuwW2Yp6ufMDyvAqPHN92ja1TUpwXEqYANVFCs/x9Lfn4QogDDVf+RPCK6Rp4igcd3v+
 AxmvBTSlp1K05Faifvmpwuf696/jsOXF1Bov207Skrgt1okP9D9OuRE/HCBtZ59wJClok5tV
 ZTus+yX96gwAJ6Ej0Rhq81dTejyt55p3NAx6GOD/qXNFBz3oRZPhagKvFlDyL5Ba67ogwPBb
 k7Joh9275ROJnasZqIfS9vvVJV0nfO4TIW+D628gj9yjn9ZKme6ENxGPxbMjwgBbmB1+U3AB
 XtrWZn1VitLYUiW5DG3W/0cwdcW+8zK/kuKHcqT503+gdKjiIu9Fe9t3K2mMrpos8tpYWz9r
 75iCid940oBC7KkMnGOq+b+7zkidBAGOHw/kOQPHsbrH+asMD1xYxMN6dvNo7BYopk=
IronPort-HdrOrdr: A9a23:j5ehD64e89Enr83QPwPXwA/XdLJyesId70hD6qhwISYlFPBw9v
 rPoB1/73TJYVkqOU3I9erwXZVoIkmsjKKdg7NhRYtKNTOO0ATHEGgL1/qY/9SKIVybygcy79
 YGT4FOTPDLIBxdq+2S2mWF+tAbquWvweSTqd2b5VFLYiFFV5pJ0ideLUKgPnAefngkObMJUJ
 Wd48ZcpymtYx0sA/iTDGUeQu7Gq8bqufvdEHw7OyI=
X-IronPort-AV: E=Sophos;i="5.98,288,1673931600"; 
   d="scan'208";a="102189981"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Sergey Dyasli
	<sergey.dyasli@citrix.com>
Subject: [PATCH] x86/ucode: Fix error paths control_thread_fn()
Date: Fri, 24 Mar 2023 21:44:30 +0000
Message-ID: <20230324214430.3277862-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

These two early exits skipped re-enabling the watchdog, and restoring the NMI
callback.  Always execute the tail of the function on the way out.

Fixes: 8dd4dfa92d62 ("x86/microcode: Synchronize late microcode loading")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Sergey Dyasli <sergey.dyasli@citrix.com>

Also, added in the same patch is:

   * Note that RDTSC (in wait_for_condition()) is safe for threads to
   * execute while waiting for completion of loading an update.

which is absolutely not true in the slightest.  RDTSC is all microcode, and
Intel's guidance on the matter right now is that LFENCE is about the only safe
instruction to execute in a wait loop.  Even PAUSE is explcitily prohibited...
---
 xen/arch/x86/cpu/microcode/core.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index cfa2d5053a52..61cd36d601d6 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -492,10 +492,7 @@ static int control_thread_fn(const struct microcode_patch *patch)
     ret = wait_for_condition(wait_cpu_callin, num_online_cpus(),
                              MICROCODE_CALLIN_TIMEOUT_US);
     if ( ret )
-    {
-        set_state(LOADING_EXIT);
-        return ret;
-    }
+        goto out;
 
     /* Control thread loads ucode first while others are in NMI handler. */
     ret = alternative_call(ucode_ops.apply_microcode, patch);
@@ -507,8 +504,7 @@ static int control_thread_fn(const struct microcode_patch *patch)
     {
         printk(XENLOG_ERR
                "Late loading aborted: CPU%u failed to update ucode\n", cpu);
-        set_state(LOADING_EXIT);
-        return ret;
+        goto out;
     }
 
     /* Let primary threads load the given ucode update */
@@ -539,6 +535,7 @@ static int control_thread_fn(const struct microcode_patch *patch)
         }
     }
 
+ out:
     /* Mark loading is done to unblock other threads */
     set_state(LOADING_EXIT);
 
-- 
2.30.2


