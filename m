Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF6089053B
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 17:34:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699120.1091695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpshh-0004ux-1m; Thu, 28 Mar 2024 16:34:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699120.1091695; Thu, 28 Mar 2024 16:34:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpshg-0004su-VQ; Thu, 28 Mar 2024 16:34:12 +0000
Received: by outflank-mailman (input) for mailman id 699120;
 Thu, 28 Mar 2024 16:34:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XOaz=LC=actia.se=john.ernberg@srs-se1.protection.inumbo.net>)
 id 1rpshf-0004sj-OM
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 16:34:11 +0000
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0067e672-ed21-11ee-a1ef-f123f15fe8a2;
 Thu, 28 Mar 2024 17:34:09 +0100 (CET)
Received: from S036ANL.actianordic.se (10.12.31.117) by S035ANL.actianordic.se
 (10.12.31.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 28 Mar
 2024 17:34:08 +0100
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%4]) with mapi id
 15.01.2507.037; Thu, 28 Mar 2024 17:34:08 +0100
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
X-Inumbo-ID: 0067e672-ed21-11ee-a1ef-f123f15fe8a2
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
Subject: [PATCH v3 0/2] Xen: ARM: Improved NXP iMX8 platform support
Thread-Topic: [PATCH v3 0/2] Xen: ARM: Improved NXP iMX8 platform support
Thread-Index: AQHagS3BYCNM31zad0Wcj7N7qYftsw==
Date: Thu, 28 Mar 2024 16:34:08 +0000
Message-ID: <20240328163351.64808-1-john.ernberg@actia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.44.0
x-originating-ip: [10.12.12.11]
x-esetresult: clean, is OK
x-esetid: 37303A2921D729556C7D66
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

NOTE: There is still an open point about the iMX8M* related SIP calls in
the driver and the value of documenting them. There was also a few other
calls noted that weren't implemented because Linux today aren't using them.
I added these as they were part of the discussion if they should be
documented or not.


v3: (see individual patches for detailed changelog)
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

 MAINTAINERS                     |   5 +
 xen/arch/arm/platforms/Makefile |   1 +
 xen/arch/arm/platforms/imx8qm.c | 168 ++++++++++++++++++++++++++++++++
 xen/drivers/char/imx-lpuart.c   |   2 +-
 4 files changed, 175 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/arm/platforms/imx8qm.c

--=20
2.44.0

