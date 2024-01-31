Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDCC843ED1
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 12:52:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673956.1048560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV97Y-0007cd-Ij; Wed, 31 Jan 2024 11:51:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673956.1048560; Wed, 31 Jan 2024 11:51:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV97Y-0007Ze-Dn; Wed, 31 Jan 2024 11:51:12 +0000
Received: by outflank-mailman (input) for mailman id 673956;
 Wed, 31 Jan 2024 11:50:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L+aY=JJ=actia.se=john.ernberg@srs-se1.protection.inumbo.net>)
 id 1rV96k-0007Xl-Qb
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 11:50:22 +0000
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e967574e-c02e-11ee-8a43-1f161083a0e0;
 Wed, 31 Jan 2024 12:50:21 +0100 (CET)
Received: from S036ANL.actianordic.se (10.12.31.117) by S035ANL.actianordic.se
 (10.12.31.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 31 Jan
 2024 12:50:20 +0100
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%4]) with mapi id
 15.01.2507.035; Wed, 31 Jan 2024 12:50:20 +0100
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
X-Inumbo-ID: e967574e-c02e-11ee-8a43-1f161083a0e0
From: John Ernberg <john.ernberg@actia.se>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Peng Fan <peng.fan@nxp.com>, Jonas Blixt <jonas.blixt@actia.se>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "John
 Ernberg" <john.ernberg@actia.se>
Subject: [PATCH 0/2] Xen: ARM: Improved NXP iMX8 platform support
Thread-Topic: [PATCH 0/2] Xen: ARM: Improved NXP iMX8 platform support
Thread-Index: AQHaVDuq5roL8FqoG0Ku2MrU1zzMKA==
Date: Wed, 31 Jan 2024 11:50:20 +0000
Message-ID: <20240131114952.305805-1-john.ernberg@actia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.43.0
x-originating-ip: [10.12.12.30]
x-esetresult: clean, is OK
x-esetid: 37303A2921D72955667360
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0

The iMX lpuart driver added at 44e17aa60d47 ("xen/arm: Add i.MX lpuart driv=
er")
is not enough to boot a Linux based dom0 when certain drivers, such as the
watchdog driver, are enabled.

We're also adding iMX8QXP compatibles to allow Xen to use the UART on the
QXP variant as well.

John Ernberg (2):
  xen/arm: Add imx8q{m,x} platform glue
  xen/drivers: imx-lpuart: Add iMX8QXP compatible

 xen/arch/arm/platforms/Makefile |  1 +
 xen/arch/arm/platforms/imx8qm.c | 65 +++++++++++++++++++++++++++++++++
 xen/drivers/char/imx-lpuart.c   |  1 +
 3 files changed, 67 insertions(+)
 create mode 100644 xen/arch/arm/platforms/imx8qm.c

--=20
2.43.0

