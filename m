Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 814E36F6DAB
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 16:27:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529813.824633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puZvQ-0006Sp-E8; Thu, 04 May 2023 14:27:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529813.824633; Thu, 04 May 2023 14:27:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puZvQ-0006Pu-BL; Thu, 04 May 2023 14:27:16 +0000
Received: by outflank-mailman (input) for mailman id 529813;
 Thu, 04 May 2023 14:27:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=evI0=AZ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1puZvO-0006Pe-Lj
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 14:27:14 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20620.outbound.protection.outlook.com
 [2a01:111:f400:7e83::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c12773c4-ea87-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 16:27:11 +0200 (CEST)
Received: from MW4PR04CA0083.namprd04.prod.outlook.com (2603:10b6:303:6b::28)
 by IA1PR12MB7541.namprd12.prod.outlook.com (2603:10b6:208:42f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Thu, 4 May
 2023 14:27:08 +0000
Received: from CO1NAM11FT101.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6b:cafe::25) by MW4PR04CA0083.outlook.office365.com
 (2603:10b6:303:6b::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26 via Frontend
 Transport; Thu, 4 May 2023 14:27:07 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT101.mail.protection.outlook.com (10.13.175.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6363.26 via Frontend Transport; Thu, 4 May 2023 14:27:07 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 4 May
 2023 09:27:05 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 4 May
 2023 09:26:55 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 4 May 2023 09:26:53 -0500
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
X-Inumbo-ID: c12773c4-ea87-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WDcNXg2LdgacGaYFeU8pVvn6v3Aie+Yp8o6ardijkCDTKdESXTFbE1L0J1WEXMk3GQdmfPopJ+6hRoy5N2ci89qIro/3yG6//cZ4iwPjywdenoheOTenlCmltLETnOH0CfRdexhtwn2DONiaLwPUvQYrzkis+LVexY8g/0s01DBHsUL5YQzQLTNza1aVmUvQAPn0xn+oIMx4jALTjAdfzXi8JotrUBdxR6ihT1Wn63SDGSBSiTTxsyjLrsvUXOXyvGzFBaMfLT5DMivlt9pVo7Rhwwcx3yaBZWP3Dq/CGjNjtDGb2gtFM/MuYtl3rnKLAgYhk1a4yIM1G0wb6nYYEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yReBJkggtW9j5YlcdD87yqF+ZbDUNTJM8rmOi+qPKGQ=;
 b=CpjLRgWfDs8BsnbB47Q3aj1pWUyqiJYu+ClxoMrO11/LjZXvsO7B1Qlaq5HB16I59G4dhYgktaAJ9U8VTdyk43ZURO1ajuCXg9HD9mVjkMnYPcfevK/6kVIO2/+wYY2/uXUuZdF2gR3oXJkHdOPiUd3ac8jprfI86WTEQ5qUENYq42bSkWlSLUk2gbf8uwRx0Ym9elqcwvyz32GNiCbgeXvXTqSjpsK5SsdDCAwrfMUC8daL99rwp+f72ZqFa8gmGtO1CEnzCQVR0CuuRj4RksZ3Z2K+XVjHhWhDWkVOaWnHSKE9DqHOnqkPPdCZGrqdG+08IJPcst+1c/efZseiwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yReBJkggtW9j5YlcdD87yqF+ZbDUNTJM8rmOi+qPKGQ=;
 b=NKbihi94TR5t4BugvsGhA0I/oKidbt6pdCCHtFKuSBdgoMWv9u+Sa/BaZjKKrOedeccjWW8JXwHTAbQOOuH1w78yy8gh3OErasTsiviBeu1bfAeueijkok4+Icgti3cjHn568uvEzWNowE709lPl4OG/gLHkLS+TNOAGq1f/V/A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <29c7bf6a-0db4-5192-b93d-3e3220fe6a2e@amd.com>
Date: Thu, 4 May 2023 16:26:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [XEN v6 11/12] xen/arm: p2m: Use the pa_range_info table to
 support ARM_32 and ARM_64
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>
References: <20230428175543.11902-1-ayan.kumar.halder@amd.com>
 <20230428175543.11902-12-ayan.kumar.halder@amd.com>
 <63fa927e-72f5-1645-97c0-6986f2fdcabe@xen.org>
 <178f9c0f-2f72-daac-772b-c3c4221bea40@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <178f9c0f-2f72-daac-772b-c3c4221bea40@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT101:EE_|IA1PR12MB7541:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d21ad43-6b9c-45b7-bc61-08db4caba3de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SxZh8RKOhHH5pULoRBT8yc0+AAwfnujgqnvedg6RpqQhgedfi7BrpMes61WcsUvtvvdRfzrxVf+kdaAUI8FZ2B3LHfm8rRlXawi8RVwxMipMgETudHKmULRJ8rqrMJhJX5dGA28fN+ZfQzoQhR9uM+R2Rv+yj0sfSVVoaAGxx2R8QPwyNLQTs2ds20tPZpVx0nMhy5rvAzyWOOASXLzpyS2b0v3InwQ2kyz5Ee2jPZG3wR2xGRBSdYFtAlYtJXkhfIk5xgYVPndcWqO1ZINWatT0Z+5JgTykezBNeh+M+VWNvTykcTtxlOqgtVvPy8Bvtw7Fu4uorKQeoBPxhY+nPg+drYnCWzWi8MQ3mnz8K2xnho2hMZTXj6aanptEZ2LCmADamNeygG33SBVTZuGXg6R5O075xnr5J4WK4tXtABc5hlRiBUufOnxBeTcezvJq+ppw4puruExDqRVEDIgxWptzT3RF3ahFHnBbOIsMvHt6wH5MJ2+C+ONarq+6AbkFNLWyGkT5Rik1j/VDBXBUNZGulun6J9Evi+TvwIsItogHxfNrtjAXRiI79xFKW6/fWSaD4lHhIXKEC35pvCzqn6rtLO/cVFooKT9t2KqxBf9jcncl652Hyk5Re3hS5nQUzcNoSyrYOVUOc2gbV++YPfxgLPjz61eSYnowqY1UC324RA3D7nvtgDcB1ZEiRvT+/Iy9EzFX+YNF3QEVXKA3LlR0RhdK5EZ2ywdJ+NdTmlWKRABFkq2zfxdoLACvcdRexeawqkx3eVKt4ZjfUwPSwg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(136003)(396003)(346002)(451199021)(36840700001)(46966006)(40470700004)(40460700003)(31686004)(8936002)(82310400005)(8676002)(7416002)(2616005)(26005)(53546011)(336012)(426003)(36756003)(40480700001)(2906002)(47076005)(83380400001)(44832011)(186003)(478600001)(4326008)(5660300002)(41300700001)(70586007)(70206006)(356005)(316002)(16576012)(110136005)(54906003)(31696002)(82740400003)(36860700001)(86362001)(81166007)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 14:27:07.3896
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d21ad43-6b9c-45b7-bc61-08db4caba3de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT101.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7541



On 03/05/2023 14:35, Julien Grall wrote:
> 
> 
> On 03/05/2023 13:20, Julien Grall wrote:
>> Hi,
>>
>> On 28/04/2023 18:55, Ayan Kumar Halder wrote:
>>> Restructure the code so that one can use pa_range_info[] table for both
>>> ARM_32 as well as ARM_64.
>>>
>>> Also, removed the hardcoding for P2M_ROOT_ORDER and P2M_ROOT_LEVEL as
>>> p2m_root_order can be obtained from the pa_range_info[].root_order and
>>> p2m_root_level can be obtained from pa_range_info[].sl0.
>>>
>>> Refer ARM DDI 0406C.d ID040418, B3-1345,
>>> "Use of concatenated first-level translation tables
>>>
>>> ...However, a 40-bit input address range with a translation
>>> granularity of 4KB
>>> requires a total of 28 bits of address resolution. Therefore, a stage 2
>>> translation that supports a 40-bit input address range requires two
>>> concatenated
>>> first-level translation tables,..."
>>>
>>> Thus, root-order is 1 for 40-bit IPA on ARM_32.
>>>
>>> Refer ARM DDI 0406C.d ID040418, B3-1348,
>>>
>>> "Determining the required first lookup level for stage 2 translations
>>>
>>> For a stage 2 translation, the output address range from the stage 1
>>> translations determines the required input address range for the stage 2
>>> translation. The permitted values of VTCR.SL0 are:
>>>
>>> 0b00 Stage 2 translation lookup must start at the second level.
>>> 0b01 Stage 2 translation lookup must start at the first level.
>>>
>>> VTCR.T0SZ must indicate the required input address range. The size of
>>> the input
>>> address region is 2^(32-T0SZ) bytes."
>>>
>>> Thus VTCR.SL0 = 1 (maximum value) and VTCR.T0SZ = -8 when the size of
>>> input
>>> address region is 2^40 bytes.
>>>
>>> Thus, pa_range_info[].t0sz = 1 (VTCR.S) | 8 (VTCR.T0SZ) ie 11000b
>>> which is 24.
>>>
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> ---
>>> Changes from -
>>>
>>> v3 - 1. New patch introduced in v4.
>>> 2. Restructure the code such that pa_range_info[] is used both by
>>> ARM_32 as
>>> well as ARM_64.
>>>
>>> v4 - 1. Removed the hardcoded definitions of P2M_ROOT_ORDER and
>>> P2M_ROOT_LEVEL.
>>> The reason being root_order will not be always 1 (See the next patch).
>>> 2. Updated the commit message to explain t0sz, sl0 and root_order
>>> values for
>>> 32-bit IPA on Arm32.
>>> 3. Some sanity fixes.
>>>
>>> v5 - pa_range_info is indexed by system_cpuinfo.mm64.pa_range. ie
>>> when PARange is 0, the PA size is 32, 1 -> 36 and so on. So
>>> pa_range_info[] has
>>> been updated accordingly.
>>> For ARM_32 pa_range_info[0] = 0 and pa_range_info[1] = 0 as we do not
>>> support
>>> 32-bit, 36-bit physical address range yet.
>>>
>>>   xen/arch/arm/include/asm/p2m.h |  8 +-------
>>>   xen/arch/arm/p2m.c             | 32 ++++++++++++++++++--------------
>>>   2 files changed, 19 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/include/asm/p2m.h
>>> b/xen/arch/arm/include/asm/p2m.h
>>> index f67e9ddc72..4ddd4643d7 100644
>>> --- a/xen/arch/arm/include/asm/p2m.h
>>> +++ b/xen/arch/arm/include/asm/p2m.h
>>> @@ -14,16 +14,10 @@
>>>   /* Holds the bit size of IPAs in p2m tables.  */
>>>   extern unsigned int p2m_ipa_bits;
>>> -#ifdef CONFIG_ARM_64
>>>   extern unsigned int p2m_root_order;
>>>   extern unsigned int p2m_root_level;
>>> -#define P2M_ROOT_ORDER    p2m_root_order
>>> +#define P2M_ROOT_ORDER p2m_root_order
>>
>> This looks like a spurious change.
>>
>>>   #define P2M_ROOT_LEVEL p2m_root_level
>>> -#else
>>> -/* First level P2M is always 2 consecutive pages */
>>> -#define P2M_ROOT_ORDER    1
>>> -#define P2M_ROOT_LEVEL 1
>>> -#endif
>>>   struct domain;
>>> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
>>> index 418997843d..1fe3cccf46 100644
>>> --- a/xen/arch/arm/p2m.c
>>> +++ b/xen/arch/arm/p2m.c
>>> @@ -19,9 +19,9 @@
>>>   #define INVALID_VMID 0 /* VMID 0 is reserved */
>>> -#ifdef CONFIG_ARM_64
>>>   unsigned int __read_mostly p2m_root_order;
>>>   unsigned int __read_mostly p2m_root_level;
>>> +#ifdef CONFIG_ARM_64
>>>   static unsigned int __read_mostly max_vmid = MAX_VMID_8_BIT;
>>>   /* VMID is by default 8 bit width on AArch64 */
>>>   #define MAX_VMID       max_vmid
>>> @@ -2247,16 +2247,6 @@ void __init setup_virt_paging(void)
>>>       /* Setup Stage 2 address translation */
>>>       register_t val =
>>> VTCR_RES1|VTCR_SH0_IS|VTCR_ORGN0_WBWA|VTCR_IRGN0_WBWA;
>>> -#ifdef CONFIG_ARM_32
>>> -    if ( p2m_ipa_bits < 40 )
>>> -        panic("P2M: Not able to support %u-bit IPA at the moment\n",
>>> -              p2m_ipa_bits);
>>> -
>>> -    printk("P2M: 40-bit IPA\n");
>>> -    p2m_ipa_bits = 40;
>>> -    val |= VTCR_T0SZ(0x18); /* 40 bit IPA */
>>> -    val |= VTCR_SL0(0x1); /* P2M starts at first level */
>>> -#else /* CONFIG_ARM_64 */
>>>       static const struct {
>>>           unsigned int pabits; /* Physical Address Size */
>>>           unsigned int t0sz;   /* Desired T0SZ, minimum in comment */
>>> @@ -2265,19 +2255,26 @@ void __init setup_virt_paging(void)
>>>       } pa_range_info[] __initconst = {
>>>           /* T0SZ minimum and SL0 maximum from ARM DDI 0487H.a Table
>>> D5-6 */
>>>           /*      PA size, t0sz(min), root-order, sl0(max) */
>>> +        [2] = { 40,      24/*24*/,  1,          1 },
>>
>> I don't like the fact that the index are not ordered anymore and...
>>
>>> +#ifdef CONFIG_ARM_64
>>>           [0] = { 32,      32/*32*/,  0,          1 },
>>>           [1] = { 36,      28/*28*/,  0,          1 },
>>> -        [2] = { 40,      24/*24*/,  1,          1 },
>>>           [3] = { 42,      22/*22*/,  3,          1 },
>>>           [4] = { 44,      20/*20*/,  0,          2 },
>>>           [5] = { 48,      16/*16*/,  0,          2 },
>>>           [6] = { 52,      12/*12*/,  4,          2 },
>>>           [7] = { 0 }  /* Invalid */
>>> +#else
>>> +        [0] = { 0 },  /* Invalid */
>>> +        [1] = { 0 },  /* Invalid */
>>> +        [3] = { 0 }  /* Invalid */
>>> +#endif
>>
>> ... it is not clear to me why we are adding 3 extra entries. I think it
>> would be better if we do:
>>
>> #ifdef CONFIG_ARM_64
>>     [0] ...
>>     [1] ...
>> #endif
>>     [2] ...
>> #ifdef CONFIG_ARM_64
>>     [3] ...
>>     [4] ...
>>     ...
>> #endif
> 
> Looking at the next patch. An alternative would be to go back
> duplicating the lines. So after the two patches we would have
> 
> #ifdef CONFIG_ARM_64
>      [0] ...
>      [7] ...
> #else
>      { /* 32-bit */ }
>      { /* 40-bit */ }
> #endif
+1 for this approach

~Michal

