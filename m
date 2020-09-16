Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 858AF26C1E7
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 12:55:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIV5C-0006rH-Pw; Wed, 16 Sep 2020 10:54:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9sPA=CZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kIV5B-0006rC-Ts
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 10:54:37 +0000
X-Inumbo-ID: 3746d25e-03d2-4081-8d84-f68cec1477aa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3746d25e-03d2-4081-8d84-f68cec1477aa;
 Wed, 16 Sep 2020 10:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600253676;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RMfWKT9lYkm1p1DA54rgIHO+AQae7J9Xe1s++NSB7YA=;
 b=PeJnTVpY5glydsDcSKAWzYmH3/2YvmwoMJUevN2NCbceFtei4kXQ07d3
 Vv1kcOiqacRhqNUnAGslkRXEsWzO1ZrhIIo247GSPSXIymcACmqFJhp40
 USDpbKscyrdwXOnu7g4lBo9GqazJUAXFekmYGgya5mkYkyXX4BpqGeHeZ U=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: X5SA/GiwkcbM8TXSAotrurHlH5YSYG8xn+Sgw3kzIMWml/j9Rl+ptjeQHXVuAZf0HjPjGfoRcx
 whZGiWC2j3LamFiRwewh1X9ibfyFd5IlYcaScH1Jnbp+H1eUVYKQyp2dSyOSUhkSl7y70qkH0M
 kPf9krqi/3DmU50iYcCHui4McKEHLhCASHdSwSY42RyoQlXliADo9szD1tN4rlSpzFIEs+/E2b
 FVqN2GrgU5R2H8X2/oIH6cyTMczsIRtH3Ed54xZS80tjoEeDmUR6lkWUoO3z7xf+2+NpvKAvfv
 44U=
X-SBRS: 2.7
X-MesageID: 27794912
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,432,1592884800"; d="scan'208";a="27794912"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/svm: ignore accesses to EX_CFG
Date: Wed, 16 Sep 2020 12:54:26 +0200
Message-ID: <20200916105426.6663-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
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

Windows 10 will try to unconditionally read EX_CFG on AMD hadrware,
and injecting a #GP fault will result in a panic:

svm.c:1964:d5v0 RDMSR 0xc001102c unimplemented
d5v0 VIRIDIAN CRASH: 7e ffffffffc0000096 fffff8054cbe5ffe fffffa0837a066e8 fffffa0837a05f30

Return 0 when trying to read the MSR and drop writes.

Fixes: 84e848fd7a16 ('x86/hvm: disallow access to unknown MSRs')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/svm/svm.c      | 2 ++
 xen/include/asm-x86/msr-index.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 136445972e..5037c0fe7d 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1942,6 +1942,7 @@ static int svm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
     case MSR_K8_TOP_MEM1:
     case MSR_K8_TOP_MEM2:
     case MSR_K8_VM_CR:
+    case MSR_AMD64_EX_CFG:
         *msr_content = 0;
         break;
 
@@ -2108,6 +2109,7 @@ static int svm_msr_write_intercept(unsigned int msr, uint64_t msr_content)
     case MSR_K8_TOP_MEM2:
     case MSR_K8_SYSCFG:
     case MSR_K8_VM_CR:
+    case MSR_AMD64_EX_CFG:
         /* ignore write. handle all bits as read-only. */
         break;
 
diff --git a/xen/include/asm-x86/msr-index.h b/xen/include/asm-x86/msr-index.h
index 4fd54fb5c9..c433eeba92 100644
--- a/xen/include/asm-x86/msr-index.h
+++ b/xen/include/asm-x86/msr-index.h
@@ -330,6 +330,7 @@
 #define MSR_AMD64_DC_CFG		0xc0011022
 #define MSR_AMD64_DE_CFG		0xc0011029
 #define AMD64_DE_CFG_LFENCE_SERIALISE	(_AC(1, ULL) << 1)
+#define MSR_AMD64_EX_CFG                0xc001102c
 
 #define MSR_AMD64_DR0_ADDRESS_MASK	0xc0011027
 #define MSR_AMD64_DR1_ADDRESS_MASK	0xc0011019
-- 
2.28.0


