Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9995B38999
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 20:31:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096809.1451440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urKvf-0005lH-4N; Wed, 27 Aug 2025 18:31:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096809.1451440; Wed, 27 Aug 2025 18:31:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urKvf-0005jX-0X; Wed, 27 Aug 2025 18:31:27 +0000
Received: by outflank-mailman (input) for mailman id 1096809;
 Wed, 27 Aug 2025 18:31:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x+iP=3H=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1urKow-0006ki-Ak
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 18:24:30 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10da613f-8373-11f0-ae26-e363de0e7a9e;
 Wed, 27 Aug 2025 20:24:27 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by MRWPR03MB11023.eurprd03.prod.outlook.com (2603:10a6:501:76::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Wed, 27 Aug
 2025 18:24:24 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9052.014; Wed, 27 Aug 2025
 18:24:24 +0000
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
X-Inumbo-ID: 10da613f-8373-11f0-ae26-e363de0e7a9e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=af4fTr8gP9KxbRQiOgP90/NUmLwvypl/Ir4GiApeS4oT7t3aIlifsPq0IajoT/p7pQEAh7F3Zm7MuC1Bc5A7+9vdLWJ1q3RnIa8ZDAZ4hSDFRHtG1AZ2mY0ilUErEq9iTi+bemSzTlL+/2FkZ16A179nerVfH8fX4EiMJuQ6TLjmJ0tBgyEUTtTcVdMAJdF5KsHU5xsaLekxpq5e4E+R6t131RLiFXn7ThDDpFJI4YQD+RPTieH3z339WvvWAy3qZVzm4aAfvyMarRY3ac6HqVCH3xWsqFQn20WesSHRagNEfautRTKCBpjc3ptxDod3jrRwExlH0h7EjFN5RKRG5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P59BS93ETcKG4P0KEy57U1s5baIHMLjBk3TnuOaGCfU=;
 b=AfoeuotC2PpMOUbDTlDH98Jnmh65kVP0Lgs0MbYJvuCF4IxvyCXmI4tCseiW8d6QKNjC8edbF12owpmwBrblBcBAUIMaAzz4NKNUg3mmZxvj1X1qc+To4Ii/41av5ib8Q/EtU4H4g0SD0KcErFiHrCOgVMMEx5gYCk4QV+Vuqi4x15ZRnpC6v4G66AMWRSwNm1gKZakilrR/DIMqRTT0IuMtYDSUOsyZwVTFPB1r4yW8IkybON9/fi6mZ1sHlY6GaHhVp2skvek3rV0gHFG/p7vCgkD3PaXppYk49JJutdraT6FZZtGnQ1XZrKK4rEiFIis4IWogZoHJVvYrXIfbXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P59BS93ETcKG4P0KEy57U1s5baIHMLjBk3TnuOaGCfU=;
 b=g4LqAdyD4mT5n6NADjvReW7iFXvwomq0kf+h3CAHhA6HHTvfYaoj00KnPEGQoCRvAUFfXPBsoWvb8QrKRIIl0LOCwfIaFJCO/QwBdyzn6PftcxqnF/0GdHO4yco60EFgxN6k/djeyv10crNLIYH39+6RtcCsC+oCjvcWavRaBdyXe3eikjJxXJ+dCo283k66Sie/WhfcBmGxVmtROjrrV9OaJVLIqXYCpSsu98qHOCQPX36mNWSUHn9dokrMHe0dURoPDUxywpSxYPdX/qZSmUdoiE67O7QuCC6fUibtNrhj4OqIBlDmP9WsQ6E2BXzZxTJxXCyXS7fSWRyPqiCMiA==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v4 11/12] doc/man: update description for nr_spis with eSPI
Thread-Topic: [PATCH v4 11/12] doc/man: update description for nr_spis with
 eSPI
Thread-Index: AQHcF3/Q0bamE1jhy06ZtBrEohbynw==
Date: Wed, 27 Aug 2025 18:24:24 +0000
Message-ID:
 <50cd1899b328e82bd517ae0dd0e400e9cfee0999.1756317702.git.leonid_komarianskyi@epam.com>
References: <cover.1756317702.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1756317702.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|MRWPR03MB11023:EE_
x-ms-office365-filtering-correlation-id: f80c8cf4-721e-445f-8472-08dde596f31d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?CvrKr9e19yJrHSXUZpIz3BHjDLk8FpAjfbUzBvbsDqX4U5qNDQpEUCFkL4?=
 =?iso-8859-1?Q?9DZa+GuuiDzGL9HiCaEJ+J037biOoaYz7z1eV2fU0ZRpOdAULD8XGCjPDJ?=
 =?iso-8859-1?Q?1DuGQ1NmRmU0edpqiAsS0c+04jBqpp2CjhfQRLVGJk1UQtqtopvgOf2uk0?=
 =?iso-8859-1?Q?Y6Ivx7+0gQbAeTNFuWFCT59CWhelG1zRWS8vcPskXZmUuQUBLa2xbHQMcU?=
 =?iso-8859-1?Q?Yz7/IfK9wT9fWARKPCba7LCQQxO+ox1qkVMZNI0qmS4oyvybfVN21DylcY?=
 =?iso-8859-1?Q?Ar5+ZB2I7nMugWcM3dl7T5Gz3+2rxTiLbC72REgIm/h3WauZy1Kg4b1ta0?=
 =?iso-8859-1?Q?mojdxJhGHRMgv6HhNdgDQxjMpivl0NrLXfbW6GArx/yroY5TXOtuA9tt7d?=
 =?iso-8859-1?Q?zfhUkeq5wnaajjmlAp58/v2lL6Ay68KM+8MmcRgeEcfZc7Ka5eBvEEr7hO?=
 =?iso-8859-1?Q?9HqiN++E+rgGDmGueY7/SyYssvm84Hpn6jAFk/YZg99+IVN62ouYZcJlwV?=
 =?iso-8859-1?Q?1pPeTUHNRnxtbiQANCocMuostLmW5XifKv4SVI7KpwQzca9gcoVvoFL7rA?=
 =?iso-8859-1?Q?9YRFg4cqBQMkG33a6r/5TEahRddtnJO+ydZd2Ugj7bXTFBn/Vmqe7iaxmC?=
 =?iso-8859-1?Q?UUoF19nk9/U7eQGHwgURImYPCWym3DdF2uR3ev6421wGw5gpby0vrOcDcr?=
 =?iso-8859-1?Q?AP2sYD1Ee5p92rt6M8kuFzS0CIt/rHGwg7FyQLp6L5W9xB0nkKurpD63wM?=
 =?iso-8859-1?Q?NbbqyseAGHd5agEGMW4Dw/0HeHDnkWo9w+9tCh6s6rclzgxohFYfjeU/Ph?=
 =?iso-8859-1?Q?uaLocdgFaFiy/OtgTS3czZMx2dqGKf3R5sOC3sjmlgs8PXRioKN1nPghyw?=
 =?iso-8859-1?Q?by+44eQXuQJIt+/EmO6Hi0UDErJNZz4dIcaiOOaNB1bJm6TZiNQMvEHF0z?=
 =?iso-8859-1?Q?/S1gRUJd7ssluzYaexjIDc2chZG/bAdsv7tAz6cKDejejZA37P3cLM6y3E?=
 =?iso-8859-1?Q?5sNKd1L6dIBicgao7DZNKUxYBYvFxpMBUkrST+ViJcU74wH/zpIHtX/xyy?=
 =?iso-8859-1?Q?uU5Z6Tyd1zsZwQgQC0PnbYP5EMOa9JsKF3QlGyoR4CMiFaTl02t/RiCows?=
 =?iso-8859-1?Q?Us+OzBmIeH3kxz3c7EWoZl9I4K4yyQEjYk9rMqXPQVImDpXepY7ncE1j0H?=
 =?iso-8859-1?Q?M6XjHNtvDPEVQj44/8uW5BO+cXRYzYObZ7ZAeuKNdpwcdIcFlx1DOiceQh?=
 =?iso-8859-1?Q?bVcIc/A4/40lsQDDlD+U8LT2dGiu8ThaIuUA80m9GTjR9Xpa5jLYQpjQA1?=
 =?iso-8859-1?Q?TQyzCebHIN3wT2EZBTrGJfu9tHLWE4k9ZRX8bVJ/c8H+DX/MDcpJeBBzAr?=
 =?iso-8859-1?Q?Ry31KCVX8sLMO3c0ejjWWTI0MAp+bDP1EQA+0OEk0ChECZDcWiXgudC971?=
 =?iso-8859-1?Q?EEZQ0G2E6w6osWhsNU5Y5drVfbLPtwEwolwgnf7AV8JVp3ipWBOx5kQ/Ar?=
 =?iso-8859-1?Q?mAqLprZqqvuknxZCQwJKIlRAoAfzLSpfP66sORHVvcsEFMwhuMYJMyYenD?=
 =?iso-8859-1?Q?uTy0hsA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?I+wtVbNl2X59aXw96xgH8ZywL+TA5BgiT/C61xntblyYWokmhGeC5hXceB?=
 =?iso-8859-1?Q?fG1m3o6uuO/USJ4W6ItIHNFlXF5Si/tjZ1Zs0jneOWeTZNld9DAmRgugl5?=
 =?iso-8859-1?Q?mr58tOaVmtBSgi7LBfmZihPjz+jOdWj2B5SNj7hPUQ1nbBR77GNTAsTyMU?=
 =?iso-8859-1?Q?tGZ+IfH2f/vmzBKj5AMCce1LsRWm4a2Ppr9enzW56yy/Tl6ZQsPGHeMTl8?=
 =?iso-8859-1?Q?oEwKipKWff4/OPUBjkza/gOvIxdjBstIag675mzACNp3+sCRoOAzhGYARL?=
 =?iso-8859-1?Q?3P1Q3EuR+/f3+afG+8UJFZBR5X00vxt7sEhxvdUPDMh81tpVvwuX8o3TMJ?=
 =?iso-8859-1?Q?nShsuQFf9qjUeO71sh1Xk9yO2DG6x2GY/rQEYLCObEo+ANSHzXoTrwcTNj?=
 =?iso-8859-1?Q?ulsfWUdRs2CvG9lQeTfdKcJSB04zK1lJjg9pkjy7I3yv7KHuIf+bFe9XxH?=
 =?iso-8859-1?Q?OCMkPB2ofs812FFH0yfh+HUB3ysexNAagH93mR2xCDxSHhr7+23kFJwn46?=
 =?iso-8859-1?Q?wLs3/QjZZWroLNWnXMulnI7Qz+WW+E1I0EA1cc8rSm70kToB6D2Xu7poRX?=
 =?iso-8859-1?Q?SleEVYe9Lf3VT240OATh6C6Z1TeOaEePO/0/b4BEBNlZtm2u8lnnJfT6jJ?=
 =?iso-8859-1?Q?L5rwFJYcsM3pLMq6uWMFEoPACfQnh7EyNtzcqpKcPvj903IFzZd6vSvLu9?=
 =?iso-8859-1?Q?5K2UXSqZ62rCmj5Dq+LRpfkeYBogDs9N6/ox7MjMM3/2QW5pH4xTAyTC2D?=
 =?iso-8859-1?Q?4NJmlSMzDxmVp9h77iI8y/rkAqblNJP1H85JLRC7fdsKWNrmCQdBkQe/QH?=
 =?iso-8859-1?Q?s2ZWW0YWBrPpb68NbbYUXRH0v2MZHc8/cZgI1hBzlr5NrcktlbI09o+HRV?=
 =?iso-8859-1?Q?1hGnpd5pA1iH1f/PKHY287O12829VSxj4Mu3Uzh3TdTy9HHJz0+Wvu70Dt?=
 =?iso-8859-1?Q?dRWSjOBUa7cSKsgQ31P6Mbe61rcvSfvfMPonh3N0ULtTjXtVM7h1aqaIoe?=
 =?iso-8859-1?Q?C5qQNeZJVaO86uf2p8e7Lb84WuZrW3Kfh0ahzta56TrXUq/lAXj8eNEW3W?=
 =?iso-8859-1?Q?EQyicJ5wm3+/KD2kMuy+qv+N1ZJlVDBAcC76210owia9roXkKa4DkvTqeO?=
 =?iso-8859-1?Q?NeJI9oDWMHX7hHek5gNI9GU+K+mhyjkVvJWsceJu+7oDW6musxrZKc4UoG?=
 =?iso-8859-1?Q?JQldg+iHfc61WkxxfQgV/aKFn5/At+4gVF2Gv442NDKgvDCTAqZJ65qHlI?=
 =?iso-8859-1?Q?JRS1vpiRElKTSNlBBA0iz1B38+MbqEPynJg8n66WE+fDcsK0wD61l8VxL3?=
 =?iso-8859-1?Q?wAwAaEVS+CQCjabpUUAMmbC8eZeb7oglR7ftSNz2Wp4dY6Fh9lWpcrtAjp?=
 =?iso-8859-1?Q?93Yay83dzLbMJV9CbkZC36mb204OF2oh6ZavWFGX88InssWAVmRec/H646?=
 =?iso-8859-1?Q?bKKTc7iUjYVm/Jv7fDGcn8QAWTDTa7lX/CJ+IYn7K4g0VOhlpFxGhZx7fX?=
 =?iso-8859-1?Q?2ZSB+acvXqAUjtfut8A7/OQuN03AhzWDaIlzGXSRnNrF5VTI2MNvM0EZRH?=
 =?iso-8859-1?Q?2foCLc0k79QTVb4X07FE+z/1pbQti4mWWBFxGoo32rCuOMP19bmd45Gu0z?=
 =?iso-8859-1?Q?sQl69Sc2OMdRYjts64Nj8iVZRIWze26hvjZEoV3l/9dzQx+hvMkXNWZVbq?=
 =?iso-8859-1?Q?yRFb0yoc7XWW1d0IXq0=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f80c8cf4-721e-445f-8472-08dde596f31d
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2025 18:24:24.2978
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8GhAX9WUyQ7EzvnkcYFPZYIDxe9oxmTWI+eOssPvBo9B67IUxQ1mV3/CBQ5uoYG9cdiPS1S6JKZ6vBdV3GaSv2AtMpEm/hO9wNsVOfCnVxw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR03MB11023

Since eSPI support has been introduced, update the documentation with
the appropriate description.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>

---
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

