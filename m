Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD18587BCFB
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 13:47:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693191.1080927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkkU3-0008JD-RC; Thu, 14 Mar 2024 12:46:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693191.1080927; Thu, 14 Mar 2024 12:46:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkkU3-0008HS-OG; Thu, 14 Mar 2024 12:46:55 +0000
Received: by outflank-mailman (input) for mailman id 693191;
 Thu, 14 Mar 2024 12:46:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QCks=KU=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rkkU2-0008HM-0j
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 12:46:54 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062c.outbound.protection.outlook.com
 [2a01:111:f400:7e88::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ebfebc61-e200-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 13:46:49 +0100 (CET)
Received: from CY5P221CA0017.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:b::18) by
 IA1PR12MB9062.namprd12.prod.outlook.com (2603:10b6:208:3aa::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.21; Thu, 14 Mar
 2024 12:46:46 +0000
Received: from CY4PEPF0000E9DB.namprd05.prod.outlook.com
 (2603:10b6:930:b:cafe::7f) by CY5P221CA0017.outlook.office365.com
 (2603:10b6:930:b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.21 via Frontend
 Transport; Thu, 14 Mar 2024 12:46:46 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9DB.mail.protection.outlook.com (10.167.241.81) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7386.12 via Frontend Transport; Thu, 14 Mar 2024 12:46:45 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 14 Mar
 2024 07:46:45 -0500
Received: from [172.17.162.8] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 14 Mar 2024 07:46:44 -0500
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
X-Inumbo-ID: ebfebc61-e200-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IY2UGM5ym2E3El9xU+31Z+CG6nU9+XAEjiddEMrOR+iXl5SkFx7tmVX1H7iaI3T9CJLMoCk7ar5Xk7E5sANSxKzmaAzDWwuax+7uIyqUKGmuXXuVtsl3H6juH/q5hFRCdS0OqX9Hov0JCv7pigdYaRFSL2tjb7Hg/N1hAFRtcLBfRBdBrDSCYbYVslEcJ1XzAtVsxgUHbZ4twyq1EdElxUKIzOzLrIuoXKkOSUmNwVNTnoRt68WKJ/51R8dXY+FiwDFNMFcrUYM/nMQ2tY2Oy67cj+x5NY4XdrkbaCA85M15DroSEVZdSo+SspAk4IjzKYTwux4qkqW6KyvoVNgm1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zwsxoslQo6epcIHeLAvExmX6llLb507hpt1snaIsrBI=;
 b=dvWLIoFUKbPc2tn+wrbDauEKWyEnUmJ1mqi6xC0BQaJ9w+E+Ci6JrwVpmOzlFXu767yGo4yH7TlKQIzHKctbPkFseutoFv/2Z3PdoO3UjVie8bU3xIKCbqv+lluiFUWrwzGVPkiFtu32PT+W4XU2z+pT7PfVyZncJvX3OcPZ3t4/P4EkjTpczkRtkU8y3pNOpa8mnAkjBrRnbplVQVWQziG1EYvkqKNELqJVvUnMwdEVUDnQakOPhI8Bqy23fgSEQ83SXPdB2KXU7WEj9SZgNvVqKuuu8LybqZdhuQxzNfXGGPpfYpBoDU9okHe790Qz23zRfEu29YkL7SxZNjfI8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zwsxoslQo6epcIHeLAvExmX6llLb507hpt1snaIsrBI=;
 b=1LMCsyYcEAhbMWw8vWP2sjESyyebI0FOAWrWtkufG+MeU/hhVaWBB3leVQNujlE1fk93PTTi+s+h3TeRvMV8f0dG4CPhcoPk015ASMB9JMIq/2eifaCxL5+DbYumUoygfC7OjLldq5NrpTdW3sjDMHA8GTXlLvfJAMcS3/CWybM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <53900008-c10c-44af-bdbd-bf78c5d6f4ff@amd.com>
Date: Thu, 14 Mar 2024 08:46:41 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] x86/PVH: Support relocatable dom0 kernels
To: Jan Beulich <jbeulich@suse.com>, <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20240313193021.241764-1-jason.andryuk@amd.com>
 <20240313193021.241764-4-jason.andryuk@amd.com>
 <70daf607-03e7-4927-8ce2-5721ca3387ee@amd.com>
 <ee471b89-b630-443d-8ad8-0ea384871137@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <ee471b89-b630-443d-8ad8-0ea384871137@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DB:EE_|IA1PR12MB9062:EE_
X-MS-Office365-Filtering-Correlation-Id: cb8eb9f8-5c4a-458d-8d6e-08dc4424ceb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TMjFGvx6P9z5+4eOx0vo2uKqWS2yQ8pgxQcq0wmkFAmiR0Q4MGKHxXCnZ4BRONrOOKwqOV8fyxvNOkBmib+XS9Fk+ZgT6B8IcIM12PTfQj6u5d93nk/0XK3VYIinS490RHfCd6SelDYiKk47hIqDDlp0w7dYSWqonE1zOaEr+cNCPKze8rbkNjd0a3zTIanXbw2ysXO/TDCOo6zHQl09Rm9Kz1QZ76hwwcws5QVCjnhVW7V6vygOnkShxUGzEbtNVoCRampa0bDDhW2wsdWW98mvUGQ29SAhokl5YDCjLKOnz3a/lQroy7pYMsLX7+MPL1tEDsSfHbKZ50hLJCk/XN6tEIiK8dESF0yo1/bx3WdbMk0b+zZhmNuoSkiJHx4bm1lL+tbjsCUNUuyOgfTMf+JzAbMqqC+/HWGSzkzSwsxTR0Y0KSSAYd0Is2FEKuzuigGpH0+3E5UNR5qSN5u+b5aITTcb3U/ZjLgGo6ZWcJY+CwyssaSwvynZlxyeNr5JxcT3u/TrkCNwfuvWTEyrbrGTA8dHK6Y1oeTLpTZvGkvFJhNYCn7iA4MLXCuZqA3l9flpH2+QgFDpJjJkgWQOUv8pT0n4fgAiTkjcWOKQWz8RRqMwju+qTUaQVt/Co5wWcDkmb5PRGuk2dqGn1xziQsu+j/g3MIo2dZ3mmsPz5C9PFtxs6kWzzlo5wqHgl3EN2d6Oqbo0Xt+4B+/Vjo37g1lHbV5laadxPv8rMhrXlUFomZXKb8oaOHJ0ll4P/DKd
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(1800799015)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 12:46:45.6543
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb8eb9f8-5c4a-458d-8d6e-08dc4424ceb8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9062

On 2024-03-14 03:12, Jan Beulich wrote:
> On 13.03.2024 22:02, Jason Andryuk wrote:
>> On 2024-03-13 15:30, Jason Andryuk wrote:
>>> +/* Find an e820 RAM region that fits the kernel at a suitable alignment. */
>>> +static paddr_t __init find_kernel_memory(
>>> +    const struct domain *d, struct elf_binary *elf,
>>> +    const struct elf_dom_parms *parms)
>>> +{
>>> +    paddr_t kernel_start = (paddr_t)elf->dest_base & PAGE_MASK;
>>> +    paddr_t kernel_end = PAGE_ALIGN((paddr_t)elf->dest_base + elf->dest_size);
>>> +    paddr_t kernel_size = kernel_end - kernel_start;
>>> +    unsigned int i;
>>> +
>>> +    /*
>>> +     * The memory map is sorted and all RAM regions starts and sizes are
>>> +     * aligned to page boundaries.
>>> +     */
>>> +    for ( i = 0; i < d->arch.nr_e820; i++ )
>>> +    {
>>> +        paddr_t start = d->arch.e820[i].addr;
>>> +        paddr_t end = d->arch.e820[i].addr + d->arch.e820[i].size;
>>> +        paddr_t kstart, kend;
>>> +
>>> +        if ( d->arch.e820[i].type != E820_RAM )
>>> +            continue;
>>> +
>>> +        if ( d->arch.e820[i].size < kernel_size )
>>> +            continue;
>>> +
>>> +        kstart = ROUNDUP(start, parms->phys_align);
>>> +        kstart = kstart < parms->phys_min ? parms->phys_min : kstart;
>>
>> This should be
>>           kstart = MAX(kstart, parms->phys_min);
> 
> Except that MAX() really ought to be the last resort; max() and max_t()
> want considering in preference.

Yes, thanks.  max() will do.

Regards,
Jason

