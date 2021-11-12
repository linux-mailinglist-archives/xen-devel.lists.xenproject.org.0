Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8819D44EC9D
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 19:29:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225362.389200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlbIB-0002UX-11; Fri, 12 Nov 2021 18:28:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225362.389200; Fri, 12 Nov 2021 18:28:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlbIA-0002O7-RT; Fri, 12 Nov 2021 18:28:50 +0000
Received: by outflank-mailman (input) for mailman id 225362;
 Fri, 12 Nov 2021 18:28:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=26E1=P7=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mlbI9-0002K6-3I
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 18:28:49 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 603c9a9d-43e6-11ec-9787-a32c541c8605;
 Fri, 12 Nov 2021 19:28:48 +0100 (CET)
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
X-Inumbo-ID: 603c9a9d-43e6-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636741727;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qqGtKAeoak+cgA0fRmStxT61JZlUT9e0puGVkA6QZ4U=;
  b=ecTt7rj+wMgWBEU3G3qpg6Z0X+OBcUmVuFgs8lu7AaM5DnSuyMrPCHnQ
   1OBwTnE6dCeLDE8GHuDiuc5A+0y2CywWXJZETOb98R69yLotCoK3JDE7P
   pNBH9GZfjPu6Id1hWstounjYlPA99R0hEm/3eNOtP0+2XAuM/DLP/Soiv
   I=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 12CCx29YdYoJosQSJTbnetCptu4M9o/xT+iuxYv/J5JN5t5a1ELeyRaeOsyd+o1GZCFh6Ox1Wx
 /NP1Co3mpgHp5QlCAHyHMGfHkm5+qW586MkTI4bHNH7/zhLW/7acKLZfz6kgTuxqf5qDy+wMr6
 AWvkpP3eia0BEUaY7+9A1Sr2oxDCx279ElVY+nCSVPNevTNGji4FsYU97niLoK9pg+O/Rl5G2I
 k/4Pp/9tJIjx0ZKO2BW9dNW9q/JwIDS2KspSzBRB8vhTtWPKJeJw3WLps0BBYQvSHuxTxPMPLO
 lM56iMK74xnq58Nf6ijlu7tC
X-SBRS: 5.1
X-MesageID: 57675763
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:LXSahqBK2tAldxVW/+Tkw5YqxClBgxIJ4kV8jS/XYbTApD9x0jVTy
 jcXDT2Hb/mCYmr0KNFwbdu1pxgPsMLdy4VgQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX540Eg7wIbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/rWmppM8r5
 vh3pIWcRAgVY5X2lNsjTEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTY+9gnMk8auLsO5sSoCpIxjDFF/c2B5vERs0m4PcFg2lv258QRp4yY
 eJITAtiSwqHUyRFO1w5UrAvuemwt33wJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tmSyq
 3/C/m/5KgoHL9HZwj2Amlq8i+mKkS7lVYY6ELyj6uUskFCV3nYUChAdSR28u/bRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiFjYniUDAfR9KfwjxAyC9vfs2QqmOHdRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjsYHZIdAfucQdBFFJYuIe7/OnfmzqWFo47eJNZmOEZDt0ZL
 9qiiCElz4segscQv0lQ1QCW2mn8znQlo+Nc2+k2Yo5Hxl8mDGJGT9bxgbQ+0RqmBNzEJrVml
 CJU8/VyFMhUUfmweNWlGY3h5o2B6fefKyH7ilVyBZQn/DnF0yf9Jt4OvW8kfxw4b5xsldrVj
 Kn74145CHh7ZivCUEOKS9jpV5RCIVbISbwJqcw4nvIRO8MsJWdrDQllZFKK3nCFraTfufpXB
 HtvSu71VSxyIf0+lFKeHr5BuZd2lnFW7T6CHvjTkkX4uYdykVbIEN/pxnPVNbtnhE5FyS2Im
 +ti2zyil08CDbagO3aPqub+7zkidBAGOHw/kOQPHsbrH+asMDhJ5yb5zexzdop7sb5Sk+uUr
 HixVlUBkAj0hGHdKBXMYXdmMeu9UZF6pHM9HCotIVf3hCRzPdfxtP8SJ8ktYL0q1O1/1vooH
 fMLTNqNX6ZUQTPd9jVDMZSk9N5+dA6mjB6lNja+ZGRtZIZpQgHEo4e2fgbm+CQUIDCwsM8y/
 ++p2g/BGMJRTAV+FsfGLvmoygrp73QanetzWWrOI8VSJxqwoNQ7dXSpg6Zucc8WKBjFyj+L7
 CqsAE8V9bvXvos40NjVnqTY/Y2nJPRzQxhBFG7B4LfoaSSDpji/wZVNWfqjdCzGUD+m472rY
 OhYwq2uMPADm1oW4YNwH6wykPA77trr4bRb0h5lDDPAaFHyUuFsJXyP3M9usKxRx+AG5VvqC
 xzXotQKa6+UPM7FEUIKIFt3Z+uO4vgYhz3O4KlnO079/iJ2oOKKXEg608NgU8CBwG+Z6L8Y/
 No=
IronPort-HdrOrdr: A9a23:/qqZyqzvzPuzev7RKcbRKrPwKL1zdoMgy1knxilNoHtuA6ulfq
 GV7ZAmPHrP4wr5N0tNpTntAsa9qBDnlaKdg7N+AV7KZmCP0gaVxepZjLfK8nnNHDD/6/4Y9Y
 oISdkaNDQoNykYsS8t2njbL+od
X-IronPort-AV: E=Sophos;i="5.87,230,1631592000"; 
   d="scan'208";a="57675763"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 1/3] x86/cpufreq: Clean up powernow registration
Date: Fri, 12 Nov 2021 18:28:16 +0000
Message-ID: <20211112182818.30223-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211112182818.30223-1-andrew.cooper3@citrix.com>
References: <20211112182818.30223-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

powernow_register_driver() is currently written with a K&R type definition;
I'm surprised that compilers don't object to a mismatch with its declaration,
which is written in an ANSI-C compatible way.

Furthermore, its sole caller is cpufreq_driver_init() which is a pre-smp
initcall.  There are no other online CPUs, and even if there were, checking
the BSP's CPUID data $N times is pointless.  Simplify registration to only
look at the BSP.

While at it, drop obviously unused includes.  Also rewrite the expression in
cpufreq_driver_init() for clarity.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/acpi/cpufreq/cpufreq.c  | 20 +++++++++++++-------
 xen/arch/x86/acpi/cpufreq/powernow.c | 28 ++++++----------------------
 2 files changed, 19 insertions(+), 29 deletions(-)

diff --git a/xen/arch/x86/acpi/cpufreq/cpufreq.c b/xen/arch/x86/acpi/cpufreq/cpufreq.c
index f1f3c6923fb3..2251c87f9e42 100644
--- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
+++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
@@ -640,13 +640,19 @@ static int __init cpufreq_driver_init(void)
 {
     int ret = 0;
 
-    if ((cpufreq_controller == FREQCTL_xen) &&
-        (boot_cpu_data.x86_vendor == X86_VENDOR_INTEL))
-        ret = cpufreq_register_driver(&acpi_cpufreq_driver);
-    else if ((cpufreq_controller == FREQCTL_xen) &&
-        (boot_cpu_data.x86_vendor &
-         (X86_VENDOR_AMD | X86_VENDOR_HYGON)))
-        ret = powernow_register_driver();
+    if ( cpufreq_controller == FREQCTL_xen )
+    {
+        switch ( boot_cpu_data.x86_vendor )
+        {
+        case X86_VENDOR_INTEL:
+            ret = cpufreq_register_driver(&acpi_cpufreq_driver);
+            break;
+
+        case X86_VENDOR_AMD | X86_VENDOR_HYGON:
+            ret = powernow_register_driver();
+            break;
+        }
+    }
 
     return ret;
 }
diff --git a/xen/arch/x86/acpi/cpufreq/powernow.c b/xen/arch/x86/acpi/cpufreq/powernow.c
index f620bebc7e91..80095dfd14b4 100644
--- a/xen/arch/x86/acpi/cpufreq/powernow.c
+++ b/xen/arch/x86/acpi/cpufreq/powernow.c
@@ -24,13 +24,9 @@
 #include <xen/types.h>
 #include <xen/errno.h>
 #include <xen/init.h>
-#include <xen/delay.h>
 #include <xen/cpumask.h>
-#include <xen/timer.h>
 #include <xen/xmalloc.h>
-#include <asm/bug.h>
 #include <asm/msr.h>
-#include <asm/io.h>
 #include <asm/processor.h>
 #include <asm/cpufeature.h>
 #include <acpi/acpi.h>
@@ -353,25 +349,13 @@ static const struct cpufreq_driver __initconstrel powernow_cpufreq_driver = {
     .update = powernow_cpufreq_update
 };
 
-unsigned int __init powernow_register_driver()
+unsigned int __init powernow_register_driver(void)
 {
-    unsigned int i, ret = 0;
+    if ( !(boot_cpu_data.x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
+        return -ENODEV;
 
-    for_each_online_cpu(i) {
-        struct cpuinfo_x86 *c = &cpu_data[i];
-        if (!(c->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)))
-            ret = -ENODEV;
-        else
-        {
-            u32 eax, ebx, ecx, edx;
-            cpuid(CPUID_FREQ_VOLT_CAPABILITIES, &eax, &ebx, &ecx, &edx);
-            if ((edx & USE_HW_PSTATE) != USE_HW_PSTATE)
-                ret = -ENODEV;
-        }
-        if (ret)
-            return ret;
-    }
+    if ( !(cpuid_edx(CPUID_FREQ_VOLT_CAPABILITIES) & USE_HW_PSTATE) )
+        return -ENODEV;
 
-    ret = cpufreq_register_driver(&powernow_cpufreq_driver);
-    return ret;
+    return cpufreq_register_driver(&powernow_cpufreq_driver);
 }
-- 
2.11.0


