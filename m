Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31641A60AA0
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 08:59:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.913874.1319733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tszwf-00033q-Ok; Fri, 14 Mar 2025 07:59:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 913874.1319733; Fri, 14 Mar 2025 07:59:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tszwf-00030g-LP; Fri, 14 Mar 2025 07:59:05 +0000
Received: by outflank-mailman (input) for mailman id 913874;
 Fri, 14 Mar 2025 07:59:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FaPW=WB=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tszwe-00030a-0C
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 07:59:04 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20604.outbound.protection.outlook.com
 [2a01:111:f403:2415::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b350188-00aa-11f0-9898-31a8f345e629;
 Fri, 14 Mar 2025 08:58:52 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by SA5PPFF1E6547B5.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8ea) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.28; Fri, 14 Mar
 2025 07:58:51 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8534.027; Fri, 14 Mar 2025
 07:58:50 +0000
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
X-Inumbo-ID: 2b350188-00aa-11f0-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LPeBYvaYC4gtd3DmE8ntBQeLx8N0yofa/Q9duf5Esr/2PO7HbMcPVu/5RkI2XZbaqyneWNczqqIDl2O7A4EGpCviiAkFP1NvvIvRLO6unOraSmm6Lye93MGMN2K0f3cdJ08jzKwsqUbdVRz2nUUdToVJKu/22JyT9zzG3prkbadljetSF9spCf31UgnLcL2DCDHjRwdDJdCsWwqSDF0kd6rMnaPz1KG9q1PL2P6Hqd6V+s583eGsG4B3Koz1LO1i/Vz9/0RKjs8U04ZZk+8jhjpaZ1Mb7DluBe5egi5bCR73a5ssnjEYstEHqOp6GXG95KEKSo4XgBuRoIuqDWI48g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3rmif6ypuYJZDsO6gxk+Z1wSAoebwzqCNmlTkLE0sIE=;
 b=xHyzhndxzo8TSSOV8QX7Ju8dcip5IGgsDhOk9q6NgueG91CA/QbOnoCy0KeqqPxTwQ5cC94kDQPI3U7HLS9fVfeXn3ybN6vJW8p8MtNnW99D0RWnWYsc3FW8AFtwtVWCilEhG6zqGbajoJVm+XaVrM8k+XjQ44i0g+T+0kho/8IqJEfK6a5Wdl7vfzj5Upy4gt+uDRH4UtYAXBlrR9UNvsFpxxLkgyf74Efa+dyxbtpC3FOvR2Ox8X3flRC40zDlEct1mUieoH4FMAMSll50GVmWNdLlPg7j4XaR5SIW6ulxtiVlSyIqXJG8jwEfi4dcOSqL2od5eUaCoqVQTz4+Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3rmif6ypuYJZDsO6gxk+Z1wSAoebwzqCNmlTkLE0sIE=;
 b=su2O+GTIgl1vv5pw2vFPc7CzgE3tU8LxtBL/oo7mTwYdZwp8S8Qj4lKy4GBf8rWLql+QglpH+xBPLQ/+3Eq0C2bHKEHbjA6mTFwIRa5k5/Jbf1XCPBqUezWM+0vCxKEbZSg3f8gr0BRSWo0nP3JXOfNjPoU2QuzSBKenmmsIyNU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <17d30bf5-90bc-408b-b39f-c1d41c73e68e@amd.com>
Date: Fri, 14 Mar 2025 08:58:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] xen/arm: introduce Kconfig HAS_PAGING_MEMPOOL
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20250312135258.1815706-1-luca.fancellu@arm.com>
 <20250312135258.1815706-10-luca.fancellu@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250312135258.1815706-10-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0019.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::6) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|SA5PPFF1E6547B5:EE_
X-MS-Office365-Filtering-Correlation-Id: e13c2c9b-a6d9-4431-17b7-08dd62ce0ecd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NVBmZUsvQnc5RjhWWiswb3BXeWxmYmJ0Ly84Z2phclFLbk5KTTZOWmNmMk0v?=
 =?utf-8?B?TFgrNWJWcmgzc0xkdndvZ1NqdVg0dGJVaWs2WGZVeFdwMUVOcGoyT2QvaUQ2?=
 =?utf-8?B?Q3JvMnNDd1Y2VmRjOW1BL2o1UERESXAyY1FsTndFYlRLT0xGTjdDOWdZT2N2?=
 =?utf-8?B?SkF5SUJGdlBJZHZ0QkhqSnVCamVJNGxWaVZOcVVEaUlKK2VVNjVlbHpyVm9q?=
 =?utf-8?B?WmhNK0VwSWdwUisvbUFrc2NwZlgyTHlGdkZXNS9WaFV3L1laMVBIU1BJQVZK?=
 =?utf-8?B?YVp1TFp3RlpjRVhIVFhUSndkWlBycTJaM2luZXhINVdjRSs3Sit0RlJ6VFhX?=
 =?utf-8?B?R2ZuVlZmeWJESktWZldUc2VvNlNUZE0zd1RwUi9DZUlnVHdmM3p1dDN3N0Vq?=
 =?utf-8?B?bGI0K3dyQmlVNEcvYjY1dWhlT3VnenBOdXBWRWkxaFIrNDNheEpsakM1MW40?=
 =?utf-8?B?dmszRGNTa1Bhamp4Qis1YzRqYkpBRk14QjljZ1NQNjFLZ3owcDZYRHAzTlp3?=
 =?utf-8?B?aEZoYWJHWU5uOW1sVG5JcVJJM3FyS0dJT2xyVjlzMmFtRWRsR3JkN0s3UkVY?=
 =?utf-8?B?QitHRFZ3bFJJdjBIK2hGK2FrZ2UvZ3dDc3lqZDBVQSttdU9iVS9WdXJwanlX?=
 =?utf-8?B?aFpBcEVjTy9GNnJoRm8xcXNXME1tY0JFODR2RGxwNHhUZHZYOElYbjF3VmI4?=
 =?utf-8?B?QXBvaVVDWm4xajNhN1JBaitROW5NV0E0OCt3TTJncGVwalluSEJQb28zTkZ1?=
 =?utf-8?B?TnVXL3VhTUN0OGN4RHY0UWN4QUw2TmxOaWI5MS9RQmJNT3lWcVYxZHZITE9u?=
 =?utf-8?B?RFRSQ2JqNnh6MURUTVJWd0hoQ2Vtd2JXOEIrVkc1UE9tSUtjM3hySEdXNlhs?=
 =?utf-8?B?UHlSRHNGTGZ4eC85ZWE3a29yeU1ack83OFlQS005azRuakh2L2J0aDF1T0tu?=
 =?utf-8?B?Z2xZcWJWUThIYzlMK2RMeEJTbWlKaEZhMDU5M3pnditXdlpNOHlTV2Zob2dZ?=
 =?utf-8?B?dlhvU1poSWZKa1NObXI4UnRKZ2VIWjNEb280MnZBS2VDbXVlUUdocUJCMEdm?=
 =?utf-8?B?cmNJLytqR2pUK29tT1poNFBnUGkraloveEd4aHdyb056RnFDaVNwR1JZZTc2?=
 =?utf-8?B?Szl5Q24vNTRrT2lyS2dWYit5dUN1c01SeVhmcUFoUDlYbFhWRmJQdnRGcVhN?=
 =?utf-8?B?RVg3MUFJbFk5Mmxld0hRNmV6RVhmZFZ0TnZIMjdCYjhPeG5zb3BYbjdwejg0?=
 =?utf-8?B?ZzZOTWJFWTQxT3J5WSs0YndIN2E1ZW5teWlWY1poaS9qdy9WRlhPUk5OaGkr?=
 =?utf-8?B?WDREYXZsZnJpN2ZGNXdTbXBGeDJJRHFLM0FlL1dGMU16ejdTV2hnWml6SFdL?=
 =?utf-8?B?OXQyYXFOOElkZ29JaTIzeDRpM1hHb1V5YTFYeEFVY1NEZ2FQTkdzVEVsZlFS?=
 =?utf-8?B?VmpZcGZjU3VyTk5WRHNJSmlKb3J5blNtQWpkYmtKMUFZWFkwcisyVFVrMkpw?=
 =?utf-8?B?V05JMXAxTUd5bjlkUHhMSEpxalNlWmE5djFNZHMyd09BWHd6TXVTSUVJaVdJ?=
 =?utf-8?B?NjY0OS84QkhjKzRkaGtpQnlrTXNhbkx4emlUMStheU9IUEhDMTBwaFJBUjBL?=
 =?utf-8?B?Rm1INlpCQzZFNXZZMzVTTG9MNGwva1QzT3BndkV4UkxQUVJBOW9MWENZaHlS?=
 =?utf-8?B?Q053eEgvb3hYTzZsOW1zbFJXU0ZvOTRUUDJpdEduZm5rbWZrUG8rQnpnZVJT?=
 =?utf-8?B?WU0rQkk1ZnI0ZnZHV21Nb1BHUlI2M1NEc0xvZFB2Q3JTNE14OTlQVWk1eGpv?=
 =?utf-8?B?RDM4VzBCSjMwZ2pjS1VEbEpOVlBYUnIwd09PcVZuTkdMdkZVSlIxZ1czZHNR?=
 =?utf-8?Q?Wqd0P30lzkArr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UnVJWjZBR0tIamZyQXhsSTM1RVhBbzkydm9FRjRtN1JUNEs4RXhEUVpZdFJp?=
 =?utf-8?B?K0RZRWF4ZjlXMFpxWEdCdzVBaGtlajhwRUNHemk4R0ZUMGlFTDhxR2xlVjVW?=
 =?utf-8?B?eU4wODBxZS9NRlhKWjdHNkZBRFdySzYxc3pQU1ZkZUozVUdhWGxaNEJQMkZY?=
 =?utf-8?B?VEhWSVVmMUQ1SUJNU3E5bi8yU2srZmpNdmsyak5DbU9OdWc4bWhzSUdSOXVz?=
 =?utf-8?B?eUZDbGdZa3JnY0JBcTU2UFlIdGcxdCtib2tUYVVkOEN6U1RteUVwNkRUdzRF?=
 =?utf-8?B?RWxLS2Y1eUpyUmFRclJRNGNlWmRQSWtNWVF5aXRCdVg1VnQ3SkhwZHk1OE9m?=
 =?utf-8?B?UmtTdDR5TjE0cFh1M0MrTy9pYU5vN0xYdGJOdzRaRU82OEREZTlKYTdtejVz?=
 =?utf-8?B?cWJNVXBGNE5pQW9IM1FKSzduT0xjSlNzZXIwSkNrQ2IycGFtVjBqMGJrdkRx?=
 =?utf-8?B?aWplUTBXUVc2MDU4RFNIRnZvK1RlWndDUnpWNmpIOXlYOXhaWitJUkQxaFBx?=
 =?utf-8?B?emlEYldyTUlmMzFhcitRWS8vRE5aL0RHdlIzTWRJK2VBaEE5UDN1RnhTZmF4?=
 =?utf-8?B?eDhyWVhFK045WE50U3JZRFp6REdCZDdQSGgwbHZza1NrUlAzcWFRN1VSTWwx?=
 =?utf-8?B?dXcwMFNKRFZFMEorMmROZWovMS9CbjNFK0RxdFpYaDdkeVZMaUdxNVRXaEwz?=
 =?utf-8?B?QXk3U2hEUFFpb2M1YXpNd1Zqc2F2V25zQjRpNGZPeEYwT29WbE5FQ1Q5MEpN?=
 =?utf-8?B?OXhKMzlPOWVocHU1U1B0ZmliUmRLTXFDSHltMzgzeE9KVm1uNHBYMjlrZ01i?=
 =?utf-8?B?NHVmbHhOTEs2WEs0Y3EwQkxIMDRPdHlCRHZ2Q1piWlJvSkhnV0MwcUF5SmpU?=
 =?utf-8?B?THd6NUR0QmZTbTlkc1VXbng2NUs0QXhTcTJObm5kVXpHU0pWYjhyQURBZXpu?=
 =?utf-8?B?VEJoMW9sZUxLTVRrb2ttVkJ1aDhRcVdlbm9QbXBzNlphOE9wMFNldjNDSExH?=
 =?utf-8?B?ZDZpZmhHTnorNTd3ZnFwZGZ3bDNCRXJUZ0ZSS29WM2VYd2dEN1lOVndudExz?=
 =?utf-8?B?VnNGVWJUZXlMS0lpK0dkcmpnS0dJOEtRSTZLYzVkVzZoMStReVIyQ2hvelNa?=
 =?utf-8?B?TFl2djVvQzZoT2RaQjZkSE9LT0NyT2wwUm1vSHh2K2lPdmFVenRMWWpEZnF4?=
 =?utf-8?B?cjJyL1BmT2EwRlB1WktlK28yK1AwQ1Z3V1pYdmFFU2c4NzJ2K1JhamNwN211?=
 =?utf-8?B?R2N2b295TGNuckZPY1k5RlhRTUtmZFBYV2VyT0hHaDVFUmxvWUxkY1Ewdlc5?=
 =?utf-8?B?UVcrUlA0bytDd1RZMEUwQVlINW5SQjhkUDl2OU0rcU9nTUljOEZDbGR4MTZ0?=
 =?utf-8?B?NTR6WDROMXpwU3gzNDlXRlBBUkxPb2xDdlp4bmdQYXFLc3RDZlV4WmlWRFdE?=
 =?utf-8?B?UldHa3hMZjVtMm1OSzZmeWFhRy9ZaXVXa0JGNlNDTnU1a2lRMDNUakF0bzJi?=
 =?utf-8?B?dnFtOWxFTWhmQ0JKM2dlOTdIbDdobnhsSFI0ZlNkaUNYU05DeXAyUU4yRDdF?=
 =?utf-8?B?bTVHQzgralJLOHFRUytjbG5PSEpwb0dKangwU2RxeWduZXVpdmN5WHM3QjJk?=
 =?utf-8?B?Q1BiV1F3T1JqbWhma0U2cXpkTk1IcW1kMWdQWWlnVjZDY3J0NWFncU0wRnBl?=
 =?utf-8?B?V3l6Sk1LazZkTTJySlM5cW90aENzSUpBc2NsSDl6TVUwMzFUTUVlVFlGM2Zz?=
 =?utf-8?B?WUl6QjZUbHpyQWRpRFlTbzg5RWw4MUhwMm9QSUJab09NdGkzeEJoRDhKOWt4?=
 =?utf-8?B?K3BHOWJ0UHFyMkZxQ1MxRkllZGZvOGYvMUhYMjRvZWloNzFMSi9TdTUzMFRB?=
 =?utf-8?B?NlYyR09NWGZiWWEzUmg3UUxqbGcraGpQTi9Ka05LZlY1UVhTc1QzcXFmeVB0?=
 =?utf-8?B?MGZsemc4a20rdllaek9va2xWK3NtcUJkL3ZDS2E1RzBiWjVobmczajQ0YWNS?=
 =?utf-8?B?R3pvTy9vbzQrdmx1WmF4Wld0K3FBME5GdXZ2TDRRa2JYVVdhaVV3TnJNVk9r?=
 =?utf-8?B?Z3RyK054M1FZd1RHZ1h1blhlaVNNQmJYOVRNSW1VY0FpbHZiZmlpN3VteVNN?=
 =?utf-8?Q?TH92oPTJ5OAikFp0tViZvKyfD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e13c2c9b-a6d9-4431-17b7-08dd62ce0ecd
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 07:58:50.9559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v1P9SS3dTWtRgQFoJ1NHGLwwnqQeVs5c50SbhVyzariK/zTNpdvdTSdOTqcVmp9L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFF1E6547B5



On 12/03/2025 14:52, Luca Fancellu wrote:
> 
> 
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> ARM MPU system doesn't need to use paging memory pool, as MPU memory
> mapping table at most takes only one 4KB page, which is enough to
NIT: I always wonder what "mapping" means in MPU world. Is this common to use
this word even though there's no mapping being done? I'd expect to see e.g.
protection table or similar.

> manage the maximum 255 MPU memory regions, for all EL2 stage 1
> translation and EL1 stage 2 translation.
> 
> Introduce HAS_PAGING_MEMPOOL Kconfig symbol for Arm, selected for MMU
> systems.
I don't think this should be Arm symbol. After all, we have common helpers like
arch_get_paging_mempool_size(), so I'd naturally expect this symbol to be in the
common Kconfig.

> 
> Wrap code accessing the 'struct paging_domain' paging member with
> the new Kconfig, introduce arch_{get,set}_paging_mempool_size
> implementation for MPU system, provide stubs for p2m_teardown and
> p2m_teardown_allocation because they will not be used for MPU systems,
> remove 'struct paging_domain' from Arm 'struct arch_domain' when the
> field is not required.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>  xen/arch/arm/Kconfig              |  4 ++++
>  xen/arch/arm/dom0less-build.c     |  2 ++
>  xen/arch/arm/include/asm/domain.h |  2 ++
>  xen/arch/arm/mpu/Makefile         |  1 +
>  xen/arch/arm/mpu/p2m.c            | 36 +++++++++++++++++++++++++++++++
>  5 files changed, 45 insertions(+)
>  create mode 100644 xen/arch/arm/mpu/p2m.c
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 5ac6ec0212d2..89c099ff464b 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -76,6 +76,7 @@ choice
>  config MMU
>         bool "MMU"
>         select HAS_LLC_COLORING if !NUMA && ARM_64
> +       select HAS_PAGING_MEMPOOL
>         select HAS_PMAP
>         select HAS_VMAP
>         select HAS_PASSTHROUGH
> @@ -158,6 +159,9 @@ config VGICV2
>  config HVM
>          def_bool y
> 
> +config HAS_PAGING_MEMPOOL
> +       bool
See above

> +
>  config NEW_VGIC
>         bool "Use new VGIC implementation"
>         select GICV2
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index 31f31c38da3f..feaba576198b 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -865,11 +865,13 @@ static int __init construct_domU(struct domain *d,
>                  p2m_mem_mb << (20 - PAGE_SHIFT) :
>                  domain_p2m_pages(mem, d->max_vcpus);
> 
> +#ifdef CONFIG_HAS_PAGING_MEMPOOL
>      spin_lock(&d->arch.paging.lock);
>      rc = p2m_set_allocation(d, p2m_pages, NULL);
>      spin_unlock(&d->arch.paging.lock);
>      if ( rc != 0 )
>          return rc;
> +#endif
That's does not look right. If we don't have P2M pool for MPU domains, then
xen,domain-p2m-mem-mb dom0less parameter does not make sense as well as its
handling above that you did not protect.

> 
>      printk("*** LOADING DOMU cpus=%u memory=%#"PRIx64"KB ***\n",
>             d->max_vcpus, mem);
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> index 50b6a4b00982..fadec7d8fa9e 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -75,7 +75,9 @@ struct arch_domain
> 
>      struct hvm_domain hvm;
> 
> +#ifdef CONFIG_HAS_PAGING_MEMPOOL
>      struct paging_domain paging;
> +#endif
> 
>      struct vmmio vmmio;
> 
> diff --git a/xen/arch/arm/mpu/Makefile b/xen/arch/arm/mpu/Makefile
> index 04df0b2ee760..f1417cd1b9db 100644
> --- a/xen/arch/arm/mpu/Makefile
> +++ b/xen/arch/arm/mpu/Makefile
> @@ -1,2 +1,3 @@
>  obj-y += mm.o
> +obj-y += p2m.o
>  obj-y += setup.init.o
> diff --git a/xen/arch/arm/mpu/p2m.c b/xen/arch/arm/mpu/p2m.c
> new file mode 100644
> index 000000000000..7525d9b00bcb
> --- /dev/null
> +++ b/xen/arch/arm/mpu/p2m.c
> @@ -0,0 +1,36 @@
> +
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/domain.h>
> +#include <asm/p2m.h>
Why do we need to include p2m.h at this stage?

> +
> +/* Not used on MPU system */
> +int p2m_teardown(struct domain *d)
> +{
> +    return 0;
> +}
> +
> +/* Not used on MPU system */
> +int p2m_teardown_allocation(struct domain *d)
> +{
> +    return 0;
> +}
What's the reason for adding e.g. p2m_teardown() but not p2m_final_teardown() in
this patch? I initially thought that in the next patch other functions will be
added that require implementation in the future (i.e. stubs) but then I saw
relinquish_p2m_mapping() which returns 0 same as these 2 functions.

> +
> +int arch_get_paging_mempool_size(struct domain *d, uint64_t *size)
> +{
> +    return -EOPNOTSUPP;
> +}
> +
> +int arch_set_paging_mempool_size(struct domain *d, uint64_t size)
> +{
> +    return -EOPNOTSUPP;
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> --
> 2.34.1
> 

~Michal


