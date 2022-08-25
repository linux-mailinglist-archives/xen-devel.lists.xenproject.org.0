Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 134655A0EF7
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 13:24:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393300.632166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRAy7-0000c0-9Z; Thu, 25 Aug 2022 11:24:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393300.632166; Thu, 25 Aug 2022 11:24:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRAy7-0000Zp-5E; Thu, 25 Aug 2022 11:24:15 +0000
Received: by outflank-mailman (input) for mailman id 393300;
 Thu, 25 Aug 2022 11:24:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X+v2=Y5=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oRAy5-0000Zj-94
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 11:24:13 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2073.outbound.protection.outlook.com [40.107.96.73])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c998aaa-2468-11ed-9250-1f966e50362f;
 Thu, 25 Aug 2022 13:24:04 +0200 (CEST)
Received: from BN0PR03CA0014.namprd03.prod.outlook.com (2603:10b6:408:e6::19)
 by BN6PR12MB1362.namprd12.prod.outlook.com (2603:10b6:404:1a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Thu, 25 Aug
 2022 11:24:07 +0000
Received: from BN8NAM11FT095.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e6:cafe::75) by BN0PR03CA0014.outlook.office365.com
 (2603:10b6:408:e6::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14 via Frontend
 Transport; Thu, 25 Aug 2022 11:24:07 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT095.mail.protection.outlook.com (10.13.176.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5566.15 via Frontend Transport; Thu, 25 Aug 2022 11:24:06 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 25 Aug
 2022 06:24:06 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 25 Aug
 2022 06:24:06 -0500
Received: from [10.71.192.107] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 25 Aug 2022 06:24:04 -0500
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
X-Inumbo-ID: 6c998aaa-2468-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JzUnSck22Yq8boBHjtZDQpQ0rMuZoj0KdvyjoxjZS8lvQ2QqmwANTtHxMjnLcFhVNCgj3r/teRC9EZOJx3iTfr5NqEHpXid+pODH0HjWBA5K2ySjFr1RDHQZQdzFMUbi+f/0ML/Jm2ujkHp+HT6Lf5Gxj8UE3GT0T4teGmqHL3AZGQEIzW1Pq12+QG4AbknTL5NjBUHNs4j9m8x5xNvb5fl/jwcnRxGWPzNoHJ3w6LLQL5DDTd5tsDHK+rCdNPYaZBE85GEKr0RIA6MZV/otUntsZqaWfPeEtZzNF6soW5/plyWFTmSLI04MDjNR+aeV8W88IcrUREe+VPy5uQd7Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/EleFUZaldsREiB/SUM4a3yWw7WoyF7PF887c81c57g=;
 b=iuznSleCpB9VH7iw0uRIvHPq6DUxE8GZjAVV90RR/hK1ffX1CiGNpduQbeBE2Dsn69w/KJFkwWLFDnxDeSkHrDkaXb46gjaidf39Jc2qHs/Pm8qDwlLEhb97GuEr3wyPjk4s+dbDdFnWO7tnHDbOLO9Ol13yYM0azQdbrdU9ciCzuHaM86M5tXJGBXJ4wyMNuuw3FgKDsUYQ/w3MKz0HZElgAeRGxvi+kO31UroUHjsAxl3SycEam+Qjko4QFkvaMfsbo87sgJr8J4kzSsEfHs4ggZIbjr0Eg3921l6D7DOaHW5zW0pAK/MZk7VZtBC8rF6SKp8Q+MrWso17AVsF6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/EleFUZaldsREiB/SUM4a3yWw7WoyF7PF887c81c57g=;
 b=fJp6bQTWPfxWiX7Gbsy4w0XgJHTwee7s01Yi3j3CckQKXF7+z3vrJAun4CBDqBlsKh8VtZ3DlVDW8amzsWqQHLPm+UsD8J7eYhgfzYPgXRBY6ntXFSRGBbyMrVbGzVL5qK51C6x5y/NQ9jEXx4OXLzsoiK8Y6AtdZ8JFbptWzo4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <59f69736-a18c-9d08-94dd-791bd264d671@amd.com>
Date: Thu, 25 Aug 2022 13:24:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and heap
 allocator
To: Henry Wang <Henry.Wang@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen
	<Wei.Chen@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220824073127.16762-1-Henry.Wang@arm.com>
 <20220824073127.16762-3-Henry.Wang@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20220824073127.16762-3-Henry.Wang@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 520c8f1f-7b60-427c-e077-08da868c52bf
X-MS-TrafficTypeDiagnostic: BN6PR12MB1362:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ldINv7Enke1sfGQLuuX9ZXiTertpqXn9EWGluG2kmuFgEUtWiL66AvuREeosjIK3mkwwZDYWGHAIB5EFNkOVVXzixWK+4HJRNDtCXQNqDaKK2jw44QxhouyIAgz47zov7gP8qQTRhaEhTu5pkxpjoorQTFJlLuYEowIyhaPYjF432G3KAlpUdB/4ZBlqgxh7PBwVh2XZa5NEZjKSOyBV5dcjAXNYJfSlr0FcyX05Q3h/iOxuoATUf0KqM2tVHHFvD6BmXGuPtwITXZsI3z2om95SEC8UrIj0Jk5sd13hggaeoXq8dVi8aNO0KV18Xt1BsQ649XRBm5pNPYwC23AZ+AJp5Sx3X69vDjlrpHBMx/8Y2nYH91TodA2uMkuzZPCtF+9k6Hltgz4ut2BufNzu7fzcVcbsVaG6Xo+h5Tsb9Mf8E/QRZvjgJmP64mH0NgGQ7HVtqkaqX9wY3F53p4kNbY8z7KfYDAeGpenD1CKFmD04EZVDmpFE61bhAKnG5BTY9zdutJfCMM+zYSEI3ssoB/g65IlvbwRpKORa/kgZ32SRBtlIQ39Hav+xPrW8LqTDqiqb0rx/ptvLG8SJmy5drSr8DsEeyQSNj5+YnJWnYXs9Zta4wqoRkrQhLMM/VhhpkR7+SJNuYSmv5+FEc0/pe5CLTU7U/y16RfP6U8WP8t2i+EYjsJ6SYP83qMGRy8WKHdsnoqSba1ECUPCdqB00455ljOOq4CJSdKUFYsBSEx7ioRU5uLLGijMQPcyG/epc3zyV1b7tO4qCMlZ/yfH/NnFjA6bXuaiu6Z0uDooKzGHBV0QGVobWbzk0lEV7bHfRdtinEDTGfkhaUtSQ8yf7uQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(396003)(39860400002)(376002)(36840700001)(40470700004)(46966006)(5660300002)(356005)(2906002)(36756003)(70206006)(26005)(186003)(4326008)(8676002)(40480700001)(82310400005)(70586007)(316002)(54906003)(53546011)(16576012)(110136005)(478600001)(41300700001)(31686004)(86362001)(81166007)(31696002)(47076005)(426003)(83380400001)(336012)(82740400003)(36860700001)(44832011)(2616005)(40460700003)(8936002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 11:24:06.7571
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 520c8f1f-7b60-427c-e077-08da868c52bf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT095.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1362

Hi Henry,

On 24/08/2022 09:31, Henry Wang wrote:
> 
> This commit firstly adds a global variable `reserved_heap`.
> This newly introduced global variable is set at the device tree
> parsing time if the reserved heap ranges are defined in the device
> tree chosen node.
> 
Did you consider putting reserved_heap into bootinfo structure?
It would help to avoid introducing new global variables that are only used
in places making use of the bootinfo anyway.

> For Arm32, In `setup_mm`, if the reserved heap is enabled, we use
> the reserved heap region for both domheap and xenheap allocation.
> 
> For Arm64, In `setup_mm`, if the reserved heap is enabled and used,
> we make sure that only these reserved heap pages are added to the
> boot allocator. These reserved heap pages in the boot allocator are
> added to the heap allocator at `end_boot_allocator()`.
> 
> If the reserved heap is disabled, we stick to current page allocation
> strategy at boot time.
> 
> Also, take the chance to correct a "double not" print in Arm32
> `setup_mm()`.
> 
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> ---
> With reserved heap enabled, for Arm64, naming of global variables such
> as `xenheap_mfn_start` and `xenheap_mfn_end` seems to be ambiguous,
> wondering if we should rename these variables.
> ---
> Changes from RFC to v1:
> - Rebase on top of latest `setup_mm()` changes.
> - Added Arm32 logic in `setup_mm()`.
> ---
>  xen/arch/arm/bootfdt.c           |  2 +
>  xen/arch/arm/include/asm/setup.h |  2 +
>  xen/arch/arm/setup.c             | 79 +++++++++++++++++++++++++-------
>  3 files changed, 67 insertions(+), 16 deletions(-)
> 
> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> index 33704ca487..ab73b6e212 100644
> --- a/xen/arch/arm/bootfdt.c
> +++ b/xen/arch/arm/bootfdt.c
> @@ -325,6 +325,8 @@ static int __init process_chosen_node(const void *fdt, int node,
>                                       true);
>          if ( rc )
>              return rc;
> +
> +        reserved_heap = true;
>      }
> 
>      printk("Checking for initrd in /chosen\n");
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index e80f3d6201..00536a6d55 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -92,6 +92,8 @@ extern struct bootinfo bootinfo;
> 
>  extern domid_t max_init_domid;
> 
> +extern bool reserved_heap;
> +
>  void copy_from_paddr(void *dst, paddr_t paddr, unsigned long len);
> 
>  size_t estimate_efi_size(unsigned int mem_nr_banks);
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 500307edc0..fe76cf6325 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -73,6 +73,8 @@ integer_param("xenheap_megabytes", opt_xenheap_megabytes);
> 
>  domid_t __read_mostly max_init_domid;
> 
> +bool __read_mostly reserved_heap;
> +
>  static __used void init_done(void)
>  {
>      /* Must be done past setting system_state. */
> @@ -699,8 +701,10 @@ static void __init populate_boot_allocator(void)
>  #ifdef CONFIG_ARM_32
>  static void __init setup_mm(void)
>  {
> -    paddr_t ram_start, ram_end, ram_size, e;
> -    unsigned long ram_pages;
> +    paddr_t ram_start, ram_end, ram_size, e, bank_start, bank_end, bank_size;
> +    paddr_t reserved_heap_start = ~0, reserved_heap_end = 0,
> +            reserved_heap_size = 0;
> +    unsigned long ram_pages, reserved_heap_pages = 0;
>      unsigned long heap_pages, xenheap_pages, domheap_pages;
>      unsigned int i;
>      const uint32_t ctr = READ_CP32(CTR);
> @@ -720,9 +724,9 @@ static void __init setup_mm(void)
> 
>      for ( i = 1; i < bootinfo.mem.nr_banks; i++ )
>      {
> -        paddr_t bank_start = bootinfo.mem.bank[i].start;
> -        paddr_t bank_size = bootinfo.mem.bank[i].size;
> -        paddr_t bank_end = bank_start + bank_size;
> +        bank_start = bootinfo.mem.bank[i].start;
> +        bank_size = bootinfo.mem.bank[i].size;
> +        bank_end = bank_start + bank_size;
> 
>          ram_size  = ram_size + bank_size;
>          ram_start = min(ram_start,bank_start);
> @@ -731,6 +735,25 @@ static void __init setup_mm(void)
> 
>      total_pages = ram_pages = ram_size >> PAGE_SHIFT;
> 
> +    if ( reserved_heap )
> +    {
> +        for ( i = 0 ; i < bootinfo.reserved_mem.nr_banks; i++ )
> +        {
> +            if ( bootinfo.reserved_mem.bank[i].xen_heap )
> +            {
> +                bank_start = bootinfo.reserved_mem.bank[i].start;
> +                bank_size = bootinfo.reserved_mem.bank[i].size;
> +                bank_end = bank_start + bank_size;
> +
> +                reserved_heap_size += bank_size;
> +                reserved_heap_start = min(reserved_heap_start, bank_start);
You do not need reserved_heap_start as you do not use it at any place later on.
In your current implementation you just need reserved_heap_size and reserved_heap_end.

> +                reserved_heap_end = max(reserved_heap_end, bank_end);
> +            }
> +        }
> +
> +        reserved_heap_pages = reserved_heap_size >> PAGE_SHIFT;
> +    }
> +
>      /*
>       * If the user has not requested otherwise via the command line
>       * then locate the xenheap using these constraints:
> @@ -743,7 +766,8 @@ static void __init setup_mm(void)
>       * We try to allocate the largest xenheap possible within these
>       * constraints.
>       */
> -    heap_pages = ram_pages;
> +    heap_pages = !reserved_heap ? ram_pages : reserved_heap_pages;
I must say that the reverted logic is harder to read. This is a matter of taste but
please consider the following:
heap_pages = reserved_heap ? reserved_heap_pages : ram_pages;
The same applies to ...

> +
>      if ( opt_xenheap_megabytes )
>          xenheap_pages = opt_xenheap_megabytes << (20-PAGE_SHIFT);
>      else
> @@ -755,17 +779,21 @@ static void __init setup_mm(void)
> 
>      do
>      {
> -        e = consider_modules(ram_start, ram_end,
> +        e = !reserved_heap ?
... here.

> +            consider_modules(ram_start, ram_end,
>                               pfn_to_paddr(xenheap_pages),
> -                             32<<20, 0);
> +                             32<<20, 0) :
> +            reserved_heap_end;
> +
>          if ( e )
>              break;
> 
>          xenheap_pages >>= 1;
>      } while ( !opt_xenheap_megabytes && xenheap_pages > 32<<(20-PAGE_SHIFT) );
> 
> -    if ( ! e )
> -        panic("Not not enough space for xenheap\n");
> +    if ( ! e ||
> +         ( reserved_heap && reserved_heap_pages < 32<<(20-PAGE_SHIFT) ) )
I'm not sure about this. You are checking if the size of the reserved heap is less than 32MB
and this has nothing to do with the following panic message.

> +        panic("Not enough space for xenheap\n");
> 
>      domheap_pages = heap_pages - xenheap_pages;
> 
> @@ -810,9 +838,9 @@ static void __init setup_mm(void)
>  static void __init setup_mm(void)
>  {
>      const struct meminfo *banks = &bootinfo.mem;
> -    paddr_t ram_start = ~0;
> -    paddr_t ram_end = 0;
> -    paddr_t ram_size = 0;
> +    paddr_t ram_start = ~0, bank_start = ~0;
> +    paddr_t ram_end = 0, bank_end = 0;
> +    paddr_t ram_size = 0, bank_size = 0;
>      unsigned int i;
> 
>      init_pdx();
> @@ -821,17 +849,36 @@ static void __init setup_mm(void)
>       * We need some memory to allocate the page-tables used for the xenheap
>       * mappings. But some regions may contain memory already allocated
>       * for other uses (e.g. modules, reserved-memory...).
> -     *
> +     * If reserved heap regions are properly defined, (only) add these regions
How can you say at this stage whether the reserved heap regions are defined properly?

> +     * in the boot allocator.
> +     */
> +    if ( reserved_heap )
> +    {
> +        for ( i = 0 ; i < bootinfo.reserved_mem.nr_banks; i++ )
> +        {
> +            if ( bootinfo.reserved_mem.bank[i].xen_heap )
> +            {
> +                bank_start = bootinfo.reserved_mem.bank[i].start;
> +                bank_size = bootinfo.reserved_mem.bank[i].size;
> +                bank_end = bank_start + bank_size;
> +
> +                init_boot_pages(bank_start, bank_end);
> +            }
> +        }
> +    }
> +    /*
> +     * No reserved heap regions:
>       * For simplicity, add all the free regions in the boot allocator.
>       */
> -    populate_boot_allocator();
> +    else
> +        populate_boot_allocator();
> 
>      total_pages = 0;
> 
>      for ( i = 0; i < banks->nr_banks; i++ )
>      {
>          const struct membank *bank = &banks->bank[i];
> -        paddr_t bank_end = bank->start + bank->size;
> +        bank_end = bank->start + bank->size;
> 
>          ram_size = ram_size + bank->size;
>          ram_start = min(ram_start, bank->start);
> --
> 2.17.1
> 
> 

~Michal

