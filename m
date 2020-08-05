Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1904D23CB6E
	for <lists+xen-devel@lfdr.de>; Wed,  5 Aug 2020 16:19:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3KFe-0002gj-Sf; Wed, 05 Aug 2020 14:18:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iBnt=BP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k3KFd-0002gc-E7
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2020 14:18:41 +0000
X-Inumbo-ID: 7302ee69-c1b0-4a6c-9fd3-66a3d6f35d8c
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7302ee69-c1b0-4a6c-9fd3-66a3d6f35d8c;
 Wed, 05 Aug 2020 14:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596637120;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FDlDCRAZsXsq1+6c0TBThXxeS+gikua3wzMMup6S3zw=;
 b=Eif3x1mbLYd/bB/pc1QGfuqCxgTyrNXNpVjKvBsLycD24DRmoV7h86Rg
 a7l+kzVN0ZGizdHpmmLUlkrUEhqjniRuu1e75vhc1sbFFy6cwcstKTqpg
 ofWsySIwZeGJKY66ZnTktIPRz+82Cb/E9ghMls0Z/HcfAtE8vxLsvvTc6 0=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: yzYfChoYxqjXz6ZNKPrQGxfomKQf/lwxSR0u6zFXYBscLaDeYVSFkkF6r3ordtJAJyfAtaeW0W
 xugH1geM/s0FmSlhkicjqr8XsFtANsPJBd0xl4KPAmPcdVQaIOdNAPgp/Gyx01gVnYDjxDtubY
 VggY7gMlsl+EVZNJmGADmnp9tTDiuSahFMAxxICq5PmUKHDg8RKrkpVOJ8DhHpt/MYr00NNkBl
 EJXxqV5JehOuZu3R6Yc8YlH70U4pFGQL2vU1+MRtZhWnm2lplAbgOEQHQa2L4tvOhUYzVFctH0
 s5I=
X-SBRS: 3.7
X-MesageID: 24267910
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,436,1589256000"; d="scan'208";a="24267910"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/tsc: Fix diagnostics for TSC frequency
Date: Wed, 5 Aug 2020 15:18:04 +0100
Message-ID: <20200805141804.2585-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

A Gemini Lake platform prints:

  (XEN) CPU0: TSC: 19200000MHz * 279 / 3 = 1785600000MHz
  (XEN) CPU0: 800..1800 MHz

during boot.  The units on the first line are Hz, not MHz, so correct that and
add a space for clarity.

Also, for the min/max line, use three dots instead of two and add more spaces
so that the line can't be mistaken for being a double decimal point typo.

Boot now reads:

  (XEN) CPU0: TSC: 19200000 Hz * 279 / 3 = 1785600000 Hz
  (XEN) CPU0: 800 ... 1800 MHz

Extend these changes to the other TSC diagnostics.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/amd.c   |  4 ++--
 xen/arch/x86/cpu/intel.c | 12 ++++++------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 0cc6853c42..8bc51bec10 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -624,10 +624,10 @@ void amd_log_freq(const struct cpuinfo_x86 *c)
 	if (idx && idx < h &&
 	    !rdmsr_safe(0xC0010064 + idx, val) && (val >> 63) &&
 	    !rdmsr_safe(0xC0010064, hi) && (hi >> 63))
-		printk("CPU%u: %lu (%lu..%lu) MHz\n",
+		printk("CPU%u: %lu (%lu ... %lu) MHz\n",
 		       smp_processor_id(), FREQ(val), FREQ(lo), FREQ(hi));
 	else if (h && !rdmsr_safe(0xC0010064, hi) && (hi >> 63))
-		printk("CPU%u: %lu..%lu MHz\n",
+		printk("CPU%u: %lu ... %lu MHz\n",
 		       smp_processor_id(), FREQ(lo), FREQ(hi));
 	else
 		printk("CPU%u: %lu MHz\n", smp_processor_id(), FREQ(lo));
diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
index 69e99bb358..ed70b43942 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -396,14 +396,14 @@ static void intel_log_freq(const struct cpuinfo_x86 *c)
 
             val *= ebx;
             do_div(val, eax);
-            printk("CPU%u: TSC: %uMHz * %u / %u = %LuMHz\n",
+            printk("CPU%u: TSC: %u Hz * %u / %u = %Lu Hz\n",
                    smp_processor_id(), ecx, ebx, eax, val);
         }
         else if ( ecx | eax | ebx )
         {
             printk("CPU%u: TSC:", smp_processor_id());
             if ( ecx )
-                printk(" core: %uMHz", ecx);
+                printk(" core: %u MHz", ecx);
             if ( ebx && eax )
                 printk(" ratio: %u / %u", ebx, eax);
             printk("\n");
@@ -417,11 +417,11 @@ static void intel_log_freq(const struct cpuinfo_x86 *c)
         {
             printk("CPU%u:", smp_processor_id());
             if ( ecx )
-                printk(" bus: %uMHz", ecx);
+                printk(" bus: %u MHz", ecx);
             if ( eax )
-                printk(" base: %uMHz", eax);
+                printk(" base: %u MHz", eax);
             if ( ebx )
-                printk(" max: %uMHz", ebx);
+                printk(" max: %u MHz", ebx);
             printk("\n");
         }
     }
@@ -446,7 +446,7 @@ static void intel_log_freq(const struct cpuinfo_x86 *c)
 
         printk("CPU%u: ", smp_processor_id());
         if ( min_ratio )
-            printk("%u..", (factor * min_ratio + 50) / 100);
+            printk("%u ... ", (factor * min_ratio + 50) / 100);
         printk("%u MHz\n", (factor * max_ratio + 50) / 100);
     }
 }
-- 
2.11.0


