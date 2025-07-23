Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 586FCB0EC8A
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 09:58:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053424.1422218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueUNF-0006Wc-CR; Wed, 23 Jul 2025 07:58:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053424.1422218; Wed, 23 Jul 2025 07:58:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueUNF-0006TM-88; Wed, 23 Jul 2025 07:58:49 +0000
Received: by outflank-mailman (input) for mailman id 1053424;
 Wed, 23 Jul 2025 07:58:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3SBI=2E=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1ueUND-0005y7-9B
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 07:58:47 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db2de090-679a-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 09:58:45 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by PAXPR03MB8082.eurprd03.prod.outlook.com (2603:10a6:102:231::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 07:58:39 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8922.037; Wed, 23 Jul 2025
 07:58:39 +0000
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
X-Inumbo-ID: db2de090-679a-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FX130+oJ+KIlyC85aIM7m2POkGQCtHm7zjYa39lSwIy1r+XtqLpxuH89dHFgnKR7aa4BF7A09Hn808O4tpZPGzj8IfCn153db/Os6XDfAY/naRudc6SU3Z9U5Ynea9NY8BI1pH4FkwTf8Wk+qEQsES4+onzhO90btym7aRLg68kBTfSxxhCqqARlwO0OEc/n2eMc5gMhOxq8Djlz+Ii9AIABodotWKdqfa9H4Iy7ockQWbbeuEzxy8puOqTykZyneqTz/1aikUi3w8WSDbFVn7mAgjM8m7M+ICVF20NXHqCjrMRU482+LIpYmzdYGjjJgoI62SxVnelDMjCTJ6hawg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YqsjkOZrnLjGC4gte2okg6lfmiavBrMr3K6zQx5JWPc=;
 b=oQYJpcqvzbjuHZqUMb51KJHtrlsJMPuBHg7FzLzQT+jCcmLqBJ1pmeag02rit+JxIz2tyAUBtjmqP0BgIT4zyKc61aXea5LoWH2FlbsIrq2RYtFITCPSpy94qPF/v7t2taqtYfPNMglnZITbhHqO6nMmJDvaqGrALvbI3I3kAnZM0JIqh/IpZzQFmRpwmjF9hBGyhfFSE5RYRpCcLU0/y75GkJMKs3fH3Rr5if9n9nktNlmunS2kUnBjYbkhK7L30M5cGIqjPJaDEzysVCVYDQuoS1bhdbkhnmNQRR9YpPwgOAG6tLWz8M1FatpBIKW4HL3PBQO1J8w4QnDx/Rvecg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YqsjkOZrnLjGC4gte2okg6lfmiavBrMr3K6zQx5JWPc=;
 b=l9PKripH/50ihczhPC0ulvPs7PIzInyhvWBpc/++kjaDu/j0b5suVakFBC/BFnPW08OB3SO6fWjm3yNApSsxtOmOMq25zgmjS5EPJAupTxjegaEkJkxvIn9VNHAsOFjGf2Ixu45fU3K5ItkzfKjqUTuySdFK0ZrOkZDo/qg9Ni53qvNGqjILQiuyGOacOSDUx6rojetaKirzkH/Smn6KqSVQCEjcAUmVsL3JzTsWak6NT5vxJ17Cbh84Veb+mT958HsBpDdYkH0+OiJmm9Vf9k2CbxcEK4jZ4IzZBLdP645yg0yCzSIVRbeFQAZxVBeqeXUd5esFTWJ/DGXXjesrxw==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Grygorii Strashko <grygorii_strashko@epam.com>
Subject: [XEN][PATCH 5/8] xen/arm64: make aarch32 support optional
Thread-Topic: [XEN][PATCH 5/8] xen/arm64: make aarch32 support optional
Thread-Index: AQHb+6eZv33sEf/jFk+oo2yrINbPuA==
Date: Wed, 23 Jul 2025 07:58:39 +0000
Message-ID: <20250723075835.3993182-6-grygorii_strashko@epam.com>
References: <20250723075835.3993182-1-grygorii_strashko@epam.com>
In-Reply-To: <20250723075835.3993182-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|PAXPR03MB8082:EE_
x-ms-office365-filtering-correlation-id: 6df36e9d-add1-445e-9c5c-08ddc9bebc0a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?eZraL919et1Ks+Nh8Xqqt5IYVLW3lzTKYah5a3Irnixt4IP8WLD/pfDWQP?=
 =?iso-8859-1?Q?+yAqCsVmCxcm/EpFwJzDDVFX3QNQlFWz3PkGQPxGa7iHDC1eXU9MP6fIFV?=
 =?iso-8859-1?Q?rpPyPEXlumoyrbtK9RtVPuhhu8XdWeVTczqrMQQe3DxJr+D82U4xPAJBhy?=
 =?iso-8859-1?Q?whPB/dYhdbJ2HAztksTM/CyG1xZVA+akz+Mo8gL32AIVa3tYFJL640iAVg?=
 =?iso-8859-1?Q?BTPWFTgziTPTuWZiZT3kfHA5FH0S6dlBAZpFbLr6ShaGbeQ8LFnatO3dFE?=
 =?iso-8859-1?Q?/j+fZvb9+CbLb3mJQeLH9Hw2QdlPT+TnKnX2FHophGOd1kfhjPzyu5JpM1?=
 =?iso-8859-1?Q?QjU7YX6qgqTcogBcCaO3NzWBNOGU95Xxp+0fVbnRjfW2Z8jBHwsxYwXzqq?=
 =?iso-8859-1?Q?8GDb93vTWjAw0ZUpw3I6VvG3xlCTjh1TvyEGeNxZrU9VVpGAbXcEvhgxqs?=
 =?iso-8859-1?Q?Q0p39ajxoxXiKTKfrmtwcfbMhCMNe0hS/GN8fQnYhP/HJsPOghdXznJcrw?=
 =?iso-8859-1?Q?MsRzcfmKlEFxWNDpaJ3ENIXKqrge4ziQtPkl/qxT/W1ytjSiR9x7zmfB1x?=
 =?iso-8859-1?Q?DE4/A/TysI+rb5uvQ2C0eY0RkFHGMw+zrWSv6XJGkNYR59T1EQLw8NrtN5?=
 =?iso-8859-1?Q?hfL/hUzEtp+JSjyXhPSwFKFJYZD7y2gM929ETK/7Z0wqmvROEywCB0u8AR?=
 =?iso-8859-1?Q?IjM/D+uz6ZGLYdA3+QXnUA1ldoji0sgz3rjvZsoSge87mVub3+LWI1ndbV?=
 =?iso-8859-1?Q?X8jV0d42ItaC3MzwAFMixpdnGuUa7vCzwoBsqDMgNQmG5poXSOAAhSTees?=
 =?iso-8859-1?Q?IWwys7jLFKe76FI5c0gTHMYydk8K6kKqlGT01bd8fIMWSpiHKthap/ok0l?=
 =?iso-8859-1?Q?GnJLc9HAp3vQ+6kdlmRCoSN6LM27lL/gJB28gyKpLKmI2bwXQfhgq+QT60?=
 =?iso-8859-1?Q?w73gy5Iay5fZfItkkKKa/VaJNUC6jO1C0F3sFNLcwzxBAG9T3iEDfMNpAI?=
 =?iso-8859-1?Q?lrmbbbyAdqFiL4CvAQNzFT1nasQ/W8cKbWPPQKSbkmoxRmp1PngRerl5+w?=
 =?iso-8859-1?Q?HzNTzrPyTbQVZxPc3Dr9mGPMtIoxTFC6Cwt4fdmHKUlktM2Jnhj+iCk+P7?=
 =?iso-8859-1?Q?paa86NTv3nwOKd9wBPSJm7iTSttHN86tDSW4q1MJp/gENFGN2WZO0Lnr5i?=
 =?iso-8859-1?Q?FJZ+JdcchA5ReskdU4W+AY2CYR0KTGpZVCqH+UCx6lV2AEhmjV3QJ7nSR8?=
 =?iso-8859-1?Q?qyrnazuiVQB7dAUCsMkMDTw0Nmegwj4qoYM8TaWuf3sDkiVWD60PYbmnjs?=
 =?iso-8859-1?Q?xc/12FiZ0NBk6hKBOtU1odQysOQPY2yPybwN04DVezp4dVuBtVstSomBqX?=
 =?iso-8859-1?Q?xc6hjTfxo8tTrLPeccR6AgMKdoNPgrGTovLsJJ6LK0gBUlROkNG5G+zeU3?=
 =?iso-8859-1?Q?wmIeFuG7ANI0y2pnrEGWFBTcvEKrdPCrFbBD4Ym4uIf4JrVWYTlYK1J4G3?=
 =?iso-8859-1?Q?cSoJmkVBCQUmjly36w11UFzrdhuNiSZ+GYJhZTgAUjFA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?7GM2PCms1GVV+MVC6GH18nwBWZ2WFs8N/oqw9HOvTUS4b7nBxcxRlenya0?=
 =?iso-8859-1?Q?benLLLIaPRj24BPc/D7WMkDQFa80WP9Hf04NSzdrgwhwZsk01ghtFgGL0o?=
 =?iso-8859-1?Q?C1PN+tyBh77x09IcHZW8XqKiaJj7e2EEqu1Fz4gDHrEBTnMdDsR5C/vXVn?=
 =?iso-8859-1?Q?1N7V6fVoOIv5hL0lw1Iy6DUcf+fdB6rY65Auc7qb4NL1eZNtdOiI8OGfQ6?=
 =?iso-8859-1?Q?KSo2LHzVfcUJookc3wH0M1RRoFpdpOToyjOl9wLlp4Y5Cgwbnx1lPcHQvM?=
 =?iso-8859-1?Q?U24t+hlsI9Z/XGmDbklQyQXB2J3d82F2RIZmxUrJZ2/quCSNP0j8w+EYpT?=
 =?iso-8859-1?Q?R0/TKwLVzHNwSorzXsa2hRYYlhSAZObeejqNPqknLqZWnwY/7No5ctLPA2?=
 =?iso-8859-1?Q?I0kwhG+KyQlL+cbwovvA+exzNDFM0nbMdx8rlkbzwR4UClU1dPD9RiJNe+?=
 =?iso-8859-1?Q?oLGKzU/1UIJ9iHgg4pB1doTqzRamVbRtwD5yT3EPLo9spMBrTetGWQNiMG?=
 =?iso-8859-1?Q?uyJEFqZbqurfBTlp3Vvgir7ox8ilZykZjZKcOQPUuFeVNmW06+ThBDhQWL?=
 =?iso-8859-1?Q?FtoNau3rtLF7jfJEbCY9fmey0o6XrjbhMMoA1MMwapWnZ9wjrshrahiqaC?=
 =?iso-8859-1?Q?aNnubr2VGHpyFWE8Wa4E1D9ibEVZmzg1SDLgcwUJvcwlArecxuWUTv41ty?=
 =?iso-8859-1?Q?dW8RSsO7UFOc01Zi6JaBkYYiZiKQKFE86nLsV9yL8Y3lA82+HqpVoFRYRm?=
 =?iso-8859-1?Q?qD8rYnvc65tEoJ0F1JFsZBf5RRWYJt358YpYFLE7YNrLyXpL5aTNHxzk2Q?=
 =?iso-8859-1?Q?dHbMK+vM3whj6Zg3SItEpUr2XbgTa8Vxwsmng6izcXFjZbEpH8CvKCGm0F?=
 =?iso-8859-1?Q?md0vrmwjlkgb1jwixwncbUAYi9GQmvr0M/ynNuNxKtmQ2n939N7hGwTcYV?=
 =?iso-8859-1?Q?2/mS6X3z5fOxS4grLn60bwiYZ/DIZd5vCLygPano1TZF8MUIuEZeV3qERD?=
 =?iso-8859-1?Q?ji16c8Q3VEPpgV0KYbZsicDk2XjBEwc/PkCdmriL/O6o8WULJ0WbvtMqO2?=
 =?iso-8859-1?Q?977NtNNVWjc21Wi3Sca/Xkbx9e2MnP8JVJZaSrg0s7/Sx6zPT8aGhk7e7A?=
 =?iso-8859-1?Q?Erp4e6USiBlp1o9zV+1EFm3Yrvs3K12F1c4z2C5KCQXBcpNO94j4iTVqJ9?=
 =?iso-8859-1?Q?bUmCOckJI2Y+MixgNzJX7TrsXd6EddFscX6qxJVPE1OeaV4qD/1Wr4nt4v?=
 =?iso-8859-1?Q?t7bYJdnGX10gaoPwcd4kOXNoIiAEfJUYM8pPGoQa5Ur8YuVvBbE9vBlX9q?=
 =?iso-8859-1?Q?xZ10kyBWbyhUvNLrjpmrke5AGLwrHo4OMi5uS5vmDuEJFTtb8noQht+4W1?=
 =?iso-8859-1?Q?4Rn8f4YRD6zimxc16uHnDv22gzDczM4cMsJzeJgjOKQVsXbQb1UHBbgccn?=
 =?iso-8859-1?Q?QfBJcqKyzuH8RKagpMQvetuv/aV8y7Hb5g35xueZCSl2i9rOQPSEblMCo2?=
 =?iso-8859-1?Q?Acfuw9G0QCY7O9RFHcw19Kfc+MsOQaUKfFEK5MSI6ZnEQ6N7Fw6I2EHM/v?=
 =?iso-8859-1?Q?hfbQrppj2SGAL/OxdEQ7Oihmf0FPZ/NUI/Dj4v2sOHXR3dMxYXl/THa52O?=
 =?iso-8859-1?Q?mi2k7/ScL1yyuxALs9RxxymP2GjH43p3NnBHk8rofAb5ls62IKo/8VXA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6df36e9d-add1-445e-9c5c-08ddc9bebc0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2025 07:58:39.1895
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rqSeYnTGnpaamY8XdrRvgHJRcS2zIsloNmYV8WQDHBSR/SlrOrH41Kwgp44BvONU/ePliAGgyBEcBhUeGk496BdWE0DVVZV6bf8WXMePjgA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB8082

From: Grygorii Strashko <grygorii_strashko@epam.com>

Now Arm64 AArch32 guest support is always enabled and built-in while not
all Arm64 platforms supports AArch32 or this support might not be needed.

Hence, this patch introduces basic support for disabling Arm64 AArch32
guest support. The following changes are introduced:

- Introduce Kconfig option CONFIG_ARM64_AARCH32 to allow enable/disable
  Arm64 AArch32 guest support (default y)

- Introduce is_aarch32_enabled() helper which accounts Arm64 HW capability
  and CONFIG_ARM64_AARCH32 setting

- Set Arm64 domain type to DOMAIN_64BIT by default

- Introduce arm64_set_domain_type() to configure Arm64 domain type in
  unified way instead of open coding (d)->arch.type, and account
  CONFIG_ARM64_AARCH32 configuration.

- toolstack: do not advertise "xen-3.0-armv7l " capability if
  CONFIG_ARM64_AARCH32=3Dn

- toolstack: reduce XEN_DOMCTL_set_address_size hypercall handler to a
  simple sanity check if CONFIG_ARM64_AARCH32=3Dn

With CONFIG_ARM64_AARCH32=3Dn the Xen will reject AArch32 guests (kernels) =
if
configured by user in the following way:
- Xen boot will fail with panic during dom0 or dom0less domains creation
- toolstack domain creation will be rejected due to xc_dom_compat_check()
  failure.

Making Arm64 AArch32 guest support open further possibilities for build
optimizations of Arm64 AArch32 guest support code.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 xen/arch/arm/Kconfig                    |  7 ++++
 xen/arch/arm/arm64/domain-build.c       | 45 +++++++++++++++++++++++--
 xen/arch/arm/arm64/domctl.c             |  6 ++++
 xen/arch/arm/domain.c                   |  1 +
 xen/arch/arm/domain_build.c             | 24 +++----------
 xen/arch/arm/include/asm/arm32/domain.h |  6 ++++
 xen/arch/arm/include/asm/arm64/domain.h | 27 +++++++++++++++
 xen/arch/arm/setup.c                    |  2 +-
 8 files changed, 95 insertions(+), 23 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 17df147b2555..d41076143d81 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -267,6 +267,13 @@ config PCI_PASSTHROUGH
 	help
 	  This option enables PCI device passthrough
=20
+config ARM64_AARCH32
+	bool "AArch32 Guests support on on ARM64 (UNSUPPORTED)" if UNSUPPORTED
+	depends on ARM_64
+	default y
+	help
+	  This option enables AArch32 Guests on ARM64.
+
 endmenu
=20
 menu "ARM errata workaround via the alternative framework"
diff --git a/xen/arch/arm/arm64/domain-build.c b/xen/arch/arm/arm64/domain-=
build.c
index 3a89ee46b8c6..aa8c616dd92e 100644
--- a/xen/arch/arm/arm64/domain-build.c
+++ b/xen/arch/arm/arm64/domain-build.c
@@ -4,13 +4,54 @@
 #include <xen/sched.h>
=20
 #include <asm/domain.h>
+#include <asm/arm64/sve.h>
+
+int __init arm64_set_domain_type(struct domain *d, struct kernel_info *kin=
fo)
+{
+    enum domain_type type;
+
+    ASSERT(d);
+    ASSERT(kinfo);
+
+    type =3D kinfo->arch.type;
+
+    if ( !is_aarch32_enabled() )
+    {
+        ASSERT(d->arch.type =3D=3D DOMAIN_64BIT);
+
+        if ( type =3D=3D DOMAIN_32BIT )
+        {
+            const char *str =3D "not available";
+
+            if ( !IS_ENABLED(CONFIG_ARM64_AARCH32) )
+                str =3D "disabled";
+            printk("aarch32 guests support is %s\n", str);
+            return -EINVAL;
+        }
+
+        return 0;
+    }
+
+    if ( is_sve_domain(d) && type =3D=3D DOMAIN_32BIT )
+    {
+        printk("SVE is not available for 32-bit domain\n");
+        return -EINVAL;
+    }
+
+    d->arch.type =3D type;
+
+    return 0;
+}
=20
 #ifdef CONFIG_DOM0LESS_BOOT
 /* TODO: make arch.type generic ? */
 void __init set_domain_type(struct domain *d, struct kernel_info *kinfo)
 {
-    /* type must be set before allocate memory */
-    d->arch.type =3D kinfo->arch.type;
+    int rc;
+
+    rc =3D arm64_set_domain_type(d, kinfo);
+    if ( rc < 0 )
+        panic("Unsupported guest type\n");
 }
 #endif
=20
diff --git a/xen/arch/arm/arm64/domctl.c b/xen/arch/arm/arm64/domctl.c
index 8720d126c97d..8a243d3fbd15 100644
--- a/xen/arch/arm/arm64/domctl.c
+++ b/xen/arch/arm/arm64/domctl.c
@@ -13,6 +13,7 @@
 #include <asm/arm64/sve.h>
 #include <asm/cpufeature.h>
=20
+#if defined(CONFIG_ARM64_AARCH32)
 static long switch_mode(struct domain *d, enum domain_type type)
 {
     struct vcpu *v;
@@ -50,6 +51,7 @@ static long set_address_size(struct domain *d, uint32_t a=
ddress_size)
         return -EINVAL;
     }
 }
+#endif /* CONFIG_ARM64_AARCH32 */
=20
 long subarch_do_domctl(struct xen_domctl *domctl, struct domain *d,
                        XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
@@ -57,7 +59,11 @@ long subarch_do_domctl(struct xen_domctl *domctl, struct=
 domain *d,
     switch ( domctl->cmd )
     {
     case XEN_DOMCTL_set_address_size:
+#if defined(CONFIG_ARM64_AARCH32)
         return set_address_size(d, domctl->u.address_size.size);
+#else
+        return domctl->u.address_size.size =3D=3D 32 ? -EINVAL : 0;
+#endif /* CONFIG_ARM64_AARCH32 */
=20
     default:
         return -ENOSYS;
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index e785278cdbd7..d08ca458a15c 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -788,6 +788,7 @@ int arch_domain_create(struct domain *d,
     /* Copy the encoded vector length sve_vl from the domain configuration=
 */
     d->arch.sve_vl =3D config->arch.sve_vl;
 #endif
+    domain_set_type_default(d);
=20
     return 0;
=20
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index af7e9d830ae1..06dfd5bedd14 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1872,21 +1872,6 @@ int __init construct_domain(struct domain *d, struct=
 kernel_info *kinfo)
     BUG_ON(d->vcpu[0] =3D=3D NULL);
     BUG_ON(v->is_initialised);
=20
-#ifdef CONFIG_ARM_64
-    /* if aarch32 mode is not supported at EL1 do not allow 32-bit domain =
*/
-    if ( !(cpu_has_el1_32) && kinfo->arch.type =3D=3D DOMAIN_32BIT )
-    {
-        printk("Platform does not support 32-bit domain\n");
-        return -EINVAL;
-    }
-
-    if ( is_sve_domain(d) && (kinfo->arch.type =3D=3D DOMAIN_32BIT) )
-    {
-        printk("SVE is not available for 32-bit domain\n");
-        return -EINVAL;
-    }
-#endif
-
     /*
      * kernel_load will determine the placement of the kernel as well
      * as the initrd & fdt in RAM, so call it first.
@@ -1976,6 +1961,10 @@ static int __init construct_dom0(struct domain *d)
     if ( rc < 0 )
         return rc;
=20
+    rc =3D arm64_set_domain_type(d, &kinfo);
+    if ( rc < 0 )
+        return rc;
+
     return construct_hwdom(&kinfo, NULL);
 }
=20
@@ -1987,11 +1976,6 @@ int __init construct_hwdom(struct kernel_info *kinfo=
,
=20
     iommu_hwdom_init(d);
=20
-#ifdef CONFIG_ARM_64
-    /* type must be set before allocate_memory or create cpu */
-    d->arch.type =3D kinfo->arch.type;
-#endif
-
     if ( vcpu_create(d, 0) =3D=3D NULL )
         panic("Error creating domain 0 vcpu0\n");
=20
diff --git a/xen/arch/arm/include/asm/arm32/domain.h b/xen/arch/arm/include=
/asm/arm32/domain.h
index c0a7fc35f38b..bdbb9e3cad47 100644
--- a/xen/arch/arm/include/asm/arm32/domain.h
+++ b/xen/arch/arm/include/asm/arm32/domain.h
@@ -10,6 +10,12 @@
=20
 #define vcpu_switch_to_aarch64_mode(v)
=20
+#define is_aarch32_enabled() (true)
+
+#define domain_set_type_default(d)
+
+#define arm64_set_domain_type(d, kinfo) (0)
+
 #endif /* ARM_ARM32_DOMAIN_H */
=20
 /*
diff --git a/xen/arch/arm/include/asm/arm64/domain.h b/xen/arch/arm/include=
/asm/arm64/domain.h
index 7a51ceedf25d..18402ae3ca0d 100644
--- a/xen/arch/arm/include/asm/arm64/domain.h
+++ b/xen/arch/arm/include/asm/arm64/domain.h
@@ -3,6 +3,10 @@
 #ifndef ARM_ARM64_DOMAIN_H
 #define ARM_ARM64_DOMAIN_H
=20
+#include <asm/cpufeature.h>
+
+struct kernel_info;
+
 /*
  * Returns true if guest execution state is AArch32
  *
@@ -24,6 +28,29 @@
  */
 void vcpu_switch_to_aarch64_mode(struct vcpu *v);
=20
+/*
+ * Arm64 declares AArch32 (32bit) Execution State support in the
+ * Processor Feature Registers (PFR0), but also can be disabled manually.
+ */
+#define is_aarch32_enabled()                                              =
     \
+        (IS_ENABLED(CONFIG_ARM64_AARCH32) && cpu_has_aarch32)
+
+/*
+ * Set default Execution State to AArch64 (64bit) during domain creation.
+ */
+#define domain_set_type_default(d) ((d)->arch.type =3D DOMAIN_64BIT)
+
+/*
+ * Set domain type from struct kernel_info which defines guest Execution
+ * State AArch32/AArch64 during regular dom0 or predefined (dom0less)
+ * domains creation .
+ * Type must be set before allocate_memory or create vcpus.
+ *
+ * @d: pointer to the domain structure.
+ * @kinfo: pointer to the kinfo structure.
+ */
+int arm64_set_domain_type(struct domain *d, struct kernel_info *kinfo);
+
 #endif /* ARM_ARM64_DOMAIN_H */
=20
 /*
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 8abc1d641df0..368350226973 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -530,7 +530,7 @@ static int __init init_xen_cap_info(void)
 #ifdef CONFIG_ARM_64
     safe_strcat(xen_cap_info, "xen-3.0-aarch64 ");
 #endif
-    if ( cpu_has_aarch32 )
+    if ( is_aarch32_enabled() )
         safe_strcat(xen_cap_info, "xen-3.0-armv7l ");
=20
     return 0;
--=20
2.34.1

