Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBD461937D
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 10:29:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437396.691745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqszU-0001t3-5k; Fri, 04 Nov 2022 09:27:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437396.691745; Fri, 04 Nov 2022 09:27:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqszU-0001qN-1U; Fri, 04 Nov 2022 09:27:56 +0000
Received: by outflank-mailman (input) for mailman id 437396;
 Fri, 04 Nov 2022 09:27:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n4Yn=3E=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oqszR-0001qH-Rg
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 09:27:54 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062.outbound.protection.outlook.com [40.107.244.62])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1e9747e-5c22-11ed-8fd0-01056ac49cbb;
 Fri, 04 Nov 2022 10:27:51 +0100 (CET)
Received: from DM6PR11CA0017.namprd11.prod.outlook.com (2603:10b6:5:190::30)
 by SJ0PR12MB8114.namprd12.prod.outlook.com (2603:10b6:a03:4e8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.14; Fri, 4 Nov
 2022 09:27:44 +0000
Received: from DM6NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:190:cafe::8b) by DM6PR11CA0017.outlook.office365.com
 (2603:10b6:5:190::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Fri, 4 Nov 2022 09:27:44 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT065.mail.protection.outlook.com (10.13.172.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5791.20 via Frontend Transport; Fri, 4 Nov 2022 09:27:43 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 4 Nov
 2022 04:27:41 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 4 Nov
 2022 04:27:40 -0500
Received: from [10.71.192.110] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Fri, 4 Nov 2022 04:27:38 -0500
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
X-Inumbo-ID: f1e9747e-5c22-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J4QBnsTNVxAvwFbYShAQ1KQSg2N3pjntsdp+W40fqJpK0xJwlpBhTBvgqFzSIPMg22pGf/69DYZkKQKb1mTSgYBFmSnf1fiA+NQ8TXAx3dwKdIsY7I+ev1KT43O0JJJNtfP5x6j8x5L5QpCeeyq4Y5hJ5NHgCLn6fRCXe/22A9iSNrIxi8VEL8aaqBtKB33cXkIK80t5mCtVMurFptVGt1EnrZp7HegpKB2XPJ7W4D11rmNo15v2/95aQ4UjQ8WgMWf3QL8kg0O0vAuoyO1SGQGOnDpaj2pEYZ4Qvt0WIat8kW4HVN3+2gsnSm5ruJMHbymypHNOtz9OUA8vrqW80g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zE7umqfjD05MqPI5GDuN2Nxk9/YoeFlST5Rhs9j8qTQ=;
 b=SdGEhb9zJojm/bKrc/OnCp+DbzeksEgXK+3FNFAg6FRrJod4wofO/rYOf8rA3C+OF8Xeu286zh7LiK8uucFnYChRFugPK+e/p4zH4dfCeyIVC/n6V7x2vnIGVLOlqHd2M88PLVyY8/ChIdOPGoIjSwYs6+C+pw10vaFyLR2Ed7nVUqhfneEItzR3hiiOPoJIyWs87efeiJFAr7B2lo9Ek82dnG0F2vbKGeoPSZkHLOjbtND0f0DbHOWaRaOlGtS3nQ018ohVVJr/PMCSDOWja+YkSAAPe2j+P00K27dHghZhbkJUIXbbDUaaIXz8k//lKwc0WNwJf7m4IpudagZrlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zE7umqfjD05MqPI5GDuN2Nxk9/YoeFlST5Rhs9j8qTQ=;
 b=jZOXMOYs1YQpXkvrDFDmJgbGzsy/s4mry0MzJzaJYtqDZsa6joBbWfZp553YzbdL/0M5U0tMRgCmAmQahOQa6nXHcxx0xxdoumTh/FJY43r4Sp1MnqUqVtHI5B46bxc/MNYTR8Lyd+rDSes08m6ujr+6gC3c5vt750+M23tkbpw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <c1f3fee4-9262-d69e-9496-77581da6871a@amd.com>
Date: Fri, 4 Nov 2022 10:27:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [XEN v2 09/12] xen/Arm: GICv3: Define GIC registers for AArch32
To: Ayan Kumar Halder <ayankuma@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<burzalodowa@gmail.com>
References: <20221031151326.22634-1-ayankuma@amd.com>
 <20221031151326.22634-10-ayankuma@amd.com>
 <dfdc0cfa-70ee-d591-bbb4-1b8426bafaab@amd.com>
 <b446b12f-4497-6ad4-551c-a60f1062e282@amd.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <b446b12f-4497-6ad4-551c-a60f1062e282@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT065:EE_|SJ0PR12MB8114:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d520936-6875-4ac5-29e0-08dabe46d3c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZHzXjUw9JUNG4d61G3pwzSGe/I9VnAEryqsrgiYNpuX09IzxKV7jdaIulZQc7ZbPIIwWyLP80Exe2wPp9IfY15RdufwNus70JHFo3nvuAPS4w5A5SQv2BZ74bCfRHkjJDTnMoaubuK/lXCylJyTUcXDNWWaPTCLLMMP2QJUN/Gjmb/tEPXy1tHuLve2ihQHQXTLSBc3uDyeLApB1YGnS6iv0LnZbYnPb04lh6gcT/BHRFlBY5QDUp2ojNSLtoj1XKm878xZ98lsae7P29MYmuB+Vg1DjAIzcRn8sIt5GdZGExrKf9WMLvu3A1dNClNXHwdKWkpfrUhAUZ47YjD5aHhBrk+jhUP0XxOYxCJS1fuNf4wAVoMisHBs/KWGi6tYzdR+kAaEzuCZSwvk0R07Tpha01m3K99vOehiIRfNGQMUj8MS+G+Etf81Xh2GlrDgoduYhQBZqmk44DTZZhlyc78kx3T6XBEwFNsHAQFnYPVFhiz0OFEa19oTvDyQK0e4VcftJr8z8vR5V0+1fGmEP8JpdvfZ1e4MGG3IBcG8rDuEuFKnAfoTrw26Qzo6wQNyk4m7CIl97Oi3qGG7LU2Wj9DUruLp3mdhfoyl0EY9xO+l3vAHEW38F1nzrkFiz+YxNrrdzrcJSTWhOcXyGQX05LJ7D2DQJKC81VyZHyTKjIcSv5vJVNY9fYbZXOqN+8tDH29VFc3VdLKC+3b5DorIzNORbYfb7xgfRsOcJk7hsmXWmpSnOnLbbMutQ8R6uhC80L91kZ7lN+qzUVgLJpCEtmVYQf7sQF08TH7uBldhpFzsLYPDbVq+gB8/TIwQHY/t6ErtCbwP+3B4VgsAQ43u/rg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(136003)(39860400002)(346002)(451199015)(46966006)(40470700004)(36840700001)(82740400003)(82310400005)(31686004)(36756003)(44832011)(81166007)(356005)(426003)(40480700001)(83380400001)(336012)(41300700001)(8936002)(8676002)(31696002)(86362001)(2906002)(47076005)(5660300002)(2616005)(4326008)(70206006)(16576012)(110136005)(70586007)(54906003)(36860700001)(40460700003)(186003)(316002)(53546011)(26005)(478600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 09:27:43.5532
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d520936-6875-4ac5-29e0-08dabe46d3c6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8114

Hi Ayan,

On 03/11/2022 21:14, Ayan Kumar Halder wrote:
> 
> On 03/11/2022 15:08, Michal Orzel wrote:
>> Hi Ayan,
> Hi Michal,
>>
>> On 31/10/2022 16:13, Ayan Kumar Halder wrote:
>> The title is a bit ambiguous given that the previous patches were also defining GIC registers.
>> Maybe adding "remaining" would result in a better commit title.
>>
>>> Refer "Arm IHI 0069H ID020922"
>>> 12.5.23 ICC_SGI1R, Interrupt Controller Software Generated Interrupt
>>> Group 1 Register
>>> 12.5.12 ICC_HSRE, Interrupt Controller Hyp System Register Enable register
>>> 12.7.10 ICH_VTR, Interrupt Controller VGIC Type Register
>>> 12.7.5 ICH_HCR, Interrupt Controller Hyp Control Register
>>> 12.5.20 ICC_PMR, Interrupt Controller Interrupt Priority Mask Register
>>> 12.5.24 ICC_SRE, Interrupt Controller System Register Enable register
>>> 12.5.7 ICC_DIR, Interrupt Controller Deactivate Interrupt Register
>>> 12.5.9 ICC_EOIR1, Interrupt Controller End Of Interrupt Register 1
>>> 12.5.14 ICC_IAR1, Interrupt Controller Interrupt Acknowledge Register 1
>>> 12.5.5 ICC_BPR1, Interrupt Controller Binary Point Register 1
>>> 12.5.6 ICC_CTLR, Interrupt Controller Control Register
>>> 12.5.16 ICC_IGRPEN1, Interrupt Controller Interrupt Group 1 Enable register
>>> 12.7.9 ICH_VMCR, Interrupt Controller Virtual Machine Control Register
>>>
>> As said in the previous patches: this may be my personal opinion but sth like this would be easier to read:
>> "
>> Define missing assembly aliases for GIC registers on arm32, taking the ones
>> defined already for arm64 as a base. Aliases are defined according to the
>> GIC Architecture Specification ARM IHI 0069H.
>> "
>>> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
>>> ---
>>>
>>> Changes from :-
>>> v1 - 1. Moved coproc regs definition to asm/cpregs.h
>>>
>>>   xen/arch/arm/include/asm/cpregs.h | 16 ++++++++++++++++
>>>   1 file changed, 16 insertions(+)
>>>
>>> diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
>>> index bfabee0bc3..62b63f4cef 100644
>>> --- a/xen/arch/arm/include/asm/cpregs.h
>>> +++ b/xen/arch/arm/include/asm/cpregs.h
>>> @@ -415,6 +415,22 @@
>>>   #define ICH_AP1R1_EL2             __AP1Rx_EL2(1)
>>>   #define ICH_AP1R2_EL2             __AP1Rx_EL2(2)
>>>   #define ICH_AP1R3_EL2             __AP1Rx_EL2(3)
>>> +
>>> +#define ICC_SGI1R_EL1             p15,0,c12
>>> +
>>> +#define ICC_SRE_EL2               p15,4,c12,c9,5
>>> +#define ICH_VTR_EL2               p15,4,c12,c11,1
>>> +#define ICH_HCR_EL2               p15,4,c12,c11,0
>>> +
>>> +#define ICC_PMR_EL1               p15,0,c4,c6,0
>>> +#define ICC_SRE_EL1               p15,0,c12,c12,5
>>> +#define ICC_DIR_EL1               p15,0,c12,c11,1
>>> +#define ICC_EOIR1_EL1             p15,0,c12,c12,1
>>> +#define ICC_IAR1_EL1              p15,0,c12,c12,0
>>> +#define ICC_BPR1_EL1              p15,0,c12,c12,3
>>> +#define ICC_CTLR_EL1              p15,0,c12,c12,4
>>> +#define ICC_IGRPEN1_EL1           p15,0,c12,c12,7
>>> +#define ICH_VMCR_EL2              p15,4,c12,c11,7
>> I did not check this in previous patches but in which order are you defining these registers?
> My bad, I did not follow any particular order.
>> I took a look at arm64/sysregs.h and these regs are placed in assembly aliases name order.
>> So for instance ICC_PMR_EL1 would be defined before ICC_SRE_EL2, etc.
> This makes sense. I will fix this in v3.
>>
>> Also, I cannot see some regs like MISR, EISR that are defined for arm64. Did you decide not to define them
>> for arm32 because they are not used by Xen?
> 
> Actually these registers are not being used by arm64 as well. A grep for 
> "ICH_MISR" or "ICH_EISR" did not return any usage of these registers
> 
> ayankuma@xcbayankuma41x:/scratch/ayankuma/upstream_xen/xen$ grep -ri 
> ICH_MISR *
> xen/arch/arm/include/asm/gic.h:#define GICH_MISR       (0x10)
> xen/arch/arm/include/asm/gic.h:#define GICH_MISR_EOI     (1 << 0)
> xen/arch/arm/include/asm/gic.h:#define GICH_MISR_U       (1 << 1)
> xen/arch/arm/include/asm/gic.h:#define GICH_MISR_LRENP   (1 << 2)
> xen/arch/arm/include/asm/gic.h:#define GICH_MISR_NP      (1 << 3)
> xen/arch/arm/include/asm/gic.h:#define GICH_MISR_VGRP0E  (1 << 4)
> xen/arch/arm/include/asm/gic.h:#define GICH_MISR_VGRP0D  (1 << 5)
> xen/arch/arm/include/asm/gic.h:#define GICH_MISR_VGRP1E  (1 << 6)
> xen/arch/arm/include/asm/gic.h:#define GICH_MISR_VGRP1D  (1 << 7)
> xen/arch/arm/include/asm/arm64/sysregs.h:#define 
> ICH_MISR_EL2              S3_4_C12_C11_2
> 
> ayankuma@xcbayankuma41x:/scratch/ayankuma/upstream_xen/xen$ grep -ri 
> ICH_EISR *
> xen/arch/arm/include/asm/gic.h:#define GICH_EISR0      (0x20)
> xen/arch/arm/include/asm/gic.h:#define GICH_EISR1      (0x24)
> xen/arch/arm/include/asm/arm64/sysregs.h:#define 
> ICH_EISR_EL2              S3_4_C12_C11_3
> 
> As I see, they seem deadcode for me.
Macros are preprocessor constructs whose content is replaced whenever the name is used.
I would not call this a deadcode as this is not something that can be executed.
If a macro is not used, its content will not appear in the actual code.

> 
> Do you suggest that we should remove them ? If so, I can send a patch 
> for this.
This is a question to maintainers.
Bare in mind that we really have a lot of unused macros in Xen codebase.
IMO, if we decide to remove them, this should be done in a single series,
so no need to add another additional patch in your series, especially if you
are not modifying this code directly.

> 
> - Ayan
> 
>>
>> ~Michal

~Michal

