Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9435319F3EB
	for <lists+xen-devel@lfdr.de>; Mon,  6 Apr 2020 12:57:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLPRY-00009r-Ko; Mon, 06 Apr 2020 10:57:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Lhp/=5W=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jLPRX-000091-8F
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2020 10:57:27 +0000
X-Inumbo-ID: 66ad2392-77f5-11ea-bfe0-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 66ad2392-77f5-11ea-bfe0-12813bfff9fa;
 Mon, 06 Apr 2020 10:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586170646;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SLpvoVsWt67jFwvCZiFaJg06hvegnu8vLcBh7inaYr4=;
 b=O/tbEHWoAs/DqStOxa7VlUj0QSDR10FZyV/7Hd1FMw7QIUQ+HJL0Bo+2
 H7dO5QXTAxg0QMs03XZwMqAUUwyQeEAGEArFrn1k1DTT0eaYQAyYFJm66
 AsDWc5et9GH9llRk6gJjybMZM7SZZfCIucPw2S3LF2fLyVl0MptVv7cWN E=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: oBkXzs5NtNtc2WHWTKuxL+fQm+WmpKv4bybTLnkIgQkgWIWIEQZlgU1cFLBERc70XYMOKc1kGF
 fVYhawOkiF0W/tVNtLKNz5ew3IO/eZbLY1osZVfQZxew8yFP2o/1lG9C6Rh+iuQDRIBm4nVGAL
 hiwEWHOcA0Mi2VuRcxenY4uaw/UCRhbNvoONY+1XS7uDWw4gX9LXT6SMqfaxiNlAwfl5CrITme
 dHt5GMNfPOZoE6Z9SIy3YpmdPBrwwE/CwmwRqKg+ozOdnotSxxAumcxy6acK6PI58A64Sv/wuT
 2y4=
X-SBRS: 2.7
X-MesageID: 15547813
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,350,1580792400"; d="scan'208";a="15547813"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH v9 2/3] x86/tlb: allow disabling the TLB clock
Date: Mon, 6 Apr 2020 12:57:02 +0200
Message-ID: <20200406105703.79201-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200406105703.79201-1-roger.pau@citrix.com>
References: <20200406105703.79201-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The TLB clock is helpful when running Xen on bare metal because when
doing a TLB flush each CPU is IPI'ed and can keep a timestamp of the
last flush.

This is not the case however when Xen is running virtualized, and the
underlying hypervisor provides mechanism to assist in performing TLB
flushes: Xen itself for example offers a HVMOP_flush_tlbs hypercall in
order to perform a TLB flush without having to IPI each CPU. When
using such mechanisms it's no longer possible to keep a timestamp of
the flushes on each CPU, as they are performed by the underlying
hypervisor.

Offer a boolean in order to signal Xen that the timestamped TLB
shouldn't be used. This avoids keeping the timestamps of the flushes,
and also forces NEED_FLUSH to always return true.

No functional change intended, as this change doesn't introduce any
user that disables the timestamped TLB.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Wei Liu <wl@xen.org>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/flushtlb.c        | 19 +++++++++++++------
 xen/include/asm-x86/flushtlb.h | 17 ++++++++++++++++-
 2 files changed, 29 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/flushtlb.c b/xen/arch/x86/flushtlb.c
index c81e53c0ae..22b2e84329 100644
--- a/xen/arch/x86/flushtlb.c
+++ b/xen/arch/x86/flushtlb.c
@@ -32,6 +32,9 @@
 u32 tlbflush_clock = 1U;
 DEFINE_PER_CPU(u32, tlbflush_time);
 
+/* Signals whether the TLB flush clock is in use. */
+bool __read_mostly tlb_clk_enabled = true;
+
 /*
  * pre_flush(): Increment the virtual TLB-flush clock. Returns new clock value.
  * 
@@ -82,12 +85,13 @@ static void post_flush(u32 t)
 static void do_tlb_flush(void)
 {
     unsigned long flags, cr4;
-    u32 t;
+    u32 t = 0;
 
     /* This non-reentrant function is sometimes called in interrupt context. */
     local_irq_save(flags);
 
-    t = pre_flush();
+    if ( tlb_clk_enabled )
+        t = pre_flush();
 
     if ( use_invpcid )
         invpcid_flush_all();
@@ -99,7 +103,8 @@ static void do_tlb_flush(void)
     else
         write_cr3(read_cr3());
 
-    post_flush(t);
+    if ( tlb_clk_enabled )
+        post_flush(t);
 
     local_irq_restore(flags);
 }
@@ -107,7 +112,7 @@ static void do_tlb_flush(void)
 void switch_cr3_cr4(unsigned long cr3, unsigned long cr4)
 {
     unsigned long flags, old_cr4;
-    u32 t;
+    u32 t = 0;
 
     /* Throughout this function we make this assumption: */
     ASSERT(!(cr4 & X86_CR4_PCIDE) || !(cr4 & X86_CR4_PGE));
@@ -115,7 +120,8 @@ void switch_cr3_cr4(unsigned long cr3, unsigned long cr4)
     /* This non-reentrant function is sometimes called in interrupt context. */
     local_irq_save(flags);
 
-    t = pre_flush();
+    if ( tlb_clk_enabled )
+        t = pre_flush();
     hvm_flush_guest_tlbs();
 
     old_cr4 = read_cr4();
@@ -168,7 +174,8 @@ void switch_cr3_cr4(unsigned long cr3, unsigned long cr4)
     if ( cr4 & X86_CR4_PCIDE )
         invpcid_flush_all_nonglobals();
 
-    post_flush(t);
+    if ( tlb_clk_enabled )
+        post_flush(t);
 
     local_irq_restore(flags);
 }
diff --git a/xen/include/asm-x86/flushtlb.h b/xen/include/asm-x86/flushtlb.h
index 579dc56803..724455ae0c 100644
--- a/xen/include/asm-x86/flushtlb.h
+++ b/xen/include/asm-x86/flushtlb.h
@@ -21,10 +21,21 @@ extern u32 tlbflush_clock;
 /* Time at which each CPU's TLB was last flushed. */
 DECLARE_PER_CPU(u32, tlbflush_time);
 
-#define tlbflush_current_time() tlbflush_clock
+/* TLB clock is in use. */
+extern bool tlb_clk_enabled;
+
+static inline uint32_t tlbflush_current_time(void)
+{
+    /* Returning 0 from tlbflush_current_time will always force a flush. */
+    return tlb_clk_enabled ? tlbflush_clock : 0;
+}
 
 static inline void page_set_tlbflush_timestamp(struct page_info *page)
 {
+    /* Avoid the write if the TLB clock is disabled. */
+    if ( !tlb_clk_enabled )
+        return;
+
     /*
      * Prevent storing a stale time stamp, which could happen if an update
      * to tlbflush_clock plus a subsequent flush IPI happen between the
@@ -67,6 +78,10 @@ static inline void tlbflush_filter(cpumask_t *mask, uint32_t page_timestamp)
 {
     unsigned int cpu;
 
+    /* Short-circuit: there's no need to iterate if the clock is disabled. */
+    if ( !tlb_clk_enabled )
+        return;
+
     for_each_cpu ( cpu, mask )
         if ( !NEED_FLUSH(per_cpu(tlbflush_time, cpu), page_timestamp) )
             __cpumask_clear_cpu(cpu, mask);
-- 
2.26.0


