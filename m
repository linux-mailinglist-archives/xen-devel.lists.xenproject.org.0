Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7CD642ABA
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 15:52:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453818.711428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2CpU-0004ZY-OA; Mon, 05 Dec 2022 14:52:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453818.711428; Mon, 05 Dec 2022 14:52:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2CpU-0004Wi-KM; Mon, 05 Dec 2022 14:52:24 +0000
Received: by outflank-mailman (input) for mailman id 453818;
 Mon, 05 Dec 2022 14:52:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2q+k=4D=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p2CpT-0003zH-0w
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 14:52:23 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060c.outbound.protection.outlook.com
 [2a01:111:f400:fe59::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ba8eb32-74ac-11ed-8fd2-01056ac49cbb;
 Mon, 05 Dec 2022 15:52:22 +0100 (CET)
Received: from DS7PR03CA0131.namprd03.prod.outlook.com (2603:10b6:5:3b4::16)
 by PH7PR12MB6418.namprd12.prod.outlook.com (2603:10b6:510:1fe::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.13; Mon, 5 Dec
 2022 14:52:18 +0000
Received: from DS1PEPF0000E63F.namprd02.prod.outlook.com
 (2603:10b6:5:3b4:cafe::49) by DS7PR03CA0131.outlook.office365.com
 (2603:10b6:5:3b4::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Mon, 5 Dec 2022 14:52:18 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E63F.mail.protection.outlook.com (10.167.17.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.8 via Frontend Transport; Mon, 5 Dec 2022 14:52:17 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Dec
 2022 08:52:17 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Dec
 2022 08:52:17 -0600
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 5 Dec 2022 08:52:15 -0600
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
X-Inumbo-ID: 6ba8eb32-74ac-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dQC05+3DnBFlkoWL3Mm7vwi3QsC9Q8CjvZkvV3XzpPSpOo6uBm4RZKw8/nIBcgNSFydzlQkPGnNI5WAOLBZatVlc8q5rlUyP/+e3wf2pjgSUQpmrqAl4m7tNd4ejD9XzDx/jinm3UKaXZ3aVz7MhAeiuj8OkZZ1VpnxXLrwoE0AnjLIuoczAG1qdnGk+oBMLevwE6a0XmyJOINXL6jjCeAG257SBvF76zBVzu9uggl2HsBAsmOIDxIC0jzDvPzMqPDjOaepY8OCTzhXcnM4gudJq+YsWatHvj2Yb7a85b/iC0/7GhV2/LqTfHaGOedArAd2OT5SZahjjKaqyCr0RXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BwYDCdTQmlaT4cABBh+BZCRn/4CMeZJ4WWqXKQRAkoM=;
 b=HbnAz/A39vAy8OlALq3+JjUkovFJxeIc5+zTEhd7YH+XZTifRXBQurQwJNVj3T4+LQBsyXWrtNfpLfyoOAjbaAYcb7CLowIsnKJ7iquIoIJaLz5a5YCwd6NbvF8UR6z1YDJEs88PnESqAHrv30LXGN+2Yu8zHC37AxbX4vUXpLllfY7IKID2B34p0bVGCAz8d612PBSMxPkAj4aoFDC0CAMhFCDz2S1PFE6zS1Y10f71gWOSZ0wt0K4xDhEVaArRNEKKGjhyVkqlRxLOhp/aciT+ooUD5LNxHr+QrAB7rR93aNUQP2bR3CneafT0zKPrsX6Bcbw3JmQBPjbKZp/z9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BwYDCdTQmlaT4cABBh+BZCRn/4CMeZJ4WWqXKQRAkoM=;
 b=4fZq10g0qXoCRsGsBz4zoG6SZK/iXdMcCXf3IQmucyS3R/1rjKefp+/l4HnpZ+bn4d7ofmlvGrQ37ILbNngsWJcI2BpcQcyYlexYTrIXp0kTXkgJD9xJeC/qXFSzGdDLMOBFWSTe/U2FWmq14Y8T4LEY8YSIHCWm3FTyITzIqGM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <8c44fb93-1c36-4a03-a784-f74ae6122dfa@amd.com>
Date: Mon, 5 Dec 2022 15:52:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH 06/21] xen/domctl: Add XEN_DOMCTL_CONFIG_VIOMMU_* and
 viommu config param
Content-Language: en-US
To: Rahul Singh <rahul.singh@arm.com>, <xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>,
	Juergen Gross <jgross@suse.com>
References: <cover.1669888522.git.rahul.singh@arm.com>
 <fc259a3c780aeb312ea1043703add9e9bca1a7e1.1669888522.git.rahul.singh@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <fc259a3c780aeb312ea1043703add9e9bca1a7e1.1669888522.git.rahul.singh@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E63F:EE_|PH7PR12MB6418:EE_
X-MS-Office365-Filtering-Correlation-Id: 88e4c628-4a42-496a-9e65-08dad6d04e17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wenGf9ZT0PKD8PTGveBMa9qoMCQIJHi06BUg9v2y/96xmGQ4Gu53QtKD9g5ketFjWyQwAplm3/axycNnPs07AYM2U5R9S0/iusePzQg922cQJDlHCuoUKwN/n3Yct+x5DfMAsyywUTAlY/OW5kyqWPMdw1IpuIWrNNi5pbgsiT6r6hNppmJt0pwftu3p5yh2e6uECInuJXwD5I/hJcFqL5CnyyNcfdSrwUHEepj2AccGyxHBlCyyGnyLUbIppUrP2KNDvVxxTrCLskjuQkNF8PLueUUdADLkSZfX+zu2HKEoHqSyRLp5ImrCp4M6Bq9BjQNqgHlPinBqTxUlZy2ZHXEvqtB0jN9oDVIfHeHgTFR7KcWa71ZgB175mvBzluf9r5sxSxvXrw49LQLpa6yqMf7bjAIwAzUET3R/5SK8RL1jynjMuxNE1fx8ASJoh1hImwG3a8CGoNAy6ppK6qX5JKFKq/aLxXaLIbQA9qCGdeTp0sekn4xRimnTQRsJ/XUFyliFjnNi1dkmJbKxfeWqmE3Ih8EmuAtkD7uDE0T5RfI/LhROh3IYl73Ti85Cj2LSniNNv5i6c4EHuRfoiGnmgiPLxc1zo4zhA3GJhLXnfegbeDsfniHBmzTd9ZjV5T42VMbIJfAt3vbKxgZ2q69t/gYDQzfCbC4YWjwCIywq9uAQedsezgk4XHRu7WeCKepQSmUlaFjnxy/JsW4/dpKsg/S/dioxZg8owIL6bq8gWXtWNiF90nNsG8JvbTYwSD9WStTYo+LDf36zAiJLUf96Sw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(136003)(396003)(346002)(451199015)(40470700004)(36840700001)(46966006)(47076005)(5660300002)(426003)(53546011)(36860700001)(478600001)(70206006)(70586007)(2616005)(186003)(41300700001)(336012)(8936002)(4326008)(44832011)(8676002)(2906002)(82740400003)(36756003)(40480700001)(81166007)(356005)(26005)(31686004)(110136005)(316002)(82310400005)(54906003)(16576012)(40460700003)(86362001)(31696002)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 14:52:17.7121
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88e4c628-4a42-496a-9e65-08dad6d04e17
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000E63F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6418

Hi Rahul,

On 01/12/2022 17:02, Rahul Singh wrote:
> 
> 
> Add new viommu_type field and field values XEN_DOMCTL_CONFIG_VIOMMU_NONE
> XEN_DOMCTL_CONFIG_VIOMMU_SMMUV3 in xen_arch_domainconfig to
> enable/disable vIOMMU support for domains.
> 
> Also add viommu="N" parameter to xl domain configuration to enable the
> vIOMMU for the domains. Currently, only the "smmuv3" type is supported
> for ARM.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
>  docs/man/xl.cfg.5.pod.in             | 11 +++++++++++
>  tools/golang/xenlight/helpers.gen.go |  2 ++
>  tools/golang/xenlight/types.gen.go   |  1 +
>  tools/include/libxl.h                |  5 +++++
>  tools/libs/light/libxl_arm.c         | 13 +++++++++++++
>  tools/libs/light/libxl_types.idl     |  6 ++++++
>  tools/xl/xl_parse.c                  |  9 +++++++++
>  7 files changed, 47 insertions(+)
> 
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index ec444fb2ba..5854d777ed 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -2870,6 +2870,17 @@ Currently, only the "sbsa_uart" model is supported for ARM.
> 
>  =back
> 
> +=item B<viommu="N">
> +
> +To enable viommu, user must specify the following option in the VM
> +config file:
> +
> +viommu = "smmuv3"
> +
> +Currently, only the "smmuv3" type is supported for ARM.
> +
> +=back
You need to remove this "=back" or the one before your new section, because currently
the build of docs fails with error:
man/xl.cfg.5.pod around line 2873: '=item' outside of any '=over'

~Michal

