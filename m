Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F32F523EC96
	for <lists+xen-devel@lfdr.de>; Fri,  7 Aug 2020 13:34:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k40dt-0007gA-TN; Fri, 07 Aug 2020 11:34:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ERlR=BR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k40dr-0007fs-Oc
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2020 11:34:31 +0000
X-Inumbo-ID: eef526d7-ee84-4f15-9ce2-d9c363ce3b96
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eef526d7-ee84-4f15-9ce2-d9c363ce3b96;
 Fri, 07 Aug 2020 11:34:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 373B8B071;
 Fri,  7 Aug 2020 11:34:48 +0000 (UTC)
Subject: [PATCH v2 6/7] x86: move cpu_{up,down}_helper()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3a8356a9-313c-6de8-f409-977eae1fbfa5@suse.com>
Message-ID: <d9f8c767-f6a1-d0d3-01db-5e5f850997d0@suse.com>
Date: Fri, 7 Aug 2020 13:34:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <3a8356a9-313c-6de8-f409-977eae1fbfa5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is in preparation of making the building of sysctl.c conditional.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/smp.c
+++ b/xen/arch/x86/smp.c
@@ -22,6 +22,7 @@
 #include <asm/hardirq.h>
 #include <asm/hpet.h>
 #include <asm/hvm/support.h>
+#include <asm/setup.h>
 #include <irq_vectors.h>
 #include <mach_apic.h>
 
@@ -396,3 +397,36 @@ void call_function_interrupt(struct cpu_
     perfc_incr(ipis);
     smp_call_function_interrupt();
 }
+
+long cpu_up_helper(void *data)
+{
+    unsigned int cpu = (unsigned long)data;
+    int ret = cpu_up(cpu);
+
+    /* Have one more go on EBUSY. */
+    if ( ret == -EBUSY )
+        ret = cpu_up(cpu);
+
+    if ( !ret && !opt_smt &&
+         cpu_data[cpu].compute_unit_id == INVALID_CUID &&
+         cpumask_weight(per_cpu(cpu_sibling_mask, cpu)) > 1 )
+    {
+        ret = cpu_down_helper(data);
+        if ( ret )
+            printk("Could not re-offline CPU%u (%d)\n", cpu, ret);
+        else
+            ret = -EPERM;
+    }
+
+    return ret;
+}
+
+long cpu_down_helper(void *data)
+{
+    int cpu = (unsigned long)data;
+    int ret = cpu_down(cpu);
+    /* Have one more go on EBUSY. */
+    if ( ret == -EBUSY )
+        ret = cpu_down(cpu);
+    return ret;
+}
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -79,39 +79,6 @@ static void l3_cache_get(void *arg)
         l3_info->size = info.size / 1024; /* in KB unit */
 }
 
-long cpu_up_helper(void *data)
-{
-    unsigned int cpu = (unsigned long)data;
-    int ret = cpu_up(cpu);
-
-    /* Have one more go on EBUSY. */
-    if ( ret == -EBUSY )
-        ret = cpu_up(cpu);
-
-    if ( !ret && !opt_smt &&
-         cpu_data[cpu].compute_unit_id == INVALID_CUID &&
-         cpumask_weight(per_cpu(cpu_sibling_mask, cpu)) > 1 )
-    {
-        ret = cpu_down_helper(data);
-        if ( ret )
-            printk("Could not re-offline CPU%u (%d)\n", cpu, ret);
-        else
-            ret = -EPERM;
-    }
-
-    return ret;
-}
-
-long cpu_down_helper(void *data)
-{
-    int cpu = (unsigned long)data;
-    int ret = cpu_down(cpu);
-    /* Have one more go on EBUSY. */
-    if ( ret == -EBUSY )
-        ret = cpu_down(cpu);
-    return ret;
-}
-
 static long smt_up_down_helper(void *data)
 {
     bool up = (bool)data;


