Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E85789EF5C
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 12:02:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702986.1098731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruUmO-0005g5-Fm; Wed, 10 Apr 2024 10:02:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702986.1098731; Wed, 10 Apr 2024 10:02:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruUmO-0005dC-CW; Wed, 10 Apr 2024 10:02:08 +0000
Received: by outflank-mailman (input) for mailman id 702986;
 Wed, 10 Apr 2024 10:02:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=23xn=LP=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ruUmN-0005d0-1V
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 10:02:07 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2412::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6142e45b-f721-11ee-94a3-07e782e9044d;
 Wed, 10 Apr 2024 12:02:04 +0200 (CEST)
Received: from DS7PR05CA0060.namprd05.prod.outlook.com (2603:10b6:8:2f::13) by
 MW3PR12MB4347.namprd12.prod.outlook.com (2603:10b6:303:2e::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.54; Wed, 10 Apr 2024 10:02:01 +0000
Received: from DS1PEPF00017094.namprd03.prod.outlook.com
 (2603:10b6:8:2f:cafe::67) by DS7PR05CA0060.outlook.office365.com
 (2603:10b6:8:2f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.20 via Frontend
 Transport; Wed, 10 Apr 2024 10:02:01 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF00017094.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Wed, 10 Apr 2024 10:02:00 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 10 Apr
 2024 05:02:00 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 10 Apr
 2024 05:02:00 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 10 Apr 2024 05:01:59 -0500
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
X-Inumbo-ID: 6142e45b-f721-11ee-94a3-07e782e9044d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lcsR2Tp2SsRtVK+9fyMPSPk4DDSewKKHdbCN8BRhAGtOFz48sZvQ5QfSr2WEGhJlx8hm9l5qb0aQWpQJaa+J9bazzROjLQVDARLN8ZefJAU6EvxGxkaLsOW2j9yp6fx8jMQeI1+HZ86l002Z5f1rdV28PIj4JrGzM/KA2EGjIm6lTg/M8uRqPVDumj6RQ+jQ4vFuwEbtBR7+HOwrBHAkqbFCH0xkhvuAadWiPsQf7ET0HpdqKySJwhP/5RgoGBo1irnSNkzNUxBPIi7XSI33uu14HMZWcarNcCj4Xaigrk1DQNlOLpg+RRfC5273L1FxgmUFtN4xVfog3Z4LiIQhbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YnwQ/yYqH88s0p4ms1VGOnWDamEhOzWM8aaMSIYA6sM=;
 b=GxmbtQI6gDIUIiCE9LztwsvpiO4tqNP2iJBkjZrofHIM/V4t8FDs8n8GxAAGeCMSL4l0HMdncce0I9d1rooMKXnRX8OKF3zy2qS1Jb+T8UGJE/HYoqWjvBko52uKDfdDNHVFkIsltorxEg5zz2HlJjghhIj4NKNQZSqCSYyN8Q7MvrD40VkwCZ+T87dWAFZRhD+wnxcmaDbvhEgR3EnO4zljP3nan0lYotaP1a6CJw6i6U41+dvnv8HyPQCNDBxrDzmZUS1dxkwDoQyj928lNuk5EvwDHwl0oB2qoq8kJPMq103XuIrw5JLNFA1HV4nQBVtXQ1s2jXCUVv5jDd1zzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YnwQ/yYqH88s0p4ms1VGOnWDamEhOzWM8aaMSIYA6sM=;
 b=YgP4J2TPZHvdmHnUW/EACrYO1ZVLayK9na2lTPzr5/KlWtFGmpNwGXjFcoG1cR2YqaYxIUbwoiA8j7DJcljuhjcKJqO5QwK97u9J1U3jnDGzPc6fh9anf8Gur99phqSif+OJ+dbwAA/AohVhvscpvzDMYKIO7/M/+fjLfeLDwV0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <36108be2-d950-4839-a2a6-06462de7e952@amd.com>
Date: Wed, 10 Apr 2024 12:01:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/13] xen/arm: Reduce struct membank size on static
 shared memory
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20240409114543.3332150-1-luca.fancellu@arm.com>
 <20240409114543.3332150-10-luca.fancellu@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240409114543.3332150-10-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017094:EE_|MW3PR12MB4347:EE_
X-MS-Office365-Filtering-Correlation-Id: 42e2d8c3-3c32-41b2-7063-08dc59454426
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	72v4LuZNyuG5wLoH6iVv9mA3t/AjH92Pw6ezzlZh4OAoQXg4PFX9iPJ2fuDdYz3/vVujdJCl0vS6eJGRFDy5HhBivCnVbsUMuv4ceHjW750aOVjLhn5t4eAKNOsfv4Ht0rvUAjpKDZlhzMYzyMBV5p1BBsAvEQaUXMAcj9ebHPLgwKK3+0LLnolZEDPhwFZcT2j8+ypCuyV+uch0ZaoAXAsUpBB0WrRXwhQP3sBS5wtEEeyo1t4mXDUZadxOxIk8YqaUXcbQ7btksCaTzztxVZyLXXYzJM7H/OuG27/Nu6CMLTJKs1eSyaHnNeur5rEvOwXrpyjQTCH9R2GFEAjJ5mx9GNF2SH+PiRFUqlmVnJxj+hvTVYuH7prZjNtVh9oN65u8jsbq3cP8RsicsBAkQbWMUY/ftzlGE27F2j6R6+r7tWHnbRISCYNBOBQerJI0JiP0BKn+rd5ZbwHAAx6nAnBkLzNzwo25GF6r5enia+gtT4r+q1lTmDdmjGIX2mMj9sIfJHjkWMJoPTieZLYmD/5LRURRgNsi3xsCscy3GpANFRxwd1FLJFp/0QNAD56mLKSe9PTExk+VKotDLPXajnzfA2J3/K18NH5TnCs7qC6aIgWRhVigvIgZjR2GAkqHsLh1Sa9ZES11PgeC9AJOhlT8mfnKUkEKIcnQR1EU222mA/d4VpJPO/EYr4NxW74yi5wv91Ntrjr8810uVe8J9R5faxYzMWyOmXuCQdw/Kg2f6cUhlLGp0E6AnQZ+3Gl+
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(376005)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 10:02:00.9815
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42e2d8c3-3c32-41b2-7063-08dc59454426
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017094.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4347

Hi Luca,

On 09/04/2024 13:45, Luca Fancellu wrote:
> 
> 
> Currently the memory footprint of the static shared memory feature
> is impacting all the struct meminfo instances with memory space
> that is not going to be used.
> 
> To solve this issue, rework the static shared memory extra
> information linked to the memory bank to another structure,
> struct shmem_membank_extra, and exploit the struct membank
> padding to host a pointer to that structure in a union with the
> enum membank_type, with this trick the 'struct membank' has the
> same size with or without the static shared memory, given that
> the 'type' and 'shmem_extra' are never used at the same time,
> hence the 'struct membank' won't grow in size.
> 
> Afterwards, create a new structure 'struct shared_meminfo' which
> has the same interface of 'struct meminfo', but requires less
I would expect some justification for selecting 32 as the max number of shmem banks

> banks and hosts the extra information for the static shared memory.
> The fields 'bank' and 'extra' of this structure are meant to be
> linked by the index (e.g. extra[idx] will have the information for
> the bank[idx], for i=0..NR_SHMEM_BANKS), the convinient pointer
> 'shmem_extra' of 'struct membank' is then linked to the related
> 'extra' bank to ease the fruition when a function has access only
> to the 'struct membanks common' of 'struct shared_meminfo'.
> 
> The last part of this work is to move the allocation of the
> static shared memory banks from the 'reserved_mem' to a new
> 'shmem' member of the 'struct bootinfo'.
> Change also the 'shm_mem' member type to be 'struct shared_meminfo'
> in order to match the above changes and allow a memory space
> reduction also in 'struct kernel_info'.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
With the find_unallocated_memory() issue fixed:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

