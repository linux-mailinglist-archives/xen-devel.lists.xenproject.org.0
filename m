Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C73C79F2D9
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 22:28:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601589.937679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgWTN-0006OS-8f; Wed, 13 Sep 2023 20:28:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601589.937679; Wed, 13 Sep 2023 20:28:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgWTN-0006Cl-2o; Wed, 13 Sep 2023 20:28:29 +0000
Received: by outflank-mailman (input) for mailman id 601589;
 Wed, 13 Sep 2023 20:28:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z4av=E5=citrix.com=prvs=613b8bbe6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qgWTL-0004dA-0L
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 20:28:27 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16309a95-5274-11ee-8787-cb3800f73035;
 Wed, 13 Sep 2023 22:28:25 +0200 (CEST)
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
X-Inumbo-ID: 16309a95-5274-11ee-8787-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694636904;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=E+h+v4bt4jUOs5MOxa+tFxGF/9LxGqNV0dJqFrllWuI=;
  b=WG5EO7zlDcYebsc4YuCjGQr9m+mT+IDKJp5L61g4WMuTBeGLEuaqfUqE
   UrVzIRo4BfOaoR/5FSuqbe5s1UxbPNezw01u5vtuZhb1mkbskMjWnlu/m
   uKBHUz+kMk6hu8yAe3MhmLDZnx7yZL7I1pUMH3vg88lZ1+AKQQI3n349p
   Q=;
X-CSE-ConnectionGUID: tqLoj7ejQSK+P4DSBC/0tA==
X-CSE-MsgGUID: XVEXRFZxRcidLwrm+Vs7Sw==
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 125280890
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:B4Tn7aPorHFncWDvrR2zl8FynXyQoLVcMsEvi/4bfWQNrUp21WQHn
 2AdCGCHa/aDZDP2KdF/Ooi3/E9Qu5DSzdRkHQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CQ6jefQAOOkVIYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/jrRC9H5qyo42tJ5wdmPpingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0vpuJWZMq
 vEaEQsuLSjfq9mc6/XjVsA506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLoXmuuyi2a5WDpfsF+P/oI84nTJzRw327/oWDbQUoXQGJ8FxhbJ/
 goq+UzJPDwqDvKt2QCO836ImfXK3h3gB7kNQejQGvlC3wTImz175ActfUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxasnDQRRt5RGO0S8xyWx+zf5APxLncAZi5MbpohrsBeeNAx/
 gbXxZWzX2Up6eDLDyvHrd94sA9eJwAJNEsFZ3AJTzI+wJrb/K0IpDmIFspKRfvdYsLOJRn8x
 DWDrS4bjroVjNIW26jTwW0rkw5AtbCSEFdru1y/snaNq1ogOdX7P9DABU3zt64oEWqPcrWWU
 JHoceC65ftGM5yCnTflrA4lTODwvKbt3NExbDdS83gdG9aFoS7LkWN4umsWyKJV3iEsIGWBX
 aMrkVkNjKK/xVPzBUONX6q/Ct4x0Y/rHsn/W/bfY7JmO8YgKFHcpHkyOxPOjggBdXTAdollZ
 f+mnTuEVy5GWcyLMhLoLwvi7VPb7n9nnj6CLXwK5x+mzaCfdBaopUQtaTOzghQCxPrc+m39q
 o8PX/ZmPj0DCIUSlAGLq99MRb3LRFBnba3LRzt/KrLcelc/SDF5YxITqJt4E7FYc21uvr+g1
 hmAtoVwmDITWVWvxd22V01e
IronPort-HdrOrdr: A9a23:EfUkcaFlA/GyOoMxpLqE5MeALOsnbusQ8zAXP0AYc3Jom6uj5q
 eTdZUgpHvJYVkqOE3I9ertBEDiewK4yXcW2/hzAV7KZmCP0wHEEGgL1/qF/9SKIUzDH4Bmup
 uIC5IOauHNMQ==
X-Talos-CUID: 9a23:DvCYvWBDzYURAzz6EzV+0EkWRc0nS0b+j0+MD3SSIiExVJTAHA==
X-Talos-MUID: 9a23:HqnvEgnuhWjZ9z9aAG6qdnpSCupY2YqcGHoGkJkipNOBdhJrZAyC2WE=
X-IronPort-AV: E=Sophos;i="6.02,144,1688443200"; 
   d="scan'208";a="125280890"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 0/8] x86/spec-ctrl: AMD DIV fix, and VERW prerequisite bugfixes
Date: Wed, 13 Sep 2023 21:27:50 +0100
Message-ID: <20230913202758.508225-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Patch 8 is the XSA-439 fix for the AMD DIV issue, disclosed insufficiently
ahead of August 8th for us to prepare a fix for the embargo.

Patches 1 thru 7 are prerequisites, identified while trying to write patch 8.

All 8 patches are for all security trees.

Andrew Cooper (8):
  x86/spec-ctrl: Fix confusion between SPEC_CTRL_EXIT_TO_XEN{,_IST}
  x86/spec-ctrl: Fold DO_SPEC_CTRL_EXIT_TO_XEN into it's single user
  x86/spec-ctrl: Turn the remaining SPEC_CTRL_{ENTRY,EXIT}_* into asm macros
  x86/spec-ctrl: Extend all SPEC_CTRL_{ENTER,EXIT}_* comments
  x86/entry: Adjust restore_all_xen to hold stack_end in %r14
  x86/entry: Track the IST-ness of an entry for the exit paths
  x86/spec-ctrl: Issue VERW during IST exit to Xen
  x86/spec-ctrl: Mitigate the Zen1 DIV leakge

 docs/misc/xen-command-line.pandoc        |   6 +-
 xen/arch/x86/hvm/svm/entry.S             |   1 +
 xen/arch/x86/include/asm/cpufeatures.h   |   2 +-
 xen/arch/x86/include/asm/spec_ctrl_asm.h | 150 ++++++++++++++++-------
 xen/arch/x86/spec_ctrl.c                 |  45 ++++++-
 xen/arch/x86/traps.c                     |  13 ++
 xen/arch/x86/x86_64/compat/entry.S       |   9 +-
 xen/arch/x86/x86_64/entry.S              |  31 +++--
 8 files changed, 198 insertions(+), 59 deletions(-)


base-commit: 6aa25c32180ab59081c73bae4c568367d9133a1f
-- 
2.30.2


