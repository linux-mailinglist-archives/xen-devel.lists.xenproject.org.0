Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5112E619426
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 11:05:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437416.691778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqtZ8-0000ki-GJ; Fri, 04 Nov 2022 10:04:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437416.691778; Fri, 04 Nov 2022 10:04:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqtZ8-0000hb-DW; Fri, 04 Nov 2022 10:04:46 +0000
Received: by outflank-mailman (input) for mailman id 437416;
 Fri, 04 Nov 2022 10:04:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eNsf=3E=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1oqtZ6-0000hV-O4
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 10:04:44 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2071.outbound.protection.outlook.com [40.107.92.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1989be0c-5c28-11ed-8fd0-01056ac49cbb;
 Fri, 04 Nov 2022 11:04:42 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by BL1PR12MB5779.namprd12.prod.outlook.com (2603:10b6:208:392::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Fri, 4 Nov
 2022 10:04:37 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2%7]) with mapi id 15.20.5791.022; Fri, 4 Nov 2022
 10:04:37 +0000
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
X-Inumbo-ID: 1989be0c-5c28-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZpjFlv2QeQwOzXckYvWOLq9NMeMjwJzNW85Ots1EuDnxWTlHqAh1IonJE6z4FSga7C5l4MMqVobOAWAkIalMUshZnunLK5Um0/5FTwK1tBr/KdcYEuLJJcR52YHwPrB4NKTpZf4x7DWhkfdeCkLLqM3VRjQLFYo8alMEgnsplZ/HU2LTiZyL3s+ChqRYwg6chIpgvls607b88YSDUJ7mFflUXxhop5fe60PW5PiHdXXV4khO2YE1x3zBbgvz4WClavEUKopBUXZIVLuJxF2G6pythrkLvevB70z2TSrRA5Bu9nT2EmMjst6QxIWtFz5i2tRIt8Am+1dNLDJNZ9LNXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lokOpf9BQHJ/GFLVahv94vXVMyRytFigJ8lzl95c82o=;
 b=lxTv3a2L/9HCGV2znR+JTuLTjrM8Falg3xJ4VeTDoqQW3mI7yUPlPbxW15S6mJ2s5ANUGUTBCPHoqGx7uKjTj1aApiCWihW7POBrRBBgL8CgZweqb3MctRgmyWCUIrQBW23Vn9QdF7tYFz2XPxSWNWd4J9piCNuTdsZfq17wjdXav0AjgVVGWvEPxoiG8eqYZ4UiAlFb5rBEZcwZ5iZprKZOHHuqdsBEXZqqKENU5ztMn0DPrYo67qRZYWi2XAXBIOPQYdnqrp6KIkb99gX+2ZvCEaWxxlDmJTH+dLLCqvPTG0jywJ/hdD20BxbzI0LcXFLlyi3z39Ml/vKRlxIiJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lokOpf9BQHJ/GFLVahv94vXVMyRytFigJ8lzl95c82o=;
 b=IocHRY6D4O8fxX7NV+MzU1W5wDwznP0bcZvWhNJwOfjMqjsL0nyJ9ektSHvB+9fXlBa9RCK58L2AMxKYRA/S66iT29bek2vNeZMWq/JtVvmeo5DTMi/VAEOg4B38LJ/YNlvLqcLKbQi6LkfAoY1mwDRSDsSa9kM0J5CnCC7IfCU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <825bf5e3-1d74-3fc1-370d-71a09d0e0ccc@amd.com>
Date: Fri, 4 Nov 2022 10:04:28 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [XEN v2 09/12] xen/Arm: GICv3: Define GIC registers for AArch32
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com, burzalodowa@gmail.com
References: <20221031151326.22634-1-ayankuma@amd.com>
 <20221031151326.22634-10-ayankuma@amd.com>
 <dfdc0cfa-70ee-d591-bbb4-1b8426bafaab@amd.com>
 <b446b12f-4497-6ad4-551c-a60f1062e282@amd.com>
 <c1f3fee4-9262-d69e-9496-77581da6871a@amd.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <c1f3fee4-9262-d69e-9496-77581da6871a@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0419.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::23) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|BL1PR12MB5779:EE_
X-MS-Office365-Filtering-Correlation-Id: e7b7385e-9c35-4eb7-9dfd-08dabe4bfb07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JSY4xpCe/B7AQb6MQJVuTBtDLmy09OlvJSxgq4gtQImDZatPV8R7P0jKOoql1hf/hWuj/GtLQAFqISUeeStJLuV6P29hY0GOutBKvLxzsKmQEl1FNNVLL2Tymzl95i8GjBPegJ7+X9SY3WkZX4vjeWdBWcPF7+AkhEbtu72MT0k5nqmPFXKetprDUqEWfJHpIaP4g1iqbb9JzAfEVu2z7JpSSqCg2xeVaS6dwahMe3vfBIqypWT4pXP0A6wmji2QlpO234HrhHP1iG9HIQRnYxL1ZtDAM2Z+IONNOKyeETdpK9jn1mW/xhSiAg9kYQ0ZmNgCn/xwyKrsRiKqSmTcb8quj1mx2H487UCCKdwfXDfvIEBntbBM6ELUezu8CuCTDUHXmHgaefnmmizI0CiE0upcAaEJGZA9Uhk0WAWHQXRr62Rvl8axfTLmA98NYrDVVKuP8/USRb4fkJtFr0m5rjaZC9ANSkAdvUVRXj7eKDnJg8xaPWVLILVgYYk8s2IUAurEuruf5uMVdyJv3VXpViji/Xirn3/ipMR//cH5GiAFM75WbkH1508WBpxfeEOdIZylit9aguRnZu/eiaTVT2yIQ+hdS3D3qzB0xcIl3fJcJbj9bultzEv1yhyEzGS16+uPuH9MhU76hG9vLGud9bY/oD11L9+3t35MhHIh+II5dhWpPY5Wfl87dkVj3jFqrgoFQUcoUDDAx1HUbf1jFwl7vTVbRKbjdkPG4HEUWEsJqx1ZymuJw3DEYIApTminqz+/OAak78QZK6r7ftOosnMkaE1usMxWBTJZNFLYegM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(39860400002)(366004)(396003)(136003)(451199015)(83380400001)(31686004)(186003)(5660300002)(2616005)(41300700001)(31696002)(8936002)(2906002)(66556008)(6512007)(26005)(66476007)(53546011)(38100700002)(6506007)(6486002)(36756003)(316002)(6666004)(8676002)(4326008)(66946007)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHRxd0NWVzl6N3FscVRUUld0SlpZRVpRRW95WHRWRTRmWWhZdjd0WE80OHdP?=
 =?utf-8?B?enFiVHJDTjlvSUJHQVJhQytROUNrT3ZNWkt2NnVJWVhPdTMxUm5NaGpzZHo4?=
 =?utf-8?B?cVZiYXhzeTBvSmFMcElGN3JURTRiczFrY0VVNVEwNllVSTB1czR5U3c3RGlq?=
 =?utf-8?B?b1dub3BoS3MweVNGZnhVTTkzWjQwNDZOU01ZM2g3OTZsUlhkY0FkNFk2Y0s0?=
 =?utf-8?B?cG5jdi9ieFpNajB6MlZhRHBnRkp6eW9JVnBuK2ZNM1NWTFlaUGs4WkM0VkR6?=
 =?utf-8?B?U0ZqWjBjS1BWZE1aSzFveUc0WTJNWFEzR3RPMzJ4SzBOOUFIMGd1MDRSRHhT?=
 =?utf-8?B?RExIamRvY2lKV3B3RktyaGtJcVZwZWxFNVQwUmlXVmRkTklWV0JVTHAyUE9p?=
 =?utf-8?B?bVcxenE4RlRvb05GQUVuREJDUk9YMVU4dTJxc0NYcEtyVVFROUtnanJhdG1E?=
 =?utf-8?B?SUN3VXVlUTh3cktKYlhveFJOdE5hN0R1Qk5iVjNUeEk2S1FjZk9STjVmbXov?=
 =?utf-8?B?MW05cXRsNDhOSDd6ZFkxbTZ6R0VlbjVybHdnNm9WQU5hQlFydDJWOWwzcGFu?=
 =?utf-8?B?Z0prRy9tVGh3Q1duODFiT3MxSWhnZjQ3SW4vdHpNU2tXdXpZWmJkOGRoTHNW?=
 =?utf-8?B?VWJ1c2Zrc01QS3FIRks1WDY1VWtkS0VuTXA5T3pPZ3I1TnV0bmQvMnZaNkcr?=
 =?utf-8?B?YWZFeDgzZGoweGR0REhHSkxMMTdsMGlhN2hhRW9uZUsvUWZVcXNrMVFiV29q?=
 =?utf-8?B?VXpLc2ZMa0FGc0NkOVNwVVZtRVdhL3JNdHZzaEw1RzN2NjcyT0x5aVZtZlQy?=
 =?utf-8?B?YktSTXdXazZIakJrOExKeHZSaWo0T3p6b1lBakM2TDJWTmlRMU5YdTJFQVZU?=
 =?utf-8?B?cnlSRTg5N2I1TWtHaVd5TGNxR0loZ3RLbVI2TWRTUG9ORWxvMmNMSDFUMGtm?=
 =?utf-8?B?SGc3WWFLdSsxRFN0SWJIQVE3cThFQXl6aVczU3FrSUsvaTc3WHdRUmgwNDdV?=
 =?utf-8?B?eFVWeTRhRzlUWFRYNENVUGc1MUNrUm0wVVN1bHFvVE1NMHVVbWc1djVSQkxa?=
 =?utf-8?B?UnJYMFVJV0hyREozK0picnZ6dmQrelhYWEhsUDJJRkVSS2Z1UHhoMXBpaU4z?=
 =?utf-8?B?RHdLcDF3WkJ6blE2R2xyRnZacEVvLzRKaGh6VG5RckcyblB5dmZFeTlJWTZM?=
 =?utf-8?B?RGZvdm5sSFZGMnZuZW5YKzc2WDllUFBXMWFGeGY5cUJ4dFR2V3JpVUtQdDZO?=
 =?utf-8?B?czlvTStwWStuZitGNSt1aHdrNDlaT0hkcWlqUUJTWW1kU3VuNlJUUE5Lb2hj?=
 =?utf-8?B?bDNrQ3VWMEhtV0c5NUtGVE53cFZleXlkNHhhdzc4OFp0WlFlSHpuTi8rRVMw?=
 =?utf-8?B?UHNIaGduWnlHMmdDQlpxUG9QcGt0NzEvK2FaZ2tpcjBqbTZiTmtpS0kvdkEr?=
 =?utf-8?B?T2RFSkp1bXdXamlxRjlUYmZvT3oyTUljY3dIdFhtNkhkbHdoLzFyZzZSVU11?=
 =?utf-8?B?Q3RmT21CNHlRSm5sbkNRcUExbTA1eVB3MzV6NGpaSTI3RVh2ZW50OWV3ci9i?=
 =?utf-8?B?RnZndTdtVTVueXFRZnBzeUVyamtGTWdCc2FRUjlnTEQ3aEVFUHJ0ajZDcmFs?=
 =?utf-8?B?SWIrRE5LQm5NbnpIS1pRRVVTcnJRdTF4VmtTU1loUFRueklSUVpiR0gvV2Rr?=
 =?utf-8?B?dGV3eUg0Rkw0UXpFN09nTkZFTjNqNkxKMkErUksvTkxmbzFhUUlKeXk5MUh0?=
 =?utf-8?B?VHlxb0xYWk0ydjdrVGxDUXJZQUx3YldaOWxQVGx6R1UxZDZ0Nk9jMURHTDNU?=
 =?utf-8?B?U1l3QjE0NllDRElxSy9CR2kxcXBPV1RxZUJXYnlTWDhaTDM0a2NDT1Q2TFlB?=
 =?utf-8?B?NDRVUHVCWjUwcG0rQy9iZzdZZkN2QUpyR1R2bTlZWTBDR01WWUhERWlsWDhH?=
 =?utf-8?B?TkxrYTR5RkkwOFFmN0lIQmZyd0tyTFZ1RzFUMVFvaEFZeG9VUEZ4Z2c2S1VX?=
 =?utf-8?B?MUYvNGdLZWw1bEJ0UTRGcHpVYWZHWFdiQkdKMnowMWs5amcwQkU4bDVnYk9G?=
 =?utf-8?B?bHhMd2ZmTGd4SWhNR1FGLzRveHF1Y1VmQjF1UzIxeXJzVmgvUXg4TS9kMTVu?=
 =?utf-8?Q?k/GNs7CMNixeIvEq/6YidbeNk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7b7385e-9c35-4eb7-9dfd-08dabe4bfb07
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 10:04:37.1938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1iY4t2Uz8ub2pLtVlwuPVdspVT9XBR8sqiFwkMQE6qXRvtObEevUgQWwszgSySceM2GXOxlrFTHDUY9AmtVQkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5779


On 04/11/2022 09:27, Michal Orzel wrote:
> Hi Ayan,
Hi Michal,
>
> On 03/11/2022 21:14, Ayan Kumar Halder wrote:
>> On 03/11/2022 15:08, Michal Orzel wrote:
>>> Hi Ayan,
>> Hi Michal,
>>> On 31/10/2022 16:13, Ayan Kumar Halder wrote:
>>> The title is a bit ambiguous given that the previous patches were also defining GIC registers.
>>> Maybe adding "remaining" would result in a better commit title.
>>>
>>>> Refer "Arm IHI 0069H ID020922"
>>>> 12.5.23 ICC_SGI1R, Interrupt Controller Software Generated Interrupt
>>>> Group 1 Register
>>>> 12.5.12 ICC_HSRE, Interrupt Controller Hyp System Register Enable register
>>>> 12.7.10 ICH_VTR, Interrupt Controller VGIC Type Register
>>>> 12.7.5 ICH_HCR, Interrupt Controller Hyp Control Register
>>>> 12.5.20 ICC_PMR, Interrupt Controller Interrupt Priority Mask Register
>>>> 12.5.24 ICC_SRE, Interrupt Controller System Register Enable register
>>>> 12.5.7 ICC_DIR, Interrupt Controller Deactivate Interrupt Register
>>>> 12.5.9 ICC_EOIR1, Interrupt Controller End Of Interrupt Register 1
>>>> 12.5.14 ICC_IAR1, Interrupt Controller Interrupt Acknowledge Register 1
>>>> 12.5.5 ICC_BPR1, Interrupt Controller Binary Point Register 1
>>>> 12.5.6 ICC_CTLR, Interrupt Controller Control Register
>>>> 12.5.16 ICC_IGRPEN1, Interrupt Controller Interrupt Group 1 Enable register
>>>> 12.7.9 ICH_VMCR, Interrupt Controller Virtual Machine Control Register
>>>>
>>> As said in the previous patches: this may be my personal opinion but sth like this would be easier to read:
>>> "
>>> Define missing assembly aliases for GIC registers on arm32, taking the ones
>>> defined already for arm64 as a base. Aliases are defined according to the
>>> GIC Architecture Specification ARM IHI 0069H.
>>> "
>>>> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
>>>> ---
>>>>
>>>> Changes from :-
>>>> v1 - 1. Moved coproc regs definition to asm/cpregs.h
>>>>
>>>>    xen/arch/arm/include/asm/cpregs.h | 16 ++++++++++++++++
>>>>    1 file changed, 16 insertions(+)
>>>>
>>>> diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
>>>> index bfabee0bc3..62b63f4cef 100644
>>>> --- a/xen/arch/arm/include/asm/cpregs.h
>>>> +++ b/xen/arch/arm/include/asm/cpregs.h
>>>> @@ -415,6 +415,22 @@
>>>>    #define ICH_AP1R1_EL2             __AP1Rx_EL2(1)
>>>>    #define ICH_AP1R2_EL2             __AP1Rx_EL2(2)
>>>>    #define ICH_AP1R3_EL2             __AP1Rx_EL2(3)
>>>> +
>>>> +#define ICC_SGI1R_EL1             p15,0,c12
>>>> +
>>>> +#define ICC_SRE_EL2               p15,4,c12,c9,5
>>>> +#define ICH_VTR_EL2               p15,4,c12,c11,1
>>>> +#define ICH_HCR_EL2               p15,4,c12,c11,0
>>>> +
>>>> +#define ICC_PMR_EL1               p15,0,c4,c6,0
>>>> +#define ICC_SRE_EL1               p15,0,c12,c12,5
>>>> +#define ICC_DIR_EL1               p15,0,c12,c11,1
>>>> +#define ICC_EOIR1_EL1             p15,0,c12,c12,1
>>>> +#define ICC_IAR1_EL1              p15,0,c12,c12,0
>>>> +#define ICC_BPR1_EL1              p15,0,c12,c12,3
>>>> +#define ICC_CTLR_EL1              p15,0,c12,c12,4
>>>> +#define ICC_IGRPEN1_EL1           p15,0,c12,c12,7
>>>> +#define ICH_VMCR_EL2              p15,4,c12,c11,7
>>> I did not check this in previous patches but in which order are you defining these registers?
>> My bad, I did not follow any particular order.
>>> I took a look at arm64/sysregs.h and these regs are placed in assembly aliases name order.
>>> So for instance ICC_PMR_EL1 would be defined before ICC_SRE_EL2, etc.
>> This makes sense. I will fix this in v3.
>>> Also, I cannot see some regs like MISR, EISR that are defined for arm64. Did you decide not to define them
>>> for arm32 because they are not used by Xen?
>> Actually these registers are not being used by arm64 as well. A grep for
>> "ICH_MISR" or "ICH_EISR" did not return any usage of these registers
>>
>> ayankuma@xcbayankuma41x:/scratch/ayankuma/upstream_xen/xen$ grep -ri
>> ICH_MISR *
>> xen/arch/arm/include/asm/gic.h:#define GICH_MISR       (0x10)
>> xen/arch/arm/include/asm/gic.h:#define GICH_MISR_EOI     (1 << 0)
>> xen/arch/arm/include/asm/gic.h:#define GICH_MISR_U       (1 << 1)
>> xen/arch/arm/include/asm/gic.h:#define GICH_MISR_LRENP   (1 << 2)
>> xen/arch/arm/include/asm/gic.h:#define GICH_MISR_NP      (1 << 3)
>> xen/arch/arm/include/asm/gic.h:#define GICH_MISR_VGRP0E  (1 << 4)
>> xen/arch/arm/include/asm/gic.h:#define GICH_MISR_VGRP0D  (1 << 5)
>> xen/arch/arm/include/asm/gic.h:#define GICH_MISR_VGRP1E  (1 << 6)
>> xen/arch/arm/include/asm/gic.h:#define GICH_MISR_VGRP1D  (1 << 7)
>> xen/arch/arm/include/asm/arm64/sysregs.h:#define
>> ICH_MISR_EL2              S3_4_C12_C11_2
>>
>> ayankuma@xcbayankuma41x:/scratch/ayankuma/upstream_xen/xen$ grep -ri
>> ICH_EISR *
>> xen/arch/arm/include/asm/gic.h:#define GICH_EISR0      (0x20)
>> xen/arch/arm/include/asm/gic.h:#define GICH_EISR1      (0x24)
>> xen/arch/arm/include/asm/arm64/sysregs.h:#define
>> ICH_EISR_EL2              S3_4_C12_C11_3
>>
>> As I see, they seem deadcode for me.
> Macros are preprocessor constructs whose content is replaced whenever the name is used.
> I would not call this a deadcode as this is not something that can be executed.
> If a macro is not used, its content will not appear in the actual code.
This makes sense.
>
>> Do you suggest that we should remove them ? If so, I can send a patch
>> for this.
> This is a question to maintainers.
> Bare in mind that we really have a lot of unused macros in Xen codebase.
> IMO, if we decide to remove them, this should be done in a single series,
> so no need to add another additional patch in your series, especially if you
> are not modifying this code directly.

Yes, I will keep these macros intact (as it exists).

WRT your question "Also, I cannot see some regs like MISR, EISR that are 
defined for arm64. Did you decide not to define them

for arm32 because they are not used by Xen?"

These registers are not used by Xen.
Should I define these registers for the sake of completeness (to be in parity with AArch64) ?

- Ayan

>
>> - Ayan
>>
>>> ~Michal
> ~Michal

