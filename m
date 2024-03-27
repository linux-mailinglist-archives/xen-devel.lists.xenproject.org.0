Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E80F488D8F6
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 09:27:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698354.1089959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpOcw-0000EA-ES; Wed, 27 Mar 2024 08:27:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698354.1089959; Wed, 27 Mar 2024 08:27:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpOcw-0000BD-BH; Wed, 27 Mar 2024 08:27:18 +0000
Received: by outflank-mailman (input) for mailman id 698354;
 Wed, 27 Mar 2024 08:27:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lAEl=LB=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rpOcu-0000B7-RT
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 08:27:16 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20601.outbound.protection.outlook.com
 [2a01:111:f403:240a::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cfcd0a51-ec13-11ee-a1ef-f123f15fe8a2;
 Wed, 27 Mar 2024 09:27:14 +0100 (CET)
Received: from BN0PR07CA0017.namprd07.prod.outlook.com (2603:10b6:408:141::31)
 by PH7PR12MB7019.namprd12.prod.outlook.com (2603:10b6:510:1b9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Wed, 27 Mar
 2024 08:27:08 +0000
Received: from BN3PEPF0000B078.namprd04.prod.outlook.com
 (2603:10b6:408:141:cafe::70) by BN0PR07CA0017.outlook.office365.com
 (2603:10b6:408:141::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Wed, 27 Mar 2024 08:27:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B078.mail.protection.outlook.com (10.167.243.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Wed, 27 Mar 2024 08:27:07 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 27 Mar
 2024 03:27:04 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 27 Mar
 2024 03:27:04 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 27 Mar 2024 03:27:02 -0500
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
X-Inumbo-ID: cfcd0a51-ec13-11ee-a1ef-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Owl561qJuf4oC8K58KA/OwuxUdZyW/Wp22TThoY3g9+T858f+WJWOmPbnUz7+M741nAS5D9aQsaJBSYKny1vW1FOd9eZVUEYrVhH5Tpbb5UURDwWULEzk0OZb4ARKwp685RRhi+5uCmzKcTDCNTJX8YsY+nLbsEeIqZUwZ47asRa+PR+F9Tk+S5kEZdcMql05BzbjEwccH/DFcNn2bJajlyFSF8QjUce2CX+ZHZXbvf0Rh7i0u9fioKzKabv/utpbs4GEe4Guwk+28hVcPTV3S5ZafoNKSXmmEgAv8HTM5RwF4X2tOvHZP3zAOVzCin1MiBCnsn8AMw2QaoUPHE7Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8hdwUDH+LOMuz2G4XNxJl8/mIOZLll89oCdGwJEamxk=;
 b=nzQx/moVUBUrbIoEy/f5PuyDclOsoa4wwU9EFwgwqQCNj7YQgsiEnyImNKWxqRnoECN8viWsUcRMzrapEGYYWNlHBqQRNhobR2WGX/Gbe1BLGS4+HRrL8+rtbjbwzSltbPwzy5hT34lxM/KhqbfNbmNAHKauezLZWyLLddCfC7gAA3SKhpGbdqYHE3Fh0SDRigOabAy5E7Gl9e7gGIyfFwteRo9xQq1HRvHmTJJkGggJi3YM3+jS+Xiadx/Ovh/ggNMEZYU8ZY9EX7bzUoyc8MajvDHjWXCZP7HgBq1ke2w6SRES5AD7H6mAD2hXx33h38jkoXLc7ehIdaLJuENZsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8hdwUDH+LOMuz2G4XNxJl8/mIOZLll89oCdGwJEamxk=;
 b=rOP5BKv4ZX5sxV1uX8VN2ucmj+MOXzcIqnlP0aLVSo8OTmlQeq8RcX1VpLgn/iAfBoK5tZP7V29Ul0ty7TUsEhl6A7TbZM38QW5AY0pj9p6YnJcINZJySZmhVJKQV0Lue1DZGMFd8rU9fBJKX+CmE2adJoJxaPNFLEe+46+HERo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <8108074a-f4a3-4134-bfcb-410fc73b371e@amd.com>
Date: Wed, 27 Mar 2024 09:27:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] xen/arm: List static shared memory regions as
 /memory nodes
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240312130331.78418-1-luca.fancellu@arm.com>
 <20240312130331.78418-12-luca.fancellu@arm.com>
 <3a9e8323-9eb3-4c06-9ef1-e85c8bf2aefd@amd.com>
 <B338349C-76A3-48C3-97B8-98D0CC9C1A72@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <B338349C-76A3-48C3-97B8-98D0CC9C1A72@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B078:EE_|PH7PR12MB7019:EE_
X-MS-Office365-Filtering-Correlation-Id: 7aff7a80-81d8-45a7-1675-08dc4e37b0d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FcaIhQC84sqIIRK8RxYNL1MENzVF26AuyfVJ5oPAen1s6MIhnV8SZmy2FwaAcI/bf29TW4GuDy03wPT+qE21qg7PpABqtSl0IA2sHheFTsvCoyilF/vK8uYYZ+czun0pBBrqRt1PD0BAz/yCqGCfzn2HnF/KhUV0tz6uDqIgJTy/agWQFkFvYNKpToXxRZ1aYOkKro2Sji/q/LmR6QUuq8JuEwwLg63gy5sBTCWCS3pEUfngn5tzYb1+o4cB3u5GtTgEL2SGHL8sVgZQ9DSPdiGUDWP4EKn9bvYxZYIlzlC/3CZBL+MEqvSoYl4pMHkxIThaoTwooO+iuCJr4s4jfqdLfcoixgx6t2Tv6HLWFBaXz8p/FbBIlp1HbRdXVVLnk0jzlg0XEqx9C4s3h5JIN248E/YDMLFfDz5QPSZNg+XNMA8gf1t8fxOwHgs33nsIVfJ8evI6K2JEtrXOcVawINlk+HDVNrfhC9NzENCDTp3CgJRkV2v7oWByaxwOIP0hmWCHKS5w5N6OlfPHs0D+9kt47LRfJjfAGFjtLRBhVgDSBZFFs52v2NzjJOkXvAbWFQi86fpYMHFp1CcF6sdVUByipKKaBScCdryvFC7ln2WnPoVwfU4zRZoqlYTtkaLKvpquVtMDEhzYE6GGqzCFQ9LXzLVcVaZUG1AgHT1/ZdTExFvpBugtxQEcIOTz9xEgeVdYQbBLMSu/wob4W/qKAkHxk+Hg5fgL28Dp3S7XjQdbEMAiZmlde+Vvc6BiFr63
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 08:27:07.6287
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aff7a80-81d8-45a7-1675-08dc4e37b0d6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B078.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7019

Hi Luca,

On 26/03/2024 15:19, Luca Fancellu wrote:
> 
> 
>> On 25 Mar 2024, at 08:58, Michal Orzel <michal.orzel@amd.com> wrote:
>>
>> Hi Luca,
>>
> 
> Hi Michal,
> 
>> On 12/03/2024 14:03, Luca Fancellu wrote:
>>>
>>>
>>> Currently Xen is not exporting the static shared memory regions
>>> to the device tree as /memory node, this commit is fixing this
>>> issue.
>> Looking at the implementation, you will always call make_shm_memory_node() twice. For the first
>> time, to create /memory node and for the second time to create entry under /reserved-memory. Also,
>> you will create a separate /memory node for every single shmem region instead of combining them
>> in a single /memory region like make_memory_node() would do. Can't we reuse this function for simplicity?
> 
> You mean using make_memory_node() to populate /reserved-memory and /memory? I feel they are very different
> In terms of properties to be created, so I don’t think we should create a make_memory_node() that does both.
> 
> Otherwise if you were suggesting to modify make_memory_node() only for what concerns the /memory nodes,
yes, this is what I meant

> it might be feasible, however there are some parts that need to be skipped with some flags (all the code accessing .type
> member), if I understand correctly you like this function because it doesn’t create one node for every bank, but it creates
> reg addresses instead, in that case I could modify the current make_shm_memory_node() to do the same.
My concern is that we will have 2 functions to create memory nodes instead of one that can be reused. I know the issue is with
.type member. If skipping results in a worse code, then I'm ok with make_shm_memory_node() used for 2 purposes (would it be possible
to create /memory and entry under /reserved in the same call to a function?).

> 
>>
>> Also, afaict it is not forbidden to specify shmem range (correct me if I'm wrong), where guest address will be
>> within with RAM allocated by Xen (e.g. GPA RAM range 0x40000000 - 0x60000000 and shmem is at 0x50000000). In this case,
>> you would create yet another /memory node that would result in overlap (i.e. more than one /memory node specifying the same range).
> 
> This is a good point I didn’t think about, yes currently the code is creating overlapping nodes in that case, wow so it means I
> need to compute the non overlapping regions and emit a /memory node then! :) ouch
> 
> Please let me know if I understood correctly your comments.
> 
> Cheers,
> Luca
> 
>>
>> ~Michal
> 

~Michal


