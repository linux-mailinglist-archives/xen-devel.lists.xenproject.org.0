Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9D21EF272
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jun 2020 09:50:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jh77N-00011K-6L; Fri, 05 Jun 2020 07:50:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lb65=7S=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jh77L-00011F-U7
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 07:50:19 +0000
X-Inumbo-ID: 333bf8ae-a701-11ea-9947-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 333bf8ae-a701-11ea-9947-bc764e2007e4;
 Fri, 05 Jun 2020 07:50:18 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: UfAALRlWE6qiXUKQ5xipb/JQm0FMueBWje/OyMcykw03jdL2F2idFe4vUdael29xJf9Vyr7k+H
 lmM3UupEoir8p1ECyAb6y1PN69hiI8soAIx4AqSdkBHz+E4taCqw+yZdieHY4g28bCYp3wFVAX
 R1iC1mHd7ZLoUWTUJiWiCyxSvPVMEamSh1ZYmhUKRl+StjY4wyfI93DM2nRowGpYHXC5v8k1w7
 Z+ywdco4eJ+pd6Hkahn5p1FtQ6STwgVDcfrQzRDdjqMaJBEYVBonj70/bg1BhwHlguZQo8srOk
 UN8=
X-SBRS: 2.7
X-MesageID: 19550453
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,475,1583211600"; d="scan'208";a="19550453"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH for-4.14] x86/rtc: provide mediated access to RTC for PVH dom0
Date: Fri, 5 Jun 2020 09:50:06 +0200
Message-ID: <20200605075006.51238-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.2
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

At some point (maybe PVHv1?) mediated access to the RTC was provided
for PVH dom0 using the PV code paths (guest_io_{write/read}). At some
point this code has been made PV specific and unhooked from the
current PVH IO path. This patch provides such mediated access to the
RTC for PVH dom0, just like it's provided for a classic PV dom0.

Instead of re-using the PV paths implement such handler together with
the vRTC code for HVM, so that calling rtc_init will setup the
appropriate handlers for all HVM based guests.

Without this a Linux PVH dom0 will read garbage when trying to access
the RTC, and one vCPU will be constantly looping in
rtc_timer_do_work.

Note that such issue doesn't happen on domUs because the ACPI
NO_CMOS_RTC flag is set in FADT, which prevents the OS from accessing
the RTC.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
for-4.14 reasoning: the fix is completely isolated to PVH dom0, and as
such the risk is very low of causing issues to other guests types, but
without this fix one vCPU when using a Linux dom0 will be constantly
looping over rtc_timer_do_work with 100% CPU usage, at least when
using Linux 4.19 or newer.
---
 xen/arch/x86/hvm/rtc.c | 69 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/xen/arch/x86/hvm/rtc.c b/xen/arch/x86/hvm/rtc.c
index 5bbbdc0e0f..5d637cf018 100644
--- a/xen/arch/x86/hvm/rtc.c
+++ b/xen/arch/x86/hvm/rtc.c
@@ -808,10 +808,79 @@ void rtc_reset(struct domain *d)
     s->pt.source = PTSRC_isa;
 }
 
+/* RTC mediator for HVM hardware domain. */
+static unsigned int hw_read(unsigned int port)
+{
+    const struct domain *currd = current->domain;
+    unsigned long flags;
+    unsigned int data = 0;
+
+    switch ( port )
+    {
+    case RTC_PORT(0):
+          data = currd->arch.cmos_idx;
+          break;
+
+    case RTC_PORT(1):
+          spin_lock_irqsave(&rtc_lock, flags);
+          outb(currd->arch.cmos_idx & 0x7f, RTC_PORT(0));
+          data = inb(RTC_PORT(1));
+          spin_unlock_irqrestore(&rtc_lock, flags);
+          break;
+    }
+
+    return data;
+}
+
+static void hw_write(unsigned int port, unsigned int data)
+{
+    struct domain *currd = current->domain;
+    unsigned long flags;
+
+    switch ( port )
+    {
+    case RTC_PORT(0):
+          currd->arch.cmos_idx = data;
+          break;
+
+    case RTC_PORT(1):
+          spin_lock_irqsave(&rtc_lock, flags);
+          outb(currd->arch.cmos_idx & 0x7f, RTC_PORT(0));
+          outb(data, RTC_PORT(1));
+          spin_unlock_irqrestore(&rtc_lock, flags);
+          break;
+    }
+}
+
+static int hw_rtc_io(int dir, unsigned int port, unsigned int size,
+                     uint32_t *val)
+{
+    if ( size != 1 )
+    {
+        gdprintk(XENLOG_WARNING, "bad RTC access size (%u)\n", size);
+        *val = ~0;
+        return X86EMUL_OKAY;
+    }
+
+    if ( dir == IOREQ_WRITE )
+        hw_write(port, *val);
+    else
+        *val = hw_read(port);
+
+    return X86EMUL_OKAY;
+}
+
 void rtc_init(struct domain *d)
 {
     RTCState *s = domain_vrtc(d);
 
+    if ( is_hardware_domain(d) )
+    {
+        /* Hardware domain gets mediated access to the physical RTC. */
+        register_portio_handler(d, RTC_PORT(0), 2, hw_rtc_io);
+        return;
+    }
+
     if ( !has_vrtc(d) )
         return;
 
-- 
2.26.2


