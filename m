Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC61A653FB
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 15:42:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917048.1322054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuBfT-0001hh-JS; Mon, 17 Mar 2025 14:42:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917048.1322054; Mon, 17 Mar 2025 14:42:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuBfT-0001eh-Fq; Mon, 17 Mar 2025 14:42:15 +0000
Received: by outflank-mailman (input) for mailman id 917048;
 Mon, 17 Mar 2025 14:42:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J4wc=WE=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tuBfR-00019t-Ss
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 14:42:13 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2415::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02989064-033e-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 15:42:12 +0100 (CET)
Received: from SJ0PR03CA0094.namprd03.prod.outlook.com (2603:10b6:a03:333::9)
 by DS7PR12MB6239.namprd12.prod.outlook.com (2603:10b6:8:95::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 14:42:07 +0000
Received: from SJ1PEPF000023CE.namprd02.prod.outlook.com
 (2603:10b6:a03:333:cafe::35) by SJ0PR03CA0094.outlook.office365.com
 (2603:10b6:a03:333::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.28 via Frontend Transport; Mon,
 17 Mar 2025 14:42:06 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023CE.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Mon, 17 Mar 2025 14:42:06 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Mar
 2025 09:42:05 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Mar
 2025 09:42:05 -0500
Received: from [172.24.79.67] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 17 Mar 2025 09:42:05 -0500
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
X-Inumbo-ID: 02989064-033e-11f0-9aba-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QBP/kW/EOCfPdOEwtF8cDpH/R7bET/E5m19O7hW2mIHFxE/12YyBUCjSdw+bv6nR5UCIOnTwyylOlt31ObWQocgz3XLot3JoQ8EZw0YgQpT103YlCA9L0BLfEsQS6IfYFxEYx5wCryXUUm/NWiKJDRhSXU1iU3VoLSL6IZ+3NQCnJ2LyUbq2hdmlsJcgLqZjuujWeifAYxD/WfltJ79RD/ZhIIu4xwyVjLcB6GmE+DlhDMFdHgNBrv5NvhNt7TjUpXVh/PbZtuTTRZF5CpSwNHE3l/WihB2737sJSGOkuRzoLpy93XJfqa3v+UAnAp5vLEjTtfkiFq+ki1qdAeDmxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G723ccBwWM+H7n17RHK9Lb/TmOEAe/YvokveN01hmzs=;
 b=VztwL9FUnGhE89NQKRto+LEAyutkLM/6NokVNejbYkFkTfMqOPMTmSyiVshXsFX7hphnyOogzGuQ8h4yFyGDeRjiE9eHoZZ6O70V1MeSMwP3VslZWjLhFdfhGwuoIa0ASnRKDWXuMaaJjkDqWzlkgPldi62CVeEeqIr1qRlNWhbrcUvkqs9j+sxbZmiE2sqU5yK89pLqY/1QKYqOQtj6OkTaIXc2WnrlHh9lPmkfltpc1TpkD7t37n+9mAn9xaha2tJ2pb12WraE4XCLNZOLvMrnSNXpJRrzdQCMMoITMUj9F0dk3X0tkutqpmylVsqk0e3320lns0pZo2DUZCsiOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G723ccBwWM+H7n17RHK9Lb/TmOEAe/YvokveN01hmzs=;
 b=vmf5Z+JasBSwQJvy8xHOoAAxGyGnFxUkaHjd2caoiWOAz0szp0sPo69a9E4VMQB4xT5fBUURNLEHTxNjiKS6oBwzEnAAQl9b54o9sFmAQe2gy7wrH9pEQiA5oBDScZmwSi/GwFaBiYGBgUVieeFV/9ew7NbUZdBoJr+bObw20hA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <1725e78f-069d-47f5-bb84-d80434bd8c25@amd.com>
Date: Mon, 17 Mar 2025 10:42:04 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/23] xsm/dummy: Allow XS_PRIV
 XEN_SYSCTL_getdomaininfolist
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>, <xen-devel@lists.xenproject.org>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-14-jason.andryuk@amd.com>
 <5aac6880-7821-4217-a493-d0ab8b0139fd@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <5aac6880-7821-4217-a493-d0ab8b0139fd@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CE:EE_|DS7PR12MB6239:EE_
X-MS-Office365-Filtering-Correlation-Id: ef2a9acf-6141-44ee-e92f-08dd6561e3ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?elJsdGpKa3FNR1krVnhJQThIb0VCcTQ4OTJtd1c3dkwraGJyazM5cU5rVmR4?=
 =?utf-8?B?eVZJVU5hZVRaSHlkU0FzVHE4Mk9vSDRQblpHZFdUM2lYYmZmVmRxUkFGcmdV?=
 =?utf-8?B?L0IxUk05T1pCRE5NVVVHMzJjbHhoaXpoRjVRRlFBT1VpKzZ4UVZYdkZXa1Vo?=
 =?utf-8?B?YU94djJ4dUJSUjVVMmdERHlwUksycGNMN2IzZXlFNlNuTVRvNlJGc2pPY2p3?=
 =?utf-8?B?OU9OVFltWFJmcmtyQUY3R2Zmd25YRnRYWEt5OFljWVpXbDg1d1ZJTmVEcWIw?=
 =?utf-8?B?Tm1ZMTZlOEdQS1pkcWh3TVI4OUpxNE8waXBsUnZVcENRY044ZHZoR2VvVWZ0?=
 =?utf-8?B?cW53Sy9UT3A4NmppZlZCOW40Z0pvam03eWphVEFCZmMvOUx5Mk1QVDhESWVx?=
 =?utf-8?B?M2dKSFFlZkJoVk9qTWxUbkJKKytzbHMyc083elBVYVVRQWpZMU9NK3lKdmEy?=
 =?utf-8?B?Wm9DWXppY2VtVGIreVNQQ0J4Q0NxL0RQc2Q0S3UvbHZJMXVYT3BMUmhVaXZt?=
 =?utf-8?B?dzYxbjR1SlcwS1BCRXRmTEJPbkRmaUtPT3htK1ZDOHFvMWFaTzFIM2g0amcv?=
 =?utf-8?B?MVFWRWYydGx5M2xFd1l3cXF5aXU5aW1UMFhEK0UydzIxMkNLaWhJSHg5VkE5?=
 =?utf-8?B?ajR5Y2piZy84TzRwWkxEZDJkV0Y5WXNWQ1FsMDVvYXp2MDIyY0xKYklxUGVS?=
 =?utf-8?B?MlNVcHJlU2F0SGZ0cHVQSVJYdEdENmg0OS9TT1IyNzM0UGpGbGNZMkM2dHJB?=
 =?utf-8?B?dXBwQmhQNmNPRHJpKzNQV0toeXVQd0IwVGVnbVpLU2Ivb1ZZbExUUVo4Mkkw?=
 =?utf-8?B?UFZMOWZJNml6WTJxZ2taRGFZUjNuZTJyNHhESlJaUmRUa2dkT2VVMXZmdmxU?=
 =?utf-8?B?R0dtTmREQ1J4VnZoc1RzSkJLRktEVlkxd0JvYUc4UU1zNjRUNEV0eGVLM29O?=
 =?utf-8?B?enQxMjZKbHBXTVNlSVFoTExQUVQzMDZLdVlZTUpic0cyaEFoc2t6eXdtRzkw?=
 =?utf-8?B?MmcxRGxzREw4Y0xqQVBIV3FnOWtSVzVHL2RGVkRKYXNqUTZ6VThQOW5XaURi?=
 =?utf-8?B?c01jaEZyaElFaGhXcFF1UUZJMkJSK0xpc2wyQXBCRWlTcFhRVE9OTTE5L0pW?=
 =?utf-8?B?VmZybDZLZnMvVHZTbHIrS2dtUFVuUFFLT0xXM0IxM3Y2c1ZWaFZncmtxajh2?=
 =?utf-8?B?a2NVbThzR3RhZktDaEhJRjB6ZjhvOHo1dXhjTUhESkR0d0ZoNEs4b0Uzb2Fh?=
 =?utf-8?B?YzRaeGFPRXh6OWdTMERhSjRtUzZUdFhPV0FtT2Y1czltYkxBL2N2Y2lJOEdu?=
 =?utf-8?B?dUR0Y3Z6M2pYWktsMVBIWnNnUVlkTWJwTGYwY25CZTlYVktkTTdvKzh1V1Ey?=
 =?utf-8?B?MVZ0UVN5V1pLQWhmSGZvbGNCY1h1Q00rSzY0WEpxK1NIb3NIM0ZYb3FxdkpD?=
 =?utf-8?B?WTlJVDU2OHV4OERULzRmKzRtdTJjZVNlcHJqUXJsUUNzLzQ4a1lmMDZaZXZl?=
 =?utf-8?B?cXZ2cVN4TXdzNDFtUnVEWlQ0RSs3OVdzakRsZDVjK3hYUDJEb1FlWU9Bc3J2?=
 =?utf-8?B?dTlOR01qam4wV1hVTW1vVis2MWhDRnBCYmdtRUx6cTA2Yk1JM1lKVGJ1UTZp?=
 =?utf-8?B?NWhyWEZxZzRWcUV1WjkrRXo2UTV2cXJPWnBMdnlGdkNCNHh1czVlQWRPblMw?=
 =?utf-8?B?NTJDTWJqT0ZCcEJyWHMvMFlJRUdaRVN4TTZwMjdhcTlKQnI5QUxPamFzVC9Z?=
 =?utf-8?B?ZmdlWjMyVjB6cEZ6R282L0NIeS9qeDlTWGhmeC9Id1gyQnJ5TVl1RVBPdWFD?=
 =?utf-8?B?UVNzZFhEVWdrYTFpTHdyY2FsM2YzZTY4cjFxU3RtZHFYSVRnTlVWK0hHZSta?=
 =?utf-8?B?eUt0SzhBcWVuQkl5QjlFa1l5YUhubVo1M0tUbGdkb1FaekV3Qi9YZTNSK1Ey?=
 =?utf-8?B?bk5UTXZvY0pkSk4rVnhNT0t4bHZ3ZUdoTmI4N2o0aVRHVU9vdGFTUm0yTE9x?=
 =?utf-8?Q?okYTS94TTo8HwDMSO7zx7McRvn0Wp8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 14:42:06.5481
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef2a9acf-6141-44ee-e92f-08dd6561e3ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CE.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6239

On 2025-03-17 10:13, Jan Beulich wrote:
> On 06.03.2025 23:03, Jason Andryuk wrote:
>> To hyperlaunch xenstore, we want it to automatically introduce all
>> domains it finds while initializing.  To do that, change xsm_sysctl to
>> allow XS_PRIV to call XEN_SYSCTL_getdomaininfolist.
>>
>> Xenstore can already call XEN_DOMCTL_getdomaininfo for the same
>> information, but it requires knowing the domid.
>> XEN_SYSCTL_getdomaininfolist eliminates the need to guess domains.
> 
> Yet then - is it a good idea to make such changes here for the sake of a
> new feature? If existing Xenstore was enhanced to use this, I'd find it
> easier to accept the change. Otherwise can't the hyperlaunched Xenstore
> behave like the "normal" one, not needing the change here to be made?

Sorry, the description is a lacking.  It was originally written for 
xenstore stubdom, but I pulled it over for this dom0less work.   With a 
combined xenstore & hardware domain, and running init-dom0less, it was a 
needed permission.

In light of Juergen's libxenmanage work, this may not longer by 
applicable for xenstore stubdom.  And I'll re-evaluate with dom0less 
side re-work.

Thanks,
Jason

