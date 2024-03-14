Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E87DA87C362
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 20:20:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693471.1081569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkqcG-0005lF-4y; Thu, 14 Mar 2024 19:19:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693471.1081569; Thu, 14 Mar 2024 19:19:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkqcG-0005it-20; Thu, 14 Mar 2024 19:19:48 +0000
Received: by outflank-mailman (input) for mailman id 693471;
 Thu, 14 Mar 2024 19:19:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QCks=KU=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rkqcE-0005ij-Gi
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 19:19:46 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2414::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cfb14d59-e237-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 20:19:44 +0100 (CET)
Received: from CH2PR17CA0018.namprd17.prod.outlook.com (2603:10b6:610:53::28)
 by SJ0PR12MB7065.namprd12.prod.outlook.com (2603:10b6:a03:4ae::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.21; Thu, 14 Mar
 2024 19:19:40 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:610:53:cafe::41) by CH2PR17CA0018.outlook.office365.com
 (2603:10b6:610:53::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20 via Frontend
 Transport; Thu, 14 Mar 2024 19:19:40 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.211) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7386.12 via Frontend Transport; Thu, 14 Mar 2024 19:19:39 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 14 Mar
 2024 14:19:38 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 14 Mar
 2024 12:19:38 -0700
Received: from [172.17.162.8] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 14 Mar 2024 14:19:37 -0500
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
X-Inumbo-ID: cfb14d59-e237-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cl+x09hD3usxbBPSkWEJ9g4gN+CtcfOlhJV8PrzcAIFZaBgbO3tYEpdUK41RObZ7KZZXjs74CECfME5lpliJpeyJ++Zz73XyTBW6fiS76dGfG3L1unVeMqHfz/ZkmRSpVTE295r/spLkrjSDssERT8PKaj9TVE58QzN0TxKcmGokl4/8HI067vWsiVCBG5HQwApi/9iOY+mxraYCUl7KFQsMCYRPINzjGpoXVZV435k6B6a5D/ahAB9Z6ZMfzBPyMAQNO5kC1Z426qKO9r+kmAh5kFGcYI6mgue6puWHO1p+cWQq++JfXufQth6aXoI188LDGOoRSGYsmhi/mdTqig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qg/6kFamlDBS5RrBwaJRByAveRK72o7QVCM4MUN4aBg=;
 b=krVPz4D/FWOtjwE4TyTJNLUcwGEFYlSsKwPMzVT4T+Z0mKvMBzitXuEr9zj8PnQQzUOE1qYXYvY9tqqw06sTyUce6zAiOq+yPmOvnHFlxWfeMyEB2J0iRuI8IgLmi5FZwtgn7YU0XjaxTPZ3xgN8mm7+SLkKV5zPajWqxjAOEajKLg4jwIrNGd/l6hQ3Z5qXSUrFeTfOyczJTPDeBOagN60Cblap5Ega5/+U2xuPFiRyvXACyM7ohYUkVIrZdPWTQh13+icG1Ez8/GyyPOl8PsJfVOcXK+cZ7aOXRcZLBgIuiWgAFXVzBUoU50SpRgVeuhAMbwk9NyK2qL18BZEMkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qg/6kFamlDBS5RrBwaJRByAveRK72o7QVCM4MUN4aBg=;
 b=DKyujHF4HTBBt1f1RD266Bv8Qym9Nee8AD2PCM0wvcjbCgbRkDOjx8xnqo/4j+5sbER0dEYpOe/DMz6eDZL85YopAToipAxTw3wOE6U+n2ROWK9BJCCTuRURufeoByPhpbbTFFQ7EQkWaf4dkeD+IIUv72WvcBMsBH68WoyvxOM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <7506abe0-e3d4-44f7-b54d-592ae2e3fd3e@amd.com>
Date: Thu, 14 Mar 2024 15:19:38 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] x86/PVH: Support relocatable dom0 kernels
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
References: <20240313193021.241764-1-jason.andryuk@amd.com>
 <20240313193021.241764-4-jason.andryuk@amd.com>
 <12fe48a6-6957-49d7-adf5-1a3ac8b1bfaa@suse.com>
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <12fe48a6-6957-49d7-adf5-1a3ac8b1bfaa@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|SJ0PR12MB7065:EE_
X-MS-Office365-Filtering-Correlation-Id: 808bd57d-02d2-4705-0516-08dc445bb1e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	r7rEaQ4oSDkzMRuE4TUWhuEwLDELjCGbsGLMnoP3qPj44np4Bm1h6oc4OD2dYfKOpmDGU1mlyYuP6uGYVyRlgHlw0Lx3OPLsMJ3Jylml3jwqcXwGztsFxy3RWYg4XAUaSxJ5fv50NjtwIHBSuVVDv7CYyKf03E26Yx2nkZ2u+l6PY5Lz37hN9aa0cg+YhfJ9TmCcAoPABIAVFCL12vCHHZLvoLkjBKsPTLWdZoZF+X2DzEtiwiHcplRVyeiqq0IfXpsekQVXqaDkrYPFB3wSdsH30evSNuwlUffpUCQCepQ3XD59drqOeL2yYaaNnox39ZVztudeVpaLmbfw0yqrYRwHLfPrgjSQiieDRP1fY2hFXbhrTaHoc9pNlPI7lzwEcjDaJP/+J63o6mtjVrI9jxA6pdroIwbFXuv9iFEPBTYZ+EN7zZzFl6Llzhhx9jhcPxxbD0egvBZ2Xvjhqzin5YV/qkfWpT1xm5gn16f+B+XvmpwUvAnrqXi1389BoFKhAqMuO4FSVWVrqvBoVDMwqPKPJJGSpHluJpvOC7eQlk087IKW1URbk4nAuvn33ojTAcnN+0MOSPlgqDxMJFKkkXfZerOwVeUTlaY2w6v/9UXq2my3McrpEUJzrt/sF8I/F4JMydASDwFweOLxk5FJplZ34qt2KSTOIDFbrBzchlC/Clz+b05rg3d7/2ptLU4nQityYwDCCaGi2BlN+m6aAVbghsLxlAahOli8rOKUzaSl8EjeeUEcYQpVXqNC5rvE
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(36860700004)(376005)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 19:19:39.5700
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 808bd57d-02d2-4705-0516-08dc445bb1e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7065

On 2024-03-14 09:31, Jan Beulich wrote:
> On 13.03.2024 20:30, Jason Andryuk wrote:
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
>> +    paddr_t kernel_end = PAGE_ALIGN((paddr_t)elf->dest_base + elf->dest_size);
> 
> Both casts act on a pointer value. Such cannot legitimately be converted
> to paddr_t; it only so happens that paddr_t is effectively the same as
> uintptr_t right now. (Same issue again further down.) That said, I notice
> we have pre-existing examples of this ...

Yes, I followed existing code.  Do you want dest_base to be switched to 
a uintptr_t?

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
>> +        return false;
>> +    }
>> +
>> +    if ( opt_dom0_verbose )
>> +        printk("Relocating kernel from [%lx, %lx] -> [%lx, %lx]\n",
>> +               (paddr_t)elf->dest_base,
>> +               (paddr_t)elf->dest_base + elf->dest_size,
> 
> By using %p you clearly can avoid the casts here.

Ok.

>> +               reloc_base, reloc_base + elf->dest_size);
> 
> I'm not convinced %lx is really appropriate for paddr_t.

PRIpaddr exists.  It's "016lx" for x86.  Using that and %p add lots of 0s:
(XEN) Relocating kernel from [0000000001000000, 000000000202ffff] -> 
[0000000002200000, 000000000322ffff]

Regards,
Jason

