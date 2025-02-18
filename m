Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A38B1A3A8F2
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 21:29:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892239.1301229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkUDi-0008FX-Uo; Tue, 18 Feb 2025 20:29:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892239.1301229; Tue, 18 Feb 2025 20:29:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkUDi-0008D2-RL; Tue, 18 Feb 2025 20:29:30 +0000
Received: by outflank-mailman (input) for mailman id 892239;
 Tue, 18 Feb 2025 20:29:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qrz8=VJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tkUDi-0008Cw-4o
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 20:29:30 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c6143b4-ee37-11ef-9896-31a8f345e629;
 Tue, 18 Feb 2025 21:29:27 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 76B875C4B0E;
 Tue, 18 Feb 2025 20:28:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DAFEC4CEE2;
 Tue, 18 Feb 2025 20:29:25 +0000 (UTC)
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
X-Inumbo-ID: 0c6143b4-ee37-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739910566;
	bh=UNatw6mN/MSuadmYX0vRKq+ma8MumYtube41N/9BiyM=;
	h=Date:From:To:cc:Subject:From;
	b=HOaHEJxE2ahkdDWi5jWQwOyUA5Q8wEyKVrqqUm0YDGiUzns+HLFwzCP3wXIQ+kdzi
	 h+wL+aeAlu5QCpo+DMN+wYe1oVMWwa6dUrwC+1rOecs8zgXg73BlqllgtEKZ+iNGnY
	 oxqNN1efh5xgdilVrxg9rPDNx2VRSB5vZ4CXBbmrg3xnF8SB+UCtrRMBrWLdQ0HIT5
	 9tykEOc+JbHKjBy4vrskbvNmau0s7UHn80UHAKM8t7J7wTMK4Q/h7RnmrzfYgm8VsF
	 NgqYmzcXPqCjMtno9Q1G4AeY3tWMjI4Vs1CknU6WNkY5nRsHyHFcGihSNJIDfE27BW
	 ZNJeVjv4GcYOA==
Date: Tue, 18 Feb 2025 12:29:24 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, Julien Grall <julien@xen.org>, 
    bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, 
    dpsmith@apertussolutions.com, xenia.ragiadakou@amd.com
Subject: [PATCH v3] xen/dom0less: support for vcpu affinity
Message-ID: <alpine.DEB.2.22.394.2502181227580.1085376@ubuntu-linux-20-04-desktop>
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

Note that the property hard-affinity is optional. It is possible to add
other properties in the future not only to specify soft affinity, but
also to provide more precise methods for configuring affinity. For
instance, on ARM the MPIDR could be use to specify the pCPU. For now, it
is left to the future.

Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v3:
- improve commit message
- improve binding doc
- add panic on invalid pCPU
- move parsing to a separate function

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 9c881baccc..10e55c825c 100644
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
+    on both sides. The numbers refer to pCPU ids.
+
 
 Example
 =======
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 49d1f14d65..e364820189 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -810,6 +810,68 @@ static int __init construct_domU(struct domain *d,
     return rc;
 }
 
+static void __init domain_vcpu_affinity(struct domain *d,
+                                        const struct dt_device_node *node)
+{
+    const char *hard_affinity_str = NULL;
+    struct dt_device_node *np;
+    uint32_t val;
+    int rc;
+
+    dt_for_each_child_node(node, np)
+    {
+        const char *s;
+        struct vcpu *v;
+        cpumask_t affinity;
+
+        if ( !dt_device_is_compatible(np, "xen,vcpu-affinity") )
+            continue;
+
+        if ( !dt_property_read_u32(np, "id", &val) )
+            continue;
+
+        if ( val >= d->max_vcpus )
+            panic("Invalid vcpu_id %u for domain %s\n", val, dt_node_name(node));
+
+        v = d->vcpu[val];
+        rc = dt_property_read_string(np, "hard-affinity", &hard_affinity_str);
+        if ( rc < 0 )
+            continue;
+
+        s = hard_affinity_str;
+        cpumask_clear(&affinity);
+        while ( *s != '\0' )
+        {
+            unsigned int start, end;
+
+            start = simple_strtoul(s, &s, 0);
+
+            if ( *s == '-' )    /* Range */
+            {
+                s++;
+                end = simple_strtoul(s, &s, 0);
+            }
+            else                /* Single value */
+                end = start;
+
+            if ( end >= nr_cpu_ids )
+                panic("Invalid pCPU %u for domain %s\n", end, dt_node_name(node));
+
+            for ( ; start <= end; start++ )
+                cpumask_set_cpu(start, &affinity);
+
+            if ( *s == ',' )
+                s++;
+            else if ( *s != '\0' )
+                break;
+        }
+
+        rc = vcpu_set_hard_affinity(v, &affinity);
+        if ( rc )
+            panic("vcpu%d: failed to set hard affinity\n", v->vcpu_id);
+    }
+}
+
 void __init create_domUs(void)
 {
     struct dt_device_node *node;
@@ -992,6 +1054,8 @@ void __init create_domUs(void)
         if ( rc )
             panic("Could not set up domain %s (rc = %d)\n",
                   dt_node_name(node), rc);
+
+        domain_vcpu_affinity(d, node);
     }
 }
 

