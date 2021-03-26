Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E5534AEDF
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 20:00:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.102055.195503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPrgq-0007Vm-3v; Fri, 26 Mar 2021 19:00:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 102055.195503; Fri, 26 Mar 2021 19:00:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPrgq-0007VF-0Z; Fri, 26 Mar 2021 19:00:12 +0000
Received: by outflank-mailman (input) for mailman id 102055;
 Fri, 26 Mar 2021 19:00:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MLVS=IY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lPrgo-0007Ut-NB
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 19:00:10 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 36518861-707e-490e-81d4-4a6817d0faed;
 Fri, 26 Mar 2021 19:00:08 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 36518861-707e-490e-81d4-4a6817d0faed
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616785208;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hoKdN8csoqaelamoWrWzTqNBSKLs0axyRHUC7J8rEEM=;
  b=gx1r9eI73xNbKuUiua2I/lygw/wRiyTVDbC+8peT8iR7g3rzW4LAQYMm
   CUBVwtkvakv0/XhDtupEEExCVj+6UpV1s6+0jAeQ6eobtALPIYtPfmkLD
   D2xuxWWNllX6/vgbVasPvR6VQvf/ZOxGc6NpvQrErMZw9RLMQVJY5L0EH
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: zsK55gemVstwCTyRH4LtBkpgWq9VD3bgys0Wg2m345eRf9KH+ZOWQsUCzxvlpCQPx6z3eNtMRS
 u7T24eJQzpBkY42Covx4PExdpw+9NwYbNoO3rWzSrUz2fLYS34+n3g+RP1buqJZ2qv6JwcZFV+
 OGmCxPiGC2QaT/ExROJqUGkf/3X2ot9zS1Tmx16i7HVpZnoZ6Jk/s+QcsQuUbrINkchvV0OiF9
 2Y4CC/qWPy8FFXWPLGlPUDj0y2NavoMscCXumMKBsxmFQ+BMSmGmjfTyZZvyHXxa9XsbhybYdw
 nhA=
X-SBRS: 4.0
X-MesageID: 40605106
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:m83dP606WrBnf0xHY/R78gqjBal2eYIsi2QD101hICF9Wvez0+
 izgfUW0gL1gj4NWHcm3euNIrWEXGm0z/FIyKErF/OHUBP9sGWlaLtj44zr3iH6F0TFmtJ1/Z
 xLN5JzANiYNzVHpO7x6gWgDpIEyN6I7KiniY7lvg1QZCthApsQtTtRIACdD0FwWU1iDZ02CJ
 KT6qN81kedUF4Qadm2AWRAYvjbq7Tw5d7bSDMlJzpi0gmBiju09KX3eiL34j4yWy5CqI1Sl1
 TtvBf+4syYwpKG4z/ak1Te9pFH3Obmo+Ezf/CkrugwBnHShh2zZIJnMofy8wwdhO208l4lnJ
 3tjn4bTr1OwkjcdG20vhfhsjOIuF1Fih/f4GSVjnf5rcvySChSMbs4uatibhDb50A81esMtZ
 5j4mODu5JbSTPGkSjtjuK4MC1Cq0uurXIu1dMUlnxUOLFuDIN5kIp3xjI2LL4wWAbBrKw3Gu
 hnC8/RoNxMd0mBUnzftm5zhPSxQ3UaBH69Mwk/k/3Q9wITsGFyzkMeysBatGwH7ogBR55N4P
 mBGrh0lYtJUtQdYctGdac8aPryLlaIbQPHMWqUL1iiProAIWjxp5n+56hww+22ZpoSzt8XlI
 7aWF1V8U4+EnieSvGm7dluyFTgUW+9VTPixoV1/J5ioIDxQ7LtLGmNU1Yrn8y8o+gOA8HSVv
 qpUagmRsPLHC/LI8Jkzgf+U55dJT01S8sOoOs2XFqIv4bKJ+TRx6jmWceWAICoPScvW2v5DH
 dGdiP0Pt984keiXWK9hBDQXnjqa1Hu5J4YKtmcw8EjjKw2cqFcuAkcjlq0ouuRLydZj6AwdE
 xiZLX9kq26omGy9X3S73pgPwdcCko92sSjb1p64Ssxd2/ke7cKvNuSPUpI2mGcGxN5R8TKVB
 JEq09v4qKxJZyIzSUkA9aqW1jqyUc7lTavddMxi6eD7cDqdtcEFZ4gQrV2DhiOPQdygxxWpG
 BKbxIkSkfTGij1s7isiIUZCYjkBoBBqTbuBfQRiHrE8W2AuMkkRxIgLkKTeP/SpTxreh15qR
 la9bQFjL+JhDC1QFFP/9gQARlrc2SYALVPEQKfQp5b84qbNj1YfCO0vBjfpzYYPlHH2WU3qg
 XaXHGpUMCOPWN4/l5i9JrStHNYH1/tIn5YWzREiKk4NEL9hx9IoLS2T5v27FK0Lns5hsAsGw
 rkTFIpU1xT7uHy6yew3BK5OzEH6/wVT7TgJbw+brDe3W6sIoWUlacAW+RZ5ophKcqGiJ50bc
 uFfROJIC7/YtlZrzC9tzIrPjJ5p2Ijlu6t0Br57HKg1Hp6GvbKJk96LotraO20/izhR/yS1o
 9+gs9wteysMn/pYtru89CfUxdTbhfSq3WxVecmtNRdur8zrqJ6G93eXSHT3H9KmBU4I8Gcrj
 JXfI1rpLTAMJRoZcocZmZQ+Ucojs2GKA8zqRPta9VOCG0FnjveJZeE8rDIob0gDgmIoxbxI0
 CW92lY8+3eVyWO2LYGA8sLUC5rQVl57G4n8PKJdoXWBgnvbe1F8VagOnK2cbNWSsG+aMMthw
 c/58vNk/6cdiL+1gyVoCByJbhW9X27Bcy1GwCBFIdzgpGHEEXJhrHv5sG9jD36E2TmL0sZgJ
 BIbkwWYIBIjCI4gIg+zyi1Tej2ryse4ihjyCAikkSo3I6spHrfFwVBNwbSh51NRzldMnSSl6
 3+gJ+l/WW45CIAwIXJEUdbY8pHFNcRRJXmNisGE7lhgJe4u640xjlZaBggD2QgmCnw0uNv07
 C+wujTUYTZeAXVEENE/yVECI5yljEqrm8Fc9HW1+PNXjkq
X-IronPort-AV: E=Sophos;i="5.81,281,1610427600"; 
   d="scan'208";a="40605106"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Pierret?=
	<frederic.pierret@qubes-os.org>
Subject: [PATCH v2 3/3] x86/hpet: Restore old configuration if Legacy Replacement mode doesn't help
Date: Fri, 26 Mar 2021 18:59:47 +0000
Message-ID: <20210326185947.23243-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210326185947.23243-1-andrew.cooper3@citrix.com>
References: <20210326185947.23243-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

If Legacy Replacement mode doesn't help in check_timer(), restore the old
configuration before falling back to other workarounds.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Ian Jackson <iwj@xenproject.org>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Frédéric Pierret <frederic.pierret@qubes-os.org>

v2:
 * New.

For 4.15: Attempt to unbreak AMD Ryzen 1800X systems.

I'm tempted to fold this into the previous patch, but its presented here in
isolation for ease of review.

Tested by repositioning the timer_irq_works() calls on a system with a working
PIT.

(XEN) ENABLING IO-APIC IRQs
(XEN)  -> Using old ACK method
(XEN) ..TIMER: vector=0xF0 apic1=0 pin1=2 apic2=0 pin2=0
(XEN) ..no 8254 timer found - trying HPET Legacy Replacement Mode
(XEN) ..no HPET timer found - reverting Legacy Replacement Mode
(XEN) TSC deadline timer enabled
---
 xen/arch/x86/hpet.c        | 27 ++++++++++++++++++++++++++-
 xen/arch/x86/io_apic.c     |  4 ++++
 xen/include/asm-x86/hpet.h |  6 ++++++
 3 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hpet.c b/xen/arch/x86/hpet.c
index bfa75f135a..afe104dc93 100644
--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -783,6 +783,9 @@ int hpet_legacy_irq_tick(void)
 
 static u32 *hpet_boot_cfg;
 static uint64_t __initdata hpet_rate;
+static __initdata struct {
+    uint32_t cmp, cfg;
+} pre_legacy_c0;
 
 bool __init hpet_enable_legacy_replacement_mode(void)
 {
@@ -796,8 +799,11 @@ bool __init hpet_enable_legacy_replacement_mode(void)
     /* Stop the main counter. */
     hpet_write32(cfg & ~HPET_CFG_ENABLE, HPET_CFG);
 
+    /* Stash channel 0's old CFG/CMP incase we need to undo. */
+    pre_legacy_c0.cfg = c0_cfg = hpet_read32(HPET_Tn_CFG(0));
+    pre_legacy_c0.cmp = hpet_read32(HPET_Tn_CMP(0));
+
     /* Reconfigure channel 0 to be 32bit periodic. */
-    c0_cfg = hpet_read32(HPET_Tn_CFG(0));
     c0_cfg |= (HPET_TN_ENABLE | HPET_TN_PERIODIC | HPET_TN_SETVAL |
                HPET_TN_32BIT);
     hpet_write32(c0_cfg, HPET_Tn_CFG(0));
@@ -843,6 +849,25 @@ bool __init hpet_enable_legacy_replacement_mode(void)
     return true;
 }
 
+void __init hpet_disable_legacy_replacement_mode(void)
+{
+    unsigned int cfg = hpet_read32(HPET_CFG);
+
+    ASSERT(hpet_rate);
+
+    cfg &= ~(HPET_CFG_LEGACY | HPET_CFG_ENABLE);
+
+    /* Stop the main counter and disable legacy mode. */
+    hpet_write32(cfg, HPET_CFG);
+
+    /* Restore pre-Legacy Replacement Mode settings. */
+    hpet_write32(pre_legacy_c0.cfg, HPET_Tn_CFG(0));
+    hpet_write32(pre_legacy_c0.cmp, HPET_Tn_CMP(0));
+
+    /* Restart the main counter. */
+    hpet_write32(cfg | HPET_CFG_ENABLE, HPET_CFG);
+}
+
 u64 __init hpet_setup(void)
 {
     unsigned int hpet_id, hpet_period;
diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index 3f131a81fb..58b26d962c 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -1955,6 +1955,10 @@ static void __init check_timer(void)
                 local_irq_restore(flags);
                 return;
             }
+
+            /* Legacy Replacement mode hasn't helped.  Undo it. */
+            printk(XENLOG_ERR "..no HPET timer found - reverting Legacy Replacement Mode\n");
+            hpet_disable_legacy_replacement_mode();
         }
 
         clear_IO_APIC_pin(apic1, pin1);
diff --git a/xen/include/asm-x86/hpet.h b/xen/include/asm-x86/hpet.h
index 07bc8d6079..8f9725a95e 100644
--- a/xen/include/asm-x86/hpet.h
+++ b/xen/include/asm-x86/hpet.h
@@ -80,6 +80,12 @@ int hpet_legacy_irq_tick(void);
 bool hpet_enable_legacy_replacement_mode(void);
 
 /*
+ * Undo the effects of hpet_disable_legacy_replacement_mode().  Must not be
+ * called unless enable() returned true.
+ */
+void hpet_disable_legacy_replacement_mode(void);
+
+/*
  * Temporarily use an HPET event counter for timer interrupt handling,
  * rather than using the LAPIC timer. Used for Cx state entry.
  */
-- 
2.11.0


