Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C046799F297
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2024 18:22:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819282.1232568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0kIi-0003Mb-NX; Tue, 15 Oct 2024 16:21:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819282.1232568; Tue, 15 Oct 2024 16:21:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0kIi-0003Kg-Kb; Tue, 15 Oct 2024 16:21:36 +0000
Received: by outflank-mailman (input) for mailman id 819282;
 Tue, 15 Oct 2024 16:21:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vOwl=RL=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1t0kIh-0003KZ-Kf
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2024 16:21:35 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20609.outbound.protection.outlook.com
 [2a01:111:f403:200a::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8adc137c-8b11-11ef-a0be-8be0dac302b0;
 Tue, 15 Oct 2024 18:21:34 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by BL3PR12MB6596.namprd12.prod.outlook.com (2603:10b6:208:38f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Tue, 15 Oct
 2024 16:21:30 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%6]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 16:21:30 +0000
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
X-Inumbo-ID: 8adc137c-8b11-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gokRRTqRtgHS3/bgLm6JAAXtZmYJFQEKNwYtjdNucb3n0fISbj2UiyFYxKBdMPI5OUxuOzsSNciTk/bVIyP+8pUbu6BtTGMWtbi/MPLcQCLNpQtL8usV3pWz+PSUl8cG5KhiBUW4iRex6cRPPrhBuPQa+pXIF+fqSlQFaw0Kg2779nqeemaHRxYc5eRWAQRijujvhBqQQjeFFvyN0Q6cFylXk1HRNBiyPpjrcviWaWemAYSUs0puJ/iyGCiiSRHPo4zEUyVH7Xr4qsW8OeFPs7kYNGo27PbVXOIqvCoEume+Qt156seuSvynrorVVRei2YIucps9mC3v/Ca+t32Riw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQrQppJB6TTVI7vJx1MRJLTl6xSn9nFJXMYCbsX+00A=;
 b=q1cnmuRvM7/P9ZrEAKysNv4ZLNjIWmM6VzDGRfuYUJLRFOqRD5evmtgPr3TVTPwk4ETJBn/uxlVRL8tDOikfZPNhjsxxwV5zr6qVSUCVMBWOuq0+tmqb9qRngggm4lS3nV0f81usECM12f0jyf3ht/iS0GmNyXdCrL4L13iBL0wWrq5uZiZyHFTvHiDPAcm/xhBBe7MHBfLXXM1eG+B99GTE88s+DHZFqzQ+XGOxtbv8n1CmpOS4RpXB81BN0XVtpx0rMCY1eK1TZR4xj6u7z3jCeuXk/jJ4IiSC1zlCqwPArqC0oSrBLhbKDErikjrwpplLMT0V5Xuuy4O+UJSunQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQrQppJB6TTVI7vJx1MRJLTl6xSn9nFJXMYCbsX+00A=;
 b=bPzZjl4tJuUtZ/jFtoAqvgdaArzVhFdmFpalEd0OEd0WHimRUMqW8lArj0QftCZePK2W0udpvKxqLx40DQXa+5Nk8K67OgLGBiO7OIGrxBveUs4GAHARbAviYxBvl8j2Z/1huyWJhdJfZQyQfeAJ0Lu002N8nZb0udQQTQlbmnQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <7b8342e8-ce51-49bf-864f-90085a5a927e@amd.com>
Date: Tue, 15 Oct 2024 17:21:24 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] xen/arm: mpu: Introduce choice between MMU and MPU
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
 <20241010140351.309922-3-ayan.kumar.halder@amd.com>
 <9A01BB97-2CA9-491F-80EA-7B7D81B553AD@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <9A01BB97-2CA9-491F-80EA-7B7D81B553AD@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0017.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::8) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|BL3PR12MB6596:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e080124-5ffb-497f-7b5f-08dced356d14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WHhiWjVXYjhCdUx5cjFjNTVYKzBPUEtXYll6ZWhZaDZEUGE5dDg2amFqait0?=
 =?utf-8?B?QW95TEg0QkFSOWw4YTREc0pWbXozWElNKzkxVGdFbVU3Z2o0ZjNTUU10djhF?=
 =?utf-8?B?YkFBcUtjWG1FRkkzMkdLRTQ5ZU1uN21oNG9KL0dOSjhzSEtQZzZnVVVDMUFk?=
 =?utf-8?B?ZnBuWHlYNFYraHIxaTFSRzF2VjFRTnF2V3dHWXIwLytRNEVwVEhRT0VuWWlQ?=
 =?utf-8?B?Q21JNzVGeE00UDM4MHZNSjlIbzg1QUJvYlR5SXdBNTQ0K0xnVkRuMC9lNFQ2?=
 =?utf-8?B?bVlFeE11Z0d3djRaMjFnM3c5cEJjVzVnM3NEZGpiV1FkSHFrN2dRK1BjckFh?=
 =?utf-8?B?Nm1ESjBrL3NmUGF1S3JhRnN3N2ZmRWQxTGY1MU9qOTc1N2RsNlRaMEc5eXhv?=
 =?utf-8?B?Q3lTTC9PclROR3A3cmZjUWlRZi9CeHFnN05weUNOZ2FGTWtkQWF1TjB6VUlu?=
 =?utf-8?B?Q29DZlBQUy9vYytOamo1aXBYM3c2S09hODNiaTBXVk5hWHZXVjZ4QUl6Vy9F?=
 =?utf-8?B?Y1Z6TWNxS3ZYZ1dQeW11cEJHbDB3S1pDWHVOREpQb2RoQnhFVjZFNFRiQTNs?=
 =?utf-8?B?b1VQb0oySjBBdlU1djBPTUoyVFdkbU9sK1hCSFFPeFhxYzdQL3dMZkZJemhD?=
 =?utf-8?B?cnhzc1laT1lUeCtHbVlGNjNRWC9kMXBpbGZYdE1Lc1loUkhrSVZZMGpXMCt2?=
 =?utf-8?B?NWh3STBPRVI1bTdvYWxsbkZ2RHgzZEd4emxlWHRROHBpR1VnVUNLNkdxbUx0?=
 =?utf-8?B?UEo4bVBaTkU4YWZYOHBZUTdJdW1DQVVvamNQNXFCUlpIcnk3WWRiOGtVaC9i?=
 =?utf-8?B?SFlzZjlYbDkzeFBTemZOVGorWkR5Y1VoVmdxNUFwbEdaYThXZUtQcCtMOTYw?=
 =?utf-8?B?UEI3cmxMcEliNmZrbGZNNnVMVjZEdFNEUUZtRElhMXE0eGlJVkVHdDZqeGdp?=
 =?utf-8?B?TTZ3MUVQWGV6YTVSYjlRMWFzVkd6bUxad0hUdzl5b0c3TC9SZkZCRDJaUlJO?=
 =?utf-8?B?ZTFPbE5XQUFCeE9SaENUN3lqbm1nMWpsTFN6NHp5Tyt2UTFZcW5hcXNCWG40?=
 =?utf-8?B?MUU4Mkx4L2p2d3JPWUdWVStNNVJVZWd1V09UOUJnVUVXM3VVbTQzamRkR0FC?=
 =?utf-8?B?cjhBaTNpZjU5QWh1YjJyU3VkUkhJdXNiMWM1WXRSaWNXWHFPeHpiSmt6QW53?=
 =?utf-8?B?Rm5kZzNMT0hZc3BJSVNURHBnZ3ZOT3pZVkwvbUFER3lTV2RkVmwyYjdFNFhS?=
 =?utf-8?B?VzRRcm9XdGcvS1FxdmYwSVpuaUJIMVkyR05udmZkMVEzVy9YanpodWxwcHdk?=
 =?utf-8?B?T1Y0UTNLa3RMYmpUNzBpOG5mUzdxa0FxY0dncllDTFZyNnNCa0N2Sk9TTjVj?=
 =?utf-8?B?K0ZZb29peHpKaFdndGpsbFlneVBoWm9vK3dHWVpIWU9taGY1VDNJMzhVTFpE?=
 =?utf-8?B?Nkk5ZDh4SmYrSTB5NTlUMkZZV3p3b2RROUMxTHpHbndSSEdxa3F1Y05Xbk5N?=
 =?utf-8?B?MzE0VnpKTGVWWlRNUmZaUUpta2tmbWlxQ3JNdmRmd2EwWXZXdjZYMHREeHRE?=
 =?utf-8?B?My9WZEt4SDdTM2RVK0ZqS1U0bDlyb2pKUVQ5SG5Tb2hIWTNQbk0vSGZsakYy?=
 =?utf-8?B?U1Z6N1B4cEpwRDNjMnMyOVd6SnBuMVNzN2hrMnRXbEZ4VFUzTk9Xcitpc3N6?=
 =?utf-8?B?YVNIQzNKZEMrWlRsZUtOeEg5OFJ6c1hFT2xTa0JtKzNuUUxTbzUvWWp3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVcxaU1zZWZEUG9QNnhpNHFXd2s3TitIdTZSbXJIb0gzRjZ0MnhtQzJCclU3?=
 =?utf-8?B?UU1iNno2cElnTFVWbVVZanpKek9jVEN1NXZoTEZnbTZpcnZEU3JUckdRVy9j?=
 =?utf-8?B?T3hwYUJWOTRaSkJ5SGkrT3NZdEkvRTc5djIxTU9WeldLT21kNWh5RElPS1ls?=
 =?utf-8?B?OVlud21HQnR3RzBVc1d6RDVNcmlUMHA2QmtyUFphR0VNU2ZYUm56MjZHTVNx?=
 =?utf-8?B?UW5wYnZzQkN1anNDd1hBVlpsa3ZJVEFZdmtKWHh6YmhxUzlXaWEzZGVHaUxO?=
 =?utf-8?B?ZUovUldDcTE4RWZiTUx1Sm1GZGUwTVBUTEk4cnBRZUpSRGpYVHpyTTlsQnVE?=
 =?utf-8?B?Qm1aS0ZsYTFJV3FPeWNrRnRhbDJ3ajNmdXkrdlNmdlo0dmM0SlM5U3BucmNj?=
 =?utf-8?B?OWN5eVlkMmEyYktuTUtBMHZPcEFjNGRKWDdTNFBod1lXSkpGMVJ4YXBBcUpu?=
 =?utf-8?B?L0RhOGVwajhkdFQvYWtOUzlCcTU4TCtlQ25UVkRieFhOcm9UOVpXZ1JsU2p3?=
 =?utf-8?B?RzRvaERHemdaTmJoK2tXNTBrRzJwMTQ3UVJVanJOUlFBdHZjZ3lxMWowbGJF?=
 =?utf-8?B?LzdnVVprc0xqUW9SUXBJcmgraGppbC9DL0hyUXRCcm5Ta1pKYUNIbmtyL1Ro?=
 =?utf-8?B?WDk3Z0UwOXJ1ZnBIU2U2Q1FGYTFUelJsdkJGc0dTdER4K0JXclhKUDlSVUYy?=
 =?utf-8?B?Um5aQWQ3RmVVeFhzRXBGZmZLTFI0VEVDZGZxWnl0eFpiNjVaNVozdUpkQ2JW?=
 =?utf-8?B?MXNBWHBwRDQ0Z3JSbFFIVnNhZkZFSUh6RFNxbDNMcDNFNlVSZmdySXRqOEYy?=
 =?utf-8?B?OXZueVdiS3k2ZHRvUWR5L0tUc0lUQktJdHU4dVlaQTRpV2QreHhpTkVrRGYw?=
 =?utf-8?B?OXJSMWtLZWJMSDVxOWJwUWkxTTQ2N0pLOVh2aTB3d2tUSCtIbnFsSUtLTDRS?=
 =?utf-8?B?M1dMT2k1aSsxenhtcDBuakJYMThUbjVUMGdNdnN1WDIvRVpnSC9TSWVKY3hk?=
 =?utf-8?B?cGM0NWsrSHkveHlhNjM2NjRGTVk1cDJXRHRuMTZISlc4dkd5OEdHTFNmaVo4?=
 =?utf-8?B?dFd1OU1OVWJtQldtWmdER1BFbFlhN1pUZDVwZ1I4a3VscXVOakFzaTNyeDFZ?=
 =?utf-8?B?aG1JZUR4M2FKSVoxVEM3SE5USkpDTlpRNnBqRE9SQkpkeWtzSnUveDZSbCs0?=
 =?utf-8?B?WGNtM2k5QVRXU01GT1BrWnZqY2xrbG1SWnVqcFhxdFovVVNkdVpLWVhNVmp3?=
 =?utf-8?B?Ujg2c1AySGpFb0pCOHV3R1RmUnFnYUJScks2TmhQL0ZDSW16bW1YMUd1ZW5q?=
 =?utf-8?B?eVNwb00xai96ak1MUE9aUlkvdHZmMHVzbE0wTjdBRlpsZlZJOXU1UklTeTl4?=
 =?utf-8?B?MmU3UVdBY3RVcUpVMk9wWDFrenpXUzRnM3k2UXcxMWlBL2x3dUF1WTVvWkY1?=
 =?utf-8?B?bGZwRXpzYnV0OENWQ1dWNlg0VWdoM1hJMk9OQzcyRjAvVXZQUmNjNWtkUVlG?=
 =?utf-8?B?S21Idk1XWlBObVhhRkdLK3h2NStWK1lKdGIvOVptZlhKNDNObUVicnY0QndV?=
 =?utf-8?B?ckRTNjFmditUbWlDczA4MzUvSmJGZ2MwL25SNDFUQWpZQm1FMDEyWUxFUmdX?=
 =?utf-8?B?TkM5MlFiSG96MEtrNGdwTGhsZkViVHljVGhYZHY4L213L3BrUzNHbEo2RlVU?=
 =?utf-8?B?RjF6ZHNzSFNrRUNHNDBva2lHOTQzTmRrdEN1N01KNWNmSDBGRVFyWjE5Y1dy?=
 =?utf-8?B?WitHaVgzblVFaDJvc1dabFYrOHFMNlNMUUhVU0VuUFpjRDdxMWtXTFlyS0FK?=
 =?utf-8?B?dURRZzdqV1pxYlhsWFJvOG5DSVpQMFJ3TDVETktTWGtlWThlLzZoNVB1a0Rv?=
 =?utf-8?B?eG9wM0lSNmpBbjFlWW9NdXRFa1k1RWFVRlVqS2Q3NFExQ05Tak0rM3E0cVAv?=
 =?utf-8?B?MTJmNkh1MEVwVG5xVmt5VVE2MzBmaWZTTS9CYUJhNUlxU0paU0tsMVhTcEpR?=
 =?utf-8?B?SUxJT0VGdVA3WnlyZXVyMUVrakgzN0ZDQ0tCRElQZUNYYU50RnFuellKdnM5?=
 =?utf-8?B?NzE4SUR2Vm9wRmRoK2RwRnlLQUJBcWVUN2czNGRKbzFqak1LSHBPK3QwcjRi?=
 =?utf-8?Q?U8STRByUNpjXfVj9JgQgiqqze?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e080124-5ffb-497f-7b5f-08dced356d14
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 16:21:30.1634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YybdITk/EVkH+Lw/onDh/Y7LfBPwM4kE3jQBpx/LDVSVCEaNRcL2FMSk5U819JE7OIu5T3vJyYYAtaK8sxSAww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6596


On 14/10/2024 19:43, Luca Fancellu wrote:
> Hi Ayan,
Hi Luca,
>
>> On 10 Oct 2024, at 15:03, Ayan Kumar Halder <ayan.kumar.halder@amd.com> wrote:
>>
>> There are features in the forthcoming patches which are dependent on
>> MPU. For eg fixed start address.
>> Also, some of the Xen features (eg STATIC_MEMORY) will be selected
>> by the MPU configuration.
>>
>> Thus, this patch introduces a choice between MMU and MPU for the type
>> of memory management system. By default, MMU is selected.
>> MPU is now gated by UNSUPPORTED.
>>
>> Update SUPPORT.md to state that the support for MPU is experimental.
> Maybe I’m wrong, but shouldn’t we add this only when MPU is supported?
> In this case we are just having the Kconfig setting.

Actually we need this config option for the subsequent patches. I am 
assuming 'UNSUPPORTED' also means work in progress or partially supported.

- Ayan


