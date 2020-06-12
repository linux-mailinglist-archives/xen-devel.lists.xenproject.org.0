Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC4C1F7B33
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 17:57:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjm3Y-0006Mu-GI; Fri, 12 Jun 2020 15:57:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5h37=7Z=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jjm3X-0006K0-3T
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 15:57:23 +0000
X-Inumbo-ID: 634bb10a-acc5-11ea-b5e3-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 634bb10a-acc5-11ea-b5e3-12813bfff9fa;
 Fri, 12 Jun 2020 15:57:16 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: T+j6pxRDudaou500LkfMDI+m1tD8yDtRWmcbpWv2muc/5y6LqO1oKjg10JVhhI+nWh1siuqw4T
 SkEu5nTveJxFL0LQE5TiK/L0AKvsm3fxWay0VHapaf71VXLThYEO2erGauASxXHkv/dm6CCVBy
 YjCb0+A77cIpUK/kc8/ROnp39OVyOsiYIISZrfaiqIl9gWfN/z7xVk6svDjAk0/vkuUtJP/V6Q
 6VJkn5THB2g2ghE5d1w9tRnGCl8ud+iYEFA5xnD3/lQFo8s2SvQ4/x699FkOYEbhCo0VIAYQiY
 eIw=
X-SBRS: 2.7
X-MesageID: 20265891
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,503,1583211600"; d="scan'208";a="20265891"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH for-4.14 3/8] x86/hvm: fix ISA IRQ 0 handling when set as
 lowest priority mode in IO APIC
Date: Fri, 12 Jun 2020 17:56:35 +0200
Message-ID: <20200612155640.4101-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200612155640.4101-1-roger.pau@citrix.com>
References: <20200612155640.4101-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Lowest priority destination mode does allow the vIO APIC code to
select a vCPU to inject the interrupt to, but the selected vCPU must
be part of the possible destinations configured for such IO APIC pin.

Fix the code in order to only force vCPU 0 if it's part of the
listed destinations.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/vioapic.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index 67472e5934..e1417cc6a7 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -422,12 +422,13 @@ static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
     case dest_LowestPrio:
     {
 #ifdef IRQ0_SPECIAL_ROUTING
-        /* Force round-robin to pick VCPU 0 */
-        if ( (irq == hvm_isa_irq_to_gsi(0)) && pit_channel0_enabled() )
-        {
-            v = d->vcpu ? d->vcpu[0] : NULL;
-            target = v ? vcpu_vlapic(v) : NULL;
-        }
+        struct vlapic *lapic0 = vcpu_vlapic(d->vcpu[0]);
+
+        /* Force to pick vCPU 0 if part of the destination list */
+        if ( (irq == hvm_isa_irq_to_gsi(0)) && pit_channel0_enabled() &&
+             vlapic_match_dest(lapic0, NULL, 0, dest, dest_mode) &&
+             vlapic_enabled(lapic0) )
+            target = lapic0;
         else
 #endif
             target = vlapic_lowest_prio(d, NULL, 0, dest, dest_mode);
-- 
2.26.2


