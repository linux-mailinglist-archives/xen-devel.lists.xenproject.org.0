Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDE445EEA7
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:07:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232807.403889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqawi-0007ms-Ix; Fri, 26 Nov 2021 13:07:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232807.403889; Fri, 26 Nov 2021 13:07:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqawh-0007PP-Q0; Fri, 26 Nov 2021 13:07:19 +0000
Received: by outflank-mailman (input) for mailman id 232807;
 Fri, 26 Nov 2021 13:07:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqauq-0002zD-6z
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:05:24 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 831785f6-4eb9-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 14:05:23 +0100 (CET)
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
X-Inumbo-ID: 831785f6-4eb9-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637931922;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=w8x1lrOFlbNAGePhZZD3cYzZny3J+Uxt4VjkYNuWyfk=;
  b=QbzIJNFnARaR6TaflbPuuK85DXGY3Nefxybymts9XmnMaAULG1PDbDn9
   x78mXTX7qnlQfMMqZ682P8witIDZ0p54Q/FH8KvE/AShdAlfv8Wvr4OAE
   E/EHcv8CRpOfECdUSQYgXBsEwBWtxRIW1ILrpY6qHiQrsavwA1VvJ7E8Y
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: U7OSD1qpbf/GiJTD9ozKCW8kBmRN5ASqB3ZPnKh5fIg2hTwzyN2DcmU3+BIMPsz311GmA9Bq4Z
 patuyWGAElHo549NuyRS1SVVNjUeA/Baeva48yuOXUEqbvUcBA6vrATOlMJ5IT6KpZr6GbU0QY
 Qo1wASduyQF1k9rKkly5qbhWy8r7+jejtnsluGKApnrRydF1y35YDHB6V27qEvlv0qepAMfVOL
 JSpKyARoS6WzIS8Lzn8UzxE2wPT8g4FMRgp2amfKTGJEUtXxnWpJSJeFA4F/bW5XJNexZoPhmD
 8oGb9tac8AiqTu4k6yqowx9V
X-SBRS: 5.1
X-MesageID: 58695989
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:tSqAv65RX89VO1zni2V70wxRtPXAchMFZxGqfqrLsTDasY5as4F+v
 mQWCmiFP6uKazegf9ElaI61/BhTv5DRx4VjGVRl+C8zHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVAMpBsJ00o5wrdg2NAw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z9
 d5LloOsESoSE4bJuuglDhxCDXliIvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gTTaiPO
 ptJOFKDajzgPj9QZ3BGLasZu+2ii1vFSBl08k2K8P9fD2/7k1UqjemF3MDuUsOObdVYmACfv
 G2u10bTDwweNdef4SGY6X/qjejK9QvrVYRXGLCm+/pChFyI2ndVGBAQTUG8o/Sylgi5Qd03F
 qAP0nNw9+5orhXtF4SjGU3jyJKZgvICc+dbFc4l9Fmg8Yf/5iSVPjUBVCAZdMNz4afaWgcW/
 lOOmtroAxlmv7uUVW+R+9+okN+iBcQGBTRcPHFZFGPp9/Gm+dhu1UyXEr6PBYbs1oWtcQwc1
 Qxmu8TXa187qccQn5u28lnc695HjsiYF1Vljuk7s4/M0++YWGJHT9D3gbQ4xawZRGp8crVnl
 CNf8yR5xLpTZaxhbATXHI0w8EiBvp5pygH0j191BIUG/D+w4XOldo04yGggfxg5bJtbKGO3P
 BS7VeZtCHl7ZyDCgUhfOd/ZNijX5fK4SYSNug78MrKinaSdhCfYpXozNCZ8LkjmkVQ2kLFXB
 HtoWZ3EMJruMow+lGDeb75EidcDn3lirUuOFcGT50n2itK2OS/KIYrpxXPTN4jVGovf+16Lm
 zueXuPXoyhivBrWPnOKrNVNdA9SdhDWx/ne8qRqSwJKGSI+cElJNhMb6epJl1VNk/sHm+HW0
 Gu6X0MEmlPziWeecVeBa2x5aaOpVpF69CppMSspNFeu+n4ifYfws/tPK8ppJeEqpL550Pp5b
 /gZYMHcUP5BfSvKpmYGZp7noY08KBny3VCSPzCoaSQUdoJ7Q1Cb4cftewbirXFcDie+ucYkj
 aen0wfXHcgKSwh4VZ6EY/Oz1VKh+3ManbsqDUfPJ9BSfmTq8ZRrdHOt3qNmfZlUJEyalDWA1
 guQDRMJnsX3otc4oIvTmKSJj4a1CO8iTEBUKHbWsOStPi7A82v9nYIZCLSUfSrQXX/f8bm5Y
 bkH1On1NfAKkQoYs4d4FLo3n6sy68G2+u1fxwVgWn7Kc06qGvVrJXzfhZtDsahEx7l4vwqqW
 x3QpokGaOvRYM61QkQMIAcFb/iY0aBGkzbf2v05PUHm6XIl57GAS0hTY0GBhSE1wGGZ62/5L
 TPNYPIr1jE=
IronPort-HdrOrdr: A9a23:xyGiJa5VppSnQ0u8eQPXwPDXdLJyesId70hD6qhwISY6TiX+rb
 HWoB17726TtN9/YhEdcLy7VJVoBEmskKKdgrNhWotKPjOW21dARbsKheCJrgEIWReOktK1vZ
 0QC5SWY+eQMbEVt6nHCXGDYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="58695989"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 51/65] x86/pt: Annotate fnptr targets
Date: Fri, 26 Nov 2021 12:34:32 +0000
Message-ID: <20211126123446.32324-52-andrew.cooper3@citrix.com>
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
 xen/arch/x86/emul-i8254.c | 2 +-
 xen/arch/x86/hvm/hpet.c   | 2 +-
 xen/arch/x86/hvm/rtc.c    | 2 +-
 xen/arch/x86/hvm/vlapic.c | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/emul-i8254.c b/xen/arch/x86/emul-i8254.c
index d170f464d966..18894b63488e 100644
--- a/xen/arch/x86/emul-i8254.c
+++ b/xen/arch/x86/emul-i8254.c
@@ -156,7 +156,7 @@ static int pit_get_gate(PITState *pit, int channel)
     return pit->hw.channels[channel].gate;
 }
 
-static void pit_time_fired(struct vcpu *v, void *priv)
+static void cf_check pit_time_fired(struct vcpu *v, void *priv)
 {
     uint64_t *count_load_time = priv;
     TRACE_0D(TRC_HVM_EMUL_PIT_TIMER_CB);
diff --git a/xen/arch/x86/hvm/hpet.c b/xen/arch/x86/hvm/hpet.c
index ed512fa65b63..45c7b9b40688 100644
--- a/xen/arch/x86/hvm/hpet.c
+++ b/xen/arch/x86/hvm/hpet.c
@@ -219,7 +219,7 @@ static void hpet_stop_timer(HPETState *h, unsigned int tn,
     hpet_get_comparator(h, tn, guest_time);
 }
 
-static void hpet_timer_fired(struct vcpu *v, void *data)
+static void cf_check hpet_timer_fired(struct vcpu *v, void *data)
 {
     unsigned int tn = (unsigned long)data;
     HPETState *h = vcpu_vhpet(v);
diff --git a/xen/arch/x86/hvm/rtc.c b/xen/arch/x86/hvm/rtc.c
index ed397276faa3..d21925db08bc 100644
--- a/xen/arch/x86/hvm/rtc.c
+++ b/xen/arch/x86/hvm/rtc.c
@@ -81,7 +81,7 @@ static void rtc_update_irq(RTCState *s)
 
 /* Called by the VPT code after it's injected a PF interrupt for us.
  * Fix up the register state to reflect what happened. */
-static void rtc_pf_callback(struct vcpu *v, void *opaque)
+static void cf_check rtc_pf_callback(struct vcpu *v, void *opaque)
 {
     RTCState *s = opaque;
 
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index d4e29ef1ff1d..49be9c8ea4fe 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -691,13 +691,13 @@ int guest_rdmsr_x2apic(const struct vcpu *v, uint32_t msr, uint64_t *val)
     return X86EMUL_OKAY;
 }
 
-static void vlapic_pt_cb(struct vcpu *v, void *data)
+static void cf_check vlapic_pt_cb(struct vcpu *v, void *data)
 {
     TRACE_0D(TRC_HVM_EMUL_LAPIC_TIMER_CB);
     *(s_time_t *)data = hvm_get_guest_time(v);
 }
 
-static void vlapic_tdt_pt_cb(struct vcpu *v, void *data)
+static void cf_check vlapic_tdt_pt_cb(struct vcpu *v, void *data)
 {
     *(s_time_t *)data = hvm_get_guest_time(v);
     vcpu_vlapic(v)->hw.tdt_msr = 0;
-- 
2.11.0


