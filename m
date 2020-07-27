Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 121A722F619
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jul 2020 19:06:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k06ZZ-0006qP-C4; Mon, 27 Jul 2020 17:05:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1WzZ=BG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k06ZX-0006qK-Dz
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2020 17:05:55 +0000
X-Inumbo-ID: 6dc71d84-d02b-11ea-a7b1-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6dc71d84-d02b-11ea-a7b1-12813bfff9fa;
 Mon, 27 Jul 2020 17:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595869553;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Up0va2PHL+5mIou+IC4Y87q4ak8L8JXy1B8SeD1Qmuo=;
 b=H/6TthRiqEImLObwWiNtt7rj7iwF8BAlcLZNBs3K0NP5EGL3p3H9RVYb
 90yDbpYkf8UpZnuVqWfI/W1NtFth4HM64O1bKYJphkUctRURBK2EaWecv
 VY3B/lky/VmmXtvdv4HTbTjagTAwge3x8wZEDSId5M79Lg4BiGw+jwKa0 A=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 3NyJ2mKrVC5cGwM/IZpfLlAZeMKYPgseDdHEdrtodAuhDkLYDbi6eSn0FW/qhovh51HuBK0BGf
 MTJbaOvYa9NIe1o5Ry3qTfE72NiTRpA9PcEO0SPSm63l52XSGSpEHLIcPg0Ej1BrtcpWy7VHWq
 wr00foe33T3x+7UtxwGQf9PYmMFHAhb5HI03Aj2xB5FQrzt8uOQjvNS+4UNekypK1gUuOcfVFy
 rfqCoJmIMWFNU+UH65802BZYo4QvLQqOtCWpfReV/yO/UAHxqmHcV3Rrdo4RaDzx5HskJ7yMTk
 nQE=
X-SBRS: 2.7
X-MesageID: 23469011
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,402,1589256000"; d="scan'208";a="23469011"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH v2 1/5] x86/hvm: fix vIO-APIC build without
 IRQ0_SPECIAL_ROUTING
Date: Mon, 27 Jul 2020 19:05:35 +0200
Message-ID: <20200727170539.55798-2-roger.pau@citrix.com>
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

pit_channel0_enabled needs to be guarded with IRQ0_SPECIAL_ROUTING
since it's only used when the special handling of ISA IRQ 0 is
enabled. However such helper being a single line it's better to just
inline it directly in vioapic_deliver where it's used.

No functional change.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Remove pit_channel0_enabled altogether.
---
 xen/arch/x86/hvm/vioapic.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index b87facb0e0..b00037ea87 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -391,11 +391,6 @@ static void ioapic_inj_irq(
     vlapic_set_irq(target, vector, trig_mode);
 }
 
-static inline int pit_channel0_enabled(void)
-{
-    return pt_active(&current->domain->arch.vpit.pt0);
-}
-
 static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
 {
     uint16_t dest = vioapic->redirtbl[pin].fields.dest_id;
@@ -421,7 +416,7 @@ static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
     {
 #ifdef IRQ0_SPECIAL_ROUTING
         /* Force round-robin to pick VCPU 0 */
-        if ( (irq == hvm_isa_irq_to_gsi(0)) && pit_channel0_enabled() )
+        if ( (irq == hvm_isa_irq_to_gsi(0)) && pt_active(&d->arch.vpit.pt0) )
         {
             v = d->vcpu ? d->vcpu[0] : NULL;
             target = v ? vcpu_vlapic(v) : NULL;
@@ -446,7 +441,7 @@ static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
     {
 #ifdef IRQ0_SPECIAL_ROUTING
         /* Do not deliver timer interrupts to VCPU != 0 */
-        if ( (irq == hvm_isa_irq_to_gsi(0)) && pit_channel0_enabled() )
+        if ( (irq == hvm_isa_irq_to_gsi(0)) && pt_active(&d->arch.vpit.pt0) )
         {
             if ( (v = d->vcpu ? d->vcpu[0] : NULL) != NULL )
                 ioapic_inj_irq(vioapic, vcpu_vlapic(v), vector,
-- 
2.27.0


