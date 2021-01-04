Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B250C2E9C33
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 18:41:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61448.108158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwTrO-0004j6-AN; Mon, 04 Jan 2021 17:41:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61448.108158; Mon, 04 Jan 2021 17:41:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwTrO-0004ih-7A; Mon, 04 Jan 2021 17:41:38 +0000
Received: by outflank-mailman (input) for mailman id 61448;
 Mon, 04 Jan 2021 17:41:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U5jC=GH=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1kwTrN-0004ic-DT
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 17:41:37 +0000
Received: from mga03.intel.com (unknown [134.134.136.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 55d27197-8fb0-4d87-9f86-befa8905d820;
 Mon, 04 Jan 2021 17:41:35 +0000 (UTC)
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2021 09:41:34 -0800
Received: from aparija-mobl1.amr.corp.intel.com (HELO ubuntu.localdomain)
 ([10.212.21.134])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2021 09:41:33 -0800
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
X-Inumbo-ID: 55d27197-8fb0-4d87-9f86-befa8905d820
IronPort-SDR: G+apP087tvjmLDF4225t8XljUc9lU6eZx2mE1PXzCneoV2XYz1CfepbywWHFYKXzsuWRQv1hMn
 yS/q3e065NwQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9854"; a="177086248"
X-IronPort-AV: E=Sophos;i="5.78,474,1599548400"; 
   d="scan'208";a="177086248"
IronPort-SDR: NbSqJRQNaaAzCPJ/XgSgbXv/7dAzf+iT+DQw+HG2MrA2k+7I6r4HV9xCCw7YoB+uVQAPaRIZQv
 OjPTPahhb2TA==
X-IronPort-AV: E=Sophos;i="5.78,474,1599548400"; 
   d="scan'208";a="349597692"
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 1/2] x86/mem_sharing: copy cpuid during vm forking
Date: Mon,  4 Jan 2021 09:41:26 -0800
Message-Id: <6d5ca8a57a2745e933f00706bff306844611f64d.1609781242.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
---
 xen/arch/x86/mm/mem_sharing.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index c428fd16ce..4a02c7d6f2 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1764,6 +1764,7 @@ static int fork(struct domain *cd, struct domain *d)
 
         domain_pause(d);
         cd->max_pages = d->max_pages;
+        memcpy(cd->arch.cpuid, d->arch.cpuid, sizeof(*d->arch.cpuid));
         cd->parent = d;
     }
 
-- 
2.25.1


