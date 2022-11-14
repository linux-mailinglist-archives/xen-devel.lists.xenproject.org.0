Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC5A628B82
	for <lists+xen-devel@lfdr.de>; Mon, 14 Nov 2022 22:44:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443582.698206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouhFQ-0004r7-BX; Mon, 14 Nov 2022 21:44:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443582.698206; Mon, 14 Nov 2022 21:44:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouhFQ-0004oK-86; Mon, 14 Nov 2022 21:44:08 +0000
Received: by outflank-mailman (input) for mailman id 443582;
 Mon, 14 Nov 2022 21:44:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Ip0=3O=citrix.com=prvs=31080188b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ouhFO-0004oB-1Q
 for xen-devel@lists.xenproject.org; Mon, 14 Nov 2022 21:44:06 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7448a6de-6465-11ed-91b6-6bf2151ebd3b;
 Mon, 14 Nov 2022 22:44:04 +0100 (CET)
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
X-Inumbo-ID: 7448a6de-6465-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668462244;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=h2OAyHLea+exyEJ7uLsi7jSK7CEsyDrXg/IeWLpxi8w=;
  b=SQVeqwchNmM3xyiHd1MNQYCGMS8oalDUlmNWU7c15pRxnkF4446B7YZQ
   nssvQAloNyNjGECqeUmg9mNXuYcb/Q5N8subiKZeO3rNEkhrtohMVAR/i
   ir+P+uIjcGFUHfDcfrznkJaP0tHFJmvBXHKkaDfx0+xGfAgVvXBsjEAfA
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 85231925
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:GwXwXKOeKqD1i/zvrR2ul8FynXyQoLVcMsEvi/4bfWQNrUon1jcAz
 GoaCzrVbPyCZWf3ftlybYnk8kxTu8LRx9RhSgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvzrRC9H5qyo4mpB5wBmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0uVqXWdh/
 vlAFDcqdVPfp8mm8Jy1ePY506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w/N3wsYDUWUrsTILs4kP2lmT/UdDpApUjOjaE2/3LS3Ep6172F3N/9KoHQHpwExBvwS
 mTu/kCkGD0VNI2jyCPc+XaJ3snegHnKR9dHfFG/3qEz2wDCroAJMzUJUXOrrP//jVSxM/p/J
 koO62wRpK493EWxS5/2WBjQiG6JuFsQVsRdF8U+6RqR0ezE7gCBHG8GQzVdLts8u6ceZxYny
 1uIlNPBHiF0vfueTnf1y1uPhWrsY25PdzZEPHJaC1teizX+nG0tphHSEtBMG6vtstrSAnKs4
 xuanAYwtapG2KbnyJ6H1VzAhjutoL3AQQg0+hjbUwqZ0+9pWGK2T9f2sAaGtJ6sOK7cFwDc5
 yZcx6By+chUVfmweDqxrPLh9V1Dz9KMK3XijFFmBPHNHBz9qif4Lei8DNyTTXqF0/romxezP
 yc/WisLvve/2UdGiocpC79d8+xwkcDd+S3ND5g5rrNmO/CdjjOv8iB0flK31GvwikUqmqxXE
 c7FL5bwUC5LUfo6k2DeqwIhPVgDn35W+I8ubcqjk0TPPUS2ORZ5tovpwHPRN7tkvctoUS3e8
 spFNtvi9vmseLSWX8QWmKZNRW03wY8TXM2u8pQJKLfZemKL2ggJUpfs/F/oQKQ994w9qwsC1
 ivVtpNwoLYnuUD6FA==
IronPort-HdrOrdr: A9a23:cdH5cKlX2axZGQUdl0mz8KSrYUjpDfIm3DAbv31ZSRFFG/Fxl6
 iV88jzsiWE7Ar5OUtQ/OxoV5PgfZqxz/NICOoqTNWftWvd2FdARbsKheCJ/9SJIVyYygc378
 ldmsZFZOEYdWIK7vrH3A==
X-IronPort-AV: E=Sophos;i="5.96,164,1665460800"; 
   d="scan'208";a="85231925"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH for-4.17] x86/spec-ctrl: Fill in whitepaper URL
Date: Mon, 14 Nov 2022 21:43:58 +0000
Message-ID: <20221114214358.17611-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

... now that we a link available.

Fixes: 9deaf2d932f0 ("x86/spec-ctrl: Enable Zen2 chickenbit")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Henry Wang <Henry.Wang@arm.com>

For 4.17(?)  Seeing if I can sneak it in as just a documentation change,
seeing as there are others outstanding.  If not, it can go into 4.18 and get
backported.
---
 xen/arch/x86/cpu/amd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 05d72c6501ee..af46d7119bbe 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -827,7 +827,7 @@ void amd_set_ssbd(bool enable)
  * On Zen2 we offer this chicken (bit) on the altar of Speculation.
  *
  * Refer to the AMD Branch Type Confusion whitepaper:
- * https://XXX
+ * https://www.amd.com/system/files/documents/technical-guidance-for-mitigating-branch-type-confusion.pdf
  *
  * Setting this unnamed bit supposedly causes prediction information on
  * non-branch instructions to be ignored.  It is to be set unilaterally in
-- 
2.11.0


