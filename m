Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A4B7F155C
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 15:12:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636761.992497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5507-0000lS-PD; Mon, 20 Nov 2023 14:11:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636761.992497; Mon, 20 Nov 2023 14:11:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5507-0000iv-MS; Mon, 20 Nov 2023 14:11:47 +0000
Received: by outflank-mailman (input) for mailman id 636761;
 Mon, 20 Nov 2023 14:11:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F3F/=HB=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1r5506-0000ip-2j
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 14:11:46 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb8c0ca2-87ae-11ee-98df-6d05b1d4d9a1;
 Mon, 20 Nov 2023 15:11:44 +0100 (CET)
Received: from DM6PR04CA0024.namprd04.prod.outlook.com (2603:10b6:5:334::29)
 by DM4PR12MB5213.namprd12.prod.outlook.com (2603:10b6:5:394::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Mon, 20 Nov
 2023 14:11:39 +0000
Received: from CY4PEPF0000E9D8.namprd05.prod.outlook.com
 (2603:10b6:5:334:cafe::13) by DM6PR04CA0024.outlook.office365.com
 (2603:10b6:5:334::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27 via Frontend
 Transport; Mon, 20 Nov 2023 14:11:39 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D8.mail.protection.outlook.com (10.167.241.83) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Mon, 20 Nov 2023 14:11:39 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 20 Nov
 2023 08:11:38 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Mon, 20 Nov
 2023 06:11:38 -0800
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Mon, 20 Nov 2023 08:11:37 -0600
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
X-Inumbo-ID: bb8c0ca2-87ae-11ee-98df-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L+C2wvS4J11rxgtnpscgNlmLcgGekdhYX67ju7PTYolQj5b1xX8Zv5xuBt+sTdfUAxGx3Q/ISkXNyJ+CCIzoHpcfZkr5BsVnEZgserg3OpBDrDIGSRTcfi7+CasD25Lx2g/OmgQ9e8+Rn9ILHsAD4hzslouvWEP7uG5UcODqBWfhoLYSXl5KNhV27cl3MD9PyfZJWlEOajqEAMr5CvjifG+GUBT0PHFeDh1EluXlusvmQ2369p4Dnwh7elMqZzDhNE4R/DShWH5j0v8MDvBAH4m6I7Rk2z36+5mSxWk9lPcAqcxg2tnZNMPV1HsXHKOeHmp9+rO0OtaRGVPgR63X0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S41VByiRrvoiPRPnLpeCS5uG9H8Z4GUq1fuhplVzUxw=;
 b=MpygGSuj/vYN0C9QUcbHMJPT5QHUIvHMV2b3+FWVOzlWQHIC26qDDbCah6czndIFtbmsoMQwf7igj3Otsw8y9hkk357tOiLvzzCpnwKvCiqKh5RL5lS7Pev+wXgWrIwfaT9NN54uFO/EJnP290HQ+5Zjk898mUvp16gUtU/owsR2xtp0XvXde+Qi3n9INJX1P1+UxJa8YkvPVuGy2GsJlVDLpN+DTfNDAgVDrM/6VL+UJIJu+lY21cjtrlKGpy87Ajh/jc/34vF865ihCJyTQlFIMu5XYALtQ8ORaVawTrG2LLODHUpwe5rLBUMHTuofmGeAJ8YyE0ttiu3nb6fYDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S41VByiRrvoiPRPnLpeCS5uG9H8Z4GUq1fuhplVzUxw=;
 b=a3sq3N/VJwTQRX7lf2N0JQH96ufmSCs/0SuSm3MOuth+8cATLcj4C3l8qnCfI93/A13OwX2zbfNbHVzTjb6RmOspRR7pJsAxY+7Dc/Rtxml817P06BLpDHaSFJspjUnCvWjgBp8/zNulMfI2IWqW+Dk7be0NmS0Uyb8ymG9vbs0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <a60d951b-7e23-4421-a7c6-68b99f33cba0@amd.com>
Date: Mon, 20 Nov 2023 15:11:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] arm/dom0less: put dom0less feature code in a
 separate module
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Luca Fancellu <luca.fancellu@arm.com>,
	<xen-devel@lists.xenproject.org>
CC: <rahul.singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20231114090356.875180-1-luca.fancellu@arm.com>
 <20231114090356.875180-4-luca.fancellu@arm.com>
 <98980da0-2940-43d2-a6c1-e064f4921e74@amd.com>
 <0c32e2eb-7ffe-486c-a11c-477c3cff5cba@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <0c32e2eb-7ffe-486c-a11c-477c3cff5cba@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D8:EE_|DM4PR12MB5213:EE_
X-MS-Office365-Filtering-Correlation-Id: 725607bb-c63d-4bcd-1066-08dbe9d29d43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	W1zmftNtAKUvwp5VA0KwBCB75o5xYZ9GMeKt0RoUMNglTWiuuV1bWG9vu7slGhExxbgREiKqFIbjRc/NxeL6t/RKhg2PiJR+tqPyIYjwfXLhF93WyIcHbh7MzaJTRo9GB7eNe4ZLOyRjwQavAWayKi+U0gpVHTDMN19150EzP+8ScTIK+zDcQwY5lILleJlmJd2uQIZcvuH9DGUCMGtEmc82wjDvMhBIXbZT2Agf+HhTOcHCOmMHiHHhelu9xjD8dQeVJxe84ByvaJkRjhtqZUT5RR9ItiVt/GhC9erkJ0DteKipWHFORXpG3eguTi4EjVU+vxN228cvQylIVgmnWBQVaPrOg5S9RoSxpooIkoislOEWdPHntGH9QmvYomqW9wu88L7QZhyBdBzRIAppv/BzONqISfRpSX38rPQXN0u28LWeKuW7ldS2eFqIbGrels18tnCeWAuQ/F4xFzeM6uCI3KFCBSEizqn+KxM0KiMej8x84z8ojX+/cq03lDm1IHUdk4EpeBBk4ev34KDSR34omEaujgC+X1k8+ftreokR9DHLbUbFJxBvKhlTlf6I7Y0j4NCwYCl8mKRz61uc2pjPAtnce24NgKYFyH9K+wHKpaBtzBfmksYyVoEuM+WcwmaT7QTqkjNgwzsjF1VUKCrrZehqFKeIO1wiv11Z7DeA9KCuwdMLYO4jNZ+rFNtBmgWFmtkFlXqjWFYPyLo5+ZnQBI0PBEVpqnrez02saqe1nvuhM041u4fhDNYa2LdNdevsuGjXl/kUB6L/slPLQl77xFeGeHUQG+VO3eIAfMCmBxqwU/WePcj0kxvbU7Lj/lL3fFk8gQK4RHdf1dbsiOtmSJeH/0ujaZ/EMxQNkThSAmOCSjTzo8TdsiMztECN
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(376002)(346002)(396003)(230273577357003)(230173577357003)(230922051799003)(82310400011)(451199024)(1800799012)(64100799003)(186009)(46966006)(40470700004)(36840700001)(110136005)(16576012)(316002)(70206006)(70586007)(54906003)(426003)(336012)(26005)(40460700003)(36756003)(4326008)(8676002)(8936002)(41300700001)(81166007)(82740400003)(36860700001)(47076005)(44832011)(31696002)(86362001)(2906002)(5660300002)(83380400001)(478600001)(6666004)(31686004)(53546011)(356005)(2616005)(40480700001)(32563001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 14:11:39.2785
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 725607bb-c63d-4bcd-1066-08dbe9d29d43
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5213

Hi Julien,

On 20/11/2023 14:40, Julien Grall wrote:
> 
> 
> On 20/11/2023 07:34, Michal Orzel wrote:
>> Hi Luca,
>>
>> On 14/11/2023 10:03, Luca Fancellu wrote:
>>>
>>>
>>> Currently the dom0less feature code is mostly inside domain_build.c
>>> and setup.c, it is a feature that may not be useful to everyone so
>>> put the code in a different compilation module in order to make it
>>> easier to disable the feature in the future.
>>>
>>> Move gic_interrupt_t in domain_build.h to use it with the function
>>> declaration, move its comment above the declaration.
>>>
>>> The following functions are now visible externally from domain_build
>>> because they are used also from the dom0less-build module:
>>>   - get_allocation_size
>>>   - set_interrupt
>>>   - domain_fdt_begin_node
>>>   - make_memory_node
>>>   - make_resv_memory_node
>>>   - make_hypervisor_node
>>>   - make_psci_node
>>>   - make_cpus_node
>>>   - make_timer_node
>>>   - handle_device_interrupts
>>>   - construct_domain
>>>   - process_shm
>>>   - allocate_bank_memory
>>>
>>> The functions allocate_static_memory and assign_static_memory_11
>>> are now externally visible, so put their declarations into
>>> domain_build.h and move the #else and stub definition in the header
>>> as well.
>>>
>>> Move is_dom0less_mode from setup.c to dom0less-build.c and make it
>>> externally visible.
>>>
>>> The function allocate_bank_memory is used only by dom0less code
>>> at the moment, but it's been decided to leave it in domain_build.c
>>> in case that in the future the dom0 code can use it.
>>>
>>> Where spotted, fix code style issues.
>>>
>>> No functional change is intended.
>>>
>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>>
>> with one remark...
>>
>>> ---
>>> Changes from v4:
>>>   - fixed name in inclusion macro __ASM_* instead of __ARM_*, fixed
>>>     emacs local variable 'end:', style fix (Michal)
>>> Changes from v3:
>>>   - remove header in dom0less-build.c (Michal)
>>> Changes from v2:
>>>   - move allocate_bank_memory back in domain_build.c, remove header
>>>     from dom0less-build.c.
>>> ---
>>>   xen/arch/arm/Makefile                     |    1 +
>>>   xen/arch/arm/dom0less-build.c             | 1018 +++++++++++++++++
>>>   xen/arch/arm/domain_build.c               | 1265 +++------------------
>>>   xen/arch/arm/include/asm/dom0less-build.h |   20 +
>>>   xen/arch/arm/include/asm/domain_build.h   |   60 +
>>>   xen/arch/arm/include/asm/setup.h          |    1 -
>>>   xen/arch/arm/setup.c                      |   33 +-
>>>   7 files changed, 1240 insertions(+), 1158 deletions(-)
>>>   create mode 100644 xen/arch/arm/dom0less-build.c
>>>   create mode 100644 xen/arch/arm/include/asm/dom0less-build.h
>>>
>>
>> [...]
>>> diff --git a/xen/arch/arm/include/asm/dom0less-build.h b/xen/arch/arm/include/asm/dom0less-build.h
>>> new file mode 100644
>>> index 000000000000..81446cbd8bf3
>>> --- /dev/null
>>> +++ b/xen/arch/arm/include/asm/dom0less-build.h
>>> @@ -0,0 +1,20 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +
>>> +#ifndef __ASM_DOM0LESS_BUILD_H_
>>> +#define __ASM_DOM0LESS_BUILD_H_
>>> +
>>> +#include <asm/kernel.h>
>> No need for this include, especially if you are removing it in the subsequent patch.
> 
> Are you suggesting that this patch builds without including asm/kernel.h?
Yes.

> 
>> This could be done on commit (+ there is a conflcit between your series and Henry's mmu/mpu split)
> 
> While I am in general happy to handle some changes on commit, I don't
> want to solve conflict between series.
> 
> One will have to rebase on top of the others. I suggest that this is
> just rebased on top of Henry, purely because I will likely commit it
> today or tomorrow.
Sounds ok.

~Michal

