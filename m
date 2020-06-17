Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 559C11FD1D2
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 18:20:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlan5-0003zd-P0; Wed, 17 Jun 2020 16:19:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7256=76=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1jlan5-0003zX-7u
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 16:19:55 +0000
X-Inumbo-ID: 601d0e12-b0b6-11ea-b9fe-12813bfff9fa
Received: from mga02.intel.com (unknown [134.134.136.20])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 601d0e12-b0b6-11ea-b9fe-12813bfff9fa;
 Wed, 17 Jun 2020 16:19:53 +0000 (UTC)
IronPort-SDR: Vz5BfJWgfi17m915PPDvWK3yczsOyPgcVYN6DLWChhEzX3OtlJjBhPZjv4ItZqfc4vr0bvVuR1
 +39dA2vUCCZw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2020 09:19:52 -0700
IronPort-SDR: 4stfDd3SQSjkxnWKfMGK/jTRCLh1RYTXqlkM0QY1yxxu3cNcG+1V/VOB9+E/PvxsMVrXfluH3N
 2T+TvKmg31aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,523,1583222400"; d="scan'208";a="421191345"
Received: from emagureg-mobl.amr.corp.intel.com (HELO ubuntu.localdomain)
 ([10.212.104.207])
 by orsmga004.jf.intel.com with ESMTP; 17 Jun 2020 09:19:51 -0700
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 for-4.14] x86/vmx: use P2M_ALLOC in vmx_load_pdptrs instead
 of P2M_UNSHARE
Date: Wed, 17 Jun 2020 09:19:49 -0700
Message-Id: <3555e16baa9e1909dbefaaab04330694135c9021.1592410065.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Tamas K Lengyel <tamas.lengyel@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

While forking VMs running a small RTOS system (Zephyr) a Xen crash has been
observed due to a mm-lock order violation while copying the HVM CPU context
from the parent. This issue has been identified to be due to
hap_update_paging_modes first getting a lock on the gfn using get_gfn. This
call also creates a shared entry in the fork's memory map for the cr3 gfn. The
function later calls hap_update_cr3 while holding the paging_lock, which
results in the lock-order violation in vmx_load_pdptrs when it tries to unshare
the above entry when it grabs the page with the P2M_UNSHARE flag set.

Since vmx_load_pdptrs only reads from the page its usage of P2M_UNSHARE was
unnecessary to start with. Using P2M_ALLOC is the appropriate flag to ensure
the p2m is properly populated and to avoid the lock-order violation we
observed.

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
---
v2: This patch was previously sent as
     "x86/hap: use get_gfn_type in hap_update_paging_modes"
---
 xen/arch/x86/hvm/vmx/vmx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index ab19d9424e..cc6d4ece22 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -1325,7 +1325,7 @@ static void vmx_load_pdptrs(struct vcpu *v)
     if ( (cr3 & 0x1fUL) && !hvm_pcid_enabled(v) )
         goto crash;
 
-    page = get_page_from_gfn(v->domain, cr3 >> PAGE_SHIFT, &p2mt, P2M_UNSHARE);
+    page = get_page_from_gfn(v->domain, cr3 >> PAGE_SHIFT, &p2mt, P2M_ALLOC);
     if ( !page )
     {
         /* Ideally you don't want to crash but rather go into a wait 
-- 
2.25.1


