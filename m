Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D38794C3624
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 20:49:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278592.475926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNK77-0006oC-8x; Thu, 24 Feb 2022 19:49:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278592.475926; Thu, 24 Feb 2022 19:49:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNK77-0006kj-50; Thu, 24 Feb 2022 19:49:21 +0000
Received: by outflank-mailman (input) for mailman id 278592;
 Thu, 24 Feb 2022 19:49:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oTFz=TH=citrix.com=prvs=047b345d9=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nNK76-00068X-1Z
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 19:49:20 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9a48a77-95aa-11ec-8539-5f4723681683;
 Thu, 24 Feb 2022 20:49:18 +0100 (CET)
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
X-Inumbo-ID: d9a48a77-95aa-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645732158;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dBGtOVnJAGzlMckx93dr04watYwOZpHH/UAI9UgAPoc=;
  b=brv0b/pMW4l32nGs9qQA/teD0kmxdmyomCdvGk7MrzQ/QEsLd9Vln3ty
   n1ZyU5smwpinNJm/Pl++hbeeSm8Se65M4MtthTGfUqvUqJkaTqzRLqzld
   +rHN7aOb2HlSUxpQWyD+bcgnV9czN+u0l4g40UzR61u5BLtWdFnYoknwe
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 64939144
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:tyj4iKgLhCacCTUgg98zhfUoX161qhAKZh0ujC45NGQN5FlHY01je
 htvUWrTPKrbZDD3ft92a4Wx8hsBuJXRy9IyHQFr/CFgECgb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhWVnR4
 YiaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YQsDAKvziM4dbxl7LQJ5L7Ie4OL2AUHq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bklhmwSvUErANRpfbTr+RzdRZwC0xloZFGvO2i
 88xN2Y+N0WZP0En1lE/NIMlt/qPlFjENBpphWCwvoko3FLd5VkkuFTqGIWMIYHbLSlPpW6co
 W3B8n7lAhAcOcbG4WPbqTSngeqntSbyQocbDrC73v9snlyIx2YXBQEWVF20uv2wgAi1XNc3A
 08Z5Cso67Qz/UqDT9/hUhn+q3mB1jYMVtwVH+Ak5QWlzqvP/x3fFmUCViRGatEtqIkxXzNC/
 n2jks7tBDdvmKaIUn/b/bCRxRutPQAFIGlEYjULJTbp+PG6/tt11EiWCI8+Tujl1bUZBA0c3
 RiGhhY4uKU5jfIL9JuY+kLY2yrxl7jwG1tdChrsYkqp6QZwZYiAboOu6ETG4fsoELt1XmVtr
 1BfxZHAsblm4YWl0XXUHb5TRO3BC+OtbWWE6WODCaXN4NhEF5SLWYlLqA9zK05yWirvUW+4O
 RSD0e+9CXI6AZdLUUOVS9/pYyjJ5fK5fTgAahwyRoAQCnSWXFXalByCnWbKgwjQfLEEyMnTw
 6uzf8e2Fmo9Aq961jewTOp1+eZ1mn1gmTmPH8ukl0/PPV+iiJi9E+lt3LymNL1R0U95iF+Nr
 4Y32zWikX2zr9ESkgGIqNVOfDjm3FAwBIzsqtw/SwJwClEOJY3VMNeImelJU9U8x8x9z76Ul
 lngCh4w4Aeu3hXvdFTVAk2PnZuyBP6TW1pgZndyVbtpslB+CbuSAFA3LMNmLeF6r7U4lZaZj
 ZAtIq29PxiGcRyfkxx1UHU3hNwKmMiD7e5WAxeYXQ==
IronPort-HdrOrdr: A9a23:sk/1OaDq1rctRbHlHemg55DYdb4zR+YMi2TC1yhKJyC9Ffbo8P
 xG/c5rsSMc5wxwZJhNo7y90cq7MBbhHPxOkOos1N6ZNWGM0gaVxelZnO3fKlbbehEWmNQz6U
 4ZSdkdNOHN
X-IronPort-AV: E=Sophos;i="5.90,134,1643691600"; 
   d="scan'208";a="64939144"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Thiner Logoer
	<logoerthiner1@163.com>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Kevin Tian <kevin.tian@intel.com>
Subject: x86: Fix crash on S3 resume
Date: Thu, 24 Feb 2022 19:48:51 +0000
Message-ID: <20220224194853.17774-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Two fixes from investing a QubesOS bug report.

Andrew Cooper (2):
  x86/CET: Fix S3 resume with shadow stacks active
  x86/vmx: Don't spuriously crash the domain when INIT is received

 xen/arch/x86/boot/x86_64.S | 18 +++++++++++++-----
 xen/arch/x86/hvm/vmx/vmx.c |  4 ++++
 2 files changed, 17 insertions(+), 5 deletions(-)


