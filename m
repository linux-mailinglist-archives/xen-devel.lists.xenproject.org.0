Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E9463D63D
	for <lists+xen-devel@lfdr.de>; Wed, 30 Nov 2022 14:03:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449883.706899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0Mjo-0005qP-0G; Wed, 30 Nov 2022 13:02:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449883.706899; Wed, 30 Nov 2022 13:02:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0Mjn-0005nu-TE; Wed, 30 Nov 2022 13:02:55 +0000
Received: by outflank-mailman (input) for mailman id 449883;
 Wed, 30 Nov 2022 13:02:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HXMn=36=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p0Mjm-0005no-F9
 for xen-devel@lists.xenproject.org; Wed, 30 Nov 2022 13:02:54 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7e88::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48ee58f2-70af-11ed-8fd2-01056ac49cbb;
 Wed, 30 Nov 2022 14:02:48 +0100 (CET)
Received: from BN9PR03CA0153.namprd03.prod.outlook.com (2603:10b6:408:f4::8)
 by MN2PR12MB4063.namprd12.prod.outlook.com (2603:10b6:208:1dc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 13:02:49 +0000
Received: from BN8NAM11FT008.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f4:cafe::62) by BN9PR03CA0153.outlook.office365.com
 (2603:10b6:408:f4::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23 via Frontend
 Transport; Wed, 30 Nov 2022 13:02:49 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT008.mail.protection.outlook.com (10.13.177.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5857.21 via Frontend Transport; Wed, 30 Nov 2022 13:02:48 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 30 Nov
 2022 07:02:48 -0600
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 30 Nov 2022 07:02:47 -0600
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
X-Inumbo-ID: 48ee58f2-70af-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hpa1TJsrRvBxkZ3lR4SNp12RUTyhmSZinI2MKzdqMPpvHtExHLWq53Tk/rrYlun0jiigMygnE8HbCODQtcdG8/l0FOCgpGGcTPsKN/2FCRXHlzuozU96tqR2ORMmzzHoLbuk4NVi15cKLWOeTFGZJmI8lqeS6uljg30kgiNGdHsky3LAGPK8ZjACWjF4+D7vBZh3FK8/AVhx8odfasvcIZ+KlQA+NdO1iB7yYOZiIv6mH7fwb0/S/L5qDG+xcrJsHF//vZ4BrOy52x9j3VNSVrd0jE+/3nk/XSXxJrUqlLCvUEt9zWl9WHHUOpAhq3EwydARK0cC/zczGmI/v/7NQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3vs+oKPzHUs3Mex4OBPW8UTub7EPTQmjC5OS++U2WE0=;
 b=D81RkqtqGecZvT0sJ4+ymkOMkJ2WMwVoskqShEMCoMsSxG+iC5gVOY0mEtCsaR9bEG7x3yb2UqMdVyQtxOXxSiarQBcOcXFtwThu3nxmZcwpQk0Uxl3LTX5fW0UM5YNHI38CidjOhPnPmQdogThZ3E8WhgE1gZ+ALm3d2FHCEcfo0x8EVHZucxrW9BG5HxT1LwDfXt3rAb0UvF3hiARxePF6yXO3VX94dpOhu4iV7OSLMaq2D+6XNaYbsYICZXZQprY59cU2O2P8VJOnvfg4/B4Zf7r4ob7OQXh5k90Y40WW92E/pw6F8xjwTzAoMI/gHQnhCLbxDnDeHF7DOaG1/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3vs+oKPzHUs3Mex4OBPW8UTub7EPTQmjC5OS++U2WE0=;
 b=VibMFQJqEcyPn0aLUAJiqNTy4g/EVK88zwuR77bR7kzFbx0hpnDNKndy8MUerysnA/DUZ6bVwvqKtZ0jqIo24L7rjnScstW5pfF2PVO0JhsTYE+SijAixTVCSo7wZQQWofGiO4e/Bh/jkBIw8xo/4yEPmrFBrMsUhw5U9H54GvQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <e453dd21-5fbd-5edd-2269-29c72a70299f@amd.com>
Date: Wed, 30 Nov 2022 14:02:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v5 3/3] automation: Add CI test jobs for Yocto
To: Bertrand Marquis <bertrand.marquis@arm.com>,
	<xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>
References: <cover.1669810269.git.bertrand.marquis@arm.com>
 <e64015d3e8682d068223e94f3bfc8ad823b27a65.1669810269.git.bertrand.marquis@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <e64015d3e8682d068223e94f3bfc8ad823b27a65.1669810269.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT008:EE_|MN2PR12MB4063:EE_
X-MS-Office365-Filtering-Correlation-Id: 71e37b0a-ccce-42fd-9324-08dad2d32e9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nnwZ5poR41rzz2fSAj+ZczhcpAUKsoGg85PjoQkqerezzL5LIMeKWb9l2QmkG9UQULmXb7EMzibtunW1wwdRKdy4PKFj5Q5Ubew1h1mwA7A1e2XKqSAcgrG92XiUfheqcvEtwi6eDcEIesQGzcxx/RUcaJosuxSWDTjiiV5IZPnZkdq11JqsPVji6dRY84jc1dgi2Cq3i2zQnBL0o3AZQWAmGRd5Unb2EV/b2+GZdRqbwGAQ9sTyVeAWoMeBFjzP9KHmnuXGsqJvF3PRg7h5MxMOGr15ssySJXlmBcxpe4edncbJqGdW0OTXbZAhCAY96zMCB+xJrjiZJs+OzF/8k4d6hm7uaYx3r6xZe/npZP+wZwh7WJVFgNKVyOP19JGOl3su1WSOWJ8p2Sj1F4CGgkeZO15S1K3N0sc4fc5pgtrHozZ6PAVkVCbQD87kIE3x4X1mzeGdnLbJLGQWXb3sCtuxInw08OMPzQSLF3RmeSKgYcay5lgvytdp2ueK2OMdlIiihyeo/CmltpqEWCmgOK0dxgaA1Ogvtn0kfEj4JbZZPOkSUpMgsJEgv+hy13YYy1YNfiW3rgFiEbNEihPKcbfq1c7ugrNO6ks8wg11HNKJ/qISQUc96FPs2FHe8fDVJfDDsPQ/9BNPMhLQhi84iFQKwrOUHKlVRWZBFqHwU8+ofgqB+W6wl0N2W7aK6rVSnpalpdQNHaglhC04WuSMNGQcL6j97ipZuPL70/PPwClizmPJNxY9EWIyxNd9RGLxf2QUiCtjfOe4URlpNa2WPg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(346002)(376002)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(356005)(2906002)(40480700001)(36756003)(40460700003)(81166007)(86362001)(31696002)(478600001)(44832011)(41300700001)(26005)(316002)(70586007)(36860700001)(5660300002)(70206006)(54906003)(8676002)(8936002)(4326008)(16576012)(110136005)(82740400003)(2616005)(186003)(336012)(53546011)(82310400005)(47076005)(426003)(31686004)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 13:02:48.7888
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71e37b0a-ccce-42fd-9324-08dad2d32e9d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT008.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4063

Hi Bertrand,

On 30/11/2022 13:15, Bertrand Marquis wrote:
> 
> 
> From: Michal Orzel <michal.orzel@amd.com>
> 
> Populate test jobs for Yocto based tests using the provided containers.
> Due to the size restrictions, it is currently not possible to split the
> build and run tasks, therefore everything is done in a single step.
> 
> Test jobs for the supported Yocto targets are generic to avoid the
> necessity to add new ones after each Yocto release. The only thing
> required to be changed after updating the containers is the variable
> YOCTO_VERSION stored in a .yocto-test template.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
> Changes in v5:
> - none
> Changes in v4:
> - add .yocto-test for arm64 and x86
> - make yocto jobs use arm64 version
> Changes in v3:
> - patch added
> ---
>  automation/gitlab-ci/test.yaml | 43 ++++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index c7e0078e04f1..6ce2fd63eee6 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -54,6 +54,33 @@
>    tags:
>      - x86_64
> 
> +.yocto-test:
> +  extends: .test-jobs-common
> +  script:
> +    - ./automation/build/yocto/build-yocto.sh -v --log-dir=./logs --xen-dir=`pwd` ${YOCTO_BOARD}
> +  variables:
> +    YOCTO_VERSION: kirkstone
> +    CONTAINER: yocto:${YOCTO_VERSION}-${YOCTO_BOARD}-${YOCTO_HOST}
> +  artifacts:
> +    paths:
> +      - 'logs/*'
> +    when: always
> +  needs: []
> +
> +.yocto-test-arm64:
> +  extends: .yocto-test
> +  variables:
> +    YOCTO_HOST: arm64v8
> +  tags:
> +    - arm64
> +
> +.yocto-test-x86-64:
> +  extends: .yocto-test
> +  variables:
> +    YOCTO_HOST: amd64
> +  tags:
> +    - x86_64
This hidden job is not used by any yocto test job and as such can be misleading to others working on this file.
So we can either remove it (can be easily reintroduced once we will find more x86 resources) or add a comment explaining why is it here.

> +
>  # Test jobs
>  build-each-commit-gcc:
>    extends: .test-jobs-common
> @@ -188,3 +215,19 @@ qemu-smoke-x86-64-clang-pvh:
>      - ./automation/scripts/qemu-smoke-x86-64.sh pvh 2>&1 | tee ${LOGFILE}
>    needs:
>      - debian-unstable-clang-debug
> +
> +# Yocto test jobs
> +yocto-qemuarm64:
> +  extends: .yocto-test-arm64
> +  variables:
> +    YOCTO_BOARD: qemuarm64
> +
> +yocto-qemuarm:
> +  extends: .yocto-test-arm64
> +  variables:
> +    YOCTO_BOARD: qemuarm
> +
> +yocto-qemux86-64:
> +  extends: .yocto-test-arm64
> +  variables:
> +    YOCTO_BOARD: qemux86-64
> --
> 2.25.1
> 
~Michal


