Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EC7A57522
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 23:49:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.905413.1313247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqgUC-0007Aw-Mt; Fri, 07 Mar 2025 22:48:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 905413.1313247; Fri, 07 Mar 2025 22:48:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqgUC-00078B-JP; Fri, 07 Mar 2025 22:48:08 +0000
Received: by outflank-mailman (input) for mailman id 905413;
 Fri, 07 Mar 2025 22:48:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0EBm=V2=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tqgUA-000781-Sw
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 22:48:07 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20631.outbound.protection.outlook.com
 [2a01:111:f403:2413::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b12749a-fba6-11ef-9ab7-95dc52dad729;
 Fri, 07 Mar 2025 23:48:04 +0100 (CET)
Received: from CH2PR11CA0021.namprd11.prod.outlook.com (2603:10b6:610:54::31)
 by PH7PR12MB6761.namprd12.prod.outlook.com (2603:10b6:510:1ab::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.23; Fri, 7 Mar
 2025 22:48:00 +0000
Received: from CH2PEPF00000144.namprd02.prod.outlook.com
 (2603:10b6:610:54:cafe::fa) by CH2PR11CA0021.outlook.office365.com
 (2603:10b6:610:54::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.19 via Frontend Transport; Fri,
 7 Mar 2025 22:47:59 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF00000144.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Fri, 7 Mar 2025 22:47:59 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 7 Mar
 2025 16:47:58 -0600
Received: from [172.20.156.222] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 7 Mar 2025 16:47:58 -0600
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
X-Inumbo-ID: 3b12749a-fba6-11ef-9ab7-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xdV71i+MzBVEkUteJffQd3eqwbJFJKC3z4ia93/371RwNqnVVHljahEXtt/VoJVK4ByIiyVR+7jYDY69Ky+FVKkIt7+v66XPFzdQekg1ad/vPvOgV6aEjlcfuhYkMc31Fq2AvIBwM+JmZUn6GRryZa69Yda2cmFdOF++GmlLXcpdcbZDiE1tzyttnn4neK7s8HYQZvNnJnZuOHBSiB25kcjq21Qkshssy5tEZUMybNNCyKRMieZX390BQoqanwR0xJRUWcB1ycck3ggxKn8T5xr/Kco/FdGC+8rzYtmq6oU7Zf9/XH1mvNEFo9EFFISaFy93lKfFLhuFMnmdxtcjBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yoUlJ8X5hl1jeeavFHiCEieoAxqW6zpyrFe/OYUoKpQ=;
 b=bYekx8H9MqtqT9ShHMd6WG0zDQVyNLpAt6ZULGvFBzAcniBJLwpqDSM89bwYw5gbXd89m3vm1g5NhUjkveG+zQELN6t6HzSJABs6GfAWtaLf6WJo/wtzJJGbgc/dclGDGERPEf/bG4Gqkp8GBfuhzOhkDRhY8VLRCAqiZNYalYZ61H7YKux9LlLXetDj4Qm/J7qjQOtuCXSOaV0WYbMKmbrnrKOuqfX/sc4kp8K7KurEb6yhjYG3qtTRzRT5NyPY+fJRMV71+mgHR/ik3Xax2jwP2tt/kLs0fuy1fbi4kyh0+BWfTP9HEte7VZUsVWzz8cqfeIGSjJrerjZssxjnQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yoUlJ8X5hl1jeeavFHiCEieoAxqW6zpyrFe/OYUoKpQ=;
 b=KIUHXnpjpcIpCoaOFZU8VMmdhN+6w+9SJ+HhSmvGQZUffVELFhj+IQqtjiRhs6J1LPZh503KyxsrVH8QbkGzvWPYt4GjnUqXyQEySHsvL0sBC8Bmg8saaM0UFd/u60H1CNhrat27f6AGVQ9o1OFDKAqi0LRYV3m5LvhfKOXPQHo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <ba5b9675-fa62-4872-b969-e5ecc917a087@amd.com>
Date: Fri, 7 Mar 2025 17:47:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/23] xen/arm: dom0less use domid 0 for hwdom
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-5-jason.andryuk@amd.com>
 <4ee02463-c413-4afc-add6-d7bf3915dd5a@xen.org>
 <734d9fdf-a201-4a46-9739-26a474683b10@amd.com>
 <39540c8b-e43d-4315-bc34-a61ac6cb1d70@xen.org>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <39540c8b-e43d-4315-bc34-a61ac6cb1d70@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000144:EE_|PH7PR12MB6761:EE_
X-MS-Office365-Filtering-Correlation-Id: 40862fc8-90f1-4930-bf0c-08dd5dca1c3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cnIzK08zUWVVOEh0SWZCc1ZFcHpnOUhpVjV5R25GRGFCQWkxVzNqd04ybHFB?=
 =?utf-8?B?NDJMWFZLZHRDR1ZnUWZ2N0tlM1QySzlxL0RuMmtTK05rdllYSXRwZHhwTlk3?=
 =?utf-8?B?Vk5zQUF4cTZWVVJzTFZ5ajhoTXNMVUNxMzhPM1htejl0Y2xpWk5NYUpmQUFT?=
 =?utf-8?B?MS80VDRscFRjU1UvQnpFYVUyWFNYS3o3NVg5ZlZYUitQL1dhSTFwZ1hNUkha?=
 =?utf-8?B?ZVI1NTdxeW9XRlBhS2U3Rlo3RkY2QlVqYnYwR0twT2NPV3VybDBxRjh2M2Vr?=
 =?utf-8?B?aWsySmRpdXFzenExRXBwWGFlSCtpeXNhcGZvbXJKZGNNSmJPbVBVTXNBbHlo?=
 =?utf-8?B?VDNLNXRGMjNURHpFd3lVckVCdldweURIZ2JKSUMyaHRFZXFMS3R2RzNFdmN3?=
 =?utf-8?B?Q3g0WWFncFJnZjdzRTZkeGV4UEQxUEZXQko3YzBwcFFDMlhkZVRpUHJtZXV6?=
 =?utf-8?B?MExjckhHd0RuWnVkd1F3K3BpdmR1NFkzT0k2enBqZVNaZFNxYU5ZTVoyT3ZY?=
 =?utf-8?B?aFk1ek10R3FjdWdJaGJURkpZQnRNUG9NVWo3aTdXUlNGN0QzNjQ1WmRSanJ1?=
 =?utf-8?B?a0kvWWR1TWRpUDV0OXlmbWorV0ZMbXNUOU4zVDhINFBjZk9wSjFvK2xyeVNJ?=
 =?utf-8?B?dFdwTENHbWJQVmpidDRLR1FxaVJ4OElac2tEaEJ3TVkzVzBXaDhHNW5rdk9L?=
 =?utf-8?B?Mi9YTU9zRC81MHM2WmliNitaWTZ3NjlYZWJQWjk1M0VmWGlIdEdkcGlXNFlk?=
 =?utf-8?B?WDh2L3k0NFExWVFaUVU2V3Q1WjhxcGFabWQ0YnVCY09LbDFnV1FDV05hZFVt?=
 =?utf-8?B?VEhBeENRVlVoOHArVGZTc2t0dnVxckJla2dlZjEvWThUc1BIZW5YYzZHSU5q?=
 =?utf-8?B?RkZWOHlGYy81QTdJM0xabUcvKzFBYnVGbFh3ZW5aSlJ0WUZHYWNJd1dmdWF6?=
 =?utf-8?B?cUdIR2dlbXV5c01ubjNDWmt1djNtM29wQyszNzNpYVVCbThJSnlDcXIvckk1?=
 =?utf-8?B?NTBodStOSTdVUmdsQjVSU2kveHZ1M3NudTRNamtsdXlOZ1Nyc1I1M3VBT0FV?=
 =?utf-8?B?N1hjWjZaeU5yaklHQXpCbi9RNVNYakVhSkZMTm9Sck9uV3dUU0s4QnJHcVFy?=
 =?utf-8?B?dWRQZGFDZ3BNOTg0WEsrcEZUOFFJcTVRMmZERGtkRU9NZkYzblcrY3RzT0xv?=
 =?utf-8?B?U1ZVSUJ6UnNzRjg5dVUvQ1RkZ2JUeTQ4YnNOaCtiUWxaSjZuQVR1blpIeENV?=
 =?utf-8?B?aEY4RjlYSXNvMEQ3WWNyZ0Z5U0laeVF2ODFSOVM1T0hsSWY5U2xKU0llY0Ix?=
 =?utf-8?B?aFd3TnlOREoyMnZYYjlDZVZkVGcxNzVCeFk0OENITkkwSUVBdGtYclE3SGd1?=
 =?utf-8?B?T29kaGppYVNGWXJNcE41KzdQakh3ZDFrRGExUkt0ZDkvR2NzTi9yaTA3UUxV?=
 =?utf-8?B?bWlXZmpxbFloaHkyR3g5SlN1dDdZakRiTTBFZ3RxZVljL2lmNGNOa0I1S2kv?=
 =?utf-8?B?NXhQNmgyTG8rdXhmOGJMRmU4ZDJOaUVEdHZ4RWt4aGJmUEdQWnZXUmNGc2k4?=
 =?utf-8?B?Uk0zemRaYnhDRlBPTm5Vc0NSUW9OUlVMN0NQZVErRml5UFNpTFc1V3VnckIy?=
 =?utf-8?B?dE9NTDNkUjZLOCt1elJkMk83Y1V2SlVKd2diNkdGK2ZvUStwNXd4UWJDU00w?=
 =?utf-8?B?WnA0OW80b01QVFFRQkR4eU5UOVY4WUE0L1IxamxXM2VpaXdjUjk4ZHByTnV1?=
 =?utf-8?B?cEVzeDZRa3lFY2djWUlReWRaRHJrSVFWcFJodlZoU2czS0tJdG1BWUJrSktK?=
 =?utf-8?B?aDlEelVXazIwYVlncTErOFcrSURuN1htU0tZNE9IMXhIZ2tUYWZvU1Ftbmkz?=
 =?utf-8?B?MWNEMlc5S0hPZlo1NFY5bTdWeFhIbFdUMS96MGdXNGNQREw1andnaXB5ZXRZ?=
 =?utf-8?B?bDlEQ2Z0MGlhdE9BbmVrSUhBWm5jMDRpWjQrNmQ5MDVVQ051S3VqbS91bVNX?=
 =?utf-8?Q?wYBiT6n6QaAsKEXggAgbAJRxuh4ZqE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 22:47:59.4086
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40862fc8-90f1-4930-bf0c-08dd5dca1c3a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000144.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6761

On 2025-03-07 16:01, Julien Grall wrote:
> Hi Jason,
> 
> On 07/03/2025 16:03, Jason Andryuk wrote:
>> On 2025-03-07 03:31, Julien Grall wrote:
>>> Hi,
>>>
>>> On 06/03/2025 22:03, Jason Andryuk wrote:
>>>> Assign domid 0 to the hwdom.  Normally, dom0less does not use domid 0.
>>>
>>> A few years ago, we went to great length to avoid making the 
>>> assumption that the hardware domain is domid 0. See all the calls to 
>>> "is_hardware_domain()". So I am reluctant to force the domain ID to 0.
>>
>> I was disappointed when it didn't "just work".
>>
>>>>
>>>> This fixes using the Xen console which assumes domid 0 to use the
>>>> hypercall interface.
>>>
>>> I had a brief look at drivers/char/console.c and I can't find any 
>>> place assuming "domid 0". Do you have any pointer?
>>
>> As Jan pointed out, Denis Mukhin's patch removed the domid 0 
>> assumption.   This was developed without this patch when it mattered.
>>
>> I tested before posting without this patch (and with Denis's), and 
>> again now, and I didn't get a hwdom login.  Turns out xenstored was 
>> assuming domid 0.  Changing that with --master-domid gets to the login 
>> prompt.
> 
> Hmmm, I am not sure --master-domid should point to the hardware domain. 
> Instead, it feels like it should be the control domain because it needs 
> to manage the VMs so needs to create any nodes in Xenstore.

--master-domid encompasses "the domid where xenstored is running" (which 
really xenstored should figure out itself), and is needed for xenstored 
to start.

There is an additional --priv-domid, which can point at the control domain.

>>
>> Still, there are now other userspace errors.  xen-init-dom0 hardcodes 
>> domid 0 which doesn't exist. 
> 
> I am confused. Why would you call xen-init-dom0 in a domain that is 
> meant to be the hardware domain rather than dom0?

I was using domid 0 :)  Also, it's called by default in xencommons and 
sets up the cpupools.

>> init-dom0less only initializes non- introduced domains, so hwdom 
>> doesn't get its "domid" xenstore node populated.  That leads to other 
>> errors.
>  > > So I think with Denis's patch, this isn't strictly needed.  It does 
> help
>> existing toolstack code work today.
> 
> I don't think the toolstack is ready for a split between control/ 
> hardware domain. That said, shouldn't the toolstack run in the control 
> domain? Same for xenstored (unless you have a xenstored domain)?

Yes, maybe running control and xenstore together is better.  I came from 
the perspective of dom0less with a hardware/control split, the toolstack 
is less important.

But in general, it's all intertwined.  You have to start somewhere 
untangling.

Running xenstored in the hardware domain, and leaving hardware domain at 
domid 0 seemed like a good way to keep most things working while 
splitting out the hardware/control permissions.

There was also this practical consideration:

Xen:
             if ( is_hardware_domain(d) )
                 fi.submap |= 1U << XENFEAT_dom0;

arch/arm/xen/enlighten.c
         if (xen_feature(XENFEAT_dom0))
                 xen_start_flags |= SIF_INITDOMAIN|SIF_PRIVILEGED;

drivers/xen/xenfs/super.c
         if (xen_initial_domain())
                 tmp = "control_d\n";

So control_d is set in /proc/xen/capabilities for the hardware 
domain/initial domain.  That is checked in xencommons.  Sure, that can 
be worked around, but I was trying to get something going.

I tried a combined control|xenstore domain, but it doesn't have 
/proc/xen/xsd_port, so xenstored fails:
Failed to initialize dom0 port: No such file or directory

Regards,
Jason

