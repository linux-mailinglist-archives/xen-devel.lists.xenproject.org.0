Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 181A16E0A77
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 11:47:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520589.808324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmtWv-0007Rq-D0; Thu, 13 Apr 2023 09:46:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520589.808324; Thu, 13 Apr 2023 09:46:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmtWv-0007P0-9h; Thu, 13 Apr 2023 09:46:13 +0000
Received: by outflank-mailman (input) for mailman id 520589;
 Thu, 13 Apr 2023 09:46:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=czPd=AE=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pmtWt-0007Ou-T9
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 09:46:11 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20624.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03443134-d9e0-11ed-8611-37d641c3527e;
 Thu, 13 Apr 2023 11:46:08 +0200 (CEST)
Received: from MW4PR04CA0115.namprd04.prod.outlook.com (2603:10b6:303:83::30)
 by MW3PR12MB4588.namprd12.prod.outlook.com (2603:10b6:303:2e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 09:46:04 +0000
Received: from CO1NAM11FT043.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:83:cafe::b8) by MW4PR04CA0115.outlook.office365.com
 (2603:10b6:303:83::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.40 via Frontend
 Transport; Thu, 13 Apr 2023 09:46:04 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT043.mail.protection.outlook.com (10.13.174.193) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.31 via Frontend Transport; Thu, 13 Apr 2023 09:46:03 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 13 Apr
 2023 04:46:02 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 13 Apr
 2023 02:45:57 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 13 Apr 2023 04:45:57 -0500
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
X-Inumbo-ID: 03443134-d9e0-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lrAc0zm+IydeOP9bEwZoAMbbOGokSPSy+fMqeGJToExmQbpzxgzhPZKL8EJEtw3xqA3XzmIdUF8f9A+xnZSihZD7k2qE2EW+WSL/ea34IQDvRmNS81WgxomopV8ebOSQ/GWuZaGs7DHslBrsDKpBbX+jQT2QUNdWUbx2Ar8XcJrFSc6SLRk1Wd1fqReuqNXLKsHQLLz/r3n97GJ1fj+1te6hgu03Wz6nnMyhw8+WeUXUJHEt297g/7/66LKaOQCb8ht2mrzjE71m5DojCtCq6/v9dIemfH++/2Gzs9yT446OU2lbwsPnLy9uP9aWasfiTUvLaJPR6BTsHuGPpCSqPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yBE32qRAmtmPbFr0kHVShrV/37fYMBBmHh6EfBSAWCA=;
 b=OdtewoJGY/wUSlJ7ePeAf+dEvl0c3iRYJUmcfDcVq9fNXTvEvANuKKDl1wAg4RWS+CdQql3G1DawhpSOpk+xhnbctSiBSo+LEqlq/hauf2JOuwwDgIsjmOg9cO+nWuSnHsaqgXL2oVrGOu8MvOrkOi7yX1fWgn9K/xWls2/MDKEs9XtsDmGRVR+dS1wkFjZXgRbgX4x2526F47NpGzbqpKTNwRCnynJNMqUVipTTfCa5jQ8ED63TGrTYGXNJpQMIzLBwu6lnJ+vxO8Go11B5Jq/DJq739J+8w9sb1xwpFdKsoSNmyONoGV0bF9CyUe+b6S1Aq22HadlYpZn9I3o0sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yBE32qRAmtmPbFr0kHVShrV/37fYMBBmHh6EfBSAWCA=;
 b=Mm/3/EIfnpaSPE4ed0Bzpb4RMs/1X5SuPTbkRm0gK6EazRAZOoXkFdin7fnCjKlK/Cq8zS0Mfm/JNlWIupE3tZdBggdle57mm4Rv7pTMuO5hSe4G00py50nly68Q2KMDnLO7VWHSutIAphyB7XJMNPN5zfHdz1emgODbqKnFAh4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <3f98a8b0-dea6-4ae4-137a-312e89af879b@amd.com>
Date: Thu, 13 Apr 2023 11:45:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [XEN][PATCH v5 02/17] common/device_tree: change
 __unflatten_device_tree()
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
References: <20230411191636.26926-1-vikram.garhwal@amd.com>
 <20230411191636.26926-3-vikram.garhwal@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230411191636.26926-3-vikram.garhwal@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT043:EE_|MW3PR12MB4588:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e9e7ae2-0701-4a4c-2067-08db3c03e5c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bbeuh9WHfASCepKZohvmeTSMfS1TuhzHoregaTFlt1jKbqnLlqJ6v3nfaGEdrsbQEWcLFlv1HC5CwajTOuhlHNZNFozSAZ7X8VnuvJLxqLmQRjtBQb8EMXnXjjWq1x2i/sgYp6mq8b1uiWthTf3f6aPPtI0p0SEyXuebRb4ckhb9uHY86l/FHphL7sL9lpsqgYWsfhOh4kpzE/P6bAPCujv8BJRePCqeSfik6mMipj6aSLkakL3XTvxB5LFFlQX8eYylkLZl2NaWGmSEDJGLcJzX1soTSlQv+eK8FckCufOOginuDDa4YCuRz8gDWVHI9omuZzYvVMBeKr+MGOGSZwsXcz7yDZ0aj33+1L6ijN2MnY94grltjD/yNoy5Lfk/bHljFfN87DBbrEtkPqznqs1rKeM5iZR+YFid4cyb/BdSZTIC/3f/WJRyOpF9nx+FiLKil6gzoZLGlMBPzsX9T+d9wkvW6Z4pjgRW/UroTrQpWz7NZVpe6qQIpa1rTjk02sPlzjvprUJwP5yv5rxEPoYY0XqN4CQfiLLUgQhsabNpH2TID9A5czB/jWPXAtpfQD3UFItEaQf/nDl1lrr4UoSCP4CuP20rsJRXWdSV0xEyhDZquPjveg4vGCOjSm8H70jcsBwbUZQBGBptSf/RojvVTO6+G4tGWhbqrBI1xjrq2kPOlMu2JecDHppgr9fARU2mK+nUWYNsBA0UUt5eMFjX4r5YSCa2ogTDbATNS62iaGOsztNa+WABY3HRM0twFySxxL/eVBZCdFaIfEkhwg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(136003)(396003)(451199021)(46966006)(36840700001)(40470700004)(31686004)(36860700001)(336012)(5660300002)(36756003)(4744005)(2906002)(44832011)(31696002)(316002)(40480700001)(8676002)(8936002)(86362001)(41300700001)(81166007)(356005)(40460700003)(82310400005)(4326008)(82740400003)(70206006)(426003)(70586007)(2616005)(47076005)(54906003)(16576012)(186003)(478600001)(110136005)(26005)(53546011)(6666004)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 09:46:03.9317
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e9e7ae2-0701-4a4c-2067-08db3c03e5c8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT043.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4588

Hi Vikram,

On 11/04/2023 21:16, Vikram Garhwal wrote:
> 
> 
> Following changes are done to __unflatten_device_tree():
>     1. __unflatten_device_tree() is renamed to unflatten_device_tree().
>     2. Remove static function type.
I think there was no need to touch this function in patch 1 if you are modifying it here
additionally in a separate patch.

>     3. Add handling of memory allocation. This will be useful in dynamic node
>         programming when we unflatten the dt during runtime memory allocation
>         can fail.
Didn't we say that checking if the memory allocation failed or not should be done
as a separate patch (i.e. a prerequisite to your series) as part of hardening?

In any case (depending on the maintainers vote), the change itself looks ok, so:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

