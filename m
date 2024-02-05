Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E3784975E
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 11:09:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675751.1051177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWvtf-0005s2-36; Mon, 05 Feb 2024 10:08:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675751.1051177; Mon, 05 Feb 2024 10:08:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWvte-0005on-Vh; Mon, 05 Feb 2024 10:08:14 +0000
Received: by outflank-mailman (input) for mailman id 675751;
 Mon, 05 Feb 2024 10:08:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VsQK=JO=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rWvtd-0005oh-21
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 10:08:13 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20621.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 770f01e9-c40e-11ee-8a45-1f161083a0e0;
 Mon, 05 Feb 2024 11:08:11 +0100 (CET)
Received: from SA0PR11CA0084.namprd11.prod.outlook.com (2603:10b6:806:d2::29)
 by DS7PR12MB9044.namprd12.prod.outlook.com (2603:10b6:8:e3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.17; Mon, 5 Feb
 2024 10:08:07 +0000
Received: from SA2PEPF000015C9.namprd03.prod.outlook.com
 (2603:10b6:806:d2:cafe::dd) by SA0PR11CA0084.outlook.office365.com
 (2603:10b6:806:d2::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.18 via Frontend
 Transport; Mon, 5 Feb 2024 10:08:07 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015C9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Mon, 5 Feb 2024 10:08:07 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 5 Feb
 2024 04:08:07 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 5 Feb
 2024 04:08:06 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Mon, 5 Feb 2024 04:08:04 -0600
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
X-Inumbo-ID: 770f01e9-c40e-11ee-8a45-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OjBIg7XzZ2YIUEJ/NT/J6rKc21Lfg06xyBcnMMpGqe36Ir/aePLT3uj8l0R5nSbPddCif2LJ5Vm4sC7f1Iz21PMbiP8+M15OHtUZBtsaEUiUpyZkEjbdDKglPyXgTfosFHL/oZPr6xKh8zgHGMK8LlWm08PtLTsg/CsYV+kJw+p8xT6qokZVQqxyMN0QwaANFMr6hIIvXf5KQNA09ELYDdljYeGTNpGVujJJ+soF20D+7PyEtMOghKmkcGmzUCGr6UNygZWj3IRCAesnjMuHAPWvaRZSTKETL1hJ6SAY4r0Enquc3atAYFQM+SEkAaEFmpYUnTyZKoObcSWUsr4IfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zt3qmdHsgtzsLYbX8ogEy8B8gjkmIE8jC21cSZOWJ1o=;
 b=XXIJbLAEFFwpsCfUoZHB7pkCyWXxHln5RpBgBMh6sh96JT7t7IVIiOkjv+qYLV9hIpqjfKpVeBAgRyVVUAzo5wsskrJCgKzCsfw4Gmg9+GP6Vum/8g+V7royyo1Q80DaMNGOGqPuoOkJpjzh8qyMKA4lawUToGwXLoo94ENfs0N8cpcC8NAfUqRORKKOxf2QtvwKHbpZ+dIHr7nMYwuRAqnAGfK0Lo8fc+n67JvbqUc8cKeIZKHiWgEHmKO1s8QAZ48gjkkbDaNgpCxHt2glMeoFnkm0/psabOynfMV6TcJGpVsx5dVteuEUraHrjJPSf//BtRV49idL5h3dtWjJMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zt3qmdHsgtzsLYbX8ogEy8B8gjkmIE8jC21cSZOWJ1o=;
 b=AfKCKa+k8tvU0gQrhGqZvv+VPvXdNJFGfUceHcOOi7QEGt3rnAU4zqKnQUnoY0RGv58NLm8x3dbigKH2wx7bhdHmxbzPfJnP4LgkIzGXiSu8I+hR9MWMQMILNNa0PfKpr70K9IyddTCQmT+S8qXunxez6qxkVdXNyfb1skgUXRM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <8867c445-2a34-4506-95e7-8eca4d91a364@amd.com>
Date: Mon, 5 Feb 2024 11:08:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/15] xen/arm: add support for cache coloring
 configuration via device-tree
To: Jan Beulich <jbeulich@suse.com>, Carlo Nonato
	<carlo.nonato@minervasys.tech>
CC: <andrea.bastoni@minervasys.tech>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Marco Solieri
	<marco.solieri@minervasys.tech>, <xen-devel@lists.xenproject.org>
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
 <20240129171811.21382-8-carlo.nonato@minervasys.tech>
 <a6ffb4a5-cd83-4c04-9e5a-12d605863b5d@suse.com>
 <CAG+AhRUG8nNF0cTtFYLu1TrV4fWEbix57Ah_-Zsz=U2yRWcGpw@mail.gmail.com>
 <26815df2-bfe5-4767-b1a6-94666e535f4e@suse.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <26815df2-bfe5-4767-b1a6-94666e535f4e@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C9:EE_|DS7PR12MB9044:EE_
X-MS-Office365-Filtering-Correlation-Id: 04571602-143a-4ad2-6e08-08dc263259cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FKFgWoZfNxCCEaPPxUy0U3qMsCRVb74QCOzrruZNq04/7vzOsptYRQ4YbY+PtH4wv+C4/lcnUqJ6mfKG7JOjvBnA+cagMCA4xML79sDrXZCXIUcJSeNDM3rJ21fluwIRLMIRHI7c33cg4pk+8fgDGpbfr2OB5LKkaf8LYNW669unthJd818P6delkLl62GOwDLw9ce3TjAvOEFBF9+hahrWHwRyjE98r/xIuLaKbskfJGXoyUjPg1OKl3X3QmnNzSzMzPUEEoEV5VCgPbmSA2McA7kWpyNcOc/1VoVRFLa3GzGWgVSeudbUY6HiZpr9PRwYG+KIW2qbt3emlIeU3fXdU6aI7Ys+c0ztoP9pvogEEvIdZu6lurvwOw5lOObsG2xk3MMt73ARZZ/kg3F/xOT6vwJNTd2/96NpmdG5G2ABDXljAiQN+Av//MoHw6WUd85ktRsPRjJrfajYKmXR4nh+D7F4N48G+V24DODAJZgmFgp56E6YOuVu4emhFy4exq4//r/CfclraPiRAicmNcfnehdbbed8zT5QARJk8tqG4IlnWr0JPI7nwq1vNwzeB2oybX23h+FUF/SGqZRRDUioWCKQ6mCXAV9izAHIsq7Gn2G0uN+Qo3oYuji2487548zpm0qrBNGPycc8gOsOJe3Zh+TqYcsI2lhhcHnareW0JJfGytSGv93wsUk/FUthi7C0/jWTgAAdrmmORNFiH9GO5DVlM7y/cTi6JwKwVYYWmKObvoAM1H1w98btjTvPQBUTjtZD7rR/zaAQTO80aE577bZpPiJ262jWgXl8qIMFxn52z2Z5aZzY2tqbXT2UA
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(136003)(376002)(346002)(230922051799003)(230273577357003)(82310400011)(451199024)(186009)(64100799003)(1800799012)(40470700004)(36840700001)(46966006)(41300700001)(8676002)(4326008)(5660300002)(31696002)(8936002)(44832011)(86362001)(54906003)(16576012)(316002)(478600001)(70586007)(70206006)(110136005)(356005)(2906002)(7416002)(36756003)(47076005)(36860700001)(82740400003)(81166007)(2616005)(53546011)(83380400001)(26005)(426003)(336012)(40460700003)(40480700001)(31686004)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2024 10:08:07.5932
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04571602-143a-4ad2-6e08-08dc263259cc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9044



On 05/02/2024 10:39, Jan Beulich wrote:
> 
> 
> On 03.02.2024 12:43, Carlo Nonato wrote:
>> On Thu, Feb 1, 2024 at 3:19 PM Jan Beulich <jbeulich@suse.com> wrote:
>>> On 29.01.2024 18:18, Carlo Nonato wrote:
>>>> @@ -950,6 +951,11 @@ void __init create_domUs(void)
>>>>  #endif
>>>>          }
>>>>
>>>> +        dt_property_read_string(node, "llc-colors", &llc_colors_str);
>>>> +        if ( !llc_coloring_enabled && llc_colors_str)
>>>> +            printk(XENLOG_WARNING
>>>> +                   "'llc-colors' found, but LLC coloring is disabled\n");
>>>
>>> Why's this just a warning, when ...
>>
>> This informs the user that this configuration will be ignored, but the DomU can
>> be constructed anyway...
> 
> Yet that's a violation of the principle that Julien had outlined when
> discussing whether to panic() in such cases. The property indicates to
> me that the domain ought to be run with coloring enabled, i.e. not much
> different from ...
> 
>>>> @@ -960,6 +966,11 @@ void __init create_domUs(void)
>>>>              panic("Error creating domain %s (rc = %ld)\n",
>>>>                    dt_node_name(node), PTR_ERR(d));
>>>>
>>>> +        if ( llc_coloring_enabled &&
>>>> +             (rc = domain_set_llc_colors_from_str(d, llc_colors_str)) )
>>>> +            panic("Error initializing LLC coloring for domain %s (rc = %d)\n",
>>>> +                  dt_node_name(node), rc);
>>>
>>> ... this results in panic()?
>>
>> ... while here we can't continue because there's some error in the
>> configuration and the DomU can't be constructed. Domains must have a valid
>> coloring configuration.
> 
> ... the request not being possible to fulfill here.
+1
If the user requests a certain functionality which cannot be fulfilled, we shall panic.
Take a look at e.g. sve, static-shmem, vpl011.

~Michal

