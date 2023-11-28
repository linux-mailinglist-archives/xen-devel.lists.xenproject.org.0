Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B679F7FBA4D
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 13:40:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643116.1003012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7xMn-0008Pm-Au; Tue, 28 Nov 2023 12:39:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643116.1003012; Tue, 28 Nov 2023 12:39:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7xMn-0008NG-7X; Tue, 28 Nov 2023 12:39:05 +0000
Received: by outflank-mailman (input) for mailman id 643116;
 Tue, 28 Nov 2023 12:39:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DME+=HJ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1r7xMm-0008Lp-1z
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 12:39:04 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20625.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b647337-8deb-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 13:39:02 +0100 (CET)
Received: from SJ0PR03CA0168.namprd03.prod.outlook.com (2603:10b6:a03:338::23)
 by IA1PR12MB6186.namprd12.prod.outlook.com (2603:10b6:208:3e6::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Tue, 28 Nov
 2023 12:38:58 +0000
Received: from DS3PEPF000099D9.namprd04.prod.outlook.com
 (2603:10b6:a03:338:cafe::6d) by SJ0PR03CA0168.outlook.office365.com
 (2603:10b6:a03:338::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27 via Frontend
 Transport; Tue, 28 Nov 2023 12:38:57 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D9.mail.protection.outlook.com (10.167.17.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7046.17 via Frontend Transport; Tue, 28 Nov 2023 12:38:57 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 28 Nov
 2023 06:38:55 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Tue, 28 Nov
 2023 04:38:44 -0800
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 28 Nov 2023 06:38:42 -0600
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
X-Inumbo-ID: 1b647337-8deb-11ee-98e3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lsRAabmXPfSVJ4CHVXqopDM6sd1yR3J0LrooqaCTTM3ltofaX0nMvzrRZ/t5IP4MbNcyHBz0ixxVYckMORfQrBklohPsFWeFDFix9PhHYWRmrXkotxLTJ0wb43/ZBhTRMBX0MDNLBiW53+Z8DIf/s/QfcW2QCPBrjebkOl0I8qMkdjlnB/EyUp+IflSrsqWpzexUOM3JTQ/rlqQwGUDn+akbnMsRkNqHiCIUqb4FSK3JvJ1CowcoyTyjpzBZ/aukQovHWndpa5rj5wiibohtk7n52nIa0/r3inOTVlEDjSAzV7hKgNG8T1FpVlteScOILi09EE3SYVQUDFMnUBTrNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PTemlNvd/GU+kUlMWf/RFuuk1P542EEB/SCshsH8Adw=;
 b=QLjZ35rlvyUJVgycgXzAKWyhw4N9BzTN/4dfihyvxjHYQmdQmCES2saQ6XvIYDbmFCT3qqCWl343h80aAfGS2NFVtbthb6eKdTF+V+i13hg722H6faVyaWZnBeW30mjMkfVWIPYXVUNjDFKWQTTVn4uoDLwOg40M5p/C+qHiBvUdkHVeEzqrecImCzlwquubHMzLAect6lQUdnH70rbdWNslwnJTLCiOqkhLc9YJL+FJoQF9Yt2VftW/MpogyRwGEj9oeucL6gUfDjMYbfCM7ZJ4AVWOpTKpvtWnZmztjU14KUA8UY1Y9/jAYZEBPZPeewl3ncs61oTpRKpul7QF2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PTemlNvd/GU+kUlMWf/RFuuk1P542EEB/SCshsH8Adw=;
 b=jlWCGe3s3wZrMqrkG0Hu2XjgiXSEvFCuUYm0leUUscwCO8fBltFfVujilsh4J/tmfp5bj9nklCBKxJTcWLQzXINfg3OIQNAy5S3FL6jRxWb/sEAiMcG+xWKHPWI46LVN383lzNGREk/4OnLe4q1hjuUcGJPkeirNCX/LXafB5Rk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <2402c235-97c9-4b75-a87d-8b048f049956@amd.com>
Date: Tue, 28 Nov 2023 13:38:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/5] Fine granular configuration
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20231124094841.1475381-1-luca.fancellu@arm.com>
 <E9D1FA66-DB03-4F52-9312-DD34FA916367@arm.com>
 <9AFCB511-0192-4C7A-8792-51AD941D6014@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <9AFCB511-0192-4C7A-8792-51AD941D6014@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D9:EE_|IA1PR12MB6186:EE_
X-MS-Office365-Filtering-Correlation-Id: 71a9716f-ac54-480d-87c3-08dbf00efd7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nSTqlvFWWQmWZ2BMhuobU4ulIcxddfv4g+G0pDT9Nb6V5tEPG9ibKMYCT5b+/LzhsadnJMOawGDIigSu6W+PG8V9xPIjIKr8WlkacMYaiORucSK+yhNx6FI5vEquoYFT/V+dTjJbJ36TbVGRHceIvPXp1lVAq6A6oQIrWvLL/UmehZvA2q+z9sKhTJWvGzrz1ytpN18l3Ky0fJ4Rx4/vNz4ddtp474HIM5JbXnB9PTep/zpwpT7IhFUqj4s47u6hVT9253/eX3X+kmBqGCN1Tv+s4qTzGcn5Ok+rC4AeN57Ovg04YuQ0QfS1Q51eeh/Zp2WoBIV9sRXfFMxbxisFvX7vLLVpiAI6g4gbQHYRqZTSs+rTb/48YAL1op9s/RA2WLM3fgxYG9ieEARG6G158VS75uZiEMXKuUlxtiaxiBGMGBr1WgQWZuAtcIe5c+tFMSCvwwsuVGVn7Ww6Tv40YECEVigmU4iRLZ1vcZFGEoEd6TIa+pYVLbCyaSdyFaIgEOwEhvViyR6e9g7elmOLGqt7i1INhaKHyAdhLrQ3/rZ9X/ooYiTriEsu1rs1X3V9VHoOYGRDBEfXYZQp9L+KdKeiNHdUFi7uSpjeKfldztQrO4SaQvJ2uS1LH17C/fMynHn1RNv/z7QZmNR1uRSWpcuqyPi0T0re91UjUCA/MWl/0XeKhLoDea0VUCo/VhwK4vKwV7WqIjVmH6FRLFMujixCMGMOGjjCIWBiCPDO2Vu227fX3gglLX/6ua6xA2ZYMgJ8P4Nqj8BE2M7tV8N85+hLGyWV6lZy1ksLGn8zUOo=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(396003)(136003)(39860400002)(230922051799003)(1800799012)(64100799003)(451199024)(82310400011)(186009)(40470700004)(46966006)(36840700001)(36860700001)(36756003)(82740400003)(356005)(81166007)(40460700003)(31696002)(86362001)(8676002)(16576012)(8936002)(70586007)(110136005)(70206006)(5660300002)(53546011)(41300700001)(4326008)(478600001)(7416002)(2906002)(44832011)(31686004)(47076005)(40480700001)(54906003)(426003)(336012)(26005)(2616005)(316002)(83380400001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 12:38:57.5150
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71a9716f-ac54-480d-87c3-08dbf00efd7a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6186

Hi Luca,

On 28/11/2023 11:36, Luca Fancellu wrote:
> 
> 
>> On 24 Nov 2023, at 09:59, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>>
>> + CC Maintainers
>>
>>> On 24 Nov 2023, at 09:48, Luca Fancellu <luca.fancellu@arm.com> wrote:
>>>
>>> This serie aims to add more modularity to some feature that can be excluded
>>> without issues from the build.
>>>
>>> The first patch is already reviewed.
>>>
>>> v2 update: So I've tried to see how to put the dom0less code in the common code,
>>> but the amount of modifications are not trivial, even putting only the common
>>> part and protecting them with ARM, leaving the ARM specific stuff under arch/
>>> like gic etc... will leave a status that is not very nice, so I've decided for
>>> now to keep everything on the arm architecture so that who is going to work
>>> on unifying the code in common can just take from there and do the proper
>>> rework.
>>>
>>> Luca Fancellu (5):
>>> arm/gicv2: make GICv2 driver and vGICv2 optional
>>> xen/arm: Add asm/domain.h include to kernel.h
>>> arm/dom0less: put dom0less feature code in a separate module
>>> xen/arm: Move static memory build code in separate modules
>>> arm/dom0less: introduce Kconfig for dom0less feature
>>>
>>> xen/arch/arm/Kconfig                      |   27 +
>>> xen/arch/arm/Makefile                     |    7 +-
>>> xen/arch/arm/arm32/mmu/mm.c               |    1 +
>>> xen/arch/arm/arm64/mmu/mm.c               |    1 +
>>> xen/arch/arm/bootfdt.c                    |  161 +-
>>> xen/arch/arm/dom0less-build.c             | 1018 ++++++
>>> xen/arch/arm/domain_build.c               | 3591 ++++++---------------
>>> xen/arch/arm/efi/efi-boot.h               |    4 +
>>> xen/arch/arm/gic-v3.c                     |    4 +
>>> xen/arch/arm/include/asm/dom0less-build.h |   30 +
>>> xen/arch/arm/include/asm/domain_build.h   |   34 +
>>> xen/arch/arm/include/asm/kernel.h         |    1 +
>>> xen/arch/arm/include/asm/setup.h          |    2 -
>>> xen/arch/arm/include/asm/static-memory.h  |   45 +
>>> xen/arch/arm/include/asm/static-shmem.h   |   66 +
>>> xen/arch/arm/setup.c                      |   57 +-
>>> xen/arch/arm/static-memory.c              |  287 ++
>>> xen/arch/arm/static-shmem.c               |  547 ++++
>>> xen/arch/arm/vgic.c                       |    2 +
>>> xen/arch/arm/vgic/Makefile                |    4 +-
>>> xen/common/Kconfig                        |    2 +-
>>> 21 files changed, 3058 insertions(+), 2833 deletions(-)
>>> create mode 100644 xen/arch/arm/dom0less-build.c
>>> create mode 100644 xen/arch/arm/include/asm/dom0less-build.h
>>> create mode 100644 xen/arch/arm/include/asm/static-memory.h
>>> create mode 100644 xen/arch/arm/include/asm/static-shmem.h
>>> create mode 100644 xen/arch/arm/static-memory.c
>>> create mode 100644 xen/arch/arm/static-shmem.c
>>
>> I sent this serie forgetting about adding the maintainers, CC them
>> now.
> 
> Hi all,
> 
> I think all the patches here are Ack-ed by a maintainer, is there any issue to
> merge them?
We discussed this on Matrix and Julien will take care of committing this week.

~Michal


