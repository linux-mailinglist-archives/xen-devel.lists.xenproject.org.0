Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C01F7618975
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 21:14:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437031.691357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqgbO-0004XZ-GQ; Thu, 03 Nov 2022 20:14:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437031.691357; Thu, 03 Nov 2022 20:14:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqgbO-0004UU-Cw; Thu, 03 Nov 2022 20:14:14 +0000
Received: by outflank-mailman (input) for mailman id 437031;
 Thu, 03 Nov 2022 20:14:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1oGb=3D=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1oqgbM-0004UO-AY
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 20:14:12 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2046.outbound.protection.outlook.com [40.107.243.46])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12fdfc35-5bb4-11ed-8fd0-01056ac49cbb;
 Thu, 03 Nov 2022 21:14:10 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by CY8PR12MB7148.namprd12.prod.outlook.com (2603:10b6:930:5c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Thu, 3 Nov
 2022 20:14:06 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2%7]) with mapi id 15.20.5791.022; Thu, 3 Nov 2022
 20:14:06 +0000
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
X-Inumbo-ID: 12fdfc35-5bb4-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KY8qVKdpm+9Z0RwmPKEP0xPhB5/k6JbIUiSax6PLCD/HsyLrLi3hBS4YRl/zSDhwy86YSZ51ol0vQMSAjPBmwQ1T4A43bjCbBqL9VT1qOezyzwh17yQIh4W4+cckI4Mrt9XpTN6BvVnaQH1FAnMwwAscUWrgmVLCXEq8ti9ltu+oKAakEmIx7E7xcC1YBfmq2uUUM4+M16GiRS/X3LS4th2WgyTMjPQHXB44Nz9eGZNvbGsKUWxOn7OUCQ/CjPOk2xWjRpv4PtHZr6VH2PPPLT13STbva/T6uI8eYwRAOQ+MMIh1wrYeyNsa1A0s+GpzPsouSpxMuDwevm9Dk2hy3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oM+niLR18nMnodEP/UieSjbRtcSxSxYLgGH07V9S5Xk=;
 b=HL2iheRR5ACIk7oqR4FawNqLEJ85NmDtQNmabXOKNizJBPQr1mWTECJuw64T6JMQoL2k2DA0KGKrHoDsX2RnNXzYRbNWMWiAiwSjVfIh13visnVXosRO3d9uht7/K1NpfW1WRscGea5u8jFEHzEJAgvNDDwEwmSIl1HC/iHUy8dWfNpfb89qwqrZmzoOqw8bGm240HwG0udo/0eh8RLamC0r9bp9CaL5AAejidtT2Fya6duUHsTiBSRHekUo5bPoU+cKWYpS6RTLlkC0/nUzl2fj3Im/qxYBMMbJqKizcJB53H5V+CAV/4I2tR/Cq+LS0xXHQ4mz3tmDgfHYiDA2JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oM+niLR18nMnodEP/UieSjbRtcSxSxYLgGH07V9S5Xk=;
 b=x9E1fYMfOhyhVg7Z1ZonQCnexkX6wBJ12f+CGlz8gen0Tex/kc8hmfdlgr5q6h9YfF+gr2BGEngxzkzOwnCVVhgSmXY93BrG3Z6MT8axiTJBSmF/aaR5ewT0ixuqD4E6ULnSNJ2OwM8MfquYEIqzh8pvbS/8YiWHOXjp+LKCPWY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <b446b12f-4497-6ad4-551c-a60f1062e282@amd.com>
Date: Thu, 3 Nov 2022 20:14:00 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [XEN v2 09/12] xen/Arm: GICv3: Define GIC registers for AArch32
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com, burzalodowa@gmail.com
References: <20221031151326.22634-1-ayankuma@amd.com>
 <20221031151326.22634-10-ayankuma@amd.com>
 <dfdc0cfa-70ee-d591-bbb4-1b8426bafaab@amd.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <dfdc0cfa-70ee-d591-bbb4-1b8426bafaab@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0566.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::16) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|CY8PR12MB7148:EE_
X-MS-Office365-Filtering-Correlation-Id: e21dd235-e439-4f2f-fea7-08dabdd7f52f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N0h82RPVFNRcTyHJwOLJZ2Cpm1gAx+p0rkXMtQ4SEgYcDYBDpHxiun6woxvlJnoaRWactHS05rPCMlbeRulVDtq74zBK0zQMyjm7dKaWl6bmCnmDeqrozxxmSd9YfopjmviT/R777VFp+BcXM7eoVMRQZbtiZqO+NPd1SJlKi99/CTNOXPklbaISNZ/9VMXdV1VKkK+rK46rMXte7TYF+q/2giWT0PqSKC9aauqCpbI8GXnjE8Cauem3BE1KfFXbvMJtvGzFrBMVbqAlqz24Mj4clZJGWUE/iaGbZtXoCuzvyuxKmbec7OvXNpHpPh9JG0qsInLPShhEi+gtqfkB12c/3eb9ncaxIwnuRoE4kBcEoIZ9qPhUjrQ7+91nWDk/d+Z2gNDnXeDrkPk1i1Vphcm2neP7GpcieCpn3igXbJXfPgZcRINVaxxpjucW4NuNZT/xZf/YC92JRnfdXGaNKYpQ3B2rtnwWwa2N2vx664qVhXvOcwPqPvlz132QP/yDkdtq69vl2e/1loD1/plNQICPQT7RS5UAypEFVeeYTcvT0m9KvuFNhJfR8Cy2OsyZvu7/sLr17jia+OupHvP/JlWuWfYpMrBATRswHebooi80DK+1IjLlbHClhWXIFAIoa7J3v4DcWJDZ7MljO+a5WySaulDoqv1q577TFRaLJ5x7gVDcZ7z3L2XWehj4W9dlOJt8h2aJJk85CH+Ja5+4Z69lhI5kPX6bbHKqCBAOXlfO6KbzCxCqw7uDZ2r4IaDmUrToNHCOyBbtAasW93roG9bFcv0+aS6WfW0H9JjbirE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(376002)(396003)(366004)(346002)(451199015)(6486002)(83380400001)(478600001)(6512007)(31686004)(31696002)(8936002)(26005)(5660300002)(2616005)(2906002)(38100700002)(36756003)(316002)(41300700001)(53546011)(8676002)(66476007)(6506007)(66946007)(66556008)(186003)(6666004)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGszSjFkeGJVU3NReW1aSHczTXVUL2tMS2lwR2xobFBXdnp0bFRITk5zVkpM?=
 =?utf-8?B?Y0FIUGVrQnpGU1F2b2tjOXBZbG5YTUUzTUI2N1NFUW5tOU9kWnJrcHh2WEhS?=
 =?utf-8?B?RlR6SlM1NE9tQ25wUDlOMHlJdlZVRnpneUM2R1YxTlRDZU1MaFp0Y3lJWFRX?=
 =?utf-8?B?OGR2WVVJOWlvUzVEaThpM2VXWE9abEJvMzFYazV0azNjMzQrUUNiZmc0ZjJN?=
 =?utf-8?B?d2E5dVp6TWRZNHdsaWNNR0k4NDVoQWtCUnliQjdzUHIvYVRoQklaZ1ZDUlp0?=
 =?utf-8?B?cnVTdjNnLytnZlRLVklNSklYb05lT0srT25XMDlQZHo1aTN5RDJjbENBdWY1?=
 =?utf-8?B?c2ZNUzVWZXJaK2pMcjJrVW5VK1AvVERBWWFVT3ZKanR2QUtmcGYxWllkMWN6?=
 =?utf-8?B?b0cwZG5jMko4aVpjSTl1aVJOTTliQUx3T0FabDkwTjJZZkZCRGtPcEUreHJL?=
 =?utf-8?B?aVB2dTNNZVZSZVpmMy9hK0RyNVJwMUhvZzZLMUpDQzBuSW51ZWNmSTVsd2ZP?=
 =?utf-8?B?ZU9FemNjMFg5ZXR3ejVvQzdyUm10dWRIM3RVTlIxMXA1YjBRd2FXN2pZclJP?=
 =?utf-8?B?QXZPT09qSmo4TnFrcEFMTWwxU0tCTFBKUkRaZjk1b1pDcGtaZE0rTFVPazdG?=
 =?utf-8?B?bnhOalhDSksvYStlb3Y2OFNJV2pDaE50Ym93MjV1SWxEZjdYaEZjRzJCTnNT?=
 =?utf-8?B?aDBQSTN6aEVHemVSdlpBdTQ4TklmL1lkNXl6Lzhlc1pzTkszMUF6MGtKZkJm?=
 =?utf-8?B?K2laeGtHc0hsVVNQd3FLeDZYVWY5Rmxkc1FudEpSWnNMRGpnSkRtbUVCNDUw?=
 =?utf-8?B?ZDUvRTJuT2tBZ3o0MjRvYWtjdHUyTXFiNDlNRk82MDE1SmxLb1VUUDQ4RGZr?=
 =?utf-8?B?YmU1d3ZnZURoZ3NiTFBCY1c2QkM3U0NZSnpvWk5tTExsVStYRnViZVV1S005?=
 =?utf-8?B?TGNsTGpvWWZwUFVhSk1mM0JUMUtQSGRVMFhVTkJ2TWJLTEpWS1F0d2wydzNX?=
 =?utf-8?B?RGlHMzJWaWJOTTdJWWczZjE5djc1UFBnODA1amp3S3BoOHg2YWdlQ0tabW9Z?=
 =?utf-8?B?djFKWThxQVlpSll5d2lPelVIaVl6OVFINkZLYitsSnBuODBNcE5SMTlFN0xK?=
 =?utf-8?B?enpIQ2tFa3pDUkMvMnBrMkJoVW04Ynl0ZmtJQkc1eUd1WmFkMVo2c0hoTGMy?=
 =?utf-8?B?ZW44Q3lGN3krSmlzVWJuTXlrWUxhZmpHMDBPZ0kyZWpQMnlpcnd6eHJCYytl?=
 =?utf-8?B?eHVsWjBmK3g3ZWlsSFBJUHlqU0tQUENBMHFUa2pQQVNpQVB0M2NVa0NRaUtl?=
 =?utf-8?B?cnJ4Y0JHci9ORW15ODRwQUR3Z0FoOXk5QkhJNVF3bUpCOGwzWnUvNC9ReUsv?=
 =?utf-8?B?RDhpdkw5TGEwdW5PSVl6V1k2ZkhEVUJBVlpHUktyYUNzNXgvNTZ6enZXVWFl?=
 =?utf-8?B?TFdGMzNqQ05aeFVuL24yV0JQNGFJanAwWGFsUzlGbTM1QlMvTm9Hb2VKZ084?=
 =?utf-8?B?S3NkT0tYVE9xMGF5Qm81djl3bHBlL21pa0pvdG15WHBLZXhSR1NSMlF4QWxm?=
 =?utf-8?B?WGJEYWg2TlQ0blAzbXExRjVFOGR5czVDbGtZdlNHTERtV1dVc2pnTDNpOURw?=
 =?utf-8?B?WXVVcTZxOUo5ZWFBejczTlNFTHY2UFk4bEc0WVE3MEJmWVV5UERJNFpIT2Y1?=
 =?utf-8?B?ckZMRjBReW9pMllhdXFkZHgyQWtRR1FCSW9YQWtGMGRrUVBiQWI4ZzB5dmpF?=
 =?utf-8?B?bU1UNVBITi9vMkhUZEdSdnJWU2I1OTQ3cGlCUmNlVzBvNDMzNnJlT011KzY1?=
 =?utf-8?B?RDZMT21BTDJ4S0tBSEU3M3BOaVc0MWRhZFJWVE9RTmVLTUsxMHpUMUZoT2Fs?=
 =?utf-8?B?SEdBUUJ2QU1YcVpRUkFKNDJiaklFb2syeDhyNGE1T0RXZ2ZPT0pqZXJYQmRN?=
 =?utf-8?B?WUVPSzA1NGZ4ZmZlUXh5NVpnbHBZNitEOVBOY2lqSlBDOEw3cFA0MHc0SU1M?=
 =?utf-8?B?N2FEZmJpQis3aDk1Q29SZlVoMmo5ckJVK1NTN2FNSktWQzNiZmFnOE5mL2Q3?=
 =?utf-8?B?QkNRaytIYndBc0ROTERyRS8wRlEzZzNLOTRPM1BSaW5XRXVBZGVYRG8zK2Zj?=
 =?utf-8?Q?iO8pweU1/PCjv6mJpmxBFJJbJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e21dd235-e439-4f2f-fea7-08dabdd7f52f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 20:14:05.9590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LhAsEWS+xwdbg5rBDk9LkHuKKmyvqP4ak0coBrXWMqvU1cpQPts9tTH8IN/15O3/4E4D+dSOr4XkoFIHpqecnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7148


On 03/11/2022 15:08, Michal Orzel wrote:
> Hi Ayan,
Hi Michal,
>
> On 31/10/2022 16:13, Ayan Kumar Halder wrote:
> The title is a bit ambiguous given that the previous patches were also defining GIC registers.
> Maybe adding "remaining" would result in a better commit title.
>
>> Refer "Arm IHI 0069H ID020922"
>> 12.5.23 ICC_SGI1R, Interrupt Controller Software Generated Interrupt
>> Group 1 Register
>> 12.5.12 ICC_HSRE, Interrupt Controller Hyp System Register Enable register
>> 12.7.10 ICH_VTR, Interrupt Controller VGIC Type Register
>> 12.7.5 ICH_HCR, Interrupt Controller Hyp Control Register
>> 12.5.20 ICC_PMR, Interrupt Controller Interrupt Priority Mask Register
>> 12.5.24 ICC_SRE, Interrupt Controller System Register Enable register
>> 12.5.7 ICC_DIR, Interrupt Controller Deactivate Interrupt Register
>> 12.5.9 ICC_EOIR1, Interrupt Controller End Of Interrupt Register 1
>> 12.5.14 ICC_IAR1, Interrupt Controller Interrupt Acknowledge Register 1
>> 12.5.5 ICC_BPR1, Interrupt Controller Binary Point Register 1
>> 12.5.6 ICC_CTLR, Interrupt Controller Control Register
>> 12.5.16 ICC_IGRPEN1, Interrupt Controller Interrupt Group 1 Enable register
>> 12.7.9 ICH_VMCR, Interrupt Controller Virtual Machine Control Register
>>
> As said in the previous patches: this may be my personal opinion but sth like this would be easier to read:
> "
> Define missing assembly aliases for GIC registers on arm32, taking the ones
> defined already for arm64 as a base. Aliases are defined according to the
> GIC Architecture Specification ARM IHI 0069H.
> "
>> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
>> ---
>>
>> Changes from :-
>> v1 - 1. Moved coproc regs definition to asm/cpregs.h
>>
>>   xen/arch/arm/include/asm/cpregs.h | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
>> index bfabee0bc3..62b63f4cef 100644
>> --- a/xen/arch/arm/include/asm/cpregs.h
>> +++ b/xen/arch/arm/include/asm/cpregs.h
>> @@ -415,6 +415,22 @@
>>   #define ICH_AP1R1_EL2             __AP1Rx_EL2(1)
>>   #define ICH_AP1R2_EL2             __AP1Rx_EL2(2)
>>   #define ICH_AP1R3_EL2             __AP1Rx_EL2(3)
>> +
>> +#define ICC_SGI1R_EL1             p15,0,c12
>> +
>> +#define ICC_SRE_EL2               p15,4,c12,c9,5
>> +#define ICH_VTR_EL2               p15,4,c12,c11,1
>> +#define ICH_HCR_EL2               p15,4,c12,c11,0
>> +
>> +#define ICC_PMR_EL1               p15,0,c4,c6,0
>> +#define ICC_SRE_EL1               p15,0,c12,c12,5
>> +#define ICC_DIR_EL1               p15,0,c12,c11,1
>> +#define ICC_EOIR1_EL1             p15,0,c12,c12,1
>> +#define ICC_IAR1_EL1              p15,0,c12,c12,0
>> +#define ICC_BPR1_EL1              p15,0,c12,c12,3
>> +#define ICC_CTLR_EL1              p15,0,c12,c12,4
>> +#define ICC_IGRPEN1_EL1           p15,0,c12,c12,7
>> +#define ICH_VMCR_EL2              p15,4,c12,c11,7
> I did not check this in previous patches but in which order are you defining these registers?
My bad, I did not follow any particular order.
> I took a look at arm64/sysregs.h and these regs are placed in assembly aliases name order.
> So for instance ICC_PMR_EL1 would be defined before ICC_SRE_EL2, etc.
This makes sense. I will fix this in v3.
>
> Also, I cannot see some regs like MISR, EISR that are defined for arm64. Did you decide not to define them
> for arm32 because they are not used by Xen?

Actually these registers are not being used by arm64 as well. A grep for 
"ICH_MISR" or "ICH_EISR" did not return any usage of these registers

ayankuma@xcbayankuma41x:/scratch/ayankuma/upstream_xen/xen$ grep -ri 
ICH_MISR *
xen/arch/arm/include/asm/gic.h:#define GICH_MISR       (0x10)
xen/arch/arm/include/asm/gic.h:#define GICH_MISR_EOI     (1 << 0)
xen/arch/arm/include/asm/gic.h:#define GICH_MISR_U       (1 << 1)
xen/arch/arm/include/asm/gic.h:#define GICH_MISR_LRENP   (1 << 2)
xen/arch/arm/include/asm/gic.h:#define GICH_MISR_NP      (1 << 3)
xen/arch/arm/include/asm/gic.h:#define GICH_MISR_VGRP0E  (1 << 4)
xen/arch/arm/include/asm/gic.h:#define GICH_MISR_VGRP0D  (1 << 5)
xen/arch/arm/include/asm/gic.h:#define GICH_MISR_VGRP1E  (1 << 6)
xen/arch/arm/include/asm/gic.h:#define GICH_MISR_VGRP1D  (1 << 7)
xen/arch/arm/include/asm/arm64/sysregs.h:#define 
ICH_MISR_EL2              S3_4_C12_C11_2

ayankuma@xcbayankuma41x:/scratch/ayankuma/upstream_xen/xen$ grep -ri 
ICH_EISR *
xen/arch/arm/include/asm/gic.h:#define GICH_EISR0      (0x20)
xen/arch/arm/include/asm/gic.h:#define GICH_EISR1      (0x24)
xen/arch/arm/include/asm/arm64/sysregs.h:#define 
ICH_EISR_EL2              S3_4_C12_C11_3

As I see, they seem deadcode for me.

Do you suggest that we should remove them ? If so, I can send a patch 
for this.

- Ayan

>
> ~Michal

