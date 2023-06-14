Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B20D72F8AB
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 11:06:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548598.856591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9MSD-0006cC-47; Wed, 14 Jun 2023 09:06:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548598.856591; Wed, 14 Jun 2023 09:06:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9MSD-0006Zp-15; Wed, 14 Jun 2023 09:06:13 +0000
Received: by outflank-mailman (input) for mailman id 548598;
 Wed, 14 Jun 2023 09:06:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6nJe=CC=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1q9MSC-0006Zj-5J
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 09:06:12 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b361548f-0a92-11ee-b232-6b7b168915f2;
 Wed, 14 Jun 2023 11:06:10 +0200 (CEST)
Received: from SN7PR04CA0043.namprd04.prod.outlook.com (2603:10b6:806:120::18)
 by DM6PR12MB4043.namprd12.prod.outlook.com (2603:10b6:5:216::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Wed, 14 Jun
 2023 09:06:06 +0000
Received: from SN1PEPF000252A3.namprd05.prod.outlook.com
 (2603:10b6:806:120:cafe::2a) by SN7PR04CA0043.outlook.office365.com
 (2603:10b6:806:120::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37 via Frontend
 Transport; Wed, 14 Jun 2023 09:06:05 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF000252A3.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.23 via Frontend Transport; Wed, 14 Jun 2023 09:06:04 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 14 Jun
 2023 04:06:03 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 14 Jun
 2023 04:06:03 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Wed, 14 Jun 2023 04:06:01 -0500
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
X-Inumbo-ID: b361548f-0a92-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bM4fc+MXfdyWgIAJWJWwlKEzNJy6pGJ75Gtj42xDtEq2erTZTCKpepMobh264yxEat/CHLlcvf6AXXRlPyYdYb4LDdYpsh7qQ/WtXQdUo4yL/beVAMhqyI/o5P5Vhgkdr3WH0MrEmAdXGrUZLUEzABBQftBKLWsz7iMs3kYty4o+K64MgGvbnzBC8+oLf0DKwpF1p9I7W2v8rZhT3rIpixoimmEV7Vn5Xt0L+wz1CzUWa4KrlvZtOndpj58sfX6qwtF/y6WPMjbTFr97ZwAW/TYAEXbujx/foe61zr7arSVlhmwYtWSzOmYRsWN0SxbAllf0vDCse6tRxvf1eEXAOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=STYl5yEiI795xS/21poxsmL38Aumxeui2Ad5+dtqIXQ=;
 b=XgR/UnxB0+kp95Oo7p4hGo985w5BfgU/nbwQBk69x0rE3+AgjmcFUS1Go4eQKSwvj9rySZh52yE5jl7QEpOg3EbNCDHU85zFHEvdjr2LWHRFKeba33UY6BXbSvIQcpJlJfxfZMV7OBvfQP8VDH4xx5UuwvIs+W0py0XaZ1oyV4xux0ctEnhcXqXLTdd7cQAteNsNYqCLCJabRv3o4MhFXpKhGBQfCj4DRKYhVOAD5cUF0qagKp8RvfL/Nh8z2hcMV1js7qGz+qHI7IpPwrmLNHDfznt56s2wqPsjqsuYVp2wctvV9B5HTKgwzEx16EmuUNpHIPC/BbeEQ3ZTorb4Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=STYl5yEiI795xS/21poxsmL38Aumxeui2Ad5+dtqIXQ=;
 b=JR1tLcaiOcOQJC702FgcN3PwCGxHvU71nuA+aFpPiD4cgBgt1aGK6rtRERv370sm7VBLGJv78wlXGXQny3u7m7yPLQOhPUrUC2L0+i7WCXE+Zscqqsp9TBfWxmYSItuq0TI1Smuxr9sF3LEKlsGmGKc/EbpI2cl6CBh4LlNHWdY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <ce65ba3c-c3c6-dd89-534b-2caaf52ba256@amd.com>
Date: Wed, 14 Jun 2023 11:06:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] xen: Append a newline character to panic() where missing
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230614073018.21303-1-michal.orzel@amd.com>
 <261ab0b0-91ed-e6b7-730f-0ecb8a7b5635@citrix.com>
 <e9353bd5-a0c2-0451-0c7c-8778b3c285f5@amd.com>
 <4925a406-3b06-792f-008e-77503ca230f0@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <4925a406-3b06-792f-008e-77503ca230f0@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A3:EE_|DM6PR12MB4043:EE_
X-MS-Office365-Filtering-Correlation-Id: c290c34b-bcac-463e-2d5c-08db6cb69575
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wrS5vLyhs9pMMsWxxhkA5iYnxlQZuOuNYrpx1RP6n9Q/61i/f9Evw4OQvzEh+XT1ptWFQSiJjJQiT8IyUOvBTl823nVmVK5q9LJmZlIczW2EKYg20odlKrEO2YeoPTP6zGrzgvXjU3Cygvj5axypl65Miym5umzwU8l05Qo14ke1iAHgrDTkdULNB+HGxbqFxBPv/PuTwu0GWZLd+mNVmfxV0pCbmureWxwFmd991YCh+6n3VC2SHHOa2dVTW7jHkPizlzHNERy0l5bPiLyyIXdGTcYzWbAzdF50vmFtw8ZBqzCkSJRWnRBrUF8pPkQH0lixDxbuhmzhR1eGHOaDZ5L8dw0OkLjKXx2Rk2+HIKWJMm7dTDSbrt5gqnrJTy2aQhBwy0h94BZTWh3Qchjj9oO7A6rzOdcM1bn88Vu3MPlej9Zd02UbDQVGEiRMSwjOFRllnWE+WTpFX7GtIbfCSAc3B4iIFNzcEgzVZDfYO1ZD5wnCL1bCvNUsA000odDkbaBjAfI8KkRC1V9GoKA/27o6wbxuCOdnY/Hp4cgutBWBQjiBvBGBPZWo+hd9uGCpdpTwMzyguyfS57G3LoXCnlojlVe8M9ym/nUA1xg7m/OVgkRVGiWJBYeP45hppie3NSFlJ3n9cErF+40Gl0RQUYKULSm/memfLteqIpVtERdHvUaWzVRqxptsBbvnLxPeCmO8wyW1uhsu4Bq8FzPTrlo+b5jxhLB6FhJ+KdJUEQaTpN/OwqX31FXk9QpSmxBXDKw3LjKlnnCV8KMC/8rMVJP3qWfAXjISxlFWJtixACuM06eXhMREzfKZ29pE7l97
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(346002)(136003)(451199021)(40470700004)(46966006)(36840700001)(47076005)(31686004)(70206006)(70586007)(4326008)(426003)(336012)(36756003)(186003)(54906003)(478600001)(110136005)(2616005)(2906002)(16576012)(8676002)(316002)(41300700001)(31696002)(82310400005)(86362001)(40460700003)(36860700001)(356005)(53546011)(8936002)(44832011)(83380400001)(82740400003)(26005)(5660300002)(81166007)(40480700001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 09:06:04.9764
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c290c34b-bcac-463e-2d5c-08db6cb69575
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4043



On 14/06/2023 11:02, Julien Grall wrote:
> 
> 
> On 14/06/2023 09:09, Michal Orzel wrote:
>>
>>
>> On 14/06/2023 10:04, Andrew Cooper wrote:
>>>
>>>
>>> On 14/06/2023 8:30 am, Michal Orzel wrote:
>>>> Missing newline is inconsistent with the rest of the callers, since
>>>> panic() expects it.
>>>>
>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>
>>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>
>>> although...
>>>
>>>> ---
>>>>   xen/arch/arm/bootfdt.c            | 2 +-
>>>>   xen/arch/arm/domain_build.c       | 6 +++---
>>>>   xen/arch/x86/cpu/microcode/core.c | 2 +-
>>>>   3 files changed, 5 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
>>>> index b6f92a174f5f..2673ad17a1e1 100644
>>>> --- a/xen/arch/arm/bootfdt.c
>>>> +++ b/xen/arch/arm/bootfdt.c
>>>> @@ -225,7 +225,7 @@ static int __init process_reserved_memory_node(const void *fdt, int node,
>>>>                                    size_cells, data);
>>>>
>>>>       if ( rc == -ENOSPC )
>>>> -        panic("Max number of supported reserved-memory regions reached.");
>>>> +        panic("Max number of supported reserved-memory regions reached.\n");
>>>
>>> Trailing punctuation like . or ! is useless.  Most messages don't have
>>> them, and it just takes up space in .rodata, the console ring, and time
>>> on the UART.
>>>
>>> I'd recommend dropping the ones you modify, and/or cleaning it up more
>>> widely.
>> I will keep in mind to do that in global scope in the next patch.
>> We also have quite a lot of printk() with trailing punctuation.
> 
> This is quite a bit of churn and I am unconvinced this is necessary.
> Also, if the others want such style, then this should be agreed on in
> the CODING_STYLE first. Otherwise, I am afraid this is not something I
> will enforce because I see limited value.
> 
I then suggest to take this patch as is if you are also happy with it like others.

~Michal

