Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DD84B5126
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:07:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271785.466528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb4A-00086o-Py; Mon, 14 Feb 2022 13:06:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271785.466528; Mon, 14 Feb 2022 13:06:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb49-0007rv-LF; Mon, 14 Feb 2022 13:06:53 +0000
Received: by outflank-mailman (input) for mailman id 271785;
 Mon, 14 Feb 2022 13:06:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb3G-00023t-Qp
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:05:58 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8de72df-8d96-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 14:05:56 +0100 (CET)
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
X-Inumbo-ID: d8de72df-8d96-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843957;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=zYz6cPCtXWh7bl+DWwkU2uoiErkwKYQ2kvdgoIFv7rs=;
  b=YoJRgoZ0YXOZ/qMSM1UJdjRjRVSLpI5i987fERiIf/8Je+WKqvSf15+o
   lwtgxrpMZlIFY4iC+c6NG6MwxHoVxEPGuI7Pqyn3vyaOBEXqDg2K3IUd8
   tOcf3WUMOQF5JLX9gNc363v3ZPM9YdfUebmM8q5sXULK3fbAs0QjD2XEC
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Gf6TikuuGiZKt0BfoHzvjOEinQFQ60x15BazYMDXdwzhj/eEhUnlLCzXKxok+itIjouokdTk25
 dxB+cl2r844OJqDEQJ37wNtZxG4Lyh1ocCNJcgVeVYM4DxOaLUjvou7nH8k/7Q7/MZ14dk5d9X
 nOlcX8r9zKWYmuttWWY/AeOEf4LC1DtftYSXucyHMLoxAhShcgwlo6fUTgyx5RktVTXxZmT2f3
 K2relrdfYYjyrrgRwNr4mkyeYGBqrbeeNPgHC3ToHoCw804btSuBmAyWlejEWSvvCC2SC1cl7o
 lyU7j286x9nBF1xU1GdS+Jhc
X-SBRS: 5.1
X-MesageID: 64149847
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:HoLt8qwRi5Aj8w1rFmF6t+cowSrEfRIJ4+MujC+fZmUNrF6WrkUPy
 jFLW2vVbP6JNzD0ed8kao7lpx9TsZTQm9E2HFFvpSAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500g7wbdl2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt8FN1
 I1iuZOCcl0KDpf1kes2bQFgSy4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVoru0lINPmI8U0vXZ4wCuCJf0nXYrCU+PB4towMDIY2JwXQaeOO
 5VxhTxHMA+dZwxXMFosFb1lruGWhXT2UR4BkQfAzUYwyzeKl1EguFT3C/LFd9rPSchLk0Kwo
 mPd43+/EhwcLMaYyzeO7jSrnOCnoM/gcNtMTvvirKcs2QDNgDxIYPELabelieiFlhaRV91tE
 BY3yhAXpKcZylSTFtaoCnVUv0W4lhIbXtNRFcgz5weM1rfY7m6lO4QUctJSQId47ZFrHFTGw
 nfMxoq0XmI37NV5XFrAru/8kN+kBcQCwYbujwcgRBBN3dTsqZpbYvnnHoc6S/7dYjEY9FjNL
 9G2QMoW2u97YS0jjfzTEbX7b9WE/Mahc+LNzl+LNl9JFysgDGJfW6Sm6ELA8dFLJ5uDQ1+Ks
 RAswpbCsL9eXczQzHXWGo3h+Y1FAN7fblXhbaNHRcF9p1xBBVb/FWyv3N2ODBgwaZtVEdMYS
 ETSpRlQ9Pdu0IiCNsdKj3aKI51yl8DITI29PtiNN4YmSsUhJWevoXA1DWbNjj+FraTZufxmU
 XttWZ33Vihy5GUO5GfeetrxJpd1mn5glTmOGfgWDX2PiNKjWZJccp9dWHPmUwzzxPrsTNz9/
 4kNOs2U5Q9YVeGiMCDb/ZRKdQIBLGQhBICwoMtSL7bRLg1jEWAnKvnQ3bJ+JNA1w/ULzr/Fr
 iOnR0tV6Fvjnnmbew+EXW9uNeH0VpFloHNlYSF1ZQS022IuaJqE5bsEc8dlZqEu8eFulKYmT
 /QMd8iaLO5ITzDLp2YUYZXn9dQwfxW3nwOeeSGiZWFnLZJnQgXI/P7ifxfuq3ZSXnbm65Nmr
 uT5hA3BQJcFSwBzN+rsaaqinwGroHwQuONuRE+UcNNdT1rhrdpxICvrg/5pf8xVcUffxiGX3
 hq9CAsDobWfuJc89dTEiPzWr4qtFOciTENWE3OCsOSzPCjeuGGi3ZVBQKCDejWEDDH4/6CrZ
 ON0yfDgMaJYwAYW4tQkS7s7n7gj49bPpqNBylU2FXrGWF2nF7d8LyTUxsJIrKBMmudUtAbet
 phjITWG1WFl4P/YLWM=
IronPort-HdrOrdr: A9a23:wqj72q1gfsnh/TME+yQGOQqjBLAkLtp133Aq2lEZdPRUGvb3qy
 nOpoVj6faaslYssR0b9exofZPwJE80lqQFh7X5X43SPzUO0VHAROoJgLcKgQeQfxEWntQtsp
 uIGJIeNDSfNzdHZL7BkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64149847"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 56/70] x86/time: CFI hardening
Date: Mon, 14 Feb 2022 12:51:13 +0000
Message-ID: <20220214125127.17985-57-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Control Flow Integrity schemes use toolchain and optionally hardware support
to help protect against call/jump/return oriented programming attacks.

Use cf_check to annotate function pointer targets for the toolchain.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/hpet.c             |  8 ++++----
 xen/arch/x86/include/asm/hpet.h |  4 ++--
 xen/arch/x86/time.c             | 33 +++++++++++++++++----------------
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
diff --git a/xen/arch/x86/include/asm/hpet.h b/xen/arch/x86/include/asm/hpet.h
index f343fe4740f1..9919f7473071 100644
--- a/xen/arch/x86/include/asm/hpet.h
+++ b/xen/arch/x86/include/asm/hpet.h
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
diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index 043be2a8ec1a..2a1758ebb33b 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -309,7 +309,7 @@ static uint64_t adjust_elapsed(uint64_t elapsed, uint32_t actual,
  * PLATFORM TIMER 1: PROGRAMMABLE INTERVAL TIMER (LEGACY PIT)
  */
 
-static u64 read_pit_count(void)
+static u64 cf_check read_pit_count(void)
 {
     u16 count16;
     u32 count32;
@@ -328,7 +328,7 @@ static u64 read_pit_count(void)
     return count32;
 }
 
-static s64 __init init_pit(struct platform_timesource *pts)
+static s64 __init cf_check init_pit(struct platform_timesource *pts)
 {
     u8 portb = inb(0x61);
     u64 start, end;
@@ -366,7 +366,7 @@ static s64 __init init_pit(struct platform_timesource *pts)
     return (end - start) * CALIBRATE_FRAC;
 }
 
-static void resume_pit(struct platform_timesource *pts)
+static void cf_check resume_pit(struct platform_timesource *pts)
 {
     /* Set CTC channel 2 to mode 0 again; initial value does not matter. */
     outb(0xb0, PIT_MODE); /* binary, mode 0, LSB/MSB, Ch 2 */
@@ -389,12 +389,12 @@ static struct platform_timesource __initdata plt_pit =
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
     uint32_t count, target, elapsed;
@@ -477,7 +477,7 @@ static int64_t __init init_hpet(struct platform_timesource *pts)
     return adjust_elapsed(rdtsc_ordered() - start, elapsed, target);
 }
 
-static void resume_hpet(struct platform_timesource *pts)
+static void cf_check resume_hpet(struct platform_timesource *pts)
 {
     hpet_resume(NULL);
 }
@@ -502,12 +502,12 @@ unsigned int __initdata pmtmr_width;
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
     uint64_t start;
     uint32_t count, target, mask, elapsed;
@@ -562,7 +562,7 @@ static unsigned int __initdata tsc_flags;
  * Called in verify_tsc_reliability() under reliable TSC conditions
  * thus reusing all the checks already performed there.
  */
-static s64 __init init_tsc(struct platform_timesource *pts)
+static s64 __init cf_check init_tsc(struct platform_timesource *pts)
 {
     u64 ret = pts->frequency;
 
@@ -584,7 +584,7 @@ static s64 __init init_tsc(struct platform_timesource *pts)
     return ret;
 }
 
-static u64 read_tsc(void)
+static u64 cf_check read_tsc(void)
 {
     return rdtsc_ordered();
 }
@@ -626,7 +626,7 @@ static uint64_t xen_timer_cpu_frequency(void)
     return freq;
 }
 
-static int64_t __init init_xen_timer(struct platform_timesource *pts)
+static int64_t __init cf_check init_xen_timer(struct platform_timesource *pts)
 {
     if ( !xen_guest )
         return 0;
@@ -647,7 +647,7 @@ static always_inline uint64_t read_cycle(const struct vcpu_time_info *info,
     return info->system_time + offset;
 }
 
-static uint64_t read_xen_timer(void)
+static uint64_t cf_check read_xen_timer(void)
 {
     struct vcpu_time_info *info = &this_cpu(vcpu_info)->time;
     uint32_t version;
@@ -676,7 +676,7 @@ static uint64_t read_xen_timer(void)
     return ret;
 }
 
-static void resume_xen_timer(struct platform_timesource *pts)
+static void cf_check resume_xen_timer(struct platform_timesource *pts)
 {
     write_atomic(&xen_timer_last, 0);
 }
@@ -702,7 +702,8 @@ static struct platform_timesource __initdata plt_xen_timer =
 static struct ms_hyperv_tsc_page *hyperv_tsc;
 static struct page_info *hyperv_tsc_page;
 
-static int64_t __init init_hyperv_timer(struct platform_timesource *pts)
+static int64_t __init cf_check init_hyperv_timer(
+    struct platform_timesource *pts)
 {
     paddr_t maddr;
     uint64_t tsc_msr, freq;
@@ -745,7 +746,7 @@ static int64_t __init init_hyperv_timer(struct platform_timesource *pts)
     return freq;
 }
 
-static uint64_t read_hyperv_timer(void)
+static uint64_t cf_check read_hyperv_timer(void)
 {
     uint64_t scale, ret, tsc;
     int64_t offset;
@@ -1721,7 +1722,7 @@ time_calibration_rendezvous_tail(const struct calibration_rendezvous *r,
  * Keep TSCs in sync when they run at the same rate, but may stop in
  * deep-sleep C states.
  */
-static void time_calibration_tsc_rendezvous(void *_r)
+static void cf_check time_calibration_tsc_rendezvous(void *_r)
 {
     int i;
     struct calibration_rendezvous *r = _r;
-- 
2.11.0


