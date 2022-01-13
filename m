Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DA048D952
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 14:52:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257227.441961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n80Vg-0005mV-N5; Thu, 13 Jan 2022 13:51:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257227.441961; Thu, 13 Jan 2022 13:51:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n80Vg-0005jA-Iy; Thu, 13 Jan 2022 13:51:24 +0000
Received: by outflank-mailman (input) for mailman id 257227;
 Thu, 13 Jan 2022 13:51:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4514=R5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1n80Ve-0005j4-Qb
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 13:51:22 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e287c8d8-7477-11ec-a563-1748fde96b53;
 Thu, 13 Jan 2022 14:51:21 +0100 (CET)
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
X-Inumbo-ID: e287c8d8-7477-11ec-a563-1748fde96b53
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642081881;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HuVwzl2dTBFRt065R7TXfUhehKG/ptrawwgpkETPl9o=;
  b=YgTKh/wvpvixYR6IOovj3UFYmI5zHT2jzI0jyUY4qFhRoAiTKvNpGDpG
   gNfZUcJ49sOaIVZjp7s/YxAZQmlpVfJ6PD9wPuuV+7zVAMhwerBQuLDpv
   IkJhGEy4v36T2z5Ih6F7cujpKyaUvPjdmx+FtD1v35u+15fd5xN7WFTSX
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: TgXrbY/lMr9iSDxOUJGTgMo1IVtlGOCu0A8BOLRDpKBQcDX4MOk2J/K0xxQDXKWWKosVm1h37F
 HSxUzzdLzyp8UO8G02WSlCCoVrWaRgWdAh1hKsbVboQAbgYBVlJEIAIqDAuDxQIt0B5xFb6NuZ
 7iVw+YgjGieMt/2ovNxxqW4tQos8FIlSNngh7SMwaOI29sxVz5U5z3arIz2doaHC+vtTGJzL7d
 Fs2ZKhzyAPItiM1q6ffRrXN8L6yZyZanPWfY2NUgiJ7vEdJHQ34Cz7RPPEGElbsBmP4loOnHFG
 SXqK8v9jr74LQs3LaAOIBCor
X-SBRS: 5.2
X-MesageID: 61837954
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:InHIaa34T8g8hmE2rvbD5Qd2kn2cJEfYwER7XKvMYLTBsI5bpzxTy
 2sWXj2OOq2JZzP2LtolYdni9kkG78KEydZnHAJkpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn9700o6wrVh2OaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhg+p/0
 9VOvLeKUgo7J6rAws0kcztADHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Er8IvNsT0eqgYvWlt12rxBvc6W5HTBa7N4Le02R9u35AVQqeDO
 6L1bxJjSgjfXA1fNW0XDasfpsi22FfdQzRX/Qf9Sa0fvDGIkV0ZPKLWGMXRUsyHQ4NShEnwj
 kDs8nn9AxoaHMeC0jfD+XWp7sffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWZj5EA
 xVKoGx09/F0rRH1CImmN/GlnJKalgImVcFQEOQR0hqA2LPT71ywP0gmViEUPbTKq/QKbTAt0
 1aImfbgCjpurKCZRBqhy1uEkd+hEXNLdDFfPEfoWSNAuoC++99r0nojW/4+SPbdszHjJd3nL
 9lmRgAajq5bs8ME3r7TEbvv02P1/cihouLYC2zqsoOZAuFRON/Ni2+AswGzARN8wGCxFAnpU
 J8swZn20Qz2JcvR/BFhuc1UdF1T296LMSfHnXlkFIQ7+jKm9haLJN4Mumknfx83bpZfI1cFh
 XM/XysLtPe/21PwPMdKj3+ZUZx2ncAM6/y4PhwrUja+SscoL1LWlM2fTUWRw3rsgCARfVIXY
 v+mnTKXJS9CU8xPlWPuL89EiOND7n1gmQv7GM6qpzz6gev2TCPEEt8tbQrRBt3VGYvZ+m05B
 f4FaZvTo/ieOcWjChTqHXk7dgFVfSNlVMGv+6S6tIere2JbJY3oMNeJqZtJRmCvt/U9ej7g8
 i7vV0lG5kD4gHGbewyGZmo6MOHkXIplrGJ9NispZA76138maIepzaEea5poIuV3qL09laZ5H
 6sfZsGNIvVTUTCbqT4TWobw8d55fxOxiAPQYyf8OGojf4RtThDi88P/ele97zEHCye67JNso
 7Cp2g7Bb4AEQgBuUJTfZP61lgvjtnkBguNiGUDPJ4ALKknr9YFrLQ33j+M2fJ5QeUmSmGPC2
 l/PUxkCpOTLr4sky/XzhPiJ/9WzDu9zPktGBG2Hv7y4AjbXozi4yohaXefWIT2EDDHo+L+vb
 Pl+xu3nNKFVh05DtodxHuo5za864Nez9bZWwh49QSfOZlWvTLhhPmOHzY9EsagUnu1Vvg6/W
 0Su/NhGOOrWZJO5QQBJfAd1PP6e0fw0myXJ6aVnKUr30yZ74b6bXBgAJBKLkiFccON4PY5NL
 T3NYyLKB9hTUiYXD+s=
IronPort-HdrOrdr: A9a23:xf7ESaHqRoyJcDwNpLqE5MeALOsnbusQ8zAXP0AYc3Jom6uj5q
 eTdZUgpHvJYVkqOE3I9ertBEDiewK4yXcW2/hzAV7KZmCP0wHEEGgL1/qF/9SKIUzDH4Bmup
 uIC5IOauHNMQ==
X-IronPort-AV: E=Sophos;i="5.88,286,1635220800"; 
   d="scan'208";a="61837954"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/hvm: Improve hvm_set_guest_pat() code generation
Date: Thu, 13 Jan 2022 13:50:35 +0000
Message-ID: <20220113135035.23361-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This is a fastpath on virtual vmentry/exit, and forcing guest_pat to be
spilled to the stack is bad.  Performing the shift in a register is far more
efficient.

Drop the (IMO useless) log message.  MSR_PAT only gets altered on boot, and a
bad value will be entirely evident in the ensuing #GP backtrace.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/hvm/hvm.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index d233550ae47b..e3c9b3794544 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -299,13 +299,13 @@ void hvm_get_guest_pat(struct vcpu *v, u64 *guest_pat)
         *guest_pat = v->arch.hvm.pat_cr;
 }
 
-int hvm_set_guest_pat(struct vcpu *v, u64 guest_pat)
+int hvm_set_guest_pat(struct vcpu *v, uint64_t guest_pat)
 {
-    int i;
-    uint8_t *value = (uint8_t *)&guest_pat;
+    unsigned int i;
+    uint64_t tmp;
 
-    for ( i = 0; i < 8; i++ )
-        switch ( value[i] )
+    for ( i = 0, tmp = guest_pat; i < 8; i++, tmp >>= 8 )
+        switch ( tmp & 0xff )
         {
         case PAT_TYPE_UC_MINUS:
         case PAT_TYPE_UNCACHABLE:
@@ -313,10 +313,9 @@ int hvm_set_guest_pat(struct vcpu *v, u64 guest_pat)
         case PAT_TYPE_WRCOMB:
         case PAT_TYPE_WRPROT:
         case PAT_TYPE_WRTHROUGH:
-            break;
+            continue;
+
         default:
-            HVM_DBG_LOG(DBG_LEVEL_MSR, "invalid guest PAT: %"PRIx64"\n",
-                        guest_pat); 
             return 0;
         }
 
-- 
2.11.0


