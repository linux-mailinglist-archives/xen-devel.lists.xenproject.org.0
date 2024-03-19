Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD13F87FC73
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 11:59:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695303.1084978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmXAD-0007fn-DI; Tue, 19 Mar 2024 10:57:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695303.1084978; Tue, 19 Mar 2024 10:57:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmXAD-0007e1-9n; Tue, 19 Mar 2024 10:57:49 +0000
Received: by outflank-mailman (input) for mailman id 695303;
 Tue, 19 Mar 2024 10:57:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9UIi=KZ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rmXAB-0007ds-Cf
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 10:57:47 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20601.outbound.protection.outlook.com
 [2a01:111:f403:2409::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 833ec2af-e5df-11ee-a1ee-f123f15fe8a2;
 Tue, 19 Mar 2024 11:57:45 +0100 (CET)
Received: from CH2PR10CA0001.namprd10.prod.outlook.com (2603:10b6:610:4c::11)
 by PH8PR12MB6889.namprd12.prod.outlook.com (2603:10b6:510:1c9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.30; Tue, 19 Mar
 2024 10:57:39 +0000
Received: from CH2PEPF00000149.namprd02.prod.outlook.com
 (2603:10b6:610:4c:cafe::3d) by CH2PR10CA0001.outlook.office365.com
 (2603:10b6:610:4c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.28 via Frontend
 Transport; Tue, 19 Mar 2024 10:57:38 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000149.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Tue, 19 Mar 2024 10:57:38 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 19 Mar
 2024 05:57:38 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 19 Mar 2024 05:57:36 -0500
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
X-Inumbo-ID: 833ec2af-e5df-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aiEUBhMuXQsQ5H/zVngpgD6cPLACSRlpL4Lxq/JxprihtupXnycWVdnU94bdurpNCLBoUbX1zUK4eKYW1CrZjTeRJ3qq4VyilVT5c1raofLKnYUINYCquRtVXxXCEGMruW/RbOJEf/UqSGBjBLV38lmNLrzpMTW2oL1pTfPrzXkEQ9xKvCrKUnX04Yndg+Ebcc52j5hJR4FUKcOWzWldjqlBxc3YzWPMD3pc51NWeb+flei1AeUE61Z280aBlYYsaT6Cj04zzxDgy6K5SSbYH3lQNjEwVRR87/J7is6u705XUjo2Lq38Jir9dJB5D4H5MaSANCR3eq+rW9/9zWYXTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xv7+b4BDoffw7pFU2AlG+AUJAjNM6iLHSd6PgPsx4XU=;
 b=GxENmxeoiz4OZnI6E1uNuAXmttvM5/kh8hLcw9Pac8pitQLQSUG1ZISKtOatVIu610kuyETkXravcncoErl/RRB3Fp6Nxse0GMCWGJly8zCSEm+QIIeTfTVXsW3d4T04wiyW65u84Qdy3omiVLnkv9aLQo1JVxQWNcW1WEt3ZU/Ml3oyQNX0Suc7oS9BQd0F36mr41r2QXX+xpll7ysewPCvnkPG23tolTG5vQJu03YHtQfD/bDz3WFqYytWak5ZK7Gb8qKFUd796b6gqxggfwW7WWXpR7FBCt0NCryGjQfnyjkOp4oIuib33l7AWmm4FyhwMfYf2sJHF6reCZo3lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xv7+b4BDoffw7pFU2AlG+AUJAjNM6iLHSd6PgPsx4XU=;
 b=tQpGvggTwPGMALEUH9SwqO9z0EaovnGggJQV3gfikMBQynRwGLeaRLPKXLUA1381mL0WwnCv0slzLdWo3mGwsjtibSrumVcGl8EtlRGIJl3z7E7532k3aOg2H0JDFKQCJS/jwoHeQp09jrQ6VYmERlAtL6EtiiwGbU5WjnQ0EDY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <7238287a-0f5c-4045-bfb6-a58ec1873471@amd.com>
Date: Tue, 19 Mar 2024 11:57:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] xen/arm: avoid repetitive checking in
 process_shm_node
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Penny Zheng <Penny.Zheng@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240312130331.78418-1-luca.fancellu@arm.com>
 <20240312130331.78418-3-luca.fancellu@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240312130331.78418-3-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000149:EE_|PH8PR12MB6889:EE_
X-MS-Office365-Filtering-Correlation-Id: c22d167c-f7fe-465d-9799-08dc48036451
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	y7pF3rSjPozbZB/Yc2q9+O81SNSWqxh84Oi6yaR9TZe6YT80Gvb164PC/21LNG2GTWrJx7dv+j/0cxueU2utcpTcrO8b45gDihFJ9Jt+XfPBZWWwYw1AApkFTbi6D4SfUPRR8ovtjUlvrGgZIRReLTuO8R8pQE9ap4CJ2IiAlcZpzm6/S/OrMRL//HaYFgOniVsVXn8MOsskAaC0CD4pgh5tiZYAPqVFHcwA2ZtDrI71LFBWPJeSWINiNUfCoX2npsDpGJ1+Tary36j3600vihUzYUHyxeO5wQjo+nQEnfuQRjkn/oUFLwcrw8POWtQ9lFULu5R5A6W7eawXvQ59xRd54Az16grfIWKF6Ni0UoKVydMSE2A9U8Ft2aH7BqmlTU/tHbHyVquYCgIOPFnyB/Hsy0J0lTxC0uBf/ZChkdOF74aqUSntp4o14XQvZOSx5PINVhiLCcYIaNlCeQ7lQgfkJEgE5sfFIzCvX//o5zOfEjthNyBCBe4AU+1rpQP6aM47mrSb2OmSC9H4Pe6eiYtuY8DpOjq7/HGg1ItD8/ebl2g43HgC++eZtbYkZltnmiIEGmTb5mqTtln0jpEuDcYNa2aQxG1Xz0KKBLvekAQk2sc0JgkIKDJpTuGnSu5fovLFZDjvc8i/SQTR4K+o6VRK7Bu/p+3PyQOoO1rXo1tujHa0pUoDwYQILhUhyZkq10bdXuI2pYrN9XqKZ5yjHQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2024 10:57:38.4313
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c22d167c-f7fe-465d-9799-08dc48036451
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000149.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6889

Hi Luca,

On 12/03/2024 14:03, Luca Fancellu wrote:
> 
> 
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> Putting overlap and overflow checking in the loop is causing repetitive
> operation, so this commit extracts both checking outside the loop.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> v1:
>  - Rework of https://patchwork.kernel.org/project/xen-devel/patch/20231206090623.1932275-3-Penny.Zheng@arm.com/
>  - use strncmp to match the branch above
I don't understand why we need strncmp if we already validated that shm_id is NULL terminated within MAX_SHM_ID_LENGTH
at the beginning of the function with strnlen.

Other than that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

