Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA03B37608
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 02:17:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095340.1450396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur3qA-0004zh-BR; Wed, 27 Aug 2025 00:16:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095340.1450396; Wed, 27 Aug 2025 00:16:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur3qA-0004xT-8V; Wed, 27 Aug 2025 00:16:38 +0000
Received: by outflank-mailman (input) for mailman id 1095340;
 Wed, 27 Aug 2025 00:16:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QSw+=3H=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1ur3q8-0004xN-Iy
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 00:16:36 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14c9a77c-82db-11f0-b898-0df219b8e170;
 Wed, 27 Aug 2025 02:16:30 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AS8PR03MB7157.eurprd03.prod.outlook.com
 (2603:10a6:20b:2ed::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 00:16:27 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 00:16:27 +0000
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
X-Inumbo-ID: 14c9a77c-82db-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Os74dahsojDjdhSv+vAtyvXW93rkPBYYwZSLppJsWZkQpv0qElxypicz3xwywmA50NUYwo+ArqDZI6UbjoOssvc9wdDngXyXfFkg7CHUiqzvq3WtkZ+1HBpsbnu7boZtKqLILBfVpmkWelzcg46SNL7rL7nytF0SyOyvhCCqt5YOnrn/uxOs3rvs1aYOUZusoMhmx0h50oOGhkdrN2t8oYENnode7ESjo/XFf74plu4/D8VTBzHgSzQqwL0iTMbrI5qs+OtJUuHjH9AgoK+hoMn96n8c/ofK3r9EELmnGeyYqcdPgz3LhD/tYQLvB4aYXaEDouYljhW2nLvc9EWj6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7glPnS7pM0hUXYaivkOmclJe4QRGcv9zxiCMVua7KN8=;
 b=ff8zCk4A0yVTZccgcWVqZazTwd2j7+nwm4Mhs8wbvD5ZrEiPujNF1z5g06YJRwa2fc31DwuAlYHIv9jNjjiw3O3+gwf2wnV+DaWJnO6ssOBvL/0qYcbQViy4aD91GEUODA9E/0OMcW40s5zMC6HLApewpKNga56J5KpIrspSB7ryMcrgo/qBbSNZiX5QfDv0lJymk7nTCVKT1AotpSGdOvxSUbTPuX6UTSnHBFoCe59JZ2HuVkRpKWuXwbq+mxwkuu5YNx0FWYCZJw+yf1yPSJgUAJOIaW66Nb0qlFu6Ma+N/p7Z+7p+cMIQAha2waURmwFN5AIKieHgeRlIDNr88Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7glPnS7pM0hUXYaivkOmclJe4QRGcv9zxiCMVua7KN8=;
 b=RlL72ZPJboD+eyxiKhRtHmgy/0PWN5e5tIslUbtG/pl5YFHxj9qjUf6KERPRGFYgd6b7mv4V4zc6KpIWWHAbirdisQNvjqXfkVdxfa+u6Iktj74MAVv0Gf/4X7HQDB7RtjAZmprnsqr2OTIlsSXsR058eoKBiDOn9v70oyYJwzjhImp+1ZOZ7gJ53wKuh5E95GTubobjTtPLRcD7ebposlZb+9av/xYqcrJmGzjayAVaPIuM5h/X1ZfkFcQNGEUBUxhGfJ5nuApYiYyV6mZpp1uI4hV4EsJBH4kBhUQGkOxBdMmqsvQ65IWLMEjBNBKSVPea9kYpb1sHy7vbxqaoFw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 3/4] xen/arm64: allow to make aarch32 support optional
Thread-Topic: [PATCH v2 3/4] xen/arm64: allow to make aarch32 support optional
Thread-Index: AQHcBrdwMT62m9IEakijYkjoB+xNdw==
Date: Wed, 27 Aug 2025 00:16:27 +0000
Message-ID: <87ms7l39gl.fsf@epam.com>
References: <20250806094929.293658-1-grygorii_strashko@epam.com>
	<20250806094929.293658-4-grygorii_strashko@epam.com>
In-Reply-To: <20250806094929.293658-4-grygorii_strashko@epam.com> (Grygorii
	Strashko's message of "Wed, 6 Aug 2025 09:49:43 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AS8PR03MB7157:EE_
x-ms-office365-filtering-correlation-id: d485c87b-2811-4b6a-0abb-08dde4fef734
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?3C3cXpFKNgIkV371z8COIFq42iVazTnBllomcwJSzqeItuBzxE52S7WI6N?=
 =?iso-8859-1?Q?WjXMDRVvdasIDhcydHWMFRJfBNl1QcHSSCN2ISySfT9F1wFVcqk1KXxH63?=
 =?iso-8859-1?Q?AV6L5V2JU5DRLYeXU3WrO2hRfckzf9EKS230X4apKjxCQHFO+2fTrtjbX6?=
 =?iso-8859-1?Q?QKbFteFdBiJtUmf7xMPS9ARoxq2ArF488A+aTeiqSgAO61jVkenhkK+Pjv?=
 =?iso-8859-1?Q?nlAzW47ritw9v/k6EbqfufCCEoMyQT0h9tJBnCrp8cnTtqkZ/qTAiHOgdn?=
 =?iso-8859-1?Q?egLnkhv2vpkD0YZwa7p2Hd9tcPmwg5stRROCfU1d7XiKNmiBSmnU5RfbyI?=
 =?iso-8859-1?Q?+BVm0Hjs3ScInvoIPmeTIarQCvygnElDtZTMvGkL8C+/EvO2ryDxGOTv49?=
 =?iso-8859-1?Q?bCBtD3NSJpormkAbw8oouaqaIwG02BgkrZntO0R/ti1xIbOEX3RlG52POS?=
 =?iso-8859-1?Q?ZMjq1yYYZkBRvaXPwFjpuMGnAuHwZycd69CUKz6l6PY7uCq+uqMAA8TqUg?=
 =?iso-8859-1?Q?yMt+r+TK1TwLMFf7z9KN0XNgDlwMn1eEixKDZimWaElOvq9v8BFbXYD5Uj?=
 =?iso-8859-1?Q?EMzuNj5yGFvTS0qR5dnL7L9rTMeOk7euTtu0IViQXHKk1bMyOYP6Ky/oeT?=
 =?iso-8859-1?Q?zyU8jfiAbC3LGHgrLITsQ9kiZDfn/FWDyMn3Yn7R9e/1tdZ9sEHB86+mjm?=
 =?iso-8859-1?Q?tryyIXiJBdaDBHje9+wpQ5l+LOjvFSR+FDeZgQhx55U7KlI/sK9zGQNqnd?=
 =?iso-8859-1?Q?qieGS159ncXSL2fXVL7VERea9DCDk2Bsk6A1vEcy2prGSb3UI/nq6bIfDr?=
 =?iso-8859-1?Q?KyuDr6SxvothdoWYhyE8d0lz1uYcdWqYcIu90vMH8apLeodalBlUIESyl2?=
 =?iso-8859-1?Q?sLsHPlX9ykNzTpDcHItd7vex9RBB90iVWe/3yRfvMlh30Y5v07v/z5dSf4?=
 =?iso-8859-1?Q?kNxn6IxU2fFtRbfNgStGVPBRkSzqvyGf2WSkT5LspN1y9c+vmx8YZMBRE3?=
 =?iso-8859-1?Q?wMe0uCpGSJ0QbdZNcoC8g8EmUwnmmNbpdwuw/CYip47vRwdwnfx7oz9nbc?=
 =?iso-8859-1?Q?YJORiTfbvoqnJoNNYITsJnN9PsMk048SesTZlRPu/3OBaqlZocFSJFc9L1?=
 =?iso-8859-1?Q?9Q49BB/ZgUgP91RticpJewoVxB+GjCp/7n9WXQIZohGK4Tm7xIDI6SXvQM?=
 =?iso-8859-1?Q?SMJk8a2uwIJA9eQx8h1QmSGRThKVf/iVoOWpAu2OngDFH0liMDSZ84UI/K?=
 =?iso-8859-1?Q?rEWdnhMfKZcyjA+KrS9YzCf7Q8xb5sHhugpplQjwuYQVW88OV/pFO0YC+u?=
 =?iso-8859-1?Q?PIRWe74ub4IuwQmNVxIUxMmyjjnWS8BvTob5iDpuZimPUeq102Y04Qd1l2?=
 =?iso-8859-1?Q?stN026Of4Rw3moSvf/oTdG0iiRTpIg/37UhkvwrfiOJYzDjrjHILRoO/2J?=
 =?iso-8859-1?Q?ur6wUiZMAhLHdF7ACOkwlY6+fShXnLZNzQsMLWX1Cx2ISpwTTrAvpqbBa2?=
 =?iso-8859-1?Q?4i1O4LQ3SIMM43gWb/y3KZSNKKBLAXiDAHjri1w9r13w=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?n7E/rg9vvKRBszs8Z9mH/xv8UUnnDgsgoAdPVqjp463Cl+/wve9OQTnX8/?=
 =?iso-8859-1?Q?DrSiHOTItnXQXcXhX+c9gjbVgBPyvttqiHC69G7iTYZ97sz0EAdFsPGLMs?=
 =?iso-8859-1?Q?aqnUt/EZ3UY3uFiAkcyhuw5c+lTK2NYEOsaP2XVFwODlG39/MWFQQxZ2gZ?=
 =?iso-8859-1?Q?PYTyPGHnbJJOr3n/zzh3nUTBpRFYNm5xzAAK/x6ojqO7AWEz1RdAJODmOM?=
 =?iso-8859-1?Q?l/LQVCMXMbB7RJkPFBJ4eW2VKpOacI/+IW6VnSI0Zo16xBagEpeyZjMufq?=
 =?iso-8859-1?Q?omTJjgbwmaJaA2G8mDBCtZJt6JgjBddXn4I98cDotI41U81Peq3vJdnrVo?=
 =?iso-8859-1?Q?XFN492NDuDuJcoqo9qV5xltGa6446rhBqPz1f312uj8mlpX8VJyV5Bu9aU?=
 =?iso-8859-1?Q?LQkreK3r/bEPUph5Q8g88rgfTFmcxTLZd1xBpqnxG+Ivvat8C3omBSiLLz?=
 =?iso-8859-1?Q?hn9xhQrjMaGk8UeNuBWR9IUceTdTyLH5/m8g6rUj43YF/hmTE1eV8GQRGO?=
 =?iso-8859-1?Q?RwB+kzoqKHtXQqSo/FyGja6gp07mVpW7KXHk5XoP7aSkzsSkPBM6pJihyG?=
 =?iso-8859-1?Q?xY6fodt6vHbCba6YUjMq5l7MF4812PcBymMFNJhEvb9tebXvkmkpiopWX5?=
 =?iso-8859-1?Q?lXetE0kQZdGJpjsxf7whsqF2mO36WzhTyzZEfkJmG2hpssU6TXUYhY/hc+?=
 =?iso-8859-1?Q?xm59xImVaZhxiic7QY3AIY7VTOm5ar/COOJUdNAZ7qXd/KXN4AixF+N4SL?=
 =?iso-8859-1?Q?/ZE8sduqepfdVIte0W3z3XWN/fStodLf8mSCvFdBJua/K4eYPclbx2HIw1?=
 =?iso-8859-1?Q?oU+qLj6v1Jr8cYKcp1EvpUeVxZQLfPQuZeLXmqFpfejLNIEOKIlgjNlil8?=
 =?iso-8859-1?Q?TVm3es5tCvcvOlxq9Mp+jyUM11TSlr0GddD2KmS/hgLKQ+caZcIDOBWJdm?=
 =?iso-8859-1?Q?85XjQyXiZU8SnBHGCQELoTk+xmqE9TT0SlPLHVsTf7cIPSPBX7tLnLWeWs?=
 =?iso-8859-1?Q?uiR88BKvRDNfPWxZdeVYuJ2YIMvOdc3NcsUfjByBQySUDsPZcK9kwiHwVy?=
 =?iso-8859-1?Q?WhchSriEFHMRYptrrgKTj3F+i72S73Grtwff5T971pFfJImWWGl0Z23o31?=
 =?iso-8859-1?Q?8d/S99zyBkwtR59bZKHXFue/ASo11ItLtOEPInOprLHHNCfcozV5ZSqdA8?=
 =?iso-8859-1?Q?uv6QqWndwaKX7scxqmwtPw68QxxIbnnkm7eq9JdGD6Dbu+bYSYMr1y8ZbQ?=
 =?iso-8859-1?Q?Hk6faNpIo3YhAMmPswyGud/XkySZckc8/89sHwdJuFffKbYroSQBD1an0f?=
 =?iso-8859-1?Q?r0+KgPsRYRnWbX7lJLadCVArkkFUFQw+poxmp+WJAsLq4pYTh2QwPYbwPd?=
 =?iso-8859-1?Q?ettSntOhwYwIrXcKfCdE99ZHa0Dkw4dpt/Fex3aOZDvCJzz3nHJp+6X0bE?=
 =?iso-8859-1?Q?PeOgdZDluG0f0tehLDPvnkhuPHHK/Fn6lWlVyVymu5LOoRsRc4KvYurWAO?=
 =?iso-8859-1?Q?O0hptP2caZv+nL4CjbH5SV3R9OiTOj2dUQ+ZIaDAKuWgJtAkxHiOzsgewR?=
 =?iso-8859-1?Q?Wj1sVFod8J0XsHcEJcat1d9mHO6ohYU/53sJFUUY3k96XQ0yf3y9LggESq?=
 =?iso-8859-1?Q?arBgn5UcWI+l3EQNg4AU/MtuOOQsswpvPjWJvv/2ZJ7/i2Vdg0oEISnQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d485c87b-2811-4b6a-0abb-08dde4fef734
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2025 00:16:27.6254
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N/eOYnO8Zt1VEgY0DQYGcl4O3uPkJsULYkbjDcxgLy+4bmPgbBP/Wt6iI7KqHFd9Jx9bZc8tw+Dpuu+lcKh8jKGK5npThcvqdgFm4rE+uWQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7157

Hi Grygorii,

Grygorii Strashko <grygorii_strashko@epam.com> writes:

> From: Grygorii Strashko <grygorii_strashko@epam.com>
>
> Now Arm64 AArch32 guest support is always enabled and built-in while not
> all Arm64 platforms supports AArch32 (for exmaple on Armv9A) or this
> support might not be needed (Arm64 AArch32 is used quite rarely in embedd=
ed
> systems). More over, when focusing on safety certification, AArch32 relat=
ed
> code in Xen leaves a gap in terms of coverage that cannot really be
> justified in words. This leaves two options: either support it (lots of
> additional testing, requirements and documents would be needed) or compil=
e
> it out.
>
> Hence, this patch introduces basic support to allow make Arm64
> AArch32 guest support optional. The following changes are introduced:
>
> - Introduce Kconfig option CONFIG_ARM64_AARCH32 to allow enable/disable
>   Arm64 AArch32 guest support (default y)
>
> - Introduce is_aarch32_enabled() helper which accounts Arm64 HW capabilit=
y
>   and CONFIG_ARM64_AARCH32 setting
>
> - Introduce arm64_set_domain_type() to configure Arm64 domain type in
>   unified way instead of open coding (d)->arch.type, and account
>   CONFIG_ARM64_AARCH32 configuration.
>
> - toolstack: do not advertise "xen-3.0-armv7l " capability if AArch32 is
>   disabled.
>
> - do not expose EL1 AArch32 support to guest in ID_AA64PFR0_EL1 reg if
>   AArch32 is disabled.
>
> - Set Arm64 domain type to DOMAIN_64BIT by default.
>   - the Arm Xen boot code is handling this case properly already;
>   - for toolstack case the XEN_DOMCTL_set_address_size hypercall handling
>     updated to forcibly configure domain type regardless of current domai=
n
>     type configuration, so toolstack behavior is unchanged.
>
> With CONFIG_ARM64_AARCH32=3Dn the Xen will reject AArch32 guests (kernels=
) if
> configured by user in the following way:
> - Xen boot will fail with panic during dom0 or dom0less domains creation
> - toolstack domain creation will be rejected due to xc_dom_compat_check()
>   failure.
>
> Making Arm64 AArch32 guest support open further possibilities for build
> optimizations of Arm64 AArch32 guest support code.
>
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> ---
> changes in v2:
> - use Arm64 "cpu_has_el1_32" in all places to check if HW has AArch32 sup=
port
> - rework Arm64 XEN_DOMCTL_set_address_size hypercall handling to work wit=
h any
>   initial domain type set (32bit or 64 bit)
> - fix comments related to macro parameters evaluation issues
> - do not expose EL1 AArch32 support to guest in ID_AA64PFR0_EL1 reg if
>   AArch32 is disabled
>
>  xen/arch/arm/Kconfig                    |  7 ++++
>  xen/arch/arm/arm64/domain-build.c       | 46 +++++++++++++++++++++++--
>  xen/arch/arm/arm64/domctl.c             | 16 +++++----
>  xen/arch/arm/arm64/vsysreg.c            |  9 +++++
>  xen/arch/arm/domain.c                   |  9 +++++
>  xen/arch/arm/domain_build.c             | 21 +++--------
>  xen/arch/arm/include/asm/arm32/domain.h | 12 +++++++
>  xen/arch/arm/include/asm/arm64/domain.h | 23 +++++++++++++
>  xen/arch/arm/setup.c                    |  2 +-
>  9 files changed, 119 insertions(+), 26 deletions(-)
>
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index a0c816047427..bf6dd73caf73 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -266,6 +266,13 @@ config PCI_PASSTHROUGH
>  	help
>  	  This option enables PCI device passthrough
> =20
> +config ARM64_AARCH32
> +	bool "AArch32 Guests support on on ARM64 (UNSUPPORTED)" if UNSUPPORTED

But aarch32 guests are supported... I understand that you wanted to say
"Disabling aarch32 support is unsupported". But currently this entry
reads backwards. I think it should be reworded better. But I have no
idea - how to do this.

> +	depends on ARM_64
> +	default y
> +	help
> +	  This option enables AArch32 Guests on ARM64.
> +
>  endmenu
> =20
>  menu "ARM errata workaround via the alternative framework"
> diff --git a/xen/arch/arm/arm64/domain-build.c b/xen/arch/arm/arm64/domai=
n-build.c
> index 3a89ee46b8c6..5951f002e3af 100644
> --- a/xen/arch/arm/arm64/domain-build.c
> +++ b/xen/arch/arm/arm64/domain-build.c
> @@ -4,13 +4,55 @@
>  #include <xen/sched.h>
> =20
>  #include <asm/domain.h>
> +#include <asm/arm64/sve.h>
> +
> +int __init arm64_set_domain_type(struct kernel_info *kinfo)
> +{
> +    struct domain *d =3D kinfo->bd.d;
> +    enum domain_type type;
> +
> +    ASSERT(d);
> +    ASSERT(kinfo);

I don't think there is a sense in asserting that kinfo !=3D NULL after you
dereferenced it retrieve "d"

> +
> +    type =3D kinfo->arch.type;
> +
> +    if ( !is_aarch32_enabled() )
> +    {
> +        ASSERT(d->arch.type =3D=3D DOMAIN_64BIT);
> +
> +        if ( type =3D=3D DOMAIN_32BIT )
> +        {
> +            const char *str =3D "not available";
> +
> +            if ( !IS_ENABLED(CONFIG_ARM64_AARCH32) )
> +                str =3D "disabled";
> +            printk("aarch32 guests support is %s\n", str);

XENLOG_ERROR?

> +            return -EINVAL;
> +        }
> +
> +        return 0;
> +    }
> +
> +    if ( is_sve_domain(d) && type =3D=3D DOMAIN_32BIT )
> +    {
> +        printk("SVE is not available for 32-bit domain\n");

XENLOG_ERROR?

> +        return -EINVAL;
> +    }
> +
> +    d->arch.type =3D type;
> +
> +    return 0;
> +}
> =20
>  #ifdef CONFIG_DOM0LESS_BOOT
>  /* TODO: make arch.type generic ? */
>  void __init set_domain_type(struct domain *d, struct kernel_info *kinfo)
>  {
> -    /* type must be set before allocate memory */
> -    d->arch.type =3D kinfo->arch.type;
> +    int rc;
> +
> +    rc =3D arm64_set_domain_type(kinfo);
> +    if ( rc < 0 )
> +        panic("Unsupported guest type\n");
>  }
>  #endif
> =20
> diff --git a/xen/arch/arm/arm64/domctl.c b/xen/arch/arm/arm64/domctl.c
> index 8720d126c97d..4f0f143daef8 100644
> --- a/xen/arch/arm/arm64/domctl.c
> +++ b/xen/arch/arm/arm64/domctl.c
> @@ -13,6 +13,11 @@
>  #include <asm/arm64/sve.h>
>  #include <asm/cpufeature.h>
> =20
> +static void vcpu_switch_to_aarch32_mode(struct vcpu *v)
> +{
> +    v->arch.hcr_el2 &=3D ~HCR_RW;
> +}
> +
>  static long switch_mode(struct domain *d, enum domain_type type)
>  {
>      struct vcpu *v;
> @@ -21,14 +26,14 @@ static long switch_mode(struct domain *d, enum domain=
_type type)
>          return -EINVAL;
>      if ( domain_tot_pages(d) !=3D 0 )
>          return -EBUSY;
> -    if ( d->arch.type =3D=3D type )
> -        return 0;
> =20
>      d->arch.type =3D type;
> =20
> -    if ( is_64bit_domain(d) )
> -        for_each_vcpu(d, v)
> +    for_each_vcpu(d, v)
> +        if ( is_64bit_domain(d) )

Do you really need to check domain type for every vCPU? I think that
original variant was better.

>              vcpu_switch_to_aarch64_mode(v);
> +        else
> +            vcpu_switch_to_aarch32_mode(v);
> =20
>      return 0;
>  }
> @@ -38,7 +43,7 @@ static long set_address_size(struct domain *d, uint32_t=
 address_size)
>      switch ( address_size )
>      {
>      case 32:
> -        if ( !cpu_has_el1_32 )
> +        if ( !is_aarch32_enabled() )
>              return -EINVAL;
>          /* SVE is not supported for 32 bit domain */
>          if ( is_sve_domain(d) )
> @@ -58,7 +63,6 @@ long subarch_do_domctl(struct xen_domctl *domctl, struc=
t domain *d,
>      {
>      case XEN_DOMCTL_set_address_size:
>          return set_address_size(d, domctl->u.address_size.size);
> -

Stray change?

>      default:
>          return -ENOSYS;
>      }
> diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
> index d14258290ff0..9f7e735c9b74 100644
> --- a/xen/arch/arm/arm64/vsysreg.c
> +++ b/xen/arch/arm/arm64/vsysreg.c
> @@ -330,6 +330,15 @@ void do_sysreg(struct cpu_user_regs *regs,
>      {
>          register_t guest_reg_value =3D domain_cpuinfo.pfr64.bits[0];
> =20
> +        if ( !is_aarch32_enabled() )
> +        {
> +            /* do not expose EL1 AArch32 support if disabled */
> +            register_t mask =3D GENMASK(ID_AA64PFR0_EL1_SHIFT + 4 - 1,
> +                                      ID_AA64PFR0_EL1_SHIFT);
> +            guest_reg_value &=3D ~mask;
> +            guest_reg_value |=3D (1 << ID_AA64PFR0_EL1_SHIFT) & mask;

Why do you need to apply mask here?

> +        }
> +
>          if ( is_sve_domain(v->domain) )
>          {
>              /* 4 is the SVE field width in id_aa64pfr0_el1 */
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 310c5789096d..544d1422a793 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -791,6 +791,15 @@ int arch_domain_create(struct domain *d,
>      d->arch.sve_vl =3D config->arch.sve_vl;
>  #endif
> =20
> +#ifdef CONFIG_ARM_64
> +    /*
> +     * Set default Execution State to AArch64 (64bit)
> +     * - Xen will reconfigure it properly at boot time
> +     * - toolstack will reconfigure it properly by XEN_DOMCTL_set_addres=
s_size
> +     */
> +    d->arch.type =3D DOMAIN_64BIT;
> +#endif
> +
>      return 0;
> =20
>  fail:
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 47ba920fc6b0..c616127e8da5 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1873,19 +1873,6 @@ int __init construct_domain(struct domain *d, stru=
ct kernel_info *kinfo)
>      BUG_ON(v->is_initialised);
> =20
>  #ifdef CONFIG_ARM_64
> -    /* if aarch32 mode is not supported at EL1 do not allow 32-bit domai=
n */
> -    if ( !(cpu_has_el1_32) && kinfo->arch.type =3D=3D DOMAIN_32BIT )
> -    {
> -        printk("Platform does not support 32-bit domain\n");
> -        return -EINVAL;
> -    }
> -
> -    if ( is_sve_domain(d) && (kinfo->arch.type =3D=3D DOMAIN_32BIT) )
> -    {
> -        printk("SVE is not available for 32-bit domain\n");
> -        return -EINVAL;
> -    }
> -
>      if ( is_64bit_domain(d) )
>          vcpu_switch_to_aarch64_mode(v);
> =20
> @@ -1983,6 +1970,10 @@ static int __init construct_dom0(struct domain *d)
>      if ( rc < 0 )
>          return rc;
> =20
> +    rc =3D arm64_set_domain_type(&kinfo);
> +    if ( rc < 0 )
> +        return rc;
> +
>      return construct_hwdom(&kinfo, NULL);
>  }
> =20
> @@ -1994,10 +1985,6 @@ int __init construct_hwdom(struct kernel_info *kin=
fo,
> =20
>      iommu_hwdom_init(d);
> =20
> -#ifdef CONFIG_ARM_64
> -    /* type must be set before allocate_memory */
> -    d->arch.type =3D kinfo->arch.type;
> -#endif
>      find_gnttab_region(d, kinfo);
>      if ( is_domain_direct_mapped(d) )
>          allocate_memory_11(d, kinfo);
> diff --git a/xen/arch/arm/include/asm/arm32/domain.h b/xen/arch/arm/inclu=
de/asm/arm32/domain.h
> index 1bd0735c9194..30e8818ff2ae 100644
> --- a/xen/arch/arm/include/asm/arm32/domain.h
> +++ b/xen/arch/arm/include/asm/arm32/domain.h
> @@ -3,11 +3,23 @@
>  #ifndef ARM_ARM32_DOMAIN_H
>  #define ARM_ARM32_DOMAIN_H
> =20
> +struct kernel_info;
> +
>  /* Arm32 always runs guests in AArch32 mode */
> =20
>  #define is_32bit_domain(d) ((void)(d), 1)
>  #define is_64bit_domain(d) ((void)(d), 0)
> =20
> +static inline bool is_aarch32_enabled(void)
> +{
> +    return true;
> +}
> +
> +static inline int arm64_set_domain_type(struct kernel_info *kinfo)
> +{
> +    return 0;
> +}
> +
>  #endif /* ARM_ARM32_DOMAIN_H */
> =20
>  /*
> diff --git a/xen/arch/arm/include/asm/arm64/domain.h b/xen/arch/arm/inclu=
de/asm/arm64/domain.h
> index 1a2d73950bf0..bebcbc582f97 100644
> --- a/xen/arch/arm/include/asm/arm64/domain.h
> +++ b/xen/arch/arm/include/asm/arm64/domain.h
> @@ -3,6 +3,10 @@
>  #ifndef ARM_ARM64_DOMAIN_H
>  #define ARM_ARM64_DOMAIN_H
> =20
> +#include <asm/cpufeature.h>
> +
> +struct kernel_info;
> +
>  /*
>   * Returns true if guest execution state is AArch32
>   *
> @@ -17,6 +21,25 @@
>   */
>  #define is_64bit_domain(d) ((d)->arch.type =3D=3D DOMAIN_64BIT)
> =20
> +/*
> + * Arm64 declares AArch32 (32bit) Execution State support in the
> + * Processor Feature Registers (PFR0), but also can be disabled manually=
.
> + */
> +static inline bool is_aarch32_enabled(void)
> +{
> +    return IS_ENABLED(CONFIG_ARM64_AARCH32) && cpu_has_el1_32;
> +}
> +
> +/*
> + * Set domain type from struct kernel_info which defines guest Execution
> + * State AArch32/AArch64 during regular dom0 or predefined (dom0less)
> + * domains creation .

Extra space before full stop

> + * Type must be set before allocate_memory or create vcpus.
> + *
> + * @kinfo: pointer to the kinfo structure.
> + */
> +int arm64_set_domain_type(struct kernel_info *kinfo);
> +
>  #endif /* ARM_ARM64_DOMAIN_H */
> =20
>  /*
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index bb35afe56cec..c29573f0ffec 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -530,7 +530,7 @@ static int __init init_xen_cap_info(void)
>  #ifdef CONFIG_ARM_64
>      safe_strcat(xen_cap_info, "xen-3.0-aarch64 ");
>  #endif
> -    if ( cpu_has_aarch32 )
> +    if ( is_aarch32_enabled() )
>          safe_strcat(xen_cap_info, "xen-3.0-armv7l ");
> =20
>      return 0;

--=20
WBR, Volodymyr=

