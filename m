Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA7CB45776
	for <lists+xen-devel@lfdr.de>; Fri,  5 Sep 2025 14:15:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1111903.1460457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuVLQ-0003xP-27; Fri, 05 Sep 2025 12:15:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1111903.1460457; Fri, 05 Sep 2025 12:15:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuVLP-0003vA-VH; Fri, 05 Sep 2025 12:15:07 +0000
Received: by outflank-mailman (input) for mailman id 1111903;
 Fri, 05 Sep 2025 12:15:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NEM9=3Q=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1uuVLO-0003v4-7P
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 12:15:06 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4970159-8a51-11f0-9d12-b5c5bf9af7f9;
 Fri, 05 Sep 2025 14:15:05 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AS2PR03MB9718.eurprd03.prod.outlook.com
 (2603:10a6:20b:60e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Fri, 5 Sep
 2025 12:15:02 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%7]) with mapi id 15.20.9094.018; Fri, 5 Sep 2025
 12:15:02 +0000
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
X-Inumbo-ID: f4970159-8a51-11f0-9d12-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fylubzj9I4qaqfmcddEnreXVHB1EIi6Z1hRLI5YrQBgALImT4GQNjwkbRdCBr0ETFOmb+pxu8AzPCJJ+w4ehnaI/C3DD3Hyjti0Y14SoCyCzPVmmcUIF+BGY7xm5mnG6lGl9/+2NzWytbv4DjatuCEFhepOpq1g1pv0WW17hgVvt7sCwXhpw9jgVYSYEdKcgvC67p7jA/8ZwGeZW0PzeBpOerRngb0/iBm3hmX0Hhn72Ipp29RKA8XdhK4v5QlYvP8yXfHSeaUIcHh9dkhHRRpq4YtLo1hueHBAEPG5eNbchzwJCgogreLtjfprYWqkSVaNltcpXF488NpnMv3VQ6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZIuV1UJMoTUBWSq9aNFDeQqYn9FhdU2VmLoRfc3gCh4=;
 b=ZDxHDi+Fcm6R30ojjgXPzyAR6Awn55kJ7Y4EK0RKWilK4cdbErwHWm86sl+yP0bkbZrXNgleWkG5/Q0btEQKlQc13SsuPfgKF8QBPx9J9Wj1lNjg0IGE3RebekEffiUMbdX4+vgnoJm63EezuiiU1Nw54u7MkNXp10atXOgnzLpU9bYyTO9AY7oXleoUdOZ0hUeJfVgDMQsKVG7GkRoaN+vg+gP0MnRuCSpJvJ7zqUCSh3ycpVhXwapE0M0eSYglHnSGtjjAiNj6SEoVfly7R5rk5oCKg6U6kF1SyRFda1BqIWJ6f1arG15p4jfyUY5+X+gdJh+0MMPqOhjpJ1Ebjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZIuV1UJMoTUBWSq9aNFDeQqYn9FhdU2VmLoRfc3gCh4=;
 b=Qhos2ALzxU2xP1kJpZ2FiLrTEkviT3ZLRsiOkDcZhShdYajNe5TNgSqwc+bu/yVpQxeLZNQGjKhO9X0/zpn+mJvqEkOod+Q0Xwrww1i47AyD5iBsOz+GHbUo4Ol/fcjKqu4VNaCI/4xoh+uR2L4h5lBrap4rkGR9FPxjAUgl7nyN1Ch53D4d4TtmJyJmSBa0KqlQEhxJaTl1906y2hew7cKhsZaB8nnioNda968DRBX9n1ENrOkUqQgjEFkFrA/IqMkS+ohuY4WSqRgCrBVZH4xtjGvCPA6U5I+lyv8Pfk0syTQNa7tLPoOz7jyeqMoKmpTk3pSYMqfcLXm3L1YCaQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 3/4] xen/arm64: allow to make aarch32 support optional
Thread-Topic: [PATCH v2 3/4] xen/arm64: allow to make aarch32 support optional
Thread-Index: AQHcBrdwMT62m9IEakijYkjoB+xNdw==
Date: Fri, 5 Sep 2025 12:15:02 +0000
Message-ID: <87o6rpqent.fsf@epam.com>
References: <20250806094929.293658-1-grygorii_strashko@epam.com>
	<20250806094929.293658-4-grygorii_strashko@epam.com>
	<87ms7l39gl.fsf@epam.com>	<540abaa2-9946-40b8-bf49-b54e4f7a1393@epam.com>
In-Reply-To: <540abaa2-9946-40b8-bf49-b54e4f7a1393@epam.com> (Grygorii
	Strashko's message of "Thu, 4 Sep 2025 23:09:45 +0300")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AS2PR03MB9718:EE_
x-ms-office365-filtering-correlation-id: 3767692f-1c30-4c0f-7603-08ddec75d791
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|42112799006|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Zd4NSFCJKrxFXFPrxoZgdwgXSkgAJApYRPMQFSuWYl50mnnNejzftqjGWq?=
 =?iso-8859-1?Q?xoRQ2iyrCl23Cy8ETYTrx+HEIJvlkHsXJfYxHe2DByIV9k+GAbXQKajdMs?=
 =?iso-8859-1?Q?BBd5uOtXcvfRkTpk45cojP+77WavcZBRNX7NQwG3o1WcT/0Sgp4IfMKYMK?=
 =?iso-8859-1?Q?SfM/t2eeoh9XpxLFPjGveHSw7lsd9QefM9JVq2G7FeekWVorD0VPg8VDCM?=
 =?iso-8859-1?Q?eE94Hmm5Yy19RBDoICes3nwujG8//f4p1ALFVD/bzGglPJs5V5c51duXcS?=
 =?iso-8859-1?Q?m6UUyxRwnkZVXPVTDZmnwljjWfVzBsQ/m9nvX4xAzi5J4kEaU/lZBxrjBM?=
 =?iso-8859-1?Q?YsKamIB5S5RNyPmWLYKLbDaE4z3FYGWJxupRN47MQmkqSNS8/AZUvp0mnK?=
 =?iso-8859-1?Q?614SeoStgqOp1mYOv5RTl9xShkgiH3lLSLtpU3vDHl+H+NbdX5usEeKuOA?=
 =?iso-8859-1?Q?ZS377ScpUzTw1rVr/4dnH8CQX1yulaiPNzNvUCf+1T8DbtMfmtzQnIEah6?=
 =?iso-8859-1?Q?HdAgfwrTpa/jCxxR7uXgj4jbOIgFBHnWnicw3q1q63em6d7QcbonjnIZJQ?=
 =?iso-8859-1?Q?HDndpao/9rJVrLgKXOWMNrzyCi3fRktw3ctOtgHIEmvRqgvuBhGgB1Tpin?=
 =?iso-8859-1?Q?zy3YEM+3sWK5jatq8kYgxbt0PL1mHSucPNBVWd3xfEHo5oTtjzn2/J0mJO?=
 =?iso-8859-1?Q?9TMdOVmz73g0W8Jp6hJq0CZtXpu6Za7qbhxeAYRW3N59JH47D7QKah0H+9?=
 =?iso-8859-1?Q?eao5/xA62RO8Advx9ZoWHlcJtrjnIILae30dhRfOVBestTZYuMd3sDul0M?=
 =?iso-8859-1?Q?66VdyMfG1glUAjjNfxml+r8iID9pFaOKjyIhCFT+bcFmA96FTdrAMrysd+?=
 =?iso-8859-1?Q?829pA8+WzqBJUMqa/FUgkw1IOM5S8DhK0bbc/uJuDGsLhBUIRNfNKGbhnX?=
 =?iso-8859-1?Q?gRdFpKh8Zs3z5sI9iLhV+1eB68i1znVLDvNi+jJDB6PEAWpVriWoHHo+y3?=
 =?iso-8859-1?Q?GejjKtqBsUDVlr7byy9xJ1Sq4p8sQuNcEvk11grUMfOAExntjmhsOMwt+s?=
 =?iso-8859-1?Q?NyAZaX+LugXuA46nifZ3WK5EEPgLi+hRTH0ZvzuWjnfDWaro9BOJEXwZtj?=
 =?iso-8859-1?Q?lU772dBcfDIGox4piEibWREQC90kBOlOCwINtFIQMh8Pbgc5VsNQI899+O?=
 =?iso-8859-1?Q?I00ThzhiiBAt413wISmG7L9dlOfxo3BV+gMm9G16AllwVwb+PYZPFRNvg/?=
 =?iso-8859-1?Q?9dGlG1igrn/sILk/bHDNXJCo6eMGQi1Q1EsYrrNQlMmJkGozLjsGhf+5lH?=
 =?iso-8859-1?Q?5cfAa5hdTfUbyp6vHsFzQ+68faf43yGheKYaY5wkt09JSEadtNmO6pZ89k?=
 =?iso-8859-1?Q?wiu0bKOXc79lYuwJbNre3i9WFo9Dx1ICIRpJLUe0vVfhrIyfNtl3WC7OKw?=
 =?iso-8859-1?Q?aYO6O+mD/HcrqOdDVuP5iQDUXyY6GL0emuuGiIy3bo/gj+0yDHcI4GIkBs?=
 =?iso-8859-1?Q?Ra/IPKgpP3+dX9mdcKIOViK7F3PKeERP5aiCIdaBsSjQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(42112799006)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?WSyYaVbIkg4yfFqP5Md0WXGcbX8gRU5gpDfAnVqUIQ6kmIH7bD1XotCKt4?=
 =?iso-8859-1?Q?aDnAYf0oPpboacE+x4bgIn9LtRoWBr7Ye7EgOaeP8N5LXJC73Yhh5q6zxo?=
 =?iso-8859-1?Q?IyfJrS4+wh2/mdYlvWnmXEGinUQeB6UshfNqOf73jCT2N2VWe02kEiMuwm?=
 =?iso-8859-1?Q?4QoyBU5LJu0J45Rmaiwv9L1IsNk9REWUjYJ7+NO5ZhY9riU4Irymq6SwJH?=
 =?iso-8859-1?Q?uj/cbEYChI8ZC3Dh79Y0IOUKzf+zumiA0k2uWqYKc+Fhc3E/hdzXA0QHtZ?=
 =?iso-8859-1?Q?WqJZ/+fcs1gkt5jpT6IlolLHFT6tE2iwzY42jPHNjeZ5qdRWVLvsXAbzeJ?=
 =?iso-8859-1?Q?yc5Cg42U6dZKTlCAg3NJ+1fo+NP27SfUQAag/hVvgmqkBo4DprV51hvBuY?=
 =?iso-8859-1?Q?wF/ymY8FLDeLq5eFfw4Cag5PICq6bNXBZaSdoFzKdYKScYaLaX+216jJkb?=
 =?iso-8859-1?Q?vxgzIxaaWxvITx8X6hq33N/fBeOpP7sXHZGMvTCRNFUBm0ibLHcSNKAzwk?=
 =?iso-8859-1?Q?xKHfPdUNLY09Zw8S4MaY8bCEKKteviYAv34Rxbt3NClUXXWEfl1jaoCux1?=
 =?iso-8859-1?Q?UPCBd9yTC65Hl3UxmLKXnQKxT9+/CnUxg+0nNchPVKzFXMda6OsVBCHNpJ?=
 =?iso-8859-1?Q?G3nXwpbOmcTUM7rwd4+mMUUH5rvxD0SP83LE3w1t0757gi+1puMzEz2EsC?=
 =?iso-8859-1?Q?WpaQy4eiKbHCtWeNurZ/SyEXMTto7qtGGvmuFJ+L37L20/byYRIzEIAE8u?=
 =?iso-8859-1?Q?jMIGmyyjs1rGt21qHGTbTd1bG9mV2vAy4vDTeSVMhzv22Nb3xoZ5WATHIX?=
 =?iso-8859-1?Q?OnywdGPmUlVL0vw3jaRf1RWjd+lwHd6m0PTQh+14iaxje/g3QfQ9dW2k6H?=
 =?iso-8859-1?Q?HkTqUmCUXylrGS0fPsFrt+2HIwL1yEz6KQarRewIBxDEqUu95BjZT9SEGh?=
 =?iso-8859-1?Q?r7LH63rt3Vx3XCkxMuHYku3lm69eFyZBXiN5jQNsr/69gDgeTw66X4frq3?=
 =?iso-8859-1?Q?415g82GSbLzCMgKnd/VycX1P/4mMXB7OEvyz+7P98Pkyy35ZyAFLJHUozy?=
 =?iso-8859-1?Q?1TrLohcSyxcfqQkvnJNGwq3XKFZ/PJo7AyQ4VB/vc9oUfu/NZv4TjQZ3uZ?=
 =?iso-8859-1?Q?l+hLN0mKol4j0RiGhERASSi3I/AfIGM8EGH8/66hQBWoZDwSQ1WtGEF54T?=
 =?iso-8859-1?Q?L/QsCMca2eDhb0FUgArBh/LmWiDl+xS31RiopvFjFxUchCzpKwydaWqB4j?=
 =?iso-8859-1?Q?Vgb3cdnYseb7XSQo20BY9cepncN2i/ZonAje8iehpAetVmKLPQ6u7kDhy2?=
 =?iso-8859-1?Q?eQpywjS/UvBq+VGbwWSlSx/WFUF4Lk5JZanvDFg2znKUMUOQJar9FHI8WL?=
 =?iso-8859-1?Q?4cK3WpK6JC+nlQNbWV6kQmC7fIRWWa8FL/Tt48Pm2IHBQfcOi1eU3dA7uH?=
 =?iso-8859-1?Q?Q1mCvwRhjUc6eQXxCj382FLPFDKd+14YxjI4UZiqu4LOAFqtlRYXW229Q4?=
 =?iso-8859-1?Q?nyllGPbmbMOI0JRoV4i8wSrUjZKRCOdWdxXl/0cXljFCZ1BqZZQAbqN1ud?=
 =?iso-8859-1?Q?fJJdNRBYPHHmmLlcDxebmPAL+cSXpo1qCYyp9VceMAEXk5g6EoTUi7njuA?=
 =?iso-8859-1?Q?15WYBiPgEr7JoVp2taDriA9CoOnDCMpiENL0XgtC+E62BT95T2sGzHeg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3767692f-1c30-4c0f-7603-08ddec75d791
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2025 12:15:02.8313
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d6gWgOQUn2s37FbrusUIQVlt+lqx9enrDSorawxSNf5SVOmd+RLYDJW6/v2iOfTte4/Yj/yjZeuvM8Yso1Qwy/QeM/wct5SuujMG5MHnRX4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9718

Hi,

Grygorii Strashko <grygorii_strashko@epam.com> writes:

> On 27.08.25 03:16, Volodymyr Babchuk wrote:
>> Hi Grygorii,
>> Grygorii Strashko <grygorii_strashko@epam.com> writes:
>>=20
>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>
>>> Now Arm64 AArch32 guest support is always enabled and built-in while no=
t
>>> all Arm64 platforms supports AArch32 (for exmaple on Armv9A) or this
>>> support might not be needed (Arm64 AArch32 is used quite rarely in embe=
dded
>>> systems). More over, when focusing on safety certification, AArch32 rel=
ated
>>> code in Xen leaves a gap in terms of coverage that cannot really be
>>> justified in words. This leaves two options: either support it (lots of
>>> additional testing, requirements and documents would be needed) or comp=
ile
>>> it out.
>>>
>>> Hence, this patch introduces basic support to allow make Arm64
>>> AArch32 guest support optional. The following changes are introduced:
>>>
>>> - Introduce Kconfig option CONFIG_ARM64_AARCH32 to allow enable/disable
>>>    Arm64 AArch32 guest support (default y)
>>>
>>> - Introduce is_aarch32_enabled() helper which accounts Arm64 HW capabil=
ity
>>>    and CONFIG_ARM64_AARCH32 setting
>>>
>>> - Introduce arm64_set_domain_type() to configure Arm64 domain type in
>>>    unified way instead of open coding (d)->arch.type, and account
>>>    CONFIG_ARM64_AARCH32 configuration.
>>>
>>> - toolstack: do not advertise "xen-3.0-armv7l " capability if AArch32 i=
s
>>>    disabled.
>>>
>>> - do not expose EL1 AArch32 support to guest in ID_AA64PFR0_EL1 reg if
>>>    AArch32 is disabled.
>>>
>>> - Set Arm64 domain type to DOMAIN_64BIT by default.
>>>    - the Arm Xen boot code is handling this case properly already;
>>>    - for toolstack case the XEN_DOMCTL_set_address_size hypercall handl=
ing
>>>      updated to forcibly configure domain type regardless of current do=
main
>>>      type configuration, so toolstack behavior is unchanged.
>>>
>>> With CONFIG_ARM64_AARCH32=3Dn the Xen will reject AArch32 guests (kerne=
ls) if
>>> configured by user in the following way:
>>> - Xen boot will fail with panic during dom0 or dom0less domains creatio=
n
>>> - toolstack domain creation will be rejected due to xc_dom_compat_check=
()
>>>    failure.
>>>
>>> Making Arm64 AArch32 guest support open further possibilities for build
>>> optimizations of Arm64 AArch32 guest support code.
>>>
>>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>> ---
>>> changes in v2:
>>> - use Arm64 "cpu_has_el1_32" in all places to check if HW has AArch32 s=
upport
>>> - rework Arm64 XEN_DOMCTL_set_address_size hypercall handling to work w=
ith any
>>>    initial domain type set (32bit or 64 bit)
>>> - fix comments related to macro parameters evaluation issues
>>> - do not expose EL1 AArch32 support to guest in ID_AA64PFR0_EL1 reg if
>>>    AArch32 is disabled
>>>
>>>   xen/arch/arm/Kconfig                    |  7 ++++
>>>   xen/arch/arm/arm64/domain-build.c       | 46 +++++++++++++++++++++++-=
-
>>>   xen/arch/arm/arm64/domctl.c             | 16 +++++----
>>>   xen/arch/arm/arm64/vsysreg.c            |  9 +++++
>>>   xen/arch/arm/domain.c                   |  9 +++++
>>>   xen/arch/arm/domain_build.c             | 21 +++--------
>>>   xen/arch/arm/include/asm/arm32/domain.h | 12 +++++++
>>>   xen/arch/arm/include/asm/arm64/domain.h | 23 +++++++++++++
>>>   xen/arch/arm/setup.c                    |  2 +-
>>>   9 files changed, 119 insertions(+), 26 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>> index a0c816047427..bf6dd73caf73 100644
>>> --- a/xen/arch/arm/Kconfig
>>> +++ b/xen/arch/arm/Kconfig
>>> @@ -266,6 +266,13 @@ config PCI_PASSTHROUGH
>>>   	help
>>>   	  This option enables PCI device passthrough
>>>   +config ARM64_AARCH32
>>> +	bool "AArch32 Guests support on on ARM64 (UNSUPPORTED)" if UNSUPPORTE=
D
>> But aarch32 guests are supported... I understand that you wanted to
>> say
>> "Disabling aarch32 support is unsupported". But currently this entry
>> reads backwards. I think it should be reworded better. But I have no
>> idea - how to do this.
>
> I think "(UNSUPPORTED)" can be just dropped. Is it ok?

As I understand, If you want this feature to be eventually certified, it
should not be UNSUPPORTED nor EXPERIMENTAL.


[...]

>>> @@ -21,14 +26,14 @@ static long switch_mode(struct domain *d, enum doma=
in_type type)
>>>           return -EINVAL;
>>>       if ( domain_tot_pages(d) !=3D 0 )
>>>           return -EBUSY;
>>> -    if ( d->arch.type =3D=3D type )
>>> -        return 0;
>>>         d->arch.type =3D type;
>>>   -    if ( is_64bit_domain(d) )
>>> -        for_each_vcpu(d, v)
>>> +    for_each_vcpu(d, v)
>>> +        if ( is_64bit_domain(d) )
>> Do you really need to check domain type for every vCPU? I think that
>> original variant was better.
>>=20
>>>               vcpu_switch_to_aarch64_mode(v);
>>> +        else
>>> +            vcpu_switch_to_aarch32_mode(v);
>
> Do you mean like below?
>
>     if ( is_64bit_domain(d) )
>         for_each_vcpu(d, v)
>             vcpu_switch_to_aarch64_mode(v);
>     else
>         for_each_vcpu(d, v)
>             vcpu_switch_to_aarch32_mode(v);
>
>

Yep, something like that.

[...]


--=20
WBR, Volodymyr=

