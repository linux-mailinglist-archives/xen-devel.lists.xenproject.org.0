Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1CC831345
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jan 2024 08:42:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668622.1040953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQN1W-0006Sd-1h; Thu, 18 Jan 2024 07:41:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668622.1040953; Thu, 18 Jan 2024 07:41:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQN1V-0006QX-UT; Thu, 18 Jan 2024 07:41:13 +0000
Received: by outflank-mailman (input) for mailman id 668622;
 Thu, 18 Jan 2024 07:41:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fkFQ=I4=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rQN1U-0006QR-4l
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2024 07:41:12 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee948da6-b5d4-11ee-9b0f-b553b5be7939;
 Thu, 18 Jan 2024 08:41:04 +0100 (CET)
Received: from SJ0PR13CA0036.namprd13.prod.outlook.com (2603:10b6:a03:2c2::11)
 by CH0PR12MB5076.namprd12.prod.outlook.com (2603:10b6:610:e3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Thu, 18 Jan
 2024 07:40:58 +0000
Received: from MWH0EPF000989E6.namprd02.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::8d) by SJ0PR13CA0036.outlook.office365.com
 (2603:10b6:a03:2c2::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23 via Frontend
 Transport; Thu, 18 Jan 2024 07:40:58 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000989E6.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Thu, 18 Jan 2024 07:40:58 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 18 Jan
 2024 01:40:57 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 17 Jan
 2024 23:40:57 -0800
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Thu, 18 Jan 2024 01:40:55 -0600
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
X-Inumbo-ID: ee948da6-b5d4-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mbq1xcK1FH10NHn/zTmvKMOAVvpCj+ZOXRm1l/pwWT06ZxB5wdnVOEb21vuR/TdXf9NcrouOe24LAhkU2iblsuxgmx6nbZCOhXBVvEHAJL6j1W5APw331Lh0IYfHKdFjxqr+Ea2UYAHDvfM80ItbxTh+tN5lI8tsOKhk1tcRDSt3e4qeVMiTmQhIOaVr2r2uWMrgtUa2xKR7x8xqKwlk5ZAS4DGtYb850/DAoIQ3xv4uPUhac5xrOEkMmkR3tUDakNjwhS147yr1I8dfaKsQhHp7lQwkx+44qecpm6KZ+6kp/nBokRH+z7N9o2vpW9GWZ7/mIoCyMRlW10BBS0LMXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PYOBW9RGvqeA5gUZTpF8Oe0snUioi8NAqH30tz8926k=;
 b=KxS7fpZGsLaGAqHz5BNUQsyluw6m7K7Tjr4uj7veKvETkZvH/UoRaYiDOdKmh3G5oM/0jqGrzGg24aLqX46qHU1QyeghgBBdrfVLfRgQCLaqKxe1jHuk7/dcd+Ekprisq85dFb+2DdV1pYcRik0N9jqPiHaW02QDCrpW5QGy9ZZekL01tuGp+/cxBKv5dru1OehGNxdc6eukLWszUxEgsb+KjsqGmAlOxMVxv/WL6Uv++tED8SFCWrgidJpBePYar0sGrgRJlw4C/cSjgwI8jdhEtdtzmJyUls62hsfBT8bi+xZVVyj60Fvy2IgRiKTRRriudC3AyGKFYtmSCzwi1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PYOBW9RGvqeA5gUZTpF8Oe0snUioi8NAqH30tz8926k=;
 b=44J8FxnMD41sNHRv6AjoGzwGaG+lWerY0ZJ3FcgDzn+BSNauEzGivXof/DfGJ+k0JlOKPKeNgtR7tq2i5XhVoMRUZfpgGG7dCaEwevt4USIvaVn2NajnvpsK91VvtspRXlnAeC9a0ddiWvX4NrFTHe4gu33QawTL7pmyd9iP55w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <1c23b4b7-8f34-4282-acd3-9bc7e4c09c4c@amd.com>
Date: Thu, 18 Jan 2024 08:40:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/11] xen/arm: add Dom0 cache coloring support
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Carlo Nonato <carlo.nonato@minervasys.tech>,
	<xen-devel@lists.xenproject.org>, Luca Miccio <lucmiccio@gmail.com>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Marco Solieri
	<marco.solieri@minervasys.tech>
References: <20230123154735.74832-1-carlo.nonato@minervasys.tech>
 <20230123154735.74832-4-carlo.nonato@minervasys.tech>
 <a7a06a26-ae79-402c-96a4-a1ebfe8b5862@amd.com>
 <alpine.DEB.2.22.394.2401171617320.2287888@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2401171617320.2287888@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E6:EE_|CH0PR12MB5076:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a20e9b7-a8e8-4665-0e3e-08dc17f8cfac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sF3EucSuMyIrvfCAacE0zq9sZWGooGCLBxlq4f4/a9fheRyetk40kILckZAiNCGGOkqL4fXEU9cgkN41SKIrgYVpR2/DcpwCHk8pzJbpluIkKpeL0CZI42w7yyPwy18mIUfJtFctbciJAqSeyyufjvRy1EeD5lqltFW7+bLCcveVJ5fU0CGsZ2IbkAbB4b3Dv67u8FhM5hS0Vu//LsN4UJfxf9XSU0WIyLx5+m/Tizu6YSgqmwYbLWD2ubGSTjLtzX3P/D/Rq3drmH6e9/cL8mxAg/aIkBSdt2PPxWwV8xsLQpL3EH+c9z3p4h1S8DHa8ZusbXSYZJsq6D4IZ20BQ9OwjlWp7wYZOQV9BAP1J+kl6hiqtqzuV4wZwPpTQlqJ0nBrP6TzB5DiG1i8dKUCB62Xjkk3+i1vGFgOXRmiyJ7CAIyuM6R4ZQXWT0BSwtm6lom5twKfI0NiwiRzFq19iImBTX5e5Uk00JYBsL8+HQIZnnf4S7vjOv6P74nUW1+ShXDpInJxDz76nF/OpHXYyLLSfLfZ0Bc2X4h3uRTlEl0GduDy4NvUC2c5iND2EhrLliYj5YUInhhg5hodUUN0txY8bHWNKwJiqqdeb3vdYyZWxYNlV//Ae0yKbCuMFjLv9Y4Ls/Xa6HK98O9eRsDUOMvNaBvDotZ9yTaUGAWmYDf7H/ree7CdO/Lzxd/vXoIkBzzlDMowgR8/3sbOViVs9tpzAzdd83XEqaidwG9OY4ci3B5vrLcPs/8lXD0N+AFHHlrWFyo1gPR2ZRYTRRs3gnZgpwlNS+M2JKLgVK3GKdr+H9Trsgd7ttjualFRzhhV
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(376002)(346002)(136003)(230922051799003)(186009)(451199024)(64100799003)(82310400011)(1800799012)(40470700004)(46966006)(36840700001)(31686004)(40460700003)(40480700001)(83380400001)(426003)(336012)(8936002)(8676002)(4326008)(5660300002)(47076005)(6916009)(53546011)(316002)(6666004)(54906003)(70206006)(70586007)(16576012)(478600001)(44832011)(26005)(2616005)(81166007)(356005)(82740400003)(2906002)(36756003)(41300700001)(86362001)(31696002)(36860700001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 07:40:58.1849
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a20e9b7-a8e8-4665-0e3e-08dc17f8cfac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5076



On 18/01/2024 01:23, Stefano Stabellini wrote:
> 
> 
> On Fri, 12 Jan 2024, Michal Orzel wrote:
>> Hi Carlo,
>>
>> On 23/01/2023 16:47, Carlo Nonato wrote:
>>>
>>>
>>> From: Luca Miccio <lucmiccio@gmail.com>
>>>
>>> This commit allows the user to set the cache coloring configuration for
>>> Dom0 via a command line parameter.
>>> Since cache coloring and static memory are incompatible, direct mapping
>>> Dom0 isn't possible when coloring is enabled.
>>>
>>> Here is also introduced a common configuration syntax for cache colors.
>>>
>>> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
>>> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
>>> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
>>> ---
>>> v4:
>>> - dom0 colors are dynamically allocated as for any other domain
>>>   (colors are duplicated in dom0_colors and in the new array, but logic
>>>   is simpler)
>>> ---
>>>  docs/misc/arm/cache-coloring.rst        | 32 ++++++++++++++++++++++---
>>>  xen/arch/arm/domain_build.c             | 17 +++++++++++--
>>>  xen/arch/arm/include/asm/llc_coloring.h |  4 ++++
>>>  xen/arch/arm/llc_coloring.c             | 14 +++++++++++
>>>  4 files changed, 62 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/docs/misc/arm/cache-coloring.rst b/docs/misc/arm/cache-coloring.rst
>>> index 0244d2f606..c2e0e87426 100644
>>> --- a/docs/misc/arm/cache-coloring.rst
>>> +++ b/docs/misc/arm/cache-coloring.rst
>>> @@ -83,12 +83,38 @@ manually set the way size it's left for the user to overcome failing situations
>>>  or for debugging/testing purposes. See `Coloring parameters and domain
>>>  configurations`_ section for more information on that.
>>>
>>> +Colors selection format
>>> +***********************
>>> +
>>> +Regardless of the memory pool that has to be colored (Xen, Dom0/DomUs),
>>> +the color selection can be expressed using the same syntax. In particular a
>>> +comma-separated list of colors or ranges of colors is used.
>>> +Ranges are hyphen-separated intervals (such as `0-4`) and are inclusive on both
>>> +sides.
>>> +
>>> +Note that:
>>> + - no spaces are allowed between values.
>>> + - no overlapping ranges or duplicated colors are allowed.
>>> + - values must be written in ascending order.
>>> +
>>> +Examples:
>>> +
>>> ++---------------------+-----------------------------------+
>>> +|**Configuration**    |**Actual selection**               |
>>> ++---------------------+-----------------------------------+
>>> +|  1-2,5-8            | [1, 2, 5, 6, 7, 8]                |
>>> ++---------------------+-----------------------------------+
>>> +|  4-8,10,11,12       | [4, 5, 6, 7, 8, 10, 11, 12]       |
>>> ++---------------------+-----------------------------------+
>>> +|  0                  | [0]                               |
>>> ++---------------------+-----------------------------------+
>>> +
>>>  Coloring parameters and domain configurations
>>>  *********************************************
>>>
>>> -LLC way size (as previously discussed) can be set using the appropriate command
>>> -line parameter. See the relevant documentation in
>>> -"docs/misc/xen-command-line.pandoc".
>>> +LLC way size (as previously discussed) and Dom0 colors can be set using the
>>> +appropriate command line parameters. See the relevant documentation
>>> +in "docs/misc/xen-command-line.pandoc".
>>>
>>>  **Note:** If no color configuration is provided for a domain, the default one,
>>>  which corresponds to all available colors, is used instead.
>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>> index f35f4d2456..093d4ad6f6 100644
>>> --- a/xen/arch/arm/domain_build.c
>>> +++ b/xen/arch/arm/domain_build.c
>>> @@ -2,6 +2,7 @@
>>>  #include <xen/init.h>
>>>  #include <xen/compile.h>
>>>  #include <xen/lib.h>
>>> +#include <xen/llc_coloring.h>
>>>  #include <xen/mm.h>
>>>  #include <xen/param.h>
>>>  #include <xen/domain_page.h>
>>> @@ -4014,7 +4015,10 @@ static int __init construct_dom0(struct domain *d)
>>>      /* type must be set before allocate_memory */
>>>      d->arch.type = kinfo.type;
>>>  #endif
>>> -    allocate_memory_11(d, &kinfo);
>>> +    if ( is_domain_llc_colored(d) )
>>> +        allocate_memory(d, &kinfo);
>> While doing some checks, I realized that the issue from previous series is still present.
>> Given that dom0 is hwdom, how are you going to prevent conflicts between allocated RAM and HW resources
>> that are to be mapped to dom0?
> 
> Are you referring to the address ranges picked for RAM region and how to
> make sure they don't conflict with something else (e.g. the MMIO region
> of a device)?
> 
> I thought that for dom0 we were reusing the same address layout of the
> host, so device MMIO would be mapped 1:1, memory would not be mapped 1:1
> (due to cache coloring) but it would be mapped to the same guest address
> ranges corresponding to RAM addresses on the host. Is it not the case in
> this version of the patch series?
It is not the case (see [PATCH v5 03/13] xen/arm: add Dom0 cache coloring support).
Hwdom would get assigned the normal Xen guest memory map. Instead we should map memory
to host RAM to prevent conflicts with MMIO and reserved memory (e.g. calling find_unallocated_memory
in hwdom case to retrieve host RAM excluding rsvm).

~Michal

