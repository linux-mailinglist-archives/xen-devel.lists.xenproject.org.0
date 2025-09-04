Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F0DB446D7
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 22:01:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1110717.1459784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuG9D-0006SZ-KA; Thu, 04 Sep 2025 20:01:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1110717.1459784; Thu, 04 Sep 2025 20:01:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuG9D-0006Qd-EE; Thu, 04 Sep 2025 20:01:31 +0000
Received: by outflank-mailman (input) for mailman id 1110717;
 Thu, 04 Sep 2025 20:01:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ukh3=3P=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uuG9B-00062f-LT
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 20:01:29 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f111a0ee-89c9-11f0-9809-7dc792cee155;
 Thu, 04 Sep 2025 22:01:27 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by GV2PR03MB10974.eurprd03.prod.outlook.com (2603:10a6:150:27a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 20:01:25 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9094.017; Thu, 4 Sep 2025
 20:01:24 +0000
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
X-Inumbo-ID: f111a0ee-89c9-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=clJdcSJ78Lp5yHwmVwSVH4wZioPwVUP1QuqtXwXUO1WssRnojFSTI092JHh/m9Akvwo052enSbiT2UYFEIT8OsouzS3ufQbJnIT/KSqaaPRc8U/Rq8+wXeXGwT+aIZ9dhUHsnO+EGy/Dhia0d94z+9x70ys5l5fWEmHojGnxi9iaEA+H0YpF5R0JH7qQlWbz63dbM5q3ldGzEcgrwAEDbRIJWznuGVLeHGUVklBTkYwDck2vgqFuWwSkaldHmj6MqSQPddV6cMEdy5xjaIznWnym0rNq3xdy5kKAg+nk7xOujcXGY8djS6YU0ow2fhb5+NS01mjO4PuqI/rXZ6GTxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cktca4KjjAxZKyZjKCeMpl9aQ7UrtWBk5FkrJKPR44c=;
 b=eTK4rSdFlkoCwWv1Zo/O3GQO83jBXewn3APhtrvDyqAuOUaNK69BrDLf3JGZslFiW5M29QED3zMwKCMzW2gBb05OVw5sgjp3sKvK2J7qUd/W7FqmxemciUXkoeNnWdwc/ZkP037w4zbwyhto7GQsI71rwFdrfFF3v1MrPL8wS/9Bg4rsfwjAHQPyQSai7hUTEIC3hliFYbBLCsnpQGznOjbVKEZD84PGaAOOGaR6K3sIHhxFDKq4jyidCnIIhWS2bGRQw+70xKjtrhkvbt+FujKt77PJLjEv/GAMBflaI/cUg1VWWrP2fnenZ14R5FHzVYb59CbmkuV8syhryNnNMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cktca4KjjAxZKyZjKCeMpl9aQ7UrtWBk5FkrJKPR44c=;
 b=MHsYt5gcVklhH+bkFJd40frjB9RYsHTVvqKcHWQ5QV/uEhut5c9bofL8RZuzQfNYmGpo94aO3C20FONBrFAxkFhqVEf9i+X2cXN2+ucyOKo5h9iPpQ0GfmlVlyMrN9XWrfwk1NYtA7J6yOSB4tMmviN9kg2Hwo+BFWZ7sKUwpXxwt9ikVfK74Ci4oP93xQH8xk+PViaKYRFLr6AE808bX/S/5iTpjZ9ChUb1RjnrAUMIAgzMzOFyLuzWPuYEuZ0jBOYogtPs63NYwProQOByo0315cquw2JWb7zSBUAyu18gnHD2kwC3LUv7UC0DG3odVNteC/jjr8KDG+/8p+VsTA==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH v7 04/12] xen/arm/irq: add handling for IRQs in the eSPI range
Thread-Topic: [PATCH v7 04/12] xen/arm/irq: add handling for IRQs in the eSPI
 range
Thread-Index: AQHcHdaxzH0gJHOWB0uscg50WGUPxw==
Date: Thu, 4 Sep 2025 20:01:24 +0000
Message-ID:
 <8b43ad89380261c3a3bbd0bc943461226d9cf0ce.1757015865.git.leonid_komarianskyi@epam.com>
References: <cover.1757015865.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1757015865.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|GV2PR03MB10974:EE_
x-ms-office365-filtering-correlation-id: 20e0b82c-f9d6-4d85-1c4c-08ddebedd3ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?dBcKyfobxezHkUXex8VUvSa9+SzOFxB9vXMDKMlknrA59H6EYGTyQ07jnJ?=
 =?iso-8859-1?Q?zXkqxwF4lBU0eltjwX3IZ6yIFrM0yLQUvFQgfATzoh+HoPbFvvuV0W0egP?=
 =?iso-8859-1?Q?uBZEl7aKn4UguhgvRTfGmrRS5NuWyVIw0dPgiTgal78X5QLYoDFcuF3j/F?=
 =?iso-8859-1?Q?CyLhGs6+lgEQCwdmWCZt0k+FguVwLMQj9WJAtSRRHiOIzK/u7EclyfSGDA?=
 =?iso-8859-1?Q?Pv9kEhvPUoZGN8aciqPtq3xZNzdtQtM4YHM+DX18sEBCSWXQ37zfagzr0V?=
 =?iso-8859-1?Q?ojlIBTAK6n+xR/GvXTjNwWw0yI8UzIT+VWm5V7TK6v6zpS7Kn9Rx//GspR?=
 =?iso-8859-1?Q?2u1dH6TIutn2fsKk5a95hrKurZdKQ42/AEvaiez+QMUYCDyNY76SedaGF0?=
 =?iso-8859-1?Q?hbLdzJqisA5w7m9Ua51/ycAUiupPr3A5IVzlBO+GalSMfJx6Jgi79UItNY?=
 =?iso-8859-1?Q?+CuXF1Ec1VQsFJ6wa4sX5JsDCNocEkB41t5I2wSLtkcyvs5wp8dpZjC4x9?=
 =?iso-8859-1?Q?EOTlYgI0HdkjbnqZPvWBoOR5KNVYUNOSTmO8Xdq3IpPK6k8C5VgCLXkrdh?=
 =?iso-8859-1?Q?PISR9Xj1OCcF9p5Q02YrAVbJ/QZpO1uQ9S+s6UCrptUsTbAvKu/KXBSdcZ?=
 =?iso-8859-1?Q?xWpE5zQeornvowqiWemQ7Nl99Ci1Q5/3MZ2ApQXQOG4uXkeo9Om/HyvvR0?=
 =?iso-8859-1?Q?wn5Knhro5AV6v8HnirCP16SnNGo5pOXUiIyVGJlltKiDIMYsFc8awNLPar?=
 =?iso-8859-1?Q?ljexKsuUHuTi9nTj6ZfPArJGtfoM+jPI0CcSXeJgSZ7l0G0Q9fZua4c26t?=
 =?iso-8859-1?Q?0ytQo0rJG+2ZrfDkkf48DF5wBN3HCj5V/LmjkLzyMvmZHPt+/xC0s1Xp+K?=
 =?iso-8859-1?Q?Tz5fSuVnmK6UeKvr9Uzu2vPNLCNKyhBEjYvGZgJRSUSaZOImp7gNM9Tinv?=
 =?iso-8859-1?Q?aqXrb4lQu20P1KpBHtanWuLBoXli55x0rzLoFfzZD3zBFF4M5sCclHee+s?=
 =?iso-8859-1?Q?V5EtaoR6fGVY+1zOn4XXjuEmXgEueXK2AhIbvDiqGb8/LVP1VMefufThZB?=
 =?iso-8859-1?Q?sxvUEvo4abiDL8HKjFI2TQH40H5NX4RujU6D765ViB2DP9mCOj8kUcBqZR?=
 =?iso-8859-1?Q?haU8w6sgkVSfiqMMvgRPC8fmFAsyLL/mdJszlanoZYpwiFeweih3JGCXF/?=
 =?iso-8859-1?Q?aFvJCMXNCQyotN8XgCSY24zvVN9Uyu2HsDVkavyNZJjUq8NzVSIOXAUKE7?=
 =?iso-8859-1?Q?mqx2NY4qm8sdqQ2x3nL2iTAWYMjcYlI7l2YkurwjhHcNz0Tt5MKyyb7YF3?=
 =?iso-8859-1?Q?9obL1UjgGFhOVix3dcwVcBjzhae9v1Y50aJvqpSmfEU8VP7wlxa84renLq?=
 =?iso-8859-1?Q?ICBPrhk5G6YylOmhD0bbCSgQ2tnFZKDRshy6/j0355oW2sF+FTFbrsTIte?=
 =?iso-8859-1?Q?6mClIDhrajlOX/oBNUtmeQb4TiSFF0EujMk+oTEpk54xxy+U+qyzfC2ZpN?=
 =?iso-8859-1?Q?yg/h9I5ZCK62XBRtOfNl16INvowQ6o9sIY2ShIIN1b2A=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?+twAIjFEhInHuvD+kwuO+3wtf3FKVWFNwW0GBW0hlCQ2VDF0lw9v5nyXYx?=
 =?iso-8859-1?Q?NC0m9VMH5t/cSLg1YiVrBPPqoeFWb4CsAxmNHgeN6CJWjGxb2mBGK8SqLn?=
 =?iso-8859-1?Q?UbWhuhv0ihgWu/N+J+hF4bKUBQ9/02gQfEBQxa/+nRR3TI9r77M3VuCo1+?=
 =?iso-8859-1?Q?2jKfaRPTdq1HEFLDZJTr5gwulLWX5wz3ZfeA76z0N3vvQXU6coayfbUVWI?=
 =?iso-8859-1?Q?7vuboUTyFinUaT/8OkWnpRquPtMlopNAbpbp4y0Y6Zt2ha+shxxiORueZt?=
 =?iso-8859-1?Q?nD5aS3XmbprsMAS2vqCMVNa10T037yfO2Mrjgf7Q4pUyliw8/YXc6Rp2/K?=
 =?iso-8859-1?Q?4hs7Hsewk8oVVuG+WTxJMkDLhD85xsaNGFnbN/+8DgbLHpE/ryw0xapFmc?=
 =?iso-8859-1?Q?zRyZ+7tpbDdMeYW8qXqkxzERAZmFk3TmwSmYZJI1wC+ngHmb1FuANYNZbm?=
 =?iso-8859-1?Q?ExoZDDdZDTl2kxtv7sVigknJFoTSvk41KDIqjTVH09bflLoEyZN9UbITqE?=
 =?iso-8859-1?Q?XHDybAOFqjhpo26WehZfyE0Rt0ToBWQQ0nZVQ3qXWsAtYZsdrpNs9ZodXL?=
 =?iso-8859-1?Q?WZMcKQt8ktO1K9pdzqSIX7mR496CxzMGlGETBcFrob5Cl7KQxkbMlwitmT?=
 =?iso-8859-1?Q?omLewI3wEUcIT7eKebfE/KB1fF3I1jKdI9PtS1MrqlM42xjdOf89SZsgcj?=
 =?iso-8859-1?Q?/dh8COT7llrTnwgsm7um8HNYa5wVL5oBZ792gkQgniYVLlyYod7/ZBxRW7?=
 =?iso-8859-1?Q?SmDQRMD8kVXtxc33SzWXZDU+CPS8NkfXQ6cB+R/XQrG+jxfl7QFqHegmRt?=
 =?iso-8859-1?Q?b93yqRpM6kVfoaqp1QLoqLE0sPo/XkAbyNE105ZGmp9J/Y2Lpirva8vLR7?=
 =?iso-8859-1?Q?Imsqqnzqp8LHfNPgsbPUhC91WUCsoKhGEWhdsbTJpfL7yQW7nrOHB5n+ZM?=
 =?iso-8859-1?Q?f9RX8In+gMva7QFmnwMwYsDtx1bTXG05PzFcEKJ9rWacdowa6vhX8aYpof?=
 =?iso-8859-1?Q?aSkh+hburBjoGbRegg9EcmA+dbMjnDGkFbJRIuYcqdavFUcB+9uN+c5f94?=
 =?iso-8859-1?Q?C1UPTXeTiOy6GSa7Dzu1YPCj3+glaDgKTKOYelSKYofaNdr7n3VJojDiaa?=
 =?iso-8859-1?Q?iC0n40a3BoSsKe7LTJZbx4aL3Abt+Sop74+rfIAFc2BjUm6iSdPDvusQmN?=
 =?iso-8859-1?Q?WtVtmyyB51omIjexSN6U0r54j8LfWr1S6aQlojrV7ObBlsjLXmZUUKHBUj?=
 =?iso-8859-1?Q?hUxZ4SE1r5Z0SL88w1UV1IO2QsJppkRcA68G/P2p0psEdKAmo72igYw1JJ?=
 =?iso-8859-1?Q?Mu68TOYTSVE0Nr4wD1El/KYB7WSgo0lxaQLLWz2kNeUjxKIYMa+QUn1k6r?=
 =?iso-8859-1?Q?DD+hBMZxozxg431TgVkU4Q07zEG4jk06vVt+6XSv+SxzQumYbdKcj4syzF?=
 =?iso-8859-1?Q?AgP6i9IB9YiP28JorDF9Rb5ApFbFb+1u8yxl7zrgW/go6YHwfSw0PfmBXu?=
 =?iso-8859-1?Q?A99Qz9OZBUGPdOz/jjHnfATOVqYAKqoJDSKcmq71Lh28iFQQ1X//421Lv0?=
 =?iso-8859-1?Q?D8B1T4LStywTM6S/g1F7KEHAulAUILEV7+cN35kj2ZbRKG7HeaYZ/uiVeW?=
 =?iso-8859-1?Q?NxkJ/VjeOeBwgdmVWUlsuB1okrDSlVX71KOSc2zLWAhIi29KtMAnSx1rxC?=
 =?iso-8859-1?Q?VEwkkN0s1jhzOMktSBs=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20e0b82c-f9d6-4d85-1c4c-08ddebedd3ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2025 20:01:24.8232
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dUKBNayhDMWoiywyjlyhWvE1efz2xhOjTwsvu7ofF7kucWNxtPMVbfnIHf2MAWVZW+Z54/Y2UbvBEmSvcDeMP5iaNdiduCxIToNi+AK51E4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB10974

Currently, Xen does not support eSPI interrupts, leading
to a data abort when such interrupts are defined in the DTS.

This patch introduces a separate array to initialize up to
1024 interrupt descriptors in the eSPI range and adds the
necessary defines and helper function. These changes lay the
groundwork for future implementation of full eSPI interrupt
support. As this GICv3.1 feature is not required by all vendors,
all changes are guarded by ifdefs, depending on the corresponding
Kconfig option.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>

---
Changes in V7:
- fixed the condition in the is_espi assert for non-eSPI builds: the
  previous condition was mistakenly added with a wrong check and led to
  triggering asserts for all non-eSPI INTIDs, when it should be triggered
  in this case in the other way around
- minor: used is_espi() in the espi_intid_to_idx() ASSERT, as is_espi
  performs the same verification

Changes in V6:
- added an assert in is_espi() when CONFIG_GICV3_ESPI=3Dn to ensure that
  out-of-range array resources are not accessed, e.g., in __irq_to_desc()
- removed unnecessary parentheses in is_espi()
- converted helper macro to inline functions and added sanity checks
  with ASSERTs to them
- defined espi_to_desc for non-eSPI builds as a prototype
- updates the comments
- used the IS_ENABLED(CONFIG_GICV3_ESPI) macro to initialize nr_irqs

Changes in V5:
- no functional changes introduced by this version compared with V4, only
  minor fixes and removal of ifdefs for macroses
- added TODO comment, suggested by Oleksandr Tyshchenko
- changed int to unsigned int for irqs
- removed ifdefs for eSPI-specific defines and macros to reduce the
  number of ifdefs and code duplication in further changes
- removed reviewed-by as moving defines from ifdefs requires additional
  confirmation from reviewers

Changes in V4:
- removed redundant line with 'default n' in Kconfig, as it is disabled
  by default, without explicit specification
- added reviewed-by from Volodymyr Babchuk

Changes in V3:
- introduced a new define NR_ESPI_IRQS to avoid confusion, like in the
  case of using NR_IRQS for espi_desc array
- implemented helper functions espi_to_desc and init_espi_data to make
  it possible to add stubs with the same name, and as a result, reduce
  the number of #ifdefs
- disable CONFIG_GICV3_ESPI default value to n

Changes in V2:
- use (ESPI_MAX_INTID + 1) instead of (ESPI_BASE_INTID + NR_IRQS)
- remove unnecessary comment for nr_irqs initialization
---
 xen/arch/arm/Kconfig           |  8 +++++
 xen/arch/arm/include/asm/irq.h | 37 ++++++++++++++++++++++++
 xen/arch/arm/irq.c             | 53 ++++++++++++++++++++++++++++++++--
 3 files changed, 96 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 17df147b25..43b05533b1 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -135,6 +135,14 @@ config GICV3
 	  Driver for the ARM Generic Interrupt Controller v3.
 	  If unsure, use the default setting.
=20
+config GICV3_ESPI
+	bool "Extended SPI range support"
+	depends on GICV3 && !NEW_VGIC
+	help
+	  Allow Xen and domains to use interrupt numbers from the extended SPI
+	  range, from 4096 to 5119. This feature is introduced in GICv3.1
+	  architecture.
+
 config HAS_ITS
         bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPORT=
ED
         depends on GICV3 && !NEW_VGIC && !ARM_32
diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/irq.=
h
index 5bc6475eb4..2ff2d07d6d 100644
--- a/xen/arch/arm/include/asm/irq.h
+++ b/xen/arch/arm/include/asm/irq.h
@@ -32,6 +32,10 @@ struct arch_irq_desc {
 #define SPI_MAX_INTID   1019
 #define LPI_OFFSET      8192
=20
+#define ESPI_BASE_INTID 4096
+#define ESPI_MAX_INTID  5119
+#define NR_ESPI_IRQS    1024
+
 /* LPIs are always numbered starting at 8192, so 0 is a good invalid case.=
 */
 #define INVALID_LPI     0
=20
@@ -39,7 +43,12 @@ struct arch_irq_desc {
 #define INVALID_IRQ     1023
=20
 extern const unsigned int nr_irqs;
+#ifdef CONFIG_GICV3_ESPI
+/* This will cover the eSPI range, to allow asignmant of eSPIs to domains.=
 */
+#define nr_static_irqs (ESPI_MAX_INTID + 1)
+#else
 #define nr_static_irqs NR_IRQS
+#endif
=20
 struct irq_desc;
 struct irqaction;
@@ -55,6 +64,34 @@ static inline bool is_lpi(unsigned int irq)
     return irq >=3D LPI_OFFSET;
 }
=20
+static inline bool is_espi(unsigned int irq)
+{
+#ifdef CONFIG_GICV3_ESPI
+    return irq >=3D ESPI_BASE_INTID && irq <=3D ESPI_MAX_INTID;
+#else
+    /*
+     * The function should not be called for eSPIs when CONFIG_GICV3_ESPI =
is
+     * disabled. Returning false allows the compiler to optimize the code
+     * when the config is disabled, while the assert ensures that out-of-r=
ange
+     * array resources are not accessed, e.g., in __irq_to_desc().
+     */
+    ASSERT(!(irq >=3D ESPI_BASE_INTID && irq <=3D ESPI_MAX_INTID));
+    return false;
+#endif
+}
+
+static inline unsigned int espi_intid_to_idx(unsigned int intid)
+{
+    ASSERT(is_espi(intid));
+    return intid - ESPI_BASE_INTID;
+}
+
+static inline unsigned int espi_idx_to_intid(unsigned int idx)
+{
+    ASSERT(idx <=3D NR_ESPI_IRQS);
+    return idx + ESPI_BASE_INTID;
+}
+
 #define domain_pirq_to_irq(d, pirq) (pirq)
=20
 bool is_assignable_irq(unsigned int irq);
diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index b8eccfc924..c934d39bf6 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -19,7 +19,9 @@
 #include <asm/gic.h>
 #include <asm/vgic.h>
=20
-const unsigned int nr_irqs =3D NR_IRQS;
+const unsigned int nr_irqs =3D IS_ENABLED(CONFIG_GICV3_ESPI) ?
+                                        (ESPI_MAX_INTID + 1) :
+                                        NR_IRQS;
=20
 static unsigned int local_irqs_type[NR_LOCAL_IRQS];
 static DEFINE_SPINLOCK(local_irqs_type_lock);
@@ -46,6 +48,50 @@ void irq_end_none(struct irq_desc *irq)
 }
=20
 static irq_desc_t irq_desc[NR_IRQS - NR_LOCAL_IRQS];
+#ifdef CONFIG_GICV3_ESPI
+/* TODO: Consider allocating an array dynamically */
+static irq_desc_t espi_desc[NR_ESPI_IRQS];
+
+static struct irq_desc *espi_to_desc(unsigned int irq)
+{
+    return &espi_desc[espi_intid_to_idx(irq)];
+}
+
+static int __init init_espi_data(void)
+{
+    unsigned int irq;
+
+    for ( irq =3D ESPI_BASE_INTID; irq <=3D ESPI_MAX_INTID; irq++ )
+    {
+        struct irq_desc *desc =3D irq_to_desc(irq);
+        int rc =3D init_one_irq_desc(desc);
+
+        if ( rc )
+            return rc;
+
+        desc->irq =3D irq;
+        desc->action  =3D NULL;
+    }
+
+    return 0;
+}
+#else
+/*
+ * Defined as a prototype as it should not be called if CONFIG_GICV3_ESPI=
=3Dn.
+ * Without CONFIG_GICV3_ESPI, the additional 1024 IRQ descriptors will not
+ * be defined, and thus, they cannot be used. Unless INTIDs from the eSPI
+ * range are mistakenly defined in Xen DTS when the appropriate config is
+ * disabled, this function will not be reached because is_espi will return
+ * false for non-eSPI INTIDs.
+ */
+struct irq_desc *espi_to_desc(unsigned int irq);
+
+static int __init init_espi_data(void)
+{
+    return 0;
+}
+#endif
+
 static DEFINE_PER_CPU(irq_desc_t[NR_LOCAL_IRQS], local_irq_desc);
=20
 struct irq_desc *__irq_to_desc(unsigned int irq)
@@ -53,6 +99,9 @@ struct irq_desc *__irq_to_desc(unsigned int irq)
     if ( irq < NR_LOCAL_IRQS )
         return &this_cpu(local_irq_desc)[irq];
=20
+    if ( is_espi(irq) )
+        return espi_to_desc(irq);
+
     return &irq_desc[irq-NR_LOCAL_IRQS];
 }
=20
@@ -79,7 +128,7 @@ static int __init init_irq_data(void)
         desc->action  =3D NULL;
     }
=20
-    return 0;
+    return init_espi_data();
 }
=20
 static int init_local_irq_data(unsigned int cpu)
--=20
2.34.1

