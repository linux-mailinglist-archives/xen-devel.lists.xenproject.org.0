Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 235D3578C20
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 22:51:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370097.601752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDXhW-0008Rf-1t; Mon, 18 Jul 2022 20:50:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370097.601752; Mon, 18 Jul 2022 20:50:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDXhV-0008P2-VB; Mon, 18 Jul 2022 20:50:45 +0000
Received: by outflank-mailman (input) for mailman id 370097;
 Mon, 18 Jul 2022 20:50:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fb5k=XX=citrix.com=prvs=1919bed39=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oDXhU-0007oP-H8
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 20:50:44 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 490959ab-06db-11ed-924f-1f966e50362f;
 Mon, 18 Jul 2022 22:50:42 +0200 (CEST)
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
X-Inumbo-ID: 490959ab-06db-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658177442;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HN3zIYBOlpweVbFPQUz5JRML8xTBSiJhocbeZtby2H4=;
  b=MdZDoReswkGyu7b/BVRLEYXQapj5d0SHZJacDI+prkJKRnhO+eFjbV5R
   cwlqTH7XBa8SX+72zXBmB1AvrWkz3KnsT5TDl3z/nGgdsLrWLkYLDcTg0
   +I/YmLxABSeHJUSk7JBladU/nd/y75NsrYKL517KsJx0tHEp3TdmuPCF0
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 76077190
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:5+6pNqqUeqbvsDsOvqI8meoA/VxeBmJvZRIvgKrLsJaIsI4StFCzt
 garIBnQb6uLYmbxc49+PYyxpE8OsMPTz4Q2TFM+rCthFnxE95uZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNOg06/gEk35q6q52pI5gZWic1j5zcyqVFEVPrzGonpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZWBiuFIPM0SRqkEqShgJ+rQ6LJIhhXJ/0F1lqTzTJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXWV+ACQqflO1q8iCAn3aMqUW2P5ZImtsz
 8VfJSBXdz24xPut44KSH7wEasQLdKEHPasas3BkizrYEewnUdbIRKCiCd1whWlqwJoURLCHO
 pRfOWEHgBfoOnWjPn8+Dp4kkfjurX74azBC83qepLYt4niVxwt0uFToGIWLIoPVHJQN9qqej
 n7g/UvnBBMUCNKOxSSlqFjvtsTMsiyuDer+E5Xnr6U30TV/3Fc7Fxk+RVa95/6jhSaWefhSN
 kgV8SoGtrUp+QqgSdyVdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QbWNQeHGJwk
 AXTxpWwWGIp4Ob9pW+hGqm8oxGqFwsfD1U7IiIUFxIo2Jr6u6IDp0eaJjp8K5JZnuEZCBmpn
 W3V/XBv1ulJ5SIY//7lpA6a2lpAsrCMF1dovVuPAwpJ+ysjPOaYi5qUBU83BBqqBKKQVRG/s
 XcNgKByB8heXMjWxERhrAjgdYxFBspp0xWG2DaD57F7q1yQF4eLJOi8Gg1WKkZzKdojcjT0e
 kLVsg45zMYNYSvzM/4vMtvhW55CIU3c+TLNDKi8gj1mO8IZSeN61Hs2OR74M57FyiDAbp3Ty
 b/EKJ3xXB72+IxszSasRvd17ILHMhsWnDqLLbimnkvP7FZrTCTKIVvzGAfRM7tRAWLtiFm9z
 uuzwOPQm0wDD7ShP3OHmWPRRHhTRUUG6VnNg5Q/Xoa+zsBOQgnN19e5LWsdRrFY
IronPort-HdrOrdr: A9a23:C20Bzqyj5uIhy2543J2ZKrPwFr1zdoMgy1knxilNoRw8SK2lfq
 eV7YwmPH7P+U8ssR4b6LO90cW7Lk80sKQFhbX5Xo3SOjUO2lHYTr2KhLGKq1aLdkHDH6xmpM
 BdmsBFeabN5DNB7foSjjPXLz9Z+qjjzJyV
X-IronPort-AV: E=Sophos;i="5.92,282,1650945600"; 
   d="scan'208";a="76077190"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 2/3] x86/spec-ctrl: Make svm_vmexit_spec_ctrl conditional
Date: Mon, 18 Jul 2022 21:50:08 +0100
Message-ID: <20220718205009.3557-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220718205009.3557-1-andrew.cooper3@citrix.com>
References: <20220718205009.3557-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The logic was written this way out of an abundance of caution, but the reality
is that AMD parts don't currently have the RAS-flushing side effect, and nor
do they intend to gain it.

This removes one WRMSR from the VMExit path by default on Zen2 systems.

Fixes: 614cec7d79d7 ("x86/svm: VMEntry/Exit logic for MSR_SPEC_CTRL")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

Zen3 doesn't get a speedup in general, because we use the WRMSR's to clear
IBRS to avoid forcing it behind a VM's back.
---
 xen/arch/x86/hvm/svm/entry.S | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/entry.S b/xen/arch/x86/hvm/svm/entry.S
index 0ff4008060fa..a60d759f7108 100644
--- a/xen/arch/x86/hvm/svm/entry.S
+++ b/xen/arch/x86/hvm/svm/entry.S
@@ -113,15 +113,15 @@ __UNLIKELY_END(nsvm_hap)
         ALTERNATIVE "", DO_OVERWRITE_RSB, X86_FEATURE_SC_RSB_HVM
 
         .macro svm_vmexit_spec_ctrl
-            /*
-             * Write to MSR_SPEC_CTRL unconditionally, for the RAS[:32]
-             * flushing side effect.
-             */
-            mov    $MSR_SPEC_CTRL, %ecx
             movzbl CPUINFO_xen_spec_ctrl(%rsp), %eax
+            movzbl CPUINFO_last_spec_ctrl(%rsp), %edx
+            cmp    %edx, %eax
+            je     1f /* Skip write if value is correct. */
+            mov    $MSR_SPEC_CTRL, %ecx
             xor    %edx, %edx
             wrmsr
             mov    %al, CPUINFO_last_spec_ctrl(%rsp)
+1:
         .endm
         ALTERNATIVE "", svm_vmexit_spec_ctrl, X86_FEATURE_SC_MSR_HVM
         /* WARNING! `ret`, `call *`, `jmp *` not safe before this point. */
-- 
2.11.0


