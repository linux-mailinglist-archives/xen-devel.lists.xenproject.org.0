Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDCCB16858
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 23:39:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1064531.1430130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhEWE-0007nF-Hw; Wed, 30 Jul 2025 21:39:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1064531.1430130; Wed, 30 Jul 2025 21:39:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhEWE-0007kx-EZ; Wed, 30 Jul 2025 21:39:26 +0000
Received: by outflank-mailman (input) for mailman id 1064531;
 Wed, 30 Jul 2025 21:39:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6hfZ=2L=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uhEWC-0007kp-Ky
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 21:39:24 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8903b7c-6d8d-11f0-a320-13f23c93f187;
 Wed, 30 Jul 2025 23:39:23 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by PAWPR03MB10181.eurprd03.prod.outlook.com (2603:10a6:102:342::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Wed, 30 Jul
 2025 21:39:21 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8989.011; Wed, 30 Jul 2025
 21:39:21 +0000
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
X-Inumbo-ID: a8903b7c-6d8d-11f0-a320-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yvw5QbtlKQW6BYQZ69hO3v2XGHhleXkx07PtzhVtzc3ZnVqExFtM5vZ0wPIJPGqF8EYD5Y79Rm54mkCPYxTBeT9kjpSxIauCcGBpPewdWzyygIvnjtmBrfeMW7O3IKKTI4CKKF7TmPYBCbetlVYLTbth238ri3cLSWcjWwvsdMpIek6U2zZf0luEkIKuJVakHIba5BSkvQfBTL5+Kup7M92RcnZF2EM/bgjYf/099bQhfcipFy0zOQgqD/cWBiwj46tEhvyoSr+ypQ9lH6jcxlI4L/jWGwO74tnyU12x+fCSssjJznS8iaMRBEzyrtx9YdLeGj/bsh6JLYU1JhOxBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4L4EcZNrHZrPfL3NaDr2oK1yN+Ve4jexoADZtzlXISs=;
 b=Jq2weMOW/4bd8yU1Ktf2qFXF2BcBw0edYBX9GTigufYmUpSHbOLoAd32Db3Fo4IBNOplsEjV4ap5Rpnpn/nGqnfMtJ9TtoFcxO/er/5qYgWHPwKB1NURL+alDZrRqiW6Y1H1fOgGhf38u7P0znDE81uvvNJqpEJAr5jrbHLaaiMmi68L4QiYqadKku3EzWeGUVQuEBsTjNSNt1OdpAy5mLwSmkxNCClyfbTttMRVkMM1RpcpMVOpFI1dJ1EP6VxLVnjxSBeNZ7C5j+miQxWzeD5XHJfi5jLMeKo9+coazcxgbuYh4rV3Ztgp3lqhKvimPeJTioipejW2D8k3x4hVAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4L4EcZNrHZrPfL3NaDr2oK1yN+Ve4jexoADZtzlXISs=;
 b=BD0MgPmjweBaK6ZXEVAOk6gDF3IqHLzVZBY2lnMXZe/zI7/PpGH5VEsrouXHOg92Wtgf6QFm1WVvE//g2xUNvwj8X8yOHx0E3O3QhYXIGLpiGzDJirRwFaibqr3VFVQddh2FvlVy1H9vBMWuTVSkAEzQDwgFu9e0KxIOo2qXe0Dpo9fnPz/6t/ZCyBEdgGnzxvViG/8NEDpt4iOUPl9+5sSdFURo4IM3wiooS/3fhAf99pQWqpZHhpCp3ZPyVyEN0nIavEtQgalQz4xcrGi+BMPGLwJ1/W2dz5gkAP+RfGQP2KN/7/5FL6/MHWs0yOx6GEfrp7gnb9Ldr7VQmYCzJA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [PATCH v3] misra: add deviations of MISRA C Rule 5.5
Thread-Topic: [PATCH v3] misra: add deviations of MISRA C Rule 5.5
Thread-Index: AQHcAZpot4CSbqaxYEOVncCqeKdNyg==
Date: Wed, 30 Jul 2025 21:39:20 +0000
Message-ID:
 <e681e0c083d945f48e6d0add1aee32af16be224e.1753911247.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|PAWPR03MB10181:EE_
x-ms-office365-filtering-correlation-id: 0c7aaf90-f2a7-4371-8464-08ddcfb18b4f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?UhOXMBL2/hsq5iUz6j/RCEE0XC7iwLVcdH+d5dZJqMxmF044j03VuS/2Hv?=
 =?iso-8859-1?Q?zrqdclbPp/pIr8T8vHScMSaIrrN+eMuFwd2Mqnsjt6tX8UpbozPo9tFVbw?=
 =?iso-8859-1?Q?tB64ioMDwZo3eEuHkTEUnXWIhPFx10jBUWyRnNYOytW14qCHF8/1tX1ja7?=
 =?iso-8859-1?Q?Rabln+VqA/iIV0q74VTJoisDpc5Y7u4qiXuR+ysk1wjv5e1YXhVb9tyaLm?=
 =?iso-8859-1?Q?eZROvX7roELr98+GiyGW1+krP1Ua44runnYycH3Wqnm5BZrxtfrDMvw30v?=
 =?iso-8859-1?Q?xoi+gdYH5k2Z4siukp42W5oQZU1i4TkVB2BuakPzacxq8AOpKnI3XIiIox?=
 =?iso-8859-1?Q?swp3oWG+X4Ie2KZebt9YFkvgUBzf4S5ZP9fD5GNWyobq/5h7ZnIbNSds3r?=
 =?iso-8859-1?Q?ELUv89TNqthLxHsh6s63RE1fguyUZHJfYK2OoAwdZuQOZsyMF5n5dmQhoo?=
 =?iso-8859-1?Q?+FF5hBZxS1ntjrhDlApITT2cm3jm1iSAFFPav35fRLg8IL7iB9NibIPpye?=
 =?iso-8859-1?Q?zFU40rtvtTdDWWg8QPa2dtvKi/nnQS3jNUyou2JTyiM1b8KocT0Hx65xAl?=
 =?iso-8859-1?Q?LzKX/ZMVoJo4OxwdQAtQt6ooPdiwEP/n1JCc8Rd9HLhLizPF3OKj1voUjW?=
 =?iso-8859-1?Q?h5v7vsfPubVtNVtws+wGv9tTuVZAmNW59f3pL5kSCU4CsxLQ9GO+n3a0lj?=
 =?iso-8859-1?Q?sjcc4ppypzhI94pM5v5Z1PjO1BqsLAtD/yFtu5tUhjAJOESaXPHO3aZjch?=
 =?iso-8859-1?Q?tSaDHLCUW/0Gqa56QwTbk6arwbfZZn6vMEM/927MO5lCwpYwddil7lqmVV?=
 =?iso-8859-1?Q?UVGSsiTqPHs97h0fqiTEkI8xII+x9WPf+PXDpAinEi1cM4HgTyitvUh4rP?=
 =?iso-8859-1?Q?lv+5OLZ+lOqa/4PdWqKsva9q+4F1lNJsZlw6vpSDS6deVRrSgvppc3enPn?=
 =?iso-8859-1?Q?Bx7aodsHFks+A4VkKe+gbl/qaBw2RxMYopFLZzrUCPU/HGmql0JKOzaYYj?=
 =?iso-8859-1?Q?yaP6nPsKXq93s/0IIvN66EPP/J0q3ssLI9BafwUdXiWzU3rfGPpo4FYRZa?=
 =?iso-8859-1?Q?MqwCaKp8sXsN1yWI+5TF5Pgm3zgD8BrFxoH+uc5cVyPKbSyjIwSpoNsXKp?=
 =?iso-8859-1?Q?jmc1pYcIgD14TiPk49ObPAGI2Zm/LIJJyqcpZXfw68h283fgE20beXIhLy?=
 =?iso-8859-1?Q?QPiJc/gZoWNQBDFLT7EpBhhWp9XwlUQkbkkmMYTjywVSRBlghhFL8N++Uh?=
 =?iso-8859-1?Q?GyKW38be7I3zUWM/hVGlrhLe+Dr2RAvdwNsnEYDvhFi0an3LjdOBMYczj5?=
 =?iso-8859-1?Q?B4KvtB5hSd1OAI/vsMXy/nJ33VKtQ+NgbKyLWvuzyPxRmXA4ltRkPUJACE?=
 =?iso-8859-1?Q?UV/JgHSh+VAVFMpABLul5l8TVKEEfSdDl1kWeptCSv8NAMh/yVcZ3z4DhQ?=
 =?iso-8859-1?Q?9Ler1tWRF1ye7GilTNs7KJa4gyqJFIVjSz72OrYBS+FSHPN63Aqtd52Tj8?=
 =?iso-8859-1?Q?c=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Yr79AM6aO+TTSHLL30S/Wo3H7ExZdLx9Yayk3/rP7g8Bzk7LqwkKzzqS8U?=
 =?iso-8859-1?Q?hED9RvuFw3BAoQGMbc8HW3awbCtEKQYff5ikPyufux14vkrmeJt5d+/80K?=
 =?iso-8859-1?Q?RX8/ktRgqYhvK1hzIpxzxfI/QwJiZIrAJPPlfojwjo11IM6dAGq7S6/u7B?=
 =?iso-8859-1?Q?BsQNwKoJbwhRWNnYpA+dWBckLQXLdfNG4KP2/mVB6nTOcFVBjph0ttw/8L?=
 =?iso-8859-1?Q?wE2IZSE4vlS6XBUp5JRP5V++1xPQMVF2dmnmkhqlinTrpcLeUVacP5pJqN?=
 =?iso-8859-1?Q?dH3yzUjZj7sXLsu+6slq6E7XuMENYDAdoUUUHNnRRo9WOjGAzKCy6e4/9h?=
 =?iso-8859-1?Q?beglce6nwa/Ha+arRmSKLOp/gErdVfRwI4nYHvjQ2a5Sjrc+zmqUnHmGA2?=
 =?iso-8859-1?Q?qf6DdOnt52gp9xBf/15E//ivMSCyeenTm6++ohUaSz93zDt/8nBWUbiMwW?=
 =?iso-8859-1?Q?wmXOTvZOB/F4+gpnR9xYkenQ5LVgWabC+sqdzkmp4sf/3oY2e+zb7EAK2H?=
 =?iso-8859-1?Q?XEZQpfHA2Ku0vCTSE/jyd8Z55D0oTl3F3ijnJ3to/VA2mIm1JN4mAG0L+Q?=
 =?iso-8859-1?Q?T4fn9JPoTI1BNfHMJFxbcJW2WUY+LSoET5agdLjZE4zRSlfgwdOChDJlOd?=
 =?iso-8859-1?Q?AEAsyuYgVtJtVlgF9scSdz81jPHRrJCrRj/pj1PRfyIw+jg9yQb7odec2c?=
 =?iso-8859-1?Q?NYTfpVaO9zbTOl7OTraMVqmC0x0ELmAlYayYAF00PtwMUQzoj03xn/TSWv?=
 =?iso-8859-1?Q?diCFE3mgPoZ2wjwnHDzKUl2NA3WK/McorfppKm4XxJtLxxSIihlR2yg8Pl?=
 =?iso-8859-1?Q?sKczbdi6xV2y/QYQinMpLvS8O543LwTRW0TQvtcoh9PxuegnrA7g1UZoRs?=
 =?iso-8859-1?Q?UxTk3DBrhXjGZbwE6Ewmg4MRDpXZe4rNpQfiu8qqQQ1rI79feP0WNnaAUy?=
 =?iso-8859-1?Q?KI4n4dN+vd/NbGdgUm4ngxaMjnTpwPdjaYU1KugAFyoMVvFw4BPHdLOZKb?=
 =?iso-8859-1?Q?P40yTInlP1wy6zR3Z/qI7JgCZd58gwLC03xRHIuZCkzLqooXljq72l6C/L?=
 =?iso-8859-1?Q?Guhui3Rfr483MsFmPjoUMU0VBOGLmECljWPtm2/8I8slTbOE31oIWx50bq?=
 =?iso-8859-1?Q?8d2jMEmPdstPHGnaf/d05MgF9wq9lhQClp/jXYbo/uXD1h60tvYlp5eNFu?=
 =?iso-8859-1?Q?ZeN981En96ha/yiwSLFXDgehw+upRzutllkw7MpWYI33EkWTx7/EeiW/uR?=
 =?iso-8859-1?Q?vMag1pu4mHSyg0IcZEQ66KAdd5tSyWqdN88LHGzUG65t55ZByQsjh+zbyr?=
 =?iso-8859-1?Q?7gnQndV4kiMh2obyvBWvawn7M6DPzlcEqlwH7hbTszgdc4RfUbN9GFfYuc?=
 =?iso-8859-1?Q?qEkm90YIk1I9ow9yf8mRxxf8NfARIBXMDR+M7eAFphBjiHGi3upqEa0JSW?=
 =?iso-8859-1?Q?R2XSxkJX5mC6Ph6l83xYRypU7chXcF7ru+s3MRqZxkdI+23w9movwb8gVs?=
 =?iso-8859-1?Q?/DQd7tqts1Cb3KeuYwK2BosWRdyviEsCY1RWLmRUlFdDYJmwd6v2MGUDrc?=
 =?iso-8859-1?Q?OcSXCD6ENlTAuzZa00K9DkKlfjQE+gv2l0CpTwjc4DfGz9i8ah9TyEcXM0?=
 =?iso-8859-1?Q?1dNfcxR5iWQmkY1cfxCyp1wu2dMULEosS23NR1wKbgcm8FiOPdseGWww?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c7aaf90-f2a7-4371-8464-08ddcfb18b4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2025 21:39:20.9512
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V4CfbnAw4Pex2Qv2dj11OBzMDSBXg0wnCkF90vZOAkrL3nAFZhnT1MnA3pPsOU4rSj1kOCtI7IbeN8xi7YBcoMU23CDJ+dAHbAUo5FKyj1w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB10181

MISRA C Rule 5.5 states that: "Identifiers shall
be distinct from macro names".

Update ECLAIR configuration to deviate clashes:
specify the macros that should be ignored.
Update deviations.rst and rules.rst accordingly.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Changes in v3:
- removed deviation for 'pirq_cleanup_check', it will be be addresed in the
https://patchew.org/Xen/20250729223110.3404441-1-andrew.cooper3@citrix.com/
- updated wording of the deviations

Link to v2: https://patchew.org/Xen/7f5223bf37ed42c90e4bd426659eaa87c2c6879=
f.1753455885.git.dmytro._5Fprokopchuk1@epam.com/
---
 .../eclair_analysis/ECLAIR/deviations.ecl     | 10 +++++++++
 docs/misra/deviations.rst                     | 22 +++++++++++++++++++
 docs/misra/rules.rst                          | 17 ++++++++++++++
 3 files changed, 49 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/=
eclair_analysis/ECLAIR/deviations.ecl
index 483507e7b9..f30afd1126 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -117,6 +117,16 @@ it defines would (in the common case) be already defin=
ed. Peer reviewed by the c
 -config=3DMC3A2.R5.5,reports+=3D{deliberate, "any_area(decl(kind(function)=
)||any_loc(macro(name(memcpy||memset||memmove))))&&any_area(any_loc(file(^x=
en/common/libelf/libelf-private\\.h$)))"}
 -doc_end
=20
+-doc_begin=3D"Clashes between bitops function and macro names are delibera=
te.
+These macros are needed for input validation and error handling."
+-config=3DMC3A2.R5.5,ignored_macros+=3D"name(__test_and_set_bit||__test_an=
d_clear_bit||__test_and_change_bit||test_bit||set_bit||clear_bit||change_bi=
t||test_and_set_bit||test_and_clear_bit||test_and_change_bit)"
+-doc_end
+
+-doc_begin=3D"Clashes between grant table functions and macros names are d=
eliberate.
+These macros address differences in argument count during compile-time, ef=
fectively discarding unused parameters to avoid warnings or errors related =
to them."
+-config=3DMC3A2.R5.5,ignored_macros+=3D"name(update_gnttab_par||parse_gntt=
ab_limit)"
+-doc_end
+
 -doc_begin=3D"The type \"ret_t\" is deliberately defined multiple times,
 depending on the guest."
 -config=3DMC3A2.R5.6,reports+=3D{deliberate,"any_area(any_loc(text(^.*ret_=
t.*$)))"}
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index e78179fcb8..96eedd27d5 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -142,6 +142,28 @@ Deviations related to MISRA C:2012 Rules:
        memmove.
      - Tagged as `deliberate` for ECLAIR.
=20
+   * - R5.5
+     - Clashes between bitops ('__test_and_set_bit', '__test_and_clear_bit=
',
+       '__test_and_change_bit', 'test_bit', 'set_bit', 'clear_bit', 'chang=
e_bit',
+       'test_and_set_bit', 'test_and_clear_bit', 'test_and_change_bit')
+       functions and macros names are deliberate and are needed for input
+       validation and error handling, ensures that the size of the object =
being
+       pointed to by 'addr' meets the minimum requirements for the bit ope=
ration,
+       preventing unsafe operations on improperly sized data types that co=
uld
+       lead to undefined behavior or memory corruption.
+       The macros encapsulate this conditional logic into a single, reusab=
le form;
+       which simplifies the code, avoids redundant function call.
+       Also this bitops API was inherited from Linux and should be kept fo=
r familiarity.
+     - ECLAIR has been configured to ignore these macros.
+
+   * - R5.5
+     - Clashes between grant table ('update_gnttab_par', 'parse_gnttab_lim=
it')
+       functions and macros names are deliberate.
+       These macros are used intentionally and address differences in argu=
ment count
+       during compile-time, effectively discarding unused 2nd and 3rd para=
meters
+       to avoid warnings or errors related to them.
+     - ECLAIR has been configured to ignore these macros.
+
    * - R5.6
      - The type ret_t is deliberately defined multiple times depending on =
the
        type of guest to service.
diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 3e014a6298..431533b1e4 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -196,6 +196,23 @@ maintainers if you want to suggest a change.
            #define f(x, y) f(x, y)
            void f(int x, int y);
=20
+       Clashes between bitops functions and macros names are allowed
+       because they are used for input validation and error handling.
+       Example::
+
+           static inline void set_bit(int nr, volatile void *addr)
+           {
+               asm volatile ( "lock btsl %1,%0"
+                              : "+m" (ADDR) : "Ir" (nr) : "memory");
+           }
+           #define set_bit(nr, addr) ({                            \
+               if ( bitop_bad_size(addr) ) __bitop_bad_size();     \
+               set_bit(nr, addr);                                  \
+           })
+
+       Clashes between grant table functions and macros names are allowed
+       because the are used for discard unused parameters.
+
    * - `Rule 5.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Su=
ite/-/blob/master/R_05_06.c>`_
      - Required
      - A typedef name shall be a unique identifier
--=20
2.43.0

