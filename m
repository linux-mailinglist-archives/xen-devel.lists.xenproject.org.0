Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F26A59F846
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 13:00:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392409.630773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQo72-0002BW-RX; Wed, 24 Aug 2022 10:59:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392409.630773; Wed, 24 Aug 2022 10:59:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQo72-00027l-Nu; Wed, 24 Aug 2022 10:59:56 +0000
Received: by outflank-mailman (input) for mailman id 392409;
 Wed, 24 Aug 2022 10:59:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ebS+=Y4=citrix.com=prvs=22883313c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oQo70-0001Gd-Pf
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 10:59:54 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0e3da7d-239b-11ed-bd2e-47488cf2e6aa;
 Wed, 24 Aug 2022 12:59:53 +0200 (CEST)
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
X-Inumbo-ID: e0e3da7d-239b-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1661338793;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Hh19WK2pWTvwywXOkao9tOq09kUC7LQDI65VpWZ9804=;
  b=RV3jqLA0ubkB21wHe3K2hgYvGnBGXtVWuFrmKNbQ2oQUzyQMBXWQoH5p
   +zCS+Hkua9BF2Lr4XgN3TnQo2ohgl7O1hHQc+9U2mNyze8QYoDdHEBOEH
   x+xlou2KzflruSAj0lBcZlola1Bq6BVcDfpvdEBSBVLgmkiI7d74ui81p
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 79232773
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:sDPgIqhcTr5B3pebbTS1dzapX161AxAKZh0ujC45NGQN5FlHY01je
 htvW2GAa6uMajP0etolOYrk/B8HupfRm9FrTlQ5/isyRiMb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6j+fQLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtH8CA6W0
 T/Ii5S31GSNhnglaQr414rZ8Ek15KSo5GtB1rADTasjUGH2xiF94K03fcldH1OgKqFIE+izQ
 fr0zb3R1gs1KD90V7tJOp6iGqE7aua60Tqm0xK6aID76vR2nQQg075TCRYpQRw/ZwNlPTxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJQWXAP6I0DuKhPRL/tS4E4eH48kxfxtQkR0z
 vU8JBs2Sh6upfrtz+fuIgVsrpxLwMjDOYoevjdrzC3DDOZgSpfGK0nIzYYGhnFq3JkIRKuAI
 ZpCAdZsRE2ojxlnE1EbEp8h2syvgWHyaWZwo1OJv6snpWPUyWSd1ZCyYYCOIIPVHq25mG6Jr
 zjm0mCnWSocC8aAmDaMqlmhtvDAyHaTtIU6S+Tjq68CbEeo7nMXIA0bUx28u/bRomyUVs9bK
 kcU0jEztqV0/0uuJvHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpVTA9nJZoH3pwj
 AbPxo63Q2w02FGIdZ6D3pWWkQyoI2swF1QLQSMvdi8Lzvv7+45m23ojUe1f/L6JYszdQG+um
 mrT/Xhi2t3/nuZQifzloAmvbyaE48GQE1Vrvli/sneNtFsRWWKzW2C/BbE3B95kJZ3RcFSOt
 WNsdyO2vLFXVsHleMBgrYww8FCVCxWtamS0baZHRcVJythU0yfLkXpsyD9/Plx1Fc0PZCXkZ
 kTe0SsIusEKZiT7PPUpONLhYyjP8UQHPYWNaxwpRoAWPsgZmPGvpkmCmnJ8L0iyyRNxwMnTy
 L+QcNq2DGZyNJmLOAGeHr5FuYLHMwhkmgs/s7inkEn8uVdfDVbJIYo43KymNLlis/jZ+l2Mq
 r6y9aKikn1ibQE3WQGPmaZ7ELzABSFT6UzewyCPStO+Hw==
IronPort-HdrOrdr: A9a23:Lj+IwqNsuaWczMBcTvujsMiBIKoaSvp037Eqv3oRdfUzSL3hqy
 nOpoVj6faaskdzZJhNo7+90ey7MBfhHP1OkO8s1NWZLWvbUQKTRekIh+aP/9SjIVyYygc079
 YaT0EUMr3N5DZB4/oSmDPIduod/A==
X-IronPort-AV: E=Sophos;i="5.93,260,1654574400"; 
   d="scan'208";a="79232773"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 2/4] x86/hvmloader: Don't build as PIC/PIE
Date: Wed, 24 Aug 2022 11:59:13 +0100
Message-ID: <20220824105915.32127-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220824105915.32127-1-andrew.cooper3@citrix.com>
References: <20220824105915.32127-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

HVMLoader is not relocatable in memory, and 32bit PIC code has a large
overhead.  Build it as non-relocatable.

Bloat-o-meter reports a net:
  add/remove: 0/0 grow/shrink: 3/107 up/down: 14/-3370 (-3356)

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 tools/firmware/hvmloader/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/firmware/hvmloader/Makefile b/tools/firmware/hvmloader/Makefile
index 4f31c881613c..eb757819274b 100644
--- a/tools/firmware/hvmloader/Makefile
+++ b/tools/firmware/hvmloader/Makefile
@@ -23,7 +23,8 @@ include $(XEN_ROOT)/tools/firmware/Rules.mk
 # SMBIOS spec requires format mm/dd/yyyy
 SMBIOS_REL_DATE ?= $(shell date +%m/%d/%Y)
 
-CFLAGS += $(CFLAGS_xeninclude)
+CFLAGS += $(CFLAGS_xeninclude) -fno-pic
+$(call cc-option-add,CFLAGS,-no-pie)
 
 # We mustn't use tools-only public interfaces.
 CFLAGS += -D__XEN_INTERFACE_VERSION__=__XEN_LATEST_INTERFACE_VERSION__
-- 
2.11.0


