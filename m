Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 030798BCEE5
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 15:25:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717648.1120060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3yKk-0008OU-UK; Mon, 06 May 2024 13:24:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717648.1120060; Mon, 06 May 2024 13:24:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3yKk-0008MU-QO; Mon, 06 May 2024 13:24:46 +0000
Received: by outflank-mailman (input) for mailman id 717648;
 Mon, 06 May 2024 13:24:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lkt3=MJ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1s3yKj-0008MO-Et
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 13:24:45 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2412::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id feafdc20-0bab-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 15:24:42 +0200 (CEST)
Received: from DS7PR05CA0009.namprd05.prod.outlook.com (2603:10b6:5:3b9::14)
 by DM6PR12MB4219.namprd12.prod.outlook.com (2603:10b6:5:217::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Mon, 6 May
 2024 13:24:38 +0000
Received: from DS1PEPF0001709D.namprd05.prod.outlook.com
 (2603:10b6:5:3b9:cafe::b3) by DS7PR05CA0009.outlook.office365.com
 (2603:10b6:5:3b9::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42 via Frontend
 Transport; Mon, 6 May 2024 13:24:38 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0001709D.mail.protection.outlook.com (10.167.18.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Mon, 6 May 2024 13:24:38 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 6 May
 2024 08:24:37 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 6 May 2024 08:24:36 -0500
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
X-Inumbo-ID: feafdc20-0bab-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VUe7yHXCpA2Z6emPQnmF8zbqoy2MaJ8fKCwd6J0f1QKXRdejTq39rD+YyKli7iKJCieAtii08kNb6Qxk2r9/zU1sc0EG2Qtmw3KkPFAvBMUHUUDTEOfvRr4AwteJ4RpOrqTSxKD9MoZpLMEewPw/MMflCaGYfDGdsWcEMFn6Q6/eCbIKviLVvBArvKwvbaMFYUNDFqq79F36aba+7NdRAVoZ1NlkMDcOvIipBXOSR/J41OfN71cnN6YQowMXzLdgKjdZTboxb3GVy7cB2/0VMtw3jTf5F8nlk7g7t1Iod686FzTnPk9HwgRfeN4cPtaRorewkC/dmKWdJzpZ3bmksQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oRoXz1QYnq0OFNHm9Okr8mA1DLAHSVfztTFO/qbJjbw=;
 b=DPISDOhe1SfiNBsN7eQh9Uj3NN2oTFSOh/pR5KFW/gmxlwk6qzVT1CUkLBx+8wPD9qKhpNfEoGL9BbIvd5gWHZrx802BucupTZWN4Z+ukyzeXgOYZgypCn+4qtvM6XIPD/o62ambgEUlY82s8xsE+pDAEp5KiBI9kwT/nt4INk4Q5MOMfVLomzbTfhcFGdIYU5H1tJRCh8o9E1nz+4KV23yYR35zzkNURyYJaLHxrI2PC29X2vTwk47gXcGDYW3BENPEamNAfoKbuivgCi1SYzkyPX8Re80BPWivg2j7lCgGWUTfX6rbkOfUNreblwZFCu6zN5KiY9LdhMIvQA54yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oRoXz1QYnq0OFNHm9Okr8mA1DLAHSVfztTFO/qbJjbw=;
 b=HGS1XuwARMs8me1nOCRMCWPmFvftYqWtl07XclUAkOztTuMhP/vJsrTDtkYKrKss39JArgTukw9qznLUePi3PZLutflk8/nPpfEHxiqhyZyo9sSMJaQe4jv48V94T4K3JVHTnprYa9dUDcLMn/BP5NPKk/fwkDzNPcqnTfZ1qvg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <28322f07-99fc-4428-bcf2-b8c2af04d38b@amd.com>
Date: Mon, 6 May 2024 15:24:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] xen/arm: Lookup bootinfo shm bank during the mapping
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240423082532.776623-1-luca.fancellu@arm.com>
 <20240423082532.776623-2-luca.fancellu@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240423082532.776623-2-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709D:EE_|DM6PR12MB4219:EE_
X-MS-Office365-Filtering-Correlation-Id: 51c5e88d-a379-4e9a-4bb1-08dc6dcfe14b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|82310400017|1800799015|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QW9YWmozTkRLNWdKL08ycFJSdjdlZklPUFBNV09ZOFhZTHJyRFl3b0dSUUd6?=
 =?utf-8?B?d3g2RmFvQXU0dTJGRDdOYkVDd2Z0a2FrTzZYQzJBSnpHeVdHTkJhMEJjUVlU?=
 =?utf-8?B?M01YUlZMWXVHMEJJdjlxcGY0OUY2cWx6enRVWlQzK0J5RUZoSjVzK2JDVUJ2?=
 =?utf-8?B?d2dRUHZDTTdOU1V2RW9hTjNBVWc0cFhDM2RoZHg4ekFKdVE4dVkwT0ttcnls?=
 =?utf-8?B?dytEaVdBYmhUb3V1RHhLdG81MHZMdWlrYVFuT1Q0NEUzd2dYL1JuNVNNTEpl?=
 =?utf-8?B?enZaTWRRU0kxQUg3QW1MTURXRnhYWEhNdWhhQ2Fra2lha2pCNVZ0cVlCallF?=
 =?utf-8?B?Q2RoQjc2MmdYNHZLNURDcmk0eXlQaUNXTDM1Mm1hOFBJWkNZbktTTDRKRS96?=
 =?utf-8?B?YjdaTUlkTlkyb2k4WnJQeUkyTUkwU3lCd08xb0lOU25oY0ZFaEd0MGFQU1My?=
 =?utf-8?B?ZURRcXVEYTNETjdsV2xRanNrUmF6bkFhdjhtNUF1cnBibFd3TWRJaXJjR2sv?=
 =?utf-8?B?WVBuck1PazdwblNBaUdiMjBpVG81R0FTUElMeW1mTERwOHdMU3lsM04zYk9p?=
 =?utf-8?B?TVBrcDBSRVBDSFRmRG4zSktZRTRwM1licFZHcnRhTE5saDVvMmJ1aFFxNU1h?=
 =?utf-8?B?NFNwRVR2aVZHckhINi9JNGcrQWlUREJ1YllxT1ZMd2J0US96NGp6R3YzTDdz?=
 =?utf-8?B?RGd3RjZUd2xnMEMrQll0bnl0b0dtaTYrN3ZHOGJqUWNMNlpRcTQxVDUvU1BW?=
 =?utf-8?B?c3hBcXpjdW1SZlM4dG4wUk9TZ29xVHVmOUQrYjNWL0Rwc2MySkRVSGdwUGV6?=
 =?utf-8?B?MDRUeUdNVG01Ky9kRlhnU0huaHM3d01YUHdYellDTEwrU1VoY1FQT1JrZ1FB?=
 =?utf-8?B?eVBxRHl0SFlPUzRnQlluMWNEZnl1WFlkSDA0VDlsSEZLQUFDak9Rck0yOEd6?=
 =?utf-8?B?SkpPdEpGd0xpQWFBRm5CYVlHSk9zNjdXeWJDWlJJbTJDMU1sZncvWU1ERkhn?=
 =?utf-8?B?eEVHdHdmRExJWjZDVXNpeENCV2tXVVFxbXZxaUVOY1Y2RDBhR1ZiTTJrelJL?=
 =?utf-8?B?YjRXMERkNTYxWTM3R08yQ2pkY3poNVliNXhQSWpqQmltSjlnMFcvWXNLdEVr?=
 =?utf-8?B?YVJsVWR6dEJpZzQ0ZHRFd1dlVCtkYWxSWnUzL1B1WFh5R0xUQjF6SUNCYzFZ?=
 =?utf-8?B?UWttOFpkRWRhUE00dzk4aFV3SkNCcFN3RlZXUGh3SytLNVdrb1BzWm1UYzls?=
 =?utf-8?B?azN4ZzFKMnlWbVJDVjRHKzAzVzRXSHBYQXdOb2hFSVJiNU11R3A3TDR0MlZi?=
 =?utf-8?B?TURQOGhaVlZsSlFNdG1zenh4cEpFaEFmVlJYcjc0cy94ZzNMbytpZGY5MURT?=
 =?utf-8?B?aXN1dURPY1dwL2tBQzk3WmxpaVdyNXdzQnVMN1kwOXFxdVkvTy9SMytQUzk4?=
 =?utf-8?B?ZjNzaTZBM0RFaFRjY3R5RnoyVmJtWHF6WTVsaDg2WnhGTExWbjZzYnUvMFpr?=
 =?utf-8?B?TXFZajZVb0xWbHFROElUVkpsTFg3aTFGRENGQUhkWTdoMEJKUW00YlZOcW0v?=
 =?utf-8?B?Tm1HNXhEUFFRN2UrZXJDU2VTZVl3L05pbktSRUVLdDRDSERGU1hyQWZNWWNV?=
 =?utf-8?B?NTR6Z2U4TTZwbGVDdFUwYTl4OWEra0taOW9tNW5HV1Z6ODZtUmh1R3JVcjBD?=
 =?utf-8?B?REhnb2p5a1I4L2tSUnV3aFhqRDEzbVdQSDBVWklhOEVkQW9BNmlyK2lkN3p1?=
 =?utf-8?B?VEdielBVa3FJbHFNQmd1cEY1SzJkNjVvbGJ2SXQ5UTlTRUljdkFIQzVudnA3?=
 =?utf-8?B?djNrbldKc3ZualZsRUZ2bURFUVlFL1NnYnNIbVdUMFBNd1lYZCtKYVRiNXhP?=
 =?utf-8?Q?uXG7XP3qgu621?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400017)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 13:24:38.4452
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51c5e88d-a379-4e9a-4bb1-08dc6dcfe14b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4219

Hi Luca,

On 23/04/2024 10:25, Luca Fancellu wrote:
> 
> 
> The current static shared memory code is using bootinfo banks when it
> needs to find the number of borrower, so every time assign_shared_memory
s/borrower/borrowers

> is called, the bank is searched in the bootinfo.shmem structure.
> 
> There is nothing wrong with it, however the bank can be used also to
> retrieve the start address and size and also to pass less argument to
> assign_shared_memory. When retrieving the information from the bootinfo
> bank, it's also possible to move the checks on alignment to
> process_shm_node in the early stages.
Is this change really required for what you want to achieve? At the moment the alignment checks
are done before first use, which requires these values to be aligned. FDT processing part does not need it.

> 
> So create a new function find_shm() which takes a 'struct shared_meminfo'
Can we name it find_shm_bank() or find_shm_bank_by_id()?
I agree that it's better to use a unique ID rather than matching by address/size

> structure and the shared memory ID, to look for a bank with a matching ID,
> take the physical host address and size from the bank, pass the bank to
> assign_shared_memory() removing the now unnecessary arguments and finally
> remove the acquire_nr_borrower_domain() function since now the information
> can be extracted from the passed bank.
> Move the "xen,shm-id" parsing early in process_shm to bail out quickly in
> case of errors (unlikely), as said above, move the checks on alignment
> to process_shm_node.
> 
> Drawback of this change is that now the bootinfo are used also when the
> bank doesn't need to be allocated, however it will be convinient later
> to use it as an argument for assign_shared_memory when dealing with
> the use case where the Host physical address is not supplied by the user.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>  xen/arch/arm/static-shmem.c | 105 ++++++++++++++++++++----------------
>  1 file changed, 58 insertions(+), 47 deletions(-)
> 
> diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
> index 09f474ec6050..f6cf74e58a83 100644
> --- a/xen/arch/arm/static-shmem.c
> +++ b/xen/arch/arm/static-shmem.c
> @@ -19,29 +19,24 @@ static void __init __maybe_unused build_assertions(void)
>                   offsetof(struct shared_meminfo, bank)));
>  }
> 
> -static int __init acquire_nr_borrower_domain(struct domain *d,
> -                                             paddr_t pbase, paddr_t psize,
> -                                             unsigned long *nr_borrowers)
> +static const struct membank __init *find_shm(const struct membanks *shmem,
> +                                             const char *shm_id)
>  {
> -    const struct membanks *shmem = bootinfo_get_shmem();
>      unsigned int bank;
> 
> -    /* Iterate reserved memory to find requested shm bank. */
> +    BUG_ON(!shmem || !shm_id);
Is it really necessary? For example, before calling find_shm(), strlen is used on shm_id

> +
>      for ( bank = 0 ; bank < shmem->nr_banks; bank++ )
>      {
> -        paddr_t bank_start = shmem->bank[bank].start;
> -        paddr_t bank_size = shmem->bank[bank].size;
> -
> -        if ( (pbase == bank_start) && (psize == bank_size) )
> +        if ( strncmp(shm_id, shmem->bank[bank].shmem_extra->shm_id,
> +                     MAX_SHM_ID_LENGTH) == 0 )
Why not strcmp? AFAICS it's been validated many times already

>              break;
>      }
> 
>      if ( bank == shmem->nr_banks )
> -        return -ENOENT;
> -
> -    *nr_borrowers = shmem->bank[bank].shmem_extra->nr_shm_borrowers;
> +        return NULL;
> 
> -    return 0;
> +    return &shmem->bank[bank];
>  }
> 
>  /*
> @@ -103,14 +98,20 @@ static mfn_t __init acquire_shared_memory_bank(struct domain *d,
>      return smfn;
>  }
> 
> -static int __init assign_shared_memory(struct domain *d,
> -                                       paddr_t pbase, paddr_t psize,
> -                                       paddr_t gbase)
> +static int __init assign_shared_memory(struct domain *d, paddr_t gbase,
> +                                       const struct membank *shm_bank)
>  {
>      mfn_t smfn;
>      int ret = 0;
>      unsigned long nr_pages, nr_borrowers, i;
>      struct page_info *page;
> +    paddr_t pbase, psize;
> +
> +    BUG_ON(!shm_bank || !shm_bank->shmem_extra);
Is it really necessary? Isn't shm_bank already validated? It's not very common to have NULL checks in internal functions.

> +
> +    pbase = shm_bank->start;
> +    psize = shm_bank->size;
> +    nr_borrowers = shm_bank->shmem_extra->nr_shm_borrowers;
> 
>      printk("%pd: allocate static shared memory BANK %#"PRIpaddr"-%#"PRIpaddr".\n",
>             d, pbase, pbase + psize);
> @@ -135,14 +136,6 @@ static int __init assign_shared_memory(struct domain *d,
>          }
>      }
> 
> -    /*
> -     * Get the right amount of references per page, which is the number of
> -     * borrower domains.
> -     */
> -    ret = acquire_nr_borrower_domain(d, pbase, psize, &nr_borrowers);
> -    if ( ret )
> -        return ret;
> -
>      /*
>       * Instead of letting borrower domain get a page ref, we add as many
>       * additional reference as the number of borrowers when the owner
> @@ -199,6 +192,7 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
> 
>      dt_for_each_child_node(node, shm_node)
>      {
> +        const struct membank *boot_shm_bank;
>          const struct dt_property *prop;
>          const __be32 *cells;
>          uint32_t addr_cells, size_cells;
> @@ -212,6 +206,23 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>          if ( !dt_device_is_compatible(shm_node, "xen,domain-shared-memory-v1") )
>              continue;
> 
> +        if ( dt_property_read_string(shm_node, "xen,shm-id", &shm_id) )
> +        {
> +            printk("%pd: invalid \"xen,shm-id\" property", d);
> +            return -EINVAL;
> +        }
> +        BUG_ON((strlen(shm_id) <= 0) || (strlen(shm_id) >= MAX_SHM_ID_LENGTH));
> +
> +        boot_shm_bank = find_shm(bootinfo_get_shmem(), shm_id);
> +        if ( !boot_shm_bank )
> +        {
> +            printk("%pd: static shared memory bank not found: '%s'", d, shm_id);
> +            return -ENOENT;
> +        }
> +
> +        pbase = boot_shm_bank->start;
> +        psize = boot_shm_bank->size;
> +
>          /*
>           * xen,shared-mem = <pbase, gbase, size>;
>           * TODO: pbase is optional.
> @@ -221,20 +232,7 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>          prop = dt_find_property(shm_node, "xen,shared-mem", NULL);
>          BUG_ON(!prop);
>          cells = (const __be32 *)prop->value;
> -        device_tree_get_reg(&cells, addr_cells, addr_cells, &pbase, &gbase);
> -        psize = dt_read_paddr(cells, size_cells);
> -        if ( !IS_ALIGNED(pbase, PAGE_SIZE) || !IS_ALIGNED(gbase, PAGE_SIZE) )
> -        {
> -            printk("%pd: physical address 0x%"PRIpaddr", or guest address 0x%"PRIpaddr" is not suitably aligned.\n",
> -                   d, pbase, gbase);
> -            return -EINVAL;
> -        }
> -        if ( !IS_ALIGNED(psize, PAGE_SIZE) )
> -        {
> -            printk("%pd: size 0x%"PRIpaddr" is not suitably aligned\n",
> -                   d, psize);
> -            return -EINVAL;
> -        }
> +        gbase = dt_read_paddr(cells + addr_cells, addr_cells);
> 
>          for ( i = 0; i < PFN_DOWN(psize); i++ )
>              if ( !mfn_valid(mfn_add(maddr_to_mfn(pbase), i)) )
> @@ -251,13 +249,6 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>          if ( dt_property_read_string(shm_node, "role", &role_str) == 0 )
>              owner_dom_io = false;
> 
> -        if ( dt_property_read_string(shm_node, "xen,shm-id", &shm_id) )
> -        {
> -            printk("%pd: invalid \"xen,shm-id\" property", d);
> -            return -EINVAL;
> -        }
> -        BUG_ON((strlen(shm_id) <= 0) || (strlen(shm_id) >= MAX_SHM_ID_LENGTH));
> -
>          /*
>           * DOMID_IO is a fake domain and is not described in the Device-Tree.
>           * Therefore when the owner of the shared region is DOMID_IO, we will
> @@ -270,8 +261,8 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>               * We found the first borrower of the region, the owner was not
>               * specified, so they should be assigned to dom_io.
>               */
> -            ret = assign_shared_memory(owner_dom_io ? dom_io : d,
> -                                       pbase, psize, gbase);
> +            ret = assign_shared_memory(owner_dom_io ? dom_io : d, gbase,
> +                                       boot_shm_bank);
>              if ( ret )
>                  return ret;
>          }
> @@ -440,6 +431,26 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
>      device_tree_get_reg(&cell, address_cells, address_cells, &paddr, &gaddr);
>      size = dt_next_cell(size_cells, &cell);
> 
> +    if ( !IS_ALIGNED(paddr, PAGE_SIZE) )
> +    {
> +        printk("fdt: physical address 0x%"PRIpaddr" is not suitably aligned.\n",
> +               paddr);
> +        return -EINVAL;
> +    }
> +
> +    if ( !IS_ALIGNED(gaddr, PAGE_SIZE) )
> +    {
> +        printk("fdt: guest address 0x%"PRIpaddr" is not suitably aligned.\n",
> +               gaddr);
> +        return -EINVAL;
> +    }
> +
> +    if ( !IS_ALIGNED(size, PAGE_SIZE) )
What sense does it make to check for size being aligned before checking for size being 0? It would pass this check.

> +    {
> +        printk("fdt: size 0x%"PRIpaddr" is not suitably aligned\n", size);
> +        return -EINVAL;
> +    }
> +
>      if ( !size )
>      {
>          printk("fdt: the size for static shared memory region can not be zero\n");
> --
> 2.34.1
> 

~Michal

