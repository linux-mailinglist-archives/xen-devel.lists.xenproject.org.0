Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83896742100
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 09:31:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556669.869370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEm7K-0006X8-Mr; Thu, 29 Jun 2023 07:31:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556669.869370; Thu, 29 Jun 2023 07:31:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEm7K-0006Uv-Ij; Thu, 29 Jun 2023 07:31:02 +0000
Received: by outflank-mailman (input) for mailman id 556669;
 Thu, 29 Jun 2023 07:31:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Akp1=CR=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qEm7J-0006Up-Fs
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 07:31:01 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20619.outbound.protection.outlook.com
 [2a01:111:f400:7e88::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ddb342c1-164e-11ee-8611-37d641c3527e;
 Thu, 29 Jun 2023 09:30:49 +0200 (CEST)
Received: from BYAPR02CA0035.namprd02.prod.outlook.com (2603:10b6:a02:ee::48)
 by SJ2PR12MB8926.namprd12.prod.outlook.com (2603:10b6:a03:53b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 29 Jun
 2023 07:30:42 +0000
Received: from CO1NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:a02:ee:cafe::8a) by BYAPR02CA0035.outlook.office365.com
 (2603:10b6:a02:ee::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.22 via Frontend
 Transport; Thu, 29 Jun 2023 07:30:42 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT029.mail.protection.outlook.com (10.13.174.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.48 via Frontend Transport; Thu, 29 Jun 2023 07:30:41 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 29 Jun
 2023 02:30:39 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Thu, 29 Jun 2023 02:30:38 -0500
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
X-Inumbo-ID: ddb342c1-164e-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DHDvkNOoydvXtnVM7tGcfMMLv0vz4qO+QnjOnLiMcGvYCaadJpNWYAHCvebv9bj/8IXG9ptyouOb9Wj8xiM0AKIF4U+KdDlQ000BuP3sqPE32TsZ3HQmqJPIGSrqFxSxwHsZ2KcIDMJ2kF4ZkJkTS9zUvJOZW2+LNbKvL0Vcn9M+4Y9lIoeuc2/3dOJ2toazWi//+3Iz5pbDHW9BYGBlW20iBY2zjIqAwWEw7o7o1eQt6rTrHFFW8R6Y1GxMHpsgdI+c2znBWnHUjuT9DlswilagbKGxa+kepDFozWG9I/sz/9Lxw9lNs6En9rgUNDhUUv9jK9JWKyyeQ67awB5vqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mDNw02KRYkqEnEhziAG5CVG9YeQS317PbLXhXDJbJCM=;
 b=V8td29dzYABtCXcGfqdDvKkrqdPYbX53BaQd5Ghq30YzD660in+gajtF/fAKvP3QEbmy1SVFRimvlXATwLkYMtsEctK3vk+PEnBquWNwcr/nf628WpJNdDgLn2QGtNXdSzIBzidLfBmleQbG/iZfRZk7A0/uVBdTDEB1//G01bkvNXqSJnRD22de6umS1HLyVA2Qky86SGExf6kcfimvwZqWwdnBFvaYMGKDegkJAUWIymYxlrKMxlByMSCdlWNpCbyyf7evQPQEkK56friZrd0CJSV7K92B1BdQ7ZvZLlx0ZwMCF3/eDoHVzijWkSxf/tBlMzI8Gqbbqagkd6ugyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mDNw02KRYkqEnEhziAG5CVG9YeQS317PbLXhXDJbJCM=;
 b=DAEgfV9+EmOK1sr5QssCLaBLI+igHjz10uH3YMrG8mZn4WyBE89SIpLeiQmBEGXI2cTNhTmbtZ7nMwWtEj55dk+1ophfs2CqzpsEzaLRtBVIUYFTAGy7N1qqkjzXZ5s1StB53zJ5r4Q4Oz/OmXW+Ff1IRwooODf8ujIpxF/+5Fc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <142cf656-10e5-00b8-d97a-69589a06bcec@amd.com>
Date: Thu, 29 Jun 2023 09:30:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 5/9] xen/arm: Rework the code mapping Xen to avoid relying
 on the size of Xen
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, <Henry.Wang@arm.com>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20230625204907.57291-1-julien@xen.org>
 <20230625204907.57291-6-julien@xen.org>
 <170a1f3c-526a-dfd9-0d87-101fb77f3415@amd.com>
 <158d8b0a-77dc-fccb-716d-36887524a4df@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <158d8b0a-77dc-fccb-716d-36887524a4df@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT029:EE_|SJ2PR12MB8926:EE_
X-MS-Office365-Filtering-Correlation-Id: 202ba27d-779a-4530-848a-08db7872be84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gct/DldGr+6XYcv65j2ESo6Y7r+z0V8QF/ax8hcc+zFfnQuBIpCcWODkbQkwv5huyrh1vCiH5/JanNd3iZhenDuAGijpHcByo69ICimvXp4zSQM0h0cOER0d/+YJ2ODdo3pl+bwVa3FezTEBoEHuBOXSigVmj1bdNdCWjmU83ql32YTH+0zLHXITl3QhqFjjU652YKOgt9H3VT3RnnDYGn0dDoH6JxBRsvGLxKh4YtpT8MZcF4z2AbrORTafTKo435OfSpkrgEKUsjJg0tFRp2bDf3YdxL+Wvzn4WztsTUiLpU0/1U2biVvMpURY1xerN4ERFFw92+/9Vn1MpXeHtdcGwoCzM/rP2A8haurCFd6cQ1RTDIVKllnBNGQrRWc74rcXNVQz3M/l4eKvbLYU73aiONhABmW9yCjmvuFTuAZ7UNx1A7sl1ZSX18YInCABGVVKfuki/8r7tsDFyIs9Y+TWUHnOn237vCNbKChwsTkxatNGsO2M8QpBBHWPeqBefOHOb9bLXHvUKYhUvupL/GFd1BzLtcv/cDw9p4b3/w9wT+06uCzfTcLTtDxw0Q22in5ljVRIxtfBvhMlGKj9Fco0DsFoqB50qHdHMkfR+n7Fv60kZk9XASCaoeMk7ymveq/7h0mF6U3VfHnzBdKpZtaI9ZJWyWUJ/9J0/GESjOsLsz4gZW2GBgKPjVAYzBSluRZZz0qA/Lk7QlHI4Byh/XATE03MQVTJ59b4nCV/0yCa1JWQT2FR1NXuMbwdXSlE7sZkz5+nXtKuALQ6J8gHtSPc2U76tHaeLMJMKF/SVzs8pIIClRk4hGWBcfpFKJid
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(39860400002)(346002)(396003)(451199021)(40470700004)(46966006)(36840700001)(40460700003)(41300700001)(2906002)(478600001)(36860700001)(16576012)(86362001)(31696002)(54906003)(110136005)(82310400005)(356005)(81166007)(82740400003)(426003)(2616005)(70586007)(83380400001)(316002)(36756003)(47076005)(336012)(4326008)(40480700001)(8676002)(5660300002)(8936002)(53546011)(31686004)(70206006)(26005)(44832011)(186003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 07:30:41.9455
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 202ba27d-779a-4530-848a-08db7872be84
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8926



On 28/06/2023 22:02, Julien Grall wrote:
> 
> 
> Hi,
> 
> On 26/06/2023 12:43, Michal Orzel wrote:
>>
>>
>> On 25/06/2023 22:49, Julien Grall wrote:
>>>
>>>
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> At the moment, the maximum size of Xen binary we can support is 2MB.
>>> This is what we reserved in the virtual address but also what all
>>> the code in Xen relies on as we only allocate one L3 page-table.
>>>
>>> When feature like UBSAN (will be enabled in a follow-up patch) and GCOV
>>> are enabled, the binary will be way over 2MB.
>>>
>>> The code is now reworked so it doesn't realy on a specific size but
>> s/realy/rely
>>
>>> will instead look at the reversed size and compute the number of
>>> page-table to allocate/map.
>>>
>>> While at it, replace any reference to 4KB mappings with a more
>>> generic word because the page-size may change in the future.
>>>
>>> Also fix the typo s/tlb/tbl/ in code move in arm32/head.S
>>>
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>> ---
>>>   xen/arch/arm/arm32/head.S         | 61 ++++++++++++++++++++++++-------
>>>   xen/arch/arm/arm64/head.S         | 51 +++++++++++++++++++++-----
>>>   xen/arch/arm/include/asm/config.h |  1 +
>>>   xen/arch/arm/include/asm/lpae.h   |  8 ++--
>>>   xen/arch/arm/mm.c                 | 24 +++++++-----
>>>   5 files changed, 108 insertions(+), 37 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
>>> index 5e3692eb3abf..5448671de897 100644
>>> --- a/xen/arch/arm/arm32/head.S
>>> +++ b/xen/arch/arm/arm32/head.S
>>> @@ -373,35 +373,55 @@ ENDPROC(cpu_init)
>>>   .endm
>>>
>>>   /*
>>> - * Macro to create a page table entry in \ptbl to \tbl
>>> + * Macro to create a page table entry in \ptbl to \tbl (physical
>>> + * address)
>>>    *
>>>    * ptbl:    table symbol where the entry will be created
>>> - * tbl:     table symbol to point to
>>> + * tbl:     physical address of the table to point to
>>>    * virt:    virtual address
>>>    * lvl:     page-table level
>>>    *
>>>    * Preserves \virt
>>> - * Clobbers r1 - r4
>>> + * Clobbers \tbl, r1 - r3
>>>    *
>>>    * Also use r10 for the phys offset.
>> This no longer applies.
> 
> Good point. I will remove it.
> 
>>
>>>    *
>>> - * Note that \virt should be in a register other than r1 - r4
>>> + * Note that \tbl and \virt should be in a register other than r1 - r3
>>>    */
>>> -.macro create_table_entry, ptbl, tbl, virt, lvl
>>> -        get_table_slot r1, \virt, \lvl  /* r1 := slot in \tlb */
>>> -        lsl   r1, r1, #3                /* r1 := slot offset in \tlb */
>>> -
>>> -        load_paddr r4, \tbl
>>> +.macro create_table_entry_from_paddr, ptbl, tbl, virt, lvl
>>> +        get_table_slot r1, \virt, \lvl  /* r1 := slot in \tbl */
>>> +        lsl   r1, r1, #3                /* r1 := slot offset in \tbl */
>>>
>>>           movw  r2, #PT_PT             /* r2:r3 := right for linear PT */
>>> -        orr   r2, r2, r4             /*           + \tlb paddr */
>>> +        orr   r2, r2, \tbl           /*           + \tbl paddr */
>>>           mov   r3, #0
>>>
>>> -        adr_l r4, \ptbl
>>> +        adr_l \tbl, \ptbl            /* \tbl := (v,p)addr of \ptbl */
>>>
>>> -        strd  r2, r3, [r4, r1]
>>> +        strd  r2, r3, [\tbl, r1]
>>>   .endm
>>>
>>> +
>>> +/*
>>> + * Macro to create a page table entry in \ptbl to \tbl (symbol)
>>> + *
>>> + * ptbl:    table symbol where the entry will be created
>>> + * tbl:     table symbol to point to
>>> + * virt:    virtual address
>>> + * lvl:     page-table level
>>> + *
>>> + * Preserves \virt
>>> + * Clobbers r1 - r4
>>> + *
>>> + * Also use r10 for the phys offset.
>>> + *
>>> + * Note that \virt should be in a register other than r1 - r4
>>> + */
>>> +.macro create_table_entry, ptbl, tbl, virt, lvl
>>> +        load_paddr r4, \tbl
>>> +        create_table_entry_from_paddr \ptbl, r4, \virt, \lvl
>>> + .endm
>>> +
>>>   /*
>>>    * Macro to create a mapping entry in \tbl to \paddr. Only mapping in 3rd
>>>    * level table (i.e page granularity) is supported.
>>> @@ -451,13 +471,26 @@ ENDPROC(cpu_init)
>>>    * Output:
>>>    *   r12: Was a temporary mapping created?
>>>    *
>>> - * Clobbers r0 - r4
>>> + * Clobbers r0 - r5
>>>    */
>>>   create_page_tables:
>>>           /* Prepare the page-tables for mapping Xen */
>>>           mov_w r0, XEN_VIRT_START
>>>           create_table_entry boot_pgtable, boot_second, r0, 1
>>> -        create_table_entry boot_second, boot_third, r0, 2
>>> +
>>> +        /*
>>> +         * We need to use a stash register because
>>> +         * create_table_entry_paddr() will clobber the register storing
>>> +         * the physical address of the table to point to.
>>> +         */
>>> +        load_paddr r5, boot_third
>>> +        mov_w r4, XEN_VIRT_START
>> Can you just reuse r0 that is already set to XEN_VIRT_START not to repeat this operation over and over again?
> I decided against this approach for a few reasons:
>   * I wanted the register to be ordered when
> create_table_entry_from_paddr is called.
>   * There is a necessary largish comment on top of XEN_VIRT_START. So it
> makes more "difficult" to find the content of the registers.
> 
> I am actually a bit puzzled with your comment given you were recently
> the one that was pushing for adding extra ISB in the code (I still need
> to send a patch for that) to make the code clearer. ISBs are way more
> expensive than executing two instructions. So is this request just down
> to a matter of taste?
I believe you are right. The resulting code seems to be more clear and easy
to understand and this is what we should care about (which stays consistent with ISB case).
Also, this was more like a comment to check if you just missed it or did it deliberately,
not something crucial (hence I already provided my tag).

~Michal

