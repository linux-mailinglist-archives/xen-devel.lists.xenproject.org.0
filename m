Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C617E7AFD
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 10:39:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630061.982735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1NyX-0000QI-BB; Fri, 10 Nov 2023 09:38:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630061.982735; Fri, 10 Nov 2023 09:38:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1NyX-0000NR-7y; Fri, 10 Nov 2023 09:38:53 +0000
Received: by outflank-mailman (input) for mailman id 630061;
 Fri, 10 Nov 2023 09:38:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TCxK=GX=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1r1NyW-0000Ll-64
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 09:38:52 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20609.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2c186b3-7fac-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 10:38:49 +0100 (CET)
Received: from CYZPR14CA0019.namprd14.prod.outlook.com (2603:10b6:930:8f::10)
 by CH3PR12MB7713.namprd12.prod.outlook.com (2603:10b6:610:14d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18; Fri, 10 Nov
 2023 09:38:45 +0000
Received: from CY4PEPF0000EE3A.namprd03.prod.outlook.com
 (2603:10b6:930:8f:cafe::b5) by CYZPR14CA0019.outlook.office365.com
 (2603:10b6:930:8f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.19 via Frontend
 Transport; Fri, 10 Nov 2023 09:38:45 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE3A.mail.protection.outlook.com (10.167.242.14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Fri, 10 Nov 2023 09:38:45 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 10 Nov
 2023 03:38:44 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Fri, 10 Nov 2023 03:38:43 -0600
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
X-Inumbo-ID: f2c186b3-7fac-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X7F1+F20Kay8c9zO6eMn0sYnvuZnKVGNxb935upH95+U2Kvq6knc7XnbVXujk1chO/qvKlpwU9mkHfNXYWuoXESbp0yji3GZu2sVdsPRxapQKz0KnPUiwSer/YxCTUGxkE6ihbD1p+3Vhmwii9HROw4VAyb3yDhWObONtF8tf7aTDO2QnhThRF11ZpBwKE6654QisgOeVKhln0PbFB7RgoVix5CwTGQCMaKabTA1LA27WFf/Jb0gE2a84D4/19zHLMqEt1N7w4HMPmXWwResqkLV1mFMUc5J7GUubI1A0rodNQaMkuLmS+JQN8bGkIpXMJRw2rNgXNaPJ8HXyPaw5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8BJ5wQ/LJVeDBn/yuU7ie93TWr7fYaI4peJi9H3d1rU=;
 b=naI9hoFWpYsUEU43tPfM+2AV7EngRHm/vyRW9VVS4/lQwrcEcyvUhliDx84VuKAbNKX1+VNGf/clYIyXYyGaxD3RbGnE+T/7GIGCOW6YFXtYQnJNO3rFudP/uBwGqPJH7DvQY+KNNGVSwAGoTSS1lzhayQ4ue1sUldYCQJTUghJKc1jtQcAHoBIBdKFNiKayzRHi9DmGoDNUes8tXNC9jriyMC/GkAirs7PQTdEoXaVjhkgC6nQxjqvYONnRewiNguVl7/5amR4UdFMRl4+pKjviYRhG6uA226AnOafUH5O2zm3K/4H5+NnqgOQQyiuik86GY/WluQtqBoN3k6V4IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8BJ5wQ/LJVeDBn/yuU7ie93TWr7fYaI4peJi9H3d1rU=;
 b=ql8y+HHp17e+Y/EhuWKetO40mA/LlFLlPaG4Lsx+2ZA/6sitrNMrZ5JzRL/vvqnhPYswlzyvo5ywXueSyakrqqwyz3LrOT/pb/NcfSLiNGqsxZKE1WV8SzvwWEwCkXzzrr1g3PfZOhpDyBUayXLGOS1oMpPB+MNCXFzF+d+rmeo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <4f381355-9de7-4e7f-8345-512be34aaa02@amd.com>
Date: Fri, 10 Nov 2023 10:38:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] arm/dom0less: introduce Kconfig for dom0less
 feature
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231109090615.3878767-1-luca.fancellu@arm.com>
 <20231109090615.3878767-6-luca.fancellu@arm.com>
 <43a1c5c8-6243-4912-bf3f-f3e35b504271@amd.com>
 <9FE35A69-2EEF-4098-8F9E-B373D813AB47@arm.com>
 <3BB52078-B58C-4476-867A-B29438C56487@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <3BB52078-B58C-4476-867A-B29438C56487@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3A:EE_|CH3PR12MB7713:EE_
X-MS-Office365-Filtering-Correlation-Id: 361a0292-05a4-4cac-3278-08dbe1d0d55d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1/9QMSb66HDbi0+mQuoIgRi0A6mwH/hHtIxJkB4/v+CTJL4EAAtrdURlAOCOJr8rHmo5Sf1jU4e+/f0XaiSyLE//JwKQ9DuExga1mJqr18n0wdFMxEq3QCH8is+OP0agRXxIDKvznFyApkIeO9AmwtErUo1/CqGU7r8GzJYkSi4Q1g/O+0OHGENgVCCg0aJFvo048O5i8gs4heWRrUFSrdH9mkQ1Y74aXVj0DT2VJDMGEYZGJDRyV1MVvo2J5as4t6tzYGecLKyrSHNxRRkvy3ul11O8KhqUDuH3cJdoKmuj+1elGjmWUtcKiaKz79EhWe2OsKEJMNVJF2xg9+QD5EN0mMEjSHZaYqygWr4K+kERGbjR54ttpPO5xlhU1tt3sf0JwcckWyHwqxUElzMxLaUVStAMRCSm0PUN4Tr8JbJxgavnDRuPLFsGREVPjX9HsV5oVK0xhvRvAb2lZJlZWSngn17VuSuhG6keDlVDIuojmVL/6LsUI3iw5Wt8ofZ070zz/HuGNBQVJD9NGwSzPbiczL6heTYDDYFy+1I6/YAmXTyrKG/B097jXMhCilqwXxWr8RpsbXNbP1ndErJqzDEN0kROXTrM4kJIz+4jjnXbqqw3wGkIvBibE/OOIg+Tloidk7ug4Z67DODR/c1cKSKMoquVyZMt0YQTexxs/j19qiF2mvjdOs+rZGNMlj628A4nG6Zc4vHjaTBG0Z6FlCQjoIwAIooSttNLPCHazRyfYaRG6BY3g53sb0bX8vfGZ1hQ7pVoDixSUYpdjnb1H5NRL3cnfwIwoKye6enXroH62KssF1md8O8J45qgNyHjR4SpG3yG2nKLDk6NshOzVQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(376002)(136003)(346002)(230922051799003)(451199024)(186009)(1800799009)(82310400011)(64100799003)(36840700001)(46966006)(40470700004)(86362001)(81166007)(40460700003)(31696002)(40480700001)(356005)(82740400003)(36756003)(2906002)(53546011)(5660300002)(316002)(426003)(336012)(26005)(2616005)(44832011)(4326008)(8676002)(8936002)(41300700001)(6916009)(70206006)(31686004)(54906003)(70586007)(36860700001)(47076005)(16576012)(478600001)(32563001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 09:38:45.0909
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 361a0292-05a4-4cac-3278-08dbe1d0d55d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7713

Hi,

On 10/11/2023 10:30, Luca Fancellu wrote:
> 
> 
>> On 10 Nov 2023, at 09:05, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>>
>> Hi Michal,
>>
>>>>
>>>> +config DOM0LESS_BOOT
>>>> +       bool "Dom0less boot support" if EXPERT
>>>> +       depends on ARM
>>> You're in the Arm Kconfig, so there should be no need for this dependency (it is implicit).
>>>
>>> Apart from that, we have 2 features: static mem and static shmem that are only meant for dom0less domUs.
>>> Shouldn't we make them dependent on DOM0LESS_BOOT? Otherwise, what is the purpose of selecting them
>>> with DOM0LESS_BOOT=n?
>>
>> Sure, I’ll add the dependencies and remove the ARM one
> 
> Just to be sure, is it what you are asking?
See below

> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 0399f2faf734..d9c5340ff3a2 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -90,7 +90,6 @@ config GICV2
> 
>  config DOM0LESS_BOOT
>         bool "Dom0less boot support" if EXPERT
> -       depends on ARM
>         default y
>         help
>           Dom0less boot support enables Xen to create and start domU guests during
> @@ -214,7 +213,7 @@ source "arch/arm/tee/Kconfig"
> 
>  config STATIC_SHM
>         bool "Statically shared memory on a dom0less system" if UNSUPPORTED
> -       depends on STATIC_MEMORY
> +       depends on STATIC_MEMORY && DOM0LESS_BOOT
no need for && DOM0LESS_BOOT

>         help
>           This option enables statically shared memory on a dom0less system.
> 
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 4d6fe051641d..e0e5f4485d1f 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -100,7 +100,7 @@ config NUMA
> 
>  config STATIC_MEMORY
>         bool "Static Allocation Support (UNSUPPORTED)" if UNSUPPORTED
> -       depends on ARM
> +       depends on ARM && DOM0LESS_BOOT
no need for ARM. DOM0LESS_BOOT already depends on ARM.

~Michal


