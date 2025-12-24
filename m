Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF37CDD0F3
	for <lists+xen-devel@lfdr.de>; Wed, 24 Dec 2025 21:34:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1193193.1512149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYVYV-0006ql-10; Wed, 24 Dec 2025 20:33:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1193193.1512149; Wed, 24 Dec 2025 20:33:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYVYU-0006nj-UJ; Wed, 24 Dec 2025 20:33:58 +0000
Received: by outflank-mailman (input) for mailman id 1193193;
 Wed, 24 Dec 2025 20:33:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e2J/=66=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vYVYU-0006nX-4N
 for xen-devel@lists.xenproject.org; Wed, 24 Dec 2025 20:33:58 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de26c2b8-e107-11f0-b15c-2bf370ae4941;
 Wed, 24 Dec 2025 21:33:56 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB6985.namprd03.prod.outlook.com (2603:10b6:a03:433::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Wed, 24 Dec
 2025 20:33:52 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9456.008; Wed, 24 Dec 2025
 20:33:52 +0000
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
X-Inumbo-ID: de26c2b8-e107-11f0-b15c-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A2xNm64AdSURhiw0w/BLo9fd7SDn1fxIKA6+0m299PX2TwuooDM9nObghmkyw9EciKhRWx+8OPU+li/+/TQrDXj2rys4e6igXe7dqRxc+/QvZs37Hoxf5n8vPVjaL5VQryZH7dMOn23ZQQaPkfJYRwsgwozFPu5c+DpOP329ZaF7zB0U2OFcnwi5Y+z6F5IKKNNOlGPjTzgsdxWT9qj2gDA3jXWjQVyF2FCnQd1oI2azR7OJAZfqge8qWUabon/YsLiUPX0ptghzxH7YdbreKqhKtFLOA+0R2rludnhvBKLqMuHG1yeNW6cicgSngE4xrvK0C7tkl0DACIgEYKtFaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fFY/S8DktWQ/eE9dIBCs2JqW4Lxis2xiMlqDxqD22ZM=;
 b=UXWwzkqfoTFgFloYGu8dlo62cYsmXHV7KOScfx40BsaQ+GauoSg9m9nu/MSRXaMeMsjIkJANJcXXo27ZGtxv3j15vHwuGFt5NZ3Eg5NJLlJ+UTmyskKk5fu80R/gm2e4nw2BehxWFruTFZJ9Gd7dtHJUX6MYRqA6EkAxZ9B1fFfEMejt5bOMG25aQR42Eq9wdlThSXAS1MOT3DYrzQYFXpQ0uI+Ojz2LNUw41fgwkcugSa1m1rZJ4j1rWP6FyGBaCD0eqmoGq8G6Whp0N6T2Snou6pxOov+Q312+rC+/EQYW+HBWo/0T1mZlkBv0T120yQ23YpUyzXzIxfQ3kOSk4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fFY/S8DktWQ/eE9dIBCs2JqW4Lxis2xiMlqDxqD22ZM=;
 b=NJMVMuZL2l7pHT/deDwKV5l+JEiElo25K/rPiD+Dj8dSVBSbQeqWis4DVP1YXrPfRSKtEV3Z0HHD8OcPRu5Nge1aKiInkO6b6g7M7dD3Kbu8pz6QDnScaVHdW5xtF9KyICtPjOIJAU/HrD87yEdFhNmwkrtA3KrxfDsQ7og5TUw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <23c0fcc3-234e-4eee-971a-7ed6cd045d1b@citrix.com>
Date: Wed, 24 Dec 2025 20:33:48 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 2/2] xen/mm: reject XENMEM_claim_pages when using LLC
 coloring
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20251224194035.60173-1-roger.pau@citrix.com>
 <20251224194035.60173-3-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20251224194035.60173-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0327.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::27) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB6985:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f8d7361-5f6e-4dfc-3fc9-08de432bc024
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VEhhVnduQ3JFeTZpSjU1cDQ5RjE0QTMrWWp3a0xTS2lpbEtBZXo1eDJvY1JG?=
 =?utf-8?B?OXJHcllxcVBhQllTODBiaVE2WEJYZVhsZVI3em9keXFvTi9YWmRRSHJETmVU?=
 =?utf-8?B?Z3lBZ3ZBOVZDdEx4YXBTMERQendjN2xxaDZjMlc0cE96a2dBYXgzUWdBRHll?=
 =?utf-8?B?R2tibnFmWjdxSkNIeXZuL1VTNWdLMVQ2K093TngxSG9tTkY3Y3cwYXdxRDV2?=
 =?utf-8?B?MjA5VWR2VFJQaDNmUWpLZkp2ejlyN0w3MHdQUzdkQW84R3BuT1dKdkF4dmFF?=
 =?utf-8?B?RFBJdlFsTVhhYit2bnZrOG9Ja21SOG9EL2FNTDZJNWVaZDlsMkQ4RTNHZTFT?=
 =?utf-8?B?aWI5RnlZVkQyRWtldGVKcGVHUGRvd0Izb29HbGJUSDhDYm9xV2ZzL0VzQzRW?=
 =?utf-8?B?T3k2SGJZVnlDUHFFc1EyY2Z6U3FsYnFhOFVHTTNUTGJ5Y3VSdDYyMnh2UUZp?=
 =?utf-8?B?Q0tiamd4TWtMZ3pVK1FKZ2dHVmxDdmF4WXdBeVZ5ZzRxcnowNlVmNGZXOVpp?=
 =?utf-8?B?MWlmNnh4aG03ZUlXYzBscHFoOGk3RjNwZkdwR3pFcHpTeVFjYzlHT3puU0I5?=
 =?utf-8?B?enIzMElLa29oUlBoSUZuNnRFMmJqUHBQdmNnMDE3SEtTT1JKdGdXb1hjSEhZ?=
 =?utf-8?B?N2NFQ3NiRUM0R2NWSXJnU0F0RzNVVDAxRzFKZkhITzVwVXBOQ1NhUWU1SVVh?=
 =?utf-8?B?bE92OWwzd3VRdXRReXl0TlZWK1FkbitZa0s5Nng3RTRrWk5oU3dkektsaFRH?=
 =?utf-8?B?MmF3Skc3Y25hUVNPTE9vNnVRaXBtRllNelhsYVJsN0JQVFZZNHFuek9yMUhL?=
 =?utf-8?B?Qkl1akg0bkZ0RUtmdmJiUUJ3eVlJVS81eUFYc2s4anl0eTlaSm1RMFJ0N2xw?=
 =?utf-8?B?UUkwaVRWd09KQmlYK2dRaXprR3F2KzlubHhoM0FINXoxZFdLNnlvOExheSty?=
 =?utf-8?B?NTBJc3BUMGVROHQ3OHZ1WHduY2pSVmZ1SDJDOFlTcEljeVpvYXRPK2NFaUNQ?=
 =?utf-8?B?aHJIZTZOb05nU2kxWEtXeDFFYnpNRDdyWmR1aEFXaDBDajd4NG4rWUIxL0V5?=
 =?utf-8?B?NlZKYXorc2ZIUkthYjFUaUxGaVIxT1lmYzMzZjBIUTFRclhlWlVuS3JWS0pv?=
 =?utf-8?B?K1I3TVBzeFlUYWRqVVBDaGZIT0EzVER1REJzbHdkVmhVV1k3RWNKL3BmTGJs?=
 =?utf-8?B?clBxei9aeHNEU1BxUFB2MnpoaktURS9IU3lialFEVW1BMFE5RFVCUmxOUkhm?=
 =?utf-8?B?TW01V090Sk1WRWRWRFo0eXhnRDYzRi9xTDYyNjVIVkRxRW10dG1zaG0wYkJy?=
 =?utf-8?B?U0trbS80YkxpVURkRGlMbktnR0ZvYnJTMnBiaElYQkc0M09ySW9za21BeFda?=
 =?utf-8?B?MnFGTU5qOU9pWmV2NVd4dXBhMmlacVZwQVNRUzRmdjZwbmJFMUV4Vldvc1JT?=
 =?utf-8?B?UzlRODRsU2NSMjQvdDI3aSt5a0k3SlI1TVpjV0cwWXFnY1Z6RFZDRGNWcDYz?=
 =?utf-8?B?eW1PdTIvM1hieTFVQU11c0FlaUpyMVRnRktwK1FZblliQkEzK3pyYjUvamZ6?=
 =?utf-8?B?TGNyckhVZE9BZzBWMnRRS2pJRHBwSkV6VU5sOUtZcS9KeXJjNTg5N3U0eFMw?=
 =?utf-8?B?b3pSd05DTVltTnFYTlE0Uk02UjRVQWMwcVhzTzkvU25UajdaazFWekN5cG81?=
 =?utf-8?B?SStKYTQvRnY0VTNsTWthWjdnM3cwU0JQeFFITnlJVTNMaUUzekNNMFNMb09m?=
 =?utf-8?B?dEtETjk1eDhKdWMxRGV4SEs5cnJjTGJsMlVqS2prczk5c0hyMm54NUNnbDM2?=
 =?utf-8?B?OVJFMDBadGR4REUyUnZmZlpTemxvb2hvM2dFakJmWlBHOXg3ZEFndTdiaVNU?=
 =?utf-8?B?M2RYLy8zM2tuVGFkbFF1V2F3NUFPK05mOE1sZFovaXNrZU4rY2YzZEtnT0M5?=
 =?utf-8?Q?OZMYSuTmEUybVv6xC3JuCXgWD9tjnPOn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUIwOGhsbnIxcllORGFCNUkyUjJFa2krb0cyMDUydmtlUUN3elFUTEppelph?=
 =?utf-8?B?eHNPTmNUTjVDdnhQR0t5Q0RkQ0xyRTQ5NjNuUTZDbUltNFUyeE9tK2FNVVND?=
 =?utf-8?B?MU44cmt3ZDI3Tlhlb0ptekRXOHRWNzFjOGVhNW0rS2dRbGM2WSswZlRpR2Q2?=
 =?utf-8?B?SDZOMDFxMDF5Qms5STVEeC8rY1ZZd053ZGYwWmVOai9CZFpud0FHK1RnVGo4?=
 =?utf-8?B?QmM5TnArRDJLQUt0WmFhWDRHNWZ1cGFZNllnd3RYZnlSZFdBM09pbi84WFBQ?=
 =?utf-8?B?L0R1QVkzaFp2WC9BQWJsdGhISHBsQ29vcExSTGQvZjBEYi8yQ2JWQkdRWFly?=
 =?utf-8?B?YlowUnhkRlR4MmlaYkFubUpCN05RbzBHZVpUVm9KVXhMZ3ZEb1lYdlhHUUJi?=
 =?utf-8?B?ckpNa2tuK0MxNUFJcUtndUJxcFM1N0JaVmJRckZ2T3ovcEZVUVc5cXNXbFZW?=
 =?utf-8?B?dXh2UzduR0tvczB5WlVEOXA5eTZzT2NOQkJRUm5LNjJrcng5Szh0T0RwV2lT?=
 =?utf-8?B?dnd2WGRQVjdKQXJ4Tkl6TjQ3VGlNQWtmUzZ4SzE5ZHFIRWh2dnBHdnAzRE9Z?=
 =?utf-8?B?a2RoVXFNb3RoK3ZSemo4UStDVU1FUUs4Y3JlOEdBb1FFNm9BOXV2SC9KaCt0?=
 =?utf-8?B?elJpQ29qZ1dGNHI0R29Ga3p5VE1TY0cxWFdPbHdFcm5hQW9ZbTlRN0d3RkM0?=
 =?utf-8?B?ODg4Q0xYZFBocjhOUTJmWERZN2NrR25VVFF2b0FmSUZ4OXorVVMxU2IxQWlw?=
 =?utf-8?B?SlgwTGMzSmQrTU1vbStOVkljR2R3SmNlVm01OXF2Nmh5OXJDcGR6YUM2TkRG?=
 =?utf-8?B?ZFBoUFV4NUhCWnkrSFlTalFsWENTTW1zWDNGUGNTWnovL01CQStBd2JiTkNm?=
 =?utf-8?B?aGhvR2hMUnBoYk1oZmNnaUdTNXA0RzNRRmRmWEtrMDRTOURnMDFpMTJBWnl6?=
 =?utf-8?B?QVJPY3VEc2E1ZWE3bUFFa2xoaTJEcDlQN0dJcnMzc2JLTk5OM3dmRXU4WjBj?=
 =?utf-8?B?bGY4Zk9FL05oeTN1aFhPOXhoWVdpanJTZVFBN3huQ01LY25POVNqZXdFa0Yr?=
 =?utf-8?B?SEZ3WHNvNWxNaFkyTEVDNWo3dHh4bkZkOGZQV0Jjc3J2U0UyUjhXRWpiQzJI?=
 =?utf-8?B?dWtBbDQ1R3hITHFPdWxaOVF2WHRteFZVRm5lTVhvdzVYZnA2QzQxcUdwbks4?=
 =?utf-8?B?b3l1dGxVQVQwZTdXaUZpK1pBcnkvczN3ZEo5SVdmZVBrejVPTFZNVHJGVGpP?=
 =?utf-8?B?TXNSUTk3aWR0b3hjOGdGVnJhWXZYSkZsWUJnOFFFU0huKy9tVXVBUlU0RVRo?=
 =?utf-8?B?bC9aalY2dWxPNDU2YXdndGhCOHgyNVNhVGVTcnMvS0paTm9UbmJlNDdRYytM?=
 =?utf-8?B?bVFqbm9wN1QreFB4K1BteDZUL3YxK1VvYVpXRDBlRUN4OXlRa04wY25MOEYr?=
 =?utf-8?B?TEFMVU1LK0FyMzJ2TUhHRnpQNmZFejZzVElncGRoZHZOTTlMeWxaeFAzNTEw?=
 =?utf-8?B?TElzWVFhWERIWGxaalYxMytVMGIrZUhBdk9weHdqdVZNcjZFaTNreVB4RWpD?=
 =?utf-8?B?bk1Pd2RZMGRqbkdVREtzZ0hMWW1JVXoxWHlQQ1RidkdnQTh2MklrNSsxNGFG?=
 =?utf-8?B?NmtoeE96azJMMzNubTFRQmdVV2hvUVl4dHJXL1pWQWFnR2R4VWlvL01IMGFV?=
 =?utf-8?B?T0UxeVJ1YW52c1Z6cjFhM1FuMGkyaHNRd3NOcHJPalIxWGgxMklEcWFNUmsw?=
 =?utf-8?B?MTZWUWU1QnhjcFpldC9tNmQ5ZTlJYXJZQnlhWkU2TnJxNnV1NXdiSGg3NTQ4?=
 =?utf-8?B?a1ZXQ1Fwa0tCVE00S3liUmZEclVlSWxFMDhsV2V3ZzJGY3o3dENKclJwWXhZ?=
 =?utf-8?B?a0dCOGZNbmVKMmRneTkwcGpiaXdDeVRHRXNkSDh4NUMvR3Uya2tIeit0d2Mz?=
 =?utf-8?B?VUxydVlyOFNwUGl5TzZMYVNiQVM5b2gycGtVYzBhRXVVWDZRQzNZUFJkSmVJ?=
 =?utf-8?B?MTNnTks5MmZqdEszYi9USmswOHBLRHhhbGhKb0pQSGt2d3pucWNuQk40ajFj?=
 =?utf-8?B?SkJQYk9SY3NueGE2MG1WYVlhaFhad3QyQXBoUFdNYXBaR0pVQTdFTW5wSkFs?=
 =?utf-8?B?MHJrMVNQWGlpNFh4T0V1dmJONERsMGNKQ0FBdzFxa3J5UE5UcThhYXJFSUUy?=
 =?utf-8?B?SXFidjQyWG5CQ2VQaVhva1cwTEIyQ0xHakc3OXUwQlJJM2dBVDc0N1B4NW4w?=
 =?utf-8?B?S1Z0MmpZRzFCSjB6d1JMM0ZTK1JubnNEK3g2K3NsWFRnbEdEdWZrN2hsRWsr?=
 =?utf-8?B?N29tOXhaWXcyRHk2NlRHbWpEQWU0bjUxNmgvSG9ITlFHRjF6NWtPQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f8d7361-5f6e-4dfc-3fc9-08de432bc024
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2025 20:33:52.3141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GUoWc4mXOEnjM1JasfV0q3Hk2puTHrYVkFNdSG8qWatk62b3Fu8veVke2bmhIJ95hbxC7baVdJWiFIBMcZ2kuIlRuHbjwhtcrQE4aaDFHDI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6985

On 24/12/2025 7:40 pm, Roger Pau Monne wrote:
> The coloring allocator ignores claims, reject the usage of the hypercall if

Minor grammar nit.  You want a semicolon here rather than a comma.

> LLC coloring is enabled.  Note that the usage of alloc_color_heap_page() is
> selected at boot time, and it's a system wide decision.  Once enabled all
> domains will use alloc_color_heap_page() for allocations, which ignores any
> outstanding claims.
>
> The hypercall can be enabled if/when LLC coloring is adjusted to support
> claims.
>
> Fixes: 95debe51a936 ("xen: add cache coloring allocator for domains")
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

