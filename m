Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DC54B5120
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:06:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271739.466451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb3t-00043y-JL; Mon, 14 Feb 2022 13:06:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271739.466451; Mon, 14 Feb 2022 13:06:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb3s-0003p0-KO; Mon, 14 Feb 2022 13:06:36 +0000
Received: by outflank-mailman (input) for mailman id 271739;
 Mon, 14 Feb 2022 13:06:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb3F-00023t-HC
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:05:57 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8332ef6-8d96-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 14:05:55 +0100 (CET)
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
X-Inumbo-ID: d8332ef6-8d96-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843956;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=EoLk9ARQfV08rXKWBWT/VxrxjsnGxFJXU/V2o57wTSM=;
  b=fA6FyD371rJHIbzeyFKoqTM0vvD2eAAyhdV8er5RWRxZW8XCx8N87CtJ
   mgSV69ZPf8yF3x6O+762ASYquyFHE9x7i6lwv6/wGMEghfolVfqE14dj1
   sbNPGSxT62A23ROAJCslpuyyDDd+B3cL1/CKnWIAkZYyJog7AsJv+WDdH
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: lwVxee2gONI8zybZijGPgtRb7S5JZ9rR8CHfg0ghaYoxu1E5N9tIvt91HWF+9OTv8XFLfKgO7I
 sGklG4QuNyuWBJRb7GUFbCvvrPewTUet58z1MlJJ4+lbLHr2rZo4uvi9H19dHhZhXDu+i2WFcb
 du2zGaMKUzOB1bYH7qaaAt6KZ91gHLgkteFKozfwjnDGudYqGKLiGB5CzGSwdJqM/tPPQUmyM9
 EIYP7GhssMUXd5fqYC5X04ybu+vZSrLHzftQZGmHstgwt8EmmDoKN+oB/9SOlGseJgJ+GkJIfM
 H0WldQZPdzkqH90PtQKPTWa/
X-SBRS: 5.1
X-MesageID: 64149841
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:yJ9zh6wJaH9Z9ZFyhY96t+cowSrEfRIJ4+MujC+fZmUNrF6WrkUOz
 moeDzuCPqqNMTb1fdtzati/9UMPvZ7Vx4BmTgM4qSAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500g7wbdl2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt+At9
 vtjubzhchoOF/DGgc9eFDtYDxgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVoru0lINPmI8U0vXZ4wCuCJf0nXYrCU+PB4towMDIY2JwXQaeOO
 5NxhTxHSSryaUcSClorFpMshdiZjHemazYJpwfAzUYwyzeKl1EguFT3C/LFd9rPSchLk0Kwo
 mPd43+/EhwcLMaYyzeO7jSrnOCnoM/gcNtMTvvirKcs2QDNgDxIYPELabelicnltGCQV/IOE
 FEz03cktINxs26rUuCoCnVUv0W4lhIbXtNRFcgz5weM1rfY7m6lO4QUctJSQId47ZFrHFTGw
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
IronPort-HdrOrdr: A9a23:6yYMhqsIzUgwOrs8iYRzYp6c7skDdNV00zEX/kB9WHVpmszxra
 6TdZUgpGbJYVkqOE3I9ertBEDEewK4yXcX2/h2AV7BZniEhILAFugLhuGO/9SjIVybygc079
 YGT0EUMrzN5DZB4voSmDPIceod/A==
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64149841"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 55/70] x86/pt: CFI hardening
Date: Mon, 14 Feb 2022 12:51:12 +0000
Message-ID: <20220214125127.17985-56-andrew.cooper3@citrix.com>
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


