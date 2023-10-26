Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B087D83C0
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 15:41:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623825.972043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw0cC-0005kc-7P; Thu, 26 Oct 2023 13:41:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623825.972043; Thu, 26 Oct 2023 13:41:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw0cC-0005it-3D; Thu, 26 Oct 2023 13:41:36 +0000
Received: by outflank-mailman (input) for mailman id 623825;
 Thu, 26 Oct 2023 13:41:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I5Mm=GI=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qw0cA-0005in-OB
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 13:41:34 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20620.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d4ab70e-7405-11ee-9b0e-b553b5be7939;
 Thu, 26 Oct 2023 15:41:29 +0200 (CEST)
Received: from DM6PR02CA0042.namprd02.prod.outlook.com (2603:10b6:5:177::19)
 by SA3PR12MB7976.namprd12.prod.outlook.com (2603:10b6:806:312::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Thu, 26 Oct
 2023 13:41:24 +0000
Received: from DS2PEPF00003440.namprd02.prod.outlook.com
 (2603:10b6:5:177:cafe::b8) by DM6PR02CA0042.outlook.office365.com
 (2603:10b6:5:177::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19 via Frontend
 Transport; Thu, 26 Oct 2023 13:41:24 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF00003440.mail.protection.outlook.com (10.167.18.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.18 via Frontend Transport; Thu, 26 Oct 2023 13:41:23 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 26 Oct
 2023 08:41:22 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 26 Oct
 2023 08:41:22 -0500
Received: from [10.71.193.58] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Thu, 26 Oct 2023 08:41:21 -0500
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
X-Inumbo-ID: 5d4ab70e-7405-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lmyP3rwImQD6UCVUEP41mg+jANY0Ehy7kotG08v2Jrm+HdWRyPq0+hjdekdNfxV/gCL30je7ftguS0i50Af4PMbsHqtf23W6qa9P1+EnM3cV9UckYBQi1XCM8ifMq8Mr9YRr7Y4M0Fxg+1a9iEzDVZZulasQxMS8VCMwHK6bZgnt6NwcbQiBjSo7l3CVvBiv9QuXDGad/4ZCfsEyYZBoSm6nRK1VO/9o5UJcq0UCrujEatMLw4k/eWIn/NL6OBlMn+TUAbsYcAuHFLdYqaV+1u7uxdbQonPXjtU2HF90jjrkBJmdiZI0lzBan9BnU8ZLt1QpJdV4lj4zo6793dbZKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jpf63Ghrqv+2EEV7KDj6pk+VhyGTFkL8j3vsiqiLCSM=;
 b=eCGq8VxCllPdhUu6FMJtf3w5HLVrkIu79mXEEJVcsUiCWuEaj45mdZOnGuRkMS+g0Yjnb2NA2gzO8r1PapvaveF/JR+Eh3j4jgCn33Je7iORre5nAF2f0PMmSoR4mhzQ/epp0uj/p78KAIAmXP7dVyFD4z12NfzwVRcEROlOf+SdJLxrITor0qM6JlQMrb45oZ8fNcMZLnhE7zQin548ZgMMWeR5P0pCVa1DBksf9eQtrz5xO4/6Ac3eqfJw9PvU34sVdvKYMiva3HRxXrQDdBF7YaRx/C6pYiNdA/tumv+MFYc+l0+eMbtknMtr5mQwayXd4Sfjkt8DG9p6+Dpx+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jpf63Ghrqv+2EEV7KDj6pk+VhyGTFkL8j3vsiqiLCSM=;
 b=KCP/klP0/5ze1mT8Hizs2F4KE1sJGX0NYRnTSGqirzEWTe28WoehB0ezE12aCCWlUyIl3iQYBG6ZplDJJhNL58+MMlCuGSiOwcN7PcrYVsJuu3lgcbhFK3yT3oZkz14Ove1Y85apbGBqwGT4MvG/T/Ir14xYYl/ku9k+Rkz8PD8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <c10f727d-21df-4f60-acec-66b341cd5420@amd.com>
Date: Thu, 26 Oct 2023 15:41:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN v2] xen/arm: arm32: Use adr_l instead of load_paddr for
 getting address of symbols
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <bertrand.marquis@arm.com>
References: <20231026111228.2724962-1-ayan.kumar.halder@amd.com>
 <e470ca62-6b51-4f7a-828b-dd95b881bf71@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <e470ca62-6b51-4f7a-828b-dd95b881bf71@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003440:EE_|SA3PR12MB7976:EE_
X-MS-Office365-Filtering-Correlation-Id: 48f79a33-dca7-4842-260c-08dbd6293e88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yI0/CKObzzV3OKmlDWWFM4/xHlcHact/88voixe1KEIMcZCF2VJA8e9CrYfcy+FWU/fqyPmfpcC6jKB3//b8CoIWP77f9WVptSDfdGK8db88r2X7fs4tuNhfFst6C1R0NMnrpoDlYSauuRVgFBldwR1pf6iE7nju2EykRk56I8B/KiIS0g+6d31zr/2ssVPyly7fGjabfKGaJHM3aiLM3oxfPXrMKKa/EdRvIJF3iSu6xzxSgT9mS2GT5Z7lqUufmXPgcXDd/amMYo1v3CABlIxZaLf5swb4spGufPuDTLEJtGrH6YPHgpgRYGxOHwdMcfO+4fgTDYfs9dxq5VGePQw3OSKQTT46qFs6oUpR1YKgMxJSGbPijyESo54sdiED0jvi7okrGzorb2G8QApZ2LKrudFYf7mj8ygwyZhpMVOCgyFYC3PUEkw9IeCkr1qBjQP1E8hve72isluxsSdeVfewMSpHcz0GiCBDg/aPV+0qeVnAhjjMP11F8EBq3XBoW2wMn0Ajcz5FlZj3+HOThKfPuvXQXn0mLV+NLIedPFTEDPQftRYJI56kjyZJeNg1aCLVIQbgWSJUXuwK/f0nCLc6OQqxENHGPDS515SqpTsmM3bEY5lahRFypS9a0pX8ir2TtNcU6R8n4jWevS9B+/HFxhJN729gqUzBez7zYOomoVZIhHqLfelk1qR+OeCJD2SAA1mWSsecWcUwV4DLkam0smDtWTaHe3yH51FDpprDsYhrWsRxKPNv5/NRZPqwp5QOOrO3EUtC0Ex5MvrkBiTglAF/3Q7BLDuoyos/gLk=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(39860400002)(346002)(396003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(82310400011)(46966006)(36840700001)(40470700004)(40460700003)(44832011)(40480700001)(53546011)(478600001)(2616005)(70586007)(316002)(70206006)(54906003)(110136005)(16576012)(36756003)(31696002)(966005)(86362001)(47076005)(36860700001)(426003)(336012)(81166007)(82740400003)(26005)(356005)(8676002)(8936002)(83380400001)(4326008)(5660300002)(31686004)(2906002)(41300700001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 13:41:23.3389
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48f79a33-dca7-4842-260c-08dbd6293e88
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003440.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7976

Hi Ayan,

On 26/10/2023 13:19, Julien Grall wrote:
> 
> 
> Hi,
> 
> Title: This reads as you replace all adr_l with load_paddr. So how about:
> 
> xen/arm32: head: Replace load_paddr with adr_l when they are equivalent
> 
> On 26/10/2023 12:12, Ayan Kumar Halder wrote:
>> Before the MMU is turned on, PC uses physical address. Thus, one can use adr_l
>> instead of load_paddr to obtain the physical address of a symbol.
>>
>> The only exception (for this replacement) is create_table_entry() which is
>> called before and after MMU is turned on.
>>
>> Also, in lookup_processor_type() "r10" is no longer used. The reason being
>> __lookup_processor_type uses adr_l (thus r10 is no longer used to obtain the
>> physical address offset).
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>> Refer https://lists.archive.carbon60.com/xen/devel/682900 for details.
>>
>> Changes from :-
>>
>> v1 :- 1. No need to modify create_table_entry().
>> 2. Remove "mov   r10, #0 " in lookup_processor_type().
>>
>>   xen/arch/arm/arm32/head.S | 13 ++++++-------
>>   1 file changed, 6 insertions(+), 7 deletions(-)
>>

[...]
>>   /* This provides a C-API version of __lookup_processor_type */
>>   ENTRY(lookup_processor_type)
>>           stmfd sp!, {r4, r10, lr}
> 
> Do we still need to save/restore r10?
Apart from this remark...

> 
>> -        mov   r10, #0                   /* r10 := offset between virt&phys */
>>           bl    __lookup_processor_type
>>           mov r0, r1
>>           ldmfd sp!, {r4, r10, pc}
>> @@ -897,8 +896,8 @@ ENTRY(lookup_processor_type)
>>    */
there is also a comment here listing r10 as the register in use and explaining
the need to calculate the offset. This should be tweaked as well (r10 is no longer in use
and we don't care if we are running before or after MMU is on, since adr_l will always get us
the address in the current address space which is what we expect (before MMU - physical, after MMU - virtual).

>>   __lookup_processor_type:
>>           mrc   CP32(r0, MIDR)                /* r0 := our cpu id */
>> -        load_paddr r1, __proc_info_start
>> -        load_paddr r2, __proc_info_end
>> +        adr_l r1, __proc_info_start
>> +        adr_l r2, __proc_info_end
>>   1:      ldr   r3, [r1, #PROCINFO_cpu_mask]
>>           and   r4, r0, r3                    /* r4 := our cpu id with mask */
>>           ldr   r3, [r1, #PROCINFO_cpu_val]   /* r3 := cpu val in current proc info */
> 
> Cheers,
> 
> --
> Julien Grall

~Michal

