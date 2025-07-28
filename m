Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A838BB140F1
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 19:08:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061784.1427362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugRK4-0003mO-OB; Mon, 28 Jul 2025 17:07:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061784.1427362; Mon, 28 Jul 2025 17:07:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugRK4-0003kE-LW; Mon, 28 Jul 2025 17:07:36 +0000
Received: by outflank-mailman (input) for mailman id 1061784;
 Mon, 28 Jul 2025 17:07:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hYbc=2J=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1ugRK3-0003k8-4X
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 17:07:35 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a864810-6bd5-11f0-a31e-13f23c93f187;
 Mon, 28 Jul 2025 19:07:34 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by AM0PR03MB6194.eurprd03.prod.outlook.com (2603:10a6:20b:15a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.27; Mon, 28 Jul
 2025 17:07:31 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%6]) with mapi id 15.20.8964.025; Mon, 28 Jul 2025
 17:07:30 +0000
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
X-Inumbo-ID: 5a864810-6bd5-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tyhrH4NcgIFhcrU1wL53lP+BnSBvIJbf7GkCP2BLeZJsOvPpdX74sPBfjaLUpex5aNIMmww7XsBUQHYHbwrvU05JoVfic8Dm2uj+JXsJFx4Zp4wazIVCENd8pZ7HjDRCW/5gkgp7x/GCaBRAbPjpWcsBX4lwMhaYtlj5pbdDtiAJTB2E7sTJSzlOg+SPou2IHZfkoOXB22l1C11FH6NPji3ymYJ9yhrTnFizwEYWZPAEl5hn3BXealjRhOK55kVXDc3TbYPf00fMZQxVimDNOseuw+e0qiKYZE9FJOqTe2mHlRoXHhV53xR6bmfV03a/WzWVBPvNSvPJ5K1KbaSL1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5g6qQoC59TuYuu8R6V4f+Xw2dl9Xp4KsAdKfTc/vfPs=;
 b=eh9DfmZGkvEVuD7YvqxEyacn+KzZ12c9R673FS6EQRtAb8rrEv07qmOl7EcRkniOOnQtcjxuebBBFHrWtI6EWE6rF8z8WSu79S6rnGnl05GhJmDaJIQl2BdfNfDKBIdTfkJkuPprrwzNezohmZ0ZXl75Uh3brfoJ4MY9t72BAD45Z57L91/Pzf1px3U+ZtBUEHdxNeTHEseE6HZzF8zIbKY/B1We5pdnobFhnDAiJHoaNL9CPMW3CgFqxoA6eVK+JlTtRyAvdbWNqy6I4/HwNnIrkmymgYHx/ryjswmyquYR3zHTb+wN8osujjiUH9Pm375RYwFVD2J7JymS7OjI3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5g6qQoC59TuYuu8R6V4f+Xw2dl9Xp4KsAdKfTc/vfPs=;
 b=E/0ZOfRyDLFBYx1d10BN1LzHxoQAdouWjPZ8hDKdkWbaQG7FAEJnY5NbO+yQB7JTzahxoUtK3lYnzHhHCcb5Mo8Z0sYMoeXCBMhrG2W+eQkuoCNK9JswaWeB+grgrz3vct5qxmj9kWjhi1rno/tA4DpKBXOziLEpr64pSaiP5B4TqQ1e4DXffXaoHghEXivvIPmIAxzkoU1c/IzUJcFrMC+XgcQSw4aILBdg+t0InL1k30coUorNukh/ja8plo3t/7Mzf6owryrz6ES6NXDcWLmnKylXLhxkfMK8M16wvIgfZSjKcE8PT51OJ5xr44xajZl8gwpnXtNPQ01tbtoIhw==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>
Subject: [PATCH v2] xen/arm, xen/common: Add Kconfig option to control Dom0
 boot
Thread-Topic: [PATCH v2] xen/arm, xen/common: Add Kconfig option to control
 Dom0 boot
Thread-Index: AQHb/+IacHiE2y5puk2LQertSkS3Og==
Date: Mon, 28 Jul 2025 17:07:30 +0000
Message-ID:
 <90e79e175b5f703f33944415df3c7a73d6abc385.1753722403.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|AM0PR03MB6194:EE_
x-ms-office365-filtering-correlation-id: 9ffa4305-f4ca-48c2-fc0f-08ddcdf93cd8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?iiRdnih0XsZfau2lufJX/D80MzQKBIFNAjPj7rtLkR2loHR8itwg5M76M2?=
 =?iso-8859-1?Q?I2ir53dHZhMAepmOZaAQQZsWVkltRR+AptKCIozZ3DXqnfUab+NpCI9iAj?=
 =?iso-8859-1?Q?8Mi8kB9arb4nOD9DTlqaOHo9PSqyLe6C0Fe8nAs81W+dOuly/YGeMNS/KY?=
 =?iso-8859-1?Q?8yTAM4d7XWNNLAC54HXuyqq7Mx+E03I8e4Gn0v75Yz5kC+2/I/XVXhWOer?=
 =?iso-8859-1?Q?LEt5m86ZcLkyz97IcblBqfuQtC6bw0aYqldmk8btaXsCb30i7mozCl2z2A?=
 =?iso-8859-1?Q?gFnfFw2ZMLZX0w4qjiMYNyJwGOP6aAMUfPbvCCpw7zrxQOoMtlSRy+KWen?=
 =?iso-8859-1?Q?Q5DkRMvUZxpXP2fy7+i1B76LhBLXIpaRMUGVY+Ltu11yZSot7M3n9YKLaY?=
 =?iso-8859-1?Q?xDUkCQQnA+mqLzB/v4zD45XjRl+NKbUM/TRzXO1VzRR24gTOTdaHcXspPo?=
 =?iso-8859-1?Q?z9xYu5bx4fq6cN144NXG7UOgCPhu3TNGDVNuWQAUEAmKZ6FWS9lvEhEOnG?=
 =?iso-8859-1?Q?JHgcvQFvWZnxbMR5dDhoroKx8dMcQYxCVSDSuebh2cWpe2nIRt4pOb4+Xl?=
 =?iso-8859-1?Q?65ikQ2HamnrxNjMiftj/2AD7MCl1VVX0tCLWeu8IguRtOdCYTiNEYaXMQ2?=
 =?iso-8859-1?Q?mkr/pSnQ6edEWYRxJ1+Z69t0CyXU69LzDqCmAeE0vjs6HdophzXCE9MP51?=
 =?iso-8859-1?Q?eyf43yuPwWmzwD4J2Jl4klzM6HrZus/cYILNjEk/toB5/HXJWmaSi9ObK5?=
 =?iso-8859-1?Q?yYH1DXv/LXPfu8oDtGmFYaHukZWOZ+00oFHEOB1b7AbHIUPdXQ+K0iQKcB?=
 =?iso-8859-1?Q?N0PrjC/1Pf46hAGBZC7IcYHrxjAV1mgvUNbRPXo7Vk87GusYwwJyjn0R79?=
 =?iso-8859-1?Q?w/AnsxVUODVb3wHyeTvC+F2nyBdMo9v7F5YW3AE5Aasm/8D6sTHBKlTzFk?=
 =?iso-8859-1?Q?TaodBIqt4nKHmBVmS7GutS6FDDN0yKkrg4Kf/0p059xaLMSEvhqW2kb7lO?=
 =?iso-8859-1?Q?WfSF1bm0xIsjHAUQaCLINrSmXG9Qlo2hK6umTQQiWfwQr1QS5B78hID+vF?=
 =?iso-8859-1?Q?45oUDXrN9zlw496FLk5PMMR6YWDzMG52aMK1m6ySCqQPWc4DX9RWwFWiz4?=
 =?iso-8859-1?Q?VvTbmm50jLF6WuTjDntoQR0+KbPGDqru61Vi2oNZtWFBUi2FO9w9C7pJRW?=
 =?iso-8859-1?Q?qdwxOy7dVI0nRwq37zbeYSPuXrJwySVONzkA7KCX871UYB7MeCekxdpsuX?=
 =?iso-8859-1?Q?iAtw6fUetAisz9FwZC1utSqu1GPOBnzkhdaMNF009miRUOwtUAFaDBOovs?=
 =?iso-8859-1?Q?3OJVq3qG5nm8L/wpqRX2CaC3LQMve9ABJHysRWaukz+zb+WVsyH+Z/NfQf?=
 =?iso-8859-1?Q?y+gL2cjjfJnvxdiWFIPoPGdcVAt0aUTsNlXMt7mw83RQI7kHBrjLjQoXGZ?=
 =?iso-8859-1?Q?oqoovBv8Km9WKcd+OpVSnLq5dhVEc80Fiba5LtBHq9YT8Ha6zAL++9+yH9?=
 =?iso-8859-1?Q?lbBDBP9eLvu0n/f+sbRV8oOMdaz3GMPgzfNoTpFtZspQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Ro//OeI/6xRDW5mHzBOr4OX8QDUUm33jC0cKSmuLINcoItYAQbbJtnfN1V?=
 =?iso-8859-1?Q?w/o2sppt9jfj+COJYA0orNxpsyUjEj3ZH3R3sV3TG57y9tb2yrqkm8sXDk?=
 =?iso-8859-1?Q?z+BfFYZ/rP/BpIVPpTzPap0yx5gpJ25MeXl3KAbM0VNkqPPt+lqP82mllJ?=
 =?iso-8859-1?Q?eamp+p3OoQiei5wXIZMW7A0wsMkjYpSGgX6JnCLkGs2oi4WYcctj9PlF3B?=
 =?iso-8859-1?Q?0uHWm8N1cCLPX9ek8DoYZfVbZRvwyuRfbKr+5i/4jnW+Z1raaNQiyWASlZ?=
 =?iso-8859-1?Q?sgaIwtP3RDRbaGeU4kOdrafSOUoIkCLo88+kQBOUyW+Q+8Bup7Fx5fNZ1x?=
 =?iso-8859-1?Q?l6JXKuFKUZ16XZPze0q3MFy7PFxYFhw3hS2o0eItM6duRazCo13o5XCChZ?=
 =?iso-8859-1?Q?4+PTyUsck5N5kB6zfBDMjRfejXgqg5bSqRy9WDO+Lrm4uxYQ/b4SsEQibm?=
 =?iso-8859-1?Q?vX7VSwZ1kBLQpF/+CwnDyKsBUDvIs19+FPWQ2IL2d6SbzrvLFQ+7862bin?=
 =?iso-8859-1?Q?6Kas9P1YlVG4UqT/X797zekfjpKW+t9sLwyTLO2s5BCpmumL+ct+EegVzd?=
 =?iso-8859-1?Q?Y4OXJ8hNkufj6a3cI6ZSjisuaHhGjWfFQ947qvtPikn4Os0gubX4hlAaGs?=
 =?iso-8859-1?Q?yh27HYt80pP3u/QIx8cElNl7DGvaehfj3wSgVec/WQGjJIfOk7/bAfxNxR?=
 =?iso-8859-1?Q?Ls1bNNAdifaY8/DQGX+8AuCqCKsgOVzYK90dSy8M6MOpcLosDyuNP+HDkC?=
 =?iso-8859-1?Q?qtk8po8UotzRPQ83Aua5uCab581xXy26DstICfsRhmDCSByyr5Z10Tei6h?=
 =?iso-8859-1?Q?Fe+A7pXnRGA+/0E7UzPOyrMSixh00HHdyHUPdVGGbC5sRpRKNMKZW8j6as?=
 =?iso-8859-1?Q?LLFgrNpDONBf1PZGJUX59SGKsrMrG+6BW3am3Obhh1oNjalgdQWrh/e/LD?=
 =?iso-8859-1?Q?0ZixBU5yAVQhFnvGr6ozVvoXqBBcegN9198pQKmB7p2Fq/lAFBY8n5zSt5?=
 =?iso-8859-1?Q?bcai14++kNQLiM5Tg8atgIkW0oeyafRq2fXX3gIgGd0mcFP/5Ca8OZ78TL?=
 =?iso-8859-1?Q?kp2F7rOT2luybpfopW/nkLupLo8CcLfTwD1EtHFDVN/d0xIOgurJODDuzY?=
 =?iso-8859-1?Q?dNOH8qjMygzwSPTUK2PiLwu67QxQk8usJIt8al8BL/WqyS0S+JRJzzyaNC?=
 =?iso-8859-1?Q?/qrEw47ibeZVqCiGofP13mueEohhCoUheHRNy/j+MRCWuJhb+ci0n5wf0g?=
 =?iso-8859-1?Q?tSx2lkXCe6SpjEOTxbVC5SFCEP1quy+zB21P4sRZyCLx/hxOCz9EhadfLR?=
 =?iso-8859-1?Q?zo8NldU1IGmRyBmfw9jCBb+XKH8Ia5l/qqufv5mpM4NKz/VzGMyBXCd2sw?=
 =?iso-8859-1?Q?LXQmqky787K6ZkyYL7BbLI/TrzVMkEkBoPzbcXSpuqV+kV5ArMveGiCDyX?=
 =?iso-8859-1?Q?0Ii3CD01Nl6qMST5aGi+mifR6LPn6p0Mng0pBsXF7qKO+PRriDmLabX8n6?=
 =?iso-8859-1?Q?bm6B/83JDH2nKdxRbmQm/nWZwksalhwvrVTi0frUDD6vLrFE5fWzrFoMaO?=
 =?iso-8859-1?Q?ucXhh7ovwMH4vRPabmOK0j+qSkUwmt2FcZSWXaW4RzNkeerAXVv1BwNQ7S?=
 =?iso-8859-1?Q?SZRJlbRGHoZpVlrOlr9S1c52tepPvbUXOgKPYRFPu7F8oa36FIDN72zg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ffa4305-f4ca-48c2-fc0f-08ddcdf93cd8
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2025 17:07:30.7736
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6ek3AHJZm3w2AHFR4ftGNVQabBWIdPzSkSNu9nEZF6owmmoeX8IThfOzUVk3Z44sHZ/kdaOX31kPhb79aXkxDaSubv3TtU0n8P5w5OA3LP8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6194

This commit introduces a new Kconfig option, `CONFIG_DOM0_BOOT`, to
allow for building Xen without support for booting a regular domain (Dom0).
This functionality is primarily intended for the ARM architecture.

A new Kconfig symbol, `HAS_DOM0`, has been added and is selected by
default for ARM and X86 architecture. This symbol signifies that an
architecture has the capability to support a Dom0.

The `DOM0_BOOT` option depends on `HAS_DOM0` and defaults to 'y'. For
expert users, this option can be disabled (`CONFIG_EXPERT=3Dy` and no
`CONFIG_DOM0_BOOT` in the config), which will compile out the Dom0
creation code on ARM. This is useful for embedded or dom0less-only
scenarios to reduce binary size and complexity.

The ARM boot path has been updated to panic if it detects a non-dom0less
configuration while `CONFIG_DOM0_BOOT` is disabled, preventing an invalid
boot.

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>

---

Changes in v2:
- decided not to rename HAS_DOM0 (HAS_OPTIONAL_DOM0 was another option
suggested in ML) because in this case HAS_DOM0LESS should be renamed
either.
- fix order of HAS_DOM0 config parameter
- add HAS_DOM0 option to x86 architecture.

CONFIG_DOM0_BOOT Kconfig option was introduced to make the Dom0
regular (legacy) domain an optional feature that can be compiled out
from the Xen hypervisor build.

The primary motivation for this change is to enhance modularity and
produce a cleaner, more specialized hypervisor binary when a control
domain is not needed. In many embedded or dedicated systems, Xen is
used in a "dom0less" configuration where guests are pre-configured and
launched directly by the hypervisor. In these scenarios, the entire
subsystem for booting and managing Dom0 is unnecessary.

This approach aligns with software quality standards like MISRA C,
which advocate for the removal of unreachable or unnecessary code to
improve safety and maintainability. Specifically, this change helps adhere =
to:

MISRA C:2012, Rule 2.2: "There shall be no dead code"

In a build configured for a dom0less environment, the code responsible
for creating Dom0 would be considered "dead code" as it would never be
executed. By using the preprocessor to remove it before compilation,
we ensure that the final executable is free from this unreachable
code. This simplifies static analysis, reduces the attack surface,
and makes the codebase easier to verify, which is critical for
systems requiring high levels of safety and security.

---
 xen/arch/arm/Kconfig        |  1 +
 xen/arch/arm/domain_build.c |  8 ++++++++
 xen/arch/arm/setup.c        | 14 ++++++++++----
 xen/arch/x86/Kconfig        |  1 +
 xen/common/Kconfig          | 11 +++++++++++
 5 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index bf6d1cf88e..74da544925 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -18,6 +18,7 @@ config ARM
 	select GENERIC_UART_INIT
 	select HAS_ALTERNATIVE if HAS_VMAP
 	select HAS_DEVICE_TREE
+	select HAS_DOM0
 	select HAS_DOM0LESS
 	select HAS_GRANT_CACHE_FLUSH if GRANT_TABLE
 	select HAS_STACK_PROTECTOR
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index ed668bd61c..9b8993df80 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -40,8 +40,10 @@
 #include <asm/grant_table.h>
 #include <xen/serial.h>
=20
+#ifdef CONFIG_DOM0_BOOT
 static unsigned int __initdata opt_dom0_max_vcpus;
 integer_param("dom0_max_vcpus", opt_dom0_max_vcpus);
+#endif
=20
 /*
  * If true, the extended regions support is enabled for dom0 and
@@ -102,6 +104,7 @@ int __init parse_arch_dom0_param(const char *s, const c=
har *e)
  */
 #define DOM0_FDT_EXTRA_SIZE (128 + sizeof(struct fdt_reserve_entry))
=20
+#ifdef CONFIG_DOM0_BOOT
 unsigned int __init dom0_max_vcpus(void)
 {
     if ( opt_dom0_max_vcpus =3D=3D 0 )
@@ -114,6 +117,7 @@ unsigned int __init dom0_max_vcpus(void)
=20
     return opt_dom0_max_vcpus;
 }
+#endif
=20
 /*
  * Insert the given pages into a memory bank, banks are ordered by address=
.
@@ -1953,6 +1957,7 @@ int __init construct_domain(struct domain *d, struct =
kernel_info *kinfo)
     return 0;
 }
=20
+#ifdef CONFIG_DOM0_BOOT
 static int __init construct_dom0(struct domain *d)
 {
     struct kernel_info kinfo =3D KERNEL_INFO_INIT;
@@ -1984,6 +1989,7 @@ static int __init construct_dom0(struct domain *d)
=20
     return construct_hwdom(&kinfo, NULL);
 }
+#endif
=20
 int __init construct_hwdom(struct kernel_info *kinfo,
                            const struct dt_device_node *node)
@@ -2037,6 +2043,7 @@ int __init construct_hwdom(struct kernel_info *kinfo,
     return construct_domain(d, kinfo);
 }
=20
+#ifdef CONFIG_DOM0_BOOT
 void __init create_dom0(void)
 {
     struct domain *dom0;
@@ -2089,6 +2096,7 @@ void __init create_dom0(void)
=20
     set_xs_domain(dom0);
 }
+#endif /* CONFIG_DOM0_BOOT */
=20
 /*
  * Local variables:
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 12b76a0a98..c1463d647a 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -480,12 +480,18 @@ void asmlinkage __init start_xen(unsigned long fdt_pa=
ddr)
     enable_errata_workarounds();
     enable_cpu_features();
=20
-    /* Create initial domain 0. */
-    if ( !is_dom0less_mode() )
+    if ( IS_ENABLED(CONFIG_DOM0_BOOT) && !is_dom0less_mode() )
+    {
+        /* Create initial domain 0. */
         create_dom0();
+    }
     else
-        printk(XENLOG_INFO "Xen dom0less mode detected\n");
-
+    {
+        if ( is_dom0less_mode())
+            printk(XENLOG_INFO "Xen dom0less mode detected\n");
+        else
+            panic("Xen dom0less mode not detected, aborting boot\n");
+    }
     if ( acpi_disabled )
     {
         create_domUs();
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index a45ce106e2..06e2888707 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -18,6 +18,7 @@ config X86
 	select HAS_COMPAT
 	select HAS_CPUFREQ
 	select HAS_DIT
+	select HAS_DOM0
 	select HAS_EHCI
 	select HAS_EX_TABLE
 	select HAS_FAST_MULTIPLY
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 64865112a1..22e8192a7d 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -21,6 +21,14 @@ config DOM0LESS_BOOT
 	  Xen boot without the need of a control domain (Dom0), which could be
 	  present anyway.
=20
+config DOM0_BOOT
+	bool "Dom0 boot support" if EXPERT
+	depends on HAS_DOM0 && HAS_DEVICE_TREE && DOMAIN_BUILD_HELPERS
+	default y
+	help
+	  Dom0 boot support enables Xen to boot to the control domain (Dom0) and
+	  manage domU guests using the Xen toolstack with provided configurations=
.
+
 config DOMAIN_BUILD_HELPERS
 	bool
=20
@@ -95,6 +103,9 @@ config HAS_DOM0LESS
 config HAS_DIT # Data Independent Timing
 	bool
=20
+config HAS_DOM0
+	bool
+
 config HAS_EX_TABLE
 	bool
=20
--=20
2.34.1

