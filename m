Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3E669AE34
	for <lists+xen-devel@lfdr.de>; Fri, 17 Feb 2023 15:40:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.497156.768052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pT1tF-0001AW-83; Fri, 17 Feb 2023 14:39:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 497156.768052; Fri, 17 Feb 2023 14:39:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pT1tF-00018n-4y; Fri, 17 Feb 2023 14:39:09 +0000
Received: by outflank-mailman (input) for mailman id 497156;
 Fri, 17 Feb 2023 14:39:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cWIA=6N=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pT1tC-00017k-Oo
 for xen-devel@lists.xenproject.org; Fri, 17 Feb 2023 14:39:07 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20627.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d09551dc-aed0-11ed-93b5-47a8fe42b414;
 Fri, 17 Feb 2023 15:39:01 +0100 (CET)
Received: from MW4PR03CA0219.namprd03.prod.outlook.com (2603:10b6:303:b9::14)
 by SA0PR12MB4526.namprd12.prod.outlook.com (2603:10b6:806:98::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Fri, 17 Feb
 2023 14:38:55 +0000
Received: from CO1PEPF00001A60.namprd05.prod.outlook.com
 (2603:10b6:303:b9:cafe::6b) by MW4PR03CA0219.outlook.office365.com
 (2603:10b6:303:b9::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.15 via Frontend
 Transport; Fri, 17 Feb 2023 14:38:55 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF00001A60.mail.protection.outlook.com (10.167.241.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6134.14 via Frontend Transport; Fri, 17 Feb 2023 14:38:54 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 17 Feb
 2023 08:38:54 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 17 Feb
 2023 06:38:53 -0800
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 17 Feb 2023 08:38:52 -0600
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
X-Inumbo-ID: d09551dc-aed0-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L6Tfko+r6zuPsi+eyp9eoGe3BLjmPx62ahqy7JJ9ep4t1Q7Afef6t2FSRNS3XeWUqW/OwO7YRoAKApUjGUi+RPf4ck/RI6hyBRcBzCCkZuZ6Dn1RE7ADuRpLEb2dLY1UObq7vt3tzYPbnsWTC7sMvgxotMiJI7kxRDfAihhdzrTnfTmslFqIuqL1VHARmDgjVOdr7qKRG3UcHLEApgcy62pyXrpR/vUu5JXNu7rpVDMC4iWilKBGzYSrnM+qj0X3o3LvBbQDnkFiyhcC6P2rNWcFKOG1xgZ0/NSifO10m8Wu+ysKZ3u9h13fapYQo7g3Og3dB/jAZBuH2n2uSFnsKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WkcymSTxu+rjyKU0dIeVGw2xSwLbSLtaBIpnYYT5Mu4=;
 b=IH4ksxQzpdTKylPTxU1DBjdOZq49Db6FXU2hXhlAR+wR5ZWEd6+twayyNo7v7l7GL07JL7LqOHFDEiAfMaI8F1lkbovwmaLZoQJbxYLi3A8u0iBOwkKx7UqyPfNs+1tsJoGI9GxoyEPUxh69JQGZFoMtqFUz44EH4ARih21mOZ9DK9ZxweWzIEJ4U2Idx5OVXtyU8MeDk2sSaHt3ZaRdiDZenarPQxzFH8JZof995d6L72NobHFFZS1VaRAbGz1EcFxh6jatj4tqZkymkhST37k9+C8k9mNJVhIYY4BQV8bTfBjt4lFKjgNFdFYOd1NdWY2IT95IHHrGJbjmfWOLPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WkcymSTxu+rjyKU0dIeVGw2xSwLbSLtaBIpnYYT5Mu4=;
 b=ykUMegJ3SmalGLTGunC0afZiCZ1SxLPwKrjjslQe2i6VhjVMqul4HFXeXcMxHYQWvi9SpPZx+RmPbCQ2rJ/GNz+z+xg0X/JhY0U3ivJ+H1NwsbcMpVKCWCy/Y+QsDn6WtfGGi3BTJYyF/uWZ4v+g5glHd3x876fy2i+rReEyEoA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <38326d5e-18fa-767e-5581-6bd8408e332d@amd.com>
Date: Fri, 17 Feb 2023 15:38:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 1/3] automation: move yocto jobs to build stage
To: Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
CC: <cardoe@cardoe.com>, Stefano Stabellini <stefano.stabellini@amd.com>
References: <alpine.DEB.2.22.394.2302151407130.2127160@ubuntu-linux-20-04-desktop>
 <20230215220925.2313528-1-sstabellini@kernel.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230215220925.2313528-1-sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00001A60:EE_|SA0PR12MB4526:EE_
X-MS-Office365-Filtering-Correlation-Id: d1efed36-b1a6-4a7c-8053-08db10f4b23e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pH4iwp58j7Hg5ld5n3UNGCLVIxQyQCrDSPkHqQ6Goz0iZbcBl7riJAdZ9eYPxNuTAHaJWl5xbnuGifgA8kb6M49uzeSWnfJ/yL7CXa0ZL5AgKlI1d7Rk2fSZ00fxGhWoY9DvnKg9Fgdmr8U4R9wcQ1f1a+B5rFXymsFXMtsGAkPGA5hsGGmKGABnRVPW/gSsbGEZihvMbiTZL31Ao4Dpn0nfqawYt9Lrx+5zyak529a3uCC9Xe86VCqhHSO+naCEjKJ+nGCOdvlAFsTCyMrIHiIjlguVFUvJGF0pRvuGViYuX1CcfKsAR/8H7Trt1Ad/ylFD8bTi9iGibyyLjFSomzi+DYlq9GeOgSk4JygiJBt8ayqUCV6QWopaKDBZn1Azbuz7vEY2VSbiRCnJuYzP0PJe2lJxRcJeCZZ7NnI+r5gwPjNRBiWRtW8tyxqy3oV6PoT4DMpuHBnHxAJSe8+jpDUuulgFZnhRAxsA3lbClrlhkV8Ex9L0/vykr8nCp3H5wr9tbRQ5vZuMehHZRPsBL7lmEKWg74ZCW7XX0n7eXkrALdjY7f635prwviEo+gk6JWUxFLdUiIjBfG2AvzN4f7BPN31bzQrgBhq60vG+oQTtW3+g/2xqzFWTYugglV/hKZqbAjpaATU6qzr1Kc+f+Sf0jNJI7P5DDKVtx8iMDu0fxBXagbGetDsqUw7Irv6tv787kKP1/uT9bOI0yY2hPV195tG+DNBg72UMPppwQq8E2Q4i1mfr8A98Yk4/tXWoXup2OQ03TG+6EtbS6DPixg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(39860400002)(376002)(346002)(396003)(451199018)(36840700001)(40470700004)(46966006)(31686004)(36756003)(4326008)(70206006)(2906002)(8676002)(70586007)(8936002)(44832011)(5660300002)(356005)(82740400003)(86362001)(36860700001)(31696002)(81166007)(41300700001)(110136005)(54906003)(316002)(16576012)(40480700001)(478600001)(82310400005)(47076005)(426003)(83380400001)(336012)(2616005)(53546011)(26005)(40460700003)(186003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 14:38:54.9843
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1efed36-b1a6-4a7c-8053-08db10f4b23e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00001A60.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4526

Hi Stefano,

On 15/02/2023 23:09, Stefano Stabellini wrote:
> 
> 
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> We are going to use artifacts produced by the Yocto builds in test jobs.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
>  automation/gitlab-ci/build.yaml | 51 +++++++++++++++++++++++++++++++++
>  automation/gitlab-ci/test.yaml  | 45 -----------------------------
>  2 files changed, 51 insertions(+), 45 deletions(-)
> 
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index a053c5c732..f62cf21f45 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -199,6 +199,41 @@
>    variables:
>      <<: *gcc
> 
> +.yocto-test:
> +  stage: build
> +  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
> +  except:
> +    - master
> +    - smoke
> +    - /^coverity-tested\/.*/
> +    - /^stable-.*/
stage, image and except are the same as in &build template.
You could just use <<: *build to reuse them. Specifying script here would overwrite the build script
and we do not care about artifacts paths (i.e. if it is not produced by a job, there will be just a warning
which is already the case for some jobs). Anyway, this is just a suggestion to save some lines, so with or without:

Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

