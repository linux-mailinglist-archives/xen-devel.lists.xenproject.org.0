Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE48D192562
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 11:22:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH38I-00018e-UT; Wed, 25 Mar 2020 10:19:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lu4h=5K=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jH38H-00017y-Hq
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 10:19:33 +0000
X-Inumbo-ID: 1e89a288-6e82-11ea-a6c1-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e89a288-6e82-11ea-a6c1-bc764e2007e4;
 Wed, 25 Mar 2020 10:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585131573;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6fjiTrIRuEMMbz6K31zXO+vBOLjObAGvvwGKsTQeTO4=;
 b=CfJCBgjS+n3O2KsxRFPza84QWZfHdDq7e8NP4UyE8smTIEYItLdOPVZJ
 5K5KxygxlOTljS3sgXR8Y1PIRxzZWdBW6qrtcwq80nYmSMD29gGd4r07f
 msXQrGaqDvERZM+wAe/E0Q3L0gXsNCNX6GkQB233qsITC1tu7j6YHQxBj g=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: iDUZuyWNElRo2j3uxW+9LC9d48FFnVlHM66p4HjdT7p4C9WG+Y+/QteIwqU5UoARr4omeBhPAl
 7uVSHy0eUcvhAwnU07I0WJjHuOEESE7Z9k/PiImJcJlmuIi+v+zx2EHoI3C7bCz9rxs4a9EWsz
 ybkSlVOKE13Wd8+VXOTm0zW2OtDEDRW/+DtgPCO/1ANNy+aS0QZfIT7CcpaJbh62KiElJCJePL
 Rq1gosL2qQQAaXrVn7UvAE8dDbDqL6nctHff26XrTFqhx3epUoX2uqNvUW5DTtgpGIzkSI0l1P
 3UM=
X-SBRS: 2.7
X-MesageID: 14930583
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,304,1580792400"; d="scan'208";a="14930583"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 25 Mar 2020 11:19:07 +0100
Message-ID: <20200325101910.29168-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200325101910.29168-1-roger.pau@citrix.com>
References: <20200325101910.29168-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: [Xen-devel] [PATCH v2 1/4] Revert "x86/vvmx: fix virtual interrupt
 injection when Ack on exit control is used"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This reverts commit f96e1469ad06b61796c60193daaeb9f8a96d7458.

The commit is wrong, as the whole point of nvmx_update_apicv is to
update the guest interrupt status field when the Ack on exit VMEXIT
control feature is enabled.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
---
 xen/arch/x86/hvm/vmx/vvmx.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index f049920196..1b8461ba30 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -1456,12 +1456,7 @@ static void virtual_vmexit(struct cpu_user_regs *regs)
     /* updating host cr0 to sync TS bit */
     __vmwrite(HOST_CR0, v->arch.hvm.vmx.host_cr0);
 
-    if ( cpu_has_vmx_virtual_intr_delivery &&
-         /*
-          * Only inject the vector if the Ack on exit bit is not set, else the
-          * interrupt will be signaled in the vmcs VM_EXIT_INTR_INFO field.
-          */
-         !(get_vvmcs(v, VM_EXIT_CONTROLS) & VM_EXIT_ACK_INTR_ON_EXIT) )
+    if ( cpu_has_vmx_virtual_intr_delivery )
         nvmx_update_apicv(v);
 
     nvcpu->nv_vmswitch_in_progress = 0;
-- 
2.26.0


