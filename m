Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 499F2B167F5
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 23:01:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1064476.1430081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhDvP-0001C7-Rl; Wed, 30 Jul 2025 21:01:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1064476.1430081; Wed, 30 Jul 2025 21:01:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhDvP-0001AS-OI; Wed, 30 Jul 2025 21:01:23 +0000
Received: by outflank-mailman (input) for mailman id 1064476;
 Wed, 30 Jul 2025 21:01:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6hfZ=2L=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uhDvO-0001AM-7P
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 21:01:22 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52cd6ebf-6d88-11f0-b895-0df219b8e170;
 Wed, 30 Jul 2025 23:01:12 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AS2PR03MB9169.eurprd03.prod.outlook.com (2603:10a6:20b:5fd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Wed, 30 Jul
 2025 21:01:09 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8989.011; Wed, 30 Jul 2025
 21:01:09 +0000
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
X-Inumbo-ID: 52cd6ebf-6d88-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UtJ+5WLS+tBn4z8y6aG1o/W5yuUNs7xLdMjWmTK2P0sVHKYXIclM7j3eNVxcZO9VOyIncuLJrXMdBnQzfcalsF+bN8C9mpMQP2z0VyoYdthm2iEKBiy8g8G0mQArJ+pdbr0PAKcPKwLJhHtEjxQtpmJEy3XgWW1jSLWeJ89Ca0y653AXpqbvmuShE2YlRc035840QlL7hlyhHI9QG2L2YarEU0MlmVB0Ee87nuzTr3wTiYldX6reQzZJ8aO2KIZhkH8VjP2jiYnGd+PNrcOFnrwA84/X6coKDmyH2kJmZFpm5FiOp8RYR0N6dlhIhGBt21/UThuZEpUcKIjzauQSVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OgKnjFvbI6oMJM/emT+0Fjw40iTfZrjtqgE6ge5bINk=;
 b=OGjNd+mU7R1YupLo99DpKpUF/qv/IdUHfmjnmU2RCDGfxJHblIX/kVTtpXpy+Lmtu/FXSnHUwb3CUmuWFbSFJDgUZc2wkwygc3CvMP9Hnu+MLZ8rICMPh+8QUDmraavxWYofYCozbSXwhjBzv9nTbSwETBtDAFNPieD6L1bYGuZb/e6TQmWYl3e29/yjlCvLFwfGRnAgKFVEqX6wiII6bdVjaWSJ+FCuBXL6QmDYyuAvuCbTFQ24vfKV5Xq9vYJtEvEMrQxrgXcuF7RgPEKjh54/ckspKd8VmYguQnjF6uWVEm7IaPB8cjDSE3TFowxfzUbIAGcehT3WNImZDd8GsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OgKnjFvbI6oMJM/emT+0Fjw40iTfZrjtqgE6ge5bINk=;
 b=o89wNV4yb5Clmb1kQJYLUio3zi/+afkHthNLJ6NFtS7sBCMkrCt9jMyzDiy+DWNlRpiTuVBULcQzUUvVy/Vny2FgquRi/jZ1gCIC3LYciUXY6+ONLGKe9r1ETV+vITo791sxj5o0fPUnIJjWIuE2T742BSW8QHTOV1RFysGd1a+KLvBileRqMNowZutFMIWLULC3FZvWosHKaNB06PHxb6DBc3Ewg3msQLoqrhX2GwsBTa8ZGW95/iIXJfVimEbE9CVdjAVgxwG+ek/MS2au/6x4+abfUKLA6GN5gDLB5vTle2Wqfax1Zef9RwbGPGbPHg6j5hj/VmpRhoESZOcR7Q==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Dmytro Prokopchuk1
	<dmytro_prokopchuk1@epam.com>
Subject: [PATCH v2] automation/eclair: deviate intentionally unreachable code
Thread-Topic: [PATCH v2] automation/eclair: deviate intentionally unreachable
 code
Thread-Index: AQHcAZUSK5+HMs1h006/CQR5o1KpVA==
Date: Wed, 30 Jul 2025 21:01:09 +0000
Message-ID:
 <6e47d071ffdb236642c1e9a70118a86d41487aa0.1753909082.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AS2PR03MB9169:EE_
x-ms-office365-filtering-correlation-id: 509b95b4-a8b9-4990-0f36-08ddcfac355e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|42112799006|7416014|1800799024|13003099007|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?M30b402gol+D+kG7UoAjffgPVv7moX7SrokytgbDMCKtG40Ch49Kv1X988?=
 =?iso-8859-1?Q?50rcURSrjDlOk7+/ZpmB01GyGIBlL6c2iOd6x/9f1iy5W8ECEJp/hjmUFK?=
 =?iso-8859-1?Q?VIc02fUiIRN77yi7JSi4//9Nl3A7zY+5IzKbA61X/iEARegQJFP59FpeJ7?=
 =?iso-8859-1?Q?DcrSe9HYG+kXN+/tF8PMXjrfciZhw2QnB9Er4EmYqF8Wwoj1v6nh+ntxw4?=
 =?iso-8859-1?Q?DnFSfnNowvANYb8mZjD+8o018Zx53Zg2k8VntJKd+kyD54kaDGiPNwrh/D?=
 =?iso-8859-1?Q?DqfqJ6mGb3QLIT7YR94NRhLWeeV6C0j61Ieo0k+VscQv7bxzCMBlSJ2/IE?=
 =?iso-8859-1?Q?r2tRq7DSfy3ooUw91N37FR1xb1wOzzMIwRPWUjX1ifK9pczZAfBHeihoGV?=
 =?iso-8859-1?Q?ydvwbKFm5nzKfszXjMuTVZjmLbehoTMaeruHfqTZy43YhxOuV0ZH1BTINN?=
 =?iso-8859-1?Q?UYjn2zPXBH/aFCMleHFsGcOpGbTgCL10CVWR5F88tTkhJkeuTaRsqN5qhJ?=
 =?iso-8859-1?Q?btg/edyXZPzKCa/xxdPvSGwsj5HOxVeyb5lbWgMMjmDuRKztzY/qLjSChu?=
 =?iso-8859-1?Q?85Nl65h1q2j903dA8EzQebDn8yGRu5drtx2iuEPQjztx0LG8sH/hmskuLL?=
 =?iso-8859-1?Q?2+8Hnq3uAS/7y42cyMZHePf4XOD1AQd543+DI/yT4vOW6ejzkUdwMzLdOb?=
 =?iso-8859-1?Q?bzux7yMv2yXHdo9LWKcwYnY7z66mWuvR8TRTteTIP9f5QnnShfhD71aPJe?=
 =?iso-8859-1?Q?D2Zjn5iKomP1YanupYbSOe1ZxLpY/yAMIZAytFLIzUzFCRjRk9ktpHW8QC?=
 =?iso-8859-1?Q?M9Jv3oeL4/OpFwbaxpWMfEDZKhe/EJdszyn/d++cA/2gF0yBSC57Nm15Tb?=
 =?iso-8859-1?Q?h8q9BNiIh7equJXXYFnUFQH5fee5udip0jZBbf6lNnlaMGUetziLiPcrKL?=
 =?iso-8859-1?Q?7nWe8dnhtkfRvSy/Rc0o/K03WPeqtdrSsC6Jt51de0Rg3FhYqcnpe6c+eY?=
 =?iso-8859-1?Q?pl4Bbt8cgHKBlHKICQQecYS1PHED0doUWLdyR8iR6+X2d0lRKjyIPlXdf8?=
 =?iso-8859-1?Q?1bu1aoNoFrOfCx7u+oa5TBkD0Pyrc/Tp/UYKvDsPwdsNEjMEhTmgLbHHiX?=
 =?iso-8859-1?Q?6TILK0oaFMZhwCrLXfQf4Z6ryVLwxYAQLc/LoGOFppRJEGm+u0XkuEEGJx?=
 =?iso-8859-1?Q?+f2B4sxkcawuBsm4RiQ8e0xApkinIXbcYVpmpaZ2cGg+TEWXOnMYNqgWWL?=
 =?iso-8859-1?Q?liUvj9SKCwNBu2N49s0mcWK78dOcg/ZOLZKCW1Rt6iqAwfI9ZdJOudcoVs?=
 =?iso-8859-1?Q?KnPZfc69s1oNVEPK5IK1PSXe//t4dFyafesdYXyvxGR+fIfRjfmTn5JPaj?=
 =?iso-8859-1?Q?o9os7ZT+Xc4YDgw87NR83pV5r9sx1B39obzWYPEIffMQzPaTyr0NrRPGtZ?=
 =?iso-8859-1?Q?+dCDIpBtFhRYkG6XSdmEFZdMHP/VC5bop5vn4f6syOgo7JIPtRjjMxBQeF?=
 =?iso-8859-1?Q?w=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(42112799006)(7416014)(1800799024)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?5D3RCnVo0BvnZu4JOPfytfyVfK0WVJ8Zt8ZrKqybTD8y565KwOdP71YoFe?=
 =?iso-8859-1?Q?jPX8SyzHNH+DzCq7tHQJ6w/4cFI4EbSe++dmOQHUjikjU6VJluv5LnOIi2?=
 =?iso-8859-1?Q?CjfLNE1HAsBpT7Hk91kdveEtyCe7irpd47xHUG16ncuoquiUbMaYQ+Rxz2?=
 =?iso-8859-1?Q?WqaLaUER+fZW+ssaIHDGlGgSTkESwxNMXsvT0S/C18KE0ZF15EYYmHHDJ2?=
 =?iso-8859-1?Q?5lvf+FfbTYxpcy2sbgEOP6WqVHFe29uF6ZYACF4xt2QqC6ncSTfKhr6Vwd?=
 =?iso-8859-1?Q?gOtBQXY26U2pNdRiOjJ6DszAH0YGWFoy+RXpqFHpP129brh1GNcz8vavaQ?=
 =?iso-8859-1?Q?HuK1RX8rSIsCdLAw8+0gmDCrqf1O7jCb08goYPDUbT2A/vZV54dfOzvi4c?=
 =?iso-8859-1?Q?SfsSr/ETpGigb/MTqdjWTczd3kY4azpbqJ9nT/RHRL5Dox39R/QT6JlPHx?=
 =?iso-8859-1?Q?VePB1UHWKZOS5cNykzVIIZUxlFMkXm1TdXGb9/EQcNy5/4bv6y3tj6eVVN?=
 =?iso-8859-1?Q?58dOhWBFntoy7+xnaHQajJGyaBSAuJVfXS4UlweL/7bg56tQ8kBZjwTUe6?=
 =?iso-8859-1?Q?dMI0sq0k61i6MNI6kyOGaBYloyY8gONRUZy3A7rrmk10qay+0tMW1Hw33h?=
 =?iso-8859-1?Q?QnDH750ZfNm0iOyLLNiTyYUr8q1QR4Q0ADaA6blV5RDgSLwHYd6SwGi6aF?=
 =?iso-8859-1?Q?MmrSiozh7CJCTFAgh438ghEWbXg0SbsFS25dL1KczZsJjdMXtx4iq5qfou?=
 =?iso-8859-1?Q?yT5C7xOd8ShOAwfj9EL9NRMw4Lg2v5/SNgzYQadtRtOGJ3iAitfqIfoiRm?=
 =?iso-8859-1?Q?tORDQxIU3cV6/acDJYFY15fC5JGysWS3pzkrKTcNDaWfK+fG+2eIfgttQR?=
 =?iso-8859-1?Q?ugNk/PwVxvV7fJbTcMJ1seo1gXVsiBPWwc1rUj4/WqvA7fkLYUYVIf/hjC?=
 =?iso-8859-1?Q?6aqzgXFmg7Pf7y75gl2ZayIo8HOhm4xJJf0t2xlwgD1xRxD4T4WwKloqef?=
 =?iso-8859-1?Q?UcpD5dcBo0gxH8hEVr03hwheXO0SXq6H8IyhIuT+xdmrIY/8XNdFiikuo+?=
 =?iso-8859-1?Q?CzxlsOarjcIeWgtq4VfbzH9xuFxuQEqL9AJht1niSxDvdQ1UKKGyZpKRJE?=
 =?iso-8859-1?Q?2fuzBBuhyHLkXdqpIhWLENfGEyegWeEL4cHPJOQvIcyzjSV1SIl1Ih7jOp?=
 =?iso-8859-1?Q?bPr2Ak9jUsYnjLQVq8n498zwgFN7MBJKA7HeAg+fJ3hBZRfLE3Uc+QgKz6?=
 =?iso-8859-1?Q?RZ9CvY3chYtudPotVZjAWQ2KAJ4yEj3F0JZoO6YpiXl8VdVj4yiafrxH1I?=
 =?iso-8859-1?Q?m5WGffNq4FOMcwthdV2PjKgBUnZewZeMDkj6g7wdy0eGZYgLfHQym31Ott?=
 =?iso-8859-1?Q?DQ0xqiG9qx3tyxMEQRBFoTXelqeWvGdZmNr9dyMP/NkgRvNtEG3yrjeRrd?=
 =?iso-8859-1?Q?B1VpB8unLaA4s5mGVOzCCPEHFiR99prHCTkR8TjvsV10P5CmjLr5JPC1iY?=
 =?iso-8859-1?Q?aqDIwYTGKstu7ZMrsCSc/OPdTfj5XdVMZBDCK/rzXokWzohIjNR4EJ7pE0?=
 =?iso-8859-1?Q?ypDRCrBw/iD9U5xtvsXMpLIciJYXxM7ObbRCwzZinzoi1Ux6+s602/DRFA?=
 =?iso-8859-1?Q?C/CS3/ePfX9ppZypQcJDJacr0+QXOdy4zVt1hnLxkMOAdHUxhlJaLN1Q?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 509b95b4-a8b9-4990-0f36-08ddcfac355e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2025 21:01:09.2522
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cMYUvD77GZTuPfkbA2LyFLiZRqsE6eZfQ0pfi5wF1JKVLqNS3sbpEK/cmoiOilBGcN56awice6onFwQfqarcz6Ca3hjyLElOJA4WSk5VKHo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9169

From: Nicola Vetrini <nicola.vetrini@bugseng.com>

MISRA C Rule 2.1 states: "A project shall not contain unreachable code".
Functions that are non-returning and are not explicitly annotated with
the `noreturn' attribute are considered a violation of this rule.

In certain cases, some functions might be non-returning in specific build
configurations (when assertions are enabled, i.e., when `NDEBUG' is not def=
ined).
This is due to calls to `__builtin_unreachable()' in the expansion of the
macro `ASSERT_UNREACHABLE()'.

Conversely, in builds where `NDEBUG' is defined (assertions are disabled),
the macro `ASSERT_UNREACHABLE()' expands to an empty construct
(`do { } while (0)'), which does not affect the execution flow.
This allows such functions to return normally in such builds,
avoiding unreachable code.

To account for that in specific builds, the `noreturn` property of
`__builtin_unreachable()` is overridden in the ECLAIR configuration
to deviate these violations.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Changes in v2:
- updated wording according to the reviewers comments

Link to v1:
https://patchew.org/Xen/e699179c079df36f6cb4fdc7865a73cb9fe79f8c.1753881652=
.git.dmytro._5Fprokopchuk1@epam.com/
---
 automation/eclair_analysis/ECLAIR/deviations.ecl |  5 +++++
 docs/misra/deviations.rst                        | 12 ++++++++++++
 docs/misra/rules.rst                             |  9 +++++++++
 3 files changed, 26 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/=
eclair_analysis/ECLAIR/deviations.ecl
index 483507e7b9..ceecd0093b 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -36,6 +36,11 @@ not executable, and therefore it is safe for them to be =
unreachable."
 -config=3DMC3A2.R2.1,reports+=3D{deliberate, "any_area(any_loc(file(C_runt=
ime_failures)))"}
 -doc_end
=20
+-doc_begin=3D"Calls to function `__builtin_unreachable()' in the expansion=
 of macro
+`ASSERT_UNREACHABLE()' are not considered to have the `noreturn' property.=
"
+-call_properties+=3D{"name(__builtin_unreachable)&&stmt(begin(any_exp(macr=
o(name(ASSERT_UNREACHABLE)))))", {"noreturn(false)"}}
+-doc_end
+
 -doc_begin=3D"Proving compliance with respect to Rule 2.2 is generally imp=
ossible:
 see https://arxiv.org/abs/2212.13933 for details. Moreover, peer review gi=
ves us
 confidence that no evidence of errors in the program's logic has been miss=
ed due
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index e78179fcb8..73ff7c05b1 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -86,6 +86,18 @@ Deviations related to MISRA C:2012 Rules:
        generate definitions for asm modules.
      - Tagged as `deliberate` for ECLAIR.
=20
+   * - R2.1
+     - Calls to the `__builtin_unreachable()` function inside the expansio=
n of
+       the `ASSERT_UNREACHABLE()` macro may cause a function to be marked =
as
+       non-returning. This behavior occurs only in configurations where
+       assertions are enabled. To address this, the `noreturn` property
+       for `__builtin_unreachable()` is overridden in these contexts,
+       resulting in the absence of reports that do not have an impact on
+       safety, despite being true positives.
+       Xen expects developers to ensure code remains safe and reliable in
+       builds, even when debug-only assertions like `ASSERT_UNREACHABLE()
+       are removed.
+
    * - R2.2
      - Proving compliance with respect to Rule 2.2 is generally impossible=
:
        see `<https://arxiv.org/abs/2212.13933>`_ for details. Moreover, pe=
er
diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 3e014a6298..13cb3c6206 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -124,6 +124,15 @@ maintainers if you want to suggest a change.
            they are used to generate definitions for asm modules
          - Declarations without initializer are safe, as they are not
            executed
+         - Functions that are noreturn due to calls to `ASSERT_UNREACHABLE=
()`
+           macro in debug build configurations are not deemed as violation=
s::
+
+              static inline bool
+              arch_vcpu_ioreq_completion(enum vio_completion completion)
+              {
+                  ASSERT_UNREACHABLE();
+                  return false;
+              }
=20
    * - `Rule 2.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Su=
ite/-/blob/master/R_02_06.c>`_
      - Advisory
--=20
2.43.0

