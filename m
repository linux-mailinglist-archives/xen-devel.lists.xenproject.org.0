Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF4389CF05
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 01:41:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702074.1096851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtycC-0002NZ-S8; Mon, 08 Apr 2024 23:41:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702074.1096851; Mon, 08 Apr 2024 23:41:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtycC-0002Kc-Ox; Mon, 08 Apr 2024 23:41:28 +0000
Received: by outflank-mailman (input) for mailman id 702074;
 Mon, 08 Apr 2024 23:41:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bW3C=LN=nxp.com=peng.fan@srs-se1.protection.inumbo.net>)
 id 1rtycB-0001me-F8
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 23:41:27 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20701.outbound.protection.outlook.com
 [2a01:111:f403:2608::701])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83fb5b3e-f601-11ee-914f-f14010f3f246;
 Tue, 09 Apr 2024 01:41:26 +0200 (CEST)
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by PAXPR04MB8989.eurprd04.prod.outlook.com (2603:10a6:102:20c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 8 Apr
 2024 23:41:25 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7386.037; Mon, 8 Apr 2024
 23:41:24 +0000
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
X-Inumbo-ID: 83fb5b3e-f601-11ee-914f-f14010f3f246
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LuwVhsX5r0raL7OeSyRi6Tls3upNNPNbu4EeHLMK+fdnjGCjEA68PYHlgwcq0g4AZXFlsVnlW4AWuIcrMgfz94+Y7tTMnOPHuL+6Os7i6JgqZDUacos09nvHJdesvVizNZpezqCFYusKV6NFb3PRNhs671k8VcINS6Npz7afGuvC74oMhZFyxB+E08rtmYtO7DWKyBFEJKqcdY+Aljk6meLN3nohWJxPHUqTmGdmQg3/wbIj8OVWpAC2Oz0rHUj5htIrhj3f8gsZtvIAvxLS6ylSkTct89nwr86Ux90SPRf1+28ogs9S0IrkWf45ZyxYWBG87S972JZ+1v3BW/jHPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3prSC/D6LBIJ+dS9gSS97hf+eMiK2RJH/kz0RQKcqb0=;
 b=BjCWadZpJAZrR3BTwJnXqpNTqk3JiJ62G+t3BISCktf+3iCdi3xpvxfuoYSqkOt4YWJ2e+BkbNQ4JqHd+sjD4b9EMz2anJ3cTVgYddB8s7r75TolzYj8bHY/0rFHDzTLs3lALjVaa4uIv6pISUgE2RR1sM4InpRAlxx9fj7RNgGq3BLP8x2EuUODHQIuGHR0msc+P6S+A5MX+7ksVpoRIoUfCEyKBE4KFhFlwnpVQxvGyoUkTpzg4DbWNBOeAYQVH6EOVcH+I1grLd/oeOXIK1sM6ZN7XspfJ8510PQ3FL4TUyufTZAhQJQJ+loyMY1X9uUbNKsgXDfZq+cd4lmwVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3prSC/D6LBIJ+dS9gSS97hf+eMiK2RJH/kz0RQKcqb0=;
 b=f54I03abuPUegb2UX6s4XH13YOx1PeqB7TZ5QX2V+EreB2nRVSeCXmAh0lVo+09P6bH6UD43pTgJd5LVM9pUPTTdxpf0NmYLSb1Cz7VkPRONNLm6dvJaxmlIVLaxn84YHvLqTFwB97wZzYILzOHIap2WOpGzLagSUkP2iNS4Kyc=
From: Peng Fan <peng.fan@nxp.com>
To: John Ernberg <john.ernberg@actia.se>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jonas
 Blixt <jonas.blixt@actia.se>
Subject: RE: [PATCH v4 3/3] MAINTAINERS: Become a reviewer of iMX8Q{M,XP}
 related patches
Thread-Topic: [PATCH v4 3/3] MAINTAINERS: Become a reviewer of iMX8Q{M,XP}
 related patches
Thread-Index: AQHaic9xT75A4CfqZkOginMa2008U7FfCNQg
Date: Mon, 8 Apr 2024 23:41:24 +0000
Message-ID:
 <DU0PR04MB94173F846027CE9855F2CAC888002@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20240408161129.900347-1-john.ernberg@actia.se>
 <20240408161129.900347-4-john.ernberg@actia.se>
In-Reply-To: <20240408161129.900347-4-john.ernberg@actia.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|PAXPR04MB8989:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 rNtYM4QSSEfIk5oA57wGjtRgJ//Z/2MAGx8iNNCousIpWtbl+nocHRb70zAzOMKKVVQSDZkW6z9fk80oeu4RzogHMADL2XR1PKMlJUMX07e+68rr8jxRcgsmxVY+CeW74Drx11lsKPTN3pAxDPKjND3/yxbFRTgNegOwXp1HAUdJrnhFrBbsGOaohBwUoriPF/UiX0tAGE128+NoBNzvQA9x5G7jremITtqLm2AcDT1MgA1pq3q4aV9CoEwTmdL/TqwCAunHZy2hWkzhBFhQaGfWekz9LrsRSb0Av8FF2BABD5R3O/duvOAQH6ybVKwuGy46AS2Pkiv6OOZvURJHsxiUMcEqC9xL71D2InTlZ+2L9YfzyL3iqRzfsowcYvaTvbi9zvtiznj8/CVKeP2JNw6Bxcxhq2UUPlHzKnRuIMrt7bs7zVhAURqwnjpw9Q7is1hlvXAZea50KC5rnyWyQ0c0nWqrEWdDGvr1ldgjOypby3/loHEQ98lqjDCGZbRp5n5r8LU1DdadN5G+ktvuuwJCts67lV6utYPsqK3Bnp2n8yOWgxh3riPHdVRALW8vOinhdbj37QTEBzMM7nYtf2C6uncfhKOxlgJJQHQpwKt9JYWuiAR7tXbbQGXyd5/LN3xK+6qvI3suL9SPUUPyMADE6at4J7MsxKJHMUJM10I=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(376005)(1800799015);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?4T0mLOZCTf08Piu3JztiLyy9klzHZGXNR4RYTugcwF1U7g675wrTLYGAkUho?=
 =?us-ascii?Q?s26WxDqpTzueKdIJ3pUsoLI131qlin5vfXPWOF6BFTdeERWNUR+3Xaz4Cxb5?=
 =?us-ascii?Q?qTX3BK49DrHistAUlwoIdqCRHWsS36mzoEFijBkGmdrLU+6miHJFr1P+desg?=
 =?us-ascii?Q?2ZsxYvlFRNu3Zk8wrrwdfmi+okKGyKll/mMujxSDtnjl7zMw9SgxAcwuhZB/?=
 =?us-ascii?Q?YNcz1Uw/QjjCyFLorWayilT/5UxfwKNX+VeKI/ZbWgS/qbGNxP4+ssyw/hc6?=
 =?us-ascii?Q?iRMfTyI3K/DvgY6SVNNzTObt4w7jvj/EWJIH1HCovWOtKkGoUugNs5e1bsVe?=
 =?us-ascii?Q?LI7uOdKJTNjsVsiDj63fHoND88UBRzvfsVwbgNc3px8663Y2lLlVfyj9HKBs?=
 =?us-ascii?Q?P4mwfV642olh5v+v5uwIyDfsw6pR24RsbJASwGysBmKdSN1WdmN/711gaGAP?=
 =?us-ascii?Q?IbdQXLvQUVVvAkT6enpT2N5mgj4cNA6yFvfwnEqEe/vmiYsaQ5V0Wh5Hd1i0?=
 =?us-ascii?Q?n0R/uS7AhO23OXuI/zOEM8pyrSggQwyU9xW21BUCqNMlG3tZiTTRPIX9FCMq?=
 =?us-ascii?Q?+k+qb38G4BGfaSTD8IBH6hsM7hWCINPj/3OGg92LcE7eTuXhE1faT688q/oP?=
 =?us-ascii?Q?BQWzBPbH441f+0YnAZS3KOUDGviDF8RQNMOFnz9rrdodayNkbbpdE286jtbI?=
 =?us-ascii?Q?49IezK5G07JM/iBXHGxoiM+PKZlxfMLMy+CJlCdZBInKef6ljoiBwkmpkD4K?=
 =?us-ascii?Q?CRU4VXa/AVJ9zswqoCLMRH6odI7D5sUgJKY4OeJtsYZM2A2fmVTfn5kmMNNM?=
 =?us-ascii?Q?zqVbQIb3zBvVtPYC6NescQkvVcNkXzgCyjqRIU6Zm/vpL/zfLq5K2A/yQ3sV?=
 =?us-ascii?Q?xjGUYf0dvMlWGx2XEKB584DzqluByOyFU3lzhxjePxy9Vzno4TiakdKMEc4i?=
 =?us-ascii?Q?X1Gxq4iuCRLXy3hDSXEHUhzh0EFAwYYKY5MuMqhbevw16SuErqZJCzILR35z?=
 =?us-ascii?Q?mYx9In5wReP8KfTTxTr0QN3XtC8j9xNjU/iHRHKLy5ut2Ta3pBf0jEsmyL0m?=
 =?us-ascii?Q?GY9Ugl/S5Zi3u+G7rY3NLE/Ze1t3QzoSVaqurz68uLH2/gq2/iSbOLg/aNC5?=
 =?us-ascii?Q?gqGPJHW9Erm00bVJDghCwo+zDItbBwYyZQInJKuPAAMgCY66Q4EGYKkZv5iC?=
 =?us-ascii?Q?ZqUd94zzSKdjGfCWAqqn6PE+Uq4cndxY9gVbC9tWdFfJiNVyFkDBeKB0WT2p?=
 =?us-ascii?Q?qPyiDiG+kQFLbGec0wjC0R1ZWBi9Wg/9uHoxRrHyGNC8Ya+bYx9TXNjiVoLY?=
 =?us-ascii?Q?G9r3XbgmTMGhS02lCfWZPoO8THVyh6A7vt8ruvdMjR2CF/gYKN0Njql1p0c1?=
 =?us-ascii?Q?t3fATW2xGv7bSnpV0D7o/lGavYzfs9/4kFS7GU70ADIca55Rg1VrmjXAYImV?=
 =?us-ascii?Q?R5YqF0uKE5Sdo6Aj6BEPK85FkvoDnk8vxjp9OpyKGMy3SeSVujawrWyGHyXU?=
 =?us-ascii?Q?Ky+fY5fd7Y3IvAYm/Xs4tisvD/nPWPvnkT2cfElx2xDPYzM0T/xrXf6mpQI7?=
 =?us-ascii?Q?5cOJcXZ8OxTwQobWBtI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19403f2c-2929-40db-22d5-08dc58256709
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2024 23:41:24.5073
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AK1XKWIqYXjxLu1yBoYBSFjJN+gnKbi1uLt8fWPr830CUTlGNV3LZQuO2NSeWG/75ucE7GLuhORCCkCZEboFyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8989

> Subject: [PATCH v4 3/3] MAINTAINERS: Become a reviewer of iMX8Q{M,XP}
> related patches
>=20
> I have experience with the IMX8QXP, and the supported parts of the IMX8QM
> are identical.
>=20
> Help review patches touching these areas.
>=20
> Signed-off-by: John Ernberg <john.ernberg@actia.se>
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
>=20
> ---
>=20
> v4:
>  - Properly sign the patch off (Stefano Stabellini)
>  - Pick up Stefano's ack
>=20
> v3:
>  - New patch (Bertrand Marquis)
> ---
>  MAINTAINERS | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1bd22fd75f..09982241b3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -337,6 +337,11 @@ F:	tools/misc/xenhypfs.c
>  F:	xen/common/hypfs.c
>  F:	xen/include/xen/hypfs.h
>=20
> +IMX8QM/QXP SUPPORT
> +R:	John Ernberg <john.ernberg@actia.se>
> +F:	xen/arch/arm/platforms/imx8qm.c
> +F:	xen/drivers/char/imx-lpuart.c
> +
>  INTEL(R) TRUSTED EXECUTION TECHNOLOGY (TXT)
>  R:	Lukasz Hawrylko <lukasz@hawrylko.pl>
>  R:	Daniel P. Smith <dpsmith@apertussolutions.com>
> --
Acked-by: Peng Fan <peng.fan@nxp.com>

