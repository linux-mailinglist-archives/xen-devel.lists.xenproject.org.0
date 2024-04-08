Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC7689B80C
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 09:00:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701746.1096159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtiyk-0002mL-JW; Mon, 08 Apr 2024 06:59:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701746.1096159; Mon, 08 Apr 2024 06:59:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtiyk-0002kk-Fc; Mon, 08 Apr 2024 06:59:42 +0000
Received: by outflank-mailman (input) for mailman id 701746;
 Mon, 08 Apr 2024 06:59:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pPud=LN=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rtiyj-0002ke-8z
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 06:59:41 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20601.outbound.protection.outlook.com
 [2a01:111:f403:2405::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9139716f-f575-11ee-afe6-a90da7624cb6;
 Mon, 08 Apr 2024 08:59:40 +0200 (CEST)
Received: from CH0P221CA0017.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11c::26)
 by SA1PR12MB7412.namprd12.prod.outlook.com (2603:10b6:806:2b2::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 8 Apr
 2024 06:59:36 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:610:11c:cafe::30) by CH0P221CA0017.outlook.office365.com
 (2603:10b6:610:11c::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.36 via Frontend
 Transport; Mon, 8 Apr 2024 06:59:36 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Mon, 8 Apr 2024 06:59:36 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 8 Apr
 2024 01:59:36 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 8 Apr
 2024 01:59:35 -0500
Received: from [10.69.48.49] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 8 Apr 2024 01:59:33 -0500
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
X-Inumbo-ID: 9139716f-f575-11ee-afe6-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=foABffm7NM8zxZeZ5Iyy+TE75KIy4sGFkbNwyL07oD1djCKoPyAbXqpNxaIAAV6bkppLuIFGV5GsXrxczFWl+Jsxq4HWpNAeywqIVSm/e4wZNYVXez2NiGPaaFLGVsqViyzr22fwEFWoCInuF9SBivmXuVjb3zk3+aAofNlfaK/niP2l0gJXtdlc5ntcZ7szHNxdG88yLXCwneWMuUUzLh+YvitslsINuRmyO5vaF4+YOv5fyIY4s5D/jiyBPKo1osjNCEaPIIvzTs9bCcRvz2J6bVaeeeVcIpIXFP5sKky7vdlIRoRaeVNrUsrS3vs/7nrbqRuqri2AUoB0mwzZuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g5MSmAnlP2Bjw+pQdYGqiqlCk/6268mN6KGAbYONLUc=;
 b=MaK8NAk3G8mTOnqNpTrLxU4Ba/H42FuLaszslYNwV8P+25vvG9cpwIakVoaAya4KxcqNqJZ7VOr6Rd9v5qJCTkHI3KQEBZG6fD56i/XV3g3wQDTG8nG2J3U5TFYl+8v81SADGvQvElJpazOArsktlTBbDkId57N5/cUTg9AN8+Q6Pu9gucHz0hFwnzNaDGejPMJmFId8eNpr4qmiyCIiwebx0JnoJincOwsWN3sxU313TFu2Q9loSHvnBOKqbmdVIxZ6HTDOphso+hpF4m+FVpmzSRx/P7BsT32A1i/rudQMd2BYQ1C5v6I9lJ7YIxSwBblnn22PdPVxTfDCjZ4wKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g5MSmAnlP2Bjw+pQdYGqiqlCk/6268mN6KGAbYONLUc=;
 b=L/676QznQ0TmQo0lpwJoyeK5uaKDpmZfRTVKi+yO1qgTYOmztkfgx5Ko9J1Vfr44aSujxkpgT1Rw99DRZ26kcaA2ATIjk3UmIpUaePrzFZTBI1ecc2pmA2EA6yi1N6UJCBt9E9So+lIVf+1TUkxyFZhqnM916fhzPoAhEKCBBC4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <9518c19a-eb97-4d68-97bc-fcae56aa8093@amd.com>
Date: Mon, 8 Apr 2024 14:59:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] xen/memory, tools: Avoid hardcoding
 GUEST_MAGIC_BASE in init-dom0less
To: Jan Beulich <jbeulich@suse.com>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	"Julien Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"Alec Kwapis" <alec.kwapis@medtronic.com>, <xen-devel@lists.xenproject.org>
References: <20240403081626.375313-1-xin.wang2@amd.com>
 <20240403081626.375313-5-xin.wang2@amd.com>
 <e9167c39-187f-4a66-b9a4-8b3a6ae3000b@suse.com>
 <09cc419a-cdf6-4cda-90f1-c0e1ae83ad47@amd.com>
 <951cc6ba-c971-4b5b-9cfc-bc79245a9549@suse.com>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <951cc6ba-c971-4b5b-9cfc-bc79245a9549@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|SA1PR12MB7412:EE_
X-MS-Office365-Filtering-Correlation-Id: f14ff1c4-1e76-4b05-71cc-08dc579973e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vFfgeFhumIhmiNiM3NEMwssAB1kkyjZy7WZ8AyeB7On227GO63+HRka4AtcmsLlyJJ1qiIKLRF9w1T+7OYUxCJdsaJkGJE+MIJ75imAN+/0QEfzAtDvMxpacY/xPVxlrmH8OyeoHwJ4dvpjHy/6Ch3R7K0MpgcwmIuNfzFkxDZNFSz3cVehwf/VO+ruVkx+qhpE2wJMoqW2ojgDuUsciYvf8V6e/7LV6KJT9EaPoSq+su3uU7iU5MDu3O+hlPuWxF71k6HPyDN7KS/lxne4D7Afyi2R0tNu1vFmNnfIhTXfg+LLL+NtQUj0JTQld1metQ15lN/rbUHLbl9ZLLVBP1zDBaM5CkV/65qpHprpR54fH0WS6jg1BqnCmUR3gX5bx3rvDK3hisNpuV2PaCj9ej7uFTYOV9gJhx3HhUM8w5yXk6S6aLgnPTmU3BUGOIO83Ol2WExpZxPiPoxhzyTXG2aqqevb4HCD7kgQLKeB4egeWIbnNLA2kwvvfniMab5NvX64J7VIussrEW9b3ZwS1wbPnwjLZsTV0i0JjzIaGmHRkMtfGmm4H1p/VKRQgevZNqdJJxYnNXLVR+7r6qt6lu317wdaUyrk1i+s8U6g3hE3ezJXlbnWuVjW+9wq6pyGZMd7yYcW7AfS2n7B+zDG2TDsjVXw6xARl+MvwG/TC/DCRCEgxusyqkUw+D/t3mipquTw+P8Q891p1OgkTRH/1e7hwmCYpcLNJeiWghAv7TGPkxZDTC8G7oRh93zL4tXWY
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2024 06:59:36.4975
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f14ff1c4-1e76-4b05-71cc-08dc579973e2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7412

Hi Jan,

On 4/8/2024 2:22 PM, Jan Beulich wrote:
> On 08.04.2024 05:19, Henry Wang wrote:
>> On 4/4/2024 5:38 PM, Jan Beulich wrote:
>>> On 03.04.2024 10:16, Henry Wang wrote:
>>>> --- a/xen/include/public/memory.h
>>>> +++ b/xen/include/public/memory.h
>>>> @@ -41,6 +41,11 @@
>>>>    #define XENMEMF_exact_node(n) (XENMEMF_node(n) | XENMEMF_exact_node_request)
>>>>    /* Flag to indicate the node specified is virtual node */
>>>>    #define XENMEMF_vnode  (1<<18)
>>>> +/*
>>>> + * Flag to force populate physmap to use pages from domheap instead of 1:1
>>>> + * or static allocation.
>>>> + */
>>>> +#define XENMEMF_force_heap_alloc  (1<<19)
>>> As before, a separate new sub-op would look to me as being the cleaner
>>> approach, avoiding the need to consume a bit position for something not
>>> even going to be used on all architectures.
>> Like discussed in v2, I doubt that if introducing a new sub-op, the
>> helpers added to duplicate mainly populate_physmap() and the toolstack
>> helpers would be a good idea.
> I'm curious what amount of duplication you still see left. By suitably
> adding a new parameter, there should be very little left.

The duplication I see so far is basically the exact 
xc_domain_populate_physmap(), say 
xc_domain_populate_physmap_heap_alloc(). In init-dom0less.c, We can 
replace the original call xc_domain_populate_physmap_exact() to call the 
newly added xc_domain_populate_physmap_heap_alloc() which evokes the new 
sub-op, then from the hypervisor side we set the alias MEMF flag and 
share the populate_physmap().

Adding a new parameter to xc_domain_populate_physmap() or maybe even 
xc_domain_populate_physmap_exact() is also a good idea (thanks). I was 
just worrying there are already too many use cases of these two 
functions in the existing code: there are 14 for 
xc_domain_populate_physmap_exact() and 8 for 
xc_domain_populate_physmap(). Adding a new parameter needs the update of 
all these and the function declaration. If you really insist this way, I 
can do this, sure.

>> Similarly as the way that we do for the
>> MEMF_force_heap_alloc, if in the future we run out of the bit positions,
>> can't we reuse this bit for different architectures as an alias? Or
>> maybe we can even alias it now?
> I view this as far less desirable in the public interface.

I agree.

Kind regards,
Henry

> Jan


