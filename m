Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3844F51FCAE
	for <lists+xen-devel@lfdr.de>; Mon,  9 May 2022 14:25:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324457.546508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no2RM-0005v4-TD; Mon, 09 May 2022 12:24:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324457.546508; Mon, 09 May 2022 12:24:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no2RM-0005tD-PF; Mon, 09 May 2022 12:24:40 +0000
Received: by outflank-mailman (input) for mailman id 324457;
 Mon, 09 May 2022 12:24:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JH+5=VR=citrix.com=prvs=12132ff7f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1no2RK-0005qB-Jq
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 12:24:38 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc86521b-cf92-11ec-a406-831a346695d4;
 Mon, 09 May 2022 14:24:36 +0200 (CEST)
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
X-Inumbo-ID: fc86521b-cf92-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652099076;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fowPN6uXsJ6EOPSGQzvLCD4ytt1t0sestCDBrkvZGDo=;
  b=V92nxxuZINB2Qt39f4aQoYVZ8Fa0TYxq5lJodadD7pKnmC1taIjl1abb
   ZERkSCFyhvWMJ8yxHeqVfZu4rU2aDK09ok9bz0sEiV9hap4kW5wkG2avy
   9q+0M1IQExpJYpTEtGMPbdrA9oT7ICSQHBdrQCco6Kg8xyabT+CCcrs42
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 71286218
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:il8wza9A/Lr4jLAj7EdTDrUDSX6TJUtcMsCJ2f8bNWPcYEJGY0x3x
 2RNDW2OOf6DZWOmf4x2PoWzoU8HuZbVztZiQAU9/CE8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ44f5fs7Rh2NQw3IDoW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnZizGBoiBLadpNscVjpSNxFyHY9I1KCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKoZtmtt0nfyCvE+TIqYa67L+cVZzHE7gcUm8fP2O
 JNDOWQ1NUSojxtnH1c5NM9grMmSl0b0TyFIo0+tr4oa/D2GpOB2+Oe0a4eEEjCQfu1Xg0KZq
 2Tu72n/RBYAO7S39z2B9X69g/7VqgnyUokSCb6Q++ZjhRuYwWl7IBcbT0ehqP+1zEu3QctCK
 lc88zAr66M18SSDUd3VTxC+5nmesXY0S9dWVuE39gyJ4q7V+BqCQHgJSCZbb94rv9NwQiYlv
 nertd70AT1ksJWOVGmQsLyTqFuaIjMJJGUPYSsFSwot4NT5pow3yBXVQb5e/LWd14OvX2uqm
 nbT8XZ41+57YdM3O7uT+VOWnjmWvcn1cQ8wxQ/zbm6FzA1Ve9vwD2C30mTz4fFFJYefa1COu
 nkYhsSThNwz4YGxeD+lG7tUQuzwjxqRGHiF2AM0QcF9n9i40yT7Fb289g2SM6uA3iwsXTbyK
 HHetgpKjHO4FCv7NPQnC25d5ilD8EQBKTgHfq2PBjatSsIoHONiwM2JTRTJt10BaGB2zckC1
 W6zKK5A90oyB6V91yaRTOwAy7ItzS1W7TqNGMqjkk/2iefBPiH9pVI53LymNLtR0U95iF+Nr
 4Y32zWilX2zr9ESkgGIqNVOfDjm3FAwBIzsqtw/SwJwClEOJY3VMNeImelJU9U8x8x9z76Ul
 lngCxQw4Aeu2hX6xfCiNykLhEXHBs4v8xrW/EUEYD6V5pTUSdvxvPpHK8trLNHKNoVLlJZJc
 hXMQO3Yatwnd9gN0251gUXVxGC6SCmWuA==
IronPort-HdrOrdr: A9a23:qO4Onq3J0GhCuD/pohO2hwqjBL4kLtp133Aq2lEZdPRUGvb3qy
 nIpoV96faUskd0ZJhOo7C90cW7LU80lqQFhLX5X43SPzUO0VHAROoJgLcKqweQfREWndQ96U
 4PScdD4aXLfDpHsfo=
X-IronPort-AV: E=Sophos;i="5.91,211,1647316800"; 
   d="scan'208";a="71286218"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH 0/3] xen: Trivial MISRA fixes
Date: Mon, 9 May 2022 13:24:06 +0100
Message-ID: <20220509122409.14184-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Trivial fixes for MISRA issues while idly looking through the x86 report.

Andrew Cooper (3):
  x86/p2m.h: Add include guards
  x86/shadow: Don't use signed bitfield in sh_emulate_ctxt
  common/spinlock: Drop inline from _spin_lock_cb()

 xen/arch/x86/mm/p2m.h            | 5 +++++
 xen/arch/x86/mm/shadow/private.h | 2 +-
 xen/common/spinlock.c            | 2 +-
 3 files changed, 7 insertions(+), 2 deletions(-)

-- 
2.11.0


