Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0B66754DA
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 13:45:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481746.746839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIqlP-0008NS-2u; Fri, 20 Jan 2023 12:44:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481746.746839; Fri, 20 Jan 2023 12:44:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIqlO-0008Kj-W6; Fri, 20 Jan 2023 12:44:58 +0000
Received: by outflank-mailman (input) for mailman id 481746;
 Fri, 20 Jan 2023 12:44:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nUaQ=5R=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pIqlO-0008KV-B3
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 12:44:58 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2076.outbound.protection.outlook.com [40.107.223.76])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d843775-98c0-11ed-b8d1-410ff93cb8f0;
 Fri, 20 Jan 2023 13:44:56 +0100 (CET)
Received: from BN9PR03CA0485.namprd03.prod.outlook.com (2603:10b6:408:130::10)
 by BN9PR12MB5243.namprd12.prod.outlook.com (2603:10b6:408:100::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Fri, 20 Jan
 2023 12:44:53 +0000
Received: from BN8NAM11FT008.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:130:cafe::78) by BN9PR03CA0485.outlook.office365.com
 (2603:10b6:408:130::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.26 via Frontend
 Transport; Fri, 20 Jan 2023 12:44:53 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT008.mail.protection.outlook.com (10.13.177.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6023.16 via Frontend Transport; Fri, 20 Jan 2023 12:44:52 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 20 Jan
 2023 06:44:51 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 20 Jan
 2023 04:44:51 -0800
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 20 Jan 2023 06:44:50 -0600
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
X-Inumbo-ID: 3d843775-98c0-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Txlr9bEQEB1ux7nyaLKk2gYtJdLj59e1QP1D9KHR4OFNR62+ZxmNdVW9iXHrkyhlh0a7CvwQS1diEHR8AgJFMkrXztNB7z7FaRmEimxdGRFco0h1T3OpiIed3hsNV0fxxgODXgUmyIPTETeeqB7YsU1YqFiEeB+hgEF+Q3DINK5dvAvz53+x31lguUXHXqpCTgDf6dNgBQp3sCQfh7lIV4ThLwU/xcr5GAaITuNTWrBqaQXiGbRCstWiJWAdxpmlXH19bCFLGmIm/ACsPVayS+7zL4l1MTdvfsGVdJAfsXndR2H4EBA0cw5JOa3HUs3Abjqbjd8JWOCvBb+1foMxbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nEiZoyF42vVDQA4kucWVfB3PkiLOnmnKijv6lSxTM3E=;
 b=f7R1afXeG/fAXORxYn4PYfXqCAWDcG89Hg+iIefgF/4bd939l+JmXRVHpuWmN8cj62Tw85a56vbMTnTIIK4gq9OoZR8b1PhR7wTbVsk2qmH6HvhRqjv1wr03w1zpNJx7noZhXZKrfgsdwEVALUCJPqE+8Yo8nlkc4FS4OQ44ot6J/pIMkcNRYyE27MrnCaWNL6Jggi0PEeOfCjPnu9RiVrAhrjdZlrWZtNZiQLrJD0YDSBho6moBvV0Tt9TwTs914lLwE/Qku5NNGYsF3YZ6daazQgzgq/imqQbbbaSdX39WOh4xMuNlAUrWwMOlEdspuURYZwunXWljS46+dW2ssg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nEiZoyF42vVDQA4kucWVfB3PkiLOnmnKijv6lSxTM3E=;
 b=CdeUNg4jViCKdtlN0uLlQ7x+9+O7PqjiH3bnk5GJxrmMC5RPy5vnaPorT6BJO8LoyV28Lr0k3RuAUa6PNvfoxnYJ/iswYAYqx86aA2UMsmyndcu9sSiozDbvpayhTQ+bqgjklB6NKFutiYA0lH/nvgOrPhlx6swQnKZd9OVju3E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <375a18ec-60b8-c2d5-ad88-a6cfa82f4a8c@amd.com>
Date: Fri, 20 Jan 2023 13:44:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [XEN][RFC PATCH v4 04/16] libfdt: overlay: change
 overlay_get_target()
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, David Gibson
	<david@gibson.dropbear.id.au>
References: <20221207061537.7266-1-vikram.garhwal@amd.com>
 <20221207061537.7266-5-vikram.garhwal@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20221207061537.7266-5-vikram.garhwal@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT008:EE_|BN9PR12MB5243:EE_
X-MS-Office365-Filtering-Correlation-Id: 528ddc0f-2810-4f23-f355-08dafae4201d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hBPZ64NhgG+tTrm/KHDkjFTmMDBWe2T/bntRsKWfm1irLj9tjhE5AHynEXf8fMV45mAxev1cZq6q4//EHnf3ger9jNXUvaylsqgu1Qgyr64V8Lp8n3FoF77dywwWXd0316qUHJYjfg3TOSkxccFmKpS+YE8ZUAsZ+pNqxaEUB7HMIGpEBtSu62wPv2iQDeoHQkv73h1vl243S6iZ39kf7O/WloW4cKiiCx7JufnxPTFrletLoxjt/qSUuI2p+NvKj4tJidaNidyunBzyPXkUGFsXyliNPhf6/BFGqXwe31TwSXTyqWdKavSmAYyptQJLSJtCjVUiYHvV2oYDe4oLZHjnF3UcuiFQ2vG8J65k2AxrPgGNmTKotV5RQ0XLrl++Ij2uBPMy28DcuKojxOTdR/iwRNKjyNwRqHAP1g4vUqHjjXFU2zXSLREQc3VXY4Cw5wMiQCBw6k4Pp322kk5S6ygIPwz05V+YIpiesrkt5eRL2i/N82cnoL8l+GXDMOUNfBmIauGIiOTkxFvxQ62USHOz6JsXRHkJoIGnsX/LaSCwo9+X+RZs9TWE43tZUXdRYuZhRE8ED7Q4cl5mCIxdnpRTWPd1Sdh7nB8JQ1NALt6d3Nv6uTW+jHEB8SiG1FyiwfmgBGhncySvTU1jvyUcJ+ivXy5gPgNGrlnpkm/e2Ohyz7dRE3GGm6NkoJPOBYvxW+YX2IKuvoAuf3cpKUSH15bO6Dpt1ZIyoqLzvHnXojfauJJY++7KbZ280cTi/lfjK3ucmtO8wL0KL86pjAm/f0KCI6hW1ujFV41/N8a//dc=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(396003)(39860400002)(451199015)(46966006)(36840700001)(40470700004)(5660300002)(44832011)(8936002)(31686004)(4326008)(8676002)(82310400005)(70586007)(70206006)(31696002)(186003)(26005)(2906002)(110136005)(54906003)(966005)(316002)(36756003)(478600001)(16576012)(2616005)(53546011)(83380400001)(41300700001)(356005)(40480700001)(82740400003)(36860700001)(40460700003)(86362001)(81166007)(336012)(47076005)(426003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 12:44:52.4199
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 528ddc0f-2810-4f23-f355-08dafae4201d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT008.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5243

Hi Vikram,

On 07/12/2022 07:15, Vikram Garhwal wrote:
> 
> 
> Rename overlay_get_target() to fdt_overlay_target_offset() and remove static
> function type.
> 
> This is done to get the target path for the overlay nodes which is very useful
> in many cases. For example, Xen hypervisor needs it when applying overlays
> because Xen needs to do further processing of the overlay nodes, e.g. mapping of
> resources(IRQs and IOMMUs) to other VMs, creation of SMMU pagetables, etc.
> 
> Origin: https://github.com/dgibson/dtc 45f3d1a095dd
You should move the Origin tag after all the tags coming from the original patch.

As per "sending-patches.pandoc:
"All tags **above** the `Origin:` tag are from the original patch (which
should all be kept), while tags **after** `Origin:` are related to the
normal Xen patch process as described here."

> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Message-Id: <1637204036-382159-2-git-send-email-fnu.vikram@xilinx.com>
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>

~Michal


