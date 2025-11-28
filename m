Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C2CC91BD6
	for <lists+xen-devel@lfdr.de>; Fri, 28 Nov 2025 12:00:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174732.1499682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOwD2-0003wd-IZ; Fri, 28 Nov 2025 11:00:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174732.1499682; Fri, 28 Nov 2025 11:00:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOwD2-0003tp-Fb; Fri, 28 Nov 2025 11:00:16 +0000
Received: by outflank-mailman (input) for mailman id 1174732;
 Fri, 28 Nov 2025 11:00:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YqkP=6E=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vOwD1-0003tj-OU
 for xen-devel@lists.xenproject.org; Fri, 28 Nov 2025 11:00:15 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 682d177c-cc49-11f0-980a-7dc792cee155;
 Fri, 28 Nov 2025 12:00:10 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by DB9PR03MB8424.eurprd03.prod.outlook.com (2603:10a6:10:39b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.15; Fri, 28 Nov
 2025 11:00:06 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%4]) with mapi id 15.20.9366.009; Fri, 28 Nov 2025
 11:00:06 +0000
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
X-Inumbo-ID: 682d177c-cc49-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=abD2Q5ImImmxXCvq1mvM5FFc6qJS2Yht9RRrgcSXcve6LzhynAdQ4MV3MCxueM+rfqiUbT9DgG24g/ieRyrKecnCPItLuDnJe/Icg+oAkT9BwziIhgrlNhpYjHQqEDiZKn8GDOd/bvljvFwUfV0sS46aZZ6FZHzGLrt1CIu1dEmf9J4us9xvNJDmqdQL0kKABb9dhffMv3+7UlJKk4xpciSqa+ohj3oyd9jQiXorhdYj1Got3PCAQ5j7ac/nTClujUPaTMa2djKc3sPlZS4I3XtTl2PwvLiwtYzpNc45D1/KqBx0t17TI+sWvasypvJERWfCq5pcGI4A13z7fkrfwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4lzb7etBhHLiAxLK1Noe93tkrbjub4vXCnWHnb5NCUE=;
 b=qHbtKoOrJZsS92CqTY8BwsoQ6axn5p1pjlyOOp2br5YFxWzgjuXBWPyXeiltBBXnKgPRNY/nMoyGsrn9t2497fU+4KSeBH7xNz3fsoYlRetZsNeyVQE4QPA0HrllWAz+k/fRrN59sH/jSzr/2URkhtDHeoPFrl4jUYTcBaGrUwsC1ACX1Yb9dhz7rjvVigwCu7IAe6rsEfGDjjJ9pg55QWIpz2X0txb+f9q3d7+8fbCYuQ0eenoP2y+tSGoRbugK0ZHzTd3o5tal1DKjxcaRkiFniyA2gLqH7bHOw+R159C24h2JTEu6Xmql3EwlQG49MCNk6aEoym3e+MX0Aoq6ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4lzb7etBhHLiAxLK1Noe93tkrbjub4vXCnWHnb5NCUE=;
 b=FdOmdGr/6qTwjFhFY0ETY4F1xGBEnI+m+tZJ8kdJGpnZikUxR/xr7mWd/GUWmTu1cyIfICFIiUFpAveAuVafyTFWNdHIFE/gHspKVBovQSsZ6u3D1eog/Qz0605oXrd7lFPefa5eMfwxKoDqGjiHza3SkoJDMvn328nqD+QwIO/hSdP1D8qZAKWvIPBcWgHy1+kpxOkYQJTb91zU9l+EmBUygF7lFLZ4GnItXrwJwlQV/dNPO0TtbyTrDVdlSvoO8klWzgm0hBRX+6I849T/47OLPfCqmrOQiz8Jh2tRS0pa1jRI8DI/oLrddETPdncf6PZSf7Ch8F7Utd72oci+Kw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <7af2631b-3663-4662-ad99-a363ca7d1b40@epam.com>
Date: Fri, 28 Nov 2025 13:00:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] xen/x86: move d->arch.physaddr_bitsize field
 handling to pv32
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251127221244.3747918-1-grygorii_strashko@epam.com>
 <20251127221244.3747918-4-grygorii_strashko@epam.com>
 <26f448be-4a7f-4346-928f-8185ca8ba222@citrix.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <26f448be-4a7f-4346-928f-8185ca8ba222@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0020.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::9) To AM0PR03MB4594.eurprd03.prod.outlook.com
 (2603:10a6:208:c8::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR03MB4594:EE_|DB9PR03MB8424:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a855996-46fe-4f66-da39-08de2e6d4a30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OUFHczN2VE9Xa2FGaUd0NnZYeDl0NHBGREQ0SGRnUDQ2OE9pVXliZDFhblpS?=
 =?utf-8?B?WXFrV2l3MGJwejBRS3QySGVpMGhDSllScThnK1gwY2JoL3B4MGVqRS9PWkJs?=
 =?utf-8?B?VkVWbmVRalhvaXdkOGxXeFIzYlNXMWRZR2FIaDFYL3JqbnRXT1hvajdxSlA3?=
 =?utf-8?B?MkRIT21zMHY5cjhmS0JoWWRpa3gzMzRqeTh5MSt0MXh3QUpQZmc0R1JwWExX?=
 =?utf-8?B?cWx0SUtHQ3V0SjNJUkJRNHk4OFNpQjlXOFMwOVJnL1htcFNEM3NpSjl0czMy?=
 =?utf-8?B?eEtOZGNOdi90VUZkMzN4bHJZQ2lUaVFHd2grQkx3ejRJOVJHREhTMnBzN0Fu?=
 =?utf-8?B?YUV5M08rVElYaUhxNWhNUEVka296RmY5NUZGUzErek83czk0aE9teE5UT0x6?=
 =?utf-8?B?cEhVM1lwNjdTMjNkSTNhVmJPU1N3K1Y4NjhDdGl3OXJQL3hXb0F1VnZvKzE2?=
 =?utf-8?B?bGVyNnBjQThnRGVvMDRUWlhlYURMOXE4NmU5TkZwOGdyV0hsUDU1WUxDeldU?=
 =?utf-8?B?N0lXenZqMG9Wb1luNlk3SkJDeStEdExUalo4K3YvOUw1T3VJL3hLdHd6dVJr?=
 =?utf-8?B?ZlYyMm9LSmFIbit3VEc1cC9LUzBXdDhZbnJMZmhHKzhydGpkYWEzSXVGcUdp?=
 =?utf-8?B?QmxySHNPS28vTEpXRVNaWm1MNHNFcklxOWVKcWJGN0VVMEFUMFJzYzhDOVJP?=
 =?utf-8?B?UytnVmVlbk9XWmFtMWtUN011WmhhQk1sei9ZR3I0Y2JvdE5mRHNHVTRDeWxs?=
 =?utf-8?B?ZlpZL1hRYzdyTHhaQUdMcE1tTUF6aFNUaE0rNjFHV3V2WTQwZ0loZGNRUDZy?=
 =?utf-8?B?TmlNWjdSMU90OGk3bTBDcnlzNk54MVVRb1hWeVRNRGZvQ282QldKcktTbDl0?=
 =?utf-8?B?VGN6cmJzdlFLbHpieDh1MlE2ekFsdjN4aEQ4S1F6TmN1OVlDVFErNlJGbDZH?=
 =?utf-8?B?dmJXYnErcVA0Z3pMSWRpdXZrT2NLck13cjVEVGxPWWNXZWtua2VsMzdIUStY?=
 =?utf-8?B?VzYyUS84aWllR043bUxhS1Y2OE15RFBkbXg5YVdHOVZqN1VuamxSZndWK0Zz?=
 =?utf-8?B?QUxDdWxoM1NmZjhKM2MzQ3V4Z3VtQzRrM3Z5RGd6dEdzaDVIS3BkcVdUei9P?=
 =?utf-8?B?a0lBZlg5MHF5NUtBR05Tck5nQkhta2dUdElXYllpYnNxSEhVbEpXL3VYQ3RE?=
 =?utf-8?B?aWs3N1d2S3JISFUwOHdXOVhsM3ZGVENWNVlCZ3lGOHFtWC9VRCswTGJHVjlR?=
 =?utf-8?B?VFdJZE51Q0RLSzlIQVVrYlA2YzFWTmhrWERwRTVpRHJReUNvRml1bGQvZzRa?=
 =?utf-8?B?YkJ5SUxtVG9BNTAxT3FQaGlDOFFzeGovb0crVEEyUTd6dTZiWVZwTllGSWtm?=
 =?utf-8?B?cDJPcFhjcnBEcnpCbk9nRWxwenk5NEF5UEl2ZEZ5Y1I4OWtjR09ZUmtqTUNN?=
 =?utf-8?B?MVFqb0oxSlp5SGFGM1ZXTllBTnR6d01MVFp1ZVdrdlhuUGY3RC9GdlNPamg3?=
 =?utf-8?B?Wnd4WGx0SlgzSCtxK3Z6WHdqRFFSa3FXWTJZSUpXVllNMzdDL1RJWUlUekYr?=
 =?utf-8?B?bVlnS3pyTDlRUVBsdHhQaFFvRDE2SjN6MDl2UnhncmVqQ3dhTStjMlFwK1lK?=
 =?utf-8?B?ZmxKQzVuRHIxd3VxQVA2bTFic3ZiR09DOXRISldkaG1kNGs4N2NzN0UvRVB4?=
 =?utf-8?B?VG9ObzhpdDVzdGd4bFR2OFhKZXRZQnFLaDZ5M2IyU09wSktFbkVnNWNrTXBy?=
 =?utf-8?B?ZGZzdExOTkdKQ3c2SHAwcktQMTRGY213NXpsRHBuT1I4WlE4dW95c1orMDlH?=
 =?utf-8?B?WmpFUzUzc2NCaUxicEUxWGNSMjhGLy80TWpEczRmaVloNEtSVDZpSnFieENV?=
 =?utf-8?B?RVFzck5SVG13RTRtcTd1OTg0aHdGeDNMTEhidFNxVThZbGZlcFFCa01pYUdW?=
 =?utf-8?Q?0LemuScJt1GWMSMnxvmb+zKI1mO7eBMR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UU9HRm5CaXJSdC9mN3hVZ3hCMXRMRXVrb2FoRFQvYXVpbkZhTmxUSjY5MGlP?=
 =?utf-8?B?YlMyeVU3TlM3OTQ5UEYzWWQ4cjRLd3d6Y0kyRlJGZ1R0aTdGRVh2SnhWRmhK?=
 =?utf-8?B?d1JOR2xNaTJTaUVjZ1JwOXd2S2VzV3dkeW83a2NmUDFmaER1c3d3MXJPUmpx?=
 =?utf-8?B?YnU0Qnk2akVCVVJTU3dWWExaM3ZkRVVMUitKbURiT3JkVFB2K3gwODVmWnpM?=
 =?utf-8?B?Qm92blE1aFUxMTBEZzk5eWFGYmMzZUlxZkx2elpHcCtzSi9FMURFQW0zN3dE?=
 =?utf-8?B?VHAxRFlkRlhzeGVIWlRFZ0ZRMGdCc0tlSlUvS1ZOR3ZzamlXZGg5NHRoWHBo?=
 =?utf-8?B?VGVJT2x3Y2J3SU9Xam9nckkzcllkNnlGRkxDa2ExMGdVMDdySmU3cVB1emVO?=
 =?utf-8?B?b1JId01GTjhNT1FjWlpHVm16L0pnT0VYNG81SWRoYU1odkNOSnVLMnFNS2ow?=
 =?utf-8?B?dzdBc2tMNWQ1dlFhNVBYVmU0TDliOHRlQXVlYzl2cisyVU50eVI4OXF6RHNa?=
 =?utf-8?B?REdUSFM2dFM5Q25JK3NmMFVvMFFzRUhHT3F4cDRYRUhvalNCNEFQZzlHN2ZG?=
 =?utf-8?B?Yk9DQjh0YVZLaEk4bEZ6Z0lnTDBkTVVoYi9hdWZqdG9OdjllZDVSdWpsNWJt?=
 =?utf-8?B?cWtBcjA4T2dRZHJQa3VlTlhaUTlOaGxWeitFczJtYWtUWFVhQndiZEk1c0hY?=
 =?utf-8?B?ekNLS0RUcFNDa2NBNkdGV08wTHV2emozdXplelZrLy9zS2Z6UWhSa2RvRFR6?=
 =?utf-8?B?RlRrTWZXeUtWa1E4QmZMT3lVOW1XWWlXZElwVERwbWlDQ1dIN3ZSRVEzOFFi?=
 =?utf-8?B?R051SGtVb3VJdTFLRjl6bU1JVEdicDFPL3RWOXNOMHE5UVZZbEU2V1VPb2Ry?=
 =?utf-8?B?dFhhbkN0aUR4U1lnVENIMVJSc1JvR3A1R0hFeGZRY3NKOHhFSStEOVlFNEZw?=
 =?utf-8?B?ZnFUUW5pK0Q0b1dYa3Jqemh4dXpQdGNhajRlOXYxK2FnMzRjbmNPSmVyU3NO?=
 =?utf-8?B?WDdtRDZyVDhtZFlwWE9wNEtJOUZDNWhVZnl6MHF6Rk9Ea2oreFAzRWJTSjda?=
 =?utf-8?B?dVdWV3hFc2xyTnZJb1dzSWJjcmx1MURuZFlyMlJXTWlLNGlmVUdLejZtbmh0?=
 =?utf-8?B?K2NKVjJ0elhqNVM0U1RYV2w5M2xMQnBmUTZhYml1czlrcHRCeVV3ZDFaT1ZU?=
 =?utf-8?B?bHFwVEdlZE5aOVVGODFxNFpMWlJacVlHcy9ubTJwalhCRlNsZWpwM3JDcmV6?=
 =?utf-8?B?NUJqaHZxaGV3anlBaEpyOEZrUzBxb243b09veWUybWJpaXJ0MWg0LzhucTkw?=
 =?utf-8?B?NFlET05NY1ZPc0hkak9Rank3QU9LNGNXdjZHb0swajBFU2t3am5OVk9aRExP?=
 =?utf-8?B?VFl2clVwN1owRy81N0t0Q1FibUIrU0hIVmU4ODdHZFRqMjNhekswUWdsbm1o?=
 =?utf-8?B?TXVwcFdJZkxlcXo4TjV5cjduSzYwSTZIVW1IK2RnMVR6cXVMeGEvdzlRV0px?=
 =?utf-8?B?a1ZabjBFdFdQNVpkU1NIQlUwYnpQdUJ0cU9zNktEbTZVR0lQcUpFMEZPbHlI?=
 =?utf-8?B?S3Y0dVdORjNPVGcxczVVUUJkdkhHRU1NazZ3anN3SFczcDhmNlpJL1J5T3RJ?=
 =?utf-8?B?dzQ2QVhjaE1rZWRMVGorT3A2cE5SQXUwaVJtTnVzVFhSRzVId3BpN3JTRW5i?=
 =?utf-8?B?UHFwZ29iTUtyTjVrMTNBTGUwM1BreUErUXZhZm1jZ3RZQnFPQTlMYTd3dUh0?=
 =?utf-8?B?cDg2bEtEdWMwZmEvRmtlaUgvSkZRS1kyOVV4VEo1anJtOGtpU2FwV1dYN3N4?=
 =?utf-8?B?a0JWWnMxcmt3MXN2bjhLSlE1L3B3ZlJCSEZSeGRWdFR6TzVVS1NNakpkSzVK?=
 =?utf-8?B?OTdNeDVCM2d3VVUrYVMvTy82ZjlDKzZEU3hOWkthZ2w3WkxFNmd4ODB2UWFu?=
 =?utf-8?B?OExUNlhMTkMvcjliYjJoYWFzQWJzVEFhT2R3NnRHeFFVeFFEOHY1bTZScGg0?=
 =?utf-8?B?bnBqY2FiWWZyRWRmSUt6TnJnUUcwMGdhTXRneHY3YXNHN2ZnTW5qYnFoOGhj?=
 =?utf-8?B?SUswSkVFZXo2Wko3TjJEYWZZYXQ1SFozVnIrdml6bTU1UmovRlJRUXd2R0NP?=
 =?utf-8?B?cC94d01vMGdFelMyajk0eXdaZ09GeXd2TEpYcmY5WC9UQnZPVXJJNm4zZHBM?=
 =?utf-8?B?M1E9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a855996-46fe-4f66-da39-08de2e6d4a30
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 11:00:06.5201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lNWBjMAIHpbQ/0Jq8dJX5QOqHDTBu5kqTX3QJSiZYzzHuwrm50PJXTcN4CAdZPNywROkirwnTA0hHOK3Uw3ZCypjQReL1IOfYp9+6S2FOvw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB8424



On 28.11.25 01:09, Andrew Cooper wrote:
> On 27/11/2025 10:12 pm, Grygorii Strashko wrote:
>> diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
>> index 17ca6666a34e..128115442ecc 100644
>> --- a/xen/arch/x86/include/asm/mm.h
>> +++ b/xen/arch/x86/include/asm/mm.h
>> @@ -619,9 +619,11 @@ void __iomem *ioremap_wc(paddr_t pa, size_t len);
>>   
>>   extern int memory_add(unsigned long spfn, unsigned long epfn, unsigned int pxm);
>>   
>> -void domain_set_alloc_bitsize(struct domain *d);
>> -unsigned int domain_clamp_alloc_bitsize(struct domain *d, unsigned int bits);
>> +#ifdef CONFIG_PV32
>> +unsigned int domain_clamp_alloc_bitsize(const struct domain *d,
>> +                                        unsigned int bits);
> 
> Do not convert this, or any other domains/vcpus you see, to const.  I
> realise you have been given conflicting information on this point, but
> the maintainers as a whole agreed to not const pointers to complex
> objects in the general case because of the churn it creates, and the
> repeated examples of MISRA violations people have inserted to work
> around the fact it shouldn't have been a const pointer to start with.

It's pure and simple RO function that's why I added const.

> 
> That aside, I think clamp wants to be a static inline here.  (Except it
> can't be, so it needs to be a macro).

Sorry, why "can't be" static inline?

> 
> It's currently a concrete function call to very simple piece of logic,
> where the callers have options to eliminate it entirely in the d = NULL
> case if they could only see in.
> 
> #define domain_clamp_alloc_bitsize(d, bits)                             \
>      (((d) && (d)->arch.pv.physaddr_bitsize)                             \
>       ? min_t(uint32_t, (d)->arch.pv.physaddr_bitsize, bits) : bits)
> 
> 
> seems to work.  The min_t() is because all callers pass in bits as a
> long constant, tripping the typecheck in min().
> 
>> +#endif
>>   
>>   unsigned long domain_get_maximum_gpfn(struct domain *d);
>>   
>> diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
>> index 21158ce1812e..e4f95d8f2fc8 100644
>> --- a/xen/arch/x86/pv/dom0_build.c
>> +++ b/xen/arch/x86/pv/dom0_build.c
>> @@ -626,8 +626,9 @@ static int __init dom0_construct(const struct boot_domain *bd)
>>           initrd_mfn = paddr_to_pfn(initrd->start);
>>           mfn = initrd_mfn;
>>           count = PFN_UP(initrd_len);
>> -        if ( d->arch.physaddr_bitsize &&
>> -             ((mfn + count - 1) >> (d->arch.physaddr_bitsize - PAGE_SHIFT)) )
> 
> While you're editing this, blank line here please.
> 
>> +#ifdef CONFIG_PV32
>> +        if ( d->arch.pv.physaddr_bitsize &&
>> +             ((mfn + count - 1) >> (d->arch.pv.physaddr_bitsize - PAGE_SHIFT)) )
>>           {
>>               order = get_order_from_pages(count);
>>               page = alloc_domheap_pages(d, order, MEMF_no_scrub);
>> @@ -650,6 +651,7 @@ static int __init dom0_construct(const struct boot_domain *bd)
>>               initrd->start = pfn_to_paddr(initrd_mfn);
>>           }
>>           else
>> +#endif
>>           {
>>               while ( count-- )
>>                   if ( assign_pages(mfn_to_page(_mfn(mfn++)), 1, d, 0) )
>> diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
>> index 9c4785c187dd..ad40a712ac5f 100644
>> --- a/xen/arch/x86/pv/domain.c
>> +++ b/xen/arch/x86/pv/domain.c
>> @@ -230,6 +230,29 @@ unsigned long pv_make_cr4(const struct vcpu *v)
>>   }
>>   
>>   #ifdef CONFIG_PV32
>> +unsigned int domain_clamp_alloc_bitsize(const struct domain *d,
>> +                                        unsigned int bits)
>> +{
>> +    if ( (d == NULL) || (d->arch.pv.physaddr_bitsize == 0) )
>> +        return bits;
>> +
>> +    return min(d->arch.pv.physaddr_bitsize, bits);
>> +}
>> +
>> +static void domain_set_alloc_bitsize(struct domain *d)
>> +{
>> +    if ( !is_pv_32bit_domain(d) ||
>> +         (MACH2PHYS_COMPAT_NR_ENTRIES(d) >= max_page) ||
>> +         d->arch.pv.physaddr_bitsize > 0 )
>> +        return;
>> +
>> +    d->arch.pv.physaddr_bitsize =
>> +        /* 2^n entries can be contained in guest's p2m mapping space */
>> +        fls(MACH2PHYS_COMPAT_NR_ENTRIES(d)) - 1
>> +        /* 2^n pages -> 2^(n+PAGE_SHIFT) bits */
>> +        + PAGE_SHIFT;
>> +}
> 
> The single caller has just set d->arch.pv.is_32bit = true, but the
> compiler can't eliminate the first condition because of the embedded
> evaluate_nospec().  Nor the 3rd condition, because it can't reason about
> the singleton nature of switch_compat().
> 
> Thus, it would be better inlined fully, as:
> 
>      if ( MACH2PHYS_COMPAT_NR_ENTRIES(d) >= max_page )
>          d->arch.pv.physaddr_bitsize =
>              /* 2^n entries can be contained in guest's p2m mapping space */
>              fls(MACH2PHYS_COMPAT_NR_ENTRIES(d)) - 1 + PAGE_SHIFT;
> 
> 
> which is rather easier to follow.  Even the comment about PAGE_SHIFT is
> more noise than help.

To clarify my understanding - you wanna drop domain_set_alloc_bitsize and
inline code in switch_compat(), right?

> 
> In an ideal world it ought to be in its own patch, and in principle I'm
> happy to draft one with a fuller explanation if you'd prefer, but given
> the repositioning of physaddr_bitsize into pv domain as wekk, it's
> probably all better together in this single patch.
> 
> ~Andrew

-- 
Best regards,
-grygorii


