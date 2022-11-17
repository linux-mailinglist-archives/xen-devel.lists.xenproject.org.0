Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5865062D063
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 02:09:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444449.699678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovTO6-0002SM-M3; Thu, 17 Nov 2022 01:08:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444449.699678; Thu, 17 Nov 2022 01:08:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovTO6-0002Pc-J8; Thu, 17 Nov 2022 01:08:18 +0000
Received: by outflank-mailman (input) for mailman id 444449;
 Thu, 17 Nov 2022 01:08:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BOBv=3R=citrix.com=prvs=31353e2df=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ovTO4-0002PW-Ky
 for xen-devel@lists.xenproject.org; Thu, 17 Nov 2022 01:08:16 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4eafe633-6614-11ed-91b6-6bf2151ebd3b;
 Thu, 17 Nov 2022 02:08:14 +0100 (CET)
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
X-Inumbo-ID: 4eafe633-6614-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668647294;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QJ8hGZ4Ye+I5hxPTrLz98D7mYk7LDq2GMg+RVVLl3jU=;
  b=UIVpMG6YPCE7OqnaimGgIARXWY7BPKOD/UgS5PsxkmVNISoufaVSaHjH
   2ofCRJx88k2BvcWWPfQijdDIWDJeSMLFGe1X1TMR/3m5q2kL7Nrr5Rmh8
   Ep1KJQ7/R2Hl77pIV8ZefHBPIsuBVBuYvJYvF9qILmizxXKMcaJp8V7Mt
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 84052645
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ianH3q/BP0FyARKyKMR5DrUDdH6TJUtcMsCJ2f8bNWPcYEJGY0x3z
 TZODW6EOfbcZ2T3ettyOoi0pkJT6MOAzN43TAI9+Xg8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIx1BjOkGlA5AZnPKkV5AS2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklk8
 c04GjEXKSmOpMmK2O2Fa/tp3MMKeZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGM0Yn1lQ/UfrSmM+BgHXlfiIeg1WSvactuEDYzRBr0airO93QEjCPbZUJxhvC+
 D6bl4j/KiobF8ajyyC5y3GDufPipBmhVtMiCoTto5aGh3XMnzdOWXX6T2CTn/69jUKvXsNFH
 GYd8CEusKsa+VSiS5/2WBjQiHyZuh8RXfJAHut87xuCooLe7hyFHGECQnhEYcY/qc4tbTUw0
 xmCmNaBLRxitqeED02U8Li8pCm3fyMSKAcqfjQYRAEI593ipoAbjR/VSNtnVqmvgbXdCTz2h
 jyHsiU6r7ESltIQkbW2+0jdhDChrYSPSRQ6ji31dG+46gJyZKa+epelr1Pc6J5oM4KxXlSH+
 n8elKCjAPsmVM/X0nbXGaNUQe/vt63t3CDgbUBHNZ0Q1was4TmacKN73CkhGmZ7N5wDUGq8C
 KPMgj956JhWNXqsSKZ4ZYOtFsgnpZTd+cTZuuP8NYQXPMUoHOOT1GQ3PBPLgTix+KQ5uftnU
 ap3Z/pAGprz5U5P6DOtD9kQ3rYwrszV7TOCHMurp/hLPFf3WZJ0dVvnGAHQBgzaxPneyOkwz
 zq4H5Xi9vmneLeiChQ7CKZKRb3KRFBibXwMl+RZd/SYPi1tE3w7BvnazNsJItI7z/oPzbuXp
 C/iACe0LWYTY1WccG1mjVg6NtvSsWtX9ypnbUTAw371s5TcXWpfxPhGLMZmFVXW3Odi0eR1X
 5E4lzaoW5xyp/Wu02p1UKQRW6QyLkXx21PQZHvNjfpWV8cIejElM+TMJmPHnBTixALt3Sfii
 9VMDj/mfKc=
IronPort-HdrOrdr: A9a23:QZRXVKCka5GbtL3lHemm55DYdb4zR+YMi2TC1yhKJiC9Ffbo8/
 xG/c5rsCMc5wxxZJhNo7290cq7MBHhHPxOgbX5VI3KNGKNhILBFvAE0WKI+VPd8kPFmtK1rZ
 0QEJRDNA==
X-IronPort-AV: E=Sophos;i="5.96,169,1665460800"; 
   d="scan'208";a="84052645"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Henry Wang <Henry.Wang@arm.com>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH for-4.17 0/4] XSA-409 fixes
Date: Thu, 17 Nov 2022 01:08:00 +0000
Message-ID: <20221117010804.9384-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

For 4.17, and backport to all stable releases.

Patch 2 doesn't technically need backporting, but it's safe and I'm
dis-enclined to forgo testing in older releases.

See patches for changelogs.

Andrew Cooper (4):
  xen: Introduce non-broken hypercalls for the paging mempool size
  tools/tests: Unit test for paging mempool size
  xen/arm, libxl: Revert XEN_DOMCTL_shadow_op; use p2m mempool hypercalls
  xen/arm: Correct the p2m pool size calculations

 tools/include/xenctrl.h                          |   3 +
 tools/libs/ctrl/xc_domain.c                      |  29 ++++
 tools/libs/light/libxl_arm.c                     |  14 +-
 tools/libs/light/libxl_dom.c                     |  19 +++
 tools/libs/light/libxl_internal.h                |   3 +
 tools/libs/light/libxl_x86.c                     |  15 +-
 tools/tests/Makefile                             |   1 +
 tools/tests/paging-mempool/.gitignore            |   1 +
 tools/tests/paging-mempool/Makefile              |  42 ++++++
 tools/tests/paging-mempool/test-paging-mempool.c | 181 +++++++++++++++++++++++
 xen/arch/arm/domctl.c                            |  53 -------
 xen/arch/arm/include/asm/p2m.h                   |   1 -
 xen/arch/arm/p2m.c                               |  32 ++--
 xen/arch/x86/include/asm/hap.h                   |   1 +
 xen/arch/x86/include/asm/shadow.h                |   4 +
 xen/arch/x86/mm/hap/hap.c                        |  11 ++
 xen/arch/x86/mm/paging.c                         |  43 ++++++
 xen/arch/x86/mm/shadow/common.c                  |  11 ++
 xen/common/domctl.c                              |  14 ++
 xen/include/public/domctl.h                      |  24 ++-
 xen/include/xen/domain.h                         |   3 +
 21 files changed, 415 insertions(+), 90 deletions(-)
 create mode 100644 tools/tests/paging-mempool/.gitignore
 create mode 100644 tools/tests/paging-mempool/Makefile
 create mode 100644 tools/tests/paging-mempool/test-paging-mempool.c

-- 
2.11.0


