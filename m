Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F4A2F41C5
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 03:30:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66256.117605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzVu6-00055n-Bd; Wed, 13 Jan 2021 02:28:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66256.117605; Wed, 13 Jan 2021 02:28:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzVu6-00055O-8K; Wed, 13 Jan 2021 02:28:58 +0000
Received: by outflank-mailman (input) for mailman id 66256;
 Wed, 13 Jan 2021 02:28:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3eh5=GQ=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1kzVu5-00055J-46
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 02:28:57 +0000
Received: from mga02.intel.com (unknown [134.134.136.20])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5767fbf5-44cf-4cf7-9deb-bcc142e567b0;
 Wed, 13 Jan 2021 02:28:55 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2021 18:28:53 -0800
Received: from jmrober1-mobl.amr.corp.intel.com (HELO ubuntu.localdomain)
 ([10.209.65.239])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2021 18:28:52 -0800
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
X-Inumbo-ID: 5767fbf5-44cf-4cf7-9deb-bcc142e567b0
IronPort-SDR: UAMv+dhVZt9ur3Hq0UinZLNeMFVOL19OuSYLQ4czN3/3PokLhrauYB+UW8+fyARQ71KlqZE0Pu
 TrE5OHfP+91A==
X-IronPort-AV: E=McAfee;i="6000,8403,9862"; a="165225684"
X-IronPort-AV: E=Sophos;i="5.79,343,1602572400"; 
   d="scan'208";a="165225684"
IronPort-SDR: 0IthQ2bhlxtUJXp3M0ZxuQian0irN3WOGZMwS8QtmrFhEeLOZqUQY6ddoLwS/bnmqb69spqsnm
 XO7UsJ3jph7Q==
X-IronPort-AV: E=Sophos;i="5.79,343,1602572400"; 
   d="scan'208";a="424394710"
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86/mem_sharing: fix wrong field name used in 2c5119d
Date: Tue, 12 Jan 2021 18:28:45 -0800
Message-Id: <fcc458c391c6c43cce9b393cf7eb197a5428273e.1610504682.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The arch_domain struct has "msr", not "msrs".

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
---
I've build tested originally with "msr" but typod "msrs" when creating the
patch that was sent in. Sorry for the noise.
---
 xen/arch/x86/mm/mem_sharing.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index a98a1709c2..c8a6d11b90 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1781,7 +1781,7 @@ static int fork(struct domain *cd, struct domain *d)
         domain_pause(d);
         cd->max_pages = d->max_pages;
         *cd->arch.cpuid = *d->arch.cpuid;
-        *cd->arch.msrs = *d->arch.msrs;
+        *cd->arch.msr = *d->arch.msr;
         cd->parent = d;
     }
 
-- 
2.25.1


