Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3B3CA9303
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 21:00:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1179414.1502916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRbyZ-0002OX-Cy; Fri, 05 Dec 2025 20:00:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1179414.1502916; Fri, 05 Dec 2025 20:00:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRbyZ-0002Mb-AN; Fri, 05 Dec 2025 20:00:23 +0000
Received: by outflank-mailman (input) for mailman id 1179414;
 Fri, 05 Dec 2025 20:00:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K96r=6L=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vRbyX-0002MV-Bl
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 20:00:21 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03ba8575-d215-11f0-980a-7dc792cee155;
 Fri, 05 Dec 2025 21:00:16 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA1PR03MB6671.namprd03.prod.outlook.com (2603:10b6:806:1c2::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Fri, 5 Dec
 2025 20:00:07 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.009; Fri, 5 Dec 2025
 20:00:07 +0000
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
X-Inumbo-ID: 03ba8575-d215-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OckyM6NU7ulgo+FzRNjT3odf7Qx2nMwadqcLGIj6PJ6YvVS5YgtnPAVinN2eL7wrg632LZPdJuTe1PVMUZyysx2m2Szz68RiGVrEPxNjdZLtZgoFcRpNGPajyxnPjCWP4E2jJ7zlKff1johxIupJYDIzu3IIZBcgpN3euzwJzwucloXpoXQC8ka/CN5texmNf4F05UpmFg80hK/emTL/lffLYfbJV3db/h/9NWelMQadLLHbF+Q/fhS+GCyEgAGa8VNOlUr6b1Hn9/o/raMc5PEeQn/49NBC4XnL4HFXtQ4g6dwjFZnF2V8NPKWHH106njZkCI/fb+B77NsPen1WMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IUYuEN88FCYSZ/MvD+Y54anxQGLQlHo4zz9YoEwoXXQ=;
 b=JmbAqqyePg0Kp7om4qsLKiAY3hEjw7p2IcM676Z17/ITrRbT2VDmFbyQVdLg58KhzWdWIBbdZ9hatwry6CpiXct9ML3ZROsrj5vwjZJbWtBRqUojhw/0bYfJZUGias812bggCnbVU8pHXp8tDwdEF8pW7c+QHlVTMtd7WOs6MacPUbLE2hoY370lw3lm4H9g1R8NeScqfCL048xlka8wEm36frjL+bESi0AsJvDB1cJAv3oYKbDYqGcQWyFv1e/EIEYAAC3iVr2LCoy41IgZDRz+kNqFF8yH/mjByudpKiaVU1lGkqAgJPL+4YYy/iB6epRPuw5PjPpxZMs50sO2sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IUYuEN88FCYSZ/MvD+Y54anxQGLQlHo4zz9YoEwoXXQ=;
 b=j70TRVFRY0gKyzOF4iI5G1pOm1ox53olhfZAZp2m2s+cAIV7ljwS5Vv/LnusIcSySvC6GbQKZ1uFnOks8gKtJdlS3GqYGNjFHYYkkM7mXTI4487250HWz2PDrxjT0RqGV1KjJ8P0UhJ3zPuHiVXpo06518g6IbrKZSpMARoQoWU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d9a632d1-8587-45bb-bc13-8dab8d346cb2@citrix.com>
Date: Fri, 5 Dec 2025 20:00:03 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Victor Lira <victorm.lira@amd.com>
Subject: Re: [XEN][PATCH v2] coverage: extend coverage on .init and lib code
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251205193411.1368659-1-grygorii_strashko@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20251205193411.1368659-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0027.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::15)
 To CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA1PR03MB6671:EE_
X-MS-Office365-Filtering-Correlation-Id: f5aa73a6-b698-419f-33d0-08de3438e35e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UldRVDhKTEZLbFFyVWQ3UTNlM0l0NVU1cU9GN0hodUY3S0djWlJpam9JbXVp?=
 =?utf-8?B?eXBkbmhNUlpZaGNWb2VjMFZGeVdUSm9qSFBUdjNweWV0VS9Ua1lGWXRYOVJE?=
 =?utf-8?B?UlN5UlRZbWJaRkxkb1lLaUxndXp2QWJBY3hsdU5kK2l6ZFdhc3NDSExTMm4v?=
 =?utf-8?B?ZEtSb0U2Zk44cUZiYmxEQXg2N0NCUkRxVzdtaXhhWXZaTy9wLzZFSDFneFdQ?=
 =?utf-8?B?b1ZmQy9GS3ZZTkhERE1ReHlYaUtNUnkveHV4ZjNoQ0kzVHJOQU12ZElBRVdT?=
 =?utf-8?B?eDk4RDhMVCtzblh2eWdnV2RhMzJQY1pxWG9iOTRxZjkxQ3F2dVI4bUx6N01T?=
 =?utf-8?B?RkdYV3A3RlFkbFVuUFJ4ckxIcm4za2Z1aTk1d253UTlBNDlxY0lpTG9jQm1O?=
 =?utf-8?B?TXBOQkcyQlhLVENtZWFFR2R2dngybTJOZ2RQQUJLYnU3U3g2T2RkcnAxS0xW?=
 =?utf-8?B?WWRBSG9BcHdicWs2Tjh0OUJ5NytPZWc0R05MWU1OK3dLbjNsbUx1TXFBNzlS?=
 =?utf-8?B?bWFZWDRpbWJYRUtaaG9Sa3l1Ry9VQW5NTFpvNktRUjMrOFBOUEdhREdwaFFR?=
 =?utf-8?B?NjQzVk9USStlNGJCc1cwZHlRZUEvdit0UDdkK1JFSFQxOXhKcTNRa1lORE1s?=
 =?utf-8?B?Tm9ySnlKSXJwUU9SR1JQOHZMaEFSOEk4c3BrOVRsd2FkV2JWbXZzb1VRZXlP?=
 =?utf-8?B?TDE5VlRtckNYKzk3RGNKSHR5Ynl1VVpWRWpUaGlWeWZKNFo1eEEzYXJVMWlY?=
 =?utf-8?B?cGFvaDk1TC9vUXhjb3phVnJEMTdEcC9nNmQxaWlQQ2ZhT3lxZ3RTKzdvekpq?=
 =?utf-8?B?b2pFR3NRbUlqRk5la1NjZ1pRd0cwam1jMDJJMi9jOWc1UUpsNSsyTmtUejY0?=
 =?utf-8?B?NG01a1NTVFNvOENSdnJERyt0MU9UdCtoWk1LSTRwOTc0Y2ZhV29FZ1dJaE1y?=
 =?utf-8?B?M2ROVDB6UWFBbmt6eDNJREFQRG50WEs1bm42WDNoZkFSTUVrdThqK3ZYbjJY?=
 =?utf-8?B?ZWhTQnJXVTFkUjBPUHRoSnd4bTNKUUN6Mi94K01rK3lCdlFlYk9KbUR0VGhh?=
 =?utf-8?B?bkorL3lrNlhxZmJCdHk2RGR4RkR1OVF3Qko3dWtYczVadzFkb1BkTVlUWXlO?=
 =?utf-8?B?cHhjbWhMM3ZuUWxTSmdFWlE2S3AzZG4ycHoxZmVXZ1RVS1A4R2cxWlNhVnUx?=
 =?utf-8?B?ZDhBei9lYkR5VFUzTktMbFYrQjZ0WmUzUVprLytlUG0yNVZQV3RXa2tqMUdp?=
 =?utf-8?B?VjZIY0VPeVowbTBpUmliMllDZ2xHWlVHZWdhbGJBbjB3SWN5WEpMSllyQWdj?=
 =?utf-8?B?ZFM4L2thWW9KTkR6WDFiem5FQU4zZysxZ0dMeVdVb3NmNFNsUWlTQUlpTkRS?=
 =?utf-8?B?RkVEUHNNYW03Q0JPNzZYS1Z0U1dGeEZHVE1qZW14VEJaWHNGdUI2S3gwWTlT?=
 =?utf-8?B?NllkNzAyVU5rTWR1TGdHTmxJMmtNQmxrdTU5U1JyMG1UWjNNYU84a0ZxQmZU?=
 =?utf-8?B?RytqNE42SEt5dS9yY05SMmtpemRoS0FpSUtMbGcrUm0vVkQrb2JsaGNQUFBw?=
 =?utf-8?B?UHF0VG43cmFscVp1TlBKZ0pYeDRHK0dTSEhIeUxvazlZZnZOSy82YUhmdmQx?=
 =?utf-8?B?K1J4QmdQcTBXWmRmTWFHZ0RTdGRiM29lOU9TRVVuWWlWbnhvSEEzMmN1TWhT?=
 =?utf-8?B?T1lSWTRROW15UkJzYVA0Um5HRkhqOU43TGtiYWZSLzM3elY4bWdJeXJoN0Nr?=
 =?utf-8?B?QldwSnJYLzJVR1hBaWJsOHBLVEJmajd5d2N3SXhNZ0xXYzcxaVZ6ZnhxOGkz?=
 =?utf-8?B?ZDdBS1lHbCtRN1FHckx0T2Jxdy94S3VXUlMyZWx4UG1IZHp5MSttN2hEb1dp?=
 =?utf-8?B?VTg2Vy9lV0NaRjBVcW13d3dVTWFEU2c2ZkFpOVRCdmhGb0ljUFpvam9wWXQz?=
 =?utf-8?Q?8GuwH/fffOsDU1pclVyUv2g3k5mOaYf6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWI1TFZXVGFWOFdFOFZRc2F2dFVEZ2h1eGdOQU8vNlhiMFFGWnR1WGVlRlE3?=
 =?utf-8?B?enlBakgrc3FEK1ZGTUJaSEdtVTlFMzlUM1B0NTQ1ZllySlRHQjNVQldDcjds?=
 =?utf-8?B?V212TnJQT3VnSGw1bUNiVVV3MFJtajFVYzRsT1Y3bWJ3bm5HSm9xSDVSSXNG?=
 =?utf-8?B?eTUxNlhjRlRpckJLTmJPMzNIWDVJeW5xTnFYcmdoYUdmTXpUY0VQK042OEtJ?=
 =?utf-8?B?OXhNTlF0Tk45YkdLRXJxRXBkVy9lN1llU1J6SUl0NXVRemFzSDlSOVZGclhV?=
 =?utf-8?B?TjJrWmMzcTFZTG93RVJwWDZISkErU3h2ZHpxU3RZQTV5UDEyWUxyTU1OU3BY?=
 =?utf-8?B?WGdnaHBwOURYRWJ6QjBrb1RjMS9TemxkbXZMVHRKaXdPRDJOYlVyNmtzNUhE?=
 =?utf-8?B?UWk5ajNkcXVmbkxjQTV0VzdiSXNKb3lXbExWcnJlaTRrMTBTTEo0Vm50OW50?=
 =?utf-8?B?aUhrRVcrNmpEYWl1bWd2dFRiYzhVbi9Fa0ovaDYrMDBZNDJOem82Ly9MZ0Q1?=
 =?utf-8?B?eWVYU29VS29FRVM2V1ErV1BWZFV3SE56S015TGF4c0NPTmdUcnZRL3c2MnNp?=
 =?utf-8?B?UnBrajI5S000ZFVHMmVhZFBlUk9sRGZGZU56WGloU0l3SS9OQ2pKbnNlOElX?=
 =?utf-8?B?cXNiU3pKSEtjcWs0Q3ZLbTVHdE56REcwRmpuOEJrQ3N1cW5SaDduK1dOdXJF?=
 =?utf-8?B?aHpyR3RrdjNSeGNESnNNblB6YjBtNFBtN1MvK0VYL2t1alFSMUhOdzlGK1dD?=
 =?utf-8?B?dTdGd3BnNVc5LzJzTC84N0dJRWFGVW1Uc1lVbm5tZ0hscDk0bkZDWHVGaCtU?=
 =?utf-8?B?MmZLYVJlY01BVlZSUURZd0ZxNkVjUHV1ekJqMXJIS1hJUkN4akJSaG82WGtN?=
 =?utf-8?B?QnhuWUh3YThaQUYycmNzek8wZCtyUFAzQnZCeDlFdjg3emh1eE1oSWtaR1dV?=
 =?utf-8?B?SGN4WjJCU2k2NnpncHVMekp6YWdkYksyaktjYWV4cnZCWWExT0JYaDhZeDFV?=
 =?utf-8?B?THZFRGRiTnZUN2krcEtwMXh3T2FzaUJYTTc2dCtsd2pLMmhZRm5IaSsraVpV?=
 =?utf-8?B?endTOFEvaG1HZHJwc0ovaXU2S3VJdVRtMEhNaDJkWlEwNThacW1oRloyajYv?=
 =?utf-8?B?M1dva3VzZWlKaE1WdG5seFpsb0R2aU5Kemp1V0V5T2dsQkltN25oRkd1d25o?=
 =?utf-8?B?VkJRM0N5SkROL1BldlYxM2d0V2RSMjl0M09FY1BiVXFUNytXZVJINkFUODVW?=
 =?utf-8?B?YVl0VUlJZTAwbGxqb09LazUreE5DWFFHOFl1MzZqUklKS01SVnZxcUkwQ3F3?=
 =?utf-8?B?emU0cWFheFFqYmdaR1Awc3lNZHYwS2trNm1aTjJMdWhMKzdyUmpDdVdlalhH?=
 =?utf-8?B?VVVBZmJHUXFtb1ZPUittSDJYUGN4SHNiTi9PVVpKZVhxdk1JVkFWb21WTU1a?=
 =?utf-8?B?eTBqcDRzUnJ3eEt3MWZBOHhtajhNZEd6Y1d3OGJNdXBBWHl5Y0pnNTlZNmhY?=
 =?utf-8?B?cjZXSTBGTzJrNWlxTTRmMmZDNExlSVFKTlFic3pQdFJqTVk0ekRicEgyYUVo?=
 =?utf-8?B?bER0SUtrK3gyL01yUnVpa3hBWWNVU2JpNVd5Qi96dUNXVzF4dWxwQndWUEMz?=
 =?utf-8?B?YzlaMUx5YVNyajM3R3JQVHE5Ti9Yd2hBcW8rSUk3SDNYRFFoMW8zZW5KZ0g2?=
 =?utf-8?B?cXNub3E3RWhSTW0rd3FKeWdYN0svdjljU1g4NXJqOFdFY011ZFUvY3VBdXJP?=
 =?utf-8?B?SmpsVUE4QnJaQW5sZXBKbCtuRTZqOUZRcE1jNWcwQXpmOWovZy9Pdlh4bUhm?=
 =?utf-8?B?eEpHeU56dVJLVThhblFicTZOOG1LaVptZEJKN1VxZXZjQ0hoWWNsU3g2dzZG?=
 =?utf-8?B?ZjNmVlBmdHZrREJ0TDdVQ1oxME9JeHJHcFNJRStueG9XZ2pYVFJvQzA3YXFX?=
 =?utf-8?B?b2FZbDZLNHpuTHUrQkVscnQvRytFWXdPY0p0Mmg1aEtCTXNBMDJ5QzFtU1Bl?=
 =?utf-8?B?ZlhRWGtVVFRyaE45TmFIUURrckNYdXJRcTFxRk85TmwvSE05d1hFdjdublVC?=
 =?utf-8?B?bCt4cytvdUdFOW90MHl4VFVmSkhGbVpqbDdxNkYwb1cwSkxWd1g2OXJwMzFu?=
 =?utf-8?B?QWpaVzVHT2JRaXk0UENNWitLT25qL2x2ck5TQnhvdkRTTlcvMWZKMzB1Tnc1?=
 =?utf-8?B?d2c9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5aa73a6-b698-419f-33d0-08de3438e35e
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 20:00:07.2136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7NBlG5hqKmk9E/lJNpD4DwHmZxNnNAj6/7qnk3/7c692l1mn767L52RjqsPGFyYalxQR/2rBpEuxKLzoGSV776WbFUKrk97/gcGB2UyjFMY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6671

On 05/12/2025 7:34 pm, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
>
> Extend coverage support on .init and lib code.
> Add two hidden Kconfig options:
> - RELAX_INIT_CHECK "Relax strict check for .init sections only in %.init.o
> files"
> - DO_NOT_FREE_INIT_MEMORY "Prevent freeing of .init sections at the end of
> Xen boot."
>
> Both selected selected when COVERAGE=y, as getting coverage report for
> ".init" code is required:
> - to bypass strict check for .init sections only in %.init.o files;
> - the .init code stay in memory after Xen boot.
>
> RELAX_INIT_CHECK/DO_NOT_FREE_INIT_MEMORY could be used by other debug
> features in the future.
>
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> ---
> changes in v2:
>  - add RELAX_INIT_CHECK and DO_NOT_FREE_INIT_MEMORY, those are two different things,
>    both potentially reusable
>  - enable coverage for libfdt/libelf always
>  - enable colverage for .init always

This is a lot nicer (i.e. more simple).

But, I still don't know why we need to avoid freeing init memory to make
this work.  What explodes if we dont?

> diff --git a/xen/Rules.mk b/xen/Rules.mk
> index 24f447b95734..c884a4199dc2 100644
> --- a/xen/Rules.mk
> +++ b/xen/Rules.mk
> @@ -145,10 +145,10 @@ endif
>  $(call cc-option-add,cov-cflags-$(CONFIG_COVERAGE),CC,-fprofile-update=atomic)
>  
>  # Reset cov-cflags-y in cases where an objects has another one as prerequisite
> -$(nocov-y) $(filter %.init.o, $(obj-y) $(obj-bin-y) $(extra-y)): \
> +$(nocov-y) $(extra-y): \
>      cov-cflags-y :=

This could become a single line now.

> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 22e929aac778..2a0b322445cd 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -69,10 +69,12 @@ static __used void noreturn init_done(void)
>  {
>      int rc;
>  
> +#ifndef CONFIG_DO_NOT_FREE_INIT_MEMORY
>      /* Must be done past setting system_state. */
>      unregister_init_virtual_region();
>  
>      free_init_memory();
> +#endif
>  
>      /*
>       * We have finished booting. Mark the section .data.ro_after_init
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 7bbba76a92f8..280085c206a7 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -815,6 +815,7 @@ static void noreturn init_done(void)
>      for ( unsigned int i = 0; i < bi->nr_domains; i++ )
>          domain_unpause_by_systemcontroller(bi->domains[i].d);
>  
> +#ifndef CONFIG_DO_NOT_FREE_INIT_MEMORY
>      /* MUST be done prior to removing .init data. */
>      unregister_init_virtual_region();
>  
> @@ -837,6 +838,9 @@ static void noreturn init_done(void)
>      destroy_xen_mappings(start, end);
>      init_xenheap_pages(__pa(start), __pa(end));
>      printk("Freed %lukB init memory\n", (end - start) >> 10);
> +#else
> +    (void) end, (void) start, (void)va;
> +#endif

For both of these, the preferred way would be to use if (
IS_ENABLED(CONFIG_DO_NOT_FREE_INIT_MEMORY) ), which removes the need for
the else clause in x86.

Also, you make free_init_memory() un-called on ARM with this change. 
Depending on how the freeing-init question lands, you either want some
extra ifdefary, or the --gc-sections option that we discussed before.

~Andrew

