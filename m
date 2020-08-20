Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4D524C24B
	for <lists+xen-devel@lfdr.de>; Thu, 20 Aug 2020 17:35:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8mam-00074E-D0; Thu, 20 Aug 2020 15:35:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=00F7=B6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k8mal-00073R-OE
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 15:35:03 +0000
X-Inumbo-ID: 9b8898ea-4825-4517-87bf-4b598b951f64
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9b8898ea-4825-4517-87bf-4b598b951f64;
 Thu, 20 Aug 2020 15:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597937701;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U6WGOnqz3Y31PJ1a+CdQ2M/flpyDjWIVzqWxfWUCibg=;
 b=THk88iUNW9kSns3UdYpM6Iz1NlLvSBA7PSjC1UGR5ADFWKtrsFMB7GIN
 Qp2hpsTEO+oZNAYZ1fP7HkYP/A625vpZC+7R4TP7gs61IeqEHt9reUo1d
 xepZbxzYcv/2FLEyPOMmWnvL01z0ak4w8btlDwvct2NuCkeQJ1f+KGU2r 8=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: xsKwCJi0O0w1LKtGM6gY/azk4WpIgM5Q/e4prcz7IUT7v46inmjKq/CSHYnO5w64i4B/hyIQPZ
 G2P7mmK0XZ4q+ha/oxUmYylbQUQqVXJwQcwmhviLeU7/TOH19lvCXfxMKKKtkL8Fwqym6oyyvP
 5lceyWawwnnoCTEpBFezApExCfFcpxa2aXEaMIkQdMB2M2PKk/J66TEBcZWziXd3sDeLJOP34W
 P9CbHG1A3zhVMocpztf8Ex6jCP79qzCF81FUrbF8fBv6aqrYZaq4ChHDgepAYdTGIOvk952mAf
 J+E=
X-SBRS: 2.7
X-MesageID: 25294991
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,333,1592884800"; d="scan'208";a="25294991"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 1/2] x86/vpic: rename irq to pin in vpic_ioport_write
Date: Thu, 20 Aug 2020 17:34:41 +0200
Message-ID: <20200820153442.28305-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200820153442.28305-1-roger.pau@citrix.com>
References: <20200820153442.28305-1-roger.pau@citrix.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The irq variable is wrongly named, as it's used to store the pin on
the 8259 chip, but not the global irq value. While renaming reduce
it's scope and make it unsigned.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/vpic.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/hvm/vpic.c b/xen/arch/x86/hvm/vpic.c
index 936c7b27c6..feb1db2ee3 100644
--- a/xen/arch/x86/hvm/vpic.c
+++ b/xen/arch/x86/hvm/vpic.c
@@ -184,7 +184,7 @@ static int vpic_intack(struct hvm_hw_vpic *vpic)
 static void vpic_ioport_write(
     struct hvm_hw_vpic *vpic, uint32_t addr, uint32_t val)
 {
-    int priority, cmd, irq;
+    int priority, cmd;
     uint8_t mask, unmasked = 0;
 
     vpic_lock(vpic);
@@ -230,6 +230,8 @@ static void vpic_ioport_write(
         }
         else
         {
+            unsigned int pin;
+
             /* OCW2 */
             cmd = val >> 5;
             switch ( cmd )
@@ -246,22 +248,22 @@ static void vpic_ioport_write(
                 priority = vpic_get_priority(vpic, mask);
                 if ( priority == VPIC_PRIO_NONE )
                     break;
-                irq = (priority + vpic->priority_add) & 7;
-                vpic->isr &= ~(1 << irq);
+                pin = (priority + vpic->priority_add) & 7;
+                vpic->isr &= ~(1 << pin);
                 if ( cmd == 5 )
-                    vpic->priority_add = (irq + 1) & 7;
+                    vpic->priority_add = (pin + 1) & 7;
                 break;
             case 3: /* Specific EOI                */
             case 7: /* Specific EOI & Rotate       */
-                irq = val & 7;
-                vpic->isr &= ~(1 << irq);
+                pin = val & 7;
+                vpic->isr &= ~(1 << pin);
                 if ( cmd == 7 )
-                    vpic->priority_add = (irq + 1) & 7;
+                    vpic->priority_add = (pin + 1) & 7;
                 /* Release lock and EOI the physical interrupt (if any). */
                 vpic_update_int_output(vpic);
                 vpic_unlock(vpic);
                 hvm_dpci_eoi(current->domain,
-                             hvm_isa_irq_to_gsi((addr >> 7) ? (irq|8) : irq),
+                             hvm_isa_irq_to_gsi((addr >> 7) ? (pin | 8) : pin),
                              NULL);
                 return; /* bail immediately */
             case 6: /* Set Priority                */
-- 
2.28.0


