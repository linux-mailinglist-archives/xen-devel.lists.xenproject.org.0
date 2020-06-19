Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D813200840
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 13:59:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmFfR-0000FN-6J; Fri, 19 Jun 2020 11:58:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ezQq=AA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jmFfP-0000FH-Uj
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 11:58:43 +0000
X-Inumbo-ID: 3832a7ee-b224-11ea-bb6a-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3832a7ee-b224-11ea-bb6a-12813bfff9fa;
 Fri, 19 Jun 2020 11:58:42 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: +7J+OWjJIU6EWdeeKMTmt2zgYYGTKWDh1shP6ZC4kaGrNIXQmNgXkAjujPijnbwymFREVfVaDY
 7CJftRgY1wZLte4b5J+iS5NrDqAab6FM37RFRqjCtbJ/ehVfCpFP8GQMZPWjQ8LX9rd/iEU9Gs
 Pd5kQGRaApOgoBJYud9p4wiWQVFiVzViCu4MBSD9G+tqwJ9OmgSt/Nf+WSxKwQyHbyY3rvK0uC
 gdfZQui4uSwfnlXXqlouywsZXGmoA5YpMxwWzN5Vg73NTeB9a/0C5ygm4Ydv/wVzyJN0n6hs/B
 GpY=
X-SBRS: 2.7
X-MesageID: 20687932
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,255,1589256000"; d="scan'208";a="20687932"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH for-4.14] x86/msr: Disallow access to Processor Trace MSRs
Date: Fri, 19 Jun 2020 12:58:23 +0100
Message-ID: <20200619115823.22243-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
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
Cc: Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

We do not expose the feature to guests, so should disallow access to the
respective MSRs.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Paul Durrant <paul@xen.org>
CC: Michał Leszczyński <michal.leszczynski@cert.pl>

Paul: For 4.14.  This needs backporting to older trees as well.

Michał: CC'ing, just to keep you in the loop.  Xen has some dubious default
MSR semantics which we're still in the middle of untangling in a backwards
compatible way.  Patches like this will eventually not be necessary, but they
are for now.
---
 xen/arch/x86/msr.c              | 12 ++++++++++++
 xen/include/asm-x86/msr-index.h |  8 ++++++++
 2 files changed, 20 insertions(+)

diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 0bfb5839b2..05afe601a8 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -168,6 +168,12 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
     case MSR_TSX_FORCE_ABORT:
     case MSR_TSX_CTRL:
     case MSR_MCU_OPT_CTRL:
+    case MSR_RTIT_OUTPUT_BASE:
+    case MSR_RTIT_OUTPUT_MASK:
+    case MSR_RTIT_CTL:
+    case MSR_RTIT_STATUS:
+    case MSR_RTIT_CR3_MATCH:
+    case MSR_RTIT_ADDR_A(0) ... MSR_RTIT_ADDR_B(3):
     case MSR_U_CET:
     case MSR_S_CET:
     case MSR_PL0_SSP ... MSR_INTERRUPT_SSP_TABLE:
@@ -329,6 +335,12 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
     case MSR_TSX_FORCE_ABORT:
     case MSR_TSX_CTRL:
     case MSR_MCU_OPT_CTRL:
+    case MSR_RTIT_OUTPUT_BASE:
+    case MSR_RTIT_OUTPUT_MASK:
+    case MSR_RTIT_CTL:
+    case MSR_RTIT_STATUS:
+    case MSR_RTIT_CR3_MATCH:
+    case MSR_RTIT_ADDR_A(0) ... MSR_RTIT_ADDR_B(3):
     case MSR_U_CET:
     case MSR_S_CET:
     case MSR_PL0_SSP ... MSR_INTERRUPT_SSP_TABLE:
diff --git a/xen/include/asm-x86/msr-index.h b/xen/include/asm-x86/msr-index.h
index b328a47ed8..0fe98af923 100644
--- a/xen/include/asm-x86/msr-index.h
+++ b/xen/include/asm-x86/msr-index.h
@@ -69,6 +69,14 @@
 #define MSR_MCU_OPT_CTRL                    0x00000123
 #define  MCU_OPT_CTRL_RNGDS_MITG_DIS        (_AC(1, ULL) <<  0)
 
+#define MSR_RTIT_OUTPUT_BASE                0x00000560
+#define MSR_RTIT_OUTPUT_MASK                0x00000561
+#define MSR_RTIT_CTL                        0x00000570
+#define MSR_RTIT_STATUS                     0x00000571
+#define MSR_RTIT_CR3_MATCH                  0x00000572
+#define MSR_RTIT_ADDR_A(n)                 (0x00000580 + (n) * 2)
+#define MSR_RTIT_ADDR_B(n)                 (0x00000581 + (n) * 2)
+
 #define MSR_U_CET                           0x000006a0
 #define MSR_S_CET                           0x000006a2
 #define  CET_SHSTK_EN                       (_AC(1, ULL) <<  0)
-- 
2.11.0


