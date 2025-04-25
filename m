Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9656A9D2D8
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 22:20:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968572.1358109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8PWR-0003fK-0f; Fri, 25 Apr 2025 20:19:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968572.1358109; Fri, 25 Apr 2025 20:19:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8PWQ-0003cu-Tr; Fri, 25 Apr 2025 20:19:42 +0000
Received: by outflank-mailman (input) for mailman id 968572;
 Fri, 25 Apr 2025 20:19:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kyFG=XL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u8PWP-0003co-Iz
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 20:19:41 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9bd10f93-2212-11f0-9ffb-bf95429c2676;
 Fri, 25 Apr 2025 22:19:37 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B97395C6C4D;
 Fri, 25 Apr 2025 20:17:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70769C4CEE4;
 Fri, 25 Apr 2025 20:19:34 +0000 (UTC)
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
X-Inumbo-ID: 9bd10f93-2212-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745612375;
	bh=p/Wzr8PhLp5Oa6tZk8NPVtMv4XXoLGKUGVq5bRFCBXk=;
	h=Date:From:To:cc:Subject:From;
	b=fdgDG6pgtoVGmldUUVvV4lTSitRC2Cx/1dIP9fzydEfG+cqbJ6u81Ry2kiASdy3N3
	 sEPVuU0DwdBhcN9a0RQYk0RoOXB84pss13mUsDyJrpXVymfGVXF9VZHHPwRLD4KYsp
	 +rR756t+u/wg0eU9FUPcJfFC2StAZ8bMTXxLOPcW9sksepvGkPd2vrL1m4eTuPo9j4
	 Mr82/Ia50l1FRfLdjarUyXD5sJ2k4KuMJ8TV0+44L70gARkK2/uS1lde2h0wHhGljj
	 EjC2XqwZd8DwBqGq/ZiBNwxIwcPCdOitOygnsJWUDF+k4VHsDwPfF/EYoAbvS+ak1f
	 y9OHq4CCWkVPA==
Date: Fri, 25 Apr 2025 13:19:33 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>, jason.andryuk@amd.com, 
    agarciav@amd.com
Subject: [PATCH] xen/x86: allow Dom0 PVH to call XENMEM_exchange
Message-ID: <alpine.DEB.2.22.394.2504251314050.785180@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

From: Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>

Dom0 PVH might need XENMEM_exchange when passing contiguous memory
addresses to firmware or co-processors not behind an IOMMU.

XENMEM_exchange was blocked for HVM/PVH DomUs, and accidentally it
impacted Dom0 PVH as well.

Permit Dom0 PVH to call XENMEM_exchange while leaving it blocked for
HVM/PVH DomUs.

Signed-off-by: Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 1cf2365167..e995944333 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4401,7 +4401,7 @@ int steal_page(
     const struct domain *owner;
     int rc;
 
-    if ( paging_mode_external(d) )
+    if ( paging_mode_external(d) && !is_hardware_domain(d) )
         return -EOPNOTSUPP;
 
     /* Grab a reference to make sure the page doesn't change under our feet */
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 8ca4e1a842..796eec081b 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -794,7 +794,7 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
             rc = guest_physmap_add_page(d, _gfn(gpfn), mfn,
                                         exch.out.extent_order) ?: rc;
 
-            if ( !paging_mode_translate(d) &&
+            if ( (!paging_mode_translate(d) || is_hardware_domain(d)) &&
                  __copy_mfn_to_guest_offset(exch.out.extent_start,
                                             (i << out_chunk_order) + j,
                                             mfn) )

