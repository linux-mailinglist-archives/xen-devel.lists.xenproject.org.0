Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D21C65AB8
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 19:12:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164234.1491237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vL3h2-0007Jg-6a; Mon, 17 Nov 2025 18:11:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164234.1491237; Mon, 17 Nov 2025 18:11:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vL3h2-0007H5-3r; Mon, 17 Nov 2025 18:11:12 +0000
Received: by outflank-mailman (input) for mailman id 1164234;
 Mon, 17 Nov 2025 18:11:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RXl4=5Z=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vL3h1-0007Gl-0F
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 18:11:11 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cab33332-c3e0-11f0-9d18-b5c5bf9af7f9;
 Mon, 17 Nov 2025 19:11:10 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB6455.namprd03.prod.outlook.com (2603:10b6:a03:38d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Mon, 17 Nov
 2025 18:11:06 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 18:11:00 +0000
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
X-Inumbo-ID: cab33332-c3e0-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U6z1/GCd69nZCpUbRNXHxOCzX1XyDz09Qa5DXNHotTfcX8D5+d7v0pmha52sI7TaLb/u6P/9hsYsgeH6hVUfENp+5+8/mMS+1mXczUdwuXGvSTEr+yPfWB/h9OCSFP+54L9Hq2xLvjN8E5fKfgIkSuXikIy5y3eHtJOmo/S3r2OYC9+L23GbCq0DyMSxkZ/D2W7xmJlk2f668NsJijdeMwN3gKfT7cyp8TMJODcVDEry8tFRnmGPaxz/5rBSq05PThXDNI+I8YG7pcLXZ7bohblq4CdEBKMXv2m0TJUyC1s8vV7RRJiHeErbT18tlxrFYFsiAOlNn6LZ3ey0ZVEUOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vwmWbBDu5+zyY602Bfbxmx109B9kwFEAij1oVSKnrzE=;
 b=keNfWw/Kw2FwQJyuPZviGeTDxBcuJcLEgwYJ5bh5LZARxcwgQJtxyCJcpXbdU9nTLPWhWahJLViuSz+zTTiyfqerdHtfsNVWy8KDERM/Ig3g7IbaVcv1Pd4FaofoiPhYDWOCFA7HVVykjsttPj0x3hRkvaazpXmo9cRPssQxLrDze+XbsJQAArmVjiIYa80j1F/OuvjnyoKXbz2UInGgAgyQS7A68OvKufdcUwlFKZKUeCaAW2ajVT1THoTTBWffyNIoqVRXrkw/yRCnWVruI3Y9MjkAB4AJ04td3nMr+H69LgAlDRRNBAfjP0nL1XnKBX4AfneULUcq1jKVpHKrzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vwmWbBDu5+zyY602Bfbxmx109B9kwFEAij1oVSKnrzE=;
 b=oqq5tTnMAwKgDq4Zic4PJUn6T2PTHQBqGAxBXjJbkyWWHV59PeL+xEX0N9rfdtlt6S3YLZIvL/VH2nE+c2YgPpTv9YDwSjGHQNlf695qApLXSokIqTGJZo/1BBS1M+6+CGdd2Tm+hy+JxdML/jp9HXHTvjTqXqJKkIB5GRa1R+o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <99f43c5c-5f34-46ab-bf2f-a0afa30256f9@citrix.com>
Date: Mon, 17 Nov 2025 18:10:57 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86emul: replace custom handling for SHLD/SHRD
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <94bdf8e4-188b-4d04-a52c-0f598d311d46@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <94bdf8e4-188b-4d04-a52c-0f598d311d46@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO0P265CA0011.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::19) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB6455:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a943bec-2533-45ea-b149-08de2604a9d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RVRDK0hOWmVWK296STE5OTg5TDZnOVpnWngzSDljV0puTWppb0NrdjZYSW5G?=
 =?utf-8?B?VVZqRW1Pck4wNmFhcWJMVFpKR3hCQnh2bDlITHJnRjFhRVk2RER6dytHaWdJ?=
 =?utf-8?B?S3lDaVRGbmIvTEZnWGxNSUhkYnN1K0E5bHlTdHYxUUwrMUhjTStvOHU5TVVM?=
 =?utf-8?B?SjhBMWEraUVXNnlndEFrT0tVMXR0VlJRNkJ0OTNMMjQvSEJtVURmSnBDbnl2?=
 =?utf-8?B?RjNkOFgwYWg0TEpmYlhzNFFZajBCaHdKWW8vcC9NVDRJVHlTY0dhcThMTll5?=
 =?utf-8?B?L1pPeGdTT1R5aGZtTlFDeTdLclEyMWExa2lJK29OMVJNa2t5UTBLTFNZTjBY?=
 =?utf-8?B?ZXE4Wkd2SU54SVY1aVlvZlZpYWtDdTMxNkZ5SDFHaTAweVNGTUhENmFOZ1Js?=
 =?utf-8?B?L3pCRkdjekxNcXR5TVJjdVRmOWhmczhDVHE4dmVaQkU5UjdJb2hqMHhTM0M2?=
 =?utf-8?B?d1ZwT1I4OWNaQ2JlalI2aWVzSjNqdGxMRXRZdjhkREh1QTBwOEJhTytBZzJU?=
 =?utf-8?B?MUkvVWo2NXhJeVVkdXIyTU5nMDZVZDlJM29OdG44YTBUSGMydDYxV0JkUTI0?=
 =?utf-8?B?b2NtM0d6Q0lTME96OVZoMVJtS0dsUTVJemJWb0p1b3BVakQ5UjI3SGNxZ2RT?=
 =?utf-8?B?WHNJTFY3VVpsNVF0THFVVzRaczFxZG5ZVzZYNWNJVW1yOW1DT3VUYTV5QzNT?=
 =?utf-8?B?MnREZ09CTGJJcnRtbXBBcHgvais5c05KSjRkdzNDM2VzRjUwbUlMOExPTERH?=
 =?utf-8?B?eDZycHNydExYcGtwU0dYWkNQZUY4WXBLRnNkYzFMUnptd3lLV25mWnhtYTBq?=
 =?utf-8?B?MDNXOERJZloxRnVQbkx5TmRtT1NvUjV2VnhjS2lCS1pvMHNoOTN5S0syRk5S?=
 =?utf-8?B?ZTBkU1ZBcDBMdmJmR1UwZzBxR1VMcGRmTDNPMEFuVjVxU0JLOXZCTXRYbFdC?=
 =?utf-8?B?aGFEUXFBRnBJcmtxSHdwL3pYNG1nTVRLRVE4ZXhXZ1RFV25JYlM4S0lJcGVq?=
 =?utf-8?B?UHpMSkRsSDg1Sk1PRDA2dDVnYVZnOHlVcDR0Um85T3RFYlJMVXVtWTdxNlV3?=
 =?utf-8?B?RkdIdWI3ZHRZcUVvWXdSeDJXZ2tqbjE1eG9makhFeGNNcitpMUpSWC8veTBi?=
 =?utf-8?B?ZnpjcUUwWit4TFJMSDJJY3NOLzlUWEM2UkFBUXh6SXJTeWFNYzY1a1VPbW1S?=
 =?utf-8?B?NlcxUzBpcjkzanZDN292WU9tYjMxOHltT3pvLzN3M3o5Q3A0VVFvSEpTS0Jk?=
 =?utf-8?B?L2kxaHhycExVdUJxM0lPRVdITGxORTczb0Z1citPWnhRd3FLRlhveDZUaGlI?=
 =?utf-8?B?SVZvbC8xbVYySW1DbklnRnJSNUwrZElqUTdUWGdON2pCVG43RjlLTElBTEVl?=
 =?utf-8?B?aWtCWGlvMkpYb1UyVDBpN09zMEYyTnpzaXRYU0NKaExJdHQwWXhYZnRKT0o1?=
 =?utf-8?B?Qk9lVEZVNFNBUFpyNzhrK0Z6ZTJ4d1d5SlZkWU9ZeHNnL0dKZjk3aERCMHhK?=
 =?utf-8?B?TmlyaGZaYXVGL2VWSmd6YjNNaUs5YnI1elB0eXJpbHQ1VzlZZFFQbjRvZlE0?=
 =?utf-8?B?MnhPM1gwVkd4cDNab3pjUlN6emFNeDJlVDNQRnFBdzkrbW5pb3NmWVJRajVJ?=
 =?utf-8?B?Qko2L09ERDJoclE1TVpkZ29iZ3dhb20xUm5NVWdaZTBoZ3pLempOdGhZSGg2?=
 =?utf-8?B?R3FqdW12SC9nNjlnSWR2alVQbmNMZHBnQkE2dkRhdVU2WWhEMjV3dE5McWRP?=
 =?utf-8?B?Z0VnMUxBc2ZsS21SZWtrVnFqL0UyNWVqLzVsVkp2VW9tcVM4cDViYXBUQXU5?=
 =?utf-8?B?d2lvZmgxU3FaenQxQWVJMy9sdlN4UHNBSU4xWmdQVGY0dTAxUjVhTExjNzRB?=
 =?utf-8?B?bjBzRHpJOHpxLzFnVmprbXZTbG1RWlB6QlFkY0U1K0lSM0JnT0VqTEVub3hM?=
 =?utf-8?Q?bfKhsM8IV4MRmYLuN35d5LaYq07RGwdo?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UysvYXFpaFRhdFhncTlGUVo4TFVIUWRJSUx3OG5oWU9ZSFFCTkdVanhrRTZr?=
 =?utf-8?B?bFJBUnFRU09aQ3dlNHVvdjYxSlNGc0M0c0xCM1c3a1hLeVM0c2tWbmlqUXRh?=
 =?utf-8?B?TjUrOWVoWktVelE0KzUzNENoZFh5d0k5N3hyNEttNWdGclRZYWw5blI4S0lj?=
 =?utf-8?B?WlRvNC94WlpwaCttdVM0YzZsQWkycUlyODdnamJnM1hIWU12N2QwaEFLckwz?=
 =?utf-8?B?ckhrdTk2R0x0c1RuTnBJU0VkUUxXMjZ0V2FCcmFkdklLbE5hTzhEd2FkTEJz?=
 =?utf-8?B?WDh4OGJxMXY1cDFFYitZZC9NOEd2NUYyc1VUK2kyTXlPMEtGakMyQUhoMHVj?=
 =?utf-8?B?cmRzeVVod1ZJbWFoendSbVFlRTRPeU0zam9iUHo3R1UrVWZsT2tXRTd3d3FG?=
 =?utf-8?B?ZTkvYzI1K2xoMU9Sb2EwcGFFNjJhVDlqWkZndEFmQm5wcmhJWkFWQk1kd3Ri?=
 =?utf-8?B?OFFsdGc1QStwbVlpa3lkand5WEsvRDRWL0w1ZWdDLzY3R29La0VKQ2h3WnJL?=
 =?utf-8?B?R2p5MXE2TDN4UVlYRWNwUUVUSDFLTWl2R1RKUHA3SHBKbzNmTm0wRlkyTU5n?=
 =?utf-8?B?RjhmNXZBMVpMWmxpQ1crRUZKNW5QbE1ONWxSOUdOZDZVZEJNK3QzWTZxWGMr?=
 =?utf-8?B?YThUMFd6VloxU1pWbE1wWjV4SWF3M0NIeU44MVVVOFZIRkFjTFFYQVNXdW5G?=
 =?utf-8?B?Wm1LVnB5bldkNTEyME5qdkJ4M2cyaHAxYSsweTd1WWVkbks2TjR6QWhmaEcw?=
 =?utf-8?B?dFp2djJUeWxmTTJXMnNjdE1sd1ZhdFpyUzRpeFVLS0tZQm9pcXdKNDZ6a0F0?=
 =?utf-8?B?WGJUZEhCZkx4YmlVRk4zNWhnYnRubDRkaWpZNGYzNEprZlZER01UakhGNHBL?=
 =?utf-8?B?QlRJUlFxSVZqN2wvUjg4WGM5aWlDMUpHVFcycERxcncxUk1DOU5SS1pvWTVD?=
 =?utf-8?B?YmxNam5OSSs4eE02Nmt3L1NuZXo5MHlDK3pMeFNDUyt1b2JPeHovOTAvN1ZZ?=
 =?utf-8?B?NlZoS0xMcGZaQXJEdFQxcEVhUnVyd2hFV1NjRHU5VXNaclpuYVlSZFBJcEti?=
 =?utf-8?B?YjhEbUFvMmtBWWhvSUVZVGRGSjdjR001OHplM1JVclo5Qjk0bHJzRWVwdW15?=
 =?utf-8?B?NFZZc0s1SURVSmNiSGRhK3I0bFVtNlBmblAvM05WKzhtZmIyOXA4bmR0THZ2?=
 =?utf-8?B?NUNUNDRZbkRvWGJ2amdpeXgrUkZVY3RGRHNBbHpsbDR4dzVETFg2VVFUUHpo?=
 =?utf-8?B?RG9sNTBHVmxvWWwyd0J4S0xIa3luQ1ZjeW5qNFlOZVVPVDluMHJ3dXk3c1R1?=
 =?utf-8?B?dGJBMnR5c0Jld01aOXhFbnQvelR6cUFJUjJPdXlMaXJ1QzJYNUsycWlkcndB?=
 =?utf-8?B?cGxuMDhxQmtWWmlvcVZYRkt1ZE04c3dHUi9MQzJNNGRzNHFZTFJRREVaWFhJ?=
 =?utf-8?B?MWgvNGduZy8xUHJFMFd0M0IydkM2YXdqQkM0N0lpL0pXS0tSR0dhcjFKWW1T?=
 =?utf-8?B?bjdQbmtqK1dUK1VWVUs1Tk55djFXc0NOZVJvU3lDelQyczNReE9TaitTRm5F?=
 =?utf-8?B?bElLcXZvampjVndWVHJlN0hDbm9iRW14eHZia3B2b0JBQWoyVmo5V29aTjNU?=
 =?utf-8?B?OGZNRHgwUVNTNGFGdHBlelc3SzVuRXNMM0Ixem9obHBwbWsySDBSbTRDRmxk?=
 =?utf-8?B?YWtjRjBxRTlOaVBCd3FodFdxT2pkcVhaREg2UDg4blJXMWVGb2pMRFVPTTJv?=
 =?utf-8?B?QkxQQnBRbk5uRTVscndUOVdKSTlTTVdSa09XdmczWTM1ODg2YnR6Rk15U0pu?=
 =?utf-8?B?TDFEMFZ2ZVBQMUp4aHFOWUovaXpiTlNaSkVQL2lHMHJScGdhUzFPMXZvNU13?=
 =?utf-8?B?bTNOYUZrQkdESFErR2VwcE9UVjh6eUYrUTUxbk9adk5uTys4KzRSTVFsRkpp?=
 =?utf-8?B?cjA1Q2MwSzZzM2RVTDBGd1FYZE90ZUpTZWgyYjFFS044cFVhWi9rdVVjeFBj?=
 =?utf-8?B?ZmZwTjNWaFNCQ2Ntb01MSFpQWEp6YjFQbG0zb1lWRWM0ZXJQSUFDSXNkTWVZ?=
 =?utf-8?B?dHVqZ3IwbXRnSFBORGI0ZmFqUW9zSmhXSDYwajRsOGs3dHBNeUx3ZjhzTkph?=
 =?utf-8?B?WndTaUk3VWd4bFlSamVZSHFuN1o1ejdCK2ttNGdGWkFEeEpnaHhwSGV6ZXAy?=
 =?utf-8?B?NXc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a943bec-2533-45ea-b149-08de2604a9d7
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 18:11:00.6793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LJU3FHYltMCg/blYkQT+dPtex3d0IpdZyfR3NKMcaAnAYJs53mAiiqoA1dKdqCAgtoXC8FZkDeiXtIXTJRIhcJQWwYssWTXlKMNoNfWtgjc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6455

On 10/07/2025 3:24 pm, Jan Beulich wrote:
> Use an existing macro instead of open-coding the operation and flags
> handling, just like we already do in x86_emul_rmw(). While possibly
> yielding slightly larger compiled code, it's easier to maintain this
> way.
>
> Note that the setting of dst.orig_val was already redundant with that
> done ahead of the main switch() (where DST_MEM is handled), the latest
> as of 4e59f578cb75 ("x86emul: simplify SHLD/SHRD handling").
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

