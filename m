Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C0F64B2BA
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 10:51:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460356.718253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p51w4-00054d-98; Tue, 13 Dec 2022 09:50:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460356.718253; Tue, 13 Dec 2022 09:50:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p51w4-00051w-6O; Tue, 13 Dec 2022 09:50:52 +0000
Received: by outflank-mailman (input) for mailman id 460356;
 Tue, 13 Dec 2022 09:50:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nvb8=4L=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p51w2-00051o-Ga
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 09:50:50 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2071.outbound.protection.outlook.com [40.107.92.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ede5dab-7acb-11ed-91b6-6bf2151ebd3b;
 Tue, 13 Dec 2022 10:50:48 +0100 (CET)
Received: from MW2PR16CA0042.namprd16.prod.outlook.com (2603:10b6:907:1::19)
 by DS0PR12MB7582.namprd12.prod.outlook.com (2603:10b6:8:13c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Tue, 13 Dec
 2022 09:50:44 +0000
Received: from CO1NAM11FT110.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:1:cafe::17) by MW2PR16CA0042.outlook.office365.com
 (2603:10b6:907:1::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8 via Frontend
 Transport; Tue, 13 Dec 2022 09:50:44 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT110.mail.protection.outlook.com (10.13.175.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.21 via Frontend Transport; Tue, 13 Dec 2022 09:50:43 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 13 Dec
 2022 03:50:42 -0600
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 13 Dec 2022 03:50:41 -0600
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
X-Inumbo-ID: 9ede5dab-7acb-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fJXUCYDK0P1vMFZPmIYAI3eTN2uMARr5G/4m5vBr6E/6cJFh/U7tChERqTHojb5dlaoU5ggQdfgbXaqYwPyLBXK0XlsaFUExgAD00OjzEcvGzwugO1yUsNI8ylu77A/wiXE5qLr7HBwca34WBtfalEV13HlWePVj9KL2K/lCffvMCzp8VZxsWOjdDgtSK1qoQK1hJ7eQ4PHtFaezU+oxe7bhKRaERS/Nypsdjf+dsC0mlL5XfMD7eyYmCcM2scb1cbNtpKFNXl1ZrUZEGjL0HaPyqgemJzymNcLBr3pxQzgyanvrmmQGtezKrDnuKpuQsd1+eTYUl4IaIe1hLI9DYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BpGYpQLpiYNG4IMYJmZTzr5C+lGyRr8TzkKCHh9njpc=;
 b=FlyrbCDgoF3IWVxFIVLv+Ti1dLLWz6KRQv5ZLPqfXZJrl3kPMkoFpRY5Wi4YecHEU/RTkOTt/JxgS/JnysaGBVsbhR7x0xK9EIIOYt2JEsV8JxSv4ddaOetTk8zdsNGxMxIpn2iDRaBScB3AlflprgnY4Wo9haBPn63cI46d6GlRdJuzqgMOBTiLKCK5KdxYVTb8giluG4x+qOj8wEE26+k+e7QYkq2nqcPJqEO9DJUPgYWoeTwwHTxaiD9Q06JQaJuHXgn0giThwpXGWADttCXA2by3reQmlYfNupH8q6enNbTqIeZ7FyP+8fP/BJWwKqEC8WwSNa6LKL7N20AYzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BpGYpQLpiYNG4IMYJmZTzr5C+lGyRr8TzkKCHh9njpc=;
 b=UaS0qdW4FYcoMazcoefrEh836fI2lGXAiRRoTfJw9b9QzYgsiCRwBtiDwCFWTxL4P/VdLumb4exnp/++iQrur9gc9aNLlmEX1pHLwS/98pu01mZyEG5XwQn+BINP7cQqfu4wzDJt407Ji2Rm7+Nqu9IHpjLxzKJ+ay2iBXUp5QA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <4eecd73b-df8b-bbdb-b9ce-0d4ae720f8f6@amd.com>
Date: Tue, 13 Dec 2022 10:50:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 01/18] xen/arm64: flushtlb: Reduce scope of barrier for
 local TLB flush
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, Julien Grall <jgrall@amazon.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221212095523.52683-1-julien@xen.org>
 <20221212095523.52683-2-julien@xen.org>
 <650bc040-63a9-8950-e2ff-6829c9a452a8@amd.com>
 <a45d9304-0db3-930b-7ebd-1ae1dafabac8@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <a45d9304-0db3-930b-7ebd-1ae1dafabac8@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT110:EE_|DS0PR12MB7582:EE_
X-MS-Office365-Filtering-Correlation-Id: d6f0924d-d9f1-46ec-4652-08dadcef80af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+KlIBHgjHN14RE4uzN6iMhJXz72klzjC90n9mfweIWcx+QAjMm8aWJtILgYYtQvfK4KInHX8p8go1wJyuqF835+agcigX0n2v8LYZgV0cUAFRE9Yfy6GvLGfjlR0whcMtM0PZ+TOh81P1HBVV7iKT8DURG618VCmXACuZJldN22jIt+8eEJJ30uapnlTtbIQZI+5FXayJxMpFKySusHgoSBYS4VXD61aEUgIfXz40ahWQksZrcR3OirMj6WwOqD+ZKba6Ru9mnVP3kog17u0ww7sYuFBbLMMeSQHJzstDKGPX9F16Z5n6j50bEB9OwUeVL1+GiFwDvlarHjnOLvA9/K4cnnG/tfj+EBFO7qzOpvRyRD2tORorbVJ4orwhl/S6rZGqOdOopis1zyor3K2tGYmlyKLKmjVke9w5HHJl/HrzWLwMDVXZcK/qI0TD1YfS/2ZnQLaFPg0k0seUmft90p7iRNTKvQUVEJZU6SxJzEcH1p1QqAzGjWr9BUvtaNfPOvtFfbAETTf2xoYYvfoAsyDBsnRDSfZfL+IBdYq4OLuMkaiTHiqHgNcpxlBIy0Tvgs6l+a8rj6iGjeNi1KU3ERDxWt7qC0yMJta0GGgee/nsBv/bzQVBBbQq6CCs3iuKoqfWImvlL10wGeZQKcEQ5DFUuUjho5ZkUvd1vSsWfyLelctYqQwfWhDUARdgAZ4/Ith34tQe97N4qnfMz8zuyZDXB1lC0qPdlYHj7K6g20krvUKae/1a5qaWqQpmEIk4m7Vszj7zuJZbmyeF0qTGA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(376002)(346002)(451199015)(36840700001)(46966006)(40470700004)(81166007)(82740400003)(356005)(36860700001)(31696002)(40480700001)(41300700001)(82310400005)(86362001)(40460700003)(8936002)(478600001)(4326008)(426003)(186003)(70586007)(8676002)(110136005)(70206006)(2906002)(83380400001)(54906003)(47076005)(316002)(26005)(2616005)(53546011)(44832011)(336012)(16576012)(5660300002)(31686004)(36756003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2022 09:50:43.9048
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6f0924d-d9f1-46ec-4652-08dadcef80af
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT110.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7582

Hi Julien,

On 13/12/2022 10:45, Julien Grall wrote:
> 
> 
> On 13/12/2022 09:11, Michal Orzel wrote:
>> Hi Julien,
> 
> Hi Michal,
> 
>> On 12/12/2022 10:55, Julien Grall wrote:
>>>
>>>
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> Per D5-4929 in ARM DDI 0487H.a:
>>> "A DSB NSH is sufficient to ensure completion of TLB maintenance
>>>   instructions that apply to a single PE. A DSB ISH is sufficient to
>>>   ensure completion of TLB maintenance instructions that apply to PEs
>>>   in the same Inner Shareable domain.
>>> "
>>>
>>> This means barrier after local TLB flushes could be reduced to
>>> non-shareable.
>>>
>>> Note that the scope of the barrier in the workaround has not been
>>> changed because Linux v6.1-rc8 is also using 'ish' and I couldn't
>>> find anything in the Neoverse N1 suggesting that a 'nsh' would
>>> be sufficient.
>>>
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>>
>>> ---
>>>
>>>      I have used an older version of the Arm Arm because the explanation
>>>      in the latest (ARM DDI 0487I.a) is less obvious. I reckon the paragraph
>>>      about DSB in D8.13.8 is missing the shareability. But this is implied
>>>      in B2.3.11:
>>>
>>>      "If the required access types of the DSB is reads and writes, the
>>>       following instructions issued by PEe before the DSB are complete for
>>>       the required shareability domain:
>>>
>>>       [...]
>>>
>>>       — All TLB maintenance instructions.
>>>      "
>>>
>>>      Changes in v3:
>>>          - Patch added
>>> ---
>>>   xen/arch/arm/include/asm/arm64/flushtlb.h | 27 ++++++++++++++---------
>>>   1 file changed, 16 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/include/asm/arm64/flushtlb.h b/xen/arch/arm/include/asm/arm64/flushtlb.h
>>> index 7c5431518741..39d429ace552 100644
>>> --- a/xen/arch/arm/include/asm/arm64/flushtlb.h
>>> +++ b/xen/arch/arm/include/asm/arm64/flushtlb.h
>>> @@ -12,8 +12,9 @@
>>>    * ARM64_WORKAROUND_REPEAT_TLBI:
>> Before this line, in the same comment, we state DSB ISHST. This should also be changed
>> to reflect the change done by this patch.
> 
> This is on purpose. I decided to keep the sequence as-is and instead add
> a paragraph explaining that 'nsh' is sufficient for local TLB flushes.
> 
>>
>>>    * Modification of the translation table for a virtual address might lead to
>>>    * read-after-read ordering violation.
>>> - * The workaround repeats TLBI+DSB operation for all the TLB flush operations.
>>> - * While this is stricly not necessary, we don't want to take any risk.
>>> + * The workaround repeats TLBI+DSB ISH operation for all the TLB flush
>>> + * operations. While this is stricly not necessary, we don't want to
>> s/stricly/strictly/
>>
>>> + * take any risk.
>>>    *
>>>    * For Xen page-tables the ISB will discard any instructions fetched
>>>    * from the old mappings.
>>> @@ -21,38 +22,42 @@
>>>    * For the Stage-2 page-tables the ISB ensures the completion of the DSB
>>>    * (and therefore the TLB invalidation) before continuing. So we know
>>>    * the TLBs cannot contain an entry for a mapping we may have removed.
>>> + *
>>> + * Note that for local TLB flush, using non-shareable (nsh) is sufficient
>>> + * (see D5-4929 in ARM DDI 0487H.a). Althougth, the memory barrier in
>> s/Althougth/Although/
>>
>>> + * for the workaround is left as inner-shareable to match with Linux.
>> So for the workaround we stay with DSB ISH. But ...
>>
>>>    */
>>> -#define TLB_HELPER(name, tlbop)                  \
>>> +#define TLB_HELPER(name, tlbop, sh)              \
>>>   static inline void name(void)                    \
>>>   {                                                \
>>>       asm volatile(                                \
>>> -        "dsb  ishst;"                            \
>>> +        "dsb  "  # sh  "st;"                     \
>>>           "tlbi "  # tlbop  ";"                    \
>>>           ALTERNATIVE(                             \
>>>               "nop; nop;",                         \
>>> -            "dsb  ish;"                          \
>>> +            "dsb  "  # sh  ";"                   \
>> ... you do not adhere to this.
> 
> This is a leftover from my previous approach. I will drop it.
> 
> [...]
> 
>>
>> With the remarks fixed:
>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> 
> I am not planning to fix the first remark. Please let me know if your
> Reviewed-by tag stands.
I'm ok with it so you can keep my tag.

> 
> Cheers,
> 
> --
> Julien Grall

~Michal

