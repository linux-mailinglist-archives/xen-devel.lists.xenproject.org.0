Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80258CAA85C
	for <lists+xen-devel@lfdr.de>; Sat, 06 Dec 2025 15:17:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1179856.1503244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRt4v-0006RM-NK; Sat, 06 Dec 2025 14:16:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1179856.1503244; Sat, 06 Dec 2025 14:16:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRt4v-0006PH-Kb; Sat, 06 Dec 2025 14:16:05 +0000
Received: by outflank-mailman (input) for mailman id 1179856;
 Sat, 06 Dec 2025 14:16:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/WZp=6M=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vRt4t-0006PB-UM
 for xen-devel@lists.xenproject.org; Sat, 06 Dec 2025 14:16:04 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1479125d-d2ae-11f0-980a-7dc792cee155;
 Sat, 06 Dec 2025 15:15:57 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BY5PR03MB5000.namprd03.prod.outlook.com (2603:10b6:a03:1ee::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.13; Sat, 6 Dec
 2025 14:15:52 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.012; Sat, 6 Dec 2025
 14:15:52 +0000
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
X-Inumbo-ID: 1479125d-d2ae-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BXjBvQZsjvJzaE5c4VmY0wnTMCDLW2TL9flhRkG6bHnH1QZ0xQJzOO6JCEvApJmTQWtCfUHgbx1GXowbJR+6o9wzhPd+f8EElM8Gbr/VvZiFKt/7wzwkAKhgm8oRBJ2m6mwTTKchRPXwazD8UzDqhqfQ3nwlbztpyhm7Zoio6iu7OujVdyQaglT2i5eir/MBz+m+UKo49ui2RiVHmXEmxIgEzzSXJl39o0OtjSL3Lj3bSN75YxgDhtrtdQ1Z143DgM+lh9Qiv1/j1Zr0YlUKrSLFEdw8+zsM+pm0ars3dt+aLn/A9BJHHA02i8wl5St5VB3TVu59cpc+uzlY1AkdEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ivIEuREOIO0mD7wrOvOTjjNYENWVLuORsUJDgoePr0=;
 b=R9UMjY8/Q2SFLA7PTo2A6yEaLuR2wO0AelqjaAxuDdD9Jbpo6YmBNCS+7e6f8hQlmoBAhLMu2lVsDtaJvLmBgMhEJv+vJrU1YiS2+4LeEzgBQCdvhNH+f+mEl13eWexcSV0V/Wf+Krxze1sLbLNOheqJPCQ7OwQ2/bUDJeUuN1r6uvS12XQV3FbiX1vBWz1OGBpdcAZhlgPbXOJ/p41mVR0OslOMd28KA+We8Z8y2Ha1SI+Omb5q9dvMo+UbFnOl8nKIfQPHdXlBfG9o0Ug/BnDUhpma5r2dU/J/Weq/wjDl3UXyR7eMXC3DmRQZpofFmww/AgqDjrshQ4l/Ta8m5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ivIEuREOIO0mD7wrOvOTjjNYENWVLuORsUJDgoePr0=;
 b=cjkqtWuTMGPGWvxdjze6oQKhCBrlIP86pHqSuvPOzFVpnpAAJBh+82wwgDHjCDXeXhbwFoxRktlWH+OXmilUUb1+5DnE4jd65xmZD33of0vT3L5/DbifxYVEWrmYKkorV33DzGTLhS0S9JK6hqLWfqYyODYb5twHdMei2qTwp9I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <483d50d9-a076-4698-bd14-28afabd5d369@citrix.com>
Date: Sat, 6 Dec 2025 14:15:48 +0000
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
 <d9a632d1-8587-45bb-bc13-8dab8d346cb2@citrix.com>
 <4fc76270-98e6-46c4-a6a4-d73772e079c9@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <4fc76270-98e6-46c4-a6a4-d73772e079c9@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0031.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::7) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BY5PR03MB5000:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c1d9ab3-880e-4b3b-ef49-08de34d1f66c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WHBqRS9aYlBmWi9TbXhyd3A5akwzWkcxM2EvdjVTRUljQ3ltd0FmdVlMT1RL?=
 =?utf-8?B?L1FTeUdGZnJFVHlqYjdpUTZnNEJ3d0RjZU1aaExOYkFZRmZubnVCMnEwK0VT?=
 =?utf-8?B?d3BrQ0hjY3hrd0kyNkhwcnk4WlJjWk1wdk5QMlFvNzFwWnFENUxWT0R0N2Nx?=
 =?utf-8?B?aXFGeDNWN2tZdDBveFB3NS9jQkRhTDc0Q0RaUWtNMjVYK2V5WjcxSGhLM0xz?=
 =?utf-8?B?Y2lYUDBRRzQ4d3UwVE42bk5kVUxSS1lBRDMxTmZCUzIxR3hTZ3hodHVRb0do?=
 =?utf-8?B?ZUhOcHVUWEk0aXJmNUcyNVhOL285SWplM0phMlFTNFZRa053KzJYMzhaWG9x?=
 =?utf-8?B?UmR2ajBkQlBqNTVuR1R1eHNrY2JnYXljMytacGZraldJTGJXQjJ1MERscEpa?=
 =?utf-8?B?U3hGankvakRISE9CaGxpeXdVTXYvMVFvTWZNK0F0b2l0VldEa0ZDc29jc3cx?=
 =?utf-8?B?NlhGamIrOWx4OXlFQ096WUhIcnN3T1MrK1VieHB3aE9ZMnpDbFBjc0pyZDN5?=
 =?utf-8?B?OVM1Nno2eUcrMnRRMGpMeDJ4bEVIYkVhdGZEeDcvcDNMSVdHWHEvcHFpb3d6?=
 =?utf-8?B?eW9melBHOTltR3hhdk5QL2V5M1RqTkdoMTdBNFlOZi9mUzA2c3pTdUZTa0V4?=
 =?utf-8?B?M09yMy9MR0JOVDNPbTVvZHNRWXJHQ3R4RWpXMjNWVTZLQkRQVlFiU3ZtVkpV?=
 =?utf-8?B?cGt3dmdPOGN1aHo0MWR0S0s0U2haZEVidktZSXhOMXBFaCtzZi91VEdTc2tp?=
 =?utf-8?B?TmRUaTA5YXpUNzVXZVFHVHBCenNkMWZiYWZjT1k1R0Z4UVZxMEJOWUQvSGZu?=
 =?utf-8?B?STlMYXFPbEhXZWF4VXVsNUNoQlVGajZMQUlxRWovMXZUVUpqQWVrS29WTC94?=
 =?utf-8?B?Y3VjdFJBQmpodXh3ZmZ5ZnQ2U3ZGM1ZDMC9Sa0kzeW5yUlBId3lORkk2Y3By?=
 =?utf-8?B?T3BmTmJKK1hQclRBMmVTYUVnZlg1d0pEUVQvbTlweXlLckxZUUVIdkZjVTBM?=
 =?utf-8?B?c1VkVFQzT3FXODJ5UFp5MWR2OFNUMHAzUUgzdTNVZHlIZ0hTanFiWVhyemcw?=
 =?utf-8?B?ak5VU3FHZEF0NlRxQnpNSjI3UVpQYWlzUUVxaVRVVitIREhOTGs1dlZkcDll?=
 =?utf-8?B?SzJNWWlRNUVuYUlTUHFoTWZIaERrMGFHeWZNbXBXZnVMdEd2Q204Zi9la3JM?=
 =?utf-8?B?K3prRkQrSmVsS2ZENlJ1eExnMi8yM0xqZ3FhdTkwLys4aW9YNllHYW9aTFE5?=
 =?utf-8?B?eEFpOC9zSVppUVhZcXVqMEZwd2FIcHBQbi9xUWRncXBVSEUyblRXdWlXc1pS?=
 =?utf-8?B?RGJhdHNBeWg4VTdyU3dSMXV5KzJLOEpjcldRTzhBMzNQZitlQllpdXFSd1FH?=
 =?utf-8?B?NWFzWEQ1VHVNNUR5VVUxNjZ2WGVSN0dVRVJFNVErZ3V1WHZ5Q05ubHkzRzR3?=
 =?utf-8?B?MzIybkgzdG5KYndiVVMyazRrcStyMUp3Q2p3OHVyUzdMWHhwdlp1Yi9nRGxU?=
 =?utf-8?B?VTBNSlhTYTIxN3llT0YyckhEWFVDOVNnTGtubmRydFdvNmpUZEpnMlNIUUg0?=
 =?utf-8?B?eG9rbzFtVTcrNkdVNEh4azdGanhVMXExNWdyM0E3Y01xWkhBUG9FTE9xSVJu?=
 =?utf-8?B?Qm5CVkJmc3BDUFdzeStEZjlzM2kyUHlwTHJCb1daQlZFSGRGdlhsNEF3ZUNG?=
 =?utf-8?B?TVhab2xycHVyaFJTbnphem9Nc3RiZjJxTTlwczJnK2tIMXF1N25pNmNoSno4?=
 =?utf-8?B?YnZYQ2pTTVVidXJnRjJlNWh1Y0lDdkllSHdoZDlvc25HMTFNd0F1ZUFXblZs?=
 =?utf-8?B?Zi9pOXVPUllIL3FUOXRDNEh6Y3BqRHI4TmF4ZE9TbWloanJ4VFBudC9Ja0Zw?=
 =?utf-8?B?VnhaR0dWck1OYnpobUNZZjJqR1Fhck95ZFduTEd3TnZsZzdLa1pRRUNJN3JX?=
 =?utf-8?Q?1OiE+IWwQPo3L/hERo+loOTn2urYQM+p?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0pQeCtPNzVZeEs0Y0dpcG1HNzJWb2l1dFFNcDc1RVV4R0Z2aWFGdERIcDY4?=
 =?utf-8?B?WEQ3ZHZtcnNvZTBvQ0lUSTNVMGVtUjY5eExlSVhMSWlqMXBtWDNiNXJPSUYr?=
 =?utf-8?B?eko3US92cG9URlpEQkRrM0haUHRKTnRDTGRRSE96YVQvYTVKQlZvdTVLSkhS?=
 =?utf-8?B?MDJFVmI2aldIOGxES0ozWGgrWktIelQxVUpNVndJN1JCWUhPLzEzT0FtcUhh?=
 =?utf-8?B?RVRpdHhNZHBNb1k1MDRPVmpsU3NENDVQVTQrcXNhcTdVRldIRG1JMTNnRnJW?=
 =?utf-8?B?ZG5JaEJKaHV4cEhqWWw1WjBzL3lNS2VOVXhqVjkvVzRnNGs5enhjN1h6U3g0?=
 =?utf-8?B?eVYzRUdRK0Nza3FRY21WRCtMZEJYSWlxdllZV0ZMMVFleGFOZWNaTUFER0pG?=
 =?utf-8?B?SGo4RUNkVzA2N0pXRWJ5OVF6K1BLN2xDakhwcDljK3RuY0N2NWFWOG8weDAv?=
 =?utf-8?B?NktUcW9VbjNBUjhQVU95cFgyNVhaSGtOSzFOV044YTVlT2pJK1IxTUNZUklV?=
 =?utf-8?B?WG8zaTZCaldNWXZpb2E3Y3FEWnQzMkVwVVl2SytNRm1mYkJOTVY2NDZlMkEr?=
 =?utf-8?B?M0htb2w4dVAyMUNMbVA2MWo5eFg0UnZ6TzcxajQ4VG1SSGRpcEU3VmpQSmRE?=
 =?utf-8?B?aW1PT1ZBTFp5QnlEalNVc2tvSVlsTjRiaEthUVprczFiSTd6TzFYRHd0bVh5?=
 =?utf-8?B?TUYxeVpPN0c0ZlFLQUFlOFA0Q1RSNmpiMjZvUStwN0lqTzNjYTVsOWVCNHhC?=
 =?utf-8?B?NFVubFprdW4wYW1GV2NXS0MyK0QzWWI1ckw4TkhmMTgvU0NWenlyVDZDdUh5?=
 =?utf-8?B?WXp0MmRPaW8xTWorTldsZXJTdE5jSmdxOE9sa0Z2dFlRaGcxa1F2NUo0dXJX?=
 =?utf-8?B?NXNpdlNPeGxNS2lwZnlNS3lKL1lYWUszeFJxMkVoQVBtaTFmWno1WHNqbnQ0?=
 =?utf-8?B?K3Q4VFZVQVFuZFllWVpuRWtXU0dBc3N0TUI5SXFIWUl4QXVZeTh1Z0ViZ3dM?=
 =?utf-8?B?aGI3d250Sm5kQXJzVnM4bGJRSU9Na0pBZWlXS3VQdndyZzFQZ2NwYkxxU0NJ?=
 =?utf-8?B?azI3ald0aHJ0QUg3NGI0N0VVdk5UbnhlQmxnUHZIVmpxaWRmVHAvNzArOU5G?=
 =?utf-8?B?UHZXdVYwUkU5M0RlQmtDZVJZdWo2MmtLcjJ5NXZHRGRSbWgxUlN1QUlTa1g2?=
 =?utf-8?B?a1RzbUNCT0RqZ1FhSkJ3aktVQ3J2VHJYRTFzVTdGTytqTGhzbGV3Q0JYa2dH?=
 =?utf-8?B?akhoS21lYndlZVIzZjRxS2pBOStGUXlhSktsZ0k0V2tnT0tLbEhsV2ZFZ1ZM?=
 =?utf-8?B?cDZpVHQ3SzI2UlB3ek4yNE1FaXZORzA5RVhDZHUxWFZvZFkvUjBRcWdjaVNz?=
 =?utf-8?B?bk53WEpnMnBhYXBjSFUvQzVFb25GS2Z3NWdwWFgxeDJ6bWFuVkNVT2NnYXh3?=
 =?utf-8?B?V0FvYW56bVlCYSt1c3hqUU1tckNUYXI0SzBMVEZYUnhSbHRqNG51TnovZk5r?=
 =?utf-8?B?VzR1cTVZTU51Uml6Y1Q4Smg2RXlWeUh0WERkaTNHd01xQjBWZEFTRGgxTlIx?=
 =?utf-8?B?dGlYbGhsbXhTYzZoNTZsQW1RclFLcUJzOTBqZk93b3MxeXc5SnRrUE1teFl0?=
 =?utf-8?B?ZFlNb0JOMnVRNVFLQWIwMVZyZFd2bWsrUXNnMlZnVFkzYUxodzcxOWF5ZEtn?=
 =?utf-8?B?dlJyMjZaNzBPbER2RTRnKzkyL3hobjFsWHRvLzM5Q2JZUjFmSTV4QmVrSnBn?=
 =?utf-8?B?ZXg4RVRSajcyU1RZSDczZFRhY2h0UnpFNlhLWE5NMmZzZlRkYUZVbHE0b0Ir?=
 =?utf-8?B?YzkycEtkZkxkcE1jVnZJWVlIOE9qcGhFVXVQYjY5RjN1MTNTcHFXTjRwU0w0?=
 =?utf-8?B?NDVVV1pTMVJKWXRPT2xtdGdrb3VyOVN4UjNnVEZSeC9RVG9ZTEJubXNJUVBo?=
 =?utf-8?B?bEUwWW1GZHhTVXltKzhzTUdGRUVPQWw5SWhKMnJTTlhQR2lUQzFpZlF5NUsx?=
 =?utf-8?B?SnNGZFE5V3hudlZGMnpFK3FzcDdDZ2hwa2FyM093TFZSdEp5QStJbHlrZThH?=
 =?utf-8?B?b0lpZnpwZW0wQlFMa0x3dFNmUlFXNkU5MWorMEJXTithcFo3RlY1TDhJQlB3?=
 =?utf-8?B?aW9wYVk3dWtwYXFDN0pma1ArcmFwTjZkc1Uvb1dJOUpzcEdQcjc5NVkvZ0Yy?=
 =?utf-8?B?K0E9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c1d9ab3-880e-4b3b-ef49-08de34d1f66c
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2025 14:15:52.4080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0qf4GBeFFwtlplSIVt1BPnj4pmZ/90ghtKHuXW6pt/n7+fE/LV5nS8sbMtyaMTunFQ4MUaAsYcdL1074kjE3KAmBCrG36+qBVD/1KHugFnc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5000

On 06/12/2025 9:10 am, Grygorii Strashko wrote:
>
>
> On 05.12.25 22:00, Andrew Cooper wrote:
>> On 05/12/2025 7:34 pm, Grygorii Strashko wrote:
>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>
>>> Extend coverage support on .init and lib code.
>>> Add two hidden Kconfig options:
>>> - RELAX_INIT_CHECK "Relax strict check for .init sections only in
>>> %.init.o
>>> files"
>>> - DO_NOT_FREE_INIT_MEMORY "Prevent freeing of .init sections at the
>>> end of
>>> Xen boot."
>>>
>>> Both selected selected when COVERAGE=y, as getting coverage report for
>>> ".init" code is required:
>>> - to bypass strict check for .init sections only in %.init.o files;
>>> - the .init code stay in memory after Xen boot.
>>>
>>> RELAX_INIT_CHECK/DO_NOT_FREE_INIT_MEMORY could be used by other debug
>>> features in the future.
>>>
>>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>> ---
>>> changes in v2:
>>>   - add RELAX_INIT_CHECK and DO_NOT_FREE_INIT_MEMORY, those are two
>>> different things,
>>>     both potentially reusable
>>>   - enable coverage for libfdt/libelf always
>>>   - enable colverage for .init always
>>
>> This is a lot nicer (i.e. more simple).
>>
>> But, I still don't know why we need to avoid freeing init memory to make
>> this work.  What explodes if we dont?
>>
>
> It will just crash when coverage data is collected.
>
> First I made changes in make file to get .init covered
> then I hit a crash
> then I checked %.init.o
> conclusion was obvious.
>
> For example:
> objdump -x bzimage.init.o | grep gcov
>
> 0000000000000010 l     O .bss    0000000000000028 __gcov0.bzimage_check
> 0000000000000040 l     O .bss    0000000000000040
> __gcov0.bzimage_headroom
> 0000000000000000 l     O .bss    0000000000000008 __gcov0.output_length
> 0000000000000080 l     O .bss    0000000000000060 __gcov0.bzimage_parse
> 0000000000000098 l     O .init.data.rel.local    0000000000000028
> __gcov_.bzimage_parse
> 0000000000000070 l     O .init.data.rel.local    0000000000000028
> __gcov_.bzimage_headroom
> 0000000000000048 l     O .init.data.rel.local    0000000000000028
> __gcov_.bzimage_check
> 0000000000000020 l     O .init.data.rel.local    0000000000000028
> __gcov_.output_length
> 0000000000000000         *UND*    0000000000000000 __gcov_init
> 0000000000000000         *UND*    0000000000000000 __gcov_exit
> 0000000000000000         *UND*    0000000000000000 __gcov_merge_add
> 0000000000000008 R_X86_64_PLT32    __gcov_init-0x0000000000000004
> 0000000000000012 R_X86_64_PLT32    __gcov_exit-0x0000000000000004
> 0000000000000020 R_X86_64_64       __gcov_merge_add
>

Aah, we should exclude the OJBCOPY too.  That's what's moving
.data.rel.local amongst other sections we target with attributes directly.

~Andrew

