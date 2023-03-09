Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 351D96B2326
	for <lists+xen-devel@lfdr.de>; Thu,  9 Mar 2023 12:36:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508236.782701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paEZB-0000LG-Dy; Thu, 09 Mar 2023 11:36:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508236.782701; Thu, 09 Mar 2023 11:36:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paEZB-0000Ha-AQ; Thu, 09 Mar 2023 11:36:13 +0000
Received: by outflank-mailman (input) for mailman id 508236;
 Thu, 09 Mar 2023 11:36:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ne43=7B=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1paEZ9-0000HM-K1
 for xen-devel@lists.xenproject.org; Thu, 09 Mar 2023 11:36:11 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20619.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91c28604-be6e-11ed-956e-85ef70e17bfa;
 Thu, 09 Mar 2023 12:36:02 +0100 (CET)
Received: from MW4PR04CA0079.namprd04.prod.outlook.com (2603:10b6:303:6b::24)
 by BL1PR12MB5112.namprd12.prod.outlook.com (2603:10b6:208:316::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.17; Thu, 9 Mar
 2023 11:35:59 +0000
Received: from CO1NAM11FT093.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6b:cafe::41) by MW4PR04CA0079.outlook.office365.com
 (2603:10b6:303:6b::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19 via Frontend
 Transport; Thu, 9 Mar 2023 11:35:59 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT093.mail.protection.outlook.com (10.13.175.59) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.19 via Frontend Transport; Thu, 9 Mar 2023 11:35:59 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 9 Mar
 2023 05:35:58 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 9 Mar
 2023 05:35:58 -0600
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 9 Mar 2023 05:35:56 -0600
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
X-Inumbo-ID: 91c28604-be6e-11ed-956e-85ef70e17bfa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VSXSk+xLM/o7ACVXbEcyAOrVgz0B2uAGQPSWU05FH4nqeRVY+N2wlyZJUZF8qgaUIJb7X31IqnHwIofYlzzEcSQQNytuzUgjoLXex2SfhTp7WVvUIW9LKfeF5ikqllw7ROzS9IeGy9EgH/euW0pz6yru5KcuOJ49sse2BYaGaBP3iRHjavRD3O79Dr+w8mYJZ7xhI24Fy7JO8Am9COTx2yXiIecTon7tCKdGgPeshRyY/Urvue+HHMU2xi3PaySpZhUJlScQgNZY9f+RrfD0re/lgVPLAYScNEIcg7C00a9DUTZ2fbrUh/GmyFxWBVNRBIYybxMjjp4M7FNAN7/K2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y61hWD/ZE+ATN836ofD3v6R1hGxNajm4TwAjcGG+yik=;
 b=mOikJV62rP6TCztbRhjwgzbzkD6bJbJdM+99Wk2BFKIj/7FGLgx2kJgNn9Ps1YwJEMmtpQOFwUuBg2Q46iVVKwoLo6eYo13z63vIE9s5qlt/wF8TLdAZMvymv6rFXe+MlFNus5U9igU/ywwBNZLepf5jQJm6Vowlj72zP6ehbvxwERxvfVkb6pUwkhaeKzkChDA1KrWTcf8zkK5UqammYIkBJ6GpcLSBMh3lHBa6K8eaTPeGNBp26UMsjWJ9Z5DP7rDvKiSQMHsD1YD9sl0bALQf3b/HkQGxD0hUsHOk9N1VCwuqMu5vhxDitv4SF8Z7XIszyZNExnnftFdstwkbUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y61hWD/ZE+ATN836ofD3v6R1hGxNajm4TwAjcGG+yik=;
 b=tI6cKTQVAaGKMB1XCOlU3jj4jjo0UzdQYBt1dLGXiez44jUm8HlNJNWz7e8O/ksrSs/f5yG6DWjmL2MhTnyfhzmdj+6+3WkIK6Z9csHvGudbjLLp9RIgtQyYrrgGYXTjWJRTv4z4hQ12KTrHQfMQ4AQGcGeTx4wachoteE7aCCQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <3c0a6e88-2a1a-f06a-cac1-59801b1acfd6@amd.com>
Date: Thu, 9 Mar 2023 12:35:56 +0100
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
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <0932C0EB-F90A-45D4-87F4-3594E6E74C64@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT093:EE_|BL1PR12MB5112:EE_
X-MS-Office365-Filtering-Correlation-Id: 083950fc-c97c-4885-d4b1-08db2092745c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8e5W4+UeRrnv9/zTjdxLMs+R9ntTOrpKIbK2h86rxc4+BNSY+4fwRoQ3acMUaEsMvpQIE+ZENY5OhIhzP2AAKKq4K0QpYVbew/+IFodKDcZObGhXfebPP8ZMCUhI07AnmFwRpqgr1IEpDT5BiXykkwbA5NJO1Kr/6M8YdVc89OJ4ZCT5rkECtxh/R7Qkh/GvMGp021mXjeTKJVgn9NE4CfBVEGmU+zfcueZ4ohKKvSc2ugJqK8B9gQVFxk3abaE9Z7TS4Psj9jb1fVZ93Qd3rJA5qK+npJl66WUeEYqdls3AahX5QnyNHe/9tFg+PaMtOU1SjEPOigQ5iax6klSxMLv5GGsU0mRGHV1ZLKLf2aj/0MBb+8MClJdkcQhDhv6QdruK9csBpO23u/omdr+Ol7VCA3TDv4RZlRvROciB+upL5cBib8y1qX2BIL1mISXgl7obKWxJhGJCg36u0zLoIP/wY653RSJO/6cPLzoWXHDRRnENfqgVatziIf5/wuTaID7t3BBvt7eWF0vrQslTwhpZlxvd1qTFXsachPLq+UXp7uW+WN1ET6QAKlUfK9QHT8ZQfFTj48iT/twJqmanbm4pAxp0q6tNN1Qt7jVLRjhisMHnSV4SpmC14jlNzeRgVQQn23DyASM1QIX9bMWoz41ASeC2fThONKCixixTkJtPK0XwxaXdcj7HoAOWcMQkBKJ6kLhTezoHciN2UkLYiU9/cuR9/ZkuBteUfsiroXO5sLSeK83l7oXAuLFe1GQ5Q5ednJQSyKJGKq1h/+sW9w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(396003)(136003)(39860400002)(451199018)(46966006)(40470700004)(36840700001)(40460700003)(36756003)(356005)(316002)(16576012)(54906003)(41300700001)(5660300002)(478600001)(8936002)(2906002)(6916009)(8676002)(70206006)(70586007)(4326008)(44832011)(82740400003)(186003)(36860700001)(86362001)(81166007)(40480700001)(31696002)(26005)(2616005)(53546011)(83380400001)(82310400005)(336012)(426003)(47076005)(31686004)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 11:35:59.1205
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 083950fc-c97c-4885-d4b1-08db2092745c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT093.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5112



On 09/03/2023 11:39, Bertrand Marquis wrote:
> 
> 
> Hi Michal,
> 
>> On 9 Mar 2023, at 11:05, Michal Orzel <michal.orzel@amd.com> wrote:
>>
>>
>>
>> On 09/03/2023 09:02, Bertrand Marquis wrote:
>>>
>>>
>>> Hi Stefano,
>>>
>>>> On 7 Mar 2023, at 22:02, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>>>
>>>> On Tue, 7 Mar 2023, Bertrand Marquis wrote:
>>>>>> On 7 Mar 2023, at 11:09, Andrei Cherechesu (OSS) <andrei.cherechesu@oss.nxp.com> wrote:
>>>>>>
>>>>>> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>>>>>
>>>>>> Added support for parsing the ARM generic timer interrupts DT
>>>>>> node by the "interrupt-names" property, if it is available.
>>>>>>
>>>>>> If not available, the usual parsing based on the expected
>>>>>> IRQ order is performed.
>>>>>>
>>>>>> Also added the "hyp-virt" PPI to the timer PPI list, even
>>>>>> though it's currently not in use. If the "hyp-virt" PPI is
>>>>>> not found, the hypervisor won't panic.
>>>>>>
>>>>>> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>>>>> ---
>>>>>> xen/arch/arm/include/asm/time.h |  3 ++-
>>>>>> xen/arch/arm/time.c             | 26 ++++++++++++++++++++++----
>>>>>> 2 files changed, 24 insertions(+), 5 deletions(-)
>>>>>>
>>>>>> diff --git a/xen/arch/arm/include/asm/time.h b/xen/arch/arm/include/asm/time.h
>>>>>> index 4b401c1110..49ad8c1a6d 100644
>>>>>> --- a/xen/arch/arm/include/asm/time.h
>>>>>> +++ b/xen/arch/arm/include/asm/time.h
>>>>>> @@ -82,7 +82,8 @@ enum timer_ppi
>>>>>>   TIMER_PHYS_NONSECURE_PPI = 1,
>>>>>>   TIMER_VIRT_PPI = 2,
>>>>>>   TIMER_HYP_PPI = 3,
>>>>>> -    MAX_TIMER_PPI = 4,
>>>>>> +    TIMER_HYP_VIRT_PPI = 4,
>>>>>> +    MAX_TIMER_PPI = 5,
>>>>>> };
>>>>>>
>>>>>> /*
>>>>>> diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
>>>>>> index 433d7be909..794da646d6 100644
>>>>>> --- a/xen/arch/arm/time.c
>>>>>> +++ b/xen/arch/arm/time.c
>>>>>> @@ -38,6 +38,14 @@ uint32_t __read_mostly timer_dt_clock_frequency;
>>>>>>
>>>>>> static unsigned int timer_irq[MAX_TIMER_PPI];
>>>>>>
>>>>>> +static const char *timer_irq_names[MAX_TIMER_PPI] = {
>>>>>> +    [TIMER_PHYS_SECURE_PPI] = "sec-phys",
>>>>>> +    [TIMER_PHYS_NONSECURE_PPI] = "phys",
>>>>>> +    [TIMER_VIRT_PPI] = "virt",
>>>>>> +    [TIMER_HYP_PPI] = "hyp-phys",
>>>>>> +    [TIMER_HYP_VIRT_PPI] = "hyp-virt",
>>>>>> +};
>>>>>> +
>>>>>
>>>>> I would need some reference or a pointer to some doc to check those.
>>>>>
>>>>>> unsigned int timer_get_irq(enum timer_ppi ppi)
>>>>>> {
>>>>>>   ASSERT(ppi >= TIMER_PHYS_SECURE_PPI && ppi < MAX_TIMER_PPI);
>>>>>> @@ -149,15 +157,25 @@ static void __init init_dt_xen_time(void)
>>>>>> {
>>>>>>   int res;
>>>>>>   unsigned int i;
>>>>>> +    bool has_names;
>>>>>> +
>>>>>> +    has_names = dt_property_read_bool(timer, "interrupt-names");
>>>>>>
>>>>>>   /* Retrieve all IRQs for the timer */
>>>>>>   for ( i = TIMER_PHYS_SECURE_PPI; i < MAX_TIMER_PPI; i++ )
>>>>>>   {
>>>>>> -        res = platform_get_irq(timer, i);
>>>>>> -
>>>>>> -        if ( res < 0 )
>>>>>> +        if ( has_names )
>>>>>> +            res = platform_get_irq_byname(timer, timer_irq_names[i]);
>>>>>> +        else
>>>>>> +            res = platform_get_irq(timer, i);
>>>>>> +
>>>>>> +        if ( res > 0 )
>>>>>
>>>>> The behaviour of the code is changed here compared to the current
>>>>> version as res = 0 will now generate a panic.
>>>>>
>>>>> Some device tree might not specify an interrupt number and just put
>>>>> 0 and Xen will now panic on those systems.
>>>>> As I have no idea if such systems exists and the behaviour is modified
>>>>> you should justify this and mention it in the commit message or keep
>>>>> the old behaviour and let 0 go through without a panic.
>>>>>
>>>>> @stefano, julien any idea here ? should just keep the old behaviour ?
>>>>
>>>> platform_get_irq returns 0 if the irq is 0. The irq cannot be 0 because
>>>> 0 is reserved for SGIs, not PPIs. So I think it is OK to consider 0 an
>>>> error.
>>>
>>> Problem here is that a DTB might not specify all interrupts and just put
>>> 0 for the one not used (or not available for example if you have no secure
>>> world).
>> Xen requires presence of EL3,EL2 and on such system, at least the following timers needs to be there
>> according to Arm ARM:
>> - EL3 phys (if EL3 is there)
> 
> This might be needed by EL3 but not by Xen.
Xen requires system with EL3 and if there is EL3, both Arm spec and dt bindings requires sec-phys timer to be there.
So it would be very strange to see a fake interrupt with IRQ being 0. But if we relly want to only care about
what Xen needs, then we could live with that (although it is difficult for me to find justification for 0 there).
Device trees are created per system and if system has EL3, then why forcing 0 to be listed for sec-phys timer?

~Michal

