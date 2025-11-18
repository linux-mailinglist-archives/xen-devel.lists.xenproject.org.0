Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D892FC6B84B
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 21:05:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165348.1492137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLRw2-0006Rd-Jv; Tue, 18 Nov 2025 20:04:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165348.1492137; Tue, 18 Nov 2025 20:04:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLRw2-0006Pd-HI; Tue, 18 Nov 2025 20:04:18 +0000
Received: by outflank-mailman (input) for mailman id 1165348;
 Tue, 18 Nov 2025 20:04:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YPWA=52=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vLRw0-0006PR-IZ
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 20:04:16 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c17e2274-c4b9-11f0-9d18-b5c5bf9af7f9;
 Tue, 18 Nov 2025 21:04:14 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB5893.namprd03.prod.outlook.com (2603:10b6:510:32::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 20:04:11 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 20:04:11 +0000
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
X-Inumbo-ID: c17e2274-c4b9-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UIfcaOTo6mqMyi83wZX6MXWotk6GIry5aJfxEwbeMai1jUkdYJUl3I2JaSrcAO8h0d9c9l313mJhDk6hfAnOV9TnDt9flLsKrk6z3n9E5hzhXSZY0OjV6a4xF+XEyVd/kLJCLx+84IpNx6nq96UwBlgMF0k+Da9nwIijqsYfISm3yQY21oo3tnT++YRZ9MzDeoQAPm7lrHlgMtjR6mFSMDN/X3lBq32vh5yJiZ/ErlPic71su9cr/mN9+Z6h98ScckfQVfgdi6wSzDNF5WPxFh1uFz2oSWEjU8bVIp2MsAR8GUCRg2e2sn4KUw9sziRXc7VnwSnP4h/ay9VOBdc5Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V9dGiNF/p5EYeNIFPFeELI6d+3PghBrckP1uP+zCuQo=;
 b=tv1RyiSH5rK1K3xHqVkpOpXujuKFTalZWGZ1p9DHPCoFziOEJxZtHaBystpz3EFRDJuxqNq+JJbAppqND37HrOb+B1I9i+ri1i3DfzTgYEAWwKKHXNjIZDYL8CK/YKiYcf0CWprLnDb99YuSxOMOzFyHkIuEc0jnaipxuAIapqDCKEE50gg/Bfi8cvd0J0pPyD1GfIfejDs61Me+Me0mGceijmQYOP75UVRw6IWPvnFYq3wLN7UzBuY0TWnFjULco1qDDSmn/2C6d8YVsGtxPK3wcwGaNFIFbFslMYfwuW2nSUQ0lM/E0CrOggm8g2UIKFM5eNeItLd0KwYXvRaf7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9dGiNF/p5EYeNIFPFeELI6d+3PghBrckP1uP+zCuQo=;
 b=wpPDxSkhXYBdmx6iPa2Hl1nuQQqC+kcYUcMcdP1Zh5aX9jZP2LL0NlvFcb21ZpkO21NciZuyIRZ6OgPGab6cpESwEJdPBIOlcnmYrdm5R4iMHhofP/ycLHccitZYG9JrIHFRwvIHpT2YC2bSpurV3qME3Fg1OIMav40YSAbmHeM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b57c2fc2-d302-464d-aaf3-552da0114bb2@citrix.com>
Date: Tue, 18 Nov 2025 20:04:01 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] x86/cpufreq: use host CPU policy in HWP driver
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>
References: <53ef6c9a-1115-4bb4-bb7f-e2595ab9d0b6@suse.com>
 <c0ed26a0-6e34-4aab-ad7d-44b9f596b1e9@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <c0ed26a0-6e34-4aab-ad7d-44b9f596b1e9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0541.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::12) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB5893:EE_
X-MS-Office365-Filtering-Correlation-Id: e94df038-c066-49f1-a5b6-08de26dda3ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WE9kV0FNTEwrLy9WcUtnSjRrbS9aUU5kU1RuVmtIMVZZTGNoYnhEWm9SYVQw?=
 =?utf-8?B?aGxsMnN2eEU2YTFIaHVWZ2NMbnlvelZ3dW5ObzFobjR4dFJFMk5ScjB5ZTBX?=
 =?utf-8?B?SnBLdmdvL1Q4Z1JoOEh1V1g3YlpIaVVha250WHA2dXQwcXB1ZDVaclhVOSs5?=
 =?utf-8?B?aUtrc0FQaGs0Tk8xdE1QQXBJdGpYL2NZa0taZElSdGQzR28wZmFRWFVHbzlX?=
 =?utf-8?B?cTdDNWM4U3hxOHNEeVVmN2ZjOTJTODlKSllVU0lDZTRiZDNlUGxBNy8vejdr?=
 =?utf-8?B?ME05d05IcXlvV3N3V3BwSUdjZFY3VXNCOVJOOVk0QTYxZmREWTJobEhtS1Q4?=
 =?utf-8?B?ZjJQd0huWm1JOS9heWxsNTdlcm9tZTAvTDRSK1hnNTNNbDRSSU1HcmtsMW9B?=
 =?utf-8?B?T0h2VDFhdkdxbGNHQ1paOCszNmxrdFhmMjRjU3ZibUVqS1hEeDI5cjJ3Q0JC?=
 =?utf-8?B?S1BTNWZtSllsQ2ZTYU1CbXVXNEQvVXZGcktCS3djQ1U1Z1N2a2ZucnNZYmUz?=
 =?utf-8?B?YjNFVGw0NVNvT01vajJndEtxdUtNRFhuTmp1SWpiZFRiOUdSVGh3NnkzRWFP?=
 =?utf-8?B?Q3BsckZRclJRampxczVBVlNoOUlyNldtR2I2UVlGL01yeVZHMGFyRDM0ck9q?=
 =?utf-8?B?OGJndnNwZmRGTXdBaHpaZXVEd3FCTmlTcHlpUlhhcjFzTDAxWmxQNjJ6TCtO?=
 =?utf-8?B?WFVvYmdkRVdMN1VDcit6dUZBb05LbFFTMjFmMXh0TEFRaVU0aXRvdW9aTEwr?=
 =?utf-8?B?eWVNWkppVWNvZkxUaDJUdWg1T1BuNlVaYnFhcitBbW8zTnI0WVRjVjNEd25p?=
 =?utf-8?B?RUI1aFhOTXlMbzQvRlJkWk0yRXlvK0U1K245VnUwY0c0T0RSR3RvN0kydndo?=
 =?utf-8?B?Z0NHK1FQNVNMSmg2TWhPck5OWmNkZlY3UExrb2ZSYTRXNkJ4QUNtOVJhUita?=
 =?utf-8?B?RFFHNDA0ZUNpd0xyMmZKS1JnVTQ0ckVqVmZvRXl6eGF0R0tFdEhqVEFtdHBC?=
 =?utf-8?B?VGY0Zzc3Tk9RQzRRUm9zaUZIdHVXMzRiN0ltb1RzNWZOekhEcWVaazBHTkhu?=
 =?utf-8?B?MEcyb01JVzhxM0FzdXN5N2xVSGduaW9PNkxHdmxnNHV1b0lieVQ5UGNRT2Jv?=
 =?utf-8?B?a0FGOUJPYkl4Vm1aSWtnK3gwU0RKYU8rRTJBTDMvOWlJRWpITk00dGJLa0tw?=
 =?utf-8?B?WlozZEVhc0lxNjJOazFlNDUxU1p1YmZ3M2hKWWtraGE3eEZuSzRDd2tCUWg4?=
 =?utf-8?B?bFN1K2RzR3NERTFZWFROaGdWOGZ5WlN5SlY3cjlQcHFDemFsVFBUeGtkMTND?=
 =?utf-8?B?Z0ZWY0Z3aEJyc2hQQzl6ZEJOMmh3emllMU9KQ1RlVUF4VmI1SGUvOHNIN0x3?=
 =?utf-8?B?MDI4azJSaFg3Q3doUFl4R01ncXkyN09zNys3a3RDRkdKMmVzZzBCN0puL1Jy?=
 =?utf-8?B?VkIwWDAwRmRDYjllMXowdVNFc01XUnBuMy9nV3QxNnZYb3A2RTl4akFCVCtI?=
 =?utf-8?B?elV6amttWXMwTnV3N0VLd1VUYjlJcnB0RzhNcVl2b0hweFUvaUxHZUlPMUFv?=
 =?utf-8?B?Ti9zbFJzNlc3VW1MeUtGTWp0YVZPSnlZMXJPT1ZVL0RSWGdlNWJPUFVqbmlX?=
 =?utf-8?B?QUp5dFRLN3gvUWk4bit4UFlISlVZdnlIWkd2dnlkUnRFc09KNUdZejRxQ1RC?=
 =?utf-8?B?d0xVZmtJZ2dhVjlvM0xJOTdMS1A0UG4veHRUOHQ0Zk0zSVNoaWEyZ3JIdmZU?=
 =?utf-8?B?bWllTHRUeU10SlAxNXY0Tit3SXZubE5paGJXa3ZJR2tEUndVZ25IeEgrQlc3?=
 =?utf-8?B?NFZVaFFRZGsxZkVDUlNqOU9GbmhWbkN1c3ZxdlNXRDhKcXFUWmVySDV4emRE?=
 =?utf-8?B?cTdQQjJpNXQ3SVEyY1RkMklSVHVOcmxOczJPVW5RVFdzazBCNW9zRTdBZG5l?=
 =?utf-8?Q?91uu+sC2OQ5+tNQbnQKBc4bCPBLyhKDa?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rm4vaGxoaG5ZZUh5ZVVkMWZxblV0dVVvb29lV0pSYkxEcjM3OTlCbDM0SnhE?=
 =?utf-8?B?RzNxSVM3eFhnNVBUdXd1WmE1SWsxMG9tQytPTFJ5d0Y5dkZadk5lZ0JqTEVw?=
 =?utf-8?B?NzNIR2Q3UE55blFLRWxWdnZZS2pUNnlYaVVvY0V6OVRvUUI0QlVnOHd0L3BK?=
 =?utf-8?B?Ly80alhudldaK3ZtN09Vb1FFVGdxV1ArWDR3L2VvTHYybkFrY0ZYTVp6ZUg5?=
 =?utf-8?B?NkQzdUUwYkdnZ2tRVDNHeWF0RGd4TDlveVZ4R0FwQnd2OXNyamRMOTUreWdJ?=
 =?utf-8?B?am5LNFJZQ3JyWElpdmhOSWIxWGhNcUU1SmZxUE80NkhYVGdDTmNxRjFycG5h?=
 =?utf-8?B?ZXNrTUMzZUdQQWs3V211TGVvdEtiRTVDVlQ2RzExdm5HaHBVVDdiUjM3WXI0?=
 =?utf-8?B?cDZjYi9UaWovMEhlUU9oYkxITjU5VjIzelNnRGpOZjdVL1g2eDluL2preW9C?=
 =?utf-8?B?TUdJYksycnFzc2cwci85azdIaHMxOUxmdWJkamxXaDd6LzlXNGpQWVQ0QXRF?=
 =?utf-8?B?eTR4WHZMTWpZenNqa3FZbjFWSSt5aWZUM0lYUUJJQmp4NWFGR2pWTmtIUEh1?=
 =?utf-8?B?dzlYWCtNZVpDcmd5OEI1eHpTMTl5czVyN0xNbDdLbXk5ZWIvVlhnbFpPM1pq?=
 =?utf-8?B?a2M0ZnU4d2xBVWYvVU5iQmd2N1NiZ0l5ZTMzbkJmRHRMQWgxODZNREgySERz?=
 =?utf-8?B?b0VuazBnWFJXRFROR0JHa2paTmRFZ0dZRnE2V0xBVFVGZkNaWUpycDJkeC9m?=
 =?utf-8?B?WXFXc0RNckZ6dWNhTTJqQkFwK0xwWnJ3SzNtQW5sdkNSYlNxYUVnZXZ0VTJn?=
 =?utf-8?B?THRiYUx0V2ZVV3krdTluRFI5WHVCRWpZbzdubTFFcXVMRC81ZlhtdGg3bFhF?=
 =?utf-8?B?K0VHWGJFdWVJTGtUQjd4UFBpOXF2TGpjbFdyM3RsWnY2V0YzaTdRaEVWWjk0?=
 =?utf-8?B?dXZEZnN1TWV4eHNtVEZtbE5ITUNKR3FXUE0yclZ1YVRZNGM0V0tPbHpDU1lp?=
 =?utf-8?B?RzVjaXl3WGlPL2ZTZS9xOTZYS1dGNExZejJCdGVndmQvUGt5eW56TG4zSTVX?=
 =?utf-8?B?Q2NSRUJRd0FvbjNpb3JLODZjSmhBM1Y4NG5KcFZnZitlbEFiQ0dsWUdiV3JI?=
 =?utf-8?B?bjg1K1FDNVd5MzlkUU8xYWlPOW1zK1BIM0pjWlpySEdVS3RyTmw0bUx1VVZl?=
 =?utf-8?B?eUM3YWcwaGNaUE45R1pSekVxZmJEcUxObEpzcjVuYyt2eWFzeDREajVLZ0J3?=
 =?utf-8?B?UFZkQzFrUDdoYThuVmxkazNFWWoyNjJWMU9zN01qVWxkZlFjaDd3RVFLZml0?=
 =?utf-8?B?SkE5ZHpDdjdJRjNuQU5oMEtIaHNEblhMeEVrZ2tHYXlKTC85RDhQWWV1OCtZ?=
 =?utf-8?B?UmwyQ2ZiQm5oajZWaXdjWXRsc28vQ01tdFI4TVB0QnppRFRWU0J0TkNScVZQ?=
 =?utf-8?B?Z3ozTkRvOWIwR3JJL1lYdXFYSVIxVXBhd3F3TjlxeG1mRERVaGpReG82V0Jl?=
 =?utf-8?B?bG5vNjFBSXpudS8xWkd4ZktDSENlY1lHL0dtRFBmb0l6b0NEd1I2L05VOXdL?=
 =?utf-8?B?aDNkcHM4bkQvYi95RW1aNUlUUVRmVGxMVFFVTE9EdTRBazlXelJ1SGJZSmMv?=
 =?utf-8?B?eUZud3JvWlRHQVJjVW9VdDFWWkVITVBuMHRoYllCN2dFUFpYR3NRTGVuYi9s?=
 =?utf-8?B?aFVuR2Z5eWhnc2VqVFFoTHRkdHk1NkxmS0RxOStYeHdCcjR1Z3pNcUx4N3FM?=
 =?utf-8?B?NjE5ZThoQ25XMVVia1IyWi9md3JKUXdXM3VZd0VDc29DU0src2lra0RHYWhU?=
 =?utf-8?B?aXlZQWhUT1NKVzZHc3BlQVlBcUxJOEVZemlnSWtod0IyL2RvSnJqK29FM1BW?=
 =?utf-8?B?NUl6QU84V0ozREkrQWRDOUdtSFJJR1p4cVovVElmd1RSYS9tbmFLeXJSbWNj?=
 =?utf-8?B?UlhHVDEyemdyZElmeE5wOEtIQXlETXI3cWZYM2lKaDNVb3k5aUYyak04Rnh0?=
 =?utf-8?B?c3kxYTczMGVKcGV0NUZzdWVYM1grRGNDWW9rRE8xY2hmZk9zQ0R6OEg4YmFK?=
 =?utf-8?B?WlZjSlJNUUJPZ2RnWWpLRUg3OFgzcnVVMDNYbk9qSDd2VjVVREttdFRhREdM?=
 =?utf-8?B?SzBjUExzM1BkZlhDbmZSRmJPTURkL0VrUCs0WDBXbFNOSlNhWGUyY1ZTTllZ?=
 =?utf-8?B?TGc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e94df038-c066-49f1-a5b6-08de26dda3ae
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 20:04:11.0443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9mbuyMVZEO8h1jOPXV3NwAJSjP0zOROjG4Kk/Z+MAah+BVPSF3bcgRzIUo7FQiGcRkYS54KejAjlHfQ2qkHgAcR1v1Uwk/XkGqJN0PDR6EQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5893

On 18/11/2025 3:09 pm, Jan Beulich wrote:
> --- a/xen/arch/x86/acpi/cpufreq/hwp.c
> +++ b/xen/arch/x86/acpi/cpufreq/hwp.c
> @@ -183,29 +178,25 @@ static bool __init hwp_available(void)
>          return false;
>      }
>  
> -    eax = cpuid_eax(CPUID_PM_LEAF);
> -
>      hwp_verbose("%d notify: %d act-window: %d energy-perf: %d pkg-level: %d peci: %d\n",
> -                !!(eax & CPUID6_EAX_HWP),
> -                !!(eax & CPUID6_EAX_HWP_NOTIFICATION),
> -                !!(eax & CPUID6_EAX_HWP_ACTIVITY_WINDOW),
> -                !!(eax & CPUID6_EAX_HWP_ENERGY_PERFORMANCE_PREFERENCE),
> -                !!(eax & CPUID6_EAX_HWP_PACKAGE_LEVEL_REQUEST),
> -                !!(eax & CPUID6_EAX_HWP_PECI));
> +                host_cpu_policy.basic.pm.hwp,
> +                host_cpu_policy.basic.pm.hwp_notification,
> +                host_cpu_policy.basic.pm.hwp_activity_window,
> +                host_cpu_policy.basic.pm.hwp_epp,
> +                host_cpu_policy.basic.pm.hwp_plr,
> +                host_cpu_policy.basic.pm.hwp_peci);
>  
> -    if ( !(eax & CPUID6_EAX_HWP) )
> +    if ( !host_cpu_policy.basic.pm.hwp )

I think this justifies a cpu_has_hwp like we have for turbo/arat/etc. 
Similarly for the other features.

>          return false;
>  
> -    if ( !(eax & CPUID6_EAX_HWP_ENERGY_PERFORMANCE_PREFERENCE) )
> +    if ( !host_cpu_policy.basic.pm.hwp_epp )
>      {
>          hwp_verbose("disabled: No energy/performance preference available");
>  
>          return false;
>      }
>  
> -    feature_hwp_notification    = eax & CPUID6_EAX_HWP_NOTIFICATION;
> -    feature_hwp_activity_window = eax & CPUID6_EAX_HWP_ACTIVITY_WINDOW;
> -    feature_hdc                 = eax & CPUID6_EAX_HDC;
> +    feature_hdc                 = host_cpu_policy.basic.pm.hdc;

Looking at how feature_hdc is used, I think it should be the bit within
the host policy, rather than a separate boolean.

The host policy "is" what Xen is using, so if the HWP code decides it
doesn't like HDC, then that does want reflecting.

Unrelated to this patch, but as I've been looking at the code.  What
happens when hwp_init_msrs() fails on an AP?  I can't see anything which
unwinds the initialised HDC state on the prior CPUs...

> @@ -365,7 +357,7 @@ static void cf_check hwp_init_msrs(void
>      }
>  
>      /* Ensure we don't generate interrupts */
> -    if ( feature_hwp_notification )
> +    if ( host_cpu_policy.basic.pm.hwp_notification )
>          wrmsr_safe(MSR_HWP_INTERRUPT, 0);

Again, unrelated to the patch, but why is this a wrmsr_safe() ?

If the feature is enumerated, the MSR had better work.

Things like this start to matter more when we consider the code
generation for wrmsr_safe() using MSR_IMM.

> --- a/xen/arch/x86/include/asm/cpufeature.h
> +++ b/xen/arch/x86/include/asm/cpufeature.h
> @@ -115,14 +115,6 @@ static inline bool boot_cpu_has(unsigned
>  }
>  
>  #define CPUID_PM_LEAF                                6

Doesn't this patch drop the final user?

~Andrew

