Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B6C6696F1
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 13:28:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477274.739908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGJA3-0000rR-9s; Fri, 13 Jan 2023 12:27:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477274.739908; Fri, 13 Jan 2023 12:27:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGJA3-0000or-56; Fri, 13 Jan 2023 12:27:55 +0000
Received: by outflank-mailman (input) for mailman id 477274;
 Fri, 13 Jan 2023 12:27:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xRhM=5K=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pGJA1-0000oh-Im
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 12:27:53 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2058.outbound.protection.outlook.com [40.107.237.58])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0eedc29-933d-11ed-b8d0-410ff93cb8f0;
 Fri, 13 Jan 2023 13:27:50 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by CY8PR12MB8196.namprd12.prod.outlook.com (2603:10b6:930:78::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Fri, 13 Jan
 2023 12:27:48 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::a3a7:87d9:60f1:7eb1]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::a3a7:87d9:60f1:7eb1%4]) with mapi id 15.20.5986.018; Fri, 13 Jan 2023
 12:27:47 +0000
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
X-Inumbo-ID: b0eedc29-933d-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dpFxG4jCr/SKmLuflJBR9stC570YowG1ZQoxv0txNJK2hbBgObxxFQMetCxkx0s8eFmhut1ojz0yTjFLDkPHdGGdrA8BUKLB/R2TiMt8M1hMwxNoePrM7OeI6V85tg6/S8SWJ6BPhsIa1LltGu/5B6GUBniUYvZ8g+n59UbNFhRGIB92tcn1oWf0oBmx32tBYh6aEWU5YeoofZ6jmw1F8vTb2CwL/EyaO00zernFQL363AlANuY9LnJEE8u6/kz0uyDe/FJbMgmiuyk++8+2BGRCQtdz2BolmelBDs2ix5okV79a8mEV5dz/ZEnOb3fD/34ytp2N5c/LYEcBIjbrKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rsqW6VEFQgcSxHB4O0hC9OpgzP3TyDZ46hREDKuHIuY=;
 b=WWf4fouXmaovKcSuDABGWj/BcGu5f4W29d37vSf+7ZQcOTsovzqOLzH8hRlOkGjOs8vjDozDHaiTI1G+kAhPUJMJ46bNz4ixx81YDrDKPNUtlc0LPzV/Uhs03xfhj0ddQLvikWDZBE9FwOkwCMbJWTcvj9f/Iqg0PlNBucVq1+DKwXma7GrzjwmA9uGUrWYtNUakNpPGF2Ct9AlYJXcvvxP736kh5PcLTQqqHBU1ZjJxrpZouGdrEco41+sjvaPqaIeqzDyHMyk1ThsSAuanfBbA9mvKa5zmUFHQdgZc1e3mjhjgfjW9iYsLzKkWcAF/cOq9LtpwZ9dUnJQbKVgjjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rsqW6VEFQgcSxHB4O0hC9OpgzP3TyDZ46hREDKuHIuY=;
 b=Zx/X6WnOYVrIN54sYNo9cd6WBoOlxlT0wMjaAqqOkL+nfbDuetJxxsnidmFvIuvGmX3XujvlmCAyjozxlIfD8X1wu0BPM/EajY5nW0XbqQkxtgrwgvgSZDe3/NvcjoW5cuCtvzDePzvwypMkgoaWHsfKcnK489QTq6ODa48K4c8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <52139018-abfe-4083-c955-70d832aa3d1c@amd.com>
Date: Fri, 13 Jan 2023 12:27:41 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [XEN v4] xen/arm: Probe the load/entry point address of an uImage
 correctly
To: Dmytro Firsov <Dmytro_Firsov@epam.com>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>, Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "stefano.stabellini@amd.com" <stefano.stabellini@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 "michal.orzel@amd.com" <michal.orzel@amd.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
References: <20221221185300.5309-1-ayan.kumar.halder@amd.com>
 <e26768b7-99f7-f4e4-6ae5-094d17e1594a@xen.org>
 <20b15211-492b-713e-288c-14bd5e137ed7@gmail.com>
 <ff1aa8c9-34a0-72a3-7a9e-c9a4fee93561@epam.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <ff1aa8c9-34a0-72a3-7a9e-c9a4fee93561@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0127.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::19) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|CY8PR12MB8196:EE_
X-MS-Office365-Filtering-Correlation-Id: 619c01b0-a6bb-450e-6128-08daf5619453
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1C/UCmR1W9JTkTguYN5P2qYPEO2OrVnVCGKNg0UT5afwc1Bqo1yL4IfmBZjljdIjmR3TulrAzQ4sw+CDTxbygFyhV6/6UYYeIKLcAqjVlLcVb3ZAeGSFYteuwqAztOynsfnLdMs5TO2IUiHPtg75ZdsJ5Pv1Z5aRQF+OOYQ1UVGm4pgsr2KVaEW6BWnpb6gadmq22+cViGUaDiyry1gfjJAYhHNhsps1zTEvz0a7/XOt9NOHgOLQ0A2OQwktFmmDtuvAo++T82MKWZHjKUP1ES8U8QouLGEmodCwY/pcZxHMngkABvKW1j4jg9rq/q71IrKrnSzyZ4LTYVgD6nADQ5xrbSRh5FF8+TIED50hfm9PaLtKIP8AMNrHzAzVR7MmrRhqW4ivTOG/cEtUYCOKNd9p/Abe4kkw0zUmuSgVCKhJybL4meSjJZK6Ry9thK2CFvwsaDvsVYGrdFYQob3JxeIpCXe1pXisIXVnpDXUFR2AJbDsmgEtQSnOKcbVOEH5GA3oXEwXSvKij5OLhlbFZDk4iVMzCYRsy1sB7xlRllWz0bJzf1FadeLb1ih97TIIteA3B3sIT3FLGVmjIsUqmOxkCWAz/tdl/9uppP0oqnPm1md7DqT2/ncZa6+bdikYp5ADhed1uHIWJHc4AZI+lGy072wvGBMnqWnh8AAdLA4YU2fYkn68U3ykdskm+qw4apIbSpL0D40BKgWKMbJcyImqOjlX8ACZQqlkmo88uDs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(136003)(376002)(366004)(39860400002)(451199015)(38100700002)(6506007)(6666004)(31686004)(53546011)(2906002)(5660300002)(6486002)(478600001)(2616005)(6512007)(186003)(26005)(316002)(8936002)(36756003)(83380400001)(8676002)(31696002)(41300700001)(110136005)(66556008)(66946007)(54906003)(66476007)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmV2Mk5yMjlhZmJ2NUl6Z2lncTh0MnN3SEJjY3ptK3doWEVmMkp2b2QzVnky?=
 =?utf-8?B?Y2FGUVdMRVozeVVGL3VMNG9sOHA1ZFhQa25zRGZOellRSzM5emx6emt3NmZG?=
 =?utf-8?B?Si9LaXhwZklPaU9uejNBV2UwZ2tvbXZhaEhnOGltamlMUGs0TVRkVjV4Z0U3?=
 =?utf-8?B?QnVlUjQ0dkxSYWZCditXZ3U3eFgrb0FKKzlyMWFSazBVUkx3Z0pvb1JkUCt2?=
 =?utf-8?B?bHJYaXNwc01sNlJsWTZheWN1UUlMQ2hFU2VYaWNGUXBZT1lIaDlIMjk5RmZZ?=
 =?utf-8?B?dWIzSjNMNmdLMisrdnlpTzFzT3JHdjJCQ0VvbTY3RGdIZVFSWkNoQkNrWWdq?=
 =?utf-8?B?Ry9TbkpndkNDRmw4Q0M2aFM5NDN3VDVkM1dZbVFYMTc5RE9DaU9SdmVIczlv?=
 =?utf-8?B?N0dhdFl1d1JqamppdlRXR055SHdZMkpEemNMTDZnYlh2R3hNcTFCenNSVXkw?=
 =?utf-8?B?M0tXY0MxaVg5a0FmMlRxVzZ6WjNhaWp4dkRQbi9GVlFCbFNUOUZSOWttTzFJ?=
 =?utf-8?B?TkMyWEY3QjFLZkhxVCtLU0ZlSmtLSDVHVzM5aFhOU1lvR3hUWmV2K2Z0QnZ3?=
 =?utf-8?B?K0JWcTQ5eDdDQXRSRXRXeFFRMklPN0JoYXZxSkVoVjVUbjUwYXFQdkNqM25q?=
 =?utf-8?B?N28rQXd3NTFmTnZoVlQzNDFwMEh3cXhaTE52cGFBcThHZmUxT1R4dW1ZSG43?=
 =?utf-8?B?SkwwNFU1aTAvcHlSN3JRRFRBRWNmQkRsWFpXRmExaVh2L29iWlExendMSUF5?=
 =?utf-8?B?cXVmZlFSbm54d2FRbzlmb1hSWklTR1Z6cFlDekU4TThQRHFweW9hT3BXSlNM?=
 =?utf-8?B?bk5Hb3dqT1BGN0tqN0VvSHU5L1VWdlVTMXFnUXl1VWpHWjhHM0hHMTczMmxh?=
 =?utf-8?B?UVAzWDNNY1JGT1BwUW5DckNXZURBWUpMRDJVTktVTWJPK0RSUnZvblFuci9Y?=
 =?utf-8?B?bVl6Vnd5a1NERlVueEk1ZXNkemo5NzJoT05yaWxjSjRYQldaaEt0aU45WFdz?=
 =?utf-8?B?YnkrY05jSjFFMHdWWjNmam93WW9jYk53Q00rbnIxekJUWUNGSUF2ZGx3WXVo?=
 =?utf-8?B?YjN2L2JkK0dsZTBHcWlQZlJyOVdGY2trbmcxQ0NTMjU1Qmk5ZFM5cVByOUFt?=
 =?utf-8?B?V1dkVERNMmZhOGNyYkcxc3R3cGt5SDJBazd1RUNVS0tUMmI3OVR1MnUwZ3U1?=
 =?utf-8?B?QVZQWHk0WEprMERNV0lkby96K0xSQXJlQU1HL2JkVGM4QzRwZFBiZU1jYzlX?=
 =?utf-8?B?NXJSUGNKQ2FSWVc0TnEyeTByS0hKQXk2RDhqLzhHWjgrS29BSG9nZDhWQWor?=
 =?utf-8?B?TTJkc1JOY3U4bDRUN3Fqc01pN1ZhZE5ESTdmRlE4S0taQUZ1NUhyc2lIMlNh?=
 =?utf-8?B?clA4Ry9xZHU5QkpVeVhBR0t3Z3dBSEtWcW41anpQQmpyRms4SkdVV3hGNkhW?=
 =?utf-8?B?cURKbmYrb1ZJRGM1TU4zMGZZelozenhPbzNUcDFsakVmWTlRYVlIY1oxS0d4?=
 =?utf-8?B?V1p5dkE2K2RGQ2wzazkxWVJ2VE5tYnV6SFdPOVdCclM1Y0ZnSDVTTW12cXFX?=
 =?utf-8?B?dk5NRE01ZHZlTDEzdXNTeWxsRzUwZmtENFB2UjJHUVJ5Tmd5eXliem1WQ1Fl?=
 =?utf-8?B?T21LZlZWV1lLVDUrTG5FUThFUWZEdzBOSnJ1bXRBUkxnL2RGcFRQQ0p4VVI4?=
 =?utf-8?B?RHo4eDdjR2V2d2p1UE1uNS9UZEN2anJhSkFnVUhzYmt2U2oyd0paQ1Q2M0xG?=
 =?utf-8?B?emM2SzdkbGNKdE5qNmh2MHB0R3ZXSjhMOU44VmxsK29yZWhZOGt5SWloc0hy?=
 =?utf-8?B?K1JvT0dZS3ZYQU5MdG1tTFdsL1g2RWNKR3hkY3R0UGlPUDZHNXNVdzVtQ1pL?=
 =?utf-8?B?ZWdVMlhjNTVJY0tYYnJlZExCeVdKdFp6NHZwYnk2aVFhQjUwOXlLUS9tTWlh?=
 =?utf-8?B?RXpDd0dtVVF3YVJGN2ZlRTNScE1uWm5FNVRpOTdDQ0VHczBJV0dJQmNWMHlI?=
 =?utf-8?B?VStDVGVLSmU0MURJZjYweERGSi8vcVZ1SlpiSGpBM1VNZ2h1VUdpZzFGUm1Z?=
 =?utf-8?B?T09hUzFML0Uzbm9qMDFaRlBXR1pSMHgrMDRYTGRZQVJaRTRZclp5NEFQUDhm?=
 =?utf-8?Q?Rh4F1iASLdY+AoFWA2iZR5NZV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 619c01b0-a6bb-450e-6128-08daf5619453
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 12:27:47.7659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S0Gulg7exijUM77ZV6Ws4zqpMQJnxLPJWObIx8pX7aaHERAvhJn4ITDynpskmWuOwlam79wllG+Xr0Uz2NCMJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8196

Hi All,

On 10/01/2023 12:30, Dmytro Firsov wrote:
> On 09.01.23 11:36, Oleksandr Tyshchenko wrote:
>>
>> On 08.01.23 18:06, Julien Grall wrote:
>>
>> Hello Julien, Ayan, all
>>
>>> Hi Ayan,
>>> ...
>>> The changes look good to me (with a few of comments below). That
>>> said, before acking the code, I would like an existing user of uImage
>>> (maybe EPAM or Arm?) to confirm they are happy with the change.
>> I have just re-checked current patch in our typical Xen based
>> environment (no dom0less, Linux in Dom0) and didn't notice issues with
>> it. But we use zImage for Dom0's kernel, so kernel_uimage_probe() is
>> not called.
>>
>>
>> I CCed Dmytro Firsov who is playing with Zephyr in Dom0 and *might*
>> use uImage.
> Hi Oleksandr, Julien, all
>
> Current Xenutils/Zephyr Dom0 setup uses standard format for Zephyr on
> arm64 which is zImage. Thus uImage changes will not affect me.

Many thanks for the confirmation.

I have addressed all of Julien's comments and sent out "[XEN v5] 
xen/arm: Probe the load/entry point address of an uImage correctly".

- Ayan

>

