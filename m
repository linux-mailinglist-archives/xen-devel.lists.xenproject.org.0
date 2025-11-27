Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4536EC8F3C2
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 16:21:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174050.1499024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOdnc-0006lh-9Q; Thu, 27 Nov 2025 15:20:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174050.1499024; Thu, 27 Nov 2025 15:20:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOdnc-0006kF-6f; Thu, 27 Nov 2025 15:20:48 +0000
Received: by outflank-mailman (input) for mailman id 1174050;
 Thu, 27 Nov 2025 15:20:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jSjm=6D=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vOdnb-0006jt-Nq
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 15:20:47 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0ffb4ac-cba4-11f0-980a-7dc792cee155;
 Thu, 27 Nov 2025 16:20:39 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH4PR03MB7723.namprd03.prod.outlook.com (2603:10b6:610:23c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Thu, 27 Nov
 2025 15:20:35 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 15:20:35 +0000
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
X-Inumbo-ID: a0ffb4ac-cba4-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F2Ir1G/4j2bdasQcsVjtlkM13g+WtIej6267FPF2rQxfrsE2s7SVoeb9IOyBZOmw4k5LUdO1FcYJ3nq3RnT0nOMwzLD6V5qp7AXmjbcXRt1IrVSaJ2z0RoEcYm6zFq7My2q+jxw/ItMMfzX/UPSjHU38Ht9WoQ9XxEjawHjVhdMEhmW6V9Winijsuv5S8m74Dtm1effJeywVFf8pWVO9dRG0TUn7sPKFx2VFR7B9Kt0k5vUAZ1X2NCDdjzgx8/cMkMKcNzddgwSfA8TMSMVa7vTIBhiLLloS82F10yzYHy/SZ0spU3knHkZaXXOy1t/Ps8FoTKEU4NqI2oHwP5Yw0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ktYr8Eeeo4+2LU7GQU9mI9cwA34liA6BGKyXsUgbKao=;
 b=PAbIZ9tkNqZMDIVxadP8OT5DGr+O+i/3/fXvqFAq8x7edEu4HPnsZWGo0nAG7r0UfVmQMyjHvvPj5ljdlUIoKj1rLAUeIilZfbfv/VevyNUfngYKwjVFSzTdlplenb/zSsjx21MpEy1j1GZteEQf3NrGTxU3BFqr2WNl+42x6T9TcxgjJ4/v1Uu7ARXXULe/36kxutErt6SWgvTqeCjtvEU+4ywQRVrlFbiwcapJZM6OebiYLD8v2pefXvEGRO8f1Woum4H6vlyl9Gj5uaVN5SYH+XjkUkPus/bhj/VfgXQjH4eOsyZlavDQ7VptWPmE1Qv5R9pAenCpryzuV+AD3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktYr8Eeeo4+2LU7GQU9mI9cwA34liA6BGKyXsUgbKao=;
 b=u2jSpWv4ZUJC5nxxY2OedSAWOcM7EMJV2MnYba2/rL911a7Ry2MNC+eQZyJxCd1uUx0dJyBRKbBRlE1uM9hrLFAH3bXG66xmsdvMo8R2X0rd9nzh+8xGj+wj96S0GlcmCA1CBq9fQZTAe1OrrzGxTDITxSLln5ZKgB56WOGu+4A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <3653404b-0428-4dae-912f-18c4f8e74853@citrix.com>
Date: Thu, 27 Nov 2025 15:20:31 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86/efi: Remove NX check from efi-boot.h
To: Julian Vetter <julian.vetter@vates.tech>, xen-devel@lists.xenproject.org
References: <20251127143136.1598354-1-julian.vetter@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20251127143136.1598354-1-julian.vetter@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0588.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH4PR03MB7723:EE_
X-MS-Office365-Filtering-Correlation-Id: 0141d671-876d-446a-3f27-08de2dc88338
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U3JPWCtVMkFUMEdrdEdjSGZVVzVkNjRMV1B2cm52aTNENW1IT0t2YVVyYXZG?=
 =?utf-8?B?YWt1V29MZE9RZUZTSUlSRWRFU1Jodjc4Qm1TT08rWmVxOVpMSXVKYTFkVkxK?=
 =?utf-8?B?anRwM3BkWXNkV2x3bjBlbERzV28yKzVMUlUrcnFxQXNmVTNZU1d5N2MyZThR?=
 =?utf-8?B?ODg0YU1MVXdLemNTdG1zOXYrb3hnQllkSDA3YTRpSXB3aHFmZ1ZwQmYrcStY?=
 =?utf-8?B?SUxuckxIZ0hQU3NzM1VRMkdXRlJ6NDNZWS84QTJuYVJJRGZqbjZaWmxydk1Y?=
 =?utf-8?B?VHZsM1J2WFY1NG44ZFg3NUExci9aemxZUGNOWkJXaTNydUNKUThDbXptVEtY?=
 =?utf-8?B?dm80Uy9CZFpyNkQzSjRKaURqWHd4YUNKendSdXpVRGZ5SWpPUjJ1ejRIQ0xT?=
 =?utf-8?B?MjZoQ1dQL2pTVjEvNWUrSFU4SVlNMDAyTVBwSnF4bVVqczdYQmx6SWU0dEhD?=
 =?utf-8?B?bHREQTVKbGdlaTEyL1lmM0gwS0NuQ2FDWi9MZEhUL2ROdW9MOUZ1Zlhza0Yr?=
 =?utf-8?B?dnIvbDFvdkgwNzZHa1hadzNSZ25zWm4xQ21ZZ2o1YjBzbEIyNzlnQ2VCRGRQ?=
 =?utf-8?B?eDRaWUt6UTRzKzhDeFJCOEhiS3dZeFdBOHZleDdLUkEweHVOUHpSS0ZiS3JS?=
 =?utf-8?B?aE1tQnNPMFFGaFhjL2xOSmdKRXFNUkJYQkY4YkxRYTZyb0ovazJUaXJJcmpI?=
 =?utf-8?B?SnRMOXNHbitMSStmU1lKcy9BMkdsdE0zb2I1Uy9NUFZiU2wxUENseDUzdGlr?=
 =?utf-8?B?MDd2VHNJajFubklCSmlUdTQyN080YUpuY1VkbzlrbVJJS05wN25iOUQwWGZq?=
 =?utf-8?B?TUNzRXpRYmJ2cG5CNDRTR2k3eEFZTUo2TzNwaFJkcGUybU0ySTg1M040dXds?=
 =?utf-8?B?MmJhSStDNmJoeDE5ZDhSbWs4Zlk4MmpwV3NwVHlUT1FsdjVma2hORFBsQWxU?=
 =?utf-8?B?Qk9zYStOUEEzUUlnQlYvSktsSnpQbWtmTncxdDl6V1RvWFNZYm13MitSbGpi?=
 =?utf-8?B?U1ZjMTBac083enEwRlhZNkRlL0g0bFV4RjhsdkNiNFljQmZmU0s5MC9lMUNo?=
 =?utf-8?B?RkRuTld6VXFkaklaQ1RlcUdVZTU4U1lrSkZ4TmdpSzN6cG96UHFzaGJKd1g3?=
 =?utf-8?B?WFN6UjdvcnQ5aHN0VUZXR1J5Q2lML2JMZWc0anFBcHhjc0gvemcwb3NxVVBH?=
 =?utf-8?B?c1RSenMwd3NKdTFkMjA0aTh3YjgwaTE0SERmdEF1dTlaeHh2eVk2TTFXOVFY?=
 =?utf-8?B?dmdTYk13dHNzTUtJTUtlbXlFd2NQWWlBemRKNmtxbkxEUTlGQ0dxS0JDN0Jk?=
 =?utf-8?B?T0EwNTVPQ0dhZ09SRTdBUUp2aEZPRVVFUllIZkNZTTR2ZHBIcTc0QXg3UDZR?=
 =?utf-8?B?Ym5xaDZwT0JEUVU1cGRxNHRZMFBENVlaTjJNS3hLOTBnVDZweEhDaTNCRlZn?=
 =?utf-8?B?MUt4NE5zckpua2VoRnVoNzFoSkZBNGRlRkhoVXJKdkQ1ZDM4eTdVb3RmK25t?=
 =?utf-8?B?KzFmMTQ1SllFR3dsVnYydm5VMTIyUlUxMnpJV2krYys1L2hpdU5NNm1hWlUv?=
 =?utf-8?B?bytMWTNPUkhhakNtQ1pvWTRSbitNUUlxWHlKYjJlY3BHdHVwTWNUVE15ME53?=
 =?utf-8?B?ZENhUHN3NGs3azNSU2VoK3d3Q29KcG9JUXNVdW1HMnZNclN1dXhKY2tvOFkz?=
 =?utf-8?B?OFVFSnRQUmh5YjUzVjkrQnlQaHlnQnhqUUg3WEFFQ0FMUkpWayt1MlNBT0I5?=
 =?utf-8?B?MG9Lb3FCanBPUU1VamxWOXNGSEZoa0NmVE1Kem9ZRVpOWjBxNTlaTStScFNx?=
 =?utf-8?B?UHgxNUN1TXFtMlZacEExUEZyb2hzNEVEWVg5cmplSHMwbFY5V3E3THZjTktH?=
 =?utf-8?B?MVJuYURKMkxhVVAyMTAwMmJKMzZOTG9hQmxlMFU3cEJnZDlyWlRUa3o0eGRl?=
 =?utf-8?Q?Jqixfu4JM61Tq6keFch8QPaMxxcLTUPi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVR1czNJRmhjOVo4bzhsM091Vzkyc3UzaXozenRGb0hqdFFvTlJoMmR3c2dC?=
 =?utf-8?B?TTZzWHpyajZCU2hwQjZPYlJXNUVFdU1hTjArb1ZiLzhsemVtK3l3Y0ZqN0Jx?=
 =?utf-8?B?UGlUaU5yYXhldlpwUGgxa0huQkd3NmdPTnlXdi80aWJpaXhWSjIzdW5NRWE1?=
 =?utf-8?B?dlJncHppTmpPZ21EYjZIdXZHS1RvaHp1V0V5a0I0K2hKa29PdDhBbGM4dTEw?=
 =?utf-8?B?SHVxNEJDQk43akZEU2RlZ2FaVlRDM3NPc0VVejlIYVVpUGRGdnpyTWJEQzJE?=
 =?utf-8?B?RENrZTgyaGVSKzhzc3oyY2dhUlBTaUQ2SXFWdmtJdGJWQUlZdWNsM0dDSkFt?=
 =?utf-8?B?b2N3RGwwMElPTVRZQjRaeGJ1VUlZYzlFMEozSnRreVBqMXVWcDVSVVcrai9x?=
 =?utf-8?B?ajdJaEdoSFdOTEExczdVdCt1TlFiODlwY0htYWVHajB6WHRHUVRjUXlWU1dU?=
 =?utf-8?B?S3A3bzFtSUtKNTBqb2lweDdZNllhRjU3ZjFHcEgyOUxxNE1rS2RGaGl1UWdT?=
 =?utf-8?B?cmVqOHVXeVJzdWlPenNvYXh0czcrWEVQVnZXYnJtT3NzYldKRGdnd05CQis0?=
 =?utf-8?B?SjJqTkd0aUd2Q1V5SUl2UFErZUw4UkNxd1I3anZ5cnJnaG5jWDg2L1orTEdi?=
 =?utf-8?B?K2JLdDV2TnlXMzMwenhZRHJCN2F1Z2Zlanl5c3NDVkhnTXd4YndNRnJuMFZH?=
 =?utf-8?B?OFRQZGFzZW5oVkswVHVOOHJ2MVA2VE1GcENudjduMG5WQ1l1anJDSW5QbkxF?=
 =?utf-8?B?M04zdkIvM3pqQ1JPVmVmb0JFbVN4QnhEL08yeWRSSGE3N2RjRysrL3hXTmpF?=
 =?utf-8?B?Yk1JK3ljV2dHTDVmTFNRMFluQmJLejByRDQwNWpVeDNYSGFFYk5MNGcvTFJD?=
 =?utf-8?B?U3ppcnFpR3Zxc2ZEZkMvTmVRTFpJY3hHSjhuSWF4MGcyWm45elBrY2NreDFL?=
 =?utf-8?B?MXFSTGdBTUk3anJwVDloZEowbkkrWmN3QjNMZXZLTFM5ZDRDc0lFUURQRUJ6?=
 =?utf-8?B?Qm8yS3BGRlhtSE1TZUlOMFRIOGdhTWxQU0g5SkRXQWpDRDNPVE1SR1kzVWI4?=
 =?utf-8?B?dk9XQjl2RmdyU3FvMTNiTCtrU1h0TWVvUm0xZmxZUkQ4U1c5ZXpTejFETUlM?=
 =?utf-8?B?U3R0bENMYWxLYUlwcVFyT3YyWWw4NTFRM2JVOEdEcFVyQnFIZEhYQW5sNzhh?=
 =?utf-8?B?OTVwWjFPNFZKRE9uOFdoZ1pOeW1yQ1R2clV4amJBNnlkZkpoMUtkb3E0b0xt?=
 =?utf-8?B?amV6bGs4YnRvaERDSmE5MEFlSmVLc05TdzZqR00raEdzcHFHT09vMFNCOTYv?=
 =?utf-8?B?WG1ReTdadVR1YXpxZzdQN3RSSW1HM1JQKzNCUktSQWpkNkNIMnh4ZWJGSUM3?=
 =?utf-8?B?aVIxd3poaVRDcXhWb2w1dW50ckM1UEp6K3cwbWRCbTM3aHBPN1dnS281ZHJj?=
 =?utf-8?B?aENMTitpUmpKQVFqR0JLZW1nZ3IwTnc2K1Aza3BSNy9qQW1NYVhlUVlnYVdp?=
 =?utf-8?B?dVBVNEZSTTRwQ1ZqMmhtVnV6QWpzOTFYTnQzTk9hTGMrelZQaHAwV1hna0wx?=
 =?utf-8?B?Y1VJYVZ3QTVtNklweDN2bnNQQzhaZkNXTU9GMzRialZ4Q0tzZDBvb1gxY3Jr?=
 =?utf-8?B?ZG9PQW5neTE3QW5aOEkxbGRCcEtLY2ZTQlM2eVVrMGNFeEtWQlQzakFucWpY?=
 =?utf-8?B?MDlLcWE2bWRackU3UjJOYXdaREE5NDE4WE5SR0Z3ME4waGlmdmo0RUdESTJF?=
 =?utf-8?B?VUUvcklXZmpZc0tZM3ljek5pcnRBTjRpUHlhTjljczhyeGJXU3YxWGVXZlhE?=
 =?utf-8?B?WnJyWGRmYUJrZTJpVmZwdHpwVTkrUU5PSytYc2dRSVNPVmZmWld4K2d4WjdU?=
 =?utf-8?B?T2loTy84S3RPL3BwU3d3VnBkZlRVd3NBOTZSa0RuNC9vNmVJcC85ZXAwUldv?=
 =?utf-8?B?ZEk5YnVoMCtIV0pNZTJVOURpOENkaHBaV2pvVnNtS0xmam1WVGtUZVR6blBZ?=
 =?utf-8?B?Zzh2dzdhME9kN0s3MlU2OFZJQ1pIT2RYcDU0RE96c3dNdlVsTWlYTlBJUDVi?=
 =?utf-8?B?QjkzRklUWm1jOUtERmx6bGIvYXpmWVIvNlcwT1pRVmx3R2tHRW0yR0lvVXhh?=
 =?utf-8?B?RmxZNVVCcUpaelFGNlhNTEhreThHVGRuTDZyZHlRTW44bXNFODk5bm44Wi8r?=
 =?utf-8?B?Qmc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0141d671-876d-446a-3f27-08de2dc88338
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 15:20:35.3003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9vqL2M5m3ygc2yRepyRMcSdlWM5V6N16uQQ5CG6vxtOSAbjFwjGl/5uqmero71iznroXnJog7IVm/3txTCeK5fr642IuU5xyPVK+k6987wE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB7723

On 27/11/2025 2:31 pm, Julian Vetter wrote:
> Currently Intel CPUs in EFI mode with the "Execute Disable Bit" disabled
> and the 'CONFIG_REQUIRE_NX=y' fail to boot, because this check is
> performed before trampoline_setup is called, which determines if NX is
> supported or if it's hidden by 'MSR_IA32_MISC_ENABLE[34] = 1' (if so,
> re-enables NX).
>
> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>

Lovely...  This isn't the only bug; there's another one from the Vates
forums about AMD CPUs which I haven't gotten around to fixing yet.

Do you have any more information about which system looks like this?

trampoline_setup isn't executed on all EFI boots.  I had a different fix
in mind, but it's a little more complicated.

If I do the key prep patch, would you mind trying to tackle the AMD side
too?

~Andrew

