Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2CF6EE618
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 18:50:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526164.817686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prLrT-0002IX-Hw; Tue, 25 Apr 2023 16:49:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526164.817686; Tue, 25 Apr 2023 16:49:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prLrT-0002G9-F9; Tue, 25 Apr 2023 16:49:51 +0000
Received: by outflank-mailman (input) for mailman id 526164;
 Tue, 25 Apr 2023 16:49:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+dmH=AQ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1prLrR-0002G3-SF
 for xen-devel@lists.xenproject.org; Tue, 25 Apr 2023 16:49:49 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061d.outbound.protection.outlook.com
 [2a01:111:f400:fe59::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2fa63e23-e389-11ed-b223-6b7b168915f2;
 Tue, 25 Apr 2023 18:49:48 +0200 (CEST)
Received: from MW4PR03CA0324.namprd03.prod.outlook.com (2603:10b6:303:dd::29)
 by PH7PR12MB7283.namprd12.prod.outlook.com (2603:10b6:510:20a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Tue, 25 Apr
 2023 16:49:44 +0000
Received: from CO1NAM11FT072.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dd:cafe::58) by MW4PR03CA0324.outlook.office365.com
 (2603:10b6:303:dd::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.20 via Frontend
 Transport; Tue, 25 Apr 2023 16:49:44 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT072.mail.protection.outlook.com (10.13.174.106) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6340.20 via Frontend Transport; Tue, 25 Apr 2023 16:49:43 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 25 Apr
 2023 11:49:42 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 25 Apr
 2023 11:49:41 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 25 Apr 2023 11:49:39 -0500
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
X-Inumbo-ID: 2fa63e23-e389-11ed-b223-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AQNxMtaS11MxeDTwcIO8GAusj8FuvNg/sLFL5a9uhrnILuM1BqzRcBTXfqn88Dw5lk5uExi2O198Kys47EH+I0vXwWkPeNYnofW3yTjKtBsDOnxkhNPMEons1MfBynvg3qvniOD0yqYAExtQs3PCb2OtokBqLVLVHVIqMZhtoknZgg1SA0ePdmPH8vD3Vbf6ZQ0ADiK1Tp5vBCyY/tTgyVq/kdEbMhlyrPMOpPVg83Nci2L0iDBE71+RE8etGaYTWlGYg/aJRtFn+/2+KuHrpLFXg25ErTQwZnA2S/PQ8fU+AhZyQLABgO50ExiW5L8O0j9fXQ31t0G4mjNCHeczHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pTVuCKjfrnLU6F/+3MjKDTLewzSUJKzjfnL0s/DkNxo=;
 b=VNQIsTnoUOdIBEzQWTXhJ7Ftng7G51JrpjtqNlNDFXnYdjyIZDJLPsf2GNHzKbbbcWrSAbVfGVJR4iWO7dSzOdRMPSkKCnasqkR4Z5foW0HF81KHcvWKKwJlx0dZs2u1x/Kz02ZPXEfHR+6iyZ6GwoCFKABXqa9qo6MfaSEvI3OZAdtvFSHvwLC9sVuvXfxmiKnaR3TXGEjJ74/73WFv7Wc3ilu1wKcd98m+iCLeq88biDfvabgp6PEEK6osUaBxoSy60X4eQWn8/y36JgkJKMDEjXoD3R/RKNtjdXiepF1S3GigbicZc1hrJCwmqEgoGvaykcTnR0uR8nAVqtO6EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pTVuCKjfrnLU6F/+3MjKDTLewzSUJKzjfnL0s/DkNxo=;
 b=TNRTgnr8LGWTfYdvX3239oLMgoGzOxiFs0BPwf89rADoHh5eVssW4w3aiaLTpNaUMxSI8CVuC/NM2Ixoz6n9e9mLKIGWKZJTYu8SQrLDlLQxGUYh0zsZqJrU4rHnVa2ju4Ul4jDpM0A7mW8IlAgFGo2YwNHxrjL8lArbftBbCwM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <56a55bd0-d86e-aa32-ab7f-9ff2bcfb9e1c@amd.com>
Date: Tue, 25 Apr 2023 18:49:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [XEN v5 05/10] xen/arm: Introduce choice to enable 64/32 bit
 physical addressing
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>
References: <20230413173735.48387-1-ayan.kumar.halder@amd.com>
 <20230413173735.48387-6-ayan.kumar.halder@amd.com>
 <ca8fd34c-3755-161d-38c1-651cf08ef589@amd.com>
 <ad2dec59-d35f-3edd-b928-5005b47ebff7@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <ad2dec59-d35f-3edd-b928-5005b47ebff7@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT072:EE_|PH7PR12MB7283:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b9c1129-549e-4c7c-4f78-08db45ad1211
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lYb2HIRxsAAaGbfgmxhmNlMJQ+MOlzetjm1eHdIUD+phr54dx870qBtnljyoFoAKWWjcuSLDn7t5olmcvgwI8V4mtScXtUMotGrFEXvT/tMKVonzUpXcYeVkDlqkIYlWARorbbUhVyxKmH/3jrGaClnvZzqGrshx4r0xec0HoRDGP9Tl0Wk/lP9FUY3zkc2KeVSNzP8z+T/Zxm6rOyFxx4nJOC93kAqmOK3GMBooN6PRN3BTtzTWEoFNBLZh/9cfdLivC2iJ+EYz3ePxrVYHDPTYRasxxI50xSp7K9NzcQnxHaP7p7Mr/LjeHK6WXucewKNLV3kXHioeh8fapAgwhtXcgcQKhRugZDdizpae2+0VoZg+JGYNwUc015x3MtkCoYGYmCba9+Rf1FVW7qOJ0VrbQxENQa7EjekCoxe7Rld46p/HTeLOwlPduif94pGn4rF9rp/HQSwhi1J0li2xHaMHXO5WP725J9SmBShSZrVB9IfClMaHiweX7s6FD4QYT0OtNrnSJGOnCv9aEtcl0pi+e3HYnrus+S/b26y3erUqaT915wT5DAS0LNx9k2mXglWnEkrw+djZTIIAxHhz02nHIsWaSPHBVpuNQMdgm3yi/RWTTSK1fJ2TAHW3zBK23m9HMO++KqeNfhe7hfsTUQGRhQlbOrd5UOWckoQNki39tksGWImVwpnQHEdotmnZJAAAelwjrvS3GvOmVr/dzK0IbpMgMBmOy4nTFX5Fvjq/GnCqOQgIH0EfoiKzMil/BVxuVRv2B3REQZx/ygdsbiA6T4w1fqBOtjxasBkkJvM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(39860400002)(136003)(451199021)(46966006)(36840700001)(40470700004)(44832011)(2616005)(8936002)(31686004)(356005)(82740400003)(70206006)(70586007)(316002)(336012)(81166007)(426003)(82310400005)(40480700001)(26005)(36860700001)(83380400001)(5660300002)(7416002)(2906002)(41300700001)(8676002)(4326008)(47076005)(86362001)(54906003)(478600001)(40460700003)(31696002)(16576012)(110136005)(186003)(53546011)(36756003)(21314003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 16:49:43.6121
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b9c1129-549e-4c7c-4f78-08db45ad1211
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT072.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7283

Hi Ayan,

On 25/04/2023 17:16, Ayan Kumar Halder wrote:
> 
> On 24/04/2023 13:08, Michal Orzel wrote:
>> Hi Ayan,
> 
> Hi Michal,
> 
> A clarification.
> 
>>
>> On 13/04/2023 19:37, Ayan Kumar Halder wrote:
>>>
>>> Some Arm based hardware platforms which does not support LPAE
>>> (eg Cortex-R52), uses 32 bit physical addresses.
>>> Also, users may choose to use 32 bits to represent physical addresses
>>> for optimization.
>>>
>>> To support the above use cases, we have introduced arch independent
>>> configs to choose if the physical address can be represented using
>>> 32 bits (PHYS_ADDR_T_32) or 64 bits (!PHYS_ADDR_T_32).
>>> For now only ARM_32 provides support to enable 32 bit physical
>>> addressing.
>>>
>>> When PHYS_ADDR_T_32 is defined, PADDR_BITS is set to 32.
>>> When PHYS_ADDR_T_32 is not defined for ARM_32, PADDR_BITS is set to 40.
>>> When PHYS_ADDR_T_32 is not defined for ARM_64, PADDR_BITS is set to 48.
>>> The last two are same as the current configuration used today on Xen.
>>>
>>> PADDR_BITS is also set to 48 when ARM_64 is defined. The reason being
>>> the choice to select ARM_PA_BITS_32/ARM_PA_BITS_40/ARM_PA_BITS_48 is
>>> currently allowed when ARM_32 is defined.
>>>
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> ---
>>> Changes from -
>>> v1 - 1. Extracted from "[XEN v1 8/9] xen/arm: Other adaptations required to support 32bit paddr".
>>>
>>> v2 - 1. Introduced Kconfig choice. ARM_64 can select PHYS_ADDR_64 only whereas
>>> ARM_32 can select PHYS_ADDR_32 or PHYS_ADDR_64.
>>> 2. For CONFIG_ARM_PA_32, paddr_t is defined as 'unsigned long'.
>>>
>>> v3 - 1. Allow user to define PADDR_BITS by selecting different config options
>>> ARM_PA_BITS_32, ARM_PA_BITS_40 and ARM_PA_BITS_48.
>>> 2. Add the choice under "Architecture Features".
>>>
>>> v4 - 1. Removed PHYS_ADDR_T_64 as !PHYS_ADDR_T_32 means PHYS_ADDR_T_32.
>>>
>>>   xen/arch/Kconfig                     |  3 +++
>>>   xen/arch/arm/Kconfig                 | 37 ++++++++++++++++++++++++++--
>>>   xen/arch/arm/include/asm/page-bits.h |  6 +----
>>>   xen/arch/arm/include/asm/types.h     |  6 +++++
>>>   xen/arch/arm/mm.c                    |  5 ++++
>>>   5 files changed, 50 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
>>> index 7028f7b74f..67ba38f32f 100644
>>> --- a/xen/arch/Kconfig
>>> +++ b/xen/arch/Kconfig
>>> @@ -1,6 +1,9 @@
>>>   config 64BIT
>>>          bool
>>>
>>> +config PHYS_ADDR_T_32
>>> +       bool
>>> +
>>>   config NR_CPUS
>>>          int "Maximum number of CPUs"
>>>          range 1 4095
>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>> index 239d3aed3c..3f6e13e475 100644
>>> --- a/xen/arch/arm/Kconfig
>>> +++ b/xen/arch/arm/Kconfig
>>> @@ -19,13 +19,46 @@ config ARM
>>>          select HAS_PMAP
>>>          select IOMMU_FORCE_PT_SHARE
>>>
>>> +menu "Architecture Features"
>>> +
>>> +choice
>>> +       prompt "Physical address space size" if ARM_32
>> Why is it protected by ARM_32 but in the next line you add something protected by ARM_64?
>> This basically means that for arm64, ARM_PA_BITS_XXX is never defined.
> 
> Currently, I intentend to support 32-bit physical address configuration 
> for ARM_32 only. So in case of ARM_32, user will have a choice between 
> 32-bit and 40-bit PA.
> 
> So, if it is ok with you, can I remove the below line and "config 
> ARM_PA_BITS_48 ..." ?
I'm ok with that. I'm also ok to keep ARM_PA_BITS_48 but with ARM_32 protection removed to that the option makes sense.
However, since there is no real choice for arm64, I think the former is better.

~Michal

