Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7CD74A889
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 03:42:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560129.875780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHaUE-0000sb-FU; Fri, 07 Jul 2023 01:42:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560129.875780; Fri, 07 Jul 2023 01:42:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHaUE-0000pl-CI; Fri, 07 Jul 2023 01:42:18 +0000
Received: by outflank-mailman (input) for mailman id 560129;
 Fri, 07 Jul 2023 01:42:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=40UB=CZ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qHaUD-0000Kx-PJ
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 01:42:17 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81209d26-1c67-11ee-b237-6b7b168915f2;
 Fri, 07 Jul 2023 03:42:17 +0200 (CEST)
Received: from DS7PR03CA0025.namprd03.prod.outlook.com (2603:10b6:5:3b8::30)
 by DM6PR12MB4864.namprd12.prod.outlook.com (2603:10b6:5:209::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Fri, 7 Jul
 2023 01:42:13 +0000
Received: from DM6NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b8:cafe::bf) by DS7PR03CA0025.outlook.office365.com
 (2603:10b6:5:3b8::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25 via Frontend
 Transport; Fri, 7 Jul 2023 01:42:13 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT048.mail.protection.outlook.com (10.13.173.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6521.45 via Frontend Transport; Fri, 7 Jul 2023 01:42:13 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 6 Jul
 2023 20:42:12 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 6 Jul
 2023 20:42:12 -0500
Received: from [192.168.137.15] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Thu, 6 Jul 2023 20:42:11 -0500
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
X-Inumbo-ID: 81209d26-1c67-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ki/4+5mO85aM/ady5RLI37ocfaJVMiJ055wULKm6Tjyb6xFLg6g9HksipHOiccN9RL3aDCHbpPb7GiOzToSfoeGeRwTZO8NN2F7Py3rIiJvk00eXymnVXtvqiqAkn+EfHhH1Xo2tebhsKzaP33meNxxJiSezPxN3FpWictWtrAjS4hZLYooF1ahyLFuTDEzcgFF3t+w+3nnG+J0FBG/EWSjT8XeVcABrvYwVanTUOpsExvasBkPD+zC8YlKceBn2wbUDtcaHqfz7OFNf4fGEMRT8T2XeRwpbaXDxlE3991zqRz3tlK3TshVs+BDyjUkIDO6D4nOrvtcXLEk7z3vnBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wHRd2B9dspvC+e7lliTr4qvSfi94m+O6Y3GZ03Kdtug=;
 b=fMj0BWEE94rCm0NYAUwMWaqzqspeLoO2aTBYZ/s/D3EwI2R/NEXp96VeUPS1U0uPpWwL1X8XTFXW2zx/AAE7+xIKVEzLTUVXrdqBRIXfyzftV7zm9E8hlvTwBepsOFKJdFinSXcngNBtx5KUs4Cg7bt0qfgusZwh2n6qyDEy4kP4EyekIHsNRdoORy3/iRVW8qNDj8EZ3SaRzIWjoMkxd1bZ56gtuOFBrvQB7xLzfx9oEoDX49mQE+Cpy8rSj86EsshsvnJC8JlCDAudUSOkgi4QYXWefXhEONLIxWoWq3azjln0pb9KxMpiTjDU0C/KlbMnABgsnezy2nlJLach9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wHRd2B9dspvC+e7lliTr4qvSfi94m+O6Y3GZ03Kdtug=;
 b=TYBsvP1dEr6LnQmHDbpJcaHSlci+GKnRKaY6VnBWloIXlo57cIx0u40Df/QkB19IoeK8Ih4flvgSlbvRJJFT9Oat0ZgqtY76ZpP9xnw2CSUvRKXj+D0xU/Gt1PJMx7qtdPgpE3fYE8I6cUQhA41Fc+YHyE2o9jZdRUCmxynitX4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <0615eb21-0f05-012a-b8f5-3c94ddcf4eb7@amd.com>
Date: Thu, 6 Jul 2023 21:42:10 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v1 2/2] xen/arm: Make has_vpci depend on CONFIG_HAS_VPCI
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Artem Mygaiev <artem_mygaiev@epam.com>,
	Rahul Singh <rahul.singh@arm.com>
References: <20230620152924.23622-1-stewart.hildebrand@amd.com>
 <20230620152924.23622-2-stewart.hildebrand@amd.com>
 <102b31fb-0e47-cead-8555-5758531f13af@xen.org>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <102b31fb-0e47-cead-8555-5758531f13af@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT048:EE_|DM6PR12MB4864:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c37168b-0bea-486b-b856-08db7e8b6343
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	isNoRu7zsyk8CX3t5tV9feSQ3UNEilO94VFzHvVI5vE67ZCrXq8fKuy7Vc9OAaudM/p15O+msso9jGBG93luhGImfhM0Eha2Iu28tDeJRKglRMpr8UvytetR6D2Ow9y2Voyd4H4tR7Q7fHuGDDwTFEI+O66L5UJwPxWxLpQ8lqJnc4Crh6A/5kW1/v+SeYleMQkgJvQpUow+zK22ETEzaJlxsMuSgvXRRtBNtMwGS0SOVi9c2YBtYp82JLJ/zhgUEmMmo7OIuHPhsnKgIgjy5bSFFYWYmIJ4JscqFgVhDvBqZcvuOOVOzEPSGGEdMCyryvG167Lgy87UNc+y8SUtDKECFJYobmqqaUVvOM6c37JIyKci3ZquaBUbxenw6Rg6XmHO6H+rmzPH/d/+ovYxlmY8aR9VX+pB0Hk1R5ABBgwRrGkxQMYn5ct3EzHHCvvqOcwjHjFFelHk/bs6MxRdk5NKwmmgKQRCInnCcGDFqywc70Z5+av1p0VOBdmvBGJ0o5mADhVLHsrxLv56w4Gbsv0AONZaTBX0TCGeNsaQXtToympmlbevWHSsJURZ+I/PnQg6DQHiwkPNvv2sQPJvcc80RGJtXDiEiS4P4qZnp2Hz1jz6MsbObSJH8lJHtoN/ZzossyoRSAIf+aBmhP+Zp4NDVaHddWM5QibJN58h4TsXbrfUjDSzGGHmUluSXCu9N99ayJucI8DPYGBH3UV5B+yrgWYDCPZMDUt0htpuSKr6GOTtLGbBLNTdl6TQ6Y4jg250x6zf+ndEoLv18vu+RjFT71KATWS+D8dpUXj9IYjZFIF7zyQtmJlMuItA/+a+R+f/T3xe2hbouM5q+7ZR6w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(346002)(396003)(39860400002)(451199021)(40470700004)(46966006)(36840700001)(44832011)(5660300002)(8936002)(8676002)(41300700001)(70586007)(2906002)(7416002)(316002)(4326008)(70206006)(54906003)(110136005)(16576012)(966005)(2616005)(26005)(53546011)(186003)(31686004)(36860700001)(82740400003)(356005)(83380400001)(47076005)(336012)(426003)(478600001)(81166007)(40460700003)(82310400005)(40480700001)(86362001)(36756003)(31696002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 01:42:13.3212
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c37168b-0bea-486b-b856-08db7e8b6343
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4864

On 6/25/23 08:45, Julien Grall wrote:
> Hi,
> 
> On 20/06/2023 16:29, Stewart Hildebrand wrote:
>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>
>> VPCI is disabled on ARM. Make it depend on CONFIG_HAS_VPCI to test the PCI
>> passthrough support.
>>
>> While here, remove the comment on the preceding line.
>>
>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> ---
>> There are two downstreams [1] [2] that have independently made a version this
>> change, each with different Signed-off-by's. I simply picked one at random for
>> the Author: field, and added both Signed-off-by lines. Please let me know if
>> there are any objections.
>>
>> downstream->v1:
>> * change to IS_ENABLED(CONFIG_HAS_VPCI) instead of hardcoded to true
>> * remove the comment on the preceding line
>>
>> [1] https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc/-/commit/27be1729ce8128dbe37275ce7946b2fbd2e5a382
>> [2] https://github.com/xen-troops/xen/commit/bf12185e6fb2e31db0d8e6ea9ccd8a02abadec17
>> ---
>>   xen/arch/arm/include/asm/domain.h | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
>> index 99e798ffff68..6e016b00bae1 100644
>> --- a/xen/arch/arm/include/asm/domain.h
>> +++ b/xen/arch/arm/include/asm/domain.h
>> @@ -298,8 +298,7 @@ static inline void arch_vcpu_block(struct vcpu *v) {}
>>
>>   #define arch_vm_assist_valid_mask(d) (1UL << VMASST_TYPE_runstate_update_flag)
>>
>> -/* vPCI is not available on Arm */
>> -#define has_vpci(d)    ({ (void)(d); false; })
>> +#define has_vpci(d)    ({ (void)(d); IS_ENABLED(CONFIG_HAS_VPCI); })
> 
> This will enable vPCI for all the domains. However, in the cover letter,
> you seemed to suggest that guest support is not there. So shouldn't this
> be "is_harware_domain(d)"? Or d->arch.has_vcpi?

Right, I mentioned in the SMMU series discussion [3] that it will only work in dom0 / hardware domain (unless additional vPCI series [4] is applied).

So, making it depend on is_hardware_domain makes sense for now:

#define has_vpci(d) ({ IS_ENABLED(CONFIG_HAS_VPCI) && is_hardware_domain(d); })

However, the is_hardware_domain check should be removed when the vPCI series [4] is merged.

[3] https://lists.xenproject.org/archives/html/xen-devel/2023-06/msg01135.html
[4] https://lists.xenproject.org/archives/html/xen-devel/2023-06/msg00863.html

