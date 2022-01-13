Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 504B048DBFD
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 17:39:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257285.442077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n837i-0001UF-DM; Thu, 13 Jan 2022 16:38:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257285.442077; Thu, 13 Jan 2022 16:38:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n837i-0001RN-AG; Thu, 13 Jan 2022 16:38:50 +0000
Received: by outflank-mailman (input) for mailman id 257285;
 Thu, 13 Jan 2022 16:38:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4514=R5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1n837h-0001RD-Ci
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 16:38:49 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46e049d1-748f-11ec-a563-1748fde96b53;
 Thu, 13 Jan 2022 17:38:47 +0100 (CET)
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
X-Inumbo-ID: 46e049d1-748f-11ec-a563-1748fde96b53
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642091927;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ARuOGzG8JXuNZ5nPn4f165i7Ruf4s1YklHYGlpdLP8I=;
  b=dojJZOg/Vy6YBkY3k2owGjTO3xgLu6v7avTE/Tr6NU7/CML41A+oE9be
   1PX9tjvZB6rhvGsQeXrptTmjOaCROTFyAtGZrqHyxecd0QncIIKHbdimW
   hvLfK6P0X0yy9gMk+bHy2Of+4ym5Uc/C/etoOqbfpHA4paxrT28Fq5oSZ
   M=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: NJi55lD6wuLBNX8Mmi7lJgBdaAysFW0iZDbns3WiUZBz2AoAw2qeVOzshp8fdprNY+N9Ij/dLE
 R7Pc2HsBha3j6MDJNk3oAGvo4qmLIXzxfrMdbZXMennOdc76eXdaiTXf0v68G4vquyZ5B7HM/I
 o6WadOgYwTmXOjYxxkhHV2lgAQuPMNfs5r4jZP1y5cCMa6rS3DHQVPfIybvwTUaaL0dS89GA/u
 qYonr0UrGv5XICOH7LMMFaKThWht/zjRvkHFCH1H91eJHGEwGrl47negf2osVi863J6gEKBf+W
 Pl9cq57sZMhr3Yg5dlENJb+k
X-SBRS: 5.2
X-MesageID: 61856446
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:2y3YJqtncpXnf5DQx+KY2uCih+fnVGFZMUV32f8akzHdYApBsoF/q
 tZmKWjTPffeZDegLthwaozjpxwGvZ+HzoRmQQFv+HowESwb+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYx2IPhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplrZyaWS0RY5bwtukkQkYfVC5vYo5X9+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6AP
 ppEN2YzMnwsZTUVeWVPF5Qbm92kl1v9VzEEkkrEj/Uetj27IAtZj+G2bYu9lsaxbdVYmAOUq
 3zL+0z9AwoGL5qPxDyd6HWui+TT2yThV+ov+KaQr6AwxgfJnypKVUNQBQDTTeSFZlCWQ9J1O
 2YspxESg6UL5RPsCdbsAD6pryvR1vIDYOZ4H+o/4QCL76Pb5QeFG2QJJgJ8hMwaWNweHmJzi
 ALQ9z/9LXk26eDOFyrBnluBhW7qYUAowXk+iTjopOfvy/3qu8kNgx3GVb6P+4bl34SuSVkcL
 91nxRXSZon/b+ZXhs1XHnid2lpAQ6QlqCZvtm07uUr/v2tEiHaNPdDA1LQixa8owHylZleAp
 mMYvMOV8foDC5qA/ATUHrlXROjyv6jZYGaG6bKKI3XH3279k5JEVdoBiAyS2W8zappUEdMXS
 BK7VfxtCG97YyLxMP4fj3OZAMU216nwfekJpdiPBueilqNZLVfdlAk3PBb49zm0zCAEzP9jU
 b/GL5fEJStKWMxPkWvtL89AgOBD+8zL7T6JLXwN5075geP2ib/8YeptDWZimchivfzU+1uEo
 o8PXyZIoj0GONDDjuDs2dZ7BTg3wbITXPgacuRbKbyOJBRIAmYkB6ODyL8tYdU9za9Uiv3J7
 je2XUoBkAjzgnjOKAOrbHF/aeywAcYj/CxjZSF8b0y133UDYJq06PtNfZUAYrR6pvdoyuR5T
 qdZdpzYUOhPUDnO5x8UcYL58N55bB2uiA/XZ3ilbTEzcoROXQvM/tO4LALj+DNXVni8tNcko
 q3m3QTeGMJRSwNnBcfQSfSu01Lu4iRNxLMsBxPFe4ABdl/t/Y5mLz3KosU2e8xcew/ewja61
 hqNBUtKr+f6vIJoosLCgrqJrtn1HrImTFZaBWTS8Z2/KTLeoji42YZFXeuFIWLdWWfz9Pnwb
 OlZ1aihYvgOnVIMuItgCbd7i6k54oK39bNdyw1lGlTNbkiqVew8ciXXg5EXu/0f3KJdtCu3R
 lmLq4tTNri+Mc/4FEIceVg+ZeOZ2PBIwjTf4JzZ+qkhCPObKFZfbXhvAg==
IronPort-HdrOrdr: A9a23:SZ4HWapAgWU7fe9W6VvXtOsaV5oneYIsimQD101hICG8cqSj+f
 xG+85rsiMc6QxhPE3I9urhBEDtex/hHP1OkOws1NWZLWrbUQKTRekIh+bfKlXbakvDH4VmtJ
 uIHZIQNDSJNykZsfrH
X-IronPort-AV: E=Sophos;i="5.88,286,1635220800"; 
   d="scan'208";a="61856446"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 0/3] x86/spec-ctrl: Fix NMI race condition
Date: Thu, 13 Jan 2022 16:38:30 +0000
Message-ID: <20220113163833.3831-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Andrew Cooper (3):
  x86/msr: Split MSR_SPEC_CTRL handling
  x86/spec-ctrl: Drop SPEC_CTRL_{ENTRY_FROM,EXIT_TO}_HVM
  x86/spec-ctrl: Fix NMI race condition with VT-x MSR_SPEC_CTRL handling

 xen/arch/x86/hvm/svm/entry.S             |  5 ++--
 xen/arch/x86/hvm/vmx/entry.S             | 23 ++++++++++-----
 xen/arch/x86/hvm/vmx/vmx.c               | 38 ++++++++++++++++++++++++-
 xen/arch/x86/include/asm/msr.h           | 21 ++++++++++----
 xen/arch/x86/include/asm/spec_ctrl_asm.h | 49 ++++----------------------------
 xen/arch/x86/msr.c                       |  6 ++--
 xen/arch/x86/pv/emul-priv-op.c           | 10 +++++++
 7 files changed, 90 insertions(+), 62 deletions(-)

-- 
2.11.0


