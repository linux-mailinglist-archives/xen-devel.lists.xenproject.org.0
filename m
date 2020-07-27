Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 866BF22F61A
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jul 2020 19:06:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k06Zi-0006sp-CN; Mon, 27 Jul 2020 17:06:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1WzZ=BG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k06Zh-0006qK-7w
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2020 17:06:05 +0000
X-Inumbo-ID: 7062a6ee-d02b-11ea-a7b1-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7062a6ee-d02b-11ea-a7b1-12813bfff9fa;
 Mon, 27 Jul 2020 17:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595869559;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=saiDrgvFoGPsvHXwjrhIy9joLoxVibLVmDC510j+ikM=;
 b=TZ9nwE2DH71zn7T3PV+juoG9+N6zGMOToH/bDr1Oe5n3I9yhxf3tk36L
 gTgxeg/0OiucXSacAWIdnq1UOKZDQAFzbRczDhnNwVYfG11c/Ux98XPDd
 0VAJ/wsafXs4XCd+r6KadlZfDI648LPPSF8k5VTbwzXVKkMZajQzXMV+D k=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: NgwrdsjxFH/xaOvgM3zcURG7VC2t47NoPT9WCA+NYDz0pOkGAEBir4ieksjaq60g1CaMvh66Yc
 oHyamu8lkusknUi3B9lV/UGWODQqIYOFWylWXp1/pdtO+rLYjcAPmds6eJ/Gs2WcWr6dVrgJ9Z
 iOsAU7lTqtT3B82XPtDrf5tFl00hAwGTTHY98J4VTTgMZXczofvtAXHUqbvQ1ZLCQg6LB6Z7xS
 5zMM4luNKAbPztVazylyRJbRpcjAe02awLB5yTeBzVHN1JpuGZpjMGi0spnS6/wxgcJpjNmNc4
 IL4=
X-SBRS: 2.7
X-MesageID: 23613409
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,402,1589256000"; d="scan'208";a="23613409"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH v2 3/5] x86/hvm: fix ISA IRQ 0 handling when set as lowest
 priority mode in IO APIC
Date: Mon, 27 Jul 2020 19:05:37 +0200
Message-ID: <20200727170539.55798-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200727170539.55798-1-roger.pau@citrix.com>
References: <20200727170539.55798-1-roger.pau@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Lowest priority destination mode does allow the vIO APIC code to
select a vCPU to inject the interrupt to, but the selected vCPU must
be part of the possible destinations configured for such IO APIC pin.

Fix the code in order to only force vCPU 0 if it's part of the
listed destinations.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Add a comment regarding the vlapic_enabled check.
---
NB: I haven't added a fallback to vCPU 0 if no destination is found,
as it's not how real hardware behaves. I think we should assume that
no user have relied on this bogus Xen behavior for IRQ 0 interrupt
injection.
---
 xen/arch/x86/hvm/vioapic.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index 123191db75..67d4a6237f 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -415,12 +415,14 @@ static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
     case dest_LowestPrio:
     {
 #ifdef IRQ0_SPECIAL_ROUTING
-        /* Force round-robin to pick VCPU 0 */
-        if ( (irq == hvm_isa_irq_to_gsi(0)) && pt_active(&d->arch.vpit.pt0) )
-        {
-            v = d->vcpu ? d->vcpu[0] : NULL;
-            target = v ? vcpu_vlapic(v) : NULL;
-        }
+        struct vlapic *lapic0 = vcpu_vlapic(d->vcpu[0]);
+
+        /* Force to pick vCPU 0 if part of the destination list */
+        if ( (irq == hvm_isa_irq_to_gsi(0)) && pt_active(&d->arch.vpit.pt0) &&
+             vlapic_match_dest(lapic0, NULL, 0, dest, dest_mode) &&
+             /* Mimic the vlapic_enabled check found in vlapic_lowest_prio. */
+             vlapic_enabled(lapic0) )
+            target = lapic0;
         else
 #endif
             target = vlapic_lowest_prio(d, NULL, 0, dest, dest_mode);
-- 
2.27.0


