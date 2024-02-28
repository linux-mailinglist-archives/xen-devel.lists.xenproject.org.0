Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9E086AF52
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 13:43:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686584.1068772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfJGw-00089i-H3; Wed, 28 Feb 2024 12:42:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686584.1068772; Wed, 28 Feb 2024 12:42:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfJGw-00086W-DZ; Wed, 28 Feb 2024 12:42:54 +0000
Received: by outflank-mailman (input) for mailman id 686584;
 Wed, 28 Feb 2024 12:42:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NMA4=KF=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rfJGv-00086N-Lt
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 12:42:53 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2417::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e147e9e1-d636-11ee-a1ee-f123f15fe8a2;
 Wed, 28 Feb 2024 13:42:49 +0100 (CET)
Received: from BN9PR03CA0473.namprd03.prod.outlook.com (2603:10b6:408:139::28)
 by CH0PR12MB5218.namprd12.prod.outlook.com (2603:10b6:610:d1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.39; Wed, 28 Feb
 2024 12:42:46 +0000
Received: from BN2PEPF000044A3.namprd02.prod.outlook.com
 (2603:10b6:408:139:cafe::e7) by BN9PR03CA0473.outlook.office365.com
 (2603:10b6:408:139::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.27 via Frontend
 Transport; Wed, 28 Feb 2024 12:42:45 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A3.mail.protection.outlook.com (10.167.243.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Wed, 28 Feb 2024 12:42:45 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 28 Feb
 2024 06:42:45 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 28 Feb
 2024 04:42:45 -0800
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 28 Feb 2024 06:42:44 -0600
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
X-Inumbo-ID: e147e9e1-d636-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jZfL+M8sdAzOUxjx8DxbA2DPaxfI2rj/m6leLZmOt9RD6DQJ/esSVbmzt7208b31M3B++xZYogVuTDNn9krVMprv9pVEw7Jswz+0Z7Hb3ySAwJQ+viBf+aUFTVs1xB/hC3VP7aGZ9/xG8DGFanIFU3Dqk4z/axjuZw8s+L9I8eRjzeQjCEIrgeMMQMe0BjA6LEP572HS5ZkOjl4ARnXrQ3X1LZARjDOMrmVKgQ37UI2/FsmcLS3CIW8SeTehxMVvKvqwNrTzcbbDh7iO1ReHSOU2cwy7RSgY6CzcFd19UvECLI6EEyH4aaA2aWUppZegqdyLBARPwb9GEKTFoGNZ9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B1IXjfxMjHnGO9oplCFMYfK64TTR/fPk9KjMyeZlPPk=;
 b=JaJfTA+DhItzQP/lqXBF3zkND4JbpBnbweervfYiY+ufxmNffOpRy2ISIT6ip2ELCmgK+kHimAF6UkT+Cw52fy1hvgoXjGWDIMS7zVqk9yYOwhi0ueZWfh6NCdQQ6gzudxBbBA9szEWWlMLH7h/DUfTNmsC4T58lAdgXwYu4wd+7L02v9LcJZdAlDYzK1ljy9oYgVtWYa2568tj55c4tgHV6ieHNQBehytlQMb8DNRLG+OJLFUsDl1CO4WStvcVQ2O3fMzZ9TRsZ92xerJfaJ0+u+lDltShxn39HW2JLQPv7y9UpWs9lx/sKoJB6i1SpF9EHWQvh/nFoEpF7EXjzYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1IXjfxMjHnGO9oplCFMYfK64TTR/fPk9KjMyeZlPPk=;
 b=mmsZaw4TJv1ksYgNDmqwDSADI2uDbYk3B/bNUrujwNi+xJtwdTcRi2isRTzi2PtNqFlY8EiQhK1Px/ZwoPGrUo0+bVFTZik/YiFmV5oxyzR5BkYC0RQ1lxe8FgF8SCOnZ9kJvQzpyGzgXQdfS/ulZb+47PStlfeUI27N1JovFEE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <af11620a-ec16-4677-b968-d8e36c4555d2@amd.com>
Date: Wed, 28 Feb 2024 13:42:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Fix arm32 build failure when early printk is
 enabled
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240228103555.172101-1-michal.orzel@amd.com>
 <9201bdc5-2e4c-48b7-8c92-f5063fde90b6@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <9201bdc5-2e4c-48b7-8c92-f5063fde90b6@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A3:EE_|CH0PR12MB5218:EE_
X-MS-Office365-Filtering-Correlation-Id: 3df9e65d-ff25-40c7-0559-08dc385ac364
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YrwJwok5rjpqoSvVkDM3eRMOmM6unxWll9I8b8lbPUu4tgzgJ81fpUKjke6qoqv0RD88t14gS1he+IbTBxuvkaOG7FsuJrW3XGjPZBfea0BenJCSFNrMICX5AkXx71W2/5FNSawJkRMt719FqPOEdO5x1uGXtIxZKGCES26/a+ZNoO0AYL9vP6YT0JYTYBigDAK/LviOa3/c2bWyBZ9aQoiqO0lzaODJ45YsOQR5+Je2ng8X5Pb0eOlYEHtfrXkf0RnIGw7txR5iU32yYsedxe4dCqG28sAroLcVjK98hxd6gPW7TKeqSsn9Pifbcn9rrtamQi1GwT9HWdkSgkq/he5nPmQermTQ1nXmY1TGfhrm4ONm4fgGYyvzFVkTIXXfKUTEfnF+LvEN/P3oMQRIchAMQGqc9yq+nWEZnCkq9gdoq5wb9cZpxTX1BIQH1zTGwD0DdWhAo67C2BuGKLQgMs8NCYBpF+lU/8bdysAPjw9Xzy+1vBQnH0eiips5X1GVpxAV8xQVru+V7XIbjIFjMQYt4xAFqkdQfmfmgo4YmJ3m0wM1Jatopv8KJABkYyYUHVFQIWcJRaEeKaaj3o8aUAlQvwetI0kDsZwDR4glHCaaVPq/quX92AyJTBxJ8AirIViuW9eb6bhcOptLaALfNnFdnfRsOViVPpwIvDBkIg3VDiZrf7VcfBV0IjMnmUHFjuSNQIyf8YdxCO3c0IKexxS56jQ00wb9B3AHJozt/zC1NMa5tzybXfXf9A+xIwzC
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 12:42:45.5623
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3df9e65d-ff25-40c7-0559-08dc385ac364
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5218

Hi Julien,

On 28/02/2024 12:42, Julien Grall wrote:
> 
> 
> Hi Michal,
> 
> On 28/02/2024 10:35, Michal Orzel wrote:
>> Commit 0441c3acc7e9 forgot to rename FIXMAP_CONSOLE to FIX_CONSOLE in
>> TEMPORARY_EARLY_UART_VIRTUAL_ADDRESS macro. This results in a build
>> failure on arm32, when early printk is enabled:
>> arch/arm/arm32/mmu/head.S:311: Error: invalid operands (*UND* and *ABS* sections) for `*'
> 
> Good catch! Somewhat related I wonder whether we should add earlyprintk
> testing in gitlab?
I thought about adding this and I think we should at least have build jobs (hypervisor only, no toolstack)
selecting early printk. When it comes to testing if early printk works, I'm not sure. It'd be nice
but FWIR we have limited bandwidth.

@Stefano, what's your opinion?

~Michal

