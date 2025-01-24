Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96418A1AFA2
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2025 05:58:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876592.1286957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbBkd-0006ne-Mp; Fri, 24 Jan 2025 04:57:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876592.1286957; Fri, 24 Jan 2025 04:57:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbBkd-0006lP-J5; Fri, 24 Jan 2025 04:57:03 +0000
Received: by outflank-mailman (input) for mailman id 876592;
 Fri, 24 Jan 2025 04:57:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AcjC=UQ=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tbBkb-0006lJ-SR
 for xen-devel@lists.xenproject.org; Fri, 24 Jan 2025 04:57:02 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100000.outbound.protection.outlook.com
 [2a01:111:f403:c201::])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4a2054c-da0f-11ef-a0e5-8be0dac302b0;
 Fri, 24 Jan 2025 05:56:59 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by DB8PR03MB6186.eurprd03.prod.outlook.com
 (2603:10a6:10:142::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.19; Fri, 24 Jan
 2025 04:56:56 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%6]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 04:56:56 +0000
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
X-Inumbo-ID: a4a2054c-da0f-11ef-a0e5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FoKdGxdcnjjEFYZ4Vg2XAcB65wJUujXXeU1FYS87l6crxyMM2rAWolI6ab3u/aJc0e8MJh4cmrAU5EYaUC8royHBwGAFlOHkeGqV5ZbUFvt3ZFZYkzo2nNnsKd6o1Aqm0Gg5DGDbDNcX0WOMmh3XiXEJCDd79zyr5fhBraqFCb5RWtIZgaE+Q2E86iL+KCUqOtOEP4xixUgAC3dCXgRoINAdKGzA1SF1N7GH+joAE29mcDgP7fc3HZXlafjT6tkc5rjlvcj72tAf2J+AThQhLBtph2Vv8I2KTJ4Dbk5RWSr89dGljzMhpZt+rZstqxOt3JfBc/AykZuDSQ1et+zQOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3x2po5iIZxkhF3lNQ8hZ1PitGlGbpZrIAEqm5FTqO+s=;
 b=O0Q8DPMBWWaTnelKDwP/0eOIhp60l8viSPLxdApZArYsDEoDHdS0QZtqxWPpkdQirtM4Tf/lyEBIIDqDcP1j4vXrt0G4/Xjp31DWtgLBeLw/ULacrTIHFySG6A4aHfdb1/gs/p/V+DtRlpp6eLTZRnxuV6VjXNqRrsb4i1v8PQCY8BLNh6xMx7clnM5RHE2BE7rq0csNyyfQw4/+DZ2kcvGT3r2lHzjAi/jUtLuYl+8hyOdC1g46NMRbCorFWnt8D8Pkl0dZoB1cjW81n7ks5mGEfMb11UgpAAmhJKaIZoBhpoMKJLQ1NgFrvHlirHUELuCEPUZe42EDkwkN6WlJFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3x2po5iIZxkhF3lNQ8hZ1PitGlGbpZrIAEqm5FTqO+s=;
 b=nHVUUg3fMFBe+Bh/4WtmAKpfrzTN6LGocr1DcM6N58++o2A/NgafQ1mSwQfbWrXIuk1LgC0v+V/t+rMaBPfq7TWdAHgItQZP4CaY2sgyAjmJ8K6Wip2952e7Ckh6tZqKWK6XhFgWJrM4dE7zdt/YJmFDGH8HrUX29Kf1U5v09o1htQsPbJa7uPkfOuGhCB9GG5R1tBjA4fTxw5GfqAiCcsaUnGk2Sd9FfCF2iLIma7ETqJzl3nIBxIvsElVjLr8AWGbN9z39yzqqlJXgqMbdYVb5I9oj4dF4dNMJNIA4GxHsYiLZ4suVuAdD9aIveKM8vOlAVf77/yE/7INSOiWItA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "L, John Preetham (893)" <john_preetham.l@daimlertruck.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Request for Documentation on Bringing Up Xen on R-Car H3e
 (H3ULCB)
Thread-Topic: Request for Documentation on Bringing Up Xen on R-Car H3e
 (H3ULCB)
Thread-Index: AdtsrjaU74AF3fZpR/+NK9h56D1xZg==
Date: Fri, 24 Jan 2025 04:56:56 +0000
Message-ID: <87wmek24ix.fsf@epam.com>
References:
 <FR2PPF86245AF1B81D71CF27EE705ED09B7B8E12@FR2PPF86245AF1B.DEUP281.PROD.OUTLOOK.COM>
In-Reply-To:
 <FR2PPF86245AF1B81D71CF27EE705ED09B7B8E12@FR2PPF86245AF1B.DEUP281.PROD.OUTLOOK.COM>
	(John Preetham L.'s message of "Wed, 22 Jan 2025 09:16:06 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|DB8PR03MB6186:EE_
x-ms-office365-filtering-correlation-id: f719432c-5b12-47e4-107c-08dd3c338751
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?r6/KRtJuIRqM+zz7Slx5hXypWfioKDjbSXyKTbcdro5Ys2rUq9nWBtTI3w?=
 =?iso-8859-1?Q?JZi5F5/lczxCk6VXLqX1UlsNk5kAG6Re71RJrD2O3ylvfcC+dB/fS+JWWz?=
 =?iso-8859-1?Q?QYm0a5VuHcu63wvyh8yWfP4fK5jhccVeFYu0Ph2dpbkAmBb9AxUkrBvLBY?=
 =?iso-8859-1?Q?PtB3sXIKJSUz140ksVkF5wNkrVo0J8rqNbrYsg/D4eVVJqlsellCAAPh1j?=
 =?iso-8859-1?Q?NYbAkl2U1wflww5Po9a3mDHnVQBPK2EWgpT92+gHbGeWUN2Ewc7Xn8jF2K?=
 =?iso-8859-1?Q?sP/dSYAHZHvBaqbJKfDLSLLKEwYitG9KUqtYIVDnYK1qZWwcp7ZyMPQeMy?=
 =?iso-8859-1?Q?ulwPbwblxAoyu7TSUkyaox/WLZWZa5NgNyxo2nUzbLxbUBu9bccMNugFwq?=
 =?iso-8859-1?Q?ys+HDin4OG54JMVhqIlqQir5NqlHd9/e8yKPGSa8oNS5EdBKR/4ZlV7MNO?=
 =?iso-8859-1?Q?KF7dt8zqNXPp0aMbhvAz2AOJVbIa/82amTWY3nvno/agBQmTi+bw5Ouj4Z?=
 =?iso-8859-1?Q?ZGwcgggU+ntYqHjYG3owttzSaBaV4Qo15uUSHJuQ53E8PlOg2Irf6mFBaH?=
 =?iso-8859-1?Q?upAs+CIvdC47qi/oamvT7j6dwGeJMl+PgbQV/OwdNdGWI4Jwj1T7jjcqsq?=
 =?iso-8859-1?Q?0vbRRoVCfSJqtsOO98D+uEkcBIfHyLBdF7dR9gDmxP982rDR7vWLG/boc2?=
 =?iso-8859-1?Q?B2wnUSdPcJ3+cPg1bRDvsBiI9Ioc+hv0q1GMJsGZ7QyqoiXgQWzV/u8khH?=
 =?iso-8859-1?Q?3Sva5MZKNj4lkpTubohTcwLZ8p7eEA8lETYdH4LXWQ8frJYWQJDutjWuC3?=
 =?iso-8859-1?Q?dHKe1Mb4k5CA8IKp7jadhG2b/kJNmYEJvryBLuMEtcYQUkHaiPUmdEYr2+?=
 =?iso-8859-1?Q?CS+41QjqZ1AQ9KoawjflQgYwiQguapz7s7PsOQlOwhpO3j9f+hVVGXDYwt?=
 =?iso-8859-1?Q?irjb1gWDUAYIDGJidDpcD9CCdcx+QIpiJ9dC0hOz5ShQqeHwm+CBO84sfX?=
 =?iso-8859-1?Q?K+U4+Ul0xhVrC36YnZcpF6Va7NSAxBs8jO+9sBTc1uaE8QHF+AxRSiNmRj?=
 =?iso-8859-1?Q?6Q4QtQ5MqMyAti28v/XspQvXRp2oe/ebRxTQ+L0/iYTIe00C75NJtA4MxU?=
 =?iso-8859-1?Q?qJsmcx1T/t5hQIiD3N7fgMbGppPmfMGCHxFf+CczW/uCxsUX8O9UVbYfCg?=
 =?iso-8859-1?Q?hRwea1clwJ0T5UPUWGUaNwayIaSwZWGbr5izT1g3dkjdFJjm56rUz4K1Y/?=
 =?iso-8859-1?Q?J7V9Jom2vvDaYP1GIPKBYSQsPVPUxRWEVkttqNo+D8j1rUDk8Q3yLg/OZ+?=
 =?iso-8859-1?Q?Uqvrl5Nu7enLOrQLUOWECzDfLtBCq0RftAtObRXO1OJg7aWjLZCJ60BZpE?=
 =?iso-8859-1?Q?nn7h2BB3+qiS+GghjgKIzwMSQvZi9tVY7g4yG6v/FAvb1rEcs1EGQiPbAM?=
 =?iso-8859-1?Q?8b5Xlx0Zeb51ykWY?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?giKHnk3OyBAkAGfzyzZQuxsWtNCQc1kTaufBgfzXVnO5Lc8J7scKGXk7zx?=
 =?iso-8859-1?Q?06lVz/ISTYIZRthie3tNT89bWymHCqqBC8Z8Nb3Mqeepw5T48DSRmuobAQ?=
 =?iso-8859-1?Q?28s9FZCYi9uAxqZmnp1nduMbNr3xYCcgLK7EY1qREDhCB8DhA+Nkc8QxEJ?=
 =?iso-8859-1?Q?6tg4rgE6iDUOHoSmUsw+Eb6EBLhD27KLz+W+yA+NbSmjqBvZJv75N6+9++?=
 =?iso-8859-1?Q?t6kKvBeUTMFUe7vxXtJzvZRE9n81WYiNnQP6caI4ht+W35sp0nc6ZdGv/D?=
 =?iso-8859-1?Q?V9EMAQ8/6kft1IrlgVWaNyz7Ekr1Mrhw22Xo92PIzLoz8XDYsY2Caqciin?=
 =?iso-8859-1?Q?mTwxDIRymkRHhfpap0tMdWZwxgf5nsOGYQAdJOLNjX/KK8jCl1BjapjL4X?=
 =?iso-8859-1?Q?maucMk9BgV3RxC0m1/oLlTu/ulYpqw5KWhxP0BesHGLH2kAKSeUgigfGgZ?=
 =?iso-8859-1?Q?5A4aUeVlaqUey4x0cIWwwbCH1OoFd+8lscCcyO2HTvQ8hqensXA/kCpd0G?=
 =?iso-8859-1?Q?sIsSD6ubNniVRAgJCSVhXiUKQFCJZ7OJJi+XXRf+oroBUJGp7oISfyrB0g?=
 =?iso-8859-1?Q?rL8P0O2AC14PwKxtvRNrgoPN2wBBPA5PeM2wOXQ8votlxGOKIDaT3r6c6E?=
 =?iso-8859-1?Q?Uboljrv/UPtZHaD7hROPhMm0qSbaPIsM2F4G9B8vC2swTpWsMoIEnbahXR?=
 =?iso-8859-1?Q?rptvkbuKW7Lwp+6B7mzDq3GNjjDQG5WYzarFLCRdjT6LYeBLBVUgz9g7i3?=
 =?iso-8859-1?Q?bEVte92RK//a1NI18k5XS+3L7kQvyoKqiIPUGQ0pp/O8REoJPXUzUgWRym?=
 =?iso-8859-1?Q?m4UI6eqv4SZY9tmHnnq0wJltCSOpY5lWF+Gc+F2JVdssh+SFXyU88LsvGR?=
 =?iso-8859-1?Q?XlFf7FOw7cxihWQkEzrD6cA8TM6aP0CFLjewzTy/V/Mc0Sh/N8uJchUM10?=
 =?iso-8859-1?Q?s4IzC7GvD+6OdwgpZfGjE2RMqHG6pfmfStQD5OJkUzk2BNzll6qPM15T94?=
 =?iso-8859-1?Q?UbauHiIs1GB8AKYxmUBdTH/JSQ+vLvAUV8YmtwJSP68ulNRbzJT6s/oow4?=
 =?iso-8859-1?Q?c3Dl3Zwzr8GrekfDl4mlbrzmoTd/C2LuhtaizEesp96rqS5V5P6Df9fdZc?=
 =?iso-8859-1?Q?pVgYQo4cVdoBzVZx80o4qf2JypBRrob0RZrtHsbN/Z6/kfcfSdTz2zxaBw?=
 =?iso-8859-1?Q?/Xdp9iG3EPTzp3MMmJpSxuKN5DS8sOgL9l6hP4FynXuL1C+sZonbvf/KKS?=
 =?iso-8859-1?Q?Vxc2U1a1ssXxfF2GCTaCYOTyVaip89U6k916jaiuZ+jxJgBQ+VxKdq4M4P?=
 =?iso-8859-1?Q?fhB4j7zUx2OQkzuHFuSAUvHJBsAqpHyT+ljphMG9ZPZPf1NOgwqJJpx6pS?=
 =?iso-8859-1?Q?Fo4x6+a5vEBn8UH3OWHSwWsBfN75VhtM70nmAoCGaB7E7KttR2IS0shqx8?=
 =?iso-8859-1?Q?0Q/SbMuzH35ZJH3Y1Mw6zHbbHkjyJK1A1mWQaPmz/5sXTwCn+dMiC3Ot4j?=
 =?iso-8859-1?Q?qX2qmqIDt3Shhx+8oczASl718CRAe4l3w8mWalLuKyg+OGkY3NFEsXYzRs?=
 =?iso-8859-1?Q?btlbrENyvnlvf84q+QXtfnZxGsVyW85yTgojv0mxoq/Ql1FHjdeHXfe1Me?=
 =?iso-8859-1?Q?7rCXGU3DnxigLzvKwYnJfPQnv2hOERu4xI9q8TBPYFZTWQyDPTPtbNrg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f719432c-5b12-47e4-107c-08dd3c338751
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2025 04:56:56.7622
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yqVEHbQyeLlZATL7WQ3+uCNg4ynPFGYdAfi8AMeFu77qAlCsCvkjrNgoDosS4ZTzH5FnUKtScnVXK6b3fbRDC7np2yH4cK/ve8kGOi0HXGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR03MB6186


Hi John,

Sorry, I hit wrong "reply" button last time. So I'm re-sending this mail
with xen-devel ML included.

"L, John Preetham (893)" <john_preetham.l@daimlertruck.com> writes:

> Dear Xen Community,
>
> I hope this message finds you well.
>
> I am currently working on a project that involves bringing up Xen on the =
Renesas R-Car H3e (H3ULCB) platform. I am seeking guidance on
> where I can find the proper documentation for this process. Specifically,=
 I am looking for comprehensive documentation that covers everything
> from scratch to the end, including the required versions and any specific=
 configurations.
>
> Could anyone point me to the relevant resources or share any documentatio=
n that might be helpful?

Well, you can build all from the scratch. I can guide you through all
the steps if you wish. But I recommend you to try this approach first:

https://github.com/xen-troops/meta-xt-prod-devel-rcar

This will build you a full system with Xen and (multiple domains of you
want) on SD card image. Just follow the instruction in the
README.md. You can use this as a starting point and/or reference for
your own setup.

Just be aware that this approach will build you highly customized setup
with "thin" Dom0 and separate driver domain. But anyways, this is a good
start.

Alternatively, you start with official Renesas manual on building BSP:

https://elinux.org/R-Car/Boards/H3SK#Quick_Start_How_To

and then build on top of. But this will require many manual steps. On
other hand, this will give your much better understanding on what goes
on. There are two ways:

1. You can build Xen hypervisor separately, but you will have issues
with building Xen Tools for your dom0, as you will need to create and
install Yocto SDK and then resolve incompatibilities between Yocto SDK
and Xen's own build system.

2. Easier approach is to add meta-virtualization meta-layer to your BSP
and build Xen hypervisor together will toolstack using this meta-layer.

Apart from building Xen Hypervisor and Xen Tools you also need to:

1. Ensure that ARM-TF boots the system in EL2. There is a
Renesas-specific makefile option for that.

2a. Alter BSP device tree, so it can be used by Xen. You need to provide
IO-MMU mappings.  Sadly, Renesas does not provide them by default. We
have custom dtsi just for that:
https://github.com/xen-troops/meta-xt-prod-devel-rcar/blob/master/layers/me=
ta-xt-domd-gen3/recipes-kernel/linux/files/r8a77951-h3ulcb-4x2g-xen.dts

2b. Alter BSP device tree, so it can be used by Xen. Apart from IO-MMU
configuration you need to tell Xen where to look for module. You can use
ImageBuilder, mentioned by Stefano or do this by hand, like this:
https://github.com/xen-troops/meta-xt-rcar/blob/master/meta-xt-rcar-driver-=
domain/recipes-kernel/linux/files/pvr/xen-chosen.dtsi

3. Hide SCIF2 clock from Linux (or use "clk_ignore_unused" dom0 kernel
argument). Otherwise Dom0 will disable console during the boot.


--=20
WBR, Volodymyr=

