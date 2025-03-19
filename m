Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 421B6A6963C
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 18:20:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.921016.1325046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tux5I-0002JX-I9; Wed, 19 Mar 2025 17:20:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 921016.1325046; Wed, 19 Mar 2025 17:20:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tux5I-0002H8-F4; Wed, 19 Mar 2025 17:20:04 +0000
Received: by outflank-mailman (input) for mailman id 921016;
 Wed, 19 Mar 2025 17:20:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=19Ti=WG=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1tux5G-0001m2-BA
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 17:20:02 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2608::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62dcc950-04e6-11f0-9ffa-bf95429c2676;
 Wed, 19 Mar 2025 18:20:00 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AS8PR03MB8020.eurprd03.prod.outlook.com (2603:10a6:20b:42b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Wed, 19 Mar
 2025 17:19:57 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 17:19:57 +0000
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
X-Inumbo-ID: 62dcc950-04e6-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AjM9h1PJtlBZQE23w/4WrNeNdK7/tTOgsMtkVlrFPVJf1UIf1BuWz0jmW/tV9tsDskTSshsuwa/qmR14SoeBn21oL1j8w0KS/wSy9aiDbnapG43xNi8TxgCCvjnpEJ+GB8FLSjdVhu2gQg3jAJqJ0mgX7LijG08weKOOdBir0X3bcSITMD4RdYq6BUM30N1DSMH85Dh2X+ewwPrmLrNbf5pm4h3ercKy2Ethg1P/dWo0B6HrfgGRIUMDQUk2S3rSMER6fOP5tO5luZdQaYfDYK5iswBda74/y2E2sZVJiQd/ksuGVjIomUnErezXduuWygIlouSTv/3u9X/CLTBx4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rO39lpJ9m3pvti7otaTyIEzwEDx2/0u8Q2SmAR9HyGA=;
 b=C2BX/4b0a1x1gq7c3qQq1gj6mSgdoAYwt5GcsvTKyTRiYiIBBmy6nFsHgws52Eg0/hle0/Tl11Yt96TSHXWC+J3fr64/nxcbex4JQ7K2Pxf/yDT7HcVzinBVotCGHpaaTVjOngvsL6Bo86eeICEIPw+CKQ5ETheUIQB/jH1CDgnmxWC1XXRbPypmDJ/uPY0MUTR7wNM2Y3z2EeH6qkgJtWCL7VA7cIxQFqJlF1tYYmpJwX5UQ3leVSlM3s4Yj9CKXzJAi65mGZ5ZUhvx0JTincze55iXgRRYi/arDQubWeBlalD64Ir4aGVGnZxMwcSFz5EhsagzZrExmD0rxqdPWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rO39lpJ9m3pvti7otaTyIEzwEDx2/0u8Q2SmAR9HyGA=;
 b=MqAjJDxaEh5G7UlBgcDe2h9wpu9sGuTKnTwdTQLIt3p6OD8+1jATN1TGHsIlBKrI5Px3Zn/ehee+e2vMBTw8OVFfJUvXPpNwBCjbaLk4NqfZLMhWBjh2qqKHdT7PXOzfAlQa/F9DeCrskq1t6yQW3QUZIqcoDEpDWvI5Lz/yQy5inZEZZtm17lBDTKWQoJ5i6IviU6AG1hPEEy75NWQZBusXX1GTqjx5W/h1OThloBy4O8UBNzcdtJ3tiV0XpgMHcv3c8PuaxaWEEf5biPWc1Hy2kyozT695DJVR6qsCF6qQ87i5LohisT23B6nvoesZpScsOI+jF6vMrtpQFJ2mSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <305d8558-9365-4c31-a3ac-4eb7eb83a907@epam.com>
Date: Wed, 19 Mar 2025 19:19:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/16] xen/arm: Introduce system suspend config option
To: Jan Beulich <jbeulich@suse.com>, Mykola Kvach <xakep.amatop@gmail.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Mykyta Poturai <mykyta_poturai@epam.com>, xen-devel@lists.xenproject.org
References: <cover.1741164138.git.xakep.amatop@gmail.com>
 <28da91c2859e0226585951ea3d6e7017b402ec0b.1741164138.git.xakep.amatop@gmail.com>
 <6eddbd26-88ca-4d0c-b56a-4e7abcc3933b@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <6eddbd26-88ca-4d0c-b56a-4e7abcc3933b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0019.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::16) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|AS8PR03MB8020:EE_
X-MS-Office365-Filtering-Correlation-Id: a439841d-eb1b-484c-4a4c-08dd670a45f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QlhiVnpwdlhRRGlIMDFBNEErVjJVeCtmdW9MR2ZUREE3YnBDakZEK3JNek1W?=
 =?utf-8?B?TUMwdmpNRXlEVTdYbm5BdUFmS0VrOUpxMTd0Z0lzUkh0UHA1NjA4SzNwdmNu?=
 =?utf-8?B?aDFCSzZJZ1lZcnFqck5IdndTdmRuN0FkN2k2SEY0Lzd2bXk4K1N2RnFURVJw?=
 =?utf-8?B?N1R4b0xUZkE0M2JYYTBybVhXQ1ZwRHJBQk1zUUxna0dqaGxYUkRGRThONjc2?=
 =?utf-8?B?VjB5cnJSME1EMU1CblN4NXhFT3ZnenRlRWxsVHlkKytsei95M1VSOTIvdnov?=
 =?utf-8?B?d09URnJhNzZTa0FoTGtEa0I4SitiSkVyV1VscFpRWGZUUUtNQW9OamdMYTNX?=
 =?utf-8?B?Uk1aaVBpUkY5WkFNMmdtam5mYlhrc0hIb0cxSVg1eng0RzMwOEJkZXprSGc4?=
 =?utf-8?B?OUNaWTJLbklRcUxGMDYxUnRZa1hxYkpLV2l4S0V2bzBnMmxkMnA3Z0pOSU9W?=
 =?utf-8?B?dVFyL25nakowQnJPYlNLb1prenRHTE1PS3hCaThIRkVHeHBKYkhzZDM1ektl?=
 =?utf-8?B?dTJrejRWUHF6aTVVV01xaDZZS3V4TDlDL3BKTlBFYnBScTI5SFFNU2FmMXZ2?=
 =?utf-8?B?d1dNMllBckpsTEw2VGdDU0RQV0JkbnovdTBDbW0yd0ZjN01SUGFqcmhaL0dG?=
 =?utf-8?B?Q3JtMFo3MytOc0w1M296bUxEUkJGMDQrUVgxMkdpbmdKYzlDS1ZLRU1jWVZz?=
 =?utf-8?B?cDliYkZYTldsZkR4alhpMUVOQmtReU1LekFxNk5PVmNPUUhWRTk0dS9xeUZ1?=
 =?utf-8?B?Z0M4clRJd09OZktUUlpseXZseVhHcE8zczZBcmwrYjYrQytlV0V6RHNqQnFm?=
 =?utf-8?B?M2RTUmVqNzZiUmM3M2UwNGlpZGdYK0gySDdyZUZWa0FqOERqZVZRNXBLaUIz?=
 =?utf-8?B?aXpuN0NHcjJ4dzR4cXZyVm9vUVpUNTRWSSthQTZ5K2txTWV6S1lrVGs4OTBL?=
 =?utf-8?B?SjRjN3lnWjJmc2h2VzF2RmVZSUNPZ29JVlg3enM3ajc3UlhBalFDcGVib0Jn?=
 =?utf-8?B?dVNxV285dWtVMWtBSGFEZ2ZXaGcxNlduVUFLUGhpb3NHeVNFRC9XQWJUb0JN?=
 =?utf-8?B?MGRhcnBwckZYcWM1L203M1pQRUdpWDdlRWxlOGNEeER1ZUVmeGgyVUlKVDNz?=
 =?utf-8?B?WWxGOStVL1lhaFgwNXh4N1lEZzMvOUNCN1VsRG5jdUJIT2MzeklsSml0NnFY?=
 =?utf-8?B?V3BTY2V6QUI3aGJ5Zy9VNEppbkQ0N0dKOGljU1IvTTVGUkZuazd1aGQ1T0J6?=
 =?utf-8?B?S3NEWG45c3Y0aHBrbHRJdGE0Ni9sSVVEMXY1a01obGRiKzRuMmdEMUswbVQ4?=
 =?utf-8?B?RnY4VGh4RmxLaWp3V0dLNW5wQU03YXR5aFhKSzk1citqeTFmS2J3NDM0T1JN?=
 =?utf-8?B?b1ZWTi9wek13S1VhYk9RV2VpdFlZeUQvbFM3V1dYeGt1b0w4UHhDcG9HNzRL?=
 =?utf-8?B?VVhDODZhelF2QVE2d3JiMGRVZ0JWbEFvT0dKNS9QS0Y3dHlXNG9zOS9tWkRY?=
 =?utf-8?B?aFY2U2lBSGdUbGpoY1laanJMQy93M2VxdVdxVFVXMGJ1clUrT3lyYmVzOURW?=
 =?utf-8?B?c1VUd2UvV2ZOU0pSb1Nuc015M0liWk9RVE1TRThmbWZSQlQ3OVM1bUM0a3VQ?=
 =?utf-8?B?cHJUU2ZOcG5nT2c2WG9LUktMeVNJNHVBeHBYQnFVZnhNZGRZVFp3bjhkR0tL?=
 =?utf-8?B?ZFg5Tk9MMU1JbHNoUWIrSGpnQ1NnZmFYY0dsaXNMVUVIbDE3ckNSYXpBR00y?=
 =?utf-8?B?MDJ3NCswOWhsQnNURVZ3bkw0VDZnOWkwdk1OQjhJYkhjbGVIQnVPcVFMVFpZ?=
 =?utf-8?B?Z0VYVjgybjEyRmZQN2hMbEdjaFBURGxOYVVRVytoZzJ3SzhKVEtWVWR2TmJI?=
 =?utf-8?Q?LbNQv3rZe8lWE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2xrb1ZEVmpvUmpROG9SZ0JMMFM2WUM3c2NBMVZoSUg2clNOckYwWWdiK2Ez?=
 =?utf-8?B?c1BYOE5GTDN4aURSdndVUjdmSWYxOHl2bVBIK3RmNVpPQWtlczQwbGE0V2tP?=
 =?utf-8?B?ekMvcmQ3TWQra0l4eXJ1dTQ1Vk52KzBFWi90RWtXSXRQZFhVaDF2dXpGc1B4?=
 =?utf-8?B?REpVQzh4NkRaYlRQMzdQK1VZV3JrYnF6c1hXTE5Rck9hSjZsRmdTU0YvTDlL?=
 =?utf-8?B?V3AxaDBBZXBWUDhHTjRuTG5KcUwrNG53Rng2c21qSk4rbEJKcFZ4K1lHVkk1?=
 =?utf-8?B?THpZVDFlOE55UEpvUWlwemJsb2FQd2xGS2dtc1V0NmFISzMxY0krRXpOQmV2?=
 =?utf-8?B?Y1RBUytJZ2htaytBWlVlN2lObVBrRGZiakhKdnRubE5JQ0t5b1RhWnVxZGJt?=
 =?utf-8?B?UXBZR1BveWF0WFlWN2FseFVnMUNPd1dyVGp5L2FVMUpmbTZIT0hxcTZGSjh3?=
 =?utf-8?B?ZWxlak1BSm1aWUNyVGl0S1p1TlVDbFFKOTVlcUpnQWpDNTF5ZFllNG1SVGhy?=
 =?utf-8?B?MllPaUlSTXRwU2QrRTcwcDNkMGJqMU9MbW5ERlBDZk1PendVWS9aSG5Rd3o0?=
 =?utf-8?B?ODhrMm9BbFE3ZVBnSDJsRXByTDRyQkc1L0E5bEtsbHpnaGo1RWlkOUQweHBU?=
 =?utf-8?B?bTNzem44amQ5UlJROHllRlNhSTNYNHdtUkZheitnK0hmbm5lVEd1VGwxMHEv?=
 =?utf-8?B?SlhPMVZJTmErRVNZekN2WVNzR2pGd0FjVG1kQlNSWE9ReXdwdUcvMXJqazBX?=
 =?utf-8?B?M0lvclJBQ2lzRHQzQ1lzaHVLTHZzNTNGZmoyQ3o4MGdXN2NQMUx3WER5T2dS?=
 =?utf-8?B?NDBHci9rRzRGdHJsdnpCaDloMC9wR0FKd1pFc2NZZTZJb255b3o3b3B5RVpP?=
 =?utf-8?B?blJiRENXd0tRNmUyTTg2TW93THZNaHNpcGVxb3BheUdHYkIybFpvdVdEYWpM?=
 =?utf-8?B?VXY4eTZCUGR1amZ5bVhTaEc5VlgwRVZQNVlSaWFEWUVGeE9DUzF6M2JmQ3pi?=
 =?utf-8?B?dFdZYy8xMmt5THA3clNnZm95LzJDZjUxam56VWNNVXZtcXY1dlpZQmR4ZmFz?=
 =?utf-8?B?NW5xdWtIZW5iNGFJTjk2Mzh2QzgzMThXMFdxY0tySTRUT3JodzNOYkYrSUlU?=
 =?utf-8?B?R3ZmUmd5RnppZHZDemU1OWlqZjdXanpsZ2l6UUFVdXhjMnFLdGE3TklvWDJG?=
 =?utf-8?B?RGdTNW10T2JEWndQRGJzK3c5bURIcDVOaWRmQkkvZ1hVb1JvV3VrdUg1a3dD?=
 =?utf-8?B?NlJMczhsVldLaHZJL0FKazdJaU44QTgySDFlY1JNSG1Rbzk2Q1lGMFc1eE1j?=
 =?utf-8?B?aDlXQ240N3JRYTdyZ29FWU9OdGNDSklaZVM2TEV0UzBDZ2VQTVQ1ODIrbjJS?=
 =?utf-8?B?WjdPN3BxNWdoRlVWRlY3SVZFaEJvUE1Ja3hIbUNPQkVVZGVzUjdRcWk2MVlZ?=
 =?utf-8?B?R3FKWmhmdmVVUC9jMFI3Y2xHSVRWUUx1THZVdEcvNGdmQ0FCVHVGVDJ4ZU5N?=
 =?utf-8?B?SjQrTVM3Q1JSUHViWlh2YnZiSG5SMGJrUWFCSjB2ZnROSTFYSFdzUUgxNEpt?=
 =?utf-8?B?Rm1ZckovbytJTDdyd1ZuSm0zNEo2MGphTTZlOWNVOFFZM2N0YTBsTlpsSHpE?=
 =?utf-8?B?L25mVHAxSks2TzNWOTVKdGdaSStERVNjbmliMVVyQUl6Qyt2L3g1QW1XZUZY?=
 =?utf-8?B?cER0SGlYaE5HZXRKYkVyZ2JGV2Q0TUprekQrL2VYV2ZwdEhEdHJ5TVNnMWpK?=
 =?utf-8?B?a1BGWEZyWDBvUWQzMWdHNjJsZ3FEeFNTYTZua3BiZmdSeVlOR3pCM2lhSGQ5?=
 =?utf-8?B?S3ZubEVBOEVKdWR2OVc4alJCa3J5bEkrSVMvT29pRXpUbC9SVWVONnNzRTVS?=
 =?utf-8?B?WCtSek5DU3dGNlhJY0NWVVkySlhFaStrbFAzdXoxOE1aZTdibTBCZ1Q1K1lG?=
 =?utf-8?B?ajZHTGZxYzd1M0hJeFBia1RGNHY3a2xnYXg4MjUzdy9xd2lvZHJja1ZQd3Vl?=
 =?utf-8?B?Wm1QR24zREJ0elZvOVpIWWNkYktKMklYa2hYejRqZG5ldTNZN0oyYkdIR2dZ?=
 =?utf-8?B?VDFkWkdhSUE2MHpSRkRzYmNXeXVMUVVuQjRiV2tnTEFKbTlGRHpLaEVxZkh6?=
 =?utf-8?B?N1ZTTnkrVlVxajFIS2VyVmNoQTNIVlZhN2tGc3BIamxLb3hwSW03SnJIYU5Q?=
 =?utf-8?B?d1E9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a439841d-eb1b-484c-4a4c-08dd670a45f0
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 17:19:57.8772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 36wj9vyPakfj0P3phC6mvV/Oaa2PpcSVQU8tf7AatJ9N9ZeUqkBg2qSByeJKyTz6lJW7cMzrrnTtu6ojz3oizKoY/i3/w0xo+vxIwvVmo48=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8020



On 13.03.25 17:37, Jan Beulich wrote:
> On 05.03.2025 10:11, Mykola Kvach wrote:
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -475,6 +475,17 @@ config ARM64_HARDEN_BRANCH_PREDICTOR
>>   config ARM32_HARDEN_BRANCH_PREDICTOR
>>       def_bool y if ARM_32 && HARDEN_BRANCH_PREDICTOR
>>   
>> +config SYSTEM_SUSPEND
>> +	bool "System suspend support"
>> +	default y
>> +	depends on ARM_64
>> +	help
>> +	  This option enables the system suspend support. This is the
>> +	  mechanism that allows the system to be suspended to RAM and
>> +	  later resumed.
>> +
>> +	  If unsure, say Y.
> 
> I wonder if something like this makes sense to place in an arch-specific
> Kconfig. It's also not becoming clear here why only Arm64 would permit it.

Taking into account that
- System suspend-2-ram support on x86 is enabled by default and It's going to be supported on ARM also;
- follow up patches are adding #ifdef CONFIG_SYSTEM_SUSPEND not only in Arm specific code;
I think, it deserve to be generic option (in some way), enabled by default on x86.

Also, Arches can declare that suspend is possible, like ARCH_SUSPEND_POSSIBLE, then
generic configs would not need to be fixed every time when System suspend-2-ram enabled
for new arch.

Personally I'd introduce separate arch/Kconfig.power (or common Kconfig.power) file
for PM options (A least there is also cpufreq/cpuidel, and could be other, PM specific things).

Best regards,
-grygorii



  

