Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E395E76FB0D
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 09:26:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576933.903641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRpBt-00086Y-9z; Fri, 04 Aug 2023 07:25:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576933.903641; Fri, 04 Aug 2023 07:25:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRpBt-00084A-7F; Fri, 04 Aug 2023 07:25:41 +0000
Received: by outflank-mailman (input) for mailman id 576933;
 Fri, 04 Aug 2023 07:25:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Igz=DV=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qRpBr-000844-N5
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 07:25:39 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061a.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1aafa230-3298-11ee-8613-37d641c3527e;
 Fri, 04 Aug 2023 09:25:37 +0200 (CEST)
Received: from CYXPR03CA0026.namprd03.prod.outlook.com (2603:10b6:930:d2::11)
 by IA1PR12MB7541.namprd12.prod.outlook.com (2603:10b6:208:42f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Fri, 4 Aug
 2023 07:25:32 +0000
Received: from CY4PEPF0000EE35.namprd05.prod.outlook.com
 (2603:10b6:930:d2:cafe::73) by CYXPR03CA0026.outlook.office365.com
 (2603:10b6:930:d2::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.21 via Frontend
 Transport; Fri, 4 Aug 2023 07:25:31 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE35.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6652.19 via Frontend Transport; Fri, 4 Aug 2023 07:25:31 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 4 Aug
 2023 02:25:30 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 4 Aug
 2023 02:25:30 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 4 Aug 2023 02:25:29 -0500
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
X-Inumbo-ID: 1aafa230-3298-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VcybARHiuQaG6UnvvnF6PA1DuOr4UrWc/paMINd41ubtTllen7rPJ2yrkHvyH0XzNkl/4huOJvA2o3fBX/MqVmQUUXLkqIkHVf4Gl3DUo7bITD1fxE43ESAFi5jIXaCT08tU9ME+50tYPo7D+OQBwBG+4eTZ3yoewpcaEt6WkzRNEe5D28biHEoLUxzAiZ17TthOy7632TGIz7SqKy6qi7+EZILdCo+tHK+OqPR2hLsHieMsotaBIv3aRk3qxiUGoLQ8NHQVhY7tstoimUk0SDY4t7caHAvDrx5A14RvuHrYVPF7qUCN5njA+A3FL4OhVn9rayG5vvjDcB0tnRpvBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AKPSK1lqQOIFIWEEzp1G0NWYivJnxa4llFHfkl7Hosk=;
 b=YyX8w23kk3Koy7UXmq5kfZSXEL4riVz3Un0bGYOhIVeuPG/6rnUeSk71ARbu0c5njzfqokosLQlbd9TrqpmLWghHtgae8jQyBtDGObShObdbyldiY8C7pE4KttopjkCKL8vQbDtLddK+46L8s2PKXqYxYNfKWgiIWuAU7Yfk5TUVovsedABwNSWBB+/dFQufobCabbjwWpD5VwXEXJGieTs6wATeYMGL7hbpN0eNw7GJNyq/I30X64dDyvaz8WWOsjuTp2aTBWoGz8l5gJrkuTAfXidf5XvAqxR7zLV2BIIUyO0HupOO2B2+WDyjOBmaeeSSTSPF1UGGPzWeT4yWtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AKPSK1lqQOIFIWEEzp1G0NWYivJnxa4llFHfkl7Hosk=;
 b=3YFa05QivOgNTSGGc/yc2Qn+JZg0/mWRK1g2n6NrKr/vh2tTQcSQ9ZPO3vbS/ghZ2JRNGrlamIx1MNsWgT3w/qpuTe4HqN+UdXHEuP/fxY+XemfzkVHJ56+XsODAQD+xplj+eCiGYJdq7lqrJrgRIAUJM/tTpyuCTvqSU0mmJpc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <c2a229d2-8df0-8ca3-1484-f3da55b988f1@amd.com>
Date: Fri, 4 Aug 2023 09:25:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] automation: add missing "needs"
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>, <cardoe@cardoe.com>
CC: <andrew.cooper3@citrix.com>, <simone.ballarin@bugseng.com>,
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<stefano.stabellini@amd.com>
References: <20230804011018.2888869-1-sstabellini@kernel.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230804011018.2888869-1-sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE35:EE_|IA1PR12MB7541:EE_
X-MS-Office365-Filtering-Correlation-Id: 364fec6e-dd03-49ed-0085-08db94bbfc56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	f6Xz/vj41JDuLR+RQELblUqLBlGYg/F9qLMxXq64nkjs18N7qiYnRurmrsdLJSlhovK1BgJbkOVZ/MNQAMYUGAW5cOgt2AnIs6BAy8zZBoFv5EapQBMD/zPN6B8Gyyr5LyBp0PFehSR+vuF+vDNtbfOn82aW6bwNgeEUWK31ZMHPjoe9OoIyGnbVTi7/PVIvNZVcH1feOPejzcjt/ko6kAbRmJlLTtPc9nlfZYuQYICy5oCITlivnf1Hof8qbCTBbHUZvMxoOGtlSq/wA9q809BqEFveu25fMauQLO9IPlhk4ofR9st4NO2BOpgc3f6TNr1gw2KuvfATTnqudlJ80fsO+S04pSvhhjNTV01MI0d6XlOMeRLL41pbRXjhMtJNgZ949fgmGHy5JF2osBjUlWhpTGXPfyfuP1mlPtdMLaZNI/65b2idHDRGk/jinqJRihIMMUvXrRb6VFAsZSGubVShdtuzmjIUQRNRNsGPDlzsoIR+wUfdW0kedavfRLKSARSWrm37BqRG7lR9P5JT1AioyMn69MGD9f3NDoBlD5c2E/7PkVLIHxp6DkRpWMRCqC5k0tbqJ0n8zRnp4Z3tr0D1eQmy6GDMSspjrggD3rGtepcx6xg0i2xBnvp93eFYzbXHRTyXEB9E15D+tjWYKEZ4fy6LCEggFjKI5RjQowE9OjETmc6FmwVJp2kDJ+/ga9Hf8sBrJ/fi2m6smZacrOemaHvJ3KnxIli23KOHqD7KJs8vqB6GQt2nFmdd8d6J2WRH93GOFs4Eb3Z2SbCuwgtnGXUwyY3DK0opvLW/NUpo0EhXUdIxmGzfR4DqaRfQ
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(39860400002)(136003)(376002)(451199021)(1800799003)(186006)(82310400008)(46966006)(36840700001)(40470700004)(40460700003)(2616005)(426003)(336012)(53546011)(26005)(47076005)(8676002)(36860700001)(316002)(16576012)(2906002)(70206006)(5660300002)(70586007)(4326008)(44832011)(41300700001)(8936002)(6666004)(4744005)(54906003)(478600001)(110136005)(40480700001)(356005)(81166007)(31696002)(86362001)(36756003)(31686004)(82740400003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 07:25:31.5253
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 364fec6e-dd03-49ed-0085-08db94bbfc56
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE35.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7541


On 04/08/2023 03:10, Stefano Stabellini wrote:
> 
> 
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> The test artifacts export jobs don't need prerequisites, so we should
> specify "needs" with an empty array for them. That way, they are not
> going to fruitlessly wait for previous jobs (ECLAIR jobs) to complete
> before continuing.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Looking at the whole pipeline, I can see that now only ECLAIR jobs do not specify needs.
Shouldn't we also add "needs: []" for them?

~Michal


