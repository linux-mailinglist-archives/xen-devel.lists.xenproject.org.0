Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A74917F372F
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 21:16:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638181.994521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5XA8-0007TX-0u; Tue, 21 Nov 2023 20:16:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638181.994521; Tue, 21 Nov 2023 20:15:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5XA7-0007Re-S1; Tue, 21 Nov 2023 20:15:59 +0000
Received: by outflank-mailman (input) for mailman id 638181;
 Tue, 21 Nov 2023 20:15:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T8a9=HC=citrix.com=prvs=682c61bdb=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1r5XA6-0007Bx-1J
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 20:15:58 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5c81c9d-88aa-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 21:15:55 +0100 (CET)
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
X-Inumbo-ID: c5c81c9d-88aa-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1700597755;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=r+o6oETfRoLUaoMxN0EAjgPAjp4KWInoqOVukWaKJ9c=;
  b=GQ2HIE+jxtUTGmxdd/E4qr2bFPX1uSfBqNJbhxSKaTuLxYfNlAId9TDn
   er3s5d9CQxsUvpK/FgUwAE3o0SQ+D+f1Sq6XAgs4dtryLnJnHykIhSdbi
   GTvrLZLF5WhU7NityjCXtOyXGTZ8oYp/SOJqXYAZOBvfk8R3OcwKaybo8
   4=;
X-CSE-ConnectionGUID: Kx3BjExzTHqqzSgoe6KDkA==
X-CSE-MsgGUID: aCRa83ClSFWBUEh0roJy8Q==
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 128691934
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:tNO4Iq+sZamhhAIkPbh3DrUDfH6TJUtcMsCJ2f8bNWPcYEJGY0x3z
 GtOUGuGPPmMY2Wmfo1wPNvk8UkAup6Az4RmG1c/+Cs8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjVAOK6UKidYnwZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ksz1BjOkGlA5AdnPKoS5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklt5
 acyKh0dfCyjnvuk+728R7dPqscKeZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUWGPEUn1lQ/UfrSmM+BgHXlfiIeg1WSvactuEDYzRBr0airO93QEjCPbZwPzhjJ/
 zOdowwVBDkTH+aWmWGu9kmCucXysCOjQoUwBe2Bo6sCbFq7mTVIVUx+uUGAiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0efBdDuk74wGl0bfP7kCSAW1sZiVadNUsucsyRDor/
 lyEhdXkAXpoqrL9YW2Z3qeZq3W1Iyd9BW0fYS4JSyMV7t+lp5s85jrxSdJkHL+wn8fCMzj6y
 DCXrwAzn7wWy8UM0s2T913dnyiloJSPSwcv/xjWRUqs9AY/b4mgD6St6FPb5PIGK5yLQ12pt
 X0I3cOZ6YgmF5aHmTaRR6MHFb6v7uyMGDfBjkViGZZn/DOok1alfItX5Dg4Okp1KMcCeBfjf
 UDItAVeopRUOROXgbRfOtzrTZ5wlO65SIWjCai8gsdyjoZZVx/c1iNDdVys/3n0gnMjlqxhG
 ruYWJP5ZZoFMpiL3AZaVs9Ejudzm3BkmDyDLa0X2ShLxlZ3WZJ0dVvmGAHXBgzBxPnYyDg5C
 v4GXydw9z1RUfflfg7c+pMJIFYBIBATXM+u85EGL7DeclM/RAnN7sM9J5t7I+SJeIwMxo/1E
 oyVABcEmDITe1WbQel1VpyTQOy2BssuxZ7KFSctIUypyxAejXWHtc8im28MVeB/roRLlKckJ
 8Tpju3cWpyjvByboWVCBXQ8xaQ+HCmWafWmZnP+OGFnL8c9G2QkOLbMJ2PSycXHNQLv3eNWn
 lFq/lqzrUYrL+i6MPvrVQ==
IronPort-HdrOrdr: A9a23:oa0qdq2BCm8zoFNh/UryUgqjBL4kLtp133Aq2lEZdPRUGvb3qy
 nIpoV96faUskd0ZJhOo7C90cW7LU80lqQFhLX5X43SPzUO0VHAROoJgLcKqweQfREWndQ96U
 4PScdD4aXLfDpHsfo=
X-Talos-CUID: =?us-ascii?q?9a23=3AdTIu1mr1QS0FxrgpGWiagDvmUeM1KVff4WfCH2+?=
 =?us-ascii?q?hEHRSR7qYF3y8+4oxxg=3D=3D?=
X-Talos-MUID: 9a23:hUa89Al9uMzuOIxjtqGxdnprH/1hs/+FDHsjrr87lsncLytSKmek2WE=
X-IronPort-AV: E=Sophos;i="6.04,216,1695700800"; 
   d="scan'208";a="128691934"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Roberto Bagnara
	<roberto.bagnara@bugseng.com>, Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH v2 0/5] xen: Enable -Wwrite-strings
Date: Tue, 21 Nov 2023 20:15:35 +0000
Message-ID: <20231121201540.1528161-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Some patches from v1 committed.  This is the rest, and they're mostly
rewritten from scratch.

CI:
  https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1080695374
  https://cirrus-ci.com/build/5494986230202368

Andrew Cooper (5):
  x86/setup: Clean up cmdline handling in create_dom0()
  x86/setup: Rework cmdline_cook() to be compatible with -Wwrite-strings
  x86/efi: Simplify efi_arch_handle_cmdline()
  arm/efi: Simplify efi_arch_handle_cmdline()
  xen: Enable -Wwrite-strings

 xen/Makefile                |  2 +-
 xen/arch/arm/efi/efi-boot.h | 16 +----------
 xen/arch/x86/efi/efi-boot.h | 10 +------
 xen/arch/x86/setup.c        | 56 ++++++++++++++++++++-----------------
 4 files changed, 34 insertions(+), 50 deletions(-)


base-commit: 10081c2dc571775b538bb00982606a39832ad7e3
-- 
2.30.2


