Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 850DD45EE88
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:05:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232761.403713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqauX-0006eh-EF; Fri, 26 Nov 2021 13:05:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232761.403713; Fri, 26 Nov 2021 13:05:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqauW-0006UI-V9; Fri, 26 Nov 2021 13:05:04 +0000
Received: by outflank-mailman (input) for mailman id 232761;
 Fri, 26 Nov 2021 13:05:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqauU-0003W9-Hl
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:05:02 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 761fdb9a-4eb9-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 14:05:01 +0100 (CET)
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
X-Inumbo-ID: 761fdb9a-4eb9-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637931901;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2MB3qO+z9Cw8CtOS8rAbbOlsadBbIGcPOzvcS4Y5AMw=;
  b=Q8fp2z2QkkCRgJcVfS0aq+7+/2k45A6Pi4rYF0Krb0tvXHkICO1nh2Th
   E6mWp2nStjpIMUgok7KyeGDn+e8+sSsCRwtNW7hrbRz7JbNPumU58Fw+a
   WTu6XtFeOeZnM2pUgTnsKVps0g6S1fUwNakdvhuaC4Wjix65useRtVRto
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: fcaLdGsmvyl8paTutvujKAQ2Sjig0Idrq2+Hw1Hqs/WgsogmQAVCx6mNxqYZHfvs+L4k/+RJHb
 2/g71yJ8pOJOKZqIedrny2kDrRAxFmn8RVIkpYv4OEQ0GdEfm1CaErA7sjnAGsL7HTuOhY0bYs
 ZQD7O1jKdNHdMaG0Ivk1D5DtOLtIneRRHaI4bgxJDJQFbCpcJJRMkzQZZRw0VP7I1CMBmYLoqu
 aDXwg980SI405pupDGVtY8ykBhg2zo+7RJHZI04S/V16vSU1gt4k0YlVKLEZgl97kdLRx2Kk3E
 0uw4TzA00ursUuVOtYSVADx3
X-SBRS: 5.1
X-MesageID: 58676339
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:olExu6s4CqaTQcFRX6vhfHOsd+fnVJtZMUV32f8akzHdYApBsoF/q
 tZmKWjSOv+ON2ryKYp+bo/g9UkE75CGn9cyHAo4r31gF3sR+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cx24bhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplksWpeCIgN+71yeEfThdbAjNfNOpK9+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6DN
 5RGN2E0PXwsZTVCAXkuBK8judyyxUneLAQFqVeFr4sotj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKjMwOcGbyDGF2mmxneKJliT+MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO8pj8TCow6OX2lecBHUKTS9TSdVhuMBjEFTGy
 WS1t9/uADVutpicRnSc6qqYoFuOBMQFEYMRTXRaFFVYurEPtKl210uSFYg7TMZZm/WsQWmoq
 w1muhTSkFn6YSQj86ygtW7KjDu3znQiZl5kv16HNo5JA+4QWWJEW2BKwQSEhRqjBNzAJrVkg
 JTis5PFhAzpJcvQ/BFhuM1XQNmUCw+taVUwe2JHEZg77CiK8HW+Z41W6zwWDB43aZlUJ2K2M
 RON5Vg5CHpv0J2CNvQfj2WZUZlC8EQdPY69CqC8giRmPvCdizNrDAkxPBXNjggBYWAnkL0lO
 IfzTCpfJS1yNEiT9xLvH711+eZynkgWnDqPLbimn0XP+efPPxa9FOZaWGZim8hktctoVi2Oq
 I0BXyZLoj0CONDDjt7/rdROcAtUdCdjXvgbaaV/L4a+H+avI0l5Y9e5/F/rU9UNc319mria8
 3ejdFVfzVaj13TLJR/TMiJoaa/1XIY5pnU+ZHR+MVGt0nklQICu8KZAKMdnIeh5rLRunaxuU
 v0IW8ScGfATGD7JzCsQMMvmp4t4eRX12Q/XZ3i5YCIydoJLThDS/oO2ZRPm8SQDV3LltcY3r
 7C6+BncRJ4PG1ZrAMrMMar9xFKtp3kN3ul1WhKQcNVUfUzt9qlsKjDw0aBrc51dd02by2LDh
 QiMABoeqe3cmKMP8YHE1fKesoOkM+piBU4GTWPV2qm7aHvB9W25zI4eDOvRJWLBVHn58bmJb
 PlOy62uK+UOmVtHvtYuE7tvyq5itdLjq6UDk1ZhFXTPKV+qFqlhMj+N2swW7v9BwbpQuA2XX
 EOT+4YFZeXVaZ29SFNBdhA4aumj1O0PnmiA5Ps4F0z2+Str8efVSk5VJRSN1HRQIbYd3FnJG
 gv9VBr6MzCCtyc=
IronPort-HdrOrdr: A9a23:y0C4s6t7uZnB5RRmgOL1rklZ7skDTtV00zEX/kB9WHVpmszxra
 6TdZMgpGbJYVcqKRcdcL+7WJVoLUmxyXcx2/h1AV7AZniAhILLFvAA0WKK+VSJcEeSygce79
 YFT0EXMqyJMbEQt6fHCWeDfOrIuOP3kpyVuQ==
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="58676339"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 52/65] x86/time: Annotate fnptr targets
Date: Fri, 26 Nov 2021 12:34:33 +0000
Message-ID: <20211126123446.32324-53-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/hpet.c        |  8 ++++----
 xen/arch/x86/time.c        | 33 +++++++++++++++++----------------
 xen/include/asm-x86/hpet.h |  4 ++--
 3 files changed, 23 insertions(+), 22 deletions(-)

diff --git a/xen/arch/x86/hpet.c b/xen/arch/x86/hpet.c
index dcc9e16693e9..2b00c30d1153 100644
--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -196,7 +196,7 @@ static void evt_do_broadcast(cpumask_t *mask)
        cpumask_raise_softirq(mask, TIMER_SOFTIRQ);
 }
 
-static void handle_hpet_broadcast(struct hpet_event_channel *ch)
+static void cf_check handle_hpet_broadcast(struct hpet_event_channel *ch)
 {
     cpumask_t mask;
     s_time_t now, next_event;
@@ -553,7 +553,7 @@ static void hpet_detach_channel(unsigned int cpu,
 
 void (*__read_mostly pv_rtc_handler)(uint8_t index, uint8_t value);
 
-static void handle_rtc_once(uint8_t index, uint8_t value)
+static void cf_check handle_rtc_once(uint8_t index, uint8_t value)
 {
     if ( index != RTC_REG_B )
         return;
@@ -566,7 +566,7 @@ static void handle_rtc_once(uint8_t index, uint8_t value)
     }
 }
 
-void __init hpet_broadcast_init(void)
+void __init cf_check hpet_broadcast_init(void)
 {
     u64 hpet_rate = hpet_setup();
     u32 hpet_id, cfg;
@@ -637,7 +637,7 @@ void __init hpet_broadcast_init(void)
         hpet_events->flags = HPET_EVT_LEGACY;
 }
 
-void hpet_broadcast_resume(void)
+void cf_check hpet_broadcast_resume(void)
 {
     u32 cfg;
     unsigned int i, n;
diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index ef036a187415..cce1d56b2ddd 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -292,7 +292,7 @@ static char *freq_string(u64 freq)
  * PLATFORM TIMER 1: PROGRAMMABLE INTERVAL TIMER (LEGACY PIT)
  */
 
-static u64 read_pit_count(void)
+static u64 cf_check read_pit_count(void)
 {
     u16 count16;
     u32 count32;
@@ -311,7 +311,7 @@ static u64 read_pit_count(void)
     return count32;
 }
 
-static s64 __init init_pit(struct platform_timesource *pts)
+static s64 __init cf_check init_pit(struct platform_timesource *pts)
 {
     u8 portb = inb(0x61);
     u64 start, end;
@@ -348,7 +348,7 @@ static s64 __init init_pit(struct platform_timesource *pts)
     return (end - start) * CALIBRATE_FRAC;
 }
 
-static void resume_pit(struct platform_timesource *pts)
+static void cf_check resume_pit(struct platform_timesource *pts)
 {
     /* Set CTC channel 2 to mode 0 again; initial value does not matter. */
     outb(0xb0, PIT_MODE); /* binary, mode 0, LSB/MSB, Ch 2 */
@@ -371,12 +371,12 @@ static struct platform_timesource __initdata plt_pit =
  * PLATFORM TIMER 2: HIGH PRECISION EVENT TIMER (HPET)
  */
 
-static u64 read_hpet_count(void)
+static u64 cf_check read_hpet_count(void)
 {
     return hpet_read32(HPET_COUNTER);
 }
 
-static int64_t __init init_hpet(struct platform_timesource *pts)
+static int64_t __init cf_check init_hpet(struct platform_timesource *pts)
 {
     uint64_t hpet_rate, start;
     uint32_t count, target;
@@ -462,7 +462,7 @@ static int64_t __init init_hpet(struct platform_timesource *pts)
     return (rdtsc_ordered() - start) * CALIBRATE_FRAC;
 }
 
-static void resume_hpet(struct platform_timesource *pts)
+static void cf_check resume_hpet(struct platform_timesource *pts)
 {
     hpet_resume(NULL);
 }
@@ -487,12 +487,12 @@ unsigned int __initdata pmtmr_width;
 /* ACPI PM timer ticks at 3.579545 MHz. */
 #define ACPI_PM_FREQUENCY 3579545
 
-static u64 read_pmtimer_count(void)
+static u64 cf_check read_pmtimer_count(void)
 {
     return inl(pmtmr_ioport);
 }
 
-static s64 __init init_pmtimer(struct platform_timesource *pts)
+static s64 __init cf_check init_pmtimer(struct platform_timesource *pts)
 {
     u64 start;
     u32 count, target, mask;
@@ -557,7 +557,7 @@ static unsigned int __initdata tsc_flags;
  * Called in verify_tsc_reliability() under reliable TSC conditions
  * thus reusing all the checks already performed there.
  */
-static s64 __init init_tsc(struct platform_timesource *pts)
+static s64 __init cf_check init_tsc(struct platform_timesource *pts)
 {
     u64 ret = pts->frequency;
 
@@ -579,7 +579,7 @@ static s64 __init init_tsc(struct platform_timesource *pts)
     return ret;
 }
 
-static u64 read_tsc(void)
+static u64 cf_check read_tsc(void)
 {
     return rdtsc_ordered();
 }
@@ -621,7 +621,7 @@ static uint64_t xen_timer_cpu_frequency(void)
     return freq;
 }
 
-static int64_t __init init_xen_timer(struct platform_timesource *pts)
+static int64_t __init cf_check init_xen_timer(struct platform_timesource *pts)
 {
     if ( !xen_guest )
         return 0;
@@ -642,7 +642,7 @@ static always_inline uint64_t read_cycle(const struct vcpu_time_info *info,
     return info->system_time + offset;
 }
 
-static uint64_t read_xen_timer(void)
+static uint64_t cf_check read_xen_timer(void)
 {
     struct vcpu_time_info *info = &this_cpu(vcpu_info)->time;
     uint32_t version;
@@ -671,7 +671,7 @@ static uint64_t read_xen_timer(void)
     return ret;
 }
 
-static void resume_xen_timer(struct platform_timesource *pts)
+static void cf_check resume_xen_timer(struct platform_timesource *pts)
 {
     write_atomic(&xen_timer_last, 0);
 }
@@ -697,7 +697,8 @@ static struct platform_timesource __initdata plt_xen_timer =
 static struct ms_hyperv_tsc_page *hyperv_tsc;
 static struct page_info *hyperv_tsc_page;
 
-static int64_t __init init_hyperv_timer(struct platform_timesource *pts)
+static int64_t __init cf_check init_hyperv_timer(
+    struct platform_timesource *pts)
 {
     paddr_t maddr;
     uint64_t tsc_msr, freq;
@@ -740,7 +741,7 @@ static int64_t __init init_hyperv_timer(struct platform_timesource *pts)
     return freq;
 }
 
-static uint64_t read_hyperv_timer(void)
+static uint64_t cf_check read_hyperv_timer(void)
 {
     uint64_t scale, ret, tsc;
     int64_t offset;
@@ -1716,7 +1717,7 @@ time_calibration_rendezvous_tail(const struct calibration_rendezvous *r,
  * Keep TSCs in sync when they run at the same rate, but may stop in
  * deep-sleep C states.
  */
-static void time_calibration_tsc_rendezvous(void *_r)
+static void cf_check time_calibration_tsc_rendezvous(void *_r)
 {
     int i;
     struct calibration_rendezvous *r = _r;
diff --git a/xen/include/asm-x86/hpet.h b/xen/include/asm-x86/hpet.h
index f343fe4740f1..9919f7473071 100644
--- a/xen/include/asm-x86/hpet.h
+++ b/xen/include/asm-x86/hpet.h
@@ -89,8 +89,8 @@ void hpet_disable_legacy_replacement_mode(void);
  * Temporarily use an HPET event counter for timer interrupt handling,
  * rather than using the LAPIC timer. Used for Cx state entry.
  */
-void hpet_broadcast_init(void);
-void hpet_broadcast_resume(void);
+void cf_check hpet_broadcast_init(void);
+void cf_check hpet_broadcast_resume(void);
 void cf_check hpet_broadcast_enter(void);
 void cf_check hpet_broadcast_exit(void);
 int hpet_broadcast_is_available(void);
-- 
2.11.0


