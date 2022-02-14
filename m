Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 556864B516C
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:17:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271981.466769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbE5-0006wI-1O; Mon, 14 Feb 2022 13:17:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271981.466769; Mon, 14 Feb 2022 13:17:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbE4-0006ra-GZ; Mon, 14 Feb 2022 13:17:08 +0000
Received: by outflank-mailman (input) for mailman id 271981;
 Mon, 14 Feb 2022 13:17:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb3j-0008IH-HO
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:06:27 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e97f508c-8d96-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:06:26 +0100 (CET)
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
X-Inumbo-ID: e97f508c-8d96-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843986;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nFVbC/4CTKrt9ePns4OmTby9fRX+JlbtvMjTI8nUB74=;
  b=G1ndp5xIyBMM1jx8qgAdJciOCeLvyMC7DK0peGismD3YL5hCMS35Eut3
   rq2x4xnJpHaKDkc1bcoC9WOV9ptsTBTYxqmckTH8qxynddPnIB6LC9QzO
   m5rjk/py9GlateWSD2xyMvtekAptnnpN+HqnNXPPlRVwsz1RqylRzY8Nc
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: p1VJNay5+0TErJJlwhNVrDKyw911DBe46SFZfny+G1zGNcpra+QSgvbh3R4TpIu/E4DsDN95Fx
 nigN90rokMgW7BknA+b15rBCsGQsU4Cz2gCvzlq6s1PYwXtseCtQgH3kuspus9x2f/iMMUB7hF
 FQDtydm69u0mVPire4SFMveSYHRrwnJyEu+7IjDWtS4Thp3v8kW6OQja9FanHNmDbaWfluBkfa
 AoevsD/u/GXiq7iLu72VKJKIeF/sbQhT0XngIghxOGHmm3sS6A8uxwoxzELDvrV2tGLZh/muSR
 6w5kwkW8KO1Gfdh5I4YEw5Nd
X-SBRS: 5.1
X-MesageID: 64050671
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:T9o8dKj3gPBK031rkfVcT9nyX161XxcKZh0ujC45NGQN5FlHY01je
 htvWW6DOaqPZGanc91yb4nn8x5Q7MTTzoNhG1Y/pX1jFisb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0GE/NtTo5w7Rj2tQx3YDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /0RqsaCGAZuApfhhcgbbBgADjhfLfFZreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHCOo8Ft24m5jbeFfs8GrjIQrnQ5M8e1zA17ixLNaiCP
 5dBN2U2BPjGSxNTI3ASIrgApt3rqVjOSgIGmWCepZNitgA/yyQuieOwYbI5YOeiWsF9jkue4
 GXc8AzRIDsXKdiewjqt6W+3i6nEmiaTcJIfEvi0++BnhHWXx3cPE1sGWF2ju/67h0WiHdVFJ
 CQpFjEG9PZoshbxF5+kAkP+8CXsUgMgt8R4T/Jg2lCMjZbuzhu1AFcFFiNYScx6q5pjLdA17
 WOhk9TsDD1plbSaT3OB67uZxQ+P1TgpwXwqPnFdE1ZcizX3iMRq10+UEI4/eEKgpoCtQVnNL
 ya2QD/Sbln5peoCzO2F8F/OmFpATbCZH1dutm07so9Ihz6VhbJJhaT1szA3Dt4ade51q2VtW
 1BexaCjABgmV83lqcB0aLxl8EuVz/iEKibAplVkAoMs8T+gk1b6I9wMv2EueRoxa51eEdMMX
 KM0kVkPjKK/wVPwNfMnC25PI5hCIVfc+STNCamPM4smjmlZfw6b5iB+DXN8LEi2+HXAZZoXY
 M/BGe71VC5yIf0+kFKeGrdMuZd2l3tW7T6CGvjGI+GPjOP2iIi9EuxebjNjr4kRscu5neki2
 4gDaZXakUgDOAA8CwGOmbMuwZkxBSBTLfjLRwZ/L7DrztNOFD5zBvnP76kmfoA5za1Zmv2Rp
 iO2W1NCyUq5jnrCcF3YZndmYbLpfJB+sXNkYnB8YQf2gyAuMdS18aMSV5orZr17puZt+uF5E
 qsecMKaD/URFjmeo2YBbYPwpZBJfQiwgV7cJDKsZTUyJsYyRwHA9tL+UBHo8S0CUni+ucck+
 uXy3QLHW5sTAQ9lCZ+OOv6oylqwu1kbmf5zABSUcoUCJh20/dEzeSLrj/IxL8UdEjn5x2OXh
 1SMHBMVhejRuItpotPHsr+J8tWyGOxkE0sEQ2SCteSqNTPX93aIyJNbVLraZijUUW759fnwZ
 ehRyP2gYvQLkEwT7th5Grdvi6k/+8Hut/lRyQE9RCfHaFGiC7VBJHia3JYQ6v0Rl+EB4QbmC
 FiS/tR6OKmSPJK3GVEcEwMpc+Cf2KxGgTLV9/k0fB336SIfEGBriqmO081gUBBgEYY=
IronPort-HdrOrdr: A9a23:fKjZt6H6mGE1OkcApLqE0MeALOsnbusQ8zAXP0AYc3Jom6uj5r
 mTdZUgpHnJYVkqOE3I9ertBEDEewK4yXcX2/h3AV7BZniEhILAFugLhuGO/9SjIVybygc079
 YZT0EUMrzN5DZB4voSmDPIceod/A==
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64050671"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 63/70] x86/traps: Rework write_stub_trampoline() to not hardcode the jmp
Date: Mon, 14 Feb 2022 12:51:20 +0000
Message-ID: <20220214125127.17985-64-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

For CET-IBT, we will need to optionally insert an endbr64 instruction at the
start of the stub.  Don't hardcode the jmp displacement assuming that it
starts at byte 24 of the stub.

Also add extra comments describing what is going on.  The mix of %rax and %rsp
is far from trivial to follow.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * Retain the rounding up to 16 bytes.
---
 xen/arch/x86/x86_64/traps.c | 35 ++++++++++++++++++++++-------------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/x86_64/traps.c b/xen/arch/x86/x86_64/traps.c
index d661d7ffcaaf..edc6820b85c7 100644
--- a/xen/arch/x86/x86_64/traps.c
+++ b/xen/arch/x86/x86_64/traps.c
@@ -293,30 +293,39 @@ static unsigned int write_stub_trampoline(
     unsigned char *stub, unsigned long stub_va,
     unsigned long stack_bottom, unsigned long target_va)
 {
+    unsigned char *p = stub;
+
+    /* Store guest %rax into %ss slot */
     /* movabsq %rax, stack_bottom - 8 */
-    stub[0] = 0x48;
-    stub[1] = 0xa3;
-    *(uint64_t *)&stub[2] = stack_bottom - 8;
+    *p++ = 0x48;
+    *p++ = 0xa3;
+    *(uint64_t *)p = stack_bottom - 8;
+    p += 8;
 
+    /* Store guest %rsp in %rax */
     /* movq %rsp, %rax */
-    stub[10] = 0x48;
-    stub[11] = 0x89;
-    stub[12] = 0xe0;
+    *p++ = 0x48;
+    *p++ = 0x89;
+    *p++ = 0xe0;
 
+    /* Switch to Xen stack */
     /* movabsq $stack_bottom - 8, %rsp */
-    stub[13] = 0x48;
-    stub[14] = 0xbc;
-    *(uint64_t *)&stub[15] = stack_bottom - 8;
+    *p++ = 0x48;
+    *p++ = 0xbc;
+    *(uint64_t *)p = stack_bottom - 8;
+    p += 8;
 
+    /* Store guest %rsp into %rsp slot */
     /* pushq %rax */
-    stub[23] = 0x50;
+    *p++ = 0x50;
 
     /* jmp target_va */
-    stub[24] = 0xe9;
-    *(int32_t *)&stub[25] = target_va - (stub_va + 29);
+    *p++ = 0xe9;
+    *(int32_t *)p = target_va - (stub_va + (p - stub) + 4);
+    p += 4;
 
     /* Round up to a multiple of 16 bytes. */
-    return 32;
+    return ROUNDUP(p - stub, 16);
 }
 
 DEFINE_PER_CPU(struct stubs, stubs);
-- 
2.11.0


