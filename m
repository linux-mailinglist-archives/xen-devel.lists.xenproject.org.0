Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 668BF58ED76
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 15:37:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383641.618839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLltq-0002XZ-6B; Wed, 10 Aug 2022 13:37:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383641.618839; Wed, 10 Aug 2022 13:37:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLltq-0002VK-3V; Wed, 10 Aug 2022 13:37:30 +0000
Received: by outflank-mailman (input) for mailman id 383641;
 Wed, 10 Aug 2022 13:37:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vUq/=YO=citrix.com=prvs=214886735=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oLlto-0002VE-Uw
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 13:37:28 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 915f1fb1-18b1-11ed-bd2e-47488cf2e6aa;
 Wed, 10 Aug 2022 15:37:27 +0200 (CEST)
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
X-Inumbo-ID: 915f1fb1-18b1-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660138647;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RGqfgPAI6n2sccCOluZxIMu1JcstgVkLXKfy6tIucZY=;
  b=VnI8ZjYVyKfbHZT74LXSLTuU9dMicAussTDOOzm0lcBuuK7k4vgdeTds
   p8MrK36tukMBjit2dfMrLkFH5bSy004pYeRK/CSprjnfpd3SstoQb3CnR
   fueFyCybEAi/iQVEU/lnq6f+vyPoYOUr/9EfgHiaRplnacMMTvFShC4XZ
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 80335057
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:8AgG5qrHYzKNFtYw67IHazRTWXFeBmJ2ZRIvgKrLsJaIsI4StFCzt
 garIBnVa/iIZWenfIt2advn9kwHvZbdz4cyTQdkry0zEywT9JuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNPg06/gEk35q6q6GpA5gZWic1j5zcyqVFEVPrzGonpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZWBiuFIPM0SRqkEqShgJ+rQ6LJIhhXJ/0F1lqTzTJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXWV+ACQqflO1q8iCAn3aMqVF3eZ6Llhpp
 cUjFwtKVxu+28C35Z20H7wEasQLdKEHPasas3BkizrYEewnUdbIRKCiCd1whWlqwJoURLCHO
 pRfOWEHgBfoOnWjPn8+Dp4kkfjurX74azBC83qepLYt4niVxwt0uFToGIqNIYfXHZgK9qqej
 mHLoUrACBQqDuC4+B2K8i7zgdTisgquDer+E5Xnr6U30TV/3Fc7Fxk+RVa95/6jhSaWefhSN
 kgV8SoGtrUp+QqgSdyVdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QbWNQeHGJwk
 AXTxpWwWGIp4Ob9pW+hGqm88BSyNAcsCj87XhA/CjIO3oXBoaQcgUeaJjp8K5JZnuEZCBmpn
 W7S9Hlh3uxN5SIY//7lpA6a2lpAsrCMF1dovVuPAwpJ+ysjPOaYi5qUBU83BBqqBKKQVRG/s
 XcNgKByB8heXMjWxERhrAjgdYxFBspp0xWG2DaD57F7q1yQF4eLJOi8Gg1WKkZzKdojcjT0e
 kLVsg45zMYNYiPyMvcuMtLsUZ5CIU3c+TPNCJjpgidmOMAtJGdrAgk3DaJv44wduBd1yvxuU
 XtqWc2tEWwbGcxa8dZCfM9EiOdD7n1vmgvuqWXTlUvPPUy2OCHIEt/o8TKmMogE0U9ziF6No
 44Ga5bTl0U3vS+XSnC/zLP/5GsidRATba0aYeQOHgJfCmKKwF0cNsI=
IronPort-HdrOrdr: A9a23:/8bGy6sOqv76gJTtaGiJ3rmV7skDjNV00zEX/kB9WHVpm6yj+v
 xGUs566faUskd0ZJhEo7q90ca7Lk80maQa3WBzB8bGYOCFghrKEGgK1+KLrwEIcxeUygc379
 YDT0ERMrzN5VgRt7eG3OG7eexQvOVuJsqT9JjjJ3QGd3AVV0l5hT0JbTpyiidNNXJ77ZxSLu
 v72uN34wCOVF4wdcqBCnwMT4H41qf2fMKPW29+O/Y/gjP+9Q+V1A==
X-IronPort-AV: E=Sophos;i="5.93,227,1654574400"; 
   d="scan'208";a="80335057"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH] x86/hvm: Improve hvm_set_guest_pat() code generation again
Date: Wed, 10 Aug 2022 14:36:55 +0100
Message-ID: <20220810133655.18040-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Edwin Török <edvin.torok@citrix.com>

Following on from cset 9ce0a5e207f3 ("x86/hvm: Improve hvm_set_guest_pat()
code generation"), and the discovery that Clang/LLVM makes some especially
disastrous code generation for the loop at -O2

  https://github.com/llvm/llvm-project/issues/54644

Edvin decided to remove the loop entirely by fully vectorising it.  This is
substantially more efficient than the loop, and rather harder for a typical
compiler to mess up.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Edwin Török <edvin.torok@citrix.com>
---
 xen/arch/x86/hvm/hvm.c | 51 ++++++++++++++++++++++++++++++++++----------------
 1 file changed, 35 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 0dd320a6a9fc..b63e6073dfd0 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -302,24 +302,43 @@ void hvm_get_guest_pat(struct vcpu *v, u64 *guest_pat)
         *guest_pat = v->arch.hvm.pat_cr;
 }
 
-int hvm_set_guest_pat(struct vcpu *v, uint64_t guest_pat)
+/*
+ * MSR_PAT takes 8 uniform fields, each of which must be a valid architectural
+ * memory type (0, 1, 4-7).  This is a fully vectorised form of the
+ * 8-iteration loop over bytes looking for PAT_TYPE_* constants.
+ */
+static bool pat_valid(uint64_t val)
 {
-    unsigned int i;
-    uint64_t tmp;
+    /* Yields a non-zero value in any lane which had value greater than 7. */
+    uint64_t any_gt_7   =  val & 0xf8f8f8f8f8f8f8f8;
 
-    for ( i = 0, tmp = guest_pat; i < 8; i++, tmp >>= 8 )
-        switch ( tmp & 0xff )
-        {
-        case PAT_TYPE_UC_MINUS:
-        case PAT_TYPE_UNCACHABLE:
-        case PAT_TYPE_WRBACK:
-        case PAT_TYPE_WRCOMB:
-        case PAT_TYPE_WRPROT:
-        case PAT_TYPE_WRTHROUGH:
-            break;
-        default:
-            return 0;
-        }
+    /*
+     * With the > 7 case covered, identify lanes with the value 0-3 by finding
+     * lanes with bit 2 clear.
+     *
+     * Yields bit 2 set in each lane which has a value <= 3.
+     */
+    uint64_t any_le_3   = ~val & 0x0404040404040404;
+
+    /*
+     * Logically, any_2_or_3 is any_le_3 && bit 1 set.
+     *
+     * We could calculate any_gt_1 as val & 0x02 and resolve the two vectors
+     * of booleans (shift one of them until the mask lines up, then bitwise
+     * and), but that is unnecessary calculation.
+     *
+     * Shift any_le_3 so it becomes bit 1 in each lane which has a value <= 3,
+     * and look for bit 1 in a subset of lanes.
+     */
+    uint64_t any_2_or_3 =  val & (any_le_3 >> 1);
+
+    return !(any_gt_7 | any_2_or_3);
+}
+
+int hvm_set_guest_pat(struct vcpu *v, uint64_t guest_pat)
+{
+    if ( !pat_valid(guest_pat) )
+        return 0;
 
     if ( !alternative_call(hvm_funcs.set_guest_pat, v, guest_pat) )
         v->arch.hvm.pat_cr = guest_pat;
-- 
2.11.0


