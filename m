Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD3B7E694B
	for <lists+xen-devel@lfdr.de>; Thu,  9 Nov 2023 12:11:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629611.981926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r12wR-0008Vu-WF; Thu, 09 Nov 2023 11:11:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629611.981926; Thu, 09 Nov 2023 11:11:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r12wR-0008U2-Ta; Thu, 09 Nov 2023 11:11:19 +0000
Received: by outflank-mailman (input) for mailman id 629611;
 Thu, 09 Nov 2023 11:11:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E/1w=GW=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1r12wQ-0008Tw-ST
 for xen-devel@lists.xenproject.org; Thu, 09 Nov 2023 11:11:19 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7e83::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3235f89-7ef0-11ee-98da-6d05b1d4d9a1;
 Thu, 09 Nov 2023 12:11:16 +0100 (CET)
Received: from BL0PR01CA0004.prod.exchangelabs.com (2603:10b6:208:71::17) by
 BN9PR12MB5292.namprd12.prod.outlook.com (2603:10b6:408:105::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.18; Thu, 9 Nov 2023 11:11:12 +0000
Received: from BL6PEPF0001AB54.namprd02.prod.outlook.com
 (2603:10b6:208:71:cafe::9f) by BL0PR01CA0004.outlook.office365.com
 (2603:10b6:208:71::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.19 via Frontend
 Transport; Thu, 9 Nov 2023 11:11:12 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB54.mail.protection.outlook.com (10.167.241.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Thu, 9 Nov 2023 11:11:12 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 9 Nov
 2023 05:11:12 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 9 Nov
 2023 05:11:11 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Thu, 9 Nov 2023 05:11:10 -0600
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
X-Inumbo-ID: b3235f89-7ef0-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YkYcol4Mlzbmfdd+IBKEsPGHci8ePLPLL2knshEKw1Wy5Z/yw0+bt8jzEOZtGI3f1iuItRjynzJGI9r/7/YTUYpX5z3M/Gr4rtp2nyi4Bnl735bm2HN/Iuo6MYkSV0ise41Igiu1K9Jv5ZZ7J18C5DOxrz7Mi1cwOQhfx/mQw4bvehO0Yd7FtZ5w8ie5pqMf4FxKi4sWTfb11s0o3tWuqmFY11ps2q1fXHUUCN9YHpIv0BaeS7Xa7NbH0qABWVx2ejj9ACz7e2JVNLW0CJKkfT5gw86AuNwYPVOLNyPHG0BJzpVH5KvPoeqpTEoG5bA+aYURnkXzNYE3EHAMiDfUYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vFqVLBs/pexFqyC4DGwn0UgQ7Qo1oPTwatjXIllCYx0=;
 b=OuJW9zZxg/UTdXlv4PrfRZr2qiHe71m05XmpsmOvCYTe18wje9/71RktjmXetGimWEEGtM8bR+1ndMDU4Fy1k2nSSXrE+NLk5jUOwTTcKmVA/NOdeIzvtViX5vDQx+KPTzOQEjYv0iWAPFe6HqVt/LcmEhihofmTqbzeNedLFyECwRmHj5wBAKgg1O+khnnwjddHnZKWx8hF+A62eJGF5T2pDQzKznrV+9c7uQIXQXuCgCKPIMezearhVGLUP3WJhdvo2dpZUV3i4/4UFxQGBLcCwKwW9QHkUwJAjNwty2akPwLRi1ZYiPZd2VMX4ANjZ4glCLwntDctzqpEZ7eUcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vFqVLBs/pexFqyC4DGwn0UgQ7Qo1oPTwatjXIllCYx0=;
 b=CkPGHXS21yDYaA7KerrfY8uChMg/xs6MrXQ7H+TVLhFV57/Zb/VvH8LLOrxhwbQHBcKGSFUpFgzk7Vx/TP5L99wMZBAGYQyDTvIiJp1fM8vvY+Eyyo9jQXPxQaJDA9KMadtm4at42Z68Bw4AXeZoplwUWIR9MST9mw3PIHJdQPA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <bec276f9-ea9d-4c9f-887c-358a3f7815fd@amd.com>
Date: Thu, 9 Nov 2023 12:11:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] arm/dom0less: put dom0less feature code in a
 separate module
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20231109090615.3878767-1-luca.fancellu@arm.com>
 <20231109090615.3878767-4-luca.fancellu@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20231109090615.3878767-4-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB54:EE_|BN9PR12MB5292:EE_
X-MS-Office365-Filtering-Correlation-Id: adac805d-53c2-40fd-9ec2-08dbe1149571
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CbrorZHkaKD0LGLfiRFKp1VC6EW+l8zJ6GqBa+piB7pf3Qh1rwOapMVGp3IYO0mhjSBIOs9QcWG4FDNX8J1owcBoPBWZphKllRgCEFtcPRA+Q8Cckpm+T/gnG8kt2/ry+yhA+vt7jqFWyU1qR5u2ceYsioX4HvU/OqRTgbOIm86BfDr6U4fMTlkYbxH6RQDXfv1pgqmFZzG4MF+yjYcTB+TAscSVmwirEIdDO6OkpK3xbX9kxhJ40rG125CWqOYqR1TPN25DbWUzNpSEs7Ept08YI679Ki/y0qYTJ0NCQTA2HgGR+pTgPDVgRfWK8jhc7bRp0eLfytGhY94vfCSem1Zm6UYTXkbn7mhvJUzSI0AQ2vwn35fH/RtauHo83tU/Jcb88BwWgtVE6q9Vo+lQqVPD5GretVaqm1iiHrJ6XwZZkNoc3oIJqQ/XOYviRFQ3FecOp0pmU+VVdwzS7hMxq67Mg8jio3XB/KR5n0YJxmBreoJZsrt6s/5DGDFhDDpHIfLsYccX3EddvyN0FXs8wqgPhy5uhD8SoK2J4q1so4/LQ2f5+qOyJMEFokfk3d3DijDxEWcoLoRp40fQXWKlszUT1G+afvJcclh4BpyLn1DOT9sSO16ZciX4eSwajfyDqTvrnr3n7Fi948acZGXxMf9y+ctnx0C/48aCY3Bf/j2128H3ZjnwFfXWm9nnGNQbPgpf7HOWcVrK4A9hpOUATNX1nBvREJ9ssk2sOvqzeOrA01/O05kWjcpCHx3kJwLl3oIsUV4DFVsaFuBs9I7yRHjOZNrPpjl971tUfFe3xe37Yyya44lARkOq8rAjeZYp/ZUtalGt231J9FF0FVcLuAu6BBCIe0TkXWgIIZggiP8q2363jsEXiXgQvuVP6ZzC
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(136003)(39860400002)(376002)(230922051799003)(230273577357003)(230173577357003)(64100799003)(186009)(1800799009)(451199024)(82310400011)(46966006)(36840700001)(40470700004)(41300700001)(16576012)(36860700001)(83380400001)(82740400003)(356005)(81166007)(110136005)(53546011)(478600001)(54906003)(70206006)(336012)(426003)(70586007)(316002)(26005)(2616005)(5660300002)(2906002)(36756003)(8936002)(4326008)(8676002)(31696002)(86362001)(44832011)(47076005)(31686004)(40480700001)(40460700003)(32563001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 11:11:12.5435
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: adac805d-53c2-40fd-9ec2-08dbe1149571
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB54.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5292

Hi Luca,

On 09/11/2023 10:06, Luca Fancellu wrote:
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
This one, despite the name, is strictly related to shmem. Shouldn't we move it to static-shmem?

>  - make_hypervisor_node
>  - make_psci_node
>  - make_cpus_node
>  - make_timer_node
>  - handle_device_interrupts
>  - construct_domain
>  - process_shm
>  - allocate_bank_memory
What about static event channels? Does it make sense to leave it unguarded? Reading the docs,
it looks like at least one domU needs to be present (dom0-domU or domU-domU). Hovever, looking at the code it should
be possible for a loopback. That said, I don't really find it useful given that loopback does not really need this feature.

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
> ---
> Changes from v2:
>  - move allocate_bank_memory back in domain_build.c, remove header
>    from dom0less-build.c.
I can see you removed the copyright from .c but .h still has it. This also
applies to other newly introduced files that were subject only to code movement.

~Michal

