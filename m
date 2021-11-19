Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EEF457650
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 19:21:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228181.394807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo8Vx-0003mn-FY; Fri, 19 Nov 2021 18:21:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228181.394807; Fri, 19 Nov 2021 18:21:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo8Vx-0003ew-8F; Fri, 19 Nov 2021 18:21:33 +0000
Received: by outflank-mailman (input) for mailman id 228181;
 Fri, 19 Nov 2021 18:21:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kvWs=QG=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mo8Vv-0002lj-Dd
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 18:21:31 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83b4c0df-4965-11ec-9787-a32c541c8605;
 Fri, 19 Nov 2021 19:21:29 +0100 (CET)
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
X-Inumbo-ID: 83b4c0df-4965-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637346089;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=D1PNIJekrzA7tdjjHayuQPdCkYtdkIDimV5spoCTqgk=;
  b=XxgDPK0AC5DDTLbv7OLcbV7SvDADvj2mWX6tQ3rGDV2nw1WPC1tcSisx
   cJFpKj91M1NqwRA4lgBjCRSz4NapuCaw4Bo4JElAuciT8XYpoeq5gWXFU
   m+gOt7xoZy9gPG8nwO4ngh3S5HRtme9/FdppFh+YvB9UywTHlJp5fIPEy
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: qMld2SvXiIRPdIr3CV0jwAnEW4PIuW/e/LhANq/Cfn6daUuePlHzWJNyCdhDNOfJbYPBXmG5xg
 EwHKN/aCtbYxhsLN/r+zyGdO2WNkj3dsGq37x/sIE3pzBfD+e1e8Frm9pI2/ssKJ6SE6hHNUAn
 bhiFcFFL9iVzjwIqcSwvfVddW8YTl8xvKzFcrgxrlVaQkOt4Qxr4o1MPEKl6p8w/V2Ywj/33cY
 gf6T4O6GbTKt3eHcbRuz63kYFcHOmZfPnGn70O+oV0UsI6hk+ej3D4OOMdKisRHhjohnnIeBkI
 RhazLCT25h6ttJrm9cqPuzut
X-SBRS: 5.1
X-MesageID: 60237328
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:CLEM3qjOxkPp5twJ2vuK/XucX161rRcKZh0ujC45NGQN5FlHY01je
 htvDDyDO/zcZjD2eYtyPoiypkkG6sLUz4RmHANqpXhnQ3kb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0F0/NtTo5w7Rg29cx0IDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1Eq62TbgA1OpT1xugmTV5WMnFkAvFZreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHCOo8Ft24m5jbeFfs8GrjIQrnQ5M8e1zA17ixLNaiGP
 ZFGMmA/BPjGS0JyG3MvNJtvp8z23lvEaw9CrE3WvpNitgA/yyQuieOwYbI5YOeiWsF9jkue4
 GXc8AzRIDsXKdiewjqt6W+3i6nEmiaTcJIfEvi0++BnhHWXx3cPE1sGWF2ju/67h0WiHdVFJ
 CQpFjEG9PZoshbxF5+kAkP+8CXsUgMgt8R4GvMLyyaK1q7t2liVPXZDQB8RcuN6q5pjLdA17
 WOhk9TsDD1plbSaT3OB67uZxQ+P1TgpwXwqPnFdE1ZcizX3iMRq10+UEI4/eEKgpoStQWmY/
 tyckMQpa1z/Z+Yv3r7zw13IiinESnPhHl9svVW/so5IA2pEiG+Zi26AtQezARVodt/xory9U
 J4swZX2AAcmV8/lqcB1aL9RdIxFHt7cWNEmvXZhHoM66xOm8GO5cIZb7VlWfRkybZxaIW65P
 RKD5Wu9AaO/2lPwMMebhKrrVawXIVXIT4y5Bpg4kPIQCnSOSON31H43PhPBt4wcuEMtjbs+K
 f+mnTWEVh4n5VBc5GPuHY81iOZzrghnnD+7bc2rnnyPjOvFDFbIGOhtDbd7Rr1ghE9yiF6Oq
 Ig32grj40g3bdASlQGLq9NOdg5TciBgbX00wuQOHtO+zsNdMDlJI5fsLXkJIeSJRoxZybXF+
 G+TQEhdxAatjHHLM1zSOHtidKnuTdB0qndiZX4gOlOh2n4CZ4ez7fhAK8trLOd/rOEzn+RpS
 /QletmbBqgdQDrw5DlAP4L2q5ZvdUr3iFvWbTalejU2Y7VpWxfNpo3/ZgLq+SRXVni3uMIyr
 qeOzATeRZZfFQ1uANyPMKCkzk+rvGhbk+V3BhOaLt5WcUTq0Y5rNy2u0aNnf5BScU3On2LI2
 RyXDBEUofj2j7U0qNSZ17qZq4qJEvdlGhYIFWfs8rvrZzLR+XCuwNEcXb/QLyzdTm795I6re
 f5Rk6PnKPQCkVtH79h8HrJswf5s7tfjveYHnAFtHXGNZFW3ELJwZHKB2JAX5KFKw7ZYvyqwW
 16OpYYGaenYZpu9HQ5DPhchY8SCyeoQy2vb4vkCKUnn4DN6oeicWkJIMhjQ0CFQIdOZ6m/+L
 TvNbCLO1zGCtw==
IronPort-HdrOrdr: A9a23:EwUaCKDKcaahju/lHemi55DYdb4zR+YMi2TC1yhKKCC9Ffbo8f
 xG/c5rsiMc5wxhO03I9eruBEDiewK5yXcW2/hyAV7KZmCP0wHEQL2KhbGSugEIcBefygcy78
 ldmtBFebjNMWQ=
X-IronPort-AV: E=Sophos;i="5.87,248,1631592000"; 
   d="scan'208";a="60237328"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 0/5] x86/traps: Drop exception_table[]
Date: Fri, 19 Nov 2021 18:21:01 +0000
Message-ID: <20211119182106.14868-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Andrew Cooper (5):
  x86/traps: Collect PERFC_exceptions stats for IST vectors too
  x86/traps: Drop dummy_nmi_callback()
  x86/crash: Drop manual hooking of exception_table[]
  x86/traps: Drop exception_table[] and use if/else dispatching
  x86/traps: Clean up diagnostics

 xen/arch/x86/crash.c            | 15 +-------
 xen/arch/x86/extable.c          |  8 ++--
 xen/arch/x86/hvm/vmx/vmx.c      |  2 +-
 xen/arch/x86/pv/traps.c         |  6 +--
 xen/arch/x86/traps.c            | 83 +++++++++--------------------------------
 xen/arch/x86/x86_64/entry.S     | 74 ++++++++++++++++++++++++++++++++----
 xen/include/asm-x86/processor.h |  3 --
 xen/include/asm-x86/traps.h     |  2 +-
 8 files changed, 96 insertions(+), 97 deletions(-)

-- 
2.11.0


