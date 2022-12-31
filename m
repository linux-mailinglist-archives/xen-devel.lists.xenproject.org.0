Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D49A2659FA7
	for <lists+xen-devel@lfdr.de>; Sat, 31 Dec 2022 01:31:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.469950.729396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pBPlX-0001Vd-H5; Sat, 31 Dec 2022 00:30:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 469950.729396; Sat, 31 Dec 2022 00:30:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pBPlX-0001Tg-ER; Sat, 31 Dec 2022 00:30:23 +0000
Received: by outflank-mailman (input) for mailman id 469950;
 Sat, 31 Dec 2022 00:30:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cPaP=45=citrix.com=prvs=3576bb3e1=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pBPlW-0001TX-MT
 for xen-devel@lists.xenproject.org; Sat, 31 Dec 2022 00:30:22 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4cf220cc-88a2-11ed-91b6-6bf2151ebd3b;
 Sat, 31 Dec 2022 01:30:19 +0100 (CET)
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
X-Inumbo-ID: 4cf220cc-88a2-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672446619;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4Jr6WMkTLkViA/t6hJz3F9sb2wbIUJEomL2S4AmQ8Ms=;
  b=bOsQaPL4YEDBIZqQCpnTyVqKAfHHEDTLrWTWJgniImq7mfyhG5ulohWo
   PtURLSBGny4tAvtlaT/C8S+UwZHBqnRG2XfCIIkRxxW4iFjoVpIzmKGn3
   Dsw1tCfmFd8y/rC21Z5UlGRZf0cJFy0xl9C1qEoyWFE4THXYENpj/pmmg
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 90146726
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:94KyA6iC32qBHn1c75yQ/VrGX161bhAKZh0ujC45NGQN5FlHY01je
 htvUD+Ab62JYTT0fY8laNy0oR8A6JCGzYBkHAdrryBhFiIb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWs0N8klgZmP6oS5gSGzyV94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQoD29SVwyNqdvog6uLcrNGjf4qFMLSadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJagx/5JEWxY9EglHWdTFCpU3Tjq0w+2XJlyR60aT3McqTcduPLSlQthfA/
 z6YoD6nav0cHN/EkmCBrEKjuu7Wmg+lQbgvG6Hn69c/1TV/wURMUUZLBDNXu8KRlUqWS99Zb
 UsO9UIGvaU0sUCmUNT5dxm5u2Kf+A4RXcJKFO834x3LzbDbiy67LGUZSj9KaPQ9qdQ7Azct0
 ze0c8jBXGI19ufPEDTEq+nS/Wja1TUpwXEqVQhbEjIZ7ffa/sIqviqVZN1ZGZa+t4igcd3v+
 AyioC87jrQVqMcE0aSn4FzK6w6RSoj1oh0dvVuOAD/8hu9tTMv8PtHztwCHhRpVBNzBJmRtq
 kTojCR3AAomKZiW3BKAT+wWdF1Cz6bUaWaM6bKD8nRIythMx5JBVdoLiN2dDB0zWirhRdMOS
 BG7hO+pzMUPVEZGlIcuC25LN+wkzLL7CfPuXe3OY9xFb/BZLVHYpn00OBTMjzC3zSDAdJ3T3
 r/CK66R4YsyU/w7nFJauc9GuVPU+szO7TyKHs2qp/hW+bGfeGSUWd84Dbd6VchgtPnsiFyMo
 75i2z6il003vBvWPnOGrub+7DkicRAGOHwBg5YGJ7XTflA4SThJ5j246epJRrGJVp99zo/gl
 kxRkGcBoLYjrRUr8Tm3V00=
IronPort-HdrOrdr: A9a23:Ry/xEK/q9q6tFP8cJiluk+D/I+orL9Y04lQ7vn2ZLiYlD/Bw9v
 re5sjzsCWetN9/YhAdcLy7Scu9qArnhPhICPcqTMyftXjd2FdARbsKheffKlvbalTDH8Fmu5
 uIGJIOa+EYY2IK6PoT/WKDfOrJiLG8mpxBz4/lokuEzGpRGsVdB24SMHf9LqWXLDM2faYEKA
 ==
X-IronPort-AV: E=Sophos;i="5.96,288,1665460800"; 
   d="scan'208";a="90146726"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 0/2] x86: Work around Shstk fracturing
Date: Sat, 31 Dec 2022 00:30:05 +0000
Message-ID: <20221231003007.26916-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

See patch 2 for details.

Andrew Cooper (2):
  x86/cpuid: Infrastructure for leaves 7:1{ecx,edx}
  x86/shskt: Disable CET-SS on parts succeptable to fractured updates

 docs/misc/xen-command-line.pandoc           |  7 +++++-
 tools/libs/light/libxl_cpuid.c              |  2 ++
 tools/misc/xen-cpuid.c                      | 11 +++++++++
 xen/arch/x86/cpu/common.c                   | 14 ++++++++---
 xen/arch/x86/setup.c                        | 37 ++++++++++++++++++++++++++---
 xen/include/public/arch-x86/cpufeatureset.h |  4 ++++
 xen/include/xen/lib/x86/cpuid.h             | 15 +++++++++++-
 7 files changed, 82 insertions(+), 8 deletions(-)

-- 
2.11.0


