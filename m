Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 999A91F7B31
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 17:57:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjm3T-0006KW-OI; Fri, 12 Jun 2020 15:57:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5h37=7Z=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jjm3S-0006K0-3P
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 15:57:18 +0000
X-Inumbo-ID: 61d895d8-acc5-11ea-b5e3-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 61d895d8-acc5-11ea-b5e3-12813bfff9fa;
 Fri, 12 Jun 2020 15:57:14 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: K6m2NGmVcam+h7MTcp4Z4ANjw6IUgDn+vvI1B0j51XUYS3mmrM7fV9TTaqqfE+23htLnVcwEwU
 Ma81K7w7rsxqyOQ4bzlJq4jzSwX8tHTz3mNH8atqZV01hDCaiEwvM2r0R7jPAMvbI6i9m9xkbF
 vz89E0ANtkjP0NuY6ND9GVMjEqygCHPUfObjN3vBPVcnD8KN8SEPaVyusYUT1VDaQVPD8vyA/D
 7B+9qsMe7KfEJYlrIkBZ+jHmnjvuByNSZLK15zbcAb+ajOMpWCn7ZmMU5SbwNhGA8HaZNBt0xN
 A9s=
X-SBRS: 2.7
X-MesageID: 20213495
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,503,1583211600"; d="scan'208";a="20213495"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH for-4.14 2/8] x86/hvm: don't force vCPU 0 for IRQ 0 when using
 fixed destination mode
Date: Fri, 12 Jun 2020 17:56:34 +0200
Message-ID: <20200612155640.4101-3-roger.pau@citrix.com>
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
---
 xen/arch/x86/hvm/vioapic.c | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index bd41036137..67472e5934 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -445,26 +445,11 @@ static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
     }
 
     case dest_Fixed:
-    {
-#ifdef IRQ0_SPECIAL_ROUTING
-        /* Do not deliver timer interrupts to VCPU != 0 */
-        if ( (irq == hvm_isa_irq_to_gsi(0)) && pit_channel0_enabled() )
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
2.26.2


