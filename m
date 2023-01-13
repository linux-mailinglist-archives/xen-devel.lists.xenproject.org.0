Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 274F566A6B1
	for <lists+xen-devel@lfdr.de>; Sat, 14 Jan 2023 00:09:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477554.740294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGTAD-0006hq-Qv; Fri, 13 Jan 2023 23:08:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477554.740294; Fri, 13 Jan 2023 23:08:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGTAD-0006fB-Nu; Fri, 13 Jan 2023 23:08:45 +0000
Received: by outflank-mailman (input) for mailman id 477554;
 Fri, 13 Jan 2023 23:08:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bX0/=5K=citrix.com=prvs=37021d3d6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pGTAC-0006f0-8M
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 23:08:44 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 376e8d7e-9397-11ed-91b6-6bf2151ebd3b;
 Sat, 14 Jan 2023 00:08:42 +0100 (CET)
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
X-Inumbo-ID: 376e8d7e-9397-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673651323;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9cCSMzRTvkKrwK52HgPiB0tJ1UsCnOlSGONnqaC/UWI=;
  b=Q32QUdSQmXaaQeNV7V0dMuSxgZmfw75nqSMQOdBhK9vxEJgn/oJzYxOs
   cJ+dYFPw0P1ODcz79OexympmiAqK4nNs27mfYUL5ECNIoWPGIWTmIsVeg
   03DuQX/rHpMXzY1r1re+8a2UrjajrQZ1QYwnjuodhzxbV95vTD32I0atz
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 92558106
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:bxJUZ68BW7n1CB5pMYZADrUDan6TJUtcMsCJ2f8bNWPcYEJGY0x3y
 GRJCjqFaP/fYTH8eYx2Ptyxo0oHvJKDxoNjSgU4/C48E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIw1BjOkGlA5AdmPKkQ5AO2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklp6
 OUjBxkjfyrTuKHx2pOWTOhWockKeZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAr3/zaTBH7nmSorI6+TP7xw1tyrn9dtHSf7RmQO0ExBvF9
 jueoQwVBDkrJPvFjmKoo0mWl77BniXCRMUrSrKno6sCbFq7mTVIVUx+uUGAifukjk+zXfpPJ
 kpS/TAhxYAt8GS7Q9+7WAe3yFaIsRIRVMBZO/Er4wGKjKzP6kCWAXZsZjxIbtA8pdI1bTMv3
 16N2djuAFRHvKWOTHOB9p+dtT6oJTUONmgGeDMFSg0epdLkpekbnh/JC9puDqOxptn0Ai3rh
 SCHqjAkgLcehtJN0L+0lXjcmC6lrJXNSg8z5y3UU3ij4wc/Y5SqD6SKw1XG6fdLLK6CU0KM+
 nMDnqCjAPsmVM/X0nbXGaNUQe/vvqzeWNHBvbJxN7487g+C0lCyR9Bvo3ZkBWpvM/wjdBa8N
 Sc/pjhtCI9v0GqCNPEoON/uVZhxlMAMBvy+CKmKM4MmjoxZMVbeoXowPRP4M3XFyhBErE0pB
 XuMnS9A514+AL8v8je5Tvx1PVQDlnFnnjO7qXwWIn2aPVuiiJ29E+1t3KOmNLxR0U99iFy9H
 yxjH8WL0Q5Dd+b1fzPa94UeRXhTcydgW8uq+50PJrfYSuaDJI3GI6aBqY7NhqQ/x/gF/gs21
 izVtrBkJKrX2iScdFTihoFLY7LzR5dvxU/XzgR1VWtEL0MLON71hI9GLstfQFXS3LA7pRKCZ
 6VfKpro7zUmYmivxgnxmrGk8tIzLEX221rQV8dnCRBmF6Ndq8Xy0oeMVmPSGOMmV0JbaeNWT
 2Wc6z7m
IronPort-HdrOrdr: A9a23:EoBFQazy2Z8j830rDHmIKrPwIr1zdoMgy1knxilNoH1uHvBw8v
 rEoB1173DJYVoqNk3I++rhBEDwexLhHPdOiOF6UItKNzOW21dAQrsSiLfK8nnNHDD/6/4Y9Y
 oISdkbNDQoNykZsfrH
X-IronPort-AV: E=Sophos;i="5.97,215,1669093200"; 
   d="scan'208";a="92558106"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, Daniel Smith
	<dpsmith@apertussolutions.com>, Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH v2 0/5]  Fix truncation of various XENVER_* subops
Date: Fri, 13 Jan 2023 23:08:30 +0000
Message-ID: <20230113230835.29356-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

See patch 3 for details of the problem.  Other patches fix other errors found
while investigating.

Some patches committed straight from v1.  Several new patches with additional
cleanup.

Andrew Cooper (5):
  xen/version: Drop bogus return values for XENVER_platform_parameters
  xen/version: Calculate xen_capabilities_info once at boot
  xen/version: Introduce non-truncating XENVER_* subops
  xen/version: Fold build_id handling into xenver_varbuf_op()
  xen/version: Misc style fixes

 xen/arch/arm/setup.c         |  19 ++----
 xen/arch/x86/setup.c         |  31 ++++------
 xen/common/kernel.c          | 139 ++++++++++++++++++++++++++++++-------------
 xen/common/version.c         |   4 +-
 xen/include/public/version.h |  95 ++++++++++++++++++++++++++++-
 xen/include/xen/hypercall.h  |   2 -
 xen/include/xen/version.h    |   2 +
 xen/include/xlat.lst         |   1 +
 xen/xsm/flask/hooks.c        |   4 ++
 9 files changed, 214 insertions(+), 83 deletions(-)

-- 
2.11.0


