Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 424C66E0A04
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 11:20:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520584.808314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmt7G-0003uH-7p; Thu, 13 Apr 2023 09:19:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520584.808314; Thu, 13 Apr 2023 09:19:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmt7G-0003sI-4m; Thu, 13 Apr 2023 09:19:42 +0000
Received: by outflank-mailman (input) for mailman id 520584;
 Thu, 13 Apr 2023 09:19:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=czPd=AE=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pmt7E-0003sB-N6
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 09:19:41 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eab::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4fe6dfb0-d9dc-11ed-8611-37d641c3527e;
 Thu, 13 Apr 2023 11:19:37 +0200 (CEST)
Received: from CY5PR22CA0002.namprd22.prod.outlook.com (2603:10b6:930:16::11)
 by PH0PR12MB8005.namprd12.prod.outlook.com (2603:10b6:510:26c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.28; Thu, 13 Apr
 2023 09:19:33 +0000
Received: from CY4PEPF0000C964.namprd02.prod.outlook.com
 (2603:10b6:930:16:cafe::77) by CY5PR22CA0002.outlook.office365.com
 (2603:10b6:930:16::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.32 via Frontend
 Transport; Thu, 13 Apr 2023 09:19:33 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000C964.mail.protection.outlook.com (10.167.241.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.27 via Frontend Transport; Thu, 13 Apr 2023 09:19:33 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 13 Apr
 2023 04:19:32 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 13 Apr 2023 04:19:31 -0500
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
X-Inumbo-ID: 4fe6dfb0-d9dc-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j1uJH9teiH/Qn4AgQdU7+QbwJa6CGDjg0581Vn62iJTueGlk3B7l48xh2s2eiR0ppkb2pjNk5z+xA6u3bcIVFUsPzbCEmXczFdbOKAUl5dSz/5Gfw6J1lHGYyEWQ+o6cuopLYcmX7Ie7q9K/CEzKZ8TuzHFn0tYymdmTRJqwG01t+Kp6HdfFsnODlPKlXxK2cXi1wk7C+/CkCSciX5n9ZNST9r4xi9cXfzVaL2qSa3be3CHNjlCdUnIXVrDmicJ0Z9poWY+LZ0O8h2sqtER0+uPIEvFQ+WsVs8dz5o0jDxg+5vX/AsY5kvLGlE4B3R33R+AA/k4VEdUponkRP9Qt7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rhId+4L7TrpgnRGi0eVPN6ygrjDhOuIpBpqxIPPVTL4=;
 b=nd2K3SWXZpgtIy7biFLI9suKMhmBF9vTKi8w4XOiC5XcRLHCYpnPvId6Z09fmwmeNVj0N1AyLMY7ssVeMdk8t0sPsHqrVp+jH7FbcpXblOFAAttDBhnp74tZ4ioK1s2JeH1Ugh6Lh3H5oikAshS40Pnj9fKrsg2TmQuKgxrcLDx0As0ahkFeZ7Vu/+Z/cC7ScoxXR86tymB7qAuDHQxJj+rEJg0aDXBLurEjzIn79LnmApM3u9ebAp14lq2atBrRxX1ScxHSHkU7XIto2vkQRs3O0xRxC8f7UTeiFkcOsAJgDisMf9jDFpu/18/MluMQKvnhCtI+w+FAQGTgY/cGig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rhId+4L7TrpgnRGi0eVPN6ygrjDhOuIpBpqxIPPVTL4=;
 b=SbAVmjuP69ZYNgwwKurCGP6UasO8sgQIosYJMwLRt+1oflz2teaVqrkMkKjmw6Q6joQ2aF7tf0hdI4IlnF6sVH3fBaX4L4eJp1h3c5o22DTAjUtW1shDRKS/+zMyO3wRbSZz+aEqn6B7QL4ZiWEQvkIvd9Ax1H5WkDseOVZDIjg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <836d2629-b097-9a8e-7aea-3f83fd13228f@amd.com>
Date: Thu, 13 Apr 2023 11:19:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [XEN][PATCH v5 01/17] xen/arm/device: Remove __init from function
 type
To: Vikram Garhwal <vikram.garhwal@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230411191636.26926-1-vikram.garhwal@amd.com>
 <20230411191636.26926-2-vikram.garhwal@amd.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230411191636.26926-2-vikram.garhwal@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C964:EE_|PH0PR12MB8005:EE_
X-MS-Office365-Filtering-Correlation-Id: d05e48d2-1a3e-4ec6-fce8-08db3c003182
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nkDZdVSaZ8WSAwZiSKeVyOVTy+EDpVyOZDFlNgyHq/NrlZVdHjxUHoo5nl7q8XmrHkcwgofoMSmDy5wB3nQD8khSjGr9FRqlGggHZM+8ca3Z9I/uOykYDbvwXBDv4vdet6ZtJwY/VYs7lceH08fCF6xLIeZJr4MccUG2wgvfg8uNV6agfUg1QUh6m5xdFDYzb/HGGqc2PCeSC3ip72Tp8jBccYMTlW3hGZciyw+Fo9NYAYE7WcEfiBb18ThFFn1zLpE0+7hwm5PIkQS9gdrkaP+Vx4goQtIDU+C0vWdp5z/aEw9IWJ3BRCglhJZNe9PHarL9FCqn70oeU9UDYy3QuoSOk4mt9pLMHlYs9DK/NMGhsa5frQS3n1qc1QrybqXU7+aBtdnXyVFTX11OGnKpHBGBmzlUBr56vDf+lRWSd6j3PwdV84qlPV3rZ4V6yP+VEPLvo0qla0ei61XDBhS/B+IzZC8671Fss3inL4J4+itKDXo2U8jB/Y+Ac0foLwvY45MAToxQ1SWxCZs//vpDtIxAX0yQQHNxBAjKHntyklOyX3CMjjzxdpqhY2kJQmbreotOh90tRqyzwQKnibcEMzXaKFxhtlqj4pAPtkn3Un8wqiiwv3ariQ5yS/JWp4SuTSuCjPO5rZ1gM25uv7bUQfXDNf8IlYZHuxctTJKa5pHOIA0DGNnym4w5LzIMg+cYVCPRdpEI3znGjvi6V/nTtQ02ko0qPIRVOiLFNkd3LsQvHckDS9z5vXlYNZWQGCYKvz1UZ22pRdjYH6SaWEPUUQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(39860400002)(396003)(346002)(451199021)(46966006)(40470700004)(36840700001)(31686004)(36860700001)(5660300002)(36756003)(2906002)(44832011)(31696002)(316002)(86362001)(8676002)(8936002)(40480700001)(82310400005)(356005)(70206006)(4326008)(70586007)(81166007)(41300700001)(40460700003)(2616005)(82740400003)(336012)(426003)(83380400001)(47076005)(54906003)(186003)(26005)(110136005)(53546011)(16576012)(478600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 09:19:33.0297
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d05e48d2-1a3e-4ec6-fce8-08db3c003182
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000C964.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8005

Hi Vikram,

On 11/04/2023 21:16, Vikram Garhwal wrote:
> 
> 
> Remove __init from following function to access during runtime:
>     1. map_irq_to_domain()
>     2. handle_device_interrupt()
s/interrupt/interrupts/ since there is no handle_device_interrupt() function.

>     3. map_range_to_domain()
>     4. unflatten_dt_node()
>     5. unflatten_device_tree()
> 
> Move map_irq_to_domain() prototype from domain_build.h to setup.h.
> 
> To avoid the breaking the build, following changes are also done:
'avoid breaking' instead of 'avoid the breaking'.

> 1. Move map_irq_to_domain(), handle_device_interrupt() and map_range_to_domain() to
s/interrupt/interrupts/

>     device.c. After removing __init type,  these functions are not specific to
>     domain building, so moving them out of domain_build.c to device.c.
> 2. Remove static type from handle_device_interrupt().
> 
> Overall, these changes are done to support the dynamic programming of a nodes
> where an overlay node will be added to fdt and unflattened node will be added to
> dt_host. Furthermore, IRQ and mmio mapping will be done for the added node.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> ---
>  xen/arch/arm/device.c                   | 145 ++++++++++++++++++++++++
>  xen/arch/arm/domain_build.c             | 142 -----------------------
>  xen/arch/arm/include/asm/domain_build.h |   2 -
>  xen/arch/arm/include/asm/setup.h        |   6 +
>  xen/common/device_tree.c                |  16 +--
>  5 files changed, 159 insertions(+), 152 deletions(-)
> 
> diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
> index ca8539dee5..fec6e29c42 100644
> --- a/xen/arch/arm/device.c
> +++ b/xen/arch/arm/device.c
> @@ -12,6 +12,9 @@
>  #include <xen/errno.h>
>  #include <xen/init.h>
>  #include <xen/lib.h>
> +#include <xen/iocap.h>
> +#include <asm/domain_build.h>
I can't see why do we need to include this header.

> +#include <asm/setup.h>
You should keep the alphabetical order so:
- iocap goes after init.h
- setup.h goes after device.h

Apart from that, it looks ok so:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


