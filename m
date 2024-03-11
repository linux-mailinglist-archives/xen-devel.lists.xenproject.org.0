Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D70A7878928
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 20:57:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691573.1077674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjllJ-00053J-2X; Mon, 11 Mar 2024 19:56:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691573.1077674; Mon, 11 Mar 2024 19:56:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjllI-00050v-VQ; Mon, 11 Mar 2024 19:56:40 +0000
Received: by outflank-mailman (input) for mailman id 691573;
 Mon, 11 Mar 2024 19:56:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m3M1=KR=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rjllH-00050p-Oz
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 19:56:39 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2415::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 774e8871-dfe1-11ee-a1ee-f123f15fe8a2;
 Mon, 11 Mar 2024 20:56:36 +0100 (CET)
Received: from CY5PR19CA0070.namprd19.prod.outlook.com (2603:10b6:930:69::16)
 by SN7PR12MB8145.namprd12.prod.outlook.com (2603:10b6:806:350::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Mon, 11 Mar
 2024 19:56:33 +0000
Received: from CY4PEPF0000E9CF.namprd03.prod.outlook.com
 (2603:10b6:930:69:cafe::7d) by CY5PR19CA0070.outlook.office365.com
 (2603:10b6:930:69::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35 via Frontend
 Transport; Mon, 11 Mar 2024 19:56:33 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9CF.mail.protection.outlook.com (10.167.241.142) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7386.12 via Frontend Transport; Mon, 11 Mar 2024 19:56:33 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 11 Mar
 2024 14:56:32 -0500
Received: from [172.23.117.185] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 11 Mar 2024 14:56:31 -0500
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
X-Inumbo-ID: 774e8871-dfe1-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X5YLKXXJgzq8eVc+6P5XhmaOjbNzuCx9Gnkk1R4xkockCTrLVFyzsMPfluk33V7QSDSG5SEeJUUc94D847F+7xM1i53WnKSY4AngmSHM/nsvQ7X0h8JUcz+Vvb7sVvLeIrhdXy6zTczK2U8VYoF35B0OfhZZb7GKt09umxJT8gaaARYVF8QbXURDXhYO4ySQtGOLvzihooJrcM3hCmgv4DUFZXWVh6OVkDh3Nut0u6jw5s/Ev7/s8do9N0m4RKHD/1xVylKHS3eg9qy9TXmFj0wGKerhCStVAZ/FL1TFPehrHf3ecc8mKS/l3aPs1+JLjm0xw1gflg1U+KjELJ4LQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qdYnE55Z87IcnBbV1pH3qAtX8YOar8cnwFQFfFPfbBg=;
 b=OTqM98NpLqSCRlxJIj3fJjEK43LTDmfGjxC25FQZe8xosIOmgcSbEyEEZRuAqJkRhhuaeZH8JkWIc3CbXRyn/7/QQyMhARJ14ljrUhtbmY1NhsGHXAXf3Mf2QyhQCankkzW5HzKQbxFeRo6eAXQR4CJzb435M5yV5Cqs8a9bzqV+pLRvedgZYMeGoe55bSyYeE+TE848kdIb+1JDMG5NTlKNZMqukK1G1/YhuFEpMBn0L61LyIZ16YX2VDCo/KoEfyjG+8KWQ9XBulCZksDQQPoZJjvHI7FQ6pRXmeXdtTtfDJMgBbfHZhMIPLLlzB1YtysIgLPQFztND+sG+JUrkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdYnE55Z87IcnBbV1pH3qAtX8YOar8cnwFQFfFPfbBg=;
 b=mBPRNT0Dx4Z2BXglcyHW7Kg64tdBtp1gEipl1r+dBo/ZAIJB3EV+RqYq0laC5WZRNZ/RChaU2x6p56zqHheGziy+tdyZPTze4YWFVlKLGzstAD6QqwRg0WWE7ANElzvm2FJKH+fwuuYyQpM0j0C4Q/MtBeYFmoHAWW/NnI2AVhI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <61700ba8-fb15-4862-a12e-2d236ae4ef6b@amd.com>
Date: Mon, 11 Mar 2024 15:53:24 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] x86/PVH: Support relocatable dom0 kernels
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
References: <20240306185032.103216-1-jason.andryuk@amd.com>
 <20240306185032.103216-4-jason.andryuk@amd.com>
 <5b4054c0-a5ab-4fc0-9754-8253b12c849d@suse.com>
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <5b4054c0-a5ab-4fc0-9754-8253b12c849d@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CF:EE_|SN7PR12MB8145:EE_
X-MS-Office365-Filtering-Correlation-Id: 932aca1d-2ff6-4b20-ff01-08dc42055a2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MFUl3t9IH+TRECaUM4lXpPeO4jGMhruIa7jl5kqww2Uu/2+tQYcvHEmngNVdrIxNNRuZm3vbyGedFW7Z2JzFBq5C8H3kJrbtpKdDb9qFQLXMoGIAIoqQA7hz3nmZp9P7QyAyycajjUGan5vfoYjsdeAVXDa3oIl6E8/svjpocDpim1xQNRQyW39/yB/oPGGNdwur27ENuKIh5S/uhbbcwOEvi7HuiyM54/vZVP3/Jl+N6QXPIlaFJzvthQoBiDaiAMtJ5xpfDoovOVSXbluQhMHoV9LVrNItEAfqVSd6WJ9lF9jQ8XyhHjh1WRasCOWcsU9N7mZwjuhG6us/Ebn3NdYsGmXNUYhfOsBfm/+/V9GaTadRLX7sdheQ80esVlAM707RDaDmbm30aUJ0bWKJKzJU+6WsRSiEg9LRxsADGzPSbB2Su/MUZg4bFYTg3s9U5uul9USCZLtuj/NKV6pPTS384Eo4KY3eVNu/ujAb0U9Oj/TlCEE5CpoxmKmT04lOG1chvpx8L4AqhDeSM01zwd6Zwnvb7FQH85d2z1jiTXrN4g0Cuzo9Bp16dbr1QBDhtQ6nEzQTDRAkyOXZqkNobNa9+fN4queGJXvYAS/b/nvDNQMZ2Yi7XOLQ2+w5DHPd1d24lwfHdXJlFDs50cvl9cUoe4CYNHIrXq2EH3wpet1b35kpH2d01n9xkovE35KReRfvDIqni6N6PgnDEI8m2yvViOEYxUK/KiBwoicKNB28fFNM39njK+Fp915SsmY6
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 19:56:33.3998
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 932aca1d-2ff6-4b20-ff01-08dc42055a2c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9CF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8145

On 2024-03-11 12:53, Jan Beulich wrote:
> On 06.03.2024 19:50, Jason Andryuk wrote:
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
> 
> __init ?

Yes, thanks for catching that.

Regards,
Jason

