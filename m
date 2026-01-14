Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F744D20D2E
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 19:30:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1203678.1518792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg5d2-0007G8-2n; Wed, 14 Jan 2026 18:30:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1203678.1518792; Wed, 14 Jan 2026 18:30:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg5d1-0007Cm-T9; Wed, 14 Jan 2026 18:29:59 +0000
Received: by outflank-mailman (input) for mailman id 1203678;
 Wed, 14 Jan 2026 18:29:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/j1I=7T=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1vg5cz-0005zq-Rl
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 18:29:57 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05e73332-f177-11f0-b15e-2bf370ae4941;
 Wed, 14 Jan 2026 19:29:55 +0100 (CET)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by AS8PR03MB6997.eurprd03.prod.outlook.com (2603:10a6:20b:295::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 18:29:50 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%5]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 18:29:50 +0000
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
X-Inumbo-ID: 05e73332-f177-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aarwzvupmXeB5EUFvrj4Qnnu32uXHXhKzs2+llj/sUQ88V2Pj+fzHSzg6tL0YEDkJXuBz+Mij/6fHSpSd7nYoSdiHh3JyWn2VHqzACfPsUAYClMMEinP1ZrxO1FoCYmwkJ6sMZ8fcovLh8CWrBdLzEqrGyKYJnJPRruGH1wiy8Jufe9tV0B3kaIR0fLMulFVD0+R2/1OjheESoslm2f9hKJXIxzR7TQbjfSdG1NRxOgCeO5NLh/ChmZ6/ktHeutYqFHpAxcPpbp4z+lTmsS6Gjkj2oGbKpwTNcbq8PiwB+Um9eKQ8iP+08gZUmE5YW+tUPS+xohyowh5Fb32xeOlkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KUbfJ09ajEh6RKCW3zuVvy+KnBTsoSV1Fb+FIC+7Rhk=;
 b=dcgzkQUgD5rGx2292NY0FxRWgMSYeH5eaZ/8g7qrl8Li4JynSO4kysZmeB8tFUBkrneb3Vq8EFVSDAd8GYOac1e/QFZiFik4WL59QFWcdftw9/ftoDop1gcB+hy2KOcliI6gqH5K8bcZDVNa80UadCxE2prdc7/sWbo9hQOGPOcnmgtuEkQiesQ3dRokl9c6HdoAg9c4yXru41j4enSldlqEgfLMj9Ce0AZKgRf/zurEfBgeIOg7uEucJI5dhMCgQNZwlzh/PtgvMAdT7/s316JQdHqVYiPtvkeiYziTo0gglhWXikTRqRJZd8ULP5NiERxPfLeaVtIh0eqYiqN5mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KUbfJ09ajEh6RKCW3zuVvy+KnBTsoSV1Fb+FIC+7Rhk=;
 b=nzvuebu0pO14f0e7xRl8hrRVzYJsey1ZH29pNkMhVijjomE9owkkRCTYd8vcB924D970W4VnNwMMVWMSKA4d4sE7kb2dZj3+sWP6ekmkpL6v/8H6WFkFkpRnqdOXtScUkhR3+bw2tLYdAeKmybwZcp8z6OsnCMcS94unjHBl0jOGz7ahDT8rZEJCuK5fuXvLs5dHVqe3004Qx1YqY2APCxNsE3my3cxwahyf/EXfHmptXllzul6xYLrfkPKmKYsctkOe7R9MsI/TeO+r+nfbEzb3aGN/wXjrCm7bsK7X9RfT+RXQCdTuCuk4BKsvhuaQhelNyEYsbxNUSk5j24ng7w==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: [PATCH v7 5/5] docs: arm: add SCI SCMI SMC multi-agent driver docs
Thread-Topic: [PATCH v7 5/5] docs: arm: add SCI SCMI SMC multi-agent driver
 docs
Thread-Index: AQHchYPEwdMU0byXVUqET+ZDFFsuOA==
Date: Wed, 14 Jan 2026 18:29:49 +0000
Message-ID:
 <de5964d76261f391f3db877e16e345bfe395dedf.1768415200.git.oleksii_moisieiev@epam.com>
References: <cover.1768415200.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1768415200.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|AS8PR03MB6997:EE_
x-ms-office365-filtering-correlation-id: 595a4d2d-2275-4b53-4eaf-08de539ae74b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?vawYf8/qwe3T21BUwNxD731Td0ca7HPXkSR3OWGkPss+t/jvrJJNgTFRhO?=
 =?iso-8859-1?Q?90vRtXtEWrC5NfULQayQ34a+7+0iQwcJCF01vhAN4F2TDm7aTopjNh4qX+?=
 =?iso-8859-1?Q?xRmcHi3frUNXSOEtKPaWDjH3JVzmSWKcw7h72uG/EmTyLmuUftNEREVdqr?=
 =?iso-8859-1?Q?2mldiqGYRTkIgLA7FNY/85nLxa6KptVYkhGB3SSeEDhMFkpuoKZoazCWSd?=
 =?iso-8859-1?Q?sYxFlKi5P4KvqxPrwwOvAYuPYEaH3r90bFnlnxNe/uaizy14I2hm/Dvjvy?=
 =?iso-8859-1?Q?idHsc7C9Khqna3K7XL9m/x/dYY0fR/DaPO9fcwpqPn03t1AqTFypljrDHR?=
 =?iso-8859-1?Q?BcKazdh7CKRFMbKe6QptZszcESZE2BK6ZZCq/rsI/IEp+Ds7eXRlULrkUo?=
 =?iso-8859-1?Q?XBdololFrJA8ri8LM/NOvBHl34MwzbVlOWfP4FRrD2l6381hTODhGVsM/e?=
 =?iso-8859-1?Q?/UWAIpwqRzVjYqeWoS4gAfpCGiLyY10Llnzxqhg7AEGvvQR/Jf1yEWV49e?=
 =?iso-8859-1?Q?dY6/YbBtMfj8kktANF2A/oKR4gcC2WILZidw5orcuqOeLY3gzGxX4Hca2M?=
 =?iso-8859-1?Q?1i+aSvsohCnNizJllJirCTPIxqLB66SNGKS2HFVQVuIj+YWk5IXoi7Vm8u?=
 =?iso-8859-1?Q?IGey/GBkR+TwcMeK7zZwtQ05udLyF7iBAOIbtp4oxs1O3S8FMmIett1nIo?=
 =?iso-8859-1?Q?aZ34W6M9c+3xd7vE3TZzfFMe4FO1tVAkdE6VmZKAa7pS95jkCuw4s66cDU?=
 =?iso-8859-1?Q?ZklvDsz/2hOJoiAmPuKm9e+nythjCbv80ORymMXiFGqMrPqt+MZUzXFzm1?=
 =?iso-8859-1?Q?XeCKdPqjsM715C19hTCFYMEiFdSZ3QR+sLrGBQElFjxBS2wvA27s/9GgSL?=
 =?iso-8859-1?Q?FU14iCk+aRnJUYzFb5UdIoTK4t1SZJlDAlMFPoZSSaX+wfjMjJ/XlBMoHu?=
 =?iso-8859-1?Q?eEwIE4KQ/oJk/19VqquLff7Eaj2CCMJ8jhzb+iLpIRDVA2zbGLwkWfTfWe?=
 =?iso-8859-1?Q?r1OH8oueofFFuAqcZeLlPKfZWtunu+X0H606FDLqUEAFaXWr72jynrh+qL?=
 =?iso-8859-1?Q?4nAFfta9v+sXsrNj6fzN4mpBCn0tMUgweRMG3iq5Y1rVekw0lCArl1Jb7J?=
 =?iso-8859-1?Q?j6UhdNtI0LFLP6s/TMXNynCD0FlxxULtXvUvyuPiL0Fvm3Bz4wCZ23o+0S?=
 =?iso-8859-1?Q?AY4vNQWlhDs7DgiNY+7c7PeTx3TriZUdj+Yj/QLci2yj9sbNstEXZqXrXC?=
 =?iso-8859-1?Q?qNX9xCvWp4XorsF3jfKvEpvdCVOSYemNXdHWEVSM/+FEyzn3x/ssRzawR0?=
 =?iso-8859-1?Q?hSND1Igv0+uj7ihRDi5yydU2XwEAiyeboLgmphmhkCCFUdHYCSSQVfNstw?=
 =?iso-8859-1?Q?wAyvfn+H6OoUrULTEKc0ZtqmyLt1ejY0dnEA39P3n+/VzLsFnlcm9JEMjh?=
 =?iso-8859-1?Q?biOym6MjWuIdF15AEK7GHvRjUMUBnoqWdUUQcppK+5NTse8FEmmBWjU8SA?=
 =?iso-8859-1?Q?549T1CqOMnR0qGwYgobC4wabxRWRfOqaezGCALqVX078BahK7CfBAAehmn?=
 =?iso-8859-1?Q?Ivl/B35sD58rinNvi7xb8/N1IPqm/wiGe2PVIVLuYk6Ze+ugKH6NEqTcqL?=
 =?iso-8859-1?Q?SVja23hXZ8MDCYan+RcmTAXKXXmMwf5/4pxT3A90vXPqBC7cJNxQPo37ws?=
 =?iso-8859-1?Q?1MTdns2fzXm6fsozWiI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?3jXObwkRLBqYP/nJz2i/moQGU3AMeXZmsdbBFZ+XEMk1RF6x5EnySuanJc?=
 =?iso-8859-1?Q?bZfM6kLy87JFbDfl7Hp2I2e2LgyUw6SP9rvpELEHuChWvS3O3KXtztReMd?=
 =?iso-8859-1?Q?JxYyVY0rzkt4OlJnVP3jgmUCjzdQnIzy8OAqD/DNc60264TgecahYMyY6P?=
 =?iso-8859-1?Q?zDAshbu21LPVyvgkzHVICW84fLAeUol5yOA10R1V9aKuQUUH4HxmU/vml6?=
 =?iso-8859-1?Q?Y1pdMft0ev8vL/6b/QgM8rqj1U0xUdYkESs0UDnLOyeaHiyO6qI4OHcfN0?=
 =?iso-8859-1?Q?x9CheNh8F6JD6GEW9asHkLnlp8qrOIYFEttPSsrjNDhPWGoLKlsYwRgiiD?=
 =?iso-8859-1?Q?waODZEWz67oHALP3RM+uXAXoUKjuUzasP2BlPccpCmN8FtuVcL+Pzgjszw?=
 =?iso-8859-1?Q?i/5tclLEvcNPHYvbrbHLeiJpxlqFAL0PLEtIHvzNmZqTfuTBvioeFlRJWN?=
 =?iso-8859-1?Q?revuOdaOl6+NcxJuw1BGr2INPmIOoAcSpso4Kd1OGN+zYGmx6V3R4lpT1d?=
 =?iso-8859-1?Q?UTcEAmsGXaAd2EyeLwK+/4oKLzFbdgR8VNTA4cj+jBbIlVNUrTsKoA4/Uk?=
 =?iso-8859-1?Q?QAPUVwJdun224qa6bYmd1Dtc9WfTS1P0WrI44ModgSOVV6+ToPgEVaIl1F?=
 =?iso-8859-1?Q?fZqBkcelrQIqM9SN8Rz2hNIeyhD2p9VfY0qncFGsVG+6sUgc9nmkiLWOv3?=
 =?iso-8859-1?Q?nmr8N2JVzOLj/RCqr4WBDYphYJBGVGBJyln5vqaHV0Csh4thRniHBNVqaJ?=
 =?iso-8859-1?Q?2sT0WkRbmBrS8WFvg8Pp6NGERH/eHI9WWuLspLFrom2jgGcex1dq4zFYQT?=
 =?iso-8859-1?Q?xTdl2a+YlSdYey2E/YQpdqzg8qXkwmZxA2LyCMwToz7l+du0aFBPlzZcvx?=
 =?iso-8859-1?Q?OXuMNGo0UoUvo2y2K9MiqCe+lajpXCWQNRekQLAtXya2FLkpAWJ4JT23+x?=
 =?iso-8859-1?Q?N1LEY13W9vQuefg4oBZsCvxbN8J+wzKPuD6eMZS/+9iWfcLNi2o1ZWwgYZ?=
 =?iso-8859-1?Q?t9PZ3CTneBrC1swUyhs1f068VhDm8w13y6YASBnfxFs7tx7p98IjGcfqOU?=
 =?iso-8859-1?Q?k/9SqEd+Qks/2jXHZnjpymeoF81Y5zEiYQxmtMtJNVGHES/yZZWLUiAzIE?=
 =?iso-8859-1?Q?VoC/c8ElY9XGEf2+lcDvLJRC7jXxkBBbkWdqB5C30+SR65VsJ8CBXw6EWT?=
 =?iso-8859-1?Q?y2MA5DmkYclgCJYq5fMin9jGe+6g2gC0gXcpJP7SHAkuHLG4TcMyG6xVju?=
 =?iso-8859-1?Q?XUf6/dSX8OWn/tfXOUCASjzarvarC5Gsx6l8eaGT6CtsaCkzGy4h3/NVAs?=
 =?iso-8859-1?Q?RwsQ+ZokxhEs4VITTdaNCKeWTeFoj7JXezVQGEZ33nlvu99IyZLKx6y8w8?=
 =?iso-8859-1?Q?FPrY+/mjn0/kmhKCqiIsDsavzKw8HklV13yD1Er9kIXjFdDUPXwStInFuz?=
 =?iso-8859-1?Q?eN4Vx7XQLhhMyePfI20YZfqu3ShV/TtqirNPnv1f/R2rqXEHGwaYi39D4T?=
 =?iso-8859-1?Q?NDZlomsHiWvcC08VHzXMEoLUROlHWcVmrnq0NKCsUXchGJcHO6iMuBBReN?=
 =?iso-8859-1?Q?jOhma9GtGHvAh4ziFeax3DKuR+FnQ0r0YJaCd1GHgtGscdP3a3QH9n8rq0?=
 =?iso-8859-1?Q?qsUqZax4m5RnELYo4wcpZ141ghhh1zP9nBwJwKEt99hd3aQe6cCvGZttZB?=
 =?iso-8859-1?Q?yS8bmvCUgZJDFnBnwCfrQogR2cezObjLmh9+pej61RGaBsJelB9NHT0yQF?=
 =?iso-8859-1?Q?qiXgw+XrBm4JV7dWCEqXKusfQuBhRPWyKc1Z3GFTQ33yjVXLSDkA9/2lz7?=
 =?iso-8859-1?Q?czZvkqYDtCEty7oEqQ9Lh+c6GSaGoXI=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 595a4d2d-2275-4b53-4eaf-08de539ae74b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2026 18:29:49.6758
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HBMFYxess5eKQQr9H6O9E60Qppv4BkNPZMpDWtAxWWt4JXrCEBZUtUuID++zIkgKRS86XY42ooI3mmRC2PkGCiIVXPzS9lQEfy/Lvi0egDs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6997

From: Grygorii Strashko <grygorii_strashko@epam.com>

Add SCI SCMI SMC multi-agent driver documentation.
It includes a detailed description of the SCMI multi-agent driver.
This document explains the driver's functionality, configuration,
and the compilation process. The Xen SCMI multi-agent driver is
designed to provide SCMI access to system resources from different
domains.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---

Changes in v7:
- update documentation in section of the xen_scmi configuration which
is matched by "xen,sci" compatible instead of the direct path.

Changes in v6:
- remove all HVC mentions from the multi-agent doc
- update sci-agent-id parameter description in the documentation
- add missing Sign-of
- minor fixes across the document

Changes in v5:
- rework multi-agent driver to leave Host Device-tree unmodified

 .../arm/firmware/arm-scmi.rst                 | 341 ++++++++++++++++++
 docs/misc/arm/device-tree/booting.txt         | 123 ++++---
 2 files changed, 412 insertions(+), 52 deletions(-)

diff --git a/docs/hypervisor-guide/arm/firmware/arm-scmi.rst b/docs/hypervi=
sor-guide/arm/firmware/arm-scmi.rst
index d9698f4e4b..630965fef3 100644
--- a/docs/hypervisor-guide/arm/firmware/arm-scmi.rst
+++ b/docs/hypervisor-guide/arm/firmware/arm-scmi.rst
@@ -36,6 +36,8 @@ The below sections describe SCMI support options availabl=
e for Xen.
=20
 | [1] `Arm SCMI <https://developer.arm.com/documentation/den0056/latest/>`=
_
 | [2] `System Control and Management Interface (SCMI) bindings <https://we=
b.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documenta=
tion/devicetree/bindings/firmware/arm,scmi.yaml>`_
+| [3] `Generic Domain Access Controllers bindings <https://web.git.kernel.=
org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetr=
ee/bindings/access-controllers/access-controllers.yaml>`_
+
=20
 Simple SCMI over SMC calls forwarding driver (EL3)
 ------------------------------------------------------
@@ -189,3 +191,342 @@ except explicitly enabling SCMI with "arm_sci" xl.cfg=
 option.
     ->        xen,reg =3D <0x0 0x47ff0000 0x0 0x1000 0x0 0x22001000>;
     ->        xen,force-assign-without-iommu;
       };
+
+SCMI SMC multi-agent driver (EL3)
+-------------------------------------
+
+The SCMI SMC multi-agent driver enables support for ARM EL3 Trusted Firmwa=
re-A (TF-A) which
+provides SCMI interface with multi-agent support, as shown below.
+
+::
+
+      +-----------------------------------------+
+      |                                         |
+      | EL3 TF-A SCMI                           |
+      +-------+--+-------+--+-------+--+-------++
+      |shmem1 |  |shmem0 |  |shmem2 |  |shmemX |
+      +-----+-+  +---+---+  +--+----+  +---+---+
+    smc-id1 |        |         |           |
+    agent1  |        |         |           |
+      +-----v--------+---------+-----------+----+
+      |              |         |           |    |
+      |              |         |           |    |
+      +--------------+---------+-----------+----+
+             smc-id0 |  smc-id2|    smc-idX|
+             agent0  |  agent2 |    agentX |
+                     |         |           |
+                +----v---+  +--v-----+  +--v-----+
+                |        |  |        |  |        |
+                | Dom0   |  | Dom1   |  | DomX   |
+                |        |  |        |  |        |
+                |        |  |        |  |        |
+                +--------+  +--------+  +--------+
+
+The EL3 SCMI multi-agent firmware is expected to provide SCMI SMC shared-m=
emory transport
+for every Agent in the system. The SCMI Agent transport channel defined by=
 pair:
+
+- smc-id: SMC function id used for Doorbell
+- shmem: shared memory for messages transfer, **Xen page aligned**.
+  Shared memory is mapped with the following flags: MT_DEVICE_nGnRE and _P=
AGE_DEVICE, indicating that this
+  memory is mapped as device memory.
+
+The following SCMI Agents are expected to be defined by SCMI FW to enable =
SCMI multi-agent functionality
+under Xen:
+
+- Xen management agent: trusted agents that accesses to the Base Protocol =
commands to configure
+  agent specific permissions
+- OSPM VM agents: non-trusted agent, one for each Guest domain which is  a=
llowed direct HW access.
+  At least one OSPM VM agent has to be provided by FW if HW is handled onl=
y by Dom0 or Driver Domain.
+
+The EL3 SCMI FW is expected to implement following Base protocol messages:
+
+- BASE_DISCOVER_AGENT (optional if agent_id was provided)
+- BASE_RESET_AGENT_CONFIGURATION (optional)
+- BASE_SET_DEVICE_PERMISSIONS (optional)
+
+The number of supported SCMI agents and their transport specifications are=
 SCMI FW implementation
+specific.
+
+Compiling with multi-agent support
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+To build with the SCMI SMC multi-agent driver support, enable Kconfig opti=
on:
+
+::
+
+    CONFIG_SCMI_SMC_MA
+
+
+Driver functionality
+^^^^^^^^^^^^^^^^^^^^
+
+The SCI SCMI SMC multi-agent driver implements following functionality:
+
+- The driver is initialized based on the ``xen,config`` node under ``chose=
n``
+  (only one SCMI interface is supported), which describes the Xen manageme=
nt
+  agent SCMI interface.
+
+.. code-block:: dts
+
+    scmi_shm_1: sram@47ff1000 {
+              compatible =3D "arm,scmi-shmem";
+              reg =3D <0x0 0x47ff1000 0x0 0x1000>;
+    };
+    scmi_xen: scmi {
+            compatible =3D "arm,scmi-smc";
+            arm,smc-id =3D <0x82000002>; <--- Xen management agent smc-id
+            #address-cells =3D < 1>;
+            #size-cells =3D < 0>;
+            #access-controller-cells =3D < 1>;
+            shmem =3D <&scmi_shm_1>; <--- Xen management agent shmem
+    };
+
+- The driver obtains Xen specific SCMI Agent's configuration from the Host=
 DT, probes Agents and
+  builds SCMI Agents list. The Agents configuration is taken from "scmi-se=
condary-agents"
+  property where first item is "arm,smc-id", second - "arm,scmi-shmem" pha=
ndle and third is
+  optional "agent_id":
+
+.. code-block:: dts
+
+    chosen {
+      ranges; <--- set default ranges so address can be translated when pa=
rsing scmi_shm node
+      xen,config {
+        ranges; <--- set default ranges so address can be translated when =
parsing scmi_shm node
+        scmi-secondary-agents =3D <
+                      0x82000003 &scmi_shm_0 0
+                      0x82000004 &scmi_shm_2 2
+                      0x82000005 &scmi_shm_3 3
+                      0x82000006 &scmi_shm_4 4>;
+        #scmi-secondary-agents-cells =3D <3>; <--- optional, default 3
+
+        scmi_shm_0 : sram@47ff0000 {
+            compatible =3D "arm,scmi-shmem";
+            reg =3D <0x0 0x47ff0000 0x0 0x1000>;
+        };
+
+        scmi_shm_2: sram@47ff2000 {
+                compatible =3D "arm,scmi-shmem";
+                reg =3D <0x0 0x47ff2000 0x0 0x1000>;
+        };
+        scmi_shm_3: sram@47ff3000 {
+                compatible =3D "arm,scmi-shmem";
+                reg =3D <0x0 0x47ff3000 0x0 0x1000>;
+        };
+        scmi_shm_4: sram@47ff4000 {
+                compatible =3D "arm,scmi-shmem";
+                reg =3D <0x0 0x47ff4000 0x0 0x1000>;
+        };
+
+        // Xen SCMI management channel
+        scmi_shm_1: sram@47ff1000 {
+                compatible =3D "arm,scmi-shmem";
+                reg =3D <0x0 0x47ff1000 0x0 0x1000>;
+        };
+
+        scmi_xen: scmi {
+            compatible =3D "arm,scmi-smc";
+            arm,smc-id =3D <0x82000002>; <--- Xen management agent smc-id
+            #address-cells =3D < 1>;
+            #size-cells =3D < 0>;
+            #access-controller-cells =3D < 1>;
+            shmem =3D <&scmi_shm_1>; <--- Xen management agent shmem
+        };
+      };
+    };
+
+    /{
+        // Host SCMI OSPM channel - provided to the Dom0 as is if SCMI ena=
bled for it
+        scmi_shm: sram@47ff1000 {
+                compatible =3D "arm,scmi-shmem";
+                reg =3D <0x0 0x47ff1000 0x0 0x1000>;
+        };
+
+        firmware {
+            scmi: scmi {
+                compatible =3D "arm,scmi-smc";
+                arm,smc-id =3D <0x82000003>; <--- Host OSPM agent smc-id
+                #address-cells =3D < 1>;
+                #size-cells =3D < 0>;
+                shmem =3D <&scmi_shm>; <--- Host OSPM agent shmem
+
+                protocol@X{
+                };
+            };
+        };
+    };
+
+  This approach allows defining multiple SCMI Agents by adding Xen-specifi=
c properties under
+  the ``/chosen`` node to the Host Device Tree, leaving the main part unch=
anged. The Host DT
+  SCMI channel will be passed to Dom0.
+
+  The Xen management agent is described as a ``scmi_xen`` node under the `=
`/chosen`` node, which
+  is used by Xen to control other SCMI Agents in the system.
+
+  All secondary agents' configurations are provided in the ``scmi-secondar=
y-agents`` property with
+  an optional ``agent_id`` field.
+
+  The ``agent_id`` from the ``scmi-secondary-agents`` property is used to =
identify the agent in the
+  system and can be omitted by setting ``#scmi-secondary-agents-cells =3D =
<2>``, so the Secondary
+  Agents configuration will look like this:
+
+... code-block:: dts
+
+    chosen {
+      xen,config {
+        scmi-secondary-agents =3D <
+                      0x82000003 &scmi_shm_0
+                      0x82000004 &scmi_shm_2
+                      0x82000005 &scmi_shm_3
+                      0x82000006 &scmi_shm_4>;
+        #scmi-secondary-agents-cells =3D <2>;
+      };
+    }
+
+  In this case, Xen will use the ``SCMI_BASE_DISCOVER_AGENT`` call to disc=
over the ``agent_id``
+  for each secondary agent. Providing the ``agent_id`` in the ``scmi-secon=
dary-agents`` property
+  allows skipping the discovery call, which is useful when the secondary a=
gent's shared memory is
+  not accessible by Xen or when boot time is important because it allows s=
kipping the agent
+  discovery procedure.
+
+.. note::
+
+    Note that Xen is the only one entry in the system which need to know a=
bout SCMI multi-agent support.
+
+- The driver implements the SCI subsystem interface required for configuri=
ng and enabling SCMI
+  functionality for Dom0/hwdom and Guest domains. To enable SCMI functiona=
lity for guest domain
+  it has to be configured with unique supported SCMI Agent_id and use corr=
esponding SCMI SMC
+  shared-memory transport ``[smc-id, shmem]`` defined for this SCMI Agent_=
id.
+
+- Once Xen domain is configured it can communicate with EL3 SCMI FW:
+
+  - zero-copy, the guest domain puts/gets SCMI message in/from shmem;
+  - the guest triggers SMC exception with agent "smc-id" (doorbell);
+  - the Xen driver catches exception, do checks and synchronously forwards=
 it to EL3 FW.
+
+- the Xen driver sends BASE_RESET_AGENT_CONFIGURATION message to Xen manag=
ement agent channel on
+  domain destroy event. This allows to reset resources used by domain and =
so implement use-case
+  like domain reboot.
+
+
+Configure SCMI for Dom0
+^^^^^^^^^^^^^^^^^^^^^^^
+The **"dom0=3Dsci-agent-id=3D<dom0_agent_id>"** parameter in the Xen comma=
nd line is used to enable
+SCMI functionality for Dom0. If not provided, SCMI will be disabled for Do=
m0 and all SCMI nodes
+removed from Dom0 DT.
+
+Example: **dom0=3Dsci-agent-id=3D0** to enable SCMI with agent ID 0 for Do=
m0.
+
+Xen utilizes Host DT SCMI node to configure Dom0 SCMI Agent so the device-=
tree remains unchanged
+except for the Xen specific properties under ``/chosen`` node. If Xen devi=
ce-tree doesn't include
+``/firmware/scmi`` node or it's disabled, the Dom0 SCMI Agent will not be =
configured.
+
+.. note::
+
+    The **sci-agent-id** value should match the ``func_id`` and ``shmem`` =
in the ``/firmware/scmi`` node
+    to set the correct Dom0 SCMI Agent.
+
+Configure SCMI for for guest domain with toolstack
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+* In domain's xl.cfg file add **"arm_sci"** option as below
+
+::
+
+    arm_sci =3D "type=3Dscmi_smc_multiagent,agent_id=3D2"
+
+* In domain's xl.cfg file enable access to the "arm,scmi-shmem" which shou=
ld correspond
+  assigned "agent_id" for the domain, for example:
+
+::
+
+    iomem =3D [
+        "47ff2,1@22001",
+    ]
+
+.. note:: It's up to the user to select guest IPA for mapping SCMI shared-=
memory.
+
+* Add SCMI nodes to the Driver domain partial device tree as in the below =
example.
+  The "arm,smc-id" should correspond assigned agent_id for the domain:
+
+.. code::
+
+    passthrough {
+       scmi_shm_0: sram@22001000 {
+           compatible =3D "arm,scmi-shmem";
+           reg =3D <0x0 0x22001000 0x0 0x1000>;
+       };
+
+       firmware {
+            compatible =3D "simple-bus";
+                scmi: scmi {
+                    compatible =3D "arm,scmi-smc";
+                    arm,smc-id =3D <0x82000004>;
+                    shmem =3D <&scmi_shm_0>;
+                    ...
+                }
+        }
+    }
+
+**Device specific access control**
+
+The XEN SCMI SMC multi-agent driver performs "access-controller" provider =
function in case
+EL3 SCMI FW implements SCMI "4.2.1.1 Device specific access control" and p=
rovides the
+BASE_SET_DEVICE_PERMISSIONS command to configure the devices that an agent=
s have access to.
+The Host DT SCMI node should have "#access-controller-cells=3D<1>" propert=
y and DT devices should
+be bound to the SCMI node using Access Controllers bindings [3].
+
+For example:
+
+.. code-block:: dts
+
+    &i2c1 {
+            access-controllers =3D <&scmi 0>;
+    };
+
+Use domain's xl.cfg file **"dtdev"** property to assign SCMI devices from =
toolstack to the guest:
+
+::
+
+    dtdev =3D [
+        "/soc/i2c@e6508000",
+    ]
+
+.. note::
+
+    xl.cfg:"dtdev" need contain all nodes which are under SCMI management =
(not only those which are
+    behind IOMMU) and passed-through to the guest domain.
+
+Configure SCMI for predefined domains (dom0less)
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+* add "xen,sci_type" and "xen,sci-agent-id" properties for required DomU (=
"xen,domain") node
+
+::
+
+    xen,sci_type=3D"scmi_smc_multiagent"
+    xen,sci-agent-id=3D2
+
+* add scmi nodes to the Driver domain partial device tree the same way as =
above (toolstack case) and
+  enable access to the "arm,scmi-shmem" according to the dom0less document=
ation. For example:
+
+.. code-block:: dts
+
+      scmi_shm_0: sram@22001000 {
+            compatible =3D "arm,scmi-shmem";
+            reg =3D <0x00 0x22001000 0x00 0x1000>;
+    ->        xen,reg =3D <0x0 0x47ff0000 0x0 0x1000 0x0 0x22001000>;
+    ->        xen,force-assign-without-iommu;
+      };
+
+* For SCMI device access control configure pass-through devices in the gue=
st partial DT according to
+  the dom0less documentation and ensure that devices SCMI management has "=
xen,path" property set:
+
+.. code-block:: dts
+
+		i2c@e6508000 {
+            ...
+			reg =3D <0x00 0xe6508000 0x00 0x1000>;
+    ->        xen,path =3D "/soc/i2c@e6508000"
+    ->        xen,reg =3D <0x0 0xe6508000 0x0 0x1000 0x0 0xe6508000>;
+    ->        xen,force-assign-without-iommu;
+        };
diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-t=
ree/booting.txt
index 6fd7e4a16b..76eda1b756 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -844,9 +844,12 @@ SCMI SMC multi-agent support
=20
 For enabling the ARM SCMI SMC multi-agent support (enabled by CONFIG_SCMI_=
SMC_MA)
 the Xen specific SCMI Agent's configuration shall be provided in the Host =
DT
-according to the SCMI compliant EL3 Firmware specification with
-ARM SMC/HVC transport using property "scmi-secondary-agents" placed in "xe=
n,config"
-node under "chosen" node:
+according to the SCMI compliant EL3 Firmware specification with ARM SMC/HV=
C
+transport. The SCMI configuration must live under the Xen SCMI container
+"xen,sci" beneath "/chosen" (for example "/chosen/xen/xen_scmi_config/scmi=
"). The
+Xen SCMI mediator will bind only to the "arm,scmi-smc" node that is a chil=
d of
+this "xen,sci" container; any other "arm,scmi-smc" nodes (for example unde=
r
+"/firmware") are ignored to avoid stealing the host's SCMI OSPM instance.
=20
 - scmi-secondary-agents
=20
@@ -859,47 +862,53 @@ node under "chosen" node:
=20
 As an example:
=20
-/{
-chosen {
-    xen,config {
-        scmi_shm_0 : sram@47ff0000 {
-            compatible =3D "arm,scmi-shmem";
-            reg =3D <0x0 0x47ff0000 0x0 0x1000>;
-        };
-        // Xen SCMI management channel
-        scmi_shm_1: sram@47ff1000 {
-                compatible =3D "arm,scmi-shmem";
-                reg =3D <0x0 0x47ff1000 0x0 0x1000>;
-        };
-        scmi_shm_2: sram@47ff2000 {
-                compatible =3D "arm,scmi-shmem";
-                reg =3D <0x0 0x47ff2000 0x0 0x1000>;
-        };
-        scmi_shm_3: sram@47ff3000 {
-                compatible =3D "arm,scmi-shmem";
-                reg =3D <0x0 0x47ff3000 0x0 0x1000>;
-        };
-        scmi_shm_3: sram@47ff4000 {
-                compatible =3D "arm,scmi-shmem";
-                reg =3D <0x0 0x47ff4000 0x0 0x1000>;
-        };
-        scmi-secondary-agents =3D <
-            0x82000002 &scmi_shm_0 0
-            0x82000004 &scmi_shm_2 2
-            0x82000005 &scmi_shm_3 3
-            0x82000006 &scmi_shm_4 4>;
-            #scmi-secondary-agents-cells =3D <3>;
-        };
-
-        scmi_xen: scmi {
-            compatible =3D "arm,scmi-smc";
-            arm,smc-id =3D <0x82000002>; <--- Xen management agent smc-id
-            #address-cells =3D < 1>;
-            #size-cells =3D < 0>;
-            #access-controller-cells =3D < 1>;
-            shmem =3D <&scmi_shm_1>; <--- Xen management agent shmem
+/ {
+    chosen {
+        xen {
+            ranges;
+            xen_scmi_config {
+                compatible =3D "xen,sci";
+                #address-cells =3D <2>;
+                #size-cells =3D <2>;
+                ranges;
+
+                scmi_shm_0: sram@47ff0000 {
+                    compatible =3D "arm,scmi-shmem";
+                    reg =3D <0x0 0x47ff0000 0x0 0x1000>;
+                };
+
+                /* Xen SCMI management channel */
+                scmi_shm_1: sram@47ff1000 {
+                    compatible =3D "arm,scmi-shmem";
+                    reg =3D <0x0 0x47ff1000 0x0 0x1000>;
+                };
+
+                scmi_shm_2: sram@47ff2000 {
+                    compatible =3D "arm,scmi-shmem";
+                    reg =3D <0x0 0x47ff2000 0x0 0x1000>;
+                };
+
+                scmi_shm_3: sram@47ff3000 {
+                    compatible =3D "arm,scmi-shmem";
+                    reg =3D <0x0 0x47ff3000 0x0 0x1000>;
+                };
+
+                scmi-secondary-agents =3D <
+                    0x82000002 &scmi_shm_0 0
+                    0x82000004 &scmi_shm_2 2
+                    0x82000005 &scmi_shm_3 3>; <--- func_id, shmem, agent_=
id
+                #scmi-secondary-agents-cells =3D <3>;
+
+                scmi_xen: scmi {
+                    compatible =3D "arm,scmi-smc";
+                    arm,smc-id =3D <0x82000002>; <--- Xen management agent=
 func_id
+                    #address-cells =3D <1>;
+                    #size-cells =3D <0>;
+                    #access-controller-cells =3D <1>;
+                    shmem =3D <&scmi_shm_1>; <--- Xen management agent shm=
em
+                };
+            };
         };
-
     };
 };
=20
@@ -915,15 +924,25 @@ chosen {
=20
 Example:
=20
-/{
-chosen {
-    xen,config {
-        scmi-secondary-agents =3D <
-            0x82000003 &scmi_shm_1
-            0x82000004 &scmi_shm_2
-            0x82000005 &scmi_shm_3
-            0x82000006 &scmi_shm_4>;
-            #scmi-secondary-agents-cells =3D <2>;
+/ {
+    chosen {
+        xen {
+            ranges;
+            xen_scmi_config {
+                compatible =3D "xen,sci";
+                #address-cells =3D <2>;
+                #size-cells =3D <2>;
+                ranges;
+
+                /* Shared memory nodes as in the previous example */
+
+                scmi-secondary-agents =3D <
+                    0x82000003 &scmi_shm_1
+                    0x82000004 &scmi_shm_2
+                    0x82000005 &scmi_shm_3
+                    0x82000006 &scmi_shm_4>;
+                #scmi-secondary-agents-cells =3D <2>;
+            };
         };
     };
 };
--=20
2.34.1

