Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC7179A686
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 11:02:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599170.934456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfco5-00079i-ET; Mon, 11 Sep 2023 09:02:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599170.934456; Mon, 11 Sep 2023 09:02:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfco5-00077d-Bh; Mon, 11 Sep 2023 09:02:09 +0000
Received: by outflank-mailman (input) for mailman id 599170;
 Mon, 11 Sep 2023 09:02:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yA6l=E3=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qfco4-00077X-1B
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 09:02:08 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20603.outbound.protection.outlook.com
 [2a01:111:f400:7e89::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e120b880-5081-11ee-8784-cb3800f73035;
 Mon, 11 Sep 2023 11:02:06 +0200 (CEST)
Received: from DM6PR06CA0099.namprd06.prod.outlook.com (2603:10b6:5:336::32)
 by DM4PR12MB7574.namprd12.prod.outlook.com (2603:10b6:8:10e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.34; Mon, 11 Sep
 2023 09:02:00 +0000
Received: from DS3PEPF000099DF.namprd04.prod.outlook.com
 (2603:10b6:5:336:cafe::d2) by DM6PR06CA0099.outlook.office365.com
 (2603:10b6:5:336::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35 via Frontend
 Transport; Mon, 11 Sep 2023 09:02:00 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099DF.mail.protection.outlook.com (10.167.17.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.16 via Frontend Transport; Mon, 11 Sep 2023 09:02:00 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 11 Sep
 2023 04:01:58 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 11 Sep
 2023 04:01:42 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 11 Sep 2023 04:01:41 -0500
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
X-Inumbo-ID: e120b880-5081-11ee-8784-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BC1xJDzDSPd7a6o38v0/VcWbdtmBqbgU3aV+wzZgT5+XISmz+vrf3yEgUk8s1cqXeQw6TflXBaRMuuTD0Yk+NuM3acH1EwK26banLiwqEnVP1OqLL5SilqfTPR0xRpc7lRViofw10tBcymArNuEgEOmTwmcBfRexUYrUVAkU0tOKtI0FFLf4OV69eMxEEFFlUsrYoI3AolmMwMt4SXl4ZMSrLuEqiJ90Cg16yAGlJmW+oPAp1OopALMFsWhH1lsNyXIjYXKLDapX4BLmJfXzQN554Z+s3II/BDdmxDdpzLdCDNIgIRKDpYiTGkErozFfLnYRDS8THd9DjF3cr5313g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=daV8A8BOhnpIeES+fYrDVNuxj31UiKKLnvTgEC074hw=;
 b=kLrhhN3GQmGuzShiPiupI0FJ69Efi5nk6ElfomSbRanKdT2H/HRRjCh1726hm7GdoAfQ/PdVPQrifTRVR06xfnHq/sN9IandmaOjciZPW7KPauTnW7e0uqTQoErvH8DUtg/5FmC2UvD9btm0EbcPyy2eJts/FP5NKsAmA5rM4J+HZDOu5FkZky9Co3PX+0omOz8UqG+6kgjI0rlrW86o0Kui2Hk+Ls65WMJe06y25yqkV2K9h1r/n64uscMT7UA3DCbGffGxwtMBp9VN54nathx4Y7ZVD3+CqjYyQNtSZYjkhZccDAmOkZVu4utzc49av4efC7fHWS7RYCf9ICslDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=daV8A8BOhnpIeES+fYrDVNuxj31UiKKLnvTgEC074hw=;
 b=Cfe+Pc36Z6yC8c6gK8R0IuGLK5D15vWyIpKhCF4TdxY9xV15rpFQlaucT3Pu49GIy/NeXUwiDZXVhNCkQG9VCd+FuVqWG9oeY5Hvh1ZATyZs+cSNVYhKHE8CCTwBegySEcxN2w39bJBFmUpNaZgVdVCot8iiFkBZKv1XrX2WYqI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <046aecc4-7270-0041-67dd-51614d2beee6@amd.com>
Date: Mon, 11 Sep 2023 11:01:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v4 00/10] Follow-up static shared memory PART I
To: Penny Zheng <Penny.Zheng@arm.com>, <xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230911040442.2541398-1-Penny.Zheng@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230911040442.2541398-1-Penny.Zheng@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DF:EE_|DM4PR12MB7574:EE_
X-MS-Office365-Filtering-Correlation-Id: ef99725e-a790-40fc-4cca-08dbb2a5c2ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5RznSYXB0ZCp89o1VgzV61rB+zlEKmJ+VngXf4RpFmmukqINTI7LeSdXmkwZNwYsCqD8FwtmgkapmluHGZEHZbYChcEfBmeqgA4OhX5QlTsLYkNsRqGe+Mi8RLiwxKXcvAsaC+jkkpWKnlr2QYPj+3NGAneiy61Bq0Lcf9qYWUrPYzoHyiYYeO/zbfgImvYGHKYgejC4BRxVeNt68yiQmBmxr6C/dZTyBqoJEIMIJnccTNgTK++1DVK1O0rJvM+CrEiY4dzDh8C+mJIOaU7Um+4UneQnNNPd8bfVKpuhy+U+C2DA+mNEogp6NBHzrFM6g2PYehMGy1lQjm4JV793gXFWz5x/dwDQNlAhqoZtQa06ET7ZMbXuAX6SQBJ2q2e6LUBmbSuwJ5Ikkvvqy4vxjM+v+dDut4q+9J0HSQ/VTvPSxuF7HKlUkomJ8x2J5web6zFEqOZ67RM6nPW/0wIlfr70TXZMr04vEhDAODf30CViIvLTWwrQzjqPAaw7i4U+skRa5T2Ykbp/ZmbWdAjlUQaNqYO0A54Hk1CcoBXmq4qgVC0k+c4EdVl9g141WnUC6OGKKe6yNv+iSPey6dMWqjAOdKQj4BIz0v7ay0q4HEWEC0LceXQTiHWeVZSuHRRtWKKT1s5Pw0YMCj3MH8aWuCszbpnoMXNZGBBYKAdM4KcxOrwTcMV9kKvErqDsZnkr5itRQQx/Lzzgp28eF+mSlc4CJCCx2/ta4Ixm2Sh2awdAWOgXvGluulz1q6KtabWqiafVD5LFjevtGICU8ycXbOu4s0gPvF7WeybebFGl4Xs=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(376002)(396003)(39860400002)(82310400011)(1800799009)(186009)(451199024)(46966006)(36840700001)(40470700004)(6666004)(53546011)(966005)(478600001)(83380400001)(2616005)(426003)(336012)(2906002)(26005)(44832011)(16576012)(54906003)(70206006)(70586007)(316002)(110136005)(5660300002)(4326008)(8936002)(8676002)(40460700003)(36860700001)(356005)(47076005)(40480700001)(86362001)(31696002)(36756003)(82740400003)(41300700001)(81166007)(31686004)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 09:02:00.7695
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef99725e-a790-40fc-4cca-08dbb2a5c2ac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7574

Hi Penny,

On 11/09/2023 06:04, Penny Zheng wrote:
> 
> 
> There are some unsolving issues on current 4.17 static shared memory
> feature[1], including:
> - In order to avoid keeping growing 'membank', having the shared memory
> info in separate structures is preferred.
> - Missing implementation on having the host address optional in
> "xen,shared-mem" property
> - Removing static shared memory from extended regions
> - Missing reference release on foreign superpage
> - Fix duplicated /reserved-memory node on Dom0
> - Missing static shm node declaration on guest /memory node
> - Missing "xen,offset" feature, which is introduced in Linux DOC[2]
> 
> All above objects have been divided into two parts to complete. And this
> patch serie is PART I.

Just like I pointed out in the previous revision, there is a gitlab CI failure on shared-memory jobs:
https://gitlab.com/xen-project/patchew/xen/-/pipelines/999098293
Did you change the interface that could lead to this (I cannot spot any change in the docs refinment) ?
No Xen logs meaning the early boot failure. Please check.

~Michal

