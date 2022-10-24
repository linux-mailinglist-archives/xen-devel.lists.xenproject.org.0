Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD7D609F97
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 13:00:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428863.679450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omvCG-0007gY-1n; Mon, 24 Oct 2022 11:00:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428863.679450; Mon, 24 Oct 2022 11:00:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omvCF-0007cx-UK; Mon, 24 Oct 2022 11:00:43 +0000
Received: by outflank-mailman (input) for mailman id 428863;
 Mon, 24 Oct 2022 11:00:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZViS=2Z=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1omvCE-0006vr-K5
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 11:00:42 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2083.outbound.protection.outlook.com [40.107.243.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 191644b4-538b-11ed-91b5-6bf2151ebd3b;
 Mon, 24 Oct 2022 13:00:41 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DM4PR12MB6009.namprd12.prod.outlook.com (2603:10b6:8:69::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 24 Oct
 2022 11:00:38 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2%7]) with mapi id 15.20.5746.026; Mon, 24 Oct 2022
 11:00:37 +0000
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
X-Inumbo-ID: 191644b4-538b-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bKmcYQ/IOEJZSS/EKddqsHhKBWr1N9rDkYUtdH1G/DTuQmwbyDDpmNOGYGswai8JP4tOnEY/KFsqY4FKADAruW4cHRc+QYsSZVGDkh7wHBX99t2pkkrrjvCDISO092moUNnJ0/vEuQaB5rmyNwH1Z9vZdf5HYO9prS8kF+fPIiAZvH9/5bRb/MOy+KQmzc4Qtuudnh3UyF9y/bij29gRYBqyuZdLrm0UeeqOGJSsaeqa1VBvm9FP4pWsR5g6OeYlg67SZCXN6IZocCYEWyCTT7LcLuR8G2PZszrFIEJXYQmkKnf3xLd7bEStVGt9fKhCUbsxSbv7TEMPiWKpPgKA7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=873z2USUakOrS5Q5b9ZvRBO+BGLKZmBVzktkFDI0/bw=;
 b=ZzscYzpyT8NVC4K/KtKJgNx7y1Gak0MrCPv0NY6wEG/h+WSpmq25ExEX0THYKY0JVnDszsV61aY1+slHlKVG1/30aVqlPGj4uYfzj0BDLgkNpNNQLOZV/7lfEGBzgK1FLNn97cDFMgu+8sVK6/qGlMbc3OCxLQIFkzYHBMtdVphQjJjMEyGJJsFiY4y3+e7v8aXvV50Gs4hR5MlrcjimG/kWDsixf3Qz/tjKTldWkH7A+LQ1W8cFN5DUGNyhFnjPTV2LR8k0bLGDRBUyAGjpbWX8Kz+zj4iqypyfTm8SndWUEfeev6G7vEWjeD8YoJUHIDCYCknX3eM6EmPYAbugIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=873z2USUakOrS5Q5b9ZvRBO+BGLKZmBVzktkFDI0/bw=;
 b=wbNWvxw+Ef8ED6RF5n5ZuDc4W9lARrIhkCcO3SvIPdwh0BfIjwxsOM+KEUxn5ko6CMTYaQ+r5cX3/ASoLeDEeVZFbTO206+1vpuUpgxaRBmVO008sTt+0XIfThRz67ZPlV9mB3wFTGXjn3pqbkGUoWeZI4ojM4WlYoQk+wQfteE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <e0183387-8556-5fcc-2f18-003832d5cd70@amd.com>
Date: Mon, 24 Oct 2022 12:00:31 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [RFC PATCH v1 02/12] Arm: GICv3: Move the macros to compute the
 affnity level to arm64/arm32
To: Xenia Ragiadakou <burzalodowa@gmail.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20221021153128.44226-1-ayankuma@amd.com>
 <20221021153128.44226-3-ayankuma@amd.com>
 <cb67c768-1a05-e5d5-efed-9a282c6a8c2a@gmail.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <cb67c768-1a05-e5d5-efed-9a282c6a8c2a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0400.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::9) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|DM4PR12MB6009:EE_
X-MS-Office365-Filtering-Correlation-Id: 79310a66-43f0-48e4-0a86-08dab5aefba4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3IqTENvwqGme5RxvsnYGSEIRv0PthJ0sTj0OwS8yuNICn4GwTTsMm4fTfm4w7IVTfZNBIbE5LTg98iRDa3WsvstVOLZuibWPWodVWTWyXDTctAnAQDD6PWcExA8u2mswVjpA9d8hHZwB0vqYeSoKHzZhfq3J57nKza6atyVaWRk6nzZVcm30L3IrjnxlUD34iYuY2vMz1u+BcZyf0xdzy6QP83cpG+njt38Tqp6cUUIhLarz8eWGj/3Coiapbk68+mMkr3Nyb+O9w0tvU22qEtxLeRqzsL1xfgG8OGP6pox29nnzsBNULpnRkCKIyHBYsxogN1y2y8H3T2HZronizheEV5oTTdwHWzAnLWg8g+9sG30m3/tHQQEG9BsiaZRbAq+kE7manu31o5aCUikxlhuvfqsOU86+l8q4GZVY3hvM6+r91WApzC2R1u/e+C3o5ZXr3XE9LLRSGiBtsCQSzlRkq4gTwZYucaabqf/zpyXo5UTMiDG1Kft8jYn69C6T3cQwD0/mvPkGdaV8MGbVBkbF6oYPMEXS0StJzaDMwoxoqc+bpGqIcYKHQJQF+WDnOpCzyRUikqluuwYagVy/WTv8MwUNnerkqqGamZzV4AkWCVjM7vJj+6jTCniWghK58OeseFzzso8ueHZpzVfmD1cphUmtg7XFwD91CT4ZW/TxjWHrQLkdHW8WIFNVvhAj/gah7k+sNNvosjpAlPml/fHPsYh2r1S2c8ulvSF+9+Gz6e7Aj5dNmz9F73tN9lTp9bREkdhANWkcb/Wc4sgvVTQijKJg4PhL9oEQtBxyANdShXp6bx6Tii9cy13p3yn5Q79vExDetmtK9ZiZH/VSYq1rxeF24ZtPtEreSPCKIF4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(451199015)(31696002)(36756003)(31686004)(2906002)(38100700002)(53546011)(8936002)(186003)(41300700001)(83380400001)(66476007)(5660300002)(6666004)(316002)(6512007)(2616005)(26005)(478600001)(66946007)(6486002)(66556008)(6506007)(8676002)(966005)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTA5WEVtQzkvQVl2RzBSazBUc2s0VnJYNnIwYjRtL3d3c3ZlZytXOU9MZG5H?=
 =?utf-8?B?YWVLbnlDeTZadUJJMXF1cXg0NElEVTJhY1B6VGtMeG1JZjI5dTY0UGxwOTZ3?=
 =?utf-8?B?Tkl5VDNMV2lNRTVEVnBJOW50cXJFclF4UUNZT2YvdnhORmMzb0F0MnlKVU5Y?=
 =?utf-8?B?dWZlMUtScWkxbUtiVW1vS2JFVzZuWFBmNGVaLzJtaW5SL3pwd3RPbmtNa3hW?=
 =?utf-8?B?TEFwK21tdjBuQXdXSGUyVlhkUzJuSGlGSVQraHdQekw1eVNTMk16c2hxTXht?=
 =?utf-8?B?blVvK2oySjd0Y0xUMTFWcEpWcnRUYXdZVTFyUUQrbkU4OFpTU1Z0NThHaDkr?=
 =?utf-8?B?OHduQkhnSGYrNEw3Rnp2VFQvM0xHeEhQTWlJNlYvTnNrVWFRUGtBWXBRVWVl?=
 =?utf-8?B?V2dzUFd3SzRBMzR5VnBhN2RkaFZFWHF0L1Ftc1lvVm9MemNpMDJHQnhkNi8v?=
 =?utf-8?B?dEQ2dHp3WGZtSEJVQ3pRbzFHekV6ZXFqRXFLcHNwRlovcVJoRmdJaFRsNW0x?=
 =?utf-8?B?VDYvYXhKYmt1RVVnREJ1UWo0NnZuNVdjamYvdkxOeENkRkRWMDlKT25Da0pT?=
 =?utf-8?B?RGNGN2N0M3BqeVNjQk9hdXRxQzltTkdvaGpMdENlUWFhY1FyUWgrSjRuaVQ1?=
 =?utf-8?B?dVB2dmU5aXp6cTNYZ1JVMWo2bGlyaXhySzA0c1JLVVdUNU1KbHlLYnBwZGhT?=
 =?utf-8?B?WjhtREVUYjVMS09pYjZmWmg1V0JkMVRpVGVPRjNYTlhXMnlIUFNGdGUwSno1?=
 =?utf-8?B?SmxNYkxBdlYwc2NncVNKb1pvTkxJZFdnaHdXZkRVV2l6Uk5oLzg4UC9NdU5V?=
 =?utf-8?B?aWUyNFcrUWIwUitsUnYxdjNtRWNDZE9yOFFYeEJHYmNSNDN1K3dJMmVWUkhl?=
 =?utf-8?B?SHphVXRpblBpVUNyeXhJY29pTXlVelYzTThnbUZ4R3AySlhEbkhYSXZsRUJM?=
 =?utf-8?B?Q2taaU0vY0dsZEJ4U1A2YVNwc0RYQ2dtM2Z2TDJQMGxLSTVyK0dPOHhOb1lY?=
 =?utf-8?B?U3ZYdTBkNnY0Lzg4TnZOY0lLSEcrcWprM21PSGFDak05OTZZMk8xS1llTnp5?=
 =?utf-8?B?cXJnZnVHZmo2ZWZZRlVMTVNTNmQvaVZHWGg5U0gxdEJqMkVTSWFjY3ptV1pM?=
 =?utf-8?B?akZ2d0h6THlwMjcrL1ZKeGNEWW1HSjBjOWoybndJQTZsOUJUZURLY2ZJc2VO?=
 =?utf-8?B?ditCSExiY3ZCdUtNeVJrVU9oWmFZdXRqbWp0TlRuRENYMlRUa2VCTFlYUDNZ?=
 =?utf-8?B?M3RTZkQzNndRSStFSHRteGc4VTlEd2crTytINUdVQU9obzNnSEdneHlhdlNa?=
 =?utf-8?B?Um1haENlbDNwQUs3eFpiMlg2VkJEcW5lVFp1aml0YmpMb3dPNmpOSnZ2Ukh2?=
 =?utf-8?B?NjREb3RJZnBNQmlzSlNUeCt4ZTNzcUliemxXM2FRL0VkMnJJN1lKOTd3dGk5?=
 =?utf-8?B?VWlvM2t0YnFzV2ZBN1hHRzNlRndGRlJvV3dCc3o1VVJTUm5KUXp3blpZNC9Q?=
 =?utf-8?B?RXdmYzQyWFloRmVyV1pvUERHeDBqbjU2VzdLMGdJNVo1anlmRHBLOVRxVUdr?=
 =?utf-8?B?RTgzcHY3WGFvWHBwSVBnZGZ3WldVM2tkclZHTHJDV1VjcVo4T1N0U0NCakE2?=
 =?utf-8?B?Mk5NWGI5cjBzbWwzaS9kMmtpUFArV3FRRDNJUlNqRG1sc2U1ZnJLZ2twek93?=
 =?utf-8?B?RmVDTkluK0M3SDVaR0JYU2FmSnVwOFdLYTVRQW5xTG5OK3BlSDE4M1hjMU1L?=
 =?utf-8?B?MTQ4RFY4aDZpYWRoektVNzVqR25WdE8rZmxiZW42SGZqOWF4OFUvRkJzdng4?=
 =?utf-8?B?VG1xNWx1SkhwbWRSdmZpYk5NZFVudEpsNFBWNm91ZVNPRlVrSkhLRUlBN296?=
 =?utf-8?B?a05mMFdIZmYrbFJzeXJiRmgvYU1PQ2VrTGRBRXNTOTRJRzVoS0VJZGNMSHp5?=
 =?utf-8?B?U0Z0UXo1WDN6RTBUNjBBUzU1OWV3Z0VrQ2xBQWs4M2Y2SUZHVkxiWGIyRytn?=
 =?utf-8?B?VTBYN2I0VzU2ZDRpMDYzK25HcTA3WUdUUm5LYmpwRUJKQWtnUXh3K3lMWTNI?=
 =?utf-8?B?UlVNY1RKYXJGVlZtcmtGZElNdEdmWFF0Q2I0ekg1YVVlVU1nQzlGNzFpSzFB?=
 =?utf-8?Q?ynukmvvH4uK09loAPhpsSlFHi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79310a66-43f0-48e4-0a86-08dab5aefba4
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 11:00:37.8833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oGgLIrCsgR9xtIoIl3RDQW4FRAvMH1ySascsB0R1fhuNznGu1FEaDPtkOxb05N11r9osaAkhscYZEkeRuN1Ojg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6009


On 21/10/2022 22:18, Xenia Ragiadakou wrote:
> On 10/21/22 18:31, Ayan Kumar Halder wrote:
> Hi Ayan
Hi Xenia,
>
>> Refer https://elixir.bootlin.com/linux/v6.1-rc1/source/arch/arm64/ \
>> include/asm/cputype.h#L14 , these macros are specific for arm64.
>>
>> When one computes MPIDR_LEVEL_SHIFT(3), it crosses the width of a 32
>> bit register.
>>
>> Refer 
>> https://elixir.bootlin.com/linux/v6.1-rc1/source/arch/arm/include/ \
>> asm/cputype.h#L54  , these macros are specific for arm32.
>>
>> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
>> ---
>>   xen/arch/arm/include/asm/arm32/processor.h | 10 ++++++++++
>>   xen/arch/arm/include/asm/arm64/processor.h | 13 +++++++++++++
>>   xen/arch/arm/include/asm/processor.h       | 14 --------------
>>   3 files changed, 23 insertions(+), 14 deletions(-)
>>
>> diff --git a/xen/arch/arm/include/asm/arm32/processor.h 
>> b/xen/arch/arm/include/asm/arm32/processor.h
>> index 4e679f3273..3e03ce78dc 100644
>> --- a/xen/arch/arm/include/asm/arm32/processor.h
>> +++ b/xen/arch/arm/include/asm/arm32/processor.h
>> @@ -56,6 +56,16 @@ struct cpu_user_regs
>>       uint32_t pad1; /* Doubleword-align the user half of the frame */
>>   };
>>   +/*
>> + * Macros to extract affinity level. Picked from kernel
>> + */
>> +
>> +#define MPIDR_LEVEL_MASK ((1 << MPIDR_LEVEL_BITS) - 1)
>> +#define MPIDR_LEVEL_SHIFT(level) (MPIDR_LEVEL_BITS * level)
>> +
>> +#define MPIDR_AFFINITY_LEVEL(mpidr, level) \
>> +    ((mpidr >> (MPIDR_LEVEL_BITS * level)) & MPIDR_LEVEL_MASK)
>> +
>>   #endif
>>     #endif /* __ASM_ARM_ARM32_PROCESSOR_H */
>> diff --git a/xen/arch/arm/include/asm/arm64/processor.h 
>> b/xen/arch/arm/include/asm/arm64/processor.h
>> index c749f80ad9..c026334eec 100644
>> --- a/xen/arch/arm/include/asm/arm64/processor.h
>> +++ b/xen/arch/arm/include/asm/arm64/processor.h
>> @@ -84,6 +84,19 @@ struct cpu_user_regs
>>       uint64_t sp_el1, elr_el1;
>>   };
>>   +/*
>> + * Macros to extract affinity level. picked from kernel
>> + */
>> +
>> +#define MPIDR_LEVEL_BITS_SHIFT  3
>> +#define MPIDR_LEVEL_MASK        ((1 << MPIDR_LEVEL_BITS) - 1)
>> +
>> +#define MPIDR_LEVEL_SHIFT(level) \
>> +         (((1 << level) >> 1) << MPIDR_LEVEL_BITS_SHIFT)
>> +
>> +#define MPIDR_AFFINITY_LEVEL(mpidr, level) \
>> +         ((mpidr >> MPIDR_LEVEL_SHIFT(level)) & MPIDR_LEVEL_MASK)
>> +
>>   #undef __DECL_REG
>>     #endif /* __ASSEMBLY__ */
>> diff --git a/xen/arch/arm/include/asm/processor.h 
>> b/xen/arch/arm/include/asm/processor.h
>> index 1dd81d7d52..7d90c3b5f2 100644
>> --- a/xen/arch/arm/include/asm/processor.h
>> +++ b/xen/arch/arm/include/asm/processor.h
>> @@ -118,20 +118,6 @@
>>   #define MPIDR_INVALID       (~MPIDR_HWID_MASK)
>>   #define MPIDR_LEVEL_BITS    (8)
>>   -
>> -/*
>> - * Macros to extract affinity level. picked from kernel
>> - */
>> -
>> -#define MPIDR_LEVEL_BITS_SHIFT  3
>> -#define MPIDR_LEVEL_MASK        ((1 << MPIDR_LEVEL_BITS) - 1)
>> -
>> -#define MPIDR_LEVEL_SHIFT(level) \
>> -         (((1 << (level)) >> 1) << MPIDR_LEVEL_BITS_SHIFT)
>> -
>> -#define MPIDR_AFFINITY_LEVEL(mpidr, level) \
>> -         (((mpidr) >> MPIDR_LEVEL_SHIFT(level)) & MPIDR_LEVEL_MASK)
>> -
>>   #define AFFINITY_MASK(level)    ~((_AC(0x1,UL) << 
>> MPIDR_LEVEL_SHIFT(level)) - 1)
>>     /* TTBCR Translation Table Base Control Register */
>
> Since only the definition of the MPIDR_AFFINITY_LEVEL() differs, maybe 
> you could add only this one to the arch specific headers e.g
> for arm64:
> #define MPIDR_LEVEL_SHIFT(level) \
>     (((1 << (level)) >> 1) << MPIDR_LEVEL_BITS_SHIFT)
> for arm32:
> #define MPIDR_LEVEL_SHIFT(level) \
>     ((level) << MPIDR_LEVEL_BITS_SHIFT)

Also, MPIDR_AFFINITY_LEVEL needs to be defined in arch specific headers 
as it differs between arm32 and arm64.

However, MPIDR_LEVEL_MASK can be defined in the common header (as it is 
same for arm32 and arm64).

Please let me know if it makes sense.

>
> But in any case don't forget to add parentheses around the macro 
> parameters when an operator acts on them to avoid trouble with 
> operator precedence (MISRA-C Rule 20.7 :))

Thanks for pointing it out. Yes, this is a mistake in my patches.

- Ayan


