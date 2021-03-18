Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DF3340FEE
	for <lists+xen-devel@lfdr.de>; Thu, 18 Mar 2021 22:38:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.99096.188243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lN0K0-0006mg-Iu; Thu, 18 Mar 2021 21:36:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99096.188243; Thu, 18 Mar 2021 21:36:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lN0K0-0006mH-FW; Thu, 18 Mar 2021 21:36:48 +0000
Received: by outflank-mailman (input) for mailman id 99096;
 Thu, 18 Mar 2021 21:36:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g+Rw=IQ=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1lN0Jy-0006mC-Ty
 for xen-devel@lists.xenproject.org; Thu, 18 Mar 2021 21:36:46 +0000
Received: from mga11.intel.com (unknown [192.55.52.93])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 94e665e2-818a-49b0-8076-167991c15e4d;
 Thu, 18 Mar 2021 21:36:44 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 14:36:43 -0700
Received: from uscipion-mobl.amr.corp.intel.com (HELO ubuntu.localdomain)
 ([10.212.120.33])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 14:36:41 -0700
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
X-Inumbo-ID: 94e665e2-818a-49b0-8076-167991c15e4d
IronPort-SDR: khfWbVH43/eYuUSi6uwRCy2I7RtfVRvxv4znCh2qkKShJ1gefAipzOIQ1e3yYpTOyeNBFwRPhn
 zk1ygg1pxDiQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="186421945"
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; 
   d="scan'208";a="186421945"
IronPort-SDR: U3WcM3RW5tct+EwOFvhYDnoFepoNdbX8jUezrZ0exlGXn0LN8oytr5OXtGmd1BqpN/VTY0udx6
 q6xf2j/LVnIw==
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; 
   d="scan'208";a="523408007"
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH for-4.15] x86/mem_sharing: copy parent VM's hostp2m's max_mapped_pfn during forking
Date: Thu, 18 Mar 2021 14:36:32 -0700
Message-Id: <bdeaf7893acd6497cc2b88f3a1357d1299960e9b.1616103095.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When creating a VM fork copy the parent VM's hostp2m max_mapped_pfn value. Some
toolstack relies on the XENMEM_maximum_gpfn value to establish the maximum
addressable physical memory in the VM and for forks that have not yet been
unpaused that value is not going to reflect the correct max gpfn that's
possible to populate into the p2m. This patch fixes the issue.

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
---
 xen/arch/x86/mm/mem_sharing.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 00ada05c10..98b14f7b0a 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1761,6 +1761,7 @@ static int copy_settings(struct domain *cd, struct domain *d)
         return rc;
 
     copy_tsc(cd, d);
+    p2m_get_hostp2m(cd)->max_mapped_pfn = p2m_get_hostp2m(d)->max_mapped_pfn;
 
     return rc;
 }
-- 
2.25.1


