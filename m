Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AECD9585CF
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 13:29:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780298.1189921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgN1f-00017I-Fc; Tue, 20 Aug 2024 11:27:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780298.1189921; Tue, 20 Aug 2024 11:27:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgN1f-00015I-Bc; Tue, 20 Aug 2024 11:27:47 +0000
Received: by outflank-mailman (input) for mailman id 780298;
 Tue, 20 Aug 2024 11:27:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WGdy=PT=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sgN1d-00015C-P0
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 11:27:45 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062d.outbound.protection.outlook.com
 [2a01:111:f403:2417::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36cd74f4-5ee7-11ef-8776-851b0ebba9a2;
 Tue, 20 Aug 2024 13:27:43 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by DS7PR12MB5717.namprd12.prod.outlook.com (2603:10b6:8:70::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 11:27:39 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%4]) with mapi id 15.20.7875.023; Tue, 20 Aug 2024
 11:27:39 +0000
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
X-Inumbo-ID: 36cd74f4-5ee7-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p5SHxIt8IZmlab7/wUJtyFoSHjRDBHNaiQy/BO5e6ksdubTd0Yc6pB+JZgW3NzHdbfZ24QvnsDD16rZz5dSeLOHTVzgwmIoOHbxXiQOcdrXAD4+9c2uq/d5bzmJ3mvJXBFLRwxOCORLP3upt+1c9d4pAzg8WYz0ePY4iQopJ14DqkzEpbZ0U6uHYXctI0cy4qJ4PIjYtWvi6j1k/CPi/dStQTszswSIX4T084RG7GpDuIXOAhxUs5s8Nz3iZFk5MrJ7s0x7yXf1sVot5ug0UhQq9LEx4pNH4Qbb3b9OSRuxOHeRYDYwBtUzuU0kzyJDTsUG88MQ6uHLvXkaMsa71hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kz+A9DWD3gLs/DhiyLJv/sKBnxgZtchLnyKe4BqpbpE=;
 b=XaQIBMX8s6vnPT1Zz6nvDZHfGUcTl1TMVnizHuYjbWTPfCs/64Y/4e2TEoLj0ZfzoBkVJSlIk9TwS8CM1NWRYZxu91DtjKdhCGHmcDRrR3AdHRs3KYQZ1qHQVW3N5nNwRRZh5v3ncqCTH/yMIko7me4w4uP8YGXarZQsPB1Wk01aPWM74eyIiO5W59YpStq4n0t3S0SZgaeag3MwQnbCQRAKvJwo8F+36bLrHkD3XSAXmmUWHv2gUgkieQz035KQJ5T6wmG9HlAqroWJvP/VgcpwROdahtNSy3Zo4s3T9xl33CVl06OFwoIMBhMNSrPdy+CSm6ZizeF2SkRJyldT0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kz+A9DWD3gLs/DhiyLJv/sKBnxgZtchLnyKe4BqpbpE=;
 b=SjtZ8cE4p4h9YPFrHRR3kpP2NX8kDrDshM+zKZae5uOUL3tO5CDldE+Z4LyeJfqlI+bfmEC2K0xS+gMufzOdb2DMWXPB9qMVpoY3mQzttLAuqlesExoa1yhGHwoTWpiMuZwZ9WhyAhK91NWVA0U0kw7K548dYEZrWQoCqMx6c28=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <c7fdf37c-d9af-449f-b02a-b8653e21f0a1@amd.com>
Date: Tue, 20 Aug 2024 12:27:33 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] xen: arm: Add a new helper update_boot_mapping()
To: Michal Orzel <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, sstabellini@kernel.org,
 bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com, julien@xen.org,
 jbeulich@suse.com
Cc: xen-devel@lists.xenproject.org
References: <20240813171356.46760-1-ayan.kumar.halder@amd.com>
 <20240813171356.46760-2-ayan.kumar.halder@amd.com>
 <d1144ab4-a342-452b-bd03-a67409657fa7@amd.com>
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <d1144ab4-a342-452b-bd03-a67409657fa7@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2PR04CA0323.eurprd04.prod.outlook.com
 (2603:10a6:10:2b5::28) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|DS7PR12MB5717:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c67767b-b035-44f2-1b64-08dcc10b1941
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZGlhMHkwYkN5UVBGNDRrUXRiR283NmxNOFZhWFFubmxPQUlRNjdQUUhtZlZs?=
 =?utf-8?B?TjhaSWtsUmlBU0dISG0zSXZmcFlYNml3N0pNNVdWUHc0RGo0Z0dJRGdDNGZj?=
 =?utf-8?B?aU5pU1dvVHZLR0lxeGVzS2YzVnlIVzJIb1k1eU5ZK2ROdjFXMzBZT0EzcVB0?=
 =?utf-8?B?T3ZvTCtqeVNUcjRML3VpUENsYkpWUmNlU3VLekpxcUlDMEs0U2phMGV3TnhT?=
 =?utf-8?B?RGd0QjRZNXFTSFFXeEFKUm15RjRhVVNydG1TZnN4QlorTXdvQ3VtLzVjZG9n?=
 =?utf-8?B?WWFTMjE4VS8zZjFxdTZsVEpiaUdNUDExVG5HbEdqNnRaUnhCdW01emhtSWlO?=
 =?utf-8?B?N1Fid2N0NFlnelcrS2hUUmQ4NEdFWmhGdWZlR3RML1VrcUhKRlE3RWgwcjBT?=
 =?utf-8?B?U1hPaDhtUHpZZ1V5d0dhWVhrUEorV0F2VnBxN2doZG5WNjBMNkNFODIrZGtT?=
 =?utf-8?B?dk1Dc291TEhZd3JNZUUwcS9uWHZCcjMyOVZ4Um9RTG5wdFZneGdQK1UrQjdG?=
 =?utf-8?B?bWJ3ZWNvZGdQNHhMbnhKSVRqWElaaXdXMWZFbXJ4Qi9BdDJZQ3oxY1graFps?=
 =?utf-8?B?ZVUwQzJiOHNaYXk4TzhDcmRlUDg2M3FmWHJNSTRnZFZtV0svSnY5aGNYMmdj?=
 =?utf-8?B?M01wK2Q3aVl4RDRaazhNTWtoeEpGVytmenBUbFhHSlZYUmo3N2Z2OExnT3Ru?=
 =?utf-8?B?WC9XUEdVV09KOU15SmNITEFKM0VnOStoSm9pM0U5RzhkcXJOQUxhbHpHM29B?=
 =?utf-8?B?WWt3TUY1clg2RXlWNUdJTk81VGtYY1p1bmo4bjZLcnBCazNUNGF6c3hhaitY?=
 =?utf-8?B?UFR5OEFWTWJ1Mk1KaVBJcnlML2ZiVTlMTjZ0bmRXQ2ZMWlpjdDZBRmdrRito?=
 =?utf-8?B?OFc0MnJuYStrbldEaFdHZ2NndWJHeHJIemdTclptRFRPMlBURjRSNGFxTDMv?=
 =?utf-8?B?MXRBR0hReElGQXVwbnBlMGVjcDNBVnJUVlJDMy9YbHg4WXlIQVBZdmYvbW5w?=
 =?utf-8?B?QUtydkJqNHJTKzBsbitwRjBoZHFTK0xNU2tNcDlaaFMzYVFPbVJ0OFFvS1Q2?=
 =?utf-8?B?bFB2aVFJcXg2aXRRanJSa1h0blZQTE5NelN2aUY0T2hSOExJeFFzMG9ENDFI?=
 =?utf-8?B?OXdUMUVQUXlGclZETDMvdmZyenNFdVVkekVaazhaMEwzeGZueWhsbXcrdm5i?=
 =?utf-8?B?M2tiOGdWU25HR0daT3FBOXM4bUswRHUrTStYYmVpMEo0UEhqeXlNTWpJYkF4?=
 =?utf-8?B?Si9xYnNNNEYwL1YzcWE3azdHOWx1aHVtM3Y5Qk52QVBDUi9qZE9JSEJmY0J6?=
 =?utf-8?B?UFNVVi85eDBid1ZKb3VJdVdTKy9mMm1hcjRmYkVYKzhDTU1VaFhjTk9ZaDVP?=
 =?utf-8?B?ZHNZa28zQmtmU0QzNUtiS1dHamVDTkljekEwejdNckVMbHVLcTBoQ1RWdXlQ?=
 =?utf-8?B?OENKSmx1VW1ESlZDdkhZLzBNenN6VmVDZzZLWlJzQ0FNU3V3ZHl1UGxWNnA5?=
 =?utf-8?B?QVF3R0phaUJ4T1JqNHhwaDVkam5EeWdzb2ZNZ3VYQUlpTFA0QVJCTllDdFdS?=
 =?utf-8?B?SGhXNGdZdXc4cVBjY0tmZGhvSmJIc2VqVmFqVHoyV0RmZ0M0V05UQk1ZaUdz?=
 =?utf-8?B?anhQdGZsN1lwcWNqYUt6WjdKNWd5WXBJenlvWmxQWW1UclRyTFNtNU93Y0FQ?=
 =?utf-8?B?RUNudTNyeXdHMjNuL2w0TVpkMWFGYXU0OVpDcnViMko1cWI2Y0FER0NGU0tx?=
 =?utf-8?B?cTh5OXl4SURyY0ZGdmFYU0dNUmhYWEFLVTAwbXBoaHdzdE15N2RwNjFXQUEv?=
 =?utf-8?B?K0JjZ1J3OHF6YkhkaE9rUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cStlY2N4eXhUYnNIR3g1V3duVjM1RlBFeFdWK1NEeU03SlJsNDIzUEliTlNX?=
 =?utf-8?B?MEIwaGx0OEQ0WWZjYzkzQnY2TCtrOEhIY1g0ckpnUzdoLzladWoxLy9MR3Zz?=
 =?utf-8?B?Qm5JdUNWbjVBSEg1NHFjWWpNZEZPaU0ydWF4K0EyNW9qSE0zcXJ2WWFsU3pI?=
 =?utf-8?B?MWZZUElEU1dUQWpMb21hVi96Z291N3BwS0RwcHlVNm0reTVmTlM5ZDZicU5F?=
 =?utf-8?B?a0NrRGk0eXVZcndRa2p1aUNwbks3YjIyN1RMZWpLVHM3UlN4MCs5ZFFNcFFW?=
 =?utf-8?B?NUFYeDF6VGJJR2NaU3dodnBDTXRZWnJoMTMvRlhtY3hzRUg1ZFdQQTBQNDFP?=
 =?utf-8?B?ZVFpZnFQdWlZZ0ZMTDdFbzZkYy9XemQ2L3lTOWxTVXplK04wMUp1ajd3OW5W?=
 =?utf-8?B?S1cwTG1QR0p2azUrSEwycDJyUzNtTXJudThlUWxJc25aM2R4VkczM1FXZVVN?=
 =?utf-8?B?TXNHVzBUanp6OFBtNTV1SFVLVS9qemJvL0JwSWNlS1ZxcitSTnV1eXFBWDQ3?=
 =?utf-8?B?MEJxdkx1RGwrbm9VNExoY1VKNWh0Wk81VjNLa3R4ekpEKy83NnRYSmREV1VH?=
 =?utf-8?B?MjJIcmEzMUJFR1hWYXJhRFZRbTJOZXBBa3oxVEx4QXZGbE03K2VCdE1GQUJH?=
 =?utf-8?B?aUJCdjZHNlF5WTU4R0pQSmV1NzIxaVRzWnlneHRicUpXRGRINy9OeE1sUlBW?=
 =?utf-8?B?VnJXSW94OW5kOHdweVppWEZXc1h4YWxWTHEwaER5Wit1YTBrbGg3S0pydnUz?=
 =?utf-8?B?b1dpWEJPODNxVVJKQWtwNGRXdkZaVnA0T2RaV2Iva2ZRd3NnSGxyVE5sei9w?=
 =?utf-8?B?aStCU2VjdmhieHkybTdUaHk5cHZxUDBlU0NSNHhjWGRES0RDdHNCNVJzSmIx?=
 =?utf-8?B?RFFVSnd1MndhVmdoWUR5c2ZncVIxR05LWTdFbzI5ejZJK2VpazI4YytOYldG?=
 =?utf-8?B?VDNGRW42NXovSkdaU005MzFWcnQzdlBDM0RMbWVwRHBHMUxVVUtCZjMvL1BN?=
 =?utf-8?B?YkRJd0tzUzJ0ZGEwbWdXRXg5L0NNVCtoSEZxWFhqS09VRTdHNC9xQmNrcjA1?=
 =?utf-8?B?QVlQM0dUcFdOOTBYNWR1dFFVY2VHUktRZ3N5ZXBvd1ErNVNvTzNZQzZRQ0N0?=
 =?utf-8?B?WENWcm4zN0NLTkhobUdDcVpzK1Q0UkJzQ1ZoNi9veFlkWHI5djZzbG9IYkRm?=
 =?utf-8?B?Y1RYMDdYLzVnMWtadjM2bWR3U2w3UU11aUZQSE9SdDRWamsxV1poQW95dm1n?=
 =?utf-8?B?aDBOTGk4SDYwNm5sWWNQcko3NFZjb2lXVXVXODBlbGtZbVBYYWFqUTZvR1da?=
 =?utf-8?B?Yys0dzJKWldCajVVRnNXeXltczhvaGlJOFEvd2lJZEpjemUxd2N1cXRObkRa?=
 =?utf-8?B?R1BiZUpBS2Z5RzNJclUrOWxkRElkRnlIM0oxdnJ6ZTc4SDNEN1dldG9LNWpN?=
 =?utf-8?B?ZWp2eGIwbDBTS3BacnFWeUZXS3U2L0VWZEIxdVRrUmRPMGsrQUxIM0xOZ3JQ?=
 =?utf-8?B?OXVodktscmlUMldjM1lZaElUWFVsSVRpTlp4SHdxSjlSY0hjbTRkZ1BCMWtN?=
 =?utf-8?B?TkRtcmUvZlNCNEp1VDJKa0NRb3EyT2UzNXl6d0UwM0tqU011cmhsejFqYWM5?=
 =?utf-8?B?Q1NrMkVLMFJnM2NRODlTaktQU2d3RVhYSGFsZ0xpNkRaR1h6bFhtR1BvNFBN?=
 =?utf-8?B?MVNOYnZYOXpXck9HR2QzZGE5MTEvd0xTYUNsV0pqSlk1cTVhTXZheEJTem9D?=
 =?utf-8?B?RGg3cEdZYmFqdmhnWGxnRHdmaDE2ZlpzQldDeTFCaWlqTUFxRi9UdkJ5cDND?=
 =?utf-8?B?cnF2aWU2bEthYlBhTDg4MENGc2N5Z1Q1K084azZWenVVZHM1WnppQlFjcWdz?=
 =?utf-8?B?aXpWcE1uSUNnZytqSkZKSklXbHFpTXdGbEtad0FQVTFNNDhTVUdqUlhmV3dp?=
 =?utf-8?B?RGw4bCtkNk9iVXBWMFVqWER3YVNneDZwSWxBNWV6YTliUkdLeHlUNy8zMHpK?=
 =?utf-8?B?bnZLUHVWMmJEWXBYclgxeTEvendrUjl5SVRlSzloQmJQbU1pbnRlZGRiZ2hT?=
 =?utf-8?B?M0NaRHFEL2c0WWdCUzdhMkxDV09ueUlxT0VOUzJSeUdEcWVvQURuRng5ajVD?=
 =?utf-8?Q?amUM2CeCmJMDbiSykLkylY8jg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c67767b-b035-44f2-1b64-08dcc10b1941
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 11:27:39.4661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c5XJeLoguD5MsE1EwZ8Ig9Wb/5FAhi/nqnRkVfDDoDWPoTI3kaFusX0di+AkLMtnXthweogecRDKdamm8nRpyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5717


On 14/08/2024 13:50, Michal Orzel wrote:
> Hi Ayan,
Hi Michal,
>
> On 13/08/2024 19:13, Ayan Kumar Halder wrote:
>> update_boot_mapping() invokes update_identity_mapping() for the MMU specific
>> code.
>> Later when the MPU code is added, update_boot_mapping() would invoke the
>> equivalent.
>>
>> The common code now invokes update_boot_mapping() instead of
>> update_identity_mapping(). So, that there is clear abstraction between the
>> common and MMU/MPU specific logic.
>>
>> This is in continuation to commit
>> f661a20aa880: "Extract MMU-specific MM code".
>>
>> update_identity_mapping() is now marked as static as it is called within
>> xen/arch/arm/arm64/mmu/mm.c only. Also, updated the prototype to
>> update_boot_mapping() which is now invoked from other files.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>> Changes from :-
>>
>> v1 - 1. Introduced update_boot_mapping() which invokes
>> update_identity_mapping() in MMU specific code.
>>
>> v2 - 1. Make update_identity_mapping() static and update the prototype.
>>
>>   xen/arch/arm/arm64/mmu/mm.c         | 7 ++++++-
>>   xen/arch/arm/arm64/smpboot.c        | 6 +++---
>>   xen/arch/arm/include/asm/arm64/mm.h | 2 +-
>>   3 files changed, 10 insertions(+), 5 deletions(-)
>>
>> diff --git a/xen/arch/arm/arm64/mmu/mm.c b/xen/arch/arm/arm64/mmu/mm.c
>> index 293acb67e0..1afbbeda5a 100644
>> --- a/xen/arch/arm/arm64/mmu/mm.c
>> +++ b/xen/arch/arm/arm64/mmu/mm.c
>> @@ -111,7 +111,7 @@ void __init arch_setup_page_tables(void)
>>       prepare_runtime_identity_mapping();
>>   }
>>   
>> -void update_identity_mapping(bool enable)
>> +static void update_identity_mapping(bool enable)
>>   {
>>       paddr_t id_addr = virt_to_maddr(_start);
>>       int rc;
>> @@ -125,6 +125,11 @@ void update_identity_mapping(bool enable)
>>       BUG_ON(rc);
>>   }
>>   
>> +void update_boot_mapping(bool enable)
>> +{
>> +    update_identity_mapping(enable);
>> +}
>> +
>>   extern void switch_ttbr_id(uint64_t ttbr);
>>   
>>   typedef void (switch_ttbr_fn)(uint64_t ttbr);
>> diff --git a/xen/arch/arm/arm64/smpboot.c b/xen/arch/arm/arm64/smpboot.c
>> index a225fae64d..789f352ab6 100644
>> --- a/xen/arch/arm/arm64/smpboot.c
>> +++ b/xen/arch/arm/arm64/smpboot.c
>> @@ -112,18 +112,18 @@ int arch_cpu_up(int cpu)
>>       if ( !smp_enable_ops[cpu].prepare_cpu )
>>           return -ENODEV;
>>   
>> -    update_identity_mapping(true);
>> +    update_boot_mapping(true);
>>   
>>       rc = smp_enable_ops[cpu].prepare_cpu(cpu);
>>       if ( rc )
>> -        update_identity_mapping(false);
>> +        update_boot_mapping(false);
>>   
>>       return rc;
>>   }
>>   
>>   void arch_cpu_up_finish(void)
>>   {
>> -    update_identity_mapping(false);
>> +    update_boot_mapping(false);
>>   }
>>   
>>   /*
>> diff --git a/xen/arch/arm/include/asm/arm64/mm.h b/xen/arch/arm/include/asm/arm64/mm.h
>> index e0bd23a6ed..ac8d1f5c78 100644
>> --- a/xen/arch/arm/include/asm/arm64/mm.h
>> +++ b/xen/arch/arm/include/asm/arm64/mm.h
>> @@ -21,7 +21,7 @@ void arch_setup_page_tables(void);
>>    * Note that nested call (e.g. enable=true, enable=true) is not
>>    * supported.
>>    */
>> -void update_identity_mapping(bool enable);
>> +void update_boot_mapping(bool enable);
> The whole point of adding a wrapper was to avoid ambiguity \wrt identity mapping and MPU.
> You changed the name of a function but left the comment which is pretty MMU specific. I think
> it should be moved to update_identity_mapping.

Yes, you are correct. I will move the comment before

static void update_identity_mapping(bool enable)

{...}

>
> Apart from that:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

I will keep your R-b

- Ayan


