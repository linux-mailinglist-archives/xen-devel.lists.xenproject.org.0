Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED248C73F6F
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 13:30:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1167228.1493564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM3no-0004zV-SC; Thu, 20 Nov 2025 12:30:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1167228.1493564; Thu, 20 Nov 2025 12:30:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM3no-0004wo-Oh; Thu, 20 Nov 2025 12:30:20 +0000
Received: by outflank-mailman (input) for mailman id 1167228;
 Thu, 20 Nov 2025 12:30:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ChS/=54=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vM3nn-0004wU-7v
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 12:30:19 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id abc85bec-c60c-11f0-9d18-b5c5bf9af7f9;
 Thu, 20 Nov 2025 13:30:18 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH7PR03MB7416.namprd03.prod.outlook.com (2603:10b6:510:2f2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 12:30:13 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9343.011; Thu, 20 Nov 2025
 12:30:13 +0000
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
X-Inumbo-ID: abc85bec-c60c-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ka+yE0vI1LbEhJGZ1RWMY7QwW7fVzC3scssh/sIMHSFkD5apAoxrI5QqNtk7BPH2w+27FguCAPlMju19qjJ9YEyk59QO39KCvDcNXHAfIDQIC0dFTXAzx7zTq9XZfuYy4++yZhIIpFuxWoOxj4cwkGZ5hg7FZdQ5jb9nik69wnSU+LqBPePz0GXh4V/oPZj+tETwrapx7Qe+PgXPRQIC3M8J7YZ8Zf4mnu2E+2VGiv2/iDt3GoYogeGTat4hdETmi9WXAC5QVbXH9izJ8VVr3d18aE5H9z/qMaPBplhwfDlCL2cVpFtu7cExvTBVXRHyR8KFzyo3g3U6I+Mk5hY2Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Shx31ILeRVrewlhJ7mK1VRZ7Ik6JKaRuQFmH0HypEs=;
 b=MDkG25UYk0z1n/z4N9DOkggezO8ld+n9Q0xY4aWudnFngxU6URm9XiCqB/fCfZFYlJuXHpaRPWU3TLc5prhMMRkVBMqQMAzPsqALlTpyfmaQd/1k2dTUf4r8TXDgUfv9k0M353vDSd8CInuEKn3xFZZH0f0GLha80QA6RyW/PKdlh83RG4fLMcWHKNb+T8kxx3S9u+P/YkbhHOVcPfoi1QezLlTOeKuCNehejtLiUFrIG6t6pab5M5kMVygqj8F2WwpiEa3TE9EyXZ44TFYNvotBnEULPl05V4m0iEsB1zNaiph4+uQl7iymeIPZ4S4XSU/atIqOsOeyIKsQrwu2Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Shx31ILeRVrewlhJ7mK1VRZ7Ik6JKaRuQFmH0HypEs=;
 b=xvUqNYrAB4twtCgYUrr+wObKiaJ7Y3ciWhvJ22Ea95dZi39m+h76XebruaS3wXC/eKLwRGqkzxiPAnxyw4eh+BLJyzYP2OyRCR+OelwOl/RSY2oR87EDoiJbO+ph05YeCJ0dN7RQ9XGnzMfL4nbcD+wOA2VP5vkRRDYcbRCW2CU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <73717441-ae18-4e1e-95c4-3186310b93df@citrix.com>
Date: Thu, 20 Nov 2025 12:30:10 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] x86/apic: remove vector_allocation_cpumask hook
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
References: <20251120090637.25087-1-roger.pau@citrix.com>
 <20251120090637.25087-3-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20251120090637.25087-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0497.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::22) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH7PR03MB7416:EE_
X-MS-Office365-Filtering-Correlation-Id: d17e04d3-a29d-4157-104f-08de28308da7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q0Q3bjByQUFId1pqM3lXaFhtRkhOTWNUelQ3bXN6aE5GdFllNkdjcHAxcTRh?=
 =?utf-8?B?aGRHc2JCUGRjeUFPZnhYRDIvOG9va3lSeW5xQTE1TEc1ajhiUGtzSG52eUl1?=
 =?utf-8?B?RWlLK1J2Y0hmaGlSbnhpRHdVSUFpdnR6U1ZRaDVoSkZhTUlub0Z5dk1BVWlj?=
 =?utf-8?B?a0J2UlhvVEpPR1pGNlJsRWN1dEJWcVJINDFsYVV0VjByS3pIdHZIdEttOS9F?=
 =?utf-8?B?UkpxN2w3ZEZUL2hXVnpYc2IzaEFrVTJFZlAvbGR0emFlekh1YTdxZnNuTENL?=
 =?utf-8?B?YW9VUDZxUUwzSWlSOTUxQWEwVHVuajh0d0ZUL1ZEbWt0UVFSYVNoU2ZhUnNu?=
 =?utf-8?B?eFlmbTlaZWlGZDRVSk1TZ1ZycGYwRE0rdXZKeDlYYVZKOWZpVmxzWXFVZXo5?=
 =?utf-8?B?T2dUOStKdHFJRVZGbUQ5bE1Zd01ncFhaUTcwQ2pvaDFzVFZHVUhOUGQzZ0I0?=
 =?utf-8?B?Q0JWajhOdVlYaUlrZVhKVmc3SzIvOEFlRjd4UE4yUG5kV3dCVGhxVzAxQnU1?=
 =?utf-8?B?cjVnRVp2Y0lIZ2F3Y0lMT0UwWVA4bDkrdEVsdTJhNnpOSGllY21zMjhpK3Uz?=
 =?utf-8?B?REtXN21UaGd6M0xaUzVXZXFZYXhabXkrMHRaNmRuK0EwSUJnMlZVV1dQcHhQ?=
 =?utf-8?B?bVN4R3lQNEFtNGFaVVlRUlVGUm4yS3R3NDZidWJUdGVzbnppUEVnbm1NdmMy?=
 =?utf-8?B?cUQrQytJd0NvVzNvbFJzenZKcnZjTm8xbkVReGFaWXpGaHZua2EzZjJTVXlW?=
 =?utf-8?B?Nk9KQWczVFpLblN5U3RsT1M0RnpSM0wzdDdiR2R5SnNLMDJYZXUveUg0dkFF?=
 =?utf-8?B?Sk1ocUZ1SlpyMFlmdzZtcEQrWlVVN0FXbi9xcVdwZEZMUU5kb3Y2T2dySDUy?=
 =?utf-8?B?ZzFFOVFINFJHdnphN1J4Q0UyMEN0QXRWZ0J1U3M3Q3FURlg3VU5tUTNIdWhH?=
 =?utf-8?B?eHlsREc3NDNFdm9GelNpbXArcDJFQ0grNFN2c2ZOUENhZDdjLzh4R2xjTmZP?=
 =?utf-8?B?NkoyaEhGMkFDOHV2ZVdRLzFWQ2hwK2wrQ1dSUXNQNENDOGhIbnNEOCtxbGVa?=
 =?utf-8?B?TGRHZjlUTndkK0tmVlRGWkNFaExLV2xxcGhNRWpua2svYWF2VXlIY0hIQ0l3?=
 =?utf-8?B?TTRjQnVpU3dFNEc4bDZmUThGcmdYRWRkWWZ0bFdreW1URXhDN01sZmdzVHQx?=
 =?utf-8?B?S0F1TEZraFJ4aDJqNW9yUmpRQmI1eTR5N2VHOEN6QjNseVNWSGtRNmNSbEE4?=
 =?utf-8?B?bmNJVXhNSnl0VmJvVXMxcWo3b1hOQlVjMUl5aWwzNWlEQTNhdnVIMTJjbVlD?=
 =?utf-8?B?dG5ER203RzV2UkxHV21RSktlMnNCVFdCc2Vpc1JBZ3diRXdNdnRRYVhQTXdH?=
 =?utf-8?B?Vy94aFJoVHlqRUhiV2c2Qm50OGhISEhNbmxhZnZoMmkyS3VXcktVVWVIYlVr?=
 =?utf-8?B?UU94TUcyNW1NL3M0WHFmV1kwVTV1TE9KaVJidmVKNFM0Ylk0eWJSWW5KVkUy?=
 =?utf-8?B?bDYxNTliRnJFWVBUblptR0lYWTBwUDJmY3NBTXA3K01iaW9PZ1dGTHk0OWlK?=
 =?utf-8?B?ckdSLzJWTEE2clA4cXJuejRTa2lrbHVhcWNKc2RzcDRLMEhGWWhSUDRzeHJp?=
 =?utf-8?B?MlcweHlVOWNYTmpLaWZtTEFFVEpjK2ZKNlhjSi9iSXpQN0hueEx2N1piQTNV?=
 =?utf-8?B?TmRQdmIyejV0Yk9TK2FlcHg2QnoxaXZnU0p5WVR3ZjROcmF0bzVVSWxXL0Yx?=
 =?utf-8?B?VWNpM29Va3VjaGEybGZrSzZDalZxdGJJMkNsSit0RXZ6QVpZSmoxZFZ6eGw2?=
 =?utf-8?B?T2tOUnhRVDQ5SlQ2YktHK0QxdXpXb00rMnFVM0kxTHFhRU54MkRYNVdLWWVF?=
 =?utf-8?B?a0xQVzYyUlVJOFZvMUoycnEyNWFlRDhOajdPYWdSSFo5V2hhWWFMRnBwNGZP?=
 =?utf-8?Q?w7k3EJtBSXQb4OmniZ7VrGJycLAZT8V2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2VSa3JmVVVKa2JqV2t5dXJJRk9sMFUxSGlqNDFLU05nSmJPblZIVysvUTRS?=
 =?utf-8?B?ZTYzUnJhakdpZllsNU5NR01kSkVseU1WRzd2SnljNkR6T2phUmxhdkZKRm9o?=
 =?utf-8?B?M3gvR2Q3alMwZHBhM3ZhSk9OWmZRaGQ3UHZLRmZ2bTA0RU5PVHh3VWJpRGlW?=
 =?utf-8?B?SjZoV0tzS3JFdzJ2NitvYTAxQkdTVVk2TWNtR1pLQ1NwcWMyRFRJc25vNjFw?=
 =?utf-8?B?TkY1V3ZKZWIzRUtoU3p3SExYdVlENE1hQUtjVFcwbjdCOVlvVlVYMGU4bHho?=
 =?utf-8?B?Lyt6bHBoL1lJaVBYajd5Yk5kNE9SZXd2M0NkL0Z0OEswTlJtTjdxTVBSTDdC?=
 =?utf-8?B?V3dLUmFVaEpmV3J2bVluUFF1Nm5LYmt4S0kyYVlkQXc0c2dQY0I0bmhYUHRu?=
 =?utf-8?B?R0tqeEg5c3FQaWtQZHdpdUFKMDkvSnMzWEJoMkdmRTFJdnVzSXFMV3FtSURk?=
 =?utf-8?B?ZVdNSGJuYVUvZGJCRFRaTXk1NFVlV2JjeGhuWFFFSER5RDJxTHdoL0R0cjNB?=
 =?utf-8?B?RFpsREdaZnByVjl5cnZtU0dRU2EzWkR2TWhCQUdpQS9RTEVSVXAvQlVYK3Fo?=
 =?utf-8?B?RnYrVXFJWVhEV0RJdVI0cXpnalVQVCt1UmFvWkl6ZnhpZ2V5ZFpjZm5TZUhJ?=
 =?utf-8?B?aTd6elBMYVBCK2J0bjhXQUFoWU13dWZZMUFRU3Z6WHF5YTZLZlp5Rndzc1JS?=
 =?utf-8?B?WUdUWXJPNzVObFVhdHRqWDZXZkxRdE1vRDVnRjk3L0Q5Qm9yVHJITjROanZZ?=
 =?utf-8?B?SGd3YzNaWFlrRmpWSWJaOTRHN2psRFhlNVlZbzRGa2pxbWk5VlZ3NitQK3lL?=
 =?utf-8?B?Ny9BWEtla2JLbDFQa01RSUNhYXczdEFvYnlsTno1YVB4bFJXcHF5alZkZ3dh?=
 =?utf-8?B?bTBkS2hldW1qY3lQaHhwcXE4NFY0ZWJuK05QcnhZZnYvdlF6WVlveWpPVm5R?=
 =?utf-8?B?OUhyenEwVjRJME9XQ3A5R0piTVBpN0liS3hLdUhkNGFjRnhLNUE5aDdnZE5Y?=
 =?utf-8?B?dWZ1bS83QkVNZjBSUWN2clVMY2lqKzREYjlWMjkrM3RWTHk1L1FVVi8zN0dV?=
 =?utf-8?B?R01EQ3pCd1NEbzJmQy85TkZDM2FzelgyY1hFSitISDc0Vy93Qk1Ja3ZiaUFT?=
 =?utf-8?B?QVhCbTdCTmo0ZG93RDNzRWUxdlczTzE0UURDQnVMdExmRU13R1RISGdRUHgz?=
 =?utf-8?B?UlZiUnZCWVJYamRxMXZFL2xsK2JjSk1WT3pCelRGRFhlM2QzQmRIUDRvQ1pL?=
 =?utf-8?B?akk2R3BIK2grTzJDNEhDYTk3TE1qb21sTFNTd0tqRUk4dXQyR3NQYkdmYUtY?=
 =?utf-8?B?NU0vUCtSMG8wbkNodmV4THdxUVp0V291Nmp4VFNVTEUyOWtKTjN0TTlwMGdK?=
 =?utf-8?B?S2ZkL2ZkV3JEU0ZUN2Z6Y0ltb0pWL0Zua09NdlFDUDBVa0FsOVJ2RXhBSFl1?=
 =?utf-8?B?eUI4dEdMSUxUZDFtNE53Rm5oS3EwYmg3VzFEeWczYmxSTExGZjZuZlMyM1Vk?=
 =?utf-8?B?b3RvWTl4QmtLWk41NnlXR0NWVkl3Ny9HU0hZdEpqZWdIRzhNTVJSZFlNVlFn?=
 =?utf-8?B?SFAyNVdVb1ppaXptcFVzZkZ4VVRaM2VRdFlESEF0MW9RNFE1aFIyb0VpbjBa?=
 =?utf-8?B?eURtOG52RS95cHdsR0VCQy8xSWt4bkJxbzBVeGVXWmVheG9OMTc0WGpBNXln?=
 =?utf-8?B?U3BaeGl1U3FIMnZNZHV1Mk1lMXdNSTFCQ2dnKzV2cnVkQkVKQWlVcnJNOEFH?=
 =?utf-8?B?eFJGYzJvbEoya1J1SDJ1OGc4d1VGSlFmRkthUTluNTJFeVFGUDY5MG9nTUYw?=
 =?utf-8?B?R21GQ2gyVWJ1VlF5UUtWOU5xQUJldkpORjVkNTFXUXJPZ1NPY2lzdFc2NGFr?=
 =?utf-8?B?Sk9QbTBRL2pBODFmK0QzVW1GVXZPMk9yYUFPdUJ6VFViRXNKK1VtWGFJZ2Vt?=
 =?utf-8?B?ZGo5bVp0NjFKd1VzQk5iU0ZZTFRqUitBSWtRU3lmSldCVDFDZlV4UEUxWjZM?=
 =?utf-8?B?NFdubzdWaTA1Z2RQQngvOUpEQVhESHZqdko3bTNXS3NXRjdWaStwMGRWTjNv?=
 =?utf-8?B?bDNIMFIxeWl3bVdjWHRSaldaWHRhTWUwbjNoMWwzS0w2TnB3eDNYRW1HMXZz?=
 =?utf-8?B?dXROTDJUMnF1VERwVlc5UWZhZEVKNXBJZG9md2haa0Q4OEVERGN4NGVBWjhN?=
 =?utf-8?B?UEE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d17e04d3-a29d-4157-104f-08de28308da7
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 12:30:13.4880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WfpvIGGDD+ZRtdZkByV8I5I5WMoRBgUWABQpufSHAif9JQo2LRMj2oYIDjCcd4mfExuraYiwBGxnt6wTxxXdKac20tAkfYcWpw+qlc2m9IE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7416

On 20/11/2025 9:06 am, Roger Pau Monne wrote:
> All implementations use the same hook which is a wrapper around
> cpumask_of(cpu).  Adjust callers to no longer use such dummy mask with a
> single CPU set, as the CPU is already known to the caller.  This removes a
> pair of usages of for_each_cpu().
>
> No functional change intended.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>, with one suggestion.

> diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
> index 80f7417d2103..7009a3c6d0dd 100644
> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -650,13 +646,12 @@ next:
>              && test_bit(vector, irq_used_vectors) )
>              goto next;
>  
> -        if ( cpumask_test_cpu(0, vec_mask) &&
> +        if ( !cpu &&
>               vector >= FIRST_LEGACY_VECTOR && vector <= LAST_LEGACY_VECTOR )
>              goto next;
>  
> -        for_each_cpu(new_cpu, vec_mask)
> -            if (per_cpu(vector_irq, new_cpu)[vector] >= 0)
> -                goto next;
> +        if ( per_cpu(vector_irq, cpu)[vector] >= 0 )
> +            goto next;

Please can we have a blank line here for legibility.

>          /* Found one! */
>          current_vector = vector;
>          current_offset = offset;
> @@ -688,12 +683,12 @@ next:
>                  release_old_vec(desc);
>          }
>  
> -        trace_irq_mask(TRC_HW_IRQ_ASSIGN_VECTOR, irq, vector, vec_mask);
> +        trace_irq_mask(TRC_HW_IRQ_ASSIGN_VECTOR, irq, vector, cpumask_of(cpu));

This highlights that there's a problem with tracing on large systems,
not that there's anything we can really do about it.

~Andrew

