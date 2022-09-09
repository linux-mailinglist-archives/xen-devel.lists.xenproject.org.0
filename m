Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD63E5B2F38
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 08:43:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403838.646083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWXjd-0003xM-6m; Fri, 09 Sep 2022 06:43:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403838.646083; Fri, 09 Sep 2022 06:43:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWXjd-0003ut-3v; Fri, 09 Sep 2022 06:43:29 +0000
Received: by outflank-mailman (input) for mailman id 403838;
 Fri, 09 Sep 2022 06:43:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M6+a=ZM=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oWXjb-0003tE-5t
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 06:43:27 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2084.outbound.protection.outlook.com [40.107.100.84])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b39cc808-300a-11ed-a31c-8f8a9ae3403f;
 Fri, 09 Sep 2022 08:43:25 +0200 (CEST)
Received: from MW4PR03CA0323.namprd03.prod.outlook.com (2603:10b6:303:dd::28)
 by CH0PR12MB5314.namprd12.prod.outlook.com (2603:10b6:610:d5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Fri, 9 Sep
 2022 06:43:22 +0000
Received: from CO1NAM11FT096.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dd:cafe::52) by MW4PR03CA0323.outlook.office365.com
 (2603:10b6:303:dd::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12 via Frontend
 Transport; Fri, 9 Sep 2022 06:43:22 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT096.mail.protection.outlook.com (10.13.175.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Fri, 9 Sep 2022 06:43:21 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 9 Sep
 2022 01:43:21 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 8 Sep
 2022 23:43:21 -0700
Received: from [10.71.192.107] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Fri, 9 Sep 2022 01:43:19 -0500
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
X-Inumbo-ID: b39cc808-300a-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fkl3QqANYS6rCL2mNUQaJOfxd3eA5fIwhnqkuT8Irpf3fQL4YEyziN17xFIn7rCW+fRYQ1LoL8HpORwgAAX2S7mKOg7BqwY68s8izhpxQ1VWAxmkDx4pN80jTiHfIFaGTe2aEHWSFJQSBEgKoL3xGPR1Uy07CUdcJYv/14nwHyr1LL/4DcxDyNKIQ3IT6Sru19ZWXFEKvHSJNWSWfxyut5wa6WPHiqkDR+GGp2kahRLlEF8shFjelKEK9YahACUHma4JGedXZqA3RLcK3DHlQWezDoDw7PBqGITBr22iPLaWfqVMcUVnTjlFXH1TVXxD9qgnS1r2F0wVGk3KIjC1bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TWvUx4KNJtyTqVW7e902eyuKfgRjT8Neb8MeLZDpSvY=;
 b=MbYXsRXjboOV60rUzrlCci/Ul+UQp2NImoMRJgRUZnkpQo94fDIWJRppIL6ifWV6DK5oC8uBNKqRlS0CcF4IHpxjfX/qzDqOf4Ixb+JAPEaH8nrMt8N1KsHXpNV8AEHFnnTxmmCsdrrQ8cXYzfTVdVacYNtSCc8LYRVAECS1mSBnFGc37P9xSzUjnkU/ZCSTVDXT0SHmD9jJtz7Pi0f4GDO8JqxLqXSNaaTsUu8iKAsc3BsIlH6NQ3TQ0lnL5AnAwNKpm4f2oL6OTRh2Ad4zwXMUg9kB4M4U+fVKuTDT+2EMm7ztfisE5AlHzcB0N54z5jhIWozX7VSqVWD+B/QopA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TWvUx4KNJtyTqVW7e902eyuKfgRjT8Neb8MeLZDpSvY=;
 b=npO/JS9l9pynZEm6zQvBSF+l+vdcZ9eD+IjgXex5YmFB1bOGipiXZa2+TfR6b8kQ8uWMZCZbA6UQbUISQtRRtoIn6in0H3bM+Id6dFGNVQjU4t8xHFwYjPhuEhuOcgGjpbVJeJFXcMCG9aSw1L0Es8Y3wYtnu0swW07YbFhEvKo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <133c3dc6-03a7-e6bb-83e3-d73ee798aa68@amd.com>
Date: Fri, 9 Sep 2022 08:43:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2] xen/arm, device-tree: Make static-mem use
 #{address,size}-cells
To: Henry Wang <Henry.Wang@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen
	<Wei.Chen@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220909052357.49349-1-Henry.Wang@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20220909052357.49349-1-Henry.Wang@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT096:EE_|CH0PR12MB5314:EE_
X-MS-Office365-Filtering-Correlation-Id: 363e6aa8-e4b0-4bb2-5a16-08da922e969e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Diiz0FNUjoXRPSxnb8POakL3/GfIjgzADznFQ3LFX7Oi/rMJ/6TXu3S9O8XP7NGZQTqsg7gPtKdhouIMZ3lRPUvK1+ZsIqDIQ9Ma5ZghgoyIPnULPFOexknNz7CHA5akt1EjFPyknVRa2GA5RwW7ZAYLqOnDOgFD2wYx7gvuSXt7UeXLcHjocP/6cLS14enuJXBcPDa//GzQ1OHz4zXr8t1+vSnlLScQnzLX7/LdV4tCezsypw+3BJYYChN38fDnxuGTTudB113Iqsrn8Iid98fcU9MX42soJfFMKRSWfLx0Ag0e4cKcQK55XmslXU70R6tXfqVejiCifWvRQdFH8yAiZoU90eUKjxmvm4Lnku7XMbs64TKzOMs/a0WWv8jnuvMNBrFT0fI0DECoDun9x8dvYLZWyNa5BZLTLFWlHFwwM8j31OJQHesfOBT3L5QC/48/1rNwV7xt/sRtI5iAHGuUGkVP6lu16DDsBQH8fR5bGhbtf1kGDPi+dQoC7PRjqgmJ9V4YHT1AqzVfrtlJnyTskDL4bqBes/cK2cbod/G+yHCngjVrwGF5WGX45dh50osjwFCTL00TorWZTCr2noNmJ+OLPZk8YB+I+Y3UvSUI5uc1z3tsHappKqoMVMgRuxdDkv5i3Kfv5ZtizCGHfto/DH5Ekv8tuj8yyisePSKzRClQMd2GFhNJK7xlR7hnSH9hKaurRFyVxEwotrp605QJdVD4/bGl7wVxKQV2Yjfxk4jJmG3R9/Sna2ruhUuEDsgHpBZ7gmnB52Ygu7GiRsNDhRLClNfakzA3oxPOGuaRKY3ziSiuDk8k+49SfIhs2lRyfL9X+LciTshyQTIZOg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(136003)(346002)(396003)(40470700004)(36840700001)(46966006)(36860700001)(4326008)(47076005)(426003)(4744005)(86362001)(8676002)(53546011)(31696002)(70586007)(70206006)(82310400005)(478600001)(186003)(8936002)(2616005)(44832011)(336012)(5660300002)(31686004)(356005)(16576012)(2906002)(82740400003)(41300700001)(40460700003)(110136005)(36756003)(316002)(83380400001)(26005)(54906003)(40480700001)(81166007)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 06:43:21.7582
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 363e6aa8-e4b0-4bb2-5a16-08da922e969e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT096.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5314


On 09/09/2022 07:23, Henry Wang wrote:
> 
> In order to keep consistency in the device tree binding, there is
> no need for static memory allocation feature to define a specific
> set of address and size cells for "xen,static-mem" property.
> 
> Therefore, this commit reuses the regular #{address,size}-cells
> for parsing the device tree "xen,static-mem" property. Update
> the documentation accordingly.
> 
> Also, take the chance to remove the unnecessary "#address-cells"
> and "#size-cells" in the domU1 node of the device tree to only
> emphasize the related part that the example is showing.
> 
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>

Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

