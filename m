Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5F5B4A997
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 12:09:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1116136.1462545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvvHd-0001S4-If; Tue, 09 Sep 2025 10:09:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1116136.1462545; Tue, 09 Sep 2025 10:09:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvvHd-0001QO-Fe; Tue, 09 Sep 2025 10:09:05 +0000
Received: by outflank-mailman (input) for mailman id 1116136;
 Tue, 09 Sep 2025 10:09:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=noAm=3U=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uvvHb-0000yD-Mv
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 10:09:03 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0237b04d-8d65-11f0-9809-7dc792cee155;
 Tue, 09 Sep 2025 12:09:02 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by DU2PR03MB7893.eurprd03.prod.outlook.com (2603:10a6:10:2d4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 10:08:53 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 10:08:52 +0000
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
X-Inumbo-ID: 0237b04d-8d65-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=omEUrg/XbaUHKpfYoPmbGElcyFtC5vq5indSLP+Pz+LaqnEVJlxfoR2g+wdOnEGBkAJmf/9OpsobNwJWCQc4obMwgg35bUtDptm1DFAnC++2kV7thGB4/lRd/G94I6pQTQhGWcLAmIwxKhed7u/bAZARxlxZ7GL9MTTA4J6JuY5qaiATxONuKiRHdSItePGvqie/auKgbHIfC70PzrjqoQdrElswPtanC5pLGrtCfKo/2cq5pVclrmZ6ui2VhScFBez4wLZjeMVwZ9n1PlauibRZWZgvUoCwI80HqReMOAqGT993VfXRExlVfnVu2+KGi/X33kWHRnOZeuqYZjlExg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i8WGyl1yidaLg3rKtLJxyTTs4lP5VzK1RvtJpl8LAn0=;
 b=WExsGLF5mFYXqZv18r6p8ZxM/u5KgntoMSsRnhttTNDl6Ge0XDgEH8cpF13/QcOZfU+SwQNLX5twTFf62pn9Yb8Rcrm3F7jbyocVIjTc3dT/7eSuluLAPfPfN6BZWcojKAODowzXKVV9l/lkFX47QfiNj3FuO5BODEso6XZA1ZkgIDsZul1W6Y8g4qcKQvnO6aCXkug9W+nuww2NIUGCPhDsOGg/kyEaK4/5cB33FRj/Rv8wuoYJs6p/pMHs0LuSic4X06+frlU9s9R9uv2TFaJbuASkNURZAy9szJjdwh3w2eGg/im6EtY2u22huz8zHEKQbhHMOhWx4PEKlRgGTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i8WGyl1yidaLg3rKtLJxyTTs4lP5VzK1RvtJpl8LAn0=;
 b=OAnX1miPs9wp0zODsYmePCp//O9dlMSz6pUPw0NQtrtf/kswt47Wvij3uyie+6Qrk9Qm7cETP3YZn5EOYXSJbx6ey41j2YMQ7EsMc2x0qbmi6NacsMt0fmDpMSslWRKkp/j7+Un4rVlbOGWw5IGtI+5sekhxzGLPPvHl//xOBwbUv4e9GTo/jjMffGGK8PaADiy8k13Si8kKQmnR5uXzLVCHiYHFHn6dyyCgjwmyzq246r1A082JYweP97YO4HE/ByIkdyZ93CdnnHkr59GBaAwKJti060KrAF4irextFrkOrMsLugdCK4W6ZdkND92kjcka2T2XZONvt9QtgZu9cA==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>
Subject: [PATCH v8 00/12] Introduce eSPI support
Thread-Topic: [PATCH v8 00/12] Introduce eSPI support
Thread-Index: AQHcIXG+403Qxbn1OkerAmJTri8mkg==
Date: Tue, 9 Sep 2025 10:08:52 +0000
Message-ID: <cover.1757412099.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|DU2PR03MB7893:EE_
x-ms-office365-filtering-correlation-id: 19642122-27f1-442c-422a-08ddef88e100
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?kkp9X7WEhdK/eBSMEyhGnM3BIrfbCp4OxQx+4wPDelELh09q1YIWStKiTw?=
 =?iso-8859-1?Q?qvkKESYLPLNkt1kSOXkAhkPNJA2/Jribghjrt3/+1rRmQu8qcTeR2vCKOd?=
 =?iso-8859-1?Q?xglWSWAbikvCOmk9nUTSF5ferbrM+SjjMQHf7DSBjDeMvyeZR9G7ZmpE1Y?=
 =?iso-8859-1?Q?0p8xamBXi1iGhQ83FEFzo+ByE8egcx+MoUwNYYItRzbCR61y1FyX+QuuPf?=
 =?iso-8859-1?Q?hQHaCuB0MTNq9NWPuenK4ydtpBDpJ0hVkDR9v34nlRlmChUMQrIAwCEOvG?=
 =?iso-8859-1?Q?wXZ7XwlSaUh1ipHH2EXB9/Gk5TxfOChViOe35BNSPUjU0SiRhdseRnABeq?=
 =?iso-8859-1?Q?M1yrb3YnWFV5fAkxKmzaSTWBidpG3NcNY8KMfS9dkh4ViNuRIddUqMwuz8?=
 =?iso-8859-1?Q?wu2ZoTkEK5C4lJ8td8G2A9aZxxhYZtWCLJPZHprj+/3D39UkH9mAls1oB9?=
 =?iso-8859-1?Q?+V+YijlLZ+BEqgBAvEgrJJPhaD0PxndfjtDktdaH+F3fnTATKhDZVpNoqk?=
 =?iso-8859-1?Q?jXQsVivqNNlAxZYSHf9X9hXMHac6aL5diwY/7HUN4DzQGWPBA9YYtVYmDH?=
 =?iso-8859-1?Q?kQtzu0VtE0HGIDQWvVKzYt/Bz2Pl7nh26jjcX3Ncx8Cgw6X/41MHRQEhIC?=
 =?iso-8859-1?Q?dAA/tLQYcnAUikLgfO6OXWaTO9uG1jXM5XDL/KaUq6LTa2GNYtZi/iYkeZ?=
 =?iso-8859-1?Q?zlIT+4WkDab81U9I0xPp5UcI3FBG1ZZsIS2CIOXI9UelPibFysdzuBQLw4?=
 =?iso-8859-1?Q?P7brV8nHjQ7F4mA7SLPZ4k4/UpvotnxVhBRYloPNsIFX3YCfZAn0Lvcp8r?=
 =?iso-8859-1?Q?T120S501yRgep0aD773mDBaBqpd2CPJiTztagcFAFSXudA1xsVuUtfRRWD?=
 =?iso-8859-1?Q?R3CCgoutdE1p3y/T6pSTCUZU9H2WBigNDyRxziwjS6l14C0wn8XcsiSduq?=
 =?iso-8859-1?Q?wXHMv5ApQSxocRBfLuU/+gwTpWaszu/tKOndOothfeTZfL3snCwzT1+vCw?=
 =?iso-8859-1?Q?GkNp8PrrgPYSUV3VhGfo2M7u6QwDZFW+z9tw1NjFdnOS/1zi+nXCt000l4?=
 =?iso-8859-1?Q?AcJzTQWV/HOmD1oYypMO9K0Zu8Po647eSGJ27mhQe2BayBqiS/AHtVP/nF?=
 =?iso-8859-1?Q?svdA9UnfgzD8ZVTD0o14feotBp7dzwcG9uozJOBz7B7QKLERBehY1NEMeW?=
 =?iso-8859-1?Q?P6GomfWFG4Zaas2kA0L2JWypF2t0AZku1EOQtRJS8aDsaKYSvaJTVesvJa?=
 =?iso-8859-1?Q?Dfnf86NbSVB0t0Aez+w5lMg9iLKg+9F+/4curKAskGmFjJOCouSlDZqiig?=
 =?iso-8859-1?Q?F6lFNvBVa8CRo7hAWySYqy4+Ly/FdHsxwnt0hwax4MiGwmX1vJukW4OQQF?=
 =?iso-8859-1?Q?f7RGEOA0ckbT+FBV4SiJ00IWauFb1HJUBsgFfmi8j/cn7+EPBx/HDwbyDQ?=
 =?iso-8859-1?Q?5T6pwfuB2aDAG28ujFAyrSLhjH1oExljG0OIg6b7tJgq3EropSXyFa64dE?=
 =?iso-8859-1?Q?U=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?1YbYUsQpHbRugWlc8ZvSPXkm4ROJAXO5FMFhz/GH4tyMga8OSDFOCPxgZy?=
 =?iso-8859-1?Q?v5yxqAdlqyQlNNL1/8kvyRQ3SNl0soQB8+2GXt5xzCPixJ7iyjLngG5t51?=
 =?iso-8859-1?Q?TCNnxypEjB5r7gAoljsP34klUs/2idcY6vMQdMLpnAzoYcppQAd2Y3ORi+?=
 =?iso-8859-1?Q?LVgilsIw3HPTfKAqQzVWWk1Dchpx40kTNIl3Lap2AD+vulNJmtrWwcNY7z?=
 =?iso-8859-1?Q?IP69p09AvEl6Ze6CaVfIuALMvXUDJQIqZB1zlJppzHFJwV8rSgUcAxBnGQ?=
 =?iso-8859-1?Q?W2elQnQ1KEinV6N3U8XOQiUn7jj0tNao7KTTifYeJmavanz+Vj+o8QA9qt?=
 =?iso-8859-1?Q?R/a/mpHtogZI/3M49vO4uaQtY4yT289nOsBtv4aOI6om+7JauwD5ir4DIu?=
 =?iso-8859-1?Q?OSJ714LU9f3/ehd8gxG6M0FeV9VxowAYbeDhESyZ4sLloGmXyD/LIVQ80n?=
 =?iso-8859-1?Q?8SKGS6of7mag0v7QStGnvPKW8sa05PZUYXj+Co27z25q+oDYYOMx65QfMO?=
 =?iso-8859-1?Q?f+4qOYo19g5GHVBAlEeFth7WLj2qUPGf9ogz+6X/UyGGEGuwfPed4kPjIb?=
 =?iso-8859-1?Q?EN5cx9ekjHLo5SNANjREmy3tU4YCF+o6IdsbvW64GOC9gddbsoZ2IoXokc?=
 =?iso-8859-1?Q?wFiiDl/OnCxqIvcQ5wrc13JbzI6gL6bcLn9DgWkQ8lUWs7wkPKDLtvGhA2?=
 =?iso-8859-1?Q?aspWc/nMc9OA6UfxJYo3krOhlvzzEiqVX/wwDNRC1+XV0rbZSXE4N8LueV?=
 =?iso-8859-1?Q?6+SXQnaWHFifHXC67QKsHLtJdJtdXASocoPWbVOvGIF9D4N0/wZJLMHV/X?=
 =?iso-8859-1?Q?FI3sysK+uVM3p9hA30oWaBadl+4SdKfUr+S0viPEsJUObYI59YBuxgpmOd?=
 =?iso-8859-1?Q?XpbszY0ICuif889BLb9MkXBwPaDRvu67RtCld2BjkUBFLxWXQphef6xQyj?=
 =?iso-8859-1?Q?ke4+aDAJ39GtbhcsQfbQ32SbFYGcvW0iYLbfeb+KNigVi5yA/yp21XoZKY?=
 =?iso-8859-1?Q?CKR3KvcC+Sl1KmGKtyOVsySgDR0femujxsBm0B7NGZYQEl4TMUc/rsynLT?=
 =?iso-8859-1?Q?ZVcMD1LnSY0HrKPkVF7apeX+jOcMR7ayfa/qLhuptj2bVRSYeISSk+As8r?=
 =?iso-8859-1?Q?ILTvcpEDR43qAS2QDe2rn4LK2OHxQ5CYvDk+Wn8hU1XJPEUk5A/LeO2HC5?=
 =?iso-8859-1?Q?1KCiPvTbJ1UFnqLDETgTfsFLfL6gv/2KdZIo/6+nRud4ooZSS4g9j9icSx?=
 =?iso-8859-1?Q?ojVXhoJjBayy+dbHKbDACcFxXCTKwB0KUKffnku72Er3tgTsgRAwSbHU5V?=
 =?iso-8859-1?Q?kaUG3zcFU/QcH9W49wNFlOHoiFdrKraYzmk8axwOcK7thvFmO+T1d9KqGB?=
 =?iso-8859-1?Q?DvAau4Y0x66ne+wOuoVbzFqVXLEl0RgnacuzGq6sdTV3RzekFMSFcaMuGr?=
 =?iso-8859-1?Q?M3SsCFXS0F6rK4lh48G9P+lzUjFdM1QaCIcaGkm3PE8YcFtEazFDobglgx?=
 =?iso-8859-1?Q?rMfC6JT1YrEyFP5ycoscY3MLl1guCQsmRgCk4fEYJl9HHGqmqOggzbYrRY?=
 =?iso-8859-1?Q?iYcEXN74jNW50Mi1hLjG8ZijvcKnC6m1xA7KJidJ3U9qt+mKI13Jy7n/SE?=
 =?iso-8859-1?Q?qeAXRxCdXuBXyb8jF6KS3B8PlrVla/r+e415pqvm/URbiJhLALMz02CQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19642122-27f1-442c-422a-08ddef88e100
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2025 10:08:52.5420
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZxeVf+FKdxwEYP8cKNDgE/isv8+dp6i0lWUadY9kwoBH7VUaVBCrAvOGTpb9G0VqhzYvioe6MPdI7KW/06Sx9EslP84Y7dK2/+mTUQtiV40=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR03MB7893

Hello everyone!

This is V8 of the patch series that introduces eSPI (Extended SPI) support.
Compared to V7, it mainly includes fixes for MISRA rules violations and
cautions, several minor changes, and the addition of Reviewed-by/Acked-by t=
ags.

The series includes:
1) General refactoring of common IRQ operations with GIC registers to
improve code readability, simplify further maintenance and prepare the
key functions for eSPI implementation.
2) Introducing a new Kconfig option (default n) to enable or disable
eSPI support. Disabling this option prevents unnecessary resource
allocation for setups that do not require eSPIs.
3) Adding additional resources to store required information and operate
with up to 1024 interrupts from eSPI range.
4) Adjusting assertions and checks to pass verification for INTIDs in
the eSPI range.
5) Configuration of eSPI-specific registers during GIC initialization
for systems with GICv3.1+ hardware.
6) Enables eSPI MMIO emulation for vGIC, allowing guest domains to
access and operate within the eSPI's INTIDs.
7) Updating documentation and CHANGELOG to reflect the changes made for eSP=
I
support.

Also, to simplify reviewing, please find below link to unsquashed patches, =
that
are on top of every patch, that is changed in the series, compared to V7:
https://github.com/LKomaryanskiy/xen/commits/espi-support-master-upstream-v=
8-unsquashed-v2/

Github branch with patch series:
https://github.com/LKomaryanskiy/xen/commits/espi-support-master-upstream-v=
8/

Changes in V8:
- individual changes in patches

Link on V7:
- https://lists.xenproject.org/archives/html/xen-devel/2025-09/msg00405.htm=
l

Changes in V7:
- individual changes in patches

Link on V6:
- https://lists.xenproject.org/archives/html/xen-devel/2025-09/msg00296.htm=
l

Changes in V6:
- individual changes in patches

Link on V5:
- https://lists.xenproject.org/archives/html/xen-devel/2025-08/msg02086.htm=
l

Changes in V5:
- individual changes in patches

Link on V4:
- https://lists.xenproject.org/archives/html/xen-devel/2025-08/msg01767.htm=
l

Changes in V4:
- added a patch for documentation
- individual changes in patches

Link on V3:
- https://lists.xenproject.org/archives/html/xen-devel/2025-08/msg01628.htm=
l

Changes in V3:
- added a patch to update CHANGELOG.md
- individual changes in patches

Link on V2:
- https://lists.xenproject.org/archives/html/xen-devel/2025-08/msg00372.htm=
l

Changes in V2:
- added 2 more patches to implement helper
  functions for gic/vgic:
  xen/arm: gic: implement helper functions for INTID checks
  xen/arm: vgic: implement helper functions for virq checks
- removed 2 patches:
  xen/arm/irq: allow assignment/releasing of eSPI interrupts
  xen/arm: gic/irq: permit routing of eSPI interrupts to Xen and domains
  since their functionality can be moved to appropriate patches after
  introducing patches with helper functions
- individual changes in patches

Link on V1:
- https://lists.xenproject.org/archives/html/xen-devel/2025-07/msg01809.htm=
l


Leonid Komarianskyi (12):
  xen/arm: gicv3: refactor obtaining GIC addresses for common operations
  xen/arm: gic: implement helper functions for INTID checks
  xen/arm: vgic: implement helper functions for virq checks
  xen/arm/irq: add handling for IRQs in the eSPI range
  xen/arm: gicv3: implement handling of GICv3.1 eSPI
  xen/arm/irq: allow eSPI processing in the gic_interrupt function
  xen/arm: gicv3: modify ICH_LR_PHYSICAL_MASK to allow eSPI processing
  xen/arm: vgic: add resource management for extended SPIs
  xen/arm: domain_build/dom0less-build: adjust domains config to support
    eSPIs
  xen/arm: vgic-v3: add emulation of GICv3.1 eSPI registers
  doc/man: update description for nr_spis with eSPI
  CHANGELOG.md: add mention of GICv3.1 eSPI support

 CHANGELOG.md                           |   2 +
 docs/man/xl.cfg.5.pod.in               |  13 +-
 xen/arch/arm/Kconfig                   |   8 +
 xen/arch/arm/dom0less-build.c          |   2 +-
 xen/arch/arm/domain_build.c            |   2 +-
 xen/arch/arm/gic-v3.c                  | 209 +++++++++++++++++++----
 xen/arch/arm/gic.c                     |   8 +-
 xen/arch/arm/include/asm/gic.h         |  28 ++++
 xen/arch/arm/include/asm/gic_v3_defs.h |  40 ++++-
 xen/arch/arm/include/asm/irq.h         |  38 +++++
 xen/arch/arm/include/asm/vgic.h        |  56 ++++++-
 xen/arch/arm/irq.c                     |  55 +++++-
 xen/arch/arm/vgic-v3.c                 | 203 +++++++++++++++++-----
 xen/arch/arm/vgic.c                    | 222 +++++++++++++++++++++++--
 xen/arch/arm/vgic/vgic.c               |   5 +
 15 files changed, 777 insertions(+), 114 deletions(-)

--=20
2.34.1

