Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AB2A369DA
	for <lists+xen-devel@lfdr.de>; Sat, 15 Feb 2025 01:18:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889195.1298392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tj5ro-0000ru-4x; Sat, 15 Feb 2025 00:17:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889195.1298392; Sat, 15 Feb 2025 00:17:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tj5ro-0000pp-04; Sat, 15 Feb 2025 00:17:08 +0000
Received: by outflank-mailman (input) for mailman id 889195;
 Sat, 15 Feb 2025 00:17:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NTp2=VG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tj5rm-0000pg-FP
 for xen-devel@lists.xenproject.org; Sat, 15 Feb 2025 00:17:06 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f17afc1-eb32-11ef-9aa4-95dc52dad729;
 Sat, 15 Feb 2025 01:17:05 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8D95CA44C86;
 Sat, 15 Feb 2025 00:15:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48F5BC4CEE2;
 Sat, 15 Feb 2025 00:17:02 +0000 (UTC)
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
X-Inumbo-ID: 2f17afc1-eb32-11ef-9aa4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739578623;
	bh=iyD/f/7fF6oVnVGs6M1iHbJK8GQDwrbZdVUoLjORj9o=;
	h=Date:From:To:cc:Subject:From;
	b=H71mJE6er12a3O3AwP9+6b+FK40069P4FWz90wRzLG+PH7hX0mWtuuD6VeBTek4+/
	 o2MYZEfHY9p0hXeuMPM+yIqlMoKvK3CZvluwu2186L6k23+tOthY6t3M8QygQswXGz
	 0RwnaYwctzuYJ1Z7fdJ1Wt4f0+flByzFii1BdNXjgA5jtkV+MHhod5zyF0OUapKdo/
	 ChG3yi+NDUwZUYopEIThyPsisaIaMidwuElOx+KReBT9LzZc/23FVgTgwrDja9nn79
	 Mxud0E/Md9zZxIiKpq9bHsAt3v3SHliXckYfzMmZSxk7x10dN1yLEJDAp+jU0rCXn7
	 sWfZdRfDB34nw==
Date: Fri, 14 Feb 2025 16:17:00 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, Julien Grall <julien@xen.org>, 
    bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, 
    dpsmith@apertussolutions.com, xenia.ragiadakou@amd.com
Subject: [PATCH v2] xen/dom0less: support for vcpu affinity
Message-ID: <alpine.DEB.2.22.394.2502141615050.3858257@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Add vcpu affinity to the dom0less bindings. Example:

                         dom1 {
                                 ...
                                 cpus = <4>;
                                 vcpu0 {
                                        compatible = "xen,vcpu-affinity";
                                        id = <0>;
                                        hard-affinity = "4-7";
                                 };
                                 vcpu1 {
                                        compatible = "xen,vcpu-affinity";
                                        id = <1>;
                                        hard-affinity = "0-3";
                                 };
                                 vcpu2 {
                                        compatible = "xen,vcpu-affinity";
                                        id = <2>;
                                        hard-affinity = "1,6";
                                 };
                                 ...
                         }

Note that the property hard-affinity is optional. It is possible to add
other properties in the future not only to specify soft affinity, but
also to provide more precise methods for configuring affinity. For
instance, on ARM the MPIDR could be use to specify the pCPU. For now, it
is left to the future.

Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v2:
- code style
- add binding description to docs/misc/arm/device-tree/booting.txt
---

 docs/misc/arm/device-tree/booting.txt | 21 +++++++++++
 xen/arch/arm/dom0less-build.c         | 51 +++++++++++++++++++++++++++
 2 files changed, 72 insertions(+)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 9c881baccc..6a2abbef4e 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -324,6 +324,27 @@ The ramdisk sub-node has the following properties:
     property because it will be created by the UEFI stub on boot.
     This option is needed only when UEFI boot is used.
 
+Under the "xen,domain" compatible node, it is possible optionally to add
+one or more sub-nodes to configure vCPU affinity. The vCPU affinity
+sub-node has the following properties:
+
+- compatible
+
+    "xen,vcpu-affinity"
+
+- id
+
+    A 32-bit integer that specifies the vCPU id. 0 is the first vCPU.
+    The last vCPU is cpus-1, where "cpus" is the number of vCPUs
+    specified with the "cpus" property under the "xen,domain" node.
+
+- hard-affinity
+
+    Optional. A string specifying the hard affinity configuration for the
+    vCPU: a comma-separated list of pCPUs or ranges of pCPUs is used.
+    Ranges are hyphen-separated intervals (such as `0-4`) and are inclusive
+    on both sides.
+
 
 Example
 =======
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 49d1f14d65..35d02689e7 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -818,6 +818,8 @@ void __init create_domUs(void)
     const struct dt_device_node *cpupool_node,
                                 *chosen = dt_find_node_by_path("/chosen");
     const char *llc_colors_str = NULL;
+    const char *hard_affinity_str = NULL;
+    struct dt_device_node *np;
 
     BUG_ON(chosen == NULL);
     dt_for_each_child_node(chosen, node)
@@ -992,6 +994,55 @@ void __init create_domUs(void)
         if ( rc )
             panic("Could not set up domain %s (rc = %d)\n",
                   dt_node_name(node), rc);
+
+        dt_for_each_child_node(node, np)
+        {
+            const char *s;
+            struct vcpu *v;
+            cpumask_t affinity;
+
+            if ( !dt_device_is_compatible(np, "xen,vcpu-affinity") )
+                continue;
+
+            if ( !dt_property_read_u32(np, "id", &val) )
+                continue;
+            if ( val >= d->max_vcpus )
+                panic("Invalid vcpu_id %u for domain %s\n", val, dt_node_name(node));
+
+            v = d->vcpu[val];
+            rc = dt_property_read_string(np, "hard-affinity", &hard_affinity_str);
+            if ( rc < 0 )
+                continue;
+
+            s = hard_affinity_str;
+            cpumask_clear(&affinity);
+            while ( *s != '\0' )
+            {
+                unsigned int start, end;
+
+                start = simple_strtoul(s, &s, 0);
+
+                if ( *s == '-' )    /* Range */
+                {
+                    s++;
+                    end = simple_strtoul(s, &s, 0);
+                }
+                else                /* Single value */
+                    end = start;
+
+                for ( ; start <= end; start++ )
+                    cpumask_set_cpu(start, &affinity);
+
+                if ( *s == ',' )
+                    s++;
+                else if ( *s != '\0' )
+                    break;
+            }
+
+            rc = vcpu_set_hard_affinity(v, &affinity);
+            if ( rc )
+                panic("vcpu%d: failed to set hard affinity\n", v->vcpu_id);
+        }
     }
 }
 
-- 
2.25.1


