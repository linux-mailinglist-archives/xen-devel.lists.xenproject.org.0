Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DF21DD9A4
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 23:45:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbszO-00066j-My; Thu, 21 May 2020 21:44:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QHd7=7D=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1jbszN-00066e-6P
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 21:44:29 +0000
X-Inumbo-ID: 3e7f85a6-9bac-11ea-b07b-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3e7f85a6-9bac-11ea-b07b-bc764e2007e4;
 Thu, 21 May 2020 21:44:28 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 08GFkIz6P4d/Td+27tImWBk/VaI65rsGnGEyI50VD17NIZbQKRIEoVJxmmvzUS3xVi87M7fYZH
 i67gKdKdsMK1t3ehwV4f4WSG09mW8II54YUmuLtKgJMVTVqRgdJshHYgyDwlJ0LcJNk7DRVF9y
 QvZaPbD+W7SUUoE7YIZ/r2dz/eNxzOVX444vsbDshAHYz31PaNUVEdIt7GSg1Fv/oMBZt9a3ke
 pLdfW6MUXzOjF+M4qsehEBTFS0/vx7+astlQHtt9YKUFN5R3bHiv8FsGioLSNFo8fQ2W6MPTfT
 HTg=
X-SBRS: 2.7
X-MesageID: 18159679
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,419,1583211600"; d="scan'208";a="18159679"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/svm: retry after unhandled NPT fault if gfn was marked
 for recalculation
Date: Thu, 21 May 2020 22:43:58 +0100
Message-ID: <1590097438-28829-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: andrew.cooper3@citrix.com, Igor Druzhinin <igor.druzhinin@citrix.com>,
 wl@xen.org, jbeulich@suse.com, roger.pau@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

If a recalculation NPT fault hasn't been handled explicitly in
hvm_hap_nested_page_fault() then it's potentially safe to retry -
US bit has been re-instated in PTE and any real fault would be correctly
re-raised next time.

This covers a specific case of migration with vGPU assigned on AMD:
global log-dirty is enabled and causes immediate recalculation NPT
fault in MMIO area upon access. This type of fault isn't described
explicitly in hvm_hap_nested_page_fault (this isn't called on
EPT misconfig exit on Intel) which results in domain crash.

Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
---
 xen/arch/x86/hvm/svm/svm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 46a1aac..f0d0bd3 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1726,6 +1726,10 @@ static void svm_do_nested_pgfault(struct vcpu *v,
         /* inject #VMEXIT(NPF) into guest. */
         nestedsvm_vmexit_defer(v, VMEXIT_NPF, pfec, gpa);
         return;
+    case 0:
+        /* If a recalculation page fault hasn't been handled - just retry. */
+        if ( pfec & PFEC_user_mode )
+            return;
     }
 
     /* Everything else is an error. */
-- 
2.7.4


