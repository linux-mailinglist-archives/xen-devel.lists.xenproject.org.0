Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 506F667A2F8
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jan 2023 20:32:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483713.750051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKP1T-0006Sd-90; Tue, 24 Jan 2023 19:31:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483713.750051; Tue, 24 Jan 2023 19:31:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKP1T-0006QH-53; Tue, 24 Jan 2023 19:31:59 +0000
Received: by outflank-mailman (input) for mailman id 483713;
 Tue, 24 Jan 2023 19:31:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KMs4=5V=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pKP1R-0006Ph-Od
 for xen-devel@lists.xenproject.org; Tue, 24 Jan 2023 19:31:58 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060.outbound.protection.outlook.com [40.107.220.60])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1552b3e-9c1d-11ed-b8d1-410ff93cb8f0;
 Tue, 24 Jan 2023 20:31:55 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by CY8PR12MB7609.namprd12.prod.outlook.com (2603:10b6:930:99::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 19:31:50 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::a3a7:87d9:60f1:7eb1]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::a3a7:87d9:60f1:7eb1%6]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 19:31:50 +0000
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
X-Inumbo-ID: c1552b3e-9c1d-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hKwODMGGQJZ2dq3ya76qTegSOFq4NLF3YDQw3zDl6Js71kYY9QRiPCPtzWFbnOwOgKEPX3rsySWRHhhmuLeVbLddSQTn8xkwVPrb2YLeqRFS0RavZzdsZ5pLknNfxYpSwM69FCdT3GjKMZYGQoYh2U3w9FVgyCQUnc3n4k9fyebO20WLzugv7majYAO5I4QNUaiY7q5s+q4b2Nxeg5c+77CN07b6/vDXy5eqRxcG+t0y8zekIolTLwB91OtWSa/P7uVRUa2BDudYF1R9vXtK2kdTzbBJw+w3jDD2q47PQixxmlRfaiG0F6Jbe8yXfQvdA7pFn4jWCOqFYIZHDoBZUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CAMDv2Hz/qbJSvTbWP8NB24C++T7IAE0be5qijZjxb8=;
 b=TFmCdiaGXd7YqN90ox23/d0Tx/Jfh//Oo0io9ap442B1/0jl3XlM3YOu0l0ELgJ6/zkece5Uq9zxx9lFTjejbSddQ2rcLAPqsY3jaZs/utE7I2BQAuzPwyf64O7eW/ZFBocHbKebbtderZMNGrzSHKg5DmOJWlA1pvywC7YMjl4jme5cDChUKqmNxsWr93mG0P7ZBSytHoShBvXedwwvuBBH431XIALpXudHMq32jXxuqVE1Gjqh1wSbhWyewf9LujkU7oT7ZSJwxAlgFSb6H9OHDiCyBw+1x+HjykcHrMfKnEvW6tYbL8jZXlQKOvcymJyyCwQeTjL7yJMz4ZuG3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CAMDv2Hz/qbJSvTbWP8NB24C++T7IAE0be5qijZjxb8=;
 b=mybJJ2iHl2fCk6Z3JSHA1ukZz2S6ApG+j7GLW4VPrsqjCWGDT/aRr4Fr+thdr4lEHlcGwVoOu3qjOv7RTMVD/SWLl02pbe1LmXofoJ1nQpvpEJ267JgzeBRJJxHVGs5JgBcqAmgZgK875qW0AaUc9pRxmJYbfs7Pn4S024sQB1g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <b3ae278f-b7a0-9273-fbc7-a3362905818d@amd.com>
Date: Tue, 24 Jan 2023 19:31:43 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 00/41] xen/arm: Add Armv8-R64 MPU support to Xen -
 Part#1
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20230113052914.3845596-1-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0358.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::21) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|CY8PR12MB7609:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b335160-9192-47bd-a259-08dafe41a3be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I9O+TEFoDzvouP9r60O5JeBN9kXmtFvVUVrE8GgMz5IiyaNkvGX3pOb2zIAxSCVnGTwhqevb1odibqDjqBcSIgnOtMgsY0NwBr40OmNM9FESZp8HzLK3nC5Ev5xqPN8AHZr3hWEGlGXSFMwQTF1+9TcOQGbZWB2LptaaR0ksSmQtY/ajKMw6yIZoqaVYWnwpF8SvYhigzQdreknVgCYlcyaj2cVk9k30Do0ndJBl0PnzSZns75IKDAtQ6yQxH8lnyyCc4rNJ6mCRT2dNKmQ4olZtaXM5ktT9xxDiMHul6A13WCOoCM1z/WWdRXu+dK7nlFCE1usgOXQp7ceTIq2UoqdlTujZ+kMP96NKlMF3pI2QNplEE6Rmwp0Q+N7NDZlefLaM7xuY8hjIxzIxOvd5YFHIbah9uUs5c5NgNz/3oG6/hSIelObpuPsPrcN5jHJD7RvFAm//QHPIySxfcpIvlJvqc2+bagu23CehqTr4uys63aeRg08++JW160FlX1LlqUO5abxWY1ENJOWQirW+W5lWlUNAjrAa/Oh0ZT6wsI3QPKj+bdLNGsWbQtCRarORF2kOGCXD+UCSiuU//KxgVYUKH2cgC/awvmnwkd+aAYo8dwnbO/RQctoVQuRg2lz64/KzeqZuqziVYmSp6kugddDcj17dlLZX3ZAReK8vMMuM6OobYOOQ7U8n7aKPY9hLk68VKUqE1njzCcBVROVKX0zAKfUJPuh47nf+sQnzatnxnQJPSvoAmlbFllGvJfZiMN4UsTIP8FFvQHxKF0/jToI8Gr70H86m9kuDcIOl5TgC0xIYYWRVrSmWoJHVJG6LBYHJx0+Ci1pcbwed5Rk2AzZjYGBR/557uG28SVfpRzE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(366004)(346002)(376002)(39860400002)(136003)(451199018)(5660300002)(2906002)(31696002)(7416002)(54906003)(8676002)(6486002)(316002)(66946007)(4326008)(2616005)(66556008)(966005)(66476007)(478600001)(6666004)(26005)(6512007)(53546011)(38100700002)(8936002)(186003)(41300700001)(6506007)(83380400001)(31686004)(36756003)(17413003)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHJGUFphdXlPQ1lPVlhoVmdveURaVUZ2SG14clE3RUtaYUhxYXpETHhEaDBZ?=
 =?utf-8?B?UUh2ZXBpdDd5RkRhZStHNis3eWUxR25DSlRjU1lGaEVPN0gxUXIzKzBYSG5n?=
 =?utf-8?B?eng4YW1qVUVlZWd4Mmt1UjlmNDJFRldOa1h5RXB5MElSR0puT0E0V2Zub1Ro?=
 =?utf-8?B?cUMwS0kvVFFKalQ2Mlc1Q2d1cE5yc3U1a3RLS3dYckZSK1MxMXhEdTBvUUJI?=
 =?utf-8?B?djlwRXlnRlFUNkw3c2tMdnhSZ1RxeXZ3c0cxWUxLR21YcFBGallBM09oL2g2?=
 =?utf-8?B?TnZaMithNGk0ODFjdVJwYXNEMW5FRTFGOGZad2Zwd2Y4SkZMMXdaN0U4VGhH?=
 =?utf-8?B?M2tFaXJZbyt4MDEwZENEc29TMFdZYWVVbTU2QWVFWEpxQ2VWYlFkNWVFYXQ5?=
 =?utf-8?B?MU02YmdSY0g2c2lybEVOSEMzaGc1MTBpMEdEU0NCQzVTcjNkWHZsc2ttYU9o?=
 =?utf-8?B?aUU5M0JDbHd2S01YTlVEZ3A4YU1UU3lUdkpuZkt0VkR6WmxVeE9TeWpJVmRs?=
 =?utf-8?B?clRNbnM4b2pxVHJVNXJYS3VhU0hyeCs5cHVuRkgrMjNuM3UyM0hpNldmODVX?=
 =?utf-8?B?Y0Uvb3I1dnRkTHZES3lleHpnSE00bEpOTCtZNEZraURpclNmWkVzZjJacFFZ?=
 =?utf-8?B?WEN6MnE0R2lDT0RrMGkwV3BIbmY0T2gxd2hmZEFueVZHUGFqYy9aRW4wMlE2?=
 =?utf-8?B?RnRsM1Avb1dkRUVubHp4bjhUalhhRXQ3eXNGdXZuZTI3Z0svMnUzTWNSSnBq?=
 =?utf-8?B?UXo2cmN6U2o0bWlpU3g0MjU1ZytPbFo2Rm1mdExmMWh1Mit2c2J3NHU4eGdR?=
 =?utf-8?B?UE4vWStoWHIzQjRnYVl1ZXRDQ1gwZUMxalJXdkRqVHVuWjFtcWpPN1NnYTZS?=
 =?utf-8?B?WTBQY1JuYmt2dUxwSEJKVXdjalBUcDZWaEltS1pVVG45Z0Y0QzFnVzFpbDd5?=
 =?utf-8?B?eENMTWNvVWpCTzUxazhSc00yOVViS244V2dzdENHMThzaDQ4L0hWYnV6SU1R?=
 =?utf-8?B?Y1RjdkE5RmRuSjNRYTJWM01CMHQyMDUzUjg1dnFZUGFsRXZtWnRCWHQ1ZE8w?=
 =?utf-8?B?RHhxbkZuTEE3WGV1cWtBOW9Qak1wNHdRakVYWHJpcG9tVVhJV1lDeEplN3d2?=
 =?utf-8?B?UmFiWUF2cGtmNWRqWExaZlZvWFJzeXc4OHRlcFdGVjdkanZ0eUEwbkFWTnN1?=
 =?utf-8?B?Q2M0WU4vU1JuVG9tS2tFSyt6M2VJREFMNWwxUXpNWm5SZzA2Um1DL1dObm5D?=
 =?utf-8?B?TElYbmxyUnVtcFh6aUVDMWZUVFVjMmZIOVdaY1BQVmJwL0lJbUJFejhGYXdY?=
 =?utf-8?B?L1FHcTRrSDIrdDc4akVsREc4TFNFcnEyc2dQQ3ZqMnI5ODA2QmMxK2xkc3F5?=
 =?utf-8?B?TGVoUlJJdXd0RmFITDFqTmJSand3cGtSRTRzd2E4RXhTNDhtUG9XVjl0OGtM?=
 =?utf-8?B?ekY3a3VMRHVOVmNLVThnUjBuaS9rTkRaa1k3bGt2WDFiWGZtMWlvTUFtcGhk?=
 =?utf-8?B?azlnb09qdFJRdVUrNnNwRGxSQ0VDOSswVUlmWGxxUXNqNEUwNW9SdjhTNEVH?=
 =?utf-8?B?SFVhQzRMN0JDd3BSOWVhQlJVVmw2VjhGN3ZsVkRsOHZ0OHl6cE5KNnpsbTFp?=
 =?utf-8?B?bWh1bklhcUlJb1Q3SytiTkk4aFhvQ0N5REJ5K1g5QzFCRXJKQzVDb2x1UWpL?=
 =?utf-8?B?YlQ1YndoaGpSM3hsRTJXalFIMFRBZjFLWWUvZ2xmZGNoRjRCalpLMS8zOUVq?=
 =?utf-8?B?WWNHQ0pHa3JybFBhSzJPc1RuaS9FQktsTVQ5UHlOK1o1SGg3cXdyT2xvWVZ3?=
 =?utf-8?B?aTZNaklBRHExYXBxSzBKUmExNHU3dHZIS3EweEdFbkZYaHkyNmFrMER0M1li?=
 =?utf-8?B?M0ZSbmRrNjY3Z2dwOVUyR0t6Y21RNWM5QkRiclRGVTBCSmpPSDJBcTk4Yy9J?=
 =?utf-8?B?QUhJNVRVR240SGJaR1A3cXNOR3VFYzFtL0tkYlB2SjgvR2QvUTZKYWJJVkxV?=
 =?utf-8?B?M0wxcGlqQWcvanc5SURWUTNTL2c0dlNjTnpXcStnMHpjcGFaQU1JSXI5dDEr?=
 =?utf-8?B?eWsxbkNNd0t2QSt1UmRYNUFyWjNQQlp4UG5pdEdQcFVSVTdwb0dWTkx2OFI4?=
 =?utf-8?Q?i0HGhXlRbrkPAhXk7HNB6hiBP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b335160-9192-47bd-a259-08dafe41a3be
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 19:31:50.3292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: obnVnAhPyzV69rI0W9Cun/wraAeLdN+cnTHoWxm6kQWHv1CTOJzp6eqJhpQd0gqArlrm2qO5YnRFwuIH87bZrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7609

Hi Penny,

On 13/01/2023 05:28, Penny Zheng wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> The Armv8-R architecture profile was designed to support use cases
> that have a high sensitivity to deterministic execution. (e.g.
> Fuel Injection, Brake control, Drive trains, Motor control etc)
>
> Arm announced Armv8-R in 2013, it is the latest generation Arm
> architecture targeted at the Real-time profile. It introduces
> virtualization at the highest security level while retaining the
> Protected Memory System Architecture (PMSA) based on a Memory
> Protection Unit (MPU). In 2020, Arm announced Cortex-R82,
> which is the first Arm 64-bit Cortex-R processor based on Armv8-R64.
> The latest Armv8-R64 document can be found [1]. And the features of
> Armv8-R64 architecture:
>    - An exception model that is compatible with the Armv8-A model
>    - Virtualization with support for guest operating systems
>    - PMSA virtualization using MPUs In EL2.
>    - Adds support for the 64-bit A64 instruction set.
>    - Supports up to 48-bit physical addressing.
>    - Supports three Exception Levels (ELs)
>          - Secure EL2 - The Highest Privilege
>          - Secure EL1 - RichOS (MMU) or RTOS (MPU)
>          - Secure EL0 - Application Workloads
>   - Supports only a single Security state - Secure.
>   - MPU in EL1 & EL2 is configurable, MMU in EL1 is configurable.
>
> These patch series are implementing the Armv8-R64 MPU support
> for Xen, which are based on the discussion of
> "Proposal for Porting Xen to Armv8-R64 - DraftC" [2].
>
> We will implement the Armv8-R64 and MPU support in three stages:
> 1. Boot Xen itself to idle thread, do not create any guests on it.
> 2. Support to boot MPU and MMU domains on Armv8-R64 Xen.
> 3. SMP and other advanced features of Xen support on Armv8-R64.
>
> As we have not implemented guest support in part#1 series of MPU
> support, Xen can not create any guest in boot time. So in this
> patch serie, we provide an extra DNM-commit in the last for users
> to test Xen boot to idle on MPU system.
>
> We will split these patches to several parts, this series is the
> part#1, v1 is in [3], the full PoC can be found in [4]. More software for
> Armv8-R64 can be found in [5];
>
> [1] https://developer.arm.com/documentation/ddi0600/latest
> [2] https://lists.xenproject.org/archives/html/xen-devel/2022-05/msg00643.html
> [3] https://lists.xenproject.org/archives/html/xen-devel/2022-11/msg00289.html
> [4] https://gitlab.com/xen-project/people/weic/xen/-/tree/integration/mpu_v2
> [5] https://armv8r64-refstack.docs.arm.com/en/v5.0/
>
> Penny Zheng (28):
>    xen/mpu: build up start-of-day Xen MPU memory region map
>    xen/mpu: introduce helpers for MPU enablement
>    xen/mpu: introduce unified function setup_early_uart to map early UART
>    xen/arm64: head: Jump to the runtime mapping in enable_mm()
>    xen/arm: introduce setup_mm_mappings
>    xen/mpu: plump virt/maddr/mfn convertion in MPU system
>    xen/mpu: introduce helper access_protection_region
>    xen/mpu: populate a new region in Xen MPU mapping table
>    xen/mpu: plump early_fdt_map in MPU systems
>    xen/arm: move MMU-specific setup_mm to setup_mmu.c
>    xen/mpu: implement MPU version of setup_mm in setup_mpu.c
>    xen/mpu: initialize frametable in MPU system
>    xen/mpu: introduce "mpu,xxx-memory-section"
>    xen/mpu: map MPU guest memory section before static memory
>      initialization
>    xen/mpu: destroy an existing entry in Xen MPU memory mapping table
>    xen/mpu: map device memory resource in MPU system
>    xen/mpu: map boot module section in MPU system
>    xen/mpu: introduce mpu_memory_section_contains for address range check
>    xen/mpu: disable VMAP sub-system for MPU systems
>    xen/mpu: disable FIXMAP in MPU system
>    xen/mpu: implement MPU version of ioremap_xxx
>    xen/mpu: free init memory in MPU system
>    xen/mpu: destroy boot modules and early FDT mapping in MPU system
>    xen/mpu: Use secure hypervisor timer for AArch64v8R
>    xen/mpu: move MMU specific P2M code to p2m_mmu.c
>    xen/mpu: implement setup_virt_paging for MPU system
>    xen/mpu: re-order xen_mpumap in arch_init_finialize
>    xen/mpu: add Kconfig option to enable Armv8-R AArch64 support
>
> Wei Chen (13):
>    xen/arm: remove xen_phys_start and xenheap_phys_end from config.h
>    xen/arm: make ARM_EFI selectable for Arm64
>    xen/arm: adjust Xen TLB helpers for Armv8-R64 PMSA
>    xen/arm: add an option to define Xen start address for Armv8-R
>    xen/arm64: prepare for moving MMU related code from head.S
>    xen/arm64: move MMU related code from head.S to head_mmu.S
>    xen/arm64: add .text.idmap for Xen identity map sections
>    xen/arm: use PA == VA for EARLY_UART_VIRTUAL_ADDRESS on Armv-8R
>    xen/arm: decouple copy_from_paddr with FIXMAP
>    xen/arm: split MMU and MPU config files from config.h
>    xen/arm: move MMU-specific memory management code to mm_mmu.c/mm_mmu.h
>    xen/arm: check mapping status and attributes for MPU copy_from_paddr
>    xen/mpu: make Xen boot to idle on MPU systems(DNM)
>
>   xen/arch/arm/Kconfig                      |   44 +-
>   xen/arch/arm/Makefile                     |   17 +-
>   xen/arch/arm/arm64/Makefile               |    5 +
>   xen/arch/arm/arm64/head.S                 |  466 +----
>   xen/arch/arm/arm64/head_mmu.S             |  399 ++++
>   xen/arch/arm/arm64/head_mpu.S             |  394 ++++
>   xen/arch/arm/bootfdt.c                    |   13 +-
>   xen/arch/arm/domain_build.c               |    4 +
>   xen/arch/arm/include/asm/alternative.h    |   15 +
>   xen/arch/arm/include/asm/arm64/flushtlb.h |   25 +
>   xen/arch/arm/include/asm/arm64/macros.h   |   51 +
>   xen/arch/arm/include/asm/arm64/mpu.h      |  174 ++
>   xen/arch/arm/include/asm/arm64/sysregs.h  |   77 +
>   xen/arch/arm/include/asm/config.h         |  105 +-
>   xen/arch/arm/include/asm/config_mmu.h     |  112 +
>   xen/arch/arm/include/asm/config_mpu.h     |   25 +
>   xen/arch/arm/include/asm/cpregs.h         |    4 +-
>   xen/arch/arm/include/asm/cpuerrata.h      |   12 +
>   xen/arch/arm/include/asm/cpufeature.h     |    7 +
>   xen/arch/arm/include/asm/early_printk.h   |   13 +
>   xen/arch/arm/include/asm/fixmap.h         |   28 +-
>   xen/arch/arm/include/asm/flushtlb.h       |   22 +
>   xen/arch/arm/include/asm/mm.h             |   78 +-
>   xen/arch/arm/include/asm/mm_mmu.h         |   77 +
>   xen/arch/arm/include/asm/mm_mpu.h         |   54 +
>   xen/arch/arm/include/asm/p2m.h            |   27 +-
>   xen/arch/arm/include/asm/p2m_mmu.h        |   28 +
>   xen/arch/arm/include/asm/processor.h      |   13 +
>   xen/arch/arm/include/asm/setup.h          |   39 +
>   xen/arch/arm/kernel.c                     |   31 +-
>   xen/arch/arm/mm.c                         | 1340 +-----------
>   xen/arch/arm/mm_mmu.c                     | 1376 +++++++++++++
>   xen/arch/arm/mm_mpu.c                     | 1056 ++++++++++
>   xen/arch/arm/p2m.c                        | 2282 +--------------------
>   xen/arch/arm/p2m_mmu.c                    | 2257 ++++++++++++++++++++
>   xen/arch/arm/p2m_mpu.c                    |  274 +++
>   xen/arch/arm/platforms/Kconfig            |   16 +-
>   xen/arch/arm/setup.c                      |  394 +---
>   xen/arch/arm/setup_mmu.c                  |  391 ++++
>   xen/arch/arm/setup_mpu.c                  |  208 ++
>   xen/arch/arm/time.c                       |   14 +-
>   xen/arch/arm/traps.c                      |    2 +
>   xen/arch/arm/xen.lds.S                    |   10 +-
>   xen/arch/x86/Kconfig                      |    1 +
>   xen/common/Kconfig                        |    6 +
>   xen/common/Makefile                       |    2 +-
>   xen/include/xen/vmap.h                    |   93 +-
>   47 files changed, 7500 insertions(+), 4581 deletions(-)
>   create mode 100644 xen/arch/arm/arm64/head_mmu.S
>   create mode 100644 xen/arch/arm/arm64/head_mpu.S
>   create mode 100644 xen/arch/arm/include/asm/arm64/mpu.h
>   create mode 100644 xen/arch/arm/include/asm/config_mmu.h
>   create mode 100644 xen/arch/arm/include/asm/config_mpu.h
>   create mode 100644 xen/arch/arm/include/asm/mm_mmu.h
>   create mode 100644 xen/arch/arm/include/asm/mm_mpu.h
>   create mode 100644 xen/arch/arm/include/asm/p2m_mmu.h
>   create mode 100644 xen/arch/arm/mm_mmu.c
>   create mode 100644 xen/arch/arm/mm_mpu.c
>   create mode 100644 xen/arch/arm/p2m_mmu.c
>   create mode 100644 xen/arch/arm/p2m_mpu.c
>   create mode 100644 xen/arch/arm/setup_mmu.c
>   create mode 100644 xen/arch/arm/setup_mpu.c
>
> --
> 2.25.1
>
>
I applied this serie and there were some compilation issues :-

1. drivers/passthrough/arm/smmu.c:1240:29: error: ‘P2M_ROOT_LEVEL’ 
undeclared (first use in this function)
  1240 |                 reg |= (2 - P2M_ROOT_LEVEL) << TTBCR_SL0_SHIFT;

2. drivers/passthrough/arm/smmu-v3.c:1211:24: error: ‘P2M_ROOT_LEVEL’ 
undeclared (first use in this function)
  1211 |         vtcr->sl = 2 - P2M_ROOT_LEVEL;

For the above two issues, I have disabled SMMU.

3. /scratch/ayankuma/xen_v8r_64/xen/arch/arm/arm64/head.S:470: undefined 
reference to `init_ttbr'
You might need to wrap with some #ifdef .

Can you provide me the dts and the config file with which you have tested ?

I see that the console got stuck at this line.

"(XEN) Command line: console=dtuart dtuart=serial0"

Looking into setup_static_mappings(),

     for ( uint8_t i = MSINFO_GUEST; i < MSINFO_MAX; i++ )
     {
#ifdef CONFIG_EARLY_PRINTK
         if ( i == MSINFO_DEVICE )
             /*
              * Destroy early UART mapping before mapping device memory 
section.
              * WARNING：console will be inaccessible temporarily.
              */
             destroy_xen_mappings(CONFIG_EARLY_UART_BASE_ADDRESS,
                                  CONFIG_EARLY_UART_BASE_ADDRESS + 
EARLY_UART_SIZE);
#endif
         map_mpu_memory_section_on_boot(i, mpu_section_mattr[i]); 
<<<<----- Is this expected to map "mpu,device-memory-section" ?
     }

- Ayan


