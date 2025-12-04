Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2F7CA590F
	for <lists+xen-devel@lfdr.de>; Thu, 04 Dec 2025 22:55:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1178285.1502161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRHHl-0007Nd-Rv; Thu, 04 Dec 2025 21:54:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1178285.1502161; Thu, 04 Dec 2025 21:54:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRHHl-0007Kq-Oe; Thu, 04 Dec 2025 21:54:49 +0000
Received: by outflank-mailman (input) for mailman id 1178285;
 Thu, 04 Dec 2025 21:54:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TdJQ=6K=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vRHHj-0007Ke-Ut
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 21:54:47 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9044c69-d15b-11f0-9d1b-b5c5bf9af7f9;
 Thu, 04 Dec 2025 22:54:47 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SN7PR03MB7129.namprd03.prod.outlook.com (2603:10b6:806:32f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Thu, 4 Dec
 2025 21:54:44 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 21:54:44 +0000
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
X-Inumbo-ID: d9044c69-d15b-11f0-9d1b-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wmqRzuViz6cqlMsQOfYpkthaNtPoEZ+kJ4jriXCxEQhsLmHrvEQHJ1c+34gDJshCoHmgn7nbBOAky9smPcOVrDaPiDNGYgOmIzdcCOPDCSgyhMF4iRr1yRhSYt5UIkqpmxCt2fX7wMgbGTzwG5DY0OUs9DjkhfhaSlCiDy+Ppf7nsCzlBwT03cMwbBV1PLh6+uSczxfgztZF/JswioZi5Bt/k7fzmkWOGHGcdop5LxTMtEeK9Yl1UXZbYqpFKRibG9rts0rTlXf/uYlcTmNbIYa9bv1WgIwmoB1/r1DiszOSUsT0cSAxHIWtpPEYkEVMEVzNkiBc6BeIDdYCQO/n3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ph8kVgQlggGqAwLK034umbgOLoBGvg/LjuMxWOhhe3c=;
 b=WU4ZDbM5ql/yrXEJLbRnVj6QzyvCGy2DLrMyp6/8iv1thN9Tkd2GCKQigxYVoL/dHp+8/HSFJYSFQn1LCY+gAh2T2PCnOyI579OjQKjZqi/T6YN0t86+5/p6cKa6YOz5C5cISZNt6w1AA6B79fsomjDBheBPH8kzM3brlL58auvD0vENU/58ViiweinRUtG6MA2HKdzAaiJc0EaVba9zjTBHXpdFmRgiANo4hL0rvLAZPkdEjnVuHrnrVT4+ds9gYN1OrWyQdxMx9Wz62jngpo+/I3i1GSXWMa66ZgXQsD403oPDROEzjysuT6JYG6twAX9uCGdhCjUgiqHxevtcyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ph8kVgQlggGqAwLK034umbgOLoBGvg/LjuMxWOhhe3c=;
 b=BKbHgCS+uBq5PVHutkVCJ8d9PCNGBbWcVcKtQI26OZRyIIxU7x/eYYxVOMf8NriwczwjSK30J+HKl2BDVj8uz9EBmv/3rHNhhHPUyiWAP7zjmla+KSQ3QfFQv1z6uGRBHze23X0dStRCWmtBxzYLy8YSbsVppHuWCdEUR+oCDnM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c9512f4f-7c68-4504-8492-237447586cc3@citrix.com>
Date: Thu, 4 Dec 2025 21:54:41 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 3/4] CI: Add configure --enable-systemd for full build
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <cover.1e7327573686b6fc1e161127e268e4042556d16e.1764867217.git-series.marmarek@invisiblethingslab.com>
 <ed2e7eda64da87351d6fd8590eee698598ef8e88.1764867217.git-series.marmarek@invisiblethingslab.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <ed2e7eda64da87351d6fd8590eee698598ef8e88.1764867217.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0641.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SN7PR03MB7129:EE_
X-MS-Office365-Filtering-Correlation-Id: a3dd047c-ee8b-4763-df35-08de337fbc02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YWFNUjJJQzJ6NEU1VDBseTEwSFRsMVdCZFBiaDF4TTRJSGJJVEM4ZlRFWWVa?=
 =?utf-8?B?aGJOVjB0UmxtZkliL3BSbnlqcWVCUjVTNkJ4bmV1T0VtUmdGSGpiSzU0TDJU?=
 =?utf-8?B?VVJmREVxSWtGRE9CcG02cEp6YlJHQjF1Vjl5MjcvZXV4bDEvdzNZclVtUjNP?=
 =?utf-8?B?NlVYWHdKbTFQZmc2RzBYZ2hXWVY0d2k4Qjg4bWtFQWlPRlZvQXZHK2MrQ05B?=
 =?utf-8?B?SVA2TDAxOTI2QlU0OXdUUHZiMFBTQ3gzb3hydmxXVm82NlJvOXlZT0hZRzJq?=
 =?utf-8?B?b1ovdjgvcG1aQWRlM25WK0ZTR3lKd1Z2Y29SVDNNakRFcUhjMEloNVQ3cmpj?=
 =?utf-8?B?dUhlWFg4OGZac1k3SGQvVE1aUGEwVTErTzN3WmtweVYvY3NKTUZ0dUxGWURj?=
 =?utf-8?B?cXFlekZldDNLWUhmdUxJUzl5Ky9ZUkhlR1JMN3h2M3FCOTV5bWZyMGJGaFZ0?=
 =?utf-8?B?VXNxd3F1cithdFBudXhLY1pFdkkyRFF5SmIyZ242YlN6Nyt1elhKcFoyV1pi?=
 =?utf-8?B?amhrdkdkcGpEYmxMR0xNS0twUUZXQStGd0QxcDRzZmpnSTJ0NWJ1dmlMZlly?=
 =?utf-8?B?MXhuT1lwTHp2cjgzclg1UmNsSDdjWVU4Q3pnWnhheHFsOGxrbXlKR0RuN25I?=
 =?utf-8?B?a0pRTWpCbWpMN2V5cWptMHhjWlhvVGpMMUw5THdYQVh2dENlZTBTYVk3ZXJk?=
 =?utf-8?B?b0pTMDFjNVYyakhxZEliVG9mOHBTcC9yckU0c1I1c0c3LzFGOVlHenYraFRK?=
 =?utf-8?B?UzVadklKU2cxM05Fbm1pMkVMdytodDR6TlVzUEVlUDV0Si83ejU5MG9kS1oz?=
 =?utf-8?B?dTZuYXg4U3lPMzdxd0Y2TXRHa3pGNnlaYk96K2RVNnJZc0hSRnNwWE0xamhp?=
 =?utf-8?B?TmhEakFKTmI5ZkdkS04wTXZPVlFxQk04TTEyT2JJM09IOXgvYjlLaGw0ZW1q?=
 =?utf-8?B?d25LanAySnIxcDFYbXNnS1pSQVl2c3dmbWFPNnZ6b21BaFJLeURoM2JaYkZV?=
 =?utf-8?B?T2NBWHJsNFhLUzBoU3pTZjRJTmE2VkdZSmlmVDdReTdacG5zYzd6RVZHM2R2?=
 =?utf-8?B?R1pEKzQ2bENPdFZEOGhtMUcvcVVSbzhyVkNZYStaL2N5dGorbFBEbmZwUGFo?=
 =?utf-8?B?QkRSS2twT2xMTGVoVG1acjloWFpUbUdoT0ZwaEk5cC8rb1JzcitKYlp3ejQ3?=
 =?utf-8?B?Smc0UldMT0pGeEM2TGhuZVcrVXJNSHRKNlU0K3Fzek5vUHRrVDFJdjZOaGk5?=
 =?utf-8?B?OGcwQmQvZ0lHYmtRSzdvNllVSzk0eU95djJFT3pVUkpzUzczS0RCZDBFTW91?=
 =?utf-8?B?dFBLN2RhU090eVNMVHFjbzhUSmUxZ3VXUnVPSEJycjduRFhRQ2pFOUh5YUNy?=
 =?utf-8?B?ZFpqcWxsUmZQdU01ZVVMMlVIbnpkZVgzRFNQZnVCV0xHSWNSSHozTFdVbzJ0?=
 =?utf-8?B?V1k0QXl1bXFwdHZSZ1ZaYk92b1YyMHQrUFBNc1VGdDNNek5QT2xoZVZHMmhn?=
 =?utf-8?B?Wlhjb1pwcUFEYm9EdnFiVkp3UHplMk5vOXhMb0FkZGpPTDg1cjhhVUFWQ0ls?=
 =?utf-8?B?SGNybjJubWZIWDZmZkV4OWFlaTBJZkN6c01CNzlrcmIweTlUUVJxZkduVDdZ?=
 =?utf-8?B?TklQUktycmZ1eU0zNk5QUDJVaWRhTDFoeVpTdU1JZmRWUjhDVnFhUG16WG1q?=
 =?utf-8?B?SGI1QlhaajlFRkYzc1ZoMUxoc3gvT2d2b0RYdXp3SXg2Unlnb0pUS3d2alRZ?=
 =?utf-8?B?S28xUVluTk9rdzk5bm50MUFSS3FiVXZGZEtrdGZzNjVseE9EY3hsMk5aSHFk?=
 =?utf-8?B?RGNYN1lsZGdVNnh4STNSaGs0cGw3MlNjQkZyWXFjNzFOYmNmZEQwNVNzUWxy?=
 =?utf-8?B?WllhTGtEMWhUaktvYXR6K3ZqQWtkWFRjWTRRWnUvd3VKeEhHUjZhblgzYUp0?=
 =?utf-8?Q?gYZhCS1oYa99FRDhd9Qa4RL7VPsgYBdg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eFBYVjF5RVZnYjhaY2N3b3JuY2xvSXhZTXZ6amhqUkJmZ3RiZkN4SG80czMw?=
 =?utf-8?B?a3BJYjhKK2ZGZHBSYWl4NVorL2xxbWJrSWxmb3EvdTMzT2ZIY2NoT0VrZU1p?=
 =?utf-8?B?TUtIaTJGNFVYRWJqZks2NzBKa3k3Y2tCclFVT0NPa0hhMnQ0SmEwTTc3WmM4?=
 =?utf-8?B?RndQcGZlQ3Z3MDZMU0hacHZ5S3lZVm1FMnY2eFpCdDIzWk1uWWhCU2UwN3ht?=
 =?utf-8?B?ZmFDeHVBZldZYzdUa2RwRDM2NUJiTWpPMll0cEQxVjRDdkF1aTEzWmNpb1RU?=
 =?utf-8?B?UHBGcEpHK1l6YXJ3bHVsN3IxdmtDUHVUK0pOZFRINzQ1aWxUM0RtRjJZR3VI?=
 =?utf-8?B?WkowRjB1ZUtFbTFkZTV3aTVRY0NieEV6aVdlU2trMVpXR0xidjU5THR5eHpZ?=
 =?utf-8?B?YXc4ckFsUEtwclplLy93TWltWWhKWmFlL2k1K29UVXhWem9xbndHeU95bEx5?=
 =?utf-8?B?ZXBpSzdUVzQ0Sm5yekc4aGFWVENIU3RpQmRVSHZWSWJFM2hLdVRpTW94NmNy?=
 =?utf-8?B?S3p6b045c2pYL1RSYTZUaFQrV0hpcmhhcTNqVW1zVHB3UWRmWnNINFIrVkU3?=
 =?utf-8?B?dVpsdURxY3NFZi85dEVpQllacEtxM1d3STJXZml3UHNsbmlVZDlXckpUUWls?=
 =?utf-8?B?UDQyS3M0eHNMUVczdWhkTUZTb3VNcTdKMlVidWlyTkZyN0NrNVoyZFgzQjhV?=
 =?utf-8?B?SzF0MkNKTDhRcmtkdDFmcHlwRWg3bDMyUUJleGpINkh6c1F2TjIvcmFSRlFN?=
 =?utf-8?B?SDdUdXlJaEtDa1JRa1haZlpMYzl4RlR2RHBYaHpaNWVSSFl2QTVrcHdsYUlV?=
 =?utf-8?B?ejAwZmNBSE5nQzhRYWRIdHM2Rjh4cmVMRWRoeldGTjFWdFlHUGY0MnNQdnVo?=
 =?utf-8?B?QU9DS2gzYUhROTE3Z1FMWFNnU3lZejllQVhFNVRKRGw4MzVWNzBPc3QzS2wz?=
 =?utf-8?B?NFFsQ3ZiODhNRWQxMFk2TFd6cS9PK01iV1VjWmNuQ0RFSHUwK25KbFBCS1Jn?=
 =?utf-8?B?SHEyVTRPL25HZE9LODAwTExndGZBV3dPUEFwWlRPZHAxR05UUHpUejJsUFJ4?=
 =?utf-8?B?dUs0VTFXR0lMeGNSdFFSWmRneVpORmFhcEhqQVNCOW9Fa0c4RnFldE4yZ3hu?=
 =?utf-8?B?N0xXLzdPQnhrUjJJT1lzU0R6VnM4YzRGanhIUkI1US8veDlOOXQ0SkhPemsy?=
 =?utf-8?B?WE1wMHlRYjJVTWNMazU3MjY5UjVXWkdUTWdpYnhkRm5vTGtPdm1wRzB1NW5i?=
 =?utf-8?B?amtOQWtwemRyZ2FMK0lkWTltRk5ReC9mTmNNd3ErZElkZ1ZKN09Zb1VtNzZO?=
 =?utf-8?B?YTVmU3RUVE5hVC84VCtYczhFc1gvYUpLSzRvL3FGWlg1cERGdUNHSnd1WFdx?=
 =?utf-8?B?bXdrUmFLbzYwTER6S25raUY0YkxqQkRHdVNMR3pINXpLVTRHRzVzc3U5NzZk?=
 =?utf-8?B?Mm8xV3FsZHhnSU5QOHo0MUM4QkhYSHhxeWZ2ZEJyZUtRNGU5MGdjR3cvVVUr?=
 =?utf-8?B?WEVMNWVKL2JaSU9LYjlYbUZTWVFNaSswWExzNFdXUXpxODlwUkwzZGRSMUpS?=
 =?utf-8?B?N0VyM1VsZ0hkVVgrenZ4RkY2MlU5WW52QVlUUVZPRFE3ZXk0Mml5MnpGN2R0?=
 =?utf-8?B?cmIwVFJjbGdKMVpDbjMvSDFjeWhRZjRmYzhBeE5hTStXZ1JNNis2M0F5Y0lB?=
 =?utf-8?B?MHFBZVdKcGNLSDFVQ1JBUnRSbGV3MnAwbXVkd1JUNnNjaFBpNmlBbTRBQ3N3?=
 =?utf-8?B?M0FNa3ZWV1plS1MxSDBtMVJ3TDRRdlhoN1h5cXJDS2NkVjRib2Z3N3ZXR1M5?=
 =?utf-8?B?TVV3Zkp3ZkhnLzkzN1pDVURvTjhLZzIzRkV2NFdOSFQ2YUo5ektuWHJ6SnRr?=
 =?utf-8?B?QzRxK2VJbVZtc2FxQnpBMGg5d0xrUjZOeGszWFJaOW1WNzI3RElxQWZYd0ht?=
 =?utf-8?B?c0kvT3IrUGRzTUtyR3hFN3Z2R05kcUFoUUNWd2ppWlZuaTdac2ZYRjRFNy9Z?=
 =?utf-8?B?VFRWL1hTTmdvcDJ6UU1JN0JOSDJuVTZSVC9oQ0czbVVlSnRpUXd1c2FRZVFY?=
 =?utf-8?B?SEhHR1VOYWszSkdtSUgrZ2p3Tm5PR01wNThwbzUxZVRSUnJUV2ZMV2gvajVV?=
 =?utf-8?B?OXlSK25GcVpVVHFWRlV4MlE5STVGc1FSVTl0RUpDSVRVa3IveUZtRmtwZTlV?=
 =?utf-8?B?NGc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3dd047c-ee8b-4763-df35-08de337fbc02
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 21:54:44.2070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7M/lK6Rwt8lVm7QZvausDTVPyN3akIAuwDNgJlDlm3jfkyt/lJVySpvhL8kE4vmA1YH0Z4B7xK3P6Hbflwy7OCAAJiw/lG8edLmoR+XD59Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7129

On 04/12/2025 4:53 pm, Marek Marczykowski-Górecki wrote:
> This doesn't exclude sysvinit scripts, but allows testing systemd too.
>
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Oh - I had a task to make this happen by default, which also missed
4.21.  It's bad that configure does the wrong thing by default for systemd.

> --
> Changes in v3:
> - switch to trixie
>
> New in v2.
>
> Requires containers rebuild
> ---
>  automation/build/debian/13-x86_64.dockerfile | 1 +
>  automation/scripts/build                     | 3 +++
>  2 files changed, 4 insertions(+)
>
> diff --git a/automation/build/debian/13-x86_64.dockerfile b/automation/build/debian/13-x86_64.dockerfile
> index 6382bafbd5bd..9387da453fea 100644
> --- a/automation/build/debian/13-x86_64.dockerfile
> +++ b/automation/build/debian/13-x86_64.dockerfile
> @@ -26,6 +26,7 @@ RUN <<EOF
>          cpio
>          git-core
>          pkg-config
> +        systemd-dev

Why is this needed?  Or rather, does this patch predate my breaking of
the dependency on system-dev?

~Andrew

