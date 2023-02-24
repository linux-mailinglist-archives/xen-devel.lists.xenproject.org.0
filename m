Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7541A6A1999
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 11:09:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500884.772420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVV0B-0006qL-Ks; Fri, 24 Feb 2023 10:08:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500884.772420; Fri, 24 Feb 2023 10:08:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVV0B-0006nj-I8; Fri, 24 Feb 2023 10:08:31 +0000
Received: by outflank-mailman (input) for mailman id 500884;
 Fri, 24 Feb 2023 10:08:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gf2v=6U=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pVV0A-0006nb-HF
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 10:08:30 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20606.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2cd659c7-b42b-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 11:08:26 +0100 (CET)
Received: from BN9PR03CA0657.namprd03.prod.outlook.com (2603:10b6:408:13b::32)
 by DS0PR12MB7994.namprd12.prod.outlook.com (2603:10b6:8:149::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Fri, 24 Feb
 2023 10:08:21 +0000
Received: from BN8NAM11FT095.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13b:cafe::37) by BN9PR03CA0657.outlook.office365.com
 (2603:10b6:408:13b::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24 via Frontend
 Transport; Fri, 24 Feb 2023 10:08:21 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT095.mail.protection.outlook.com (10.13.176.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6134.24 via Frontend Transport; Fri, 24 Feb 2023 10:08:21 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 24 Feb
 2023 04:08:21 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 24 Feb
 2023 04:08:20 -0600
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 24 Feb 2023 04:08:20 -0600
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
X-Inumbo-ID: 2cd659c7-b42b-11ed-88bb-e56d68cac8db
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R5vLm0zTr+Z2gyypUTrUOJ/3oVgjHEegARs44t68V5wT/q9ZSQ+KqYyk7eDIYLtKOoHzK0PeXBXfJ2sw4EoWjpnMfY1FK94nxPyutL8slavQhBCUjhbw3ge0hFsvALe+FMIvuwEIf3w7EEyTi8VgqUBp2n7y6wuVY5Py/NxdOHIo2+/+naHf6s9xa6NmI/4/3sLsMzKYqm1ZdBo/f1FZg4I+CSacb2TE9SYYgP1VvX60/ze3WdesN8tkqy116Cblkfu2MI9fwQHeucnowa9GapzlBgQTx3r1RmFS/IM1X1eNd5uLBzzLxYY44BZZt8IRfth2vWbA//qIu7e7vzE4aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l5NnKV5PC5nWIme5U/qii0TPnb2iwSZADvc62G5g428=;
 b=dJKzmU/2kOj5yT/FOupLAEXmUBkbxG2AxvY/4sWm9yWwSCmP9/22rvW/8R3kZbG3hPRWpfDM3yepBow9quQaExb183PY1/6cxSugzypZVyMAyEMUBR0EMGMcfKT1p9gO2pgvSNHjdT3JEooKd8006G50FIC7uFJ8ABHFA3wZObMUiT5HWTHAUOYxL5dmCXyCLluHYigk/7e5OLMk//X1DG3FpZTUMv8fCPQ6w3SKckfLcHQEBRL7vBF8qyB0Fu+r6tJMZQ35Hd24pToYjpuY6ZFJ8iAAQyh1nLI0tM9lY5LzeuO5+vOZUHfx5unNYSpsTtOF/wSLqOKgU6UOeSV7xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l5NnKV5PC5nWIme5U/qii0TPnb2iwSZADvc62G5g428=;
 b=l81pznk9ihbfc+44TmecbfPTOKnHfyFvubwlBvCDYKXBQJglqhIGM8ZgwRF4d5TsVkgNTqgsyWuMgAGi0XuDcjTKtnLVYdrdSX3TmvD4Yiyf3zsFvCKzquXpjfC6f8PpksLPviX+PseesuEdK0Tl3qET2eXUYn0KUMo/STwmpxI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <34c7b0b6-319e-5dd8-28f7-ac2153c0ffe8@amd.com>
Date: Fri, 24 Feb 2023 11:08:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 3/3] automation: expand arm32 dom0 test adding xl
 domain creation
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
CC: <cardoe@cardoe.com>, Stefano Stabellini <stefano.stabellini@amd.com>
References: <alpine.DEB.2.22.394.2302171606480.2127160@ubuntu-linux-20-04-desktop>
 <20230218000747.2965719-3-sstabellini@kernel.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230218000747.2965719-3-sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT095:EE_|DS0PR12MB7994:EE_
X-MS-Office365-Filtering-Correlation-Id: d7524fb6-11b6-495f-6d03-08db164f0f47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KMVCSkRkMmlkGFLdk/Dpod4oItqEeAnfWnA1tEzC28y3V5h8IzL9WZz6RkGES4Ue0G/po8JPGr0p9MWB7X3RpjBhCFuJLRqGfuK784hkTlNTnEMpPmEBV7miV3BkuJxyfsmBZUFJoOI9BQ+1NLjZtCXFeeyjKGVdqTmZyH2fX19FQKPkruZWOvt4GrTih8FW3qy+/F7thAuGyYkju1WmUElRZczCdBjIUxCK2c7nilaJVlNEaDmnD8p87aamfubjHouU9s0Yg4dI4OAqLyxJI+un+m103NVJS5+uOtLj/HPZW58SDUq3U04OP/RaTPwrE1DgopJ83NAAETPhPon7bMzobAp6BGIbqVb29G9yscl97XvLv3tDUYFv9tTWkLes0IiJSvWeQXOgjtvIM7xDG1oAdOP0eejhiWMlW+GWqb+3VI4uOqp9MZIZs04M93E/t0SD85aVkGq0Md1aJfhY+2XNbu9LGW1TfNZ87IuX+CxAEaHmwnrdWaPpcGPh/g7eqhLpa3t0TnC1yX7uECLCEtz90M/+apUiGvxyVocdJGdjKW2Bs51ewL8Rr2UputgnOF8GWXDhu7CmBa1lphtnClxdepMaYccE8lFKi6Z4wmK7mYPv+Ob71wIyenqRmFjYuxEinwXLN3frbv0/BYBTVxNqpP5nuyH6CfDj0K1lTOFl6WT5ZBmf1XMBG6JazRUG7MiVkTo/66N8bJ5QIOq3arYmGXs61+JuAXAWQABFPM/0n65uyGn/Qq++IDOkBDOgLQtFkp6Imxx3kz/5YScMoQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(39860400002)(396003)(346002)(451199018)(46966006)(36840700001)(40470700004)(82310400005)(40480700001)(40460700003)(2616005)(426003)(336012)(47076005)(83380400001)(478600001)(6666004)(186003)(26005)(53546011)(356005)(82740400003)(31686004)(86362001)(31696002)(36860700001)(81166007)(41300700001)(4326008)(8676002)(8936002)(44832011)(5660300002)(36756003)(2906002)(316002)(16576012)(70586007)(70206006)(110136005)(54906003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 10:08:21.7155
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7524fb6-11b6-495f-6d03-08db164f0f47
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT095.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7994

Hi Stefano,

On 18/02/2023 01:07, Stefano Stabellini wrote:
> 
> 
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> As part of the arm32 dom0 test, also create a simple domU using xl. To
> do that, we need the toolstack installed in the dom0 rootfs. We switch
> to using the kernel and rootfs built by the Yocto arm32 job.
> 
> Remove the PCI node from the host device tree: it is unused but causes a
> Linux hang at boot.
> 
> Use xen-watchdog to trigger the domU creation for convience
> (/etc/local.d is not handled by rootfs.)
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
> Changes in v2:
> - remove unsued debian-unstable-gcc-arm32 dependency for
> qemu-smoke-dom0-arm32-gcc
> - remove job qemu-smoke-dom0-arm32-gcc-debug as it doesn't make sense
> anymore
> - grep for both dom0 and domU prompts in qemu-smoke-dom0-arm32.sh
> ---
>  automation/gitlab-ci/test.yaml              | 11 +----
>  automation/scripts/qemu-smoke-dom0-arm32.sh | 52 +++++++++++++++------
>  2 files changed, 41 insertions(+), 22 deletions(-)
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 00273b21c8..6d09c97702 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -171,15 +171,7 @@ qemu-smoke-dom0-arm32-gcc:
>      - ./automation/scripts/qemu-smoke-dom0-arm32.sh 2>&1 | tee ${LOGFILE}
>    needs:
>      - *arm32-test-needs
> -    - debian-unstable-gcc-arm32
> -
> -qemu-smoke-dom0-arm32-gcc-debug:
> -  extends: .qemu-arm32
> -  script:
> -    - ./automation/scripts/qemu-smoke-dom0-arm32.sh 2>&1 | tee ${LOGFILE}
> -  needs:
> -    - *arm32-test-needs
> -    - debian-unstable-gcc-arm32-debug
> +    - yocto-qemuarm
> 
>  qemu-smoke-dom0less-arm32-gcc:
>    extends: .qemu-arm32
> @@ -244,6 +236,7 @@ qemu-smoke-dom0less-arm32-gcc-debug-without-dom0:
>    needs:
>      - *arm32-test-needs
>      - debian-unstable-gcc-arm32-debug
> +    - yocto-qemuarm
I assume this was placed here by accident as this is a dom0less arm32 test.
With this removed:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal



