Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 873896B25C4
	for <lists+xen-devel@lfdr.de>; Thu,  9 Mar 2023 14:47:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508284.782821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paGbJ-0005k1-1E; Thu, 09 Mar 2023 13:46:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508284.782821; Thu, 09 Mar 2023 13:46:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paGbI-0005hh-Ui; Thu, 09 Mar 2023 13:46:32 +0000
Received: by outflank-mailman (input) for mailman id 508284;
 Thu, 09 Mar 2023 13:46:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ne43=7B=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1paGbH-0005hb-MH
 for xen-devel@lists.xenproject.org; Thu, 09 Mar 2023 13:46:32 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c824d530-be80-11ed-956e-85ef70e17bfa;
 Thu, 09 Mar 2023 14:46:25 +0100 (CET)
Received: from MW4P220CA0022.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::27)
 by CH2PR12MB4325.namprd12.prod.outlook.com (2603:10b6:610:a9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.18; Thu, 9 Mar
 2023 13:46:21 +0000
Received: from CO1NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:115:cafe::59) by MW4P220CA0022.outlook.office365.com
 (2603:10b6:303:115::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19 via Frontend
 Transport; Thu, 9 Mar 2023 13:46:21 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT057.mail.protection.outlook.com (10.13.174.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.18 via Frontend Transport; Thu, 9 Mar 2023 13:46:21 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 9 Mar
 2023 07:46:20 -0600
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 9 Mar 2023 07:46:19 -0600
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
X-Inumbo-ID: c824d530-be80-11ed-956e-85ef70e17bfa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FCUCBVuAha2F5KGdV6KigIZGxRc1Ae0qdbGjYkiv6NtYfpGpj9Vg+ynbEtT/V98nnQSrdeCeQZRQPuFyBCkxU3YDmIYOqOiLxsQujaI+2F/ivGPk52h3cLg18dviL4YEGDybie1jjNZcKxHP/RRUynibYlUMdCVj0l3CDJyaUxgEwG5+OyquSTtDuzMmijYHlLPiUF2Gk2OCMpz57ki8NFB9rF9hxWwV08hf2WcspXrAo0d7wMk27pZwu6JrRzOIKqyqU5ps1Xml3U7xt3WiW6TzhoFSyJm5bZhZ4lCS1VJL9gFYh1ONtI80GlY2at4bS2l0udQc1w5zIN3lwKhavw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tXnibmtTrFawTaL2374okS9Ai2LcsMHUqWONMynBM3M=;
 b=L74eIHcpe+sacw1ciFai/BcfWasL6huRXC6t19oXgasG5uwZApY2djzmwwM4tDMndYnPJjVp7HR8Fi2KKX3PvLluE/NW5+6K+LPeGxGnXcBGe3sqXH3/Tq2da6/pPgJaSqRbFJzKTDxtJx3RVLZDWQW9QD1n09QOSOwjRLgREQgxQKbExZHhqrRVh3JUAF2d7u22ExuToHPp2UCmitaxgvGgZ7vCJAcmI3ct6dwUsjroO8XbRMSa9Fh0kkrK23P3MUHxfVrg3BFKi8uxD1F9P6Y0o0NgRdsD240nd7vWybRCStMe2uxHglKuXRxkWt7DTDgDeUX6rW/FzY20ubBQtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tXnibmtTrFawTaL2374okS9Ai2LcsMHUqWONMynBM3M=;
 b=UJ1l729hoiDvgfYWypePF9V5JqsCucJfZRFhzoogyR8mROwCra+QB5vAGOnrVaLUZGcyyWEzar9hEdPOTrCT+RwBVs2DG+VFLbWYJztzIJgJggQVrL0YVIZx/vUddzOO4pIyAWuZsVniJnORT+jQmfYgPTV7eW/yrAnwDS95/dg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <93cefcfc-1cfe-bb79-0f6d-5e578ad153fa@amd.com>
Date: Thu, 9 Mar 2023 14:46:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 2/2] arch/arm: time: Add support for parsing interrupts
 by names
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, "Andrei Cherechesu (OSS)"
	<andrei.cherechesu@oss.nxp.com>, Xen-devel <xen-devel@lists.xenproject.org>,
	Andrei Cherechesu <andrei.cherechesu@nxp.com>, Julien Grall <julien@xen.org>
References: <20230307100949.9231-1-andrei.cherechesu@oss.nxp.com>
 <20230307100949.9231-3-andrei.cherechesu@oss.nxp.com>
 <370745D6-D6AF-43D0-8E9F-2DB160BE0E07@arm.com>
 <alpine.DEB.2.22.394.2303071301300.863724@ubuntu-linux-20-04-desktop>
 <B58C926D-25FD-4EB6-A83C-229E72E16181@arm.com>
 <7a0734e9-a980-3dc1-026d-0c96a89c4d5c@amd.com>
 <0932C0EB-F90A-45D4-87F4-3594E6E74C64@arm.com>
 <3c0a6e88-2a1a-f06a-cac1-59801b1acfd6@amd.com>
 <D0D43830-5F75-4284-86E5-967E2059B377@arm.com>
 <df481924-6fa9-cac3-f822-9ff51b0824fe@amd.com>
 <CA41DB66-DB7E-4EDD-9A34-38328A2A8C9E@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <CA41DB66-DB7E-4EDD-9A34-38328A2A8C9E@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT057:EE_|CH2PR12MB4325:EE_
X-MS-Office365-Filtering-Correlation-Id: 810512f1-6903-4a74-2405-08db20a4aaaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MTECn1OeQjEBCGrhI6cRs5ibxMynsrPuudMpDcJFnz7JcGXAarSWsFIlZ1m1kpGvTjaygr3V7IHP7AkbKW5ofLVY+kq3kDsWhy+Yj4WTbdYJSFpowismiahBrQpA0kWqTz4w5kp7VmLc3m+PR9DU40p2OxWtR+kdLiPeRF99tKPsp/vd3WFh8E5fNG/D3TjaEh1UoauNQNMELv7NQ5WJlRo/K/S25DWhySb+56oa2X9JeAGyxe/9H+1nQg/kk4P8GKG1b9rSypC40KqgliAhlkVay5XTpaOGUG19jjTyvlkv4dDtFIwabXc0/8PV2QuPDhcQmUEPlSbGowD4Tir9zDvu/7y7/bEXUxAl1Y3BaiB27v9CTNuHt5XxHHwgnrZrVRN+GjBmME7Y4Rw368v6ijzw+L4BHBKFxJftMgiORsFllUMkwffZapCG0StocG5siRLrKKkIA59XN+kF4V4yG8qSQND9BCb1YblDqzOE149WhoBWbOs/Q4KRtzJIiGVqwaUEVOCdNnwFTBgP3cc01/6ZadqCWTTRRc6F9BgEdbsZFlkIVpHDh53pXFZajkg7T8+998eFaa9BaNpDMqL99+Bt6esHYGRJ6x3pcMES3+ZnG6tq/mHuMvzlhN5Qxd54LEMdN41d1gMPMJdMjnxHpxyIHjDkGFENwwRq6D0AICqRmo3WMGTz1ThX9Jwrxr7ZQgBfusmn8Hr7g1zHQlULhRQC2EJ9eu7/9onDAqK9pMMopouvaDsCx/CuQnXLYoI3mml02ztOItQe/DAMXGPYRA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(136003)(346002)(376002)(451199018)(40470700004)(46966006)(36840700001)(31686004)(82310400005)(82740400003)(36860700001)(83380400001)(426003)(47076005)(36756003)(54906003)(478600001)(40480700001)(356005)(316002)(16576012)(2616005)(336012)(40460700003)(186003)(26005)(81166007)(53546011)(5660300002)(41300700001)(44832011)(70206006)(8936002)(4326008)(6916009)(70586007)(8676002)(2906002)(86362001)(31696002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 13:46:21.1497
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 810512f1-6903-4a74-2405-08db20a4aaaa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4325



On 09/03/2023 13:45, Bertrand Marquis wrote:
> 
> 
> Hi Michal,
> 
>> On 9 Mar 2023, at 13:42, Michal Orzel <michal.orzel@amd.com> wrote:
>>
>> Hi Bertrand,
>>
>> On 09/03/2023 13:19, Bertrand Marquis wrote:
>>>
>>>
>>> Hi Michal,
>>>
>>>> On 9 Mar 2023, at 12:35, Michal Orzel <michal.orzel@amd.com> wrote:
>>>>
>>>>
>>>>
>>>> On 09/03/2023 11:39, Bertrand Marquis wrote:
>>>>>
>>>>>
>>>>> Hi Michal,
>>>>>
>>>>>> On 9 Mar 2023, at 11:05, Michal Orzel <michal.orzel@amd.com> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 09/03/2023 09:02, Bertrand Marquis wrote:
>>>>>>>
>>>>>>>
>>>>>>> Hi Stefano,
>>>>>>>
>>>>>>>> On 7 Mar 2023, at 22:02, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>>>>>>>
>>>>>>>> On Tue, 7 Mar 2023, Bertrand Marquis wrote:
>>>>>>>>>> On 7 Mar 2023, at 11:09, Andrei Cherechesu (OSS) <andrei.cherechesu@oss.nxp.com> wrote:
>>>>>>>>>>
>>>>>>>>>> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>>>>>>>>>
>>>>>>>>>> Added support for parsing the ARM generic timer interrupts DT
>>>>>>>>>> node by the "interrupt-names" property, if it is available.
>>>>>>>>>>
>>>>>>>>>> If not available, the usual parsing based on the expected
>>>>>>>>>> IRQ order is performed.
>>>>>>>>>>
>>>>>>>>>> Also added the "hyp-virt" PPI to the timer PPI list, even
>>>>>>>>>> though it's currently not in use. If the "hyp-virt" PPI is
>>>>>>>>>> not found, the hypervisor won't panic.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>>>>>>>>> ---
>>>>>>>>>> xen/arch/arm/include/asm/time.h |  3 ++-
>>>>>>>>>> xen/arch/arm/time.c             | 26 ++++++++++++++++++++++----
>>>>>>>>>> 2 files changed, 24 insertions(+), 5 deletions(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/xen/arch/arm/include/asm/time.h b/xen/arch/arm/include/asm/time.h
>>>>>>>>>> index 4b401c1110..49ad8c1a6d 100644
>>>>>>>>>> --- a/xen/arch/arm/include/asm/time.h
>>>>>>>>>> +++ b/xen/arch/arm/include/asm/time.h
>>>>>>>>>> @@ -82,7 +82,8 @@ enum timer_ppi
>>>>>>>>>> TIMER_PHYS_NONSECURE_PPI = 1,
>>>>>>>>>> TIMER_VIRT_PPI = 2,
>>>>>>>>>> TIMER_HYP_PPI = 3,
>>>>>>>>>> -    MAX_TIMER_PPI = 4,
>>>>>>>>>> +    TIMER_HYP_VIRT_PPI = 4,
>>>>>>>>>> +    MAX_TIMER_PPI = 5,
>>>>>>>>>> };
>>>>>>>>>>
>>>>>>>>>> /*
>>>>>>>>>> diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
>>>>>>>>>> index 433d7be909..794da646d6 100644
>>>>>>>>>> --- a/xen/arch/arm/time.c
>>>>>>>>>> +++ b/xen/arch/arm/time.c
>>>>>>>>>> @@ -38,6 +38,14 @@ uint32_t __read_mostly timer_dt_clock_frequency;
>>>>>>>>>>
>>>>>>>>>> static unsigned int timer_irq[MAX_TIMER_PPI];
>>>>>>>>>>
>>>>>>>>>> +static const char *timer_irq_names[MAX_TIMER_PPI] = {
>>>>>>>>>> +    [TIMER_PHYS_SECURE_PPI] = "sec-phys",
>>>>>>>>>> +    [TIMER_PHYS_NONSECURE_PPI] = "phys",
>>>>>>>>>> +    [TIMER_VIRT_PPI] = "virt",
>>>>>>>>>> +    [TIMER_HYP_PPI] = "hyp-phys",
>>>>>>>>>> +    [TIMER_HYP_VIRT_PPI] = "hyp-virt",
>>>>>>>>>> +};
>>>>>>>>>> +
>>>>>>>>>
>>>>>>>>> I would need some reference or a pointer to some doc to check those.
>>>>>>>>>
>>>>>>>>>> unsigned int timer_get_irq(enum timer_ppi ppi)
>>>>>>>>>> {
>>>>>>>>>> ASSERT(ppi >= TIMER_PHYS_SECURE_PPI && ppi < MAX_TIMER_PPI);
>>>>>>>>>> @@ -149,15 +157,25 @@ static void __init init_dt_xen_time(void)
>>>>>>>>>> {
>>>>>>>>>> int res;
>>>>>>>>>> unsigned int i;
>>>>>>>>>> +    bool has_names;
>>>>>>>>>> +
>>>>>>>>>> +    has_names = dt_property_read_bool(timer, "interrupt-names");
>>>>>>>>>>
>>>>>>>>>> /* Retrieve all IRQs for the timer */
>>>>>>>>>> for ( i = TIMER_PHYS_SECURE_PPI; i < MAX_TIMER_PPI; i++ )
>>>>>>>>>> {
>>>>>>>>>> -        res = platform_get_irq(timer, i);
>>>>>>>>>> -
>>>>>>>>>> -        if ( res < 0 )
>>>>>>>>>> +        if ( has_names )
>>>>>>>>>> +            res = platform_get_irq_byname(timer, timer_irq_names[i]);
>>>>>>>>>> +        else
>>>>>>>>>> +            res = platform_get_irq(timer, i);
>>>>>>>>>> +
>>>>>>>>>> +        if ( res > 0 )
>>>>>>>>>
>>>>>>>>> The behaviour of the code is changed here compared to the current
>>>>>>>>> version as res = 0 will now generate a panic.
>>>>>>>>>
>>>>>>>>> Some device tree might not specify an interrupt number and just put
>>>>>>>>> 0 and Xen will now panic on those systems.
>>>>>>>>> As I have no idea if such systems exists and the behaviour is modified
>>>>>>>>> you should justify this and mention it in the commit message or keep
>>>>>>>>> the old behaviour and let 0 go through without a panic.
>>>>>>>>>
>>>>>>>>> @stefano, julien any idea here ? should just keep the old behaviour ?
>>>>>>>>
>>>>>>>> platform_get_irq returns 0 if the irq is 0. The irq cannot be 0 because
>>>>>>>> 0 is reserved for SGIs, not PPIs. So I think it is OK to consider 0 an
>>>>>>>> error.
>>>>>>>
>>>>>>> Problem here is that a DTB might not specify all interrupts and just put
>>>>>>> 0 for the one not used (or not available for example if you have no secure
>>>>>>> world).
>>>>>> Xen requires presence of EL3,EL2 and on such system, at least the following timers needs to be there
>>>>>> according to Arm ARM:
>>>>>> - EL3 phys (if EL3 is there)
>>>>>
>>>>> This might be needed by EL3 but not by Xen.
>>>> Xen requires system with EL3 and if there is EL3, both Arm spec and dt bindings requires sec-phys timer to be there.
>>>> So it would be very strange to see a fake interrupt with IRQ being 0. But if we relly want to only care about
>>>> what Xen needs, then we could live with that (although it is difficult for me to find justification for 0 there).
>>>> Device trees are created per system and if system has EL3, then why forcing 0 to be listed for sec-phys timer?
>>>>
>>>
>>> Let's see that on the other angle: why should Xen check stuff that it does not need ?
>> Because apart from what it needs or not, there is a matter of a failure in Xen.
>> Xen exposes timer IRQs to dom0 as they were taken from dtb and allowing 0 for any of the timer IRQ would result
>> in a Xen failure when reserving such IRQ. Xen presets SGI IRQs, meaning bits 0:15 in allocated_irqs bitmap are set.
>> This is why when calling vgic_reserve_virq and passing SGI always results in calling a BUG().
>>
>> So we have two options:
>> - panic earlier with a meaningful message when IRQ is 0
>> - let Xen continue and reach BUG which would be not that obvious for people using but not knowing Xen
> 
> So you are saying that in the current state 0 would be ignored during scan and create a bug later.
Yes, provided platform_get_irq() returns 0. This is however only theory because IMO it is impossible at the moment.
Both GICs, do not allow specifying SGIs in dt bindings and require at least 3 cells where 1st one specifies type.
So if we have a fake IRQ 0 as PPI, platform_get_irq will return 16 and for SPI - 32.
Therefore I cannot see how it would return 0.

~Michal


