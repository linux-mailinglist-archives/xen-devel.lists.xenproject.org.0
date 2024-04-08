Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3758589C969
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 18:12:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702009.1096700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtrav-0001gY-J2; Mon, 08 Apr 2024 16:11:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702009.1096700; Mon, 08 Apr 2024 16:11:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtrav-0001e2-Ej; Mon, 08 Apr 2024 16:11:41 +0000
Received: by outflank-mailman (input) for mailman id 702009;
 Mon, 08 Apr 2024 16:11:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VUGe=LN=actia.se=john.ernberg@srs-se1.protection.inumbo.net>)
 id 1rtrat-0001de-PD
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 16:11:39 +0000
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac825859-f5c2-11ee-b7f7-5d6b493b22b9;
 Mon, 08 Apr 2024 18:11:36 +0200 (CEST)
Received: from S036ANL.actianordic.se (10.12.31.117) by S036ANL.actianordic.se
 (10.12.31.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 8 Apr
 2024 18:11:35 +0200
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%4]) with mapi id
 15.01.2507.037; Mon, 8 Apr 2024 18:11:35 +0200
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
X-Inumbo-ID: ac825859-f5c2-11ee-b7f7-5d6b493b22b9
From: John Ernberg <john.ernberg@actia.se>
To: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	"Michal Orzel" <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Peng Fan
	<peng.fan@nxp.com>, Jonas Blixt <jonas.blixt@actia.se>, John Ernberg
	<john.ernberg@actia.se>
Subject: [PATCH v4 0/3] Xen: ARM: Improved NXP iMX8 platform support
Thread-Topic: [PATCH v4 0/3] Xen: ARM: Improved NXP iMX8 platform support
Thread-Index: AQHaic9t6sIp2eY7JUShr1n6S6NtZg==
Date: Mon, 8 Apr 2024 16:11:35 +0000
Message-ID: <20240408161129.900347-1-john.ernberg@actia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.44.0
x-originating-ip: [10.12.12.11]
x-esetresult: clean, is OK
x-esetid: 37303A2958D72954657C6A
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0

The iMX lpuart driver added at 44e17aa60d47 ("xen/arm: Add i.MX lpuart driv=
er")
is not enough to boot a Linux based dom0 when certain drivers, such as the
watchdog driver, are enabled.

We're also fixing compatibles in imx-lpuart to allow Xen to use the UART
on the QXP variant as well.

When it comes to the watchdog we're currently only implementing the support
for letting Dom0 manage it. There is also a desire for another approach
where Xen kicks the watchdog (dom0-less use-cases etc). This approach is
not covered by this patch set.

v4: (see individual patches for detailed changelog)
 - Drop all SIP calls not used by iMX8Q{M,XP} (Michal Orzal)
 - Sign off patch 3 (Stefano Stabellini)

v3: https://lore.kernel.org/xen-devel/20240328163351.64808-1-john.ernberg@a=
ctia.se/
 - Added a few more SIP calls
 - Become a reviewer of IMX8Q{M,XP} related patches (Bertrand Marquis)

v2: https://lore.kernel.org/xen-devel/20240214160644.3418228-1-john.ernberg=
@actia.se/
 - Added SIP call filtering (Julien Grall)
 - Replace lpuart compatible instead (Julien Grall)

v1: https://lore.kernel.org/xen-devel/20240131114952.305805-1-john.ernberg@=
actia.se

John Ernberg (3):
  xen/arm: Add imx8q{m,x} platform glue
  xen/drivers: imx-lpuart: Replace iMX8QM compatible with iMX8QXP
  MAINTAINERS: Become a reviewer of iMX8Q{M,XP} related patches

 MAINTAINERS                     |   5 ++
 xen/arch/arm/platforms/Makefile |   1 +
 xen/arch/arm/platforms/imx8qm.c | 139 ++++++++++++++++++++++++++++++++
 xen/drivers/char/imx-lpuart.c   |   2 +-
 4 files changed, 146 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/arm/platforms/imx8qm.c

--=20
2.44.0

