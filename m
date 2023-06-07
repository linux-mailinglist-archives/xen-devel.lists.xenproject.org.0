Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3637261EE
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 16:00:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544815.850842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6thN-0002pl-SU; Wed, 07 Jun 2023 13:59:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544815.850842; Wed, 07 Jun 2023 13:59:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6thN-0002nT-OP; Wed, 07 Jun 2023 13:59:41 +0000
Received: by outflank-mailman (input) for mailman id 544815;
 Wed, 07 Jun 2023 13:59:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A2EA=B3=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1q6thM-0002nN-JL
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 13:59:40 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7e89::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 897fc370-053b-11ee-8611-37d641c3527e;
 Wed, 07 Jun 2023 15:59:38 +0200 (CEST)
Received: from MW4P221CA0028.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::33)
 by BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.34; Wed, 7 Jun
 2023 13:59:32 +0000
Received: from CO1PEPF000044F0.namprd05.prod.outlook.com
 (2603:10b6:303:8b:cafe::3a) by MW4P221CA0028.outlook.office365.com
 (2603:10b6:303:8b::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33 via Frontend
 Transport; Wed, 7 Jun 2023 13:59:31 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F0.mail.protection.outlook.com (10.167.241.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6477.13 via Frontend Transport; Wed, 7 Jun 2023 13:59:31 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Jun
 2023 08:59:30 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Jun
 2023 06:59:30 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 7 Jun 2023 08:59:29 -0500
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
X-Inumbo-ID: 897fc370-053b-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xs3BqkLQOENJZpBSjTBUJhL3Jbueqy+D8UcjfJVjewOuamCaHL7CEWgOM8amHKAt7HZX51GNxU9YvDfboNSyZJBf7sljaAAS7ODBS0NhQOHb/SpsLL4vAQ/SLXka/tcR7z2MroSzSskQl8hOWFZ7cqowhZneb0m0KeR4W/UPbADXmDa8kiw0N305QjgHusTOAXm4Z07RUW7QmkG43EnPZ6b93XdSdnEhdNo24EF2RkKh/VVEEZFHippsmSt1cNLD9dM5YTZQZW7JfmhoaIL8SwiPfEZ3+UrU5fa9L7j1vrgW3AXU/aepddMC1QpBmvM0MQ9+qjLqvIZTy1QaTI9cFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rWMBH0KBr6+BkBaXDHO9duJEf9Cq1gaoZmkzqw8bcfc=;
 b=M4TM4FUVs9E41tkNptMOXv4UwvQtF+V3jom6x7GMQosBBfy/QeZ4YWQa7zYTEDykiB50JzVFSgbXC6FF4cG5XM7j3uKv+/k14rDxV9ElEqdNtdZLhbtpzvQaxVjBnpEqaAr+bJOFtthyhXXhJeFaXd6X2a4Lc/8yoQ8ulv/YVLmbJ19Ya+ZsDqIGpF8xTNotK37dElCfL+IgLWBgTZ2K0FtRPGUbN1gwRJKzOZLsyXwJ7aUXf5Y6FBXQOpjlYf8eywYvCZm0oBK2buU0PNZVZZQzJ1Gj8Va4FqoAtiZEAn7L0Ug8BX9kALUj0oQdFNOPAeM0mbqhEuwDT06bF85qRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rWMBH0KBr6+BkBaXDHO9duJEf9Cq1gaoZmkzqw8bcfc=;
 b=3p/a+2P01VjOynwWsUV8twhC00Q6KVL+BUOWfYgQ6crmHmqbTNEMll44dJJQAEY4XYfsYDBwwgNDEXHZh7IGfDJO5IF8zakqruE0hP9JRa4ujNGD8b1EvKjLMPOxC7P2oEPiQk8m5L0VDAn+4bSHtTtsZsJfLtV2UMAvG5ZeB6w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <6e15c9de-d8ec-2900-1fe3-5d743f5ae1d7@amd.com>
Date: Wed, 7 Jun 2023 15:59:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] docs: Fix xl.cfg documentation
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, <bertrand.marquis@arm.com>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
References: <20230607135419.3498902-1-luca.fancellu@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230607135419.3498902-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F0:EE_|BN9PR12MB5273:EE_
X-MS-Office365-Filtering-Correlation-Id: b1f9af41-91f5-4b05-e985-08db675f6ab2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ka1SKJ+/6umwWH4RHBZMN2TYCqiqGFcLcipBy2TKeeWNaf25bnUlkoyo8CnO17CEAIchjE1gpQp2KCJpNWy/RaB1Dd+Gv4zJAVNw6HRDpNoJ/bkppcJQSbL1FcUAI7nxeLSmK1Oj03b1LYMzb9/otizcmu73BjFRy2t2R+3aJaigPg3o24SxEjcyu8LmFHsU7VLhq/hxpJfG9Z7D61/1jV26URAnr19/7Zn+hxq3sxoi/M/9pSn0hmEuHt7y5eTaqqZgAMCeeNKUk3UYI0vTgsbqYH2/qAq+668Ezb6Mnv15eKkXYLAN/jGUo2Gq0KxXI7K6PlzNEwb9i1+wN6Msmi4xn/3IsQyCgN3S9qv25fsRyrgFSNnRutSwbqE13Bk8qUEfo98iElKJHCRHnDOSejmtNuTySoQ6kHnmevD8Coi3Xt2Vg4HtfJBHLrZZnnMR5xOLP4XCqVZ1GRVlnXig1xP7pAHOQLkNwVrQeEXbMQggE1jqI8oqL/HfWwjZP7XGiIY+4jdG9Bdyiy8gCt8x7fFqrF8MXkimD0jWx4zJUzOxR0FRCF0PV+/P7mPYOuKSTl6Pccg0VrdpCwUW27jnr8C/wxGlSDdky9IGmoupXcqr06vsGLqLGUtNBwyRnd5SqP1b0VYwxtNdfokIYKeU27lqSugLy5rsQsQLoucOz6cfjKnqH6wXrpvKrBaCPR6ERHFjs/Is0x1xZSIuE5kzg3vLt3ajMro6jELDx+qLwTpuMAtTNgTWIaPf170a/Rbhmj3TXNJDLMW6Q/xyLClwE2JBQ6AlXmqmEufYYMf/7vXz0YoNfLwq525+cklH5joo
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199021)(36840700001)(40470700004)(46966006)(478600001)(110136005)(54906003)(16576012)(186003)(2616005)(26005)(53546011)(82310400005)(36860700001)(426003)(336012)(47076005)(36756003)(2906002)(4744005)(40480700001)(40460700003)(44832011)(4326008)(81166007)(356005)(70206006)(70586007)(8676002)(86362001)(5660300002)(31696002)(82740400003)(8936002)(316002)(41300700001)(31686004)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 13:59:31.1315
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1f9af41-91f5-4b05-e985-08db675f6ab2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5273


On 07/06/2023 15:54, Luca Fancellu wrote:
> 
> 
> A recent change to the documentation for the xl.cfg introduced a build
> error, fix the issue.
> 
> Fixes: b46e8207d0ae ("xen/tools: add sve parameter in XL configuration")
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Tested and looks good.

Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Tested-by: Michal Orzel <michal.orzel@amd.com>

~Michal

