Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E650B42B6F
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 22:57:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1109007.1458884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utuWv-0003wJ-SK; Wed, 03 Sep 2025 20:56:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1109007.1458884; Wed, 03 Sep 2025 20:56:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utuWv-0003td-PE; Wed, 03 Sep 2025 20:56:33 +0000
Received: by outflank-mailman (input) for mailman id 1109007;
 Wed, 03 Sep 2025 20:56:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rz8A=3O=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1utuWu-0003ru-0z
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 20:56:32 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76d84045-8908-11f0-9809-7dc792cee155;
 Wed, 03 Sep 2025 22:56:29 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AS8PR03MB9607.eurprd03.prod.outlook.com
 (2603:10a6:20b:5aa::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 20:56:23 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 20:56:23 +0000
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
X-Inumbo-ID: 76d84045-8908-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xk5OmPWSU9QfUWF96sPNf6cX4/Fwag4wc43GE71Svv4ukRKtYE06IxqCWIxH2N8YYDXZgC4S+oAEu4h2mkkRV6bPapFoKtb93XYD88bHCqLA9+8GjkFtkqPe3m2zd9KC1m/tuPFnxJ+g+MzV2AvB+nnDzvAKD+jdtnotVE8zC6D9xhoei+6tC4sgAS0OcJB6n9r307YbPRh1aOVJpM8H0vydi5Nk/rkL3cOEGUPLpTm6X9bHwIPIMD+DMrNTk8/ruZJ4nYT0s2UJC7d8HVwlr/YWnDHElKg2zv7umtCxdJ8jExI4TZOYEeEpFEYRBGNZPefcHlmx+lumwx0/+1mxAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NHBB6K7fdkexlFQb2xgGYNeRBsQkNzv4XxPRVogmNW0=;
 b=lUo14Taba/qQJSvx/GunzFmePQkvoqDaikkqFU0jZMW0VUerKC3M4r/0BbnIFcLvY30s2ElnS1B0ZVQaTLUFPHU9My3VJ31eqfcotbTafCFgjLgLxSfeh1Onpja+58nb45F4xtsdIfGmKYDferLIYmdN9gRV6Oa9dyA/JJ+s1NijwkOSaV0l0FjpkdpwSUkffhYpg+E9IkdJ6NyufE55KfkCtYzT2B7TvBRAG2Kgw2z+xxUXD6boKZDF5oL6D99bAOor18W9d7anAeyehP9bbgGJKWWZ7T1EVJCLPPdG6NoaXHjVXq4kOBWjdlmhyS7BSuRvY02T5bz0gL2IXzSyww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NHBB6K7fdkexlFQb2xgGYNeRBsQkNzv4XxPRVogmNW0=;
 b=KorWWgmjTyLZDckxfnvWQd7tWLMveqmmEFYC00nZIBRQNuyGreKbV/c3EacVEQCokFVfqX7RCxLJ5BH3TrJF41sC2j/7Cg0J3/18tlOhYlstyeeqm80Z3riJi2YUbn8WhYLFHn4WfgFV4aihjga4eICsE8nH0WcNqL1BG9ramyIOToEgg+5u0UP1VdxEqbByGJr4h6VtelALiyKaLx7rzlts2YcClLSdJcnh3hdf4ghy09FLbxn1Fy64Qc8XNAaVeE3bZVr0VcoKHEAThkpZFBwjhTXT3lMGxdspA/XRCtRYtZllvAQCwTGHPa4U853LBMWOvYPfw6LlFrrYHwIj1g==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"olekstysh@gmail.com" <olekstysh@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v6 04/12] xen/arm/irq: add handling for IRQs in the eSPI
 range
Thread-Topic: [PATCH v6 04/12] xen/arm/irq: add handling for IRQs in the eSPI
 range
Thread-Index: AQHcHN87CzNpV/kRn0iD7+cHr07F5Q==
Date: Wed, 3 Sep 2025 20:56:22 +0000
Message-ID: <87a53buufe.fsf@epam.com>
References: <cover.1756908472.git.leonid_komarianskyi@epam.com>
	<bdaec9b9704a6f21325b507365a165cce89cca16.1756908472.git.leonid_komarianskyi@epam.com>
In-Reply-To:
 <bdaec9b9704a6f21325b507365a165cce89cca16.1756908472.git.leonid_komarianskyi@epam.com>
	(Leonid Komarianskyi's message of "Wed, 3 Sep 2025 14:29:59 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AS8PR03MB9607:EE_
x-ms-office365-filtering-correlation-id: 75be6d07-784a-45f1-7bf5-08ddeb2c5758
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|42112799006|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?7TBk6oD4DNqb/g8X7yQEJ8elKHzl2CQMbMOADjW4jPqIIzi2ioygcBoqUy?=
 =?iso-8859-1?Q?Ar2kDjAWB8ESgVzI6dO5IBlLOwyu9yeTfnlWk7ThOcsFkFnUsFQT6BTamP?=
 =?iso-8859-1?Q?QgjPNXXIS0oGMG7PZKtELprBYnnMwkHj2ghLMdTxXVPavrlEip0qUk+gd3?=
 =?iso-8859-1?Q?zgmP6PQQI/ADzdybubbu2/va8uaMYd1n1PtztdeB/XO6OufQZB44hvjhJ9?=
 =?iso-8859-1?Q?ySyiSzfjAo1imcN30SO+4RPsvZkl08xhsWmsW3ZPNmACr6dGRSXTG1Y+1o?=
 =?iso-8859-1?Q?axjEJvQIDxjM9W+r9QhohZp+hCsajNIk7bQDiraHS9X72K6dAyWtO0oJEW?=
 =?iso-8859-1?Q?vBjhgPxwueErQG7VI9Iy0lSSijs9GUgOTisDjojv3XsF/ePNVHONPEYYBa?=
 =?iso-8859-1?Q?0F3heDgDnLxbg7Hb2gNVUIH4Kx3YjTGCaUCILqiaxarEHQ4xCab5MDT1iy?=
 =?iso-8859-1?Q?3oqk+Vz6E9UT1T4CRGVJAOOU/o224pwSmRcc2353xyZ/BAXFir2gzAQc+3?=
 =?iso-8859-1?Q?1OzxBXDenQxwXNfwCQ3sx4yadFsyolXw9mUR1el8caviWYKrnSUOoY3BC0?=
 =?iso-8859-1?Q?CpoVJsP84YZycV4uPzLdO7aT65c5FEHNFYiBI1O5NPC6rrj/iBYBut3TWu?=
 =?iso-8859-1?Q?B2gIP9exKeMzeNs5QzXKpb/sajEPlzzntT5PvJERXZ42h+96IrQog/S1rn?=
 =?iso-8859-1?Q?ZVSWZ6LTQ0OI2KAbMFx8KY88vzos5zsz4xCHUHcrXim49GaDfdZL4qchJ3?=
 =?iso-8859-1?Q?zISf6+KM67SgGkZ0qySCJAgCkWlQvIM7ZJep6Djt5RYdljXeqcI4Vuuia0?=
 =?iso-8859-1?Q?nyd8qkCaQCjB4iQsjGf0lZbw1iUBkrT/F2Aw2Qa1ZVdaa0yQXi7XP9anSG?=
 =?iso-8859-1?Q?1MVEZqlUwy6WEO3PvzSi3sygNX+wcfz+xe5Iiafagtg7QZPOe37npa+xzd?=
 =?iso-8859-1?Q?r9mublmIt0+h4xETouKTpjlQunCawlsW3lHHBDEiVVOJbD1yk5k2Oi8cZx?=
 =?iso-8859-1?Q?YN5CTIeKSc69WevZeQ7FOJ0IT91U0UkAgbVuuba19gP7PKl7bStzfr8YI8?=
 =?iso-8859-1?Q?VsZs1eOeTzHOHqKJ1WTVHZWx+jbjBrDs+VUqMHEyLTGMIZe7aThPDnwdBx?=
 =?iso-8859-1?Q?Xw7xfkl/UecQOZdVaNHDZNLUOeTtJ2e79sHwT9WS00DVUT2g8XHvRYz/YI?=
 =?iso-8859-1?Q?aNPgvgDT2dlXNPH9HSTsXAsKTqmKcnC33+37Jdd3ijTxcSsYJIhx96n7Um?=
 =?iso-8859-1?Q?0WBawsGmS6RJS7UXBIk/a7WVPvs+MlqnwQyErrF+c03O2Ef0tqGIihlsIK?=
 =?iso-8859-1?Q?zDVKB9VtFDFv30RJebs2y1qEVKDy1iUlTNO8ioXbUof2oWPT2mF+I9595Y?=
 =?iso-8859-1?Q?2swNr3/iwxHpqdxK/myNus8x8uH2azZZA2mqBEkFfFaR+/OQvHETzPbUSt?=
 =?iso-8859-1?Q?XxN1xHCJREP8QHMOTL6ODbsMEROoH+QpcDcuXBTXvW1X0rlxGbSBNeq4Yf?=
 =?iso-8859-1?Q?zVollHkxiBnylWWG0VuctY0Yxj/nOiX8EhmIIiF6AYpg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(42112799006)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?MuQ+7/u31G6Ra/jUJVxnAvXHlYvI2Qt9sK/VOrJUz0tKfyDPHWfglBnum0?=
 =?iso-8859-1?Q?yY1BQInKBg6yNLwa0dXMI1PJ1hiEXWVEb5Upk/SxZBn4adkV248d4B3gbV?=
 =?iso-8859-1?Q?vaNfEqp9EUr4pYQxn+Xbw0fdFz0bZelPNI9WhBtTqEWmijYFhwTVuydo5D?=
 =?iso-8859-1?Q?jTFIUTrhbElNSmrbIWtrjbv8QyG6pzkXCni0D7lzIxs/AXqXLLU4/Htwrf?=
 =?iso-8859-1?Q?ai+LJq+nH4EwYRqBbTxIzNjp5aobALWoI2vXE5ZeDUxvXB4xpeCLyv0Aci?=
 =?iso-8859-1?Q?g7FKMuj7vyA4ifmCJqiiDGwlCuMPaloRSnTUgEYtFZUdl7vMxrw2LrDaLX?=
 =?iso-8859-1?Q?BQ7q3aekYw1bxpkORCEUrGHbBNqpz/TlS5OaSJYGUXirJmSIqdSmw3el+U?=
 =?iso-8859-1?Q?2OnnkBcJ+IjIc4wcIMZ3C7bSobA0sRD3J8PQmR5jutQtvQJ5dF6uvVqGd6?=
 =?iso-8859-1?Q?SR7ifA0emnwfT5rv8GOU7VDitAIGOa/1zgri12er/SBEu1kgnjIdTwOCxw?=
 =?iso-8859-1?Q?5cRdt1D8FMRDjWQehbSpNf2YM0N17LlM+jH/orNsMa3/UyLY7v6beRC/YH?=
 =?iso-8859-1?Q?gId6IuzdaKesJHRHi3mM4FRQ3RcW5F6MnVaeA+2cHZ7bNewLAd7A37t6gQ?=
 =?iso-8859-1?Q?ARb55lwK052avi3QypZWbdf9zBzC/xTG1FXijNJB3eL8fylwHqgFW/N0BQ?=
 =?iso-8859-1?Q?PdAmSSSF8m40lli2LnPzeGv3Vj7WMNjy2Z7gOqqtOZOgxPL6s0rwlRNzU5?=
 =?iso-8859-1?Q?vWwBJnWiPdPhtekxn7gsJeOj2M5tHutyV/C02kLYVb1a4ARcpdkNq4X6ST?=
 =?iso-8859-1?Q?VHMBJeXjHqIN7TEEPj7nplB/SzFc4oYKdExTFuz2AL+Ru5CpdNGADipmB4?=
 =?iso-8859-1?Q?JG7I66eMEdZoe2yM3A+1j4G+JN3WFA2jHiOZjd69925k2Q1KYiaBmjmpU9?=
 =?iso-8859-1?Q?BY7L9Swqhzx7rmu8amVppyf0DIkg0GcppMg8zlzTMag+pSwm2CU7HCm+NO?=
 =?iso-8859-1?Q?PuimQwU/Gn4jvUiIvcz5bv7JFfi6mzRujGc1QqTGYtSNKzm7AoPicOz105?=
 =?iso-8859-1?Q?30gt/ywg2yIjOeTC4J/7oz3HvcYgIA/EiRo0eb/xT1ola7DR7w7XPy+t6x?=
 =?iso-8859-1?Q?JHFw1SKKn5WarFMFYwU5urb8pr+lL2X85IKceCBjmB06C5IDRNCUCFjAYP?=
 =?iso-8859-1?Q?OvCRUZhjUux8vDCFZ05fh0v3uIoWLsN3jD+aMEK5PWkCd8XUjBoLXIlbti?=
 =?iso-8859-1?Q?zIJBxjQrRPdYY8CnB/q99ha8xbYubr/ZGjQsJBe8F8/43AhqfBIQx04Yao?=
 =?iso-8859-1?Q?DLusRWrziK4B8yllgFsWPPGE4uAmTY2sV2VNmjudMPWycOtszId+/RZEa2?=
 =?iso-8859-1?Q?YyPzU3MHD2HZosTuYZ0lve/H5JSajiL+h9VPveuhe/owXPZu44xqQZe3wx?=
 =?iso-8859-1?Q?MrX7zvhzW+Pmk9lYY63xc1Ify2XrSzNpH3nxpItP6feCuf0eaaFHJXbWWJ?=
 =?iso-8859-1?Q?/WVPxP9+FkCrCBdD1Pssj2geDO4XQpX436+02XR7+vLbx1b522g59iGpnz?=
 =?iso-8859-1?Q?/RXKJfrf5q+EEkoZ7dOePWWngBGwnUI50EzHFrP/hz1CZh8Z0RWf801fqy?=
 =?iso-8859-1?Q?r5dvnHJdQUSjzjsUgJXhxeSsIhMdDi8RYk/fSa9wQddI1i9Dfj5uiiJA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75be6d07-784a-45f1-7bf5-08ddeb2c5758
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2025 20:56:23.2359
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /oPPJqbBRRw/NyAALBykNjq6g1hru40HV9yGm0ClrAkUBfv4mle1nUEfm2L3dz4/K+W2Qz7/rD0WhB5CfoDzKzL6d1qkb4F3otidYUVyg7s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9607

Hi Leonid,

Leonid Komarianskyi <Leonid_Komarianskyi@epam.com> writes:

> Currently, Xen does not support eSPI interrupts, leading
> to a data abort when such interrupts are defined in the DTS.
>
> This patch introduces a separate array to initialize up to
> 1024 interrupt descriptors in the eSPI range and adds the
> necessary defines and helper function. These changes lay the
> groundwork for future implementation of full eSPI interrupt
> support. As this GICv3.1 feature is not required by all vendors,
> all changes are guarded by ifdefs, depending on the corresponding
> Kconfig option.
>
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
>
> ---
> Changes in V6:
> - added an assert in is_espi() when CONFIG_GICV3_ESPI=3Dn to ensure that
>   out-of-range array resources are not accessed, e.g., in __irq_to_desc()
> - removed unnecessary parentheses in is_espi()
> - converted helper macro to inline functions and added sanity checks
>   with ASSERTs to them
> - defined espi_to_desc for non-eSPI builds as a prototype
> - updates the comments
> - used the IS_ENABLED(CONFIG_GICV3_ESPI) macro to initialize nr_irqs
>
> Changes in V5:
> - no functional changes introduced by this version compared with V4, only
>   minor fixes and removal of ifdefs for macroses
> - added TODO comment, suggested by Oleksandr Tyshchenko
> - changed int to unsigned int for irqs
> - removed ifdefs for eSPI-specific defines and macros to reduce the
>   number of ifdefs and code duplication in further changes
> - removed reviewed-by as moving defines from ifdefs requires additional
>   confirmation from reviewers
>
> Changes in V4:
> - removed redundant line with 'default n' in Kconfig, as it is disabled
>   by default, without explicit specification
> - added reviewed-by from Volodymyr Babchuk
>
> Changes in V3:
> - introduced a new define NR_ESPI_IRQS to avoid confusion, like in the
>   case of using NR_IRQS for espi_desc array
> - implemented helper functions espi_to_desc and init_espi_data to make
>   it possible to add stubs with the same name, and as a result, reduce
>   the number of #ifdefs
> - disable CONFIG_GICV3_ESPI default value to n
>
> Changes in V2:
> - use (ESPI_MAX_INTID + 1) instead of (ESPI_BASE_INTID + NR_IRQS)
> - remove unnecessary comment for nr_irqs initialization
> ---
>  xen/arch/arm/Kconfig           |  8 +++++
>  xen/arch/arm/include/asm/irq.h | 37 ++++++++++++++++++++++++
>  xen/arch/arm/irq.c             | 53 ++++++++++++++++++++++++++++++++--
>  3 files changed, 96 insertions(+), 2 deletions(-)
>
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 17df147b25..43b05533b1 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -135,6 +135,14 @@ config GICV3
>  	  Driver for the ARM Generic Interrupt Controller v3.
>  	  If unsure, use the default setting.
> =20
> +config GICV3_ESPI
> +	bool "Extended SPI range support"
> +	depends on GICV3 && !NEW_VGIC
> +	help
> +	  Allow Xen and domains to use interrupt numbers from the extended SPI
> +	  range, from 4096 to 5119. This feature is introduced in GICv3.1
> +	  architecture.
> +
>  config HAS_ITS
>          bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPO=
RTED
>          depends on GICV3 && !NEW_VGIC && !ARM_32
> diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/ir=
q.h
> index 5bc6475eb4..f4d0997651 100644
> --- a/xen/arch/arm/include/asm/irq.h
> +++ b/xen/arch/arm/include/asm/irq.h
> @@ -32,6 +32,10 @@ struct arch_irq_desc {
>  #define SPI_MAX_INTID   1019
>  #define LPI_OFFSET      8192
> =20
> +#define ESPI_BASE_INTID 4096
> +#define ESPI_MAX_INTID  5119
> +#define NR_ESPI_IRQS    1024
> +
>  /* LPIs are always numbered starting at 8192, so 0 is a good invalid cas=
e. */
>  #define INVALID_LPI     0
> =20
> @@ -39,7 +43,12 @@ struct arch_irq_desc {
>  #define INVALID_IRQ     1023
> =20
>  extern const unsigned int nr_irqs;
> +#ifdef CONFIG_GICV3_ESPI
> +/* This will cover the eSPI range, to allow asignmant of eSPIs to domain=
s. */
> +#define nr_static_irqs (ESPI_MAX_INTID + 1)
> +#else
>  #define nr_static_irqs NR_IRQS
> +#endif
> =20
>  struct irq_desc;
>  struct irqaction;
> @@ -55,6 +64,34 @@ static inline bool is_lpi(unsigned int irq)
>      return irq >=3D LPI_OFFSET;
>  }
> =20
> +static inline unsigned int espi_intid_to_idx(unsigned int intid)
> +{
> +    ASSERT(intid >=3D ESPI_BASE_INTID && intid <=3D ESPI_MAX_INTID);
> +    return intid - ESPI_BASE_INTID;
> +}
> +
> +static inline unsigned int espi_idx_to_intid(unsigned int idx)
> +{
> +    ASSERT(idx <=3D NR_ESPI_IRQS);
> +    return idx + ESPI_BASE_INTID;
> +}
> +
> +static inline bool is_espi(unsigned int irq)
> +{
> +#ifdef CONFIG_GICV3_ESPI
> +    return irq >=3D ESPI_BASE_INTID && irq <=3D ESPI_MAX_INTID;
> +#else
> +    /*
> +     * The function should not be called for eSPIs when CONFIG_GICV3_ESP=
I is
> +     * disabled. Returning false allows the compiler to optimize the cod=
e
> +     * when the config is disabled, while the assert ensures that out-of=
-range
> +     * array resources are not accessed, e.g., in __irq_to_desc().
> +     */
> +    ASSERT(irq >=3D ESPI_BASE_INTID);

This really puzzles me. Should it be other way around? I.e.

ASSERT(irq < ESPI_BASE_INTID) ? Or even ASSERT(irq <=3D 1022) ?

Actually, I tried to your series. XEN does not boots at all when
CONFIG_GICV3_ESPI=3Dn. Looks like it panics even before it can bring up
the console, as I don't see any prints in QEMU. Non-debug build boots
fine, thought, but this is expected, as ASSERTs are disabled.


> +    return false;
> +#endif
> +}
> +
>  #define domain_pirq_to_irq(d, pirq) (pirq)
> =20
>  bool is_assignable_irq(unsigned int irq);
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index b8eccfc924..c934d39bf6 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -19,7 +19,9 @@
>  #include <asm/gic.h>
>  #include <asm/vgic.h>
> =20
> -const unsigned int nr_irqs =3D NR_IRQS;
> +const unsigned int nr_irqs =3D IS_ENABLED(CONFIG_GICV3_ESPI) ?
> +                                        (ESPI_MAX_INTID + 1) :
> +                                        NR_IRQS;
> =20
>  static unsigned int local_irqs_type[NR_LOCAL_IRQS];
>  static DEFINE_SPINLOCK(local_irqs_type_lock);
> @@ -46,6 +48,50 @@ void irq_end_none(struct irq_desc *irq)
>  }
> =20
>  static irq_desc_t irq_desc[NR_IRQS - NR_LOCAL_IRQS];
> +#ifdef CONFIG_GICV3_ESPI
> +/* TODO: Consider allocating an array dynamically */

I'd considered using radix tree, honestly... But this is just topic for
discussion, no action should be taken here.

> +static irq_desc_t espi_desc[NR_ESPI_IRQS];
> +
> +static struct irq_desc *espi_to_desc(unsigned int irq)
> +{
> +    return &espi_desc[espi_intid_to_idx(irq)];
> +}
> +
> +static int __init init_espi_data(void)
> +{
> +    unsigned int irq;
> +
> +    for ( irq =3D ESPI_BASE_INTID; irq <=3D ESPI_MAX_INTID; irq++ )
> +    {
> +        struct irq_desc *desc =3D irq_to_desc(irq);
> +        int rc =3D init_one_irq_desc(desc);
> +
> +        if ( rc )
> +            return rc;
> +
> +        desc->irq =3D irq;
> +        desc->action  =3D NULL;
> +    }
> +
> +    return 0;
> +}
> +#else
> +/*
> + * Defined as a prototype as it should not be called if CONFIG_GICV3_ESP=
I=3Dn.
> + * Without CONFIG_GICV3_ESPI, the additional 1024 IRQ descriptors will n=
ot
> + * be defined, and thus, they cannot be used. Unless INTIDs from the eSP=
I
> + * range are mistakenly defined in Xen DTS when the appropriate config i=
s
> + * disabled, this function will not be reached because is_espi will retu=
rn
> + * false for non-eSPI INTIDs.
> + */
> +struct irq_desc *espi_to_desc(unsigned int irq);
> +
> +static int __init init_espi_data(void)
> +{
> +    return 0;
> +}
> +#endif
> +
>  static DEFINE_PER_CPU(irq_desc_t[NR_LOCAL_IRQS], local_irq_desc);
> =20
>  struct irq_desc *__irq_to_desc(unsigned int irq)
> @@ -53,6 +99,9 @@ struct irq_desc *__irq_to_desc(unsigned int irq)
>      if ( irq < NR_LOCAL_IRQS )
>          return &this_cpu(local_irq_desc)[irq];
> =20
> +    if ( is_espi(irq) )
> +        return espi_to_desc(irq);
> +
>      return &irq_desc[irq-NR_LOCAL_IRQS];
>  }
> =20
> @@ -79,7 +128,7 @@ static int __init init_irq_data(void)
>          desc->action  =3D NULL;
>      }
> =20
> -    return 0;
> +    return init_espi_data();
>  }
> =20
>  static int init_local_irq_data(unsigned int cpu)

--=20
WBR, Volodymyr=

