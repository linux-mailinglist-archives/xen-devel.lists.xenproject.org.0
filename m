Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7BA82BD00
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 10:24:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666705.1037510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rODlr-0002FY-DS; Fri, 12 Jan 2024 09:24:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666705.1037510; Fri, 12 Jan 2024 09:24:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rODlr-0002CJ-A7; Fri, 12 Jan 2024 09:24:11 +0000
Received: by outflank-mailman (input) for mailman id 666705;
 Fri, 12 Jan 2024 09:24:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=12w8=IW=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rODlq-0002CD-D1
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2024 09:24:10 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5679e5b5-b12c-11ee-98f0-6d05b1d4d9a1;
 Fri, 12 Jan 2024 10:24:09 +0100 (CET)
Received: from DS7PR05CA0053.namprd05.prod.outlook.com (2603:10b6:8:2f::34) by
 SN7PR12MB6669.namprd12.prod.outlook.com (2603:10b6:806:26f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.19; Fri, 12 Jan
 2024 09:24:04 +0000
Received: from DS1PEPF00017094.namprd03.prod.outlook.com
 (2603:10b6:8:2f:cafe::80) by DS7PR05CA0053.outlook.office365.com
 (2603:10b6:8:2f::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.14 via Frontend
 Transport; Fri, 12 Jan 2024 09:24:04 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017094.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Fri, 12 Jan 2024 09:24:04 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 12 Jan
 2024 03:24:03 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Fri, 12 Jan 2024 03:24:02 -0600
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
X-Inumbo-ID: 5679e5b5-b12c-11ee-98f0-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DL3RYWH4EzI4ND51GJBaB23RoweTR7gBk/MpPxzAH0wZvAammoK3aNcv1HJFfXxNuxt24lZ9wJxVdsNCpL44IFxaeCP17/ed1XLTVM22iupRPnp5+xk+PuUpCJKjJ1zmYK/6833B0S11qd/+9lI5Oa9tHUjO/nOGeJelLQoEZwvSf67F5qby40Q1bglKOAY5WYy7ZzZvmUQgUh9u7NBlQMSNzL+2VD/dfm9S8jWq2Ibqw6llKLsRHpJGF81+SUOLxCdXAWHe1tMOkvf3HzzXtEL/StGtRua7U051N2pyoF2JYhtmWw6QfkbEu9LLyxdOWH4GkLWd62jpEUU2msE2pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3d5sQc7GYmsoB3+ad5xudQbsp68MZa1BpP0XA5mYCjk=;
 b=FUVokPSEjQR0soJdU0aPxns61lFuMWV/i3Q28pOpdoHHFhQ03kC/uNsZc5YUWSjlT6Xu8QhlZumQwt+fCe3WFBJbmW6eJD0hVRCwWm5esN7qzZdzbPHJeGo1dtoyvv2m/yGXaBDheZZ1l9MnWAVxPzm4o85KueNTpoafXl7T2l6Tw65/YAO7okljV+sx4Qppac5JPY1BEQlDIi3UfhneqqPYuL/uJoW3y/lsstMT+P71B3Op7noqgpdBkmDwVrVNrvh5fIYfSpqA1pIi4cWAZEBNZKVPnQkFQe2dEEYkz3zWguLkremNV+dGxFaNzRoltXD2ibJIHiCsEvab4GDlgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=minervasys.tech smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3d5sQc7GYmsoB3+ad5xudQbsp68MZa1BpP0XA5mYCjk=;
 b=l0kkbSfPcDSlebspIyidRpmyFMdEWjIGuJQs1SZBX+CpJjnCYUi4QPMRtpKBL398nyHPh2zRujzGvYxiC0X+66oFSaVshYrbp3UtOejq4QxDdhtOu9FT/kUkyRsRUdIvR9gz57mCnz9R+/Ce4i4/6qsOTNdQYwrfPtxNZkU7aJQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <a7a06a26-ae79-402c-96a4-a1ebfe8b5862@amd.com>
Date: Fri, 12 Jan 2024 10:24:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/11] xen/arm: add Dom0 cache coloring support
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
	<xen-devel@lists.xenproject.org>
CC: Luca Miccio <lucmiccio@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Marco Solieri <marco.solieri@minervasys.tech>
References: <20230123154735.74832-1-carlo.nonato@minervasys.tech>
 <20230123154735.74832-4-carlo.nonato@minervasys.tech>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230123154735.74832-4-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017094:EE_|SN7PR12MB6669:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fe16880-648f-402a-1d12-08dc13503888
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bVWVCoNwQTI/XGlKPK+evqmLmDcGcULiG7oBX8BAEF8O/kk2e57ZVmI2p5r2H4wHkBxN+igAKxlm/Qm6v1vhzqLhqK2TBUfszn8r1SWDucNagiL0WJg6n+IWSnGjwsDqJ3UWbgvOV3ABG7ULVyjVCOk5KAB8yBqMljlTKdHlW3dRyzc+TB8/52oUeH019yNhERugsCiYoqU+WDMs0/PglFmR6P9j+J4O0QhwN+99rk1LWyTMqpLYVaJP0DvzTjgeg/xY433UmqgOdVe5VXe9PvoE+dXYBTRGGwgpQPN5cOAAt2cPznwWYZy0eG1d9o4l/K923xdzLTptsbOWz0Jw4gThEukvo855Fgw0yXBorY1L507wN+3HFH8oGblmQda90zZmiBMWSLIFwi2B4d851aLakd7ym3NnVWVLyo5LdGuT2uxd8Zrhaw7jDwQDkiJTeDJDe1vDmnp0cQ4D+yZ4Y3OlDwWRP9AhJa/52XVuYruOZcJcEsz+HZGN8xkDF7QUjcElo2KY4l2xq5o7FrlMX1RUBq1Rxr5eLkwEFTLOVSl0WEyBRU0haNwGoWptGRUNV+C1/jXHDv+r6xr9ioBausdFspUKVkWiFpXVUZAnp8zJdACrFXufdqJb8h/bzu0QHLZnbkkxwdrJH4q2oE23qWI50qMei4PEG8LNlM1+TBD/JbGKb6VYpCDK8Vurn6B+bIGkeUpBYuJfDCqXiE87TBD785sbgude6k7MPAWebv1ZIIDX67L9Mvx+o07kFgV7yTsP3akFOkPdcgEm/B5ReDx7GeV/2/t7fZkBDexsqHJVrUs+MkXjgs3zzDcyGxLK
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(39860400002)(136003)(396003)(230922051799003)(64100799003)(82310400011)(451199024)(1800799012)(186009)(36840700001)(40470700004)(46966006)(5660300002)(40460700003)(40480700001)(8936002)(44832011)(8676002)(4326008)(70206006)(54906003)(16576012)(2906002)(316002)(70586007)(31686004)(110136005)(478600001)(36860700001)(53546011)(336012)(426003)(36756003)(2616005)(26005)(81166007)(83380400001)(47076005)(356005)(31696002)(86362001)(41300700001)(82740400003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 09:24:04.5117
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fe16880-648f-402a-1d12-08dc13503888
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017094.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6669

Hi Carlo,

On 23/01/2023 16:47, Carlo Nonato wrote:
> 
> 
> From: Luca Miccio <lucmiccio@gmail.com>
> 
> This commit allows the user to set the cache coloring configuration for
> Dom0 via a command line parameter.
> Since cache coloring and static memory are incompatible, direct mapping
> Dom0 isn't possible when coloring is enabled.
> 
> Here is also introduced a common configuration syntax for cache colors.
> 
> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> ---
> v4:
> - dom0 colors are dynamically allocated as for any other domain
>   (colors are duplicated in dom0_colors and in the new array, but logic
>   is simpler)
> ---
>  docs/misc/arm/cache-coloring.rst        | 32 ++++++++++++++++++++++---
>  xen/arch/arm/domain_build.c             | 17 +++++++++++--
>  xen/arch/arm/include/asm/llc_coloring.h |  4 ++++
>  xen/arch/arm/llc_coloring.c             | 14 +++++++++++
>  4 files changed, 62 insertions(+), 5 deletions(-)
> 
> diff --git a/docs/misc/arm/cache-coloring.rst b/docs/misc/arm/cache-coloring.rst
> index 0244d2f606..c2e0e87426 100644
> --- a/docs/misc/arm/cache-coloring.rst
> +++ b/docs/misc/arm/cache-coloring.rst
> @@ -83,12 +83,38 @@ manually set the way size it's left for the user to overcome failing situations
>  or for debugging/testing purposes. See `Coloring parameters and domain
>  configurations`_ section for more information on that.
> 
> +Colors selection format
> +***********************
> +
> +Regardless of the memory pool that has to be colored (Xen, Dom0/DomUs),
> +the color selection can be expressed using the same syntax. In particular a
> +comma-separated list of colors or ranges of colors is used.
> +Ranges are hyphen-separated intervals (such as `0-4`) and are inclusive on both
> +sides.
> +
> +Note that:
> + - no spaces are allowed between values.
> + - no overlapping ranges or duplicated colors are allowed.
> + - values must be written in ascending order.
> +
> +Examples:
> +
> ++---------------------+-----------------------------------+
> +|**Configuration**    |**Actual selection**               |
> ++---------------------+-----------------------------------+
> +|  1-2,5-8            | [1, 2, 5, 6, 7, 8]                |
> ++---------------------+-----------------------------------+
> +|  4-8,10,11,12       | [4, 5, 6, 7, 8, 10, 11, 12]       |
> ++---------------------+-----------------------------------+
> +|  0                  | [0]                               |
> ++---------------------+-----------------------------------+
> +
>  Coloring parameters and domain configurations
>  *********************************************
> 
> -LLC way size (as previously discussed) can be set using the appropriate command
> -line parameter. See the relevant documentation in
> -"docs/misc/xen-command-line.pandoc".
> +LLC way size (as previously discussed) and Dom0 colors can be set using the
> +appropriate command line parameters. See the relevant documentation
> +in "docs/misc/xen-command-line.pandoc".
> 
>  **Note:** If no color configuration is provided for a domain, the default one,
>  which corresponds to all available colors, is used instead.
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index f35f4d2456..093d4ad6f6 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2,6 +2,7 @@
>  #include <xen/init.h>
>  #include <xen/compile.h>
>  #include <xen/lib.h>
> +#include <xen/llc_coloring.h>
>  #include <xen/mm.h>
>  #include <xen/param.h>
>  #include <xen/domain_page.h>
> @@ -4014,7 +4015,10 @@ static int __init construct_dom0(struct domain *d)
>      /* type must be set before allocate_memory */
>      d->arch.type = kinfo.type;
>  #endif
> -    allocate_memory_11(d, &kinfo);
> +    if ( is_domain_llc_colored(d) )
> +        allocate_memory(d, &kinfo);
While doing some checks, I realized that the issue from previous series is still present.
Given that dom0 is hwdom, how are you going to prevent conflicts between allocated RAM and HW resources
that are to be mapped to dom0?

~Michal


