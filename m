Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B98767684
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 21:43:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571548.895683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPTNK-0007JH-DV; Fri, 28 Jul 2023 19:43:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571548.895683; Fri, 28 Jul 2023 19:43:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPTNK-0007G9-9J; Fri, 28 Jul 2023 19:43:46 +0000
Received: by outflank-mailman (input) for mailman id 571548;
 Fri, 28 Jul 2023 19:43:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7hHC=DO=citrix.com=prvs=56653927b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qPTNI-0006TZ-Cl
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 19:43:44 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0dc94b98-2d7f-11ee-8613-37d641c3527e;
 Fri, 28 Jul 2023 21:43:42 +0200 (CEST)
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
X-Inumbo-ID: 0dc94b98-2d7f-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690573422;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0+2lTwwT3HcKALQtma3kCln3dcC2BQCBedr5bOWhoy0=;
  b=Qp85OzMB8/PzKT5ZnBaOmH352n6MF8EKSpjJNxYMQRokFUnymhHwk0J2
   umvRiPAeekGrEfV1DZ/k+8eqZUG2o+QV35fkKGQvf12l2yfVFFFF/X6WB
   Mb0g0iNW90ZYnMZ9UNWX8kbYzSRPDFQzeMyTPIpp08p+Jl+5r6YAc2VM+
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 120449230
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:s5516agEfkzsM1wTmoZzsMNaX161WxAKZh0ujC45NGQN5FlHY01je
 htvCD+OOPrcMWqmf4txbYW2p00EvZWBz9AyHVA5+H1nECsb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyr0N8klgZmP6sT4wWOzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQ0bw5cUg7cwNiN0eu2Q/hKovsYBtD0adZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XWjtUsl+K44Ew5HDe1ldZ27nxKtvFPNeNQK25m27B/
 DqaozWjWUly2Nq34iKfqHaGn8n0nS7rY441SIG2//00uQjGroAUIEJPDgbqyRWjsWauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O88Q5RyJy6HUyx2EHWVCRTlEAPQ5sOcmSDps0
 UWG9/vzAjZiqqGSD3iU+bGdtzqaMzUaNmIEamkPSg5ty9/iq4Y3h1TRQ8p5Eai0ptfoFir9x
 T/Mpy8774j/luZSif/9pwqexWvx+N6QFFVdChjrsnyNwkRHNbK7OMuS0kmC4P9RCqKmdXOYo
 y1R8ySB19ziHa1hhQTUHrRVQe/3uajVWNHPqQUxRsd8rlxB71bmJNkNu28meS+FJ+5eIVfUj
 FnvVRS9DXO5FF+jdudJbo24EKzGJoCwRI2+Bpg4gjejC6WdlTNrHwk0PyZ8J0i3zCARfVgXY
 P93i/qEA3cAErhAxzGrXeob2rJD7nlglDuOG8Gjn0/8ieT2iJuppVEtagDmggcRtfPsneko2
 4wHa5viJ+t3DoUSnRU7AaZMdAtXfBDX9Lj9qtBNd/7rH+aVMDhJNhMl+pt4I9YNt/0Mxo/1E
 oSVBhcwJKzX2SeWdm1nqxlLNNvSYHqIhStqZnV1bQ74gShLjETGxP53SqbbtIIPrIRLpcOYh
 dFfEylcKpyjkgj6xgk=
IronPort-HdrOrdr: A9a23:0wM8Ta4KFJONwqjd3QPXwY2BI+orL9Y04lQ7vn2ZKCYlB/Bw8v
 rE8sjzuiWVtN9vYgBdpTntAsi9qBDnhO1ICPcqTNWftWDd0QPDEGgI1/qA/9SPIVyaygZXvZ
 0QDJSXYLfLYWST5qzBjzVR3LwbreWvweSQoaP78l8odAdtbshbnnVE4sTwKDwJeOGDb6BJZK
 Z1I6B81kudkA8sH6CGL0hAZfHHu9rI0Lr+eHc9dmcawTjLtyqs9Ln5VzOF3hISOgk/vIsKwC
 z+ignk4afmlPm+xnbnpgjuxqUTosLl1txAQOqTjcQPQw+c7DqAVcBaQrifuzJwmsGDgWxa6O
 XkklMbJsFu7HGURG2vvhf3/AHl3F8VmgTf4G7du2Lnvcv6AA03ENBAg4UxSGqi13Yd
X-Talos-CUID: 9a23:FcDg9mFYGACROWeBqmJLs3BFJt56NUfm3S7dKl6eLVlSYqSKHAo=
X-Talos-MUID: 9a23:aKC4AQiKat/hYVMdvL+E38MpH99yuaCEEWY2kZgWgMWjaRB+MjTDtWHi
X-IronPort-AV: E=Sophos;i="6.01,238,1684814400"; 
   d="scan'208";a="120449230"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Roberto Bagnara
	<roberto.bagnara@bugseng.com>, Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH 3/3] x86: Delete str()
Date: Fri, 28 Jul 2023 20:43:20 +0100
Message-ID: <20230728194320.3082120-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230728194320.3082120-1-andrew.cooper3@citrix.com>
References: <20230728194320.3082120-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This is used in an assertion only, which is somewhat dubious to begin with and
won't surivive the x86-S work (where TR will become be a NUL selector).

Delete it now.  This avoids many cases where as a global symbol, it shadows
local string variables.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/hvm/svm/svm.c      | 2 --
 xen/arch/x86/include/asm/desc.h | 9 ---------
 2 files changed, 11 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 56cb2f61bb75..4d29ad3bc36a 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1614,8 +1614,6 @@ static int _svm_cpu_up(bool bsp)
     /* Initialize OSVW bits to be used by guests */
     svm_host_osvw_init();
 
-    /* Minimal checking that enough CPU setup was done by now. */
-    ASSERT(str() == TSS_SELECTOR);
     svm_vmsave_pa(per_cpu(host_vmcb, cpu));
 
     return 0;
diff --git a/xen/arch/x86/include/asm/desc.h b/xen/arch/x86/include/asm/desc.h
index 225a864c483e..a1e0807d97ed 100644
--- a/xen/arch/x86/include/asm/desc.h
+++ b/xen/arch/x86/include/asm/desc.h
@@ -238,15 +238,6 @@ static inline void ltr(unsigned int sel)
     __asm__ __volatile__ ( "ltr %w0" :: "rm" (sel) : "memory" );
 }
 
-static inline unsigned int str(void)
-{
-    unsigned int sel;
-
-    __asm__ ( "str %0" : "=r" (sel) );
-
-    return sel;
-}
-
 #endif /* !__ASSEMBLY__ */
 
 #endif /* __ARCH_DESC_H */
-- 
2.30.2


