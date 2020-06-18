Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 794791FF4EA
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 16:39:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlvhB-0001g3-SF; Thu, 18 Jun 2020 14:39:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lyql=77=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1jlvhA-0001fw-Ik
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 14:39:12 +0000
X-Inumbo-ID: 77941c1e-b171-11ea-bca7-bc764e2007e4
Received: from mga02.intel.com (unknown [134.134.136.20])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 77941c1e-b171-11ea-bca7-bc764e2007e4;
 Thu, 18 Jun 2020 14:39:08 +0000 (UTC)
IronPort-SDR: ZJwvxblUqawLx2cdqGGRGknGPinoslPeX/q0yZv33wL6t14wMm9k0thO3vDRj/WpNtQpnmf+xa
 tixZaxYE2FQw==
X-IronPort-AV: E=McAfee;i="6000,8403,9655"; a="130991527"
X-IronPort-AV: E=Sophos;i="5.73,526,1583222400"; d="scan'208";a="130991527"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2020 07:39:08 -0700
IronPort-SDR: EEyENaOnzeDXI0wIjSv/8wWcfF+r6GXpel4M9d2UGnpC2ie0Pu4vU45v3uh4eROki0CNV1VdyM
 DgvBrYliamdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,526,1583222400"; d="scan'208";a="277642948"
Received: from unknown (HELO ubuntu.localdomain) ([10.255.79.91])
 by orsmga006.jf.intel.com with ESMTP; 18 Jun 2020 07:39:06 -0700
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v3 for-4.14] x86/vmx: use P2M_ALLOC in vmx_load_pdptrs instead
 of P2M_UNSHARE
Date: Thu, 18 Jun 2020 07:39:04 -0700
Message-Id: <a7635e7423f834f44a132114bd3e039dd0435a00.1592490545.git.tamas.lengyel@intel.com>
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
the p2m is properly populated.

Note that the lock order violation is avoided because before the paging_lock is
taken a lookup is performed with P2M_ALLOC that forks the page, thus the second
lookup in vmx_load_pdptrs succeeds without having to perform the fork. We keep
P2M_ALLOC in vmx_load_pdptrs because there are code-paths leading up to it
which don't take the paging_lock and that have no previous lookup. Currently no
other code-path exists leading there with the paging_lock taken, thus no
further adjustments are necessary.

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
---
v3: expand commit message to explain why there is no lock-order violation
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


