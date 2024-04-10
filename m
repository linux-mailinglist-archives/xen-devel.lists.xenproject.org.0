Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F5789F421
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 15:25:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703093.1098890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruXw8-0006Ld-4A; Wed, 10 Apr 2024 13:24:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703093.1098890; Wed, 10 Apr 2024 13:24:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruXw8-0006JO-1b; Wed, 10 Apr 2024 13:24:24 +0000
Received: by outflank-mailman (input) for mailman id 703093;
 Wed, 10 Apr 2024 13:24:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=23xn=LP=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ruXw6-0006JI-VM
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 13:24:23 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20628.outbound.protection.outlook.com
 [2a01:111:f400:7e88::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a35b2c19-f73d-11ee-b907-491648fe20b8;
 Wed, 10 Apr 2024 15:24:21 +0200 (CEST)
Received: from PH8PR15CA0018.namprd15.prod.outlook.com (2603:10b6:510:2d2::11)
 by PH7PR12MB9102.namprd12.prod.outlook.com (2603:10b6:510:2f8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 10 Apr
 2024 13:24:18 +0000
Received: from CY4PEPF0000FCC2.namprd03.prod.outlook.com
 (2603:10b6:510:2d2:cafe::4c) by PH8PR15CA0018.outlook.office365.com
 (2603:10b6:510:2d2::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.19 via Frontend
 Transport; Wed, 10 Apr 2024 13:24:18 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000FCC2.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Wed, 10 Apr 2024 13:24:17 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 10 Apr
 2024 08:24:17 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 10 Apr 2024 08:24:15 -0500
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
X-Inumbo-ID: a35b2c19-f73d-11ee-b907-491648fe20b8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FVijp9fzNXtFgdzpk89AQ+dU2QBslN7RXWqpEmEmZhNI2lXTVX8/g6UpNxoXTq6QlBQzhZp+9tOU5CSgw4DySvaub8rQj4wCUKjDD/FfoF3HW6lZ0VRkn94T1cZBP2Pkarqep9tFSSlIwEezZWGGvxgJJJLPiC6zHLo6zlzO/TckFz0sk1UHt7gYbHmL7HXnCR+TGB9V2TSx+j+M3nMaBM5YDL32RaayVzuL1XGyp830vUER4WvzxYKECSNkQsPEI6W+vHLzMibv1fEBmvx2W3fKA3oyJmBbVsQpRK/GiYxWhka0L9d2i4CXCa4iiEq4FHypMVHbiUIrr+29p47HYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zYI8i5pzAIr9hWphtaCpet18oeiaiNBVZUBjSOu4Qr8=;
 b=IJ/rsmg23GxBAq/VNgkLXJ+KJrOJ++IhnLCOw33L+1Mgtz3jbNWXtDA/P5eJ/El8/O+qDgGpXBSnDO+X7xieo2+sExetJLKCVDNHTxDvijN1Acc/bjDgdkeT/+ZG9Ev+/uH6LiJV92alFh739CrMYZLxXObMwv+iwvIrNJCkfD1ILdiEkKXYinpaFkjPebfG8Uqcr+qBZmDj1wVUoBrbgfoHCdQ1KIzLv+oDbQS8uZTBqemXVXkkQTG2Dhv6EBe2Yx5H1UphAAGgDB4H+akQjRApEpwwNPSLoj1pM79kR6uTnMB77K6VhUOl/z4cZNWT2xU7OVQMS42GRSXnl+9y3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zYI8i5pzAIr9hWphtaCpet18oeiaiNBVZUBjSOu4Qr8=;
 b=LtUad1I9qwvSg1YLiyIwQADMcYCBwEo9Z8IafF/n4w3k++KkIDmdzkOBeKNotchxpXHnwzIRS9Bdv2vbVplTX6dhirmklP7MCO0wgeMOvjLA4QiNOGujCJaNMndUsqfC+jPMpJ4UGd5Kxte5KgWPmGIKF8QwBeMFDnIF7lJjAS4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <da2d2945-5d94-40e8-a632-6ea8cbf3bcb9@amd.com>
Date: Wed, 10 Apr 2024 15:24:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1 4/5] xen/arm: allow dynamically assigned SGI
 handlers
To: Jens Wiklander <jens.wiklander@linaro.org>,
	<xen-devel@lists.xenproject.org>
CC: <patches@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240409153630.2026584-1-jens.wiklander@linaro.org>
 <20240409153630.2026584-5-jens.wiklander@linaro.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240409153630.2026584-5-jens.wiklander@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC2:EE_|PH7PR12MB9102:EE_
X-MS-Office365-Filtering-Correlation-Id: e566e2df-c4b2-4fda-062d-08dc59618639
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d1u7Q5VB4r1ek8pPP2IJfhb2qk5htZrFMOQ7G2oudntme43OSmGNdFGrQd0dBJyFG+F29WmzRXUPa5R6BbVspK4SWqWmrouzEp2PBAsCnzCfJV/4TmaTBxN6UDXcwO/rNGl70zzZk4TVfvDuYJPErOVDGvi69DfyQoERXi4jHkg0IDEjzz1VxOBuZgXS6NLFkJRuj/elmihRj8CfrdB3c9NgV/aCihfjILuqLk5UrQumV2TdeaU49EH/BxKUmX73/ieHVWSUG9XrrBn8MGw/NnYS7l/bxuXWdKTpqvR7fv2XviMaxLFekr1P2UopsuSXzlPtaRZ3RCp/p0XBIGXQcf8ccrU91Ki8fPAaAX3x5BmHK87bRhZ0BiNf9wyTpL1Md8z4olQpvIscCuqHILE9T26/s7crocc0VyHvIMi+IwRsBVtHt+LdcVqbG+C/scFjxgiqlzIYBhtC1SILj457WQ1dGcTjhQyyutnCgSQUZH+F3walHP8YUvqpxzaanqZN5ttv94gL/A+0rHK09wYZIxfKE+/II2BS8WDUPtVErRDoh/dUEjFEbCUKrGkGzdZPl83L/QoJbm2bPBR1U9xczRsDEBb36kDcad5XEhQTfXooJet9ct+frfQ9taqXJtcYrzu22xFVD5EIjxc6HtWljn8hrP/dIM6mmihEEGrKCJ8e4YrIaR6zx3/nf12nftApPjpmeM2WMkyDRhe++yPiOBVwsv6RvQeRQMyirHe8CwSegBYDOxfckLXM25cbPjlx
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(1800799015)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 13:24:17.7414
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e566e2df-c4b2-4fda-062d-08dc59618639
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9102

Hi Jens,

On 09/04/2024 17:36, Jens Wiklander wrote:
> 
> 
> Updates so request_irq() can be used with a dynamically assigned SGI irq
> as input.
At this point it would be handy to mention the use case for which you need to add this support

> 
> gic_route_irq_to_xen() don't gic_set_irq_type() for SGIs since they have
> their type assigned earlier during boot
Could you elaborate more on that? Do you mean that SGIs are always edge triggered and there's no need
for setting the type?

> 
> gic_interrupt() is updated to route the dynamically assigned SGIs to
> do_IRQ() instead of do_sgi(). The latter still handles the statically
> assigned SGI handlers like for instance GIC_SGI_CALL_FUNCTION.
> 
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Other than that, it LGTM:
Acked-by: Michal Orzel <michal.orzel@amd.com>

but I would like other maintainers (especially Julien) to cross check it.

~Michal

