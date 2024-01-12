Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B020682BEB1
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 11:39:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666757.1037629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOEwi-0003Qn-Gz; Fri, 12 Jan 2024 10:39:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666757.1037629; Fri, 12 Jan 2024 10:39:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOEwi-0003No-E2; Fri, 12 Jan 2024 10:39:28 +0000
Received: by outflank-mailman (input) for mailman id 666757;
 Fri, 12 Jan 2024 10:39:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=12w8=IW=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rOEwg-0003Il-Qv
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2024 10:39:26 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2405::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d96ae132-b136-11ee-9b0f-b553b5be7939;
 Fri, 12 Jan 2024 11:39:24 +0100 (CET)
Received: from DM5PR08CA0025.namprd08.prod.outlook.com (2603:10b6:4:60::14) by
 PH7PR12MB7890.namprd12.prod.outlook.com (2603:10b6:510:268::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Fri, 12 Jan
 2024 10:39:20 +0000
Received: from DS3PEPF000099D5.namprd04.prod.outlook.com
 (2603:10b6:4:60:cafe::63) by DM5PR08CA0025.outlook.office365.com
 (2603:10b6:4:60::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.23 via Frontend
 Transport; Fri, 12 Jan 2024 10:39:19 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099D5.mail.protection.outlook.com (10.167.17.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Fri, 12 Jan 2024 10:39:19 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 12 Jan
 2024 04:39:19 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 12 Jan
 2024 04:39:18 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Fri, 12 Jan 2024 04:39:17 -0600
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
X-Inumbo-ID: d96ae132-b136-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cnB2poUZDhMAVsGYYrPOOGujxWZKpTiQvJsL9tRgUIUzX+4wWyXcPM3lLlcQRnsGMPkdemjTd75kc3cCPNgp/4W3bOs6sREKvtAgaFIQnpNaMO6aLVAXWLMklzD9ub96RZRRIzNBv8ZrwKchKBUIyFbh8zzFrfoRdG9JaJEH15zWonvswA7M/NosZPiKRu0rUzmOecy7gSADpnvI0MMu+INhtDxH2KxccAHsKEUp2NIYx46QeTeV6yAsVQ0vpyq0sG4ab+6w+zZIpl1tFyBIPVVmcnda7qfQUvlcxw6XDn6Wy4tlERsPoeY8lPbt01wgxa3kqsc0DQIf+24wXhua1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zleXylavJ1CuW4VXEdB9REEC+cE6odoh5gtbbdbr0v8=;
 b=V6e8OmW61opnEPb2+Beh6m1DpyKeXyfFKvoOzPl/2sttGUktjvfe/GCOcMAG5YziXxOJ7XaGxspUybcSAtWgiNrpJHHbzIpkSaDMcH4x6U9m634BySn+/IYXgtmUsWwB29dFnqA1fgUI8JNKDHw5LaijDwOBB2MRSbnL100RAU2jYhU2Cc2vl4FYJqWbYp0Gd0h45MPaj5fpExuuCQYJKHN+E0U5o59BbqVQPhQIePHUvMhImxsXK7hySOeF6KBZEAFXL1mSm0OiB29d0v4BAk+aFVI7M8bns2+Ql6AJ1nA+bNv9E3oN2eYecMrf5MyESy+Q8rILFgALQtELIrB+Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=minervasys.tech smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zleXylavJ1CuW4VXEdB9REEC+cE6odoh5gtbbdbr0v8=;
 b=e1Z9AJDM/8MMXqxvSqyEHL+ms4YBJ6BecDbenu2o/ggT66qzPL9V7TCc/azFo59+3azo+eQf8HmVZnpNsVaTti3eOfnuVsRY4snhP6y2fEUJDP0N5KUa7QCaCW9GfPdUYxKqm7ZXaXggWdrncjRZ5VZ7PWPfmTcG5bwa8cz9FcM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <5b1e66d3-84fb-4d88-869e-c16469029fe6@amd.com>
Date: Fri, 12 Jan 2024 11:39:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/11] xen/arm: add Dom0 cache coloring support
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
	<xen-devel@lists.xenproject.org>
CC: Luca Miccio <lucmiccio@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Marco Solieri <marco.solieri@minervasys.tech>
References: <20230123154735.74832-1-carlo.nonato@minervasys.tech>
 <20230123154735.74832-4-carlo.nonato@minervasys.tech>
 <a7a06a26-ae79-402c-96a4-a1ebfe8b5862@amd.com>
In-Reply-To: <a7a06a26-ae79-402c-96a4-a1ebfe8b5862@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D5:EE_|PH7PR12MB7890:EE_
X-MS-Office365-Filtering-Correlation-Id: 91fefc03-23ed-4a09-48bb-08dc135abba3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kNPZzjZgtYmHnF2EfrRhH5eIjy135mNSpetGCT836mL+r6i+QfffSlCN97YMW+wFEp44bczlCsH1mdDoOYjxy0muE+tf2O32xq4zyiFkLi+xk2vH7tMeMOBHi9Dqa6eUDL+HvZU5TedYMuN7ayuR887AgqCuEEQcwQWo6Oxf3LB+pZPqAPxg6J7WVIttrvB8Sq1vYOMJFdwHKj6XL/UFJApuLbJ31t9y9v6rTx4y5u9T88zCK0LX9FH7Ghkc1QTw71D2bO9Ni9FtSEs/X8vEIXHEAoEzjR6E/H1/k+YDIbKNthoAF9MvDya2erG2TssWUUnErz4WZE1S2hrQcAZVjYu8fhpv+tRJJY6FxEfNjhhNDnSsT6jBR9ID8xEfTcgXXMOOqaYqI1kJ98X3noxvbBIKJAeKasvDYS+y4OP4I2L+2Jt4iw7auj6NGtV0rsGC31qm0GE+9hEEBG7jT6PiLM/+0m+W9afgbxYriAJjDtMGq+v0zQzqRzFEvC70RIRIy1SCy72KWO5RfvO7V4ZwSiY49IjvJwcIAUebNgTTcxFWrj52rktsYKigvWz/SR0oZ+lW1gGtZQ26z5xCEenLt8tXuPwlcqY5G3aQ2gjiEc1zk+IZdlgs/bYeQsYJWcruKkexoPmJtU6H0CC8wTB6unE/r4ZB4L20g4KOc5/R+NX6G1KYIVeAi17vHXZwlhem8CAgxhF+7uyZOEJ/BTqGqdEu7FqmwL5vHPlwM+qx1/qc493c3lA3RH+8QRJyJ4LIqZiF/P3KIBkdizAMuTi7ZUDVaAIn3e2n2BSjQscrvVOPXL+7bFCKPU5HFpbrEEU8
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(396003)(136003)(376002)(230922051799003)(1800799012)(64100799003)(186009)(82310400011)(451199024)(36840700001)(40470700004)(46966006)(31686004)(40480700001)(40460700003)(83380400001)(81166007)(70206006)(41300700001)(70586007)(36756003)(356005)(31696002)(86362001)(36860700001)(82740400003)(54906003)(47076005)(426003)(316002)(2616005)(26005)(53546011)(2906002)(5660300002)(44832011)(16576012)(478600001)(336012)(8676002)(8936002)(110136005)(4326008)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 10:39:19.5011
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91fefc03-23ed-4a09-48bb-08dc135abba3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7890



On 12/01/2024 10:24, Michal Orzel wrote:
> 
> 
> Hi Carlo,
> 
> On 23/01/2023 16:47, Carlo Nonato wrote:
>>
>>
>> From: Luca Miccio <lucmiccio@gmail.com>
>>
>> This commit allows the user to set the cache coloring configuration for
>> Dom0 via a command line parameter.
>> Since cache coloring and static memory are incompatible, direct mapping
>> Dom0 isn't possible when coloring is enabled.
>>
>> Here is also introduced a common configuration syntax for cache colors.
>>
>> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
>> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
>> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
>> ---
>> v4:
>> - dom0 colors are dynamically allocated as for any other domain
>>   (colors are duplicated in dom0_colors and in the new array, but logic
>>   is simpler)
>> ---
>>  docs/misc/arm/cache-coloring.rst        | 32 ++++++++++++++++++++++---
>>  xen/arch/arm/domain_build.c             | 17 +++++++++++--
>>  xen/arch/arm/include/asm/llc_coloring.h |  4 ++++
>>  xen/arch/arm/llc_coloring.c             | 14 +++++++++++
>>  4 files changed, 62 insertions(+), 5 deletions(-)
>>
>> diff --git a/docs/misc/arm/cache-coloring.rst b/docs/misc/arm/cache-coloring.rst
>> index 0244d2f606..c2e0e87426 100644
>> --- a/docs/misc/arm/cache-coloring.rst
>> +++ b/docs/misc/arm/cache-coloring.rst
>> @@ -83,12 +83,38 @@ manually set the way size it's left for the user to overcome failing situations
>>  or for debugging/testing purposes. See `Coloring parameters and domain
>>  configurations`_ section for more information on that.
>>
>> +Colors selection format
>> +***********************
>> +
>> +Regardless of the memory pool that has to be colored (Xen, Dom0/DomUs),
>> +the color selection can be expressed using the same syntax. In particular a
>> +comma-separated list of colors or ranges of colors is used.
>> +Ranges are hyphen-separated intervals (such as `0-4`) and are inclusive on both
>> +sides.
>> +
>> +Note that:
>> + - no spaces are allowed between values.
>> + - no overlapping ranges or duplicated colors are allowed.
>> + - values must be written in ascending order.
>> +
>> +Examples:
>> +
>> ++---------------------+-----------------------------------+
>> +|**Configuration**    |**Actual selection**               |
>> ++---------------------+-----------------------------------+
>> +|  1-2,5-8            | [1, 2, 5, 6, 7, 8]                |
>> ++---------------------+-----------------------------------+
>> +|  4-8,10,11,12       | [4, 5, 6, 7, 8, 10, 11, 12]       |
>> ++---------------------+-----------------------------------+
>> +|  0                  | [0]                               |
>> ++---------------------+-----------------------------------+
>> +
>>  Coloring parameters and domain configurations
>>  *********************************************
>>
>> -LLC way size (as previously discussed) can be set using the appropriate command
>> -line parameter. See the relevant documentation in
>> -"docs/misc/xen-command-line.pandoc".
>> +LLC way size (as previously discussed) and Dom0 colors can be set using the
>> +appropriate command line parameters. See the relevant documentation
>> +in "docs/misc/xen-command-line.pandoc".
>>
>>  **Note:** If no color configuration is provided for a domain, the default one,
>>  which corresponds to all available colors, is used instead.
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index f35f4d2456..093d4ad6f6 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -2,6 +2,7 @@
>>  #include <xen/init.h>
>>  #include <xen/compile.h>
>>  #include <xen/lib.h>
>> +#include <xen/llc_coloring.h>
>>  #include <xen/mm.h>
>>  #include <xen/param.h>
>>  #include <xen/domain_page.h>
>> @@ -4014,7 +4015,10 @@ static int __init construct_dom0(struct domain *d)
>>      /* type must be set before allocate_memory */
>>      d->arch.type = kinfo.type;
>>  #endif
>> -    allocate_memory_11(d, &kinfo);
>> +    if ( is_domain_llc_colored(d) )
>> +        allocate_memory(d, &kinfo);
> While doing some checks, I realized that the issue from previous series is still present.
> Given that dom0 is hwdom, how are you going to prevent conflicts between allocated RAM and HW resources
> that are to be mapped to dom0?
Sorry. I answered to the wrong revision :)
Anyway, the remark still applies to v5.

~Michal

