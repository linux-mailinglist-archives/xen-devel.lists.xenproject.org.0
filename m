Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD074EE56E
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 02:39:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297156.506118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1na5JY-00007i-J5; Fri, 01 Apr 2022 00:38:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297156.506118; Fri, 01 Apr 2022 00:38:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1na5JY-0008St-Cf; Fri, 01 Apr 2022 00:38:56 +0000
Received: by outflank-mailman (input) for mailman id 297156;
 Fri, 01 Apr 2022 00:38:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yIha=UL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1na5JV-00087e-OR
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 00:38:53 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1aaad07d-b154-11ec-a405-831a346695d4;
 Fri, 01 Apr 2022 02:38:52 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3AEF8B82277;
 Fri,  1 Apr 2022 00:38:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5D83C34113;
 Fri,  1 Apr 2022 00:38:50 +0000 (UTC)
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
X-Inumbo-ID: 1aaad07d-b154-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648773531;
	bh=9T3+bPtIQN0ln8b/3Ruflzv/jD4YwkoEfs6vAbEsKuo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bZubmMK4hA+QRJdgCDdVehxIiX1RH8Ke1lwWCqwQgR806kzHp6rt0hv8Vk8+2ZEDa
	 Zn7hQqnBTjrvR/r8511EpVtOo5WkNEibo1SFIV0unGDaZsSKlC4+S7LKkSxX2ZDBx4
	 8Y3lbNRNrGJwFXrJRvOn1PzTnA9oJo+mL0IZpQAud+ncZWgL4HVNvmkPXsKN7XGTKS
	 aBb4wlk95Lz3rhhBgwXYChylN3e7Csy+vwikE7Z23FpKZYKMr4jo2WRapq9gdaDW8J
	 xfymAwEmm868NeGswBzyIo0Tfyg3PC9M2OTIwN5tCKbSzf8lCfbAu4hDY0Sp4Txl05
	 VxYTIjX+udKMw==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	jgross@suse.com,
	Bertrand.Marquis@arm.com,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v4 3/9] xen/arm: temporarily elevate idle_domain privileged during create_domUs
Date: Thu, 31 Mar 2022 17:38:41 -0700
Message-Id: <20220401003847.38393-3-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2203311735380.2910984@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2203311735380.2910984@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

create_domUs might call functions that perform XSM checks on the current
domain, which is idle_domain at this time. Temporarily elevate
idle_domain privileges in create_domUs.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 xen/arch/arm/domain_build.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index b6189b935d..100a4959a8 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -27,6 +27,7 @@
 #include <asm/setup.h>
 #include <asm/cpufeature.h>
 #include <asm/domain_build.h>
+#include <xsm/xsm.h>
 
 #include <xen/irq.h>
 #include <xen/grant_table.h>
@@ -3210,6 +3211,8 @@ void __init create_domUs(void)
     struct dt_device_node *node;
     const struct dt_device_node *chosen = dt_find_node_by_path("/chosen");
 
+    xsm_elevate_priv(current->domain);
+
     BUG_ON(chosen == NULL);
     dt_for_each_child_node(chosen, node)
     {
@@ -3291,6 +3294,8 @@ void __init create_domUs(void)
         if ( construct_domU(d, node) != 0 )
             panic("Could not set up domain %s\n", dt_node_name(node));
     }
+
+    xsm_demote_priv(current->domain);
 }
 
 static int __init construct_dom0(struct domain *d)
-- 
2.25.1


