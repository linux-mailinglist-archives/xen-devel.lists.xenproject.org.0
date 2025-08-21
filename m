Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A49F4B2F4F2
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 12:15:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088341.1446102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up2KX-0005Dc-3N; Thu, 21 Aug 2025 10:15:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088341.1446102; Thu, 21 Aug 2025 10:15:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up2KX-0005Ao-0L; Thu, 21 Aug 2025 10:15:37 +0000
Received: by outflank-mailman (input) for mailman id 1088341;
 Thu, 21 Aug 2025 10:15:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m+ul=3B=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1up2KW-00059V-2f
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 10:15:36 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6d98738-7e77-11f0-a32b-13f23c93f187;
 Thu, 21 Aug 2025 12:15:35 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DU2PR03MB8021.eurprd03.prod.outlook.com
 (2603:10a6:10:2dc::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 10:15:31 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%4]) with mapi id 15.20.9052.014; Thu, 21 Aug 2025
 10:15:31 +0000
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
X-Inumbo-ID: c6d98738-7e77-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wQnopTE2sAZq1m7mVc1CvoCrNAsWgKea9ZcHfSaac9cH6Q5pbV5wnuUbD7GSqubbkYqecBMOBHy64GcbLHgxd9qfxYEqxwiDNR/v0yRU5wTzF+ezOwtpN6ZqxkmqpcGPzJZZKIU2BtffQQR/2JAMnM2giuuFdkG7kuAXS79crEP/AxuYjstE0gt5rWYGgneOQVXwTTLD0dBX3Bf+Mb0VV9+hbqCL9ni0lLQ1aKy7OCg9r4qB5f/ptvyOlgxWn5zqBpZtATHmwmdYZRXd34y7Yjyendki3TCympg3APZGnkeneTPIFwAtE0AOTME4k2QZlRapSCZmZbb/6KCROjwN8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kqjDelxA5NEfCApppR2MvxtRhPpwk2taMmmiiJk0IN0=;
 b=FiMNhEPyxkGHUEvreKzmH3gsFUwHowbT5Qq9wNwphlyuC/85vEyNrD6MIXTjqJaLqrQyPjfQ964ZKSRrRoo9k3wuN9f3HiKJ9BTFOjdOyT1ta3aturDJ66GU5gFupO2pZ02xKAoI+vjeqzYlmrTjyRtnI7XY1kFPSsQDAYChy78t5Yyc78p2j2xTdk2d/usPssO3I1cZUzOg0pM779wA2lWbCge4cwa+OMZJcC8mKI1ljSTahQpYj4L/xn03/q4IBkaoXz1Ns4bYW4PPRz2JDxeo5MfIpA690cj/059yOChOjmT1QCeCCJKEeJkJKcMHFDOUrGozQVBKvtsPwdDIEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kqjDelxA5NEfCApppR2MvxtRhPpwk2taMmmiiJk0IN0=;
 b=EmfblyVT6xOhp2SazT0TPMf4glxmUkt34gewmNTXmz3vBYwpWv+IDacIsw318eoz2Rqb+z7MQRTv1Pu7PpmG/dAr8JQpBCp7oDjdU/Z0QTDsJKAVfpwkPb5ugWxleSNRgXmQUIJX71wevJ9XnM+aGJfORYPkantDpnZ7MOZ8QZypidolZGBRcKrlI0aL39r8ZomMYJzKmR5xXAtakXB0kL7ajp4Y/6hawM8ge0bk3+H4opmZlSSpGzvZpMtpXlDobj6YfjEXHL1ixJaXS8zFrCJSmWxA7KwPe012hnLpsszSbVA3Qio0aldi7U6yb1ePx+gGp1RLb7I587ez57At4Q==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v3 0/3]  IPMMU handling for PCIe Passthrough on ARM
Thread-Topic: [PATCH v3 0/3]  IPMMU handling for PCIe Passthrough on ARM
Thread-Index: AQHcEoSGp4UiN6shIECROwdG5unMwQ==
Date: Thu, 21 Aug 2025 10:15:31 +0000
Message-ID: <cover.1755771103.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DU2PR03MB8021:EE_
x-ms-office365-filtering-correlation-id: 4c7f3d75-1d83-474d-20aa-08dde09ba8ac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?gJ5wWfMiyhS/iHi34PfXfeRoSfPX4W2sWZXESyhE9ulyXpBXnYmKb/jvWY?=
 =?iso-8859-1?Q?wxneVHl5D3K5jGJ2PU/OzfvHPnwXBUOPxWJB4KkhhnLU07Yuway0vtQfeH?=
 =?iso-8859-1?Q?mXs9jPlWpYO0bJhBCRVFHMRe/USbEwCIOphmOHpi0c73287TpVQUX4FEj0?=
 =?iso-8859-1?Q?Pe/VC8syW5P2icr8aUncdiGIq0mhAf24sRC6J8oq1VgnPjh646UMOSIyIt?=
 =?iso-8859-1?Q?HZPrCdQR4lBtVI1sw5jFnefaU+QqzGDTdiBrKjAPzpwXcCfdiq0R0RNmWd?=
 =?iso-8859-1?Q?rx5S2qdzbKLQqP4fQiG4jYynPRI02tmQOwxhOuLjKLzxs3NWMIFRHwbq46?=
 =?iso-8859-1?Q?UNG0mbp995xQD/qwFIp4JmLlIC9p+70qEw3EHdZwjwKkiDou/95Q+uVTy3?=
 =?iso-8859-1?Q?b2pk5GogvC+ezvpmaDigUEdMbEwQ10lhUKHVFRoelMIZq4P9cIGp8/tp+w?=
 =?iso-8859-1?Q?HHl9NHEgvjZTTsSTqNRjPvzx6Qxf1Go6vT1bdKYNm/TKxEa0Dpn01iFmCA?=
 =?iso-8859-1?Q?wqDcYPkelgEoj9ir2IH0ElI2cYU22U9w3d771Ol6o9VtvGejoDftIboWiv?=
 =?iso-8859-1?Q?S7jtaGLXworp3RdeQ9gXX713p0bfmFQ6iLQDEAXqkACmnYMOYxAAwc6iWK?=
 =?iso-8859-1?Q?cehSUCcZKbSy8bDsZjfotQ58bWLxG56DITCfNfXmlXTZt9d0jtVJKKR/fQ?=
 =?iso-8859-1?Q?6ZDserU8qeeRrfqJBCmpAFazp+YQRHX/VrxhrgV8csC+Pt467INzvUob+5?=
 =?iso-8859-1?Q?YfqI7KAuZra2mwIlgWdPYsVPLoKQfEsbjvNThAtMUG/K13nb8dcRGWaPmm?=
 =?iso-8859-1?Q?BPXxFaxwbMuBsqcW5m+xnqtXPgH7pMMGbg+2DgJcAzLl++hXhzgnzo7qXU?=
 =?iso-8859-1?Q?o8c+uY8joVsGq5bfvL0U7XaerhjQrbB/tSnPZrfrDcix3o1/QbPPQ/6r/M?=
 =?iso-8859-1?Q?hb2qOOVzsQ5EZ5iL92EF47aW0XsciWOn7sSHnNlOk/KugSB0kjvTsSkBOC?=
 =?iso-8859-1?Q?4vu0hst/XZP1JSZR6HuhC8vRdBrPEEwGFVc89GLMN/MNalta2cOFT7m6UG?=
 =?iso-8859-1?Q?F7A9BmEyTFxneS7qYBTp4hMR/PZjW4cElZMHSas6CwanseTTKheWmJH18k?=
 =?iso-8859-1?Q?eKwzRqzxD1rjJrIBilDBLxQ1u7ZpmBvfQjn2vLTFDmznOA3B61BZRnm45n?=
 =?iso-8859-1?Q?RgWh3PZZMebj7DqMsbdXj3LmHj2y7J6cCiYYdnBtjm6dT5ATB+lc2DLISY?=
 =?iso-8859-1?Q?YbCQ8DqfSCFNgrYN2cfyCDdX8CRPe6+xbz4xQm2NseD7/Byy6xikeDyP2F?=
 =?iso-8859-1?Q?yimojUGEeKKXD6qZlZwwaT+MeFVnWD9BtjU4OTKN8qS4kU57Pdshr5JJaN?=
 =?iso-8859-1?Q?Nj++jtsz1K3+bertixvwBjj4ftkn+Ubnfl780CcMBjtFH5mMsBWBlMZSsx?=
 =?iso-8859-1?Q?p67ByNOANbDBCSUR5kBu8jihniqkreT39PVx6xfVGq6b/R7YngyU/tVX2u?=
 =?iso-8859-1?Q?1LlLD+DvJqrC4gPn8G/uCEjRGvq5LXSmfLK5EVprJcEA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?A6YgS1K10ku3JsAnUOLjbSEUrvDObNwPQWhzP+f6Y1Pj7avTMMRvd9RwFo?=
 =?iso-8859-1?Q?dr2kr3qFPvbRzo4mASJMoToWsSeNrI+35gQtXJVdiEL8gDiv09pMRTe3KV?=
 =?iso-8859-1?Q?g5Ka3D8QJSSguF3MXkD1d7zyvMMbXchhjg0rU1rp6EmaZIwPeJcmRQRl91?=
 =?iso-8859-1?Q?zgjKF4KS8NlatE8f/94UPFSxhKcM9nCyAm07pJW8eD89zF5WZLBi9fbxw/?=
 =?iso-8859-1?Q?27YfiM5xG/yhEVGIZ5/89fhBfslhmrTqGQvyNBr/JgcnQUUC5D44R2nJJe?=
 =?iso-8859-1?Q?2uDlTuf+NvbsJMYu2orpR01Hl6AWAOASD9IFqH6bOoLX6kC6y/PU0aUTDz?=
 =?iso-8859-1?Q?xj5N2YFSWOAs/1TMqI8DOYARJgarzQKvyrMy0Nau9+YqMzwXwe3oLlIDHM?=
 =?iso-8859-1?Q?Lwb6KHOJgGbLH/4h3zfq8BirpjbX0H92OKa08hNSpcCu0yMSZnGG4vitc/?=
 =?iso-8859-1?Q?aamiTZ7uEqQUVLs53S40+Xb00ISrx3alRuvt360Q8/ydvTB+yYZ5paarsi?=
 =?iso-8859-1?Q?36cq6y7UeZKOxQUUmp0yEIFlkcHqOG/yh2ZPB/DksOzEXcG86BXvdzrazA?=
 =?iso-8859-1?Q?dMtC5ZKhuWQSpsYElYeOf+n5X+8b+8q9LEtczgBNb7j+mFzENOV7QYwUx/?=
 =?iso-8859-1?Q?w0upWMnbsz33nNZaT9MHtBcN5N3JiOvxDlSpd1r1Cl1nxhtqjRWcL1yPUP?=
 =?iso-8859-1?Q?BNI3oCXUGIiHQWWc1Lim4MCvNCnfpBLuUFWZXcjrbcvMrmH5aD01H7r9ol?=
 =?iso-8859-1?Q?nbOPAPfyHv92MQRy206CCM+Hb+SLmj3ILp0V9Vy6YvDViMO82uVA/BOOpt?=
 =?iso-8859-1?Q?GKTNz1odbzGMK5/jeXmbKiXJp9XSrhW7l0DSYkNUIkjY/EzQBvyS1cvPal?=
 =?iso-8859-1?Q?fxKicR8U9Yq4keHbT7jLsekwPJUwIES22leOfj8dr+tDAOF461OAm7Rx82?=
 =?iso-8859-1?Q?O3BkAddxLQM4a9NmLjFyEjQRADkh/XgaNFh8gv2X79rtQcEtkDoIYqLYJx?=
 =?iso-8859-1?Q?NdXB64d5SGcwJ6ifcLsbDxxvkGlP41VB5l+X8PtR5NWBWkdGe2DZE0UnF3?=
 =?iso-8859-1?Q?1T7QkAEu7nHPc4Kb6pCrSC2PgoMQ2uZaE8AMwftkjY+YxbISMm3+RmyRA/?=
 =?iso-8859-1?Q?zwjRjptXkn4nVsc6wvyuG2hQlF6nVibk3cSF3Qz9ggONicnBR0tiqPQG2E?=
 =?iso-8859-1?Q?HyQCXepDHeJ2Zy9yrDH6FH89TCx/GgyOjFj5I9rjDnMASHcfPCmC6GnpSv?=
 =?iso-8859-1?Q?JvLIWWB5hGlBl5TS6m4R4k5Wv/AgsaLdhR0YFYItzCh+grWm5q2FX3/Kvx?=
 =?iso-8859-1?Q?GexMLrD2WPW4wLCV3nqujhYHGJoks8dkvKaAI2MzXQ09MN9pF/rh57NU0K?=
 =?iso-8859-1?Q?0tHee+OB7HVQIPBHgnX9Xc6TVLHsfD+jLve4wWdgKdklwxBYQy40oHpgso?=
 =?iso-8859-1?Q?M7+e9ZM1vSXQHxxWteBH/rPaND8IlxMxvZ3TWSMCRqOm55I96KewETY0uS?=
 =?iso-8859-1?Q?ld5L2kIEZ52JAPDnpVq2yR3DuBcMgi6V1GX/t7RepNr1K3vJtPWzBG6QDN?=
 =?iso-8859-1?Q?4NPhmMGlOnFKQgg1JgmHeAjnAhHRpo25hCydTGkYMWnwR3xbEf/V+dxnV0?=
 =?iso-8859-1?Q?0RaPBjFugoHckPp/pc5KokdKf01tnV21CV7CY7v5odAELBMjXgEYt+Yg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c7f3d75-1d83-474d-20aa-08dde09ba8ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2025 10:15:31.0494
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TiKsMEDg4QYUnX7ODCodXctr6KlRVTI3y0vAjEsIdsebRjZfG9qxRY/I2zi0NHK35nyzAD61PPpcTCqfSbvA3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR03MB8021

This series introduces IPMMU handling for PCIe passthrough on ARM. It inclu=
des
changes to pci-designware, pci-host-rcar and ipmmu-vmsa drivers to enable
configuring BDF->OSID->uTLB translation chain needed to pass different PCIe
devices to different domains.

Tested on RCar S4 Spider board.

v2->v3:
* see individual patches

v1->v2:
* see individual patches

Mykyta Poturai (2):
  arm/pci: allow designware-based hosts to have private data
  pci/rcar: implement OSID configuration for Renesas RCar Gen4 PCIe host

Oleksandr Tyshchenko (1):
  iommu/ipmmu-vmsa: Implement basic PCIE-IPMMU OSID support

 xen/arch/arm/pci/pci-designware.c        |  12 ++
 xen/arch/arm/pci/pci-designware.h        |   4 +
 xen/arch/arm/pci/pci-host-rcar4.c        | 148 +++++++++++++++++++++++
 xen/arch/arm/pci/pci-host-rcar4.h        |  18 +++
 xen/drivers/passthrough/arm/ipmmu-vmsa.c | 138 +++++++++++++++++++--
 5 files changed, 312 insertions(+), 8 deletions(-)
 create mode 100644 xen/arch/arm/pci/pci-host-rcar4.h

--=20
2.34.1

