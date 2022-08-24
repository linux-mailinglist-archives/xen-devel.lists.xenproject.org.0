Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C49059F843
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 13:00:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392406.630739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQo6t-0001KC-1f; Wed, 24 Aug 2022 10:59:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392406.630739; Wed, 24 Aug 2022 10:59:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQo6s-0001Gj-VE; Wed, 24 Aug 2022 10:59:46 +0000
Received: by outflank-mailman (input) for mailman id 392406;
 Wed, 24 Aug 2022 10:59:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ebS+=Y4=citrix.com=prvs=22883313c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oQo6q-0001Gd-PE
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 10:59:44 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da23fefb-239b-11ed-bd2e-47488cf2e6aa;
 Wed, 24 Aug 2022 12:59:42 +0200 (CEST)
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
X-Inumbo-ID: da23fefb-239b-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1661338782;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ABomoh19Wg1mAKuT9rP25QYv1ZyWXr0F0Oa/lAWXCEQ=;
  b=FjFXnhrdF7P6YO+czhPBHIRst3IY4Tl/JHtHtOJ0rBlmHqOTI8BKG2X1
   /8JXRyW4TQ2d65Sz1VIte6+TqyfhRUTt6lb+U0Sl0gJ4nNWU3XuMXiQZX
   4uueRfG4TdyiCKBoZfg+3JnOziTjxiiVKR/P+jFDgiCzsFV5yd/LAP6+R
   k=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 78010150
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:cecTRa9aLy6npovvCtezDrUD436TJUtcMsCJ2f8bNWPcYEJGY0x3m
 2QfXW7SPP2PNzOmeYt1a9i28EwOv5eAmNI2GwBoq308E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9z8kvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYctitWia++3k
 YqaT/b3ZRn0gFaYDkpOs/jZ8EM14Kyr0N8llgdWic5j7Qe2e0Y9VPrzFYnpR1PkT49dGPKNR
 uqr5NlVKUuAon/Bovv8+lrKWhViroz6ZGBiuVIPM0SWuTBQpzRa70oOHKF0hXG7Kdm+t4sZJ
 N1l7fRcQOqyV0HGsLx1vxJwS0mSMUDakVNuzLfWXcG7liX7n3XQL/pGLkQcM7IZ1spOWk5W6
 +A8MAIrKU3ZiLfjqF67YrEEasULKcDqOMUUu216zCGfBvEjKXzBa/yUv5kChm52350QW6aFD
 yYaQWMHgBDoShtDIFoITrk5m/+lnCLXeDxEslOF46Ew5gA/ySQugOC0aIOIIrRmQ+1foWXCo
 HD8vF3zQQMnHdm1mGvd4Huz07qncSTTB9tJSezQGuRRqEKX7nweDlsRT1TTiduTh1O6WtlfA
 1cJ4Sdopq83nGS7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsc9JaQIV47olsH2Vsj
 wLX2YOybdByjFGLYVCY3LmrrB+eAHM6NXEeQTc2a0xYuda29enfkSnzosZf/L+d14OrQGupk
 mDW8UDSlJ1I05dVivzTEUTvxmv1+8OXFlNdChD/BDrN0+9vWGKyi2VEA3D/5O0IEouWR0LpU
 JMsy5nHt7Bm4X1geUWwrAQx8FKBva/t3MX02wIHInXY323FF4SfVY5R+ipiA0xiL9wJfzTkC
 GeK510IvsACbSH0Nv8nC25UNyjN5fmIKDgYfqqMMoomjmZZLmdrAx2ClWbPhjuwwSDAYIk0O
 IuBcNbEMEv2/Z9PlWPuL9rxJJdxmUjSM0uPGs2gp/lmuJLCDEOopUAtagLVMbtktvvd+W04M
 b93bqO39vmWa8WmCgG/zGLZBQliwaQTbXwul/FqSw==
IronPort-HdrOrdr: A9a23:BYahR6EWPz8lDEYTpLqE5MeALOsnbusQ8zAXP0AYc3Jom6uj5q
 eTdZUgpHvJYVkqOE3I9ertBEDiewK4yXcW2/hzAV7KZmCP0wHEEGgL1/qF/9SKIUzDH4Bmup
 uIC5IOauHNMQ==
X-IronPort-AV: E=Sophos;i="5.93,260,1654574400"; 
   d="scan'208";a="78010150"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 0/4] x86/hvmloader: Fixes/improvements
Date: Wed, 24 Aug 2022 11:59:11 +0100
Message-ID: <20220824105915.32127-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

All encountered while debugging a regression in Xen 4.17.

They're all very trivial, and addressing low hanging fruit.

Andrew Cooper (4):
  x86/hvmloader: SMP improvements
  x86/hvmloader: Don't build as PIC/PIE
  x86/hvmloader: Don't override stddef.h
  x86/hvmloader: Move various helpers to being static inlines

 tools/firmware/hvmloader/Makefile    |  3 +-
 tools/firmware/hvmloader/config.h    |  2 +-
 tools/firmware/hvmloader/hvmloader.c |  1 -
 tools/firmware/hvmloader/mp_tables.c |  2 +-
 tools/firmware/hvmloader/smp.c       | 46 ++++++++++++------
 tools/firmware/hvmloader/util.c      | 78 +-----------------------------
 tools/firmware/hvmloader/util.h      | 94 +++++++++++++++++++++++++++++-------
 7 files changed, 112 insertions(+), 114 deletions(-)

-- 
2.11.0


