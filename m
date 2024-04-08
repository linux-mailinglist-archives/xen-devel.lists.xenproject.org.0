Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5552789CA29
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 18:57:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702031.1096750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtsIu-0000s8-Vy; Mon, 08 Apr 2024 16:57:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702031.1096750; Mon, 08 Apr 2024 16:57:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtsIu-0000pe-Rn; Mon, 08 Apr 2024 16:57:08 +0000
Received: by outflank-mailman (input) for mailman id 702031;
 Mon, 08 Apr 2024 16:57:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MIwb=LN=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rtsIs-0000pY-MZ
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 16:57:06 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2009::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06652c8b-f5c9-11ee-afe6-a90da7624cb6;
 Mon, 08 Apr 2024 18:57:04 +0200 (CEST)
Received: from CH0PR03CA0418.namprd03.prod.outlook.com (2603:10b6:610:11b::19)
 by MN0PR12MB6029.namprd12.prod.outlook.com (2603:10b6:208:3cf::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Mon, 8 Apr
 2024 16:56:58 +0000
Received: from DS2PEPF0000343B.namprd02.prod.outlook.com
 (2603:10b6:610:11b:cafe::55) by CH0PR03CA0418.outlook.office365.com
 (2603:10b6:610:11b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.35 via Frontend
 Transport; Mon, 8 Apr 2024 16:56:58 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343B.mail.protection.outlook.com (10.167.18.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Mon, 8 Apr 2024 16:56:57 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 8 Apr
 2024 11:56:57 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 8 Apr
 2024 11:56:56 -0500
Received: from [172.28.134.8] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 8 Apr 2024 11:56:56 -0500
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
X-Inumbo-ID: 06652c8b-f5c9-11ee-afe6-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gqZPUgQUWm803Q2wnHEeMYZjambFJ/rTiao+t9SWCRJeQZfRKVciq/Hl8f0XZp62MBukrnUZu6z7SZckgXoKEtg9dYNRR/7KD0w7c+86GxskpnbMirFMq5kmka2MErafx5TzWe0XYj/x8e/+L587CYeBPxN4DRto3SR9FRCa5MN+eAyJ+w5mlFgewRk3P8Pz8QQZ8O3keIiZH0/wmUH0DPCfE33XQqAzON8cvXzys0wSHHFfSnq1TmrNAUWX30STv2RRWx8b1Vz4OemaK+bBhbPJIRR0XFrgN5OuhHpTGGqX1OA/tYN3qLUsfLE3JLLkNddEIIDz4cYQXg9ZjfyXjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j1pXvPQomaZPf1tpcnsc6+GMp/URSiFhr6y/tb0PkcY=;
 b=HAemxTY7wGAqqCjSVwiADQNx/K2CvlO3s92CSR2ElhE/TMG+fwxt7mxvdE1Poj8nZmr+GpalRfOkWqqvDSXcX83vg/1F2QqMnlIk/HE9pM5gIetSaUcOjiawJzRU8BGMyM2HNZ/isj/SP2lKcYDqHuyEBirfx854/z3BAKtQSEMkQHYQAfqpQRPToSHPzMJ0upK8AKyHeGOukcxe3QQQ8PDedMDdnPU9ebfTjqzQjuDbsn1519ZMZUGksfGeYkn06pZhkmPInalrdVGyBQDRL2l3hP3jLmNAiIMpr1RM+4u7Wde8QOP4kVJuesluZWM505TUa8hHmRKcNzn66cLRBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j1pXvPQomaZPf1tpcnsc6+GMp/URSiFhr6y/tb0PkcY=;
 b=VCgexitOCo0JNcV+961pUWjgYUL6wQXQ6IdVD9W8fyY76o59fiDF7qYrH2k6W/Y9Z+wHFZKGJwOX2wLmuggElFPRwHX4kJNq59+n+E/chSZ+or/mnKCS/LVG1nrfq0c7fM5qyKjI14REvNfNvGW/+RCFDFgAC8ZkC8eHI1Ju/MI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <13d1943e-6341-46de-a356-dc6b92945f3b@amd.com>
Date: Mon, 8 Apr 2024 12:56:56 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v7 2/2] x86/PVH: Support relocatable dom0 kernels
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, <xen-devel@lists.xenproject.org>
References: <20240404212519.16401-1-jason.andryuk@amd.com>
 <20240404212519.16401-3-jason.andryuk@amd.com>
 <70ab0f9d-a451-44a5-8927-4200dbb96a08@suse.com>
Content-Language: en-US
In-Reply-To: <70ab0f9d-a451-44a5-8927-4200dbb96a08@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343B:EE_|MN0PR12MB6029:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ebfd61b-55dc-4b7d-0a28-08dc57ece70d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	f6lFSdIzUWJ0f21Fjq6c2pE5sDvV34o/gp0V+DtJ2FrSyyx4xe9AlQ58VG1ZMuRNsMrRUwFkuR6Lw0wrPgpz02KWZrZ7mfEFx36iub3XxTMF7WUTiGgA+2SvGderODq7p5j8mD8CYdo5LdYX8IdAUPNMKfwwhBiJGpqZBYSrWSHcQFRMQ4G6yQKiMC4zy0nPW8WEeBKaY3mnx9GrOEJWmizesqlmn5lQ1xWs4adZnebp1z5GPH8hFnDreFvwdI6ghJxOQznMvl2IY7vgj4687hcTcowvniCkE+RN4gepfqWRoRDeIckqTc7Le+rZKKD2c02rR8+uicuLidHfJJHq2WSYFc8eGQ71U86jgKkMVjBvqQkn34VUJ90/AOfNYkolJ34ZwdXGkJjhwcG/ZtIBfIcriNS0C9wMo18PxqygaYaoFgAOBC0A8sY+8Erca/Hvxx/Ik2kCMQ8TbEo4Fz7rac4Q6giDDVcZ8Tr04GtYsnsmzFI2nrVDovWhJNRemrz0XuK2htS+NNDvqMBd5NZ13mitBc4dQo6e4zz09KuR5t+AfioiD5kXnisExZpmZOV920fa/WPStJEJ3Gp7HKmX/wzGwciS3ACRmyVaFNrBYq9Wvx3IDQwuz5vWbBdegJYzTlu0YT+zKh3bSHQlBizDvqhTfNfwhyVckRcUQinStTJlDzoJIoMqvCl6Sw/pQ6DmvLeLsfeKEa7w3EkcTGfeulFXCCzu0mRX7zq+BTKMF25t1eUUJmiXLNWx9kbjGdJx
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2024 16:56:57.8651
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ebfd61b-55dc-4b7d-0a28-08dc57ece70d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6029

On 2024-04-08 03:00, Jan Beulich wrote:
> On 04.04.2024 23:25, Jason Andryuk wrote:
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
>> Add XEN_ELFNOTE_PHYS32_RELOC which specifies optional alignment,
>> minimum, and maximum addresses needed for the kernel.  The presence of
>> the NOTE indicates the kernel supports a relocatable entry path.
>>
>> Change the loading to check for an acceptable load address.  If the
>> kernel is relocatable, support finding an alternate load address.
>>
>> The primary motivation for an explicit align field is that Linux has a
>> configurable CONFIG_PHYSICAL_ALIGN field.  This value is present in the
>> bzImage setup header, but not the ELF program headers p_align, which
>> report 2MB even when CONFIG_PHYSICAL_ALIGN is greater.  Since a kernel
>> is only considered relocatable if the PHYS32_RELOC elf note is present,
>> the alignment contraints can just be specified within the note instead
>> of searching for an alignment value via a heuristic.
>>
>> Load alignment uses the PHYS32_RELOC note value if specified.
>> Otherwise, the maxmum ELF PHDR p_align value is selected if greater than
>> or equal to PAGE_SIZE.  Finally, the fallback default is 2MB.
>>
>> libelf-private.h includes common-macros.h to satisfy the fuzzer build.
>>
>> Link: https://gitlab.com/xen-project/xen/-/issues/180
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> yet still with two remarks:

Thanks.

>> --- a/xen/arch/x86/hvm/dom0_build.c
>> +++ b/xen/arch/x86/hvm/dom0_build.c
>> @@ -537,6 +537,111 @@ static paddr_t __init find_memory(
>>       return INVALID_PADDR;
>>   }
>>   
>> +static bool __init check_load_address(
>> +    const struct domain *d, const struct elf_binary *elf)
>> +{
>> +    paddr_t kernel_start = (uintptr_t)elf->dest_base;
>> +    paddr_t kernel_end = kernel_start + elf->dest_size;
>> +    unsigned int i;
> 
> While properly typed here, ...
> 
>> +static paddr_t __init find_kernel_memory(
>> +    const struct domain *d, struct elf_binary *elf,
>> +    const struct elf_dom_parms *parms)
>> +{
>> +    paddr_t kernel_size = elf->dest_size;
>> +    unsigned int align;
>> +    int i;
> 
> ... I must have missed when this was changed to plain int. It should have
> been unsigned int here, too, ...
> 
>> +    if ( parms->phys_align != UNSET_ADDR32 )
>> +        align = parms->phys_align;
>> +    else if ( elf->palign >= PAGE_SIZE )
>> +        align = elf->palign;
>> +    else
>> +        align = MB(2);
>> +
>> +    /* Search backwards to find the highest address. */
>> +    for ( i = d->arch.nr_e820 - 1; i >= 0 ; i-- )
> 
> ... with this suitably adjusted. However, I'm not going to change this while
> committing, to avoid screwing up.

I intentionally changed this.  Looping downwards, a signed int allows 
writing the check naturally with i >= 0.  I think it's clearer when 
written this way.

>> --- a/xen/include/public/elfnote.h
>> +++ b/xen/include/public/elfnote.h
>> @@ -196,10 +196,28 @@
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
>> + *  - a required start alignment (default 0x200000)
> 
> "... (default 0x200000; see below)", i.e. ...
> 
>> + *  - a minimum address for the start of the image (default 0)
>> + *  - a maximum address for the last byte of the image (default 0xffffffff)
>> + *
>> + *  When this note specifies an alignment value, it is used.  Otherwise the
>> + *  maximum p_align value from loadable ELF Program Headers is used, if it is
>> + *  greater than or equal to 4k (0x1000).  Otherwise, the default is used.
> 
> ... referring to this (which, btw, has one too many padding blanks on the
> entire paragraph). I will take the liberty to make this adjustment while
> committing.

Thanks.  vim must have kept the indent from the list above, and I didn't 
notice.

Regards,
Jason

