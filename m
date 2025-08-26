Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9497B37364
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 21:49:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095017.1450169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqzfW-0001je-0F; Tue, 26 Aug 2025 19:49:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095017.1450169; Tue, 26 Aug 2025 19:49:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqzfV-0001gV-Sx; Tue, 26 Aug 2025 19:49:21 +0000
Received: by outflank-mailman (input) for mailman id 1095017;
 Tue, 26 Aug 2025 19:49:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VNE8=3G=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1uqzfU-0001gL-FF
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 19:49:20 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c09640d5-82b5-11f0-b898-0df219b8e170;
 Tue, 26 Aug 2025 21:49:18 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by DB9PR03MB9783.eurprd03.prod.outlook.com
 (2603:10a6:10:451::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 19:49:15 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 19:49:14 +0000
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
X-Inumbo-ID: c09640d5-82b5-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X4i8OH1/NvyH1ZKRKIgvjXmJyzg+NxB7PTQSlnfURptZUaVVdl37NhYXlrC9+gQn+pJstAc8A/GBX5rl0SPZVGBstFBpr7zmOzZevHm4QJeAqLQeySN3ofjekqKsZ4cQsf+26eDhoNjrrB4vA7xGIOAoeBPWjTjA5pNUj6qvCua3SF74+yyckMvBvP2+Pj1e4/mxd4IkoEgBT0rPho4K0WotnDQFGrdq7ntXQyAGkq6JWHKLKWb/kG0F4VBAC2wskfXK7+PUb4TKBB7b8WTC8Egk9TZ0tsixEUzJMztxwz6MmaigTjNWZYl5u6sWSjGBNVoO223SFNrIb7W/DQR43A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hilGdotJ+LUgh0lddFJdZiwhBQhyBeeMjQ40xdKNuX8=;
 b=ZzBRA1wW1/uuKu5FsCqPccaoy09e1l/qCSZO99TNNx21wkZH1km7ZcVUGkTVPoDd6g0GnyvB8GX9RAHxrvtrwHpgpfz6G4XQZC9Ro1ywTMFhyV7YGw/ovmKVbt1LheF2fNvnoLa1iRKQqzOlPtP69TDOHnrc4z8oo/C+0hDJWM0+qvxoGR9eF3EsVo9Qi9EZR8LCQGmIvqP1B71NhQ9oLpFqsD2z/CUMc/nekTxaXrgTgWE4wq9hl/yGfViawE4hA+bSEjd1Tqhf1sOEEqKBNJZsnZtS3X6ZdBaEDJ+2WzMi1n8UvI2FQezWowvkDFv74VC/mNuty/GCiqBv47H1Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hilGdotJ+LUgh0lddFJdZiwhBQhyBeeMjQ40xdKNuX8=;
 b=ligbLBrNms8xhLxUy9kBXGcN7lSEN8O9SyFJz38G7gF6L8+tjmu0N7Lzj+KVwUSSBH9x/4Xyr5OTBQcdFKWYo4r/FF1DSz3+rfMZ2OvOJESpGNtfvv6Ub/wt5NXJzmdx3zea7mtJ1LpX2C7JTtXPwqcT8BLhpQpC6pWcVSeXPMeABq6WWfsx+XZtY0Yh5zzWPfHsRPT6tlc8mi0rZ+iO8pQPvlmpHSJhCG7vrtuIC/1UB7WEmAi1Xi9skmcHH2vCauk6Z50w9i6q8LBx1Dp8cJiDAZh5rhS0H/Yh/HSOE2afcy1LvsOkbb7Dybloj4dpkCYsbJcUdVoFa+kClfmEcg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"olekstysh@gmail.com" <olekstysh@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v3 02/11] xen/arm: gic: implement helper functions for
 INTID checks
Thread-Topic: [PATCH v3 02/11] xen/arm: gic: implement helper functions for
 INTID checks
Thread-Index: AQHcFpJ/l4cyfmMsSUSuASmV+4e1mw==
Date: Tue, 26 Aug 2025 19:49:14 +0000
Message-ID: <87ms7l6eyt.fsf@epam.com>
References: <cover.1756216942.git.leonid_komarianskyi@epam.com>
	<4a865061abcfe626ffb8c134fe2353fb5675dc86.1756216943.git.leonid_komarianskyi@epam.com>
In-Reply-To:
 <4a865061abcfe626ffb8c134fe2353fb5675dc86.1756216943.git.leonid_komarianskyi@epam.com>
	(Leonid Komarianskyi's message of "Tue, 26 Aug 2025 14:05:36 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|DB9PR03MB9783:EE_
x-ms-office365-filtering-correlation-id: 118d95c9-e22a-423d-b8fb-08dde4d9a2ef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|42112799006|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?56PftHiWekdYhrDF6fOBjH2bbQuM4mPoLuul/oP6GwzivOiBc9y6gj1Ard?=
 =?iso-8859-1?Q?q1cH5aDpXyl8iPSmnZYhALeATCu8Hl7wjbOUnNTEapzhLQYqNGauSTtFDa?=
 =?iso-8859-1?Q?UQdhbULjhGz+cBE3AG2tC+pSHlJhBWXkZoO5sdLi2GB4MkK+Uj0MFliLeh?=
 =?iso-8859-1?Q?N7NwFc4l2uG0az5B1CixCNGSnPGV8GmXD0Vyj7MMXkJEZDxPj0PSZ7SCRV?=
 =?iso-8859-1?Q?f9wH1qprXJgKbRwHdl4fpO+JC+Pc4/yNvzgeiymJ3ojpndC1ciDgD+6gAo?=
 =?iso-8859-1?Q?0u6KxxU1xqHmF7N0gU+NQZkiDZRf27LXoG2y/rQJZqhFwI6M/wph4scJVT?=
 =?iso-8859-1?Q?fi5GRik2wuSBF9X866FsZrrMLlJP08oqhAAqDeLRumJI0mf4VaUkYqLaG1?=
 =?iso-8859-1?Q?UG/DjzA4fGOVczrvZ2kcUGNDvwjQgxs22Bzx1SgqLinCoFMMDlcmSHDBBZ?=
 =?iso-8859-1?Q?EKeWKHIIKJSF2qfJhQrsAAu6eLjZDWYSqKwEWGlOaK/IjqN1cEBay+d0vJ?=
 =?iso-8859-1?Q?IdwUbIlirBjDFLeCd2Kw3oE1nWWQsz6WTa0jiYENxDrCAP7Uat/fY5jYAH?=
 =?iso-8859-1?Q?JALDC6T230RtwxKzyBiloHb3IFIaUq5kbKOjIIlNbkTcgoKoLMEdZ8CZBt?=
 =?iso-8859-1?Q?jb7HbRbVlTL/icQHjx8DmieI9BBJnL790aifzKIqP8Tg46uxM/Zw0Ydo6c?=
 =?iso-8859-1?Q?3aPSpKj5lRVu/XCvWvBNK4vBE6QYb6Z6k30lRwzJG08xxFkucmjCUYjj55?=
 =?iso-8859-1?Q?ZWA4pQ4Vc/EvHhhD9+GWahO3PVt7l7RWQiPvBTgmWB5yqIvGM76kLr5C3r?=
 =?iso-8859-1?Q?uny+ExdwSF5w9LrKdnnpgR0gB3yEZSLgEyobzu9/cqNDziTZMVm0dUh1X0?=
 =?iso-8859-1?Q?O6cu4iIIA8yooVEELYgBcdM5JsR9SRoavEMTUUvh8k4hOz11VKqbKvzMDn?=
 =?iso-8859-1?Q?aDzS6FHV/aSSlsv6xskE3FbLRrSqxwthsWiEDzlKXVjAv7rA0UvocJ7B/A?=
 =?iso-8859-1?Q?6/PudiOakrdf15KfuV3qledS4AMjTjS4lyoUBpdgpO3t4DjrYHd+v2Y8JV?=
 =?iso-8859-1?Q?jmr2AoXADuHhaGjBd/87NIJyj1E8Q081vZ/DyBmdLwyguyQSBMCCeE3nO3?=
 =?iso-8859-1?Q?XcMzmevD8tevacgERlNG3EZj55+WnJ5bcEqx+oQiiQjXJ4zZQzWXbpdfjr?=
 =?iso-8859-1?Q?9D1xVEcg7L3oz15FtYD5WAgiTnzKj//gAmjM+3hVDV7cJ4VqIzaXbCWrbY?=
 =?iso-8859-1?Q?GIiOsSX0bdojTnv/6OObUvnCo7dkvr87EOZpQB67trUx3M5qtiT2Nk6Smm?=
 =?iso-8859-1?Q?aCm2Okt5hpm32Le3GF/IedM7Fab+0WkxaPBXnu013ghtjTqEk92rjXOACV?=
 =?iso-8859-1?Q?SNb0jpQHD+LDqgJRx6w031o29eXy1FnMY2qTGWSNEIVrG/PNaUEbIHtgfj?=
 =?iso-8859-1?Q?90WwSx3Gdi+MPXGk/jEDPZIxudF05yitBYfGx2uMeyiVl0jNZ17ZNWPy3g?=
 =?iso-8859-1?Q?eESnZlyAoWFA9bOf2NP2euIMj9rMFf/R5XSLJtuogGeg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(42112799006)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?NQf0/H/rI3zymFrj7ilzRgMGfmTbliXK3fiF6X0kf3CRjyjjp09gsk4L/+?=
 =?iso-8859-1?Q?9z4f45CX6YcTovWerripTWjG7XaSdsDx9hOpbmd2+XQanUV4gnyEkzfjzH?=
 =?iso-8859-1?Q?FlrupR60gBbqW7f9N/XIr3urGDOBpgRBrQ/50whcGHkUTuQlBeTHCjqTP4?=
 =?iso-8859-1?Q?CbHpjvhJKyHrO6xwdZez4Z5C2B1CRA+yesCZosZ4ONLG+OzuUp+lg9XDZV?=
 =?iso-8859-1?Q?7YK31fFZf6RFv3PMLtQzjXkcGoJERP+nWat8QjEm+ecZ1uw/jYZDrQy5C6?=
 =?iso-8859-1?Q?UXbsioC07mfqjrlZmDqWyUOUK3zECy3s42YRWaLqTJHwQmC8YbwJdPTfty?=
 =?iso-8859-1?Q?lXWbmS6w0DXl+R+dTKKlFlMEqPfZ6kZ/HWS1NwIR+p/7kPNnMIE/vNSqE5?=
 =?iso-8859-1?Q?nd9HmC2O+hQyE3x5y/Rg6hfRq9ehLrwYZ7BPpT39cuHgJoKrWNcNwIDn2P?=
 =?iso-8859-1?Q?DHWHQy/48yEmHmkuwqXMsfHuK3mcaPLYqZz98TwPZM119T9dg5fi3D7mcS?=
 =?iso-8859-1?Q?ERhSBb2mWyucpmwFZ8eU+pAB9z7lk4WUVDOHBuDDr4vXh+faJR8UtMJWMb?=
 =?iso-8859-1?Q?OxK7zI7lrEkjTbP7tC9iG37itqNiJJeus4WY4vhYjKmRfaR1pFhu38BcJE?=
 =?iso-8859-1?Q?ttC2qCqBKNqF1Crn075a1DybYM23T16UU3eNtQa9fQRaMBgfs9luUwUQAz?=
 =?iso-8859-1?Q?ia3hZ4oRtdFtjtS1DNbsi7GP+SsfMMSPpVfNF61QfKBtemUgMKI2ZJJZ7f?=
 =?iso-8859-1?Q?Df+iDfZbtGm/26UtAyMfEe4fp4fmdOXC9oHDuDRwDnO+5g/w0GRSeocvNw?=
 =?iso-8859-1?Q?5n/gYbRqN0e7+I7yPBV9XzNUhzfK0EvpMVg03xoZ5DZ4nagPyDv4eH3xZQ?=
 =?iso-8859-1?Q?RpRq1zmcw7c+6Kxay9+EcsuE5qPxyGVLFc4IKJs/eS+tCUn5Yz3raXCZa7?=
 =?iso-8859-1?Q?pJl50+ogpDtsMXMQ2ZCSq/Tl7hc8Y0mztZAu9za/z2w4DWvRUozvU71JjS?=
 =?iso-8859-1?Q?ExVe/5gf7a5P1Ox9PpLsep8UiazeQwCzf7S4MZMRcZ3YyWHrDIQSpbYSRC?=
 =?iso-8859-1?Q?lbPA63EHUlem/PPc7zzayBloC+RY18IF4o5iJxX9aJ1D38rABE+QpVHZjx?=
 =?iso-8859-1?Q?e8OcvFXfdx2cZDZYop139lO9y1ce0Wba7J1ciHhCHDmOief5wSFNKBumC5?=
 =?iso-8859-1?Q?bwbg1+X9K9mqerSBwCvcJO1A42uemP1QDOfnFDU4xeaq3vpjE8UVMZ1qmW?=
 =?iso-8859-1?Q?dUUEKgW8+bp1AH0ds4c/Rme86ggn4z7XTWY3kOkkQlE6ruriAYO47k8ywh?=
 =?iso-8859-1?Q?qE8r0FN5irHbAjupJYzqvbEHItZNvWxXyW5CleI4hoi2pV6Tz5UuOSPHpN?=
 =?iso-8859-1?Q?wE0JjgvC8eTMcggPWYktRBLwtFugLM3J9XKcfSlaF1sbqkKwVNSvG3iHfv?=
 =?iso-8859-1?Q?CwFdWDAJLsLXQ0+uZknK5OVv6ood6/BAGYR+eTVZrjCA/NbmwlxznBX2B3?=
 =?iso-8859-1?Q?fCElegItJUFW0ey9sKhZCGZ9CLEmKLds5LlSFkNCsqBDyrhR59AdjvAm0B?=
 =?iso-8859-1?Q?9dBurrZw1lBkwQWdhCBq1y2oe70sZRnD/FAjue3L3H8uGzrQbq+Z4TJLSW?=
 =?iso-8859-1?Q?l1do7bKX1A8X4yu6YKfKPivCxHkG4kYROzLtYU6NJ6vwmXB49WzcWOHQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 118d95c9-e22a-423d-b8fb-08dde4d9a2ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2025 19:49:14.8893
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8P+P6VR8Nue6TdO6wORn7DWZk+EJh6tH69zbY3G3jJFXjR97T5hzjKDvsaohBtJ5syCvB5qDTTtPYQI+Q1JlJGBXS5Qz/Hpv0A8twYUMIik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB9783



Leonid Komarianskyi <Leonid_Komarianskyi@epam.com> writes:

> Introduced two new helper functions: gic_is_valid_line and
> gic_is_spi. The first function helps determine whether an IRQ
> number is less than the number of lines supported by hardware. The
> second function additionally checks if the IRQ number falls within the
> SPI range. Also, updated the appropriate checks to use these new helper
> functions.
>
> The current checks for the real GIC are very similar to those for the
> vGIC but serve a different purpose. For GIC-related code, the interrupt
> numbers should be validated based on whether the hardware can operate
> with such interrupts. On the other hand, for the vGIC, the indexes must
> also be verified to ensure they are available for a specific domain. The
> first reason for introducing these helper functions is to avoid
> potential confusion with vGIC-related checks. The second reason is to
> consolidate similar code into separate functions, which can be more
> easily extended by additional conditions, e.g., when implementing
> extended SPI interrupts.
>
> The changes, which replace open-coded checks with the use of the new
> helper functions, do not introduce any functional changes, as the helper
> functions follow the current IRQ index verification logic.
>
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>

Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

>
> ---
> Changes in V2:
> - introduced this patch
>
> Changes in V3:
> - renamed gic_is_valid_irq to gic_is_valid_line and gic_is_shared_irq to
>   gic_is_spi
> - updated commit message
> ---
>  xen/arch/arm/gic.c             | 2 +-
>  xen/arch/arm/include/asm/gic.h | 9 +++++++++
>  xen/arch/arm/irq.c             | 2 +-
>  3 files changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> index e80fe0ca24..9220eef6ea 100644
> --- a/xen/arch/arm/gic.c
> +++ b/xen/arch/arm/gic.c
> @@ -111,7 +111,7 @@ static void gic_set_irq_priority(struct irq_desc *des=
c, unsigned int priority)
>  void gic_route_irq_to_xen(struct irq_desc *desc, unsigned int priority)
>  {
>      ASSERT(priority <=3D 0xff);     /* Only 8 bits of priority */
> -    ASSERT(desc->irq < gic_number_lines());/* Can't route interrupts tha=
t don't exist */
> +    ASSERT(gic_is_valid_line(desc->irq));/* Can't route interrupts that =
don't exist */
>      ASSERT(test_bit(_IRQ_DISABLED, &desc->status));
>      ASSERT(spin_is_locked(&desc->lock));
> =20
> diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gi=
c.h
> index 541f0eeb80..c7e3b4ff0d 100644
> --- a/xen/arch/arm/include/asm/gic.h
> +++ b/xen/arch/arm/include/asm/gic.h
> @@ -306,6 +306,15 @@ extern void gic_dump_vgic_info(struct vcpu *v);
> =20
>  /* Number of interrupt lines */
>  extern unsigned int gic_number_lines(void);
> +static inline bool gic_is_valid_line(unsigned int irq)
> +{
> +    return irq < gic_number_lines();
> +}
> +
> +static inline bool gic_is_spi(unsigned int irq)
> +{
> +    return (irq >=3D NR_LOCAL_IRQS && gic_is_valid_line(irq));
> +}
> =20
>  /* IRQ translation function for the device tree */
>  int gic_irq_xlate(const u32 *intspec, unsigned int intsize,
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index 03fbb90c6c..7dd5a2a453 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -415,7 +415,7 @@ err:
>  bool is_assignable_irq(unsigned int irq)
>  {
>      /* For now, we can only route SPIs to the guest */
> -    return (irq >=3D NR_LOCAL_IRQS) && (irq < gic_number_lines());
> +    return gic_is_spi(irq);
>  }
> =20
>  /*

--=20
WBR, Volodymyr=

