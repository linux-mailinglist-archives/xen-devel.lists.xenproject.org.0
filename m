Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D439287BE0D
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 14:51:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693251.1081110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rklUg-0000iu-4M; Thu, 14 Mar 2024 13:51:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693251.1081110; Thu, 14 Mar 2024 13:51:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rklUg-0000gc-1g; Thu, 14 Mar 2024 13:51:38 +0000
Received: by outflank-mailman (input) for mailman id 693251;
 Thu, 14 Mar 2024 13:51:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QCks=KU=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rklUf-0000gU-3H
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 13:51:37 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2417::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8899aea-e209-11ee-afdd-a90da7624cb6;
 Thu, 14 Mar 2024 14:51:35 +0100 (CET)
Received: from CH2PR08CA0007.namprd08.prod.outlook.com (2603:10b6:610:5a::17)
 by IA1PR12MB7661.namprd12.prod.outlook.com (2603:10b6:208:426::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.26; Thu, 14 Mar
 2024 13:51:23 +0000
Received: from DS2PEPF00003447.namprd04.prod.outlook.com
 (2603:10b6:610:5a:cafe::49) by CH2PR08CA0007.outlook.office365.com
 (2603:10b6:610:5a::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38 via Frontend
 Transport; Thu, 14 Mar 2024 13:51:22 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003447.mail.protection.outlook.com (10.167.17.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7386.12 via Frontend Transport; Thu, 14 Mar 2024 13:51:22 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 14 Mar
 2024 08:51:22 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 14 Mar
 2024 08:51:21 -0500
Received: from [172.17.162.8] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 14 Mar 2024 08:51:21 -0500
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
X-Inumbo-ID: f8899aea-e209-11ee-afdd-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hmJXtctNhitLjZLr3jvCoG0iNdt8sGhqnE2UbDasN1zTI5Hb/PhRLJIaC9FampqME6TlT48V7+36DzkfkKtEe9SvD/t0vYYYKByCPfYcNRK1QK7OAB1HIDl/q0yJAS6hjRJYN7wQWLEmp8FSDAcdo/dDPZxKHetpCYlIj79dMWMJkmZuSaZBU+1LNLUCLa0YWQAUJRAhybk9WZxSjmJB1PrWttft/TNTiUTs0w/4740082Qryz79DK7N8Y5Mh+oVXtDyAM2yZiNx+EvIccBUjTnNqNqC+dRP6fISmyXDWDjE4iGKe0nvnBTKMM8qBHOwKqSGiq3Yjvzx7EfXnUMY0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eDt/puo9y9p/vv03V5R6XBNRP5HW9wRwW3BZC+S4ujw=;
 b=KfnDN5uWwWuq9Wp0P73QL1mSCd5gfm4UKT/DTGZ4p/O7KMaXzwm4+L65CPc96YkzlxmwCpPdtWrnGol2mAhv/6oo6zTjP2trRsMqdfHPzeXUjC9Jfc6jk/4ee1knAIaz+/hJrdU/0crazdtc88b0nBx8NI6mBVbDb4GD6h1ujl3eFbls0FnUkRl/mqw5CztLmciyBdFAb19vOuFIfx40OlR2Cp8+anTSVPiNROll3vQisrdhetpJ7qsWqwU1FlmThF/EK7pOjb8Grs39/xArbyLTQrGNYTc5//AL9GUqmA2QVdLLKEf51av8jJccmuQC0foTPM8OSypbxTHB5r63Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDt/puo9y9p/vv03V5R6XBNRP5HW9wRwW3BZC+S4ujw=;
 b=yZBwZlwlsWHZwaB4qC5tZipTgvYL5GbffAfAuFGpcbAovCB7cOLKVNbUP0upGqFEGaug83xXCztFczFAHxDGNjyKFyEPkYejb5qlOUZGsdgEaMkBwjFv22+LQOqV2v9iez0FGVUYCIN8IOYOrST3E0+Feutjs3vz3cz4RRVdb7c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <afb3aa21-cd8b-425d-a4fa-b9ca57367d28@amd.com>
Date: Thu, 14 Mar 2024 09:51:22 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] x86/PVH: Support relocatable dom0 kernels
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
References: <20240313193021.241764-1-jason.andryuk@amd.com>
 <20240313193021.241764-4-jason.andryuk@amd.com> <ZfLIBHTbcbGqFAhY@macbook>
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <ZfLIBHTbcbGqFAhY@macbook>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003447:EE_|IA1PR12MB7661:EE_
X-MS-Office365-Filtering-Correlation-Id: cb863103-2fff-4735-9cb4-08dc442dd583
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Sfqrq/NsXJ5QkvLs6JK+wNUvAYEmzmy67KVX117pB8w9i3pCtvnZYE5HkmIYhjGG0ddZx1i/mImYzXmTMQdiZJnaJBD+3FKpVVWKYEFWZ8QU4ak15pTIWD98Ek7zREbQTzDFVKGwkrZ+49mRbmHTtLBPkup1fgJQ6qtGYeSloOs85pJmue9BaeX3l4xl4kU1+/SbSHHBLHPoeQuqeeN0Fb/yn37ML9YDEAWAxoMTCt7NaL+0fsnvZN08tIwDjmOpbxnglrvKoA4aHxBhePLwxdC+SjyZf6YFBHl6i9donvDkhVjIugQ03wPXOHz9JHrEJulVO4Jh4c0/zujaIAzosMtdboTxZtBNlw+GCO0/yK0YYstTIb9BJknwp6zgZuQneQamVyhtV1NDZesroGmOHhEN6TSf61crQU0uMAhI5xLijIZJon7X86W1KJ/6AGISQjemtgTeTE8VtvizQIJa5xy47Gk5DO46RXqcMOh89VI09MOLHdnLZ8tphnPFRhBkTrMDpaTjpmH1cuu9nwCJvIN2weKTr77GKdzk3RCu44vIibwxCjRV81Nlu/D6//ikPZlq/AjXUr9LEyBWm9JMSAmX8SC/GpDpTnyXgXmR959GkZ//FXlTDArh9lJTqPaZucHLa3yVCeAylK/SNv/lIMaEjlqC35LrlcBE+6v7CeYYsOMmD4ti9hypmZAdnAfU+JCdPtzA3ZqFlEejLMSH5g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 13:51:22.5376
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb863103-2fff-4735-9cb4-08dc442dd583
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003447.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7661

On 2024-03-14 05:48, Roger Pau Monné wrote:
> On Wed, Mar 13, 2024 at 03:30:21PM -0400, Jason Andryuk wrote:
>> Xen tries to load a PVH dom0 kernel at the fixed guest physical address
>> from the elf headers.  For Linux, this defaults to 0x1000000 (16MB), but
>> it can be configured.
>>
>> Unfortunately there exist firmwares that have reserved regions at this
>> address, so Xen fails to load the dom0 kernel since it's not RAM.
>>
>> The PVH entry code is not relocatable - it loads from absolute
>> addresses, which fail when the kernel is loaded at a different address.
>> With a suitably modified kernel, a reloctable entry point is possible.
>>
>> Add XEN_ELFNOTE_PVH_RELOCATION which specifies the minimum, maximum and
>> alignment needed for the kernel.  The presence of the NOTE indicates the
>> kernel supports a relocatable entry path.
>>
>> Change the loading to check for an acceptable load address.  If the
>> kernel is relocatable, support finding an alternate load address.
>>
>> Link: https://gitlab.com/xen-project/xen/-/issues/180
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> ---
>> ELF Note printing looks like:
>> (XEN) ELF: note: PVH_RELOCATION = min: 0x1000000 max: 0xffffffff align: 0x200000
>>
>> v2:
>> Use elfnote for min, max & align - use 64bit values.
>> Print original and relocated memory addresses
>> Use check_and_adjust_load_address() name
>> Return relocated base instead of offset
>> Use PAGE_ALIGN
>> Don't load above max_phys (expected to be 4GB in kernel elf note)
>> Use single line comments
>> Exit check_load_address loop earlier
>> Add __init to find_kernel_memory()
>> ---
>>   xen/arch/x86/hvm/dom0_build.c      | 108 +++++++++++++++++++++++++++++
>>   xen/common/libelf/libelf-dominfo.c |  13 ++++
>>   xen/include/public/elfnote.h       |  11 +++
>>   xen/include/xen/libelf.h           |   3 +
>>   4 files changed, 135 insertions(+)
>>
>> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
>> index 0ceda4140b..5c6c0d2db3 100644
>> --- a/xen/arch/x86/hvm/dom0_build.c
>> +++ b/xen/arch/x86/hvm/dom0_build.c
>> @@ -537,6 +537,108 @@ static paddr_t __init find_memory(
>>       return INVALID_PADDR;
>>   }
>>   
>> +static bool __init check_load_address(
>> +    const struct domain *d, const struct elf_binary *elf)
>> +{
>> +    paddr_t kernel_start = (paddr_t)elf->dest_base & PAGE_MASK;
> 
> Are you sure this is correct?  If a program header specifies a non-4K
> aligned load address we should still try to honor it.  I think this is
> very unlikely, but still we shouldn't apply non-requested alignments
> to addresses coming from the ELF headers.

I think it's correct in terms of checking the e820 table.  Since the 
memory map is limited to 4k granularity, the bounds need to be rounded 
accordingly.

>> +    paddr_t kernel_end = PAGE_ALIGN((paddr_t)elf->dest_base + elf->dest_size);
>> +    unsigned int i;
>> +
>> +    /*
>> +     * The memory map is sorted and all RAM regions starts and sizes are
>> +     * aligned to page boundaries.
> 
> Relying on sizes to be page aligned seems fragile: it might work now
> because of the order in which pvh_setup_vmx_realmode_helpers() first
> reserves memory for the TSS and afterwards for the identity page
> tables, but it's not a property this code should assume.

That can be removed.  It would just eliminate the early exit...

>> +     */
>> +    for ( i = 0; i < d->arch.nr_e820; i++ )
>> +    {
>> +        paddr_t start = d->arch.e820[i].addr;
>> +        paddr_t end = d->arch.e820[i].addr + d->arch.e820[i].size;
>> +
>> +        if ( start >= kernel_end )
>> +            return false;

... here.

>> +        if ( start <= kernel_start &&
>> +             end >= kernel_end &&
>> +             d->arch.e820[i].type == E820_RAM )
> 
> Nit: I would maybe do the type check before the boundary ones, as it's
> pointless to do boundary checking on a region of a non-RAM type.  But
> I guess you could also see it the other way around.
> 
>> +            return true;
>> +    }
>> +
>> +    return false;
>> +}
>> +
>> +/* Find an e820 RAM region that fits the kernel at a suitable alignment. */
>> +static paddr_t __init find_kernel_memory(
>> +    const struct domain *d, struct elf_binary *elf,
> 
> const for elf also.

Yes, thanks.

>> +    const struct elf_dom_parms *parms)
>> +{
>> +    paddr_t kernel_start = (paddr_t)elf->dest_base & PAGE_MASK;
>> +    paddr_t kernel_end = PAGE_ALIGN((paddr_t)elf->dest_base + elf->dest_size);
>> +    paddr_t kernel_size = kernel_end - kernel_start;
> 
> Hm, I'm again unsure about the alignments applied here.

Same as above regarding 4k granularity.

> I think if anything we want to assert that dest_base is aligned to phys_align.

That would indicate the kernel image is inconsistent.

>> +    unsigned int i;
>> +
>> +    /*
>> +     * The memory map is sorted and all RAM regions starts and sizes are
>> +     * aligned to page boundaries.
>> +     */
>> +    for ( i = 0; i < d->arch.nr_e820; i++ )
>> +    {
>> +        paddr_t start = d->arch.e820[i].addr;
>> +        paddr_t end = d->arch.e820[i].addr + d->arch.e820[i].size;
>> +        paddr_t kstart, kend;
>> +
>> +        if ( d->arch.e820[i].type != E820_RAM )
>> +            continue;
>> +
>> +        if ( d->arch.e820[i].size < kernel_size )
>> +            continue;
> 
> You can unify both checks in a single condition.

Ok.

>> +
>> +        kstart = ROUNDUP(start, parms->phys_align);
>> +        kstart = kstart < parms->phys_min ? parms->phys_min : kstart;
>> +        kend = kstart + kernel_size;
>> +
>> +        if ( kend > parms->phys_max )
>> +            return 0;
>> +
>> +        if ( kend <= end )
>> +            return kstart;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +/* Check the kernel load address, and adjust if necessary and possible. */
>> +static bool __init check_and_adjust_load_address(
>> +    const struct domain *d, struct elf_binary *elf, struct elf_dom_parms *parms)
>> +{
>> +    paddr_t reloc_base;
>> +
>> +    if ( check_load_address(d, elf) )
>> +        return true;
>> +
>> +    if ( parms->phys_align == UNSET_ADDR )
>> +    {
>> +        printk("Address conflict and %pd kernel is not relocatable\n", d);
>> +        return false;
>> +    }
>> +
>> +    reloc_base = find_kernel_memory(d, elf, parms);
>> +    if ( reloc_base == 0 )
>> +    {
>> +        printk("Failed find a load address for the kernel\n");
> 
> Since you print the domain in the error message prior to this one, I
> would consider also printing it here (or not printing it in both
> cases).

I'll add the %pd.

>> +        return false;
>> +    }
>> +
>> +    if ( opt_dom0_verbose )
>> +        printk("Relocating kernel from [%lx, %lx] -> [%lx, %lx]\n",
>> +               (paddr_t)elf->dest_base,
>> +               (paddr_t)elf->dest_base + elf->dest_size,
>> +               reloc_base, reloc_base + elf->dest_size);
> 
> I think you need `- 1` for the end calculation if you use inclusive
> ranges [, ].  Otherwise [, ) should be used.

Ok, I'll do [, ] with the -1.

>> +
>> +    parms->phys_entry += (reloc_base - (paddr_t)elf->dest_base);
> 
> This seems to assume that the image is always relocated at a higher
> address that the original one?
> 
> parms->phys_entry = reloc_base + (parms->phys_entry - elf->dest_base);

Ok

>> +    elf->dest_base = (char *)reloc_base;
>> +
>> +    return true;
>> +}
>> +
>>   static int __init pvh_load_kernel(struct domain *d, const module_t *image,
>>                                     unsigned long image_headroom,
>>                                     module_t *initrd, void *image_base,
>> @@ -585,6 +687,12 @@ static int __init pvh_load_kernel(struct domain *d, const module_t *image,
>>       elf.dest_base = (void *)(parms.virt_kstart - parms.virt_base);
>>       elf.dest_size = parms.virt_kend - parms.virt_kstart;
>>   
>> +    if ( !check_and_adjust_load_address(d, &elf, &parms) )
>> +    {
>> +        printk("Unable to load kernel\n");
> 
> check_and_adjust_load_address() already prints an error message,
> probably no need to print another message.

Ok

>> +        return -ENOMEM;
>> +    }
>> +
>>       elf_set_vcpu(&elf, v);
>>       rc = elf_load_binary(&elf);
>>       if ( rc < 0 )
>> diff --git a/xen/common/libelf/libelf-dominfo.c b/xen/common/libelf/libelf-dominfo.c
>> index 7cc7b18a51..837a1b0f21 100644
>> --- a/xen/common/libelf/libelf-dominfo.c
>> +++ b/xen/common/libelf/libelf-dominfo.c
>> @@ -125,6 +125,7 @@ elf_errorstatus elf_xen_parse_note(struct elf_binary *elf,
>>           [XEN_ELFNOTE_SUSPEND_CANCEL] = { "SUSPEND_CANCEL", ELFNOTE_INT },
>>           [XEN_ELFNOTE_MOD_START_PFN] = { "MOD_START_PFN", ELFNOTE_INT },
>>           [XEN_ELFNOTE_PHYS32_ENTRY] = { "PHYS32_ENTRY", ELFNOTE_INT },
>> +        [XEN_ELFNOTE_PVH_RELOCATION] = { "PVH_RELOCATION", ELFNOTE_OTHER },
>>       };
>>   /* *INDENT-ON* */
>>   
>> @@ -234,6 +235,17 @@ elf_errorstatus elf_xen_parse_note(struct elf_binary *elf,
>>                   elf_note_numeric_array(elf, note, 8, 0),
>>                   elf_note_numeric_array(elf, note, 8, 1));
>>           break;
>> +
>> +    case XEN_ELFNOTE_PVH_RELOCATION:
>> +        if ( elf_uval(elf, note, descsz) != 3 * sizeof(uint64_t) )
>> +            return -1;
>> +
>> +        parms->phys_min = elf_note_numeric_array(elf, note, 8, 0);
>> +        parms->phys_max = elf_note_numeric_array(elf, note, 8, 1);
>> +        parms->phys_align = elf_note_numeric_array(elf, note, 8, 2);
> 
> Size for those needs to be 4 (32bits) as the entry point is in 32bit
> mode?  I don't see how we can start past the 4GB boundary.

I specified the note as 3x 64bit values.  It seemed simpler than trying 
to support both 32bit and 64bit depending on the kernel arch.  Also, 
just using 64bit provides room in case it is needed in the future.

Do you want the note to be changed to 3x 32bit values?

>> +        elf_msg(elf, "min: %#"PRIx64" max: %#"PRIx64" align: %#"PRIx64"\n",
>> +                parms->phys_min, parms->phys_max, parms->phys_align);
>> +        break;
>>       }
>>       return 0;
>>   }
>> @@ -545,6 +557,7 @@ elf_errorstatus elf_xen_parse(struct elf_binary *elf,
>>       parms->p2m_base = UNSET_ADDR;
>>       parms->elf_paddr_offset = UNSET_ADDR;
>>       parms->phys_entry = UNSET_ADDR32;
>> +    parms->phys_align = UNSET_ADDR;
> 
> For correctness I would also init phys_{min,max}.

There is a memset() out of context above to zero the structure.  I 
thought leaving them both 0 would be fine.

I chose to initialize phys_align as the 64bit UNSET_ADDR since that is 
clearly invalid...  Though we don't have any checking that phys_align is 
a power of 2.

Regards,
Jason

