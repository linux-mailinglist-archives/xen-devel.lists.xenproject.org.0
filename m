Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A407F0D00
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 08:50:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636452.991959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4z2S-0004a2-A3; Mon, 20 Nov 2023 07:49:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636452.991959; Mon, 20 Nov 2023 07:49:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4z2S-0004Wj-79; Mon, 20 Nov 2023 07:49:48 +0000
Received: by outflank-mailman (input) for mailman id 636452;
 Mon, 20 Nov 2023 07:49:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F3F/=HB=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1r4z2Q-0004Wd-7d
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 07:49:46 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20626.outbound.protection.outlook.com
 [2a01:111:f400:7e89::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c0fd8ac-8779-11ee-9b0e-b553b5be7939;
 Mon, 20 Nov 2023 08:49:41 +0100 (CET)
Received: from MN2PR10CA0022.namprd10.prod.outlook.com (2603:10b6:208:120::35)
 by CH3PR12MB7545.namprd12.prod.outlook.com (2603:10b6:610:146::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Mon, 20 Nov
 2023 07:49:38 +0000
Received: from BL02EPF0001A106.namprd05.prod.outlook.com
 (2603:10b6:208:120:cafe::f7) by MN2PR10CA0022.outlook.office365.com
 (2603:10b6:208:120::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27 via Frontend
 Transport; Mon, 20 Nov 2023 07:49:38 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A106.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Mon, 20 Nov 2023 07:49:37 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 20 Nov
 2023 01:49:33 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Mon, 20 Nov 2023 01:49:31 -0600
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
X-Inumbo-ID: 5c0fd8ac-8779-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EU7XJ85k+y/AOAC6d1450cZkGxuvubZatieNPeIvJPE7E4jUBupzYkMwJdhmyPWua3kwYj+RrbDRiy14K4Hwz0EcrOYXTvV1JlsjD3XAHLFffa2w1fKYeW8YVc29/SyKgn+n2Nkj2ElBZ+GwLIUXGHRqK3yE/miiKJh4hNpjPg1Dtt0zldcAB7kg0+nfghjLXQEjF3wFMqu2oUcv2AzESJwmxpsoag9kDbRXB4ivLzd/OsdmyhOMPm5299nBq4XVXuiHFLPg4URMSKP7Vce9aTkNNwbsyDIiSIemBtYfTpYSEjYEA9wEWYgT/bos9uvO/O1aFJgGxBXF+Yn+VFM+SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4AuotxSbapKYbp98PnuCWjuafLs1kWLuSEFZvD5mdso=;
 b=FmtlZN0GlM3cRtnMz4Qcm6JdtPFJ7BQGoxIeYdCe0A2TkYr2CWVe9XCcZrsVjhfjqunrwpya9RLZ68Ha3P+YoxHpfffTs0KoaYyiyvKOJ3a/5HJcIzx0kCxg7n7lX3/5ogOG/wsWtQVYWpC7hEa2dKQroqYrASTdBIH/4csfVxPFv9D7h5WghIZkawhulTOh1U1I7NfsquxU9VNOJH+/eGrwk2aC0x2DAgFot0GFL49f4vIaVHd6cQ99nQoq0BRimktohWlBpH4128Xcy5zdKGPwow6JWPdgyuzji8f5ISyQRf3wjAUce92e6JOSuiUDOwMFTSKPYSpbpRW90vJzsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4AuotxSbapKYbp98PnuCWjuafLs1kWLuSEFZvD5mdso=;
 b=PJpEsl40P9KF8DB4RJVb4ze6dJZMrle/iv0K7qORvuaGivmGzMQVzNZn+4CTgllFkV/ET32ByLjXB9LiDwSXpEmF+SM6Kp1RVfugwAGCzXdbzPp/I9ITgPE3EgmzWYK9jW4kmo8NJYi05fW10KwLGVB8LA+HZ2zDoXh3TSflFSI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <3ebf0bab-29ae-46dc-a110-acb1e90370cc@amd.com>
Date: Mon, 20 Nov 2023 08:49:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] xen/arm: Move static memory build code in separate
 modules
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: <rahul.singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231114090356.875180-1-luca.fancellu@arm.com>
 <20231114090356.875180-5-luca.fancellu@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20231114090356.875180-5-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A106:EE_|CH3PR12MB7545:EE_
X-MS-Office365-Filtering-Correlation-Id: 62792bcd-6ce9-4964-bfc9-08dbe99d3efc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HxCMlfGG1Jm5vxLfpUOQiuDjXhRcLRR2Jue/1PQu0021godrJ5394QkuBksidltx/t/oTZCorj7OUB/W3O5r+NVy/RntqJbjwzALoWB8urPLcojmS83JYZuSR7PlN0yxi+nQi68NfwxmbRzkWe9DVdbtIjhrqIfIMjvbxmTE5lO0wek+7fsK8EOssaXV9G0rIpQoR905XEctVgsexvqNk3ObXQJEeZcLsvh1wzgzKYVHTZLqnY+kFWn1yvVdTf9eCxc12JGKM6CVrUOWeWidK+tTL7PUVM9nlYOCffAYEn6kga/d/w+eG9+dxRiJPra+/VaRCa5I5gRSuhcj1g05GR0uxMHlc2WEl0cd3EvcpzIWCrKbvwhJ23vWFRGDlqkR97af6EHFFpY4A4G4pLo2qf6/oRya1etr3imgiovM5X+5mxEkfAV8GKpUZykbL9cyEQR9ObZKKpV5dDBWIX0bMZElFMXGjYTmtxhOtsMtj0hRlz06hwCU1pNIFNGHU4QNDS8ZU67yX6kW96MLs7uE0MmSPfKx1GZQl31jyXyiLJdkMWfzMqFnXpHDhDZCvFVMtPQCSuhd2CyYT+RLYvcz9ROOxb4r9CJGpOVf8j/PfEXHtTE1P+5DGtEYmsAwoXQmK1UzPexdahBDGwKF9WRNP/VreAMG4ocjbYofxop46qPjB4TbV8psQ0T3qY6lUPERnZla6ayrkS3r+2eC6eI4YExYqTeNRfjtb+w//MYBWGEbPyEHL6L6TEVt9YieqB8vPDqOt0zAsCD7jfK26Ape6/p3tM+IKe/glK7wwUvhtRqGFUMzB8mZndKaFjD3nrmnXaqlapkdUsUc6UjS1Osv2wMwjc5fcuD0j7ulaJRIEnM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(396003)(39860400002)(346002)(230922051799003)(230273577357003)(230173577357003)(186009)(451199024)(64100799003)(1800799012)(82310400011)(46966006)(36840700001)(40470700004)(40480700001)(81166007)(356005)(478600001)(2616005)(53546011)(426003)(336012)(82740400003)(26005)(316002)(70206006)(70586007)(110136005)(47076005)(16576012)(31686004)(54906003)(36860700001)(8936002)(4326008)(8676002)(44832011)(40460700003)(31696002)(5660300002)(4744005)(2906002)(41300700001)(86362001)(36756003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 07:49:37.8477
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62792bcd-6ce9-4964-bfc9-08dbe99d3efc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A106.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7545

Hi Luca,

On 14/11/2023 10:03, Luca Fancellu wrote:
> 
> 
> Move static memory and static shared memory code in separate modules
> so that they are included only when the corresponding feature is
> enabled, doing that we modularise the features and we remove some
> ifdefs from the code to improve readability.
> 
> Move process_shm_node function from bootfdt module and make it
> externally visible.
> 
> A static inline helper called process_shm_chosen is introduced, it
> will call the process_shm function for the '/chosen' node, and will
> be used by the function construct_dom0 instead of using directly
> process_shm, allowing some #ifdef to be removed.
> 
> No functional changes are intended.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

