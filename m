Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F4A8982E0
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 10:13:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700747.1094354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsIDi-0006tz-Em; Thu, 04 Apr 2024 08:13:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700747.1094354; Thu, 04 Apr 2024 08:13:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsIDi-0006rR-Bi; Thu, 04 Apr 2024 08:13:14 +0000
Received: by outflank-mailman (input) for mailman id 700747;
 Thu, 04 Apr 2024 08:13:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OVy+=LJ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rsIDh-0006rL-Ee
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 08:13:13 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2407::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2cf5d0e9-f25b-11ee-a1ef-f123f15fe8a2;
 Thu, 04 Apr 2024 10:13:11 +0200 (CEST)
Received: from BN8PR04CA0018.namprd04.prod.outlook.com (2603:10b6:408:70::31)
 by MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 4 Apr
 2024 08:13:08 +0000
Received: from BN2PEPF000044A9.namprd04.prod.outlook.com
 (2603:10b6:408:70:cafe::b0) by BN8PR04CA0018.outlook.office365.com
 (2603:10b6:408:70::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26 via Frontend
 Transport; Thu, 4 Apr 2024 08:13:08 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF000044A9.mail.protection.outlook.com (10.167.243.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Thu, 4 Apr 2024 08:13:07 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 4 Apr
 2024 03:13:06 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 4 Apr 2024 03:13:05 -0500
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
X-Inumbo-ID: 2cf5d0e9-f25b-11ee-a1ef-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PZtBu2FM5TLweiZh90kOiJEDeKB2AMESQPBNXWkM7ENBiE5CPT4mditQJLm6/BkQPMiTV5CEplOlNsWTakPxGAMPUlWr4UhaRllxPTmFCRiKe7bonf35UtiNFPAiR3v4QxDRHeYYJXFN05v2RQB7oMczW5zZGvby2CQGpFinIUkc4+UU0WWaoOg8p+zMCd0dozikyEQ5EKmgoEa2nqgBfPB2SwqaV/Oh/w3IK92ScjBAsAetTE/h/3tPWazcG8guZg2vBgUD+fVahfekifbTg+CnIJSgR9e0cRLDgAJvUAEw4ewRfseu2qDEWe6zqjGMwc/gP0hp+XalOGqRsEhq9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8p+hufjNbP9CzdogA87n7zb1gvgt6ELtuKNRLEjxoOk=;
 b=H5JaPzhpg/981i/FU50NUIy9JGg6NhwpJ9G4tt/XorGXfW0emddXfT4nxZPdkw9ia8MIiOktkuKpIKwEfGf0GuPoJMdU4SDdi1/Vc5XR95mVHnxD9z6hORle7/mhYyUAnR/orl5AliPEt3CxUDDDMNT0GxHKFR54y15KuzyXdLofsB1KBa09XHHtprp3C01HRF8jV2j8r5gCGjlGs4JDe5soQBKaAerxN4ojLtIO6ihIhVN1HMXpIIFoEC+bHnpjpLNiHl6u/ODsldP2PnQFDK9u7aUFBz5c/ykBdqwZZYtMxFcuA4MKGflzHRSaXzd4dF9v+ttxFaEvtvzzTC6lTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8p+hufjNbP9CzdogA87n7zb1gvgt6ELtuKNRLEjxoOk=;
 b=RGVWfPl1G5diyzAUTeJO1zhjVLKW5pp19Y6Ltncwsk7IepfT8SzmMq41COZR7Gy/hxSzrPJj6Mq2VbpU66mzrA1gGjsoH174ZgnJLu1Vq1/9hSyrxKvHu47y8j54b4XYmDuo1vnN5gjj4JIb3p5ZV9Yoa9+/ACA+BLO34SAwYtQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <7015bd6c-6979-4870-8611-f829b4994bb9@amd.com>
Date: Thu, 4 Apr 2024 10:13:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drivers: char: Drop useless suspend/resume stubs in
 Arm drivers
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, <xen-devel@lists.xenproject.org>
References: <20240404075143.25304-1-michal.orzel@amd.com>
 <20240404075143.25304-2-michal.orzel@amd.com>
 <012db229-8c84-4b74-b919-50e0231dd274@suse.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <012db229-8c84-4b74-b919-50e0231dd274@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A9:EE_|MN2PR12MB4342:EE_
X-MS-Office365-Filtering-Correlation-Id: 2abde7c0-97b5-4b46-603d-08dc547f0f9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	leo4STFfL2gLCCVR2JmIPxoVJS7IDGsSVvwJuEgubXMPFZe+1/on3+vgxroctKZhidxmtSPgytczM9Ic3UWrEbCdVuOOjx1avz4CE+tdK10lL5tLPX3tObTUQWd3eMH5YQbvVSh5BnwoP+FzJqNrNrQ9fyfvbOJVaOz6S/fdx/jvFEDEyasO/iTvDesn29XCc+OQZ1NeLwRpwnMZuW6/eMwK+fgAW5juMUb/bAY7dpY97hPsjYuBPTsDwEZk521n8fCjUqPmcolkNGjbsAXI5xu6obBaaC31LC57k7tD42okRAalSyUWI8k88L87tau2kCtEA17sMT6/Xxp9awWQM+Fr2sMZmNbgCiyynBDgBa/OmloRRFsiICqRCZdzq7AG6P8C4azTJ0C9DcSBmao2Wb6+h6bpI7Ck2liVZcdtdG/HTXnNwkGKAPYHKai02N5cdgYb6xFEGxnHoB+p+qfOSHjHSGef7uSF7Ux+qADpI1WjE/Qa6EE3/dFArxjsofaxsntVgxoUWEajoDFWxSE0jNpZCPNCAgQg1Wm1SLrYpGmLv2rOf60+qiq/LiPANC0Wqd3STMZqUFWa6urRqI783v5XwEXGZ5VxKqn2A37HfnDq67esHCDCSBsqgs6AYobWNKBDtF1WBTJsjqRgJTU3ndWuH78e2fHuq6zZixkGMTttAIgXRLK79iranjrP/9aGEpNKKouRRb4vU/nxokmrv/dyw7rxKtA3HzAVlRcB4ug/No2t/ci3X/BiIzFXqHzy
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(82310400014)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 08:13:07.7222
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2abde7c0-97b5-4b46-603d-08dc547f0f9c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4342

Hi Jan,

On 04/04/2024 10:06, Jan Beulich wrote:
> 
> 
> On 04.04.2024 09:51, Michal Orzel wrote:
>> On Arm we don't use console_{suspend,resume} and the corresponding
>> stubs in serial drivers are being redundantly copied whenever a new
>> driver is added. Drop them as well as useless .endboot = NULL assignment.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> 
> Since hook invocations are suitably guarded:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
thanks

> 
> However, from a Misra perspective more wants doing here if suspend/resume
> indeed isn't wanted / needed on Arm: console_{suspend,resume}() are
> unreachable there, and hence want hiding behind some (presumably)
> CONFIG_HAS_*. In turn the two hooks then would also want making conditional
> upon that option actually being selected by an architecture.
Yes, this will be handled in the future as part of the bigger activity to compile out unused code.

~Michal

