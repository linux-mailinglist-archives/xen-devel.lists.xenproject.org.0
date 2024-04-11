Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6972A8A08AA
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 08:45:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703779.1099656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruoAr-0001x7-Nh; Thu, 11 Apr 2024 06:44:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703779.1099656; Thu, 11 Apr 2024 06:44:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruoAr-0001uZ-KZ; Thu, 11 Apr 2024 06:44:41 +0000
Received: by outflank-mailman (input) for mailman id 703779;
 Thu, 11 Apr 2024 06:44:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1M6P=LQ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ruoAq-0001uR-Qg
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 06:44:40 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2415::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f71ac24a-f7ce-11ee-94a3-07e782e9044d;
 Thu, 11 Apr 2024 08:44:38 +0200 (CEST)
Received: from MW4PR04CA0385.namprd04.prod.outlook.com (2603:10b6:303:81::30)
 by SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 11 Apr
 2024 06:44:35 +0000
Received: from CO1PEPF000044F2.namprd05.prod.outlook.com
 (2603:10b6:303:81:cafe::36) by MW4PR04CA0385.outlook.office365.com
 (2603:10b6:303:81::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.35 via Frontend
 Transport; Thu, 11 Apr 2024 06:44:35 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F2.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Thu, 11 Apr 2024 06:44:35 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 11 Apr
 2024 01:44:34 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 11 Apr
 2024 01:44:34 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 11 Apr 2024 01:44:33 -0500
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
X-Inumbo-ID: f71ac24a-f7ce-11ee-94a3-07e782e9044d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b/x0xFkJCx6WKhSV8JXTGRNReU+OzR1gUMs+3SxAjqHcK+BtySfOMW/AjNcH0xPAmWWZ++R9YNv9xeSRWbIws3Es8rbjBX73clLiTa7xKWtXGd8GPCWlF4Jre/uM23Iqds7w96/lfCAdhlfIFDIYae1TEPRRhG5aT/5rz/WjG8E74ljV1byc+9T262M3bPrlKtN1Y5PYDzjf2eGRB6t4Ii39CkoOi4y8zKex6gVv4xbNiB8kny3xI/frwqrpqh05SwzYWd92r29kFJVbffeHNjq6/3az86bGgYiAYv46LeDKejQ9MBpCCOOSvZfy8YT1Tm0H15nWW5rs+vjHZFoqfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M1mC/AbtcsIMaL1lRIHIxpnoE7XbVh+GDiW7Cyo0btg=;
 b=jIlnYw9HqwcO6E8sEs+jSy72j0apmSL9pqvyf+hMzqtyBTXgUzmAYjNDgAT9rUJSlq3oBRhzV5j0h7t+1sY5+TcPKThMxt9vw7sKft9DhwEDrtGtZSZeSmdan0YMo73SZ4qW+9EqDebveNM3q+HprCM+AFV8R0epMnCBmtrq544VQqvlZKPJeeoib1eil2LvL2HOr2Ujlv+r09OCdptQxqk+srWxXIJE19zRHbkr20YBfD0nuRipL0wKP5F8uHuFTADyxAxqUXFl1xs93Uf1pqa/hLKDwnLNtS9UI5lAoLpW7TIHw+3ahSTVmiPBbkjixlx2FuYBIvwzo+Pl2EzR6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M1mC/AbtcsIMaL1lRIHIxpnoE7XbVh+GDiW7Cyo0btg=;
 b=ktm5Oa1Hl9YeWkX3PcgnY8vRIyI7ABotQVApNny9vdxBWDZbiPSts/DMUYiMzGkq/qz5mFTvmxPrlp/DMZsJKRB2kaJekxvIGknJhn/DUDLVqeLZCLFTgTDNmlz+rCXxvcx3sQcGIWcvY098wAN74aWfRezPH9b/AnBjmgdlCy8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <3c7d5147-9eab-41fb-b8fb-ac1dc5befd19@amd.com>
Date: Thu, 11 Apr 2024 08:44:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1 4/5] xen/arm: allow dynamically assigned SGI
 handlers
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: <xen-devel@lists.xenproject.org>, <patches@linaro.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240409153630.2026584-1-jens.wiklander@linaro.org>
 <20240409153630.2026584-5-jens.wiklander@linaro.org>
 <da2d2945-5d94-40e8-a632-6ea8cbf3bcb9@amd.com>
 <CAHUa44ET8XOk9vvz3_ffazV=DHDmbrZzB_TUEv=_Z4Rp=1N2ag@mail.gmail.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <CAHUa44ET8XOk9vvz3_ffazV=DHDmbrZzB_TUEv=_Z4Rp=1N2ag@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F2:EE_|SA0PR12MB4367:EE_
X-MS-Office365-Filtering-Correlation-Id: 74fe7a27-08ef-4d31-63a3-08dc59f2da0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	soCyqfH3twhvwbB/n1SUgfSd3e8ejiVG2tmt/vYGtIq89UW5uIHF5yQFbE2b3ij5a8txi/bxyPGOvDYEklk1IpKimJu/P8gKuMX9ikeqV94cnf/z+7yODWChc/LQ9r5Y7QTQUzZ7r4m3LZoo4ABrjTdPzAmDoUuSazpi96aTE5CBNt8ywyyYBIg0bR8KjtqjG3jsZW/0LAlawDPtUBlnbySy8C+ZujL//R/0smrzo0TYXclqHlNxvS2xpxga0FWJhiou8E4Vbb9sznWdIj4NrLv6edlFYB5L0bu9GVnVJkKsxcOBGgcOn6kYRloMS4wdHC/n2yCjNGroNHDn+sd4ZJiKm44V473co7JzYTYXJS0uKRm8oJB5yi652MDQBZ7HTsDtH1mztcaQ0QINV4P+fH/EJUnD6IU59mZJQaRez9CTbG188wO+IxgEMhT3DP8pfe3Ws0vUo+yv1sGH0A+/XBYfd6lq9bMJPFsjRsRfEOQXq1rdRkOkTamGRXyirGe+7qzINomWn461HZlxkCNK2KpzRxzRuk52+ukreKSxH5FE4xnH3kKo5r36x+XlKjMZQkZWu01hwjQ+EoIYm0alG0v4fMgMPGRSKwqiuU0js5DzpRjrVSFaTfhrejyf63Lh/RAHxL9n5kUk1vwnIzoQke1rHy/0Rqi+gkXU2wy8P+LVeJ2AdKYiFZqMfu/AMN77DM14jV9Bljf+JEwmOkiMGNtGKUVnVsVFpxiYxxmr4L2au9ljeZxzvZuYTrAduhEo
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(82310400014)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2024 06:44:35.3382
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74fe7a27-08ef-4d31-63a3-08dc59f2da0e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4367

Hi Jens,

On 11/04/2024 08:12, Jens Wiklander wrote:
> 
> 
> Hi Michal,
> 
> On Wed, Apr 10, 2024 at 3:24 PM Michal Orzel <michal.orzel@amd.com> wrote:
>>
>> Hi Jens,
>>
>> On 09/04/2024 17:36, Jens Wiklander wrote:
>>>
>>>
>>> Updates so request_irq() can be used with a dynamically assigned SGI irq
>>> as input.
>> At this point it would be handy to mention the use case for which you need to add this support
> 
> OK, I'll add something like:
> This prepares for a later patch where an FF-A schedule receiver
> interrupt handler is installed for an SGI generated by the secure
> world.
ok

> 
>>
>>>
>>> gic_route_irq_to_xen() don't gic_set_irq_type() for SGIs since they have
>>> their type assigned earlier during boot
>> Could you elaborate more on that? Do you mean that SGIs are always edge triggered and there's no need
>> for setting the type?
> 
> Yes, see https://developer.arm.com/documentation/ihi0069/h
> 4.4 Software Generated Interrupts
> SGIs are typically used for inter-processor communication, and are
> generated by a write to an SGI register in the
> GIC. SGIs can be either Group 0 or Group 1 interrupts, and they can
> support only edge-triggered behavior.
Exactly. But you wrote "have their type assigned earlier during boot" which is not true.
There is no write to ICFGR0 in Xen codebase. They are implicitly edge triggered.
So I would write:
"... for SGIs since they are always edge triggered"

~Michal

