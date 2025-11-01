Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2C1C27D2C
	for <lists+xen-devel@lfdr.de>; Sat, 01 Nov 2025 12:57:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1154896.1484582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFAEJ-0003PQ-KW; Sat, 01 Nov 2025 11:57:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1154896.1484582; Sat, 01 Nov 2025 11:57:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFAEJ-0003MS-Fl; Sat, 01 Nov 2025 11:57:11 +0000
Received: by outflank-mailman (input) for mailman id 1154896;
 Sat, 01 Nov 2025 11:57:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rLmn=5J=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1vFAEI-0002Ar-2y
 for xen-devel@lists.xenproject.org; Sat, 01 Nov 2025 11:57:10 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4575ee5-b719-11f0-980a-7dc792cee155;
 Sat, 01 Nov 2025 12:57:08 +0100 (CET)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by DBBPR03MB7130.eurprd03.prod.outlook.com (2603:10a6:10:20e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Sat, 1 Nov
 2025 11:56:58 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%5]) with mapi id 15.20.9275.013; Sat, 1 Nov 2025
 11:56:58 +0000
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
X-Inumbo-ID: e4575ee5-b719-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ii4x2NAUlEgfK30z/jJSSS69ocZa7VVPcIe9O/7HUqzCAqeiQUS6JdlKE9Tt/yTlnS4JcShtTtODFFEk5cam88Q2v4E/7IvoMuNGnLZXgDSSCWiIGuloe/5uel0f5zmzHFDW3PtxiZ9lmKV9dfdmlMWa3mRoyICPkA28idY4UeBNR3oFXHuGXHU3L70+blJT3VtxeXCsw9SsXKkJgGIwDf0Nh/Y8iwSLgWwkWVQ5Bp4un9PcStglywObgF3P+R6ukXo2HxaxP3y9oQ+aJkuUDxxUxiATg9kmBEcSPGZUGc3yralIE20iTsbhUHYFY05Ka+81ek0PnBFEsBs09q99SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W6KaeGL/ozdDe1zYV8MxRWrxwFnXOEXM0wJwDhyqRUw=;
 b=niC07Bied4WSJMKG5xMuEMoQk4WZlDvQVd2kwiQ6V0Y/kgk61Ur7sBxgSnhI/JYlttXNPXuA8ll9TH2n/luZ4nPwZq+WNyv3ICRNR94EPTaHXCAcAGE7ggtfdT2ulBtyaEQ+KNmHMDXq8Y3ZuRyGwH95UYUP0JsqeCpPfWPfWJkSBb5HnhZFywUgRFZpmK+mVPTXzYDKcMDki6YRVGM8uS76ZoDCHV43T7HuUif1CVZEZl0ch6Sqls5VTvF/VXuekdNNcdVmQ9f2wpWTWphBhY7o86snvu/7jgsc74ESFFy2Zxg/asHf60QSJ+DMZvjlRtQxKnNXSrvvUKkZHg8P7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W6KaeGL/ozdDe1zYV8MxRWrxwFnXOEXM0wJwDhyqRUw=;
 b=J3sD/UdrKonMFV5bbBn+ywAqAN8miYW/KS6Q5KeT88kGnqB1y4bEv5S+XxKi+UJsQ1gkk7MtmNsento2107yv0BibwD6jed6X7N+FBKr+6zR6gGLCIC1Vk+llpwewOHSvCzjsvb7bO7r6CwkJXV4vbeD+Onx5qbxAgO/bGj1blYqj0TkVDPQLjbRn1rNJB7xmcrWbY3fzeYnUzDAbXoHbt/Il1fo9FK46K3PrfG+SlGHhSnUv/TC1eOs2XYmZ6LeLkrOHYZ1POw4r5DRPYNsVY2yk3DFASJsFo4DwibIgAVdLd2Ulh0pugIeFHTBizLxWAMh/G3Jya0Bd2iFzTxiuA==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Grygorii Strashko <grygorii_strashko@epam.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>
Subject: [PATCH v6 5/5] docs: arm: add SCI SCMI SMC multi-agent driver docs
Thread-Topic: [PATCH v6 5/5] docs: arm: add SCI SCMI SMC multi-agent driver
 docs
Thread-Index: AQHcSyag7wGCc3+7TESSMpmt+RnGqw==
Date: Sat, 1 Nov 2025 11:56:58 +0000
Message-ID:
 <b76197db7898a3feb9d7fcab4b5506855aaf8c00.1761998077.git.oleksii_moisieiev@epam.com>
References: <cover.1761998077.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1761998077.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|DBBPR03MB7130:EE_
x-ms-office365-filtering-correlation-id: 969c4652-0190-4213-bf08-08de193dc2cb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?KUONrZfVyNXWEzj9Tq/jo9DyBzyFip4n3x9hVUUb+3qM857LCsref1ZTB4?=
 =?iso-8859-1?Q?9vNeIiKSPUujNGoZMH7z4z5mREhAMKo/GaKDJqgGVAA9P3+FsoYvV56kM/?=
 =?iso-8859-1?Q?M0E+eve3djhgqpzrXdjXI/D28ESM0uhFEaItRUuOfCgiaRVc6HFX9+EOKU?=
 =?iso-8859-1?Q?a08pL3N2rEmj4s807vsThknIYljSWBq/U8NwPH8nUimEz/IcKu8qLwiEvY?=
 =?iso-8859-1?Q?4oXRR5ur/yNMtn1oCJhhM0XPCsCPSI89eB9JcN2ybEd6l5rIKc5MiP+is5?=
 =?iso-8859-1?Q?FyFvxveLXyun3h/TGveMnvyC6is5sJINilix4LbEPJR2K/Y5JHxeUrxaIJ?=
 =?iso-8859-1?Q?oQEG9b/efhuFO3G643t+DtHNwiWmsPLbZDo/NiIc+gGxFdS9gm2kknEV1u?=
 =?iso-8859-1?Q?A9wQHgs5BG/UYpCfIACRn99DlAdOs9Wn4yhr1+4GN6xZRG0/elzKpEimqi?=
 =?iso-8859-1?Q?0WECbhAIAzjvgUEQYcq7HC8gwDkbObGUUylkrtVhEcBdjHcQc84BZ/6HJr?=
 =?iso-8859-1?Q?Bdjc+j83DLqeuJywJu23UD1NHMA5ZLivH/FXwPOH32STspFIJYMzxkowZ0?=
 =?iso-8859-1?Q?uzTTUQG/fxcAsvBiHOpxCVTvDIJyLYNMqyQX+eow5NPOMGQ/8r7T08zvcF?=
 =?iso-8859-1?Q?mzq2B6o/anvQ7ghVxmtmPEOM04zimQUBB3rhUxUepUvtxElJiQWnfqujPf?=
 =?iso-8859-1?Q?yPqKuUCT/YMALtzl0stBprPqNME1Yw/v0Zw8pXQipkZjVxM+x3R6O7VG5l?=
 =?iso-8859-1?Q?5EBwVlO0jWBsH0UTBT0Pf5KnVfDahjhJG9224mjgy1gk5bCY0i1kY9eKwV?=
 =?iso-8859-1?Q?sNxmAbJlCFkvRNmJ//7lSwr84EEEkUzB3mcvAcPaTDX0XjqdsPhmEcBqN9?=
 =?iso-8859-1?Q?D1vwOabB7+e4nwMadoqd3z0764spWfWQCVZA3XiiWCW+ODpuh2JwJRi4JG?=
 =?iso-8859-1?Q?gGo8MeV9TvOjn6GhfQk5VHHC3O2kcPqH/HWJ35hvoFDunBuJR5+QVjj7DT?=
 =?iso-8859-1?Q?p+BgGE+7rwKz8r/cDTLbcfS4AR2ODbKKMhXvpI3hUiV07XfB7nHxrzhzay?=
 =?iso-8859-1?Q?6Vz+UTqHXQnWNb7gNHw39p+c0OWDQauh2dYupVkQ4yAanwymdw24hk0zmj?=
 =?iso-8859-1?Q?rCvRzmcREakCcmlS+JU27EsPMJxFN1cLQQXgyCNqBmS8PTHGFU+slzKYFb?=
 =?iso-8859-1?Q?vR+TCbcJW/5hRpTHDUs7/7JGNctKaY9grCAKobztX2iTyuLJWhXK0RJYjK?=
 =?iso-8859-1?Q?YsLQilQV/e8ccn+wbg2lwwMipt+ll9Ya++/qbmP7qcojsRT9AQTDj/FOSm?=
 =?iso-8859-1?Q?m0lbwhoq7+fsWyQ5AfsmK779sjQPEcgpWWbQ4FUiAGEuiwMO8uvUQlxqFv?=
 =?iso-8859-1?Q?6Me/hIgPAKTkMHbBdH2hu6fxYZlBIjASk9TepL3bRLBWFYD52w8g6NQIQH?=
 =?iso-8859-1?Q?gPdo3B6pKyDh+kqA082723lUhhgkZU/MfSG47YMzHkyFtiVddkF0O2yGho?=
 =?iso-8859-1?Q?tVnXBYXkmnsa0Hqw9meCi66ksAFcBlpCrEGTdIeSI+PDa8O7aHSi4mgKK5?=
 =?iso-8859-1?Q?R98hD9ZIN3So2IbqG0agkNEf2OyG?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?aKl4K1WD8XPYl+Z5v25mu2ClPqn4S27lQgIWXNnNevGwzV/Rq0rMggrigP?=
 =?iso-8859-1?Q?vBCYiL4TYsdva6qmc03yWBCIl/k4KfO+lECwA4Fk/KVYZd1VKafaDDa5q5?=
 =?iso-8859-1?Q?2WAROFHdHW2yRdyKvX0MRhUe4DlmHiULD8e7xDCjyRt1BFsiJiqT0jegO6?=
 =?iso-8859-1?Q?nfA7Q7xVjCiVz3l6f5SEAJFdml5EM4aC9pfqAnw+DpBr5M1UWvtnUh+t72?=
 =?iso-8859-1?Q?DROl1kayt53+b6lvW/5KDsGVn0A4s/LruPvxhISPX/c9UGUx7noOUCb9ok?=
 =?iso-8859-1?Q?yQLGMh2id/euXJoixlQ5pysLT8S1k2Y8DwMFDrHq4H0rdKUJq+wThTFPYB?=
 =?iso-8859-1?Q?rmhNBKqN80iDSCrE7fckVC3xk88j3aUBPXni7dXbqVtSJLLZg+F2Us/LBM?=
 =?iso-8859-1?Q?LyEBadU7m972QNHN4K6WYBJgYU2Kkz9+RFOLgGND6+vOnq7RtO3/JuDAkL?=
 =?iso-8859-1?Q?mlAotsqSWGm6b4feI1PjLSHXDOSB+qgHPsHSjF6G7NxsX15AD4oc3pFVax?=
 =?iso-8859-1?Q?eW/cgTW2TyF4N0EF3zIBqktUHeZIkUkMWMKW7AR41ry+wE7yjc+PghDGMN?=
 =?iso-8859-1?Q?M+Y30HcZUdpIjxa02H+Ujo8rTioBdD8zqL2M2q96YGTQD3Des9gUt+U34M?=
 =?iso-8859-1?Q?HM2TDPI0x1Nf5GNNDU2dawml90moqL4azOR69FTiRlLFOm49rkgjILHITD?=
 =?iso-8859-1?Q?cJHKJXXNEscy769lATIl0ovRxpx/uhCZmYvl+w5EyQMyCkG2W+cTxp4ojd?=
 =?iso-8859-1?Q?1YyLGfxqHS7JklDPg5BwNRiodmNbCgx9pMWhyBOpwcAA/3ELbUfiEL223B?=
 =?iso-8859-1?Q?truRfLwEi9gckNmtxmgFbNzDpLPmQqF5qlfRWHulRSF+EJ/0D4sOL9Kx4Q?=
 =?iso-8859-1?Q?m026QFhk4htXGD+Ay2rKoXsBPlL9W2+nl+WOfpj5SHXGlOGNcZftTs4+yc?=
 =?iso-8859-1?Q?GrbBg4xPSWPLCcKGWaxC1I3lLnlEeZSvXc1JbV4ci5ORsI/BJsnqKxd4hU?=
 =?iso-8859-1?Q?FZJBqNVgOHRwdY5C01OFa4BxDEkylm+9AH043k+JMG4BIO2WJ5OvXj2bUq?=
 =?iso-8859-1?Q?quLGCKZ/ffJDmzL68bP73IsuYyM/YF7f0L4e3p4OGfJPEDk7rTi8f/p2At?=
 =?iso-8859-1?Q?fJFxsvwuCYGy+ySCdDAndKNxUWMaKosafWtDmJ22mWNvKqLCONMBfb0Z56?=
 =?iso-8859-1?Q?o8lqfP8+eRjRIzXYGFfNnGb0+nZP8whzDxb++8Ydb7zsQiZ/B1/yRcGy0U?=
 =?iso-8859-1?Q?qYqwGVhEoHAIGvNedYFb2kBy1o7X4M4F3Rl+vN0FbVCQjQQ716zopYrd2u?=
 =?iso-8859-1?Q?N6otYkvte5oxNvFgZFMzQzmAoCDfZ9LzD0IvEltYT7GyVuXjkeDMiHU8w9?=
 =?iso-8859-1?Q?Hm3aTu+TjARUYSaT0/eznQJldfWm8v2UvAXuarWleKAMKzVXVA7/dg51Jr?=
 =?iso-8859-1?Q?FzoP7QnDTXSe6W5I0yoME5Q0QaRFrr5jI9ZaCz97z5XkeNCcJ7NUM7O4Qj?=
 =?iso-8859-1?Q?gYz7HwmdI4AbDovEtXDZH999Jmc5PyJerZigFYFjZGxuymDEcihJbHKVT5?=
 =?iso-8859-1?Q?Uxk1ye7HEwVbNLxjSxiBw5Uoq5y4Fx/YLf/GknFlwPH8xH1QTna+z5hQ4+?=
 =?iso-8859-1?Q?vtKhJ/iEEW+QIL7pLzr0ahLsFPgdnP3ZyRiLblFWBbto/ndVY5MGAxWQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 969c4652-0190-4213-bf08-08de193dc2cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2025 11:56:58.4662
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A5d7Rgj9+YczjHgbVsAvsHvFlycZ3AQwchwpGnXbXZT2TqoqlDJSrTZj36yX8E/KI+jNBd/kt/FfWIfaQLJuelG3glYiw0ZcINRVoQnG/Xo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB7130

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

Changes in v6:
- remove all HVC mentions from the multi-agent doc
- update sci-agent-id parameter description in the documentation
- add missing Sign-of
- minor fixes across the document

Changes in v5:
- rework multi-agent driver to leave Host Device-tree unmodified

 .../arm/firmware/arm-scmi.rst                 | 341 ++++++++++++++++++
 1 file changed, 341 insertions(+)

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
--=20
2.34.1

