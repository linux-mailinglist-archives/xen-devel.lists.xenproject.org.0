Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 874E722F61B
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jul 2020 19:06:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k06Zc-0006r0-Pn; Mon, 27 Jul 2020 17:06:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1WzZ=BG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k06Zc-0006qK-7U
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2020 17:06:00 +0000
X-Inumbo-ID: 6f1647b4-d02b-11ea-a7b1-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6f1647b4-d02b-11ea-a7b1-12813bfff9fa;
 Mon, 27 Jul 2020 17:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595869555;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9BA2HuY2XfFbO7rOd5htwjlC8tyCla4CvMSRDDan0zM=;
 b=hvHbfeSU5EghLHXL0RE4MfWuUjtKOxBqV8nRz33X9lmu942Mmx3W0MQl
 NXSNgPZoG7VmOzuF64RdN7Q7qTHkngnSu3b1W22L8Z+I9RJ4zNuHVTsCf
 kfx8cpwXaxW0jwegLsYdCQ9jEyLHhSyb0+eRoQtwiRbgVaW0cNNPWVRtZ c=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Cn+VFplSK30A9ca43AE3YL9md4WrnPn8Hd8a+AWow0raSKjK6EGyBpPdmEAToQ+UOrkXTHUPwr
 0xkgbKh5R/r6OQ/Yt/bZtjewBYXoXMkehllRyFl9N4vJKukDB4zyoGt/tzExtPRE/tf7Q8rHGY
 3YzHsq7bBlo0iHYFpkLbALQbdYVKqCC9hreyMI9J1GIiy93wKQdv+uGJiVpsLw4MNlXozw2oJQ
 PkGLS+mHAkzhteDah9IoEOTqheAA83On1BKqcsuj9MA/yrEcKnHO/rm9UlBHNIGm8MblLga+J4
 sF0=
X-SBRS: 2.7
X-MesageID: 23610699
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,402,1589256000"; d="scan'208";a="23610699"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH v2 2/5] x86/hvm: don't force vCPU 0 for IRQ 0 when using fixed
 destination mode
Date: Mon, 27 Jul 2020 19:05:36 +0200
Message-ID: <20200727170539.55798-3-roger.pau@citrix.com>
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

When the IO APIC pin mapped to the ISA IRQ 0 has been configured to
use fixed delivery mode do not forcefully route interrupts to vCPU 0,
as the OS might have setup those interrupts to be injected to a
different vCPU, and injecting to vCPU 0 can cause the OS to miss such
interrupts or errors to happen due to unexpected vectors being
injected on vCPU 0.

In order to fix remove such handling altogether for fixed destination
mode pins and just inject them according to the data setup in the
IO-APIC entry.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/hvm/vioapic.c | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index b00037ea87..123191db75 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -438,26 +438,11 @@ static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
     }
 
     case dest_Fixed:
-    {
-#ifdef IRQ0_SPECIAL_ROUTING
-        /* Do not deliver timer interrupts to VCPU != 0 */
-        if ( (irq == hvm_isa_irq_to_gsi(0)) && pt_active(&d->arch.vpit.pt0) )
-        {
-            if ( (v = d->vcpu ? d->vcpu[0] : NULL) != NULL )
-                ioapic_inj_irq(vioapic, vcpu_vlapic(v), vector,
-                               trig_mode, delivery_mode);
-        }
-        else
-#endif
-        {
-            for_each_vcpu ( d, v )
-                if ( vlapic_match_dest(vcpu_vlapic(v), NULL,
-                                       0, dest, dest_mode) )
-                    ioapic_inj_irq(vioapic, vcpu_vlapic(v), vector,
-                                   trig_mode, delivery_mode);
-        }
+        for_each_vcpu ( d, v )
+            if ( vlapic_match_dest(vcpu_vlapic(v), NULL, 0, dest, dest_mode) )
+                ioapic_inj_irq(vioapic, vcpu_vlapic(v), vector, trig_mode,
+                               delivery_mode);
         break;
-    }
 
     case dest_NMI:
     {
-- 
2.27.0


