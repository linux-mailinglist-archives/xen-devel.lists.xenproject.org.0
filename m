Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF29AB0F684
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 17:08:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054352.1423120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueb4i-0005Dr-6v; Wed, 23 Jul 2025 15:08:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054352.1423120; Wed, 23 Jul 2025 15:08:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueb4i-0005CD-4G; Wed, 23 Jul 2025 15:08:08 +0000
Received: by outflank-mailman (input) for mailman id 1054352;
 Wed, 23 Jul 2025 15:08:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VoQP=2E=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1ueb4g-0005C7-AO
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 15:08:06 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4e49597-67d6-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 17:08:04 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by GV1PR03MB8733.eurprd03.prod.outlook.com (2603:10a6:150:8f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 15:07:58 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8943.029; Wed, 23 Jul 2025
 15:07:58 +0000
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
X-Inumbo-ID: d4e49597-67d6-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sQPTMUJuv0sclrzemiRPUZcTnb7y2mvJBOJ5sEPbeHQCS+vTf9gcoK7joyxE387fhpedSMN7BKIzEXvwz5cM0E4yR9orWTBMEToa0uIpr4Le6lVJdBrvKt9DNsZFKggE2yeC6eEookDveZl5UaN6eoH83oGFHx8KoNIlQ8CcTDLqig5eHOTTukVWPiRLUqlyNdRvt/wMbfcgHx/izIb7yDuPMTwPx5wI2/b3UU+T1pbfVSQ97jyyw/hg6MxSmlfVrzHby6DcN5ZMxb0fRBBjsfLDDIB1K4TRecKSRVmsDojfqMdzGABV/L5E6tqjoO4lcnL4e1kjXmQJspx9IauEUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gdWhsV1Yxas4Sn+wGI4UySdFAmdAWWS13OXLbbbk2O0=;
 b=vZhsJeiWDy/BZxc7kgubo0NMjZ5la9Jxrf4pjQGxOxw5BgK2SNxYncR5sQhJx7/0etzRvd/XWpjGRON022lfmRe2jX8UZZKQSoeINF6/ycjxWDR5TXOZXXvDcGH+lLYk4t+WzyRjd0WlWVMod83pq5vuY7vvNHIBx/2ZiFgKFIu/OMBBoa9jgSAZ5IdU1JLG5b5pMEcBQancPG9p7WvcjwtZFnvXK4IIo+53b5Eogs96L8JRIsT2bDo5WcCJn1yFdhKAVysFzkSQyedGRNT9lHHekFpf0n67r5Hsq9r7R37PhG6LDFqc8zyvFQvMl+vIQLt9QU/7ylTOkGNtYXszSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gdWhsV1Yxas4Sn+wGI4UySdFAmdAWWS13OXLbbbk2O0=;
 b=NxVmGcUoC3Ai2gvUqrOUPdJVESIBZnLIotjJuvYojmsjM70LfWSqdKhX0QWe2y5Mwg4suYcgaABLnsHHr/51TwOTkq0wGjp/QvnLTDO2SII1KeL/dwUNw6IqXB64F3Q8Tr9h2CiW9coU0Tb71RzGevAjeBBIIafE0zkfpgSvaC1gxc0/mxczkWjsUdIlci71PLJNNnhy4pX6ABoYWOaozpDWyvO+OxkUDK7HdfVJ5hqYa47dbgeXaMIhCKHw6IYZ950dkEeevuMWitebkPzz35M2xMWwYsTVysCtEuSr4r7ewjaVcC8OlV9TOObYeVxsCq3RJQ6zeN5TS5TS0fGhRQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2] automation/eclair: monitor rules 11.6, 17.2, 18.3, 21.11,
 21.14-16
Thread-Topic: [PATCH v2] automation/eclair: monitor rules 11.6, 17.2, 18.3,
 21.11, 21.14-16
Thread-Index: AQHb++OSR1IPVyyv8U2dW9yY4SuMsg==
Date: Wed, 23 Jul 2025 15:07:58 +0000
Message-ID:
 <35b3116fd3d4681ef3cf80a87b12c66055ce4342.1753283164.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|GV1PR03MB8733:EE_
x-ms-office365-filtering-correlation-id: c464b2f3-1b7c-4ce8-b805-08ddc9fab582
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?+6jDpnaPjjPBQGHkczjnS5riWSuRgNvCja1gQ8XRvXVXHwl337cTGIGwYt?=
 =?iso-8859-1?Q?YS5EQkO9LQkca+UVCjjHAAmhn6vOnaCFELHGBU9ax0GV9EtxGLVDiU0n/K?=
 =?iso-8859-1?Q?8x3JXMH4F7uTpkGze0k/5jzcMrWwl7xA2oRMfacWEmL7lzzIMlGagyqbks?=
 =?iso-8859-1?Q?GcYoFpFxZ/7VXxcCnc86P178vUJX+5ZMiJqoInALIcy8qsb6erIKQm/gIA?=
 =?iso-8859-1?Q?dot+2TpI3NyTTYModryrMeNkL+cuoabf/GCyCNjP8tfTbeu9BLt5RTJNdo?=
 =?iso-8859-1?Q?G6KPltdfjBghFw1sazGrq4Ln4bPRs/a0b06yOx78oX9BO2RVrpLiTffUSe?=
 =?iso-8859-1?Q?WR/dfTxEAM9kaGPMHv2vJOxFT4awbOrt8DDhD2XH1ELxORkp3BcU0l4IKj?=
 =?iso-8859-1?Q?O4y3PhbFsDSwmlrtNh1T5qlWgywFpLVSIjHTLYZA5WG42EsiwtjbEWEYPj?=
 =?iso-8859-1?Q?XsgShALXNig3vEWUp5F+PyezCEE3WnNkQvbWKSEpM2C/io8qQ/sqTXzOa9?=
 =?iso-8859-1?Q?fxy+us6QNLr/Hc6ghIPLQjZuI+F8s9KwGyH3OfmlKAhnWTWhwHWAXm9jaA?=
 =?iso-8859-1?Q?BYXykQaKPpwihXNfpdnah5GfG0cx9IE41KWMq6EZY/7Nc5xTb+5BYP4JiU?=
 =?iso-8859-1?Q?G301tLUnob31VKwIQx1oOTcHOM7M9wiUno2d7KOgkLFqeH1nwqoJlCmqlk?=
 =?iso-8859-1?Q?nRNcIkehuT4VjEXV0QxXCbPqWcHFXzZJLoCjlXscSffjr94yS60aP3ES0Q?=
 =?iso-8859-1?Q?1KXt1mNp+tT/1P2rymFkzs7ivgriNBbkl0lhVSKveHtc83f/oVIwiwU6KM?=
 =?iso-8859-1?Q?LS3DTX65/QtY0Wjm9p6YzvYvaaesFkQOcmLr+ntUAiLkabJktxe9YJ4kcl?=
 =?iso-8859-1?Q?DUO6tiyExpGtndnAmHQhcPMhOrFG+BDXGii9fBOAOO3pnDoMKp3V3gcKLJ?=
 =?iso-8859-1?Q?k8N6TIw1nOBvAW+9uIp268oOVlkkIUsOtTNQdYZqJjKL5c7ohfaYlVGbl3?=
 =?iso-8859-1?Q?VQS2OD4eYxUaNZkNYzXADoqKfOsOKFTmkz0HI7jaUsMqo9q+8gp/BHfyA6?=
 =?iso-8859-1?Q?rBsdXY+MT7i6sskNzk58utS7P4YV6TFBdu6ChjiL87oS9bpHK8g8j6sBtm?=
 =?iso-8859-1?Q?RdJLTNIWWI3uKpk+VR2UAwIsDmdOTW1KCIKxOcij5LGVlE5u6oFz1VNtcU?=
 =?iso-8859-1?Q?MOuevZWwL0Zzg0MSAAHiMIyPp/vjnYxIOQYtpOfJNG2XI112CRoUUCGuu/?=
 =?iso-8859-1?Q?+X8qRUMW6Yhou07+FnpRCNudSdYjP7vbKh3ooWufwQqW/YpzphzoEtLLF4?=
 =?iso-8859-1?Q?W0QX5VjmBvC7vEcFBMbktZM9MaYxmgBMy/ugFWSqVaZ9Yl34KZyALeKi1k?=
 =?iso-8859-1?Q?tTtF6gYb+hH8YTLzzlHqsjGp7p9TsDOjZEie76UHYld3ToEX9oYFvwy0M1?=
 =?iso-8859-1?Q?9HO2R/IR2aNBiRlaWMcys6zHU2eZJkzdpHq7Y5jVhZVrSPwJ2bAUJ0k5m+?=
 =?iso-8859-1?Q?zHINe/OWmDbLh7wnXSqXpQq0T4ygseDSyUHOyUxxTgeA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?czYI9jCklDFo6CJ+FkBAwM2hbuFeOlChvTmS1OF6fszRYeindxWhqFeE30?=
 =?iso-8859-1?Q?dAYGHa5NDuKWAg7nJjHyBBWA//PFjk4h4Zzv0/rUYNfpzTnGID5IOUVa+U?=
 =?iso-8859-1?Q?WH/waKmo8ZbAMVkOUDO4HBZKz+VpvKQ8OE4YpH2jqVv1AeubGIOUegd0Pt?=
 =?iso-8859-1?Q?309/aF4COd9y5Z91vz8njwg4DQD21HAZD5dwKMHaUWxSpeqPSVXpXpiQ+6?=
 =?iso-8859-1?Q?aIfjRc4x7B0jygb+yIaH7/h/zc3SwgU5ryvoSJhIkZNKoMOX0BllFsinD/?=
 =?iso-8859-1?Q?y9oLDpL1TLrdboaEX+QCpcJV8zL/bwHHG5TfPoNstKlsEVEzEX9/XmleBJ?=
 =?iso-8859-1?Q?4Z5gfAl6iP25jk1j2vs5ZjeJW+BaynDjqjCb1OHQ4W/Rp/JFO4hUoXBKE2?=
 =?iso-8859-1?Q?A0BWsFOrRhWe8edLxnYrJ6gjdYqaPrwbJe+Mmfqvg4rw9Tw7cZk1gsDnaK?=
 =?iso-8859-1?Q?gZbbyqD8zDfdO3aHApFFgPEfovw9UCqdR4UM4zos2lf0ZKpCJ4h0gGIzbd?=
 =?iso-8859-1?Q?qgPjcQEUV2k2ccBEfFvBwgnBpWg0iz7xA91Ukrm1A+C37JZPBdmZeZC6Jq?=
 =?iso-8859-1?Q?y64fi7aFliTAzKpNeG5p1xdc2AkmGax4uzjQH8DOyKRZgddUWeXMiEvN5L?=
 =?iso-8859-1?Q?WT97sB5oqMmcuDnZgJOYe6RJWDGDN84EjjQB69I5d8eXHNgYBfxyiiDfaq?=
 =?iso-8859-1?Q?zP8/AaVSd/8q9hokTY/2A4qH0nnY24p2sGzyTj0hB10sTrr+buGD4zSZKd?=
 =?iso-8859-1?Q?C+n/acffzuT1gPN6aXUKtm/clmSvh3ZQ/sTDs8kgKT1kS9j3BJ+XVDMjh5?=
 =?iso-8859-1?Q?RB6nXX/jzhI+GsWB/ylOeSA9sxcb5W09Yktb0hkT4n+6b8KMTETSJMSsZH?=
 =?iso-8859-1?Q?ZtppYAejU7FGm+cCA7mqNi78jsPckmDuGTjTWr32OjH/P0LS01av+CtjcA?=
 =?iso-8859-1?Q?NIBV2P8fXuZGJ1prqlGXbW35BLpUc4T7WVrD8nL64pvm5cCYEI8a1YzDMH?=
 =?iso-8859-1?Q?tJ8P/YykvjlD2GOp4kQIxtZ7p2l2Gl00bj28eFVj71pdpTkiaViM1M9MGF?=
 =?iso-8859-1?Q?HDqcBOlYXAtBaxN7XEFhr5niQCqqugW4r9jjV+k0zwEarL8ftbFA3O4siJ?=
 =?iso-8859-1?Q?XUQXLuxIWNfjgNeqwpjYkQsqy2dNeQJ+HTLbWpzL3OT0ZzY8GcG2tmB/td?=
 =?iso-8859-1?Q?cbvqgx/aM6ni6qr1EncTNXj7K2OpDj3CO064AUq9nIwJ3ONNbnaqfbC04d?=
 =?iso-8859-1?Q?5aDnp9fry2g/lBSnp6GCBtj0e/BseudqiB/hxk4kKLdwtlFauguqd2Hzx0?=
 =?iso-8859-1?Q?yhZPeBA2LRkCQNffygNKU1CssBa7Hu6lf0naE4TseCg56tJfdO0K0L/ViW?=
 =?iso-8859-1?Q?je0IlPfEBklqbhG46Z/GetuurPpVJv1j7kMr53mQH+B7K0CvQjGGM183pw?=
 =?iso-8859-1?Q?3mlQANpG3hLXVaPwOaQwD8QESaKXuRZyLgnPtUhua7cQfnW5TRLS2Ym+2v?=
 =?iso-8859-1?Q?XjwOxHPoFF5PAg8i5SLfmMgjAcRkw4d0+JCzDZnKjl5S0GBLhUrurw2AwU?=
 =?iso-8859-1?Q?1HVSmh0dSQJgBXlJibruonE8iKElIGtaQ7y0DwOw9E0pz0VuYm6roTXOY4?=
 =?iso-8859-1?Q?XcsNyDCvl3eIgyOPVCnDYHZE2O+agz7paCXqAl6uMMg4W/VaAvnCHRkQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c464b2f3-1b7c-4ce8-b805-08ddc9fab582
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2025 15:07:58.0319
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TLkoYBvXw1zbXb0Q/1a3/y3wjPPuL0lJiNcUI7Z1X1TKOYy3pmq3k7O/evBWsfouxYh1/c6hv+pWcPVMnoCVv7/75fRpqPJcBMMm5qnNnnk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB8733

Add MISRA C rules to the monitored set.
All these rules are 'accepted' for XEN, have zero or few violations,
and should be enabled for the ECLAIR scan.

Rule 17.2 is enabled to prevent accidental direct recursion.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Changes in v2:
- updated commit message
---
 automation/eclair_analysis/ECLAIR/monitored.ecl | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/automation/eclair_analysis/ECLAIR/monitored.ecl b/automation/e=
clair_analysis/ECLAIR/monitored.ecl
index 00bff9edbe..72698b2eb1 100644
--- a/automation/eclair_analysis/ECLAIR/monitored.ecl
+++ b/automation/eclair_analysis/ECLAIR/monitored.ecl
@@ -45,6 +45,7 @@
 -enable=3DMC3A2.R10.2
 -enable=3DMC3A2.R11.1
 -enable=3DMC3A2.R11.2
+-enable=3DMC3A2.R11.6
 -enable=3DMC3A2.R11.7
 -enable=3DMC3A2.R11.8
 -enable=3DMC3A2.R11.9
@@ -62,12 +63,14 @@
 -enable=3DMC3A2.R16.6
 -enable=3DMC3A2.R16.7
 -enable=3DMC3A2.R17.1
+-enable=3DMC3A2.R17.2
 -enable=3DMC3A2.R17.3
 -enable=3DMC3A2.R17.4
 -enable=3DMC3A2.R17.5
 -enable=3DMC3A2.R17.6
 -enable=3DMC3A2.R18.1
 -enable=3DMC3A2.R18.2
+-enable=3DMC3A2.R18.3
 -enable=3DMC3A2.R18.6
 -enable=3DMC3A2.R18.8
 -enable=3DMC3A2.R19.1
@@ -83,14 +86,18 @@
 -enable=3DMC3A2.R20.14
 -enable=3DMC3A2.R21.3
 -enable=3DMC3A2.R21.4
--enable=3DMC3A2.R21.6
 -enable=3DMC3A2.R21.5
+-enable=3DMC3A2.R21.6
 -enable=3DMC3A2.R21.7
 -enable=3DMC3A2.R21.8
 -enable=3DMC3A2.R21.9
 -enable=3DMC3A2.R21.10
+-enable=3DMC3A2.R21.11
 -enable=3DMC3A2.R21.12
 -enable=3DMC3A2.R21.13
+-enable=3DMC3A2.R21.14
+-enable=3DMC3A2.R21.15
+-enable=3DMC3A2.R21.16
 -enable=3DMC3A2.R21.17
 -enable=3DMC3A2.R21.18
 -enable=3DMC3A2.R21.19
--=20
2.43.0

