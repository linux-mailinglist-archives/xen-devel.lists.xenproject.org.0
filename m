Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 756B569CA62
	for <lists+xen-devel@lfdr.de>; Mon, 20 Feb 2023 13:00:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498063.768869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU4qV-0006cc-Ob; Mon, 20 Feb 2023 12:00:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498063.768869; Mon, 20 Feb 2023 12:00:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU4qV-0006aF-L5; Mon, 20 Feb 2023 12:00:39 +0000
Received: by outflank-mailman (input) for mailman id 498063;
 Mon, 20 Feb 2023 12:00:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CT8u=6Q=citrix.com=prvs=408b4b2b9=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pU4qT-0006JO-Ri
 for xen-devel@lists.xenproject.org; Mon, 20 Feb 2023 12:00:37 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d523350-b116-11ed-93b5-47a8fe42b414;
 Mon, 20 Feb 2023 13:00:35 +0100 (CET)
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
X-Inumbo-ID: 2d523350-b116-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676894435;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CuckuLGlYKJxYlRnLE4X2ClIoS5C7A3C2knFbaiWOW4=;
  b=I1ls6fJwyCXMUvnrdps2youp9hwjMi7XcAurTY3JDXENQAXvKjmrVHsE
   4b0ZfMUo0Q2lbK+3Utv4sqgUyuYcORHdFSieeoeyAZtwhdSZ2eK9nYo30
   LPlWA9NWosSxzdQeiZFgdkKRCdot0sDdA63/MS7XoNyq7NNzGs2f7mzhb
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 97740140
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:9WDwjK9/6Vw9QrbGi8gUDrUDqX6TJUtcMsCJ2f8bNWPcYEJGY0x3n
 WYZD26GO/qKYmryftx/YI+2oBhV75XWnINiHQE9qSA8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIw1BjOkGlA5AdmP6oT5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkl19
 bsAE3ccdCuPgtmd7p3hYO1n2vYKeZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAr3/zaTBH7nmSorI6+TP7xw1tyrn9dtHSf7RmQO0EwRnE/
 juapwwVBDkeFMa/yAu+7k6KudflsyildaUZSZCRo6sCbFq7mTVIVUx+uUGAifq+jFS3V5RAK
 kgX0i00pKM2+QqgSdyVdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QOluU7WDgr3
 V+hhM7yCHpkt7j9YW2Z3qeZq3W1Iyd9EIMZTXZaF01fuYCl+dxtyEuVFb6PDZJZkPXOGXbo+
 HebthMygo44o+FR/aGwoWLu1mfESofyciY54QDeX2SA5wx/ZZK4a4HA1WU3/cqsP67CEADf4
 SFsd9y2qblXUMrTzHDlrPAlRunB2hqTDNHLbbeD9bEF/i/lxXOsdJs4DNpWdBYwaZZsldMEj
 SbuVeJtCH17ZiTCgUxfOdjZ5yEWIU/ITI2NaxwsRoASCqWdjSfelM2UWWae3nr2jG8nmrwlN
 JGQfK6EVChFV/Q8lWTtGrhFitfHIxzSIkuJGPjGI+mPi+LCNBZ5t59YWLdxUgzJxPzd+1iEm
 zquH8CL1w9eQIXDjtr/qOYuwaQxBSFjX/je8pUHHtNv1yI6QAnN/deNm+J+E2Gk9owJ/tr1E
 oaVABEBmAev2iGWcG1nqBlLMdvSYHq2llpjVQREALpi8yJyCWpzxM/zr6cKQIQ=
IronPort-HdrOrdr: A9a23:mKKLmaOhmDjekMBcTs+jsMiBIKoaSvp037BL7SxMoHluGfBw+P
 rAoB1273HJYVQqOE3I6OrgBEDoexq1n/NICOIqTNSftWfdyQ6VBbAnwYz+wyDxXw3Sn9QtsZ
 uIqpIOauHNMQ==
X-IronPort-AV: E=Sophos;i="5.97,312,1669093200"; 
   d="scan'208";a="97740140"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH 0/3] x86/entry: Cleanup and livepatch support
Date: Mon, 20 Feb 2023 11:59:53 +0000
Message-ID: <20230220115956.1522728-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The main patch here is patch 2, to support livepatching.  Patch 3 is just
cleanup.

Andrew Cooper (3):
  x86/traps: Move do_general_protection() earlier
  x86/entry: Rework the exception entrypoints
  x86/treewide: Drop the TRAP_* legacy names

 xen/arch/x86/cpu/mcheck/vmce.c         |   2 +-
 xen/arch/x86/cpuid.c                   |   6 +-
 xen/arch/x86/crash.c                   |   6 +-
 xen/arch/x86/domain.c                  |   2 +-
 xen/arch/x86/extable.c                 |   8 +-
 xen/arch/x86/hvm/emulate.c             |  17 +-
 xen/arch/x86/hvm/hvm.c                 |  61 +++---
 xen/arch/x86/hvm/io.c                  |   2 +-
 xen/arch/x86/hvm/svm/emulate.c         |   2 +-
 xen/arch/x86/hvm/svm/intr.c            |   2 +-
 xen/arch/x86/hvm/svm/nestedsvm.c       |  32 +--
 xen/arch/x86/hvm/svm/svm.c             |  76 ++++----
 xen/arch/x86/hvm/svm/vmcb.c            |   4 +-
 xen/arch/x86/hvm/vm_event.c            |  10 +-
 xen/arch/x86/hvm/vmx/intr.c            |   2 +-
 xen/arch/x86/hvm/vmx/realmode.c        |  16 +-
 xen/arch/x86/hvm/vmx/vmcs.c            |   4 +-
 xen/arch/x86/hvm/vmx/vmx.c             |  79 ++++----
 xen/arch/x86/hvm/vmx/vvmx.c            |  28 +--
 xen/arch/x86/include/asm/domain.h      |   2 +-
 xen/arch/x86/include/asm/hvm/hvm.h     |   8 +-
 xen/arch/x86/include/asm/processor.h   |  78 +-------
 xen/arch/x86/include/asm/x86-defns.h   |   2 +
 xen/arch/x86/machine_kexec.c           |   2 +-
 xen/arch/x86/mm.c                      |   2 +-
 xen/arch/x86/mm/mem_access.c           |   2 +-
 xen/arch/x86/mm/shadow/hvm.c           |   2 +-
 xen/arch/x86/mm/shadow/multi.c         |  10 +-
 xen/arch/x86/pv/callback.c             |   6 +-
 xen/arch/x86/pv/emul-gate-op.c         |  34 ++--
 xen/arch/x86/pv/emul-inv-op.c          |   2 +-
 xen/arch/x86/pv/emul-priv-op.c         |  14 +-
 xen/arch/x86/pv/emulate.c              |   2 +-
 xen/arch/x86/pv/iret.c                 |   2 +-
 xen/arch/x86/pv/ro-page-fault.c        |   4 +-
 xen/arch/x86/pv/traps.c                |  12 +-
 xen/arch/x86/traps.c                   | 257 +++++++++++++------------
 xen/arch/x86/x86_64/compat/entry.S     |  12 +-
 xen/arch/x86/x86_64/entry.S            | 167 ++++++----------
 xen/arch/x86/x86_emulate.c             |  10 +-
 xen/arch/x86/x86_emulate/x86_emulate.h |   4 +-
 41 files changed, 449 insertions(+), 544 deletions(-)

-- 
2.30.2


