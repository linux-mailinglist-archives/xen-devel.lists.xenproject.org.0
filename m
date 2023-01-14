Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 313DB66ACEB
	for <lists+xen-devel@lfdr.de>; Sat, 14 Jan 2023 18:15:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477706.740533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGk72-0000wt-NX; Sat, 14 Jan 2023 17:14:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477706.740533; Sat, 14 Jan 2023 17:14:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGk72-0000uy-Jw; Sat, 14 Jan 2023 17:14:36 +0000
Received: by outflank-mailman (input) for mailman id 477706;
 Sat, 14 Jan 2023 17:14:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yAkF=5L=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1pGk71-0000us-1n
 for xen-devel@lists.xenproject.org; Sat, 14 Jan 2023 17:14:35 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2089.outbound.protection.outlook.com [40.107.212.89])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8b39106-942e-11ed-91b6-6bf2151ebd3b;
 Sat, 14 Jan 2023 18:14:32 +0100 (CET)
Received: from DS7PR03CA0148.namprd03.prod.outlook.com (2603:10b6:5:3b4::33)
 by IA1PR12MB7637.namprd12.prod.outlook.com (2603:10b6:208:427::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Sat, 14 Jan
 2023 17:14:29 +0000
Received: from DS1PEPF0000E630.namprd02.prod.outlook.com
 (2603:10b6:5:3b4:cafe::fa) by DS7PR03CA0148.outlook.office365.com
 (2603:10b6:5:3b4::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.16 via Frontend
 Transport; Sat, 14 Jan 2023 17:14:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E630.mail.protection.outlook.com (10.167.17.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.11 via Frontend Transport; Sat, 14 Jan 2023 17:14:28 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sat, 14 Jan
 2023 11:14:28 -0600
Received: from [192.168.137.15] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Sat, 14 Jan 2023 11:14:27 -0600
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
X-Inumbo-ID: e8b39106-942e-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U09ZFGpT4xGD2M5j0l7EJan/vdLmpxFpItQ2edpQR01RM3YNubvOOYILitpJb6FimQrzdZqbxJRs/Qj93PfdpEf5BWCb+DpHYehhtIQ5ghHEJmcejwP9yBCUpDMaBDHc/1rV1OuUzQl9ha2MVw49cxezso89h3/tAf8zF55/wDYKgRceaBHAXY+vi6Ld0znMBlCwu06GIhL13UNq3WV6sxHJshuO7WkxXYqsaWdZgIHb4P0G+3HRtsryfZs0hR+76aiJZ3vNZhxWPQlD1QzfRJVCcNOFFFmZlffMjSbph17xEWlc1pjOrTPWIHtqzuly21YP9j07UYWGVPSajbdJqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wz3KoBol57cyMe/+ZKbAqUlUeRlvIvDF9TO+e1H4Wlw=;
 b=WuXkhSXfE9zJVSUSkGY1rePj3xiWCPivz3wWzfAG3W9rHhdIeqG2u2yPj4SGlzC2e5bWpTgTc98OLwu0PSphd8kIcKE327nIBDbShgbB9qb9VFdDn5/Mfvgc8LP+OX+TRJgz/3cdTjRDPON/tABLvKTJhuhTMlykwupTtzDEGPMVYdX3HnoylDpCHhOUals74b/fRxaHYARs60FlIpajTuvI2DImw2y7V2CDDOTysSVFRmzPBBma/rqBRz35e0Ke/ANkMO8ChyDQ0Nd3d2My9ibWzUEcESP4tb+cbb8SEbTAnr5J9GJ2oBC6R4AP4nhsavhuwZ4o1FW7qhNPu0BK6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wz3KoBol57cyMe/+ZKbAqUlUeRlvIvDF9TO+e1H4Wlw=;
 b=Alt5yCAEJLDdoFxwnMvtEjPupeO0uiQjcrBgMze/AFr23ivOHO/PdZPY49aI6hTDJRV2LMYsoxEseols8x9msYWlCqV1CdevV8UiND5MIG4Q2pnWn5G4qlUZsvtwg73K7OHBaiJ4Xptw/UfAuH2jR0xv2DdM0R9FVvioIIyOVjk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <5a4eacef-9c66-fa75-2220-504a06c9306a@amd.com>
Date: Sat, 14 Jan 2023 12:14:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 14/21] xen/arm: vIOMMU: IOMMU device tree node for
 dom0
Content-Language: en-US
To: Rahul Singh <rahul.singh@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1669888522.git.rahul.singh@arm.com>
 <544b8450c977f6d005f1d9adee8e0ff33b9bd3ec.1669888522.git.rahul.singh@arm.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <544b8450c977f6d005f1d9adee8e0ff33b9bd3ec.1669888522.git.rahul.singh@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E630:EE_|IA1PR12MB7637:EE_
X-MS-Office365-Filtering-Correlation-Id: 1edc2ad8-aeac-40d8-c051-08daf652cb98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mvU81g71fQjeC1+NkfpIpvKgpinzF9Dqr/Ahr/qzyABVokVSZ0y2b5nIU9DLA2tSWhVxrZECMa0TOP8o+5CGTlb1E5Y1lE2RCr52w7Gwds52PcxcSFJJRStGQAcSav3SuZDThNpSJLRQhdpVSzxYrtcoQsvmZTlqr9OPxejmhyV0CPQQMaHUUxf4JdoU0WgxHwlLWA3MnxAYXG74eHXWhxKqNF4dhUSPw1cSd0V1F32oKY6FLorUcV5vyaEIr21jsHmfstimN/u3L+hUXW2ilmctDWJt5Cr0ftgZwN63X7AUoZrgvBOLH391KPKhVGWzvm+OeE6+R6sbn07FV09Q3Azy8X6Z8f+m1TrU21wz2KXOfee9CIRbRpSZMoIvGBi9B9YvvJNoCEeX7Zy5slgAMCywK7UD/hpKEJFRXBVHdhy0JkKAN3uAWz5v+yKvi7NLWEiJf1c3trKPq+u9pkz1W6A7uVzQZmmlRn5IgAItoQX6l/RzZqqLxxG4utBnXT4mgIXZdcvG8JR2AwFe8WhGY46MQFP0pjE75XHk4YHWbldqM/e4fiXpUvrPDJDwTSu+/17cibnVRl+aWaLTIf+av0IZyNfUMPJeETVzOOUAzi9NrWvbq0dGtsePNW3ZtSSFvuKwJ8O7bXhn7zW1Ws5Vk0NA+XfSg0Tbh414st/OLs104PhM/G+VPqHNDZTPoI7eSwc1TmnoBo3GkON0Fb3Qiy6e06Xm1srVCDsZ1HIhWUmk9pjU9MjUgiAvJ1lTXgVeDqAgrI8FtJdPNUbyZJ4/ng==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(136003)(39860400002)(376002)(451199015)(46966006)(40470700004)(36840700001)(36860700001)(36756003)(2906002)(53546011)(82310400005)(70206006)(5660300002)(8936002)(44832011)(31686004)(8676002)(4326008)(4744005)(47076005)(82740400003)(356005)(41300700001)(81166007)(478600001)(426003)(186003)(336012)(70586007)(40480700001)(26005)(86362001)(31696002)(40460700003)(2616005)(16576012)(316002)(110136005)(54906003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2023 17:14:28.9102
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1edc2ad8-aeac-40d8-c051-08daf652cb98
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000E630.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7637

On 12/1/22 11:02, Rahul Singh wrote:
> XEN will create an IOMMU device tree node in the device tree
> to enable the dom0 to discover the virtual SMMUv3 during dom0 boot.
> IOMMU device tree node will only be created when cmdline option viommu
> is enabled.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
>  xen/arch/arm/domain_build.c       | 94 +++++++++++++++++++++++++++++++
>  xen/arch/arm/include/asm/viommu.h |  1 +
>  2 files changed, 95 insertions(+)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index a5295e8c3e..b82121beb5 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2233,6 +2233,95 @@ int __init make_chosen_node(const struct kernel_info *kinfo)
>      return res;
>  }
> 
> +#ifdef CONFIG_VIRTUAL_IOMMU
> +static int make_hwdom_viommu_node(const struct kernel_info *kinfo)

This should have the __init attribute

