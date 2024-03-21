Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A9C885A2B
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 14:55:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696419.1087337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnIsN-0000Yg-Sw; Thu, 21 Mar 2024 13:54:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696419.1087337; Thu, 21 Mar 2024 13:54:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnIsN-0000Wm-Pf; Thu, 21 Mar 2024 13:54:35 +0000
Received: by outflank-mailman (input) for mailman id 696419;
 Thu, 21 Mar 2024 13:54:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DDWh=K3=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rnIsM-0000Wg-2e
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 13:54:34 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2414::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a0c2b1b-e78a-11ee-a1ee-f123f15fe8a2;
 Thu, 21 Mar 2024 14:54:31 +0100 (CET)
Received: from PH8PR21CA0004.namprd21.prod.outlook.com (2603:10b6:510:2ce::11)
 by PH0PR12MB7930.namprd12.prod.outlook.com (2603:10b6:510:283::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27; Thu, 21 Mar
 2024 13:54:27 +0000
Received: from SA2PEPF000015C8.namprd03.prod.outlook.com
 (2603:10b6:510:2ce:cafe::4e) by PH8PR21CA0004.outlook.office365.com
 (2603:10b6:510:2ce::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11 via Frontend
 Transport; Thu, 21 Mar 2024 13:54:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Thu, 21 Mar 2024 13:54:26 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 21 Mar
 2024 08:54:26 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 21 Mar
 2024 08:54:26 -0500
Received: from [172.24.153.109] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 21 Mar 2024 08:54:25 -0500
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
X-Inumbo-ID: 8a0c2b1b-e78a-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DEcBvRYZDgMt7ybTxadkKvIwG4sixqb6wNsBVQovEgao4sX7ghmuLP+DAOj4DfoMawZx0UQ4H+f1kD7SIISyv9lM6u2aUj+JWERnib+sCGNGq6Tgkwg1zY8w2W5BljMAIFeAR+EK99kqjP0gVkpHB2a2RTr8xq3XaNIW5R6KP0kSL6xIIorzeJuC+0bSvOjYq9Hnddc59irUn9mwSZfYV7PJJJqRHP/6KffvcjBCy3VZQvR6Czh9djN8UYohsxmDvOWVc83f6kGX7YjORG2a+30P6H/idpce/gWkeMTQ621rd/5fQu1M8r5PBeGWhyTdY9QEwVmtLRYWh3X0UtB5Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fP8l0cdYuU1dl7qvwMTpxTd02D7J7iN/nE49vaIMgAI=;
 b=jVJeDRxuRxcU6WEMDm6LycF6p5lB8w0xspjVRc6jkeDay43SdhdxQfDx7sgw62DCI8rcMJ9s/bjOkJDJhc+2nIf7Qq71GT4KtV7U2g98Wm9T+5UEN7nOHwY5lIMp/QZbZ5nx1XV3G4+U0qzdqCgy8qM7sBOXoNxkMcefP1iWCmgHXbzzHC9/NopB5TdwUNqe9oo52YsZn47VJbCx4Hu7cCTSAZPxUuRzIbDZI/mJO5qt86vdrMz1zJpu9TdzDP6bPXZoDquzXaIdIdxphN0Yl4xnqFaFYu29sXm7ze6o8JA8yBmgwqo/I/RTTMl5KRi7Cha/VJMkjW5GToNJ9lUflA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fP8l0cdYuU1dl7qvwMTpxTd02D7J7iN/nE49vaIMgAI=;
 b=POH0nmMkFoHGiE1DqcCviFUK2JN/M7LM4/kiDeGh7fO9fHrgMEawrncfHkXLFx0IZM1TIDrTDzd//PpfRqrzRn5ivPSaKvS/8LsYVNRPv7poDQg4pdB4JPCtJQxbfzcpuMz1wgMEodxOrZ0macdhyzR7yAhesEswo7QT026cjKo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <183f17a2-cc7b-46c6-81b5-ac1f5daacb7b@amd.com>
Date: Thu, 21 Mar 2024 09:45:30 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] x86/PVH: Support relocatable dom0 kernels
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
References: <20240319205849.115884-1-jason.andryuk@amd.com>
 <20240319205849.115884-4-jason.andryuk@amd.com>
 <ad5ef9ee-d509-435d-943c-8d7005c823d2@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <ad5ef9ee-d509-435d-943c-8d7005c823d2@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C8:EE_|PH0PR12MB7930:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f001ddc-222c-47c9-3ab4-08dc49ae6c61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8MSbTwtTyNpU2oW8pOoE/EnPJUtFs3A22bL6g9xRON8axM6PvbD0KaYRbxBxkflRq+etOuKHbIeiQ4EtlptVLvfeEolIkDormHIXfMyb09iyP/jUeCnma95IvdYJ7jpTUb6O9/6PI8eX4LX1kSPt1XN8Q0D32o5leu8s5lIVWmStlUi5HJbGXGn8YPsMD4zfb/tkHFrxU7mmKN/DbSbrjSobl/Hv481gX153iB1B2c5stg53ojxOxL4XPCZyPIlz0HJ3S9Emt7ceaHcr3o62yWHxu8BBAUcCaTSvvRkc4qHwqOiTdmlPlb2MGdtNZhDRDmDhF6zVnH5sWeqwnCQbQ0YikJMLUsDcuiFqdmXbwXyNWBEMXBITPd2I1fonLyc4Hp8QuESo6xdSuEcJA1vUTWlTFpA0KQx3ILoCrk3zBpX29pxFC5lAUJdmVcV8GKB/dhgEKf1K2frx1xjpUnkli9vOwMvBL87fDcu6Z8sEpeBd+ZFZH4wHGhcazH9TFeinoq11I8yYR7qP1wFnObFCNvok2UJvLCKAP40im/5OW0vkpXl2HM3Y1VLp/g6xl1Z/CrqiNsOr79W5h6utqntSS9/Hf12eo9RcOXp1+UDmAu+7H16GnPqS41F1Ulr6cw1uxrSmkFl2yZtSr6v6JMdSxAmgNE0f9RFeHvDsxnD1SQUL3o5gbXnA82lc91PfhofzwM3NCAevdyxAOboUKEwnwopksGZ/AmT+ngFRuNBXqXxmMySCTW0KsONQsfRUZEUE
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 13:54:26.9810
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f001ddc-222c-47c9-3ab4-08dc49ae6c61
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7930

On 2024-03-20 10:39, Jan Beulich wrote:
> On 19.03.2024 21:58, Jason Andryuk wrote:
>> --- a/xen/arch/x86/hvm/dom0_build.c
>> +++ b/xen/arch/x86/hvm/dom0_build.c
>> @@ -537,6 +537,97 @@ static paddr_t __init find_memory(
>>       return INVALID_PADDR;
>>   }
>>   
>> +static bool __init check_load_address(
>> +    const struct domain *d, const struct elf_binary *elf)
>> +{
>> +    paddr_t kernel_start = (paddr_t)elf->dest_base;
> 
> As before I think it is illegitimate to cast a pointer to paddr_t. The
> variable type wants to remain such, but the cast wants to be to
> unsigned long or uintptr_t (or else at least a comment wants adding).

Ok, thanks.  This explains it clearly.

>> +/* Find an e820 RAM region that fits the kernel at a suitable alignment. */
>> +static paddr_t __init find_kernel_memory(
>> +    const struct domain *d, struct elf_binary *elf,
>> +    const struct elf_dom_parms *parms)
>> +{
>> +    paddr_t kernel_size = elf->dest_size;
>> +    unsigned int i;
>> +
>> +    for ( i = 0; i < d->arch.nr_e820; i++ )
>> +    {
>> +        paddr_t start = d->arch.e820[i].addr;
>> +        paddr_t end = d->arch.e820[i].addr + d->arch.e820[i].size;
>> +        paddr_t kstart, kend;
>> +
>> +        if ( d->arch.e820[i].type != E820_RAM ||
>> +             d->arch.e820[i].size < kernel_size )
>> +            continue;
>> +
>> +        kstart = ROUNDUP(start, parms->phys_align);
>> +        kstart = max_t(paddr_t, kstart, parms->phys_min);
> 
> I'd generally try to avoid max_t(), but I cannot think of any good way
> of expressing this without using it.
> 
>> +        kend = kstart + kernel_size;
>> +
>> +        if ( kend > parms->phys_max )
> 
> So despite its default phys_max is exclusive aiui. Otherwise with
> kend being exclusive too, this would look to be off by one.

Yes, I'll fix the off-by-one.  Hmmm, phys_max being 32bit, we want it to 
be inclusive to represent the maximum range.

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
>> +    if ( !parms->phys_reloc )
>> +    {
>> +        printk("%pd kernel: Address conflict and not relocatable\n", d);
>> +        return false;
> 
> This better wouldn't result in -ENOMEM in the caller. Then again reasons
> are logged, so the specific error code perhaos doesn't matter that much.

Failure here is turned into -ENOMEM by pvh_load_kernel().   -ENOMEM is 
already returned for later failure with find_memory(), so I thought it 
was acceptable.  Without this code, elf_load_binary() would failed with 
-1 and that would be returned.  I'll change it to whatever you prefer.

>> +    }
>> +
>> +    reloc_base = find_kernel_memory(d, elf, parms);
>> +    if ( reloc_base == 0 )
> 
> With ! used above please be consistent and do so here, too.

phys_reloc is a bool, and reloc_base is a paddr_t.

>> +    {
>> +        printk("%pd kernel: Failed find a load address\n", d);
>> +        return false;
>> +    }
>> +
>> +    if ( opt_dom0_verbose )
>> +        printk("%pd kernel: Moving [%p, %p] -> [%"PRIpaddr", %"PRIpaddr"]\n", d,
>> +               elf->dest_base, elf->dest_base + elf->dest_size - 1,
>> +               reloc_base, reloc_base + elf->dest_size - 1);
>> +
>> +    parms->phys_entry = reloc_base +
>> +                            (parms->phys_entry - (paddr_t)elf->dest_base);
>> +    elf->dest_base = (char *)reloc_base;
> 
> Just as a remark, no request to change anything: We're not dealing with
> strings here. Hence char * isn't quite right, just that "dest_base" is
> of that type (for whatever reason).

I think the reason is just to be byte addressable.

>> @@ -225,6 +232,28 @@ elf_errorstatus elf_xen_parse_note(struct elf_binary *elf,
>>       case XEN_ELFNOTE_PHYS32_ENTRY:
>>           parms->phys_entry = val;
>>           break;
>> +
>> +    case XEN_ELFNOTE_PHYS32_RELOC:
>> +        parms->phys_reloc = true;
>> +
>> +        if ( descsz >= 4 )
>> +        {
>> +            parms->phys_max = elf_note_numeric_array(elf, note, 4, 0);
>> +            elf_msg(elf, " = max: %#"PRIx32, parms->phys_max);
>> +        }
>> +        if ( descsz >= 8 )
>> +        {
>> +            parms->phys_min = elf_note_numeric_array(elf, note, 4, 1);
>> +            elf_msg(elf, " min: %#"PRIx32, parms->phys_min);
>> +        }
>> +        if ( descsz >= 12 )
>> +        {
>> +            parms->phys_align = elf_note_numeric_array(elf, note, 4, 2);
>> +            elf_msg(elf, " align: %#"PRIx32, parms->phys_align);
>> +        }
>> +
>> +        elf_msg(elf, "\n");
> 
> Imo the newline wants adding outside of the switch(), for everything
> set to ELFNOTE_CUSTOM. In fact with that I think ELFNOTE_CUSTOM and
> ELFNOTE_NAME could be folded (with what's NAME right now simply
> printing nothing in the switch here). Which suggests that I may
> better not commit the (slightly adjusted) earlier patch, yet.

Yes, please hold off and I'll re-work both.

>> @@ -536,6 +565,10 @@ elf_errorstatus elf_xen_parse(struct elf_binary *elf,
>>       parms->p2m_base = UNSET_ADDR;
>>       parms->elf_paddr_offset = UNSET_ADDR;
>>       parms->phys_entry = UNSET_ADDR32;
>> +    parms->phys_min = 0;
>> +    parms->phys_max = 0xffffffff;
>> +    parms->phys_align = 0x200000;
> 
> I think this wants to be MB(2) (requiring a pre-patch to centralize MB()
> in the tool stack to tools/include/xen-tools/common-macros.h). And I
> further think this needs to be an arch-specific constant, even if right
> now the note is expected to be present only for x86. Which then also
> needs saying ...

Ok, I'll look into this.

>> --- a/xen/include/public/elfnote.h
>> +++ b/xen/include/public/elfnote.h
>> @@ -194,10 +194,26 @@
>>    */
>>   #define XEN_ELFNOTE_PHYS32_ENTRY 18
>>   
>> +/*
>> + * Physical loading constraints for PVH kernels
>> + *
>> + * Used to place constraints on the guest physical loading addresses and
>> + * alignment for a PVH kernel.
>> + *
>> + * The presence of this note indicates the kernel supports relocating itself.
>> + *
>> + * The note may include up to three 32bit values in the following order:
>> + *  - a maximum address for the entire image to be loaded below (default
>> + *      0xffffffff)
>> + *  - a minimum address for the start of the image (default 0)
>> + *  - a required start alignment (default 0x200000)
>> + */
>> +#define XEN_ELFNOTE_PHYS32_RELOC 19
> 
> ... in the comment here. The reasoning behind not (intermediately) falling
> back to the alignment in the ELF headers also wants adding to the patch
> description (or a code comment, albeit there's no really good place to put
> it, imo).
> 
> Additionally I think the pieces of the comment want re-ordering. The primary
> purpose is indicating relocatability; when not relocating, the constraints
> aren't applied in any way.

Yes, this is a good point.

Thanks for the review.

-Jason

