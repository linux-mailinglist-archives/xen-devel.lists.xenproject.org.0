Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8777210AAA
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jul 2020 14:00:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqbOL-00038T-0J; Wed, 01 Jul 2020 11:59:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xe6U=AM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jqbOJ-00038O-S6
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2020 11:59:03 +0000
X-Inumbo-ID: 40edcd88-bb92-11ea-86f7-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 40edcd88-bb92-11ea-86f7-12813bfff9fa;
 Wed, 01 Jul 2020 11:59:02 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: weTeaknDV0sEqpvRdxIpQaRfhHXiDbIXWdTcnTH88GBzTgyz3JX8JaXUOk17WdXMqXxpz5NspV
 /pZWJz1PsVF1K3GJVKdZajwIQ0EWZ0hv29TC0n7QTrGIHrJaM2FAlT2/fDbxBUkGQmSw3WFDpL
 J7ptZ1N6CfavGbWnd2LjEYelswXS1D+UieFeqzKhwMDuoVQvzGzLM6OTYUgLo3yWGOZo+2a+bw
 trDDD055jEneNdtP0jDlA0p0zScAeWbA+ulnAvnUDvSF2ECOmlviBXIRlK2bEZkdOSIlv9qwhe
 thI=
X-SBRS: 2.7
X-MesageID: 21379321
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,300,1589256000"; d="scan'208";a="21379321"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH for-4.14] x86/spec-ctrl: Protect against CALL/JMP
 straight-line speculation
Date: Wed, 1 Jul 2020 12:58:42 +0100
Message-ID: <20200701115842.18583-1-andrew.cooper3@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Some x86 CPUs speculatively execute beyond indirect CALL/JMP instructions.

With CONFIG_INDIRECT_THUNK / Retpolines, indirect CALL/JMP instructions are
converted to direct CALL/JMP's to __x86_indirect_thunk_REG(), leaving just a
handful of indirect JMPs implementing those stubs.

There is no architectrual execution beyond an indirect JMP, so use INT3 as
recommended by vendors to halt speculative execution.  This is shorter than
LFENCE (which would also work fine), but also shows up in logs if we do
unexpected execute them.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Paul Durrant <paul@xen.org>

This wants backporting to all release, possibly even into the security trees,
and should therefore be considered for 4.14 at this point.
---
 xen/arch/x86/indirect-thunk.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/x86/indirect-thunk.S b/xen/arch/x86/indirect-thunk.S
index 3c17f75c23..7392aee127 100644
--- a/xen/arch/x86/indirect-thunk.S
+++ b/xen/arch/x86/indirect-thunk.S
@@ -24,10 +24,12 @@
 .macro IND_THUNK_LFENCE reg:req
         lfence
         jmp *%\reg
+        int3 /* Halt straight-line speculation */
 .endm
 
 .macro IND_THUNK_JMP reg:req
         jmp *%\reg
+        int3 /* Halt straight-line speculation */
 .endm
 
 /*
-- 
2.11.0


