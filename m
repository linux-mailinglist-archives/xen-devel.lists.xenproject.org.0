Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBCE2EB51A
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 22:59:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62200.109992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwuLk-0005Rh-O1; Tue, 05 Jan 2021 21:58:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62200.109992; Tue, 05 Jan 2021 21:58:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwuLk-0005RI-Ke; Tue, 05 Jan 2021 21:58:44 +0000
Received: by outflank-mailman (input) for mailman id 62200;
 Tue, 05 Jan 2021 21:58:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w1U5=GI=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1kwuLj-0005RD-ED
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 21:58:43 +0000
Received: from mga17.intel.com (unknown [192.55.52.151])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7a87c966-cade-45a5-aac9-5b2b749e8781;
 Tue, 05 Jan 2021 21:58:40 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 13:58:39 -0800
Received: from rcsacra-mobl2.amr.corp.intel.com (HELO ubuntu.localdomain)
 ([10.212.99.154])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 13:58:38 -0800
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
X-Inumbo-ID: 7a87c966-cade-45a5-aac9-5b2b749e8781
IronPort-SDR: 88jrulC637oeIS4Q2FX1tZScfvhKRA9SWpFdJ9Izi7mr6NzKctxlvFMta4QCfXj2KtdLBLZ102
 LbUoxT4eiMrg==
X-IronPort-AV: E=McAfee;i="6000,8403,9855"; a="156969088"
X-IronPort-AV: E=Sophos;i="5.78,478,1599548400"; 
   d="scan'208";a="156969088"
IronPort-SDR: PrttMIuNSGm+P72OiBWro9um9lhK4mp2TRApsI+PVSrNxEePg+3P4pRr54ZAVPBBY42KgMNg+q
 sotnKY+EKArw==
X-IronPort-AV: E=Sophos;i="5.78,478,1599548400"; 
   d="scan'208";a="462456825"
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2] x86/mem_sharing: copy cpuid and msrs during vm forking
Date: Tue,  5 Jan 2021 13:58:23 -0800
Message-Id: <5ceda1696c935730c2b2925e2454a7502c6560f0.1609883742.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
---
 xen/arch/x86/mm/mem_sharing.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index c428fd16ce..fc7b2a4102 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1764,6 +1764,8 @@ static int fork(struct domain *cd, struct domain *d)
 
         domain_pause(d);
         cd->max_pages = d->max_pages;
+        *cd->arch.cpuid = *d->arch.cpuid;
+        *cd->arch.msrs = *d->arch.msrs;
         cd->parent = d;
     }
 
-- 
2.25.1


