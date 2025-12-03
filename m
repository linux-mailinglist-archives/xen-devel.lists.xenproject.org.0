Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 719A0C9F3A6
	for <lists+xen-devel@lfdr.de>; Wed, 03 Dec 2025 15:05:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176838.1501295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQnU1-0003FH-37; Wed, 03 Dec 2025 14:05:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176838.1501295; Wed, 03 Dec 2025 14:05:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQnU1-0003CC-0I; Wed, 03 Dec 2025 14:05:29 +0000
Received: by outflank-mailman (input) for mailman id 1176838;
 Wed, 03 Dec 2025 14:05:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WC6h=6J=epam.com=Oleksandr_Tyshchenko@srs-se1.protection.inumbo.net>)
 id 1vQnTz-0003C5-O4
 for xen-devel@lists.xenproject.org; Wed, 03 Dec 2025 14:05:27 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d44882d-d051-11f0-980a-7dc792cee155;
 Wed, 03 Dec 2025 15:05:25 +0100 (CET)
Received: from DB7PR03MB3577.eurprd03.prod.outlook.com (2603:10a6:5:3::28) by
 PA4PR03MB7008.eurprd03.prod.outlook.com (2603:10a6:102:f2::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.17; Wed, 3 Dec 2025 14:05:19 +0000
Received: from DB7PR03MB3577.eurprd03.prod.outlook.com
 ([fe80::49f8:7615:b631:1a66]) by DB7PR03MB3577.eurprd03.prod.outlook.com
 ([fe80::49f8:7615:b631:1a66%5]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 14:05:19 +0000
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
X-Inumbo-ID: 1d44882d-d051-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wJH+GQsbVCQZ6GN5uSeK9lFbw1GNoB11litd7q8F1gWIuQu1qe7ZQ1m5s3e5FvO0GnzDn9lnxnA/nrrGy67R9ssczPbWIrVQXhFCueWtfvrbttCAK9gWGde/ITuIUXOusexPa0oT+xioav53UmvB+BdAOux6Y7OScorxD7tbmtWIqv5uXgCFKs5MhaDH4dZYRuLrleohcjSJryN6Q10SsHtH02ZxhZVgL4hkac037DJGtVpcm8focxMzuWLkv3RCQX7O69S7Q7nKOEnm+VDoMd4h5lrQaH2bqn3nLVgEr1nFNbNpsQrsQbUtY9g+T8erZi3h5s8r/XSkRx4mPsqyww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1dzrTSdORmenXOrS2yxeobEITLecqPGcnksgkRbPn0k=;
 b=gYYN+6XGRmd+DsyYBvSp9h2pixFRrH3GMpp6mLjJKlRea6LDr1NLURBYdwOKBFKZG0rckOPhBLK+KqiBTFl/ZtEZ5D8ig7DXC0wqfJ7xP4COwV71pQ7Cd5Eq8JL81Vmj5W1TWQWqoJuvZmVodqFZY//BlHbqjhdxvvJClS6HIAH3e4VF8rA2Dvlgk7x4n3pe0QHk2X6zHxWKSLmQTP/U+zA017KSxPZwa1Vc4HwU4ezkuvlxPWZc07oF6WIAsj2XxPpNb39GI+9RPRsVO2jOoIHVLKEIg99lesiIHfNTmNRiCFjmSwjL3sHGGI5MBFd1/A5RWqw3CT1r06Q81rPxJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1dzrTSdORmenXOrS2yxeobEITLecqPGcnksgkRbPn0k=;
 b=IrobZ74wyIoQJygxPvnejwjfma+dtkI23q/Zg3ypKHaa/GEwYUuL3hNqG4vFc6HBrax/gvNCfjuQ+lk0nQcVSRQgFdeJrJuOsp7LB6lhRqoJ6DpzCc3++ZyKkEExhNznA49la8sQ6xZUOilz7ELNn0q7ZPE28+//HI4Egx5rZNxdgw6Jw++4lBTUIwezWHqzx/Vzkq1KdeUWUhGqVZ9nqvobqgsWpd7RUmJlSe1h3kVr0mplmcdAC3ffJPkvhUStbTpXHyVHU8Ky3Exh9j2fTykqPGag5YLMSk0XCkvIWkJbynvb1uxYWJDTeXQ0bBMyXSGkY2S2xXKRNy61DRIG+A==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>
Subject: Re: [PATCH] xen/dom0less: Increase guest DTB size for high-vCPU
 guests
Thread-Topic: [PATCH] xen/dom0less: Increase guest DTB size for high-vCPU
 guests
Thread-Index: AQHcY8JwgLGK5hUeEUKxVWNaY5XmsLUO3xoAgADiZoCAACrCgIAAB+uA
Date: Wed, 3 Dec 2025 14:05:19 +0000
Message-ID: <66282501-ac91-4d00-89e4-8d3765786219@epam.com>
References: <20251202193246.3357821-1-oleksandr_tyshchenko@epam.com>
 <98e9f551-cd8f-4c0c-aa79-144466e68df0@epam.com>
 <a1443030-f594-4f25-b12a-37974eae64d2@epam.com>
 <291a2d7c-f9fa-4c36-bfd5-5706ebea3e2e@gmail.com>
In-Reply-To: <291a2d7c-f9fa-4c36-bfd5-5706ebea3e2e@gmail.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR03MB3577:EE_|PA4PR03MB7008:EE_
x-ms-office365-filtering-correlation-id: d1820fa4-0156-4441-c09d-08de3274fe41
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|42112799006|38070700021|7053199007;
x-microsoft-antispam-message-info:
 =?utf-8?B?VGFXVkZiZmdzOElUZVJ1Z2F2M3FZMmI5V05JL3RENHdPaGtvU3Y5Y2hPM2Fa?=
 =?utf-8?B?K3hzY1p2ZnVQZmp6QUVreVo4b3I4QldzeEdxeXI2d0JGdFgwNVZuWGNPdmFn?=
 =?utf-8?B?SVh4L3ZxME45OU5jekRqV3Q3SG9kb0lPQ0VFWWs3aVdWa1NyVUp4K3J1N1M2?=
 =?utf-8?B?NTlBY0pna3k2SUpML01PeWRxYTRjRWMyS2I3SlRLNUNJa3JhQnd4Zk9vSi8z?=
 =?utf-8?B?TlpKYlZyeTQ3VG5lamxGRFd2dllOU2Y0cTNmVk5vMEFzUTRyZml3TWNBUDY1?=
 =?utf-8?B?eXpqTkNBY29pb1I4WFVvRHVpUzQ3U1NlSVBxbXU0Rk5ablUxazM5Nm13Rk5y?=
 =?utf-8?B?YUZ1QTRQdzVZZlBBZW1QZzllM2pWNTdveHJLaE1HWVRmRXIreng3SmNCSkdO?=
 =?utf-8?B?a0dINGNuRFZ6RTArNmE4WTNXRnE4dnJzdjZwOWJxdHlwTXYrL2Z2SFZBUW5w?=
 =?utf-8?B?ZFFFN3Q4TEh5aVJYUllaNmVGdk5uNzVsYUFLM3hVRkFnWExNSzluZ0l5Nk5W?=
 =?utf-8?B?ODFIbTBkc0E2NDdXaERyUFUzK1dqdDQxWVlHR1l4VDhzaUM1ZUxpdy9oQlpq?=
 =?utf-8?B?bmhhSHk0QVk5dHZaRUc2NXF6TG1IOEpIcnhIU0lhR1JtK2JiSm9jYlhnQmtC?=
 =?utf-8?B?YzZDek1HdWNObEd2R2FLOWh2cWRsK1ZnOFJUVFNRRENJNXBMT3ZrcXRrcGMx?=
 =?utf-8?B?QUxyV1J0dUZHR0lNY3VuTS9kaGJKK2dHVmxPU3J2WEJ0MUVWbWlKMW8wR0tG?=
 =?utf-8?B?aTZaTXBodGRWUDJFK2lieVcrUitLVTlocE1WNi80b3l4RmVyMHdNWmRxRTRi?=
 =?utf-8?B?NHR5ZDlzbzI1andpcEJLSWtOdVlFYVZIM1JZUU1sKytUeTZXVWdEcm5saTJD?=
 =?utf-8?B?L0xTaUJWZW1FTFhWUjVWWnpENDhBRjRXQ2FTeXhEK0drMVNWYlRiY2cvblJX?=
 =?utf-8?B?N1MyRDMwdU5xOUNzUUx0QW5xZnlYdVZ6amVncmNGL0l4d0Z5YzRzNEUvMnFV?=
 =?utf-8?B?NjF0L0pGOWlybkhpWGw2RlFUamdybWdMR2FyVnArT05sWmZvUllNeHB2OWJB?=
 =?utf-8?B?b0M5MCtCQ2dCSXEvUmljbXFtYU5sOUhnR2JmMGdYZkdienVlQTd2ZGw3VXp4?=
 =?utf-8?B?cEV6bnRCeTBnalUvTEgxNHF2dkZUV2lMK2YvaVNneWk5Nk1nUHRmTGhFNE50?=
 =?utf-8?B?RXhoM1pMaXRuU1ZDd0ZleFNHdG1aTHRNdlhzM3BUVkRNNVlDd0lBcUZnOS94?=
 =?utf-8?B?NnpuNkJpc2FDbjhyL29tSWVWZHpjOGNGWm8wdHk0S1I0VEZCeS8xbzdNZ2VE?=
 =?utf-8?B?S2RDWkpBUFc4dFY1ZUJ4OFB4V1JZZTJpbytqb2ZMQTh2MExHZjZwK29Pd0ND?=
 =?utf-8?B?UkJvUkcvTnhSVVFNaldvRGpXa3RQYzNjOVFsZHlSYVduRnlLQXI3UHZKS3FU?=
 =?utf-8?B?dFpXalVPbjZsNXo3SGs4Q0FtM293VVkyWENOWjlHTkdJenI4b3RiMVdzWEhy?=
 =?utf-8?B?TElML0NWNUtHSndqWEN0RTFrYVQwb0F6N1QwMWJJeEhEeHBUMlkwM2VEVWRo?=
 =?utf-8?B?b05VNHdlcG9wZWExYmFDRUV1M0NLR2V5ak9tSXBCRFF5cld6eFROeFV5WXNN?=
 =?utf-8?B?M2VMb0hoYTg3eXFTaFp1cU92S2daUWhtd3JlL0ROdnJ1TzVZRXlEU0lGdmZz?=
 =?utf-8?B?ZFVoQXlSdVpkRkh5NHJ5cTNWdzJNbUlMWndSNU0yczNmdHlpTU0wUUJmV3Bs?=
 =?utf-8?B?VHhjc3lIdUpzVk5WVDBzbDFLV0d5ZDBhSmJ6WHRqQjY5V1k0SXZEV051M0xK?=
 =?utf-8?B?V3pVKzFsdTl6b05CK0YxdlYwSldGN2ZtY1o2c1VLV0c1WC9qWW5jbm1EbE84?=
 =?utf-8?B?bjl4Mms0OVY3bDVla2J4NXVWdDdNMHBuQW9JWkR6M2dmTzI0ak96Yk1BOUJq?=
 =?utf-8?B?U2g4OUZtZ2l6YmgyOUpEbmd0WTBVRm9WM2tPRkt5RnVkVEsxTi8rRHlYbGZz?=
 =?utf-8?B?NGZOQmNzVXhqRS9UVjR0TmIrM3dwUGNycENPRFhUN3JvNHRsVDdkTmFIamRL?=
 =?utf-8?Q?CcSbOq?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB3577.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(42112799006)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WkpHOTVNMFhMQVhrSW5oWXF3MEQ4dFl1VCtLWUpnd3NPcHBrMGFNUUUwYVVD?=
 =?utf-8?B?Z1VqRlpHb1E1U1JqaDdKZWlLaytHNStyTUpnSGduL0k2clA2QnJSMGk3QzJF?=
 =?utf-8?B?NVJMdExpbFBXaEdEOEtZL1hKMDhMUTd6eTRTaytJYkhOczRsUjBPZk1wWDVs?=
 =?utf-8?B?d3REeEI1elI0N052KzdYaXJYUDlJTThaZW5lWkRLVGhTRFRqVVhYRnhTM2xR?=
 =?utf-8?B?ME1ndFRCYytjZDJEQnQvajZGbmNHdThDQ1BtY1NuTnp0VTV0NDhOVndyVWlp?=
 =?utf-8?B?UFZGL0szTWhXaS9uSlBsaDlPSU5WRzVkUmlkVHlKaDljZ3VJbVRDQk0yOVZM?=
 =?utf-8?B?WC84dEJTYkxpQ0J2dGlKeVRNQUlYdm1mcjB5Y0VCLy9udUFnSytPNVNTYUF5?=
 =?utf-8?B?QzJtdEtROXFCOXVoWkl2THJDdXNrQmczaXNpVldIaWhVNEp1NGZlbHZJRFJP?=
 =?utf-8?B?MXd3N0lxUFkveW1HYnhFU2g0VE9CSkx5ODJlMHphVnZ6ekJBN2dNTm1vbTNl?=
 =?utf-8?B?RjluMG0yeVFHODVZQThSUlRaSHF5b0dqbXliR0VaNTRqaTc2dzZ1MnZMaThH?=
 =?utf-8?B?K2ZGT2VZSm5lMktOTEQxaCs4TE5jVkhSRFlvVmZIU1lDeVpJRzFUdHJxZ1h1?=
 =?utf-8?B?ZzBDbi9XQVNjb2MvbFdTMVN6S3JVVDFmRDBzckVJL1BQWU9KTFowSTdZV0ht?=
 =?utf-8?B?SGpOVkZoeXA3aEdDRGVLUjV6bEpTeEpkbTNGaC9OTTF2dW5yaHdVbVI4cXAz?=
 =?utf-8?B?YnpLQklBcGJMMW9RYmZEQ2Nwa3dVWFN3Y0VXSHI0c1pkdlUreVVZS2dwK0Fx?=
 =?utf-8?B?d1NPTTYySHlxUHppMjNVYlNud2pqQU95Q1VIMXFUaWlnV3Vnd05tQmpkMmlz?=
 =?utf-8?B?ZzBMTXJlZ1RNcUw5SThhSG9TR2JaRm54VkszcHBJcE9BTWxkV24zbUQ4TmVy?=
 =?utf-8?B?MTFSYlV3UWpZaG5yWHhmcUd3WExXTGhhUmVHT08vb3VPVFVKOXNIYjE3ZERP?=
 =?utf-8?B?Z0N0OVZ3ZVZ3Tnp0dFp1UGlub1k0TFQyUzY5Y1ZXMlR1WXJKR0VNNnlyZU5U?=
 =?utf-8?B?NVBTa2RRaFV4dWdQWmNKK0VEZHNnL3F2MHMxeUtyWEszcVgySEFCSDJEeTBm?=
 =?utf-8?B?RzUvOXdnNlc1dUJRUGhxR2g2WkpjYlRhOUduVTVIK1ZQYm1XZjVWMkMvSnJl?=
 =?utf-8?B?REZVTWV4MFR4K1A0K3VGQnlmb3Y5WjY1L0hIOGRFZmRDVjhnREZBS0J3Sm5R?=
 =?utf-8?B?ZThsekRqMmZMU0F5MGVZUXN1bk9LWDNCNnZVUTJDU2NxaXRVSlRIa0VpZCta?=
 =?utf-8?B?VVNUZHI3aHV1L2VDK3VuTG5VL2dkQzhJelNwRFgyMVRHRUhEeXYxRjVxZWUr?=
 =?utf-8?B?TXQ0S2lLY0ZCZXlkMFhTZE54Ry85VlJmanAzYWs3TVJLZ0Rpa29WZlErYmtN?=
 =?utf-8?B?R0xiSHQxNkdxNHVVNzRxajB4bllXbVBjVU15UzdkNHRsK0N5Y3pubEkrSnN1?=
 =?utf-8?B?K2pKU1VLbnIyOEprU3RLUXBES2l5SEx3T0FqQzdDVVlKNTVRU0lSY3dVUVg4?=
 =?utf-8?B?WXh4SllWems1VVFUT3RFc3hHRUxkTldDNDd5cHB1Z2FvOGphSXpDdEsrNys1?=
 =?utf-8?B?M090T3VXK2dZeWNvcGF6TmllVStkSmxnRGhvODdTWjl4UXpxMmpBcC9DWldl?=
 =?utf-8?B?NC9yZlo4Yk51aEhmNWhKOFZOZFlUTTN3SVpKTXEvODVtVFN4S2lrZjRWUmJr?=
 =?utf-8?B?blFSYnMrd0JEQmFRNHBXWlpRMmJGaTJkYkFEWE9KZzBtc3E1VmltWVpua2ta?=
 =?utf-8?B?c1hhOUdGbGhsM29VckRqM2NVbWJqR3B6QzB2WExtTTJVMXM1QzRoV3F2MnBI?=
 =?utf-8?B?akU3Z1pVcFhya3Y4R0hlNnVTOXJ3dGFPQ3BSUFlhZEthbys1QnVjMUc3ZnNq?=
 =?utf-8?B?Y1NDTk9EVXZoSkZQTS9SbUtjM1FmOThrQ3pQVlFGYldDcy9BS3FsQ1NDT1Jr?=
 =?utf-8?B?WEdKUEVtYjBlTjI4a2wwZzA2M0lEUUVFU3pLUGRqTCt3UjA2OU9RL2MvZ0pn?=
 =?utf-8?B?QWVGamJ3aGltUlpDM2paa0REK0JQMnIxQ09qdjZ2dThEZEY4SEJGUmh5c3I4?=
 =?utf-8?B?c3FheDhCWmk5ZUFmQnE0KzF4TE16VnI1ZkVVTnZ0Q3ZMYmxaQ210UEpqRlVY?=
 =?utf-8?Q?AHJkGlH7nFH3G2hmI0BlFVc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <918EA749AFCF164FA7E30E4C0FCB1384@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB3577.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1820fa4-0156-4441-c09d-08de3274fe41
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2025 14:05:19.6138
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t6TWwIK7U2LrzAqi/VLyjAMlA5IXGd1hXfRK/gIUa99ZpeZjrVYsxOlRJ1XNWIYZv36fgKh26tabA9s0EB596ur/gD2Nt1tn19AeKResG8A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7008

DQoNCk9uIDAzLjEyLjI1IDE1OjM2LCBPbGVrc2lpIEt1cm9jaGtvIHdyb3RlOg0KDQoNCj4gW1lv
dSBkb24ndCBvZnRlbiBnZXQgZW1haWwgZnJvbSBvbGVrc2lpLmt1cm9jaGtvQGdtYWlsLmNvbS4g
TGVhcm4gd2h5IA0KPiB0aGlzIGlzIGltcG9ydGFudCBhdCBodHRwczovL2FrYS5tcy9MZWFybkFi
b3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQ0KPiANCj4gSGVsbG8gT2xla3NhbmRyLA0KDQpIZWxs
byBPbGVrc2lpDQoNCj4gDQo+IE9uIDEyLzMvMjUgMTI6MDMgUE0sIE9sZWtzYW5kciBUeXNoY2hl
bmtvIHdyb3RlOg0KPj4gT24gMDIuMTIuMjUgMjM6MzMsIEdyeWdvcmlpIFN0cmFzaGtvIHdyb3Rl
Og0KPj4+DQo+Pj4gT24gMDIuMTIuMjUgMjE6MzIsIE9sZWtzYW5kciBUeXNoY2hlbmtvIHdyb3Rl
Og0KPj4+PiBDcmVhdGluZyBhIGd1ZXN0IHdpdGggYSBoaWdoIHZDUFUgY291bnQgKGUuZy4sID4z
MikgZmFpbHMgYmVjYXVzZQ0KPj4+PiB0aGUgZ3Vlc3QncyBkZXZpY2UgdHJlZSBidWZmZXIgKERP
TVVfRFRCX1NJWkUpIG92ZXJmbG93cyBkdXJpbmcgDQo+Pj4+IGNyZWF0aW9uLg0KPj4+PiBUaGUg
RkRUIG5vZGVzIGZvciBlYWNoIHZDUFUgcXVpY2tseSBleGhhdXN0IHRoZSA0S2lCIGJ1ZmZlciwN
Cj4+Pj4gY2F1c2luZyBhIGd1ZXN0IGNyZWF0aW9uIGZhaWx1cmUuDQo+Pj4+DQo+Pj4+IEluY3Jl
YXNlIHRoZSBidWZmZXIgc2l6ZSB0byAxNktpQiB0byBzdXBwb3J0IGd1ZXN0cyB1cCB0bw0KPj4+
PiB0aGUgTUFYX1ZJUlRfQ1BVUyBsaW1pdCAoMTI4KS4NCj4+Pj4NCj4+Pj4gU2lnbmVkLW9mZi1i
eTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPg0K
Pj4+PiAtLS0NCj4+Pj4gTm90aWNlZCB3aGVuIHRlc3RpbmcgdGhlIGJvdW5kYXJ5IGNvbmRpdGlv
bnMgZm9yIGRvbTBsZXNzIGd1ZXN0DQo+Pj4+IGNyZWF0aW9uIG9uIEFybTY0Lg0KPj4+Pg0KPj4+
PiBEb21haW4gY29uZmlndXJhdGlvbjoNCj4+Pj4gZmR0IG1rbm9kIC9jaG9zZW4gZG9tVTANCj4+
Pj4gZmR0IHNldCAvY2hvc2VuL2RvbVUwIGNvbXBhdGlibGUgInhlbixkb21haW4iDQo+Pj4+IGZk
dCBzZXQgL2Nob3Nlbi9kb21VMCBcI2FkZHJlc3MtY2VsbHMgPDB4Mj4NCj4+Pj4gZmR0IHNldCAv
Y2hvc2VuL2RvbVUwIFwjc2l6ZS1jZWxscyA8MHgyPg0KPj4+PiBmZHQgc2V0IC9jaG9zZW4vZG9t
VTAgbWVtb3J5IDwweDAgMHgxMDAwMCA+DQo+Pj4+IGZkdCBzZXQgL2Nob3Nlbi9kb21VMCBjcHVz
IDwzMz4NCj4+Pj4gZmR0IHNldCAvY2hvc2VuL2RvbVUwIHZwbDAxMQ0KPj4+PiBmZHQgbWtub2Qg
L2Nob3Nlbi9kb21VMCBtb2R1bGVANDA0MDAwMDANCj4+Pj4gZmR0IHNldCAvY2hvc2VuL2RvbVUw
L21vZHVsZUA0MDQwMDAwMCBjb21wYXRpYmxlwqAgIm11bHRpYm9vdCxrZXJuZWwiDQo+Pj4+ICJt
dWx0aWJvb3QsbW9kdWxlIg0KPj4+PiBmZHQgc2V0IC9jaG9zZW4vZG9tVTAvbW9kdWxlQDQwNDAw
MDAwIHJlZyA8MHgwIDB4NDA0MDAwMDAgMHgwIDB4MTYwMDAgPg0KPj4+PiBmZHQgc2V0IC9jaG9z
ZW4vZG9tVTAvbW9kdWxlQDQwNDAwMDAwIGJvb3RhcmdzICJjb25zb2xlPXR0eUFNQTAiDQo+Pj4+
DQo+Pj4+IEZhaWx1cmUgbG9nOg0KPj4+PiAoWEVOKSBYZW4gZG9tMGxlc3MgbW9kZSBkZXRlY3Rl
ZA0KPj4+PiAoWEVOKSAqKiogTE9BRElORyBET01VIGNwdXM9MzMgbWVtb3J5PTB4MTAwMDBLQiAq
KioNCj4+Pj4gKFhFTikgTG9hZGluZyBkMSBrZXJuZWwgZnJvbSBib290IG1vZHVsZSBAIDAwMDAw
MDAwNDA0MDAwMDANCj4+Pj4gKFhFTikgQWxsb2NhdGluZyBtYXBwaW5ncyB0b3RhbGxpbmcgNjRN
QiBmb3IgZDE6DQo+Pj4+IChYRU4pIGQxIEJBTktbMF0gMHgwMDAwMDA0MDAwMDAwMC0weDAwMDAw
MDQ0MDAwMDAwICg2NE1CKQ0KPj4+PiAoWEVOKSBEZXZpY2UgdHJlZSBnZW5lcmF0aW9uIGZhaWxl
ZCAoLTIyKS4NCj4+Pj4gKFhFTikNCj4+Pj4gKFhFTikgKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKg0KPj4+PiAoWEVOKSBQYW5pYyBvbiBDUFUgMDoNCj4+Pj4gKFhFTikg
Q291bGQgbm90IHNldCB1cCBkb21haW4gZG9tVTAgKHJjID0gLTIyKQ0KPj4+PiAoWEVOKSAqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqDQo+Pj4+IC0tLQ0KPj4+PiAtLS0N
Cj4+Pj4gwqDCoCB4ZW4vY29tbW9uL2RldmljZS10cmVlL2RvbTBsZXNzLWJ1aWxkLmMgfCA4ICsr
KysrLS0tDQo+Pj4+IMKgwqAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkNCj4+Pj4NCj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vZGV2aWNlLXRyZWUv
ZG9tMGxlc3MtYnVpbGQuYyBiL3hlbi9jb21tb24vDQo+Pj4+IGRldmljZS10cmVlL2RvbTBsZXNz
LWJ1aWxkLmMNCj4+Pj4gaW5kZXggM2Y1Yjk4N2VkOC4uZDdkMGE0N2I5NyAxMDA2NDQNCj4+Pj4g
LS0tIGEveGVuL2NvbW1vbi9kZXZpY2UtdHJlZS9kb20wbGVzcy1idWlsZC5jDQo+Pj4+ICsrKyBi
L3hlbi9jb21tb24vZGV2aWNlLXRyZWUvZG9tMGxlc3MtYnVpbGQuYw0KPj4+PiBAQCAtNDYxLDEw
ICs0NjEsMTIgQEAgc3RhdGljIGludCBfX2luaXQNCj4+Pj4gZG9tYWluX2hhbmRsZV9kdGJfYm9v
dF9tb2R1bGUoc3RydWN0IGRvbWFpbiAqZCwNCj4+Pj4gwqDCoCAvKg0KPj4+PiDCoMKgwqAgKiBU
aGUgbWF4IHNpemUgZm9yIERUIGlzIDJNQi4gSG93ZXZlciwgdGhlIGdlbmVyYXRlZCBEVCBpcyBz
bWFsbA0KPj4+PiAobm90IGluY2x1ZGluZw0KPj4+PiAtICogZG9tVSBwYXNzdGhyb3VnaCBEVCBu
b2RlcyB3aG9zZSBzaXplIHdlIGFjY291bnQgc2VwYXJhdGVseSksIDRLQg0KPj4+PiBhcmUgZW5v
dWdoDQo+Pj4+IC0gKiBmb3Igbm93LCBidXQgd2UgbWlnaHQgaGF2ZSB0byBpbmNyZWFzZSBpdCBp
biB0aGUgZnV0dXJlLg0KPj4+PiArICogZG9tVSBwYXNzdGhyb3VnaCBEVCBub2RlcyB3aG9zZSBz
aXplIHdlIGFjY291bnQgc2VwYXJhdGVseSkuIFRoZQ0KPj4+PiBzaXplIGlzDQo+Pj4+ICsgKiBw
cmltYXJpbHkgZHJpdmVuIGJ5IHRoZSBudW1iZXIgb2YgdkNQVSBub2Rlcy4gVGhlIHByZXZpb3Vz
IDRLaUINCj4+Pj4gYnVmZmVyIHdhcw0KPj4+PiArICogaW5zdWZmaWNpZW50IGZvciBndWVzdHMg
d2l0aCBoaWdoIHZDUFUgY291bnRzLCBzbyBpdCBoYXMgYmVlbg0KPj4+PiBpbmNyZWFzZWQNCj4+
Pj4gKyAqIHRvIHN1cHBvcnQgdXAgdG8gdGhlIE1BWF9WSVJUX0NQVVMgbGltaXQgKDEyOCkuDQo+
Pj4+IMKgwqDCoCAqLw0KPj4+PiAtI2RlZmluZSBET01VX0RUQl9TSVpFIDQwOTYNCj4+Pj4gKyNk
ZWZpbmUgRE9NVV9EVEJfU0laRSAoNDA5NiAqIDQpDQo+Pj4gTWF5IGJlIEl0IHdhbnRzIEtjb25m
aWc/DQo+Pj4gT3Igc29tZSBmb3JtdWxhIHdoaWNoIGFjY291bnRzIE1BWF9WSVJUX0NQVVM/DQo+
Pg0KPj4gSSBhZ3JlZSB0aGF0IHVzaW5nIGEgZm9ybXVsYSB0aGF0IGFjY291bnRzIGZvciBNQVhf
VklSVF9DUFVTIGlzIHRoZSBtb3N0DQo+PiByb2J1c3QgYXBwcm9hY2guDQo+IA0KPiBPbmUgb3B0
aW9uIGNvdWxkIGJlIHRvIGRldGVjdCB0aGUgc2l6ZSBhdCBydW50aW1lLCBlc3NlbnRpYWxseSwg
dHJ5IHRvIA0KPiBhbGxvY2F0ZQ0KPiBpdCwgYW5kIGlmIGFuIGVycm9yIG9jY3VycywgaW5jcmVh
c2UgdGhlIGZkdHNpemUgYW5kIHRyeSBhZ2Fpbi4gSSBkb27igJl0IA0KPiByZWFsbHkNCj4gbGlr
ZSB0aGlzIGFwcHJvYWNoLCBidXQgSSB3YW50ZWQgdG8gbWVudGlvbiBpdCBpbiBjYXNlIHNvbWVv
bmUgZmluZHMgaXQgDQo+IHVzZWZ1bC4NCj4gVGhlIGJlbmVmaXQgb2YgdGhpcyBhcHByb2FjaCBp
cyB0aGF0IGlmLCBpbiB0aGUgZnV0dXJlLCBzb21ldGhpbmcgZWxzZSBzdWNoDQo+IGFzIGEgQ1BV
IG5vZGUgY29udHJpYnV0ZXMgdG8gdGhlIGZpbmFsIEZEVCBzaXplLCB3ZSB3b27igJl0IG5lZWQg
dG8gdXBkYXRlIA0KPiB0aGUNCj4gZm9ybXVsYSBhZ2Fpbi4NCg0KSSBnb3QgeW91ciBwb2ludCBh
bmQgdW5kZXJzdGFuZCB0aGUgZ29hbCwgYnV0IEkgc2VlIHRoZSBmb2xsb3dpbmcgDQpjb25jZXJu
cyB3aXRoIHRoYXQ6DQoNCjEuIFhlbiBoYXMgdG8gZG8gYWxsIHRoZSB3b3JrIHRvIGJ1aWxkIHRo
ZSBkZXZpY2UgdHJlZSwgZmFpbCwgdGhyb3cgYWxsIA0KdGhhdCB3b3JrIGF3YXksIGFuZCB0aGVu
IHN0YXJ0IG92ZXIgYWdhaW4uIFRoaXMgd2FzdGVzIHRpbWUgZHVyaW5nIHRoZSANCnN5c3RlbSdz
IGJvb3QtdXAgcHJvY2Vzcy4NCg0KMi4gQm9vdC10aW1lIGNvZGUgc2hvdWxkIGJlIGFzIGRldGVy
bWluaXN0aWMgYW5kIHByZWRpY3RhYmxlIGFzIA0KcG9zc2libGUuIEEgc3RhdGljLCB3b3JzdC1j
YXNlIGNhbGN1bGF0aW9uIGlzIGhpZ2hseSBwcmVkaWN0YWJsZSwgDQp3aGVyZWFzIGEgcmV0cnkg
bG9vcCBpcyBub3QuDQoNCjMuIEl0IGFkZHMgbG9naWNhbCBjb21wbGV4aXR5IChlcnJvciBoYW5k
bGluZywgbG9vcGluZywgc2l6ZSBpbmNyZW1lbnRzKSANCnRvIHdoYXQgc2hvdWxkIGJlIGEgc3Ry
YWlnaHRmb3J3YXJkIHNldHVwIHN0ZXAuDQoNCj4gDQo+Pg0KPj4gSGVyZSBpcyB0aGUgZW1waXJp
Y2FsIGRhdGEgKGJ5IHRlc3Rpbmcgd2l0aCB0aGUgbWF4aW11bSBudW1iZXIgb2YgZGV2aWNlDQo+
PiB0cmVlIG5vZGVzIChlLmcuLCBoeXBlcnZpc29yIGFuZCByZXNlcnZlZC1tZW1vcnkgbm9kZXMp
IGFuZCBlbmFibGluZyBhbGwNCj4+IG9wdGlvbmFsIENQVSBwcm9wZXJ0aWVzIChlLmcuLCBjbG9j
ay1mcmVxdWVuY3kpKToNCj4+DQo+PiBjcHVzPTENCj4+IChYRU4pIEZpbmFsIGNvbXBhY3RlZCBG
RFQgc2l6ZSBpczogMTU4NiBieXRlcw0KPj4NCj4+IGNwdXM9Mg0KPj4gKFhFTikgRmluYWwgY29t
cGFjdGVkIEZEVCBzaXplIGlzOiAxNjk4IGJ5dGVzDQo+Pg0KPj4gY3B1cz0zMg0KPj4gKFhFTikg
RmluYWwgY29tcGFjdGVkIEZEVCBzaXplIGlzOiA1MDU4IGJ5dGVzDQo+Pg0KPj4gY3B1cz0xMjgN
Cj4+IChYRU4pIEZpbmFsIGNvbXBhY3RlZCBGRFQgc2l6ZSBpczogMTU4MTAgYnl0ZXMNCj4+DQo+
Pg0KPj4gc3RhdGljIGludCBfX2luaXQgcHJlcGFyZV9kdGJfZG9tVShzdHJ1Y3QgZG9tYWluICpk
LCBzdHJ1Y3Qga2VybmVsX2luZm8NCj4+ICpraW5mbykNCj4+IMKgwqAgew0KPj4gwqDCoMKgwqDC
oMKgIGludCBhZGRyY2VsbHMsIHNpemVjZWxsczsNCj4+IEBAIC01NjksNiArNTY5LDggQEAgc3Rh
dGljIGludCBfX2luaXQgcHJlcGFyZV9kdGJfZG9tVShzdHJ1Y3QgZG9tYWluICpkLA0KPj4gc3Ry
dWN0IGtlcm5lbF9pbmZvICpraW5mbykNCj4+IMKgwqDCoMKgwqDCoCBpZiAoIHJldCA8IDAgKQ0K
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBlcnI7DQo+Pg0KPj4gK8KgwqDCoCBwcmludGso
IkZpbmFsIGNvbXBhY3RlZCBGRFQgc2l6ZSBpczogJWQgYnl0ZXNcbiIsDQo+PiBmZHRfdG90YWxz
aXplKGtpbmZvLT5mZHQpKTsNCj4+ICsNCj4+IMKgwqDCoMKgwqDCoCByZXR1cm4gMDsNCj4+DQo+
PiDCoMKgwqDCoCBlcnI6DQo+Pg0KPj4gVGhpcyBkYXRhIHNob3dzIChhc3N1bWluZyBteSB0ZXN0
aW5nL2NhbGN1bGF0aW9ucyBhcmUgY29ycmVjdCk6DQo+Pg0KPj4gLSBBIG1hcmdpbmFsIGNvc3Qg
b2YgMTEyIGJ5dGVzIHBlciB2Q1BVIGluIHRoZSBmaW5hbCwgY29tcGFjdGVkIGRldmljZSANCj4+
IHRyZWUuDQo+PiAtIEEgZml4ZWQgYmFzZSBzaXplIG9mIDE0NzQgYnl0ZXMgZm9yIGFsbCBub24t
dkNQVSBjb250ZW50Lg0KPj4NCj4+IEJhc2VkIG9uIHRoYXQgSSB3b3VsZCBwcm9wb3NlIHRoZSBm
b2xsb3dpbmcgZm9ybXVsYSB3aXRoIHRoZSANCj4+IGp1c3RpZmljYXRpb246DQo+Pg0KPj4gLyoN
Cj4+IMKgwqAgKiBUaGUgc2l6ZSBpcyBjYWxjdWxhdGVkIGZyb20gYSBmaXhlZCBiYXNlbGluZSBw
bHVzIGEgc2NhbGFibGUNCj4+IMKgwqAgKiBwb3J0aW9uIGZvciBlYWNoIHBvdGVudGlhbCB2Q1BV
IG5vZGUgdXAgdG8gdGhlIHN5c3RlbSBsaW1pdA0KPj4gwqDCoCAqIChNQVhfVklSVF9DUFVTKSwg
YXMgdGhlIHZDUFUgbm9kZXMgYXJlIHRoZSBwcmltYXJ5IGNvbnN1bWVyDQo+PiDCoMKgICogb2Yg
c3BhY2UuDQo+PiDCoMKgICoNCj4+IMKgwqAgKiBUaGUgYmFzZWxpbmUgb2YgMktpQiBpcyBhIHNh
ZmUgYnVmZmVyIGZvciBhbGwgbm9uLXZDUFUgRkRUDQo+PiDCoMKgICogY29udGVudC4gVGhlIDEy
OCBieXRlcyBwZXIgdkNQVSBpcyBkZXJpdmVkIGZyb20gYSB3b3JzdC1jYXNlDQo+PiDCoMKgICog
YW5hbHlzaXMgb2YgdGhlIEZEVCBjb25zdHJ1Y3Rpb24tdGltZSBzaXplIGZvciBhIHNpbmdsZQ0K
Pj4gwqDCoCAqIHZDUFUgbm9kZS4NCj4+IMKgwqAgKi8NCj4+ICNkZWZpbmUgRE9NVV9EVEJfU0la
RSAoMjA0OCArIChNQVhfVklSVF9DUFVTICogMTI4KSkNCj4+DQo+PiAqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqDQo+Pg0KPj4gUGxlYXNlIHRlbGwgbWUgd291
bGQgeW91IGJlIGhhcHB5IHdpdGggdGhhdD8NCj4gDQo+IEkgd291bGQgYWxzbyBsaWtlIHRvIG5v
dGUgdGhhdCB3ZSBwcm9iYWJseSB3YW50IHRvIGFkZCBhIEJVSUxEX0JVR19PTigpIA0KPiBjaGVj
aw0KPiB0byBlbnN1cmUgdGhhdCBET01VX0RUQl9TSVpFIGlzIG5vdCBsYXJnZXIgdGhhbiBTWl8y
TS4gT3RoZXJ3aXNlLCB3ZSANCj4gd291bGQgZ2V0DQo+IGEgcnVudGltZSBlcnJvciBpbnN0ZWFk
IG9mIGEgYnVpbGQtdGltZSBmYWlsdXJlLCBzaW5jZSB0aGVyZSBpcyBjb2RlIA0KPiB0aGF0IGxp
bWl0cw0KPiBmZHRzaXplIHRvIFNaXzJNOg0KPiANCj4gIMKgwqDCoCAvKiBDYXAgdG8gbWF4IERU
IHNpemUgaWYgbmVlZGVkICovDQo+ICDCoMKgwqAgZmR0X3NpemUgPSBtaW4oZmR0X3NpemUsIFNa
XzJNKTsNCg0KDQpvaywgc291bmRzIHJlYXNvbmFibGUsIHdpbGwgYWRkOg0KDQpCVUlMRF9CVUdf
T04oRE9NVV9EVEJfU0laRSA+IFNaXzJNKTsNCg0KPiANCj4gVGhhbmtzLg0KPiANCj4gfiBPbGVr
c2lpDQo+IA0K

