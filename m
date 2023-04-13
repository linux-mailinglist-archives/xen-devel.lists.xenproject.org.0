Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A46516E0E2B
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 15:12:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520720.808623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmwjv-0001SG-M0; Thu, 13 Apr 2023 13:11:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520720.808623; Thu, 13 Apr 2023 13:11:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmwjv-0001Pu-I8; Thu, 13 Apr 2023 13:11:51 +0000
Received: by outflank-mailman (input) for mailman id 520720;
 Thu, 13 Apr 2023 13:11:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=czPd=AE=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pmwjt-0001Je-VE
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 13:11:50 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20620.outbound.protection.outlook.com
 [2a01:111:f400:7e89::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be31e67d-d9fc-11ed-b21e-6b7b168915f2;
 Thu, 13 Apr 2023 15:11:48 +0200 (CEST)
Received: from MW4PR04CA0316.namprd04.prod.outlook.com (2603:10b6:303:82::21)
 by CH0PR12MB5297.namprd12.prod.outlook.com (2603:10b6:610:d4::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 13:11:41 +0000
Received: from CO1NAM11FT098.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:82:cafe::8a) by MW4PR04CA0316.outlook.office365.com
 (2603:10b6:303:82::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30 via Frontend
 Transport; Thu, 13 Apr 2023 13:11:41 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT098.mail.protection.outlook.com (10.13.174.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.32 via Frontend Transport; Thu, 13 Apr 2023 13:11:40 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 13 Apr
 2023 08:11:40 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 13 Apr
 2023 06:11:14 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 13 Apr 2023 08:11:13 -0500
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
X-Inumbo-ID: be31e67d-d9fc-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JzzymER0toW5nB1v0r0f2DToC/RXaZF4U7IwogO2bnKAwVWktI2PsFALZNF0lakDL1f2egZY3hMuCIl6391JkXXhnEj+KTAhqktTySXC9ykUZpdAOlfrfu6ktlTqRiOhlmVaAmq9MFq++bpKM+30c5hki+l2xdH4WrhNGA2O3n1o4N5d/mOzIZVN7Zz3dCAOvFB3G2u6Tv2Cjere2TPUzhRx8qvsI1wTgzTq8RTnJltCPg2YBPG6hbTdsEXzNNhDXOKMjZWPfE+YoZmKkZ78F2WptIthHxuyBbGhCwSLvmDQuKs91d9fBCspSr8Wh6agtqkFyicA60oeN8AEinCoiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TqkGxVz3dOyXztzEvg0vAz1bCZKFuJHjXDqMEbM0hmg=;
 b=iDGUKblwiUMmNyed67Y1WqLR0xolo81hyjTGtd1rkYZyXN55VNzKoL0DmOI7CXDTosrYzesuIq4jp5uB4NCxxW8KWmNBihvVHXavbp5ePs8LzrL/LGr+3npTnR1eUj81vwg8Ivv1o6UdbEaea2ssrPDKUSlwxPW6MKxZrcRvhdqCK0e02Tyx7O7IcM0BQW0wDWOfRQUeCCnIRx9tmVG3NkTh3umWPUF8kbI64RX40J6bJVfn8xupOv7oP0diNJ1aJsTwu05z43lC+TvOxwsmnkfMLt36s3ZTuqMY8wV08jy2nBSLeG0zPI8Z3qJJCFsU/x7TXqCQEid9EtUoPsmvSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TqkGxVz3dOyXztzEvg0vAz1bCZKFuJHjXDqMEbM0hmg=;
 b=JcYQA51yhZphLxR6iLl4oNhK0nWgvxMphMRgYPAsvd/lMNpF8bbJnoGQj1y2Q/JltqHzW3x0asVwqnZKw9ahie4VWKq8h94Fx3RBYppX9ExmbtEKnq8V4QXRK5q8VBCOk807Jyw4oHnGTGtdr6CaFhQPKHNW/emE8RxWaBmsWCw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <601858e2-79b5-35da-df00-2d9061d8ff22@amd.com>
Date: Thu, 13 Apr 2023 15:11:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [XEN][PATCH v5 05/17] libfdt: overlay: change
 overlay_get_target()
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Vikram Garhwal
	<fnu.vikram@xilinx.com>, David Gibson <david@gibson.dropbear.id.au>
References: <20230411191636.26926-1-vikram.garhwal@amd.com>
 <20230411191636.26926-6-vikram.garhwal@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230411191636.26926-6-vikram.garhwal@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT098:EE_|CH0PR12MB5297:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ef6d78c-5b73-49a7-5ea5-08db3c209ef1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kiE6guV/k+HDzEEn1ZkFLD85vm2IdTtJhI8Q/sIbbvGhGAAPKnGwd1e56yCm3+pKbnrBy6eiFcEGsFFT4prsgS7vu7JXQ3b2Q9Zo0lhpQ7qUyAi4aIoETX+8im40s9hZZ8j7BkS9om65HEf3mlGvfpDvmQ6aoKXjpFdfb+G5CDCKTCoiGi7bKZhr3UlHr4u2shmOcMTg+WqlHD+qsiWWltSHVH1QI+ts7Q9IlhYZ2tnzRHNTzkc1wnVF3Wo8mLqCO8Eudpl88HoVMg+NrDp+9oCYbzelqnK1ftrzGw5go4+1NoHR5dElavof8PnHCdBXDuASSANM40hoyXvWXqYfKVZV5zrdbZff/KJFmT98mSOEiYZ28Ctzj2xwuyXGRD45HCoIdMHBScpmPsdaKmH0H0cgYW1aFKhftp3kt4QeOr2RziNNC0KQvNLcRC5lanVru+rHOuTU5BMsr+Mfr8EodjXuUsm5WuHw2KFS/SaU2r6g4ySYvlfLdZZXMF8toO2unStZQnftq0nzBOe3yQlglmqgbhusu6ndy+uAOLUR2o4/hZ4MctqhBTop01VezrUstvOjlKy1s8HtWgFvMtxIDH37yDym9xsoI61sG084JuuveQWJkxLUZbH7p/UQykuYlfEnGON+NZSiBMm2ajx4QL71SbB04sPTts+/ix45Om8vqAem3oR+5hOa8k20MHMFLrbNekdRtHxbYf13diuFWnwDQ2QjS/FgWagz6vt+lIRHh2Qlx/yJHtMTtq4OUbnX
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(136003)(396003)(451199021)(46966006)(36840700001)(40470700004)(31686004)(36860700001)(336012)(5660300002)(36756003)(2906002)(44832011)(31696002)(316002)(40480700001)(8676002)(8936002)(86362001)(41300700001)(81166007)(356005)(40460700003)(82310400005)(4326008)(82740400003)(966005)(70206006)(426003)(70586007)(2616005)(83380400001)(47076005)(54906003)(16576012)(186003)(478600001)(110136005)(26005)(53546011)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 13:11:40.4577
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ef6d78c-5b73-49a7-5ea5-08db3c209ef1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT098.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5297

Hi Vikram,

On 11/04/2023 21:16, Vikram Garhwal wrote:
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
> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
> Message-Id: <1637204036-382159-2-git-send-email-fnu.vikram@xilinx.com>
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> Origin: https://github.com/dgibson/dtc 45f3d1a095dd
Wouldn't it be better to point to the main dtc repository under kernel.org rather than github?
Origin: git://git.kernel.org/pub/scm/utils/dtc/dtc.git 45f3d1a095dd

> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
In any case:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

