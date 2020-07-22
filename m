Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDCE2295DB
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jul 2020 12:18:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyBpZ-0002Am-V8; Wed, 22 Jul 2020 10:18:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dvI5=BB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jyBpY-0002Ah-AO
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2020 10:18:32 +0000
X-Inumbo-ID: b0df24ac-cc04-11ea-8624-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b0df24ac-cc04-11ea-8624-bc764e2007e4;
 Wed, 22 Jul 2020 10:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595413111;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Lb9jIpjmcOCTg3+LJ4DI+MzgIAmtiRCi98XCw3Lkdbg=;
 b=BIAoTc7BtemA2RbZ8PpnKJnW18TLCy9kacFeWkyy2Lz7UG03cqi3x8Q9
 ZPFkC6qcBB8C4/JGFKbVCXvXzLFwLaoG/yJPFsQf0vWyNPPDa38WizBbB
 7aFHDhVV6TGQI0G8Kap04Ckr6lQ3Y6MMQQlYRssaFRXQnXb8M+rUODPYV 8=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 0uIXKQLE8Q5nGHnzSjLwJGGdDIEwujHwChbQK748QFkbxa/EBkT9POv3cMXta191qg4gQRFjmQ
 49PzZEsqle76O8ebdfRW9PBqv/fP3lvB4TBv/Lyw/nsuR0GT2YZNzxEgoSzCPWgOlso0SYwyF9
 9bu1/ELyvcAXffS7hmbE0oIjwt/GBaKuBVmkmMK+n3gi9CjcjAnTPhpGXl0NVHanFAV3cjcjGn
 mF/w5V1SHp/7OjX+M1s+jZl5Z1hokw+wfMhMiVAoZ0FT/Y8ZNS5nHqn0u0EnhdiJUNz4CxON8I
 8oI=
X-SBRS: 2.7
X-MesageID: 23258370
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,381,1589256000"; d="scan'208";a="23258370"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/vmce: Dispatch vmce_{rd,wr}msr() from guest_{rd,wr}msr()
Date: Wed, 22 Jul 2020 11:18:09 +0100
Message-ID: <20200722101809.8389-1-andrew.cooper3@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

... rather than from the default clauses of the PV and HVM MSR handlers.

This means that we no longer take the vmce lock for any unknown MSR, and
accesses to architectural MCE banks outside of the subset implemented for the
guest no longer fall further through the unknown MSR path.

With the vmce calls removed, the hvm alternative_call()'s expression can be
simplified substantially.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/hvm.c         | 16 ++--------------
 xen/arch/x86/msr.c             | 16 ++++++++++++++++
 xen/arch/x86/pv/emul-priv-op.c | 15 ---------------
 3 files changed, 18 insertions(+), 29 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 5bb47583b3..a9d1685549 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -3560,13 +3560,7 @@ int hvm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
          break;
 
     default:
-        if ( (ret = vmce_rdmsr(msr, msr_content)) < 0 )
-            goto gp_fault;
-        /* If ret == 0 then this is not an MCE MSR, see other MSRs. */
-        ret = ((ret == 0)
-               ? alternative_call(hvm_funcs.msr_read_intercept,
-                                  msr, msr_content)
-               : X86EMUL_OKAY);
+        ret = alternative_call(hvm_funcs.msr_read_intercept, msr, msr_content);
         break;
     }
 
@@ -3696,13 +3690,7 @@ int hvm_msr_write_intercept(unsigned int msr, uint64_t msr_content,
         break;
 
     default:
-        if ( (ret = vmce_wrmsr(msr, msr_content)) < 0 )
-            goto gp_fault;
-        /* If ret == 0 then this is not an MCE MSR, see other MSRs. */
-        ret = ((ret == 0)
-               ? alternative_call(hvm_funcs.msr_write_intercept,
-                                  msr, msr_content)
-               : X86EMUL_OKAY);
+        ret = alternative_call(hvm_funcs.msr_write_intercept, msr, msr_content);
         break;
     }
 
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 22f921cc71..ca4307e19f 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -227,6 +227,14 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
         *val = msrs->misc_features_enables.raw;
         break;
 
+    case MSR_IA32_MCG_CAP     ... MSR_IA32_MCG_CTL:      /* 0x179 -> 0x17b */
+    case MSR_IA32_MCx_CTL2(0) ... MSR_IA32_MCx_CTL2(31): /* 0x280 -> 0x29f */
+    case MSR_IA32_MCx_CTL(0)  ... MSR_IA32_MCx_MISC(31): /* 0x400 -> 0x47f */
+    case MSR_IA32_MCG_EXT_CTL:                           /* 0x4d0 */
+        if ( vmce_rdmsr(msr, val) < 0 )
+            goto gp_fault;
+        break;
+
     case MSR_X2APIC_FIRST ... MSR_X2APIC_LAST:
         if ( !is_hvm_domain(d) || v != curr )
             goto gp_fault;
@@ -436,6 +444,14 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
         break;
     }
 
+    case MSR_IA32_MCG_CAP     ... MSR_IA32_MCG_CTL:      /* 0x179 -> 0x17b */
+    case MSR_IA32_MCx_CTL2(0) ... MSR_IA32_MCx_CTL2(31): /* 0x280 -> 0x29f */
+    case MSR_IA32_MCx_CTL(0)  ... MSR_IA32_MCx_MISC(31): /* 0x400 -> 0x47f */
+    case MSR_IA32_MCG_EXT_CTL:                           /* 0x4d0 */
+        if ( vmce_wrmsr(msr, val) < 0 )
+            goto gp_fault;
+        break;
+
     case MSR_X2APIC_FIRST ... MSR_X2APIC_LAST:
         if ( !is_hvm_domain(d) || v != curr )
             goto gp_fault;
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index 254da2b849..f14552cb4b 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -855,8 +855,6 @@ static int read_msr(unsigned int reg, uint64_t *val,
 
     switch ( reg )
     {
-        int rc;
-
     case MSR_FS_BASE:
         if ( is_pv_32bit_domain(currd) )
             break;
@@ -955,12 +953,6 @@ static int read_msr(unsigned int reg, uint64_t *val,
         }
         /* fall through */
     default:
-        rc = vmce_rdmsr(reg, val);
-        if ( rc < 0 )
-            break;
-        if ( rc )
-            return X86EMUL_OKAY;
-        /* fall through */
     normal:
         /* Everyone can read the MSR space. */
         /* gdprintk(XENLOG_WARNING, "Domain attempted RDMSR %08x\n", reg); */
@@ -991,7 +983,6 @@ static int write_msr(unsigned int reg, uint64_t val,
     switch ( reg )
     {
         uint64_t temp;
-        int rc;
 
     case MSR_FS_BASE:
         if ( is_pv_32bit_domain(currd) || !is_canonical_address(val) )
@@ -1122,12 +1113,6 @@ static int write_msr(unsigned int reg, uint64_t val,
         }
         /* fall through */
     default:
-        rc = vmce_wrmsr(reg, val);
-        if ( rc < 0 )
-            break;
-        if ( rc )
-            return X86EMUL_OKAY;
-
         if ( (rdmsr_safe(reg, temp) != 0) || (val != temp) )
     invalid:
             gdprintk(XENLOG_WARNING,
-- 
2.11.0


