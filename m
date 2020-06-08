Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 645B51F1D03
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 18:14:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiKPX-00080T-MG; Mon, 08 Jun 2020 16:14:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QWP5=7V=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jiKPW-00080L-P7
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 16:14:06 +0000
X-Inumbo-ID: 12b2e27e-a9a3-11ea-b293-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 12b2e27e-a9a3-11ea-b293-12813bfff9fa;
 Mon, 08 Jun 2020 16:14:05 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 7RJZYeNK3E7v8cgWj9UwSIhBiCpyfVJYagWfsNQzYZKIU5mHyqkyuZZab33ciGw/GqMoN7HLyL
 Q1IwWkC9wtOZRw+uISjRjL8pFxr5RJOmWO+yX5jykJSRQS9oxC4GRLbL9tR5IPQk8xIYt47cNL
 Xoj1JdK7N8PCX79MMyp1dyNnekxDjyoEG/V4cof9B0qD8zo40MEeZLdsWroWasIbXmp0tjG/6s
 Yp4YHdbtRZsWgsAWyrgC9LFFgRyA15Rq07pippg1t7M0hH6KGSm2mGSSnsnzwq6Mhfz8T6Pqtm
 nCw=
X-SBRS: 2.7
X-MesageID: 19789728
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,487,1583211600"; d="scan'208";a="19789728"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH for-4.14 v4] x86/rtc: provide mediated access to RTC for PVH
 dom0
Date: Mon, 8 Jun 2020 18:13:53 +0200
Message-ID: <20200608161353.2654-1-roger.pau@citrix.com>
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

Mediated access to the RTC was provided for PVHv1 dom0 using the PV
code paths (guest_io_{write/read}), but those accesses where never
implemented for PVHv2 dom0. This patch provides such mediated accesses
to the RTC for PVH dom0, just like it's provided for a classic PV
dom0.

Pull out some of the RTC logic from guest_io_{read/write} into
specific helpers that can be used by both PV and HVM guests. The
setup of the handlers for PVH is done in rtc_init, which is already
used to initialize the fully emulated RTC.

Without this a Linux PVH dom0 will read garbage when trying to access
the RTC, and one vCPU will be constantly looping in
rtc_timer_do_work.

Note that such issue doesn't happen on domUs because the ACPI
NO_CMOS_RTC flag is set in FADT, which prevents the OS from accessing
the RTC. Also the X86_EMU_RTC flag is not set for PVH dom0, as the
accesses are not emulated but rather forwarded to the physical
hardware.

No functional change expected for classic PV dom0.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
for-4.14 reasoning: the fix is mostly isolated to PVH dom0, and as
such the risk is very low of causing issues to other guests types, but
without this fix one vCPU when using a Linux dom0 will be constantly
looping over rtc_timer_do_work with 100% CPU usage, at least when
using Linux 4.19 or newer.
---
Changes since v3:
 - Reword comment.
 - Add missing newline after break.
 - Remove extra parentheses in the RTC ports check in
   guest_io_{read/write}.

Changes since v2:
 - Move the access check into the read/write handler.
 - Allow access to the latched first RTC port by all PV guests.
 - Register the handlers for HVM native accesses if vRTC is disabled.

Changes since v1:
 - Share the code with PV.
 - Add access checks to the IO ports.
---
 xen/arch/x86/hvm/rtc.c            | 26 +++++++++++++
 xen/arch/x86/pv/emul-priv-op.c    | 30 ++------------
 xen/arch/x86/time.c               | 65 +++++++++++++++++++++++++++++++
 xen/include/asm-x86/mc146818rtc.h |  3 ++
 4 files changed, 98 insertions(+), 26 deletions(-)

diff --git a/xen/arch/x86/hvm/rtc.c b/xen/arch/x86/hvm/rtc.c
index 5bbbdc0e0f..3150f5f147 100644
--- a/xen/arch/x86/hvm/rtc.c
+++ b/xen/arch/x86/hvm/rtc.c
@@ -808,12 +808,38 @@ void rtc_reset(struct domain *d)
     s->pt.source = PTSRC_isa;
 }
 
+/* RTC mediator for HVM hardware domain. */
+static int hw_rtc_io(int dir, unsigned int port, unsigned int size,
+                     uint32_t *val)
+{
+    if ( dir == IOREQ_READ )
+        *val = ~0;
+
+    if ( size != 1 )
+    {
+        gdprintk(XENLOG_WARNING, "bad RTC access size (%u)\n", size);
+        return X86EMUL_OKAY;
+    }
+
+    if ( dir == IOREQ_WRITE )
+        rtc_guest_write(port, *val);
+    else
+        *val = rtc_guest_read(port);
+
+    return X86EMUL_OKAY;
+}
+
 void rtc_init(struct domain *d)
 {
     RTCState *s = domain_vrtc(d);
 
     if ( !has_vrtc(d) )
+    {
+        if ( is_hardware_domain(d) )
+            /* Hardware domain gets mediated access to the physical RTC. */
+            register_portio_handler(d, RTC_PORT(0), 2, hw_rtc_io);
         return;
+    }
 
     spin_lock_init(&s->lock);
 
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index fad6c754ad..254da2b849 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -280,19 +280,9 @@ static uint32_t guest_io_read(unsigned int port, unsigned int bytes,
         {
             sub_data = pv_pit_handler(port, 0, 0);
         }
-        else if ( port == RTC_PORT(0) )
+        else if ( port == RTC_PORT(0) || port == RTC_PORT(1) )
         {
-            sub_data = currd->arch.cmos_idx;
-        }
-        else if ( (port == RTC_PORT(1)) &&
-                  ioports_access_permitted(currd, RTC_PORT(0), RTC_PORT(1)) )
-        {
-            unsigned long flags;
-
-            spin_lock_irqsave(&rtc_lock, flags);
-            outb(currd->arch.cmos_idx & 0x7f, RTC_PORT(0));
-            sub_data = inb(RTC_PORT(1));
-            spin_unlock_irqrestore(&rtc_lock, flags);
+            sub_data = rtc_guest_read(port);
         }
         else if ( (port == 0xcf8) && (bytes == 4) )
         {
@@ -413,21 +403,9 @@ static void guest_io_write(unsigned int port, unsigned int bytes,
         {
             pv_pit_handler(port, (uint8_t)data, 1);
         }
-        else if ( port == RTC_PORT(0) )
-        {
-            currd->arch.cmos_idx = data;
-        }
-        else if ( (port == RTC_PORT(1)) &&
-                  ioports_access_permitted(currd, RTC_PORT(0), RTC_PORT(1)) )
+        else if ( port == RTC_PORT(0) || port == RTC_PORT(1) )
         {
-            unsigned long flags;
-
-            if ( pv_rtc_handler )
-                pv_rtc_handler(currd->arch.cmos_idx & 0x7f, data);
-            spin_lock_irqsave(&rtc_lock, flags);
-            outb(currd->arch.cmos_idx & 0x7f, RTC_PORT(0));
-            outb(data, RTC_PORT(1));
-            spin_unlock_irqrestore(&rtc_lock, flags);
+            rtc_guest_write(port, data);
         }
         else if ( (port == 0xcf8) && (bytes == 4) )
         {
diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index bbaea3aa65..d643590c0a 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -27,6 +27,7 @@
 #include <xen/keyhandler.h>
 #include <xen/guest_access.h>
 #include <asm/io.h>
+#include <asm/iocap.h>
 #include <asm/msr.h>
 #include <asm/mpspec.h>
 #include <asm/processor.h>
@@ -1110,6 +1111,70 @@ static unsigned long get_cmos_time(void)
     return mktime(rtc.year, rtc.mon, rtc.day, rtc.hour, rtc.min, rtc.sec);
 }
 
+/* Helpers for guest accesses to the physical RTC. */
+unsigned int rtc_guest_read(unsigned int port)
+{
+    const struct domain *currd = current->domain;
+    unsigned long flags;
+    unsigned int data = ~0;
+
+    switch ( port )
+    {
+    case RTC_PORT(0):
+        /*
+         * All PV domains (and PVH dom0) are allowed to read the latched value
+         * of the first RTC port, as there's no access to the physical IO
+         * ports.
+         */
+        data = currd->arch.cmos_idx;
+        break;
+
+    case RTC_PORT(1):
+        if ( !ioports_access_permitted(currd, RTC_PORT(0), RTC_PORT(1)) )
+            break;
+        spin_lock_irqsave(&rtc_lock, flags);
+        outb(currd->arch.cmos_idx & 0x7f, RTC_PORT(0));
+        data = inb(RTC_PORT(1));
+        spin_unlock_irqrestore(&rtc_lock, flags);
+        break;
+
+    default:
+        ASSERT_UNREACHABLE();
+    }
+
+    return data;
+}
+
+void rtc_guest_write(unsigned int port, unsigned int data)
+{
+    struct domain *currd = current->domain;
+    unsigned long flags;
+
+    switch ( port )
+    {
+    case RTC_PORT(0):
+        /*
+         * All PV domains (and PVH dom0) are allowed to write to the latched
+         * value of the first RTC port, as there's no access to the physical IO
+         * ports.
+         */
+        currd->arch.cmos_idx = data;
+        break;
+
+    case RTC_PORT(1):
+        if ( !ioports_access_permitted(currd, RTC_PORT(0), RTC_PORT(1)) )
+            break;
+        spin_lock_irqsave(&rtc_lock, flags);
+        outb(currd->arch.cmos_idx & 0x7f, RTC_PORT(0));
+        outb(data, RTC_PORT(1));
+        spin_unlock_irqrestore(&rtc_lock, flags);
+        break;
+
+    default:
+        ASSERT_UNREACHABLE();
+    }
+}
+
 static unsigned long get_wallclock_time(void)
 {
 #ifdef CONFIG_XEN_GUEST
diff --git a/xen/include/asm-x86/mc146818rtc.h b/xen/include/asm-x86/mc146818rtc.h
index 8758528f7c..803b236c0a 100644
--- a/xen/include/asm-x86/mc146818rtc.h
+++ b/xen/include/asm-x86/mc146818rtc.h
@@ -110,4 +110,7 @@ outb_p((val),RTC_PORT(1)); \
 
 #define RTC_IRQ 8
 
+unsigned int rtc_guest_read(unsigned int port);
+void rtc_guest_write(unsigned int port, unsigned int data);
+
 #endif /* _ASM_MC146818RTC_H */
-- 
2.26.2


