Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCECA80FF6
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 17:29:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942412.1341576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2AtG-0002iE-Ug; Tue, 08 Apr 2025 15:29:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942412.1341576; Tue, 08 Apr 2025 15:29:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2AtG-0002f9-RF; Tue, 08 Apr 2025 15:29:30 +0000
Received: by outflank-mailman (input) for mailman id 942412;
 Tue, 08 Apr 2025 15:29:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=23Rw=W2=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1u2AtF-0002f3-QE
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 15:29:30 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20604.outbound.protection.outlook.com
 [2a01:111:f403:2407::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f9111ba-148e-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 17:29:24 +0200 (CEST)
Received: from MW4PR12MB7334.namprd12.prod.outlook.com (2603:10b6:303:219::21)
 by CY8PR12MB7414.namprd12.prod.outlook.com (2603:10b6:930:5e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Tue, 8 Apr
 2025 15:29:20 +0000
Received: from MW4PR12MB7334.namprd12.prod.outlook.com
 ([fe80::2e77:557:17d5:86f8]) by MW4PR12MB7334.namprd12.prod.outlook.com
 ([fe80::2e77:557:17d5:86f8%3]) with mapi id 15.20.8606.028; Tue, 8 Apr 2025
 15:29:20 +0000
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
X-Inumbo-ID: 3f9111ba-148e-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CSU7sAyOfXTfX7gzTfn/1JO6EptI8KNpeNSLrI8xgUhHyUmxhxxUAnh3oTU4PJLZFlAnJpQl+la6rZpGqdw1Ls/M1FerOeYagDtgrWW3D6wPANTsH4OFXRNymF7uCt0n35Dlw4fuHsIpAQBsfyYn1BdfR1XpDjyEQRZUVIFUp7b7l9/GFYrGF4dDoL5Md4tCuEogctfN68vYLLxJfbJh0XJEeqif6vA7/5/OGPHYOiGqyTAMssyRBjVkULg8tNdePuw0g5p/kMxCVlWW6ysDRFnHJQteUGe8gaPV+O8yEaJhDyfln69gyhxAGeb3sb39k5jfTmkBh7EtKHHK/ikX7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mz1x03g7J3AAtX3SVyV3AwR03UOOS9GXgPQq7Yazlq8=;
 b=ZvzsK2NU+moukN5vGXY41nkhCXgSt/SCG4xS2jy4nHosOSA+NiZpgK39YZBOywoqVGXYYkfK1eIsIs2qRt3IDe0FfzkbiU7kj5hA/a4NwIFFzMqlZ1pnk9rwkBBpWcI3xXhnv/OX1ma0gLF+7yzqpvLXULRZjV3Ed5Ps/7WA/ayMy5WP2SMWB2x/g/svAMRGsUsEVlVWgNEY8lLVIZb3K2r5HWKNXLeOYXZdl4JxxgCTg9hNKcPsvgbVJPEsnZMm2M1shl2HZKRVSyv/dUTmMUSbyG/Frf9RMFvMxt/xx/jqWDNXpaIA1Aev/eGckkaU3DLLzIaNgUTH4oyrtYH0xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mz1x03g7J3AAtX3SVyV3AwR03UOOS9GXgPQq7Yazlq8=;
 b=HBm+BN/maBlA54cqnD7GGvbrhZPNKZeUNXBXjLkTjjK3fdzWH0Ow1T4MotB6G+5/YV5H8ZA225tiZtO9ZRqXM4J3gIbmmPw4gOZoZA3922cm5ha33RxxclBMuAXPyG8tw4JC/O8W7ytGI9/A6v4548I1r+r4TcFpJxbnWMO0K9I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <3deb75be-3f7e-436b-835f-3efd3fd2a391@amd.com>
Date: Tue, 8 Apr 2025 16:29:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] arm/mpu: Implement setup_mpu for MPU system
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250407091430.2342709-1-luca.fancellu@arm.com>
 <20250407091430.2342709-8-luca.fancellu@arm.com>
 <d6c12013-235a-405f-a87f-529648d6f340@amd.com>
 <7591A04F-8BEF-4FE7-A895-90E5DA0D9936@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <7591A04F-8BEF-4FE7-A895-90E5DA0D9936@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0317.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::16) To MW4PR12MB7334.namprd12.prod.outlook.com
 (2603:10b6:303:219::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB7334:EE_|CY8PR12MB7414:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f05db94-16d6-4dc7-bd0e-08dd76b221d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L0pZWFVRUDBlbHRzVWd0Mlc5cktoYUo5U3BCUVJDbFpvMzVtY2hLcElNVGFM?=
 =?utf-8?B?SHFUaFFGbmh6YWxWN2lubEgwKzB1KzZpQnV6NndwdWFuRWI5UTF5a2pDMnU5?=
 =?utf-8?B?a3FMdFpkczdpMVprN1llNnRjZDlPeURXTHdSQVpORUY5ZlJJY212bmgzd2ta?=
 =?utf-8?B?aGF0K0xaR1JSeGJyMktoSUJzaTVOUDBoSGJGWDJHZTlIUloyZjNSVmptY3ow?=
 =?utf-8?B?QVN2QnRqOHJySnRuaUFjMlZPRTlSdDJlbFJqMGdTbFVUN0gyOElrWVhpcHVy?=
 =?utf-8?B?eUEySXM4VWlXQkZpd09CWU9EemNteG1BNEM0amxST2I0ODRLUVNXUnROTExr?=
 =?utf-8?B?RjJwYW5PTXBrb0dJRHhTRURQYUNxazhRUjEvN3NMTTlmRU1XRUxlY3ozT0VB?=
 =?utf-8?B?YUxvYjBTc3FDMWMvMEFpVXlsMDB3Kyt5NzduWkJOelpBdG4vRVB2R2Vmb25R?=
 =?utf-8?B?TE9hc0dFeVRDRWo3UGY0UXhJaXljVmE2M1UxRDgvWEFJSE5OelFFRDRicjJD?=
 =?utf-8?B?OGRhRlBDMTY0KytsajJaT3A2dXFXdU9qZURzTC93alZQV0ZrbUpWMXdGcGp2?=
 =?utf-8?B?RUQ4UUljcVRuUno3RWErYWUrV3BIT0p5Qno3d05PQzVPY0FWS1h1Z3dtN3Vj?=
 =?utf-8?B?ejhacVNaQ3BIRHZNSi9nbi9wSWEveU1ua1UveU8reGhFaXBIblFnajd4MVNH?=
 =?utf-8?B?RVlSR0xRaHBHTCs2TzVHMkw3R01VUHhaVmpZYWxiUUI5RHV6OVhKK09sSk1Y?=
 =?utf-8?B?eDNqNWQyS1Y5cm11VmplV25VOWxtYWYxR0w1ajYzT3E3bElTZUJxMnFhcmZx?=
 =?utf-8?B?Ris4anRiMXRnUzdnVWhXb2tMdjRWMVNmVjdDZ1BBelFtN1ROYlZmRlY5dUtI?=
 =?utf-8?B?U08zVjd2M3FpczhVNHdtcDF5SUdFYzlvb08xNEFYb3VNbm13RG90MnRPSlVt?=
 =?utf-8?B?MkYrU2RMYmtnWGt4K2loUnhjOVNtWFRsQVNQWUZpT1UvNVRyVHloZnFsRDMv?=
 =?utf-8?B?WGVmQUd6cjNIVG5pK2NpNEllVndTSHZIK1EybmNlY3Zkbld1dWRUZ0M2c2w4?=
 =?utf-8?B?Z3BrZDZuTHR5WHpVaEp5ZDZ1MElMODR2RU5hcmpKdC9ZVWUrVHNzNmp1OFRC?=
 =?utf-8?B?S2dCL3BLUllkZ2NnbDZteDZOUHJYYk1YSDZTYy9DREk3cDNSRGR5NWNXdk90?=
 =?utf-8?B?VDJvT2ZBZGU5THJSM3VrZmlZVE0rRVdEdmdTQ2pleGxJUEI3ZW8va0JkVUdQ?=
 =?utf-8?B?ci85Z1VibnU5OU5rYk9EOXRiNUIzblZmT1RCVVZzZ0h4MlRFZkgvL1BhTzBZ?=
 =?utf-8?B?enlINjRRY3EwRlh1YTVVbVMyQTZaMHh2aDIwRUF3cVAzUTNCcmhaZ0tTeXoz?=
 =?utf-8?B?RU5tUjRycHdaTEZBa1hvQWVUQldQbEZHcGdDV1RuOFVjTEtkMjFqNHVOcUlq?=
 =?utf-8?B?ejZDcTNFZFNZUUVZSi9yQ2ZWbXZzMWhBQkdWNXZUc1cxY2NFTWxtc1ljSjN0?=
 =?utf-8?B?NW4wRkVXcE9tcms2OHdFS1lWRzFRWFJNM1FtaEF1MDZuMXVqNnJtUHF2SW52?=
 =?utf-8?B?dFBoVk1WK3hTY3k2b241endqTFJMWVhGQk85d0J4OTBKODcwcEhOTkFiMERp?=
 =?utf-8?B?R2Nqb0pnTTNSRng4czRhTE5GYkJIZ1JQSGFiU0x6Tk1zUUc0cm5mblp0dlBx?=
 =?utf-8?B?cmh4M0dKTUp6aFpZcmREay84Nzdza2JqRW5Wdi94NGQ4RHhDSThyaVZMaXlj?=
 =?utf-8?B?V0JXbTg1RW9IVUhkNTlvOEx3TkdYbFQ0UksydEM0MGRySzIrNVV4SjNFSkVu?=
 =?utf-8?B?RTJ1dk1jWkIrYUNjWUZoMWFWRDJWbXZJNnJ2RnFra2FlbHVmMk5mRklPOXpz?=
 =?utf-8?Q?97VKsbIkUdZzJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB7334.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OTE3RUoyN3UrMFpscHBNbzZJQjVpejluRnM1SWhXYUJSRzIrdThJYXVSZlQw?=
 =?utf-8?B?MDVMQkFZRThTTG8vSEpBZEVDdGM1WG9JK2YvRVhpeXNya1BydCsvOC9wMm13?=
 =?utf-8?B?QTVFdEw2Q2VaZ015eXR6NThRcXgxRnlqNFBxZFR2TndEUS81blVlU0l4UW1t?=
 =?utf-8?B?WktxdTl6Z3hWcjIxbXlRYmVRQzdveWVGK1l4UFlsUTNsSnNrQVFCajY2eUpC?=
 =?utf-8?B?ZGRkdzZnbE42bTdndExvVkJFTG9wc01ySlRZNXk4a2xoVDFkT0c5d0NrZkJo?=
 =?utf-8?B?U1VCa0F1Z2R2YjRCVWlrbDY3Y3VGZUF2Y3I1Vk9BRHdhOFlsRlgxUThKbnIy?=
 =?utf-8?B?cmJQZzRIZDNPR3QrNUd6SEtMQnNyZnUrK0U2Uzlybnp3M2tlWFl0RFIrNllo?=
 =?utf-8?B?dzVadElhREswdVF6Sml6dDVNK1lNbG1ZbFh2SzNHbUhOYmpCZXgwWFQ3dDlZ?=
 =?utf-8?B?a1VYVVZnZnpDUU9nQnlOTm5iVmhZSEdFd1lsMm10VndNSE53YzFobFVXenFW?=
 =?utf-8?B?VnZPNmxBemFUalRSdFpFRXJlVjVtaGdsSzNNTDR1WFdubzlPNkJXT1hZb21H?=
 =?utf-8?B?YzlYUzFpR0RsVzlzTUtRdlQyanhOMTI1ejZ2Z2NLOGpzU1pFdEtUM3UvRGpq?=
 =?utf-8?B?N1dZRUpkTVd3NEZtZGJiMnVNLzkrcGQxV0lZUktrTU96czg1L05yUkgrMDVK?=
 =?utf-8?B?TThXV0RSVGlFM00xWEpMd1BRQlA1UGMvaVl3WFBobVZBdTcxMGUzSGJrbzV5?=
 =?utf-8?B?cFNIQm9Ed281Q1o3THdiR2FLMjcweEJCRnJaOHhvaC9rWGtHbXZhWGdnaDZL?=
 =?utf-8?B?cTVjNkg0ZkluSWRObGtLZHF5ZUZlenlZN0N5eVR2SkVTcmlFVXJ2b2JrbUNM?=
 =?utf-8?B?YUorOGR5MDl0RWJwNGlIa0ZoazVwZ3pXT05wd3ZabWpOOHY5cXVNMHFIQ2ZI?=
 =?utf-8?B?NGh2T0xNOXdqWlFKeDQvUjhYZGxnR0Q5WlRPblJFS3UxWjkzMm1WSUN5bGtk?=
 =?utf-8?B?WVJoWXNKdXpzL2h0Q3hSTjhUWm9LVUhreFUrdHEreUZRaE9FU0pNbUtVN3Nv?=
 =?utf-8?B?bUtReDdFYXdtdHRyRlIxSlIwT29GbDB2VlVxamxpRjcrSVpqSUtudjlOY081?=
 =?utf-8?B?SDRKbnQ0RU4rK1BZL0E3YjdqQW5BbzlPL1FCVDNkNFN2YitKYmE1WnFYb3hS?=
 =?utf-8?B?V1RWYXExb040SDNsalY5dGpXbENSMkx1QlE4ME5SQ2V5UjVpbDZNWXE5WE9o?=
 =?utf-8?B?WHRVVmdGQkJEYlJFYzdrNi9UTW12SmRjd21ycE9renJ3NlNtWG1yamxsVTAz?=
 =?utf-8?B?YnZpWWNlUllib3lWTThJRS8zVWtmSkEwZkxRUUFocG9PazhzanBCaWVsa01n?=
 =?utf-8?B?THA4UkZjc2czR1g5QzA0UUxhTGJ6eS9zZmtYL2trVjBxbitneUU1aE9kVktW?=
 =?utf-8?B?U0ExemVXaXRUR2FYRTFXZ25PdUFDa1Nsa0lIN1NjbUtiUEhuV0ZCdDhiUisy?=
 =?utf-8?B?SXZuUXlLVXZTVTJKNGVXYUVDZUZYMWtjR0hUMGtCRGNPVUUzRmhucXhPTnFB?=
 =?utf-8?B?NklsTlhQUjBud01tRGtYRU56WTJkRVVFZjc2akJPc2U1dndybG8rYm1HNUtC?=
 =?utf-8?B?Y2RZcVNKeFhCdFRmWEVDUVRBdFY1N2diMVhzbWRJL3FtUFJGcjVpQ1pBR2hQ?=
 =?utf-8?B?RlpXbTc3aTdSa3ZqTWYveTZ6alNCTEVTUWpTa2lYR2IvWm1pZzVoc0dxMlVy?=
 =?utf-8?B?cEpuWWpqUUZlVGhFY1BsSU9Ed1lSSStzRW0xaml5MGVndjVDSW1YRlM1aVJJ?=
 =?utf-8?B?eWY2cjk0WklyTitibGlCYXhvL2FVdC9KQXdxYTQyS1VUL0M4QjRQWEQxSVRT?=
 =?utf-8?B?QllZOWJvTmRBaEF3dXVraHp5c0hvUERyR2FRZmJWZDcvM1gyQjVHck9BNkpN?=
 =?utf-8?B?Mzd0dSt6WFF2T3l3MlhUR3p4cG1JTjlOQW15dE5ocGxUS09UNVhnSW5jbHda?=
 =?utf-8?B?cE0xR3BLS0F4QThGVlJEczJsdGwyak5pdkVXRENtNFBPaEFtNlg3SlhyVXM2?=
 =?utf-8?B?SGZrNi82UUdURFVkSWdzenFFMTRQTDF2NHBzWjVrbkd1QkM5T0l0S1NjUHZU?=
 =?utf-8?Q?7yi2AKjMqNbyBnyBhmID2/ed/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f05db94-16d6-4dc7-bd0e-08dd76b221d5
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB7334.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 15:29:20.3507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QoyCrWl497IVomO/1y8ijnoFCCmQJh7N9yKeMCzBKmZmMbbIU5wMRsoNllyJJ44c5/2rurYKRuebF/KD1WlIbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7414


On 08/04/2025 14:51, Luca Fancellu wrote:
> Hi Ayan,
Hi Luca,
>
>> On 8 Apr 2025, at 14:32, Ayan Kumar Halder <ayankuma@amd.com> wrote:
>>
>> Hi Luca,
>>
>> On 07/04/2025 10:14, Luca Fancellu wrote:
>>> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>>>
>>>
>>> Implement the function setup_mpu that will logically track the MPU
>>> regions defined by hardware registers, start introducing data
>>> structures and functions to track the status from the C world.
>>>
>>> The xen_mpumap_mask bitmap is used to track which MPU region are
>>> enabled at runtime.
>>>
>>> This function is called from setup_mm() which full implementation
>>> will be provided in a later stage.
>>>
>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>> ---
>>>   xen/arch/arm/include/asm/arm64/mpu.h |  2 ++
>>>   xen/arch/arm/mpu/mm.c                | 49 +++++++++++++++++++++++++++-
>>>   2 files changed, 50 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
>>> index 7cf8d355a1af..ff5a957bf085 100644
>>> --- a/xen/arch/arm/include/asm/arm64/mpu.h
>>> +++ b/xen/arch/arm/include/asm/arm64/mpu.h
>>> @@ -6,6 +6,8 @@
>>>   #ifndef __ARM_ARM64_MPU_H__
>>>   #define __ARM_ARM64_MPU_H__
>>>
>>> +#define PRENR_MASK  GENMASK(31, 0)
>> This can be moved to xen/arch/arm/include/asm/mpu.h
> I can see from the Arm® Cortex®-R52 Processor TRM, r1p1, 3.3.46 Hyp MPU Region Enable Register,
> that HPRENR can have 16/20/24 enabled bits, the rest is RAZ.

Yes, I see that. However, if you see ARM DDI 0568A.c ID110520 ArmV8-R32 
supplement

E2.2.4 HPRENR

Provides direct access to the HPRLAR.EN bits for EL2 MPU regions 0 to 31.

AFAIU, the maximum number of EL2 MPU regions will always be 32. This 
doesnot seem to be configurable.

The R52 TRM isn't clear when it says "{no,16,20,24} EL2-controlled MPU 
regions implemented" as there is no register to set/check how many EL2 
MPU regions are implemented.

So, I suggest we can keep this in the common file for now.

- Ayan

>
> Because of that I’ve put that here, maybe you should implement it in the arm32 part since you have this
> difference from Arm64.
>
> Cheers,
> Luca
>

