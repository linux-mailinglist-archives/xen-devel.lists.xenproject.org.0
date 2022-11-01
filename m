Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B772A614619
	for <lists+xen-devel@lfdr.de>; Tue,  1 Nov 2022 09:59:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.433372.686346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opn6M-0004JP-Do; Tue, 01 Nov 2022 08:58:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 433372.686346; Tue, 01 Nov 2022 08:58:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opn6M-0004Hc-9n; Tue, 01 Nov 2022 08:58:30 +0000
Received: by outflank-mailman (input) for mailman id 433372;
 Tue, 01 Nov 2022 08:58:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b9ZH=3B=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1opn6J-0004HW-Vr
 for xen-devel@lists.xenproject.org; Tue, 01 Nov 2022 08:58:28 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2077.outbound.protection.outlook.com [40.107.212.77])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57fcfda4-59c3-11ed-91b5-6bf2151ebd3b;
 Tue, 01 Nov 2022 09:58:25 +0100 (CET)
Received: from DM6PR18CA0002.namprd18.prod.outlook.com (2603:10b6:5:15b::15)
 by CH2PR12MB4071.namprd12.prod.outlook.com (2603:10b6:610:7b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Tue, 1 Nov
 2022 08:58:22 +0000
Received: from DM6NAM11FT100.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:15b:cafe::ee) by DM6PR18CA0002.outlook.office365.com
 (2603:10b6:5:15b::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15 via Frontend
 Transport; Tue, 1 Nov 2022 08:58:22 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT100.mail.protection.outlook.com (10.13.172.247) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5769.14 via Frontend Transport; Tue, 1 Nov 2022 08:58:22 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 1 Nov
 2022 03:58:21 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 1 Nov
 2022 01:58:21 -0700
Received: from [10.71.192.110] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Tue, 1 Nov 2022 03:58:19 -0500
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
X-Inumbo-ID: 57fcfda4-59c3-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JauM+JLftHdMKWSjuM7HxcIocdigQYqt80qduB5yjvYmEza5maZMrcvbaDuJhdOScXRuZ/moDUP4wZf5dWFcWCvKAoHPmJ4HhrqDBNlFkRV5TVjukDhy8EBss/Q61H40DGO2UIXy/H+f/dkc/8DQfl2FHXFgtn0Ym8UWGSzSlX+s6RWLqFB9D//GJnwY5wg3jhw9FXiyT+6viuOzMeguQSxoDE0EtDBlG3pVa52eNG2eX0iHRJwamJQTaGyrsqoI8bBJMfgiEHC1BgLt9u3nns2OGk+bRh0vm8OH8K7AmcJKvdxZFwMl4sptkpPe10tt2P+IpNrxLYg+45g4gQBowg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ihZ6D3XwiQaBzze2onm8m0Z/6iwE3d4+vSCAl91VIEo=;
 b=OOQulLRqrRDfwKAu4AxnH+PM8/98pHjdurxVQ8wBxdGdjkkMmDZ2ZNXNZWWupjlS+xKdVmyZw6kwBtFlTzE0ef6z/IVJ5Fhl1c03ZtpiwdNwALPra/n+5bgUZfixMXypBoNqgXyL01P3g6mmCHa4mobxbCmfUK5Fr5ALJupkOvmY1bKFcGGSfTbtz4WfpDktZyOEMBBQ4l/wB5uzROJRt6ssEhsf8TQsIUtSaaq33BClFPYg26CrMSG/ocwHv3tb5ItIzFkD6CXRX/k08bZOCQrOrVqRlwZu1xYo6oj7T1eBEPO1UG8opO7tqpJ+Y+aquWVLBdUEc6QxIVbjgETUzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ihZ6D3XwiQaBzze2onm8m0Z/6iwE3d4+vSCAl91VIEo=;
 b=4RNH2Owvw6hxsNl+UjTQ4KDJiOhvqwBrdy1Z0LTVmeK0CGe/fhtSCwVRReBaSagwyf/sDFkpJG7xYGXsQCS3Vy82VFjQ/f4JtVlMMi3PfFeopVFj3z1w1M24OQ3/Ty7eNkT3XMHXSmJSCd/fGgxG8DW036KsJIjuEIDf3UC49SQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <c5ab6164-6441-85bf-fdcf-576af7472fd6@amd.com>
Date: Tue, 1 Nov 2022 09:58:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [XEN v2 02/12] xen/Arm: GICv3: Move the macros to compute the
 affnity level to arm64/arm32
From: Michal Orzel <michal.orzel@amd.com>
To: Ayan Kumar Halder <ayankuma@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<burzalodowa@gmail.com>
References: <20221031151326.22634-1-ayankuma@amd.com>
 <20221031151326.22634-3-ayankuma@amd.com>
 <4271ac3e-04bf-7bbb-2db9-3216ac19e778@amd.com>
Content-Language: en-US
In-Reply-To: <4271ac3e-04bf-7bbb-2db9-3216ac19e778@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT100:EE_|CH2PR12MB4071:EE_
X-MS-Office365-Filtering-Correlation-Id: 560e5eb4-f8a3-4b28-6665-08dabbe73aad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DVFj3qu/oGkO6AceTdlY9wJN1THJm5neUhEhEBpsrMST8NEEXSxVv+vdrpZHZEehxRNqv813qlaOzwJIIRXEiY6m316QqX8bXYISmWxo6DxAxIx52au8X6f34xZXXXpci392QGhynRQbM+h2Xgkqm5Gj3Y9DRsFBqkr0Ke64quLZGmBPVyZV1UWRDxRK1QUqYdPxY6lWjQYPVmy+EUPdaCCfOEy88BhdMs/5vT9wDj6+VkBJKNTk+ibUd90l2voABn3fydzHbdBC/acheQkca/XcmvsnB4Vy+rLG+TMjoFfTT1XGDdAGTukkhFSd3NqPMxvdJiYszW/q1RnbcUpS5cVTg42vsk0OoDyC93bwuasHUiSdWFxsSRrcc7hoV0nG4NQswlT2RMj0Kq63yeoYdTB8ch8bSWtbn0SUd7pSxtkHG/5Hx+DrBq59GtictWnQRSO8bv9eTKC9l7gWkTQ1OW4XSzdayV988MEMU0Ed0r/SMNZYq8nIvZgNFmrJQYn1z0mWvNDRlgE0nH6EZqmq7g3F7x8p9orcDgpxNk70K94I+dHVRaklaha8i1AR01e8OD51RRBA/DeBB1+X+nBt8fQ83l4a4WoJu9mVt1vBU4RTMcOkaSjF9YIdj5yFdhTxNYe7ZIC5cbYHHUPGp2pemfhTlhjQY2tcFfOv59iJzxpMh2aaZBixsnURrRCo5B8VNDL4T91yYMPne6IUoJPdCAszF6Mo7s1ihg5onfZpSyWd3ZNto7yKNJte6sLVUzO49koVoz7f+2PJ0G9UkorvJJiO5ZmFD+aIISRHAeXt/xxtvk+G7C19bXaQ4b9KzHxaY057TdOG8OKcLBme1kMmrL+6YodDTz3a9xSqrkSg/2Douo4PVy1CO8OvFFXZ9mDB1CEXXKVKu818FuqK0z8nCw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(346002)(396003)(376002)(451199015)(46966006)(36840700001)(40470700004)(40460700003)(45080400002)(8936002)(5660300002)(83380400001)(54906003)(110136005)(26005)(2906002)(966005)(31696002)(47076005)(40480700001)(186003)(53546011)(336012)(426003)(478600001)(44832011)(86362001)(2616005)(36756003)(31686004)(82740400003)(70586007)(70206006)(356005)(81166007)(36860700001)(82310400005)(16576012)(316002)(41300700001)(8676002)(4326008)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 08:58:22.1847
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 560e5eb4-f8a3-4b28-6665-08dabbe73aad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT100.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4071



On 31/10/2022 18:53, Michal Orzel wrote:
> 
> 
> Hi Ayan,
> 
> On 31/10/2022 16:13, Ayan Kumar Halder wrote:
>>
>>
>> Refer https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Fv6.1-rc1%2Fsource%2Farch%2Farm64%2F&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C0b2a0d1537104c2391d008dabb68eabb%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638028356554609284%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=RhhL0XWxLJsO7vsP0DoP1QMvUMwGV%2F4FPJwAyvStj4k%3D&amp;reserved=0 \
> You should not split the link as it is becoming unusable in that form.
> 
>> include/asm/cputype.h#L14 , for the macros specific for arm64.
>>
>> Refer https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Fv6.1-rc1%2Fsource%2Farch%2Farm%2Finclude%2F&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C0b2a0d1537104c2391d008dabb68eabb%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638028356554609284%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=gLsNWm5%2BSyy51rn%2BA6H8PrWg8Yv%2BERicyyDjshOd3hc%3D&amp;reserved=0 \
> Same here.
> 
>> asm/cputype.h#L54  , for the macros specific for arm32.
>>
>> MPIDR_LEVEL_SHIFT() differs between 64 and 32 bit.
>> For 64 bit :-
>>
>>  aff_lev3          aff_lev2 aff_lev1 aff_lev0
>> |________|________|________|________|________|
>> 40       32       24       16       8        0
>>
>> For 32 bit :-
>>
>>  aff_lev3 aff_lev2 aff_lev1 aff_lev0
>> |________|________|________|________|
>> 32       24       16       8        0
>>
> 
> Where did you get this info from?
> FWICS by looking at ARM ARM DDI 0487I.a D17-6118,
> "Aff3 is not supported in AArch32 state."
We're talking about arm32 and not AArch32. My bad.
Nevertheless, looking at ARM ARM DDI 0406C.d B4-1644,
MPIDR for Armv7A/R also does not have aff3.

> 
> 
>> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
>> ---
>>
>> Changes from :-
>> v1 - 1. Rearranged the macro defines so that the common code (between arm32
>> and arm64) is placed in "arm/include/asm/processor.h".
>>
>>  xen/arch/arm/include/asm/arm32/processor.h | 5 +++++
>>  xen/arch/arm/include/asm/arm64/processor.h | 8 ++++++++
>>  xen/arch/arm/include/asm/processor.h       | 6 ------
>>  3 files changed, 13 insertions(+), 6 deletions(-)
>>
>> diff --git a/xen/arch/arm/include/asm/arm32/processor.h b/xen/arch/arm/include/asm/arm32/processor.h
>> index 4e679f3273..82aa7f8d9d 100644
>> --- a/xen/arch/arm/include/asm/arm32/processor.h
>> +++ b/xen/arch/arm/include/asm/arm32/processor.h
>> @@ -56,6 +56,11 @@ struct cpu_user_regs
>>      uint32_t pad1; /* Doubleword-align the user half of the frame */
>>  };
>>
>> +/*
>> + * Macros to extract affinity level. Picked from kernel
>> + */
> No need for a multiline comment here and everywhere else.
> 
>> +#define MPIDR_LEVEL_SHIFT(level) (MPIDR_LEVEL_BITS * (level))
>> +
>>  #endif
>>
>>  #endif /* __ASM_ARM_ARM32_PROCESSOR_H */
>> diff --git a/xen/arch/arm/include/asm/arm64/processor.h b/xen/arch/arm/include/asm/arm64/processor.h
>> index c749f80ad9..295483a9dd 100644
>> --- a/xen/arch/arm/include/asm/arm64/processor.h
>> +++ b/xen/arch/arm/include/asm/arm64/processor.h
>> @@ -84,6 +84,14 @@ struct cpu_user_regs
>>      uint64_t sp_el1, elr_el1;
>>  };
>>
>> +/*
>> + * Macros to extract affinity level. picked from kernel
>> + */
>> +#define MPIDR_LEVEL_BITS_SHIFT  3
>> +
>> +#define MPIDR_LEVEL_SHIFT(level) \
>> +         (((1 << (level)) >> 1) << MPIDR_LEVEL_BITS_SHIFT)
>> +
> You should move these macros below __DECL_REG as they do not require having it defined.
> 
>>  #undef __DECL_REG
>>
>>  #endif /* __ASSEMBLY__ */
>> diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
>> index 1dd81d7d52..ecfb62bbbe 100644
>> --- a/xen/arch/arm/include/asm/processor.h
>> +++ b/xen/arch/arm/include/asm/processor.h
>> @@ -122,13 +122,7 @@
>>  /*
>>   * Macros to extract affinity level. picked from kernel
>>   */
>> -
>> -#define MPIDR_LEVEL_BITS_SHIFT  3
>>  #define MPIDR_LEVEL_MASK        ((1 << MPIDR_LEVEL_BITS) - 1)
>> -
>> -#define MPIDR_LEVEL_SHIFT(level) \
>> -         (((1 << (level)) >> 1) << MPIDR_LEVEL_BITS_SHIFT)
>> -
>>  #define MPIDR_AFFINITY_LEVEL(mpidr, level) \
>>           (((mpidr) >> MPIDR_LEVEL_SHIFT(level)) & MPIDR_LEVEL_MASK)
>>
>> --
>> 2.17.1
>>
>>
> 
> ~Michal
> 

