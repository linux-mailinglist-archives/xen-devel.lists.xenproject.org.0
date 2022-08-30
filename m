Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 572B25A5BD8
	for <lists+xen-devel@lfdr.de>; Tue, 30 Aug 2022 08:30:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.394820.634377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSukh-0007AH-Rp; Tue, 30 Aug 2022 06:29:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 394820.634377; Tue, 30 Aug 2022 06:29:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSukh-00078P-NP; Tue, 30 Aug 2022 06:29:35 +0000
Received: by outflank-mailman (input) for mailman id 394820;
 Tue, 30 Aug 2022 06:29:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bSYc=ZC=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oSukg-00078J-45
 for xen-devel@lists.xenproject.org; Tue, 30 Aug 2022 06:29:34 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2078.outbound.protection.outlook.com [40.107.93.78])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b0f8548-282d-11ed-9250-1f966e50362f;
 Tue, 30 Aug 2022 08:29:31 +0200 (CEST)
Received: from DM6PR21CA0017.namprd21.prod.outlook.com (2603:10b6:5:174::27)
 by CH2PR12MB4039.namprd12.prod.outlook.com (2603:10b6:610:a8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Tue, 30 Aug
 2022 06:29:28 +0000
Received: from DM6NAM11FT106.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:174:cafe::72) by DM6PR21CA0017.outlook.office365.com
 (2603:10b6:5:174::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.3 via Frontend
 Transport; Tue, 30 Aug 2022 06:29:28 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT106.mail.protection.outlook.com (10.13.172.229) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5566.15 via Frontend Transport; Tue, 30 Aug 2022 06:29:28 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 30 Aug
 2022 01:29:27 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 30 Aug
 2022 01:29:19 -0500
Received: from [10.71.192.107] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Tue, 30 Aug 2022 01:29:18 -0500
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
X-Inumbo-ID: 1b0f8548-282d-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n08m62TXfnmHVSNgg9yRb+K1lmukoIVJMid4vGdF8/pqdw4IGSz1/6gqo06LDKOhoqkar7uBfqDexl6cMbBjt6E8GlhHmR4PPTjqfuGYCn4abQ9Udwlgqxsl5YyiFIZbBllU9ZyEb9HreXiOZdFQXJ3QjcO6C0hKRK+Lx82Pw1MH0UguWGmI5wq1kT57HANmaWIfpmii0xL+KArZJ4u7gYRlOuu8Ii5H2KrC0jeGudpY+OU3WwCkIabK0jbOkJAsUPLiS6lyFuJfv+PIYYsF+tRj9oqFdQ9UU64aGAKzgQFhTksr+fYmRrISNcDLtdqxRd9lvmTNBVlm159Ao8cBOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YyajryxF180DWmJgAewL5x7UrRMojQKX3SP65hVH3hw=;
 b=bP4PIJpG1lF2htqwUmeI+KtMvrh6QGjtBd+MahixrHj9Psr626MnRnJP+2wLc5+wrUHioXxWgJe5ptOaY5+cNWLUjBUCP7CNaORm8QonEF91iVaLMrhYGyX9m6ctZdErbUisZt3NSRu5hxBYce6lOU/1x8w92Xstfq5jAYqVG/OmaSs/xftRVINrj/pHyOIKCJSJUA+26Zz3V+V9JAKdXlhRsu9fVgWMiySRTd3vtPV+yrKh+xTJffbhmSKD10qwus+nC0HXA3w5S8eSf/SWqXr/FhH96FI93lcbSsvBEgCle0OUx/CJGuulnORmYEcUY+y9/QHdUQc0OGbTymgrgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YyajryxF180DWmJgAewL5x7UrRMojQKX3SP65hVH3hw=;
 b=StY5/PKXKK/Vs2O0GpDXW6XOa53nfe14eSfJQugA3Ounh5llIo59AW1d1w+I14iIOy0dGbnuj+L8A3nN6rrqQQQu9TP1QknA8p72ZTIlOX6BXVTfVIN1u2E55cXnIuKOXhRQ9HM/5ldT0JlBt/BDE5kbiUUGF/PueAT3w2Cudzk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <e02175e4-0930-012e-8e79-d4ac8d3be78b@amd.com>
Date: Tue, 30 Aug 2022 08:29:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 1/2] docs, xen/arm: Introduce reserved heap memory
To: Henry Wang <Henry.Wang@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei
 Chen <Wei.Chen@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Penny Zheng" <Penny.Zheng@arm.com>
References: <20220824073127.16762-1-Henry.Wang@arm.com>
 <20220824073127.16762-2-Henry.Wang@arm.com>
 <af2f8888-7223-429e-cc7e-b0950f759608@amd.com>
 <AS8PR08MB7991A2A6EF808136FBF090F392729@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2208291745550.1134492@ubuntu-linux-20-04-desktop>
 <AS8PR08MB7991EC7FAD3D1EDBD379D9C892799@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <AS8PR08MB7991EC7FAD3D1EDBD379D9C892799@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0305d921-6358-496c-6d6f-08da8a50fda6
X-MS-TrafficTypeDiagnostic: CH2PR12MB4039:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZkrIM9sDihlOb7YLb7D5WGhBkNSYXRB5IvcBz1WVYMCt58MOvq5K1/Yb/4GPS8u4JqIOwliFLdXatXLuHyFDN9TNjSj5tPqNu70Hl6Ts4RE4bQ8zKzEq9SBbQAKYUCMDmt11Kw9yGOBgR/kPIQeGLCVNIoUZWIET6hJZAr0C1qGc9GmiINerD6SXzJMWblfHp2iQXQ8E/uBF7lm12kjM6pjHXcPMISFlB9NdsS91zee7NUxAd4YYkIgnaOJHliAHOJpnIk8FoIevuDIP2Alxlz+3MDkVgOlYJA7c+op3zVyH0s1GjaJJ0eCMatd4xol7SJGy/pT8DMgfCrJxkR82THXzSXdmcrx/QV4SFEokGZNx21B8LmAjqQopr7Ic1/3gpeA7CcFQ0Wnv5Q+SYBL7AXY2up3MZZqVf8RyUCOuf3rtsnRYAi8R6zalOQL/4ZH4Bz3Wzp+Ergve6YKi/rZxM1JaDhXHn3E/wjWPzLM4PPNxULCLfLjuZDHZQEjIPt5A6+jN57aEn0lVyxbfr9FXXfAWicG3mlmqGsBPV7IQr0rRzgBZnF0V4EHOx2fjSRiuQlQoqmKmYx9/HAMAgMDWUn/2CPDxkGTdRI6eOmoVQGie1e5K8IaSIgSp0XHpc5fULKygyv1X9KpY+fHiYv9XWCpA6Yh0uAy+EufzrhfO5SsLzrBO2uUdPTFcnBL+YdUz6VIGJ3q4A9iuWKN7iudHztQxwwHdEFtG4v32zswpHqsWlQODyIS3h4oBAM61sA9sxmzNDERCr6HcG3MQf9MHLpJ+OIfquyz+tMvl2aR36XGwoMU4vmSs9lNYep/+TccHl20R8nWSGGhwWblOs9+rYw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(39860400002)(346002)(376002)(46966006)(40470700004)(36840700001)(5660300002)(110136005)(31686004)(8936002)(8676002)(54906003)(4326008)(2616005)(47076005)(426003)(36860700001)(70586007)(316002)(36756003)(16576012)(2906002)(44832011)(31696002)(478600001)(41300700001)(86362001)(26005)(53546011)(82310400005)(70206006)(81166007)(40480700001)(83380400001)(356005)(186003)(336012)(82740400003)(40460700003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2022 06:29:28.2968
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0305d921-6358-496c-6d6f-08da8a50fda6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT106.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4039

Hi Henry,

On 30/08/2022 02:58, Henry Wang wrote:
> 
> Hi Stefano and Michal,
> 
>> -----Original Message-----
>> From: Stefano Stabellini <sstabellini@kernel.org>
>> Sent: Tuesday, August 30, 2022 8:47 AM
>> To: Henry Wang <Henry.Wang@arm.com>
>> Cc: Michal Orzel <michal.orzel@amd.com>; xen-devel@lists.xenproject.org;
>> Stefano Stabellini <sstabellini@kernel.org>; Julien Grall <julien@xen.org>;
>> Bertrand Marquis <Bertrand.Marquis@arm.com>; Wei Chen
>> <Wei.Chen@arm.com>; Volodymyr Babchuk
>> <Volodymyr_Babchuk@epam.com>; Penny Zheng <Penny.Zheng@arm.com>
>> Subject: RE: [PATCH 1/2] docs, xen/arm: Introduce reserved heap memory
>>
>> On Thu, 25 Aug 2022, Henry Wang wrote:
>>>>>                                         const char *name,
>>>>>                                         u32 address_cells, u32 size_cells)
>>>>>  {
>>>>> @@ -301,16 +303,40 @@ static void __init process_chosen_node(const
>>>> void *fdt, int node,
>>>>>      paddr_t start, end;
>>>>>      int len;
>>>>>
>>>>> +    if ( fdt_get_property(fdt, node, "xen,static-mem", NULL) )
>>>>> +    {
>>>>> +        u32 address_cells = device_tree_get_u32(fdt, node,
>>>>> +                                                "#xen,static-mem-address-cells",
>>>>> +                                                0);
>>>>> +        u32 size_cells = device_tree_get_u32(fdt, node,
>>>>> +                                             "#xen,static-mem-size-cells", 0);
>>>>> +        int rc;
>>>>> +
>>>>> +        printk("Checking for reserved heap in /chosen\n");
>>>>> +        if ( address_cells < 1 || size_cells < 1 )
>>>> address_cells and size_cells cannot be negative so you could just check if
>>>> there are 0.
>>>
>>> In bootfdt.c function device_tree_get_meminfo(), the address and size cells
>>> are checked using <1 instead of =0. I agree they cannot be negative, but I
>> am
>>> not very sure if there were other reasons to do the "<1" check in
>>> device_tree_get_meminfo(). Are you fine with we don't keep the
>> consistency
>>> here?
>>
>> I would keep the < 1 check but it doesn't make much difference either
>> way
> 
> I also would prefer to keep these two places consistent and I agree Michal is
> making a good point.
I'm ok with that so let's keep the consistency.

> 
> Kind regards,
> Henry
> 

~Michal

