Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 906A77F3F52
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 08:55:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638471.995016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5i4i-0003vL-Lx; Wed, 22 Nov 2023 07:55:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638471.995016; Wed, 22 Nov 2023 07:55:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5i4i-0003sw-Iw; Wed, 22 Nov 2023 07:55:08 +0000
Received: by outflank-mailman (input) for mailman id 638471;
 Wed, 22 Nov 2023 07:55:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kbX3=HD=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1r5i4h-0003so-0N
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 07:55:07 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72c1c7b6-890c-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 08:55:05 +0100 (CET)
Received: from MN2PR04CA0015.namprd04.prod.outlook.com (2603:10b6:208:d4::28)
 by DS7PR12MB8370.namprd12.prod.outlook.com (2603:10b6:8:eb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 07:55:00 +0000
Received: from BL02EPF0001A0FE.namprd03.prod.outlook.com
 (2603:10b6:208:d4:cafe::f8) by MN2PR04CA0015.outlook.office365.com
 (2603:10b6:208:d4::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18 via Frontend
 Transport; Wed, 22 Nov 2023 07:55:00 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A0FE.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Wed, 22 Nov 2023 07:54:59 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 22 Nov
 2023 01:54:59 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Tue, 21 Nov
 2023 23:54:59 -0800
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 22 Nov 2023 01:54:57 -0600
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
X-Inumbo-ID: 72c1c7b6-890c-11ee-98e1-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LSCJTn8sInPYq9dfsZbNkTfjZ+1FC0uME8AZrba/r6+4HKHZaIr26h7g9vOrfP+aevyBF3PzOEi8yY9UC2VY/4EFAsbQugeM+Lg3c3B2cdEvyapUYtV6rCh5dpqY+mBcJeeTFsc3S8Hvdi5eAYpVB/4mW6PU4+gsJb3u+YKCLVXq+zUOx18j8ex2ebPLN8x6j1Pv3YbRPGFf50erDKAVEZXYMiqZKpIAcF0LZ4ETsKyN6anCcPuRX5iQY6KwqvLQdXAj53JkFwMVAnPN+7PeFAYQe8IzGKbgD97mKhGwOeq6dD0cQ0B5+L6cMLgFz9tNBbe7Z/tId/Jc9lraiSG9QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ytBlivuCZKQdBZz6Sk2+hSBkBvIwKeydrGsVB+kWIc=;
 b=DC9+Nuf5fF/hsQZICTTdkaVWB9myCzps0bJg59H7rOQdVlk9ZPSrTrGt0FRJoa7m0ZB8Mh+qko0b9nq79GH7LE/LHq6bsA3vgSMmvwtxol+QMG8fuZbGGiARY1GY7L2ApZ9azpmwiFfGJmjgt+JtgbGlaYe0klbyQAebuS21G/Lyihcz0P7FbCSONy1cK4ofKm1n41IXJdqmRZxjfydQ+LMHfgHWjHQgmEK1efKL06pPufP+hsnbyQ32kCA5zA+my99FSseLi3hcoVXQcq8prFnQ+bRuHC0CwgDgRfO9EySoDNY628oktdfCN889T6YEiTJJ7441nivb5edvv85iNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ytBlivuCZKQdBZz6Sk2+hSBkBvIwKeydrGsVB+kWIc=;
 b=NMm8Yio0ZuBicsA83QkhRY8vASdWMXgP5krB3nq5kslV0ao0AUNsegdBRlz/pjq/lITJas0imc1N+LELmT8vhPkiwqGUejvPDXHtqoAQu/k4TEadAHvba2zh7yWLsNkW1wVBNXK5E19iWURAR334jQawIOjNvFj7L+5kXKadbSQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <f6a4ede4-b39f-4866-87f8-f35a85ee75a9@amd.com>
Date: Wed, 22 Nov 2023 08:54:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] xen/arm64: head: Move earlyprintk 'hex' string to
 .rodata.str
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231121094516.24714-1-michal.orzel@amd.com>
 <20231121094516.24714-2-michal.orzel@amd.com>
 <cbe5470e-2017-4c4f-bd32-987da72aaf44@xen.org>
 <5b4ac8af-98a6-4757-9946-d520baa6a2a7@amd.com>
 <20135dd2-d36e-4c83-bdb6-b987174f18f2@xen.org>
 <609e34d9-654b-4dcd-8be7-15aa10fe3a25@amd.com>
 <fa76ef0e-7150-4dab-a4ca-f8d42addc228@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <fa76ef0e-7150-4dab-a4ca-f8d42addc228@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FE:EE_|DS7PR12MB8370:EE_
X-MS-Office365-Filtering-Correlation-Id: cad65b96-4324-4d0c-e32a-08dbeb305392
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zHB+2mjRAiiEtvL4yYrKI2V+yGriKdfmK7GAOJuvxrGoPzQmisFX8Ixig4y8KTA80VZtKmXy7U/XMUiKuewqm3MphowwtPofH2JxEs+TY3rupNWqWCBG2b3HI0cu7yBwLjQ86U2yQiVKHa1HpDKb+iuSM2EGskSty1SALxnaAawMNi6yAuR6uanCB6ejNzjabv8dZS6Jnf5oG5zbiicqrJfPQjChxfl4DGDIMqE87lxsSop1a4k/DeB27x3SJb47u5OUHWyLMwhEUuW4MIrypHcgPJfY+aDSS5eOr1YTN0k5Abrqc/FaqN8ZGWNZZ96tu1NcMC4fVqSCayZzMiIJteWm7/lTJXCYe2AJEfrOipoKL01q9Z5Fla8LnKRzhk8hywJyBbcgBcxgbANXRSbW6ReqyILn7F/VF5m0qrbRzOux79Ae1BURxDrrai41jVzMrUorfjasAyHfbsCPPy39hUdnBw08GD6AQirfXXA6QqtSuARqHfaolXv9qb8i5f566/A627LVnARrkWRzJ6putkUbbJkHenAeUJ5m7OmrfcGwT+uwIbmAJs2SsyUSdI+HqTv3TOjDRvEmUb/uefKmi8WK8EYLtnfro61cMZNBEb84RBb8uYST0iUyFUCenPilUQ3OVPeT1GB28rnO+E7tjh7dXUtV0+SeLO7SIWvcWide7bkJtE7X1e6zg6ZU9hBniGWq7cTIMkkc0ma1ONMv8FDppcaOmHwavtjJCrB354Y3Hv6atC5Bmd0GtA4C4RrvDHfyCLrFgZGiJVoBqWSD070IkNqOkmrqKBo5sZx6KcoGdX5hCFJ8ySr1yeFJy/cR7id5zDPhIJKgvoYA74HLpQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(346002)(396003)(376002)(230922051799003)(186009)(64100799003)(82310400011)(1800799012)(451199024)(46966006)(40470700004)(36840700001)(336012)(82740400003)(426003)(83380400001)(478600001)(26005)(53546011)(40480700001)(2616005)(8936002)(110136005)(8676002)(316002)(70206006)(54906003)(4326008)(16576012)(70586007)(31686004)(36860700001)(47076005)(5660300002)(356005)(81166007)(2906002)(40460700003)(41300700001)(86362001)(31696002)(66899024)(44832011)(36756003)(142923001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 07:54:59.5681
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cad65b96-4324-4d0c-e32a-08dbeb305392
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8370

Hi,

On 21/11/2023 19:31, Julien Grall wrote:
> 
> 
> Hi Michal,
> 
> On 21/11/2023 17:18, Michal Orzel wrote:
>>
>>
>> On 21/11/2023 18:04, Julien Grall wrote:
>>>
>>>
>>> On 21/11/2023 17:00, Michal Orzel wrote:
>>>> Hi Julien,
>>>
>>> Hi,
>>>
>>>> On 21/11/2023 17:09, Julien Grall wrote:
>>>>>
>>>>>
>>>>> Hi Michal,
>>>>>
>>>>> On 21/11/2023 09:45, Michal Orzel wrote:
>>>>>> At the moment, the 'hex' string is placed right after the 'putn'
>>>>>> function in the .text section. This is because of the limited range
>>>>>> (+/- 1MB) of PC relative 'adr' instruction 'putn' uses. Modify it to use
>>>>>> 'adr_l' instead (range extended to +/- 4GB) and move the string to
>>>>>> .rodata.str. This way all the earlyprintk messages will be part of .rodata
>>>>>> and the behavior will be consistent with what we already do on arm32.
>>>>>
>>>>> This will be correct today, but I am actually thinking to move 'hex' to
>>>>> .rodata.idmap so it can be used while we are on the 1:1 mapping and/or
>>>>> temporary mapping.
>>>> So you are planning on extending your series to also cover arm64?
>>>
>>> It is not in my soonish plan. But you are arguing that this patch is for
>>> consistency with arm32. This will not be after my series.
>> Hmm, consistency was not the only reason for sending this patch. It's a beneficial side effect
>> given that putn implementations are very similar on arm32/arm64.
>> Are you saying that
>> moving a string that is const from .text to .rodata is not a good change?
> 
> .rodata is better but I would rather prefer if this is moved to
> .rodata.idmap directly.
> 
>>
>>>
>>> And I would not change arm64 just for consistency because I don't view
>>> it as necessary. The boot code is already not the same.
>> I don't recall trying to make the entire boot code consistent. But if there are parts that
>> are almost identical, I think symmetry is welcomed. It helps reading the code, at least for me.
> 
> If you want symmetry, then I am happy to switch to .rodata.idmap. But I
> would rather not first move to .rodata and then in a month time switch
> to .rodata.idmap.
Ok, fair enough.

~Michal

