Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C176C4C7DCD
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 23:53:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280762.478817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOorv-0001YR-J9; Mon, 28 Feb 2022 22:51:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280762.478817; Mon, 28 Feb 2022 22:51:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOorv-0001WM-GF; Mon, 28 Feb 2022 22:51:51 +0000
Received: by outflank-mailman (input) for mailman id 280762;
 Mon, 28 Feb 2022 22:51:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3PPb=TL=citrix.com=prvs=0512ed4f8=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nOoru-0001WF-LH
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 22:51:50 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0164172b-98e9-11ec-8539-5f4723681683;
 Mon, 28 Feb 2022 23:51:47 +0100 (CET)
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
X-Inumbo-ID: 0164172b-98e9-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646088707;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rB3SEPzzkQAvW0/fHf3gf9OHT/NLDK1BJr8fdP433E4=;
  b=Q4FWjZpzg3GsRBKp9dFsf1s7FXcfhWrK9QuEzmcWxG5+PLe7Co3GuAwi
   vlH0W4EhIrBb1sNRD6CfsYhjdCDB1kF4xC7B6IUGKxhku0TOu/Gu294Ja
   4/klsFvNRa5Y9a0to9FEPli10zwkEUSuROgaCdEbNURGMtpGQ+6kqT1aT
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 67453921
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:NbMHf6zRTiLv1Pyoj6J6t+czxirEfRIJ4+MujC+fZmUNrF6WrkUPz
 mEfDGmEOa7fYzDye90kboSwpElSv8WGyodmHgpvqSAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NYy24jhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NpllKWIQjsuJf32uOE7UUZ8OAM5PoEbweqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6AO
 JZEMms1NXwsZTV/ZFIMJpEkrN6tn3vBfiBcqBWOu6Qetj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKjMwOcGbyDGF2mmxneKJliT+MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO8wD0AqxzbGE2SacIGpbahVjL98K6fZjEFTGy
 WS1t9/uADVutpicRnSc6qqYoFuOBMQFEYMRTXRaFFVYurEPtKl210uSFYg7TMZZm/WoQWmY/
 tyckMQpa1z/Z+Yv3r7zw13IiinESnPhHl9svVW/so5IA2pEiG+Zi26AtACzARVodt/xory9U
 J4swZD2AAcmV8zlqcB1aL9RdIxFHt7cWNEmvXZhHoM66xOm8GO5cIZb7VlWfRk1bJ5bImG1O
 RaK6Gu9AaO/2lPwNsebhKrrVqwXIVXIT4y5Bpg4kPIUCnSOSON31H43PhPBt4wcuEMtjbs+K
 f+mnTWEVh4n5VBc5GPuHY81iOZzrghnnD+7bc2rnnyPjOvFDFbIGOhtDbd7Rr1ghE9yiF6Oq
 Ig32grj40g3bdASlQGMqd9DdQ1RdCNjbX00wuQOHtO+zsNdMDlJI5fsLXkJIuSJQ4w9ej/0w
 0yA
IronPort-HdrOrdr: A9a23:nqOVNqyU3ur40HF399rAKrPwKL1zdoMgy1knxilNoHtuA6ulfq
 GV7ZAmPHrP4wr5N0tNpTntAsa9qBDnlaKdg7N+AV7KZmCP0gaVxepZjLfK8nnNHDD/6/4Y9Y
 oISdkaNDQoNykYsS8t2njbL+od
X-IronPort-AV: E=Sophos;i="5.90,144,1643691600"; 
   d="scan'208";a="67453921"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/spec-ctrl: Disable retpolines with CET-IBT
Date: Mon, 28 Feb 2022 22:51:17 +0000
Message-ID: <20220228225117.14327-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

CET-IBT depend on executing indirect branches for protections to apply.
Extend the clobber for CET-SS to all of CET.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

I can't decide if this wants a fixes tag or not.  If I'd remembered during the
CET series, it would have been its own patch.  Functionally, it depends on c/s
cdbe2b0a1aec which sets CR4.CET fairly early during boot.
---
 xen/arch/x86/spec_ctrl.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 2d4cf5c7ef80..12bf1c5722f9 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -944,10 +944,11 @@ void __init init_speculation_mitigations(void)
                      boot_cpu_has(X86_FEATURE_IBRS));
 
     /*
-     * First, disable the use of retpolines if Xen is using shadow stacks, as
-     * they are incompatible.
+     * First, disable the use of retpolines if Xen is using CET.  Retpolines
+     * are a ROP gadget so incompatbile with Shadow Stacks, while IBT depends
+     * on executing indirect branches for the safety properties to apply.
      */
-    if ( cpu_has_xen_shstk &&
+    if ( (read_cr4() & X86_CR4_CET) &&
          (opt_thunk == THUNK_DEFAULT || opt_thunk == THUNK_RETPOLINE) )
         thunk = THUNK_JMP;
 
-- 
2.11.0


