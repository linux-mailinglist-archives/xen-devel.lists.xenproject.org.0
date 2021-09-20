Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91496411E10
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 19:25:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191049.340933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSN35-0004Xy-4B; Mon, 20 Sep 2021 17:25:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191049.340933; Mon, 20 Sep 2021 17:25:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSN34-0004V7-VR; Mon, 20 Sep 2021 17:25:46 +0000
Received: by outflank-mailman (input) for mailman id 191049;
 Mon, 20 Sep 2021 17:25:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F8X/=OK=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mSN33-0003cq-CU
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 17:25:45 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c5b8efe2-1a37-11ec-b87a-12813bfff9fa;
 Mon, 20 Sep 2021 17:25:39 +0000 (UTC)
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
X-Inumbo-ID: c5b8efe2-1a37-11ec-b87a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632158739;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZTBK/i8V2Aw3dyyoK4GveFgWRMnudCEdHrs7LHz7jJM=;
  b=ffYKYLXmdMK4xnNfiLN16nCAdivYhR1M2GMqA92dDa4xyr1Eftfc+gMz
   j6xK8dGyzxoFh0ePGYQPKV4w4MEE3zzU/zR7MPCVepPIpBm/++bYHYwmF
   AQVGQzX9CZNBoKSqrOGVarnblQKtMxzObKf+L3XLF5iEE5XVsfm4iAm2g
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: mo97rJIQ3QkUuROXYXDlf11JLR7AbsVApbznlGFG92hVQq+caeExaYNCld71797jQ2A0Hiw0nW
 DppHwsPdEVUzc3IQuxza5RGnaSDXsUO6nRDCg0PRHvVSFb4Nq9PsbwYgRc5PGAg3UoecSBZlCa
 LgP8AY4AhT5k3f5Td9/U2HDgQShZrk8pEmiGHDMYOBmpVhEf6Bi9Z1MysOWy5oGTjuTaVyTM4Y
 cpBQFIrj1e7A3c8YMzQhmTpWXkHxo9+SxwSXlCLnv3yCLg7uZYMVoEXp14UQFi60F2RatjJq9W
 6A3mSP5+Z8grvzpafuVHJdtY
X-SBRS: 5.1
X-MesageID: 53560992
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:6NOjcatpx8vlFxNX/Ky1EVYXAefnVE5ZMUV32f8akzHdYApBsoF/q
 tZmKT/TOa6IM2GnfIt0bNvioRhSvJ7XnIRiTgpvqy89EX8T+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHpJZS5LwbZj29Y524DhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NpltZi0YiYlOff2qMMAcEQCPw1BZr945+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6DP
 JdHMWs+NnwsZTUQAmY1DLgxs9ySn1b1bSVbg32onKgOtj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKjMwOcGbyDGF2mmxneKJliT+MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO+0+7Cqsxq2O2Ta+G0tZFBJtV4c0itBjEFTGy
 WS1c8PV6S1H6ePOECLGp+bM91teKgBOcjRTPnZsoR8tpoC5+dBt1EqnosNLTfbt5uAZDw0c1
 NxjQMIWvLwVkcdD/KGy51mvb9mE98WRE1JdCuk6WAuYAuJFiGyNPNfABbvzt68owGOlor6p5
 iNspiRmxLpSZaxhbQTUKAn3IF1M2xpiGGaG6WOD4rF7r2j9k5JdVdkIvVmS23uFwu5bIGS0M
 Sc/SCt65YNJPWvCUEOES9vqUKwXIVzbPY29DJj8N4MWCrAoLVPv1Hw+NCa4gjG2+GBxwP5XB
 HtuWZv1ZZrsIf88l2TeqiZ0+eJD+x3SMkuJFMinkEz4geTBDJNXIJ9cWGazgikCxPvsiG3oH
 xx3bqNmEj1TD7/zZDf564kWIQxYJHQ3H8mu+cdWavSCMkxtH2R4U63dxrYoeopEmaVJl7iXo
 iHhCxEAkFev12faLQiqa2x4bO+9V5hIsn9mbzcnOkyl2iZ/bN/3vrsfbZY+YZIu6PdnkaxvV
 /AAdsjZWqZPRz3L9i4zd574qIA+Jh2niRjXZ3iuYSQlfo4mTAvMo4e2cgzq/SgILyy2qcph/
 OHwilKFGcIOHl0wAtzXZfSjy0KKkUIcwO8iDVHVJtRzeVn39NQ4ISLGkfJqcdoHLg/Ox2XG2
 l/OUwsYv+TEv6Q87MLN2fKft46sHuZzQhhaEm3c4erkPCXW5DP+k4pJUeLOdjHBTmLkvq6lY
 LwNnf37NfQGmndMspZ9TOk3nf5vuYO3qu8I1BlgEVXKc0+vW+FpLXSx1MVSsrFAm+1CsgysV
 0PTotRXNN1l4i8+/IL98Ob9Utm+6A==
IronPort-HdrOrdr: A9a23:pGiDi6kiQF6IEeU6vajOw+xg70npDfLc3DAbv31ZSRFFG/Fw9/
 rCoB17726StN91YhsdcL+7V5VoLUmzyXcx2/hzAV7AZniDhILLFuFfBOLZqlWNJ8S9zJ8+6U
 4JScND4bbLfD1HZKjBgTVRE7wbsaW6GKLDv5ag85+6JzsaFZ2J7G1Ce3em+lUdfnghOXKgfq
 DsnPauoVCbCA0qR/X+PFYpdc7ZqebGkZr3CCR2eiLOuGG1/EuVAKeRKWni4isj
X-IronPort-AV: E=Sophos;i="5.85,308,1624334400"; 
   d="scan'208";a="53560992"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 05/12] x86/hvm: Remove duplicate calls caused by tracing
Date: Mon, 20 Sep 2021 18:25:22 +0100
Message-ID: <20210920172529.24932-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210920172529.24932-1-andrew.cooper3@citrix.com>
References: <20210920172529.24932-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

1) vpic_ack_pending_irq() calls vlapic_accept_pic_intr() twice, once in the
   TRACE_2D() instantiation and once "for real".  Make the call only once.

2) vlapic_accept_pic_intr() similarly calls __vlapic_accept_pic_intr() twice,
   although this is more complicated to disentangle.

   v cannot be NULL because it has already been dereferenced in the function,
   causing the ternary expression to always call __vlapic_accept_pic_intr().
   However, the return expression of the function takes care to skip the call
   if this vCPU isn't the PIC target.  As __vlapic_accept_pic_intr() is far
   from trivial, make the TRACE_2D() semantics match the return semantics by
   only calling __vlapic_accept_pic_intr() when the vCPU is the PIC target.

3) hpet_set_timer() duplicates calls to hpet_tick_to_ns().  Pull the logic out
   which simplifies both the TRACE and create_periodic_time() calls.

4) lapic_rearm() makes multiple calls to vlapic_lvtt_period().  Pull it out
   into a local variable.

vlapic_accept_pic_intr() is called on every VMEntry, so this is a reduction in
VMEntry complexity across the board.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * New
---
 xen/arch/x86/hvm/hpet.c   | 15 +++++++++------
 xen/arch/x86/hvm/vlapic.c | 23 +++++++++++++++--------
 xen/arch/x86/hvm/vpic.c   |  9 +++++----
 3 files changed, 29 insertions(+), 18 deletions(-)

diff --git a/xen/arch/x86/hvm/hpet.c b/xen/arch/x86/hvm/hpet.c
index ee756abb824d..475c3f8bf471 100644
--- a/xen/arch/x86/hvm/hpet.c
+++ b/xen/arch/x86/hvm/hpet.c
@@ -240,6 +240,7 @@ static void hpet_set_timer(HPETState *h, unsigned int tn,
     uint64_t tn_cmp, cur_tick, diff;
     unsigned int irq;
     unsigned int oneshot;
+    s_time_t diff_ns, period_ns = 0;
 
     ASSERT(tn < HPET_TIMER_NUM);
     ASSERT(rw_is_write_locked(&h->lock));
@@ -311,13 +312,15 @@ static void hpet_set_timer(HPETState *h, unsigned int tn,
      * status register) before another interrupt can be delivered.
      */
     oneshot = !timer_is_periodic(h, tn) || timer_level(h, tn);
+    diff_ns = hpet_tick_to_ns(h, diff);
+    if ( !oneshot )
+        period_ns = hpet_tick_to_ns(h, h->hpet.period[tn]);
+
     TRACE_2_LONG_4D(TRC_HVM_EMUL_HPET_START_TIMER, tn, irq,
-                    TRC_PAR_LONG(hpet_tick_to_ns(h, diff)),
-                    TRC_PAR_LONG(oneshot ? 0LL :
-                                 hpet_tick_to_ns(h, h->hpet.period[tn])));
-    create_periodic_time(vhpet_vcpu(h), &h->pt[tn],
-                         hpet_tick_to_ns(h, diff),
-                         oneshot ? 0 : hpet_tick_to_ns(h, h->hpet.period[tn]),
+                    TRC_PAR_LONG(diff_ns),
+                    TRC_PAR_LONG(period_ns));
+
+    create_periodic_time(vhpet_vcpu(h), &h->pt[tn], diff_ns, period_ns,
                          irq, timer_level(h, tn) ? hpet_timer_fired : NULL,
                          timer_level(h, tn) ? (void *)(unsigned long)tn : NULL,
                          timer_level(h, tn));
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 5e21fb4937d9..b8c84458ffdc 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -1267,15 +1267,18 @@ static int __vlapic_accept_pic_intr(struct vcpu *v)
 
 int vlapic_accept_pic_intr(struct vcpu *v)
 {
+    bool target, accept = false;
+
     if ( vlapic_hw_disabled(vcpu_vlapic(v)) || !has_vpic(v->domain) )
         return 0;
 
-    TRACE_2D(TRC_HVM_EMUL_LAPIC_PIC_INTR,
-             (v == v->domain->arch.hvm.i8259_target),
-             v ? __vlapic_accept_pic_intr(v) : -1);
+    target = v == v->domain->arch.hvm.i8259_target;
+    if ( target )
+        accept = __vlapic_accept_pic_intr(v);
+
+    TRACE_2D(TRC_HVM_EMUL_LAPIC_PIC_INTR, target, accept);
 
-    return ((v == v->domain->arch.hvm.i8259_target) &&
-            __vlapic_accept_pic_intr(v));
+    return target && accept;
 }
 
 void vlapic_adjust_i8259_target(struct domain *d)
@@ -1449,6 +1452,7 @@ static void lapic_rearm(struct vlapic *s)
 {
     unsigned long tmict;
     uint64_t period, tdt_msr;
+    bool is_periodic;
 
     s->pt.irq = vlapic_get_reg(s, APIC_LVTT) & APIC_VECTOR_MASK;
 
@@ -1464,12 +1468,15 @@ static void lapic_rearm(struct vlapic *s)
 
     period = ((uint64_t)APIC_BUS_CYCLE_NS *
               (uint32_t)tmict * s->hw.timer_divisor);
+    is_periodic = vlapic_lvtt_period(s);
+
     TRACE_2_LONG_3D(TRC_HVM_EMUL_LAPIC_START_TIMER, TRC_PAR_LONG(period),
-             TRC_PAR_LONG(vlapic_lvtt_period(s) ? period : 0LL), s->pt.irq);
+             TRC_PAR_LONG(is_periodic ? period : 0LL), s->pt.irq);
+
     create_periodic_time(vlapic_vcpu(s), &s->pt, period,
-                         vlapic_lvtt_period(s) ? period : 0,
+                         is_periodic ? period : 0,
                          s->pt.irq,
-                         vlapic_lvtt_period(s) ? vlapic_pt_cb : NULL,
+                         is_periodic ? vlapic_pt_cb : NULL,
                          &s->timer_last_update, false);
     s->timer_last_update = s->pt.last_plt_gtime;
 }
diff --git a/xen/arch/x86/hvm/vpic.c b/xen/arch/x86/hvm/vpic.c
index af988a868c8a..91c2c6983393 100644
--- a/xen/arch/x86/hvm/vpic.c
+++ b/xen/arch/x86/hvm/vpic.c
@@ -512,14 +512,15 @@ void vpic_irq_negative_edge(struct domain *d, int irq)
 
 int vpic_ack_pending_irq(struct vcpu *v)
 {
-    int irq;
+    int irq, accept;
     struct hvm_hw_vpic *vpic = &v->domain->arch.hvm.vpic[0];
 
     ASSERT(has_vpic(v->domain));
 
-    TRACE_2D(TRC_HVM_EMUL_PIC_PEND_IRQ_CALL, vlapic_accept_pic_intr(v),
-             vpic->int_output);
-    if ( !vlapic_accept_pic_intr(v) || !vpic->int_output )
+    accept = vlapic_accept_pic_intr(v);
+
+    TRACE_2D(TRC_HVM_EMUL_PIC_PEND_IRQ_CALL, accept, vpic->int_output);
+    if ( !accept || !vpic->int_output )
         return -1;
 
     irq = vpic_intack(vpic);
-- 
2.11.0


