Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B3DA87C5B
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 11:51:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949484.1346004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4GTK-0006FJ-9d; Mon, 14 Apr 2025 09:51:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949484.1346004; Mon, 14 Apr 2025 09:51:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4GTK-0006CP-6A; Mon, 14 Apr 2025 09:51:22 +0000
Received: by outflank-mailman (input) for mailman id 949484;
 Mon, 14 Apr 2025 09:51:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qHXw=XA=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1u4GTH-0006C8-Vp
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 09:51:20 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2061a.outbound.protection.outlook.com
 [2a01:111:f403:260e::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0354b8fd-1916-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 11:51:18 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS8PR03MB6872.eurprd03.prod.outlook.com
 (2603:10a6:20b:294::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Mon, 14 Apr
 2025 09:51:15 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%4]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 09:51:15 +0000
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
X-Inumbo-ID: 0354b8fd-1916-11f0-9eae-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wNJmw+NfrC6A3ho9PEa668JlI+pKOcrImiI/GflQNGacl7PV+KjzYPj3VDkrzpR6p+O4HdlL0FbEB8y/CLz3QEZzdXx1d1DL4dZmPMVUYh1xT/IIyLVhNJd+6ieebIUeLsQXZ4A46JKGdUx6ikLmXeLJtXQsH2IBsBa44NR0Chbcs8I6/xAVOoLPaEmSOgT0+m98qvLJg9DJR1Ffgh06Bgp1RuOYZw71BQ2uCm/3RZJyIoO9j1lio3lM+/ES3KVYi/JGZvmHBPInUHM4stor3lCjCawCyQSC5qoAnmsJOkhhXHp/kGlLA9EQeT9g5pNLEeoaUwQg7x5vI4dl05YAHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fRDfnlb0oXS7KSaR6uIMes4AmHTLuKUy4A4Q7gmmSmY=;
 b=a+O+LnOis46oJ5ey05lKxti55d0j3vBzNt+mrGNp3YGSxZnUNXHMNyDhof5jTfvcbeqVrOKxXaZ9u8OpCTB21viNoQ7KAQFOS2ZEqQQ0LAPraGYJg9MP54KMm9229/mULjXS1GDNmPSMrEBXxtRpjsP36/hjJ9oki4Njcc5wBsf5IYH8iW11x4cBiGOoLsojclfNkzv6ONqmdsGAu1QU2soxGdaAkr9sdmfl0Ybifpw3cfg6Vx8PepGjxCmoyLzYpO6YoSiCF7JddtfxFUuk/a0sFq914XS5veIbmwFDt9peK3FcTK5UsI3YtabiLu8Uh/nHrrx6VwiynVyQiGRAkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fRDfnlb0oXS7KSaR6uIMes4AmHTLuKUy4A4Q7gmmSmY=;
 b=tMNaa2xB7S/VkJzyZil15OytWaI6ELmVmOnMCktmMx7xGN5qctqR3apYKUQeRGCkswcX2ICMQdrsRHJezboenxzdZTdGw4Xm35hyFRLOQBNmb3duRDPz2e1kxH4WyOxLrLGbxYr3r5WXZvpkPa80wD3sD9haF/v7loKCplidjx9iyKdgNLHPfAlsG5/S4Xg022xMgVe80v3oD8xLRN3I+OybjPImiCoPNYMYHS0A0tpb2WxReNLqsxp3eN5k73vYYFLcIWAYE9miqNdklu159bsK/ctxuHpyg8Gakkq8110wXtT8wMtDqt3dNiYkTngHC58JhlB07etFYd4PrsqD+A==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: [PATCH v2 0/2] Add support for MSI injection on Arm
Thread-Topic: [PATCH v2 0/2] Add support for MSI injection on Arm
Thread-Index: AQHbrSLDj7RBwKKgz0m9mJin+yPd5g==
Date: Mon, 14 Apr 2025 09:51:15 +0000
Message-ID: <cover.1744621166.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS8PR03MB6872:EE_
x-ms-office365-filtering-correlation-id: 4f3e75e8-afbe-48b9-6fe5-08dd7b39e5ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?MBn1cBNZB094w15uNJctEsA1OkmR2fEnGpKKnu/k8o3jzpjiSVxG28FQuX?=
 =?iso-8859-1?Q?ZEnWk6T9mhM1Pd0GI3wx8AK3oWM4gx+xeJ8aUFAwYY1jHrQ1dCSdwfqvZs?=
 =?iso-8859-1?Q?jdaOdEWPWirUzOnADaYuVS5qKMwkUWFBGVuUR37vPu/8tBpwaUAIsOn9eX?=
 =?iso-8859-1?Q?/6OjflxEuzCaoJ1ljPP93y2CFjm2htONaXnK6W6PGdaGYvFFg6qPUJSXil?=
 =?iso-8859-1?Q?5uUgDsMlv+p2nVSQB8EBqHOa+RvTAMlXT4Wlwl7qz9iY/1q3y49HKI6cq3?=
 =?iso-8859-1?Q?hZ37WR+OMqs2Pqew8LW0x4XID0VUm14n2fYY4c2YahFjzM6+JRC+qAGs91?=
 =?iso-8859-1?Q?u4jAzsflP3GNaaV4VP3d3bC1x3+ldmBFeMTP/Nx0siliRjioLTxwTAKwXu?=
 =?iso-8859-1?Q?5KA9Fd74OwKvXMeZNUHJUi8x2UXjq29shM05O8JjpsGNINfXhNUuP/PgkX?=
 =?iso-8859-1?Q?i+ZIyAPj9DvG9Zu34MauAdPiXVg27O+H7JLIPxnxZK2BV20ucLVjemv/vx?=
 =?iso-8859-1?Q?Ddm2bI5E5y0v/t7F1NtOQeOvhm/jCUBEftAt2r5aKH2Oba5gX8YXmmDyIf?=
 =?iso-8859-1?Q?iOvLi7u4Qhot6ZxlU7Kv6SqBDAyS7SaMmG4aPxe8b55X/6feges775IDyt?=
 =?iso-8859-1?Q?GJ2CeRXmmEA7A01QD5T1OPb2y3cjhzNL1GKigqwHqZs2kQpb5pMFgs5sFG?=
 =?iso-8859-1?Q?SszIrk6teSANCrKgLocaETXBlEzEq943StH8LINct08QsMlCeyv7c1bY13?=
 =?iso-8859-1?Q?iX4VJLWz810Z5BEtlI4O21S2lMJep5303h7g7VTHhbKm6OhttB3F0X5q6G?=
 =?iso-8859-1?Q?psJOLZCfdBBolosPhW78DpNOMeguQwVbDzAXGcKEBW06DB3qOkMX9VMyrt?=
 =?iso-8859-1?Q?3PJfp0xrAi/9eKyAZgNxq8B7xmUIHQhlL7VP5O4tDLR2G3xpNnRZx0gib8?=
 =?iso-8859-1?Q?S5zrbHDklPUEduxt5MQdp53DBuYHQWVuql+50of8TFSpulxexejfiwu7P6?=
 =?iso-8859-1?Q?NOOQ3n1G6lXV55MxlOXYo9/fuY035z048JFO/PIs7Y2Lgdupc1Zm4oR3jM?=
 =?iso-8859-1?Q?s09zoxtx/+He5DxZhHe3JvJreoe7CzuDltq8LFb+biI5rC6LeMdkfcO0Bs?=
 =?iso-8859-1?Q?fH37nOQsmrbzJpFLs22wq+N9qw4IEwaaUBiE5rMkYBs5TK/h/ewSJXVDZR?=
 =?iso-8859-1?Q?8o6fu1nYDTy9Z5yDAbF151DON9gqex636DH8BIrfOHZSP2cM5PYeqPhRid?=
 =?iso-8859-1?Q?QQ6+K04Sjv0F2rJcezmsxssZ0tzCGn8Rpmu3xtC28aYU1F8rJgIrWCvOjJ?=
 =?iso-8859-1?Q?ilIJXidgqvPQ9QlV7J4ol5UJR0LumNx+yC3nDQAwHcS56hExFSmu2ZGgvz?=
 =?iso-8859-1?Q?mNzLNZhIZyVWL4KmnT8+XFQx0w+obAuEEN7nT60UZu+aUtigHPFlS9lIzf?=
 =?iso-8859-1?Q?IrHcpm4r0dGk9HK1FckXTIGfs06hnIdwD3OiBWJVf589wxPAGXNeugsTjG?=
 =?iso-8859-1?Q?cKs8jye0MYeCydqdwCCVTeu6oVXPcnnSOII4IKFSszDA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?jJDr/hS4GCqp5NsWd/oWS8qdvzlOaEy65SzZRS9pVVG+swwJc2XCmv2H4M?=
 =?iso-8859-1?Q?8uPet76HVjLI23FyHLJJxB6ki2JU47A73g2vwv0cM3cW6JLU6JywNfLLP0?=
 =?iso-8859-1?Q?HRHabJNO9SsysZHPm+bwdoAaLwuI56uRDU48DAEcNHLm2Z7WeR5nDhLblD?=
 =?iso-8859-1?Q?3GtrbiFCj8tpwvb2mB8Lj5+eajExgMGPgGYk5m5Az8gSuBSPicnezduu+3?=
 =?iso-8859-1?Q?3z6Ul8GLhD+77BcEUh9tFEyNRiFflYTaWlTHbuJsPTzAfQbiHtS059lkUK?=
 =?iso-8859-1?Q?AsfIwG05rJIG+9HZDncBHo3txOnX1rcjWTKt/8O9GX5czw+9VN650UxIja?=
 =?iso-8859-1?Q?Tatxr6Xhc+HKOl2b99KQcEZLxiFuaSFsS0ewdwwQ+TqLj/vdWhMMB4U3wh?=
 =?iso-8859-1?Q?fubN0BNN26qtNu1PbdTP/FUJTsooErHe09fMCec+G0SuT0XCpaLNi2ouLw?=
 =?iso-8859-1?Q?JVeNGwbkXGcgRr9Z4wuhbNuD5DUI8wIEDQL8r47QenjhsP+4nRwO3ba2re?=
 =?iso-8859-1?Q?aY6aMfE6HjHAJDRJceeqmfBLu2yhKHWVOv+vxugk0Wp2p0DCTWrO6DYCpU?=
 =?iso-8859-1?Q?42E4gTKbE8mM5E1ltNXWP1bJ+fpbu6NKQpxYZjwvJ0/JILQdmlHboDnvC1?=
 =?iso-8859-1?Q?PcgIIww9hqE8HXDHqbFlZeB+IvDid+mIDfPLsxZ4m5pH0XDxxIfyfczxLM?=
 =?iso-8859-1?Q?ptcgH9eBVlTYfsemXD9Rjw8NXKuFXNrkX0C8SKdlVB4a2DQuoR03TEA0LH?=
 =?iso-8859-1?Q?ajtYMBE8Kktho13ZfWLhJPtVlQBuJBZQhGwOJP0Y81fWgpG2FFv3+gB5WH?=
 =?iso-8859-1?Q?2kw9Yb1ZcXT+pT4QNtcTGIM18r5qCHT4F+YEiDSM43pJRyZXmsdPrtPElb?=
 =?iso-8859-1?Q?VOuOUDoCEmFIMQ4YVtZNIEZdQx35ahPXztnjKyG6IuSUCTH3AOepEqzPUe?=
 =?iso-8859-1?Q?MNamzO640ASx4GDegHo0J4CCPdz51/t3G839KkdwG/dv6BiC02A5fmRel5?=
 =?iso-8859-1?Q?QCLhjwU7xTqwo/Ze+PkHle82Mq0Yu4tLcS9NzlPIQqF7r+BLKtaZvJ1CFw?=
 =?iso-8859-1?Q?LsW4jvT8VaqpZ4ogxkzwY6+fWVDINvFweikqkm4YmLMtZIHAFOkmvFyvwC?=
 =?iso-8859-1?Q?JdeAEpuLtlsnRPDy9Pv+qC4PklkgxabqO4opAN3FmdLNctA/lJ/nenCV8Q?=
 =?iso-8859-1?Q?EpYk35Fbc4WtxCEwwNRQ7xdVUnn5pKIlGtGGV+5qBY9aXifuAgqpLr/6mf?=
 =?iso-8859-1?Q?AxzhZffn1j0hcpJM2PEDxdknSRTgO4TNZrISAbaq0AItr0J6O2JUt1CSTt?=
 =?iso-8859-1?Q?L2PaPEdsfukMXZruW8XA8wlmdlsLGC0Y9vjaJI4QJohssNqB8EiDy7rjKg?=
 =?iso-8859-1?Q?ASaJRqGlipj4sPFpIIp1wb11kMp2vfZNrkZWzovHmCoba6XKYpQcEhB0ie?=
 =?iso-8859-1?Q?YaXuEoxR0buHH3G8NBGBjQaMbBuwiGeaDGCEm1dNLoZxAJ5rhaKsxd2yaI?=
 =?iso-8859-1?Q?FXSx/daUoo3+LA0nD7F9sv/xl9L8dOF/ZUNC9NlT14LqDUDGD3JE1ZpD/1?=
 =?iso-8859-1?Q?kXyJoeeLvyFh22P/xXM0K2p83n+qwJOT8V9oit7kWoBvj3psvexFUJdsqi?=
 =?iso-8859-1?Q?tJjp71pLjDgnhUfDJq+Rg+9stqMeOn7E4BVZLdnY9uNkPk7Z/jsgDMoQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f3e75e8-afbe-48b9-6fe5-08dd7b39e5ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2025 09:51:15.3898
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f2EjO4JYh/92r3t9DGeXNV9nexpVBeuoMgoJ/+9DKIXwxPNfEbcjKcyWUAQJFpGyTojhhvGYsE6iM3rxSpMkdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6872

This series adds the base support for MSI injection on Arm. This is
needed to streamline virtio-pci interrupt triggering.

With this patches, MSIs can be triggered in guests by issuing the new
DM op, inject_msi2. This op is similar to inject_msi, but it allows
to specify the source id of the MSI.

We chose the approach of adding a new DM op instead of using the pad
field of inject_msi because we have no clear way of distinguishing
between set and unset pad fields. New implementations also adds flags
field to clearly specify if the SBDF is set.

Patches were tested on QEMU with QEMU virtio-pci backends, with=20
virtio-pci patches and patches for ITS support for DomUs applied.

Branch with all relevant Xen patches:
https://github.com/Deedone/xen/tree/4.20-dev%2Bvirtio

Branch with all relevant QEMU patches:
https://github.com/Deedone/qemu/tree/virtio-msi2

Mykyta Poturai (2):
  arm: vgic: Add the ability to trigger MSIs from the Hypervisor
  xen/dm: arm: Introduce inject_msi2 DM op

 tools/include/xendevicemodel.h               | 14 ++++++++++++++
 tools/libs/devicemodel/core.c                | 20 ++++++++++++++++++++
 tools/libs/devicemodel/libxendevicemodel.map |  5 +++++
 xen/arch/arm/dm.c                            | 17 +++++++++++++++++
 xen/arch/arm/include/asm/vgic.h              | 11 +++++++++++
 xen/arch/arm/vgic-v3-its.c                   | 19 +++++++++++++++++++
 xen/arch/x86/hvm/dm.c                        | 18 ++++++++++++++++++
 xen/include/public/hvm/dm_op.h               | 18 ++++++++++++++++++
 8 files changed, 122 insertions(+)

--=20
2.34.1

