Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D1AA30131
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 02:57:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885065.1294841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thfVz-0008Kh-L0; Tue, 11 Feb 2025 01:56:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885065.1294841; Tue, 11 Feb 2025 01:56:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thfVz-0008Hk-II; Tue, 11 Feb 2025 01:56:43 +0000
Received: by outflank-mailman (input) for mailman id 885065;
 Tue, 11 Feb 2025 01:56:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YqFZ=VC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1thfVy-0008He-5i
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 01:56:42 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b2b8d6d-e81b-11ef-b3ef-695165c68f79;
 Tue, 11 Feb 2025 02:56:33 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 17B63A40240;
 Tue, 11 Feb 2025 01:54:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50625C4CED1;
 Tue, 11 Feb 2025 01:56:31 +0000 (UTC)
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
X-Inumbo-ID: 6b2b8d6d-e81b-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739238992;
	bh=3cZUuDu1esfcPXH6WIUROhzRNNhSl5UMjaGoR/VVbu0=;
	h=Date:From:To:cc:Subject:From;
	b=iohoBrcA2BFKM3o3h+e09JQhQX0oaqAPyr0wyCqxqFSIpfXBNVe88M6T1Y9qlNSqe
	 ni1XbhJWuqc15ziX7uA1C8PBqLlcnBNirYcjQxU5Dn4caf/N8i3ko64b5TiyEsMOgM
	 XPOkMyK4kVxfzyQP5rUiYNsp2rUMaotlcD94N0gacS08oyXVzvRdv5HlgdiZPJQqMH
	 QpB6Q7LXbLhFvXvsm5ViNnUHPLXJfUN2RW/eqcEOm6gjOJ0AXkLAuJbNZR2E4yCyhs
	 g6sYpr1B7AIdF2Kpxa+zT2Yi33KmP/yZJLYi3fDEYqzf2sKD0aNb2wXpAxNQ8TIEtM
	 nOHfJjD5ZcL8w==
Date: Mon, 10 Feb 2025 17:56:30 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Xenia.Ragiadakou@amd.com, 
    dpsmith@apertussolutions.com
Subject: [RFC] dom0less vcpu affinity bindings
Message-ID: <alpine.DEB.2.22.394.2502101746240.619090@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

We have received requests to introduce Dom0less vCPU affinity bindings
to allow configuring which pCPUs a given vCPU is allowed to run on.

After considering different approaches, I am thinking of using the
following binding format:

    vcpu0 {
           compatible = "xen,vcpu-affinity"; // compatible string
           id = <0>;  // vcpu id
           hard-affinity = "1,4-7"; // pcpu ranges
    };

Notably, the hard-affinity property is represented as a string.

We also considered using a bitmask, such as:

           hard-affinity = <0x0f>;

However, I decided against this approach because, on large server
systems, the number of physical CPUs can be very high, making the
bitmask size potentially very large. The string representation is more
practical for large systems and is also easier to understand and write.
It is also fully aligned with the way we have already implemented the
llc-colors option (see docs/misc/arm/device-tree/booting.txt and
docs/misc/cache-coloring.rst:).

What do you think?

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 49d1f14d65..12379ecb20 100644
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
 

