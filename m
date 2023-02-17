Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 960FB69AE48
	for <lists+xen-devel@lfdr.de>; Fri, 17 Feb 2023 15:47:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.497162.768063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pT20s-0002eq-21; Fri, 17 Feb 2023 14:47:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 497162.768063; Fri, 17 Feb 2023 14:47:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pT20r-0002cK-VA; Fri, 17 Feb 2023 14:47:01 +0000
Received: by outflank-mailman (input) for mailman id 497162;
 Fri, 17 Feb 2023 14:47:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cWIA=6N=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pT20q-0002cE-Cv
 for xen-devel@lists.xenproject.org; Fri, 17 Feb 2023 14:47:00 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20603.outbound.protection.outlook.com
 [2a01:111:f400:7eb2::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed34f6fd-aed1-11ed-93b5-47a8fe42b414;
 Fri, 17 Feb 2023 15:46:58 +0100 (CET)
Received: from CY5PR04CA0021.namprd04.prod.outlook.com (2603:10b6:930:1e::12)
 by MW3PR12MB4361.namprd12.prod.outlook.com (2603:10b6:303:5a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Fri, 17 Feb
 2023 14:46:54 +0000
Received: from CY4PEPF0000C968.namprd02.prod.outlook.com
 (2603:10b6:930:1e:cafe::9c) by CY5PR04CA0021.outlook.office365.com
 (2603:10b6:930:1e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.15 via Frontend
 Transport; Fri, 17 Feb 2023 14:46:54 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C968.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6134.14 via Frontend Transport; Fri, 17 Feb 2023 14:46:54 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 17 Feb
 2023 08:46:53 -0600
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 17 Feb 2023 08:46:52 -0600
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
X-Inumbo-ID: ed34f6fd-aed1-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gfhsoWpKvEboWqECjruTy8m85zmOXKRHc2IRsWMUujvFwPXm+csuZfYxKDhwdESzQ8Xe+FiBP+QcQjepqZvfnAvdk9nj9n62SwVVs2i8ykZQI0c2L8xfcbZNVcPG9fAvE5UD7en1puploTLMEiJLuu6SZr7qZ4ITTcQlMygFCAddjAHh7PjwaNzXHhnFRLt6hmaugnQyeTBWgn9TH5Zf3ogUkEb9Hveh5jqJCc/fB4ICGOL8wY/GijGplBcTF8gnN3k/m6WUqbGGEYlwwMDKcXKwPAiez/b342uSZjuz63JdZ+yy4679wx8IJPSvAqDmOxVDh2aac4pVfAxnCmhk8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H8hmDbJmugK6z8TMm0u57Ez5RlvuXnspBHOmFJYuiCM=;
 b=UzuGX795v/PKO5CFDT6LSi8dlIuzfk9EZBgLA7s58rqSj2BaW6kN+QcE5s5dEH7XEJyDhGGFAKJZeexCS4JocS/h0weuHDKYka1X34S3q4+hpSvweW6FQ50ii6TV7Y87z3Aa7Wi309cFiV9LKiONGj821a1NVMvTCUkNkGPiAecGclsTgnjaOvRfMmtd//DV0cVbi1DoR/bQfkmL40134qbXJleO3l3RynmWEIwom73zyvOvgDY/QD+hiW0K14lM1rtdoQ0xmMnPLUsyvn8Djtn0Tup2agsbLDEZAbyF+BGge+rR9ONv6uj/rEB/yaqSsHIQv/yMg3vwHOuiJHr3jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H8hmDbJmugK6z8TMm0u57Ez5RlvuXnspBHOmFJYuiCM=;
 b=mKMwZ3LhVOCRwTSyTMFjMsqSo3Lufi4ggxdsnm5mwovT89biy78Da4d/vVf+Ru8/Ud+z2vxGPIeSUFpm3xy9Va18/nb7u9Yz9ufOFM/vH4zdq8lojJ5okT9TvqBUxFihra6+FNr8De1zh5jIbP5kPQvW+Kl5X81/QG6n8P8zARM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <1efb8c6c-e3d6-8815-4feb-fadc6a18842a@amd.com>
Date: Fri, 17 Feb 2023 15:46:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 2/3] automation: add binaries/ to artifacts for Yocto
 arm32 job
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
CC: <cardoe@cardoe.com>, Stefano Stabellini <stefano.stabellini@amd.com>
References: <alpine.DEB.2.22.394.2302151407130.2127160@ubuntu-linux-20-04-desktop>
 <20230215220925.2313528-2-sstabellini@kernel.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230215220925.2313528-2-sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C968:EE_|MW3PR12MB4361:EE_
X-MS-Office365-Filtering-Correlation-Id: ce9e480f-88b0-4b44-c4cd-08db10f5cfef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eIepxSs0F3hann0EN5yvcUU83Vl3svW4da1kuOx0WLM7e5g/6UH3ORL/bM2Wpo7pahRIP0EfOrC+zKEcaB6vVGHHZ6+NqhtVhMZlPoOAiNFMSCdLg3Oh/SrtvqQwoP/qfDsb1JPLZ7dqGpKfLPHPQdVErdIGcQctRNytYjoUyIAuKAskUHGN5C4FPDzf+w2tAmumg7sP/kpHuJ8giPDdwylAEXLRoUvuQhB+QMNUCT0FKopAnb4tW2mQk1Dd9m9PIoDVqPMPfCsE5riDc1bSiT+SoNdtAfpriHZOoq8jQfZLgZTdeif0MgUxdovAfRTxjJe4LcDNr8Ava4Nm2aK7DPzpE56EjmNiOfXMo9jQ1W/UBjsVwZt3Oqi+YUtYF4b/ptr58uRprqjs1rXyuYyDnv7eGYUMsJzIdqpOnEJyD4QLRfPxmTl8QZTX5NmSy5XN+dy+EDRmlziiJMQ4WRsvkcUKOvY2UcmG2dCvyTlHVLdm1pxfaK+HUi/9dqa91oO3YztTkOKjcVLZ5cD62PsIOQOGeBhBtQV4q1AzeWYpbQCdAwZ62ZpEP2kYK6p/SMp20IOC/JIVTosrqvK1sEKmS3WOS4k+tLZc+CRQvYr9HLxiH6mNjCYYETio8AngAJUNQwvTZ+3U5opREgpNTEaJzCPPTD34wrc35UxOE7nAnUc0ji9Lt1xG+6Y1xD5dGNtwdwwKYtAahK/WvwL77noRY9ylvHbQ2tp6qOHI8i5BASxZE+IJf3q0ubWAfVrmdDnVpIfCIcUstxXf7ymsJ/L8WQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(39860400002)(136003)(346002)(396003)(451199018)(40470700004)(36840700001)(46966006)(31686004)(36756003)(86362001)(31696002)(356005)(2906002)(5660300002)(44832011)(8936002)(82740400003)(81166007)(36860700001)(4326008)(70206006)(8676002)(54906003)(110136005)(41300700001)(478600001)(40480700001)(26005)(186003)(53546011)(70586007)(40460700003)(82310400005)(2616005)(16576012)(316002)(6666004)(426003)(47076005)(336012)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 14:46:54.3436
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce9e480f-88b0-4b44-c4cd-08db10f5cfef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000C968.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4361

Hi Stefano,

On 15/02/2023 23:09, Stefano Stabellini wrote:
> 
> 
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> Copy the build output of Yocto builds to binaries/ for the arm32 target,
> and export binaries/ among the jobs artifacts so that they can be reused
> by other jobs.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
> Changes in v2:
> - only copy binaries for the arm32 target
> ---
>  automation/build/yocto/build-yocto.sh | 9 +++++++++
>  automation/gitlab-ci/build.yaml       | 1 +
>  2 files changed, 10 insertions(+)
> 
> diff --git a/automation/build/yocto/build-yocto.sh b/automation/build/yocto/build-yocto.sh
> index 3601cebc3c..dd7065e5b2 100755
> --- a/automation/build/yocto/build-yocto.sh
> +++ b/automation/build/yocto/build-yocto.sh
> @@ -166,6 +166,13 @@ function project_build() {
>          source "${YOCTODIR}/poky/oe-init-build-env" "${destdir}"
> 
>          bitbake "${build_image}" || exit 1
> +        if [ $target = "qemuarm" ]
> +        then
> +            mkdir -p $OUTPUT
> +            cp $BUILDDIR/tmp/deploy/images/qemuarm/zImage $OUTPUT
> +            cp $BUILDDIR/tmp/deploy/images/qemuarm/xen-qemuarm $OUTPUT
> +            cp $BUILDDIR/tmp/deploy/images/qemuarm/xen-image-minimal-qemuarm.tar.bz2 $OUTPUT
> +        fi
I think it would be cleaner and more helpful especially for those using the yocto jobs locally to add
a new parameter to build-yocto.sh (set by default to n) to copy the build output to a directory (e.g. binaries)
instead of hardcoding it only for qemuarm.

>      ) || return 1
>  }
> 
> @@ -238,6 +245,8 @@ Options:
>  EOF
>  }
> 
> +OUTPUT=`pwd`/binaries
NIT: seems like all the variables in this script storing a directory path have a "DIR" suffix,
so it should be OUTPUTDIR. Also, why not to define it at the top of the file?

~Michal

