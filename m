Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E1B1EF606
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jun 2020 13:03:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jhA7f-0004P9-Rk; Fri, 05 Jun 2020 11:02:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lb65=7S=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jhA7e-0004P4-BR
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 11:02:50 +0000
X-Inumbo-ID: 17bb47d6-a71c-11ea-af9d-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 17bb47d6-a71c-11ea-af9d-12813bfff9fa;
 Fri, 05 Jun 2020 11:02:49 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ocq4NPS5Lxg6hYuvKZHSF2ee9D1Y0mCrj0p2EcWgZT7OsyifM2RmZeaSDSIDnJl3hIS6906KgS
 fc6bYPw005hY9H6LSaGimQKzv0zMWjKbWytSWi2nS43l3B7AYaus+FuUYelcAXuVTexGlVJQRB
 MwlgYeqONzpSXYBo84rEMKZl3BmCyPotSb9b5Wcy6b4BE8fq9m1TQZHefotnzlzlCl9sm6wfRt
 2jwAmdvD4XnF3kCJUU6eHDJHyo6uZLWkjv/eUvpaFQvaXO22qSAxK4ncwsxJJGIarW4FmN35zN
 E50=
X-SBRS: 2.7
X-MesageID: 19313218
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,476,1583211600"; d="scan'208";a="19313218"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH for-4.14 v2] x86/rtc: provide mediated access to RTC for PVH
 dom0
Date: Fri, 5 Jun 2020 13:02:39 +0200
Message-ID: <20200605110240.52545-1-roger.pau@citrix.com>
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
---
for-4.14 reasoning: the fix is mostly isolated to PVH dom0, and as
such the risk is very low of causing issues to other guests types, but
without this fix one vCPU when using a Linux dom0 will be constantly
looping over rtc_timer_do_work with 100% CPU usage, at least when
using Linux 4.19 or newer.
---
Changes since v1:
 - Share the code with PV.
 - Add access checks to the IO ports.
---
 xen/arch/x86/hvm/rtc.c            | 34 ++++++++++++++++++
 xen/arch/x86/pv/emul-priv-op.c    | 28 +++------------
 xen/arch/x86/time.c               | 59 +++++++++++++++++++++++++++++++
 xen/include/asm-x86/mc146818rtc.h |  3 ++
 4 files changed, 100 insertions(+), 24 deletions(-)

diff --git a/xen/arch/x86/hvm/rtc.c b/xen/arch/x86/hvm/rtc.c
index 5bbbdc0e0f..9f304a0fb4 100644
--- a/xen/arch/x86/hvm/rtc.c
+++ b/xen/arch/x86/hvm/rtc.c
@@ -22,6 +22,7 @@
  * IN THE SOFTWARE.
  */
 
+#include <asm/iocap.h>
 #include <asm/mc146818rtc.h>
 #include <asm/hvm/vpt.h>
 #include <asm/hvm/io.h>
@@ -808,10 +809,43 @@ void rtc_reset(struct domain *d)
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
+    if ( !ioports_access_permitted(current->domain, port, port) )
+    {
+        gdprintk(XENLOG_WARNING, "access to RTC port %x not allowed\n", port);
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
 
+    if ( is_hardware_domain(d) )
+    {
+        /* Hardware domain gets mediated access to the physical RTC. */
+        register_portio_handler(d, RTC_PORT(0), 2, hw_rtc_io);
+        return;
+    }
+
     if ( !has_vrtc(d) )
         return;
 
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index fad6c754ad..1597f27ed9 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -280,19 +280,10 @@ static uint32_t guest_io_read(unsigned int port, unsigned int bytes,
         {
             sub_data = pv_pit_handler(port, 0, 0);
         }
-        else if ( port == RTC_PORT(0) )
-        {
-            sub_data = currd->arch.cmos_idx;
-        }
-        else if ( (port == RTC_PORT(1)) &&
+        else if ( (port == RTC_PORT(0) || port == RTC_PORT(1)) &&
                   ioports_access_permitted(currd, RTC_PORT(0), RTC_PORT(1)) )
         {
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
@@ -413,21 +404,10 @@ static void guest_io_write(unsigned int port, unsigned int bytes,
         {
             pv_pit_handler(port, (uint8_t)data, 1);
         }
-        else if ( port == RTC_PORT(0) )
-        {
-            currd->arch.cmos_idx = data;
-        }
-        else if ( (port == RTC_PORT(1)) &&
+        else if ( (port == RTC_PORT(0) || port == RTC_PORT(1)) &&
                   ioports_access_permitted(currd, RTC_PORT(0), RTC_PORT(1)) )
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
index bbaea3aa65..e1c81067ce 100644
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
@@ -1110,6 +1111,64 @@ static unsigned long get_cmos_time(void)
     return mktime(rtc.year, rtc.mon, rtc.day, rtc.hour, rtc.min, rtc.sec);
 }
 
+/* Helpers for guest accesses to the physical RTC. */
+unsigned int rtc_guest_read(unsigned int port)
+{
+    const struct domain *currd = current->domain;
+    unsigned long flags;
+    unsigned int data = ~0;
+
+    ASSERT(port == RTC_PORT(0) || port == RTC_PORT(1));
+    if ( !ioports_access_permitted(currd, port, port) )
+    {
+        ASSERT_UNREACHABLE();
+        return data;
+    }
+
+    switch ( port )
+    {
+    case RTC_PORT(0):
+        data = currd->arch.cmos_idx;
+        break;
+
+    case RTC_PORT(1):
+        spin_lock_irqsave(&rtc_lock, flags);
+        outb(currd->arch.cmos_idx & 0x7f, RTC_PORT(0));
+        data = inb(RTC_PORT(1));
+        spin_unlock_irqrestore(&rtc_lock, flags);
+        break;
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
+    ASSERT(port == RTC_PORT(0) || port == RTC_PORT(1));
+    if ( !ioports_access_permitted(currd, port, port) )
+    {
+        ASSERT_UNREACHABLE();
+        return;
+    }
+
+    switch ( port )
+    {
+    case RTC_PORT(0):
+        currd->arch.cmos_idx = data;
+        break;
+
+    case RTC_PORT(1):
+        spin_lock_irqsave(&rtc_lock, flags);
+        outb(currd->arch.cmos_idx & 0x7f, RTC_PORT(0));
+        outb(data, RTC_PORT(1));
+        spin_unlock_irqrestore(&rtc_lock, flags);
+        break;
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


