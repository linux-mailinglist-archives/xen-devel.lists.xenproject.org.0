Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA1A640845
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 15:20:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.452034.709857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p16st-0007wA-Jj; Fri, 02 Dec 2022 14:19:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 452034.709857; Fri, 02 Dec 2022 14:19:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p16st-0007u1-FP; Fri, 02 Dec 2022 14:19:23 +0000
Received: by outflank-mailman (input) for mailman id 452034;
 Fri, 02 Dec 2022 14:19:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NC9X=4A=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p16sr-0007tv-W5
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 14:19:22 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20608.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f6ab6ce-724c-11ed-8fd2-01056ac49cbb;
 Fri, 02 Dec 2022 15:19:20 +0100 (CET)
Received: from MW4PR03CA0294.namprd03.prod.outlook.com (2603:10b6:303:b5::29)
 by SA0PR12MB4365.namprd12.prod.outlook.com (2603:10b6:806:96::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Fri, 2 Dec
 2022 14:19:17 +0000
Received: from CO1NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b5:cafe::81) by MW4PR03CA0294.outlook.office365.com
 (2603:10b6:303:b5::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10 via Frontend
 Transport; Fri, 2 Dec 2022 14:19:17 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT021.mail.protection.outlook.com (10.13.175.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.10 via Frontend Transport; Fri, 2 Dec 2022 14:19:17 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 2 Dec
 2022 08:19:15 -0600
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 2 Dec 2022 08:19:13 -0600
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
X-Inumbo-ID: 4f6ab6ce-724c-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bmlOfVSw9WhNyAaU9AW/ImK6IDraL+QBV+FMVXuo3dLPLqzLUru7JoyuhKtzbawCKpyYxK5hPF0zXcpiTZGYC7bqLob+5rsWt8CW20Rz0yOu+Sq5MvF1DYaA2f6QU8k8veSgKqaoJeBtVSlw/ml/u555XY4ji1JiPszttHARAJqfxtSiH1zRCGSmeooIDydSTQGOi0uDxZyLvUnWC7o1yG4g8/sRZX9YRxJz0dwYl8RVMHndml7JuNa5qGT/J4+QxRjoUmGf1iwrtqYyY5KODscI2Mc4TcoSY7TWqJnNGL56oIXQNWbLZV4NjfylkBBIH9J07kHHa32KH6zScE2OxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X82WY2l648lDXTfyhxETZdxhcU7yEVu/JXMELHSHWGg=;
 b=M1Wh1B4iFlJ12SukdVZEx3DCAu1ylIk/UGHs6dF4pE3IT8736cOm8h50YIVvwF03q66t2B24r4OkXSIBXwNM8XYGM+je4YbWepVK115zMm2mV6+yGSNyOrR/6GLzd2uUv4XNgsG1PbFdrNq7B5XUg64F536iRxX2Oget3W5GB04/2Abs+6rd8U7D9h6qgp6jVqPpO8eC3rMMyXPjsc3B1DV4QctyTamJtVRphcGgE9bM590zUJQ38KXnwF9y9duUYdCaBqB4cCfxy6kTYmj55RnbTNAybCFDkcun59VDInZ6/y9VA9veQ/MfMeBeRvpGh6nLZnDW9cKWQIl4gqAQkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X82WY2l648lDXTfyhxETZdxhcU7yEVu/JXMELHSHWGg=;
 b=OSiFQhgX3XjmZ+Kb9X93ny/fLnTievdCR2UBCXJxa4Phlvb9E5PdNiyD/QCqyV4fGYVhQTh/FUqSSQM+RJCScFG+3F5HrTcLJHwL4GfKUT7IyMlBOcOjIWXyV8q6YKP1J2cZ4KX68/RfTWZPGE893OkGtA0nTS2esViJmjXHgRc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <8f4e2658-13b2-98ce-6fea-2067ff205e02@amd.com>
Date: Fri, 2 Dec 2022 15:19:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH 15/21] xen/arm: vsmmuv3: Emulated SMMUv3 device tree
 node for dom0less
Content-Language: en-US
To: Rahul Singh <rahul.singh@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <cover.1669888522.git.rahul.singh@arm.com>
 <4e4d4fff4bb20d9718bd61b729f9421525baaa15.1669888522.git.rahul.singh@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <4e4d4fff4bb20d9718bd61b729f9421525baaa15.1669888522.git.rahul.singh@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT021:EE_|SA0PR12MB4365:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a7c02b6-922d-4aaf-4069-08dad4703266
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	n7UfQWUABiFOgpPX8qwUcVMGwFs/brOMxdRBUFW9LuMImEkogVzVzpLlIA7KYi1cRqvE90AUfZEr17cQmbONNQBZqrpJta365RB2l8+1d0Z+AtBa3SKgDxhH77R4wWYCg0tkJZ3v78OMTcOW7nhu3y+SWQvoQ9cv7k9JMigjldUXoiEKu/vuvca6EnrGFWyr313hzKKXf4ckTrD3nONkRuv+gtOIyjVEB+dOXWMF8yoW+qTmv44wFmw90hhfnlUVnLNOLxyyYgMyiCob8vT9PqeLOQFMeRl1NEaZfcHny05oD76UjGFzYQVJ0CgQ4U91JLl85d+PFHcwc0OhXl+iE9nS/HrjeLSPR+3NvNJH4FtdrcecFsSa9H7sCys7zj3a8G2XBs0SKO/lrEGiMqmnqcoJLRIlZAsqsjp6kkgH1A1h2h6xH2A/ULHC4kO/4K2q3K8V6vkY7GYaX7b3UqeodozEWGZAImAh/6O0rRZT1qgpLXrjEV9my2M2lHOYVPxsrte5jR/0rvLQgJfwzEaYvmcwyY10uoaKROAtk/Nz512a3uyLK1zAcErlLtKCzX2HRU/TodcelZvSC74HG66EqLUGKlSebdtqkM0Cx7obCNvBqEStahTUjJjVr/1vXizyxTsX6t5bafcmdp35+AOhcExB1dZCDF7R26T5IfguaAEnBf3Ob3FXQBtbhldnJF4MsTenFAGX84Y8AjAvNQYIZgIRwK+r+HTsNhbFp7Zu+z/dPG41i1DZ+3vB1O6OCwGOM/2k1fIL8+EbZtv9NQZt8FtxOXwFaFLwgp/kDGhYdY0=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(39860400002)(136003)(451199015)(40470700004)(36840700001)(46966006)(7416002)(4326008)(44832011)(8676002)(5660300002)(4744005)(8936002)(16576012)(316002)(41300700001)(2906002)(70586007)(70206006)(54906003)(478600001)(110136005)(40480700001)(36756003)(53546011)(31696002)(356005)(81166007)(26005)(86362001)(2616005)(31686004)(47076005)(426003)(186003)(336012)(82740400003)(40460700003)(36860700001)(82310400005)(32563001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2022 14:19:17.1615
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a7c02b6-922d-4aaf-4069-08dad4703266
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4365

Hi Rahul,

On 01/12/2022 17:02, Rahul Singh wrote:
> 
> 
> XEN will create an Emulated SMMUv3 device tree node in the device tree
> to enable the dom0less domains to discover the virtual SMMUv3 during
> boot. Emulated SMMUv3 device tree node will only be created when cmdline
> option vsmmuv3 is enabled.
I think you meant viommu option.

In any case, I think that you want to introduce a device-tree property for dom0less domU
e.g. string property viommu = "smmuv3" to control whether to add a virtual IOMMU node or not for a given domU.
You did exactly the same for xl created domUs so you should do the same for dom0less domUs.
Otherwise the behavior will be inconsistent and we will lack per-domain control over virtual IOMMU.

~Michal

