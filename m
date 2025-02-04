Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFBCA27371
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 14:55:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881485.1291682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfJNW-0000Zq-6e; Tue, 04 Feb 2025 13:54:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881485.1291682; Tue, 04 Feb 2025 13:54:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfJNW-0000X0-2K; Tue, 04 Feb 2025 13:54:14 +0000
Received: by outflank-mailman (input) for mailman id 881485;
 Tue, 04 Feb 2025 13:54:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jloo=U3=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1tfJNU-0007bp-A8
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 13:54:12 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20630.outbound.protection.outlook.com
 [2a01:111:f403:260d::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82aa8e38-e2ff-11ef-99a4-01e77a169b0f;
 Tue, 04 Feb 2025 14:54:10 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS8PR03MB10120.eurprd03.prod.outlook.com
 (2603:10a6:20b:57f::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 13:54:04 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%7]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 13:54:04 +0000
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
X-Inumbo-ID: 82aa8e38-e2ff-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SeH37IhJ8T2feiYadEw4MB0JRWwzu9PQvyBL5N5sV6z+xR7YV9laMUhpxzRsRI+WoysSrpYAJvRofd3/mBJxSIWPFc9IjsXqZFy1TWKaPAUktdBJfdpCWPvlQodHrnGH6IYUKZ8PC/mV2maqtvcT6q98n4jy/O1Mi4bWs2efreeLWhaWeX20be/5rnvD5KkI0xgQWuj2kcySU72Tx3hkFqHU7bHljLDpXmSCaGC5dKkkRW9Oz9bNbSL5+xnO4RjiFnf8KI9e9r6f023irnGsd6GwvHLnuMG0hnzfPEUGpvOAcaiRbl+h++Ur47EwqXoBuSbhdjMqRkB+7ZKvphRKfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IBmImMY45au6S/wSkAfDzPVwqKMv01abSxNI/zj+jYE=;
 b=KynIldwIVOc+u5R27l40IeHC4Sg049Mxh96fyOT6DaGUTym1CjuPUlj0+3OsIMIHaXSpEoZPA/iwn98C66FaP7PjobGLwwAktuISWbX5wfQpJMCxF6XlutBZCKPv3zWFjfXLhmP+9Jog9a3okPihSn0fwE4m6pahttVIZiJT8nFmx+KrioDcMgVpqTh4vONd3vijZiJ5iAFhSlV7pbaQ8KeTZo6plGVJBDEnrUf68YtWkVDW95MXiMzpZUqZpqpzItKwzevc9V9INdFDAnzjD5zdq06aeFqhJdGdECm/lx9sQx+W4KCROmJGWD6ffc/IcPzO0b7NlPNLLpxjVRysOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IBmImMY45au6S/wSkAfDzPVwqKMv01abSxNI/zj+jYE=;
 b=jN3kkmQdhtoETPZQPalrcrpYPD4KLIqnD1we2gTrVR2OX1h/TY66svF9ltO7s4bi8f2jp3SsXuMO6Mj6nf6JEenTYBxrJaI5MdFVAaLXcBFDeM8wLe0LkTXGJ1seifTw3QLanLHZtP1Ll464i/NiQNFBVQlaYfokwLfWxrHD1PNddVYwFJcYU/OtQYGzOIU8RQ2D3m25TVfZGxz7QTYVtpK89JqoBtmxN+ofmWE4+vX7txPEHZMwu5dvi8WyQLFnlNGr5Hvn+m+EvevEUSdxlOMPzIWyPS2nZmI2vwCi8MoSyqMTtI8Ujp2xKr9paRLih6ZhhFWxH+1FykAgtlLPhg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Rahul Singh
	<rahul.singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v7 6/8] xen/arm: Fix mapping for PCI bridge mmio region
Thread-Topic: [PATCH v7 6/8] xen/arm: Fix mapping for PCI bridge mmio region
Thread-Index: AQHbdwxAffL4CCc3KUGafSgxW+bavw==
Date: Tue, 4 Feb 2025 13:54:04 +0000
Message-ID:
 <3766f6a15a2ffb24a51e5caa2eb6d8b44cada57a.1738665272.git.mykyta_poturai@epam.com>
References: <cover.1738665272.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1738665272.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS8PR03MB10120:EE_
x-ms-office365-filtering-correlation-id: e6805e59-5597-4e9b-11c3-08dd4523634c
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?iaSovlQ1WivSLzwz+KwZ1Ok7tF/N81WC32fGp87l2vX5wwSBhINlwo4wMa?=
 =?iso-8859-1?Q?8eIm3I1Ht/pOMfA3RCSOVZMIVX4ZlYUODVIBdqsVO0mUifJH0+w7l5ieZT?=
 =?iso-8859-1?Q?+iUepUp/GMhQOTJuRSW89VKO/zsSeMgPDwVb/vqFmi4TFX9lhVoNRx/tg/?=
 =?iso-8859-1?Q?kH7V1Zu8ocNLRjea8qG/V/fXTqYqft/SiWzKsLuFB11tKWjBA2107aN9iC?=
 =?iso-8859-1?Q?79uqa0H1Qvz8PzQfaJuQeV2NlbsMXchQPZ6VpuTJUzm375YhHaskB//wMx?=
 =?iso-8859-1?Q?qT3SKKtFkVsIjNg+vLa9ovwR51i3+lWX0TRBIFWIcA12WChhqmCrwrEXTp?=
 =?iso-8859-1?Q?S00eDxzlJPmVydeE+UXJESWYtrw2KYFiNPaLOUml0zZMFApeu1NkjgbhFK?=
 =?iso-8859-1?Q?80wDzrLjHemujoK0FG53jMV7wEbpMtDBwG5N7PXlzIjCvVBU5hGpEwT30E?=
 =?iso-8859-1?Q?LPLAD673rFZuYRv9RKaJODVbodcNUnrDL6sWkaWtIkRayYAEfs4ZDd7wdj?=
 =?iso-8859-1?Q?fpDiwADLi+mtC3TByHrP+tDsJ2rkenyy8hXPHEahw6qDODuZxCWjvFjdeS?=
 =?iso-8859-1?Q?9Ce0Fw2h4VtEpngZHllhLDvqZFg7JCBdgPcjwjlNiTN1tUw4Nn+d3rS6CZ?=
 =?iso-8859-1?Q?Md9VLiPELj29sx8hQFIug6jrgNxk2rh9uAUlGAeGOOcVjRfNRt5XeBkjTr?=
 =?iso-8859-1?Q?cbQ+aUHx5tDDuC8pMY2qOGtcnljddahmhIaPOqgGdD3HE7BMhSg4w2XXzC?=
 =?iso-8859-1?Q?qWgqLmNUah83yuszby+OXpyeuAO5uYfnFAtBgA9iCJfuYasbsWnlRt4Y1r?=
 =?iso-8859-1?Q?aoLdHtS1DwlB1dTvsB7t3egBmceboqn6x7o5Vpt0Mid0fUPm6+U1VKibte?=
 =?iso-8859-1?Q?/8+GKL05+4R6FsKCwNeaFu9n/d5onNPxL62+2n9jkUUvei6rgqlblh2hMk?=
 =?iso-8859-1?Q?RyYlNSGfUgSjl4JX82WvdY1iYFMqpcPUHnv0EnGxUVL4mXBs+2hXp4wtTT?=
 =?iso-8859-1?Q?li8AjMtX7USRhr8dHwVsISazxozd3PsivREPv3gc2ud2eQEEzfgpiqAiOt?=
 =?iso-8859-1?Q?BA7A5zzSKsAph4omzhW4FvjNlGdd26FqFfYpMAD0IeFvxAJDkbag4FwGlW?=
 =?iso-8859-1?Q?k3lrg/0pViTkZGVLxsE4wNloPO4j8ZIkYAemq3618DPUsTPz2c52xlZJDs?=
 =?iso-8859-1?Q?L53fXIOa8V/iHEUxvYhQ0z6eRFEJsKgmVclc5z5JgTUp9jHG7YwegRk6u9?=
 =?iso-8859-1?Q?E5OUsMxzOhV9zZX2JXI6B4CMk/aKGF3pTeYlOTK/tCRtTxbH5gn4qvyDUO?=
 =?iso-8859-1?Q?qiYEbE/imXZ00pMfH5rBzPZwqAzDPPhBnuIzlaYKFF2ZK8euZFy79BoDRL?=
 =?iso-8859-1?Q?ps8h8hGBhOH7BxMDyPrbnu3ea2ZC0jX82HrcdjTHFBtcPLKA50yKM1wMF6?=
 =?iso-8859-1?Q?PrBwRM5lVIiOJbscLeyYn48sMeqJJlF222oReg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?/n4oTvG0Dgd6TQcoJb4/IjV1KaILzh2PBzRSOpCyzJz2F4k6eELUqersVc?=
 =?iso-8859-1?Q?LH8OxtuIqBfRlVZyjROx2Fr0IExD82E6gJi2iiUtTqlG5jcXUyG8MW37H3?=
 =?iso-8859-1?Q?hix134v0pO8t4nf2rw8gTAvTJ8n+MB6adocqvGrzkh+ogkPn7aRvpV3BIe?=
 =?iso-8859-1?Q?5yyZiHBroNkgwVX0+vN1poVFFyd345LlpVYZpf+spxchCBk7XUSI0+tl0Z?=
 =?iso-8859-1?Q?ZU7B2xIXDNlnFyvMua07J6R5dY91MIsx7XRIGSQgbtW6yj0vNNjM/oKqk9?=
 =?iso-8859-1?Q?GzKwLpV4GYJHsIGxs601AWOE/654nAyOJRn8L4832e9AL+bC04d15YLBxG?=
 =?iso-8859-1?Q?JGTgI1n2NSPObhCXH2r3jNLodSBPKp9XM8Ek23IKL7ar9TaFHjKV6SKcGQ?=
 =?iso-8859-1?Q?92wQjn8x2ALIyFhzaq1F7KM+QQdHEK3SHznsoBabN72MaXlXE7Sx5QWtNk?=
 =?iso-8859-1?Q?7kp/wqpxBB8GNpSKLmUZLiapOu9XDdDrIHs06lJAPpWHt2+D00SBGfs1Kg?=
 =?iso-8859-1?Q?7WXzuTjCoBJOdVQn2c102Wv/j/rtcWA5UOfFoRhNxEYzWEBZXk+mEk8ho5?=
 =?iso-8859-1?Q?k5DIgQZ72rebH2RCmHO8V4weZA9G2jRzwAn1EOKr8PUysDzV147VAr3xcO?=
 =?iso-8859-1?Q?9l0NLZhf6LwyNp5G8GHfsEtR3Rk10Q4lc/0YT4zD5xsb8g0PzHDpSFv9eu?=
 =?iso-8859-1?Q?M2+N4YuaR6ab9B/D0oFZjvmwYPh8M27puVSmH8aKdGvdWZhWjD7K+u+Wv+?=
 =?iso-8859-1?Q?G2EdnS1mHmnqe7cwi+pv4Yk2t4A9oWWEApAIIUwDBemnVCltH8UFIkl304?=
 =?iso-8859-1?Q?ghWLWxQNwObIyweM29WTV6HlQHHBpxTHUqoSya6A3Gb7MZ+1zCCCCvahaK?=
 =?iso-8859-1?Q?VIYqouEIEvm+CI84txNl1b3aGnJtuuOBlO69XCmrS9uqHCuU16s4MaQeJy?=
 =?iso-8859-1?Q?6GN/r7WQBikZbY8P1dvW55xyte7grTfKS3L48ExvTUgV6zqmwhZkSB7vHN?=
 =?iso-8859-1?Q?raV+UQq8Nfn0Vv0J+5CimlfczvCjT7W/I47y2uUcRLXFh+nvBnRQdgMyix?=
 =?iso-8859-1?Q?RH0KClpR5/69TSKwl94ug4lz/NL0QX9bVfNmboNVhgwCxji4s4qRLpVXKR?=
 =?iso-8859-1?Q?n6kSK/CiZllpDa1P/KZQpY83TdobcOSzJ6XdJ3YuLAjLJQ4FYEdtJiET/9?=
 =?iso-8859-1?Q?15ilLsbFkcJxj570083Ag+O3C7yeHEEadNXgczA/8RDBDexw8T0OiL0CZD?=
 =?iso-8859-1?Q?xM+CTZFuAEt66YeIqvvsLbByL54tPs8rOyfwK9Ulh48+++XeKeK/W+SksO?=
 =?iso-8859-1?Q?hORfZOU5HjNhkCk4NHhNU8OjznRJrKbJC2sHxpe+u2ONseddUrapPR0M6I?=
 =?iso-8859-1?Q?TleEodH5r+acpmMoUeJVLrAPCV8Gn9w7FAOeWjnLfg03HPJubUy6/ZzmRR?=
 =?iso-8859-1?Q?YtQqQADU0Q4YxrrI3t3NRc1MXrRkbQy8Ou0efRJMbE566+2YidaWNnk3nC?=
 =?iso-8859-1?Q?xmYoBZVqjFV0PobNS5d+tFQNdO3gun9fgzb8Odo0RbHRsa0osFebc93OwZ?=
 =?iso-8859-1?Q?08vPPmpRZN9CoKYNErAN0XSHCnKiP1QT2/XgutS77BgoJwBQwbtNKeK1TH?=
 =?iso-8859-1?Q?KAw/CsGv7UvrmBnTNISWpGRZd5k6VHGtK+bd84Ufw+OSF/a1JWTEdZ+w?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6805e59-5597-4e9b-11c3-08dd4523634c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2025 13:54:04.4402
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kKiFL/i/eohweXueptx50WcN9IS6titZIMldOKX3JZrCTnDnAXPnreDd6rf4JcWbGrA9l+wYTyoyEDNiv3DDPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB10120

From: Rahul Singh <rahul.singh@arm.com>

Current code skip the mapping for PCI bridge MMIO region to dom0 when
pci_passthrough_enabled flag is set. Mapping should be skip when
has_vpci(d) is enabled for the domain, as we need to skip the mapping
only when VPCI handler are registered for ECAM.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
This patch was originally picked up from [1]
v6->v7:
* add Julien's A-b

v5->v6:
* drop unrelated change in xen/arch/arm/domain_build.c:handle_linux_pci_dom=
ain()

v4->v5:
* new patch

changes since picking up from [1]:
* rebase on top of "dynamic node programming using overlay dtbo" series
* replace !is_pci_passthrough_enabled() check with !IS_ENABLED(CONFIG_HAS_P=
CI)
  instead of removing

[1] https://lists.xenproject.org/archives/html/xen-devel/2023-07/msg00483.h=
tml
---
 xen/arch/arm/device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
index 5610cddcba..25847d60ee 100644
--- a/xen/arch/arm/device.c
+++ b/xen/arch/arm/device.c
@@ -268,7 +268,7 @@ int handle_device(struct domain *d, struct dt_device_no=
de *dev, p2m_type_t p2mt,
         .d =3D d,
         .p2mt =3D p2mt,
         .skip_mapping =3D !own_device ||
-                        (is_pci_passthrough_enabled() &&
+                        (has_vpci(d) &&
                         (device_get_class(dev) =3D=3D DEVICE_PCI_HOSTBRIDG=
E)),
         .iomem_ranges =3D iomem_ranges,
         .irq_ranges =3D irq_ranges
--=20
2.34.1

