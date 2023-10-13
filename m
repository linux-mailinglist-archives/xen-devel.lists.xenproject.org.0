Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 114AA7C83DD
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 13:01:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616470.958505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrFuK-0000LG-OW; Fri, 13 Oct 2023 11:00:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616470.958505; Fri, 13 Oct 2023 11:00:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrFuK-0000IB-LY; Fri, 13 Oct 2023 11:00:40 +0000
Received: by outflank-mailman (input) for mailman id 616470;
 Fri, 13 Oct 2023 11:00:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BZ0l=F3=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qrFuJ-0000I4-3C
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 11:00:39 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20623.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bca17719-69b7-11ee-98d4-6d05b1d4d9a1;
 Fri, 13 Oct 2023 13:00:37 +0200 (CEST)
Received: from MW2PR16CA0013.namprd16.prod.outlook.com (2603:10b6:907::26) by
 CH2PR12MB4055.namprd12.prod.outlook.com (2603:10b6:610:78::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.37; Fri, 13 Oct 2023 11:00:30 +0000
Received: from MWH0EPF000989E5.namprd02.prod.outlook.com
 (2603:10b6:907:0:cafe::fb) by MW2PR16CA0013.outlook.office365.com
 (2603:10b6:907::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.27 via Frontend
 Transport; Fri, 13 Oct 2023 11:00:30 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000989E5.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Fri, 13 Oct 2023 11:00:30 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 13 Oct
 2023 06:00:28 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 13 Oct
 2023 04:00:14 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 13 Oct 2023 06:00:12 -0500
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
X-Inumbo-ID: bca17719-69b7-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ra+VyTk0E0/Uh6Cv5mHHdZbTSnByDnguguD5cBJPmLIfOJyFjx46kYwh4902TWaF5KzLtOkigC8oaVDTfDWuWL65ghNPXq1UnNfZ54NsbnhdL223hyV6234QUQLjkIDpKENieLfYp7TyRSyIJkzpj2uHwwbc8mn/QG47ctdTNmTbXRg2T77S/iIfVBTr+fhyq7IgwkARpAJtrxXJIl9YX5WN/akJUnXDXDc0V/Rf3qYimmelqAVuGtclN53EFMUOtIdlV90EyfUUvJNKe+gbKmK189fI7n3LEy4fWWWo0V8AqpJDnSUJjrutnGaTf45iKyHtmNw5IdmOGbQwOnUi9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4wxa7cmTOlFj1JNCBPMas48ph9C1hXvAAp+gzL0an44=;
 b=nOKEqn+BI/AOnzWI5mPCqnMkRpGbmErdBfZtuY/uT5bvAm8KDdoIlySriED1Bek+tOwbjgHd+2AglPEwGVZoEmxDsjVJViEQWEW5n0PhJjJZvQg9wwie55VwwpvsPVj8IXhc8AUgtbwbYfj8675qkdY+qQHpgiBMhhq8wMae0KbwUyvhrd3guMgc9bV/JY1YRHMNS5rG5EYWc+REVd4iM3LNmjm3A1O+djD7C8rXyS3wRQ0AIUGopc+nGwAYN6Nqmv1FFJywPf/VkuurQfXv7Fn1elHlj5sWAfmQZIvmePm3hUPULq7TVT/iWYFJfV1gRrxmQt7glPSGVQ23Mu4mrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4wxa7cmTOlFj1JNCBPMas48ph9C1hXvAAp+gzL0an44=;
 b=Rs72UJXHZ4nkEv3A04/naSpjM1TSvQ7Jt2w5j1J/c82zgUCtLgtW6ClSM8xUh0COMcQZez0ag+wxlove/DVSjcRMbrWF7HqMG2QnEggJHteKYFO3L/hVUM8Blck4n3s5siuor6eKEdOyJkhQbcC8NT3tb9fysCGrBVbLhTk0Ga8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <b8312c46-c1f8-455f-b277-b36a1dc636ab@amd.com>
Date: Fri, 13 Oct 2023 13:00:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/arm: Skip memory nodes if not enabled
Content-Language: en-US
To: Leo Yan <leo.yan@linaro.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20231013102929.1266849-1-leo.yan@linaro.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20231013102929.1266849-1-leo.yan@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E5:EE_|CH2PR12MB4055:EE_
X-MS-Office365-Filtering-Correlation-Id: be3a7345-5d9c-45c0-cd3b-08dbcbdb9d86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I4d9zEPEoVykGBm0sYSerlZOba9GXPb+ZuOZ7ApBylIN1vp+L0oAl7tED7zk3r9K/l+zClauFYMGC55G6e3idSYBwg6JlBzDu8SHiUMYHy6rXf3EPgf1Jj5K5KxiAay5z3p8Rd8NXJtK38qkczZPO4f0boAh0xcAjjsJow+4NsS76iF/MqNft/nFOCpuv2lwU+m/h/Zqd5V7u7RAq+b/bEAKl5Vj0BTpMUoqO7H7fbG/yemiUEhnepQuzsP9Kz84CgmglWgQvJ7KmWGmwfPGp045VyopUKTEqjVPmuxmeb9cJNLevqpZpohB7Dm/F10x13dN+2Lo3YgfKcKHrEVQxtkvQ8jiEnXHXVH8xL1WxquRFb6pdszTRfVt5z6aHNg3t26Of062Q5EkuRF7rXUiwhPzVofm2L7zh5luhAbWXh0/xiH6G2pFA4dXy3XKzBaEY0Og96x5/x5GAVtIiIMwSq9FZTW4u3xwzLOqLJkyQQntog62sFjA/ZOkcOfJ07r6agsXr5C/YeKPTd9MV4wK4nNpVjgAgL0c47BrB1DWbroYJqRjxh+H3ocNzM0p0nOIjjXrstbGGZ5dVHEWXXQct2sfrY6wGZgzkfmoyKuNleu3LwN+9RBJN6sQb8OLKiNgJLZGzq1q/S6GtvH7hVbr72hI413ATbWd7BHixNa1crYi9S9CQ0KjTn1GvwcHahAqI3FfKPFelujaOICi/PlK38IOgydeJt052p0E3/Wr9mZ3TWaapBiJ6lxkU9u9FgrZiqh/adHRV57aMBtfzF9+bui/etr3GSHONBDhx1CF+pfgvgChkwzaC8aYM1VTlyvP
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(376002)(346002)(396003)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(82310400011)(40470700004)(36840700001)(46966006)(40460700003)(53546011)(26005)(478600001)(2616005)(44832011)(336012)(47076005)(2906002)(83380400001)(54906003)(70206006)(5660300002)(110136005)(426003)(70586007)(16576012)(41300700001)(8676002)(316002)(8936002)(31696002)(4326008)(81166007)(36756003)(356005)(82740400003)(86362001)(40480700001)(36860700001)(31686004)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 11:00:30.2472
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be3a7345-5d9c-45c0-cd3b-08dbcbdb9d86
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4055

Hi Leo,

On 13/10/2023 12:29, Leo Yan wrote:
> 
> 
> Currently, the Xen hypervisor doesn't handle the status, the issue can
> be described from two perspectives: the memory nodes and the reserved
> memory nodes.
The first part about the status is a bit ambiguous.
How about (this can be done on commit):
Currently, Xen doesn't check the status property of memory/reserved
memory nodes, which may lead to the following issues:

> 
> - If a memory node has a status "disabled" it implies that it should
>   not be used. Xen does not handle the status property for the memory
>   node and ends up using it.
> 
> - If a reserved memory node has a status "disabled", it means that this
>   region is no longer reserved and can be used, but the "disabled"
>   status is not handled by Xen.
> 
>   Xen passes the intact device tree binding of the reserved memory nodes
>   to Dom0 and creates a memory node to cover reserved regions. Disabled
>   reserved memory nodes are ignored by the Dom0 Linux kernel, thus the
>   Dom0 Linux kernel will continue to allocate pages from such a region.
> 
>   On the other hand, since the disabled status is not handled by Xen,
>   the disabled reserved memory regions are excluded from the page
>   management in Xen which results in Xen being unable to obtain the
>   corresponding MFN, in the end, Xen reports error like:
> 
>   (XEN) arch/arm/p2m.c:2202: d0v0: Failing to acquire the MFN 0x1a02dc
> 
> This patch introduces a function device_tree_node_is_available(). If it
> detects a memory node is not enabled, Xen will not add the memory region
> into the memory lists. In the end, this avoids to generate the memory
> node for the disabled memory regions sent to the kernel and the kernel
> cannot use the disabled memory nodes any longer.
> 
> Since this patch adds checking device node's status in the
> device_tree_get_meminfo() function, except it checks for memory nodes
> and reserved memory nodes, it also supports status for static memory
> and static heap.
> 
> Suggested-by: Michal Orzel <michal.orzel@amd.com>
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

