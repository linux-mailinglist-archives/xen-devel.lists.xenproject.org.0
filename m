Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D100466BC5A
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 12:00:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478562.741815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHND5-0008AM-IP; Mon, 16 Jan 2023 10:59:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478562.741815; Mon, 16 Jan 2023 10:59:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHND5-000887-EL; Mon, 16 Jan 2023 10:59:27 +0000
Received: by outflank-mailman (input) for mailman id 478562;
 Mon, 16 Jan 2023 10:59:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wx/b=5N=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pHND3-00087z-O1
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 10:59:25 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2087.outbound.protection.outlook.com [40.107.93.87])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d58a056a-958c-11ed-91b6-6bf2151ebd3b;
 Mon, 16 Jan 2023 11:59:24 +0100 (CET)
Received: from BL1PR13CA0112.namprd13.prod.outlook.com (2603:10b6:208:2b9::27)
 by MW4PR12MB7030.namprd12.prod.outlook.com (2603:10b6:303:20a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.22; Mon, 16 Jan
 2023 10:59:20 +0000
Received: from BL02EPF000108E8.namprd05.prod.outlook.com
 (2603:10b6:208:2b9:cafe::12) by BL1PR13CA0112.outlook.office365.com
 (2603:10b6:208:2b9::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6023.12 via Frontend
 Transport; Mon, 16 Jan 2023 10:59:20 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF000108E8.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.11 via Frontend Transport; Mon, 16 Jan 2023 10:59:19 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 16 Jan
 2023 04:59:15 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 16 Jan
 2023 04:59:14 -0600
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 16 Jan 2023 04:59:12 -0600
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
X-Inumbo-ID: d58a056a-958c-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V7MAiou62fUiJxVtTN2PkcWnkul2Ykggh7+QG7Cn+O9MWvdiiKjahddizpaT8UHiTh++x92eavbWj3FGuETFxby0o+hIVldf4jLCEiUS7We04qS9+GYQzDzyk51rJjT+cTPHJILZE68b2bob6sRD6VvaEUmELTLMQkwBHEmlqx+tq/uyCHPZv3MrehFDHHf1bQ8lY4mryZF+9/3vn9jGC4KBi0amdDVQs73LGdwG26evKcjR0ADnI/k14EbgLSfvm0SpRF2B1eR3AXFILQLe0dAcbkO4RxEL59LLna+//OcNQCCTmZMaR6qqVTr//tmD8EmOIQ3/hZE6w5omQq/rWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UFeB5rZwRrz5YpTsPxIvIWRzcaS02lWju8Pbex8UaaM=;
 b=kMTjuinr5epz7/33GU/gWsa/24bnItFu8ahIUQhVhhYbCsuI9JCv2PhljWndyegRzWVf8OfZndZJ8TkUjXjKMBcdC6h9UXRzv0L3QuHAi6jehWBHzvbM1d+b50Z1zMm5BwV7llSRNYv1tW7GJZd8VXKuBqV9H//FR2MNwoAezKfFA2ukqtYLGcLuSaM70jJnRCFBM2lq2uVBHmF4rw1BGek7otCNgWZ2eyOa6kSotu2/KlMap1L2sJ74JtCWaJQrFLEkkcDIaZ9TgLk2RvCsnQa6RxD9ogrAn9I2YqNdjQX7bqtZPwjafVLwlRvZrz16DOEuQqTUcsNoODnC4/DoVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UFeB5rZwRrz5YpTsPxIvIWRzcaS02lWju8Pbex8UaaM=;
 b=hmY95SmciOcNjhwoeWvVCwJlM1wocXb77r/jpcoYWOYe7w6WUJfwCYL43J7lxoQBhmsQ5Snb6cHc2agWz5KrPXM2crA0btBqRy8MFh5vXI8UlKcbg+clN6qGoIwPLzShN7g21RuPpj7n5eoVaWZhqnaNvxDjBgADb54t1rqzDCc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <8e4c76f5-2afc-8be0-1c32-9059e7730f77@amd.com>
Date: Mon, 16 Jan 2023 11:59:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 11/14] xen/arm64: Rework the memory layout
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, Julien Grall <jgrall@amazon.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230113101136.479-1-julien@xen.org>
 <20230113101136.479-12-julien@xen.org>
 <72b2be45-d7bc-a94f-1d49-b9fc0b2fd081@amd.com>
 <54fdf78a-bd46-eae3-f00f-a21738561874@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <54fdf78a-bd46-eae3-f00f-a21738561874@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF000108E8:EE_|MW4PR12MB7030:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cc6becd-79ce-4dd7-2495-08daf7b0b7f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QqG+MRYBc5y9A2q72eJ7ZNQIWGLVu3p+KscvpvBS5V2D7Zv/1Ku+tTrITU64hFaMjNNHvaLkm5cBsl3opGl6Bktd72ssdpDOxt5dmSK+aJ5VGNj92fEWbAn9qzRGr1iVaaYn5npJHlR3aM2dHp/LTvWVDI+CHpqGjBWMGit5/CsN8t0489dcIv1nSHfn1oQ9btBSNADhe9pyKe9qh7FYbgSWhpBenHJiuLBmJAZEQuEgbaISPnUXkrF1FbTK3Nv1WjhPSUAge0dRL/o8CvoiFCJi9dqRNb1ea5iHFShduZfuzYWHmdQO8ygLb4/L/qXiuBW50wc3GW4n3ZAhSSKiKeKcHXszV5wmWRu572ysPFD8ggTj2tUuJDvoKKao2ZK3jceCkQq1KNufp9qd148rTUrdUsF6upw2RmuORaRPiIVFqqVGwmeyI+4z+MZcpMPCvYKjgqsieE/VfCUR9GKJsxNSe9Z86VHaLaNFtR2Z5dSXlnRQ0yHADK1mscvSS69r48AYsImHHm79q1NUwKpDT9J7pFlMUgZZ5dDUTMN8HQwkdbzLz//XPBUM6gwTpx2OXaRMJIct9dnNvo319la95T2E7DwoYPt6zAHiARhUApEHrmG4iSeGZd/fzw5n3CYawkcO8yn2TLU6TgFckpSmIhiUBzRZXR+GoiOt7eqok9tnFkmyyDoOEqU7gIZiMN9wQBd7k7xu4eXqnZdqcWr0DuJ56AKr5vYNKUQ+V+R1ExXJKOcONuj5rwKW/L9OefASPSFE5hKmjm8JsLw1EfajZQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(396003)(376002)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(31686004)(2906002)(44832011)(5660300002)(8936002)(8676002)(86362001)(83380400001)(70206006)(70586007)(4326008)(36756003)(336012)(316002)(110136005)(16576012)(54906003)(41300700001)(40460700003)(26005)(2616005)(31696002)(82310400005)(186003)(53546011)(6666004)(36860700001)(356005)(426003)(47076005)(81166007)(82740400003)(478600001)(40480700001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 10:59:19.8373
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cc6becd-79ce-4dd7-2495-08daf7b0b7f1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF000108E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7030

Hi Julien,

On 16/01/2023 10:29, Julien Grall wrote:
> 
> 
> On 16/01/2023 08:46, Michal Orzel wrote:
>> Hi Julien,
> 
> Hi Michal,
> 
>> On 13/01/2023 11:11, Julien Grall wrote:
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
>>> The memory layout is reshuffled to keep the first two slots of the zeroeth
>> Should be "four slots" instead of "two".
>>
>>> level free. Xen will now be loaded at (2TB + 2MB). This requires a slight
>>> tweak of the boot code because XEN_VIRT_START cannot be used as an
>>> immediate.
>>>
>>> This reshuffle will make trivial to create a 1:1 mapping when Xen is
>>> loaded below 2TB.
>>>
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>> ----
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
>>>   xen/arch/arm/include/asm/config.h | 35 ++++++++++++++++++++-----------
>>>   xen/arch/arm/mm.c                 | 11 +++++-----
>>>   3 files changed, 31 insertions(+), 18 deletions(-)
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
>>> index 6c1b762e976d..c5d407a7495f 100644
>>> --- a/xen/arch/arm/include/asm/config.h
>>> +++ b/xen/arch/arm/include/asm/config.h
>>> @@ -72,15 +72,12 @@
>>>   #include <xen/page-size.h>
>>>
>>>   /*
>>> - * Common ARM32 and ARM64 layout:
>>> + * ARM32 layout:
>>>    *   0  -   2M   Unmapped
>>>    *   2M -   4M   Xen text, data, bss
>>>    *   4M -   6M   Fixmap: special-purpose 4K mapping slots
>>>    *   6M -  10M   Early boot mapping of FDT
>>> - *   10M - 12M   Livepatch vmap (if compiled in)
>>> - *
>>> - * ARM32 layout:
>>> - *   0  -  12M   <COMMON>
>>> + *  10M -  12M   Livepatch vmap (if compiled in)
>>>    *
>>>    *  32M - 128M   Frametable: 24 bytes per page for 16GB of RAM
>>>    * 256M -   1G   VMAP: ioremap and early_ioremap use this virtual address
>>> @@ -90,14 +87,22 @@
>>>    *   2G -   4G   Domheap: on-demand-mapped
>>>    *
>>>    * ARM64 layout:
>>> - * 0x0000000000000000 - 0x0000007fffffffff (512GB, L0 slot [0])
>>> - *   0  -  12M   <COMMON>
>>> + * 0x0000000000000000 - 0x00001fffffffffff (2TB, L0 slots [0..3])
>> End address should be 0x1FFFFFFFFFF (one less f).
>>
>>> + *  Reserved to identity map Xen
>>> + *
>>> + * 0x0000020000000000 - 0x000028fffffffff (512GB, L0 slot [4]
>> End address should be 0x27FFFFFFFFF.
>>
>>> + *  (Relative offsets)
>>> + *   0  -   2M   Unmapped
>>> + *   2M -   4M   Xen text, data, bss
>>> + *   4M -   6M   Fixmap: special-purpose 4K mapping slots
>>> + *   6M -  10M   Early boot mapping of FDT
>>> + *  10M -  12M   Livepatch vmap (if compiled in)
>>>    *
>>>    *   1G -   2G   VMAP: ioremap and early_ioremap
>>>    *
>>>    *  32G -  64G   Frametable: 24 bytes per page for 5.3TB of RAM
>>>    *
>>> - * 0x0000008000000000 - 0x00007fffffffffff (127.5TB, L0 slots [1..255])
>>> + * 0x0000008000000000 - 0x00007fffffffffff (127.5TB, L0 slots [5..255])
>> Start address should be 0x28000000000.
> 
> I have updated all the addresses.
Thanks, in that case you can add my:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

> 
>>
>> Not related to this patch:
>> I took a look at config.h and spotted two things:
>> 1) DIRECTMAP_SIZE calculation is incorrect. It is defined as (SLOT0_ENTRY_SIZE * (265-256))
>> but it actually should be (SLOT0_ENTRY_SIZE * (266-256)) i.e. 10 slots and not 9. Due to this
>> bug we actually support 4.5TB of direct-map and not 5TB.
> 
> 
>>
>> 2) frametable information
>> struct page_info is no longer 24B but 56B for arm64 and 32B for arm32.
> 
> The values were always wrong. I have an action in my todo list to look
> at it, but never got the time.
> 
> There are two problems with the current values:
>    1) The size of the frametable is not big enough as you pointed one below.
>    2) The struct page_info could cross a cache line. We should decide
> whether we want to increase the size or attempt to reduce it.
> 
>   It looks like SUPPORT.md
>> took this into account when stating that we support 12GB for arm32 and 2TB for arm64. However,
>> this is also wrong as it does not take into account physical address compression. With PDX that
>> is enabled by default we could fit tens of TB in 32GB frametable.
> I don't understand your argument. Yes the PDX can compress, but it will
> compress non-RAM pages. So while I agree that this could cover tens of
> TB of physical address space, we will always be able to support a fixed
> amount of RAM.
Right.

> 
>> I think we want to get rid of
>> comments like "Frametable: 24 bytes per page for 16GB of RAM" in favor of just "Frametable".
> 
> I would rather update the comments because we need a way to explain how
> we came up with the size.
> 
>> This is to because the struct page_info size may change again
> We could have a BUILD_BUG_ON() confirming the size of the page_info.
So, apart from fixing a DIRECTMAP_SIZE, I would like to send a patch correcting
a frametable information in config.h. In this patch I'd take the opportunity
to add the following in setup_frametable_mappings:
- BUILD_BUG_ON to check the size of page_info
For that, I could add a new macro e.g. CONFIG_PAGE_INFO_SIZE in config.h to set it to 56 for arm64
and 32 for arm32 to avoid ifdefery in a function itself.
- if ( frametable_size >= FRAMETABLE_SIZE )
to call a panic "RAM is too big to fit in a frametable area", as we do not have any check at the moment.

~Michal

