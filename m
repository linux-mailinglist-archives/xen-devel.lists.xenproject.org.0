Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B153C49C574
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 09:45:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260718.450704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCdvZ-0001DW-96; Wed, 26 Jan 2022 08:45:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260718.450704; Wed, 26 Jan 2022 08:45:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCdvY-00019c-U2; Wed, 26 Jan 2022 08:45:16 +0000
Received: by outflank-mailman (input) for mailman id 260718;
 Wed, 26 Jan 2022 08:45:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DU/T=SK=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nCdvW-000083-Gg
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 08:45:14 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46d9a977-7e84-11ec-8f75-fffcc8bd4f1a;
 Wed, 26 Jan 2022 09:45:13 +0100 (CET)
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
X-Inumbo-ID: 46d9a977-7e84-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643186713;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nfQ5PrahPjX6kobBhwSJZzObgTQ3kukSc7G1xIJhMMA=;
  b=WyuS+v4MspI/z1RaKS/+W3yeDlyYelc/0ZHiC0JVLyHDcAP+UfSt4UuW
   1xwRI7CcNyNsaUSS7i7UImY0q5DAvpjfSg7vd/1puag3faJzMwml6KM5L
   s4DiEY5egFS6jcpWAWOdDhoqQlXjmOamxFxlAHFJnFatrXgT8PTDcUgk4
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: qfBjII6zSU65fwLijmpQXCMtjFNr8aMBUedraJNDjUXSw1UgL/fWmE+nX5iiCThIi31SZW1PUV
 3ru8ZfI+4Ty2GpvpPjhXiqEZATirT2fAB+BFIkSKamY9o/0SI7kUmFxnlBkLdAy5Y4RXb5D8qA
 jha/UUKZAixcB37fT66DTu1Qjjqm2L73rtcd/g+blQ1HdI15qO8SGhZzd2Fm48YHGRfBA8oJPb
 KbHLAAvSE2j/yNGjQhRWXFRiEucueejyqKOTs7+isaMoLeLVcuGBy5zy6OsmEg7Y8ZhTpYLNTd
 j2tokrooZONBoyXPVRURb4I/
X-SBRS: 5.2
X-MesageID: 63189684
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:AjpwVqyNduWq81o2OOx6t+fjwSrEfRIJ4+MujC+fZmUNrF6WrkVSy
 WMeX2zQafiCMGf0L4wlbYzloB4EvZDVz4M3S1BrqCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500g7wrRn2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt5Nxx
 tlor5Occ184E4blxv0BEBJgPj4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVoru0lINPmI8U0vXZ4wCuCJf0nXYrCU+PB4towMDIY2JsXTaeAN
 5ZxhTxHXhnrUyZNBgwrCbEgzL+Lm0P9S2BCtwfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krk1WnkBhARNPSE1CGItHmrg4fnjS79HY4fCrC83vprm0GIgHweDgUMUlm2quX/jVSxM++zM
 GRNpHBo9/JrshX2EJ+tBHVUvUJooDZfW9RcNvc1xDvV24f/yliAGisPdhNePYlOWNANeRQm0
 VqAntXMDDNpsaGIRX/1yop4vQ9eKgBOczZcOHZsoR8tpoC6/dpt1k6nosNLTfbt5uAZDw0c1
 NxjQMIWo7wIxfAG2Kyglbwsq2L9/8OZJuLZC+i+Y45E0u+bTNL0D2BLwQKChRqlEGp/ZgPQ1
 JTjs5PGhN3i9bnXyESwrBwlRdlFHcqtPjzGmkJIFJI87Tmr8HPLVdkOvGonfxo3bppZKWCBj
 KrvVeV5vs470JyCNvcfXm5MI55ykfiI+SrNC5g4keaikrAuLVTarUmClGab3nz3kVhErE3ME
 czzTCpYNl5DUf4P5GPvH481iOZ3rghjmz+7bc2lnnyPjOrPDFbIGOxtGAbfMYgEAFas/V+9H
 yB3bZXakn2ykYTWP0HqzGLkBQladCdgXcGv9ZU/myzqClMOJVzNwsT5mdsJE7GJVYwM/gsR1
 n3iCEJe1nTlgnjLdVeDZnx5Meu9Vpdjt3MreycrOA/wiXQkZI+u6oYZdoc2IuZ7pLAyk6YsQ
 qlXYdiED9ROVi/Dp2YXY67iodEwbx+snw+PYXaoOWBtY556SgXV0db4ZQ+zpjIWBy+6uJJm8
 b2t3w/WW7QZQAFmAJqEYf6j1Qrp73MchPhzTw3DJdwKIBfg941jKirQiP4rIp5TdUWfl2XCj
 wvPWEUWv+jApYMx4eLlv6Hcotf7CfZ6E2pbA3LfseS8Ox7F8zfx2oRHSuuJI2zQDTum5KW4a
 OxJ5PjgK/lbzk1Suo9xHrs3n6Iz49zj++1Twgh+RSiZal2qDvVrI2Wc3NkJvapIn+cLtQyzU
 0OJ299bJbTWZ5+1TA9PfFIoPraZyPUZujjO9vBkckz16Rh+8KeDTUgPbQKHjzZQLectPY4oq
 Qv7VBX6N+BrZsIWD+u7
IronPort-HdrOrdr: A9a23:wlbnPqhuBlcK9ktLw9wiFGErFHBQXuAji2hC6mlwRA09TySZ//
 rOoB19726NtN9xYgBYpTnuAtjifZqxz/FICMwqTNOftWrdyQ2VxeNZnOnfKlTbckWUnIMw6U
 4jSdkYNDSZNykAsS+Q2mmF+rgbruVviJrY4Nvj8w==
X-IronPort-AV: E=Sophos;i="5.88,317,1635220800"; 
   d="scan'208";a="63189684"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 1/8] x86/msr: Fix migration compatibility issue with MSR_SPEC_CTRL
Date: Wed, 26 Jan 2022 08:44:45 +0000
Message-ID: <20220126084452.28975-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220126084452.28975-1-andrew.cooper3@citrix.com>
References: <20220126084452.28975-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This bug existed in early in 2018 between MSR_SPEC_CTRL arriving in microcode,
and SSBD arriving a few months later.  It went unnoticed presumably because
everyone was busy rebooting everything.

The same bug will reappear when adding PSFD support.

Clamp the guest MSR_SPEC_CTRL value to that permitted by CPUID on migrate.
The guest is already playing with reserved bits at this point, and clamping
the value will prevent a migration to a less capable host from failing.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/hvm/hvm.c         | 25 +++++++++++++++++++++++--
 xen/arch/x86/include/asm/msr.h |  2 ++
 xen/arch/x86/msr.c             | 33 +++++++++++++++++++++------------
 3 files changed, 46 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index d7d3299b431e..c4ddb8607d9c 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1340,6 +1340,7 @@ static const uint32_t msrs_to_send[] = {
 
 static int hvm_save_cpu_msrs(struct vcpu *v, hvm_domain_context_t *h)
 {
+    const struct domain *d = v->domain;
     struct hvm_save_descriptor *desc = _p(&h->data[h->cur]);
     struct hvm_msr *ctxt;
     unsigned int i;
@@ -1355,7 +1356,8 @@ static int hvm_save_cpu_msrs(struct vcpu *v, hvm_domain_context_t *h)
     for ( i = 0; i < ARRAY_SIZE(msrs_to_send); ++i )
     {
         uint64_t val;
-        int rc = guest_rdmsr(v, msrs_to_send[i], &val);
+        unsigned int msr = msrs_to_send[i];
+        int rc = guest_rdmsr(v, msr, &val);
 
         /*
          * It is the programmers responsibility to ensure that
@@ -1375,7 +1377,26 @@ static int hvm_save_cpu_msrs(struct vcpu *v, hvm_domain_context_t *h)
         if ( !val )
             continue; /* Skip empty MSRs. */
 
-        ctxt->msr[ctxt->count].index = msrs_to_send[i];
+        /*
+         * Guests are given full access to certain MSRs for performance
+         * reasons.  A consequence is that Xen is unable to enforce that all
+         * bits disallowed by the CPUID policy yield #GP, and an enterprising
+         * guest may be able to set and use a bit it ought to leave alone.
+         *
+         * When migrating from a more capable host to a less capable one, such
+         * bits may be rejected by the destination, and the migration failed.
+         *
+         * Discard such bits here on the source side.  Such bits have reserved
+         * behaviour, and the guest has only itself to blame.
+         */
+        switch ( msr )
+        {
+        case MSR_SPEC_CTRL:
+            val &= msr_spec_ctrl_valid_bits(d->arch.cpuid);
+            break;
+        }
+
+        ctxt->msr[ctxt->count].index = msr;
         ctxt->msr[ctxt->count++].val = val;
     }
 
diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
index 10039c2d227b..657a3295613d 100644
--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -277,6 +277,8 @@ static inline void wrmsr_tsc_aux(uint32_t val)
     }
 }
 
+uint64_t msr_spec_ctrl_valid_bits(const struct cpuid_policy *cp);
+
 extern struct msr_policy     raw_msr_policy,
                             host_msr_policy,
                           pv_max_msr_policy,
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 2cc355575d45..5e80c8b47c21 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -435,6 +435,24 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
     return X86EMUL_EXCEPTION;
 }
 
+/*
+ * Caller to confirm that MSR_SPEC_CTRL is available.  Intel and AMD have
+ * separate CPUID features for this functionality, but only set will be
+ * active.
+ */
+uint64_t msr_spec_ctrl_valid_bits(const struct cpuid_policy *cp)
+{
+    bool ssbd = cp->feat.ssbd;
+
+    /*
+     * Note: SPEC_CTRL_STIBP is specified as safe to use (i.e. ignored)
+     * when STIBP isn't enumerated in hardware.
+     */
+    return (SPEC_CTRL_IBRS | SPEC_CTRL_STIBP |
+            (ssbd       ? SPEC_CTRL_SSBD       : 0) |
+            0);
+}
+
 int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
 {
     const struct vcpu *curr = current;
@@ -508,18 +526,9 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
         break;
 
     case MSR_SPEC_CTRL:
-        if ( !cp->feat.ibrsb )
-            goto gp_fault; /* MSR available? */
-
-        /*
-         * Note: SPEC_CTRL_STIBP is specified as safe to use (i.e. ignored)
-         * when STIBP isn't enumerated in hardware.
-         */
-        rsvd = ~(SPEC_CTRL_IBRS | SPEC_CTRL_STIBP |
-                 (cp->feat.ssbd ? SPEC_CTRL_SSBD : 0));
-
-        if ( val & rsvd )
-            goto gp_fault; /* Rsvd bit set? */
+        if ( !cp->feat.ibrsb ||
+             (val & ~msr_spec_ctrl_valid_bits(cp)) )
+            goto gp_fault;
         goto set_reg;
 
     case MSR_PRED_CMD:
-- 
2.11.0


