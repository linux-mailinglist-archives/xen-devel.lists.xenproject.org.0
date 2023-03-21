Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8DB6C38AA
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 18:52:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512951.793402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peg9l-0001Ck-AY; Tue, 21 Mar 2023 17:52:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512951.793402; Tue, 21 Mar 2023 17:52:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peg9l-0001A1-7j; Tue, 21 Mar 2023 17:52:21 +0000
Received: by outflank-mailman (input) for mailman id 512951;
 Tue, 21 Mar 2023 17:52:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y6SQ=7N=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1peg9j-00019v-Vl
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 17:52:20 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20615.outbound.protection.outlook.com
 [2a01:111:f400:fe59::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f33a905-c811-11ed-87f5-c1b5be75604c;
 Tue, 21 Mar 2023 18:52:18 +0100 (CET)
Received: from MW2PR2101CA0018.namprd21.prod.outlook.com (2603:10b6:302:1::31)
 by LV2PR12MB5798.namprd12.prod.outlook.com (2603:10b6:408:17a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 17:52:15 +0000
Received: from CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:302:1:cafe::fc) by MW2PR2101CA0018.outlook.office365.com
 (2603:10b6:302:1::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.3 via Frontend
 Transport; Tue, 21 Mar 2023 17:52:14 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT052.mail.protection.outlook.com (10.13.174.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6222.16 via Frontend Transport; Tue, 21 Mar 2023 17:52:14 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 21 Mar
 2023 12:52:13 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 21 Mar
 2023 10:52:12 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 21 Mar 2023 12:52:11 -0500
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
X-Inumbo-ID: 1f33a905-c811-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=foc1zUkv8myYaE/AaGBxhlsJXz47qiX171LFLJkqzPd221zxUBi20TQ1+N0YnQKXgnOkj1GpWB31Eqs/5ez89ZcVHLc4xwXip9PN0oU0eysf1gCv2BAjQeoWu5zTXXnHQJZxCfGCni837jJ+piO2vxCTMcLK+Jd/VZZao6hI3gRaEzKsNmLWdnf6Ze2ZPHoB/KrSfgXn77NXpzv1Nl25QyiXR+WQkf5l9sTQSasOJU9SyeC+9zHOG85VD2RBSvg+ZOneITs9h+j3MUGH1P5eX7AXChJMIo3dQeXb54TWDBN7pdunKMc/95V3Kl8gor7mp0VeKcqwsoYbc5i8l3GEUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g3fF1i+jW0UPGJxpZ3us0lVn8AiP/nB+AD92GhayYiA=;
 b=V7i2Hoel+ELvbaJKK32anJALVQhq9F0foPbVqr2O6Gzd3mUA5TVr/YsGwQLmpsI15693tVNY+kmd4rVSMnx6qExSoXXzfLqwBJw3L2yZI7TmHwKWbcDkrGiINsSy/C6xvmAdyxQbCs87eNbmcObTelMI82R213e+VN25AAdSoJS8XbXCosNjEzUCSrcsGybyQeY2vMt5bAA1O9VPSYenqCcx74AJrWeWbXfURlu5lvhG/DQh6CLkoHBv/fgM9Y74lgYBMA2nwDAS3DwHmEbziqjeEmxJRyXnMdi/KXZkz+G9YYNKzwhnkocuRrxOnUz+byvbb4Ri5l8ksNoRB1ZdCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g3fF1i+jW0UPGJxpZ3us0lVn8AiP/nB+AD92GhayYiA=;
 b=yr8r31T1oJKuD9gHexH7tBSQiX1rD+5czZTl2v1uNjrSgMzBn/wMR+m2Y8TQtyU9b2+cn0x+zvdoy4skMD/8apwRKhsF5tcykSf+eHzzc5tcvcZxWBLxfzeqd81wL2kZoe3G9CnajQiR71Gz3UMTQ6z9prN4P+MkcZsQ0SUV05E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <73c0df32-844d-b2ba-f212-3e04c1753236@amd.com>
Date: Tue, 21 Mar 2023 18:52:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] xen/arm: irq: Constify the first parameter of
 platform_get_irq_byname()
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <andrei.cherechesu@oss.nxp.com>, Julien Grall <jgrall@amazon.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230321171721.2502-1-julien@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230321171721.2502-1-julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT052:EE_|LV2PR12MB5798:EE_
X-MS-Office365-Filtering-Correlation-Id: 9948c18b-0378-43a5-d270-08db2a350118
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Uu/LBErmAP1QdqOEaW0Jz+aq0B8edc27d4q2EsWlB42x4m5ftAK0p43yM+5o+/5MXmGjr1Cn6VXDDRF+2X0Vfv5cMO6HDF2Mg8RNT6IJagyypKseQZutU2K13n1pe1B76mhlHFwJU21ii7OGzIWlhG4JP0woOET3jZrUDYNoEd1irzEsVpPeYyMlGhu+orv/2gPy5zDMiTenAQQNW/zCkye7GR/NvSWnIXNleif1he/6Dgfl4TKrxIg+cmsS1mfiyVW9zBP1TN3rluSTcIlTrsotVNzO7g3U7+raF2Fn2HKC8393dZDDQqYOwn10n/+GwxOLTxgwb2J3OzxRsGI40NXpeFaQymNRZHS5l5INoylOCCA/yro50X4Y5P7mqKji9TZFiCPNvn++deFWApa9RMRy9DCZsP41C4ZEIT4oksbu+pBDqf284WZF7ykWSWPergBnnoUvLQYmQj1Km5dY0b5nKTxBXWFdtURCr3jfRddcWQGdHbJjTBSt+c3sGn/BWlYUbbouzC7ynevr3No+B9rZERB2M0oCyBpRA9+lPdUUR+lloNDUdbiS6v3ivGphW7PpK3V52mc3CQJEf5gVX324RHgOcxvFZM4DRMbhaV6fopGotMRODssYuhdPRifpIn2hZL+Y1XCSMdZsNxPcGkRcxwsrXmXRBdirem4u3qlWr8AEWrgD0rgY8zjs7bM9wloMky09p1zFBrJ30ds8KQoSE5cuC2nQ0QqfwKlVWpd+chQjZikfKjJhvWIuG4Fzzd9k/Baoj8f+ACpTXr4tCg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(136003)(346002)(39860400002)(451199018)(40470700004)(46966006)(36840700001)(31696002)(86362001)(40460700003)(558084003)(40480700001)(82310400005)(36756003)(316002)(4326008)(186003)(478600001)(70206006)(110136005)(16576012)(8676002)(70586007)(53546011)(2616005)(426003)(31686004)(6666004)(336012)(47076005)(54906003)(26005)(356005)(5660300002)(44832011)(36860700001)(8936002)(2906002)(81166007)(41300700001)(82740400003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 17:52:14.1531
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9948c18b-0378-43a5-d270-08db2a350118
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5798

Hi Julien,

On 21/03/2023 18:17, Julien Grall wrote:
> 
> 
> From: Julien Grall <jgrall@amazon.com>
> 
> platform_get_irq_byname() is not meant to modify the parameter 'np'. So
> constify it.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


