Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABC2B4AA2B
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 12:18:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1116206.1462615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvvQc-0006Wq-Fu; Tue, 09 Sep 2025 10:18:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1116206.1462615; Tue, 09 Sep 2025 10:18:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvvQc-0006Us-Cf; Tue, 09 Sep 2025 10:18:22 +0000
Received: by outflank-mailman (input) for mailman id 1116206;
 Tue, 09 Sep 2025 10:18:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=noAm=3U=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uvvIB-0001My-W9
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 10:09:40 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1756f370-8d65-11f0-9d13-b5c5bf9af7f9;
 Tue, 09 Sep 2025 12:09:37 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by DU4PR03MB10645.eurprd03.prod.outlook.com (2603:10a6:10:58f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 10:09:29 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 10:09:29 +0000
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
X-Inumbo-ID: 1756f370-8d65-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N04FdM/jONw6MuYWSB7RR7dP1d4TNMMabl3CnqN0E4Qap1ndOhC66VSuPVHr18emG9jMEH/mkkXrrFGXzbtS8G1UThkjs1WrkXND6l9tBQwaI4WAImlyY+37AtvXsg3i6uV4gcUoBS9b/vy6cMNdmfZUIQss9artPxux8n5rQHmbR1fbBeYdjihmDQKrVjIu7uW3qgQrB4/wxTZMtrOSK8WXnxecziituJNlhNSoCjKuvJCYLHgkUEIINXfXOjrWhb0IOSMBs8OwwuXG51raQmfCYMY7lrbKWMPQkxKhuUflKMWu793B8xGUAMxyfaMG+wmGq9fQ/hN0GVToxUegcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WxcOto4JZOafCSrYBo7S3JnuTIEtWhZv/gUMQqkd/uc=;
 b=s9i1/fLSvQ2dctVsZYexmJkaSd79syN32wsSdLVvcaVEhOeAz/VQPXE4YrXxxwId1cYJ5AwSW5KlxHwrdyr4kmba68VsOcFInmwJCDGkEslOKQxqo2ZLP8W4u2r2mBR++Ss6MrPifuq4HlM00iTl+KR4cNVLbAGLdwo8/0va2B3kzZSqdxAN9B/WxWXSPBztHwoXbywEBHwRPaob5142Q7MdDCAXAtjkBvKlk7vEa76WeSOCX5JFWyKCrF8lJL48KLxoZr1b0YjXUryxEbs6vahUpnrroyQDD2cPW9Ii1nCRLYkGhfVKkhCVhuctaio6D+YXC8b7ojMwHexaKdkmWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WxcOto4JZOafCSrYBo7S3JnuTIEtWhZv/gUMQqkd/uc=;
 b=aHBH6/0brleD8QQAZ6nyWViPTJ4CFDoCmmzT94e0G4twp2KHP/RW8TN0V309erTb/l/ir0DoiwNO3nUyxZ7rBvRoZYJpGMJ7vxogUQ+k6xokCw8KBWz8DA43Ic5C+EkPqbGeYOK/yiwj9M4sAkuD9wC5ijLY6sKQrvlTRSQqjUY0pBiGJweLLFEUD2+xVwKgThyZTeUz1itAiQxokMhjaBS9KbTbLkQ7yqoOJtepNgdgKKi8RhClNM4t/HtJyaRe99AhEecZ8Jrm6PXhtfDS4OeTe4xtc2CDu/CpmSutzqEaznw2iBfSXfFvgydBe+i/5wx51m1JdxnocxT36rF/0g==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Julien Grall
	<jgrall@amazon.com>
Subject: [PATCH v8 09/12] xen/arm: domain_build/dom0less-build: adjust domains
 config to support eSPIs
Thread-Topic: [PATCH v8 09/12] xen/arm: domain_build/dom0less-build: adjust
 domains config to support eSPIs
Thread-Index: AQHcIXHUheH+XMLsykqRJlmFqB5APw==
Date: Tue, 9 Sep 2025 10:09:29 +0000
Message-ID:
 <ad0dd789fa52a935296bd7b2aa24214d4143998f.1757412099.git.leonid_komarianskyi@epam.com>
References: <cover.1757412099.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1757412099.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|DU4PR03MB10645:EE_
x-ms-office365-filtering-correlation-id: fca61201-adbb-4b44-bafc-08ddef88f6fd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ob7XRII9bUc3lzCE8ZTG6q7qlVdnQZq9xHb2I5fZ+6KxQL82DX6QyyXIi9?=
 =?iso-8859-1?Q?6SP74P+UZ27beRMw8Hz0tZXaQxbgY7QUwB77T3FwfUyHhXyo+dG2RvNyGK?=
 =?iso-8859-1?Q?VlNTTpH7vXHvO7AgM3toboEzrdZUprRElcKJboQ5mDRL+VuabliikXgsrN?=
 =?iso-8859-1?Q?6PZnm19qYrmcw1YgVbx0XrJEoob9SWOeCFGtbm2Vl1qAiCRsK43KRrG0GI?=
 =?iso-8859-1?Q?pK4ECLHJPhcuvXsGMdNvZi0XWsoaYG/bHS/LXNib2IwJxbe7xr/31T58ER?=
 =?iso-8859-1?Q?e5WurUQpdtStGsBkGYaWiDCOPDfSckxcy+P4Boh65K+PElO1p3u4cO0jH0?=
 =?iso-8859-1?Q?9M+FFV4oYa+OOqoJCJ1KeH3MxCSn1pQ+NMpVwQPn+KlANeoLwGLRc7+PYW?=
 =?iso-8859-1?Q?ndxiaMVS0jvJovN6ZLB/MoIA1p/9OS25r5hhdyNTVRmob4qLZc3T2j9gW8?=
 =?iso-8859-1?Q?1fSUp5P++Z2jqctMu/ktW6A7OfQQ99FYRcbFe4O/djXa9krOl9vt4bzviV?=
 =?iso-8859-1?Q?F0k4T7zvm4BKLtDF17V6scfYdQ6bq6SRrVC3EmyyE2hopjglfaQfYRTWFq?=
 =?iso-8859-1?Q?ee6f5nEedPjamf0XQWDd5A1RK2bTF0ZmCc8b5/i3fz4X1p61d1AcTepJYb?=
 =?iso-8859-1?Q?q5k1d67iHStA+8RxWbtXWz0QXBUzZ0q+vZw9JBrLh5ie41ryObE78ErrQX?=
 =?iso-8859-1?Q?4jh1ZXGzV70D8B5TZDnmmUYs5r6VaK2SYMS9XZphSIpgWsUhkoLLDtW9CT?=
 =?iso-8859-1?Q?JZ/rJL0dvjfP+p3KTZP6VUAsmddWcFUlxn7kya7nOox/k8fGoske+o5S6F?=
 =?iso-8859-1?Q?Y630Ai3i3a41+uQXFDD887RlzxuEnAdRmXDBUsjDwlJG+Ye9+CNQ9Mt53I?=
 =?iso-8859-1?Q?0UCHUW2Qh47uc3DFsccNNLARuyRAGJ5XDyi+eRE61lPhfwXkmK5wGTecL1?=
 =?iso-8859-1?Q?KOwnQx8I+t7AFY8y9OJQPtLTe8Fjktt5/gtuYylXwgbOGHQ6AbTLflLBv2?=
 =?iso-8859-1?Q?hmY3aE6LVFJdaiZUiFhlj0qGSkkst5CeUubrMarMA+661QkKizlcutn1bh?=
 =?iso-8859-1?Q?IG/u43USnEn70gw60kGawZYjDSmJEKw/j1Jlt+5MjNQgMi9HDZyWw4R96n?=
 =?iso-8859-1?Q?/ETf3TRCqvuTUtL9XrsnjYaPWPtPqNH3VqMnYP9gamflhKvJE1zstq1soh?=
 =?iso-8859-1?Q?U4fq9FOAMhNJBf7vm6CsalMA1fyq7r04RIsRJZ5rc938tYFvYIW+aguNbB?=
 =?iso-8859-1?Q?YBJwiG7lrBY4P2JGygYzd6bafE8+cplt0uIzuGill+yGmri6y7vQzh/L9a?=
 =?iso-8859-1?Q?/F/E5Rmp+T2or4s1PzVonhPRYS+8Lc6TYZkaClQOcibnTD/bjDy3NO6Fog?=
 =?iso-8859-1?Q?aLGmNoS2sC4GVkL+tT+RggMELawEFn0+S0OIk4cWA4rTX5MoxOUMvwgV52?=
 =?iso-8859-1?Q?gvsMXEpWANE1GhscusfHwtzrrCpKCQxXb0UUMfJ3BzQwZQghLP+cjfeUAn?=
 =?iso-8859-1?Q?PnAh2ogkKf3RPRcrYH6I73BWt46UgpMsEFQvkdg4NygR9sDgMAYaBfOXgF?=
 =?iso-8859-1?Q?r7SLCvg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?dJJNcO1VB/3wCqreEVAVeiLO/gDXoYLH6+uGcRhLp1GhbXHYawJ2Kkrx/v?=
 =?iso-8859-1?Q?etmIY7ox4/WYDR0tk/uNFBo3TEmHhSLFJCY8JO+6GDHC1dP/2hO1/JI+uJ?=
 =?iso-8859-1?Q?ARCvJbLRhtCEp4eToag92Oe+tiM32mgPY2DSzVvHjHQPsXh6WJT/Ad/hAb?=
 =?iso-8859-1?Q?aWW4BXbjbGdpRCmk/YUW5JgAsDwS+QneEO7SW+hCCXJVnTsP5QbqB8f1Ks?=
 =?iso-8859-1?Q?ewJwIwCytuZNIz1HitU4YpTWpFawdtE6ZIq+sgclsHirOBywajoCM9N1VN?=
 =?iso-8859-1?Q?4dgOa1Exy6k8O4hDAc1RqDFVPH9CkqHl/avQRsHoKuj9vy48SxUSzGQww9?=
 =?iso-8859-1?Q?KbwH+5bAtFZCyVSz1quCb1QDZha4TKhaX1++k9SHI9kwBqQ38RzOdwdLxm?=
 =?iso-8859-1?Q?YPkJ6s8XwBq8f/sdD43nM4cirGwVD/PJP2sqsVYF5AqoxZU1MPTaVQHQQo?=
 =?iso-8859-1?Q?J4gkieDfkTTmKUYeQHva5cZlr0+rLYAYnQnbv7Bh4szjA0y29V3cSxouu3?=
 =?iso-8859-1?Q?EnqbVFf4MU1YIQLsnFNbPnTMdD8ioA/wL8zDchg8+S/ETawC2diA98liVZ?=
 =?iso-8859-1?Q?ZxpYpMHtf49d4C4yAChv0ZJzl+79hvM9uThTlnAD/GB2yBdeCUn7UXKBLE?=
 =?iso-8859-1?Q?GveSALuE4+ms41YhCWQFeowgufp66n1Wc8OR4OCxgi/GFf/b+nh/20XN57?=
 =?iso-8859-1?Q?PCmMq3TJhPjrekA4EYRWoGVnOqgSWiYSWT+SVc/6oNLvc/vfWOdeFkteSq?=
 =?iso-8859-1?Q?Fv9VooltrvrgOvtl+hS7VtpJQLjAxJ9OEoVIHAFnlqXJAlmCJMMTNMgSR+?=
 =?iso-8859-1?Q?gKJOsPg+DPxZQ6REOk1Al4MyzANAMflrigl780bLTdZcfJBy7kLRw8/9vR?=
 =?iso-8859-1?Q?Q9fYvdT++s/VEWWNduKfLbmOESOAwPMmbIVWklzRQ+mSFoBAkqpQQYimBE?=
 =?iso-8859-1?Q?U5YxoZ9LNqe5GuuBXK/dEx3VEQvddE6//bO5nsiSx2e36vgj1WeDVwGAY6?=
 =?iso-8859-1?Q?ndHB6r3fFDDum8FeBawnKIQjA7HHjlNueGOu1jGEe5va6SsOkcp1JnEAIV?=
 =?iso-8859-1?Q?FI1YqlWJ5onc7CEKdKmTuyjF8qwEh8E2KVlSPDsRvsiwdU1iOw0zhkYk8y?=
 =?iso-8859-1?Q?C0gQiXE43Qed1xFGivLCIlUUAdoF4KBd/5xasi3phG81efERd3HowI7Edk?=
 =?iso-8859-1?Q?G4xh5r0IInD/lXX0hD1oP5m8iPxataRgk1CtAmkJHFqwNPXoMlfM1bZuOV?=
 =?iso-8859-1?Q?nZaiiVoTKP9K0H9IAQZ481oHMvzTRZbcpBAnp4cSXsJ/SO3f2JMa8Y7IBF?=
 =?iso-8859-1?Q?xBvE32qYYhXiSH2+yemiTlVGuOklSXrnRfreyfAJVGFLMz0TuBFmaVrY9y?=
 =?iso-8859-1?Q?flr7cZ19yk7AqsYvM3VCk3MszMP+JD+oGVPapSNHO7boqqOW6fn62V1lSK?=
 =?iso-8859-1?Q?k8QtL3qxuLqilfxY+2KgysVSEGlU/SJ7Z4KVhc/TYDpsJE9URONIcK2nn7?=
 =?iso-8859-1?Q?C5JT+AWNQAxjC5BWplALsbUHCVKp/dogOESxLdkAHjsDHa+y71hknTLpZZ?=
 =?iso-8859-1?Q?x27z82uM4ZcJzvOxiWb6/oHVFkIQP3+SDXaiJDDlAjjMchR57MKkxVw1yf?=
 =?iso-8859-1?Q?w5IDPbVdFI4SvIGzE4nDXzyoV+mijeZEzoZInVXbl/NWUEmByneEsfyvG0?=
 =?iso-8859-1?Q?PFlOCFrAK1N1tPVCme0=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fca61201-adbb-4b44-bafc-08ddef88f6fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2025 10:09:29.4335
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IuUVRybk7ffyirKrUHV6wRGsrp70fQisfLfSHzb8sPe0M1pwkwJZ8rqZekaMAVv3MH+8SfdM7farVzjJO0o8sO+5VMuGz8OPJ+/zvgdROgc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR03MB10645

The Dom0 and DomUs logic for the dom0less configuration in create_dom0()
and arch_create_domUs() should account for extended SPIs when supported
by the hardware and enabled with CONFIG_GICV3_ESPI. These changes ensure
proper calculation of the maximum number of SPIs and eSPIs available to
Dom0 and DomUs in dom0less setups.

When eSPIs are supported by the hardware and CONFIG_GICV3_ESPI is enabled, =
the
maximum number of eSPI interrupts is calculated using the ESPI_BASE_INTID
offset (4096) and is limited to 1024, with 32 IRQs subtracted. To ensure
compatibility with non-Dom0 domains, this adjustment is applied by the
toolstack during domain creation, while for Dom0 or DomUs in Dom0, it is
handled directly during VGIC initialization. If eSPIs are not supported, th=
e
calculation defaults to using the standard SPI range, with a maximum value =
of
992 interrupt lines, as it works currently.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Acked-by: Julien Grall <jgrall@amazon.com>

---
Changes in V8:
- added acked-by from Julien Grall

Changes in V7:
- no changes

Changes in V6:
- minor: updated the commit message

Changes in V5:
- fixed minor nits, no functional changes: updated the comment to make
  it clearer and corrected a misspelling
- added reviewed-by from Volodymyr Babchuk and from Oleksandr Tyshchenko

Changes in V4:
- consolidated the eSPI and SPI logic into a new inline function,
  vgic_def_nr_spis. Without eSPI support (either due to config being
  disabled or hardware not supporting it), it will return the regular SPI
  range, as it works currently. There are no functional changes compared
  with the previous patch version
- removed VGIC_DEF_MAX_SPI macro, to reduce the number of ifdefs

Changes in V3:
- renamed macro VGIC_DEF_NR_ESPIS to more appropriate VGIC_DEF_MAX_SPI
- added eSPI initialization for dom0less setups
- fixed comment with mentions about dom0less builds
- fixed formatting for lines with more than 80 symbols
- updated commit message

Changes in V2:
- no changes
---
 xen/arch/arm/dom0less-build.c   |  2 +-
 xen/arch/arm/domain_build.c     |  2 +-
 xen/arch/arm/include/asm/vgic.h | 19 +++++++++++++++++++
 3 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 69b9ea22ce..02d5559102 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -285,7 +285,7 @@ void __init arch_create_domUs(struct dt_device_node *no=
de,
     {
         int vpl011_virq =3D GUEST_VPL011_SPI;
=20
-        d_cfg->arch.nr_spis =3D VGIC_DEF_NR_SPIS;
+        d_cfg->arch.nr_spis =3D vgic_def_nr_spis();
=20
         /*
          * The VPL011 virq is GUEST_VPL011_SPI, unless direct-map is
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index d91a71acfd..39eea0be00 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2054,7 +2054,7 @@ void __init create_dom0(void)
=20
     /* The vGIC for DOM0 is exactly emulating the hardware GIC */
     dom0_cfg.arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
-    dom0_cfg.arch.nr_spis =3D VGIC_DEF_NR_SPIS;
+    dom0_cfg.arch.nr_spis =3D vgic_def_nr_spis();
     dom0_cfg.arch.tee_type =3D tee_get_type();
     dom0_cfg.max_vcpus =3D dom0_max_vcpus();
=20
diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgi=
c.h
index caffea092b..24a4a968c3 100644
--- a/xen/arch/arm/include/asm/vgic.h
+++ b/xen/arch/arm/include/asm/vgic.h
@@ -357,6 +357,25 @@ extern void vgic_check_inflight_irqs_pending(struct vc=
pu *v,
 /* Default number of vGIC SPIs. 32 are substracted to cover local IRQs. */
 #define VGIC_DEF_NR_SPIS (min(gic_number_lines(), VGIC_MAX_IRQS) - 32)
=20
+static inline unsigned int vgic_def_nr_spis(void)
+{
+#ifdef CONFIG_GICV3_ESPI
+    /*
+     * Check if the hardware supports extended SPIs (even if the appropria=
te
+     * config is set). If not, the common SPI range will be used. Otherwis=
e
+     * return the maximum eSPI INTID, supported by HW GIC, subtracted by 3=
2.
+     * For Dom0 and started at boot time DomUs we will add back this value
+     * during VGIC initialization. This ensures consistent handling for Do=
m0
+     * and other domains. For the regular SPI range interrupts in this cas=
e,
+     * the maximum value of VGIC_DEF_NR_SPIS will be used.
+     */
+    if ( gic_number_espis() > 0 )
+        return ESPI_BASE_INTID + min(gic_number_espis(), 1024U) - 32;
+#endif
+
+    return VGIC_DEF_NR_SPIS;
+}
+
 extern bool vgic_is_valid_line(struct domain *d, unsigned int virq);
=20
 static inline bool vgic_is_spi(struct domain *d, unsigned int virq)
--=20
2.34.1

