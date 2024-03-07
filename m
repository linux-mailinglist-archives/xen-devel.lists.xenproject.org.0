Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6B48754D5
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 18:06:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689970.1075525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riHBa-0007ow-L4; Thu, 07 Mar 2024 17:05:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689970.1075525; Thu, 07 Mar 2024 17:05:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riHBa-0007mG-IA; Thu, 07 Mar 2024 17:05:38 +0000
Received: by outflank-mailman (input) for mailman id 689970;
 Thu, 07 Mar 2024 17:05:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=inme=KN=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1riHBZ-0007mA-0w
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 17:05:37 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2416::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8891bdd-dca4-11ee-afda-a90da7624cb6;
 Thu, 07 Mar 2024 18:05:35 +0100 (CET)
Received: from CH0PR03CA0386.namprd03.prod.outlook.com (2603:10b6:610:119::29)
 by DS7PR12MB5767.namprd12.prod.outlook.com (2603:10b6:8:76::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Thu, 7 Mar
 2024 17:05:26 +0000
Received: from DS2PEPF0000343A.namprd02.prod.outlook.com
 (2603:10b6:610:119:cafe::97) by CH0PR03CA0386.outlook.office365.com
 (2603:10b6:610:119::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.27 via Frontend
 Transport; Thu, 7 Mar 2024 17:05:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343A.mail.protection.outlook.com (10.167.18.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Thu, 7 Mar 2024 17:05:25 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 7 Mar
 2024 11:05:19 -0600
Received: from [172.17.205.23] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 7 Mar 2024 11:05:19 -0600
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
X-Inumbo-ID: e8891bdd-dca4-11ee-afda-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gU6h9lWqS9YCfyvaCTnFuKnDZi7RQE2RbGD7ZScrk1apdFpurciu3rLT/2M8dGqKJ26SDAE4kyFpPkk7qQZv6KZZ2e2yRMMRIuLbOaP58Jc5aJsMsrYmWTbSAwvBFDwhXcLnl1wPwNIymS6tfVM7YgFLHO4edcN+OPx9MoHvNYj0MEI4qiupEETzR2Ee5lc5/dycaaE5XqlBHSQ5IX1koCxKRShQtKyCvVgmrxX8FhK/6yzMgkjSp30AFM5SVyWzxBAfcT/JUf7NFQ8LX5At8FkjjscXZxrgc/jiqxQS6tVPjXEFVW3LVuswjMlmCJbT4mLsVWnOIGKHJwcNIr8jKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=peDdfk8CtYT+D01TwAjKTx9fXGe/hb4qFEAKpOAB/4E=;
 b=TrPFdy2RaWn46xFo91oG5z4TO0AJ0uOwtKDDVYZveXPGDH/CsakHJQwX+MMy7c4x9q9k3dbfIF/hyA122faKhbKxytMFS3d99G0tUZ0vAppLgOgW2BxF0g0noa+0URNx1DAkw/idTOl7BMy44YuYKJpGLfLshUELDQ3Rv8aIThg26r8L64NALRNyWnE3eoolEhLJEUhn/ft1mDDJ4eAcHCL8Yo+bERdwGdKeStqCYbfj8x8ZmlWK9ESH78JBRHcQPjSaO/lTFLlcuqiOL7rBSRDctiCA6ThA+ySDVOrFguKG6VIVlcDR8Wgbxvyi7tDvRdd3XOl2/ucNc1L87CStHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=peDdfk8CtYT+D01TwAjKTx9fXGe/hb4qFEAKpOAB/4E=;
 b=YNyrYPi/Zz+D4eR3W1NNzPkuHHRlGS+76+2Dvxs9DUeXKVLhI3f/6GYCPfNj1kDVDAnMQ8RunGHxyJHYGv4Z5JWrXggG2oPFvo1GJTQAh4W6iaZD56hcSxKDGUrioAesyFySccK4A+jG4Oy40zkQGFxLdm8IOesRE+cX3VWyrC0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <a8e55679-0e23-44ec-9555-d126dd08be19@amd.com>
Date: Thu, 7 Mar 2024 12:01:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH 3/3] x86/PVH: Support relocatable dom0 kernels
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
References: <20240306185032.103216-1-jason.andryuk@amd.com>
 <20240306185032.103216-4-jason.andryuk@amd.com> <ZemJLs0yHiSGI6nO@macbook>
Content-Language: en-US
In-Reply-To: <ZemJLs0yHiSGI6nO@macbook>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343A:EE_|DS7PR12MB5767:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a976f22-89c3-41c6-eed0-08dc3ec8c88d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6iC7Vz/1C1yepYZpsDWOe+tSF/ZBtIbHQGyLCdRDgBOq+gCTPQE+DliyVsOeCYY0zBvaHVzqGLksCTkD3IqNLHztw9upDAAqngC0PEVuX4PBYlFt9dN8LD8BttOG6+Z+IoxxDrhMTrMpIy8LO4E3eKf+VF4SX/Mzh10vLiZSVlKUshQd4h/kvO0cTAZmuBbyJvF+St48h6sGWHwSX+t1G8n1DqO8l1Zdv4DffcxU/x9vycS2lj+lC8awOiq65pA4nrA56SUmKCaBrolHY0mWEYEnVMT8lxr469ExGRkyX8RQJWt0Hi6/IyLJoeiWso4lIEOn/vUlrMS3kyzhmX9VC7p0fP5QRVO0PCX20Qr4WX/DK7VBfecRaPxjtEezs2ClwpRG6fQgpXb1UHvLHfufdid+LR/zNfTjnuid5AqNDLVcFNYngkeGMLz7pl8xIMRCgH2xDaDBbBfkQOOEchd5/ZGrOXHtFLlegYFZFZO21aNiBQXEKbE1+eJCU120NBGAH1I/9o7Cza4yoRwCmcpj4CVD9ptNyqR+ixneDG7mgbDfLjGzTyUvYg1Xz7AC9VboPDie7NrBF8cp4HMq1F8pf2hAVBPCwEsLYWD+WFIuedz0ufPuZVH41pbKfq0n8e9TQ5xBAe/RI/9s6abM0uxFJmILnpkeiNcsep/DT9y5krTP15Zq4Y9OPDS5etIaEe/YJkQxYdJbem5GhrKE6xJZ5A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 17:05:25.7956
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a976f22-89c3-41c6-eed0-08dc3ec8c88d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5767

On 2024-03-07 04:30, Roger Pau Monné wrote:
> On Wed, Mar 06, 2024 at 01:50:32PM -0500, Jason Andryuk wrote:
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
>> Add the XENFEAT_pvh_relocatable flag to let a kernel indicate that it
>> supports a relocatable entry path.
>>
>> Change the loading to check for an acceptable load address.  If the
>> kernel is relocatable, support finding an alternate load address.
>>
>> Linux cares about its physical alignment.  This can be pulled out of the
>> bzImage header, but not from the vmlinux ELF file.  If an alignment
>> can't be found, use 2MB.
> 
> While I'm fine with having a Linux specific way, there needs to be a
> generic way of passing the alignment for non-bzImage kernels.
> 
> ELF program headers have an align field, would that be suitable to
> use?

Unfortunately, it doesn't seem correct.  Linux has 
CONFIG_PHYSICAL_ALIGN, and it doesn't seem to be used in the elf 
headers.  As a quick test, I set CONFIG_PHYSICAL_ALIGN=0x800000, but the 
elf align values are still 0x200000.

> In elf_parse_binary() where the p{start,end} is calculated, you could
> also fetch the p_offset from the lower found program header and use it
> as the required alignment.  Would that be OK for Linux and maybe avoid
> having to fiddle with the bzImage header?  FWIW it is likely fine for
> FreeBSD.

Adding an explicit value in an elf note would avoid any ambiguity.

>>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> I created a gitlab ticket for this:
> 
> https://gitlab.com/xen-project/xen/-/issues/180
> 
> If you want to reference it.

Will do

>> ---
>> Put alignment as a new ELF note?  Presence of that note would indicate
>> relocation support without a new XENFEAT flag.
>>
>> Default alignment to a multiple of 2MB to make more cases work?  It has
>> to be a power of two, and a multiple might allow loading a customized
>> kernel.  A larger alignment would limit the number of possible load
>> locations.
>> ---
>>   xen/arch/x86/hvm/dom0_build.c | 109 ++++++++++++++++++++++++++++++++++
>>   xen/include/public/features.h |   5 ++
>>   2 files changed, 114 insertions(+)
>>
>> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
>> index bbae8a5645..34d68ee8fb 100644
>> --- a/xen/arch/x86/hvm/dom0_build.c
>> +++ b/xen/arch/x86/hvm/dom0_build.c
>> @@ -537,6 +537,109 @@ static paddr_t __init find_memory(
>>       return INVALID_PADDR;
>>   }
>>   
>> +static bool __init check_load_address(
>> +    const struct domain *d, const struct elf_binary *elf)
>> +{
>> +    paddr_t kernel_start = (paddr_t)elf->dest_base & PAGE_MASK;
>> +    paddr_t kernel_end = ROUNDUP((paddr_t)elf->dest_base + elf->dest_size,
>> +                                 PAGE_SIZE);
> 
> You can use PAGE_ALIGN() here (and below) for simplicity.

Ok

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
> 
> Since the memory map is sorted you can end the loop once end start >=
> kernel_end?  As further regions are past the kernel destination.

Yes, thanks.

>> +
>> +        if ( start <= kernel_start &&
>> +             end >= kernel_end &&
>> +             d->arch.e820[i].type == E820_RAM )
>> +            return true;
>> +    }
>> +
>> +    return false;
>> +}
>> +
>> +/*
>> + * Find an e820 RAM region that fits the kernel at a suitable alignment.
>> + */
> 
> This (and other) comment seems to fit in a single line: /* ... */.

Ok

>> +static paddr_t find_kernel_memory(
>> +    const struct domain *d, struct elf_binary *elf, paddr_t align)
> 
> elf can be const AFAICT.

Ok

>> +{
>> +    paddr_t kernel_start = (paddr_t)elf->dest_base & PAGE_MASK;
>> +    paddr_t kernel_end = ROUNDUP((paddr_t)elf->dest_base + elf->dest_size,
>> +                                 PAGE_SIZE);
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
>> +        paddr_t kstart, kend, offset;
>> +
>> +        if ( d->arch.e820[i].type != E820_RAM )
>> +            continue;
>> +
>> +        if ( d->arch.e820[i].size < elf->dest_size )
>> +            continue;
>> +
>> +        if ( end < kernel_end )
>> +            continue;
> 
> I'm not sure I understand this check, why would we refuse regions
> below the fixed kernel end?  Those should be equally suitable if big
> enough and meeting the alignment requirements.

I thought (Linux at least) wouldn't want to be moved lower - only higher 
in ram.  There was some Linux boot code that gave me that impression, 
but it may not be strictly true.

>> +
>> +        kstart = ROUNDUP(start, align);
>> +        offset = kstart - kernel_start;
>> +        kend = kernel_end + offset;
>> +
>> +        if ( kend <= end )
>> +            return offset;
> 
> Why not return this as an address to use to load the kernel instead of
> an offset from dest_base?  That would also make the calculations
> easier IMO.

phys_entry needs to be updated as well as dest_base, so returning the 
offset seemed more useful.

>> +    }
> 
> This should be limited to a range below 4GB.

Yes.

>> +    return 0;
>> +}
>> +
>> +/*
>> + * Check the kernel load address, and adjust if necessary and possible.
>> + */
>> +static bool __init adjust_load_address(
>> +    const struct domain *d, struct elf_binary *elf, struct elf_dom_parms *parms,
>> +    paddr_t align)
>> +{
>> +    paddr_t offset;
>> +
>> +    /* Check load address */
>> +    if ( check_load_address(d, elf) )
>> +        return true;
>> +
>> +    if ( !test_bit(XENFEAT_pvh_relocatable, parms->f_supported) )
>> +    {
>> +        printk("Address conflict and %pd kernel is not relocatable\n", d);
>> +        return false;
>> +    }
>> +
>> +    if ( align == 0 )
>> +        align = MB(2);
>> +
>> +    offset = find_kernel_memory(d, elf, align);
>> +    if ( offset == 0 )
>> +    {
>> +        printk("Failed find a load offset for the kernel\n");
>> +        return false;
>> +    }
>> +
>> +    printk("Adjusting load address by %#lx\n", offset);
> 
> I think this would be more helpful if the previous and the new ranges
> are printed, as I'm not sure the previous dest_base is printed, in
> which case the offset doesn't help much.  I would do:
> 
> if ( opt_dom0_verbose )
>      printk("relocating kernel from [%lx, %lx] -> [%lx, %lx]\n", ...);

dest_base was printed (maybe with extra verbosity), but this message is 
clearer since it shows the end result.

>> +    elf->dest_base += offset;
>> +    parms->phys_entry += offset;
> 
> As noted above, I think it would be better if find_kernel_memory()
> find an absolute address which is then adjusted here.

I thought the modification with just offset was clearer compared to:

params->phys_entry += (reloc_base - elf->dest_base);
elf->dest_base = reloc_base;

But I'm fine making the change.

>> +
>> +    return true;
>> +}
>> +
>>   static int __init pvh_load_kernel(struct domain *d, const module_t *image,
>>                                     unsigned long image_headroom,
>>                                     module_t *initrd, void *image_base,
>> @@ -587,6 +690,12 @@ static int __init pvh_load_kernel(struct domain *d, const module_t *image,
>>       elf.dest_base = (void *)(parms.virt_kstart - parms.virt_base);
>>       elf.dest_size = parms.virt_kend - parms.virt_kstart;
>>   
>> +    if ( !adjust_load_address(d, &elf, &parms, align) )
> 
> check_and_adjust_?  As the address is not unconditionally adjusted.

I thought it was a little too wordy, but it is more accurate.  I'll 
rename it.

Thanks for taking a look.

-Jason

