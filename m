Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C14876FE48B
	for <lists+xen-devel@lfdr.de>; Wed, 10 May 2023 21:35:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533008.829362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwpZm-0005is-4h; Wed, 10 May 2023 19:34:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533008.829362; Wed, 10 May 2023 19:34:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwpZm-0005gI-0T; Wed, 10 May 2023 19:34:14 +0000
Received: by outflank-mailman (input) for mailman id 533008;
 Wed, 10 May 2023 19:34:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PWYj=A7=citrix.com=prvs=487e665c6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pwpZk-0005gC-Bq
 for xen-devel@lists.xenproject.org; Wed, 10 May 2023 19:34:12 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a12d6ff3-ef69-11ed-8611-37d641c3527e;
 Wed, 10 May 2023 21:34:08 +0200 (CEST)
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
X-Inumbo-ID: a12d6ff3-ef69-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683747248;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zo3AkidUaDbd0s0WimnpWcrKKliyz/SIRsjhAoV2Jz4=;
  b=Pq5WlovHQNu0arzcZuQ0r57obcir1zj3DbXFPG57ICzH9Y5TYDd+T+S3
   VFoHjtXHwJxekiTXVG2TciwCRcE+OqrgT3LgFY9E2rZ3jDrBnPs0YY9jb
   yWHP5CForSiKlfFhMlwZTLW3Z6CRzJY8+1fzU701eOXwZO6gH6tyjHaLM
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 108977908
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:wWybV6+Nq8Zpenw8ko37DrUDvn6TJUtcMsCJ2f8bNWPcYEJGY0x3m
 mZKXT2OMq6PamGjf9p0PIu+oUgO7cTQm9I3TAdkrio8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI+1BjOkGlA5AdmOKkT5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklI7
 t8gbwocYirTlr3t3paHSLh+ic0aeZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAr3/zaTBH7nmSorI6+TP7xw1tyrn9dtHSf7RmQO0MxhbJ+
 T2XpzSR7hcyDN2l8TfCqG2Q3qzyux28cpMIGf6m6as/6LGU7jNKU0BHPbehmtGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c/h6HvA+6QqN4rHJ+AvfDW8BJhZebPQ2uclwQiYlv
 neLgtWvAzVsub+UTHu197GIoDf0Mi8QRUcBaDEFS00Z4tDliIA1kh/LCN1kFcaIYsbdQG+qh
 WrQ9W5n2utV1JRQv0mmwbzZqzS3haCOdB853FXGATm7yj97NZyqbrX9vDA38s18BIqeS1CAu
 l0NlM6f8P0CAPmxqcCdfAkeNOr3vqjYaVUwlXYqRsB8rGr1pxZPaKgKuFlDyFFV3tHokNMDS
 Gvaoktv6ZBaJxNGhocnMtvqW6zGIUUNfOkJt8w4jPIUOvCdlyfdpkmCgHJ8OEiy+HXAaYllZ
 f+mnT+EVB7285hPwjusXPs62rQ23C04zm67bcmln0/4jeHOOiXJE+tt3L6yggcRs8u5TPj9q
 Y4DZ6NmNT0FOAEBXsUn2dFKdg1bRZTKLZv3t9ZWZoa+H+aSI0l4U6W56ep4K+RYc1F9yr+gE
 oeVBhUJlzISRBTvdW23V5yUQOqzDM4n9S5hZXBE0JTB8yFLXLtDJZw3L/MfFYTLPsQ6pRKoZ
 5Hpo/m9P8k=
IronPort-HdrOrdr: A9a23:XiJNPq9MaMZP3eR45DBuk+DnI+orL9Y04lQ7vn2ZhyYlC/Bw9v
 re5MjzsCWftN9/YgBEpTntAtjjfZqYz+8X3WBzB9aftWvdyQ+VxehZhOOI/9SjIU3DH4VmpM
 BdmsZFebvN5JtB4foSIjPULz/t+ra6GWmT69vj8w==
X-Talos-CUID: 9a23:NDD2EWz5olNc8k3QUMB5BgUSAeMdNUfMwE2AMhDjF0JVSuyHRlaprfY=
X-Talos-MUID: 9a23:cxFz4Anwyxc9dPsl6ej3dnpaNf1Q7uP0F3xV0qgghY6uJDZ9eCmC2WE=
X-IronPort-AV: E=Sophos;i="5.99,265,1677560400"; 
   d="scan'208";a="108977908"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH] x86: Use printk_once() instead of opencoding it
Date: Wed, 10 May 2023 20:33:57 +0100
Message-ID: <20230510193357.12278-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Technically our helper post-dates all of these examples, but it's good cleanup
nevertheless.  None of these examples should be using fully locked
test_and_set_bool() in the first place.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Jun Nakajima <jun.nakajima@intel.com>
CC: Kevin Tian <kevin.tian@intel.com>
---
 xen/arch/x86/cpu/amd.c     | 22 ++++++++--------------
 xen/arch/x86/hvm/vmx/vmx.c | 18 ++++++------------
 xen/arch/x86/srat.c        |  8 ++------
 xen/arch/x86/time.c        | 19 ++++---------------
 4 files changed, 20 insertions(+), 47 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index caafe4474021..630adead2fc1 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -1061,25 +1061,19 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 
 		rdmsrl(MSR_AMD64_LS_CFG, value);
 		if (!(value & (1 << 15))) {
-			static bool_t warned;
-
-			if (c == &boot_cpu_data || opt_cpu_info ||
-			    !test_and_set_bool(warned))
-				printk(KERN_WARNING
-				       "CPU%u: Applying workaround for erratum 793\n",
-				       smp_processor_id());
+			if (c == &boot_cpu_data || opt_cpu_info)
+				printk_once(XENLOG_WARNING
+					    "CPU%u: Applying workaround for erratum 793\n",
+					    smp_processor_id());
 			wrmsrl(MSR_AMD64_LS_CFG, value | (1 << 15));
 		}
 	} else if (c->x86 == 0x12) {
 		rdmsrl(MSR_AMD64_DE_CFG, value);
 		if (!(value & (1U << 31))) {
-			static bool warned;
-
-			if (c == &boot_cpu_data || opt_cpu_info ||
-			    !test_and_set_bool(warned))
-				printk(KERN_WARNING
-				       "CPU%u: Applying workaround for erratum 665\n",
-				       smp_processor_id());
+			if (c == &boot_cpu_data || opt_cpu_info)
+				printk_once(XENLOG_WARNING
+					    "CPU%u: Applying workaround for erratum 665\n",
+					    smp_processor_id());
 			wrmsrl(MSR_AMD64_DE_CFG, value | (1U << 31));
 		}
 	}
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 096c69251d58..0f392fc0d4fe 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -1183,16 +1183,11 @@ static void cf_check vmx_get_segment_register(
      */
     if ( unlikely(!vmx_vmcs_try_enter(v)) )
     {
-        static bool_t warned;
+        printk_once(XENLOG_WARNING "Segment register inaccessible for %pv\n"
+                    "(If you see this outside of debugging activity,"
+                    " please report to xen-devel@lists.xenproject.org)\n",
+                    v);
 
-        if ( !warned )
-        {
-            warned = 1;
-            printk(XENLOG_WARNING "Segment register inaccessible for %pv\n"
-                   "(If you see this outside of debugging activity,"
-                   " please report to xen-devel@lists.xenproject.org)\n",
-                   v);
-        }
         memset(reg, 0, sizeof(*reg));
         return;
     }
@@ -2301,10 +2296,9 @@ static bool cf_check vmx_test_pir(const struct vcpu *v, uint8_t vec)
 static void cf_check vmx_handle_eoi(uint8_t vector, int isr)
 {
     uint8_t old_svi = set_svi(isr);
-    static bool warned;
 
-    if ( vector != old_svi && !test_and_set_bool(warned) )
-        printk(XENLOG_WARNING "EOI for %02x but SVI=%02x\n", vector, old_svi);
+    if ( vector != old_svi )
+        printk_once(XENLOG_WARNING "EOI for %02x but SVI=%02x\n", vector, old_svi);
 }
 
 static void cf_check vmx_enable_msr_interception(struct domain *d, uint32_t msr)
diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index 56749ddca526..3f70338e6e23 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -55,7 +55,6 @@ nodeid_t setup_node(unsigned pxm)
 {
 	nodeid_t node;
 	unsigned idx;
-	static bool warned;
 	static unsigned nodes_found;
 
 	BUILD_BUG_ON(MAX_NUMNODES >= NUMA_NO_NODE);
@@ -75,11 +74,8 @@ nodeid_t setup_node(unsigned pxm)
 		if (pxm2node[idx].node == NUMA_NO_NODE)
 			goto finish;
 
-	if (!warned) {
-		printk(KERN_WARNING "SRAT: Too many proximity domains (%#x)\n",
-		       pxm);
-		warned = true;
-	}
+	printk_once(XENLOG_WARNING "SRAT: Too many proximity domains (%#x)\n",
+		    pxm);
 
 	return NUMA_NO_NODE;
 
diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index bc75e1ae7d42..f5e30d4e0236 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -876,13 +876,8 @@ static void cf_check plt_overflow(void *unused)
         plt_stamp64 += plt_mask + 1;
     }
     if ( i != 0 )
-    {
-        static bool warned_once;
-
-        if ( !test_and_set_bool(warned_once) )
-            printk("Platform timer appears to have unexpectedly wrapped "
-                   "%u%s times.\n", i, (i == 10) ? " or more" : "");
-    }
+        printk_once("Platform timer appears to have unexpectedly wrapped "
+                    "%u%s times.\n", i, (i == 10) ? " or more" : "");
 
     spin_unlock_irq(&platform_timer_lock);
 
@@ -2156,14 +2151,8 @@ void init_percpu_time(void)
         }
         else if ( adj != tsc_adjust[socket] )
         {
-            static bool __read_mostly warned;
-
-            if ( !warned )
-            {
-                warned = true;
-                printk(XENLOG_WARNING
-                       "Differing TSC ADJUST values within socket(s) - fixing all\n");
-            }
+            printk_once(XENLOG_WARNING
+                        "Differing TSC ADJUST values within socket(s) - fixing all\n");
             wrmsrl(MSR_IA32_TSC_ADJUST, tsc_adjust[socket]);
         }
     }

base-commit: 31c65549746179e16cf3f82b694b4b1e0b7545ca
-- 
2.30.2


