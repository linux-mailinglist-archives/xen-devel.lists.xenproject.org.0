Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1171759F51D
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 10:23:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392279.630515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQlfN-0001Jd-PG; Wed, 24 Aug 2022 08:23:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392279.630515; Wed, 24 Aug 2022 08:23:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQlfN-0001GA-Ly; Wed, 24 Aug 2022 08:23:13 +0000
Received: by outflank-mailman (input) for mailman id 392279;
 Wed, 24 Aug 2022 08:23:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jsFi=Y4=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oQlfM-0001G4-1X
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 08:23:12 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2088.outbound.protection.outlook.com [40.107.93.88])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc6d1969-2385-11ed-bd2e-47488cf2e6aa;
 Wed, 24 Aug 2022 10:23:10 +0200 (CEST)
Received: from DS7PR03CA0239.namprd03.prod.outlook.com (2603:10b6:5:3ba::34)
 by BN8PR12MB3187.namprd12.prod.outlook.com (2603:10b6:408:69::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Wed, 24 Aug
 2022 08:23:06 +0000
Received: from DM6NAM11FT088.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3ba:cafe::6b) by DS7PR03CA0239.outlook.office365.com
 (2603:10b6:5:3ba::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14 via Frontend
 Transport; Wed, 24 Aug 2022 08:23:06 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT088.mail.protection.outlook.com (10.13.172.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5566.15 via Frontend Transport; Wed, 24 Aug 2022 08:23:05 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 24 Aug
 2022 03:23:04 -0500
Received: from [10.71.192.107] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Wed, 24 Aug 2022 03:23:02 -0500
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
X-Inumbo-ID: fc6d1969-2385-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WI9dfoEB9BWxPDyYPQPycfzzMneUT0R1P7Mg+Tq6GDo57iqK4Mii0cSxbsIfw3iww63pqIco57WAcHLFUK2A+DSaMVdZIQmSiiRuEDlO7VI5BEkejqLBgr6HGK3RJVlXEwZqxn2ty/CjTAiiV9XDhU8FVLMQUFc7PV1kVcEK2I9upWOzlE8KhHCCSoeQJYAH9AMjxlbcYcn/RfZjwni+dW071uyUYT7vIUIMwhAq8oKFh555oZ0uEijzJd5bKOrttF1rF4UDlKqvhmQJUoSnAVXW0+w5J9fqQMBxBNvwfmtMOpKXWYm8jUsQ9x6+ipLCKQwbZ/nPOkbR58/m10BP6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pMMfRtpp13sv74mmBq5wbSAkHtO6JyVW2xw7VNixoYs=;
 b=VvAdsaSblUf0rttsAJCrh1X2zJKO1tJbVehTfpQdTfZXE+2LY0fAM1U+TBhLtc0oTGNUUfn/xpDecRE9MvcvRjrZq4znnwtTCTgMd9WpMX82gpC5Lw2/KfYTcSBGjvxnW4oSZH3DxursJqsaJtfdTfgPqZUI/z19XbI80M80sxN/0IX4DnmKEXxbBPNyI9AIWzkRSS0Fk1M4wNT4dZLd9z9Y3+NAKvkCArArPUeXm/dpVL9OypPvJ2q+oHLgVWOeqiUV52lIXjEybK8yfBnuPV4yzTK/QSF8s22ELQfPrwPrfMK9BPrNzavOQljoHt88vk3ET+n08SBnE5Pt2k185g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pMMfRtpp13sv74mmBq5wbSAkHtO6JyVW2xw7VNixoYs=;
 b=pMJbaicEBOo3bGn6ivhquaokzJxe3yazdpes74ZKQx0wJ+z/Fk+mrWyYrrBvxkYY0lzBaLhPDm7odO6qHkm0lNPgaGmg83nXa5ALf2VseMjqZfaD5PUKSNa64zwbCQNrxYTUSoP+ZFtV7BI51w1XaL4rsLlYaZ7xXK3AIUAa3QM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <c1a29c17-415c-89e3-6cce-30031c18b753@amd.com>
Date: Wed, 24 Aug 2022 10:23:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Content-Language: en-US
To: Jens Wiklander <jens.wiklander@linaro.org>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	<Bertrand.Marquis@arm.com>, Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v5 2/9] xen/arm: move regpair_to_uint64() and
 uint64_to_regpair() to regs.h
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fdee6141-8b8c-4a7d-8b7f-08da85a9de8c
X-MS-TrafficTypeDiagnostic: BN8PR12MB3187:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jMAfxdsxCnEG/XFPJY+uRTHKvHIPpt3onP69s2Mr3FeyxwKPbJXTGkruJ6aX6HzD6pVwzDJCymK+5ryvG4QIRAe9QZ70AMCDOMmsonuzm8ONrZFYE4sYfsnKnezDqK4o3am8MPs7nii/a53AuvIMUkPRo6cyExUAtclJtD4TC3OZunmb1hzWRwUAJSyB/hsIHQpzRuNEqh0r0krWKsRUaPaCMSHi+AtBwV2RAjSrVMOYlznlm5LEVhHT23FDNvysi7IEXmjIFyUYkRvZRssCv6v9RMf3lD2HHrR3Q10qOZx9VR3mk5AP77VdGADBBdacXn0gYurD7AuTFVtnfX833d0UoqIl0WfXT+I4BMQFneTiSfdzceY/5pQkhq0mZ4yWq0sjyXPHfiQHnAE/TO8VCCsVsoxxMTETAcMkxF9tq0iudeUiXB276j6rj/bBBCQ0nI+559ZGxS8vhOCP7jBHJ5M35W71EvOrEo4q+FlRVo307oNDcxCIifNCDOC7DelDRAo3c14tkTodsHC+vz50S757hRmysy3em1+7I/BfEH3ZRX7u7Ixfcv3ymfykGj3JkySbm6TbqOkScyEMcKwcoNTvqcZFYY9tNUqBTDw6zx32KnDDpweBCGvn6x62iqZ82d2tTnSaZ7wcAuqyARWxzLaKJkqPDitvWpejVykW+sXWBT35NC14YRaggNpqnP1hL54C997qYIO3rllQQyESTmwskhE2m0XeYBLS9XenGlDRJEHC7CsuDxeEyNCqBDn7Nu/JuDuaXcPoKU1dqQfYe0YPEizUihryMHgkS3tLBWI3r8d+QS1RWcmfeN1eo31nznNFxF6Ix4/PMw1xj94v1w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(39860400002)(346002)(376002)(46966006)(36840700001)(40470700004)(2616005)(186003)(82310400005)(4326008)(8676002)(44832011)(336012)(5660300002)(41300700001)(40480700001)(36756003)(53546011)(478600001)(426003)(26005)(47076005)(4744005)(81166007)(36860700001)(356005)(40460700003)(86362001)(31696002)(16576012)(316002)(31686004)(54906003)(2906002)(8936002)(110136005)(70586007)(70206006)(82740400003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2022 08:23:05.5128
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdee6141-8b8c-4a7d-8b7f-08da85a9de8c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT088.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3187

Hi Jens,

On 18/08/2022 12:55, Jens Wiklander wrote:
> Moves the two helper functions regpair_to_uint64() and
> uint64_to_regpair() from xen/arch/arm/tee/optee.c to the common arm
> specific regs.h.
> 
Would be good to add a justification that these helpers will be needed by subsequent patches.
Also I can see that you make use of them only in the last patch so it would be natural to
move this patch right before the one making use of these helpers.

> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>

As for the patch itself:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

