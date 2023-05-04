Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D21AD6F733A
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 21:39:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530037.825259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pueng-0006CO-7N; Thu, 04 May 2023 19:39:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530037.825259; Thu, 04 May 2023 19:39:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pueng-00069v-4B; Thu, 04 May 2023 19:39:36 +0000
Received: by outflank-mailman (input) for mailman id 530037;
 Thu, 04 May 2023 19:39:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jZxo=AZ=citrix.com=prvs=48139b1ea=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1puend-00069W-WF
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 19:39:34 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6254b545-eab3-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 21:39:30 +0200 (CEST)
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
X-Inumbo-ID: 6254b545-eab3-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683229170;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=B+Lt4o2YAn9fGf4aYwlSeUeSsUI9OhnNotrhhc/MbjE=;
  b=IOEHq8l7MPXu/neqgoRj3U5FDEusbnx01qEO/hig/y3bk0HbOPJIzu6v
   FXkPKG88s2OKFAXwrM/q208lsId+9YktYPP1Ip4ohcBuB2fd9U/+yY30s
   8247UyCd+nUG/aPdjjDG7OLLApXUJjTU7Ur1o3t1OJAU9ULlKvz3x8wXC
   I=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 107797744
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:9NPEQKqiBM9uJR0MLDC4OmpJ9K5eBmJpZRIvgKrLsJaIsI4StFCzt
 garIBmCMqvcY2XxKtwlbdu0/UMOuZaDydBkSwQ+qCw2EHxH+ZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WJwUmAWP6gR5weDzyVNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAHMmVTCFi8aX/Orhe7FXjPoxM8XoDrpK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVxrl6PqLVxyG/U1AFri5DmMcbPe8zMTsJQ9qqdj
 jueoDuoXU5GaLRzzxKE/SKpoumVshnle5kVS76k6e9WqR66kzl75Bo+CgLg/KjRZlSFc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUSyiuA167V6AaxHXUfQ3hKb9lOnNAybSwn0
 BmOhdyBONB0mOTLEzTHrO7S9G7sf3FPdgfueBPoUyNGyOLDpo0Xry6XFOc7K6SLnML5GgPJl
 mXiQDcFu1kDsSIa//zlrQuf2mj8+cehoh0dvVuOAD/8hu9tTMv8PtHztwCGhRpVBNzBJmRtq
 kTojCR3AAomKZiW3BKAT+wWdF1Cz6bUaWaM6bKD8nRIythMx5JAVdoKiN2GDB01WvvogBewC
 KMphStf5YVIIFyhZrJtboS6BqwClPawTo6/CKyNP4IVPfCdkTO6ENxGPxbMjwgBbmB1+U3AB
 XtrWZn1VitLYUiW5DG3W/0cwdcW+8zK/kuKHcqT503+gdKjiIu9Fe9t3K2mMrpos8tpYWz9r
 75iCid9408CC7OjOHOMqdF7wJJjBSFTOK0aYvd/LoarSjeK0kl7YxMN6dvNo7BYopk=
IronPort-HdrOrdr: A9a23:dl1fZqj12NjW+WdERxt8gcM1C3BQXh4ji2hC6mlwRA09TyX5ra
 2TdZUgpHrJYVMqMk3I9uruBEDtex3hHP1OkOss1NWZPDUO0VHARO1fBOPZqAEIcBeOldK1u5
 0AT0B/YueAd2STj6zBkXSF+wBL+qj6zEiq792usEuEVWtRGsVdB58SMHfiLqVxLjM2YqYRJd
 6nyedsgSGvQngTZtTTPAh/YwCSz+e78q4PeHQ9dmca1DU=
X-Talos-CUID: 9a23:MIckimz2dJiLubaMQIBNBgVXMfsFdHH57UuIeX7gMmxXWqKZSm2prfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AgnhrGwzRw9BoVrx/cl3LaSNIfiiaqKWhWEUpl88?=
 =?us-ascii?q?pgdenLisvOCuCnQieAaZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,250,1677560400"; 
   d="scan'208";a="107797744"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 0/6] x86: Fix transient build breakage with featureset additions
Date: Thu, 4 May 2023 20:39:18 +0100
Message-ID: <20230504193924.3305496-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

See patch 5 for details.  Patch 6 is just an example that demonstrates the fix
working in practice.

Andrew Cooper (6):
  x86/cpu-policy: Drop build time cross-checks of featureset sizes
  x86/cpuid: Rename NCAPINTS to X86_NR_CAPS
  x86/cpuid: Rename FSCAPINTS to X86_NR_FEAT
  x86/cpu-policy: Split cpuid-consts.h out of cpu-policy.h
  x86/cpu-policy: Disentangle X86_NR_FEAT and FEATURESET_NR_ENTRIES
  DO NOT APPLY: Example breakage

 xen/arch/x86/alternative.c             |  2 +-
 xen/arch/x86/cpu-policy.c              | 33 +++++++++++-----------
 xen/arch/x86/cpu/common.c              | 16 +++++------
 xen/arch/x86/cpuid.c                   |  2 +-
 xen/arch/x86/include/asm/cpufeature.h  |  2 +-
 xen/arch/x86/include/asm/cpufeatures.h | 11 +++-----
 xen/arch/x86/include/asm/cpuid.h       |  2 +-
 xen/arch/x86/sysctl.c                  |  8 +++---
 xen/include/xen/lib/x86/cpu-policy.h   | 29 ++++++--------------
 xen/include/xen/lib/x86/cpuid-consts.h | 38 ++++++++++++++++++++++++++
 xen/lib/x86/cpuid.c                    |  8 ++++--
 11 files changed, 88 insertions(+), 63 deletions(-)
 create mode 100644 xen/include/xen/lib/x86/cpuid-consts.h

-- 
2.30.2


