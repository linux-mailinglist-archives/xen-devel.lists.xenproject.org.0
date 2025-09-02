Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90052B40EDF
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 22:51:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1107517.1457919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utXy8-0003rU-Fw; Tue, 02 Sep 2025 20:51:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1107517.1457919; Tue, 02 Sep 2025 20:51:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utXy8-0003pL-DK; Tue, 02 Sep 2025 20:51:08 +0000
Received: by outflank-mailman (input) for mailman id 1107517;
 Tue, 02 Sep 2025 20:51:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mdbA=3N=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1utXy7-0003o1-4l
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 20:51:07 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ae426d8-883e-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 22:51:05 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by PAWPR03MB9666.eurprd03.prod.outlook.com
 (2603:10a6:102:2e9::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 2 Sep
 2025 20:51:02 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 20:51:01 +0000
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
X-Inumbo-ID: 8ae426d8-883e-11f0-8dd7-1b34d833f44b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nr+CTPh7NaT3v2vD2gynFLwSvD/CF2nwaIpLJi0WB0FoanG2+tRHoaYS4Zc21mK75Bb+hpGhiPgiisSVyiEfdzTBNVcnFXBAHBFdq6BqXcAII4hYo295f6KA6vXfR6vsU0XIiQEkORM3yaRKdCii9KdRRkpUl55+ykeR/6KWUsMKRCwReMARGsjmJdWrmb3HUFbkF45c8iTMFdOAt6BEdKFAta105FYmbxwXFsl9VNupyjH09D7tzt8npNhyLb2DAuOsZDrGZa4KKvUrmKGtFvSCuL0/HyxDrbh9ewq2pZsKYMjOWeIkfrNSMk1EblYW5DISwphlKUB3zNfqspRr2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xZg9WdvBc4ptVK6Fzpby0SF6v91+OlzcC6RnQhtWsRU=;
 b=uOO7cmXqfj/R0TO7PBP1V9vX81FgrmeuHTiHqQq0Ev5WbFlPEh9SsmSnfLrFNFgW5+GZ9LLQZ5/uUw59OhQe9UV1b+YNyu7wG/LUh/4mLKH9SwU9Y09WRC83aKYVGfSM4ZN7RGo6t8ov/jdq829tMPKftGLQ+25nfZvCURt3RcNJIgTX8ItrRLdt0FIYK7tKflT1ZNJLL++K/kvswVOXL0mP1FHGZ/+mW+dtzzWMYAMJboTAzemsPpPNJEGOWFFD+Y5WcVmYqGochrQEoDeDKB//OZyQVuXILJ9wtJkiaCzhfzuXGZtN4x02JkfoGb6WWNVUHImOwCxPd/Ykv2zWBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xZg9WdvBc4ptVK6Fzpby0SF6v91+OlzcC6RnQhtWsRU=;
 b=nzXuFClTQv/5MwM9qAibKDDr+tqn61CtwOLmxRmfOpdfCI6gBhcNcz65fB7yS7WPFQ5UcARWN77cpLhHYV2nfUcx7RohZnbF3ucFupj62U4kK/HjecG+8Lf546GmdoXAWh8CbMkXwMse37E4Q/xvU9g4qHS+QUkXLl86n1E/YIJApdzXGaBWLpDVJJV37nakbjUBYzC3PPuBD4EENUH87Iy/KCNTZBaLlUxl8KTr7CWf8Dj1Jtf9DzjQI89ZpwdY+BqoXUgvPrveVqxDo9gPYlRHbEo+bF0BLkfMmxWaOxrbCIfP0rGdmCgdMB19gpAq2LzMNOZvQQ53scCmfjHQ1w==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Rahul Singh
	<rahul.singh@arm.com>, Mykola Kvach <Mykola_Kvach@epam.com>
Subject: Re: [PATCH v6 12/13] xen/arm: Suspend/resume IOMMU on Xen
 suspend/resume
Thread-Topic: [PATCH v6 12/13] xen/arm: Suspend/resume IOMMU on Xen
 suspend/resume
Thread-Index: AQHcG40/8HE5GdQkB0yiceKuLwbmGQ==
Date: Tue, 2 Sep 2025 20:51:01 +0000
Message-ID: <87ldmwvarv.fsf@epam.com>
References: <cover.1756763487.git.mykola_kvach@epam.com>
	<a846121bf586667f9a7a984955589acb9026bd68.1756763487.git.mykola_kvach@epam.com>
In-Reply-To:
 <a846121bf586667f9a7a984955589acb9026bd68.1756763487.git.mykola_kvach@epam.com>
	(Mykola Kvach's message of "Tue, 2 Sep 2025 01:10:16 +0300")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|PAWPR03MB9666:EE_
x-ms-office365-filtering-correlation-id: 57fdb8a9-5609-450e-ef90-08ddea626d05
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|42112799006|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?goqhH50nrd0UuMRUhZVbtZQqwOfWiX7N1OQMptZZTonhCvPuGbWw8iFqmg?=
 =?iso-8859-1?Q?JzoJi4Hg3+PPPGIOdcdrkPeTnGomlYNFdmiaeU6Apj7NyZrTpXk0wGmN3B?=
 =?iso-8859-1?Q?2AfaeKgT2kSU40zFrFo6baEP5CezkhPOwNzqmS09KrdQhMS08LddILDjhG?=
 =?iso-8859-1?Q?37cs7F8Pxp5mYEZ6K/L9J7A1D5uKa3iZE4cnNrLa0xe3l9Ig5qPCL2e9wP?=
 =?iso-8859-1?Q?i9uHvMNw/shMihW9LuBBsg9WWl8up7G61DqEM126SnTAdy2RP0HEXNI6bB?=
 =?iso-8859-1?Q?Akjyl1Yigwt/GGcyrjJ20cUAgdbE4GU2fS7B9vGSkbsvjc9CKmx5AFD6XH?=
 =?iso-8859-1?Q?Ru8ZvThdEOCpYVFJGDhx0fwXx4qh6MTETPPCX7xhQQJ3H0r13mBq7ubstC?=
 =?iso-8859-1?Q?p2I+ehrNtyjqnQwMF5p9h/8/FjL/z4ZuFfaS87J10A0NbOlujRm7Mz4ybz?=
 =?iso-8859-1?Q?8hjFRKOlm2A/ref/IYoVnsIKYs0VfYJeMGg/fYYt055GUHgVF6T8T2gVHw?=
 =?iso-8859-1?Q?AqIYPeCzggIRT+UYq6vtjiL9AKqvmDcHFHD/Hm+ty8nUmMQwerrKqX+aQa?=
 =?iso-8859-1?Q?SwjAk7wTtN8als7p4N6FM7PA8FdLF37Y6PjKQxuP2cbrW76pNJzuwmYhEL?=
 =?iso-8859-1?Q?fGvcIcjmql5pUGbYwbrYdmTN1kUCNgYrWQO6wmrwUwPfW1ixdlFZKpam2S?=
 =?iso-8859-1?Q?twf1Bk/KD3OfsnemRnqPy9+iaEIOGQRUHd+XlgBVrhLibGsY16IF8EFc+L?=
 =?iso-8859-1?Q?i1jnjZyFGaE5ukCr+OO4iFebbAXhmllEynH6fqHBa2rv4SaTQRk4ObZXsJ?=
 =?iso-8859-1?Q?F84TOrLqFkeuPr9K7vH+GYXnf8ku4CdoykD17A5ThPYMDmMIxC8MFY5IAO?=
 =?iso-8859-1?Q?0ZSKDpF5otc4uMEI5tQyUMgU5e0hNJkxUKFfNnqcSDWfX66BXveu2el6KV?=
 =?iso-8859-1?Q?skUe4Nufkdjs80lJi9+QvJf0xsPCJvA+I55VTbhcQZTo6rA5NS+Zp5sS0i?=
 =?iso-8859-1?Q?sTu7VuZT415aZ5orsDPCArvZ0/8USjjReL5caxNTlparT7Lyoa0aYLu0WL?=
 =?iso-8859-1?Q?C1zdUBmAWEjxTzPSSPUjfqvdYdli98OnQEJqvI+kBWaYadjjGABNHUmU4u?=
 =?iso-8859-1?Q?gT/w9Jv8zCD1VXwtvuuhSu2/954mURf1InKE4tlxrP3AD61sa2zy+0Q9v0?=
 =?iso-8859-1?Q?2NLCQNlO4o1mT2UTzQaMVlI05STrCGcw85gTiRTC8y14H6+RkuJyMb5qo3?=
 =?iso-8859-1?Q?+TQ1mukjuxkuiUOZwbf5f7+n9KT3zzf6rNp3Q/aEVPhfuTFysbg8Vdwhqw?=
 =?iso-8859-1?Q?8a/JaPns4I7o8pMvEzHGdfa8PTlZMEiIq7o7SmMDBqUYJFM8xNqY4z28Az?=
 =?iso-8859-1?Q?JezmiFqWBA6A3sr0+esx7XaPEP8MqUEWJHDzIGvP6eJmLWhZFYllF4DdLm?=
 =?iso-8859-1?Q?8TxuK5ejcADS26EZ3l+ZHEvv7WAkTgmCx6+ANsbaXU5cJu2J/txBVHcxMQ?=
 =?iso-8859-1?Q?DbnIXukB1ei5XjzRq30wOHOw6DZngfN521U+0bvJUmgg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(42112799006)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?XNDoOMjzykRHvAPxrgy7HEptBGh9mbE9SF262K71rhBMxXNSRriWvMDIwq?=
 =?iso-8859-1?Q?WSxxkr9GHWOl2oASLxnc4ocLwqtrqpAdFDVpz4qTYWsBGuF5c+ZeKlZvYj?=
 =?iso-8859-1?Q?UEfumDHPxZNBk6v3XqFc0yaJyH3a2srMd2vHjj3TwLw3VzrakJIxkV9bQ+?=
 =?iso-8859-1?Q?YBMj9OIztgWua0gyNhP3kRoyryd4Rc0Z1s73ccHcToT2N4QKZQO2LSc6yb?=
 =?iso-8859-1?Q?21T+vcnekUDvlPbw31aH5dU2xDdBFxQkE11VGV6mOq8TQcdM8LyQefWGGR?=
 =?iso-8859-1?Q?kwmuceAiZZoswixjTr8tRPmo2rYzKwNiiuZdtikPz7ZQ2Hcy4dCtIkaIBr?=
 =?iso-8859-1?Q?5piM8Z7ApOlZ4FhHw1fJAMxSGvi5YdCkY0rqgbjeWAJoyO7OS+pT7xdrAV?=
 =?iso-8859-1?Q?Bwtk8Dn9+IgTnfIhACJHxHeckhJriaYXPVkOYWyGwme00A7D8EIVLOwQky?=
 =?iso-8859-1?Q?TPCfJ9Aqo+9kzVOFZOX+cdnKkT6djC3aQpyrFCsYByPARD3KBwYN7n0Ymx?=
 =?iso-8859-1?Q?Ril+rJn2key7LvP0OEmFxLRnW2WBveWp8K96jnNqveRdKPGXCZR04CP5kL?=
 =?iso-8859-1?Q?3flMg0ZmHvUE7Dj7+8w307td8y06nAoO65pOQzkleGoRsL0g3vi3xWX66X?=
 =?iso-8859-1?Q?9IzXjqsl7TRPpxZe91bT17cRCccdECry+uzuK6xHIkg/Clx1gHDntUprjv?=
 =?iso-8859-1?Q?nf4mXcYON7KpOELzySc6FroN4taQKw4YpJOD6N7r1bEvIi2ZnQ90ryvSAN?=
 =?iso-8859-1?Q?HwwmfTNum9le6vqrqRcDQFa1N6+rh6HAuSQVISDRbxZjeiwkpaflvW+lrX?=
 =?iso-8859-1?Q?SsvasaMrsCdkQ+HXVugW7yrYPIxjOnPxUd4TlCGOB7oCRQMHkd0rAeiog4?=
 =?iso-8859-1?Q?gYLAvRL3X6n/+vZ7TMfCsvQjH7mqRycEQMoTi2HlMcAAohKAVlmvk/yedp?=
 =?iso-8859-1?Q?cZV1goRULTJNg2ZhS6wJN64sOjbig5tZYIVf4Y2J4rBhAzm6wNH7sUfB0J?=
 =?iso-8859-1?Q?Xyr6Hx4kr0tGYYRUpcx6HtMAaxkkshym3uvJP3NzHXwpza3t4gLjRoJ3s0?=
 =?iso-8859-1?Q?1JiXVpkyQRmScQKL8Pz4pZvBfcUl+t7fpBOnV/cynRZ7Be/R/LGoTD+yu4?=
 =?iso-8859-1?Q?WuJdzmzIuEUdCgy4212TKOJwigPSAo0ADzp399zFoK3jLZMZF0wAp/pvTI?=
 =?iso-8859-1?Q?bhLbJQRGjQb9qmQ6gnQ54FYZTNb6TZWUlxO+nlzr+18B/t+aDGnGwt+vtH?=
 =?iso-8859-1?Q?zhSLmdL53jIiqDGwGdTu7efeIdfI2pDU4MwRkozp5NsIGSWQDKIKXsO6ae?=
 =?iso-8859-1?Q?htBIkiz2tQoMffvAIsPhWUm4WQ1Sh/vRnPz17qWRLaL0lmEbrWfyY2RsBv?=
 =?iso-8859-1?Q?u9D6p2Wknlmg7n0zHo8CfVQI0gQvY0jEzl3u+38uMvFb1T1aYpo4obFZvF?=
 =?iso-8859-1?Q?7RhTDKLp009PulZ3bCEoy3phgDSPMhQzp+NJjCrVzYINAEjWMUpP7ilOEG?=
 =?iso-8859-1?Q?zK4kyTnJcL+sti60te0cDpwaRofUHdzDnM//h3iJgkjb22CuEprWMmTYnc?=
 =?iso-8859-1?Q?kGD5TqslPP/5o7stemTQkc71mUhCLNZg48H2UoDiD7z6HkrO8Ix0imjHMo?=
 =?iso-8859-1?Q?iW+/tiMpkS8aF2Qftu+kWWM8KkrPwPF0ghJlIbCF5+c/dbIfaETD3u9w?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57fdb8a9-5609-450e-ef90-08ddea626d05
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2025 20:51:01.3004
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oODbxUsqtf3RY0Y/UUylZ/wISDvz4AoNIhWB2lLICVeRaYTpiemK2Yj2inHD4KuX5SddROnW8wlLTRmMOGQwj/L1unBMGRN8UZVzn1FhLhE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9666


Hi,

Mykola Kvach <xakep.amatop@gmail.com> writes:

> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>
> This is done using generic iommu_suspend/resume functions that cause
> IOMMU driver specific suspend/resume handlers to be called for enabled
> IOMMU (if one has suspend/resume driver handlers implemented).
>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>

Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

> ---
> Changes in V6:
> - Drop iommu_enabled check from host system suspend.
> ---
>  xen/arch/arm/suspend.c                | 11 +++++++++++
>  xen/drivers/passthrough/arm/smmu-v3.c | 10 ++++++++++
>  xen/drivers/passthrough/arm/smmu.c    | 10 ++++++++++
>  3 files changed, 31 insertions(+)
>
> diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
> index 35b20581f1..f3a3b831c5 100644
> --- a/xen/arch/arm/suspend.c
> +++ b/xen/arch/arm/suspend.c
> @@ -5,6 +5,7 @@
> =20
>  #include <xen/console.h>
>  #include <xen/cpu.h>
> +#include <xen/iommu.h>
>  #include <xen/llc-coloring.h>
>  #include <xen/sched.h>
>  #include <xen/tasklet.h>
> @@ -62,6 +63,13 @@ static void cf_check system_suspend(void *data)
> =20
>      time_suspend();
> =20
> +    status =3D iommu_suspend();
> +    if ( status )
> +    {
> +        system_state =3D SYS_STATE_resume;
> +        goto resume_time;
> +    }
> +
>      console_start_sync();
>      status =3D console_suspend();
>      if ( status )
> @@ -118,6 +126,9 @@ static void cf_check system_suspend(void *data)
>      console_resume();
>      console_end_sync();
> =20
> +    iommu_resume();
> +
> + resume_time:
>      time_resume();
> =20
>   resume_nonboot_cpus:
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthro=
ugh/arm/smmu-v3.c
> index 81071f4018..f887faf7dc 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -2854,6 +2854,13 @@ static void arm_smmu_iommu_xen_domain_teardown(str=
uct domain *d)
>  	xfree(xen_domain);
>  }
> =20
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +static int arm_smmu_suspend(void)
> +{
> +	return -ENOSYS;
> +}
> +#endif
> +
>  static const struct iommu_ops arm_smmu_iommu_ops =3D {
>  	.page_sizes		=3D PAGE_SIZE_4K,
>  	.init			=3D arm_smmu_iommu_xen_domain_init,
> @@ -2866,6 +2873,9 @@ static const struct iommu_ops arm_smmu_iommu_ops =
=3D {
>  	.unmap_page		=3D arm_iommu_unmap_page,
>  	.dt_xlate		=3D arm_smmu_dt_xlate,
>  	.add_device		=3D arm_smmu_add_device,
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +	.suspend		=3D arm_smmu_suspend,
> +#endif
>  };
> =20
>  static __init int arm_smmu_dt_init(struct dt_device_node *dev,
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough=
/arm/smmu.c
> index 22d306d0cb..45f29ef8ec 100644
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -2947,6 +2947,13 @@ static void arm_smmu_iommu_domain_teardown(struct =
domain *d)
>  	xfree(xen_domain);
>  }
> =20
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +static int arm_smmu_suspend(void)
> +{
> +	return -ENOSYS;
> +}
> +#endif
> +
>  static const struct iommu_ops arm_smmu_iommu_ops =3D {
>      .page_sizes =3D PAGE_SIZE_4K,
>      .init =3D arm_smmu_iommu_domain_init,
> @@ -2960,6 +2967,9 @@ static const struct iommu_ops arm_smmu_iommu_ops =
=3D {
>      .map_page =3D arm_iommu_map_page,
>      .unmap_page =3D arm_iommu_unmap_page,
>      .dt_xlate =3D arm_smmu_dt_xlate_generic,
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    .suspend =3D arm_smmu_suspend,
> +#endif
>  };
> =20
>  static struct arm_smmu_device *find_smmu(const struct device *dev)

--=20
WBR, Volodymyr=

