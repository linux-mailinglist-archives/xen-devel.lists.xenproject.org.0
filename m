Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BB287F1EF
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 22:21:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695137.1084699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmKQG-0007wj-RN; Mon, 18 Mar 2024 21:21:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695137.1084699; Mon, 18 Mar 2024 21:21:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmKQG-0007tk-O1; Mon, 18 Mar 2024 21:21:32 +0000
Received: by outflank-mailman (input) for mailman id 695137;
 Mon, 18 Mar 2024 21:21:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KtFp=KY=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rmKQF-0007tc-Ja
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 21:21:31 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20601.outbound.protection.outlook.com
 [2a01:111:f403:2407::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7bb6d9fb-e56d-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 22:21:29 +0100 (CET)
Received: from BN9PR03CA0524.namprd03.prod.outlook.com (2603:10b6:408:131::19)
 by CYXPR12MB9277.namprd12.prod.outlook.com (2603:10b6:930:d8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27; Mon, 18 Mar
 2024 21:21:26 +0000
Received: from BN1PEPF0000468A.namprd05.prod.outlook.com
 (2603:10b6:408:131:cafe::eb) by BN9PR03CA0524.outlook.office365.com
 (2603:10b6:408:131::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36 via Frontend
 Transport; Mon, 18 Mar 2024 21:21:26 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF0000468A.mail.protection.outlook.com (10.167.243.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Mon, 18 Mar 2024 21:21:25 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 18 Mar
 2024 16:21:24 -0500
Received: from [172.21.216.216] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 18 Mar 2024 16:21:23 -0500
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
X-Inumbo-ID: 7bb6d9fb-e56d-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lfrd8JjV1yiilTqaZKSklb4zq3t65y4/cFE+L4VWjP4ya01F4PYRIC3N9xeNK0NT0OU7CpTba2VoaY5JS0d8jqxJptU8gwa9Azj8c10/m6j6iO+h5c+F+VYpci1tir4R93a82m7fB8PFs0Wwg57ptKuAvlm1tsIa68B90sQMOI+yXPv9yaLGKi7DffhWLTgbArbscf9AVUeMLwZY+j51fpc5VvcICiO2l+/o0TF5jnpR7Vo8PlZe1q27ndRzH9pxaSdTH58jdYybtzqKwFPQvu5FXIIwO1SgHaZhKPGWQ2Pb9s6qP82SuBKpuOyXqBreoI31Ssyyy9xix6sT6Sl/Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n8V58abC6y7/v0VQJ//5e3QNkh8LLiiWKHsc9lSKePQ=;
 b=Yl1vujwS4ZSImBMAJnp5DA0hCv1kbk5H3ttj2ug/+CY6sFU5eSmuRoRmmaYvy7zzgmD3cK4TxO15Iy+j5Z8S8NcPQKyNxpHpaMlEk1TTF3SqClMUW+218X57k2ylqIpX0j0hgfghYSckzc13fckfLvMD0fbpnpbxBSmUSJcFCZh7vfP7lQPvoKi8ThQpb9Hktq/nG3luTolSK1F6QiinkzajoksjN8BeUgqXLRjkncPfHV2F0bLDXKx0T+BaLpN+HDcgwDXpiCOCA1FddHgOu3Ltp86fdQyPDvQfeNsHmGTQhZTUfMwvN8gKUG+kY2qDiUsdCckAAzmrY7zhELA3ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n8V58abC6y7/v0VQJ//5e3QNkh8LLiiWKHsc9lSKePQ=;
 b=2uVtHXfoL9yTj7tP3ZLKAyK5Ie4iI7BWKAL+A7UNfdOvuHDWo/sBVHoq1Sl5Xsi1WRI9ysOakGMRp7YKUY0r6OT9IPiNWO9MloR/xi9NtAM1ZPmLIPkZt6ZAyB/giO7tjFeQcPiuoWM9hJJTd0HgCDCAD/GamoWMpLD7+byny5k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <c16dcad1-5310-4e90-8045-02c0893f6814@amd.com>
Date: Mon, 18 Mar 2024 17:21:18 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v2 3/3] x86/PVH: Support relocatable dom0 kernels
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
References: <20240313193021.241764-1-jason.andryuk@amd.com>
 <20240313193021.241764-4-jason.andryuk@amd.com>
 <12fe48a6-6957-49d7-adf5-1a3ac8b1bfaa@suse.com>
 <7506abe0-e3d4-44f7-b54d-592ae2e3fd3e@amd.com>
 <88bd8577-42e6-4087-9888-00cd73e7f0bc@suse.com>
Content-Language: en-US
In-Reply-To: <88bd8577-42e6-4087-9888-00cd73e7f0bc@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468A:EE_|CYXPR12MB9277:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dc3520f-50d6-4b90-e78a-08dc47915e84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bLllJIUzFYCMqSESLbw0j4cEIppspdEQYMBKd3VUU1sGiDliVAi+l9XdFrWe0Y75aJ8rgr8tj31/dDtCS6LXWtQCKq6zT36hJ68UdCjohoEdMYoclrS0luDsN+jwJM0ikpK2Vaw1pJeyHl+1gWO/zJlAEj2Rpf6fxCi2cePftxg7bVUUmvLPGe6GUsS1vuQ56uYcpHn4E1V+ClqwVRTYgQZ4zEpFv4KrzyOe16HHWOFseSn4eO/ntyGN9qC2PmjYm85dBoAdMntH27PKS0S4nrTWX07Y7riVqZQrqMc/9nqelNPHUfZSFQTkcfufyV0GGc612Hq9XWgIKY+72qrtlZPwAP95uCUg11Aymdp3EcqjtN033fHHx6q1d2g/d5pMGWKefdnsJJQcs/oXtnc31lU1U8yWRE5CJvC08ebWoUS3J86O50CCNfQaIcaLDRj9n/Hm5M0Qpp0lAwEzJj9VS0G8rbFj+mynm2in9EhFagJf0ymAmGgj97HCHbP2aJE6gUYNhOfaZntDT8Y5h80BO5G3os2Sh8V5QFVPvlhIcO9t4W1nowziyz8COhCbFR8bCTBFjeLn3Mv7D+jfRz0mynAEGdnItCPAH4Yci7uujMpnHf83fDFYusYGbKJWpsCMSwDEjXcVvWphU8w0KbLbVcP9p2gWZ9oLxK0YGMUsAaICew5UJbIol/c5Zd3mj7blId3M3SoBseRCOgyD5PuQAW3zCgCMircCxhJz48ONJ4mXHeYcgm/fp1CgIVnLQO6t
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 21:21:25.9490
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dc3520f-50d6-4b90-e78a-08dc47915e84
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9277

On 2024-03-15 05:48, Jan Beulich wrote:
> On 14.03.2024 20:19, Jason Andryuk wrote:
>> On 2024-03-14 09:31, Jan Beulich wrote:
>>> On 13.03.2024 20:30, Jason Andryuk wrote:
>>>> --- a/xen/arch/x86/hvm/dom0_build.c
>>>> +++ b/xen/arch/x86/hvm/dom0_build.c
>>>> @@ -537,6 +537,108 @@ static paddr_t __init find_memory(
>>>>        return INVALID_PADDR;
>>>>    }
>>>>    
>>>> +static bool __init check_load_address(
>>>> +    const struct domain *d, const struct elf_binary *elf)
>>>> +{
>>>> +    paddr_t kernel_start = (paddr_t)elf->dest_base & PAGE_MASK;
>>>> +    paddr_t kernel_end = PAGE_ALIGN((paddr_t)elf->dest_base + elf->dest_size);
>>>
>>> Both casts act on a pointer value. Such cannot legitimately be converted
>>> to paddr_t; it only so happens that paddr_t is effectively the same as
>>> uintptr_t right now. (Same issue again further down.) That said, I notice
>>> we have pre-existing examples of this ...
>>
>> Yes, I followed existing code.  Do you want dest_base to be switched to
>> a uintptr_t?
> 
> I think it was deliberately switched to being a pointer at some point,
> maybe even in a security fix.

commit 65808a8ed41cc7c044f588bd6cab5af0fdc0e029 "libelf: check all 
pointer accesses", part of XSA-55, switched from a single dest pointer 
to dest_base & dest_size.

For libxenguest, it's a pointer to guest-mapped memory to copy in the 
kernel.  For PV dom0 creation, it's a pointer - Xen switches to the dom0 
page tables and performs the copy with it as-is.  For PVH dom0, it's a 
guest physical address.

Are you looking for this to be addressed in this series?

>>>> +/* Check the kernel load address, and adjust if necessary and possible. */
>>>> +static bool __init check_and_adjust_load_address(
>>>> +    const struct domain *d, struct elf_binary *elf, struct elf_dom_parms *parms)
>>>> +{
>>>> +    paddr_t reloc_base;
>>>> +
>>>> +    if ( check_load_address(d, elf) )
>>>> +        return true;
>>>> +
>>>> +    if ( parms->phys_align == UNSET_ADDR )
>>>> +    {
>>>> +        printk("Address conflict and %pd kernel is not relocatable\n", d);
>>>> +        return false;
>>>> +    }
>>>> +
>>>> +    reloc_base = find_kernel_memory(d, elf, parms);
>>>> +    if ( reloc_base == 0 )
>>>> +    {
>>>> +        printk("Failed find a load address for the kernel\n");
>>>> +        return false;
>>>> +    }
>>>> +
>>>> +    if ( opt_dom0_verbose )
>>>> +        printk("Relocating kernel from [%lx, %lx] -> [%lx, %lx]\n",
>>>> +               (paddr_t)elf->dest_base,
>>>> +               (paddr_t)elf->dest_base + elf->dest_size,
>>>
>>> By using %p you clearly can avoid the casts here.
>>
>> Ok.
>>
>>>> +               reloc_base, reloc_base + elf->dest_size);
>>>
>>> I'm not convinced %lx is really appropriate for paddr_t.
>>
>> PRIpaddr exists.  It's "016lx" for x86.  Using that and %p add lots of 0s:
>> (XEN) Relocating kernel from [0000000001000000, 000000000202ffff] ->
>> [0000000002200000, 000000000322ffff]
> 
> That's to be accepted, I guess.
> 
> Looking at it again, is "Relocating" in the log message perhaps misleading?
> We don't relocate it, that's something the kernel itself has to do. We only
> put it at other than the default position. Maybe "Moving" instead?

Yes, "Moving" sounds better.  I guess I'll drop the "from" and insert a 
%pd for:

(XEN) Moving d0 kernel [0000000001000000, 000000000202ffff] -> 
[0000000002200000, 000000000322ffff]

Regards,
Jason

