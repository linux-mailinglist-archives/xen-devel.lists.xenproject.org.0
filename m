Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51608854DAA
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 17:07:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681054.1059610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raHmn-0000q6-Ro; Wed, 14 Feb 2024 16:07:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681054.1059610; Wed, 14 Feb 2024 16:07:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raHmn-0000nk-Ou; Wed, 14 Feb 2024 16:07:01 +0000
Received: by outflank-mailman (input) for mailman id 681054;
 Wed, 14 Feb 2024 16:07:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xNvu=JX=actia.se=john.ernberg@srs-se1.protection.inumbo.net>)
 id 1raHmm-0000fn-Uj
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 16:07:00 +0000
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15bb1de6-cb53-11ee-8a4d-1f161083a0e0;
 Wed, 14 Feb 2024 17:07:00 +0100 (CET)
Received: from S036ANL.actianordic.se (10.12.31.117) by S036ANL.actianordic.se
 (10.12.31.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 14 Feb
 2024 17:06:59 +0100
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%4]) with mapi id
 15.01.2507.035; Wed, 14 Feb 2024 17:06:59 +0100
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
X-Inumbo-ID: 15bb1de6-cb53-11ee-8a4d-1f161083a0e0
From: John Ernberg <john.ernberg@actia.se>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Peng
 Fan" <peng.fan@nxp.com>, Jonas Blixt <jonas.blixt@actia.se>, John Ernberg
	<john.ernberg@actia.se>
Subject: [PATCH v2 0/2] Xen: ARM: Improved NXP iMX8 platform support
Thread-Topic: [PATCH v2 0/2] Xen: ARM: Improved NXP iMX8 platform support
Thread-Index: AQHaX1/WsH0KS4ZeU0CO5OqKnDdxdQ==
Date: Wed, 14 Feb 2024 16:06:59 +0000
Message-ID: <20240214160644.3418228-1-john.ernberg@actia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.43.0
x-originating-ip: [10.12.12.30]
x-esetresult: clean, is OK
x-esetid: 37303A2958D72955607464
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0

The iMX lpuart driver added at 44e17aa60d47 ("xen/arm: Add i.MX lpuart driv=
er")
is not enough to boot a Linux based dom0 when certain drivers, such as the
watchdog driver, are enabled.

We're also fixing compatibles in imx-lpuart to allow Xen to use the UART
on the QXP variant as well.

NOTE:
There's still an open point regarding the watchdog from v1, but I wanted
to post this series to show the filtering changes mostly because they also
clarify what exists and what we can definitely get away with blocking /
ignoring out of all the SMC SIP calls.

v2: (See each path for complete changelog)
 - Added SIP call filtering (Julien Grall)
 - Replace lpuart compatible instead (Julien Grall)

v1: https://lore.kernel.org/xen-devel/20240131114952.305805-1-john.ernberg@=
actia.se

John Ernberg (2):
  xen/arm: Add imx8q{m,x} platform glue
  xen/drivers: imx-lpuart: Replace iMX8QM compatible with iMX8QXP

 xen/arch/arm/platforms/Makefile |   1 +
 xen/arch/arm/platforms/imx8qm.c | 143 ++++++++++++++++++++++++++++++++
 xen/drivers/char/imx-lpuart.c   |   2 +-
 3 files changed, 145 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/arm/platforms/imx8qm.c

--=20
2.43.0

