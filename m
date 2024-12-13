Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E58E9F0D91
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2024 14:44:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856698.1269238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM5xE-0002hX-Ny; Fri, 13 Dec 2024 13:43:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856698.1269238; Fri, 13 Dec 2024 13:43:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM5xE-0002et-L1; Fri, 13 Dec 2024 13:43:40 +0000
Received: by outflank-mailman (input) for mailman id 856698;
 Fri, 13 Dec 2024 13:43:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oYUc=TG=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1tM5xD-0002en-2l
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2024 13:43:39 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20619.outbound.protection.outlook.com
 [2a01:111:f403:2612::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41585e4a-b958-11ef-a0d6-8be0dac302b0;
 Fri, 13 Dec 2024 14:43:37 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS8PR03MB9747.eurprd03.prod.outlook.com
 (2603:10a6:20b:61c::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Fri, 13 Dec
 2024 13:43:35 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%5]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 13:43:35 +0000
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
X-Inumbo-ID: 41585e4a-b958-11ef-a0d6-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pLquUP1+EEHc1Vmi30zUiOWgqDxxtcZ+hmAfXxJtGfXu8AjWpB/70dBrUD9rhnIf7Rzr8DXsTPr4/3fzWdWdwDtJ+UlduYWTZS/T9LyZFBpvAlFVXqT28HxK4aOZi9V9DA1z/H3p4V6SyTr0yoUPiHgi50IV2HjFsWj4+XuZHwtXN1tTucHabBz4usf08UqbznxbO3JXolir7TaTKkstUG3bPF5LOxv98G6363T6QhO8P7GSphy5djGPqT2dQLVM8d3zvO2W4YoVgmyzSluSElhe76hqDabR62LUbAh6S2xikwioO/vkWZmEPse7OTQBAhlISxikAuxQeLsV2IZzTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SXs4W9HXe/l7b8kPVdKdc9mxJ4MftveKskpVLf5RVcU=;
 b=w7eqlnwi227zoGxaGbi7Bwix9atGbCAXw9l5vhtG0e801fwU95vC3XVUSh8zNtPtZ6qLE4VmbQykdK8bsyPnhRkYqahEkgw4146+PqXrDY8z25Tgoh0AM1NycirUw3Iar3plCZTX4YqKqbexjKs7p2b74UbyxYNtHPief7LZ5eZXnTDTPgM26NkCDmfNYPhB0WYtuwBA3fUe+9XdB2tG0G1JUwGwYA3xpJmClIXsfAuUzEPMaZuNw9wB0kbWYqQRjtzmySaqbFKoy3c8OqjO5sqjQ6nkmlZhRCN92/j0DigWTVq3gFOsnSnV88Exv3hRd5Ps0g09w1sgH96SXanpXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SXs4W9HXe/l7b8kPVdKdc9mxJ4MftveKskpVLf5RVcU=;
 b=eWc0uuAF+pquLGIb3yVfkcu3Fk/RNASpYFr5O5yTcnj0bQuiylO3C0PwD970hhMEQ0Dg3VWhqxyDK/vnEYmQzQtyoIMaP/JdZ9Fc5WIbbmEH4eRyxivEiC8ry0BQkutTNlD0tDwi94E27lABR9TGS8QHzvhVWRATLnymbMyp4L+9YPjBFB0C3+XoJInLgNuKhiwl+C2Cl5gFjvOY0UTnTY49v7wdF8qsLDB0p7LCJMFTlyfG/HnCjtbdAbvciiNdKoWkFJKyiVBHR+zlu/OJgTt2eosuYFMuj9Hh8yG+04mO9wsn6RmepxCR7J/bhpR34WSp+XyGxVZrorLYovYQFw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [PATCH 0/2] Add support for Renesas R-Car Gen4
Thread-Topic: [PATCH 0/2] Add support for Renesas R-Car Gen4
Thread-Index: AQHbTWUB27lB14oHWUaGss6v6V2bnw==
Date: Fri, 13 Dec 2024 13:43:35 +0000
Message-ID: <cover.1734096752.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS8PR03MB9747:EE_
x-ms-office365-filtering-correlation-id: 6f6fbd61-b1b8-465e-ebee-08dd1b7c2429
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?59dfAtJNTcsx8/1phTsOXPJZbXqlRFG+Bb+56VlLC91rgr/hnHuTtgHvJ0?=
 =?iso-8859-1?Q?b8Urd001a5hWMFQ/LCGTK2j2AijOP73/Nlu/mMaFu+A0RzLj3ePK5JLoHM?=
 =?iso-8859-1?Q?IcdcrkgXh0JmLtEbOJBNXPQ7cOMHaVusTgaSlIpRNM6Et8f2gBpHtDr+lR?=
 =?iso-8859-1?Q?e2oHGtpT/9WC0SKL2a2VOIRSVBI9nyw67ublOPqbwpLnM7YyVhxt1CtryJ?=
 =?iso-8859-1?Q?aUDx0MMfC+oH2pBmw5pYbnuZp9kmUAg8QKNuS0+pUYEVCtZMDhvvxFDa2R?=
 =?iso-8859-1?Q?1av5efhIFekIzjq+xUXCkJvVsxy2KdKQpI1fn7SHqZN34uYQh9CBMxAm+M?=
 =?iso-8859-1?Q?2AjIVZAkR/LS5rtCzF4+lf6hXuxQpZCnN0pvYRyAfGXBgmtNT2WcPx1FuE?=
 =?iso-8859-1?Q?1kckz5g4FJOnVf31JDMftfwiFppGhPO3JU2NqwKhEdmh1YTqBMDYMVG46H?=
 =?iso-8859-1?Q?R3SEt5moBsxPjtFqGZdnbRASyDf6wnrScXsBiKLoezce8mdQdk+bZnXGAN?=
 =?iso-8859-1?Q?rwUYK80lUQdZZoLXGJczX+KetYfMKs6QDPecZJgSzoQrEzj3qVfcsWrmJz?=
 =?iso-8859-1?Q?PuWEX/djPmd3zMJKTcJR6h9ZgjGX6nAXywEhEuhFbZYYX0Zl4O8W/DmNzg?=
 =?iso-8859-1?Q?BvloAk9tDzlP5rv9+QTJLLOycLEfbs7hBLTrYpujqO3ymY6RMvWT0CXv3l?=
 =?iso-8859-1?Q?4Z/MlxCTmG/kyACHdwxdWJ7EcsiSxFkTM8J4upJNy16UenSgartm6V0pO4?=
 =?iso-8859-1?Q?skV0qKdEBp6Ujn/rTE/byqN3omtRNhwWsRl27zKoO6iiuccjx63ZNGFsCc?=
 =?iso-8859-1?Q?CbA8KdFFN3dCuHCHjdmjWLDiHPRT3jt+EAcGjIySO7Je3F96FfVwP04AjC?=
 =?iso-8859-1?Q?ciPO9QJVBRklV/+0d69j01uKaB0FO4wNIz7oaaxAqr2s+SgcgYE5R1sZ7N?=
 =?iso-8859-1?Q?7NHJbWFhT3keQ+VCAQedZGIxgPj61pl8KtyridKlRg5+rklrGBZTKb9oUx?=
 =?iso-8859-1?Q?+tzI19ntLLeuUHheIzm6NmWp3/2Ue+e0+JDhNQRwvJlUOLx+MCQN9JkDBr?=
 =?iso-8859-1?Q?Dgnavm73tblbO3cjbSaD+fjQ+sLYMSHcbdsz8HKxKaQGs3GPKMZtHwtDH4?=
 =?iso-8859-1?Q?HFMPzi6aGVVdvC9dTwjTufIbo0PRq6ZpFuc9+2G/eNUzYnsUW8o7yw5X9k?=
 =?iso-8859-1?Q?R0FAs/yaCIsdMYtXPyxPE+C3tKleONydozOsN4bto4xrNOL3HonQoWjhO3?=
 =?iso-8859-1?Q?pYVbjH84A0sFn9Yewbanol8XnXgbCbIOW2d1XSFtLWKJXOa7jY/Nq12McP?=
 =?iso-8859-1?Q?zuwkxPSJpZbPv8yWWREFrAj8gbCHBYxyLxZuTHj6J0kIUZhcVnNwhwWlj7?=
 =?iso-8859-1?Q?pLf67X2O6hChlqffJ13Q0eZJnyvOQjli/3E+Ms0MF46EPcZtndqlmHeu1U?=
 =?iso-8859-1?Q?eQGovK44DuajrOra29VqHMNVinQAhbGy3Nkxcg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?yLD2nKhS9kI42WvCyeWMPxdJ+0BiWBnaBk1CI4iUdd/DHtARCOrk2M6QYA?=
 =?iso-8859-1?Q?auK9GVdRRkp8rpdh2C7h4+VCxz6zgg4nhLiu5tX0I8bUlMT17mnxvryT13?=
 =?iso-8859-1?Q?a4YvP8DnSQBOYKv/7lrJ/E1myF/jdAbnYNyujJJ464kLiUJ9ONXX/7xrij?=
 =?iso-8859-1?Q?XLlpuPMmFYzI7UDprOlA/8Mhx2biA8udHJ+PI3cL+ecrOd3kyLdxAYW9C9?=
 =?iso-8859-1?Q?+Pvda2bmOwohs1+kOc4Y3y5G6bK00VudWlaJofxkKGn0+xewg2jUy+5R94?=
 =?iso-8859-1?Q?3+oFIRFq0O1A41pxxK2fUl0x7qLeCDLI4u4Q7+6p+A1SjpuDQd6StGw88T?=
 =?iso-8859-1?Q?dZ7mjn4IpSK3O6VADErAdcE9k7s4MQBEjWR8ddNEZUfR2w7qOulJnSN15P?=
 =?iso-8859-1?Q?CuIspLwTKx0e6B8QvAYwDHRGX/Ylrn03zjqblyWXqXDij3AhKWMA87+7Ih?=
 =?iso-8859-1?Q?4mT1PEhlBVmIaMdnxBawKgDTZxi/AruqOC7XGF0V8/Th2wEJSySBVCNo3q?=
 =?iso-8859-1?Q?1t2oo4bj+rZFypx5IU/q6dW3f7IN5UDdKOqvu+9NNU5G7hcGPdK7nz/aSq?=
 =?iso-8859-1?Q?FcDGc2pnMdAAKCalYP8OcgPSLZCOaUra4G67SPVyPYzVkL4hHYlDkVwg8U?=
 =?iso-8859-1?Q?wP7a2tEsmcXjtggQuE2qwX+fKbkSaKnkW9Eku4rK1BclOZPaiY7Wqo6E5l?=
 =?iso-8859-1?Q?HDGp9ORrU2puQ6zl7a3wAF1+2xHG0N4nC4kkR6nPdhTUbLWJjgaqenH09e?=
 =?iso-8859-1?Q?PuFxLcirgQKO4cc8QZdujA061FHEDnlY4i6kkzMDnNq9+xpqhPBNR1yMas?=
 =?iso-8859-1?Q?EUKvfkNn7uF294S3GFDLRTWDHgg8iS0RxP9OmDWLAfVFhEfz6yU52fx1X+?=
 =?iso-8859-1?Q?aRLb6c5DkYS74S1R8pznVor24snF9tWxTRQXRrca7dw5Da9Px0bT54DyEP?=
 =?iso-8859-1?Q?XgCLHmxpc+wgeKUR7PV98GBV/c+3EZ3De+02n60MG8KYsYM6lqX4u3/kZY?=
 =?iso-8859-1?Q?DrAH8gqI3xeP/vaXo2JhhXtGUEr6DcHDBRaKoosfP1dTmO8FC4TGU9+L4O?=
 =?iso-8859-1?Q?dY3lZaOkftjkQYiDB/Cej2Sj2VGGPQMfn3TzRH4k0Z8LF6qeFezxPNpE1I?=
 =?iso-8859-1?Q?hOczBdftmpAkYSe1cwqzS0KVU06UmTfO7Evnb08hQC7AuDEZ4FPq4R+qZw?=
 =?iso-8859-1?Q?nRtJ6bff9ZjaJONCnSHUm+Hbyvq4hchx3/85/gKcc6/KWxPCw/mSs5/eKw?=
 =?iso-8859-1?Q?+2HtMrXf/gbFPrfXbv14uZPEZURZ2PSGhKuL/r6a6AouZNna2P6OmZC7+V?=
 =?iso-8859-1?Q?YeyrqDVHFNAJ/WjDlfJR9CZov9Np9fJfEM7b3KTvP+OkysMFpwo1p8wiVR?=
 =?iso-8859-1?Q?RzgkuZDQ+OOvM4M929K5ADvz+l69yB9wVIVhfGJaipuv78MD1Teq7i96DF?=
 =?iso-8859-1?Q?Tq72vCw8/a3BRI+c3wB4rGNa9+tHW6+Fwu8sGTzn/ZI0rZzu+lTQ1+6u+w?=
 =?iso-8859-1?Q?9q1JaOcfEZ1B9JWKGCpUhm02ClaT3jnM6D2aOkdHBJLtTusZi/aq+pH3dz?=
 =?iso-8859-1?Q?LYQ5iMghR3uW6mkK1PfMS9vSnbsqXgVtj/TlyST/8EVXzndiE+1h6dYsqo?=
 =?iso-8859-1?Q?+xTNY84zWoUV3xqZjF462Ko/3RH66ulQD4l6tZPn2YgNriKvM5295cww?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f6fbd61-b1b8-465e-ebee-08dd1b7c2429
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2024 13:43:35.2565
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aKOhXExHF2oFIIMvvZjmSZAQwVfVW2XTG0KxeedYGZF/uqyNlE52DB6tFE0c1vYGRp72VZemLdKnTN4+XMZ08A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9747

Add support for Renesas Gen4 boards such as S4[1] and V4H[2] by adding the
appropriate confing option, and support for the Gen4 ITS.
Tested on Renesas R-Car V4H board.

[1]: https://www.renesas.com/en/products/automotive-products/automotive-sys=
tem-chips-socs/r-car-s4-automotive-system-chip-soc-car-servercommunication-=
gateway
[2]: https://www.renesas.com/en/products/automotive-products/automotive-sys=
tem-chips-socs/r-car-v4h-best-class-deep-learning-very-low-power-system-chi=
p-automated-driving-level-2level-3

Oleksandr Andrushchenko (2):
  ARM: ITS: implement quirks and add support for Renesas Gen4 ITS
  xen/arm: platform: Add support for R-Car Gen4

 xen/arch/arm/gic-v3-its.c             | 90 ++++++++++++++++++++++++---
 xen/arch/arm/gic-v3-lpi.c             | 14 +++--
 xen/arch/arm/include/asm/gic_v3_its.h |  8 +++
 xen/arch/arm/platforms/Kconfig        | 10 ++-
 xen/arch/arm/vgic-v3-its.c            |  8 +--
 xen/common/xmalloc_tlsf.c             | 18 +++++-
 xen/include/xen/xmalloc.h             |  4 ++
 7 files changed, 131 insertions(+), 21 deletions(-)

--=20
2.34.1

