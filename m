Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C10CBBC9A6D
	for <lists+xen-devel@lfdr.de>; Thu, 09 Oct 2025 16:56:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1140713.1475510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6s4K-00068x-Eb; Thu, 09 Oct 2025 14:56:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1140713.1475510; Thu, 09 Oct 2025 14:56:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6s4K-00067W-Ba; Thu, 09 Oct 2025 14:56:36 +0000
Received: by outflank-mailman (input) for mailman id 1140713;
 Thu, 09 Oct 2025 14:56:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VZ0Z=4S=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1v6s4J-0005zC-2x
 for xen-devel@lists.xenproject.org; Thu, 09 Oct 2025 14:56:35 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22dcf6f3-a520-11f0-9809-7dc792cee155;
 Thu, 09 Oct 2025 16:56:30 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DU0PR03MB8440.eurprd03.prod.outlook.com (2603:10a6:10:3b4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 14:56:27 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 14:56:27 +0000
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
X-Inumbo-ID: 22dcf6f3-a520-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=opIrjFUex09v9zfxcSN04vuUB9d8MPUW061fvIvPiPEHP+StXUPhD/we1Kc2X9PXbPmailud+OPVKUBd2FYepeUVAJ7Z+BtVCN3dvexehNgq5IoLjjY7FcH6P+r0yBxRBV/stD6SkihARWIKdkQJmY4W4VVYNnepYfLjAIwB02h1OXjWDP5TjiuU4Zi5IYW8gejmT/IEwf+5a/NnkheA5bVEl/+u7ClnJUneVbteMZSfF1fvxG9tOfWeku7lCEQlLRDOm2Ijk/qvAkT1i6iSDxDIUF5mM1KNdgLso9auqt+Lu2i44+QjwdG8MPGtbxikypT35VDYMVRiwyKR/9Qaig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LuyaZy+M9hBq5wFHtOTud4H+Bh5LYps+XVSmUeiMmUc=;
 b=YDADQF61m2gQwybw1AYosekFgHsUkHRrO1v0/FSCX7AS4M41gHAdOSK/4jNte33sEhgDwTzIeneNDf5V/82XmWWrkVlS1AEVUq6boA6pWSOYOeX5wfJ/6p56mjwKL9Ij8K1XHKYERgQiNrvkyioGOjqcUPPeB50RiwcekuhFuYNksF0z9q7LIFwX8lNc8E82Stexda/o6w/+30Ju6zFi3qo7jhlGfW9gBFr2SONPyeUd89cDctaqk2w/E4iyUmhzrlldO1uJc3/WvxGsAhcZ0b8gb6pBZMMlIa2z5uuDpl2f8x5fqplHc0WP2VhX4qE4yDFTOLXgVfwDBnzOPFehYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LuyaZy+M9hBq5wFHtOTud4H+Bh5LYps+XVSmUeiMmUc=;
 b=fmJV2cK3IYO5OKiqPe4aCu6AEII5c0QACskBLRgRV2Dt4QFzNBKcUSuBQ/nLtircfetuFKCTZWYb10ZQg7qHg4DzXcq2aoUfVdR22UE/hfZEaUTWaW0kNhV9RdgFVcqYgejMRqWjPnGMfuhk9tqvR5PccuOugwcOy7ZNWl1zvNxZIeGn5Unr/NKVSDXhnJ1a/TCXwnu5p4TgeX7CHFk5RSfeC7F8RuL9GrS4q7btPKgWnq1aGrK1RIFed3ZMvptNqRdoCF9YHCCdtAb887+n9mdkSslXUZLhSZNWDlbQDbzGDCk2/U+lV6zrzPD3JBLftuCmF4Ep23EqZctcKbvNQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <6a3494af-96a7-4092-a8fe-39aee85fc983@epam.com>
Date: Thu, 9 Oct 2025 17:56:26 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21??? 1/3] x86/vLAPIC: add indirection to LVT
 handling
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <amc96@srcf.net>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <265d5053-af61-42cb-a3b9-ef60df39c21b@suse.com>
 <dd6b46f8-76f7-46d3-b3be-083b58781f32@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <dd6b46f8-76f7-46d3-b3be-083b58781f32@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0025.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f1::20) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|DU0PR03MB8440:EE_
X-MS-Office365-Filtering-Correlation-Id: 29b577fb-37d9-45f4-fc27-08de074405e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cWprank1Vnc5cFM1aDh1V3d2OXhBK1VOblJSRzJ5THZzbnM1Y2RzbG1FRkhq?=
 =?utf-8?B?YWJ5N2Z4dDdpVmlYQzc1VkxScWExQUpsb2NZYmNOR3VjRDMzTUFBVlV5VDk4?=
 =?utf-8?B?SVJFT0QybTUxdGJlNUY5MXVvdGJZN3dEWXYvWk05V1lpYkJNbkE3RlJYeXZ2?=
 =?utf-8?B?bndPeTRqc1J3bFlMdFFsYWN2eEViL2VhTzhmWVlpNG9LcmpCVlJjemdKZ2tQ?=
 =?utf-8?B?aFdxWXRDWXNOWXowNWwveXlZSUNvS09YZEp2aHl6K2w2c0J3Um1IS051U1hD?=
 =?utf-8?B?MnRqQXZsdndadHEreXJRYWxQTjR0ZmEydGxvbmc4dGtwWXRIaUtxTkN4ZWMz?=
 =?utf-8?B?bGpXOWI5TU9uNUpOTUhYWnZhckVPY0dOQ3VXeG5iWksrK0NOR09sNk83N0hn?=
 =?utf-8?B?WGFvWW5GSWFsZElEb1hKK3ViQlIzRjlNb3hWMkRaVWlDYzVhampXUUtTYnM5?=
 =?utf-8?B?K0syQTAxOXBONnFIcm9SM1BGMFR2ZTJ4VjF3VStpc2lCVDU3THVtQXBTbjFa?=
 =?utf-8?B?dUVKanUyMHg1R1RCR1cwZmFibVdjOE9UOE16NTJ3RGFzNC95OFF0S2doYlNF?=
 =?utf-8?B?NkRvblkzUDd1aUNNM2JROG4vK1hMSFN2a1p4UFlkV0tqNUw0NURQb0FtM1pC?=
 =?utf-8?B?SVVqeDRPaGRsZUZWNjFrSUpYYTlkQnQ3UmZPNnF0L2NHZW9OZ1BTdkE4NjlP?=
 =?utf-8?B?NU5iZ0NwTm5uYlNlamFWUHUyczNJZXhrUk5vQ0tkNDNQMlhUcW1tM2lqY0gy?=
 =?utf-8?B?cTd3MDhVSHd4bXNIVTJKSWJGMituVTNOZm44SlEvaVpSbGN1YzhrSnJUZE9S?=
 =?utf-8?B?QWlFN0VGcTZZeFMrT1RVMjhFSmNWdi9QTzZVTlNNTjRrWWwzOG1Balg4Rndz?=
 =?utf-8?B?QktNYXZWUUZRdkR2cTZQVnlZOFlNeTBHYm54SGl2V1MveWtsdFJJTlFDQVZM?=
 =?utf-8?B?YWhmL29FaTlEanc3YWNnNVY1eUpQSGFXeHpIaWZZWjhVdlZTVm9DZnBiZzdD?=
 =?utf-8?B?WTQ4a3NmbVpCK3ZNS09vWGl0cnM3V3pFd3QzZmJQL2hxYWpzVXdJdTQxUjVz?=
 =?utf-8?B?cm8zUTREZEhHOGl4b2lhckxTR01pTWFJU0UzektXNk4vcG1CRWxhcVZDUjB4?=
 =?utf-8?B?QnVoeUdFSkJQU09PMFJyRkdscWI3Uk4xUDFnUWlaakRPclRlUDhGN1pvSG9n?=
 =?utf-8?B?ZlMvUHIyWmZQeVYvR05yVWJEdnBhY0VCSUt0SHM2Z3dVQmJYUUlWUHNSekZL?=
 =?utf-8?B?d2ZDLzIzaXB1MmwzK05seEhLSW9mQ1J4Tk1PbXg3c0pNa1VhZXZXNjRhZ2N4?=
 =?utf-8?B?ODY3a2lEMVcwUTk3N3dyOWpjbG9BTTFSN1VLdFVWNzdsckVaMXhzZkF5MGpO?=
 =?utf-8?B?YklGRk93aUhWaSt2MzRneEthWS9WQllPYnhMckloVUxGUWJOYVFMSGVUMEpX?=
 =?utf-8?B?YTVGbkYweWxOTHVpMTU1L09JU0pMbmhPOUQyamxlNUkxYmlyMVJoVGYxTitS?=
 =?utf-8?B?bWJzemxHL1NpMTI5dDFuYUtHaFVNVGEvVEdxaE9FQVh2dW1mK2FROU1wRXNt?=
 =?utf-8?B?MXo3S0R4eFA4UmQ1Z1hhRlVFTEk4ZmFRVlBoeE42QWtrbFAzek5TSUN5S2xt?=
 =?utf-8?B?VnVvN0tubml6Rnh4MkdmS25LQituQnVVMVNUWHBhZ0NsWDJ4NWo5clJ6dU1O?=
 =?utf-8?B?WUUzMVFzK1lzNFE3aGVybHlTMlI1VC9sZlQ0Um9rc1dNQjBJSExDZVh5dFNt?=
 =?utf-8?B?SVJ4YkV6NUtacjdsK3hWS05LdC9nOGtrWE9CNkwvS0ZnUHhQWFBBdWViY2dj?=
 =?utf-8?B?bW9Id1plaHRGTTdaVHhsenVsT0I4SkNzYitLcWllZWs2K3ZFRENlb2xrK1M1?=
 =?utf-8?B?c0E5TjYrRUtBR1JkZlRnYjk5L0hDcDIvaW1WSVNRYkF1RDJZVmVzTjY2RTQ1?=
 =?utf-8?Q?GaGp/FyoMQeDd2i00xtKTqg2R7olS6yq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFMxVUMzcW1xTFcvOGVqdUJpSlpmWUZFMXhRS0xFbHNsM3FKZWZ0OVVsMHNn?=
 =?utf-8?B?ZFJaWWhHRDZBVDhJVzh3Rk5rSkxYTytHd3BVbHlUK3JISnllbmVYejhzQmFZ?=
 =?utf-8?B?Y1l5d0poOHlrQzNkUS8rWCtKcS9aNGVkMy92MTkrcGdWV1hMS0ZNVkNtMnJz?=
 =?utf-8?B?M3A3RDFRcjZ6dWxZYVFtS1dZUEZBV2c0M1V3eURydkRCNy9PTzBETjl4aUpk?=
 =?utf-8?B?WXhWeUlEUm9OcVFaRFlhYWd4VjU5dmxMUUJ1Tm9PMFpjc3ZBU1h5WDRoQlpt?=
 =?utf-8?B?RGJrNWRBb0F6Y2o2OWZFakpLRUxxTG51RG5RV2dLK1Z6QkFheERsblM0MzNN?=
 =?utf-8?B?aW5XclQySVJ2NjNMU3NVdlNkVVhPbUQzTVZnQ25qbmZqNmpTR2loRGxJeVA3?=
 =?utf-8?B?NFVmYUZKL2dqU1k1WUE1THNSNXlSYzVWdnJVdVBNV01qZUczRmR4dGQ4T3gz?=
 =?utf-8?B?SE1CTW9PQXIwbzJqU0VzWXhwYnhvdlo0VE10Ump5WWZKRUJXeVdVSnUwdnlO?=
 =?utf-8?B?VnIxZUJIeEdGV2dMRDdUcXdXQ1g2cnhuazlZRVJiK2NWY2pJaUkvQWZGTlJ5?=
 =?utf-8?B?VWdONC9mZjkzd3lCb1dJbnh3NjZSS2VLMmRDbFFWUGJFNU43NWQyTFpQRHVr?=
 =?utf-8?B?SHErWWNYWlJXVzNiZzNQQXIwdnh6eCtNUXRZZ1FoS0hLUnFqeU9YTzdxMlJJ?=
 =?utf-8?B?dTBwNTU5eXpGSTFxTG1xZTNsQjJzWXNzdkJ3OEs1SnM1ditzd0lSdzl6cEs2?=
 =?utf-8?B?VHo5bDNpcnlrOHFJYzFtNTVrMjhweUEzVHErMlFIY3E0Zm5CQmlub3NZeWo0?=
 =?utf-8?B?UThISmZFaG5lYlNUZURHMDM0Zi81bE1TdnBLV2hGbGgwWWVTK0dXOWNmWHo0?=
 =?utf-8?B?Z0k0T1lpTHZpU01xZlhpb3FaZGMvSXp3b0p1SGI4azdYRlBQbnQ4UlpBTysy?=
 =?utf-8?B?ZHZ5NE9NVERWUWJXY29Mbm8rL0JSTXZqTTBzTWdGY3pCQ2RZM2RkRCs2dVpn?=
 =?utf-8?B?S0plR1ludzQ3eU1TNi9zWEF4cTdNYTdUWUJiY0hBaGlBUVlYOU5lWjdKMTds?=
 =?utf-8?B?SGw2WThieDNoS2xvVDV2T1FYUEhnenRUTUliMzNFTWxuRWdvQjFMQVBMR05l?=
 =?utf-8?B?b24vSHp0eFVBcXJFOW80ZEhadjdEU29QejFqQ0Y2WGdieE05WWt1Z0M3V0tw?=
 =?utf-8?B?cG9xUlVTZHBiMENNVzJFUm9LZHBzRXdrU1V5OXhPQkxud0pQMGEwUkhTajgw?=
 =?utf-8?B?bVl1TkNuRDB5YmtjWkhkcFc4SWZlbE00K0VEK1pqYWd0Sk5BejdiWXNtdTJM?=
 =?utf-8?B?aEVqa1dNdEpvTmVRUGNENWNQWGJCdXBkUjVaQVFxZGlCVmp5TGVhOGtmbU1U?=
 =?utf-8?B?VGpWbmNHM2Y4ZFNvYUpWb1k1WjVMekw0eGo3ZEFINjFMRGJDSk1iMjNXZFZi?=
 =?utf-8?B?YmdzN3NzSjZhRXpDMG9PZ0ErcC9hZHU1WS84aUNIRy85Y0RHNUVJcDVjckd4?=
 =?utf-8?B?Q3pTY3RCR3VBQlNzV0RVUmFkMDVLWm9SM0hJVjNKdURzdDUySUNJTUZTaEta?=
 =?utf-8?B?WUp0RFdkajBzUEVYZE5raFBKTk9YSmFCMzhoY2lOeHg4VGN4b1daNzBkZUFq?=
 =?utf-8?B?NU5vRmVaa1p2b2d1Yk01VVhZWE40YWEzb3dOQXRPSkFyUTMyRk1IbW9vNHJR?=
 =?utf-8?B?NEM0b1l5MGNIWjlUYTYweWx2Qnp6WUQrdnAxb0IzSVFrcEk0L2xyQk5kRVhm?=
 =?utf-8?B?cTVJRFZNaWpSTmVxVEdXcmcxbnNBcktJZGZPRFp1ZXJTYkc2RDJZOGJSSHIy?=
 =?utf-8?B?QW1ySkVydVoyamtKaHhET2xwaFNGUnZjTllNNE5maXNqYUJrZjA1ZElGUWhR?=
 =?utf-8?B?ZGtqQ3l4UVdONE56bE1mWXkyUkU5REt3eWRoeHQ0YWpEOVFJSmpKNjNXWTRB?=
 =?utf-8?B?Y1lyMWFYU1RuY0pnR0loOXlrTmRCVHFRRHEzejFUSFJLYjlNSlg5bTdpam8v?=
 =?utf-8?B?cnkzOE1Cc2Q5dXE0djI2QXBRRkgrai9rSGFVY211RDMvSFhFeWtHQS9FNkFw?=
 =?utf-8?B?bG44RlNhb3crN0JFd0tLejU1MFJOUkowWDNEUVJwU0cwWmxPbi91WmpNK3JE?=
 =?utf-8?B?K2t3d3NVbm5BaXhRSVUyY1BzaXZwN200UVBrMlAycVpZOW54RFNtTm5zNUdx?=
 =?utf-8?B?MHc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29b577fb-37d9-45f4-fc27-08de074405e8
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 14:56:27.2650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O8UogbTmygZ0ulgzl+nDHSQEyZ2RgP7/ee7pCmNmE+z9GR9PtH5iUECU2Pk+bvIoUMt5LbksFwocen9/5yneh1vVfaTkUvsbcMa97qqBg8g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8440

Hi Jan,

On 08.10.25 15:08, Jan Beulich wrote:
> In preparation to add support for the CMCI LVT, which is discontiguous to
> the other LVTs, add a level of indirection. Rename the prior
> vlapic_lvt_mask[] while doing so (as subsequently a 2nd array will want
> adding, for use by guest_wrmsr_x2apic()).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> The new name (lvt_valid[]) reflects its present contents. When re-based on
> top of "x86/hvm: vlapic: fix RO bits emulation in LVTx regs", the name
> wants to change to lvt_writable[] (or the 2nd array be added right away,
> with lvt_valid[] then used by guest_wrmsr_x2apic()). Alternatively the
> order of patches may want changing.
> 
> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -32,7 +32,16 @@
>   #include <public/hvm/params.h>
>   
>   #define VLAPIC_VERSION                  0x00050014
> -#define VLAPIC_LVT_NUM                  6
> +#define LVT_BIAS(reg)                   (((reg) - APIC_LVTT) >> 4)

LVT_REG_IDX is more meaningful.

> +
> +#define LVTS \
> +    LVT(LVTT), LVT(LVTTHMR), LVT(LVTPC), LVT(LVT0), LVT(LVT1), LVT(LVTERR),
> +
> +static const unsigned int lvt_reg[] = {

this is going to be used by vlapic_get_reg()/vlapic_set_reg()
which both accept "uint32_t reg", so wouldn't it be reasonable
to use "uint32_t" here too.

> +#define LVT(which) APIC_ ## which
> +    LVTS
> +#undef LVT
> +};
>   
>   #define LVT_MASK \
>       (APIC_LVT_MASKED | APIC_SEND_PENDING | APIC_VECTOR_MASK)
> @@ -41,20 +50,21 @@
>       (LVT_MASK | APIC_DM_MASK | APIC_INPUT_POLARITY |\
>       APIC_LVT_REMOTE_IRR | APIC_LVT_LEVEL_TRIGGER)
>   
> -static const unsigned int vlapic_lvt_mask[VLAPIC_LVT_NUM] =
> +static const unsigned int lvt_valid[] =
>   {
> -     /* LVTT */
> -     LVT_MASK | APIC_TIMER_MODE_MASK,
> -     /* LVTTHMR */
> -     LVT_MASK | APIC_DM_MASK,
> -     /* LVTPC */
> -     LVT_MASK | APIC_DM_MASK,
> -     /* LVT0-1 */
> -     LINT_MASK, LINT_MASK,
> -     /* LVTERR */
> -     LVT_MASK
> +#define LVTT_VALID    (LVT_MASK | APIC_TIMER_MODE_MASK)
> +#define LVTTHMR_VALID (LVT_MASK | APIC_DM_MASK)
> +#define LVTPC_VALID   (LVT_MASK | APIC_DM_MASK)
> +#define LVT0_VALID    LINT_MASK
> +#define LVT1_VALID    LINT_MASK
> +#define LVTERR_VALID  LVT_MASK
> +#define LVT(which)    [LVT_BIAS(APIC_ ## which)] = which ## _VALID
> +    LVTS
> +#undef LVT
>   };
>   
> +#undef LVTS
> +

I know people have different coding style/approaches...
But using self expanding macro-magic in this particular case is over-kill
- it breaks grep (grep APIC_LVTT will not give all occurrences)
- it complicates code analyzes and readability
    - What is array size?
    - Which array elements actually initialized?
    - what is the actual element's values?
- in this particular case - no benefits in terms of code lines.

It might be reasonable if there would be few dozen of regs (or more),
but there are only 6(7) and HW spec is old and stable.

So could there just be:
static const unsigned int lvt_reg[] = {
  APIC_LVTT,
  APIC_LVTTHMR
  ...

and

static const unsigned int lvt_valid[] = {
  [LVT_REG_IDX(APIC_LVTT)] = (LVT_MASK | APIC_TIMER_MODE_MASK),
  [LVT_REG_IDX(APIC_LVTTHMR)] = (LVT_MASK | APIC_DM_MASK),
  ..

Just fast look at above code gives all info without need to parse all
these recursive macro.

>   #define vlapic_lvtt_period(vlapic)                              \
>       ((vlapic_get_reg(vlapic, APIC_LVTT) & APIC_TIMER_MODE_MASK) \
>        == APIC_TIMER_MODE_PERIODIC)
> @@ -827,16 +837,16 @@ void vlapic_reg_write(struct vcpu *v, un
>   
>           if ( !(val & APIC_SPIV_APIC_ENABLED) )
>           {
> -            int i;
> +            unsigned int i,

uint32_t?

> +                nr = GET_APIC_MAXLVT(vlapic_get_reg(vlapic, APIC_LVR)) + 1;

This deserves wrapper (may be static inline)
Defining multiple vars on the same line makes code less readable as for me.

>               uint32_t lvt_val;
>   
>               vlapic->hw.disabled |= VLAPIC_SW_DISABLED;
>   
> -            for ( i = 0; i < VLAPIC_LVT_NUM; i++ )
> +            for ( i = 0; i < nr; i++ )
>               {
> -                lvt_val = vlapic_get_reg(vlapic, APIC_LVTT + 0x10 * i);
> -                vlapic_set_reg(vlapic, APIC_LVTT + 0x10 * i,
> -                               lvt_val | APIC_LVT_MASKED);
> +                lvt_val = vlapic_get_reg(vlapic, lvt_reg[i]);
> +                vlapic_set_reg(vlapic, lvt_reg[i], lvt_val | APIC_LVT_MASKED);
>               }
>           }
>           else
> @@ -878,7 +888,7 @@ void vlapic_reg_write(struct vcpu *v, un
>       case APIC_LVTERR:       /* LVT Error Reg */
>           if ( vlapic_sw_disabled(vlapic) )
>               val |= APIC_LVT_MASKED;
> -        val &= array_access_nospec(vlapic_lvt_mask, (reg - APIC_LVTT) >> 4);
> +        val &= array_access_nospec(lvt_valid, LVT_BIAS(reg));
>           vlapic_set_reg(vlapic, reg, val);
>           if ( reg == APIC_LVT0 )
>           {
> @@ -1424,7 +1434,7 @@ bool is_vlapic_lvtpc_enabled(struct vlap
>   /* Reset the VLAPIC back to its init state. */
>   static void vlapic_do_init(struct vlapic *vlapic)
>   {
> -    int i;
> +    unsigned int i, nr;

uint32_t?

>   
>       if ( !has_vlapic(vlapic_vcpu(vlapic)->domain) )
>           return;
> @@ -1452,8 +1462,9 @@ static void vlapic_do_init(struct vlapic
>   
>       vlapic_set_reg(vlapic, APIC_DFR, 0xffffffffU);
>   
> -    for ( i = 0; i < VLAPIC_LVT_NUM; i++ )
> -        vlapic_set_reg(vlapic, APIC_LVTT + 0x10 * i, APIC_LVT_MASKED);
> +    nr = GET_APIC_MAXLVT(vlapic_get_reg(vlapic, APIC_LVR)) + 1;
> +    for ( i = 0; i < nr; i++ )
> +        vlapic_set_reg(vlapic, lvt_reg[i], APIC_LVT_MASKED);
>   
>       vlapic_set_reg(vlapic, APIC_SPIV, 0xff);
>       vlapic->hw.disabled |= VLAPIC_SW_DISABLED;
> 

-- 
Best regards,
-grygorii


