Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAE5767681
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 21:43:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571546.895664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPTNG-0006lU-MW; Fri, 28 Jul 2023 19:43:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571546.895664; Fri, 28 Jul 2023 19:43:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPTNG-0006ix-Iq; Fri, 28 Jul 2023 19:43:42 +0000
Received: by outflank-mailman (input) for mailman id 571546;
 Fri, 28 Jul 2023 19:43:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7hHC=DO=citrix.com=prvs=56653927b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qPTNE-0006TZ-TT
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 19:43:40 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b78cc21-2d7f-11ee-8613-37d641c3527e;
 Fri, 28 Jul 2023 21:43:38 +0200 (CEST)
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
X-Inumbo-ID: 0b78cc21-2d7f-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690573418;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tZcgh/DHPBXNznXBSKcXivjDaURLFpq+0WucV2wxgHw=;
  b=Jwf288bTHr2v4a5xvXoknrSYBlSNm4G4UJa28WiG/+IFL6lOKOA9ANNU
   mI62KjwnyUimAJhSMt4+HrWz6XrNiFrqn20WHxRXCb1UQTy2Asq/WlwJv
   RGW+d0W4eAG72VJNTFUKNzCkcZLx6xAra8qb/8R5TuPnlMIYObILtW940
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 120449228
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:Gq6d3qoxSpy6cjpwmqgXlu5WjDpeBmIjZRIvgKrLsJaIsI4StFCzt
 garIBmFOvaLY2uje9h2atyxphgAuJGBz9NjHFBvqygyRSkb8JuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GpwUmAWP6gR5weBzSlNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXABxKUEG/mb3x+omqE+Rll+IHE/LBJZxK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVxrl6PqLVxyG/U1AFri5DmMcbPe8zMTsJQ9qqdj
 jucpzilU0tAZLRzzxKe13al176fph/3d74QBKWBpqZmmlSqkzl75Bo+CgLg/KjRZlSFc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUSyiuA167V6AaxHXUfQ3hKb9lOnNAybSwn0
 BmOhdyBLSZourCPVXXb/L6bqzqoMAAfMGAZaCkLCwAC5rHLpoA4iRbGCMhuDLS0iNzdEyz/2
 D2Mo241gLB7sCIQ//zlpxad2Wvq/8WXCFdvvW07Q15J8CtVI7D0W5L3rmLg/K9NJZe/ama6l
 mEbzp32AP81MX2dqMCcaLxTTen0uajbbm20bU1HRMd4qWn0k5K3VcUJuWwleh80WioRUWWxC
 HI/rz+983O60JGCSaZsK7y8BM0xpUQLPYS0D6uEBjaij3UYSeNmwM2NTRTKt4wVuBJw+ZzTw
 L/CGSpWMV4UCL580B29TPoH3Lkgy0gWnD2CHc2lnkz3iuHGOhZ5rIvp1nPUNYjVC4vd8G3oH
 yt3bZPWm32zrsWgCsUozWLjBQ9TdiVqbXwHg8dWavSCMmJb9JIJUpfsLUcaU9U9xcx9z76Yl
 kxRr2cEkDITc1Wbc1TVAp2iAZuzNatCQYUTZH13ZA/4gyh5Me5CLs43LvMKQFXuz8Q7pdYcc
 hXPU5zo7ihnItgfxwkgUA==
IronPort-HdrOrdr: A9a23:eOPmvKEWfIJ0T4HcpLqFrZHXdLJyesId70hD6qkRc20hTiX8ra
 vBoB1173/JYUkqKQ0dcLy7WZVoIkmshqKdn7NhX4tKNTOO0AGVxepZnOjfKlPbakjDHuU079
 YeT0AXYuedMbAQ5/yU3OF2eexM/PC3tJmNwcPi5zNVSwduApsQnTuQyGygYzNLrM0tP+tIKH
 JYjPA31gZIAk5nCviTNz0+Ru3eoN+OvIv+CCR2fiIP2U21lDa177y/OASZ2xp2aUIz/Z4StV
 LdlhD/5OGFu/W2oyWssFP73tBtgd78zdkGItKKhtN9EESLti+YIL55XqGEvnQOgMzH0idTrP
 D85y04Oth16TfqcnqrrQDL0w3tuQxekEPK+BujmH7+ps68ez4gEcpGgutiA2Hk13Y=
X-Talos-CUID: 9a23:lBRwNm+y83DSP6MD/fmVv2JTJJEZbCKa9kzBekKxGEBNd4a/UEDFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3A+pcktgyt/RvcJOy6PEGZ9dGqqe6aqL+LDElcwMU?=
 =?us-ascii?q?9h8WrCS5gIw7N1DitS7Zyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,238,1684814400"; 
   d="scan'208";a="120449228"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Roberto Bagnara
	<roberto.bagnara@bugseng.com>, Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH 0/3] x86: Some MISRA Rule 5.3 fixes
Date: Fri, 28 Jul 2023 20:43:17 +0100
Message-ID: <20230728194320.3082120-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

'debug' and 'str' account for an awefully large number of shadowed variable
violations.

Andrew Cooper (3):
  x86/traps: Move do_general_protection() earlier
  x86/entry: Rename the exception entrypoints
  x86: Delete str()

 xen/arch/x86/hvm/svm/svm.c           |   2 -
 xen/arch/x86/include/asm/desc.h      |   9 --
 xen/arch/x86/include/asm/processor.h |  34 +---
 xen/arch/x86/pv/traps.c              |   2 +
 xen/arch/x86/traps.c                 | 227 ++++++++++++++-------------
 xen/arch/x86/x86_64/entry.S          |  36 ++---
 6 files changed, 142 insertions(+), 168 deletions(-)


base-commit: dbd566ab729d2839c3c0be5c47cdcc06c2c477f0
-- 
2.30.2


