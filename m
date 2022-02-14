Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 392FD4B50D2
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 13:57:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271580.466084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJauY-000256-Em; Mon, 14 Feb 2022 12:56:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271580.466084; Mon, 14 Feb 2022 12:56:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJauY-00022w-AI; Mon, 14 Feb 2022 12:56:58 +0000
Received: by outflank-mailman (input) for mailman id 271580;
 Mon, 14 Feb 2022 12:56:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJauV-0001Wb-T2
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 12:56:56 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93f87492-8d95-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 13:56:52 +0100 (CET)
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
X-Inumbo-ID: 93f87492-8d95-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843413;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=29CmoU9xptN0UOwky8tYL5EorpibhBcah1/o27J5pFQ=;
  b=KhQXBas6LueM2FoG2LTwo//n0+Y15qtws2ayvKb6zAUQEXGUJ/wFAblw
   XmLO/byZiWS5MM42RyN6LV/AzUSISRovu4aT9dKDl26Im90JkmpXezvr3
   t34zNi2sBe75tjEmg+nU7utW9/JrN3pvvd7iGmUEW1U152btxq2yoAdm8
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: YQW0OeKcfGXIF1O+BL1fXYN9H+ypog1sfQo7O0/ICmRRNIFvAV1JPTJ5XWOSLxMkwyfBHBK38y
 V1J/zg4P+S3lj+VJqwSIC8V0Rk6N7qPpaN8IArKZnxtAP3lVhtiCF+e5VZGbnJqJHhpj9aG6HY
 KoxRRqUoJCqqQuUwuuZ1Mmm0xak1QPk+vjnaCKC1qvaFBRW336rZLacdnsFgWW74s56rw+/Ltk
 shPrD8X3VS6+XmYLsqSedNCgHzy5KUzI/kDezz4kbp6kL8Usx8MpHLlalTNlpoXKWdRJ7igAB9
 F5qptJ/XI6TdzllDTUozedP8
X-SBRS: 5.1
X-MesageID: 64148579
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ePkb+qK4Skc9wNJgFE+RRJIlxSXFcZb7ZxGr2PjKsXjdYENS1jUEy
 jZKWGHUbPnbamf8eNxybI6+/UoPvpHVmtVhHgBlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH170Ug6x7Zg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2GvMBw9
 tF1jKXvChUlbqyct9keURxhRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFFgMg5IdatF4QYonx6lhnSDOo8QICFSKLPjTNd9Gls35weQKmPD
 yYfQT9oVBHhWixLBm4sOowwxs2E2CPTcRQN/Tp5ooJoujOOnWSdyoPFPNXZd9OQTO1Jj02Yo
 STA5G2/DRYEXPST0SGA826srubXkDnnRZkJE7ml6v9thkbVzWsWYDUTXEG+qOO0iWa/XcxeM
 E0e/icyrak0+1evR9O7VBq9yFaUsxhZV9dOHukS7ACW1rGS8wufHnIDTDNKdJohrsBebR4A2
 0KNntjpLSdyq7DTQnWYnp+LqRuiNC5TKnUNDRLoViNcvYOl+ttqyEuSEJAzS8ZZk+EZBxn/4
 CCLkiwGvoxMztwHh6Tr0m3EgTeV882hohEO2i3bWWes7wVcbYGjZpC15VWz0cusPLp1XXHa4
 iFaxpH2APQmSMjUyXfTGLll8KSBuq7dWAAwl2KDCHXIG96F33e4Nb5d7zhlTKuCGpZVIGS5C
 KM/VO442XOyAJdIRfItC25SI55zpUQFKTgCfqqKBueimrArKGe6ENhGPCZ8JVzFnkk2ir0YM
 pyGa8uqBntyIf05kGbpF7dAjOdynXpWKYbvqXfTlUrP7FZjTCTNFedt3KWmMojVE59oUC2Kq
 o0CZqNmOj1UUfHkYzm/zGLgBQtiEJTPPriv85Y/XrfaemJOQTh9Y9eMkeJJU9E0xMx9y7aXl
 kxRr2cFkTITc1Wccl7UAp2iAZuyNatCQYUTY3B9YwbwgyJ7CWtthY9GH6YKkXAc3LQL5ZZJo
 zMtIq1s29xDFWbK/Sozd574oNAwfRinn1vWbSGkfCI+b9hrQAmQoo3oeQ7m9S8vCCurtJRh/
 +38h12DGZdTFR5/CMv2ae60yw/jt3Yqh+8vDVDDJcNeeRuw/dEyeTDxlPI+P+oFNQ7HmmmBz
 w+TDBpB/bvNroY5/cPnn6eBq4v1QeJyElADRzvQ7KqsNDmc9W2mmNcSXOGNdDHbdWX15KT9O
 rkFk6CiaKUKxQ8YvZB9HrBnybMFy+Hu/7IKnB55GHjrbkiwDu8yKHexwsQS5LZGwaVUuFXqV
 xvXqMVaI7iAJOjsDEUVeFg+du2G2PwZxmvS4PAyLBmo7SN75uPaA0BbPh3Kgy1BNrpldogix
 L556sIR7gW+jDssM8qH0X8IpzjdcCRYXvV1rIweDa/qlhEvmwNLbpHrAyPr5I2CNodXOU4wL
 z7I3KfPitywHKYZn6bfwZQV4ddguA==
IronPort-HdrOrdr: A9a23:hsOKxKvj6IGAgV5qXFgxSCD37skDdNV00zEX/kB9WHVpmszxra
 6TdZUgpGbJYVkqOE3I9ertBEDEewK4yXcX2/h2AV7BZniEhILAFugLhuGO/9SjIVybygc079
 YGT0EUMrzN5DZB4voSmDPIceod/A==
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64148579"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, Daniel Smith <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>
Subject: [PATCH v2 0/7] x86: Further harden function pointers
Date: Mon, 14 Feb 2022 12:56:25 +0000
Message-ID: <20220214125632.24563-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Additional runtime hardning of indirect branches.  Depends on the CET-IBT
series.

Andrew Cooper (7):
  xen/altcall: Use __ro_after_init now that it exists
  x86/altcall: Check and optimise altcall targets
  x86/altcall: Optimise away endbr64 instruction where possible
  xsm: Use __initconst_cf_clobber for xsm_ops
  x86/hvm: Use __initdata_cf_clobber for hvm_funcs
  x86/ucode: Use altcall, and __initconst_cf_clobber
  x86/vpmu: Harden indirect branches

 xen/arch/x86/alternative.c         | 61 ++++++++++++++++++++++++++++++++++++++
 xen/arch/x86/cpu/microcode/amd.c   |  2 +-
 xen/arch/x86/cpu/microcode/core.c  | 38 +++++++++++++-----------
 xen/arch/x86/cpu/microcode/intel.c |  2 +-
 xen/arch/x86/cpu/vpmu_amd.c        |  2 +-
 xen/arch/x86/cpu/vpmu_intel.c      |  2 +-
 xen/arch/x86/hvm/hvm.c             |  2 +-
 xen/arch/x86/hvm/svm/svm.c         |  2 +-
 xen/arch/x86/hvm/vmx/vmx.c         |  2 +-
 xen/arch/x86/xen.lds.S             |  6 ++++
 xen/include/xen/alternative-call.h |  2 +-
 xen/include/xen/init.h             |  3 ++
 xen/xsm/dummy.c                    |  2 +-
 xen/xsm/flask/hooks.c              |  2 +-
 xen/xsm/silo.c                     |  2 +-
 15 files changed, 101 insertions(+), 29 deletions(-)

-- 
2.11.0


