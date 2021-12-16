Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83236476E56
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 10:54:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247795.427321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxnTK-0005T7-PN; Thu, 16 Dec 2021 09:54:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247795.427321; Thu, 16 Dec 2021 09:54:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxnTK-0005Q2-Hi; Thu, 16 Dec 2021 09:54:46 +0000
Received: by outflank-mailman (input) for mailman id 247795;
 Thu, 16 Dec 2021 09:54:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VCpR=RB=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mxnTI-0004jJ-Ow
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 09:54:44 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30615369-5e56-11ec-9e60-abaf8a552007;
 Thu, 16 Dec 2021 10:54:42 +0100 (CET)
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
X-Inumbo-ID: 30615369-5e56-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639648482;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ae8VnZhKfVIJXZyU4tX0YidXELQ0uGAsP7dO6F/9lBo=;
  b=ijAJlpjXbJ6A7qyX8POIlR/cZ/8+QcaBB/EP2dc3AgeMImOpR4IbdF4v
   T3h3+r9ces6pBttqOXOC2TJOOBISF2OiM9CJovFpFf0BV/fnkcJRer6As
   8rtfhSEPg1iMkQt395DS9H/TZ3JfiCJ6F5xFKUiRE6CMBKprGiMTYWcWc
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: oPSgKXn5gvwA0PjAUBXdp0/z7/udOEeedCojYGqvBNersRBRCzF/GrQCIKlFmt6v5PSBeZpeJm
 oB2toC1NqD5jSrTr+EKvWiIXfUF/7wEKU/RKdmXIWsTV92VSVwH0sNWYnyDFMA4CuxBCZM3+xe
 ip0h7lMBp8RQnqWtVcxBh7Mrel9cqfGLh9cVnzFhetGcE0XmsVxosiQAm+t6+nIZY4hiPgdRtV
 6rEyomDVby5JgxMU8o1w8ps2eUITmS/lMNtrIcpzHA7YHtqLH6tKs2aQ2tBtaRf12AdQD1ec9i
 m9Zz6DhT8955rELdOOWwwyCD
X-SBRS: 5.1
X-MesageID: 60560087
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:OOyyaqgUSL58IBPJ6KUMh5hvX161rRcKZh0ujC45NGQN5FlHY01je
 htvWjjXa/7YZTPyfYglOtiyp04E7JHUnNM2SFY4rHswEC4b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0GE/NtTo5w7Rg29Qx34Dja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /13qrCZDhtwYZHHv+4FWQt/SA0lGfBvreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHCOo8Ft24m5jbeFfs8GrjIQrnQ5M8e1zA17ixLNaiGO
 pRBMWowBPjGSzBlfWUYU6sepb6tnkDRYzRp60mfnINitgA/yyQuieOwYbI5YOeiWsF9jkue4
 GXc8AzRIDsXKdiewjqt6W+3i6nEmiaTcJIfEvi0++BnhHWXx3cPE1sGWF2ju/67h0WiHdVFJ
 CQpFjEG9PZoshbxF5+kAkP+8CXsUgMgt8R4KfIWwUaRk/Xo6CGTHmIWaWVtM/h7nZpjLdA17
 WOhk9TsDD1plbSaT3OB67uZxQ+P1TgpwXwqPnFdE1ZcizX3iMRq10+UEI4/eEKgpoStQWmY/
 tyckMQpa1z/Z+Yv3r7zw13IiinESnPhHl9svVW/so5IA2pEiG+Zi26AtQizARVodt/xory9U
 J4swZL2AAcmV87lqcB1aL9RdIxFHt7cWNEmvXZhHoM66xOm8GO5cIZb7VlWfRkyY5tVImC5P
 RWL4mu9AaO/2lPwN8ebhKrrVKwXIVXIT4y5Bpg4kPIQCnSOSON31H43PhPBt4wcuEMtjbs+K
 f+mnTWEVh4n5VBc5GPuHY81iOZzrghnnD+7bc2rnnyPjOvFDFbIGOhtDbd7Rr1ghE9yiF6Oq
 Ig32grj40g3bdASlQGLq9NOdg5TciBgbX00wuQOHtO+zsNdMDlJI5fsLXkJIeSJRoxZybXF+
 G+TQEhdxAatjHHLM1zSOHtidKnuTdB0qndiZX4gOlOh2n4CZ4ez7fhAK8trLOd/rOEzn+RpS
 /QletmbBqgdQDrw5DlAP4L2q5ZvdUr3iFvWbTalejU2Y7VpWxfNpo3/ZgLq+SRXVni3uMIyr
 qeOzATeRZZfFQ1uANyPMKCkzk+rvGhbk+V3BhOaLt5WcUTq0Y5rNy2u0aNnf5BScU3On2LI2
 RyXDBEUofj2j7U0qNSZ17qZq4qJEvdlGhYIFWfs8rvrZzLR+XCuwNEcXb/QLyzdTm795I6re
 f5Rk6PnKPQCkVtH79h8HrJswf5s7tfjveYHnAFtHXGNZFW3ELJwZHKB2JAX5KFKw7ZYvyqwW
 16OpYYGaenYZpu9HQ5DPhchY8SCyeoQy2vb4vkCKUnn4DN6oeicWkJIMhjQ0CFQIdOZ6m/+L
 TvNbCLO1zGCtw==
IronPort-HdrOrdr: A9a23:N1IwCauPSf2HguweFz2Ts00i7skDRtV00zEX/kB9WHVpm5Sj5q
 STdYcgpHjJYVcqKQodcL+7Scu9qB/nmqKdgrNhR4tKPjOW3VdARbsKheCJrlHd8kbFl9K1oJ
 0QEJSWf+eRMbEVt6jHCUKDYrAdKZG8gdmVbcy39QYUcT1X
X-IronPort-AV: E=Sophos;i="5.88,211,1635220800"; 
   d="scan'208";a="60560087"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 6/6] x86/hvm: Support PKS
Date: Thu, 16 Dec 2021 09:54:21 +0000
Message-ID: <20211216095421.12871-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211216095421.12871-1-andrew.cooper3@citrix.com>
References: <20211216095421.12871-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

With all infrastructure in place, advertise the PKS CPUID bit to guests, and
let them set CR4.PKS.

Experiment with a tweak to the layout of hvm_cr4_guest_valid_bits() so future
additions will be just a single added line.

The current context switching behaviour is tied to how VT-x works, so leave a
safety check in the short term.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/cpuid.c                        | 9 +++++++++
 xen/arch/x86/hvm/hvm.c                      | 4 +++-
 xen/include/public/arch-x86/cpufeatureset.h | 2 +-
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 151944f65702..03653d3766f4 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -512,6 +512,15 @@ static void __init calculate_hvm_max_policy(void)
             __clear_bit(X86_FEATURE_XSAVES, hvm_featureset);
     }
 
+    /*
+     * Xen doesn't use PKS, so the guest support for it has opted to not use
+     * the VMCS load/save controls for efficiency reasons.  This depends on
+     * the exact vmentry/exit behaviour, so don't expose PKS in other
+     * situations until someone has cross-checked the behaviour for safety.
+     */
+    if ( !cpu_has_vmx )
+        __clear_bit(X86_FEATURE_PKS, hvm_featureset);
+
     guest_common_feature_adjustments(hvm_featureset);
 
     sanitise_featureset(hvm_featureset);
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index e75245f36dce..2552e7f45499 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1010,7 +1010,9 @@ unsigned long hvm_cr4_guest_valid_bits(const struct domain *d)
             (p->feat.smep     ? X86_CR4_SMEP              : 0) |
             (p->feat.smap     ? X86_CR4_SMAP              : 0) |
             (p->feat.pku      ? X86_CR4_PKE               : 0) |
-            (cet              ? X86_CR4_CET               : 0));
+            (cet              ? X86_CR4_CET               : 0) |
+            (p->feat.pks      ? X86_CR4_PKS               : 0) |
+            0);
 }
 
 static int hvm_load_cpu_ctxt(struct domain *d, hvm_domain_context_t *h)
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 79a8f244d88a..92ec9eed3fd1 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -244,7 +244,7 @@ XEN_CPUFEATURE(CLDEMOTE,      6*32+25) /*A  CLDEMOTE instruction */
 XEN_CPUFEATURE(MOVDIRI,       6*32+27) /*a  MOVDIRI instruction */
 XEN_CPUFEATURE(MOVDIR64B,     6*32+28) /*a  MOVDIR64B instruction */
 XEN_CPUFEATURE(ENQCMD,        6*32+29) /*   ENQCMD{,S} instructions */
-XEN_CPUFEATURE(PKS,           6*32+31) /*   Protection Key for Supervisor */
+XEN_CPUFEATURE(PKS,           6*32+31) /*H  Protection Key for Supervisor */
 
 /* AMD-defined CPU features, CPUID level 0x80000007.edx, word 7 */
 XEN_CPUFEATURE(HW_PSTATE,     7*32+ 7) /*   Hardware Pstates */
-- 
2.11.0


