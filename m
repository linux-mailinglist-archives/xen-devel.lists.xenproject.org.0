Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B53C07F43E1
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 11:29:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638665.995489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5kT7-0007AW-Dk; Wed, 22 Nov 2023 10:28:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638665.995489; Wed, 22 Nov 2023 10:28:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5kT7-00077e-Ap; Wed, 22 Nov 2023 10:28:29 +0000
Received: by outflank-mailman (input) for mailman id 638665;
 Wed, 22 Nov 2023 10:28:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dm5i=HD=citrix.com=prvs=683e23acf=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1r5kT5-00077Y-U9
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 10:28:27 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd369304-8921-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 11:28:24 +0100 (CET)
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
X-Inumbo-ID: dd369304-8921-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1700648904;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cZmur+XL/exnr6PEDDb8dLH9OoOne6ibOU5ReLuVUwY=;
  b=aLD27eWOI0VWtd3KAVCyy4xum1yxX4y6wqltEEYo4inkVMrl7WXjSLvl
   w4tZqE3VFpkSuOcDY/gGt6cfTS1Hl+KoJ8MeIDVX61x8duwyO8n69vtoL
   JXS1T+dG93MzL9D3aeiQKzHdFPWtlB5HK1uYiXNcs58HCxwT+liAegqzC
   Y=;
X-CSE-ConnectionGUID: j6rE86mdTv2jwYyZ8+kOTg==
X-CSE-MsgGUID: n4fB5TQnReCXt1qu9d5Ncg==
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 127481865
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:JAIrs64rTAfjeZYbK4MhMgxRtHHHchMFZxGqfqrLsTDasY5as4F+v
 mAYCGiObqnbN2r2eth1aNmzo0gOsZOBxoMwSFM+r3s8Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRG/ykTraCY3gtLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU34JwehBtC5gZlPKkR5geH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m9
 6ICBWBTaxy/mbi034OqeLkvheMfI5y+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmRJUIXUrsUIMtWcOOAr3/zaTBH7nmSorI6+TP7xw1tyrn9dtHSf7RmQO0MxBnE9
 juWoTmR7hcyMoCR42e5y3SWi8T/gXriRdMeSZuz+as/6LGU7jNKU0BHPbehmtGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c/h6HvA+6QqN4rHJ+AvfDW8BJhZebPQ2uclwQiYlv
 mJlhPuwW2Yp6ufMDyvAp/HL9VteJBT5M0cAOzUpHVUA7+X9+oMsvwP9HpVgN5K624id9S7L/
 9yakMQvr+xM1ZZWh//mogCvvt66mnTeoucICuTrsoGNtFoRiHaNPdDA1LQixa8owHylZleAp
 mMYvMOV8foDC5qA/ATUH71VQeDwuavVaWSA6bKKI3XH3271k5JEVdkAiAyS2W8zappUEdMXS
 BO7VfxtCG97YyLxMP4fj3OZAMU216nwfekJpdiNBueilqNZLVfdlAk3PB744owYuBR0+U3JE
 cvBIJnE4LdzIfgP8QdasM9HieBynHtjmDOLLX05pjz+uYejiLeuYe9tGDOzgioRtctofC29H
 w5jCva3
IronPort-HdrOrdr: A9a23:bvnJ96ApX1nMLdHlHemg55DYdb4zR+YMi2TC1yhKJyC9Ffbo8P
 xG/c5rsSMc5wxwZJhNo7y90cq7MBbhHPxOkOos1N6ZNWGM0gaVxelZnO3fKlbbehEWmNQz6U
 4ZSdkdNOHN
X-Talos-CUID: 9a23:JtTCrG6qV7sq5L55wdss9hAON5B7d3Hh0i3SPH6pOzYqS5qpRgrF
X-Talos-MUID: =?us-ascii?q?9a23=3AgmgC6QzORHOl6qPhKyoj0/ZT0l2aqKLyBmpQraw?=
 =?us-ascii?q?AgcSvBTApIirMgGmRSYByfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.04,218,1695700800"; 
   d="scan'208";a="127481865"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/mm: Fix up bad bool conversion in ept_set_entry()
Date: Wed, 22 Nov 2023 10:28:08 +0000
Message-ID: <20231122102808.1763303-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This accidentally turned a 1 into false.

Noticed by Coverity.

Reported-by: Jan Beulich <JBeulich@suse.com>
Fixes: de577618c285 ("x86/treewide: Switch bool_t to bool")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/mm/p2m-ept.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index 227bdf7c2433..f83610cb8cd8 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -803,7 +803,7 @@ ept_set_entry(struct p2m_domain *p2m, gfn_t gfn_, mfn_t mfn,
     bool need_modify_vtd_table = true;
     bool vtd_pte_present = false;
     unsigned int iommu_flags = p2m_get_iommu_flags(p2mt, p2ma, mfn);
-    bool needs_sync = false;
+    bool needs_sync = true;
     ept_entry_t old_entry = { .epte = 0 };
     ept_entry_t new_entry = { .epte = 0 };
     struct ept_data *ept = &p2m->ept;

base-commit: 10081c2dc571775b538bb00982606a39832ad7e3
-- 
2.30.2


