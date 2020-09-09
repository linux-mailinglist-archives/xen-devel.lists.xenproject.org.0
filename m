Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FF1262CC1
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 12:00:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFwtZ-0000dA-G7; Wed, 09 Sep 2020 10:00:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wApk=CS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kFwtY-0008SC-Rf
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 10:00:04 +0000
X-Inumbo-ID: 149b5651-32bd-4ba6-bbe8-03755a7a14bf
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 149b5651-32bd-4ba6-bbe8-03755a7a14bf;
 Wed, 09 Sep 2020 09:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599645595;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lCMV0PvdXBd3HTuG95XLebEgJ53XkP2CFAQSYnTyhfA=;
 b=OEQTHF73pd+nx5JS+RSP4xmt9Ri4SIPXedxgR/pEYTxbwI0TDAW9LrGZ
 hQymwqUjzx4cU7/cbmWXNOKTb6V8o1CUGRLj2+nXCuuFyGvrSLniJqpi0
 vHpQNmDuWf5AFS5m2xK3jCoWh6zxdWFvv37YjMXgNgRBd9KJFMQRmvKNe s=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 7c1BjMqo8NZ9qb7F9SfIcsEkSSXoK1Ed+KN2abVpCNLamm/kzz8iagBzbJ4M72WnZS4EYHdyic
 nOQK43ZYOYmSzGxG2rWTYP/OgnMZIRmHMJhLs3W/FcjKMQYh9kBDXbyxqdR/n6cVlJBOQDqixk
 A/xeTrAxn6hZmaQKtxLt5Lxq36AjNEdqV7fNICPrlNNcc1to1rTFXZeKB/s42qnIB+fLexW0+3
 aaVNQ1+cJVa9Av7vMs2f1oeHNbsyHkTLx5eZMFjjzvzUZBoPyh261R7eOeqgfETj4LFaAAovNt
 O+s=
X-SBRS: 2.7
X-MesageID: 26611492
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,409,1592884800"; d="scan'208";a="26611492"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 5/5] x86/pv: Simplify emulation for the 64bit base MSRs
Date: Wed, 9 Sep 2020 10:59:20 +0100
Message-ID: <20200909095920.25495-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200909095920.25495-1-andrew.cooper3@citrix.com>
References: <20200909095920.25495-1-andrew.cooper3@citrix.com>
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

is_pv_32bit_domain() is an expensive predicate, but isn't used for speculative
safety in this case.  Swap to checking the Long Mode bit in the CPUID policy,
which is the architecturally correct behaviour.

is_canonical_address() isn't a trivial predicate, but it will become more
complicated when 5-level support is added.  Rearrange write_msr() to collapse
the common checks.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

For reference, the diff is:

  add/remove: 0/0 grow/shrink: 0/2 up/down: 0/-152 (-152)
  Function                                     old     new   delta
  read_msr                                    1075    1030     -45
  write_msr                                   1537    1430    -107

but this isn't the point of the change.
---
 xen/arch/x86/pv/emul-priv-op.c | 34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index 9dd1d59423..0fd95fe9fa 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -848,6 +848,7 @@ static int read_msr(unsigned int reg, uint64_t *val,
 {
     struct vcpu *curr = current;
     const struct domain *currd = curr->domain;
+    const struct cpuid_policy *cp = currd->arch.cpuid;
     bool vpmu_msr = false;
     int ret;
 
@@ -869,19 +870,19 @@ static int read_msr(unsigned int reg, uint64_t *val,
         return X86EMUL_OKAY;
 
     case MSR_FS_BASE:
-        if ( is_pv_32bit_domain(currd) )
+        if ( !cp->extd.lm )
             break;
         *val = read_fs_base();
         return X86EMUL_OKAY;
 
     case MSR_GS_BASE:
-        if ( is_pv_32bit_domain(currd) )
+        if ( !cp->extd.lm )
             break;
         *val = read_gs_base();
         return X86EMUL_OKAY;
 
     case MSR_SHADOW_GS_BASE:
-        if ( is_pv_32bit_domain(currd) )
+        if ( !cp->extd.lm )
             break;
         *val = curr->arch.pv.gs_base_user;
         return X86EMUL_OKAY;
@@ -975,6 +976,7 @@ static int write_msr(unsigned int reg, uint64_t val,
 {
     struct vcpu *curr = current;
     const struct domain *currd = curr->domain;
+    const struct cpuid_policy *cp = currd->arch.cpuid;
     bool vpmu_msr = false;
     int ret;
 
@@ -991,22 +993,22 @@ static int write_msr(unsigned int reg, uint64_t val,
         uint64_t temp;
 
     case MSR_FS_BASE:
-        if ( is_pv_32bit_domain(currd) || !is_canonical_address(val) )
-            break;
-        write_fs_base(val);
-        return X86EMUL_OKAY;
-
     case MSR_GS_BASE:
-        if ( is_pv_32bit_domain(currd) || !is_canonical_address(val) )
-            break;
-        write_gs_base(val);
-        return X86EMUL_OKAY;
-
     case MSR_SHADOW_GS_BASE:
-        if ( is_pv_32bit_domain(currd) || !is_canonical_address(val) )
+        if ( !cp->extd.lm || !is_canonical_address(val) )
             break;
-        write_gs_shadow(val);
-        curr->arch.pv.gs_base_user = val;
+
+        if ( reg == MSR_FS_BASE )
+            write_fs_base(val);
+        else if ( reg == MSR_GS_BASE )
+            write_gs_base(val);
+        else if ( reg == MSR_SHADOW_GS_BASE )
+        {
+            write_gs_shadow(val);
+            curr->arch.pv.gs_base_user = val;
+        }
+        else
+            ASSERT_UNREACHABLE();
         return X86EMUL_OKAY;
 
     case MSR_EFER:
-- 
2.11.0


