Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E16ADB38EE5
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 01:03:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097114.1451570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urPB8-0003s0-UD; Wed, 27 Aug 2025 23:03:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097114.1451570; Wed, 27 Aug 2025 23:03:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urPB8-0003pP-RP; Wed, 27 Aug 2025 23:03:42 +0000
Received: by outflank-mailman (input) for mailman id 1097114;
 Wed, 27 Aug 2025 23:03:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QSw+=3H=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1urPB7-0003pH-Be
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 23:03:41 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 120e70de-839a-11f0-aeb2-fb57b961d000;
 Thu, 28 Aug 2025 01:03:40 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AM0PR03MB6324.eurprd03.prod.outlook.com
 (2603:10a6:20b:153::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.13; Wed, 27 Aug
 2025 23:03:38 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9073.016; Wed, 27 Aug 2025
 23:03:38 +0000
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
X-Inumbo-ID: 120e70de-839a-11f0-aeb2-fb57b961d000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=peduJ9WTSu7E+j7iCSxL49JBlP08f1gjaH5MGl5wIPualGeA6iid8c7tW3oNPa5C99f/QSS5fDoEDdtiZRciZmqTaRowQtaR70mHXXUokcTLhDuWn55/XYQcb55DfgyIr3jwlMvwKbph7Tv0UJCx93ycVivuJzqQUdlsvBGpgJYnFwc0tQVNZqBNJXTcLNid4DX8kH0E6KZG/sqZs+KdFmv9+c4Lzn2VvkGMEZl52rlHwvqHgc2kR3codCL70T5R9mlcmK8yIao8ylo6tjyk6ivXSxMppdtcx2yR2VG/qwQqgZwFvmnnfBcgOQx694mkoWrJe0LvJkSBrSJCzpsNtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3UHPlJstLob0MZydGFoOrkN1Cbo8Lqz20NSSeNYS/e0=;
 b=Z1Lk4ZGpZBRwp3SEXWwhZtrAPwmfHF6EtZmCaZUL0YsXaFCGIcqCrA/wertmC+/gzG+FRX2r3ZS4ojS6I+ky6FQUlkm6QmfGGg4huucONk0Lvb9r2f8UoaS6shVgAs1addVPKf+i9FiwkI4mTqxvAyo6pEZOend/r+1AIh7hmFrhBi8Bhr6mYXVUDzqGQl4Ndrq1/nKLXguXAc97i3p+W9m0eEdST+CCTKFMi1W4iM2JYIXPQgajs5UsXdkFACub1OQr2kHW/0anYzqBSczV+B092fDVyOckO5y/4lsrdABDMME9f0aEZ5OQsoynEjvEurJTvuKrWKMgpVStDq3EcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3UHPlJstLob0MZydGFoOrkN1Cbo8Lqz20NSSeNYS/e0=;
 b=hpo4QzAXPL0vlFC76Ei54pKrAGOdMGqKEpLmGqdnX6Dzr3eYO58IWdSiDZnziaTK5ysgetwYRPvntkX3hnymAgzO/pZmIUPbg3xq47fEhS/G6PYbE1Ub3b2QoxRj1p0fAIxPQt9kJIpCEX5NhcGa9M1KE2tKZFe4qRuiBDpz8lIK6jPH9vx8HU87GjSipjmjC/XwN4jIHPIrfgeGbfXCHoAUYeRHcijGVU9VKkJsbmus54K4lP+LyUg/n6hKZwI184qAGa06KI4lrLbZumwhzl4Sac0sXKkt9Mln+7zqVDQIn89ED3BjT6HKhKpH98D7MUjz6iksUR1qTZ9OZm31mw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"olekstysh@gmail.com" <olekstysh@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v4 09/12] xen/arm: domain_build/dom0less-build: adjust
 domains config to support eSPIs
Thread-Topic: [PATCH v4 09/12] xen/arm: domain_build/dom0less-build: adjust
 domains config to support eSPIs
Thread-Index: AQHcF3/PBFIJhCUS+Eih9nfOZZJmpg==
Date: Wed, 27 Aug 2025 23:03:37 +0000
Message-ID: <877byo1i5y.fsf@epam.com>
References: <cover.1756317702.git.leonid_komarianskyi@epam.com>
	<66b39c4ba25e7a19beeca62ab23f5d3ab3cbae52.1756317702.git.leonid_komarianskyi@epam.com>
In-Reply-To:
 <66b39c4ba25e7a19beeca62ab23f5d3ab3cbae52.1756317702.git.leonid_komarianskyi@epam.com>
	(Leonid Komarianskyi's message of "Wed, 27 Aug 2025 18:24:21 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AM0PR03MB6324:EE_
x-ms-office365-filtering-correlation-id: 22435f30-d8fb-4a26-37d4-08dde5bdf518
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|42112799006|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?HYNSpUJCKzU1a/Jx5OQkuDcfYdofsipbtUYoeSHmcjVym2DKZa9rIVrLnY?=
 =?iso-8859-1?Q?CS18kryB8xCORVQnezbQiiJo4C1UfxKwGyk4oN3N2C967bEz3p7TIjmQbB?=
 =?iso-8859-1?Q?s0z8zP35+fk+BNeNaYNxhqExL38fYLWIELjpksJaOAy/0KtPTXQGu3qzmo?=
 =?iso-8859-1?Q?dzVbRMwcYGBWtADx6F7Y+9BkIt8L/fsB/SzlUAO1ExGAQDo8FjA+4aRObT?=
 =?iso-8859-1?Q?nAZY5qIX8M8PJTRjh+ABGJDBaRQGTuNPxvXhdp+c/6upKdxwCT9CAdvPly?=
 =?iso-8859-1?Q?hB3EhT00F2Pr4aETEqOyrCpN4ix9/X/6Ltt1tdweGJyZoB7CESyh9TkJcM?=
 =?iso-8859-1?Q?IJMp9kxGM646M26ubrnNYT5QxmLGM/OMGgbZRwU5iudVmCZ5CZB3ZO05m9?=
 =?iso-8859-1?Q?5qqI+JS+8wlSGlmU4B1LGYapRi5fUQafIJ6QV0rytUfzl8PsWPZAzkFaDU?=
 =?iso-8859-1?Q?/fpmUBciOR965I3NSGD/PSdSlRfifVyu+0ycZZ0PuCDwBKd45KrOW74xuS?=
 =?iso-8859-1?Q?/GTyF93D8KfwysDv4p+vA1w+K1ZJDhOqhkU2XHtOTy1Mg2Im2SfYT+0CSm?=
 =?iso-8859-1?Q?lSt+PetAqvZ48TkONikO+/fo0i80+l/YuQ+Apslvo9MYX+zCLUGqE7fn9a?=
 =?iso-8859-1?Q?Ykvfum3tR3Es+wxurTR2B+wzaw6MqEpwLxGS3dzUq7jjrbFWV/DGijqT6w?=
 =?iso-8859-1?Q?P72z0RXV3KeqlSXXDzDZ1mTuBJHFLgirTfqmNJOoOp/Ys/ct1mpS49/Ifi?=
 =?iso-8859-1?Q?gHhQ6Wi7DZb3kK0K6BKuKK5i1JoWZ4QF+1OFGNlYUwDJlbQmlaIoGdTnSf?=
 =?iso-8859-1?Q?FusdEg5bGfbRFjfOyib+w9QuEO4iUPeLyhsOIzFlg63NMIGvFXJxxIIBPm?=
 =?iso-8859-1?Q?YLpRMq1sdTK3H6yZrr2ovOWHymsl73bzDPiFdYim3YQuCTRHFkrU7EXKuE?=
 =?iso-8859-1?Q?aBLfwrELX9VT4zqznnTiFjSE7tlpsiCWvnHiaStRKAXqoLLQj9TVEPahYQ?=
 =?iso-8859-1?Q?0eYWH6HV6yH12OEvzzWeku3eMFfRbRy9mItkb5vCSxFGDC1cgB/xfX7h04?=
 =?iso-8859-1?Q?rViJnXuwPOZlRxOFQCNLQ718AohaeWcI7t2qN/SCeOUuj5JUDJXXCNtBz1?=
 =?iso-8859-1?Q?/HGlp/n1yxFXFni3wi/RdicdJ5bJtWIsXtrw7kPBgSmhj2vSwZECHkqEy0?=
 =?iso-8859-1?Q?YwpscUXulGWf8Yn/sGXdv0WHHBDdt0CHot7B+mkVRd0qvS4Wy2T0a52g3l?=
 =?iso-8859-1?Q?llBXrnELeIv9vcYwPS4ZoVIZ1GRhj9XO0MU44ZukMixgP6S2fyH/F8P6BK?=
 =?iso-8859-1?Q?SCz3bx8daneCxQTpluwMyWFIWqeaVOr3OXSVzwGiUgURDX8yBQIZ03F7Ob?=
 =?iso-8859-1?Q?aDP0a++NkbIjiSAQwvZ8ou57DCDTlmHPqqobBOdsRxbEaxqojmrfnqYo4h?=
 =?iso-8859-1?Q?PAHKf9fqKN+Ipyy6JrhR5zte95qLQdGm16G/EgPSCFx4mYBWXTZO7URFqv?=
 =?iso-8859-1?Q?Iwo2XGOwzsMksyQDkSF+r9QRkKOagToakdkYNEFJyynA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(42112799006)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Nbyb7jNYc0kLyf+pbiOpqQyZlxcsMbW14SfCSUtbB5lntz1IYabxcPN2Kj?=
 =?iso-8859-1?Q?oj+ee8IzZA+AZ243loPxfBkeH3Z8gPBZ4FGeZ7qbSDA5cY+vERam7PdIvC?=
 =?iso-8859-1?Q?p2egDrb5r2LGQ1M0ZiLz8rM+1+hAJWdDtzbwgXURrwmJ/EoW+AJRGBvJoH?=
 =?iso-8859-1?Q?4uX2AdsLqcA3VSseV+B1Vlx8DKOvECM3JptxmRGDahXmUJfot69olgfSR7?=
 =?iso-8859-1?Q?4sMoiT+l6ePWShkS3eqDib5xNxxmqvuD54OtKsHfTlyge49ruBkfzpQ8sC?=
 =?iso-8859-1?Q?KJMW4tVof6FUa0mDmwRPG3c85Wv0r2AOT6bZOZaqoCrl9tHkOLvnf245Hm?=
 =?iso-8859-1?Q?ly+aZ8cU+RW1hev2Qo5vLhhbfav49eMhtS+3IzZAyCJG+M7V/M2NtGDG+1?=
 =?iso-8859-1?Q?DmKTCHJ1wkjO/47Z97p8cLhwOkphJ/kHeGsxBktNQw+cd5HndzLy4L3Awi?=
 =?iso-8859-1?Q?GOWYG2tfg8SNFMzXVnWJNMV9hdE5njTHqCW+YMaxTcZoP/mXMUdPGkQb4C?=
 =?iso-8859-1?Q?z1F9e9fW/luKYNPviq1rmwtu1jpR6NHFZmgabzgzhvmXrRMeToRUNnnZuC?=
 =?iso-8859-1?Q?/zMGux3xC1W2KerARgWrw1tkb1CjdnXP/w64rnk8L0kbqy+g/MlgFhprYa?=
 =?iso-8859-1?Q?DyHT/gPYxXB5UjLNK6c68EvpFNQhHLnhWCfxom48voiwjDMQZ9HR8In3tc?=
 =?iso-8859-1?Q?Nox0jhSsEmnvZeWvMKe5tFOqIyImSgRvFKhocTEwn3mjF10kBqtixa6whf?=
 =?iso-8859-1?Q?q953D51LmFE9qEUMLT3SUwFyiU6z+2pvRiR5XujpDFN1TR71eOZdEMIRwv?=
 =?iso-8859-1?Q?yk1fodZO3LbF9QoA1aCZ8ja5O5HWgGsSMliAx0YSbfNObHfV0Va1xy+kBy?=
 =?iso-8859-1?Q?7LNNYAHdFoi2QS7C69Bxg7SEUhYWivAlBxVmtuuaBheQEifb6jbG6PHpJg?=
 =?iso-8859-1?Q?AVXaE0MnQBZOPiwL/ftVt9hIOGVQ8tW2SqF2wqnfDNRTQEFDza2S5Q9hQY?=
 =?iso-8859-1?Q?Ll5FvftQ4MjncvHtv/he4OhBHrlUAyQvwm1n24F36JnByDSmg+hG00vEuH?=
 =?iso-8859-1?Q?adkzezDwaUWDhIwkzaXEkd3wZrKQtzFy0nKU8rJ0zk8uBOGrF0kbhTTKhe?=
 =?iso-8859-1?Q?9cpz3F/XahMqVDCgMhxbSn5K0beGNYNuE3KeJLUOAAG9LN4fUb24FFg95b?=
 =?iso-8859-1?Q?3imrU+zktL4Zq8OAF1JwoJivkKAAJ70jurBGxpJn4ud8gebTHQ8MVI8y0p?=
 =?iso-8859-1?Q?oeq4IM/oOr7EplSLn1dWyqd72MUbTg5mT758QwFA70yk87M4c+9sbNaRMJ?=
 =?iso-8859-1?Q?wB7pk5sGn63cjZbxicCxYKtBOG0xS67tykAPnSYyTCHqifpCAHppS/InKJ?=
 =?iso-8859-1?Q?1bQN8BrZoGAGdaDMtZTctNyCtIMnUMgJR7Is66ssINrsmGWIrt0EwqKYCu?=
 =?iso-8859-1?Q?KcPrcWM+ZoFjrN5gWEPYF/z4Za9WIkZFvWxTR/w1DqSCDPSt8XaAcTbvjH?=
 =?iso-8859-1?Q?tKCyWWXa88/wLlQjO+0YlEHCZi0TIYv+qAvZSsQHh0bYgbJuxmYUNIYiLx?=
 =?iso-8859-1?Q?edFdV93CUybnYBMXLJ73v3BrldN0xP4lk3bnkJcwpBYf+wRqEFbQiSr4Gi?=
 =?iso-8859-1?Q?GZ01F0h9DXdpntasq+nc3caiHkyW4DfqFw9dLHlpF0rjUy2zX2aFlw6Q?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22435f30-d8fb-4a26-37d4-08dde5bdf518
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2025 23:03:37.9933
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ovdffDZdCFrMEV8Ow9IZ7IUmQhZIBoluhcdJxDxU59dbvOvt79tI9GpKc+mxTMOjS7Qz+fO956xLhhJz3GFOKp0ZrAEsWNGOZHoi2XAo634=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6324

Hi Loenid,

Leonid Komarianskyi <Leonid_Komarianskyi@epam.com> writes:

> The Dom0 and DomUs logic for the dom0less configuration in create_dom0() =
and
> arch_create_domUs() has been updated to account for extended SPIs when
> supported by the hardware and enabled with CONFIG_GICV3_ESPI. These chang=
es
> ensure the proper calculation of the maximum number of SPIs and eSPIs ava=
ilable
> to Dom0 and DomUs in dom0less setups.
>
> When eSPIs are supported by the hardware and CONFIG_GICV3_ESPI is enabled=
, the
> maximum number of eSPI interrupts is calculated using the ESPI_BASE_INTID
> offset (4096) and is limited to 1024, with 32 IRQs subtracted. To ensure
> compatibility with non-Dom0 domains, this adjustment is applied by the
> toolstack during domain creation, while for Dom0 or DomUs in Dom0, it is
> handled directly during VGIC initialization. If eSPIs are not supported, =
the
> calculation defaults to using the standard SPI range, with a maximum valu=
e of
> 992 interrupt lines, as it works currently.
>
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>

Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

>
> ---
> Changes in V4:
> - consolidated the eSPI and SPI logic into a new inline function,
>   vgic_def_nr_spis. Without eSPI support (either due to config being
>   disabled or hardware not supporting it), it will return the regular SPI
>   range, as it works currently. There are no functional changes compared
>   with the previous patch version
> - removed VGIC_DEF_MAX_SPI macro, to reduce the number of ifdefs
>
> Changes in V3:
> - renamed macro VGIC_DEF_NR_ESPIS to more appropriate VGIC_DEF_MAX_SPI
> - added eSPI initialization for dom0less setups
> - fixed comment with mentions about dom0less builds
> - fixed formatting for lines with more than 80 symbols
> - updated commit message
>
> Changes in V2:
> - no changes
> ---
>  xen/arch/arm/dom0less-build.c   |  2 +-
>  xen/arch/arm/domain_build.c     |  2 +-
>  xen/arch/arm/include/asm/vgic.h | 21 +++++++++++++++++++++
>  3 files changed, 23 insertions(+), 2 deletions(-)
>
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.=
c
> index 69b9ea22ce..02d5559102 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -285,7 +285,7 @@ void __init arch_create_domUs(struct dt_device_node *=
node,
>      {
>          int vpl011_virq =3D GUEST_VPL011_SPI;
> =20
> -        d_cfg->arch.nr_spis =3D VGIC_DEF_NR_SPIS;
> +        d_cfg->arch.nr_spis =3D vgic_def_nr_spis();
> =20
>          /*
>           * The VPL011 virq is GUEST_VPL011_SPI, unless direct-map is
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index d91a71acfd..39eea0be00 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2054,7 +2054,7 @@ void __init create_dom0(void)
> =20
>      /* The vGIC for DOM0 is exactly emulating the hardware GIC */
>      dom0_cfg.arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
> -    dom0_cfg.arch.nr_spis =3D VGIC_DEF_NR_SPIS;
> +    dom0_cfg.arch.nr_spis =3D vgic_def_nr_spis();
>      dom0_cfg.arch.tee_type =3D tee_get_type();
>      dom0_cfg.max_vcpus =3D dom0_max_vcpus();
> =20
> diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/v=
gic.h
> index fb4cea73eb..11f9d216eb 100644
> --- a/xen/arch/arm/include/asm/vgic.h
> +++ b/xen/arch/arm/include/asm/vgic.h
> @@ -355,6 +355,27 @@ extern void vgic_check_inflight_irqs_pending(struct =
vcpu *v,
>  /* Default number of vGIC SPIs. 32 are substracted to cover local IRQs. =
*/
>  #define VGIC_DEF_NR_SPIS (min(gic_number_lines(), VGIC_MAX_IRQS) - 32)
> =20
> +static inline unsigned int vgic_def_nr_spis(void)
> +{
> +#ifdef CONFIG_GICV3_ESPI
> +    /*
> +     * Check if the hardware supports extended SPIs (even if the appropr=
iate
> +     * config is set). If not, the common SPI range will be used. Otherw=
ise
> +     * returns the maximum eSPI INTID, supported by HW GIC, subtracted b=
y 32.
> +     * For non-Dom0 domains, the toolstack or arch_create_domUs function
> +     * applies the same adjustment to cover local IRQs (please, see comm=
ent
> +     * for macro that is used for regular SPIs - VGIC_DEF_NR_SPIS). We w=
ill
> +     * add back this value during VGIC initialization. This ensures cons=
istent
> +     * handling for Dom0 and other domains. For the regular SPI range in=
terrupts
> +     * in this case, the maximum value of VGIC_DEF_NR_SPIS will be used.
> +     */
> +    if ( gic_number_espis() > 0 )
> +        return ESPI_BASE_INTID + min(gic_number_espis(), 1024U) - 32;
> +#endif
> +
> +    return VGIC_DEF_NR_SPIS;
> +}
> +
>  extern bool vgic_is_valid_line(struct domain *d, unsigned int virq);
> =20
>  static inline bool vgic_is_spi(struct domain *d, unsigned int virq)

--=20
WBR, Volodymyr=

