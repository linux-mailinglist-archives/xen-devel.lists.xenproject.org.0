Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADA488C34B
	for <lists+xen-devel@lfdr.de>; Tue, 26 Mar 2024 14:24:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698082.1089406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp6n8-0003mh-Sv; Tue, 26 Mar 2024 13:24:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698082.1089406; Tue, 26 Mar 2024 13:24:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp6n8-0003jw-PS; Tue, 26 Mar 2024 13:24:38 +0000
Received: by outflank-mailman (input) for mailman id 698082;
 Tue, 26 Mar 2024 13:24:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qfY0=LA=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rp6n7-0003jq-At
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2024 13:24:37 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:200a::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f0659f1-eb74-11ee-a1ef-f123f15fe8a2;
 Tue, 26 Mar 2024 14:24:34 +0100 (CET)
Received: from BYAPR07CA0063.namprd07.prod.outlook.com (2603:10b6:a03:60::40)
 by PH8PR12MB7230.namprd12.prod.outlook.com (2603:10b6:510:226::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Tue, 26 Mar
 2024 13:24:27 +0000
Received: from SJ5PEPF000001CA.namprd05.prod.outlook.com
 (2603:10b6:a03:60:cafe::e7) by BYAPR07CA0063.outlook.office365.com
 (2603:10b6:a03:60::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Tue, 26 Mar 2024 13:24:27 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001CA.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Tue, 26 Mar 2024 13:24:27 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 26 Mar
 2024 08:24:26 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 26 Mar
 2024 08:24:26 -0500
Received: from [172.17.142.167] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 26 Mar 2024 08:24:25 -0500
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
X-Inumbo-ID: 2f0659f1-eb74-11ee-a1ef-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aUzaPKlqyIW3zmJq3I9Ro+Mz2UNaVJ0ryCx4lvofnzOQ9EqkNINVphtvY+Awl3wjDW5UC6xbuATwgnMIXUclTMsULhp2bAHFjh65tqqJkQv3L2zTN/Tb6cD6ZCnJdcbu6+WWXVQ0FkLxZozIRlY2dEP5mhjN5o7+T0lVZfLi76Cdu+78+URz0mnRPzZW7Cdq299Mm1HD+QRU+yxjWd7LvgralUJrr930RxgaoIhM9oJS7tq4Fg7LFZEEnS/OMBBOGTMhVVK0u8q9qYWeAsyKuMJiMxU86pzVeMGUq2mkEQz8LV5ubG9ckD0e0Lmk/0OXRC9Nd8lLmtbYmG5CSvcufA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+eQAh4f6pENxbQZE4wX30pkVcRTyLg8j1iMzyV8xNWY=;
 b=mjSRtJsS7sku22R/jon4DkEtBAWHH9sLVPj5hfVz4kGnp6PfDeHW9IOjEUvdVNbJSed4BHs+tCBRSs+191AI2XZV0dbzCE01g2dQTRkyjswBCojgwvMGI3QBhtPraOwSN2JN+hkA/vu8ym7ypFCnycXCOG7QkAc7fdbjb8+ULD/Triln0Poeblg95uwgFcmv2lMPqyvur8BWiHm8RYMdh52L3PeSXeN2Dkm77CjJkGfgGATmi/MheUILmN8YD9Ha0RRU5G8qsyh8Jv4cxp5ma3dFduG9UlPU+KvBnJb0uLiHc7R7sUTLiMpNC20HMir++lulXqFJ2aeBlUOzsrwUNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+eQAh4f6pENxbQZE4wX30pkVcRTyLg8j1iMzyV8xNWY=;
 b=oszOfmsdLvDuTiJ9U9bIPlKxOLTclKLKKoEP8hw0aNJEiLM/3yySXF2DEDxjjRPfCTa/DTvklwyvEFLF+ukqtjx5kkouB+uwZT1UTJqALFyhLCec686PYiBxNXtS/uJCuBCQwdZd4bVFDVuyOUjOFbC2hR0zyU0P7Dxu+ryaw18=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <efc5ea8f-d087-4fe0-a5f3-6d1b0a8b48dc@amd.com>
Date: Tue, 26 Mar 2024 09:24:24 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] x86/PVH: Support relocatable dom0 kernels
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, <xen-devel@lists.xenproject.org>
References: <20240325204515.250203-1-jason.andryuk@amd.com>
 <20240325204515.250203-6-jason.andryuk@amd.com>
 <770d3292-34cf-4e21-acb6-bd1f9caf5fef@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <770d3292-34cf-4e21-acb6-bd1f9caf5fef@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CA:EE_|PH8PR12MB7230:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b44ed2e-72c5-4d94-8ebe-08dc4d980fb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LScVw/Vc/kBbKBH0gU0RrygnEL/ek8uFo9F6hwMPGsQjc07mf4ksCN4h8Kghky6NmiqsLbulMzXQUhG/2VjmFeyjB6zrD8TcWaoOQGnfsw1rSjN2fM3C7Sqe7jWiitoBqKW0nn2eWiAn2JyfgKdYL9ecG3Aj9MsaigRFvGre86uysmtddMAcFUlzGR91O/SvdAqoAtnVPs3DeguM9alhptxcRvMeYwvf+kywxX5GBiMOdmC3tl9ap5sBSJa998kiWG9NTJ76WlCZZkCtxOONKKDlXHObWjJiDAM4aKtJvB5UyL/Xo3N0XJ3xDxCEmAhyFGAB3v0rKV3ADE08qEqFGZIwWC9aUnHKJiclWURCEKqR5gs+9wecf8CSlgiwoy6mlq2+TymTkmFsYQ1V5BFUSAj0GmgZDwJPtY8MRmfuWk1iZzFNcaA6jZYHevm5Dy4vxRP8oG6yN6u5yhdmC88PmfEMM1t4qR8+EgNyKPAsI6RG5wJKJS5/t1YSRnM/VskBQEbVNKPn4TfbtwEChBkzes5Uwj/U+IIwBY5QbfwEe4AnzgNLV6/4RekZwevRGGajEOPMnGa/v8P9Ca3qevdVNIyUoI4xh3p39Eb18AkqkLrUozpRaMKjPZ3dZhgwSSYVqiAfb/rXjZSTRJtKNp6madwgPuKtrfsXweaAzpl4wv/p2zrFVfy6KyR4wEkHu71nZznKR7hfn+gsGJB34Aj/BTzTSTcvq/mZVhpeug1gBfJa0ZOQlSxTvkG6mbpqWOZx
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(82310400014)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 13:24:27.2245
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b44ed2e-72c5-4d94-8ebe-08dc4d980fb2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7230

On 2024-03-26 03:50, Jan Beulich wrote:
> On 25.03.2024 21:45, Jason Andryuk wrote:
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
>> +        paddr_t end = start + d->arch.e820[i].size;
>> +        paddr_t kstart, kend;
>> +
>> +        if ( d->arch.e820[i].type != E820_RAM ||
>> +             d->arch.e820[i].size < kernel_size )
>> +            continue;
>> +
>> +        kstart = ROUNDUP(start, parms->phys_align);
>> +        kstart = max_t(paddr_t, kstart, parms->phys_min);
>> +        kend = kstart + kernel_size;
>> +
>> +        if ( kend - 1 > parms->phys_max )
>> +            return 0;
>> +
>> +        if ( kend <= end )
>> +            return kstart;
> 
> IOW within a suitable region the lowest suitable part is selected. Often
> low memory is deemed more precious than higher one, so if this choice is
> indeed intentional, I'd like to ask for a brief comment towards the
> reasons.

It is not particularly intentional.  I'll look into locating at a higher 
address.

>> --- a/xen/common/libelf/libelf-dominfo.c
>> +++ b/xen/common/libelf/libelf-dominfo.c
>> @@ -17,6 +17,16 @@
>>   
>>   #include "libelf-private.h"
>>   
>> +#if defined(__i386__) || defined(__x86_64__)
>> +#define ARCH_PHYS_MIN_DEFAULT   0;
>> +#define ARCH_PHYS_MAX_DEFAULT   (GB(4) - 1);
>> +#define ARCH_PHYS_ALIGN_DEFAULT MB(2);
>> +#else
>> +#define ARCH_PHYS_MIN_DEFAULT   0;
>> +#define ARCH_PHYS_MAX_DEFAULT   0;
>> +#define ARCH_PHYS_ALIGN_DEFAULT 0;
>> +#endif
> 
> None of the semicolons should really be here.

Yes, sorry.  I inadvertently retained them when reworking this.

>> @@ -227,6 +239,27 @@ elf_errorstatus elf_xen_parse_note(struct elf_binary *elf,
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
> 
> As indicated before, I consider the = here a little odd.

I retained = for consistency with other notes:
ELF: note: PHYS32_RELOC = max: 0x40000000 min: 0x1000000 align: 0x200000
ELF: note: PHYS32_ENTRY = 0x1000000
ELF: note: GUEST_OS = "linux"

I guess whitespace and labels makes it clear, so I'll drop the '='.

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
> 
> I'd like us to reconsider this ordering: I'm inclined to say that MAX isn't
> the most likely one a guest may find a need to use. Instead I'd expect both
> MIN and ALIGN wanting to be given higher priority; what I'm less certain
> about is the ordering between the two. To keep MIN and MAX adjacent, how
> about ALIGN, MIN, MAX?

ALIGN, MIN, MAX works for me.

On the Linux side, I'm expecting them all to be set:
ALIGN = CONFIG_PHYSICAL_ALIGN
MIN = LOAD_PHYSICAL_ADDR
MAX = KERNEL_IMAGE_SIZE

You need enough identity page tables to cover up to MAX. 
LOAD_PHYSICAL_ADDR is used as a minimum, so requesting placement above 
MIN makes sense to me.

>> --- a/xen/include/public/elfnote.h
>> +++ b/xen/include/public/elfnote.h
>> @@ -194,10 +194,27 @@
>>    */
>>   #define XEN_ELFNOTE_PHYS32_ENTRY 18
>>   
>> +/*
>> + * Physical loading constraints for PVH kernels
>> + *
>> + * The presence of this note indicates the kernel supports relocating itself.
>> + *
>> + * The note may include up to three 32bit values to place constraints on the
>> + * guest physical loading addresses and alignment for a PVH kernel.  Values
>> + * are read in the following order:
>> + *  - a maximum address for the entire image to be loaded below (default
>> + *      0xffffffff)
> 
> "below" isn't exactly true anymore with this now being an inclusive value.
> Perhaps "up to", or perhaps more of a re-wording.

Yes, good point.

> I also think the wrapped line's indentation is too deep (by 2 blanks).

Yes, thanks.

>> + *  - a minimum address for the start of the image (default 0)
>> + *  - a required start alignment (default 0x200000)
>> + *
>> + *  This note is only valid for x86 binaries.
> 
> Maybe s/valid/recognized/ (or honored or some such)?

Would a comment at the top of the file saying Notes are only used with 
x86 be better instead of this one-off comment?  Roger already said that, 
and elf_xen_note_check() has a successful early exit with "ELF: Not 
bothering with notes on ARM\n"

Thanks,
Jason

