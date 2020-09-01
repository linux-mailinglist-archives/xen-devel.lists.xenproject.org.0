Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 257E7258D38
	for <lists+xen-devel@lfdr.de>; Tue,  1 Sep 2020 13:10:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kD4BP-0000VI-Sb; Tue, 01 Sep 2020 11:10:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M6GQ=CK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kD4BO-0000VB-Iy
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2020 11:10:34 +0000
X-Inumbo-ID: adbb51d7-8ec0-490f-8834-f660d8271a81
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id adbb51d7-8ec0-490f-8834-f660d8271a81;
 Tue, 01 Sep 2020 11:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598958633;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zT5MN7nvkqMoYuX6+gGl+F2zxCCkKoFt0fQb/G0S9wE=;
 b=BxdtPEC/ukYZFnN/oZyNzdmxe4yOJKc/Csn4rrzEB9O6LyODkLM5Huu6
 illgiJqhu4JjsmdNr3b0w00SSbbFEDGRfpz02eD/ikuCTthLv0fB++B5N
 9P7REpaaxHa2Kv+176mRedcFbGYP4aGppHbNjlHM+sNZqUg8xboHLyyTD w=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: KSWzbafNK/H9Yl9E/Tm0GcMmepaueJn0xpVzrAvruUE6tx8TzmZefARzWNaUnowgMpScoMvyoV
 NYopEIHELntHKSZuKOLiIfQ+L+jFPwWW/VlDehF2+5dCF9JLNJij7lZldA276xeA9fxPIYjvq2
 oADihqaAIowqptpI0Bgq5NdF6u8EK1qbiawwi9A7gcK2KIEl3FeBtL7Dj++Rzl6lkC5erB6QuB
 WMW05uwDXvqGkhQLCXd/M89+pCdE9DYYoBlgkG3NNFDVpWZ0lIoJqP0SSRTOs3niHYcAU27LgV
 UqM=
X-SBRS: 2.7
X-MesageID: 26058623
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,378,1592884800"; d="scan'208";a="26058623"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jun Nakajima
 <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Jan Beulich
 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu
 <wl@xen.org>
Subject: [PATCH v3 1/8] x86/vmx: handle writes to MISC_ENABLE MSR
Date: Tue, 1 Sep 2020 12:54:38 +0200
Message-ID: <20200901105445.22277-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200901105445.22277-1-roger.pau@citrix.com>
References: <20200901105445.22277-1-roger.pau@citrix.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Such handling consist in checking that no bits have been changed from
the read value, if that's the case silently drop the write, otherwise
inject a fault.

At least Windows guests will expect to write to the MISC_ENABLE MSR
with the same value that's been read from it.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
 xen/arch/x86/hvm/vmx/vmx.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index a0d58ffbe2..4717e50d4a 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3163,7 +3163,7 @@ static int vmx_msr_write_intercept(unsigned int msr, uint64_t msr_content)
 
     switch ( msr )
     {
-        uint64_t rsvd;
+        uint64_t rsvd, tmp;
 
     case MSR_IA32_SYSENTER_CS:
         __vmwrite(GUEST_SYSENTER_CS, msr_content);
@@ -3301,6 +3301,13 @@ static int vmx_msr_write_intercept(unsigned int msr, uint64_t msr_content)
         /* None of these MSRs are writeable. */
         goto gp_fault;
 
+    case MSR_IA32_MISC_ENABLE:
+        /* Silently drop writes that don't change the reported value. */
+        if ( vmx_msr_read_intercept(msr, &tmp) != X86EMUL_OKAY ||
+             tmp != msr_content )
+            goto gp_fault;
+        break;
+
     case MSR_P6_PERFCTR(0)...MSR_P6_PERFCTR(7):
     case MSR_P6_EVNTSEL(0)...MSR_P6_EVNTSEL(7):
     case MSR_CORE_PERF_FIXED_CTR0...MSR_CORE_PERF_FIXED_CTR2:
-- 
2.28.0


