Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB37C7FEC8A
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 11:09:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644526.1005648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8dyY-0005Ya-Oh; Thu, 30 Nov 2023 10:08:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644526.1005648; Thu, 30 Nov 2023 10:08:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8dyY-0005VG-LQ; Thu, 30 Nov 2023 10:08:54 +0000
Received: by outflank-mailman (input) for mailman id 644526;
 Thu, 30 Nov 2023 10:08:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u2PQ=HL=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1r8dyW-0005VA-Vi
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 10:08:52 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20631.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75a3cd0e-8f68-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 11:08:51 +0100 (CET)
Received: from CY5PR10CA0013.namprd10.prod.outlook.com (2603:10b6:930:1c::16)
 by BY5PR12MB4870.namprd12.prod.outlook.com (2603:10b6:a03:1de::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Thu, 30 Nov
 2023 10:08:45 +0000
Received: from CY4PEPF0000E9D0.namprd03.prod.outlook.com
 (2603:10b6:930:1c:cafe::64) by CY5PR10CA0013.outlook.office365.com
 (2603:10b6:930:1c::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23 via Frontend
 Transport; Thu, 30 Nov 2023 10:08:45 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D0.mail.protection.outlook.com (10.167.241.143) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7046.17 via Frontend Transport; Thu, 30 Nov 2023 10:08:45 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 30 Nov
 2023 04:08:45 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 30 Nov
 2023 04:08:44 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Thu, 30 Nov 2023 04:08:43 -0600
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
X-Inumbo-ID: 75a3cd0e-8f68-11ee-98e4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fAlKmHE34OLBa74PVXcNh5yiCnlcfO5iciwMYp1Ej9POk1DtAQi+ixykN45PKbgcb/7ccR0s28Vy4IL95uGI9kTyGzphlX1ZCFQR0KuzNZdJ/b2Ci1ioTQ/KGmp+cHa0tpvH6Xyzx9//rfesww/h13iCW0KGPT8xq/Y6P5M14iIXgRW0iKFL98YUi3HUnjP1kLS08CaX2j2YHQySjm92RQNwue5VvIcYmdrU6XdcKfbN7A7MHLJCIIpWRwulyqpJIx6mjge8azb8X42OimXe609yJ2uurmpzEwdczJz+MqWITc9NPbDr7rDV336i2A8FQOo/gUKBFfavrmLAFAsc3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNeO8PW/yrBpL1uCI/q9CXbz0klFNZCGssEdBDoelhk=;
 b=gY+mh1gIZo6vGq8SSyWFz2mVqqkYJqSDZP1scR3WrBLx/6pO4LxxeS3J3RvysoNpPr9anx7tH5b5QYmxrsNNUsubY5rHnt42Rdext4swho/EXh0npNiunhea6G7HOi6kRiaQ353uHFsklBgQ4Bc1FseeaYMr+P1k4jUth22tTy7jlFSBDJfipr9+Ks6udaVxns7teA7UtuLfBDtJlFKfH8MFVxdzoKJDaVsjcvY9njP0y5J/QsxeMSe3ndvrdsy3Q4RjbLVCGcLn09mp2pME+1sRnig+YdLDaCtBVLTZtCWVdOoOFtBckHxMLKmSfnw57ANVr5FCxPTOKHk8ZDfTMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNeO8PW/yrBpL1uCI/q9CXbz0klFNZCGssEdBDoelhk=;
 b=PxFem7CkM7JP5edqjjlETiFncnXEeSvxA7iA69xrPvtHkOprTuw0Y/MSjUohBe+msz7NSIEFTT8oUkpEBw5wEsTXUHlVVycbZQnGcWGRLPkA+4su8FAU8xaeyICH56CG8lBa1+vHU/tJBCXZkHo41mtiC6XhXQ4jrUgDmFh4AHw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <e78280bd-4070-4357-841e-acbb5cea1127@amd.com>
Date: Thu, 30 Nov 2023 11:08:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/10] Follow-up static shared memory PART I
Content-Language: en-US
To: Penny Zheng <penny.zheng@arm.com>, <xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230911040442.2541398-1-Penny.Zheng@arm.com>
 <046aecc4-7270-0041-67dd-51614d2beee6@amd.com>
 <2124b9ea-4c74-780a-f97f-ca3b3d7c9b16@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <2124b9ea-4c74-780a-f97f-ca3b3d7c9b16@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D0:EE_|BY5PR12MB4870:EE_
X-MS-Office365-Filtering-Correlation-Id: f0dfab44-d22a-45ee-8516-08dbf18c56dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WZ6CPfOjWaz/CSuaESY0BZkypQcC5Gd2kaFxdHPUxkxZ1fxMj0ghfMyF9+6SffHD0mUZMSCUkbl5XRVhrzLVD0B3QUhdE7qnIbLjuVjmC7pVnhy0ab/CYjeMjDYToC/GIbepuwWt3mMa0XwkdNHrnjVNiC2myknSCxYgd20hTDwY9cEWWktqVl0dz3WJIDnOPcFJ7PImEmH5BZrSNcqRHf5/TVg7fLZN+3BN1cdUtp3Vb0gfSeKgsiVpXMFF9BCJWeF9WKUQuOeXSYXvLFjTHvPfWCMJ+P3y8jsja7bhcPMx1VxhB4n3fqLTYZ/2f93hObrpDY+d4eP0a/CS1pFRMsh2JJi4mf/4rypoLj5DFQ1tXBCEMLXOsyOke6TejVjYAJ6PHHfTCyFa4zULQrVRMNiBZYnB8SUqD6HZlgoMLGl+MzAySNYIochap5P8Ws3FOi5GRCzyC4QWM+gRXeXQzDZnIP3yeltu+rdH6d31kDCj6v438jCKys+DAdvdfJyhCFajZTJkbXw0Ku1SYwxxVeI1nfrTN+UtMswUMnrVVK7r6ylEsB+VveyEI3O4pCJqhKHL5JfiS0XbYv60UK0c/V9+45vJzYbwBZ5rMR16NgAOJlFtd4m4s0ClYmYZG59e0HP10m93FcmTOVDsZvFSFn3ExyZJotDQA87bPrWuQkg0UYOiC0HPpfXGZMZ+PehFn1GgjXCyQkNjFwIwVyfsyXn9W8itF2XrCSnbqlPVTptGVo93dizjcjQgVDeGNJlJ9x3UlYNQBGUXowXE4HfIyXeKypXC5z6/TPJstl8e6UPM/JIDi5xiSO40hnFBVPJtkYqOcdfOEHDN/OTqWqtNZA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(136003)(376002)(396003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(82310400011)(46966006)(36840700001)(40470700004)(40460700003)(26005)(336012)(83380400001)(426003)(53546011)(2616005)(36860700001)(47076005)(44832011)(5660300002)(4326008)(8676002)(8936002)(41300700001)(2906002)(966005)(478600001)(316002)(16576012)(110136005)(54906003)(70206006)(70586007)(202311291699003)(31696002)(86362001)(36756003)(81166007)(82740400003)(356005)(40480700001)(31686004)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 10:08:45.6971
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0dfab44-d22a-45ee-8516-08dbf18c56dc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4870

Hi Penny,

On 11/09/2023 12:04, Penny Zheng wrote:
> 
> 
> Hi Michal
> 
> On 2023/9/11 17:01, Michal Orzel wrote:
>> Hi Penny,
>>
>> On 11/09/2023 06:04, Penny Zheng wrote:
>>>
>>>
>>> There are some unsolving issues on current 4.17 static shared memory
>>> feature[1], including:
>>> - In order to avoid keeping growing 'membank', having the shared memory
>>> info in separate structures is preferred.
>>> - Missing implementation on having the host address optional in
>>> "xen,shared-mem" property
>>> - Removing static shared memory from extended regions
>>> - Missing reference release on foreign superpage
>>> - Fix duplicated /reserved-memory node on Dom0
>>> - Missing static shm node declaration on guest /memory node
>>> - Missing "xen,offset" feature, which is introduced in Linux DOC[2]
>>>
>>> All above objects have been divided into two parts to complete. And this
>>> patch serie is PART I.
>>
>> Just like I pointed out in the previous revision, there is a gitlab CI failure on shared-memory jobs:
>> https://gitlab.com/xen-project/patchew/xen/-/pipelines/999098293
>> Did you change the interface that could lead to this (I cannot spot any change in the docs refinment) ?
>> No Xen logs meaning the early boot failure. Please check.
>>
> 
> Soooooo sorry. I miss-looked that comment. I found that bug exists in
> bootfdt.c.
> ```
> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> index 7d86dffd45..290dd27bf4 100644
> --- a/xen/arch/arm/bootfdt.c
> +++ b/xen/arch/arm/bootfdt.c
> @@ -532,6 +532,8 @@ static int __init process_shm_node(const void *fdt,
> int node,
>                              size, tot_size);
>                       return -EINVAL;
>                   }
> +
> +                break;
>               }
>               else if ( paddr_assigned )
>               {
> ```
> I accidentally delete a `break;` here, and I will also comment in the
> related commit and fix in next version!
> 
While searching for the pending series, I noticed this one.
If you have time and want us to review the series, please send an updated version
based on the recent Luca's dom0less features modularization.

~Michal

