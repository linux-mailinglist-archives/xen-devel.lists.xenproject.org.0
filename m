Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C7D7A283A
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 22:37:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603364.940364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhFYc-0002Ag-Qn; Fri, 15 Sep 2023 20:36:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603364.940364; Fri, 15 Sep 2023 20:36:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhFYc-00028U-Nw; Fri, 15 Sep 2023 20:36:54 +0000
Received: by outflank-mailman (input) for mailman id 603364;
 Fri, 15 Sep 2023 20:36:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zf2R=E7=citrix.com=prvs=615989724=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qhFYb-0001T8-Ar
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 20:36:53 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99829174-5407-11ee-8788-cb3800f73035;
 Fri, 15 Sep 2023 22:36:52 +0200 (CEST)
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
X-Inumbo-ID: 99829174-5407-11ee-8788-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694810212;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6WDc7zyoVsjtMjW1jLq2dlxmIWqlGJOcjLcAUEyxqAo=;
  b=c8aICIqQedDR1EHGCaTle+OYk6o/VUY9KiNiKhcnSss2TsTZnHBMzAkw
   aUWaPRN2wTl3C5F901Yp3KKcUsm6Z4ovKuWLDAlLlkAIyMULyOeGLnFkC
   LVhpJOg/qttxo724a8ct+NGqLEFAgCtOxW6QJyD7g6jaZXEG8eM1TpGSw
   s=;
X-CSE-ConnectionGUID: kAevLBhUSueOHby+POGfdA==
X-CSE-MsgGUID: LNRwdEl4ScWMeCrdwisn/A==
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 125538998
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:zFtGdqh0zv5rZufLDF5Yi4mEX161VhAKZh0ujC45NGQN5FlHY01je
 htvUTqGO/7YYmTxKdEkYYnipEgDupbWmoA2HQVqqX89Fisb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOhTraCYmYoHVMMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyo0N8klgZmP6sT7QaDzyJ94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQbAT0TSjqDutmrzZWbQPgvvuMMIsXCadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XWjtUsl+K44Ew5HDe1ldZ27nxKtvFPNeNQK25m27B/
 D+bpDSoU0Fy2Nq37Ry/7X6BgrP0lhzeVakIGKK57fgtqQjGroAUIEJPDgbqyRWjsWauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O88Q5RyJy6HUyx2EHWVCRTlEAPQ5sOcmSDps0
 UWG9/vrBDposPuWQHSSsLSOhTy3MCkRa2QFYEc5oRAtuoe55ttp11SWE4glSfTu5jHoJd3u6
 zOjoTYarbUuttMG8IWx7BP/pB2iqrGcG2bZ+T7rdm6i6wp4YqusaIqp9UXX4J58EWqJcrWSl
 CNawpbDtYjiGbnIzXXQG7tVQNlF8t7faFXhbUhT847NHthH01qqZshu7T53Py+F2e5UKGayM
 Cc/Ve68jaK/3UdGj4ctM+pd6Oxwl8AM8OgJsdiNNLJzjmBZLlPvwc2XTRf4M5rRuEYti7ojH
 pyQbNyhC30XYYw+kmvqF79Hju92ln1nrY82eXwd507/uVZ5TCTOIYrpzXPUNrxphE96iFq9H
 ylj2zuilEwEDbyWjtj/+o8PN1EaRUXX9rivw/G7gtWre1I8cEl4Uq+5/F/UU9A990ijvruSr
 y7Vt44x4AaXuEAr3i3RMyk5MO6+DMonxZ/5VAR1VWuVN7EYSd7HxM8im1EfI9HLKMQLISZIc
 sQ4
IronPort-HdrOrdr: A9a23:ps+9m6CySadCT8blHemg55DYdb4zR+YMi2TC1yhKJyC9Ffbo8P
 xG/c5rsSMc5wxwZJhNo7y90cq7MBbhHPxOkOos1N6ZNWGM0gaVxelZnO3fKlbbehEWmNQz6U
 4ZSdkdNOHN
X-Talos-CUID: 9a23:B31/BmMIklbQI+5DWwBq6mo+Gv0eb3D67H3BYHefJmhlYejA
X-Talos-MUID: =?us-ascii?q?9a23=3AZSJV/gxIrx0FK7MqkymBujuqHx+aqICIMl8BvJF?=
 =?us-ascii?q?agMK7ECFbITuCjS+xBaZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.02,150,1688443200"; 
   d="scan'208";a="125538998"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jinoh Kang
	<jinoh.kang.kr@gmail.com>
Subject: [PATCH v2 0/7] x86/pv: #DB vs %dr6 fixes, part 2
Date: Fri, 15 Sep 2023 21:36:21 +0100
Message-ID: <20230915203628.837732-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This time with a bit of sanity testing.  See patches for details.

Andrew Cooper (7):
  x86/emul: ASSERT that X86EMUL_DONE doesn't escape to callers
  x86/emul: Fix and extend #DB trap handling
  x86/pv: Fix the determiniation of whether to inject #DB
  x86/pv: Drop priv_op_ctxt.bpmatch and use pending_dbg instead
  x86: Introduce x86_merge_dr6()
  x86: Extend x86_event with a pending_dbg field
  x86/pv: Rewrite %dr6 handling

 xen/arch/x86/debug.c                   | 20 +++++++++++++++++
 xen/arch/x86/include/asm/debugreg.h    |  7 ++++++
 xen/arch/x86/include/asm/domain.h      | 18 ++++++++++++++--
 xen/arch/x86/include/asm/hvm/hvm.h     |  3 ++-
 xen/arch/x86/include/asm/x86-defns.h   |  7 ++++++
 xen/arch/x86/pv/emul-priv-op.c         | 30 +++++++++++++-------------
 xen/arch/x86/pv/emulate.c              |  9 ++++++--
 xen/arch/x86/pv/ro-page-fault.c        |  4 ++--
 xen/arch/x86/pv/traps.c                | 17 +++++++++++----
 xen/arch/x86/traps.c                   | 23 ++++++++++----------
 xen/arch/x86/x86_emulate/x86_emulate.c | 26 ++++++++++++++++------
 xen/arch/x86/x86_emulate/x86_emulate.h | 19 ++++++++++++----
 12 files changed, 134 insertions(+), 49 deletions(-)

-- 
2.30.2


