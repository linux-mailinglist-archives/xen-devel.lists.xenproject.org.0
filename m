Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D39AD82B7DE
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 00:13:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666554.1037265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rO4Ex-0006Tm-5N; Thu, 11 Jan 2024 23:13:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666554.1037265; Thu, 11 Jan 2024 23:13:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rO4Ex-0006Rp-2I; Thu, 11 Jan 2024 23:13:35 +0000
Received: by outflank-mailman (input) for mailman id 666554;
 Thu, 11 Jan 2024 23:13:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ikTk=IV=citrix.com=prvs=733603de5=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1rO4Ev-0006Rc-Rn
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 23:13:33 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07dcd248-b0d7-11ee-98f0-6d05b1d4d9a1;
 Fri, 12 Jan 2024 00:13:31 +0100 (CET)
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
X-Inumbo-ID: 07dcd248-b0d7-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1705014811;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1qAJb7K/k8QWfsH7zKV3pM6RT7p0oaCBLlDrevB05jA=;
  b=S00L3DyzRbvbPwfxkhydFHTACOHbVwv2ws6WhlQA0+EkH/DEgjEjVeSo
   Je5DFo5OX+5zFujIEvYq749O4FZ2AFCs33GF5sUeT+n9xK5LeT6W1D0KQ
   mzrUmcDC7hcHpFOqair4IlObC3+BvxfIwqgXuJFXdUiu/gpQfaRXoW/0S
   U=;
X-CSE-ConnectionGUID: tTQc7+osRG6vwTF5UyETeQ==
X-CSE-MsgGUID: y9ygL2S4RUCCWpZ7B1GSjg==
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 129228545
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:uogHWqoALiJp/pNWEYQvuJL0A1xeBmIjZRIvgKrLsJaIsI4StFCzt
 garIBnVPf6CZ2Snfd8kPIq18x5VsJPcy4QwTAY+qiFhRS0R+ZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbOCYmYpA1Y8FE/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04G9wUmAWP6gR4AeHziBNV/rzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXACwxVxvcxOWt+p3lVPZQqJkePeTXMbpK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSaxFIUPrSn8/x7pX7WxRepEiYuuwc5G/LwRYq+LPsLMDUapqBQsA9ckOw/
 ziXpT6pX01HXDCZ4SvU432I3NSTpx7Qc70KJuKSr9FRglLGkwT/DzVJDADm8JFVkHWWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8UYwgyQzqvf4y6CG3MJCDVGbbQOq8seVTEsk
 FiTkLvBByFp9rucSnuf97KdhTK0JSURa2QFYEcsTgYb4t+lvIA6iDrOSMpuFOi+ididMS35x
 jmRhDQ9g7gVgt8G0+Ow+lWvqzO3ppnIVCY6oAjcVSS4qx9+Z5+iIYWjr1rDhd5bLIefR3GMt
 3NCho2C6+MfCteEn2qPWI0w8KqBvqjfdmeG2Bg2QshnqGzFF2OfkZ54/A1HLxgqNd0+VmH3f
 3P95D5AyaNeBS7/BUNoWL5dG/jG3IC5Soy5D6GMMIYTCqWdYjNr682HWKJx44wOuBJ1+U3HE
 c3HGftA9F5DYUid8BK4Rv0GzZggzT0kyGXYSPjTlkv/jePPPi7KEOxUbDNii9zVC4vd/W3oH
 yt3bZPWm32zrsWiCsUozWLjBQ9TdiVqbXwHg8dWavSCMmJb9JIJUpfsLUcaU9U9xcx9z76Yl
 kxRr2cEkDITc1Wbc1TVAp2iAZuzNatCQYUTZHd8ZQfxiiJ5Me5CLs43LvMKQFXuz8Q7pdYcc
 hXPU5zo7ihnItgfxwkgUA==
IronPort-HdrOrdr: A9a23:SFyxPq9+BXhWLj5wrq5uk+DUI+orL9Y04lQ7vn2YSXRuHPBw8P
 re+8jztCWE7Ar5N0tBpTntAsW9qBDnhPtICOsqTNSftWDd0QPCRuxfBOPZslvd8kbFl9K1u5
 0OT0EHMqyTMWRH
X-Talos-CUID: =?us-ascii?q?9a23=3ANi9OCWp+k7dHpDDUeR8d2mbmUdwZS3aCj3DLGWD?=
 =?us-ascii?q?mF3lVZuCoWHKs9Zoxxg=3D=3D?=
X-Talos-MUID: 9a23:yElhuQbf4NB3CuBTpm79ixU4D5tS3o+FN1g/zr9flPKGOnkl
X-IronPort-AV: E=Sophos;i="6.04,187,1695700800"; 
   d="scan'208";a="129228545"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel
	<tamas@tklengyel.com>, Reima ISHII <ishiir@g.ecc.u-tokyo.ac.jp>, "Takahiro
 Shinagawa" <shina@ecc.u-tokyo.ac.jp>, George Dunlap
	<george.dunlap@citrix.com>
Subject: [PATCH v2 0/3] x86/vmx: Multiple fixes
Date: Thu, 11 Jan 2024 23:13:20 +0000
Message-ID: <20240111231323.4043461-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Fixes for two bugs initially reported to the Xen Security Team, but determined
not have an impact in security-supported configurations.

The Xen Security Team would like to thank Ishiisan for engaging in responsible
disclsoure.

As a reminder to the rest of the Xen community, please do ask you're not sure.

v2:
 * See patches for details.

Andrew Cooper (3):
  x86/vmx: Collect all emtpy VMExit cases together
  x86/vmx: Fix IRQ handling for EXIT_REASON_INIT
  x86/vmx: Disallow the use of inactivity states

 xen/arch/x86/hvm/vmx/vmx.c              | 29 ++++++++++---------------
 xen/arch/x86/hvm/vmx/vvmx.c             |  9 ++++++--
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  1 +
 3 files changed, 20 insertions(+), 19 deletions(-)

-- 
2.30.2


