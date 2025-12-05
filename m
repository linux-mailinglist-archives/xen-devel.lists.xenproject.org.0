Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FE6CA797B
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 13:40:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1178933.1502597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRV6o-0007kI-Iv; Fri, 05 Dec 2025 12:40:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1178933.1502597; Fri, 05 Dec 2025 12:40:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRV6o-0007iU-Fd; Fri, 05 Dec 2025 12:40:26 +0000
Received: by outflank-mailman (input) for mailman id 1178933;
 Fri, 05 Dec 2025 12:40:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K96r=6L=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vRV6n-0007iN-I9
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 12:40:25 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90fab611-d1d7-11f0-9d1b-b5c5bf9af7f9;
 Fri, 05 Dec 2025 13:40:24 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BN9PR03MB6091.namprd03.prod.outlook.com (2603:10b6:408:11c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 12:40:21 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.009; Fri, 5 Dec 2025
 12:40:20 +0000
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
X-Inumbo-ID: 90fab611-d1d7-11f0-9d1b-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XhlRR/Uro2aJyH+mJnZi6wf0H7PEeep6RvL+ql5Tq//DoVyz8REM3IpDD4gmMQSEBnEYp2sMl+38elZwVqdq7JrIb1elyJxo7aehRHCRywLw2ZIdJ5/sMhAXnhbUVWyEemYA4asqbAkn2TmjHl9FfFKs0pvmlST6uTpqA/RtSFPNeCorNjh/PFPXt1porlTvIhDS48UbIWXd2qplozyB6VQiFGcdrCrrqvhuCkGj1t6F1qdkxP0PqKZoiChx53BJNStT7EKq9TXdllI4wB5P1OlNmPzu0gT+3d/TpUumFdlthM0PYlKjfzX9gnfYadaUHyLfR3i3dMHiImpXzUvWGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LD2jy8ayiJN1jBV+QtytvCPGAIM5I536Ev/ERLvCJeo=;
 b=YcfAQ5zs//UQZI9cH2/oLUgPUztH4yz0aB/RyFNZVevQ8PaarXm75rJtHZv99EcINMI0gNbdOWVRU2KhM5SNIlw0MoCXXDUqL8RAM57nr5R4PIqom91PwZ1n2lE76mQEpgrajbU7sKpALxMNymDM3oDi4E+hM86Tay9nTCNKT048fePWsFpM3L0pqVbsDzZzik8mMYE2WB+pjO3rYpjlbAsCSZ3LdVCeqkBp7ORDayCxNiTMuCEkbKKPeflUH9q2He1sS5scoIdEgPYx5GTpSDvw3Ah05lWbsowoan0yfjbHdObtdNOIBiu/T1m14erawslsM32XMk0qFS6JDy4+dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LD2jy8ayiJN1jBV+QtytvCPGAIM5I536Ev/ERLvCJeo=;
 b=UI/8f1GU7pdYS0NpWiEL1fOuJTwGK+LUIYUVCLrHHcqUwhC7F/HkOnfppGVuZLTTiYohVlyORqgo7WFVcUfsuXwXrCtVSYKJfl4EKl2hkflgsDHp+UZvEjLYTriJ3+Ey9pt6frMjM42hGqNvEKkJ8vMPkgl0mukziv8bYVEN8so=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <846afe9d-458f-4ec8-a58e-faf0617707df@citrix.com>
Date: Fri, 5 Dec 2025 12:40:16 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH v9 09/10] x86: use / "support" UDB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <926a2315-a2b7-4aad-87e6-d686c9da9e3a@suse.com>
 <78b7c8a0-16ae-49c3-8c7b-5b10f5b0d688@suse.com>
 <e2ce221b-f852-4f9a-8a82-322e6f2af522@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <e2ce221b-f852-4f9a-8a82-322e6f2af522@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0010.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BN9PR03MB6091:EE_
X-MS-Office365-Filtering-Correlation-Id: 62ab4a61-39c5-426a-5a9f-08de33fb7399
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V3pvZmpyRm83R2hNQmFzUzcrOGZDYkxiNkhlYk41ME8vVXRvK2prbk16bVIz?=
 =?utf-8?B?aTNpTk9ha2NWUFNONmY0SWlMSlNaZklXeHBjZkk2a3pVdHNzZ05KN3N2Qlls?=
 =?utf-8?B?dm1ZelVZNGNUM29uWUREK1ZodC9SWU1PSThnMG1paVhLQS9iekwxSTcyNHpv?=
 =?utf-8?B?ZVNISXJlN2tycEFGdUczQmhtZk1LU2IzWTZqejB3ZHZUZ0k4VmYwZE12ckVP?=
 =?utf-8?B?MFJIN3cyblRucjVZRkJMNzI3WXgrenB3YlpXcXNxTTV1R1NBd3ZmRVhXSVlm?=
 =?utf-8?B?ODNVWVNPWjVCM1dpdGRmRmtsVndibHZ6QmZFdVZvYVhYelRIQnlleTl4aVhu?=
 =?utf-8?B?MzFEWFExT3l3N3BxdVBHY3dvTDNORW5sL1NSeTk1Q3pkbmpXb2Y1RGxnMllB?=
 =?utf-8?B?SjVzQ0R3L05GZFEwQ1FYSUFtamk5UXYvY1A2cVNqK1ZVRHJJbFR3Ymt2Zlh1?=
 =?utf-8?B?ZVlhRTFOazZnOVFJWll5bDhZd1Z4SkM2ckt3QWpjdTYxNVV1S1JOKzJOZExQ?=
 =?utf-8?B?NTFsU3kxWkRtRmMvTUFCV2wvNGhLU24yODhFRkFpZVUzY3BjZnY4ZzVjYU9v?=
 =?utf-8?B?bFJCRTVXdk1EZnUwVllZbTdlN1dFMXhJcDlaRGpQU0tkYmpJWVlmMWFSNHFm?=
 =?utf-8?B?U0pZTTRnN0VTdUk1VlNzSFRLS05xMXQ0M2huV2FsWVFsMTYycGtocnJjc3V3?=
 =?utf-8?B?ZVZuQWEyUTdFbFZDU1BwTW5tNzIxQWV2OStXNXZBb2xjcWNJLytOazlWY1I3?=
 =?utf-8?B?cE5lOThIazRjcU93aXJlN2k1SnFPQjNNUmw5TGpieVJwYzFlV2JUUThqcVRN?=
 =?utf-8?B?WmhrbEFJQ0w1WjgvK3BhMXVoR0hvMUxHOWlDcWxGejNQVEIyTG5FeEoxbXV4?=
 =?utf-8?B?b241dUsra21KRi9qZUpPYTI5cE9wVHBhM01OeVZHZ3dJYUwyUGlNNmZMVjRo?=
 =?utf-8?B?WnhhZlFNeENVU0l3eXhpU1NQZml2YmFVK3ZwR2s5UlFBVFBOK0FwQm9GK2Q1?=
 =?utf-8?B?TXAyREs4eUFWM2NiUGREb0tSdUQ0MU04eE42T2x6emtxWTAzTjNjaWlNdnpo?=
 =?utf-8?B?ZWtuWDhETWFEcUs4VzF3cUNrTVZsT3o0WG5VOCtLZTRLUnhLM0pYZGRJQ1pa?=
 =?utf-8?B?V1doUFNpcUFKckp0SVhORG9RZDRDUU9WWWdvZ1g2OTBkMXpNTmJqNGc0SURp?=
 =?utf-8?B?ZWN1UVE3Ri9uV1NlMzl1QVE0NE80VHFpQTZqVml3RWV5WGh5MlBZaWZIakFM?=
 =?utf-8?B?S1A5cE56STJNa01UUGtSSDFRR1RKYjNoTlpkVkdvaVBKQXMvVkNoQ0RjZUtF?=
 =?utf-8?B?MGxVTlJmcVRUV3JubFNHOXZFNkhodUY3TVd1OVdHL2ZheklBYWEzOHlkU3R0?=
 =?utf-8?B?eGdhbUJHNExUalNFTFJ0TEREMGlXa0NKZlVJNlBWY3FmSGNnRldCdThJMFgw?=
 =?utf-8?B?QVdGMXg0MEFHNE9wTkNyK1h2UldFbDhRSmw4THNONHA5VU5NTnl6c3FaamZD?=
 =?utf-8?B?Q0ZkRjFBVHpqNVlKc0pNZlJnUEtFNk9UTUl2d3gvS2FvdjhHNXR2a0VMbzlL?=
 =?utf-8?B?dkhCSWdXL0p5d0FCUC9sZ3VVREw3aEVlWUFUUmNrMVd0Zjk5dU5VWXhhQ28z?=
 =?utf-8?B?QklFNXNJVlkrYnRwK215UlpKa0NPMnorSU5OL3diaHo4U1R6dEQ3WENyOHls?=
 =?utf-8?B?dXBHUEJzand2VlBhYitGL3ROdzlyLzJFNVNEaHB4cHQzRFAxTU1ENjBtYjJa?=
 =?utf-8?B?UlJmNmttVEo0ZmV4TUh4QnBPa3JPUXhTWWZIUnhDSitwOWlMd2lleVhqK2VU?=
 =?utf-8?B?Q0N2WWYzUFNUdlJlc1dyaDI3YklWNUZwVnQ1NzRYUFp0REFhbDRlNjhlK2xs?=
 =?utf-8?B?Q011ZWIrOUhEa0FUMm5qOFZjTi9STGlMakIxU1dDajRkeUV4QThtVGtNVUZR?=
 =?utf-8?Q?mRVMvJWcCoWM3UerYAEZrp6Lxj4ll7ci?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MDdDbEVBYThwNjNzeVRGTnh6RytjVW9LeTRKbzR5emgxODg1NjQ1L0hVY09x?=
 =?utf-8?B?Mno1eGYvYUhxYnErTmdBdDJ0OHYzcWl3V0tFWW9iaHY1R3VYOEV2OU1yVXpm?=
 =?utf-8?B?NVRKU3VWbGZ1bEtEbUIzak5oN3hBL0MwdTZkb01QU2tLd0gzRWxCOFRMbXh4?=
 =?utf-8?B?c2g0dFNQZmlsUExTSVdPd0RnMlZtdy9sMEROOXk1dU54M1dYL1hhT09aZi9s?=
 =?utf-8?B?eEgvVng3cFZ6N2NmS3JUSm5yaGdXWS9RWWlydzArWm84dE1IRWRTVWJQVXgw?=
 =?utf-8?B?WlBoRDFLM1BTYjZwbHZiM3NtT2wwR0NjQXEwNG1UdnF6L3lXb3REc05EczhP?=
 =?utf-8?B?U0dreVlMOFdYUjVHdzVHTHRwZnlybHhXVGlZZ0YreXhRUCtKRjhialpjeUor?=
 =?utf-8?B?d2VIN3F1UHhrN0lIa1pJMDhvcHFqREt6TVJQdjZkWTdOTXJUZlpSUHk1REdo?=
 =?utf-8?B?NFQ2U2IrSEJrWTFUbmFSVmNDQ1BNQk0rYXNUMjBTOGUrdlB6bkxqb3Y5SGha?=
 =?utf-8?B?cmhzS3lZYXQvNGNjUkRibVdiZmRLWGVVamx6Zktha1d5TTM1YU5Lbmlodk4x?=
 =?utf-8?B?Zng1eWphblUxd1RieUR6NllIOVVOTGlmNWoyeDkzNW9CRDdLUGZ0bG9qell0?=
 =?utf-8?B?Mm1PWDhnc283S3N5c2JweU5lWGpHQThPMTdJd2tGenlIQ2phS29QVzdOWW0z?=
 =?utf-8?B?MDJZdm55dEJzellrNE52Unc0V2hLWVAwQWtFSFA1cFlXOE9DMk5XeTY5NXAr?=
 =?utf-8?B?VHMxOXo2Q3dzNitlTVA4VGdrNTFBQkZZQ3VKTndhWGdEOEtrRVlDMzhoaGFq?=
 =?utf-8?B?cUgyMlllQiszRG5Wc29Rd0piUFdDSGF6aWtoNDhIb29ZM1NFc3FJZm4wN09h?=
 =?utf-8?B?WjBrQnB6ellKa2RoSGUwM1dQQUp4Q2tPeHVWemt1dFo1VjRyeFJKbStpc3ZN?=
 =?utf-8?B?a0w1ZFQ0MTg0L1UrQXFvK2xocHFNYWZ5RTlaV3pNM21Ta2QvWkdoV3JzMkhN?=
 =?utf-8?B?RlJZNzBIeDB3ZEVlSkJnZG9uM0VwdHBaL3huNk1HaTNNYUtjSy9UOGQzR2tL?=
 =?utf-8?B?K1YxU1VENnM4RnNTK3hkeVh1UUMwTXZrcFdxM3BvVG9TazlRSEF5alVqVzNI?=
 =?utf-8?B?WGlYNmUyQlVCaWVwNXJUY0dHWlYwY1R3RmRaS0tBWXhxeFlaSldqY3lVUGNO?=
 =?utf-8?B?MnF1VEZvZTk0cUFUU1IwblBKSzhlNHRtZTR4TDF4cUd6aWoxN0swd25KcFVV?=
 =?utf-8?B?c0UvRzNRVWhxZFpvQmFoaWZLaWN2dnhXQ0NjWlBJMHorY21GZUl2QzJ0M1Yv?=
 =?utf-8?B?TXZyVUV4aThSYWxsajIyelZsbHp3Znc2aVBqL3AwS0tNU01oWXdkU2tWOVhz?=
 =?utf-8?B?b3UrQ0dvcmRaWWVJZ0l1T2xENnh0bHk5RzdVeEpjUDRVeGpPMVZyOStZekdF?=
 =?utf-8?B?Mzk2QmgyWkZkNTkyVWRESGtQKzRDYlFqVXBTMHltL29tUWZxS1RKbUtwNnNw?=
 =?utf-8?B?RlYxalV1MDdOY2d3b0N2YXBQUWw0enBHZENHNEJFVFc5bHRWa3BocnRTaUZ1?=
 =?utf-8?B?KzB6b3UvUW5mVzl3Vi90VXNLYW9TUklqWGc5R0xkdDd6UmR0VHRJUk9jVHVP?=
 =?utf-8?B?aEZITzhRdEM1NUR3V1MrWmFIT0NyNUI0NGNCeTR3cVllUkdmMEpOWm1HYVha?=
 =?utf-8?B?L1Vyc3dXdENER1BaMDZsSWFGbVlPQUpvN2xKWGw3YW5OSEZaODFmMHpZN0w4?=
 =?utf-8?B?RDY5ZndjYlZMMzJDZ2JvUk03czR2SXZvV0g3dDVMcHRPTXRna2Q1MVA4eHdK?=
 =?utf-8?B?YXV2SXJ6WlkxT0lOYzdvS2hkSWFtL3BLbVhNQnJ5bGEybHRvbm1uUlpyZjho?=
 =?utf-8?B?OUNPdzVBU0NINW5peGV4UzdpaWVOYmxKVlozNDZDZVZLaFdabjRjNHVHa2Mz?=
 =?utf-8?B?a2RGRTM5K3NDK1VMVGdndWQwSlpOMXdwcnYwRGd4TFNMQS85Skp4ZjEyaVNM?=
 =?utf-8?B?RVVrbCtmMTdNaTNmQSt3NWcva0JFTW4rL2Z6RjV1RGc5b0lmUEF4bDBscGtG?=
 =?utf-8?B?LzN6VGErTWQ2blpDY1p0d1lEMlR1b2I1bjZMbElmYUVYMjhwUG0yd1RuY1JD?=
 =?utf-8?B?ekFGVFVYWEJWYUVZTHdGZllBK0s4ZzEwQ015MytRb04rZTF6b3dlbFpFMGpo?=
 =?utf-8?B?Q0E9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62ab4a61-39c5-426a-5a9f-08de33fb7399
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 12:40:20.4638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HtGYEaI2Nsy9mQATigoBuUZDAeE/GDKyY9lU+7wcS2IOwh2rVyUaTuFksoEhG07xRh7y+c6KKMZe1xHOcX8Rz2gwAozUKUBnPKvLgoqRN3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6091

On 05/12/2025 12:01 pm, Andrew Cooper wrote:
> On 24/11/2025 3:01 pm, Jan Beulich wrote:
>> --- a/xen/arch/x86/include/asm/bug.h
>> +++ b/xen/arch/x86/include/asm/bug.h
>> @@ -21,7 +21,7 @@
>>  
>>  #ifndef __ASSEMBLY__
>>  
>> -#define BUG_INSTR       "ud2"
>> +#define BUG_INSTR       ".byte 0xd6" /* UDB */
>>  #define BUG_ASM_CONST   "c"
>>  
>>  #else  /* !__ASSEMBLY__ */
>> @@ -37,7 +37,7 @@
>>          .error "Invalid BUGFRAME index"
>>      .endif
>>  
>> -    .L\@ud: ud2a
>> +    .L\@ud: .byte 0xd6 /* UDB */

P.S. Presumably binutils is going to learn a udb mnemonic at some
point?  Can we include a version number in the comment?

I'm trying to organise such comments everywhere so it's less effort to
figure out when we can drop it in the future.

~Andrew

