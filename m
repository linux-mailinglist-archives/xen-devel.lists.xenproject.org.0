Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9247F7249
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 12:01:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640542.998926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Tw5-0005ia-9K; Fri, 24 Nov 2023 11:01:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640542.998926; Fri, 24 Nov 2023 11:01:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Tw5-0005fa-5e; Fri, 24 Nov 2023 11:01:25 +0000
Received: by outflank-mailman (input) for mailman id 640542;
 Fri, 24 Nov 2023 11:01:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u6gD=HF=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1r6Tw3-0005dt-AD
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 11:01:23 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd679fd7-8ab8-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 12:01:22 +0100 (CET)
Received: from SN7P222CA0010.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:124::33)
 by DS0PR12MB9273.namprd12.prod.outlook.com (2603:10b6:8:193::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20; Fri, 24 Nov
 2023 11:01:18 +0000
Received: from SA2PEPF000015C9.namprd03.prod.outlook.com
 (2603:10b6:806:124:cafe::93) by SN7P222CA0010.outlook.office365.com
 (2603:10b6:806:124::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.19 via Frontend
 Transport; Fri, 24 Nov 2023 11:01:18 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015C9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Fri, 24 Nov 2023 11:01:18 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 24 Nov
 2023 05:01:18 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Fri, 24 Nov 2023 05:01:16 -0600
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
X-Inumbo-ID: cd679fd7-8ab8-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UD8L4Gs6HRKu3miRH/oemct3oNNt00gq4IjLRft1MACxRc84F1bqQWs+F9riA+E7NMy5Xlkf5kETgsd3E6v8n4FAS/slSI5/YDOJH2ScI4ZJcNu9owNAJqPVXxHgUM1yRnZf113nRnNgQsMgHPwmIm/qm1jI2tIQVp8o4ZWLPkxFIRHH4MDz2gZF4bSE2X9pWN8vSyr+wtyGK9S1M/TBLU26JU/C3U46rEyonSlDXU6f4KgSegYmw81QT9bkB0GShvK+vowT4lC8ZXkrWgVSctWXn0Ewz/3AzP3CBfVXSoSK5sma3dC2infQWdogx3aUM1tqVSkqf1NgNXxPLZv87w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HXkuxcTnoOgixdrIhLdnoICoNZpbs0EV08hYaLn9r80=;
 b=mHNjRnhGKgvhgU6jtaJh60c6BB5KlLPYv38GizMBbT8UlOKx2XFiyHv5IKxJT0qJJOgKb6xIZnQ0jfHSj8jJOqIhjiQIdYzekBrSVC26ed3VJoofT3fd9/27eNsPp4DQXDvQv4UO8n5TU1MGZCZXrzdgQM09CGJe2vLesYngDuLhhtGCD4jPAr/JS7tn2S6DjOgTTpGHEo/mf7xP4SeBsoeqKBqA6wK9xwEcixg/Oj/4EHlr1/FCYpv5txYhw/hLgLFtw4Cr23aOtLqIxLDzDAc+5YR3M/d8cE8mx8Vxom0u/ckMVQ4FRvzwwx/CCtImpY91YiNqaOBYBkGoFQ8HTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HXkuxcTnoOgixdrIhLdnoICoNZpbs0EV08hYaLn9r80=;
 b=ynOMUhVI7JBZ9HEIwlUw3LRyYhOiwpVF2A2te3EG0WeWE0/1ckng1NZ5/WUBLW8T1/i2LyV/+l5d8U5ChHjGVaBkL8TswbReYpd4iBOly+h9YN97Fezj7bFsebynTUlDD886iz9gMm0eb9MGsFJ1LmUwRTOPKCk3GHnjLuAOq7Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <b3581594-1559-4dcb-812b-8ab18f2e5633@amd.com>
Date: Fri, 24 Nov 2023 12:01:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] arm/dom0less: put dom0less feature code in a
 separate module
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
References: <20231124094841.1475381-1-luca.fancellu@arm.com>
 <20231124094841.1475381-4-luca.fancellu@arm.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20231124094841.1475381-4-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C9:EE_|DS0PR12MB9273:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a502e56-2dd5-4b2e-6184-08dbecdcaf9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tEt6V+5LsNc7Fs5kNv7OOH0mRslZKGusOAjlvj+1HOoRoPXmYV62baFK66wuf+Y+fSBmicCfFY+7DCIBNHneleT9dafSYtpd0rECtpzSaiEq54Z0WuLWZwuTFBdVEc3Z4jNpI7c/PPMFFLG0C7REoMKzyCUnJqxXZ5fepu6YInQ4yh1lVjwLAHxCMrdPA4Cwf4OcIZV7Z+xKvq7fPNxxyazfOblZChy5sAv3zj0cg+VVmpJ4KXhJyrW8awOPPtNbRdVhTz5LBcNv8b/MhNG61qPn1n5P4FIm4uC7obbiGlXsFLepSD5E1wY1nBlrb85eWabiisaqDN8HpUCb4MxxM4UrAh+Z9PKGDDdvRx8CrE8ugGFNSl16crBYnKcyhe/aXRoMl+WWGQV5PZh82uxSg8PRI3UbtB7zwF+4e2c/kpZSgEfMXpqAEfuFjK9igZI5IZ4JEoBTREcq7QcWJDbmg2iLXnul/mrKrovTyvzkECWuSfjQHH0s2ah39AMmJf4g1ja/VoxsEw20jjOwQZVJYix9Rf5fYGZGFsfSxAutfTCJd/0jv+woVVI5kV3XauIkFKhGZESHStMuRN4bRAQ27pM/nv7B+jeXDfTuxuBn9zHTsIE1BNI/sdMqhD6K+MAXc9ZYP/x2ncXTKQKYkw9n3Cj9E7g/V8YTH+c6R8ewIm2UBjh1Sgtlr80LojRWDTbKiRNTO445QajEEq5rsq3epLIDuIOtQV+7pqGKXJMWzkcwMALU2ZUKIRKPoVjifF8QAx6qhOcK85o13mYDPUDqTWI7rljRlzBbZWWksll4gTxSHgbyuYBK0Fk1QL/2ULrDodBd4DPYpm3eXDqgNaf3wrMaqNQi4ZFwbPru2P6UvGagPBx3zXk+ZWZcCOjQRxs4
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(346002)(136003)(396003)(230173577357003)(230922051799003)(230273577357003)(451199024)(1800799012)(186009)(64100799003)(82310400011)(40470700004)(36840700001)(46966006)(40460700003)(336012)(426003)(2616005)(83380400001)(53546011)(36860700001)(44832011)(47076005)(26005)(8936002)(4326008)(41300700001)(8676002)(5660300002)(2906002)(316002)(478600001)(16576012)(54906003)(110136005)(70206006)(70586007)(86362001)(31696002)(81166007)(36756003)(82740400003)(356005)(40480700001)(31686004)(32563001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 11:01:18.5694
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a502e56-2dd5-4b2e-6184-08dbecdcaf9f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9273

Hi Luca,

+ CC others

On 24/11/2023 10:48, Luca Fancellu wrote:
> 
> 
> Currently the dom0less feature code is mostly inside domain_build.c
> and setup.c, it is a feature that may not be useful to everyone so
> put the code in a different compilation module in order to make it
> easier to disable the feature in the future.
> 
> Move gic_interrupt_t in domain_build.h to use it with the function
> declaration, move its comment above the declaration.
> 
> The following functions are now visible externally from domain_build
> because they are used also from the dom0less-build module:
>  - get_allocation_size
>  - set_interrupt
>  - domain_fdt_begin_node
>  - make_memory_node
>  - make_resv_memory_node
>  - make_hypervisor_node
>  - make_psci_node
>  - make_cpus_node
>  - make_timer_node
>  - handle_device_interrupts
>  - construct_domain
>  - process_shm
>  - allocate_bank_memory
> 
> The functions allocate_static_memory and assign_static_memory_11
> are now externally visible, so put their declarations into
> domain_build.h and move the #else and stub definition in the header
> as well.
> 
> Move is_dom0less_mode from setup.c to dom0less-build.c and make it
> externally visible.
> 
> The function allocate_bank_memory is used only by dom0less code
> at the moment, but it's been decided to leave it in domain_build.c
> in case that in the future the dom0 code can use it.
> 
> Where spotted, fix code style issues.
> 
> No functional change is intended.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> ---
> Changes from v5:
>  - remove unneeded include (Michal)
Including asm/kernel.h was indeed not required. However, I'm thinking that if we want the header
to be self-contained and given that ...

[...]

> diff --git a/xen/arch/arm/include/asm/dom0less-build.h b/xen/arch/arm/include/asm/dom0less-build.h
> new file mode 100644
> index 000000000000..c5625925d940
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/dom0less-build.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __ASM_DOM0LESS_BUILD_H_
> +#define __ASM_DOM0LESS_BUILD_H_
> +
> +void create_domUs(void);
> +bool is_dom0less_mode(void);
here we use bool, I think we should include <xen/stdbool.h>

I think this change could be done on commit provided no remarks from other maintainers.

~Michal


