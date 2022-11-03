Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80037617C7A
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 13:24:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436452.690570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqZGE-0002QS-OC; Thu, 03 Nov 2022 12:23:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436452.690570; Thu, 03 Nov 2022 12:23:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqZGE-0002Nl-L1; Thu, 03 Nov 2022 12:23:54 +0000
Received: by outflank-mailman (input) for mailman id 436452;
 Thu, 03 Nov 2022 12:23:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aeB9=3D=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oqZGD-0002Nb-5i
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 12:23:53 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5fe2e66a-5b72-11ed-91b5-6bf2151ebd3b;
 Thu, 03 Nov 2022 13:23:52 +0100 (CET)
Received: from BN8PR03CA0036.namprd03.prod.outlook.com (2603:10b6:408:94::49)
 by DS7PR12MB6048.namprd12.prod.outlook.com (2603:10b6:8:9f::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.19; Thu, 3 Nov 2022 12:23:49 +0000
Received: from BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:94:cafe::2d) by BN8PR03CA0036.outlook.office365.com
 (2603:10b6:408:94::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Thu, 3 Nov 2022 12:23:48 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT067.mail.protection.outlook.com (10.13.177.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5791.20 via Frontend Transport; Thu, 3 Nov 2022 12:23:48 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 3 Nov
 2022 07:23:45 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 3 Nov
 2022 07:23:39 -0500
Received: from [10.71.192.110] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Thu, 3 Nov 2022 07:23:37 -0500
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
X-Inumbo-ID: 5fe2e66a-5b72-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QqJCyvksQLWIaeefeFVhFsG2q2zOko56ttuNVLaLqh23EKf1kn+uJI0KWZ5zd8bRY+xt4r+vq4n4N5+mga+muMvQ5uB3AINlRpmy3pLb24004FEte+i0Vn8E0RW5KNVfHjAQKDkmt33GhCWrisVA7MnocCEWSN8SlODgc4jEoeQow4Er4hZV91g9KZiGGu3qdUZOgQp08Lus+NQ655pFNjtxt+hDFZ7NwrjXUARvDSsbmBEyLJMc8t+CH3HPnOoKZdEskT/7LYQCHp4LV3xdPx8iiu/tgREpGCG1xLMQ1zWClJ29S4z4l5d73loXBWs7DhW7sb3kAmtGL0BpDCeLQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F878IsiQbjU+ZsSiPuBtZniEpdcnFqckNkKCyzx5iYc=;
 b=C10xl/iqHYm9FA6XywYKWnHLrKoMxdrXoxjxoJDgDT+K09s45IuXP+pof5RO30SosFg+jjJX0MLPO8dM6EX40DgmNLTaV9nMLUyXhJ1pAgdJY6mPx0YradsCZcE4Dv8uuBqJaa0++XuisNAeopGHinSgNQ6MXTwzWu6ngnJcaSLeneS91YUZG0ghclLepxtD9fG3Xa5tB1fP0vMqaBZS8hVGZcwV1FuDEvs5hpL4oY6l5ahVeJcDWH0tnp1BxhEkD2Hq6+VbxkFWT6tHETevfc3hugkDo7nMLZS7UcOzo9Y7aSRzURkd6Hov0GHuymg8341VGEKEg2CWUs89X4aEiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F878IsiQbjU+ZsSiPuBtZniEpdcnFqckNkKCyzx5iYc=;
 b=B8fF5gF1Bhye2m6qX5tQw6HYvQHs/06M5z3lfpzuz9Ox9GySux7rNAJTPn6WFl/gsXGn4dddswnGDDWlahJHjtwjDXv4HQ+VT3YzenISTMOYjxOCqZQycwST2rhfNRTPHX1XK41OPBM79GR7p9i7ui3V/0iG/aEOyWr2zUYdros=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <a6c7e152-200f-88b4-c9b7-4e1fd8011ff0@amd.com>
Date: Thu, 3 Nov 2022 13:23:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [XEN v1] xen/Arm: Enforce alignment check for atomic read/write
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andre.przywara@arm.com>
References: <20221029224802.464-1-ayankuma@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20221029224802.464-1-ayankuma@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT067:EE_|DS7PR12MB6048:EE_
X-MS-Office365-Filtering-Correlation-Id: df5a9b30-e090-43a6-032b-08dabd96428b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HMg2DE6lUK89OwCG65io6irrdmSA1l+knpI2diDTDowcNgXNPs80NnV4UoRqNe5EfIUkSNBXYmfP4tMAk7F6M/eLA77z+9MHXVpv01jJ5Xwa2jnYe2Jmcxxu3KUDjEA6RTOSU1yoRwdpCqyD8WwNHMjOps4qVqSOAcDDTvXUL7U9Bmzbb+5eZw2uH31eAtZBvyjiTmHa5BPfCwNGua8ywLuT8QWU9pLY3pTmpz5IJvgB0iJ7pXLke2Mfu82z4iSM6txLNW3zqDzzYHA9C1fkuwXJYU7Ryim7hihlshJqHJvYTApqOsoASrs3L/xd6dSHzUsntvxrMPiCiFQ3e2gQNb3BWAYfsqRs49aNSButCkM1UZGZoes7weZ4GkWEE1NAbV17mKKhCia49SgvvbR54S2625WQohnINiPScc2ohGDj70I8Qxo5yZHTrvipva1wQU9RZ6+98CQnW2sWYqqzdvJA5q1d1gNxu/Z81CQL34wqdsHBjAZu0BHZHdVtw6siFdT4iWTZStSpkthQbUjXzpUzPkfRVJ9gfvzTkXLdQA9CvOaEydNTF/DKVv+s/1u5hfrBoTx9sJyQ5sdUKDENp5mutnt3MeiHy5LgunEsf/MGa+OZJcMO9liwGuU6wkaAvmOTeZ1TwLE98XX13sHyevcI2Gs3MGok0r+wUmVNQBQlM/IPmVza5ZZBkc/za3FG22Jo5B7zfgCpZSoEPNpzTS3jW1ed7J9ZP+GCvlXj/rAArDRZe2nZWmNHDH3MHXa4Bzc+/NWpVtgtWOsHCcrGYlwMaZQZWaLgNUiJKYYPPloprCKy3pGGbge0cibZ7Xuh162gi+96+BZZiwqSMXRNng==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(39860400002)(396003)(451199015)(46966006)(36840700001)(40470700004)(86362001)(36756003)(31696002)(31686004)(81166007)(82740400003)(356005)(40480700001)(186003)(336012)(44832011)(40460700003)(47076005)(4744005)(2906002)(53546011)(426003)(2616005)(110136005)(478600001)(26005)(36860700001)(54906003)(41300700001)(70586007)(16576012)(82310400005)(8676002)(5660300002)(4326008)(316002)(8936002)(70206006)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 12:23:48.5028
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df5a9b30-e090-43a6-032b-08dabd96428b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6048

Hi Ayan,


On 30/10/2022 00:48, Ayan Kumar Halder wrote:
> 
> 
> Refer ARM DDI 0487G.b ID072021, B2.2.1
Please refer to the latest spec.
Apart from that...

> "Requirements for single-copy atomicity
> 
> - A read that is generated by a load instruction that loads a single
> general-purpose register and is aligned to the size of the read in the
> instruction is single-copy atomic.
> 
> -A write that is generated by a store instruction that stores a single
> general-purpose register and is aligned to the size of the write in the
> instruction is single-copy atomic"
> 
> On AArch32, the alignment check is enabled at boot time by setting HSCTLR.A bit.
> ("HSCTLR, Hyp System Control Register").
> However in AArch64, alignment check is not enabled at boot time.
> 
> Thus, one needs to check for alignment when performing atomic operations.
> 
> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com

~Michal

