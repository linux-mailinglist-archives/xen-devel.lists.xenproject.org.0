Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ED1zCDLOgGkfBwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:17:54 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91424CED15
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:17:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218876.1527759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwcR-0006bT-49; Mon, 02 Feb 2026 16:17:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218876.1527759; Mon, 02 Feb 2026 16:17:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwcQ-0006Yh-VU; Mon, 02 Feb 2026 16:17:42 +0000
Received: by outflank-mailman (input) for mailman id 1218876;
 Mon, 02 Feb 2026 16:17:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hK3N=AG=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vmwZq-0000fY-4k
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 16:15:02 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d6ab7ab-0052-11f1-b161-2bf370ae4941;
 Mon, 02 Feb 2026 17:14:51 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by VI0PR03MB10299.eurprd03.prod.outlook.com
 (2603:10a6:800:202::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 16:14:46 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 16:14:46 +0000
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
X-Inumbo-ID: 4d6ab7ab-0052-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cfOM6nORlUtSpw9+jJngSLCbJVV5FgN0cPOHGtUBVOvKJuBPZ69bCqg9oMuQcxclY/3/N8HRJH9Jomqq05VvFuCAaXDLHqAJfBQQFKvdAftDtHjJjyiUHHoMr5f/TW7nZDHdxuC4srhH1dY27qMc1R2P7HeZrypsT+qlZuR43l3hIsujByVH8NgBZuUlCmOLbWR39k/0SJNsXxbq05r0yvA34+fIzNSNmK7AHT78L4UirDALJEsgCtBnmAMuRbPxm/MS0AEoQWM83elly4Wbbl2BlNNabXlmmWDYLAZQW2IBYFNqAnA9OZj4ggwNJGYnAlQWUD9+tHTTrXWn4FK6LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wmW7c/IQR/ClnIewJrc3yEUYhOdCsTt/Er9ZgkRu7zA=;
 b=GwG5nqJYOuTibCltifDbYWt8fkoJEB/aI079pKBdbG0F16ND2ttDV30StQE5tndd28JTXRNoqKDAtp6B9Zk5Vr+8RTsySuGDuxTamoudtxAojsKokUXm6ieOEGd5w9sWbox/8PUTNe2Cx2F+j6/V/qdY9NeQRZwFk3RMqJt7tJlx/G5Zlb3dYaxJx/1Fh6DcJ5Xb3m0xXH7qXh8AG69/cI72SvLNnnQqIO/KcMtkNgg5LOL6Wb3VYopFO2GZ8AujaGkSjIDNS3clg+Hm2ehpN6/lmDU2HPEsxPpiJVjm0nDWBY/Gl9cwSdKrqe5BeRSuIoNLVGnu3ZtwxeibvVclbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wmW7c/IQR/ClnIewJrc3yEUYhOdCsTt/Er9ZgkRu7zA=;
 b=RgZSjoFXZ7JRXpnub3E/3dkR9Hnlq6mlMH9u4Udv+yjBMBYIO95o6snJ9su1lRDb8w+l+6VOm2LwkdVSUZ0Kc4Uz6R2aQ1kJf6vV/4idZwIzL7jv44+Qvlwydk3z73ZQ+Gapqt6oQagOzrQWnAH+PGdoyERI+RFc1n7jbyjnyEI/jeGusKTQ+7QjrA2Yfq7htQscjky+TuP9WaaaGqwb0JYsQGEuNNfAKS7JZxbuVjVqc1MBiRGlJeM+n7sW3Ev8f0EODy+k3XSBL6KRxQ0MDP+g3Gt1pt+XvK0Sn/2T9hVZUD5G4BY1vXaBlXMEo0Cakg/QRf1ey7eV1l7PC2tMlw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "xakep.amatop@gmail.com" <xakep.amatop@gmail.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 19/19] arm/gicv4: Add GICv4 to the build system
Thread-Topic: [RFC PATCH 19/19] arm/gicv4: Add GICv4 to the build system
Thread-Index: AQHclF8L/bmHW0RbCEqNgcRSAK0edw==
Date: Mon, 2 Feb 2026 16:14:44 +0000
Message-ID:
 <df0e40200cffa20bbce9bf7af4496677cd64a636.1770046465.git.mykyta_poturai@epam.com>
References: <cover.1770046465.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1770046465.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|VI0PR03MB10299:EE_
x-ms-office365-filtering-correlation-id: f3c0f6fc-a72e-4245-3b34-08de62762f0e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?rPiRYNveQKF3ESasEqe/3sezOFkDDikQ8NYaFW9NB9V7glQkpvFCKbYDYn?=
 =?iso-8859-1?Q?RUrPiZfbzPsEUq3rkHn+7eLAZWnykc1eLlcQ3QU+mD0FH11/UtLoC6Hsj/?=
 =?iso-8859-1?Q?ymC1CpxWiPYJf2aO/2q6G79fIMRyOscuRTal07PwK2cWAmBcAWeYTDVrXw?=
 =?iso-8859-1?Q?FLlr+n82/VIf9sohrg3P+SDgbFV+64MWh2oec0cnnm9qp1RbXvOIMLbn8P?=
 =?iso-8859-1?Q?z5dzuCrGtxZgWW7e+aP3w26wWiXn/xZ+zvjfCWnRiLPE0NylH/kg2yypbh?=
 =?iso-8859-1?Q?KqkIu4Yqrn71j2DApf5EjLMMt6Dmon1B3m4PzpYlBpoMmeMlta2MRGP+GL?=
 =?iso-8859-1?Q?DeiC6NyzF1njc281+ovhmkUCD/IXAr38S/KCf/5Vb8XJ65ErqZBBmo60Gu?=
 =?iso-8859-1?Q?om8oVrlmZ1spoDlaFUpBy43fxOHanO4hsk+kCPlAkb7ajO0YUtk347ad03?=
 =?iso-8859-1?Q?F2lZomhBGmN+DmNp7gU71D6beQ8SrDHe35cOrVrkqT2PPIoW858HartblL?=
 =?iso-8859-1?Q?V3D8/prlcNP/57Lg2ITZSNmVTClyX2RmHtIwKm172O0Pc0FVpe2yNsEx9A?=
 =?iso-8859-1?Q?ZKcpRQOfEC+lZrrL3iBXbbuPvHo85DLAWVh1d1GeaapLmVrpcMIjMKO5tZ?=
 =?iso-8859-1?Q?yFnNlj5nbXQLpbGBYGiqYgzTXegr2G40a2cGidAz4YUzG1W+CBpQt8Gfwp?=
 =?iso-8859-1?Q?Akdx2ImJcqxs69dpzyPkCgfmAqCtcjSDTEMwwwzbD1Z5K01V7jGimifin6?=
 =?iso-8859-1?Q?2UHOaeiYXyh0LFN/oac2Q1cPd/cbRHPTSNdCt+FbVd7DgGd9hrQon5MOUw?=
 =?iso-8859-1?Q?Wzlwhp6BP5X7rItjGzznCOz3MIBdjPaNCJ+HdaNw9WCEoJow1jTExPiQq3?=
 =?iso-8859-1?Q?TqSh+et+rh1jg2hQwNdxdBehr+hx3o/Tb+6qXWADtW8SMIf6NYigxxpg+J?=
 =?iso-8859-1?Q?M04hTJdNDqkMQWndRNikallNfjdG+62iLjuM66IBPxyKnueEOIjMaRTSUe?=
 =?iso-8859-1?Q?71X3aQfiAGJ5jYhPR4HAenkLGaz1JFSl8r0QEIWu9ixx/H+MEz6GYzxxtJ?=
 =?iso-8859-1?Q?v008lfB3Q1aS16mALtZ3bpsll02EtF/ZghcB6iBal4Nki22ugYEp0f/72P?=
 =?iso-8859-1?Q?vIj+9CqfEhs9MeHqsOIZLkWZsqCUA0LcAG+pkqWRAiSw6RUFdE4UVrtfk9?=
 =?iso-8859-1?Q?RRVEXr4vD2rJO9gnqDMwxpTzALky6Ok6PGt4CsrGEEHkuYpd8BSiTbMY3F?=
 =?iso-8859-1?Q?MBUh8Q41vP4FNwle3TBOll0vAVA38Z+dsKPKk3Toima5kiVrMx0lgRhcEf?=
 =?iso-8859-1?Q?JHMugmLVyDQ2W4iiqDTquZTowqZRvo6cjxlWt6tprxkkIIHQ6v11eJYXHo?=
 =?iso-8859-1?Q?wzaURfNClrJeW0rL0bOAOVPP3K4LE1qrxrvEKw/jJu5o/ycBetapzf5DiL?=
 =?iso-8859-1?Q?YwT2fbHEQczBKEojT9vfMNMXVWhip6abCtccNaJ4H75Wt5Pa3ssRkks3oA?=
 =?iso-8859-1?Q?xjpBxbare0P30qUnkc3HMd70ZG4uUblgBkMzgiq0s04uagLu3bJDzdReXW?=
 =?iso-8859-1?Q?NWbmQ+03eBR+f5bVzAsTFypsFa/hsvGRW5BWMIUPQ5UnLXJnsopPTGw/we?=
 =?iso-8859-1?Q?wRSImBsbEVKJwHc/q/aCIMBpYGF4Y3ND/TNpwnLviq9uHkRheAzARIkyD+?=
 =?iso-8859-1?Q?ePcawAb/+nghZMaKde4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?tAkYogTjQfFR0L8mwsSwWQwPo3ebftneyeraqoGD/Zh5rXT4PX2Q/hTd1o?=
 =?iso-8859-1?Q?PzUDyVClMXbxSH+8jyTogCivOrCRQ8qdIY7py/Rimdr1ET10h6QRrztITW?=
 =?iso-8859-1?Q?4G835li6VrITVE5gIsouhy73EfLU8DdS81Uunb7mixPIeBaO1oN8JiZ7pY?=
 =?iso-8859-1?Q?G2g9xU09kylXUGLy3l8pnATUTidldAWtvkQIefII+4owfL74M29Cl3LcJs?=
 =?iso-8859-1?Q?Uh4KQKHuE6/c1IUC+atVg7ymJ04Zp9bU6Hlr+ROLyK7MLUEQIMQG5asjTM?=
 =?iso-8859-1?Q?Fyji77WapCP7lHa2KWsHc18qXj9R9t6UHXtILRF+bp/yHCowMw4jePw+YP?=
 =?iso-8859-1?Q?un/qOkmRSv3RnBCHYiZag8vo171aB1D+1GtZsPxf+Hd2p1j/zqq+6v/OaR?=
 =?iso-8859-1?Q?wib8+ciqLYqaBKSS8hPwPCvki6CNODNdi2dS1WlayIL1KJJa+ZwFwXIlHU?=
 =?iso-8859-1?Q?zCWoCQA/FJPgsI4JdkuV75TWL1dbI1AFa8U7dkzawWyA5KqEpFxcpaRg87?=
 =?iso-8859-1?Q?+JsZfm7xPRIpgueUinWlvWLgF+6lKtLSw08vxIj6x0wwOiQY77vugsw4BW?=
 =?iso-8859-1?Q?L3VXmYb3idcZsnWDhSlTZ4Yk0+4yC4pxbQh7wq/FC9VXfNX0rCGSMDa7/D?=
 =?iso-8859-1?Q?sqZXTzGHfAHioFCyHrxoY/QuyEw1WgD9mnk8ps69r1nZzVzf3Ayraf6YpZ?=
 =?iso-8859-1?Q?1q7pB5owtDTO2aTBzjqHNIU6X7k/jqvMK3X08AovFRdK2Y6RmY1kWyX8pc?=
 =?iso-8859-1?Q?/iWLqj+O1XMxxMC/rCOcVgmlIf45pjitAFca6C0zoO8YjoeR2G5HncHhOZ?=
 =?iso-8859-1?Q?9OQO48cLTHxByjSS8hWMLpIOKPxmczgPM25KltD+JCpUISEaMd/6KZ1eUA?=
 =?iso-8859-1?Q?AdtfvqBZW+JQwV82F6LVsmILPwfR80kP2I8X6m9uJjKwbte7P2zx+h85M2?=
 =?iso-8859-1?Q?Hp/SRG5YH8ATWtf8yWzLlE6oDi9miyFJQ0tbdj+K4p032yhxllMWATafHG?=
 =?iso-8859-1?Q?UCqs4cdZeMVnB8PqheYiwfHvsmJy8v0mMXbFi8muIPoUuUcHiGeobC54V8?=
 =?iso-8859-1?Q?0QH9PGRz/WHoRF8bMhKKc7pfkzto//UuU3nf3NtXyXck4vdlmr7KLNwt+S?=
 =?iso-8859-1?Q?L+99LjlWexKBwqoPDZG58F/gOdGSdkYqnNe6ub1g+jvtC4VvL8TtG3t1hV?=
 =?iso-8859-1?Q?z0o+3zZ0hC0UCvkoubHUc/ImepEYh53MwsaETLvwPYgiRXTAG3gPTOcAFD?=
 =?iso-8859-1?Q?CSCj16c/D+nyXtlwTGkNVaR0NKtiJ//JItXvmP+m3eQMtc1NnwNPVSvVdr?=
 =?iso-8859-1?Q?tkxDhxwmzbJBMzcyMftMwj8Ubbww4rlfgP/KQOIkmbl46wfNzqEE9hA2AG?=
 =?iso-8859-1?Q?2+OHjbN1UJHFhURF2GFe0yflVY5OTZSTz4vmZiwLcjZqlg9QK2tj9eQFcH?=
 =?iso-8859-1?Q?KtmnZzwkjuv9F96mv5HdLl899w4DPSb15V4pFlT02c3SzaR7WxuOcHWl0U?=
 =?iso-8859-1?Q?lQa+giVH/6B6MvdjO0N8fpV3ACGayXDRF5NA4LQoo0Z+MUGPK1+1NVXY96?=
 =?iso-8859-1?Q?b1Q3ZoMuS3K0xcTWGOi0tA2dPi5vkFX24HgGiOEiz1LCUFLOmnxmkPZkVt?=
 =?iso-8859-1?Q?qBfHiscS0nHkyrhi8y80CZOLvnh3uWYKZpz7VghXSenNdvYzs7//DCXkux?=
 =?iso-8859-1?Q?+mS1a5P/x6BAMq1hygS2GKbItlIqKO79C+UzfsAL3E+qGfCTOEQl1Sg4Lr?=
 =?iso-8859-1?Q?/WtMdbRdRf69mm/P7Hp6u+YFzWXSN+YcMYIHysAs3tl1PYSkAEWaYbcYkK?=
 =?iso-8859-1?Q?mQQ7ETzJ+EBsn/W7p0JhAuPK9XU4R5o=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3c0f6fc-a72e-4245-3b34-08de62762f0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2026 16:14:44.8887
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f+ZRkKvND7SiYOrGPOA4baYHeQjxk7XhpEsnLv7aE0UOaW9gLWy+6mqpHhhu/q/uxweyuNYPT8HjvI2FEoNtgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10299
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,epam.com,kernel.org,xen.org,arm.com,amd.com];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:xakep.amatop@gmail.com,m:Mykyta_Poturai@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,epam.com:dkim,epam.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 91424CED15
X-Rspamd-Action: no action

Add a config option to enable GICv4 support and include the
corresponding source file in the build system.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/Kconfig  | 6 ++++++
 xen/arch/arm/Makefile | 1 +
 2 files changed, 7 insertions(+)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 442d353b43..c18eca9f9a 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -255,6 +255,12 @@ config ARM64_BTI
 	  Branch Target Identification support.
 	  This feature is not supported in Xen.
=20
+config GICV4
+	bool "GICv4 driver"
+	depends on GICV3 && HAS_ITS
+	help
+	  Driver for ARM Generic Interrupt Controller v4 extension.
+
 source "arch/arm/tee/Kconfig"
=20
 config PARTIAL_EMULATION
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 95bc7ad25e..8569df571b 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -27,6 +27,7 @@ obj-y +=3D gic.o
 obj-$(CONFIG_GICV2) +=3D gic-v2.o
 obj-$(CONFIG_GICV3) +=3D gic-v3.o
 obj-$(CONFIG_HAS_ITS) +=3D gic-v3-its.o
+obj-$(CONFIG_GICV4) +=3D gic-v4-its.o
 obj-$(CONFIG_HAS_ITS) +=3D gic-v3-lpi.o
 obj-y +=3D guestcopy.o
 obj-y +=3D guest_atomics.o
--=20
2.51.2

