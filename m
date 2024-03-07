Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A418753F9
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 17:13:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689956.1075506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riGM7-00070G-I4; Thu, 07 Mar 2024 16:12:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689956.1075506; Thu, 07 Mar 2024 16:12:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riGM7-0006xf-Ew; Thu, 07 Mar 2024 16:12:27 +0000
Received: by outflank-mailman (input) for mailman id 689956;
 Thu, 07 Mar 2024 16:12:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=inme=KN=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1riGM6-0006xX-5m
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 16:12:26 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2412::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79f182f0-dc9d-11ee-a1ee-f123f15fe8a2;
 Thu, 07 Mar 2024 17:12:22 +0100 (CET)
Received: from CY5PR19CA0088.namprd19.prod.outlook.com (2603:10b6:930:83::7)
 by MN0PR12MB5713.namprd12.prod.outlook.com (2603:10b6:208:370::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.26; Thu, 7 Mar
 2024 16:12:17 +0000
Received: from CY4PEPF0000E9CF.namprd03.prod.outlook.com
 (2603:10b6:930:83:cafe::64) by CY5PR19CA0088.outlook.office365.com
 (2603:10b6:930:83::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.26 via Frontend
 Transport; Thu, 7 Mar 2024 16:12:14 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9CF.mail.protection.outlook.com (10.167.241.142) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Thu, 7 Mar 2024 16:12:14 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 7 Mar
 2024 10:12:13 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 7 Mar
 2024 10:12:13 -0600
Received: from [172.17.205.23] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 7 Mar 2024 10:12:10 -0600
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
X-Inumbo-ID: 79f182f0-dc9d-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ASCg67Cn/6H8V3IvUD4rsYP1H87Z1z4VUq6D+VJc5NttscSAQLCZSerFugoz2pS9wBWqBuNjdaRSoPcXZHgiu//MINIIAl4MfkHHfmrzt75WkcgTaD0WjOVYyDrWEFE3k/uSqGcpcbaSafjUS7LTnkWsssqnP1wIDh/ZbTQLMNJ/uGEJUlmkdVQhq2Q/2I5vAiXFVzA/3HqxLleTwIB9PK6somyMO8R2+f2snymd8DyrbYiWBI0rlWKkuMLgJopuVw83LLaqXpUs4RN1e5X6U1R8ZdCVkV0ad0gtRUcag6uPqRwaXX7WdbdzdaXbRthliiCO+PB2baipHRdA3JfsIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IZfJHW4+qhmx6Ya7GyNzxiynp2FfaAyMQKvtIGqcTsY=;
 b=g7dRg2Lc+wojhi4bfCHZJ/OdF+RQCOdpN5BCX3HbDVZ/gVQRiJx9DvfpB4PmSkpyWIDuE46CnIlcFh5ks5EFMRTY/mf5G42r54UtBgTjXoFCmUwv5gHp7OW6i8/6lTeZiQs1BE5toi+aV8KgFB1Mr163SjdBCZtYzN2GPrCOQMK/l0CoRjcAaC2kblytMkhmkE2hgGnEkgAU3JK4Ioehy0iIcus5j3JbvbhtDo5Ws2Kxq0DCPjw2B5SguSrJ/w5NDZyrpGIOw3LXv2nB83sfQ+QM0twKiSe6UvDuOF3UA2OIdY5ZbbMiEGDOHkrRe/nlWZh/6KcJZtsUkEbYcIprTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IZfJHW4+qhmx6Ya7GyNzxiynp2FfaAyMQKvtIGqcTsY=;
 b=hbw2lLuUdR+Zgdsj+kJbz80mz54Lg+gE7HXdDgi+bFUA1uklAtCHCleXHC6WS83zeFGE7d8JIeXCUPl5018TuodSaRIdEhzo+jLnXEGajX2h0PD/VsvtmRJv+c5iiXM094VVKhI3/HX1sqfCfXlcmCzpatQeFp6GLPdciyX5ZKY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <e40613c9-1e67-4d32-925c-addb487ad58f@amd.com>
Date: Thu, 7 Mar 2024 11:07:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] x86/PVH: Support relocatable dom0 kernels
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>
References: <20240306185032.103216-1-jason.andryuk@amd.com>
 <20240306185032.103216-4-jason.andryuk@amd.com>
 <alpine.DEB.2.22.394.2403061805440.853156@ubuntu-linux-20-04-desktop>
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2403061805440.853156@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CF:EE_|MN0PR12MB5713:EE_
X-MS-Office365-Filtering-Correlation-Id: d9d6265e-1411-436d-c4ed-08dc3ec15a22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NMon65UOXmGAlFtoAk2r1kpgr1OyIZwpV1C7O4VpgBFtWyNjh13sm85VtwEZRYMj9qxHTJGcWVW0CGTbl+Yyv0FZNmlVaBinUqZ79WjbaSLzHKqA4dbKxVqL1k5FpJhn84z3OjfUIAznh/Fl3vLaKazQCdkLVJ234+J5//smviOhIcpg0iEohUj5hfPRn4T1XwS4COjSYAUi8JU+Wx35TOg6Ndj3V7JtPy5Hem9TnmtcN/F91FBtHfvSW1juC2RoyBO0JQ9/WNpHqH2HSgH7B0RdyjAM05HFHERvrmoX+MNFTbmYsPK9gtX8cmzRdgWqLK2Ql6LH56FkrIzfiZpTAuFDc0/9SHrzkFXjmPss4WjPE2Ja/hJJ81dZhkaRksSulTb2OS6iYlMaOv7IwNP6Dowxz8aPB/9IopFxN6P9SCdr13weOhAHwrbK2oJFVqMeB3K3x9dzOvZ2AbwBy0ys288dY8VlMV07UJYfG+EpZwQNVrnuo+RKLRgWTKYw8viOULZ8qJbog7TzAVFWn+FWORiB13hb0YW4RSfsCSFkNfqsIpqEuvPkNswaOd9NrDwr5w1Y6Xq1PeXyY/SyYLSXIjTeBOwDKtCbZaEv0nv5Y+ypM10oz/hy5SnyGVEoYwO9Suy8qvl9Ur+YnXme4srzExxebavG7Ql/NDQJ4KddQyNaomozNEyeD3o0+riKex/Do/N/TQLOG0Iz+4trZvgcB1rdijHW9vxLV4vmbNXtjgeU2R+06fwQhyvjBYOBz0++
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 16:12:14.0512
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9d6265e-1411-436d-c4ed-08dc3ec15a22
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9CF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5713

On 2024-03-06 21:09, Stefano Stabellini wrote:
> On Wed, 6 Mar 2024, Jason Andryuk wrote:
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
>>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
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
>> +static paddr_t find_kernel_memory(
>> +    const struct domain *d, struct elf_binary *elf, paddr_t align)
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
> Why this check? Is it to make sure we look for e820 regions that are
> higher in terms of addresses? If so, couldn't we start from
> d->arch.nr_e820 and go down instead of starting from 0 and going up?

Yes, I thought we only wanted a higher address.  The Linux bzImage entry 
code uses the LOAD_PHYSICAL_ADDR (CONFIG_PHYSICAL_START/elf->dest_base) 
as a minimum when extracting vmlinux for a relocatable kernel.  I'm not 
sure if that is strictly required though.

I also thought a smaller adjustment would be better, so starting from 
the lower e820 entries would find the first acceptable one.  But that 
may not matter.

> The PVH entry point is a 32-bit entry point if I remember right? Do we
> need a 32-bit check? If so then it might not be a good idea to start
> from arch.nr_e820 and go down.

Yes, the entry point is 32-bit, so you are correct that that the range 
should to be limited at 4GB.

Regards,
Jason

