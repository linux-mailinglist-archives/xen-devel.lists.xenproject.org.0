Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C9589F051
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 13:02:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703010.1098781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruVi7-00015W-PU; Wed, 10 Apr 2024 11:01:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703010.1098781; Wed, 10 Apr 2024 11:01:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruVi7-00012c-Mc; Wed, 10 Apr 2024 11:01:47 +0000
Received: by outflank-mailman (input) for mailman id 703010;
 Wed, 10 Apr 2024 11:01:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=23xn=LP=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ruVi6-00012W-KE
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 11:01:46 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2407::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7a4df0b-f729-11ee-b907-491648fe20b8;
 Wed, 10 Apr 2024 13:01:45 +0200 (CEST)
Received: from MW4PR03CA0028.namprd03.prod.outlook.com (2603:10b6:303:8f::33)
 by PH7PR12MB6835.namprd12.prod.outlook.com (2603:10b6:510:1b5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.54; Wed, 10 Apr
 2024 11:01:41 +0000
Received: from MWH0EPF000971E4.namprd02.prod.outlook.com
 (2603:10b6:303:8f:cafe::83) by MW4PR03CA0028.outlook.office365.com
 (2603:10b6:303:8f::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.35 via Frontend
 Transport; Wed, 10 Apr 2024 11:01:41 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E4.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Wed, 10 Apr 2024 11:01:41 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 10 Apr
 2024 06:01:41 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 10 Apr
 2024 06:01:40 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 10 Apr 2024 06:01:39 -0500
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
X-Inumbo-ID: b7a4df0b-f729-11ee-b907-491648fe20b8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bQ5uo0mfvkjQP+qgoXeCchqVRWtpR7NBoFgkll2+FG64GhKFvIFIt9m1Igtsdyp7yF6CSAPdYlboEKC9pUfAWqIGiW6r/3/34kOGqp6saWw8uFY9lbWANjo2rTDtdgD7Plsq4Flb0jLN04712iCiIfu4qY6BD2yu1szr3pecdb3Urgs77W1En17tOnmzo9TC/nWmgrN66cbrsyyMZK/4t4c8blW+qgZfNORLqh17HRYnBBJXxlSSzBddS2Aapjm6CHg86DhZ/SdPsPBBBfo6OFk+c/kNmMP4taYJZQMwjU58VqQ1lHfQa+62c/R6kPyUeYIy1vtnjnGN2gBZTq78FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=quqC/nHW5U9z+dpT4T4w7Vsx8hDiZoRV7wsaXcL3PAc=;
 b=Y61HTsfUZ+zj0ocwRMGhqLlDHNHK34+HWqz3aOyZJzkSmbEDQdLgfA6uVXDyhQabwrKTOUmhWYp7GBb8E24N5c0HqHqtJYNGgauPm4R/y75o4WtR69NAHLgjemehbHyMnxo01m09KmH+cHjB4OFAlREmkkD0dVBm8pS0ch7oob7vGpN+TjfpLE9W4wIfZ+2L9dFF26DoP3KFQQTwIURODvlKdTAx5wkie256sfzaTGf1AhAvNjVwwNxYS7Scf0Wex+EMnoydv3yKjg3mWLUUBQHnQOI/13NSDocGIxiDAuF3khXwNOBiOJbAsUY1aiqtCnas9BaDa8UIWSUVxhdrlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=quqC/nHW5U9z+dpT4T4w7Vsx8hDiZoRV7wsaXcL3PAc=;
 b=sx1IyeFMbza0csG5zp1wEkayouXGwruiEUeEXVWmAHsH5jOBaqHCW82zHb5rnfOF7bprBaL8bEJZL68gxOEktnN1aAiwH1juX8AUCEQYrrdsnJ3EXOgxmnhyK+V59I3BwwXormkOB9fWlNtXzHzaW6rminsoslaHPwV/s2v3h/c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <698db158-fd87-401c-9c13-5b94f973436d@amd.com>
Date: Wed, 10 Apr 2024 13:01:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/13] xen/arm: Reduce struct membank size on static
 shared memory
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240409114543.3332150-1-luca.fancellu@arm.com>
 <20240409114543.3332150-10-luca.fancellu@arm.com>
 <36108be2-d950-4839-a2a6-06462de7e952@amd.com>
 <045818A6-3E13-465B-8DB6-067877B8A035@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <045818A6-3E13-465B-8DB6-067877B8A035@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E4:EE_|PH7PR12MB6835:EE_
X-MS-Office365-Filtering-Correlation-Id: b3792621-526f-430e-e442-08dc594d9a5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UAzsRhdJmGVa+MJGDN0UYxZ3dkMo5hYoH2J8Bn/j58ctf9i7kJ6D7JvvWNOrB3tvG3jzs4sU8PnN6j3QDfVGf+XiPRyLgcXqSItqGOGqdOSiIXrZ2G5c+mLgjlcAi9+lokOyLY0GLVjBvlDjYQXa+FMEbDA+0xu8pcVpLqu2fB3J6+2t3+tsyIcTioaeOfb07Yg+D97hwCye/yGBItNYoPdYbHScdw23KJOOICq9dD5XgtQ9ralE6QmCothXXeeUbDdX8uva1IBrGZr8N1PfzIcKHCCS+z5OokpM/QzmyOWOegvIr/fUxbuKXGTMo7PZEUNqW6RTISuvWmwUYuBMQS+NClUjWDKNft08rUcX+KedHu/rUp+eTt54j7rOoLOm0bb138vvoClvxpNfXXWP8wVgOwKYmXWHO+3CvdsZdFsQygThM+4lF3shuujUqbIwZEYdOMJYch+9xkCdgmjQGnJMh/6n0GyqZR6LdNls2i1jl5HWF8liz+0fOyjIsdGIjr3tsjtwZAiqnjbu9a84nNcptgdZCu+wmERWYnIyLFHkLmvh9Zcn4NMngZiVk0obz70cNFL+/JoS1LdJLncMJE/zBkNi5vLZITKdXqMRzZKOnPPtnBxuFS5akahTwsnbDYTDj48DQONlF2hJpFCy0WEA88JOqeYcGtxoWhi2cQluraZUGxAJ/e/BkEpbsus0VN6J2K/jn4CWdgaZQctjtwoyfn8oWJLHpxKONPDTSdDU3PTZULXsnNkQzJtZMwhF
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(1800799015)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 11:01:41.4960
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3792621-526f-430e-e442-08dc594d9a5b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6835



On 10/04/2024 12:56, Luca Fancellu wrote:
> 
> 
> Hi Michal,
> 
>> On 10 Apr 2024, at 11:01, Michal Orzel <michal.orzel@amd.com> wrote:
>>
>> Hi Luca,
>>
>> On 09/04/2024 13:45, Luca Fancellu wrote:
>>>
>>>
>>> Currently the memory footprint of the static shared memory feature
>>> is impacting all the struct meminfo instances with memory space
>>> that is not going to be used.
>>>
>>> To solve this issue, rework the static shared memory extra
>>> information linked to the memory bank to another structure,
>>> struct shmem_membank_extra, and exploit the struct membank
>>> padding to host a pointer to that structure in a union with the
>>> enum membank_type, with this trick the 'struct membank' has the
>>> same size with or without the static shared memory, given that
>>> the 'type' and 'shmem_extra' are never used at the same time,
>>> hence the 'struct membank' won't grow in size.
>>>
>>> Afterwards, create a new structure 'struct shared_meminfo' which
>>> has the same interface of 'struct meminfo', but requires less
>> I would expect some justification for selecting 32 as the max number of shmem banks
> 
> So I have to say I picked up a value I thought was ok for the amount of shared memory
> Banks, do you think it is too low? The real intention here was to decouple the number
> of shared memory banks from the number of generic memory banks, and I felt 32 was enough,
> but if you think it might be an issue I could bump it, or we could have a Kconfig...
No need for Kconfig. 32 is enough for now but I expect a paragraph in commit msg that you select
32 which should be enough for current use cases and can be bumped in the future in case there is a need.

> 
>>>
>>>
>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> With the find_unallocated_memory() issue fixed:
>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> 
> Thanks, I took the opportunity to improve the comment in that function in this way,
> adding “ (when the feature is enabled)":
> 
>      * 3) Remove static shared memory (when the feature is enabled)
> 
> Please tell me if that works for you so I will keep your R-by
You can retain Rb.

~Michal

