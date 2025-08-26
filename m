Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 991D2B374DF
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 00:26:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095244.1450327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur26N-0004IW-80; Tue, 26 Aug 2025 22:25:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095244.1450327; Tue, 26 Aug 2025 22:25:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur26N-0004Gi-51; Tue, 26 Aug 2025 22:25:15 +0000
Received: by outflank-mailman (input) for mailman id 1095244;
 Tue, 26 Aug 2025 22:25:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VNE8=3G=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1ur26L-0004Fg-7Q
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 22:25:13 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 855a9617-82cb-11f0-b898-0df219b8e170;
 Wed, 27 Aug 2025 00:25:07 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by GV2PR03MB9521.eurprd03.prod.outlook.com
 (2603:10a6:150:d3::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.13; Tue, 26 Aug
 2025 22:25:01 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 22:25:01 +0000
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
X-Inumbo-ID: 855a9617-82cb-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WDMzlL4azzjLqjROpmCWWSeYzAmnXiH6CkH2CEJtAGvUdM6XsQ2hDyflVh2I1qEjc7+0tVtaOI9Wwl9Q8MFbd0kcS9LN2YqptP4j2GRbIlz9+w/n5QLi9TWWeLeCuT2IR4PktRadFD9oVWcCT8aswjJ5q3TyrC49/Ds5rZtq4VUjQyBj7B0UxOyD9INzYcJ92QQHY9U2cohHQ81aKkTjTuFsrZtGP8ZXi+YNrAlfX5TP/MsUEvsyinTXeYHfm/Jzlpl14Kk4gqm3agC4oJ9T+Dq3Y/rkFn18IkR+aNl2VrSiS6QeR5yF6lSiCHtzDYehyGS45wIjUxVhexw8veS1gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iWu6LdBkIyKII95WX8X6tmhFrOMGfQeEdOywmrYe7rA=;
 b=a9ieT6R+BK7x86LxLPc/6qouCQ1KH2lHc/eTB2HbOcZMv5ak0UW1wOi2ldFWTEgptTO0AU7cD5bCmZNyKbCUNbEHZtTe97Vdqv5R+SFpxAMqq2nlLmAVOQqvCYtnC2Di0r1+dYyN9tJ91XM0aryiYgacY4stPntjw2AaOzFzEZTKexOD8JZjpL3djxSDDQ5kAgkVYXajrZwGnV+9dlcwePjQLJ2inRr3phsdVJk9x276bgf1o/gtKmYi1eAtDcp3R1RMVvWCUWpxFTRNIgCHl8mEaD78BbPolXcjq4mtMQMiCLa6itIhSNyufbT75WhjjiKGG80LOSlSHzMqflOW1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iWu6LdBkIyKII95WX8X6tmhFrOMGfQeEdOywmrYe7rA=;
 b=goIQN/+jDiDCxES7+loz04txzS9rgYKNCGw5xPJBDZt24Xg6q5oN88Ks6kGwJilBlTQ3zEPYOcawZtRI48/DcffWH5nrpHYUwlHN8jCJJvivG0EUqHvv0W0LDT1K3m8KGX1CKHiQkZtvTtHIy34DO0OrkO8YEvAmj9x6Q3hHfB66Hk6MIJIxQLA7igk7W7pm9mKflWdmPBrEtf4GH2c8DZXyqwtEwRyHhQtkLpj+w+y1CkCrHwZPmRtNQS6hYX9K+A1P3J8mISZV9FwMFloMB6S5iLsAtvUQQl7I+PCKqVYJzK/KakWo+2cSP353W/PP+JtJSYoZKBl7UnFOoi16tw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"olekstysh@gmail.com" <olekstysh@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v3 05/11] xen/arm: gicv3: implement handling of GICv3.1
 eSPI
Thread-Topic: [PATCH v3 05/11] xen/arm: gicv3: implement handling of GICv3.1
 eSPI
Thread-Index: AQHcFpJ/0RYrIev2JkmWYheOK3kVZw==
Date: Tue, 26 Aug 2025 22:25:01 +0000
Message-ID: <87tt1t4t6s.fsf@epam.com>
References: <cover.1756216942.git.leonid_komarianskyi@epam.com>
	<398ad09617f4f97d57d13fa9f3771bd2db83916b.1756216943.git.leonid_komarianskyi@epam.com>
In-Reply-To:
 <398ad09617f4f97d57d13fa9f3771bd2db83916b.1756216943.git.leonid_komarianskyi@epam.com>
	(Leonid Komarianskyi's message of "Tue, 26 Aug 2025 14:05:37 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|GV2PR03MB9521:EE_
x-ms-office365-filtering-correlation-id: 7612d836-1df2-4a24-25e9-08dde4ef65e7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|42112799006|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?5NzM2IZpgXtzJqNjDpgTnDgp2AUQ8SOB3bdx4kUE60ux4Ekr4aj7tr5RmH?=
 =?iso-8859-1?Q?+Tla/b34X0xev+PJ4yaYYsleIm6haPBsO0lWzCaLHypI+38kn65Qk0uZcJ?=
 =?iso-8859-1?Q?8e1zm5KEfEoPZdbtoRi3Q1DpXLsbqH8bqpnk3RV0a//E4Nky+ILgJ/ccSh?=
 =?iso-8859-1?Q?hCDsBvLb7fuo6nWYrQ6ReH6EUA7Q2i87uzF0Xjcgl1lQMwzQvD3kOX0n0B?=
 =?iso-8859-1?Q?VGSGRrqhe7h5Hxl6eizpdWj4mJ4YBUXjClqkIXC31IcjG7VtxTtTP3SxUy?=
 =?iso-8859-1?Q?z1eHkjy2K53TrVno9Hq+ibvxkBREfDf7dEO9x1HrGryE1HcnN2Xw09khXw?=
 =?iso-8859-1?Q?hfYXugnmsWdgwwUtFf8GGtp2LeiIACNO2b+edf3HSFRm53W4REmb9Ckuq+?=
 =?iso-8859-1?Q?JecVoUO/0RigHj43hzs1c60hUFeKhPM8uCRQ2lhy32+mUcaqPllAlfGiMs?=
 =?iso-8859-1?Q?xlwrD/vgpvw8bwDblwswk7o68LFUyQxZG8QPvxP5/9aX99vAZmSOCn+rWB?=
 =?iso-8859-1?Q?7n+1jwEh+HndaQiM3mM7uPgZy4qVAI2/dkxbclEiU+LE3q/QwepGra11Ot?=
 =?iso-8859-1?Q?yjak5ZilX07PP0plJwCEusjDXReOVgDODau7Y2F7AiYYaDiAGpsHHj04mW?=
 =?iso-8859-1?Q?aeI5RikHujzVXPR/jfLKDVmxJp9anjzyteuDMd6puy8Rn33zgBnLLEObu7?=
 =?iso-8859-1?Q?hXcX8iX8RNzJ8A4PQGI8cmeLE1DfW6EbZX7lo5lwrS7yuO0jOd2SZUf0aG?=
 =?iso-8859-1?Q?S86k3nFQyG4M3EJhtlthFbnheTxS7kZqGtZL1/jol2EmhU2o3sEc6lxqxh?=
 =?iso-8859-1?Q?cqTNTpE2LQH14YAwASK8ChBFckXBryqvAKIozppFM4HRsPkRMtWadAC4D+?=
 =?iso-8859-1?Q?xT6UjIfqFBnNJJeXHPxpe9IMcqToadqhv9vk72SLKxlTL9m+rRv32TrrQ+?=
 =?iso-8859-1?Q?mqclDaoqT6URHb5eXreCr005TU5eWZJJKXtKR4166vgdBN8hvcljTklTvM?=
 =?iso-8859-1?Q?6ZSMytNYtvlHO+EckfL7cRoWITnfQO/qWdBfrr8pPrORsGLnVVQ9XUL3NJ?=
 =?iso-8859-1?Q?+xNFhbFLmGIY6a8hNQD4lSj3T/drUedRr/5Zt4o0BkbnZh+MWhtTnsndN3?=
 =?iso-8859-1?Q?dWS5Q0PmsO32ZdDMjHtdYp1Dh6KyXaWY5PajAcWAcNvZr0P5FCqopG2pQS?=
 =?iso-8859-1?Q?5a/uXbhz7N4o5c760k2gJnXucNP8nP/NYzheAsVTyifnPgQRLchKh5UC91?=
 =?iso-8859-1?Q?SkOFTCnxU0vrcsmsQEWD7SsAvClYPY67YovvYjID2eirUJgv4Cqm07n0S6?=
 =?iso-8859-1?Q?l6uteJYTbKHaw1MLmRWbRjyYNU86c2Vz3GUnjKMmVDQNyx8Su8GwhJoaxo?=
 =?iso-8859-1?Q?7DbJq0PkfjpAvBoIjUM9k/WVbLeqDP9ZnyipVbruCpOOqCQhMIaaBGdkzj?=
 =?iso-8859-1?Q?o/DFONjRQUsiTxi/6qOwSY9lq4hw4P5swtHisCSnc5He7qYIyZo9AfzFsE?=
 =?iso-8859-1?Q?R+mnt7TCBV7rfuhJqXAo0XDZeqAAT+VvGDOKUFfAIIMA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(42112799006)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?WWABKTZnASWcQO0dmwM48bV7pIHo3A+J1OY1z5GaoKP3i5skvzbpHplbDr?=
 =?iso-8859-1?Q?NiVp/47ir6K2aW7nJ+eUJ0BECFeQ+ANy0yX3pqJe6P0ylL7djp054BgcJ4?=
 =?iso-8859-1?Q?B6yWlb3uwJAIb2OBlzCdn468CBz420MjXQF3jKp3JSGWAVFv+BUtWCoJDm?=
 =?iso-8859-1?Q?GumFkvDRJbvSII65dGrLa8le6rfSiG2fp7k4Jk9mBPD27urV1cZj9TSq5i?=
 =?iso-8859-1?Q?TFjM7UNGww2RFxXs2bPQDWvT2ffYmQVGBTTjc6NCbXLmtCizzm1UMgRKt4?=
 =?iso-8859-1?Q?O7UXwvJ67T+WJKWGDJ/0yYY+GSA3Ws1cWUtu04uNL8439rniMCv6CIc35x?=
 =?iso-8859-1?Q?jTwYedON5KRbTbOyrfumvqLMCpfBAG412oGO4oe6x99WGLEeKOBTCsh1ji?=
 =?iso-8859-1?Q?gHtwobJ7GOJV91mD3s/W78wEBiIOn8w51ReDXmXZ8NaQZu6mg3VPWUKLW3?=
 =?iso-8859-1?Q?W7LWd5HcKGMhe2oNlKk9RKwNnpTuENIWlHsCdKgQsooEtsQ1mVcSiKN2jL?=
 =?iso-8859-1?Q?dHjEgYeuRe4NSOIcThlQ1JVL7g1Haf5ue2ae1vEKeTz2UKSr5eM6LlJ4QP?=
 =?iso-8859-1?Q?+TONNEz0gTDb9Jwqgh88BrqW7OXKuZ1Vx/Ml9Z6/8JkQxOIk2VLn27/ek7?=
 =?iso-8859-1?Q?xH9jZ+9afxRtajT1xMQTPjWZRekNZm/1cZnm8fy5ZjGC7taN2J66OkxCcK?=
 =?iso-8859-1?Q?ldca1mrYy8J5CUpQ4OE8REIAUN3WsnNJryPYqeGnRJWT4ExDhm4d+RBw7j?=
 =?iso-8859-1?Q?Tga6OFZ2L8vpVyOI93SnoglAFgRLbg7ntrgXZlLsSWOd5r9FalfjGQX7c6?=
 =?iso-8859-1?Q?NhrnZZWSRoz3LVKafro1yxlgdkwXBPaqRzm4iwoqMR+tqw/zi2GFJNC0y+?=
 =?iso-8859-1?Q?L5/Xg7mL1Sw19EPnF9dTMRCIBin5xs4zeZ/sWiq+VvoEA4iDxtnO1RvCrd?=
 =?iso-8859-1?Q?7XExuofnjATiKQT8NbcscfdYujd2Ej0YigkwAmolF9NreszGqzWZZOqYm7?=
 =?iso-8859-1?Q?bMDEauQ8ZmUEoSgADjymHQCmMDzQ63RkWXt9NdMgbg7vnBw92RuUTnWi+s?=
 =?iso-8859-1?Q?VsupszSyCr08l88c/qFLhxSUz9yhHJuu5ykFmXcFpuHg0rk6a3Zcxfdwv9?=
 =?iso-8859-1?Q?nyRHlAAEz4eVxtsa3GAOyqouWcdThodhaUjJD+7xf98YUQ+0xx2d4gaqZm?=
 =?iso-8859-1?Q?EB3kJ8bAPJeUXQT4xg5bNw0QEjmK5hG8FvdCCnfC+sydxdJql0wrCH4/UH?=
 =?iso-8859-1?Q?GYe8DglredQfKOcueYMDJ62HKgkIOeORWeDePTm6JrXRLno5hw3Mhz0Yrr?=
 =?iso-8859-1?Q?NwSAq8igjEt3FczfD60/bJYU/Khrw68JKbV/7zTy6FekjERObU7ph5SPb0?=
 =?iso-8859-1?Q?MJ8QLngQvNxAwHoj08GLPrShUuMoj1bbQ6UMFmJZ1aE8HXylaqUeRH+krf?=
 =?iso-8859-1?Q?4plXjC5nJP9bjp7tjUa8YezPLG2ic28pIqjTHMxjLgz8D/huvxaZ+ofHGW?=
 =?iso-8859-1?Q?7UftC8H3x6PimWRVYnFQr8bK+s7k700Xw+9cWrnjcRb20XiFeiH4n53T8L?=
 =?iso-8859-1?Q?72J9kLZOIRHlaTLMQCejRqZWNlrsUtoQGEHtSKFhqzX30wYdmeCuq0nofZ?=
 =?iso-8859-1?Q?Kb/2b8av2Ka4kYw+XaaolKIAi/INYOjQC8eJAKy3hwtQ5XhvmDnaEHlA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7612d836-1df2-4a24-25e9-08dde4ef65e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2025 22:25:01.3831
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q71pUeeBMmHKim6oIKXnyn7/crpu/naG0zJy/YMhYrvvNnUwbr+qoRSctcVI0e9l1F8iWodD3ZXxGq47i1OJu4GXKf5hf/wW0MgYq4UVdFg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB9521


Hi Leonid,

Leonid Komarianskyi <Leonid_Komarianskyi@epam.com> writes:

> Introduced appropriate register definitions, helper macros,
> and initialization of required GICv3.1 distributor registers
> to support eSPI. This type of interrupt is handled in the
> same way as regular SPI interrupts, with the following
> differences:
>
> 1) eSPIs can have up to 1024 interrupts, starting from the
> beginning of the range, whereas regular SPIs use INTIDs from
> 32 to 1019, totaling 988 interrupts;
> 2) eSPIs start at INTID 4096, necessitating additional interrupt
> index conversion during register operations.
>
> In case if appropriate config is disabled, or GIC HW doesn't
> support eSPI, the existing functionality will remain the same.
>
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>

With nit fixed:

Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

>
> ---
> Changes in V2:
> - move gic_number_espis function from
>   [PATCH 08/10] xen/arm: vgic: add resource management for extended SPIs
>   to use it in the newly introduced gic_is_valid_espi
> - add gic_is_valid_espi which checks if IRQ number is in supported
>   by HW eSPI range
> - update gic_is_valid_irq conditions to allow operations with eSPIs
>
> Changes in V3:
> - add __init attribute to gicv3_dist_espi_common_init
> - change open-codded eSPI register initialization to the appropriate
>   gen-mask macro
> - fixed formatting for lines with more than 80 symbols
> - introduced gicv3_dist_espi_init_aff to be able to use stubs in case of
>   CONFIG_GICV3_ESPI disabled
> - renamed parameter in the GICD_TYPER_ESPI_RANGE macro to espi_range
>   (name was taken from GIC specification) to avoid confusion
> - changed type for i variable to unsigned int since it cannot be
>   negative
> ---
>  xen/arch/arm/gic-v3.c                  | 80 ++++++++++++++++++++++++++
>  xen/arch/arm/include/asm/gic.h         | 21 +++++++
>  xen/arch/arm/include/asm/gic_v3_defs.h | 34 +++++++++++
>  3 files changed, 135 insertions(+)
>
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index a959fefebe..3aa5cc1765 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -485,6 +485,36 @@ static void __iomem *get_addr_by_offset(struct irq_d=
esc *irqd, u32 offset)
>          default:
>              break;
>          }
> +#ifdef CONFIG_GICV3_ESPI
> +    case ESPI_BASE_INTID ... ESPI_MAX_INTID:
> +    {
> +        u32 irq_index =3D ESPI_INTID2IDX(irqd->irq);
> +
> +        switch ( offset )
> +        {
> +        case GICD_ISENABLER:
> +            return (GICD + GICD_ISENABLERnE + (irq_index / 32) * 4);
> +        case GICD_ICENABLER:
> +            return (GICD + GICD_ICENABLERnE + (irq_index / 32) * 4);
> +        case GICD_ISPENDR:
> +            return (GICD + GICD_ISPENDRnE + (irq_index / 32) * 4);
> +        case GICD_ICPENDR:
> +            return (GICD + GICD_ICPENDRnE + (irq_index / 32) * 4);
> +        case GICD_ISACTIVER:
> +            return (GICD + GICD_ISACTIVERnE + (irq_index / 32) * 4);
> +        case GICD_ICACTIVER:
> +            return (GICD + GICD_ICACTIVERnE + (irq_index / 32) * 4);
> +        case GICD_ICFGR:
> +            return (GICD + GICD_ICFGRnE + (irq_index / 16) * 4);
> +        case GICD_IROUTER:
> +            return (GICD + GICD_IROUTERnE + irq_index * 8);
> +        case GICD_IPRIORITYR:
> +            return (GICD + GICD_IPRIORITYRnE + irq_index);
> +        default:
> +            break;
> +        }
> +    }
> +#endif
>      default:
>          break;
>      }
> @@ -655,6 +685,52 @@ static void gicv3_set_irq_priority(struct irq_desc *=
desc,
>      spin_unlock(&gicv3.lock);
>  }
> =20
> +#ifdef CONFIG_GICV3_ESPI
> +unsigned int gic_number_espis(void)
> +{
> +    return gic_hw_ops->info->nr_espi;
> +}
> +
> +static void __init gicv3_dist_espi_common_init(uint32_t type)
> +{
> +    unsigned int espi_nr, i;
> +
> +    espi_nr =3D min(1024U, GICD_TYPER_ESPIS_NUM(type));
> +    gicv3_info.nr_espi =3D espi_nr;
> +    /* The GIC HW doesn't support eSPI, so we can leave from here */
> +    if ( gicv3_info.nr_espi =3D=3D 0 )
> +        return;
> +
> +    for ( i =3D 0; i < espi_nr; i +=3D 16 )
> +        writel_relaxed(0, GICD + GICD_ICFGRnE + (i / 16) * 4);
> +
> +    for ( i =3D 0; i < espi_nr; i +=3D 4 )
> +        writel_relaxed(GIC_PRI_IRQ_ALL,
> +                       GICD + GICD_IPRIORITYRnE + (i / 4) * 4);
> +
> +    for ( i =3D 0; i < espi_nr; i +=3D 32 )
> +    {
> +        writel_relaxed(GENMASK(31, 0), GICD + GICD_ICENABLERnE + (i / 32=
) * 4);
> +        writel_relaxed(GENMASK(31, 0), GICD + GICD_ICACTIVERnE + (i / 32=
) * 4);
> +    }
> +
> +    for ( i =3D 0; i < espi_nr; i +=3D 32 )
> +        writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPRnE + (i / 32) =
* 4);
> +}
> +
> +static void __init gicv3_dist_espi_init_aff(uint64_t affinity)
> +{
> +    unsigned int i;
> +
> +    for ( i =3D 0; i < gicv3_info.nr_espi; i++ )
> +        writeq_relaxed_non_atomic(affinity, GICD + GICD_IROUTERnE + i * =
8);
> +}
> +#else
> +static void __init gicv3_dist_espi_common_init(uint32_t type) { }
> +
> +static void __init gicv3_dist_espi_init_aff(uint64_t affinity) { }
> +#endif
> +
>  static void __init gicv3_dist_init(void)
>  {
>      uint32_t type;
> @@ -700,6 +776,8 @@ static void __init gicv3_dist_init(void)
>      for ( i =3D NR_GIC_LOCAL_IRQS; i < nr_lines; i +=3D 32 )
>          writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPR + (i / 32) * =
4);
> =20
> +    gicv3_dist_espi_common_init(type);
> +
>      gicv3_dist_wait_for_rwp();
> =20
>      /* Turn on the distributor */
> @@ -713,6 +791,8 @@ static void __init gicv3_dist_init(void)
> =20
>      for ( i =3D NR_GIC_LOCAL_IRQS; i < nr_lines; i++ )
>          writeq_relaxed_non_atomic(affinity, GICD + GICD_IROUTER + i * 8)=
;
> +
> +    gicv3_dist_espi_init_aff(affinity);
>  }
> =20
>  static int gicv3_enable_redist(void)
> diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gi=
c.h
> index c7e3b4ff0d..3f1269f0c8 100644
> --- a/xen/arch/arm/include/asm/gic.h
> +++ b/xen/arch/arm/include/asm/gic.h
> @@ -306,8 +306,25 @@ extern void gic_dump_vgic_info(struct vcpu *v);
> =20
>  /* Number of interrupt lines */
>  extern unsigned int gic_number_lines(void);
> +#ifdef CONFIG_GICV3_ESPI
> +extern unsigned int gic_number_espis(void);
> +
> +static inline bool gic_is_valid_espi(unsigned int irq)
> +{
> +    return (irq >=3D ESPI_BASE_INTID &&
> +            irq < ESPI_IDX2INTID(gic_number_espis()));
> +}
> +#else
> +static inline bool gic_is_valid_espi(unsigned int irq)
> +{
> +    return false;
> +}
> +#endif

You need an empty line here

>  static inline bool gic_is_valid_line(unsigned int irq)
>  {
> +    if ( gic_is_valid_espi(irq) )
> +        return true;
> +
>      return irq < gic_number_lines();
>  }
> =20
> @@ -325,6 +342,10 @@ struct gic_info {
>      enum gic_version hw_version;
>      /* Number of GIC lines supported */
>      unsigned int nr_lines;
> +#ifdef CONFIG_GICV3_ESPI
> +    /* Number of GIC eSPI supported */
> +    unsigned int nr_espi;
> +#endif
>      /* Number of LR registers */
>      uint8_t nr_lrs;
>      /* Maintenance irq number */
> diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/includ=
e/asm/gic_v3_defs.h
> index 2af093e774..d38a3d08c7 100644
> --- a/xen/arch/arm/include/asm/gic_v3_defs.h
> +++ b/xen/arch/arm/include/asm/gic_v3_defs.h
> @@ -37,6 +37,40 @@
>  #define GICD_IROUTER1019             (0x7FD8)
>  #define GICD_PIDR2                   (0xFFE8)
> =20
> +#ifdef CONFIG_GICV3_ESPI
> +/* Additional registers for GICv3.1 */
> +#define GICD_IGROUPRnE               (0x1000)
> +#define GICD_IGROUPRnEN              (0x107C)
> +#define GICD_ISENABLERnE             (0x1200)
> +#define GICD_ISENABLERnEN            (0x127C)
> +#define GICD_ICENABLERnE             (0x1400)
> +#define GICD_ICENABLERnEN            (0x147C)
> +#define GICD_ISPENDRnE               (0x1600)
> +#define GICD_ISPENDRnEN              (0x167C)
> +#define GICD_ICPENDRnE               (0x1800)
> +#define GICD_ICPENDRnEN              (0x187C)
> +#define GICD_ISACTIVERnE             (0x1A00)
> +#define GICD_ISACTIVERnEN            (0x1A7C)
> +#define GICD_ICACTIVERnE             (0x1C00)
> +#define GICD_ICACTIVERnEN            (0x1C7C)
> +#define GICD_IPRIORITYRnE            (0x2000)
> +#define GICD_IPRIORITYRnEN           (0x23FC)
> +#define GICD_ICFGRnE                 (0x3000)
> +#define GICD_ICFGRnEN                (0x30FC)
> +#define GICD_IROUTERnE               (0x8000)
> +#define GICD_IROUTERnEN              (0x9FFC)
> +
> +#define GICD_TYPER_ESPI_SHIFT        8
> +#define GICD_TYPER_ESPI_RANGE_SHIFT  27
> +#define GICD_TYPER_ESPI_RANGE_MASK   (0x1F)
> +#define GICD_TYPER_ESPI              (1U << GICD_TYPER_ESPI_SHIFT)
> +#define GICD_TYPER_ESPI_RANGE(espi_range) ((((espi_range) & \
> +        GICD_TYPER_ESPI_RANGE_MASK) + 1) * 32)
> +#define GICD_TYPER_ESPIS_NUM(typer)    \
> +        (((typer) & GICD_TYPER_ESPI) ? \
> +        GICD_TYPER_ESPI_RANGE((typer) >> GICD_TYPER_ESPI_RANGE_SHIFT) : =
0)
> +#endif
> +
>  /* Common between GICD_PIDR2 and GICR_PIDR2 */
>  #define GIC_PIDR2_ARCH_MASK         (0xf0)
>  #define GIC_PIDR2_ARCH_GICv3        (0x30)

--=20
WBR, Volodymyr=

