Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A503FB447D7
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 22:57:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1110941.1459930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuH0w-000511-ER; Thu, 04 Sep 2025 20:57:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1110941.1459930; Thu, 04 Sep 2025 20:57:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuH0w-0004yt-BE; Thu, 04 Sep 2025 20:57:02 +0000
Received: by outflank-mailman (input) for mailman id 1110941;
 Thu, 04 Sep 2025 20:57:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jpjq=3P=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1uuH0u-0004yn-Om
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 20:57:00 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2e6031a-89d1-11f0-9d12-b5c5bf9af7f9;
 Thu, 04 Sep 2025 22:56:59 +0200 (CEST)
Received: from DU5PR03MB10441.eurprd03.prod.outlook.com (2603:10a6:10:516::14)
 by GV1PR03MB10848.eurprd03.prod.outlook.com (2603:10a6:150:211::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 20:56:56 +0000
Received: from DU5PR03MB10441.eurprd03.prod.outlook.com
 ([fe80::eeb8:470:6260:e5f4]) by DU5PR03MB10441.eurprd03.prod.outlook.com
 ([fe80::eeb8:470:6260:e5f4%7]) with mapi id 15.20.9094.016; Thu, 4 Sep 2025
 20:56:56 +0000
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
X-Inumbo-ID: b2e6031a-89d1-11f0-9d12-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dQqMa0+8mrLA/eYEtabjOTvR/hJ2pCrAj8fHG3gWdGm+fguk6tFxq8jE/j4c+VZNmlvF1h9V2cV2FgN5FdmjsO4AuBOVF5KwFa5mpwoYFdHxOigbPyo+uTwT8xGgzdX+JgfhL5jc2zz+FIjE59iUYZDcSNiOZq0GaiD9WC8lFFNqFZhg1gWHHxy7jUihp+Ze2ccG3tLxhKT9Cp0Fe1wD8FpWBz+bdPWNGE/BB2exjQ2isORlHyO1r7hJ9xmZ6YArwaJR+PdrVs70HvpTwbXL5D5sgu6iNukOCA4EZONU6muCi6+/O8kE8Kbux3+ByMzsuk/wyBVCqIzfa6YNmqbBrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iJ62jjtDXFCR/N9BXriVKCpNGVnWmAERYE+0vgER46w=;
 b=CGGvMS9gzslx4AI2UTm0eGLrNBzBjjpiRfKIHTHhgjY6jRD7hTO4ihx2KYsj+oXHZ8pue6K8UcsXzaxrPJU1OM24DLgh5mNzeTklJA8eN6zao6w80wPD96pDbZc+5hB4yZtik07QxDe/F+z7EvLslryjxeWML8ofwCIPeBq6HaFFI2DgZFtt20lutpW7NtjoII23VhOb7m8eqam+0sv2sc7tiVCkrIaBrn5dQF2diepWi4sSpk7OCNg+5jjl8whalJz7n5kusXFNDf3puaut32KFCi9G04S6WYeoTXP6QPaN7SRGXqk9gavjA3UYV52JO9+C/2cdYcx/2cLOwa+5XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iJ62jjtDXFCR/N9BXriVKCpNGVnWmAERYE+0vgER46w=;
 b=svg4Epiwv/y/3ZvvbMOjCksOZgAtruMvcW3mk9vbwgkBi99XuI/DZRMxdC6Hjas7O6bSeEyDb4T2yJmVrMU90/OoyrF/ggVTePN7SCL1aollzv/5tUAe+VKzXeDLTslr4k99GbqjtYkXmEOo79zp0/AFo+7Uhwr8PjEqrtvjTcZg7E90xtInMQ7zHyrlj6nWOLQDK9QCTzjF96Y2TeDNp66GXAcynkdCXy7BABZ7YSCQ2GVhCqcUxz8auKXeTs2pzXURJ8ghDoiY6rLg7PF6hgWDIMBZi7mmimG6x3d0mZZRMf1+M7VxqIeoRY9dks8KpMM4bIXrZlGxbuhLpsGhFQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"olekstysh@gmail.com" <olekstysh@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v7 04/12] xen/arm/irq: add handling for IRQs in the eSPI
 range
Thread-Topic: [PATCH v7 04/12] xen/arm/irq: add handling for IRQs in the eSPI
 range
Thread-Index: AQHcHday7CnqNZBtjUqzi3kcZcIrsg==
Date: Thu, 4 Sep 2025 20:56:56 +0000
Message-ID: <87h5xirl66.fsf@epam.com>
References: <cover.1757015865.git.leonid_komarianskyi@epam.com>
	<8b43ad89380261c3a3bbd0bc943461226d9cf0ce.1757015865.git.leonid_komarianskyi@epam.com>
In-Reply-To:
 <8b43ad89380261c3a3bbd0bc943461226d9cf0ce.1757015865.git.leonid_komarianskyi@epam.com>
	(Leonid Komarianskyi's message of "Thu, 4 Sep 2025 20:01:24 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU5PR03MB10441:EE_|GV1PR03MB10848:EE_
x-ms-office365-filtering-correlation-id: b84c6401-81f5-4202-2772-08ddebf595a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?fPOjfEQv7g9qjW+tH0+OZaViLRNLo8JVrXsvwQbneXxJuWUZUUwpNj1aTi?=
 =?iso-8859-1?Q?ZqZXRCRAJaxzvlHoc0Q6u2qZiA2CP67QBenbENiAGEzdd2MOMahQC1rfyQ?=
 =?iso-8859-1?Q?sZLgCnHDoRKXchDboxbNMEh+pvuAQfMgn+zp/lFHjJ0PGUaVWAMop3JaqC?=
 =?iso-8859-1?Q?LryHzNjtmqVLV939r36L1nw2VT8MuwsCy8zbg300XRwzjf/XbO9V0E4Iqc?=
 =?iso-8859-1?Q?2c9ulG/sYSHWPzo+JU0FS8wCCyWGLa6+/xEsrOtR59KWq26ZlFyKJ6POpc?=
 =?iso-8859-1?Q?6O2XxRYxUEqQYZjPyi8EhosbVaWS0meH9fEExpYMooMeY1Ng16APbye0qe?=
 =?iso-8859-1?Q?upC7Ak4oaACUaIhBlG/Jp8uOsXeyQ7gl94AxPTCXkiutOeKebAwLFIjMkk?=
 =?iso-8859-1?Q?M1EKkEuLlyFXRGdN9ViNR8ZpMaJl7ycBZmMwj3IyS6u7lF0Giw6nYZaPHr?=
 =?iso-8859-1?Q?LUvpqT290TuWuNNK34GYF9HfIGUQ/JrQnA4bE69coJlNRdTeZJzJS9igVE?=
 =?iso-8859-1?Q?HXKKpBCPfOHYxJfy6jS9mfzIQVyZZTCU2HzQjnRa3gJOw8OEWO5tNCRLta?=
 =?iso-8859-1?Q?0B6+xbbjpcfn0A4lok5LsCKFmf/1t8Yz0BY5CvH5wb3/1fRLFme+KuNdnh?=
 =?iso-8859-1?Q?vOJ9O7Xt0OE8HlhRuoSmbApI11uBL6S8JFkTf/WLRlnpYvKJ6PZGq4nbJc?=
 =?iso-8859-1?Q?CVO3urJGbLaHAR4aLTO7W3i4r1TWUCZViEgG5z7pVhSbkD/uI2Fsqe92z3?=
 =?iso-8859-1?Q?umnz/iZfnFRjR/XATUFirhFrlR3hN98V/7Ido2u4/8i+la/uAJU8mfwirF?=
 =?iso-8859-1?Q?1AjL3DOtEsLrPT9JXk92Wq/TgRf95XLkfKJhpZ7TiGQyesESGMIwuoH9xt?=
 =?iso-8859-1?Q?jXhjli1sLT6hLla6oS4LnmX6BlmBwzSXLljMeCCl1YXLEM6kTwIWRejxBr?=
 =?iso-8859-1?Q?tQGqfpafMOE8fRwAThkxPxQB2Bm6/xl8dkp8m1PcBA3mPbsUUO1uJUNFEs?=
 =?iso-8859-1?Q?CJtZu9jOJhiBKHzkSKwYtFUMdM79rbc6fWx/NYOW6wtr5jVjymDwBT8mLN?=
 =?iso-8859-1?Q?ZRt/6FEpzpV5ccE6QKPLrgaQ+kzI1/V/Zz+bKejkAq8JeB0blxugKvRPmB?=
 =?iso-8859-1?Q?3af1cBrZTAA3IG7EQW2N9UEa2OKTXI38oetMX9L4B1hQMsOslOoXnJIN15?=
 =?iso-8859-1?Q?smLzNtJcKwfqnrFjwkzuC/h43nZa6Tn+uJ9jXigKo+aP1hkqqwOWXKuZdO?=
 =?iso-8859-1?Q?ewyB2YRTnqaYUcdG+RW/pSH0BdpOnolv7o4Ib+A81RSD9oU1xhFCZO2Q72?=
 =?iso-8859-1?Q?3lT0MpV4F+bY4luf0xJqt/Gi/n3o1jarS7wyC2QTku4cljwFJP7rUU17ym?=
 =?iso-8859-1?Q?Z1Z/Z+q5tjFKzQylkXqFBJchcUrWgc+tkFeXaM6PvRkx3QnCuRWv4LT9zK?=
 =?iso-8859-1?Q?6uARRPsitOvJIulL+MdwT5Fkp7J5M84a4jMOrV8jwfIyor7JO2V10P4K4m?=
 =?iso-8859-1?Q?RmqWZ5Qwx51Km+ve1AsbGlXMrmKXt8/Nnvw9Rqb9/MfA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10441.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ty4VBh6bl5NPzrBXmkeneZyojhZtNc6Y+AycjHUdVyT8YMze3ulFis78oG?=
 =?iso-8859-1?Q?UFaL+T9PZLnntXO5XutYVLnZSmNAxZHL3g0+KekP/0QRtXdkkCqIvJFtI/?=
 =?iso-8859-1?Q?+AO6DScQm22EZagTPufsRBW3KiIDwEyphRr5BgphDWng432HnJ2EW+E0JI?=
 =?iso-8859-1?Q?+AEVDIGZ+TOoTp58O83YXTvcOx5FyhB+GGWEG4KxhGpYyQXQWiI726Bhdx?=
 =?iso-8859-1?Q?nmHG7AveVplz8GCvv1s2H7Pa97TFO3cQCLHzFerTuJaJugriUgraUvBW7d?=
 =?iso-8859-1?Q?kln8Irzj8e4aopCShCAqftnBff4jbcq6VsQh8mi8AGMK/M6BW/NraZjHqn?=
 =?iso-8859-1?Q?gFJiPnPYTtFTCi4Bj1tH41QwjQYTJZ5eihz2Rp6qUGL3FLGGyCFVnJJdsV?=
 =?iso-8859-1?Q?9oUVfp9+2DQUhNcqvTsoNuI4RTzsH4SNqAqjo2+THJTVkVmW7MMolCYAhZ?=
 =?iso-8859-1?Q?8A5qbwn3+Lf2iNAVozDVzihpAkQNscxRfNcdlGxR6dj0M+bPR6qqcpx7oi?=
 =?iso-8859-1?Q?3LVAjZxNvfPEU9yn4bjqgDT+/zuKdMIL71BJ6Y2YST/GsetLnQxxM6ueC5?=
 =?iso-8859-1?Q?MVfdTEm7YbBS1wUZL5duAS5kdZyZWzx8UFSU3fDjQMa+GSiwtjOqF/ukxF?=
 =?iso-8859-1?Q?egi1Or19Fq3ZF2ts6+HVS68ZnZ78sFZ4KPLCZeZ4Up3cxqsIfh1umI6bTJ?=
 =?iso-8859-1?Q?jbpRcCBN54r3Bv0x7ft9GOXGDjCgMSq7GeLBqa0RxUeTSWl6gKoOLOyfNP?=
 =?iso-8859-1?Q?iKSXZbICfKekL3hqaEBIgM4pRVZi7h/9AgY5caaZPLTm/EHP4o+flQk0zw?=
 =?iso-8859-1?Q?qvsyrO6Yb0bpODpLsiqqrdGE47ImFu9npG0bMPzzro9UeEUIWHXA5lQoK3?=
 =?iso-8859-1?Q?TAt94Qthr4ZHys7lv+ZqlQm+VW/LWtgw8BY1HMfwRl4A+7brawzjYpMrXp?=
 =?iso-8859-1?Q?OVqqYyG0kMMxacagwLiI0KxibM3+mMyX01NQLt2mZtlFLDqb+lq16PpJcw?=
 =?iso-8859-1?Q?GnWZV/vHOtxeElQ6UD/zdQeFIGnHmN2+TXgnCLxQgERagDLeE3VqBCKBji?=
 =?iso-8859-1?Q?UyOqalASSuYODvDMDZPWiMNkhettxzkHtjxuGO5ROY6gfU1en2PgnHay+p?=
 =?iso-8859-1?Q?QHr9mbvaMpKYlA9woGnnTyASuMhmdrkfdHcir/rvtH8YcZI8tFIFyxbO01?=
 =?iso-8859-1?Q?Bj6fxE/SbHru1K2gKgzo2aXmMu5MjN9jM3skB1vqfU8+wjXUR17M+pi0F5?=
 =?iso-8859-1?Q?y+xylZxzqF4vBdZZZVFP20bRZ9e0pDUcIrs36r/jVROiJJaR/cE2rx3+fM?=
 =?iso-8859-1?Q?Xs6c6uNq899t2ywlT+qjJsY6jgwUJqdkmiumr/+C2i84ZjpcWpAg/COi+0?=
 =?iso-8859-1?Q?HQ3V003ZGPGA+5cVVa0UBr9aispvsVVcoTOB/JkKBKS111qlsVqcbUbx7g?=
 =?iso-8859-1?Q?Sj7zFAivGmztRVesvan7liJuQZdFl7+GgHPdB08j5xt4CbWlLImsEiFT/u?=
 =?iso-8859-1?Q?ABT0bUgwByc/1+lzvJ8nKaf9AwLZDX9gPhE2gg+DGBP1NwWSPPORgsejRq?=
 =?iso-8859-1?Q?0807Tn2pSnFsCq1HfMXz0mqOJ9TgF0SH6K9GddeSnydnDBzBvwmy2HBokB?=
 =?iso-8859-1?Q?ZhtGW2nlDPG6rtZ2JyTkw4oSwDzkBWmdzaX56dFQJ5JHiPDJpIjjFkUw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10441.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b84c6401-81f5-4202-2772-08ddebf595a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2025 20:56:56.6304
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NP3W/d5GIwCbTJs5qFrCYuqlKoPD/aUCTRIRrXOZmQB38en7f+hBT5Og4LPrO04nJTZjt3w5M0Lma/bI3gNYPAODefW7A31KcQEPOcE+siQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB10848

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

Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

>
> ---
> Changes in V7:
> - fixed the condition in the is_espi assert for non-eSPI builds: the
>   previous condition was mistakenly added with a wrong check and led to
>   triggering asserts for all non-eSPI INTIDs, when it should be triggered
>   in this case in the other way around
> - minor: used is_espi() in the espi_intid_to_idx() ASSERT, as is_espi
>   performs the same verification
>
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
> index 5bc6475eb4..2ff2d07d6d 100644
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
> +    ASSERT(!(irq >=3D ESPI_BASE_INTID && irq <=3D ESPI_MAX_INTID));
> +    return false;
> +#endif
> +}
> +
> +static inline unsigned int espi_intid_to_idx(unsigned int intid)
> +{
> +    ASSERT(is_espi(intid));
> +    return intid - ESPI_BASE_INTID;
> +}
> +
> +static inline unsigned int espi_idx_to_intid(unsigned int idx)
> +{
> +    ASSERT(idx <=3D NR_ESPI_IRQS);
> +    return idx + ESPI_BASE_INTID;
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

