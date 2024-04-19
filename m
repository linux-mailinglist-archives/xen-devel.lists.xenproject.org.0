Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DA98AA872
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 08:30:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708750.1107835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxhlN-0007NQ-Vc; Fri, 19 Apr 2024 06:30:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708750.1107835; Fri, 19 Apr 2024 06:30:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxhlN-0007LO-Ro; Fri, 19 Apr 2024 06:30:21 +0000
Received: by outflank-mailman (input) for mailman id 708750;
 Fri, 19 Apr 2024 06:30:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=52U1=LY=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rxhlM-0007LD-C1
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 06:30:20 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20625.outbound.protection.outlook.com
 [2a01:111:f400:7e88::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49eaa6e5-fe16-11ee-b909-491648fe20b8;
 Fri, 19 Apr 2024 08:30:19 +0200 (CEST)
Received: from BN7PR02CA0003.namprd02.prod.outlook.com (2603:10b6:408:20::16)
 by SA1PR12MB8919.namprd12.prod.outlook.com (2603:10b6:806:38e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.55; Fri, 19 Apr
 2024 06:30:15 +0000
Received: from BN1PEPF00004687.namprd05.prod.outlook.com
 (2603:10b6:408:20:cafe::8e) by BN7PR02CA0003.outlook.office365.com
 (2603:10b6:408:20::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.28 via Frontend
 Transport; Fri, 19 Apr 2024 06:30:15 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004687.mail.protection.outlook.com (10.167.243.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Fri, 19 Apr 2024 06:30:15 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 19 Apr
 2024 01:30:15 -0500
Received: from [10.69.48.49] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 19 Apr 2024 01:30:12 -0500
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
X-Inumbo-ID: 49eaa6e5-fe16-11ee-b909-491648fe20b8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=afrZeifnOQxRndkouh5fWp9Febn/6+B9PioHu0MsExHkdiHerQIJUyexf3v5ih4cKLOjlHt1NXaUrVKnduBtvtmGv99bHR4H74RovQTQ6Y2z6CIiyUc/JCYuewPMFTH1qQxRxTnLqwMenqYU9f/LWCdnR/OnJ4wEkBD6oJq67f9o7C2dgNIUAUXbbaT4x4fF63ayfUNrYSehi1bgMPDGYtR+Z/4BPe1OBGKi9/ddDRaIaWYtdSYIYREbqFgumloc8pJ8lMI7TBp5A+GZ0HhO2E7e5esg4So4vvsdmeTBZGcFscJmFDnt7+mLH/WvxcLEHjdf8s/56MhG1XHJsekceg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C7Hat+JDbOO2WOmmOhCxAXaiRuoZaBVACIZQtQH6N5k=;
 b=aGPyJbKJDGkkk3CFHLltoLUZHymMq/iADgtBXiqYsPz5s/ZU19/eAZl3ZnO2lkZyze+zgQ/Bp3lVopKbw4yQ0yZeuO6Ja8v77hxpWV+oBlT85fdGv63mS5ef6LZYkOzEY1LHORr/I671cHG3eYGDAeCLUoYRgEXxF5gZSU9h3tSl4AyW81mTzlom2Fp2zsYvjBILYBfmBpHeNlzsK91+rVIF8UA/6tYKYxINQcA75cq1tlH7VNPrSas5oOCig+e1JhsVv39R0F7guS4xl5Avmv1cEivv44a99fWbj/CNuXqtNFb/0pUqshhlRr6PbpM/mK4sDl79h8KaGcszYCbX4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C7Hat+JDbOO2WOmmOhCxAXaiRuoZaBVACIZQtQH6N5k=;
 b=meQyCKe/MQkvqsNk9LkjhOX4PxvS16RaZ9g3h5ql15KlRR/bPhX9qLc6lHyCKJ4R5tR0fZcnt6rDpZVnxJCrJX5Vt7NJA0vBGveyENmZRCPa1bVPF5z6ZqAWrPjSTdLdPhCFv6GaVz6UJax58+Gh2dHlDQsE9PVRY3JFNNPWfDg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <92657c20-ec60-4bcc-9f63-eb8e5b0dfbfa@amd.com>
Date: Fri, 19 Apr 2024 14:30:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] xen/memory, tools: Avoid hardcoding
 GUEST_MAGIC_BASE in init-dom0less
To: Jan Beulich <jbeulich@suse.com>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Juergen
 Gross <jgross@suse.com>, Alec Kwapis <alec.kwapis@medtronic.com>,
	<xen-devel@lists.xenproject.org>, Daniel Smith <dpsmith@apertussolutions.com>
References: <20240409045357.236802-1-xin.wang2@amd.com>
 <20240409045357.236802-5-xin.wang2@amd.com>
 <cc4fd69b-4866-4f1b-b780-64c5fac7d2d6@suse.com>
 <eaad1ad2-e6ec-42a6-a0fb-236ce93f0a9e@amd.com>
 <f17d6f60-260f-4090-8a42-7bc1b7d93600@suse.com>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <f17d6f60-260f-4090-8a42-7bc1b7d93600@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004687:EE_|SA1PR12MB8919:EE_
X-MS-Office365-Filtering-Correlation-Id: e88d3866-be5e-4f5b-c934-08dc603a2cb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FiAjJ60scn6SmSqbwtdp0+n0iMjPp6Mhui2KAFCKG1YyBzIhC3nZ3y8Ea4QKz5Ad7k/6vHnUGxLjNFxExn2bbHdRGgNlV06/A8PmIarT/Pcuq5yROChTggOKoF7AOGdZkGjygmVLXS2OgEOrr+15loeAfCKR+oWHrGCVx37S8frk7ulqPzvtMsrEf6nZybSHHcZydMarwrTxJkuhTUU2TgOmOIxNzTd95I+JgPTwnlIGm/bacquZynxMmkxZrGCByvOhe32+gpLd/tDj47hZGYEy3mf7i2vWMIJjXzM39DKd4+QL6mQWKeksBgTHVdMiBihclvVVQZkpCRvJEXp6aZ4wjHqMC3mpE3yEXgYLGCSf5w9fGcvjYDtroD0xTQ2DqT/H1dUFA2WWQ565VDIk2ZUSTU6ZR932eg1uq2T6wziGACG+7Oh6tzq5mCuM5C2q0LoxMoJjcbkjTOZc+KD6PGp6Uh+TUzm1tPNAn94/51D4kpDJ7Ojw5cZHx/RL9R83GfuAf6bdg0guLw1XCH+BEjBuzCPXDDmfYjsMlDxl/uWXHcjUGrgWcrnAkdqh1VXI3+/tYJdRwPYhkA7wy8nnEjP9s/KwV7qMLi8bAvegBbv3WOCPpPezQYpmJE/Q5T2RidHExz0Z08VI2l7yCuYeow2m7LsMcvZYmJOIXYwN8Kap3fOZCphnm2cdG4naN9+D6A1JNvWysWYAQ7wyxNH9bec3MjGP8NyIwzy2jIgoAtce7m9jUDlsugi/eTQlOFFehBhkfnqECr3kYuPhbLpEpA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(376005)(7416005)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 06:30:15.3845
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e88d3866-be5e-4f5b-c934-08dc603a2cb6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004687.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8919

Hi Jan,

On 4/19/2024 2:18 PM, Jan Beulich wrote:
> On 19.04.2024 04:31, Henry Wang wrote:
>> On 4/18/2024 8:54 PM, Jan Beulich wrote:
>>> On 09.04.2024 06:53, Henry Wang wrote:
>>>> --- a/xen/include/public/memory.h
>>>> +++ b/xen/include/public/memory.h
>>>> @@ -21,6 +21,7 @@
>>>>    #define XENMEM_increase_reservation 0
>>>>    #define XENMEM_decrease_reservation 1
>>>>    #define XENMEM_populate_physmap     6
>>>> +#define XENMEM_populate_physmap_heap_alloc 29
>>> Without a comment, how is one supposed to know what the difference is of
>>> this new sub-op compared to the "normal" one? I actually wonder whether
>>> referring to a Xen internal (allocation requested to come from the heap)
>>> is actually a good idea here. I'm inclined to suggest to name this after
>>> the purpose it has from the guest or tool stack perspective.
>>>
>>> Speaking of which: Is this supposed to be guest-accessible, or is it
>>> intended for tool-stack use only (I have to admit I don't even know where
>>> init-dom0less actually runs)? In the latter case that also wants enforcing.
>>> This may require an adjustment to the XSM hook in use here. Cc-ing Daniel
>>> for possible advice.
>> This sub-op should be called by the init-dom0less application (toolstack
>> side), which runs in Dom0.
> I'm puzzled: How can init-dom0less (note its name!) run in Dom0, when there
> is none?

[1] is the original patch that introduced this application (More details 
can be found in the cover letter of the original series of [1]). I think 
the use case for this application is to make dom0less domains to use the 
PV driver when dom0 and dom0less domUs exist at the same time. There 
used to be a discussion regarding the naming confusion, see [2] commit 
message, but I cannot remember if this discussion has settled or not.

[1] 
https://lore.kernel.org/xen-devel/20220505001656.395419-6-sstabellini@kernel.org/
[2] 
https://lore.kernel.org/xen-devel/20230630091210.3742121-1-luca.fancellu@arm.com/

Kind regards,
Henry

> Jan
>
>> Daniel has proposed an alternative solution
>> which is based on the hypfs. If we decide to go that route, I think I
>> will rewrite the series. I will wait for the discussion settled. Thanks
>> for looping in Daniel!
>>
>> Kind regards,
>> Henry


