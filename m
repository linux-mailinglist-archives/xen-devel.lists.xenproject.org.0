Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B21B8CA7C74
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 14:36:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1179099.1502726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRVyF-0004fN-5N; Fri, 05 Dec 2025 13:35:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1179099.1502726; Fri, 05 Dec 2025 13:35:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRVyF-0004cy-2M; Fri, 05 Dec 2025 13:35:39 +0000
Received: by outflank-mailman (input) for mailman id 1179099;
 Fri, 05 Dec 2025 13:35:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K96r=6L=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vRVyD-0004cs-2X
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 13:35:37 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45ce3100-d1df-11f0-9d1b-b5c5bf9af7f9;
 Fri, 05 Dec 2025 14:35:34 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB6872.namprd03.prod.outlook.com (2603:10b6:510:169::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 13:35:29 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.009; Fri, 5 Dec 2025
 13:35:29 +0000
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
X-Inumbo-ID: 45ce3100-d1df-11f0-9d1b-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KN+aOQmP93umK3y03EgD75o8zD/zga/nEE/ThQJSo+1rpwjrezgDQwWB2LRQp7xMkT4lHnfwMZGkAKjOoOf5ZWNiDGUQdreCYYiLvVM+3qMXw0csfhvfmEAEKH9oBXXtIJdV03C43L7mnZs2lsPCfyWkuHLE8HWM5gUAPpgSAU2BTLfImnTGFHaS3UZtEfqamW2r/m6DohInV6cQPmBDc3EPJmPERfnMNvLI2Y+tN4EeG6AO40YcBcr/+6zrrb3RzQpMT7rckvvQj61CUiY0E7qoCEZSabZreMNjzK+lC148eWG6v7ZhxF1fc163G2oyO+HYLsVj7ItxYxpUb9qvKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O3dnK4SontG63cblmXZYr/N+3el9CMuZhe7a2JZBNJU=;
 b=IIqafiuGh1Gj4tS8HXyNEvr8mb4qZnAgyzJM2WssicNaJfqxEpA6G526Bx8EYbs6JsIeKIPwXGHZQeyw7obvt80pKx8IQsEr3TrdnYJkF+mIjN2UizTs8/vPScOC2EtKifw1knRuvEEHJJWe90CcnAAdChHKEGkLxuHLfnHMxpQ3ZC5Uf8d0KSDFvPEx+1EZtsKdU7z/AC7IaLhGqb81YUcpqrJRrvKvj4mU1zbQwRiP6fPvQ6U4FPzt8FQBReVDkwyeioRwtmEFDlwRWdmaH/F/g7V2qUhcXRJd9OVYA+051KqVHh+JUc1ZpHMusgTyT9gDusdwSToJwZFdQlsnIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O3dnK4SontG63cblmXZYr/N+3el9CMuZhe7a2JZBNJU=;
 b=flW7/JJa6tYm49NjJRjsNioNBjW9x3i2O3blDoKVFiiIrvv38bCcM1B6IozjFYKBYzbnVEs03R32dqH819Dik8x8nJ90ErAetQgSiNgDVcUB/Rq4nv0GNp8nSLprvou7Dxg6moFNch7CFOeFXK3pzAULT9DXqJGBBAdS4APU5a0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <da9beb79-7d57-4364-a58c-856843b4bb1b@citrix.com>
Date: Fri, 5 Dec 2025 13:35:25 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH v9 09/10] x86: use / "support" UDB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <926a2315-a2b7-4aad-87e6-d686c9da9e3a@suse.com>
 <78b7c8a0-16ae-49c3-8c7b-5b10f5b0d688@suse.com>
 <e2ce221b-f852-4f9a-8a82-322e6f2af522@citrix.com>
 <846afe9d-458f-4ec8-a58e-faf0617707df@citrix.com>
 <c4346077-d110-48ef-acf6-343cf9ce87aa@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <c4346077-d110-48ef-acf6-343cf9ce87aa@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0296.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB6872:EE_
X-MS-Office365-Filtering-Correlation-Id: 68a0589e-e77e-4466-93f8-08de340327c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZXRabkRQT2tGTGVCdTJtbWtFZ2hHRGNIcUVld3pOYnZWZzlCM29NbjNZVVph?=
 =?utf-8?B?YStESmtXQWVlS2FtNm04bVRiejJWSXBnTVp6TmJWN3F5NjhyUGZ5Unl3RmZx?=
 =?utf-8?B?NUMvSmdYQTBiZ2p1ZEdHZmt3YmNYUzhmcFZYdm5Ia0haRlFRczQvcGErOS9w?=
 =?utf-8?B?ZURRQjNXS0pJRWRnWERBVzBRTlVaRWZiZXc0U3greWtKMUM0T1gweW5TQW5w?=
 =?utf-8?B?MVRKTW5Ib25iTkUwNlB4TnJvekZvUms3SnNoaWpEeDVRZ0dGdS9GUWd4UW5j?=
 =?utf-8?B?TWI1U2FZc1dLQ0ZLVG4wcHhsUEhub2RGR2oxZzZXN0NEWVRMdnRNd0s0emxI?=
 =?utf-8?B?WmZYMnREUjJUOEJPNzB2bCtrMGJVUlhyRmVyUDBpdjBzWGhZSVFtVDVZTjlX?=
 =?utf-8?B?Z0ZNNzdSRDJBSno2NjkweWRqblMrK3BIbk41SlFnM2FHYjBtSkE4REplQmc1?=
 =?utf-8?B?QkFGWTN5S0cwbzBsOG1NeitZbjIrdEVUVjBaS0d1T0VjT1VJVm42U0IyQlE1?=
 =?utf-8?B?ckxPWTFmWkR0MEdmaUdwTHFHcjVyaU44SnJLNkRDZUVSRjZEczE4d3hHSmdC?=
 =?utf-8?B?YTBZV1NpMmJBZGJRWE12V3NMb0Z5UWpCOFhudmZkeFZpbnhaUTNQRks2YzVr?=
 =?utf-8?B?RlpWVEV6K00yaVdjQlo0RG9tbnBnWTViWHVpcFNvS3lJanYxVE9DLzZDSFds?=
 =?utf-8?B?elJyR0txRGtmaVkyUDJUeEh5eEsrc1dpOGtOYUhSaDB0WDNjVDhCcTFEYm81?=
 =?utf-8?B?NHVpYndUc21McExjdVc1R0Z2OERJTDhpSXAyOTNoS0syZ00zZmV2WVVqWGVI?=
 =?utf-8?B?Ynl3V2ZqYWwrY1RsUWx6K3VjalV6dVVmQjl1eE9BVWlOSUxDeXJDK1hSWVlO?=
 =?utf-8?B?VjNDaGxWaGs4OVpZSE1PdXNtOFhVQzdZdEZ3WTd5U2NyekdnZGtiVWd4Lzdh?=
 =?utf-8?B?c20wSnpRRnpTMkYzbEt1czd1NlM0L3JBdXFqdmd4aGlVVlEweTYrNXpldFZs?=
 =?utf-8?B?TEoyL0kzTlljNUFHU0hxcnpqYyt4bTFSb0duVENKZFRGQmpxbHBxKytIcXFM?=
 =?utf-8?B?WnkxOGNxa1FrQklMYitmUGllZnpzOUNQd0pkS0U4VmtEamZ3ejVwdmVpUCtm?=
 =?utf-8?B?SVhlUnlBeTJSWjY1RStOcThZM3p1dU9yU3RWdy9ZbXZ1OElqMko1eS9BU0FE?=
 =?utf-8?B?ZWtZQnAySUNuRHd3UjlqS2p6Z3VLdUQ3TEc5V1ByTHFVUWVFR2I0Y2hZMnVB?=
 =?utf-8?B?RnRUdFBBV2tPRFQxZ212MDhQQ3dwUXNOaEoyMFNaU0locEpLT3FJVkplc0Z0?=
 =?utf-8?B?ZG4rRU1ZVXh3UlVUNEN5RTVUalpnbVVWK2EweUxEQ1R1UDhOaExaTWkxQW05?=
 =?utf-8?B?VmUvcVl3RVpqN0RqenBLS1BPdFRlZEIrM0t4a2hGZ1k4NU11bXhuRDRiYy90?=
 =?utf-8?B?MlNlZWJqV2VaUnp2dGw0NmZUYXk4YmZDTDVBMEs1dEd5MDVyNTlOVTFuYWlJ?=
 =?utf-8?B?RVNRRjAxbTBma05TeEszUHZqUW1PcHM5SjlwcjJzekwzU3lWZGJtL0pqSXND?=
 =?utf-8?B?cUZRdldCSGRLNXYxVm0rYTFyTFlYRzhWb0g2UGVQK2dPa3BWTEg3cVN4amtO?=
 =?utf-8?B?MlorOWl2RkllQXJyWWRvWkpuNzhzUTlFd0hnbG9WV2Uwd1lvdUpvQWlVWHdj?=
 =?utf-8?B?UWpFTmNVd294UENoRTRSNE9PVGFvTllZVUM0MDV0U2pJeGtaVkk2U0c1TDNu?=
 =?utf-8?B?bEYyQ1ZkL1pRcjhSSjFHeWdoYVZUNlNoNHBqUlFRRlpxdVZTajRsVUEvTjcr?=
 =?utf-8?B?WnliTGVKYlhJTWxZUEVQdWx6SjZtOVU3STBudVNQN2N4Yk9lM2F1UUV2RUts?=
 =?utf-8?B?T2NGVFlsa0wvS0thb3k0eUdRYUJnWm1UbTFYVVdmMnVXU3pjSng5QWxGZ25K?=
 =?utf-8?Q?hP3UlN/qQg4VUwKSMVJ54Se3+I83/bYc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akRNZHhxcnArNXpjc2VVbFc4RHRUQksvOUxxSlplVGVUL1FYVDIrYVM2OG5i?=
 =?utf-8?B?VzZHQytsS0xTU1kvbHBCOWVNQnhSYjlPTlh1V3Q5MExoNFFoZERpTlk0enFi?=
 =?utf-8?B?OE9tb2ZydzZNMzF3TnUyYnVZR3FBKzVZODVzS0FPQlovTVUrUlBDTGVrMGhz?=
 =?utf-8?B?cjZkcmdjV3IrbDBsVWJwb1FDTHZBR1V2QkVtRjd5Q3Nxa0xpTk04M3hGUlhM?=
 =?utf-8?B?MkFBM3ZUejJ0c3NLdTlnMEw2NS9DUnBLYkxjT2tiNmdoQUlLckxQWkVDTDB2?=
 =?utf-8?B?ZDVhUU80cVg1SEM0UnVCNE9nRVhNbDJxUFBxVGg3RkVYZTF6NGJtMURCc3Aw?=
 =?utf-8?B?VFhLbE5qSm0rSXhSaVorZi9ZRHl3YUgxc2dwMGhFRUhwbVNONUlxeEJNdHJ3?=
 =?utf-8?B?ak13OW1Ea2FEMVFZYkNDNmF3dno0NjdqVVMrT1hWT3ovdEMydlJ5RFVZdVRV?=
 =?utf-8?B?V2xNNk05aTNsWlIvQld3QmIvdy9kY21Jc3BwK1hrZ1lhWDJUTEdQdmMrdTRB?=
 =?utf-8?B?citneHpoZy9IbElsdVhOWmoydVdEZkZjYlYxQkZodUErK3NOelRuVEduUHJ6?=
 =?utf-8?B?TWw1U1dQQ0tlR3B0UWRSbGZQQmdISXM1aFVNZ09UZHYxZjNIcjZKdHNEL1By?=
 =?utf-8?B?T2NhMktuKytLaHd2RXdRT29ZQ0pCaVM4K0d0elpIRkRMR2JyeVFMUEhmWE1O?=
 =?utf-8?B?RWNIUCtUVmR2YjNZMURPREU0aUVyYW4yY2hCeWlwZlRBOWoxMDk3b2lMbjkx?=
 =?utf-8?B?d1NmaXIzTU9IeXRoZXdLTVkrcG02VzNNWXdYV3ZSK0lrdWdoWDB1TCtQOXlp?=
 =?utf-8?B?TVNJR1hUYmVNY1V6S20vdmRFMnBQcnJqdzVpamM0MXNMMW9PdGhpS21SMVhD?=
 =?utf-8?B?cHhmWVh1MDhZbEtvM2d3b0ZHQm00eXU2dFA5bjRDa0ZNMHBIKzNCdnp5K1d0?=
 =?utf-8?B?ak5hWE9IMTQyYmlKTUQ5UW4xYXFYQVhwS1VqcmQ1ZEFrRFBUa3BlZ2tKOGMz?=
 =?utf-8?B?UUZSVU9JdndrL2J0YTl0RWZGWDRoL0JyamRVNjJTM1lpNHJlbWN4aWZKZWtE?=
 =?utf-8?B?ckVmcVdjdGJEV1JKRkwwNHptaXN0UjcvVTJFVi9VUDBKUkJUbGNpMWRzUFlu?=
 =?utf-8?B?bGl5OWlzOTc1aGVqOWpXd3cxTUQ3M1dBTjdvc2M5VlRlazJEOTJrYVQzaHQ2?=
 =?utf-8?B?T05DN2p0RlQwN3BuN09XeTVaa1lxM3JMS1Bxcnl1ZERhVjQvSU5kNndqaVdS?=
 =?utf-8?B?VXlQSWlMNkVlU0ZMUVhOb09TTkFoN0pmVlJ2SU9PRnpFcUhGZzBkT1dzektk?=
 =?utf-8?B?amRod0hTLzNhYU1Ebml3OTREU2thQk4xMXBGWXpVT2VqUGRmZytIS0hJbnpw?=
 =?utf-8?B?TFN0am93YjBMS2dNMnArSW9sS3E2cUQza1ZCM0xCZ2NVMmhoc2VZclo0Q25Y?=
 =?utf-8?B?K1c4N0dRWFlndStaMlVQRjFtMVM2ZXNBT3NuTTdoTmZENi9FTm1sQlErcGdv?=
 =?utf-8?B?a2RKVVlUWkJNZGh1TnQ2aElwc0NiczhEMlRtYkdFNUkwVzJPWGxLUVRHS2pI?=
 =?utf-8?B?cDk3MzR0NnVRVks1cG5ZSm1jUCtZc05YU2NGMytSajlYQmZrMU1xc1l2alJy?=
 =?utf-8?B?RVBjZnhiZmdoN0x0WnVTSTFkL2d4LzhLT0lHdllVQ3BVOVVHYnYxeEs3elo1?=
 =?utf-8?B?bmdTZ0NwZVNwYnRjMFpub1R4RXB3K0tVR1BuUFczM1IvRXhoaTY4MnhzeFFl?=
 =?utf-8?B?bkFxbUpZVlgrN3ZmZ0JmTXFBWmdQdi8wQVJIbTZVYThyODBiOC9kSVhpa2Nl?=
 =?utf-8?B?OFZTNGZocmNnTVhPWDNFNUFqOVI0MWlIemZCVVNkdktqWC8xeHhOb1JKMTZR?=
 =?utf-8?B?ekp1RTJpbG41Ti82T3FBdlpOY0JMWkRkNUZ1UmdOVFk2WW11NkRWbStBd1Jk?=
 =?utf-8?B?T09Ma2dRTXMxRDlBaHNWaDBLeUtZbDhraFFRNDRHNEtxNm1TOUFUZzhCWE5r?=
 =?utf-8?B?ZW5KS1JnZUs1eWhsSDhoRVhkSCtBaXk1R1N5bDNuVWVNaVpNbnJVbnc3aW9m?=
 =?utf-8?B?UHhCcitOSmltS2s5bzhxaXNXV2VzOEVlM21kVDNIczNDUndkanhZQ3RGWnEx?=
 =?utf-8?B?U3VER0w5RzdjN0NKdWlYeFU0Z3dyQk9WUTM1TVhacmFYbGlvZVlNeEtVMk9R?=
 =?utf-8?B?aUE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68a0589e-e77e-4466-93f8-08de340327c5
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 13:35:29.1430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SWxDmcFVexVSTvzbBlDX2JjzUGhauYlhMwDt3Ppj+9KKcazs2b9G4XmDBXN230qFd2dI5QkyKb7WO2oEC8vB1N+nFd8OjUo1BgSsVW9vt70=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6872

On 05/12/2025 1:15 pm, Jan Beulich wrote:
> On 05.12.2025 13:40, Andrew Cooper wrote:
>> On 05/12/2025 12:01 pm, Andrew Cooper wrote:
>>> On 24/11/2025 3:01 pm, Jan Beulich wrote:
>>>> --- a/xen/arch/x86/include/asm/bug.h
>>>> +++ b/xen/arch/x86/include/asm/bug.h
>>>> @@ -21,7 +21,7 @@
>>>>  
>>>>  #ifndef __ASSEMBLY__
>>>>  
>>>> -#define BUG_INSTR       "ud2"
>>>> +#define BUG_INSTR       ".byte 0xd6" /* UDB */
>>>>  #define BUG_ASM_CONST   "c"
>>>>  
>>>>  #else  /* !__ASSEMBLY__ */
>>>> @@ -37,7 +37,7 @@
>>>>          .error "Invalid BUGFRAME index"
>>>>      .endif
>>>>  
>>>> -    .L\@ud: ud2a
>>>> +    .L\@ud: .byte 0xd6 /* UDB */
>> P.S. Presumably binutils is going to learn a udb mnemonic at some
>> point?  Can we include a version number in the comment?
>>
>> I'm trying to organise such comments everywhere so it's less effort to
>> figure out when we can drop it in the future.
> For them to be useful, wouldn't we need to settle on some canonical form
> first? Else how would one locate them (other than by coming across them
> by chance)?

I don't think a canonical form to use.  Some of the (in progress)
examples I've got are:

diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index 16368a498bb7..870823f7991d 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -14,10 +14,14 @@ CFLAGS-$(CONFIG_CC_IS_GCC) += -malign-data=abi
 $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
 $(call cc-option-add,CFLAGS,CC,-Wnested-externs)
 $(call as-option-add,CFLAGS,CC,".equ \"x\"$(comma)1",-DHAVE_AS_QUOTED_SYM)
+
+# Binutils >= (<=2.34), Clang >= 7
 $(call as-option-add,CFLAGS,CC,"movdiri %rax$(comma)(%rax)",-DHAVE_AS_MOVDIR)
+
+# Binutils >= (<=2.34), Clang >= 9
 $(call as-option-add,CFLAGS,CC,"enqcmd (%rax)$(comma)%rax",-DHAVE_AS_ENQCMD)
 
-# Check to see whether the assembler supports the .nop directive.
+# Binutils >= (<=2.34)
 $(call as-option-add,CFLAGS,CC,\
     ".L1: .L2: .nops (.L2 - .L1)$(comma)9",-DHAVE_AS_NOPS_DIRECTIVE)
 
diff --git a/xen/arch/x86/include/asm/asm-defns.h b/xen/arch/x86/include/asm/asm-defns.h
index 239dc3af096c..b1d5539bdc7c 100644
--- a/xen/arch/x86/include/asm/asm-defns.h
+++ b/xen/arch/x86/include/asm/asm-defns.h
@@ -27,6 +27,8 @@
  *
  * With no compiler support, this degrades into a plain indirect call/jmp.
  * With compiler support, dispatch to the correct __x86_indirect_thunk_*
+ *
+ * TODO: Use %V constraint modifier (GCC >= 8).
  */
     .if CONFIG_INDIRECT_THUNK == 1

 
The examples using .byte are easy to find.  It's rather less easy doing
the archaeology on binutils, as gotbolt does not have every release
(unless GCC and Clang), and the release notes are not as great as they
could be for some instruction groups.

Our Kconfig annotations are better (insofar that most are annotated),
but even there there's quite a mix.

~Andrew

