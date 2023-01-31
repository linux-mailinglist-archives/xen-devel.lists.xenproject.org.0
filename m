Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 093FB6828A1
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 10:23:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487467.755093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMmqt-00066M-Dr; Tue, 31 Jan 2023 09:22:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487467.755093; Tue, 31 Jan 2023 09:22:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMmqt-00063X-Ag; Tue, 31 Jan 2023 09:22:55 +0000
Received: by outflank-mailman (input) for mailman id 487467;
 Tue, 31 Jan 2023 09:22:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OPLs=54=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pMmqr-00063P-Kb
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 09:22:53 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2040.outbound.protection.outlook.com [40.107.92.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d54d885c-a148-11ed-933c-83870f6b2ba8;
 Tue, 31 Jan 2023 10:22:51 +0100 (CET)
Received: from BN9PR03CA0302.namprd03.prod.outlook.com (2603:10b6:408:112::7)
 by IA1PR12MB8357.namprd12.prod.outlook.com (2603:10b6:208:3ff::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Tue, 31 Jan
 2023 09:22:48 +0000
Received: from BN8NAM11FT097.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:112:cafe::4f) by BN9PR03CA0302.outlook.office365.com
 (2603:10b6:408:112::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.37 via Frontend
 Transport; Tue, 31 Jan 2023 09:22:48 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT097.mail.protection.outlook.com (10.13.176.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.28 via Frontend Transport; Tue, 31 Jan 2023 09:22:48 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 31 Jan
 2023 03:22:46 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 31 Jan
 2023 01:22:46 -0800
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 31 Jan 2023 03:22:44 -0600
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
X-Inumbo-ID: d54d885c-a148-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JaXNPVSCBigyGjdDma6TW5b7V7LjocT/xEcr2r9OR3g182pxVDegKgxUWDMKZA+i87rT6R2D74FDPqWVtQovrzEKWWtTrSxlBZf8LzHU+BuFt4Tu5w/LLscAJMme7dV16F+PtJoPtAMiniM2IapYrME6sgJL5IVHt+3I0fI7a3w9KJf8Nuu3BQE8D4EfFyEoUSRXKDU38mI+7VRti4bGFg6VBPaL4dmFFkRXqWw25LuWVuerQ7/O1ZVskywru53t7y2TqEftvMkl3Thmw9LVt7gAS/x1kMzaClnvCIJbfiHCXCbMkKKEf8audGMMk1t/JM2GfedT983FpOztapiNCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iW/rWT1RAvQbBMu/9dj9U11MtCDOKCe+tz4tT1uB3kU=;
 b=F20g9wuUMuy61Jiuwe+ZbvK5pwhZY1j128/EuUvtLYHEWwTMni2UEJ7yU3RxXTssU0NdKRgLpLEnbs7d3baZa4Y2mz6r+R2lBM09mfFKkbkk22fMijrF/M2KfbK29h8i/ViLfEhGytCFYj+cCTZwNa55ZAxjUoQxLwauq0LTn8bXGbuky4zuURnHLa1MRFviZOmOydMUSAnU/djdxSDp52KTvvzcCVn6gGy0rltEFSuOZpwt/Q/tT0F+6KsY5tEOj26EWglEdNJmomyxqdfM9vEdZwMRXzPZQ88kqE+4Ix/YHzur+uMBiM15t4oJOdMGZTHKffS+aVBzQGtg4nfCtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iW/rWT1RAvQbBMu/9dj9U11MtCDOKCe+tz4tT1uB3kU=;
 b=ttLhH0ooQqj7aqCv9H+1Fouekb5Dti4paprSSqtklTPU4kOE/LS9CUk9/34DdPs5dr9gTxseniMCDH9O0cciC/tf4+zCl6L6OT2PaOhGp1WNGUnRqOxWiZSDU1NLqPIDKZPZEmtRmtBFbX12Rn5UndgumWg+Jt2ua+PfAsMa4ZM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <852a9b82-bc82-37c3-75e7-83275ff6c577@amd.com>
Date: Tue, 31 Jan 2023 10:22:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 2/5] xen/arm64: Rework the memory layout
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, Julien Grall <jgrall@amazon.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230127195508.2786-1-julien@xen.org>
 <20230127195508.2786-3-julien@xen.org>
 <af0bf576-373c-353e-b575-40f5bbde861f@amd.com>
 <044a4899-661b-8a84-d949-dd14d1d32383@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <044a4899-661b-8a84-d949-dd14d1d32383@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT097:EE_|IA1PR12MB8357:EE_
X-MS-Office365-Filtering-Correlation-Id: f4f44234-1564-4220-3b5a-08db036cb833
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SmDI+lxPKTQEv29BstBZH0fHt8X8mm1tEbNxD2J936m/2uR1tJ8T1/1xKvciKIty4jv87holvPhqeydV12WDo9rcczVqjzWzL409wVt728Ops0J6HET1fXPhuSAwTmvBCcMTm/nOKMZhr/PvgqGQjUAt4RGSOvW1JcZ6xcruaiY5824HIgTIZ2unemWI9lpxwpaWlVzhxJWulX1fma78cs0HJmoP15JNWTG8nCZPFlFPUiBTsDn2q4mKlFWn8m522NP3XgAeh57kLwU9WzhQsi00LDqXLMP/JwyTkYIbUgz8Ybbi6YXLP/gAG6rhilWRKflPo+3egDlNh/ToQP7Tm3g/d2s7Z8sOvFSVMnyFdSdg2FHF5mRq5KuZp4bjacorqidzWR8uC8G7AmLMrB6oHBwt5jVGVzfgcPv+zIhKQeoZvneYi+Acpp4c2EQD2fk6bYhERXjYxsoTFSKvF4i4/p2zEvGtW/psERYh74X4PLsUntOtCp6tARWlg2vZqgzrhvUaBV2YOqGprPNj7n1g6JzQWkpGQLCgTGW3G21odMsicInRRPd+1cHsCvzjVLg0HW7pwDdiZNZFWO7kPwyU7HHQD3mO+paW6/ZaXcIc1Qh2U955mdhXvKa1w08FQCWyRuqhIKKWlgbHqwzFqzTAdc+eGeXNYVuNCuZBCvL6kBKGBYZNDAPYdHjr680Q/7RTPYd93dbNBpkOVo4R2OzwrK+e0YasUzJMQu1+IrXbBHnqwYiEncaXSSldzRrmlRiV2zz8Q1HpLYHpmrIti7zMfA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(346002)(376002)(39860400002)(451199018)(36840700001)(40470700004)(46966006)(70586007)(70206006)(82310400005)(8676002)(2616005)(4326008)(82740400003)(86362001)(36860700001)(83380400001)(41300700001)(47076005)(426003)(336012)(31686004)(8936002)(316002)(356005)(16576012)(81166007)(53546011)(5660300002)(54906003)(186003)(110136005)(26005)(31696002)(6666004)(478600001)(40460700003)(36756003)(2906002)(40480700001)(44832011)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 09:22:48.4305
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4f44234-1564-4220-3b5a-08db036cb833
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT097.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8357

Hi Julien,

On 30/01/2023 19:36, Julien Grall wrote:
> 
> 
> On 30/01/2023 09:08, Michal Orzel wrote:
>> Hi Julien,
> 
> Hi Michal,
> 
>> On 27/01/2023 20:55, Julien Grall wrote:
>>>
>>>
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> Xen is currently not fully compliant with the Arm Arm because it will
>>> switch the TTBR with the MMU on.
>>>
>>> In order to be compliant, we need to disable the MMU before
>>> switching the TTBR. The implication is the page-tables should
>>> contain an identity mapping of the code switching the TTBR.
>>>
>>> In most of the case we expect Xen to be loaded in low memory. I am aware
>>> of one platform (i.e AMD Seattle) where the memory start above 512GB.
>>> To give us some slack, consider that Xen may be loaded in the first 2TB
>>> of the physical address space.
>>>
>>> The memory layout is reshuffled to keep the first four slots of the zeroeth
>>> level free. Xen will now be loaded at (2TB + 2MB). This requires a slight
>>> tweak of the boot code because XEN_VIRT_START cannot be used as an
>>> immediate.
>>>
>>> This reshuffle will make trivial to create a 1:1 mapping when Xen is
>>> loaded below 2TB.
>>>
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>> Tested-by: Luca Fancellu <luca.fancellu@arm.com>
>>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>>>
>>> ---
>>>      Changes in v5:
>>>          - We are reserving 4 slots rather than 2.
>>>          - Fix the addresses in the layout comment.
>>>          - Fix the size of the region in the layout comment
>>>          - Add Luca's tested-by (the reviewed-by was not added
>>>            because of the changes requested by Michal
>>>          - Add Michal's reviewed-by
>>>
>>>      Changes in v4:
>>>          - Correct the documentation
>>>          - The start address is 2TB, so slot0 is 4 not 2.
>>>
>>>      Changes in v2:
>>>          - Reword the commit message
>>>          - Load Xen at 2TB + 2MB
>>>          - Update the documentation to reflect the new layout
>>> ---
>>>   xen/arch/arm/arm64/head.S         |  3 ++-
>>>   xen/arch/arm/include/asm/config.h | 34 +++++++++++++++++++++----------
>>>   xen/arch/arm/mm.c                 | 11 +++++-----
>>>   3 files changed, 31 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
>>> index 4a3f87117c83..663f5813b12e 100644
>>> --- a/xen/arch/arm/arm64/head.S
>>> +++ b/xen/arch/arm/arm64/head.S
>>> @@ -607,7 +607,8 @@ create_page_tables:
>>>            * need an additional 1:1 mapping, the virtual mapping will
>>>            * suffice.
>>>            */
>>> -        cmp   x19, #XEN_VIRT_START
>>> +        ldr   x0, =XEN_VIRT_START
>>> +        cmp   x19, x0
>>>           bne   1f
>>>           ret
>>>   1:
>>> diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
>>> index 5df0e4c4959b..e388462c23d1 100644
>>> --- a/xen/arch/arm/include/asm/config.h
>>> +++ b/xen/arch/arm/include/asm/config.h
>>> @@ -72,16 +72,13 @@
>>>   #include <xen/page-size.h>
>>>
>>>   /*
>>> - * Common ARM32 and ARM64 layout:
>>> + * ARM32 layout:
>>>    *   0  -   2M   Unmapped
>>>    *   2M -   4M   Xen text, data, bss
>>>    *   4M -   6M   Fixmap: special-purpose 4K mapping slots
>>>    *   6M -  10M   Early boot mapping of FDT
>>>    *   10M - 12M   Livepatch vmap (if compiled in)
>>>    *
>>> - * ARM32 layout:
>>> - *   0  -  12M   <COMMON>
>>> - *
>>>    *  32M - 128M   Frametable: 32 bytes per page for 12GB of RAM
>>>    * 256M -   1G   VMAP: ioremap and early_ioremap use this virtual address
>>>    *                    space
>>> @@ -90,14 +87,23 @@
>>>    *   2G -   4G   Domheap: on-demand-mapped
>>>    *
>>>    * ARM64 layout:
>>> - * 0x0000000000000000 - 0x0000007fffffffff (512GB, L0 slot [0])
>>> - *   0  -  12M   <COMMON>
>>> + * 0x0000000000000000 - 0x000001ffffffffff (2TB, L0 slots [0..3])
>>> + *
>>> + *  Reserved to identity map Xen
>>> + *
>>> + * 0x0000020000000000 - 0x0000027fffffffff (512GB, L0 slot [4]
>>> + *  (Relative offsets)
>>> + *   0  -   2M   Unmapped
>>> + *   2M -   4M   Xen text, data, bss
>>> + *   4M -   6M   Fixmap: special-purpose 4K mapping slots
>>> + *   6M -  10M   Early boot mapping of FDT
>>> + *  10M -  12M   Livepatch vmap (if compiled in)
>>>    *
>>>    *   1G -   2G   VMAP: ioremap and early_ioremap
>>>    *
>>>    *  32G -  64G   Frametable: 56 bytes per page for 2TB of RAM
>>>    *
>>> - * 0x0000008000000000 - 0x00007fffffffffff (127.5TB, L0 slots [1..255])
>>> + * 0x0000028000000000 - 0x00007fffffffffff (125TB, L0 slots [5..255])
>>>    *  Unused
>>>    *
>>>    * 0x0000800000000000 - 0x000084ffffffffff (5TB, L0 slots [256..265])
>>> @@ -107,7 +113,17 @@
>>>    *  Unused
>>>    */
>>>
>>> +#ifdef CONFIG_ARM_32
>>>   #define XEN_VIRT_START          _AT(vaddr_t, MB(2))
>>> +#else
>>> +
>>> +#define SLOT0_ENTRY_BITS  39
>>> +#define SLOT0(slot) (_AT(vaddr_t,slot) << SLOT0_ENTRY_BITS)
>>> +#define SLOT0_ENTRY_SIZE  SLOT0(1)
>>> +
>>> +#define XEN_VIRT_START          (SLOT0(4) + _AT(vaddr_t, MB(2)))
>>> +#endif
>>> +
>>>   #define XEN_VIRT_SIZE           _AT(vaddr_t, MB(2))
>>>
>>>   #define FIXMAP_VIRT_START       (XEN_VIRT_START + XEN_VIRT_SIZE)
>>> @@ -163,10 +179,6 @@
>>>
>>>   #else /* ARM_64 */
>>>
>>> -#define SLOT0_ENTRY_BITS  39
>>> -#define SLOT0(slot) (_AT(vaddr_t,slot) << SLOT0_ENTRY_BITS)
>>> -#define SLOT0_ENTRY_SIZE  SLOT0(1)
>>> -
>>>   #define VMAP_VIRT_START  GB(1)
>>>   #define VMAP_VIRT_SIZE   GB(1)
>>>
>>> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
>>> index f758cad545fa..0b0edf28d57a 100644
>>> --- a/xen/arch/arm/mm.c
>>> +++ b/xen/arch/arm/mm.c
>>> @@ -153,7 +153,7 @@ static void __init __maybe_unused build_assertions(void)
>>>   #endif
>>>       /* Page table structure constraints */
>>>   #ifdef CONFIG_ARM_64
>>> -    BUILD_BUG_ON(zeroeth_table_offset(XEN_VIRT_START));
>>> +    BUILD_BUG_ON(zeroeth_table_offset(XEN_VIRT_START) < 2);
>> I haven't spotted this before but this should be < 4.
> 
> Good catch! I am planning to handle it on commit unless there is more to
> fix in this patch.
No more remarks from my side.

~Michal

