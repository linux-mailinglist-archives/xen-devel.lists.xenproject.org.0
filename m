Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E164AD6EC1
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 13:16:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012877.1391387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPfv9-0003KZ-VW; Thu, 12 Jun 2025 11:16:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012877.1391387; Thu, 12 Jun 2025 11:16:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPfv9-0003Ik-RF; Thu, 12 Jun 2025 11:16:35 +0000
Received: by outflank-mailman (input) for mailman id 1012877;
 Thu, 12 Jun 2025 11:16:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PGhi=Y3=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1uPfv8-0003Ie-Ea
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 11:16:34 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac1f19ea-477e-11f0-b894-0df219b8e170;
 Thu, 12 Jun 2025 13:16:23 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by VI0PR03MB10784.eurprd03.prod.outlook.com
 (2603:10a6:800:262::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.27; Thu, 12 Jun
 2025 11:16:20 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%6]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 11:16:20 +0000
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
X-Inumbo-ID: ac1f19ea-477e-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y6R9bGXuAcSYR+ltGiSq5YroriVaP5jBmIMBt9+sV8w49bVILwsFnTm2OXMTXPQMeGu5GTIfPzeM6J8tUx3CNHC+Puj4yAGE8/fJjmfHPdvP2PIZV7TbwWiZSOLl9hMLeuRdu5yBuHI+VhKF3k3dOThelHnr07pcQtuU6RaGZWXItr1LcTlu80x2RXWHy1IoBZijGmmHxkmyWCaDftTogMQbnu0zLtQnqvZULQlkvOgh5NA8+YA7Y2ALK+Z53fIxyt1Cm5cOPARg1Bi+pxWNRronN697a48CJgtOWvZv+msmcJU8WKLIZv2zrcZjnGheO+qy9IsZpt/8PWHGvSryeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MkAcd66F7DOx8TKotTZNkzPXmPC0pC0/r8Ftv3gdFsQ=;
 b=KUkzblBp2RSXuVg/iveXQcByP9Ze+bR7gunn7wCj7L53wF7kPNdEX419bx8tLX3Gc8UYsOtTuocG4XhMmVz0TjdwkzQWKRXr3dOX/yoTLBpwG1T173Qn02j3sh/02utf/4QJyyOrFiJri2u7EErlkUMDlhDINEb2c8s2xDdBqNdvkheIdqda2Q9by+/WEuxAxZKArw2KSIJUarlGgAO6D+n/76c9bmTXAkeJ3Jvrts9VJaD/5yaqlNhVrXKtfHBb6XMChwZmHa5DORXAkh2f9egnFsd3EXr/2qGBewrwgMj74yucyfKvF+/OvxKgRlUKjwIMKsQAz5jB50SGjEfANw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MkAcd66F7DOx8TKotTZNkzPXmPC0pC0/r8Ftv3gdFsQ=;
 b=kOM59G0rAKFynLN9faIblGXuPxR+yjeUkJCCSb+Oo5WM8WxDBOZxyFdKt2lU9JURL1y5oLrYlFT/0jVZSBVt5WQozIuMnBbpqg9cUJWJWHa8rHfFqRTI2+HetAPaRhj0jedqwqfSciN6g1sf4odOfPSYXY0Uv2pqCJrUoCdfolT4yAKImR5D+UWKNkomt54PyHITvt14T5AWQcYzmYo3uJyXg/JxXxoAZjVRi68ZdACuqpOBYlVixeJC2+pJqijt5565/zSLDL1GhGi5E7zRUeiFetaVqjX53xsGn6cDn+U9yomkd8TVlPVWcROnaXUB8cLINh1Fhiat9CcH8Pwl8g==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [PATCH v6 0/4] Add support for R-Car Gen4 PCI host controller
Thread-Topic: [PATCH v6 0/4] Add support for R-Car Gen4 PCI host controller
Thread-Index: AQHb24tsXsw/PPDp202VmuYARImAdQ==
Date: Thu, 12 Jun 2025 11:16:20 +0000
Message-ID: <cover.1749720912.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|VI0PR03MB10784:EE_
x-ms-office365-filtering-correlation-id: 95e81a22-72ef-4c32-5443-08dda9a28edd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?xtSWrYONxcfljyI3NWyoja+LozLwndS930SDZCsM+EH5kc81Y3l3Y6V7I0?=
 =?iso-8859-1?Q?QEWHiMHWk1zx+wMcPh2011D72a4IUw6vvMzcChz5mqMvkBlOvVsYaT0jMx?=
 =?iso-8859-1?Q?9QShXkfyoLHD4FUq2oMgN1kbC4PU6pcTKRAXWL7AacnC2U/VuIseuFsJZh?=
 =?iso-8859-1?Q?WL++31otxFWsA5mNWADYO8Q7QNuClf40GxEVriJ338rx5UGIUvQKMMToVo?=
 =?iso-8859-1?Q?/jrp83XlbTZYiURCmIX4eDCFf64TQGAcSmu7NQAudWfOFVYFGIgj0SkBfn?=
 =?iso-8859-1?Q?IDLJ71XDYOO25sYk7RNU67xd6x87+TV9wAuTx4fknI2xhqJUyxuDG2ncn2?=
 =?iso-8859-1?Q?lLqX5aFKDI/XurH6hqY/Kvl5RN6PJVAaP8vwPKwvBJsGOINX6PYjcujIbc?=
 =?iso-8859-1?Q?kCMNcEistjYE4lSatoiiWWVHICgNyvOkwZb8hXq5AjwuVSVnKp9nWizWEa?=
 =?iso-8859-1?Q?ncpDdDIkxgf4ZkfSyJX3IVQxaMN3X0EjfuePEo5+kXQTTMRJVKcZciZL4x?=
 =?iso-8859-1?Q?l+V0ImkZJvsae7uff6JNGd83o4tvbnjwuynmEnwJxmfpDBpAiHafSdLv2T?=
 =?iso-8859-1?Q?AI+G+rherC6+Gln9qVGHLK/7IhfroycHd/j2HxMMZDV7bY1/pFAuUlbs1N?=
 =?iso-8859-1?Q?sDn3MKUIiRe4VLMkFOBTxKZMWF5ei9QVlLoGVRylOq3srhLZE9BZph2oI9?=
 =?iso-8859-1?Q?Fgwmp8fQ1spi83tYEDsoPYLhyiiMlddhvu6pAkr4LDv3bJWVV/xfYdLhCJ?=
 =?iso-8859-1?Q?CBHiMF5LYKAUmWDKVpEuof5ydI1J8QoLuRYTIxCmGrUi5JpEIuTJeXN333?=
 =?iso-8859-1?Q?9u8+csi8bYWHhmSV9dDGzXW9MRd10JEPTcA1i/hzxLuj4mPN8HnW5s0ZLs?=
 =?iso-8859-1?Q?TddmLQuQacoo9FvSOOr02oFHL+oBijCurFuSKA8LnuRp6QXpmlXUgMGGwN?=
 =?iso-8859-1?Q?Q3XgUecyOpLD6p9x7XvIQS4Uxq0eIzeLmg7QxtH87jGoGVuGIyttLuWQ0C?=
 =?iso-8859-1?Q?5JnuYgj+bq7OH+k4k/acA/G9aK2s6jgBUMqCJcQhvl/EmJhUMsk5W3Deqx?=
 =?iso-8859-1?Q?Pd0rGiP4sGht2B3lHVyQy5QFkl9yRDbZjWWOFPyUKHGQIPiQQBttaoI1fc?=
 =?iso-8859-1?Q?leK05WK/MdH3eym0ymvp3ROYHc6b/e2oiejJAsbzuzZhvFIw7ZddIf0pDx?=
 =?iso-8859-1?Q?5G9GB5FqF3RWXsFfrGipaEpERC57Heww0oyrZnmkeZskGc522oM7ERlk/s?=
 =?iso-8859-1?Q?WmcOqju+0afqHWb6osN2ylleDf65JtOFknTqvWjQFV9gxGnXxR3P/RLF33?=
 =?iso-8859-1?Q?Zov+bKX3Fq11PU9UOoDixJJaTww3XvlsJTmbkv7DrMolP6ZdF86Xf6FKPW?=
 =?iso-8859-1?Q?bYgJ5ZFEkMv4c2Dp1i2zKpsIaTfzafDljjcsWPhiFkpc+U+PELH/9ZDl/7?=
 =?iso-8859-1?Q?E9Vilisevjyt1fJin829kzS0KIKBMJBMaJF+qmosB3ed2DHGdJG6dyLL7g?=
 =?iso-8859-1?Q?T67N6HG9OOz+KHWwT8u4LPXqfcuj94xxNuc+aiusUbZhsnTH6zE1W9bMk5?=
 =?iso-8859-1?Q?6AQClrQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?RyKuZtQOVtxM89/D1vkmWzOAJA42H8ZJBnvGlT4gMhhLKPnDqpJAVtHRDH?=
 =?iso-8859-1?Q?X8MqGjzWJs05RmvAaDAKJzyLKh53U7m6l/T8xV5GpQkWBfQ2CR8srG2tzY?=
 =?iso-8859-1?Q?am3gWlJFg4p9Acqz0Z39jCFiCYcWRsG2visUAPrgvgmkjLRc04PGTd+ShK?=
 =?iso-8859-1?Q?MuMKU6zGY88UtsUDV9L/1YcKu1AQdSbfyDu08EZ41Y9MRSz0OaFj2eIjlR?=
 =?iso-8859-1?Q?uEKYiixHIT/S3iAyWbfQ0GRes+QOQpirC/sFnpg786cNpdFyY8yOAe50mO?=
 =?iso-8859-1?Q?38VWsVeP7KthGTb4yv4ZTtGl2HPag5dxdlgx7/i8y1WHn2yp6G75xi0yPV?=
 =?iso-8859-1?Q?JmH9I9kOGskznz03/N+ba8ZJQeHCr9XaCjFDjI8uy5ciDaPbevGUIKu4bu?=
 =?iso-8859-1?Q?NawWwQlxy+V572LjUjsDUbYgMIzG1g7JNWdfylAMTshZeEIapoccv5NhJU?=
 =?iso-8859-1?Q?4e269nRlVEx5ac7gd4MkX6sbPL6ne5LNwZ0U//AwD2PQcyzp8rSZivwxpm?=
 =?iso-8859-1?Q?PFpGS6gcAQ4rW2kM9eLreqYXOlp9rWE5BvuMM101DakaDe4P/J3j1zqlLv?=
 =?iso-8859-1?Q?SGRuOvNjPgZkDxwl0dq5pm01p5S9za73Uiif153+6cbR7tmLV+3cFOYePp?=
 =?iso-8859-1?Q?+KHSsjinXg7wq8FbApke0hePnt5/lmT45YkXkDNKPLG7JkkJgIFbJf5We2?=
 =?iso-8859-1?Q?vtvu6SCe8ny13MwxPch6Ldve6/ZmqP1Y/sRMqTyb3wkqwU2NBjkYElakxb?=
 =?iso-8859-1?Q?GesN49bkOCr8RLfmFe5jdR+QBq8gSplV8zsgdvRzPgczGaDZvRQiFGbBAP?=
 =?iso-8859-1?Q?b7by3Bq9EVLM103L2epdhOS2t77kUHUIFDGNjyaQn+QKTWqI1HssO8ov7a?=
 =?iso-8859-1?Q?RbRHGpd/gIxPADXzncLaGMIqDxABlwozz7AB/hobE0yoNzRlNm9hP9wB/4?=
 =?iso-8859-1?Q?gx8LqnW/zUkXzuiqB1Amc1ps4bHaF0p8C1tBCis3TLI93tqct0AYCLzyBA?=
 =?iso-8859-1?Q?K5CErusl6UlvLH7omsiRof55C8mUwXz1SutkWOGNUIgsz3XCSPtrLhvkmP?=
 =?iso-8859-1?Q?72QoygpYC/RIXJjuE9D1aQYk/LgZtT9dMYR++rsUdZY5ppqtJ5qSyFRnsM?=
 =?iso-8859-1?Q?KYb3oUNqh/EHKxMXB1bmLSgeczFDJvCGNHwblO7yzc0XbnCefce5z6NbRn?=
 =?iso-8859-1?Q?FqEnBMEpsKctX7Yzhw2GlGXtKKwF/aIjT3WuYRgkPRmM0f+J7ruOQ0qVWB?=
 =?iso-8859-1?Q?cS0YjiZjdnfNLotZyUnnyVDYJpx6X+Xn1dfZx83icDJD+1zHFv3jxFqXVg?=
 =?iso-8859-1?Q?I2+5zVwUqUpG3MVNLhDftFUGLgElwNwFhY2DIl58EC+CmLh7sI/Wt4INyU?=
 =?iso-8859-1?Q?w0Y+lmmRTHcgst1u1uZ6oET2JI9TNJnayc05MjgBh4eIC0ySSoPXljhMnn?=
 =?iso-8859-1?Q?/3IFa9Jm7ri7e6gw17Y68uhfCV+SCUrnmtPdH6HhQwz/TqasrPHBMNHPit?=
 =?iso-8859-1?Q?8bgZM5EHacnBkdXiSam3DdHy8mHNc9evhvE5WC09qk7G6nWTYagB0mCuow?=
 =?iso-8859-1?Q?Ijup749aTudKiJUDnjr92SYgJ4U6Kc5DOXCT67ZWoL2RNSoAZdddkiQuxP?=
 =?iso-8859-1?Q?fkI/YgrzDxFxKY9EmYvHMcyPMmypS69MkaTUXqKdsXBkpm6sBHnTIkEg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95e81a22-72ef-4c32-5443-08dda9a28edd
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2025 11:16:20.2945
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZKYm+AO8eRr3lhomFpvgGWJBiZWyl989GyaYuD23WkF284bM/DV2wYqJHzOo1BZI+PQGSkdKRQHTWrUOdsrJSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10784

This series adds support for R-Car Gen4 PCI host controller.

To fully support the controller, the following changes were made:
- Generic mechanism to support PCI child buses is added.
- Private data for PCI host bridge and means to access it are added.

The series was tested as a part of the pci-passthrough patches[1] and
build-tested standalone with enabled HAS_PCI and HAS_VPCI.
CI pipeline results: [2]

[1]: https://github.com/Deedone/xen/tree/pci_passthrough_wip
[2]: https://gitlab.com/xen-project/people/mpoturai/xen/-/pipelines/1828720=
661

v5->v6:
* see individual patches

v4->v5:
* see individual patches

v3->v4:
* rebase
* see individual patches

v2->v3:
* dropped patches related to ATU programming delay
* improved formatting

v1->v2:
* see individual patches

Oleksandr Andrushchenko (4):
  xen/arm: allow PCI host bridge to have private data
  xen/arm: make pci_host_common_probe return the bridge
  xen/arm: add support for PCI child bus
  xen/arm: add support for R-Car Gen4 PCI host controller

 MAINTAINERS                         |   5 +
 xen/arch/arm/include/asm/pci.h      |  22 +-
 xen/arch/arm/pci/Makefile           |   2 +
 xen/arch/arm/pci/ecam.c             |   1 +
 xen/arch/arm/pci/pci-access.c       |  37 ++-
 xen/arch/arm/pci/pci-designware.c   | 405 ++++++++++++++++++++++++++++
 xen/arch/arm/pci/pci-designware.h   |  90 +++++++
 xen/arch/arm/pci/pci-host-common.c  |  92 +++++--
 xen/arch/arm/pci/pci-host-generic.c |   2 +-
 xen/arch/arm/pci/pci-host-rcar4.c   |  94 +++++++
 xen/arch/arm/pci/pci-host-zynqmp.c  |   3 +-
 xen/arch/arm/vpci.c                 |  91 +++++--
 12 files changed, 796 insertions(+), 48 deletions(-)
 create mode 100644 xen/arch/arm/pci/pci-designware.c
 create mode 100644 xen/arch/arm/pci/pci-designware.h
 create mode 100644 xen/arch/arm/pci/pci-host-rcar4.c

--=20
2.34.1

