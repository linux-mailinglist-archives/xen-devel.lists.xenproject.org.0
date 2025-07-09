Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 841FBAFF3FD
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 23:38:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1038668.1410940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZcUj-0000s6-Lq; Wed, 09 Jul 2025 21:38:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1038668.1410940; Wed, 09 Jul 2025 21:38:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZcUj-0000q3-Hf; Wed, 09 Jul 2025 21:38:25 +0000
Received: by outflank-mailman (input) for mailman id 1038668;
 Wed, 09 Jul 2025 21:38:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HxYN=ZW=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uZcUi-0000ps-0M
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 21:38:24 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 075b5a71-5d0d-11f0-b894-0df219b8e170;
 Wed, 09 Jul 2025 23:38:18 +0200 (CEST)
Received: from DB4PR03MB9556.eurprd03.prod.outlook.com (2603:10a6:10:3f3::12)
 by AS8PR03MB7461.eurprd03.prod.outlook.com (2603:10a6:20b:2eb::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Wed, 9 Jul
 2025 21:38:15 +0000
Received: from DB4PR03MB9556.eurprd03.prod.outlook.com
 ([fe80::ff66:ad9c:fa1:ef30]) by DB4PR03MB9556.eurprd03.prod.outlook.com
 ([fe80::ff66:ad9c:fa1:ef30%5]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 21:38:15 +0000
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
X-Inumbo-ID: 075b5a71-5d0d-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dTyrz0oAjlcG3Uue5c2HY/rmHVNuvE26jyA4w9q2YZcjPartRSkD0QVjl8Ks7b0E9PV+5F4fZfwaa17nzDC2D1zsRLco3Txr34tge921kCn5b8mh9to8eW08rFcMnvNzLByH52PH9ITgTl4ghA1j6cO83t+eyzJs5iyJ7xUehpyeWMTWERmurInKACooAE6tDXsH5dcr+7C04RIbagVxiyvc1KYXeCuxcfE3dRn0+9LSmu4mMtfU03zJdIrixkqQWv3ZbQynBahb0xQpHVffPVx5OnclaDVIN4OsVaf++KPbyxv3McBMNU2wtNALq/Ej884dE60/uKleIaBDL8H8bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D3RiPhhb2cGc0MwDZCkxJ15oXFq4/s3nwS/3HSnl7XU=;
 b=DoKJnnlLwV6UVC78mmxwl/T/2MNG4o34C8u8jrBasEwbTRyojWEYvnoOh163Mbqfyg8exvAsLqh9lqhBpDizuFjNjeSplbtLenLG/j6MYPYNzaYfY9QgylzckTJWTArpfDq/B6UDi0wifKyQrstbAw1s9i1vwuDoz/UrjpQZE9MFB9V6K/OiqXE+dcZpsC3zGjixAklyPqQ1w3ZhjAa7XovfEy66RFfmptpP++d6g0vWt4kM0MPIhLHwkORFwSVT4eQC2C+jfQEj1/psAIRTcdkr0Opq4e95J//afQbs10qeZg4FIpD3zo/nSbWiLfl81twaXD84CEM+PF6wpaRwNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D3RiPhhb2cGc0MwDZCkxJ15oXFq4/s3nwS/3HSnl7XU=;
 b=JH+I3lctmTpIK1udCmwrg7xDGEJTIzjFi8aUjiz5sA+/12gEqkISZH1kpsQ+3huPgJ6r3WsPl+II4jiHMqLAwBXNSfWdyOCm6GoxI+xgVp/RJXlIJ2pFiic1JpcacRl/7XTWvHqh17+YIk1ojaJL/FKtr6prCvnpXzCPt3ZDw8sTVEUaHl2dDwdHR78Aike7P6/ogLEERs6+6DoJndupPOZZISG9MzpRCZthot+ztaWfcGUF4S5CI8OVZBxDI7Hv0kda+6Q6HcvoMvr0qP0IWtTDyvTj/tu6pOLA6JiHz48obL86qL44qP38xH4IeAFuQrUKDnjzF8xRlqNudPKDyw==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Jan Beulich
	<jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>
Subject: [XEN PATCH v2 0/3] address violation of MISRA C Rule 5.5
Thread-Topic: [XEN PATCH v2 0/3] address violation of MISRA C Rule 5.5
Thread-Index: AQHb8RnHdjjk1vFAUECgAlFQj2Ifgw==
Date: Wed, 9 Jul 2025 21:38:15 +0000
Message-ID: <cover.1752096263.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB4PR03MB9556:EE_|AS8PR03MB7461:EE_
x-ms-office365-filtering-correlation-id: f9b7745e-0a16-4d75-f705-08ddbf30e98e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|42112799006|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?K7hwLRiUJ1tA/hHDpzwvSsRzN6VmvsPyOk2oKnQtL0+dsPPGivPojf5Bu7?=
 =?iso-8859-1?Q?HG+m9Efjr9qwXzm8Y69t2TD1QKp4M00119o+zG/NAGzHjuGq/H6YGRkVoi?=
 =?iso-8859-1?Q?AWLEqVdJCNuAkx1QKcZWFc/8pnJKXrV8xFpahy2FymRVuz7GfhkKeg91FS?=
 =?iso-8859-1?Q?LRwRkDFkBePWHo0LngS/L8ClWTkZbrxyQmuY2+VCf2kFpkdVs8kxZwaKRj?=
 =?iso-8859-1?Q?VcpoQ6fmvsdr4STHDozlVqtJCmt23kR26k96HA1rhIFIQowo0sF+lzyVSa?=
 =?iso-8859-1?Q?AgkDZ7Q+naYLsn4Dd8MDKlEyzM8CCyq40ZuPY4Avp3gV0qTMz1WUcyPpPr?=
 =?iso-8859-1?Q?b3TOyTAw9/CwQ0l23Q2/UKo24vBteLYBGzCR92JVgLe+Q2ABQIgTMyHzlH?=
 =?iso-8859-1?Q?1/YVpPAxyEX9IJrWOMCmMViWTJfBiS2BqJ9raFrAycPT4rGPCAXIxshwwx?=
 =?iso-8859-1?Q?MlFQa0cTp1KSZg+7fElynww4m6DzWcFDYncnRrmuYYR3Uf/7Nz+IX5LFvK?=
 =?iso-8859-1?Q?vl9+UZzD2mzwmmMX1Q2yT41Q9OQrBz1VkZ7l5ETu6FJqPEY24FKqOYuPl/?=
 =?iso-8859-1?Q?/3aE+fUWmm+Uh78ZNBsYVWeNXf469MU2999BQe1ES3KgZyD99qcBU4S3Ln?=
 =?iso-8859-1?Q?qb7ywZrAOCpdLjqFyzH0ypK79K3RDYKkvIQ4dqJMHWQBb2OYBchtC3Q0wV?=
 =?iso-8859-1?Q?9ACxfAXqTRzZDM4fEYq3kvGkRXF4JsRaDnXI140OIiNBIfNmC5LvI+VrMU?=
 =?iso-8859-1?Q?8qoUlfnW8n44VoqMyKrGwLwrUoSmeVmVd9GbYDz+GMsf1NLwkplv6MPezH?=
 =?iso-8859-1?Q?OIhoYeQaOpqM6yWW0ck0YS5OiJv6G4ceJYKcLi1KRQU9npbi4hgZxUCuaq?=
 =?iso-8859-1?Q?SUTMcYiABkKx/39Gw73XHSssx8m5HM1Ycw3I4Xhr/Z+eMw+AJGqzjfGCvI?=
 =?iso-8859-1?Q?g4F7fv/7n+A+CWReuxyNvI33kgypiW26AAfn14Ot76e0vvFpsEOhaL3+0T?=
 =?iso-8859-1?Q?HMRj3LP/6dGFHa/z/PsODjUvrd0qBAxP5Fn7wM4IjS1EoxSnQ7CmhTUrrC?=
 =?iso-8859-1?Q?+a+c99HnZSSRZW7Id6j7UoIeMtVR49WAqvyCDkYbP5/R6YFDWbrfzxIFVd?=
 =?iso-8859-1?Q?wW0fREzFcZklNk99ksfMhCQ2Uj1qPodnAWWhLPvEanPtCZeeGxzSuZYtaA?=
 =?iso-8859-1?Q?Ybc2Pb0bDd9CkBFLpGXtpp9vG38+Z4UVo4Ct82OnpH2zhkyIB2rPKzJhtl?=
 =?iso-8859-1?Q?/1VLe7QXTe5M++0YF1c56ZKNMb5kR6W+m6FqYuKB+YEHfE16hVv4H9vqT2?=
 =?iso-8859-1?Q?Y7SAEsLjauGb9Jjnnx5WPxfUJaHvhPTsFLaz+JrCn8Swjdg8AiGCyIfuix?=
 =?iso-8859-1?Q?20fVmFdkh0YPG4Qu8e9ZbtXCt5P2D4QbcyfSum4CnmP+XXg7FmjoytYvR1?=
 =?iso-8859-1?Q?bMW3ggSqFNjL4MYd1aihzkdL2GjQBa5SaxAU/9LoQOk8EttYLzjauFIWFC?=
 =?iso-8859-1?Q?A=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR03MB9556.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(42112799006)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ZFfcT5Aio93UPporK81g2u9vzwlOU5NOlsQZLpOrP2xIqFEFPzTy4nOW7+?=
 =?iso-8859-1?Q?UrjtUIT2BSJ7jmTK3omyBMERAwc+bGWCo9BcS1bnKa/DYe6k9pKU5vWE9i?=
 =?iso-8859-1?Q?gg7AXQbmOblmUh/yOZjvvp95GMH49mCNfYijw48y8gk8Fpu/bXNMFhoy20?=
 =?iso-8859-1?Q?3br69nAVor5ShrBLePCXMnianDI3C+9+w2WehUectlWP401VL50isFRA5V?=
 =?iso-8859-1?Q?icHvTRxLL32vLzVbW0Avg/O1DAeNflMsxp85RUbQ6tKTNTpGhWM792Xxei?=
 =?iso-8859-1?Q?DuhlTKiZCWyHK3VB0VEkRlGDReRiNeHe0lgIwF9VEteOM39iS56JIlijry?=
 =?iso-8859-1?Q?3NHcxQ8DZQPHkN4qOamKtQMG8emkLU9LCBgWuD/5p/EJdS8HeDntJkvHai?=
 =?iso-8859-1?Q?M5ItXQjID26Zm7zqfEF1l0Fd4JYNhePzMaiuTEsonLF6+8jsqmMdLaQwT8?=
 =?iso-8859-1?Q?QrN63KpjQsPI8cu9jAxFK1YhcJfXT3ODMa7gn9/2bwFMzvJhjvnAiXYhA2?=
 =?iso-8859-1?Q?g3xRizQ7vhg0CVXttQ284gQd03wjgCWzfJEXRQUe0If8LYO69A8CBGDSZI?=
 =?iso-8859-1?Q?GPVRqktftphl/7CFo2czqfrz+h+aCvJOFVa8p9PCOX5tJSzPoK90m6F+Kx?=
 =?iso-8859-1?Q?UNtKM6ser10fQ9GSQanVcUcWyFqviDVUvdfNv1ll37Ui6MUg1sA4392XYm?=
 =?iso-8859-1?Q?GnzzLg16x2S05YlPh8/hob7U0petkhfvXO35iePVl3U63H4Z576+V/peJj?=
 =?iso-8859-1?Q?90UPZHirC757QDxzBmpqx2hOm4+XTW+7Tc0rtCvkhkpMec9cMheciuFT2+?=
 =?iso-8859-1?Q?/HnAmuQoAjDMhC/uN4sKBpbjbv330CKnxNkVsGBBODk4/iN58EU/iqPI7o?=
 =?iso-8859-1?Q?LLV8rTvz3wjPqoe8Co94lVe0vaT0spEpYFEQPTMFbH6DvM4toPnOL7bHR1?=
 =?iso-8859-1?Q?GtNoiFYAnKjD1PisxXt/Xx2pCHashNh0MqYk5WvM6g7WeqP42idSCY/N6T?=
 =?iso-8859-1?Q?CSjjDMQ0tiYf1ldKBvEhsehP1NwA/YPh0sZbT17IXwkhpljDE5n618o5FE?=
 =?iso-8859-1?Q?xGZqU0OrzYz8WyuYBQzWX2vadi0QiEPtMCAs3yysimMtwcD+Tyl1a1NR/G?=
 =?iso-8859-1?Q?xwopKIkWBMQjQsdJbxB9X8XNRFsSNe9TxLjQUJT8jNOAzhV3txCwdN14V+?=
 =?iso-8859-1?Q?/b3T3BHr9LHve+w89iVT5ifZAmYDnqobjVd7lH+moEtq7Hllggs8OEcKYJ?=
 =?iso-8859-1?Q?3tUOh2Cp4OitPB8wAVVbDBhLkQ1N6bWuIy1fa/cZOzsjustotB2pwpxTs0?=
 =?iso-8859-1?Q?5OKeBTOkR4mH3RHY//fC2LGzDEWezTlF9kxwGq+G4oFVE4ovbL/jwb+puL?=
 =?iso-8859-1?Q?Ot4Iel72vlSKbxw2MEtXIpd7qwMS1a/aa68JJIXRpIdX/FXAQJymEBjgIG?=
 =?iso-8859-1?Q?G77zRRtF9Q1+LvBKGiM7RlknFTR5Pt8+CUrnty3zJiUUNjFNRrWejUq5PX?=
 =?iso-8859-1?Q?m+1iQviGi6Rxrn5o1BCm1S44UQY2R1B04/4/8RsamPzI9joOgaUGmZqyW4?=
 =?iso-8859-1?Q?HIoR4uhCCDEKTv9ztS3nYfvGr5UldnJONzdKsW1N2iK9s+J8/N52D7rE/H?=
 =?iso-8859-1?Q?GKYuiF0G4puH75dNyJ1k+DVGj4yrF/t1iUGvUvSTEevMRqm0hmhvhHfA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB4PR03MB9556.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9b7745e-0a16-4d75-f705-08ddbf30e98e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2025 21:38:15.3835
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /m2uT5BJPLqoSUYV48uyH1G5vyTOkl4EgzZqtaJsLCoRy58lYSEeWQz1DsjoiNhdU4OXoTvDPc2mM4xMH6etTqCBnuOnOxrtr9IhJu6XYkc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7461

This patch series eliminates/deviates MISRA C Rule 5.5 violations for ARM64=
.

Thread discussion:
https://patchew.org/Xen/cover.1751659393.git.dmytro._5Fprokopchuk1@epam.com=
/

Changes in v2:
- fixed code alignment in "device-tree: address violation of MISRA C Rule 5=
.5"
- updated commit message in "iommu: address violation of MISRA C Rule 5.5"
- other patches were squashed and MISRA rule was deviated

Dmytro Prokopchuk (3):
  iommu: address violation of MISRA C Rule 5.5
  device-tree: address violation of MISRA C Rule 5.5
  eclair: add deviations of MISRA C Rule 5.5

 automation/eclair_analysis/ECLAIR/deviations.ecl |  8 ++++++++
 docs/misra/deviations.rst                        |  8 ++++++++
 xen/common/device-tree/domain-build.c            | 13 ++++++-------
 xen/include/xen/fdt-domain-build.h               |  4 ++--
 xen/include/xen/iommu.h                          |  2 ++
 5 files changed, 26 insertions(+), 9 deletions(-)

--=20
2.43.0

