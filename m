Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5031BB423C1
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 16:31:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1108455.1458604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utoVf-0002Rf-Ej; Wed, 03 Sep 2025 14:30:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1108455.1458604; Wed, 03 Sep 2025 14:30:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utoVf-0002OB-AF; Wed, 03 Sep 2025 14:30:51 +0000
Received: by outflank-mailman (input) for mailman id 1108455;
 Wed, 03 Sep 2025 14:30:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rd+t=3O=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1utoVF-0006B7-JW
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 14:30:25 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86f99437-88d2-11f0-9809-7dc792cee155;
 Wed, 03 Sep 2025 16:30:24 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by AS8PR03MB7844.eurprd03.prod.outlook.com (2603:10a6:20b:343::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 14:30:22 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 14:30:22 +0000
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
X-Inumbo-ID: 86f99437-88d2-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EDApSG4SU7AcrJzS0jjZc4COVOUrs82CAJvL3o6Jkor+n9EEr+KOOtqdfnVipkaAIntDkA15SJeileGvmpzBA/xtvbra3fFovJgWMeC3sZdpykpOTcPvNMnwHJR9LdS2UTQR0Fmbj0efUvnoHDddszjOvNwGyxNGl8t8SOO3hEFljqDC53pbBc5hUgqmwOZAYYqCkSSt8Owolhmn+x5LLQIIGj65KHaQ9Q9VVZqFdUw0AkBXwqDa2W9fTOyw4vSvAYuPN5kzkD2O9yPwSfY3it9rG460ej56dDwf4mC1N77R2ssmLU1BA1gT15jNb4U0D7b9AqFt7ct+X+t/9RkoSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XyahV/BpOkGFxSqvav5Se24ucuKX8ic+JBea+qL3ihg=;
 b=kOmfXA347k4Hj1L/L1BrRxRnMd17+pRV3ofEBSVaoCh39HbtdBZfYQnFvbOlMbPZ5G+ORs3t6T6OGX0en7yD2fpgaRkjof1uTWBE11WmENjAX4cwl9GcTdW8dp8rbxZJxzvz7kpMklECrwD+7sWh+BTe2KoACnuySm9D0XvZ8OnW8evOcV4IHZP8JJP1E3w1TH0baUPN/MgyezGLBlQeWJHvLtUoXlBkwkowcOsKAOInj+2pqObIQYObp2n+fwm/AiY8g2WpDwvbIx8tF5K1NnH0XBQVXvHBSvhcP3xGACWNv92LTh+gq9V+Bcy0pOrifks38t6/sn0CgBc5l2Qw3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XyahV/BpOkGFxSqvav5Se24ucuKX8ic+JBea+qL3ihg=;
 b=Pi9iZ1wxsPAoJvpD7dMSzCz7YetvMqdzhxV+pI0dk+XPVZdxmb7wrmvrnaqcOzf643Hf4aGXLF5J3TCuHhb+qKLi5UmNjQU519TwZQ+2Al5SgKD9QG0PEN1Lv9t9Cg7WLbDeHXeeHEVobfKDhTTZrwJ7UjyLVXUq35WHiJjc1IDNmgxus6QC7oNdMNAkeNMRPYSjaFfccGvDYfm84GZtjshOHetXoG7Q7InAnZomsZ6/UoeZBZX9JrA8+hhjs7FCE3v263jx1dTmXi9FZ7xFL9GgkvnMoOrqXq+VAagFZlRuG8IFdmXPwMgYNNwjAdj1CRWlwjS9tJJDOiMZg0C4Tw==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v6 11/12] doc/man: update description for nr_spis with eSPI
Thread-Topic: [PATCH v6 11/12] doc/man: update description for nr_spis with
 eSPI
Thread-Index: AQHcHN9HOJL8STXwX0GL+HONwVVLYw==
Date: Wed, 3 Sep 2025 14:30:22 +0000
Message-ID:
 <3b452ade4d7d2fdbdf159e8ff67ec49724ff4d38.1756908472.git.leonid_komarianskyi@epam.com>
References: <cover.1756908472.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1756908472.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|AS8PR03MB7844:EE_
x-ms-office365-filtering-correlation-id: f75164df-1c39-4b70-f501-08ddeaf66a71
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?fFmRwlUM/vxLeLcwsL6hf8WmHskZDZfEJJnOAMMJ14cAPXgNYX4kXgfcbO?=
 =?iso-8859-1?Q?2AnCAN47rOJ/iwJjBGuPX2s0ZckMXjIjCSuwgQZf6zDzTrrrrp969q+Qq1?=
 =?iso-8859-1?Q?RsEMz0J0JXPF0Ic0EYhyRXCTaPExaypFsu5FGfBM7UVAmLJ7ogOLVQyPhL?=
 =?iso-8859-1?Q?tYqqXzIkhWIPl6d7JGv+4hT7TU/tBfmuZetYZUSQ57ekWg/pnsK4aopg7F?=
 =?iso-8859-1?Q?EM7qIAH3dx5ZP0EHEK75w59lWojtqghjiIXXhfB5izqHPBObdFBfr5HnLr?=
 =?iso-8859-1?Q?LFL5hVZ/C9UguiN2QasDnO5UsMVKt7+bvLZQwHeSe9Rf8daIS6zzoESEl/?=
 =?iso-8859-1?Q?8eeX/jVDI700M84GaJwRT4F2YoxpW9aOE+ln039mbtX81e5tAXY0s0B8DK?=
 =?iso-8859-1?Q?mdDkvSd5NPqPrxxnf4bJQ6fIsQkTniPa12bqGanbH0oykvQdj+ayROw0pd?=
 =?iso-8859-1?Q?I9k5bQm22kY7TMW04u6wo2B6ofiFtbFqNdeDwj5fwrtNPIEmia7TZYXkGw?=
 =?iso-8859-1?Q?e+64kI57WSR632v0/D6cHzCNiWKhchyNPCsp4Ryvi2++ySQWbtqW4H+my4?=
 =?iso-8859-1?Q?d1RuOLXWQ4g7169xP+MypcUpS497EOI2UvlhkYRwh8c5CKSm8ixqzVe68s?=
 =?iso-8859-1?Q?jUvghP+8UxwqcPpVW02kwu8t/lUNwhUvzIxPIzs6FGe4sPFBWqWFcDnY+x?=
 =?iso-8859-1?Q?ikPL76UtJDb80Ol6W5Pr7JnZwATU/Sbqny/lNl7Q51nzdPpMLTbeXXo119?=
 =?iso-8859-1?Q?k1tAdEgxEtoG2pcUVW697Q8SVIiYHkxVeCvYsGrYT5WlHeRbnDesc0F+9N?=
 =?iso-8859-1?Q?kjGfxcqko1VQpHgcR9zlHDyE8OlC88N8Dy7NIhvEznfpX1j5/fxbmXaC/W?=
 =?iso-8859-1?Q?YeFpn9xQnbygOk7vRXIONWfJspuBXS7mjUm+ijErmHJ/BK650EegXAdjQt?=
 =?iso-8859-1?Q?2BuOoigg9yOldRTIkIG0lWnQheeWowycvjTZ1LS7L4NZF9aFqULpfVG6n3?=
 =?iso-8859-1?Q?4cI7Hhl8udn0kAsBziLPL7ujHsO8cH4XKCAPuje1onDhp3k0MyiyIk5PNT?=
 =?iso-8859-1?Q?akrBqBmE1Qyya0Os98+bvvkJV7YrtXnswUXe41XByhpUheRzPsYz7WlkVO?=
 =?iso-8859-1?Q?yrW4Glre9jUa4Vf72jG/qdmlSvK3a+dblo2GHKQL78knTn1xM0xlbgANmL?=
 =?iso-8859-1?Q?Z/45BTF61zdMjHodII1ubxZvGXXGXHHdoQzfvGBXqb/6Zt7pjn2DI++x83?=
 =?iso-8859-1?Q?u/GpcAHVPu3JJDEsxNTTdQIs01OKgLeSELpiJIdB7aFo5XNhEwltB1p3pi?=
 =?iso-8859-1?Q?BCAsZX2XgtxQO+8R07SemlHXf287OTtoKVR3QJEnrqzVg+rIWK8nPKYmr2?=
 =?iso-8859-1?Q?oipYONbXC1QQaKtOrmdyZWFdmltFYhDOrOYceI9yECuc+Wkg7+aFSVxJsc?=
 =?iso-8859-1?Q?d+aQAkzuBpdZB/8ObZ8VArrJPelEkcG4qtUEfJpUT1oYXxKpVmbrRplima?=
 =?iso-8859-1?Q?n9XAFW3LmJCuJQpa2N6ccA14AJrReaMzHlqJCriYjSnZsazOLfK0lTnquZ?=
 =?iso-8859-1?Q?0zeu4xA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Chhi/m0LWWsyUAY8Ldd6pjDJ8em0ii/mNzEgb934aJEQYPHEZPrJ2Xz+dv?=
 =?iso-8859-1?Q?RfzsMjXsVoJf1LExcMXhiTl3AC7sHiUUIQcMJbRBV1axwQHn4RG4zEN+Gs?=
 =?iso-8859-1?Q?bRKjoubs2AvhOAjCJjV1XfJzoqz8cJ7WsF9if6e7+OGpWtgtJ7It4aKfOf?=
 =?iso-8859-1?Q?rIDd6VIZuVCKnHdvZu+H1sJKqJQBlSgFHLIfWgTM7FAhbo8hbCKKuqwcgl?=
 =?iso-8859-1?Q?w3Si3bQsiPsFqwRDQ13zNKjlLQEv394p6WZOG6EFbua0MVO2iLIqNugLzR?=
 =?iso-8859-1?Q?JZ3x3xWmu1eSzhU2o3kKYXtzJAmtjVoSiBQi1gSdCbuUptK5sq4lmlOx42?=
 =?iso-8859-1?Q?wp8CNZfYZlGifuJtZ4N0Camy17ACpeGKGT7ODgNAqm36EVIsxumrNcxWK4?=
 =?iso-8859-1?Q?mZddurOm303+OZZAdFhYOvzZ2XD/kP3JF4LATMJgvZTPqWCoNwVEFU9BYZ?=
 =?iso-8859-1?Q?32yml2awoKiDQ28zCwHeCo60IDHJgIYFaKw70ttbmwRGMxapsW0ARn6lyB?=
 =?iso-8859-1?Q?pu/chy3AyqpQsnBbcE0UUWoDeSx7az0nlFBzNwwhRySbOVizI12cEcSTYp?=
 =?iso-8859-1?Q?DXc8koHxXD466zsb2+IJFXgEsvConKBkgggeErXQm04nbo7mti9F6wf211?=
 =?iso-8859-1?Q?XYgLCgY8bIb61QQSQisi0jY2Wx8KleB6fmT0wHYBFak2M76S3gFIlNTDPh?=
 =?iso-8859-1?Q?8f/nIlk5Jn5eaTpLEAfoE56cvtId/nnYsNFGjeISuGVIy5rUxc6n+06rZv?=
 =?iso-8859-1?Q?6mzHjTIcickZ657+MfJEaXH72ZpRIBaoGZ9siaNXkOrDOcmfFLbvr1ISmS?=
 =?iso-8859-1?Q?DdNWZJbqhJ3uBNnzpcJdPVVTHXuDubzLbIOkT5bYMvTzoRrGU0yu8PsELo?=
 =?iso-8859-1?Q?Ea0xhIgKeMbBoYJsw/hL2bfufFjaqMrzIFZ5ORjsalofpeCB00qKobunAI?=
 =?iso-8859-1?Q?Mfk2uLlhTry47PhBJpjx6scuEm7hfVX/POhC3q/G76qB2zTO3DKhfB4THg?=
 =?iso-8859-1?Q?gMHgkLG+Zkn7jQab45D+Wqy4njj69TuJVmzSld5qkkCS6gNahBMXoHF0h2?=
 =?iso-8859-1?Q?iWqhHl7DjTrISLJTssLXSdfqCtlal2LpF+vK86H0jfb17NuGJCalxGeAyb?=
 =?iso-8859-1?Q?E+RM9HC6kejc5KCidFmAC2CtRocdQdFkAT7zAYzs50pNnmg1SqCt/EvZD+?=
 =?iso-8859-1?Q?rf6d3sFWoteWWMjfOINODqNZK73UNNTjxqdixS+1LJWmL1r0KONmKhU60b?=
 =?iso-8859-1?Q?BDk64SG/FZPQscfk0dZDTvtRbqTYzl0dt0R5Oc5176Uf6vLTDXDfC05ODX?=
 =?iso-8859-1?Q?p91gLJnnRUQ0j1URlx470AxmT8rCgmlZk+VIHKZblyLVGPNBhjpNzdv0iH?=
 =?iso-8859-1?Q?iCWd8YV7CWxuEjasrYe9tcZuAcYqKaF9S59OYTorclAWCcVqTlnoYIbN61?=
 =?iso-8859-1?Q?wIJ3KqIISAds0D1xan+NtHA+FMHGCpefZJCx92SSEuAf4ldfQOpOKXE2W4?=
 =?iso-8859-1?Q?FwOvfWl0kOPnsKnJAs27oVl1OkenkDevXZe1qE+R5MKOKiQHLGpgw0/OKT?=
 =?iso-8859-1?Q?LsG004SSKmKGBR7mVvd0Zdy13AAkdz0uoY7A3WXikiV6aC0SGrOHFHSrvg?=
 =?iso-8859-1?Q?Rhd1C8Za1TP4IbSkbJBWFnU5AwGufi1azwf9FdTYxqK9MVIvv2mM4lV8k9?=
 =?iso-8859-1?Q?tasb6OSd/MJlxaigWAA=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f75164df-1c39-4b70-f501-08ddeaf66a71
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2025 14:30:22.5057
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ae9NEvLx7GO14hDVfnhZekj1ROAr5/c8pZvMD0gnMfQL8zMrAhSTBgYd0dbteM5o1L0ZRR6v9gP02YrH3FduarS3xMReeVFTqK7fBUpXzvc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7844

Since eSPI support has been introduced, update the documentation with
the appropriate description.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>

---
The discussion is ongoing and can be addressed in V5.
Clarification is needed from the maintainers.
Link:
- https://lore.kernel.org/xen-devel/87y0r4z717.fsf@epam.com/

Changes in V6:
- no changes

Changes in V5:
- no changes

Changes in V4:
- introduced this patch
---
 docs/man/xl.cfg.5.pod.in | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 5362fb0e9a..292ab10331 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -3072,11 +3072,14 @@ interval of colors (such as "0-4").
 =3Ditem B<nr_spis=3D"NR_SPIS">
=20
 An optional integer parameter specifying the number of SPIs (Shared
-Peripheral Interrupts) to allocate for the domain. Max is 960 SPIs. If
-the `nr_spis` parameter is not specified, the value calculated by the tool=
stack
-will be used for the domain. Otherwise, the value specified by the `nr_spi=
s`
-parameter will be used. The number of SPIs should match the highest interr=
upt
-ID that will be assigned to the domain.
+Peripheral Interrupts) to allocate for the domain. Max is 960 for regular =
SPIs
+or 5088 for eSPIs (Extended SPIs). The eSPIs includes an additional 1024 S=
PIs
+from the eSPI range (4096 to 5119) if the hardware supports extended SPIs
+(GICv3.1+) and CONFIG_GICV3_ESPI is enabled. If the `nr_spis` parameter is=
 not
+specified, the value calculated by the toolstack will be used for the doma=
in.
+Otherwise, the value specified by the `nr_spis` parameter will be used. Th=
e
+number of SPIs should match the highest interrupt ID that will be assigned=
 to
+the domain.
=20
 =3Ditem B<trap_unmapped_accesses=3DBOOLEAN>
=20
--=20
2.34.1

