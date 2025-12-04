Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E2FCA58B0
	for <lists+xen-devel@lfdr.de>; Thu, 04 Dec 2025 22:51:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1178270.1502151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRHDS-0006jP-9t; Thu, 04 Dec 2025 21:50:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1178270.1502151; Thu, 04 Dec 2025 21:50:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRHDS-0006gN-5l; Thu, 04 Dec 2025 21:50:22 +0000
Received: by outflank-mailman (input) for mailman id 1178270;
 Thu, 04 Dec 2025 21:50:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TdJQ=6K=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vRHDQ-0006gH-At
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 21:50:20 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3944d1d9-d15b-11f0-9d1b-b5c5bf9af7f9;
 Thu, 04 Dec 2025 22:50:18 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SN7PR03MB7129.namprd03.prod.outlook.com (2603:10b6:806:32f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Thu, 4 Dec
 2025 21:50:13 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 21:50:13 +0000
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
X-Inumbo-ID: 3944d1d9-d15b-11f0-9d1b-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tcS4sJM8PQvOCNHLdGTDz20aeL+sL0O++IpyIP4gors0z+5cpth6p5rAE2uO1pASEOPGD0zrfzVwOmkkrBQlE02gmnzFN81zEzwMPjttWxD11DJ+R/7IqbhVYm6uAh7eeOMtg6K7SwzhVCLWGNZOAX7dcM8EwjlGgfMv2UCue3RH5G/3B99v2eKOmHknIE58ms+GeMQzFB2SCulXCwDswZ1MXwQAadlQNEZj7pM7xZW5xl+k9jXAg2grTGuLAAmzUcN6mr/oyGJU+o26CaIQxv70PJvm+jUWNXPZnO+itr1LtmhtQ8UZM011+mVY5LHfOXfqyg/1E1yGyWPk3Y2sVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=grffYMiw22/ufFyHSrwP2l6iXT0HdIxPDTD0RQT/ZKU=;
 b=a/e0gMQ/c1AStgi4LSzfHPcscDSaopthWKYw5NtpImigmKE1xmnUIUCB050vYaFygaCSu5MykkJ1M20yrze5Is/GoZW3g051HsijGrVGtDwjv6ZyOye6tommiECdZ0kGRdiKztGt+NaPU5P65KDkAchVoZ1nJ70/P7FtgA4XIQ2z2YB7WfTt2H2QuJoLDTzkfthSQna/5KovtkLwPYyakJgAF2KXNRJGC3AFkWzv1AZWhr2Ui/9WM5VJGSFG+U7TXovYcbdX4TO08DP256kbb1NGeG8N4uVLqRV5TB5vx8B5jkmEVEK/ugo9gC2CemYhgHcgJxDJnt3k+/XreEYw1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=grffYMiw22/ufFyHSrwP2l6iXT0HdIxPDTD0RQT/ZKU=;
 b=eYv5a6KazfqlKtJWfJtgQtOZ7T2uURCaP0YwkiHohPxQTOyZmqr6f6fE2/4dIvOxe+GesF5LyGU5xGMbdaD+qCw9nklgl1s2pE0xB20sZO3cAc/8j2Bq2WoOYJDfmS+XYiqB/wk/m1KRuB+Wrgx+306nGAJ/dWvj8iuH/r/HU1s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a9dffe3c-2610-4507-a793-10f9d5796137@citrix.com>
Date: Thu, 4 Dec 2025 21:50:10 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com
Subject: Re: [PATCH v3 1/4] automation: switch to alpine:3.22
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <cover.1e7327573686b6fc1e161127e268e4042556d16e.1764867217.git-series.marmarek@invisiblethingslab.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <cover.1e7327573686b6fc1e161127e268e4042556d16e.1764867217.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0007.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::9) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SN7PR03MB7129:EE_
X-MS-Office365-Filtering-Correlation-Id: 791c21c4-4169-4761-1e91-08de337f1a93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TnRGeWZVWHpiR0xvZ2tYeGtxOXZ4dXMwL1p3ajZrSUpkRTYzdXBkQnlraEVo?=
 =?utf-8?B?bVJsYjRLTGpKM1NxTk03N3FlL3NGa3V4eVdvMmIxYlFkaGx6NGs3ZUZFOVhh?=
 =?utf-8?B?aUxIaksxdzByT3lKanYxQ1p5Z0l6NjNvdGlha0txT2FYUFJLWEhndUpqNVcz?=
 =?utf-8?B?eG5zU2QzN2JZbVI4NzZFVnltZklvSGwzaFUyNGp5T28vZXJEMG95REhEbUx6?=
 =?utf-8?B?ekNLMUdwZStKTmlDSURTbWROZjdhUm9zQlBEYzFRc2d4WHBQZ1M4MzNSYmla?=
 =?utf-8?B?NTdjaEViNG9xV3BZUzllTTlWYzRGK1VWSEpVTzVXQVBlOGtqd3hqOUs1TWZa?=
 =?utf-8?B?aHU3a2l5RFlWRW5wRmZKZzJ6a0tDaVFET2JFck92S0JsTGppQy9DQkZ4Tkw3?=
 =?utf-8?B?OEw5OU9FZ1JlMzZIOTBxOTFjMC8vS2VrUWJCOWtDQnV4K0IySVNZRVBaYlVr?=
 =?utf-8?B?T044TTJUSHNSaDB6Z2ZIYVVUKzE3b05KSVNJWEtwNWZVaWI3NEFtR2I4c29u?=
 =?utf-8?B?aTltb1ZYdG5pamFkYlZaM01Nc25WRnVKaUxFRmc5TnIxUGlxck51c2RHYWRU?=
 =?utf-8?B?RWNEdHBJSjFDSWFjT1JBVXY5YjdPWlpBSUFJcThEdTgyaWlVVVJJS1VPQWxv?=
 =?utf-8?B?MThwNGpoMGEvL0J0UFJ0RG1nbmk4UnR1akpVRVkzUjM2dHhJL2lOYXNpUjhi?=
 =?utf-8?B?KzZ4UDhyeXcwcEJORHpTV1VpbjB4eFkycjlYZ0NzWEdiUHZTT0ZxdmR3YllX?=
 =?utf-8?B?emsxWmxUOEpLbHkzSGxkQ1NFTlJSUGdGRUpIREM2bHNrSW9TT2E3S29KMm1F?=
 =?utf-8?B?M09UN0VjQVVvVS9iMUc3RHVhTVoyd3k3eVVrb1V4V1NCZ2JsNjM4TmJCNm13?=
 =?utf-8?B?RU1hK3dZU0pJck5TVE1UM1VmMHAvYVQrZEdUQWRRSDVDNGVjRHVVSmdjM3pr?=
 =?utf-8?B?elRVVU56QTFwWEZsWFlEcWFYNzZTbnQ0bFRKd0xqSmFrMWViMDVZNFM4NEMy?=
 =?utf-8?B?Tlp1K251eUhGVVZYWHZUdzdSTnNjdFFvdFhXTEJKK0NpUFBuUW85a2I0Vm8y?=
 =?utf-8?B?cm53L3NjakwycjNVNnp4L2UzNisxUmJyZDVhSm9OYkJZeEJ2VlU3eVJxc2Vn?=
 =?utf-8?B?MWYxZ3M3Lzhxc0ZpNEFmWVVqQTVIY0JGN0d4VVFDUXlRZGpBSG53Zmwya0dm?=
 =?utf-8?B?TEtyVUVtNytnZXlDdVI5ZU43Uld4emRDSkR6Nm9sZnJoOTdRaERzREtDK0hy?=
 =?utf-8?B?bDBuZnlvd3RYOGZYTVRpUFJtV3E5N290V25EaSt4aStZblN4VmFLWW0xaXBO?=
 =?utf-8?B?Z3JudGFaT3FNa3VZdTJROWQ5bG4rVjNGemF6bUV2dm1TVTFYZlBBZUVEMFJ6?=
 =?utf-8?B?T2Y2OFcrMVpMdzRTNitTRThNcjFuQlU4WU0zYUlFWFB4UGx0cnNobTlIeGtt?=
 =?utf-8?B?bkY2UmR4aU1CTUNvSkVFWUcwNzNFSytjUzlYTnIyM3FLSGNFMytzNmVWRVBP?=
 =?utf-8?B?U0g2TTFabm9YM2tEcGpUSTJ0SElCeHREL050UER6ekZZTTdHdGdZcElYSTBm?=
 =?utf-8?B?WVZpL1cvTWpTRjJ4THBMZkU5alFhTDBudFpVSmt2NGJMcVhCZVVUK0JYYWFm?=
 =?utf-8?B?YndrUlNxS00zVE4xWEJXS242dUQ5bmhBMTkySVlhVVluWmJMSisxc29oN1BZ?=
 =?utf-8?B?emtBblpuUVRMSHBSWitzTFFDaVNsWEJROTM0V1BDSEFSVDkyR0pIVnljbVNB?=
 =?utf-8?B?emRhRW11cGVEVXI4UW0zYUtzd0JIYVY1elJIdFpBZkdoMEZ2b08ydnpZdlN2?=
 =?utf-8?B?SmJlc0ljaGVJeC9PY3pCdG1ub0g3eitnYW9xUWhxMEhxTnZTdXJOUHdXWnpJ?=
 =?utf-8?B?bGhSSjNIVGpXR05uSHFQMlBRbEV4MmdEbVJYSUZoa1c2MEF0emk5TXQ0Z1dI?=
 =?utf-8?Q?eUMHPm1AA2d8MWw5xnnce1FY3OasMAnC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0lOMDF5bHlGY2E2MlE1cnFKTmxCcVRFT010eEJrUXhzSkRLZ09NS09IRFdB?=
 =?utf-8?B?RWV6THRQeDA3RWpKbnd4U3owTUs2T2pBQzBUcUNxKzJ1b2RubytFL2JWYjBF?=
 =?utf-8?B?MkVqVy9TQWRZVTZHYW9uWGRXVDBmbEwycXcvVm1jaFFMODBXeG9WTC9Zd1lR?=
 =?utf-8?B?cnRUM2VGWThQNU80NTFzTEhiSzMreUxTeEp3RzZYWkZKWCs5aG5FY2IrZFJl?=
 =?utf-8?B?bjQ5OGFURU96SzdXTkZCcFR6QTArNGRNL1RBZXdRNmF1V2l1dWlOVHAwZnV3?=
 =?utf-8?B?SFV3L3ZoZCtZa3JFR3NSRmJsaVF5aUxzZk9MV29VWmhLRXpsWFF2K3pQV2t4?=
 =?utf-8?B?a00wWnVUc1NvMlV4OUJjUG8xdEppNG5BalcyRGFyVFQ0TVFqeDdtdzllUlJu?=
 =?utf-8?B?NjFVZ2hIOHB0eUJuSFdoTHUyWWI4a2VzL1lNYnYrT2VXbDAzY1hIOUVFYkJq?=
 =?utf-8?B?cndIb3hHMU45VjhzU2NjMmEzNXdSeUY1amNUTkhxVTFwTVV4TjRUMXlqaEFu?=
 =?utf-8?B?SjBQYmQrNWJKT2NVbk5oTFpRRkZSYjFPVHptS1h1bEoySGt5QzlBRzI5dGtk?=
 =?utf-8?B?eWlrdVdqTXUrUzZWZlEwYnJwSUVFZVJtd29mU1ozRTM1R0h0T2dKMkNFRnN4?=
 =?utf-8?B?ZEhzQUM3MHZ4UnhhY2FKdXNKVkVSb0F1SmdhT0lHM09KYVlOUXFjWWVwQ1pC?=
 =?utf-8?B?Y0pQMnRDM0h4amo5K2M3alpkOTduZjRZZVBidk1HOWdhTkREeG5Qby9Veml0?=
 =?utf-8?B?R3hZN3RLNCtjZS96R2VzTFFSbTNvY3FPQUNiaUFLRE9Ga2dXck1iUE9rRytD?=
 =?utf-8?B?YkRDVktMY293VGpwS2ZOMUdLMndTaXhmUHhtaGxZOW5FMFBiSXRaeVQwMHRP?=
 =?utf-8?B?UUJtWUVCTE1UeVdxZjFhNGdmSnQraG5NLy9reUVFN0xoeGtxdWt2aXd0TmNv?=
 =?utf-8?B?SStqNDZST3B3RTBQeDNHUzBzbzdmNmpvdzIvSmZyalF6MHBhS2MxcGRuL3JW?=
 =?utf-8?B?TVBZM1BjQlhsd2x2VWR3eDJ6eFBFTFNkODgrbXcrTlFHR2tDOGhHeXFhM3Nv?=
 =?utf-8?B?VVYvMU1nMndvUG5OQ2Y3L0w5OEppYlE1ekxyeEtCMkZhUDJJTzRQY202RDVv?=
 =?utf-8?B?YjAyYm9SclMzT1ZoeGwreEt1QUlDbTRMYWpPNW9ra09oUy9keE9hSXRqb1dS?=
 =?utf-8?B?V0w4bm5wTm16eFRienhSVHBQU2ZjQnJiczdHbStzZ0k5NU83YjNweVlkSjdm?=
 =?utf-8?B?ZTVWb2lXQUVXbE83cXBiOENMdkRIRStock90cStnTU8vSHRkL0p0enFlQWdj?=
 =?utf-8?B?VHZGbkhlamFFOWRuVWdYSFIwOWVuaHpDZStyelRDdWp6UDFGcEkrWm9zWVdh?=
 =?utf-8?B?TzlEakQ5WmRuUnVsanh5QkFnOFcxZ2YzMXNCcjFOMlRkbTk2d1ozekZFUTFx?=
 =?utf-8?B?VDhNdThGdjJCNHhCSkN1M2NNeXVkNjMrK0w4TEhzTGEwUXBoNTFNWkx2UWR1?=
 =?utf-8?B?WWpMblBJU3VKN3dQTkNXdzhxTjdqcGhmbFMyWjltRjk2NGFiRUxzVk5WaEND?=
 =?utf-8?B?dlIwK043S1NrTngvN2VqRHdIeVNyclhUU0FibTY5cEpqQXNGM3E0emdBV3N0?=
 =?utf-8?B?S3F0WGZuZWNvSWVHVDF5UTdNWmxlYWNnUE11WVl5L1owMFVwRFhEZUhxSlpM?=
 =?utf-8?B?Ymx0ZXlHZWxMN1hrRC9FUzkzWmNvVnc5dWsvcWZIOXYxbGhzTzZhdE1ZYXpU?=
 =?utf-8?B?ZUY5ZXc4UW8xV0NZd1dMeWdaanJ3OGE4aDk5bUI1Nkd1N0luSzIySCs0cHlD?=
 =?utf-8?B?eXFDRHRmUlBMU1E5VlU0eEhZRmVCOHFSKy9SRlM3NWU5bFFmWXFWSTBSbTkw?=
 =?utf-8?B?WXRSdnBzV0ZpeE1LelRRdWtVQ203MEgxeXM5amJkcUFnVnFJenV1QTV5YXFV?=
 =?utf-8?B?V3VDRExiSTg1K2JvSXRJYW41SnYrTUZQMnphTXhTT21nU0I3cEIvZENaUXlY?=
 =?utf-8?B?dWU3enJMVlovQ2xDdzhRbDd2R0JjSUcvNlBjTUt4SFRRWDB3aHJldklVNUtU?=
 =?utf-8?B?Z1hJVnFISnNjZUs0VEtJQUp4MVdIVHZSQ2NQeHNKTjVUYUFwWGdwNzQvcVZL?=
 =?utf-8?B?RmxIMFVFRVJiRGJqSHhhMjk4TEJiNGFhTzN5WUxDc0REMVByN1BaTTAwSmhK?=
 =?utf-8?B?amc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 791c21c4-4169-4761-1e91-08de337f1a93
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 21:50:13.4462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hqu5IVwsFgt4pq3ELNamt+tUruASvKyld5Ch0rJchVpUctuTiV16DBdzmefYW1qggYAOs+C3h54SzIcCh07xTm9H11l+erAmBSZ84g5uMKY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7129

On 04/12/2025 4:53 pm, Marek Marczykowski-Górecki wrote:
> Marek Marczykowski-Górecki (4):
>   automation: switch to alpine:3.22

I don't have a copy of 1/4 to reply to, so here will here will have to do.

One minor point to start with, your hunk to containerize[sic] still
references 3.19, not 3.22.

The more major point.  Bumping to new Alpine containers is the point we
need to make it rootless without breaking the older stable branches.

i.e. we need a brand new rootfull qubes-alpine container (or somesuch,
along the lines of xenial-xilinx.dockerfile), that the test job can
switch to.

Then, as part of this patch, we rework the new 3.22 containers to be
clean (heredocs, rootless, drop unnecessary dependencies).

I'm sure I've got a cleaned up copy the alpine containers somewhere, but
it will need finding and dusting off and testing again.  I'm happy for
it to be merged into this patch if you want.

Ordering wise, this depends on getting the 3.22 rootfs artefacts first,
it seems.

~Andrew

