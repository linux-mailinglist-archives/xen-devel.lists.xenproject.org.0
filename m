Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5855D664743
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 18:19:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474882.736365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFIHA-0005c8-IA; Tue, 10 Jan 2023 17:19:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474882.736365; Tue, 10 Jan 2023 17:19:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFIHA-0005VV-9w; Tue, 10 Jan 2023 17:19:04 +0000
Received: by outflank-mailman (input) for mailman id 474882;
 Tue, 10 Jan 2023 17:19:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dQxz=5H=citrix.com=prvs=367c7493a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pFIH7-0003S0-Qg
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 17:19:01 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc65418a-910a-11ed-91b6-6bf2151ebd3b;
 Tue, 10 Jan 2023 18:18:57 +0100 (CET)
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
X-Inumbo-ID: dc65418a-910a-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673371137;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=C9gSfgX+9i+r0YwgaULSxlIhX07TJ2xDDOE7SZdYeBY=;
  b=NcvoAQWciyRAbIkLgnVc9iNEg66rZ8SSLjF+pZfL9Jrh7hkPNp6lxqUY
   bYP+y1xr8nUp/gEAkT41lPMFLhjhROGEj1HDBlIs6O1msHSW/mE//WDif
   MLY3PPmyM3n7ftk0GMRlrPawHgfYBEMU2+Wc/Ao0xPPGmMUFbfiFRf1n9
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 91967753
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:YwnKM6zuo4bG75SfPt16t+ckxirEfRIJ4+MujC+fZmUNrF6WrkUPz
 mRKUWzXPK2MajSnet0lYY7k8ktS6MDUxoNjG1ZvqCAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U0HUMja4mtC5QRnPKgT5zcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KW1y8
 985EjkAUhfdhPm38ZGfYM9Fpct2eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKQOHWjOX9OYH46tM6uimPybHtzr1WNqLBsy2PS0BZwwP7mN9+9ltmiFJwEwBnH+
 zmuE2LRWw9HLfnHxCK8o1mR3/bFsgy8A49CG+jtnhJtqALKnTFCYPEMbnOkpdGph0j4XMhQQ
 2QE9yxroaUs+UiDStjmQwb+sHOCpgQbWddbD6s98g7l4oj+7hudB2MEZiVcc9Fgv8gzLQHGz
 XfQwYmvX2Y29uTIFzTNrd94sA9eJwAZEWkhRBUNQDcCvdr4obAQqjjpZ/VsRfvdYsLOJRn8x
 DWDrS4bjroVjNIW26jTwW0rkw5AtbCSEFdru1y/snaNq1ogOdX7P9DABU3zt64oEWqPcrWWU
 JHoceC65ftGM5yCnTflrA4lTODwvKbt3NExbDdS83gdG9aFoSXLkWN4umsWyKJV3iEsJ1fUj
 Lf741852XOqFCLCgVVLS4ywEd826qPrCM7oUPvZBvIXPMcqLl/WpH4zOBfKt4wIrKTKuftnU
 Xt8WZ/yZUv29Iw9lGbmLwvj+eNDKt8CKZP7GsmgkkXPPUu2b3+JU7YVWGZinchghJ5oVD79q
 o4FX+PTkkU3bQELSnWPmWLlBQxQfCdT6FGfg5A/S9Nv1SI9RD1wWq6MnO16E2Gn9owM/tr1E
 riGchcw4DLCabfvcG1mtlgLhGvTYKtC
IronPort-HdrOrdr: A9a23:H2/ClqFyTJLFRUOopLqELMeALOsnbusQ8zAXPiBKJCC9E/bo8v
 xG+c5w6faaslkssR0b9+xoW5PwI080l6QU3WB5B97LMDUO0FHCEGgI1/qA/9SPIUzDHu4279
 YbT0B9YueAcGSTW6zBkXWF+9VL+qj5zEix792uq0uE1WtRGtldBwESMHf9LmRGADNoKLAeD5
 Sm6s9Ot1ObCA8qhpTSPAhiYwDbzee77a7bXQ==
X-IronPort-AV: E=Sophos;i="5.96,315,1665460800"; 
   d="scan'208";a="91967753"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 8/8] x86/hvm: Support PKS for HAP guests
Date: Tue, 10 Jan 2023 17:18:45 +0000
Message-ID: <20230110171845.20542-9-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20230110171845.20542-1-andrew.cooper3@citrix.com>
References: <20230110171845.20542-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

With all infrastructure in place, advertise the PKS CPUID bit to HAP guests,
and let them set CR4.PKS.

Experiment with a tweak to the layout of hvm_cr4_guest_valid_bits() so future
additions will be just a single added line.

The current context switching behaviour is tied to how VT-x works, so leave a
safety check in the short term.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
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
index acc2f606cea8..b22725c492e7 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -579,6 +579,15 @@ static void __init calculate_hvm_max_policy(void)
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
index c6c1eea18003..606f0e864981 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -969,7 +969,9 @@ unsigned long hvm_cr4_guest_valid_bits(const struct domain *d)
             (p->feat.smep     ? X86_CR4_SMEP              : 0) |
             (p->feat.smap     ? X86_CR4_SMAP              : 0) |
             (p->feat.pku      ? X86_CR4_PKE               : 0) |
-            (cet              ? X86_CR4_CET               : 0));
+            (cet              ? X86_CR4_CET               : 0) |
+            (p->feat.pks      ? X86_CR4_PKS               : 0) |
+            0);
 }
 
 static int cf_check hvm_load_cpu_ctxt(struct domain *d, hvm_domain_context_t *h)
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 5444bc5d8374..3b85bcca1537 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -227,7 +227,7 @@ XEN_CPUFEATURE(CLDEMOTE,      6*32+25) /*A  CLDEMOTE instruction */
 XEN_CPUFEATURE(MOVDIRI,       6*32+27) /*a  MOVDIRI instruction */
 XEN_CPUFEATURE(MOVDIR64B,     6*32+28) /*a  MOVDIR64B instruction */
 XEN_CPUFEATURE(ENQCMD,        6*32+29) /*   ENQCMD{,S} instructions */
-XEN_CPUFEATURE(PKS,           6*32+31) /*   Protection Key for Supervisor */
+XEN_CPUFEATURE(PKS,           6*32+31) /*H  Protection Key for Supervisor */
 
 /* AMD-defined CPU features, CPUID level 0x80000007.edx, word 7 */
 XEN_CPUFEATURE(HW_PSTATE,     7*32+ 7) /*   Hardware Pstates */
-- 
2.11.0


