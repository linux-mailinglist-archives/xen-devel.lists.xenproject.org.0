Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 226E058A98A
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 12:39:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.381022.615508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJuj5-0000ih-K0; Fri, 05 Aug 2022 10:38:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 381022.615508; Fri, 05 Aug 2022 10:38:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJuj5-0000g9-GK; Fri, 05 Aug 2022 10:38:43 +0000
Received: by outflank-mailman (input) for mailman id 381022;
 Fri, 05 Aug 2022 10:38:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jIDu=YJ=citrix.com=prvs=2098568dc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oJuj3-0000g3-Os
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 10:38:41 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c328a0d8-14aa-11ed-bd2e-47488cf2e6aa;
 Fri, 05 Aug 2022 12:38:38 +0200 (CEST)
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
X-Inumbo-ID: c328a0d8-14aa-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1659695918;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=klcN6ihm9mZaX9/9wwugxzNwOZN9EgdYLIIdk4FSF+c=;
  b=Y3APm8/oaZg9evdDihbVuEg5YO/TvvvF26k0pYeoticR80ZVluAhFqeL
   KDy5rSXEQ8jnVS2ga+VfNGEIPzrZNjU9/kV6O4x433mxNUvhqf+P+Ghvp
   BmwpbSLNJy/a3H1fc9dd5AH0YmdJM5ZPkaHcGQg8d7isyGELj5KMUC3/3
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 76698737
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:0SQsSqpLZgCy19daMwkFnUe1JTpeBmJ2ZRIvgKrLsJaIsI4StFCzt
 garIBnVPv2LNzHwLdskbo2+/E8GvcXTztNkSwRppXoyFSJHpJuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNPg06/gEk35q6q6GtE5gdWic1j5zcyqVFEVPrzGonpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZWBiuFIPM0SRqkEqShgJ+rQ6LJIhhXJ/0F1lqTzTJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXWV+ACQqflO1q8iCAn3aMqUWvdZsO00Q0
 sAyBzkuSBKR27u2wrOkH7wEasQLdKEHPasas3BkizrYEewnUdbIRKCiCd1whWlqwJoURLCHO
 pRfOWEHgBfoOnWjPn8+Dp4kkfjurX74azBC83qepLYt4niVxwt0uFToGIWLJI3aGp4K9qqej
 mLl+D/rGR8rCMeW73m/7i2U3MTivCyuDer+E5Xnr6U30TV/3Fc7Fxk+RVa95/6jhSaWefhSN
 kgV8SoGtrUp+QqgSdyVdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QbWNQeHGJwk
 AXTxpWwWGIp4Ob9pW+hGqm8o3SCIhI5c0g+TwANbi0H8YW6oIMykUeaJjp8K5JZnuEZCBmpn
 W3b8nZj2OxP5SIY//7lpA6a2lpAsrCMF1dovVuPAwpJ+ysjPOaYi5qUBU83BBqqBKKQVRG/s
 XcNgKByB8heXMjWxERhrAjgdYxFBspp0xWG2DaD57F7q1yQF4eLJOi8Gg1WKkZzKdojcjT0e
 kLVsg45zMYNYSr0Nv8uMtPrV5VCIU3c+TPNBpjpgidmOMAtJGdrAgk0DaJv44wduBd1yvxuU
 XtqWc2tEWwbGcxa8dZCfM9EiOdD7n1vmgvuqWXTlUvPPUy2OCHIEt/o8TKmMogE0U9ziF+Lr
 IYObZbblk83vS+XSnC/zLP/5GsidRATba0aYeQNHgJfCmKKwF0cNsI=
IronPort-HdrOrdr: A9a23:nhuvB64AF1GZ32zgCgPXwMTXdLJyesId70hD6qhwISY6TiX+rb
 HIoB17726RtN9/YhEdcLy7VJVoIkmskKKdg7NhXotKNTOO0ADDQb2KhbGSpQEIcBeeygcy78
 hdmtBFeb/NMWQ=
X-IronPort-AV: E=Sophos;i="5.93,216,1654574400"; 
   d="scan'208";a="76698737"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/spec-ctrl: Use IST RSB protection for !SVM systems
Date: Fri, 5 Aug 2022 11:38:14 +0100
Message-ID: <20220805103814.23032-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

There is a corner case where a VT-x guest which manages to reliably trigger
non-fatal #MC's could evade the rogue RSB speculation protections that were
supposed to be in place.

This is a lack of defence in depth; Xen does not architecturally execute more
RET than CALL instructions, so an attacker would have to locate a different
gadget (e.g. SpectreRSB) first to execute a transient path of excess RET
instructions.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/spec_ctrl.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 44e86f3d674d..d2cd5459739f 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -1327,8 +1327,24 @@ void __init init_speculation_mitigations(void)
      * mappings.
      */
     if ( opt_rsb_hvm )
+    {
         setup_force_cpu_cap(X86_FEATURE_SC_RSB_HVM);
 
+        /*
+         * For SVM, Xen's RSB safety actions are performed before STGI, so
+         * behave atomically with respect to IST sources.
+         *
+         * For VT-x, NMIs are atomic with VMExit (the NMI gets queued but not
+         * delivered) whereas other IST sources are not atomic.  Specifically,
+         * #MC can hit ahead the RSB safety action in the vmexit path.
+         *
+         * Therefore, it is necessary for the IST logic to protect Xen against
+         * possible rogue RSB speculation.
+         */
+        if ( !cpu_has_svm )
+            default_spec_ctrl_flags |= SCF_ist_rsb;
+    }
+
     ibpb_calculations();
 
     /* Check whether Eager FPU should be enabled by default. */
-- 
2.11.0


