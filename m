Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5782083068A
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jan 2024 14:04:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668460.1040692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ5aF-0006GP-Rj; Wed, 17 Jan 2024 13:03:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668460.1040692; Wed, 17 Jan 2024 13:03:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ5aF-0006EP-Oq; Wed, 17 Jan 2024 13:03:55 +0000
Received: by outflank-mailman (input) for mailman id 668460;
 Wed, 17 Jan 2024 13:03:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2QPC=I3=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rQ5aE-0006EJ-9f
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2024 13:03:54 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061a.outbound.protection.outlook.com
 [2a01:111:f400:7e88::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd0cacc0-b538-11ee-98f2-6d05b1d4d9a1;
 Wed, 17 Jan 2024 14:03:52 +0100 (CET)
Received: from BL1PR13CA0274.namprd13.prod.outlook.com (2603:10b6:208:2bc::9)
 by MN2PR12MB4535.namprd12.prod.outlook.com (2603:10b6:208:267::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.26; Wed, 17 Jan
 2024 13:03:49 +0000
Received: from BL02EPF0001A108.namprd05.prod.outlook.com
 (2603:10b6:208:2bc:cafe::8f) by BL1PR13CA0274.outlook.office365.com
 (2603:10b6:208:2bc::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23 via Frontend
 Transport; Wed, 17 Jan 2024 13:03:49 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A108.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Wed, 17 Jan 2024 13:03:48 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 17 Jan
 2024 07:03:48 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 17 Jan 2024 07:03:47 -0600
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
X-Inumbo-ID: dd0cacc0-b538-11ee-98f2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QGLqsawdNXI5rdCyfCLtzFNkbjKZj3kBfcaERC6JbZ+P1a7lbj6sTQN/+d6qFxFzYlYhMd3roEC8VlQprtHWJhWtY5+0jcCm98wlwclTEoZrbBz08uzZJuElRbSTNHWB4Q5VjwxNJC9M8BPyeBwIpuR6GwYZ1AoewvDuwbE8Q6F5BT4Qp7ecmPf4bwhXAXUfeazhtBFJumDXNIi9g3hHamfZyDKB/OyIbGlfA9RRmrWQpErTcRpduUnaJOagc6B9S1+U59iB+nDvgEyKLuWKbAzAoIYvCBQob8HjUXmFikTFGa4suZ/eZvJB96lJr0jInyS/mWVOhleEnpq4Z7lHrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PvmzMgNPynODWXH71XdDoGarMfZmqo/9HFNbYaTXAz0=;
 b=j10y3IlSfrdLMccgzuHmx+UUNgko3Yt1glpvUN3vSCQQIRZjuOX9/d6kJGaKaqYEPvrbMXh9+wcuqVG5BHV+pce+88ix/zrB4WGgbVmoAdf779G+8UOfDnJFnUrE6Lh+d8cXQ1dlsfKNL/M7HkGeVVJ4nUse7H3rgBbcx9SgDOMTyVPXQVgj9QWuQmcr5jAENc3sK1Mw1GfmaO/lzndnI0Lq4tUJ3HkEOnQHLP56n6hqUNJeN5LZIwSR1IKNQ6rw1JjISDuhKQ8BeKJ5RgrS9ddMBVpf0vKskpPk2VcCM3q/yHjCvRAv0ZddyM8sF8hWYNRsgKwp0JEOIc1MwpQIZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PvmzMgNPynODWXH71XdDoGarMfZmqo/9HFNbYaTXAz0=;
 b=NdB1P8GkWUQpjOIgaSmZn6x8f6G32p57mKDJAxyb0eThHkcLd9zcEaK94Lw6jkUYnHQfh2YsYToPwY1JhMhAz/HEY/8YY1Xpbe8ukB3xBPDYk33zjAWZTtFl7cJzNWtAQVP4+sd+NYTY40oI4Au8iifb5zygtKS+fgzm6lSZJ+c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <f91e3222-c72a-453e-9160-fdcc94211d82@amd.com>
Date: Wed, 17 Jan 2024 14:03:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 repost 1/4] arm/mmu: Move init_ttbr to a new section
 .data.idmap
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <carlo.nonato@minervasys.tech>, Julien Grall <jgrall@amazon.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240116143709.86584-1-julien@xen.org>
 <20240116143709.86584-2-julien@xen.org>
 <6b4bfccf-4455-40c0-b6bb-c5dd7c154ac3@amd.com>
 <ea7b5499-5b15-4c03-8187-39a9456e6ea4@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <ea7b5499-5b15-4c03-8187-39a9456e6ea4@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A108:EE_|MN2PR12MB4535:EE_
X-MS-Office365-Filtering-Correlation-Id: 9da66c0d-e58d-4101-f706-08dc175cbf11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WcJg7hJmNOmKMdkG2E+hAPmkoTlF7GsS+SGO9xY8TLvIuXXAp8Pe63vDOnCOoZt6+ul8xYCQRPjLk6cojEhcU/TGS2unCkIApBLn4QwdcPX72RIH4AM7d1fipnJ48QP3N6wmdzMAu0eWwqsVhg23Hf7ItU5RUzVPmjEROM8hSL1T+FIzXTClod5R2WQhfMXpuckBsqcyMb0sPwN25XcBEjpx+O5B3nMKCci/P2MafKhwqdx9gV5U6jUDLmWRE+otm5ZK/8UrrBPmhQprF2iaDzsdVwLfN75Ax5VozMK7JYs0VcKccTGg8yHn8tzcl/SrBAuqwQqdX7E1EBKmmMVw7sWvn+g4a3ipZRBS6Rb8r6MKLzXhBpNVHOOCNkq/4F+dHhMR0kEcYf7ypCbw/FiGIlDma3bivX57FJT+NfbXvkdNqWW+csIwLDLMmNm/P/VPqRlsvoMxddxcTHthnI7dWFxv/cvfqVv2pv/tdaau2QQe24bCeEGn3wRpmFnGDE41G3X44xo8BKFmfBVoaaaGyYucX399Yi6cQjV8tmH3z8fW/tthKrKL7D+q7VmIzm8OBhZm4N9/SM6WwqGd6OKeHEG5KF/+4ZC1Wkl7QQ5fcsVUrLLrDD3fGXgGWqrhcD6BVX7lde9RYP/P1jw1ziCQfOdO7FvGvDN9ppBURXxx8DifxjEmkbDbRrHCKBL+Uq5gNWu5g2OsPZ8ZlHMJPGek8Iobu7VRK1etfpMvGmyE1HbPKevob5kFOO+TljaBUPnZmuELlEq3MnBPLjKmDfNHCzmZyMRgmw3PsuII8QBWDfzLMrQ0fXF3tdHKFEQBx3t07MudAnYuwurj2vDFrTKCxg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(136003)(376002)(346002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(82310400011)(46966006)(36840700001)(40470700004)(40460700003)(31686004)(40480700001)(478600001)(426003)(336012)(53546011)(26005)(2616005)(86362001)(31696002)(81166007)(82740400003)(36756003)(356005)(44832011)(4326008)(36860700001)(2906002)(47076005)(41300700001)(83380400001)(5660300002)(70586007)(8676002)(70206006)(8936002)(110136005)(316002)(16576012)(54906003)(142923001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2024 13:03:48.9354
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9da66c0d-e58d-4101-f706-08dc175cbf11
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4535



On 17/01/2024 13:10, Julien Grall wrote:
> 
> 
> On 17/01/2024 08:30, Michal Orzel wrote:
>> Hi Julien,
> 
> Hi Michal,
> 
>> On 16/01/2024 15:37, Julien Grall wrote:
>>>
>>>
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> With the upcoming work to color Xen, the binary will not be anymore
>>> physically contiguous. This will be a problem during boot as the
>>> assembly code will need to work out where each piece of Xen reside.
>>>
>>> An easy way to solve the issue is to have all code/data accessed
>>> by the secondary CPUs while the MMU is off within a single page.
>>>
>>> Right now, init_ttbr is used by secondary CPUs to find there page-tables
>>> before the MMU is on. Yet it is currently in .data which is unlikely
>>> to be within the same page as the rest of the idmap.
>>>
>>> Create a new section .data.idmap that will be used for variables
>>> accessed by the early boot code. The first one is init_ttbr.
>>>
>>> The idmap is currently part of the text section and therefore will
>>> be mapped read-only executable. This means that we need to temporarily
>>> remap init_ttbr in order to update it.
>>>
>>> Introduce a new function set_init_ttbr() for this purpose so the code
>>> is not duplicated between arm64 and arm32.
>>>
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>>
>> with ...
>>
>>> ---
>>>   xen/arch/arm/mmu/smpboot.c | 34 +++++++++++++++++++++++++++++-----
>>>   xen/arch/arm/xen.lds.S     |  1 +
>>>   2 files changed, 30 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/mmu/smpboot.c b/xen/arch/arm/mmu/smpboot.c
>>> index b6fc0aae07f1..f1cf9252710c 100644
>>> --- a/xen/arch/arm/mmu/smpboot.c
>>> +++ b/xen/arch/arm/mmu/smpboot.c
>>> @@ -9,6 +9,10 @@
>>>
>>>   #include <asm/setup.h>
>>>
>>> +/* Override macros from asm/page.h to make them work with mfn_t */
>>> +#undef virt_to_mfn
>>> +#define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
>>> +
>>>   /*
>>>    * Static start-of-day pagetables that we use before the allocators
>>>    * are up. These are used by all CPUs during bringup before switching
>>> @@ -44,7 +48,7 @@ DEFINE_BOOT_PAGE_TABLE(boot_second);
>>>   DEFINE_BOOT_PAGE_TABLES(boot_third, XEN_NR_ENTRIES(2));
>>>
>>>   /* Non-boot CPUs use this to find the correct pagetables. */
>>> -uint64_t init_ttbr;
>>> +uint64_t __section(".data.idmap") init_ttbr;
>> Do we need to keep the declaration in mmu/mm.h? This variable is only used in this file
>> and in assembly, so maybe better to drop declaration and use asmlinkage instead?
> 
> I don't see the problem of keeping the declaration in mmu/mm.h. In any
> case, this seems to be unrelated to this patch.
This was just a question about the sense of a declaration that is not used/needed at all.
If you also thought so, it could be done in this patch given that it touches definition.
Since you don't, no problem whatsoever.

~Michal

