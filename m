Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E1D58159D
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 16:44:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375363.607695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGLn7-0000fi-Ps; Tue, 26 Jul 2022 14:44:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375363.607695; Tue, 26 Jul 2022 14:44:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGLn7-0000dE-MR; Tue, 26 Jul 2022 14:44:09 +0000
Received: by outflank-mailman (input) for mailman id 375363;
 Tue, 26 Jul 2022 14:44:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xzkj=X7=citrix.com=prvs=199529adf=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1oGLn7-0000d8-5b
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 14:44:09 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65d3fd7a-0cf1-11ed-bd2d-47488cf2e6aa;
 Tue, 26 Jul 2022 16:44:07 +0200 (CEST)
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
X-Inumbo-ID: 65d3fd7a-0cf1-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658846647;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PDLwc3Aco3iQCsS4JF/aEn7uDmViPWgey2FgpMpNTbs=;
  b=accb0OsVUFzUw1VeQPohV+GcidhaPByKUTR9p5IlhvpJLrj2/xPQ8IzI
   lIDwyJfIJmClXo6mgfbQ0jnIfkclGgCfVmLIHUduQORitIHyOgR3vymKF
   hkC4KqZT1/OSQ2spCIj4IiE5Vzhp85aaghH3zAQ2+QRS0iMqosKMctZ78
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 76657825
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:hTtjr6pVw5ACCCxTVd5RBq+9RR5eBmJ0ZRIvgKrLsJaIsI4StFCzt
 garIBmDM66LY2ujL953aYm0oEgHvsLRy99kQAs/pS1gRCka9ZuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNPg06/gEk35q6q52lF5gZWic1j5zcyqVFEVPrzGonpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZWBiuFIPM0SRqkEqShgJ+rQ6LJIhhXJ/0F1lqTzTJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXWV+ACQqflO1q8iCAn3aMqU89vhpE1EWr
 ccaFw4hRRWFl/CU+O60H7wEasQLdKEHPasas3BkizrYEewnUdbIRKCiCd1whWlqwJoURLCHO
 pRfOWEHgBfoOnWjPn8aBIw/mqG0gWP4cBVTqU6PpLpx6G/WpOB0+OezboeKKobXLSlTtmG9n
 D/5xEbbOzhZFcLHmAvG8y6OhvCayEsXX6pNTeblp5aGmma72Wg7GBAQE1yhrpGRiESzRtZeI
 Ew84Tc1oO4580nDZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZ8hMcO7ZFsA2Zwj
 xnQwo2vVWcHXKCppWy10ruKsyGCYXAuL1A8SQQBSxsXweG/r9Rm5v7QdeqPAJJZn/WsR2ygk
 2jS9nNn71kApZVVjvvmpDgrlxrp/8GUFVBtu207S0r/tmtEiJiZi5tEALQxxdJJN86nQ1aIp
 xDocODOvblVXflheMFgKdjh/Y1FBN7faVUweXY1Q/EcG82FohZPh7x47jBkP1tOOc0ZYzLva
 0K7kVoPuc8MYyfzPf8oPtzZ5yEWIU/ITI+NaxwpRoAWPsgZmPGvp0mCmnJ8L0iyyRNxwMnTy
 L+QcNq2DGZyNJmLOAGeHr5FuZd2l39W+I8mbcqkp/hR+ebBOSX9pHZsGAfmU93VG4vf+F+Lq
 YkOaprVo/idOcWnChTqHUcoBQhiBRAG6Vre8qS7qsbrztJaJVwc
IronPort-HdrOrdr: A9a23:VkYgAaGQmTti8n8HpLqE5MeALOsnbusQ8zAXP0AYc3Jom6uj5q
 eTdZUgpHvJYVkqOE3I9ertBEDiewK4yXcW2/hzAV7KZmCP0wHEEGgL1/qF/9SKIUzDH4Bmup
 uIC5IOauHNMQ==
X-IronPort-AV: E=Sophos;i="5.93,193,1654574400"; 
   d="scan'208";a="76657825"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH] x86/msr: fix X2APIC_LAST
Date: Tue, 26 Jul 2022 15:43:36 +0100
Message-ID: <d4fb4631b82643751fcb3356b094be65e5bc9bcc.1658846616.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The latest Intel manual now says the X2APIC reserved range is only
0x800 to 0x8ff (NOT 0xbff). The AMD manual documents 0x800-0x8ff too.

There are non-X2APIC MSRs in the 0x900-0xbff range now:
e.g. 0x981 is IA32_TME_CAPABILITY, an architectural MSR.

The new MSR in this range appears to have been introduced in Icelake,
so this commit should be backported to Xen versions supporting Icelake.

Backport: 4.13+

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 xen/arch/x86/include/asm/msr-index.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 8cab8736d8..1a928ea6af 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -148,7 +148,7 @@
 #define MSR_INTERRUPT_SSP_TABLE             0x000006a8
 
 #define MSR_X2APIC_FIRST                    0x00000800
-#define MSR_X2APIC_LAST                     0x00000bff
+#define MSR_X2APIC_LAST                     0x000008ff
 
 #define MSR_X2APIC_TPR                      0x00000808
 #define MSR_X2APIC_PPR                      0x0000080a
-- 
2.34.1


