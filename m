Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5C2A49813
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2025 12:08:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898624.1307142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnyDb-0005EX-Ev; Fri, 28 Feb 2025 11:07:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898624.1307142; Fri, 28 Feb 2025 11:07:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnyDb-0005CT-CL; Fri, 28 Feb 2025 11:07:47 +0000
Received: by outflank-mailman (input) for mailman id 898624;
 Fri, 28 Feb 2025 11:07:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T3SU=VT=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tnyDa-0005CN-5M
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2025 11:07:46 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20631.outbound.protection.outlook.com
 [2a01:111:f403:2412::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3abeca52-f5c4-11ef-9898-31a8f345e629;
 Fri, 28 Feb 2025 12:07:43 +0100 (CET)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by BY5PR12MB4323.namprd12.prod.outlook.com (2603:10b6:a03:211::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.23; Fri, 28 Feb
 2025 11:07:35 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%5]) with mapi id 15.20.8489.018; Fri, 28 Feb 2025
 11:07:35 +0000
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
X-Inumbo-ID: 3abeca52-f5c4-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RNf1qP+TDerBsKCq8p9KHIfpfQUWagC42hp92jHl3U4R3E8jek9Orvbptd9osU2KerC9YzwjHFUZGc7s1IVA3mLW+gxTPaXmkLZONBqbXoeDWApx5kUmW65vrhw2c/ZHhaGt5ss4Yo3trVarzFMIgEzpNIo2gZPiiI/+RvNno9Nb+aqXeIBWIkMXmVS/6d4IZ0VPyeCbcTFL+58BedNCROq0AqXMr5wTvB41v9kt+qlw9//lvKBFoWX0RTYVjKgFU8waCM+hp7CUSZdYWABvNVDDJt3+f58jGV6X9gm5fBEhmI3qmtpl5htKHi8FMb0vCJFhs0k2kkf4addGBum/Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xXXpqbtWnqJgjmrJ8SvofLRIAr6xWDu4kC+Azn4AFBA=;
 b=FBCtDAgfxJfl1xOaNjkJErgjv2FpETlhnDyqzquG6cbk0yB5orUmdEpyq8Lnv6F2BXvXc4Q448MSrAywQYLjIAFjVq+kkELHHrCvCLeJAHfU3hDgBcWMRjga7TBqAw9/ze64AQ5FXsB9wm7reZmsqABB4MmWiQQeo3At4yrYo9j+bAaUwB8BVlQIZHgwTnM44IIi66zMUmgc5O2VJMl1XqN3qWVMkAkKw5is2xBZd7LdyZtsk70v9BgqOAwdx9bDaxVpA8tSoc03LW+v1AucP4c+mVhiSwcjIj+Dg04biYtRkSkOgoa9tC/E9vwiVVpu8A7EKviYAEoMP4kBJiKRsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xXXpqbtWnqJgjmrJ8SvofLRIAr6xWDu4kC+Azn4AFBA=;
 b=sfNc6ls5lKL7TZG+3r5t20QZjGM/3dlNzxFojqd34kKW4W7VwX/x2MZvi8kagX35VbDnBrk27DOhFc2AuDUvkbl1H2fIGteN0OJZ3vWOoLwIf+r3jJgHOtTC6gOn/C7wpoe4pimBF2koZkyw45ytaGxPUOplNLi/I3w9okE1A2I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <4b81d71f-f0bb-4c0a-b1f5-cf5e0a2cf97d@amd.com>
Date: Fri, 28 Feb 2025 11:07:30 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] docs: fusa: Define the requirements for
 XEN_VERSION hypercall.
Content-Language: en-GB
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>, Artem Mygaiev <artem_mygaiev@epam.com>
References: <20250227150922.3965010-1-ayan.kumar.halder@amd.com>
 <636358F4-C156-4304-9C75-A8DF36E16F2E@arm.com>
 <3ec73f8f-0a91-46eb-9ea8-461fc6bac373@amd.com>
 <6B6C39FB-E0C5-4873-923D-32D4B277B224@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <6B6C39FB-E0C5-4873-923D-32D4B277B224@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0419.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:39b::12) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|BY5PR12MB4323:EE_
X-MS-Office365-Filtering-Correlation-Id: 9af129bc-f095-428d-80a7-08dd57e81abc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bkwxaDduUm9pcDBzWFVOS25wUlF4VktCOEJMWi9IQjR2VW1wS1NKRnM1ZmRr?=
 =?utf-8?B?YllvQjJ2RVhFdTNjMnRvZjFjSWRzNmxYM0hiNTY2aHdxUGh6VWRmYVprbWov?=
 =?utf-8?B?S01Ga29Nc3FRRVdyWXVoRkd2WVB3Zi9menJBZWlpMHM2b0lpMytaYkNTcnF3?=
 =?utf-8?B?enJRT0c3Z0QwbzhVa1UrdG9WaW5STkwwcis0MDFBeDIrclhMWWRDNzdoYkkr?=
 =?utf-8?B?T216N0l1TUpGcDdDYXQ3d2MyQnkvdEozUmxJVGFMM3gvZHpSTm9lRjgvNFdv?=
 =?utf-8?B?TUNDUGdrNE1BZExFRmF1NmtwSXQySERIRmdMRGJWNVJvVE5LazJmbUdueEo3?=
 =?utf-8?B?ZUJJdkxBdWFGNlNLMWZ3RlpEd1FTS283aWNHb3d1YjFJQ1dWcnA5V2RtcStE?=
 =?utf-8?B?Zm5CK1NXeTVZdzNoakJ3T0ZueG1DOUNIQ05yZkJsck5nYVNDK2tNdFJHcWV6?=
 =?utf-8?B?RnEzQjFlMml6cXBBWDg0ckhpZStqeHJ2VzlTeVlyRzdWSmpuc0VSdFc0QjlP?=
 =?utf-8?B?Rkg4RDJ2L1BxazBZVU1VL1M0ZnFpR0VxRE8zcTdiZHk0cCt1bzdwOFhRWnhL?=
 =?utf-8?B?OGorQ2tSYmNFcXh4OUhDSzZMNm9MK0ZpcFdQUDh1RUdYTFoyMmdqaFRKamdK?=
 =?utf-8?B?bDN0RVdlN3BWRnZITjR4UVplY0p2akphemdmbDNuNWtMWFdxYmN6VEMrTmZI?=
 =?utf-8?B?YUFOejQzYi9DRWdXL3Z0bnJzVjFpQTlRTlovRDBBeEhGNW54SnVMbjhtckI3?=
 =?utf-8?B?SEwwd3J1UUFvc3o0MVRXSkEramwyai92YXVybVlsMlBQdWY5Qk9KaW5wSjAy?=
 =?utf-8?B?Z0hDbEMxS09VNTUyTUc0TzJkeUQ0cnZxRkRISHFZeXJWNmFOdEN1M3ZyVWxO?=
 =?utf-8?B?U1VaVUhJN3J5U2h0NkoyK0NVaXhOc3NnMnpZT0RYcVhjRzliemhGMmltendo?=
 =?utf-8?B?NVRvemdlQlZkMjZLbnFycDBEN1JXUk00eEV2K1dNNnhZalNJRmhUbEQ2OE9a?=
 =?utf-8?B?THg1bE9WY3dOOUt3VWI5M2JxamtPZ0pVaVlJUzgzaEhINTRWVTZhRGJlYlI1?=
 =?utf-8?B?SjJZR1JzejNBS0I1bGRDejMrMUFZc2pXMGxNTUJOa0gyVFFUZVA0ZWUwenJL?=
 =?utf-8?B?VlJlSDBiMDdOd205dnVtYXZpS1BtaFFDVkRIYjA2TWZ2YllTT3RMa0YyZXNC?=
 =?utf-8?B?OFBVQnlEeThRd3lXcFVqdHhwM0t1T1JpVVYzUkp4RVYvZEpUdnRRd2RBb3Nl?=
 =?utf-8?B?YzM2N1F1d2FLbzVqWkJwTjhuYmZFTzM4OE1WVVc2bDR1c2lJcEJRL2ZDQXVt?=
 =?utf-8?B?cUtMOFNDemtCRC80eUlsRk5tam1sY2xxSHJsSW5TVys5ZmRRdlJmMUhrMnls?=
 =?utf-8?B?VGpuT2o2RVByZ1ZlY2FSbmg1KzhuRTllaXE3YlNiUStXcStablRadzlXejhI?=
 =?utf-8?B?a0UzQVFQM0Z1MnJCZzh2d2ZiZUwvN1JMblhxY0dSemlTSlZpRWoyRUFCL29n?=
 =?utf-8?B?UTdxUTBlNGVaTGIydHFzQWpIc0E4Wll5WDBMRkx5L2YvMVExcXFQc1lNL2J6?=
 =?utf-8?B?amdXUGtISGxPUWhSdDR6T1VTeDhMWWl2dnhUQVJxM2hRdGlUQzNtckpTMXNz?=
 =?utf-8?B?aXptZ2pZcWpVdFlvOUJGNENIOGxtRVZiazZkaFZsK1d6aU1Gc1Vwb0JBa2l0?=
 =?utf-8?B?WlBvSHpjaFhybENJV2lSWFUwMWkrTzBKSi9CQUxPdDl1UmxYWFB3ckpJUEZC?=
 =?utf-8?B?aWx5Q1YvWHlNV01iMnYxT1hDTFRDSlE1UktoZkdyM1RmRTNRWlpUVXpQZWsv?=
 =?utf-8?B?dmxZNGZoWFBncXFEVWJkdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SlN4Z25YR1kzZFI5S0kyRm5aYlFoelZKcW5Yb1hESjBkVmhHYWY2VzNBWEVl?=
 =?utf-8?B?ZXhEZzhrQTNUOXQ5alhVVkQyYmtINE1HOUdBTis2N09HTlpNZVVibElBOC9p?=
 =?utf-8?B?SVhUVStYRlB4YlpDMzVLRkJoUVdnRUN0Qi92T3ZHSW9NTjZnYURJWm4wQWZK?=
 =?utf-8?B?bFliR0h4bWZkRlFzOWN1R3J1cTVUdHRmaVpBSXNwelIyZ0k0M2RvVWgvaXJp?=
 =?utf-8?B?cGNSdzRUWmd0akw0OWJ5dnZGTEY0Q3JrZW5IN3hqaTZNMnc3czJXMHVtbDRE?=
 =?utf-8?B?QXhHSkpxczlFR053SU9TWlhySmpmMm5OM2YvbjV6eUZHVHEyayttWVhRdEJo?=
 =?utf-8?B?ZUZCbGRlMDUvV0hqWWlhMFlCTW9PTHhFeTA0U1ZUcXBEQkE1Tk9PVzAvZFY5?=
 =?utf-8?B?Y1VMT0dnNFlDWG5vcEdHajFHWDdPakJYK3FrKzYweVhnL2xqelllcjdhYkI2?=
 =?utf-8?B?NVJpeGwvdjZJajJxN2tTbjVjbnJDTElHaE5xM0pKZGVINkwwSmozeHpmVUFL?=
 =?utf-8?B?SWhKWXJaMXRUT3ZBMFFyaExTZEl3OElxU3BQMVBFdzREVTdvTW1SS1QyZU9R?=
 =?utf-8?B?MVArM3ZJVXI1dTNxYWh6US9XcUNrRkxwMTJTSlA1ektpSDBOTWk0WDc4bEIx?=
 =?utf-8?B?NWg2LzhCZjU4a3pEemw4aU9BTTdoSG5vU0JZTWZZeG5jbjNpTkYxOWFlaitR?=
 =?utf-8?B?WTExR2pwU3MvdFV3WmpjVXZlQmQxZ3lpbnlyNnBHUnp3TjhQb2kwc0Q0QURM?=
 =?utf-8?B?RmJ1czVqV0V0MWtTditSRkRJdUl3WTRtc045TXVxUDQ4Y1dlUldNSzIxd20r?=
 =?utf-8?B?TGk1alUxcnBuR0wvV1I0QytXK3BwSXdON3ZuOGNmbnlyOGM0cGxoKytSYS9Z?=
 =?utf-8?B?MXJMRXJzOGpFRWNQOC9qK05oQlZVa2ZnSW00Y3RVR3p3MmdiSy91RlVidmYr?=
 =?utf-8?B?OXF4NGRzMlZGNExUc2FHY0NUclFmUHBKQW51MTNUUmRyRFVoTXFua2Jsd3Q2?=
 =?utf-8?B?eVY1b3ZZQlRqWnlqZmgwSUZjQlgyMmg2WC8yOHAvWXhQeGRxL2JKamtjZkhJ?=
 =?utf-8?B?aFdpV1l4U1pRSFNGOWNMWmQxcGRDY1NCbmFWdytJZEpiNk9xYWU5QURYNXho?=
 =?utf-8?B?S1cvM0JCaVFUYXVzNTNCdU03VGk5clNSdktmYkQ1QTl5NnVZSVBaUFMzVlNn?=
 =?utf-8?B?eHpWMFhzRlV2ZnRmQW9KbHdJaTZIUmNqSStCM1BGSWlhbmRkbk52Snl3WUFu?=
 =?utf-8?B?QXB3ODNzRHl2WHVvbThOeGY5MWxVU0JuL0FOVjkrNkMrUHVjcC9SWVdabFRH?=
 =?utf-8?B?WmdXYkRtODY0K2ZwcE1DM2tqNDdheFREaU1qdzJxdkRkb2svMlg1SW9xNU5S?=
 =?utf-8?B?TkNNSkFDU3R6Y2ZYSi9rMXJFSWI0MmcwMXlCNHNOZTlFbmsyYkw5aTRVSFNt?=
 =?utf-8?B?VWRSWENYaVUwWXpQUlBLTTdHc25PU3NXSWZLMFhoVlRZUVUrNHZ0ZE1zdXlt?=
 =?utf-8?B?bG1vZ0VHWGNoanRWRmU3L00zQ0F3am0xK0JVdVRTMWhpUXFkdVhBVzNPS2Zq?=
 =?utf-8?B?RjNiYWlxODhoNTBXUk9OVHdzc1dIcm55QVZMcWFSOXNDeEQrUitOWUdYRjBT?=
 =?utf-8?B?bGlxaVNaZFJyMkJMVmcrU1pLMkZrUXR4dUF6K0RCamFQRkM1bjVOVDhJdWl5?=
 =?utf-8?B?UDZiU2ZVN2k2NmNDdEpFQkJ6a1BVYW5NQnhHdFVXTEEwcW5laVpaRjZzdHRy?=
 =?utf-8?B?NFQ2K2V5cUI1VzIwTnJJdnJpYlJ2eFZzK0Y4bTFLN1dyckJ1VVFhMmZFY252?=
 =?utf-8?B?enNLb3pnMlYrM3JyN1JVdy9PaWNEOU9peWxJdzRGWStaWDJSSVpFU2cyWEFN?=
 =?utf-8?B?b1phT2lCNXJFY1VoRXdwc1RaSnNWN1o5K0RXd0t6SGtBa1RUNXltT0o5VnA2?=
 =?utf-8?B?d0NGa1RsYWRiV0RKN1dhWEh2bmFJZWV5a2ZnT1l6MlVWRkZLYmk5cjhvQXI3?=
 =?utf-8?B?ZWxTYkJDVlNtWDFnRW9jU1F2RkJRUTZ2bm5jNWJLR3hiVEJIM2E5djRNMkZB?=
 =?utf-8?B?RU5Ha01kMjFTVW9WWDdXZ2tYbllDemFBZkhSRWJQTFFmZllNNWZIc1d1a25D?=
 =?utf-8?Q?KU8zTIlx50/bKzyTtVODy2P5P?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9af129bc-f095-428d-80a7-08dd57e81abc
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 11:07:35.2013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gWnZGSR/yIopAJjOOSIUyqd9VFcy49QbUo8fT3q8YTiuScq+oF9j5O/E7AgUhjoVrLfuhCYcl4Y/hoMnzbr+IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4323


On 28/02/2025 07:54, Bertrand Marquis wrote:
> Hi Ayan,
Hi Bertrand,
>
>> On 27 Feb 2025, at 20:29, Ayan Kumar Halder <ayankuma@amd.com> wrote:
>>
>>
>> On 27/02/2025 17:15, Bertrand Marquis wrote:
>>> Hi Ayan,
>> Hi Bertrand,
>>
>> I have just some clarifications.
>>
>>>> On 27 Feb 2025, at 16:09, Ayan Kumar Halder <ayan.kumar.halder@amd.com> wrote:
>>>>
>>>> In the current patch, we have defined the requirements which are common for
>>>> all the commands.
>>>>
>>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>>> ---
>>>> Changes from -
>>>>
>>>> v1 - 1. Fixed `XenProd~version_hyp_ret_val~1` requirement as Xen does not return
>>>> 0 for success in all the cases.
>>>> 2. Reworded the requirements so as to write them from Xen's perspective (not
>>>> domain's perspective).
>>>>
>>>> .../fusa/reqs/design-reqs/arm64/hypercall.rst | 55 +++++++++++++++++
>>>> docs/fusa/reqs/index.rst                      |  2 +
>>>> docs/fusa/reqs/market-reqs/reqs.rst           | 16 +++++
>>>> .../reqs/product-reqs/version_hypercall.rst   | 61 +++++++++++++++++++
>>>> 4 files changed, 134 insertions(+)
>>>> create mode 100644 docs/fusa/reqs/design-reqs/arm64/hypercall.rst
>>>> create mode 100644 docs/fusa/reqs/product-reqs/version_hypercall.rst
>>>>
>>>> diff --git a/docs/fusa/reqs/design-reqs/arm64/hypercall.rst b/docs/fusa/reqs/design-reqs/arm64/hypercall.rst
>>>> new file mode 100644
>>>> index 0000000000..ffd883260c
>>>> --- /dev/null
>>>> +++ b/docs/fusa/reqs/design-reqs/arm64/hypercall.rst
>>>> @@ -0,0 +1,55 @@
>>>> +.. SPDX-License-Identifier: CC-BY-4.0
>>>> +
>>>> +Hypercall
>>>> +=========
>>>> +
>>>> +Instruction
>>>> +-----------
>>>> +
>>>> +`XenSwdgn~arm64_hyp_instr~1`
>>>> +
>>>> +Description:
>>>> +Xen shall treat domain hypercall exception as hypercall requests.
>>>> +
>>>> +Rationale:
>>>> +
>>>> +Comments:
>>>> +Hypercall is one of the communication mechanism between Xen and domains.
>>>> +Domains use hypercalls for various requests to Xen.
>>>> +Domains use 'hvc' instruction to invoke hypercalls.
>>>> +
>>>> +Covers:
>>>> + - `XenProd~version_hyp_first_param~1`
>>>> + - `XenProd~version_hyp_second_param~1`
>>>> +
>>>> +Parameters
>>>> +----------
>>>> +
>>>> +`XenSwdgn~arm64_hyp_param~1`
>>>> +
>>>> +Description:
>>>> +Xen shall use x0 to read the first parameter, x1 for second parameter and so
>>>> +on, for domain hypercall requests.
>>>> +
>>>> +Rationale:
>>>> +
>>>> +Comments:
>>>> +
>>>> +Covers:
>>>> + - `XenProd~version_hyp_first_param~1`
>>>> + - `XenProd~version_hyp_second_param~1`
>>>> +
>>>> +Return value
>>>> +------------
>>>> +
>>>> +`XenSwdgn~arm64_ret_val~1`
>>>> +
>>>> +Description:
>>>> +Xen shall store the return value in x0 register.
>>>> +
>>>> +Rationale:
>>>> +
>>>> +Comments:
>>>> +
>>>> +Covers:
>>>> + - `XenProd~version_hyp_ret_val~1`
>>>> diff --git a/docs/fusa/reqs/index.rst b/docs/fusa/reqs/index.rst
>>>> index 1088a51d52..d8683edce7 100644
>>>> --- a/docs/fusa/reqs/index.rst
>>>> +++ b/docs/fusa/reqs/index.rst
>>>> @@ -10,5 +10,7 @@ Requirements documentation
>>>>     market-reqs/reqs
>>>>     product-reqs/reqs
>>>>     product-reqs/arm64/reqs
>>>> +   product-reqs/version_hypercall
>>>>     design-reqs/arm64/generic-timer
>>>>     design-reqs/arm64/sbsa-uart
>>>> +   design-reqs/arm64/hypercall
>>>> diff --git a/docs/fusa/reqs/market-reqs/reqs.rst b/docs/fusa/reqs/market-reqs/reqs.rst
>>>> index 2d297ecc13..0e29fe5362 100644
>>>> --- a/docs/fusa/reqs/market-reqs/reqs.rst
>>>> +++ b/docs/fusa/reqs/market-reqs/reqs.rst
>>>> @@ -79,3 +79,19 @@ Comments:
>>>>
>>>> Needs:
>>>>   - XenProd
>>>> +
>>>> +Version hypercall
>>>> +-----------------
>>>> +
>>>> +`XenMkt~version_hypercall~1`
>>>> +
>>>> +Description:
>>>> +Xen shall provide an interface for the domains to retrieve Xen's version, type
>>>> +and compilation information.
>>>> +
>>>> +Rationale:
>>>> +
>>>> +Comments:
>>>> +
>>>> +Needs:
>>>> + - XenProd
>>>> diff --git a/docs/fusa/reqs/product-reqs/version_hypercall.rst b/docs/fusa/reqs/product-reqs/version_hypercall.rst
>>>> new file mode 100644
>>>> index 0000000000..03221f70c3
>>>> --- /dev/null
>>>> +++ b/docs/fusa/reqs/product-reqs/version_hypercall.rst
>>>> @@ -0,0 +1,61 @@
>>>> +.. SPDX-License-Identifier: CC-BY-4.0
>>>> +
>>>> +Version hypercall
>>>> +=================
>>>> +
>>>> +First Parameter
>>>> +---------------
>>>> +
>>>> +`XenProd~version_hyp_first_param~1`
>>>> +
>>>> +Description:
>>>> +Xen shall treat the first argument (as an integer) to denote the command number
>>>> +for the hypercall.
>>> You speak of argument here and parameter earlier.
>>> I would rephrase to: the first argument of an hypercall exception as the command number for the hypercall.
>> Ack
>>
>> Should I do this everywhere ?
>>
>> s/parameter/argument
>>
>> That would make it consistent.
> Yes definitely
>
>>>> +
>>>> +Rationale:
>>>> +
>>>> +Comments:
>>>> +
>>>> +Covers:
>>>> + - `XenMkt~version_hypercall~1`
>>>> +
>>>> +Needs:
>>>> + - XenSwdgn
>>>> +
>>>> +Second Parameter
>>>> +----------------
>>>> +
>>>> +`XenProd~version_hyp_second_param~1`
>>>> +
>>>> +Description:
>>>> +Xen shall treat the second argument as a virtual address to buffer in domain's
>>>> +memory.
>>>> +
>>> Same here on argument vs parameter.
>>>
>>>> +Rationale:
>>>> +
>>>> +Comments:
>>>> +
>>>> +Covers:
>>>> + - `XenMkt~version_hypercall~1`
>>>> +
>>>> +Needs:
>>>> + - XenSwdgn
>>>> +
>>>> +Return Value
>>>> +------------
>>>> +
>>>> +`XenProd~version_hyp_ret_val~1`
>>>> +
>>>> +Description:
>>>> +In case the hypercall fails, Xen shall return one of the error codes defined
>>>> +in http://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/include/public/errno.h.
>>> This is a very imprecise req as it does not states what can fail and what should be returned exactly.
>>> Do we want to be that generic ? if yes then this might be a requirement valid for any hypercall.
>> Yes, you are correct.
>>
>> I am thinking of pushing this further up ie have this requirement at market level and leave it **unlinked** to any product requirement.
>>
>> IOW, we don't need to validate each and every error code returned by the hypercall.
>>
>> Or should we just drop this requirement ?
> I think you should move this requirement and make it a generic one valid for all hypercalls.
Yes, I will place it under hypercall.rst.
>
> Now at some point you might have to describe which error is caused by what problem as part of your hypercall interface definition.
> ie: one generic product req and per hypercall design req describing the error cases.

Agreed.

And an example design requirement which will be linked is :-

Xen shall return -EFAULT if it encounters an error while copying the 
extraversion string to domain's buffer.

Is this what you have in mind ?

>
> At the end you should have a test to trigger each error condition and that test will be linked to the design req corresponding.

Ack.

- Ayan

>
> Cheers
> Bertrand
>
>> - Ayan
>>
>>> Cheers
>>> Bertrand
>>>
>>>> +
>>>> +Rationale:
>>>> +
>>>> +Comments:
>>>> +
>>>> +Covers:
>>>> + - `XenMkt~version_hypercall~1`
>>>> +
>>>> +Needs:
>>>> + - XenSwdgn
>>>> \ No newline at end of file
>>>> -- 
>>>> 2.25.1
>

