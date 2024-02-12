Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C64850EFB
	for <lists+xen-devel@lfdr.de>; Mon, 12 Feb 2024 09:40:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679323.1056753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZRqq-0008Ig-D0; Mon, 12 Feb 2024 08:39:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679323.1056753; Mon, 12 Feb 2024 08:39:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZRqq-0008Ft-9G; Mon, 12 Feb 2024 08:39:44 +0000
Received: by outflank-mailman (input) for mailman id 679323;
 Mon, 12 Feb 2024 08:39:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tvA+=JV=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rZRqo-0008Fn-QP
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2024 08:39:42 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2416::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42b909ac-c982-11ee-8a4c-1f161083a0e0;
 Mon, 12 Feb 2024 09:39:41 +0100 (CET)
Received: from BL1PR13CA0156.namprd13.prod.outlook.com (2603:10b6:208:2bd::11)
 by IA1PR12MB6283.namprd12.prod.outlook.com (2603:10b6:208:3e5::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.23; Mon, 12 Feb
 2024 08:39:35 +0000
Received: from BL02EPF0001A0FD.namprd03.prod.outlook.com
 (2603:10b6:208:2bd:cafe::5a) by BL1PR13CA0156.outlook.office365.com
 (2603:10b6:208:2bd::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22 via Frontend
 Transport; Mon, 12 Feb 2024 08:39:35 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FD.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Mon, 12 Feb 2024 08:39:35 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 12 Feb
 2024 02:39:35 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 12 Feb 2024 02:39:34 -0600
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
X-Inumbo-ID: 42b909ac-c982-11ee-8a4c-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HI7eeQk5UNzIYRwUMH2l5HT+BEs5/WWav6ZSd3y++YBze+ylAvpayKWiYDNrv+lBW28vMQWrHx/cIYPUnNhvXsJ9Vd2Tf6mKkTlydHSoLwyEvjwweLmCVyiU7kN/q206Yywuh2AnjTVSCfsK/8U23cYwBZTbbpcVb038huvZsdq/vqzeOf5Iu42If1sPpDOhRr/B9mp6LY0PX9vhQVeyM8n6ZiMFLM9Fnt3qv4WsnJqJ0/wYesx+mAQbxpCw/PdpKthfNbhskhSc0QETC092JddwV07CQ8Nff4WgV7rGjHK52QLaIJx7HM5TXhR62+V+t/jImy94ThHxrymZLRvlHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uIe52IwIOMwVyiVD4eWenPEgNR+wB6cKnopL2Nq3piI=;
 b=VfSITWes851O4+5oMWU4KnLL+nTDyn42y4geMOa5zL808Jctr6Zq9Ex9Hp3yur4GfySGtmADxnrysTFnKKRjp+36pHDYcI+k1u4sWoUSQgtC851GjftEE8peeUChJT8M7PqbU0gzwM5BHXTtx7y/bWhZ4fbjvov/rh5EjdL61OMSj+rKW4YJd9V9s3UjJaQzbd+la1Rne6U2U+bQoa+YkRpdxahXtny73SW6JmOGaR6v5b0tkEPFvu1aCYTu/Dqq54SGylIzmncPf2a4FxHi/r8Y5v0CeR6hdzfcld9Q+z4EwUV8ONBiDXxpC+vdAo3n8+Se6wanZmg9uUGxNkVa5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uIe52IwIOMwVyiVD4eWenPEgNR+wB6cKnopL2Nq3piI=;
 b=k+dD+GXmx1F1BpWFjv4Q09BSPNYRi8/sTCgsqxrld1+voRxWqkEPFB0sMwywV/6TJreowURpRyQsfHlgBKeWUGhuISl1UBSH9m2SoK/QV00/5HnE50RQuoVE7adamuzIsxtfjuPo+ONjHyMtssWqmNGeIXafc52PoHWM7d4kAJw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <738a0947-0c54-4c13-b632-a5e711894e7c@amd.com>
Date: Mon, 12 Feb 2024 09:39:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/7] automation: introduce fixed randconfig for RISC-V
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>
References: <cover.1707499278.git.oleksii.kurochko@gmail.com>
 <3f662e3b4ded36d982ff04ed5cdfdd8e36f83594.1707499278.git.oleksii.kurochko@gmail.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <3f662e3b4ded36d982ff04ed5cdfdd8e36f83594.1707499278.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FD:EE_|IA1PR12MB6283:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e22862b-9ab1-4e6d-16ec-08dc2ba6246e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KneJ1uLDWSZjObExO1xDi7wq/8W03BsSkUibBh9cLFdvSl4R5Cu0S60eFbKZPggYiDetJfdvSJo0K2W9G8hjCoIv+7aXoK2rBMOcPm3uCa4IawqGfDz3YNwWsrcY6G+/kebHjAOUsNL2CD2Yr6uuhuesNaxz6xYij6J+AW4882Y++4yN4zSG97P02s6hc23ZLpoXwXL50xXRm9yHjmxYXqfNNdINBxMBmxUXIjj0x5b9ucque2mxvS+/DNbccduBVFa1UmuEdh8G4akCBAS020D8qGK5vnfulM4RAW8b5UzIaSVqcU0KmM2BYaPOMX7kyAAj4M8QjsqsCCh7KfmjrZwEwQqPe5H7qnSSYG71X8oQFvfcYiyb6eOzuSVZ8WD6im9vg7F75izXUkFPrJHz2BkxhneKNLexYjf29nzXsj4PqcEMQ1I7kjAZRArkaR1fGTF6BTQRmd6IlKsM9NU59Jv4Dw4JAMO60OQrfEiggnLnk64bJaJJWdzKGcZSRd01hZRKYN20pAtiJyMJxaO0fmNhIYdteblS0ilS3Eu+2MkzioP47tFXer/8OcIgyE87nldse0ZdiSG3YMVzTK147g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(396003)(136003)(39860400002)(230922051799003)(186009)(82310400011)(1800799012)(451199024)(64100799003)(40470700004)(46966006)(36840700001)(81166007)(82740400003)(31686004)(356005)(41300700001)(86362001)(83380400001)(31696002)(4326008)(5660300002)(336012)(426003)(44832011)(8936002)(70206006)(70586007)(8676002)(54906003)(110136005)(966005)(316002)(16576012)(26005)(478600001)(2616005)(2906002)(53546011)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2024 08:39:35.5059
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e22862b-9ab1-4e6d-16ec-08dc2ba6246e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6283

Hi Oleksii,

On 09/02/2024 19:00, Oleksii Kurochko wrote:
> 
> 
> This patch introduces the file riscv-fixed-randconfig.yaml,
> which includes all configurations that should be disabled for
> randconfig builds.
> 
> Suggested-by: Stefano Stabellini <sstabellini@kernel.org>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> The patch were introduced after discussion in a topic:
>  https://lore.kernel.org/xen-devel/cover.1701966261.git.oleksii.kurochko@gmail.com/
>  ---
> Changes in V8:
>  - Nothing changed. Only rebase
> ---
> Changes in V7:
>  - Nothing changed. Only rebase
> ---
> Changes in V6:
>  - The patch was introduced in this version of patch series.
> ---
>  automation/gitlab-ci/build.yaml                  | 8 ++++----
>  automation/gitlab-ci/riscv-fixed-randconfig.yaml | 7 +++++++
>  2 files changed, 11 insertions(+), 4 deletions(-)
>  create mode 100644 automation/gitlab-ci/riscv-fixed-randconfig.yaml
> 
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index 6d2cb18b88..376eb17f9c 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -512,6 +512,8 @@ alpine-3.18-gcc-debug-arm64-boot-cpupools:
>        CONFIG_BOOT_TIME_CPUPOOLS=y
> 
>  # RISC-V 64 cross-build
> +include: 'automation/gitlab-ci/riscv-fixed-randconfig.yaml'
I don't think there is a need to create a new file for that.
You could define an anchor in build.yaml:

# RISC-V 64 cross-build
.riscv-fixed-randconfig:
  variables: &riscv-fixed-randconfig
    EXTRA_FIXED_RANDCONFIG: |
      CONFIG_COVERAGE=n
      CONFIG_EXPERT=y
      CONFIG_GRANT_TABLE=n
      CONFIG_MEM_ACCESS=n

and reference it in the job:

archlinux-current-gcc-riscv64-randconfig:
  extends: .gcc-riscv64-cross-build
  variables:
    CONTAINER: archlinux:current-riscv64
    KBUILD_DEFCONFIG: tiny64_defconfig
    RANDCONFIG: y
    <<: *riscv-fixed-randconfig

~Michal


