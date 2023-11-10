Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 735347E7A5E
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 10:02:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629986.982585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1NOy-0000pv-Qv; Fri, 10 Nov 2023 09:02:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629986.982585; Fri, 10 Nov 2023 09:02:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1NOy-0000mf-OH; Fri, 10 Nov 2023 09:02:08 +0000
Received: by outflank-mailman (input) for mailman id 629986;
 Fri, 10 Nov 2023 09:02:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TCxK=GX=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1r1NOx-0000mX-Gw
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 09:02:07 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7eab::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0cb67dc-7fa7-11ee-98da-6d05b1d4d9a1;
 Fri, 10 Nov 2023 10:02:05 +0100 (CET)
Received: from DS7PR05CA0006.namprd05.prod.outlook.com (2603:10b6:5:3b9::11)
 by DM4PR12MB7552.namprd12.prod.outlook.com (2603:10b6:8:10c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Fri, 10 Nov
 2023 09:02:01 +0000
Received: from CY4PEPF0000EE3A.namprd03.prod.outlook.com
 (2603:10b6:5:3b9:cafe::2c) by DS7PR05CA0006.outlook.office365.com
 (2603:10b6:5:3b9::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.10 via Frontend
 Transport; Fri, 10 Nov 2023 09:02:00 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3A.mail.protection.outlook.com (10.167.242.14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Fri, 10 Nov 2023 09:02:00 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 10 Nov
 2023 03:01:59 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Fri, 10 Nov 2023 03:01:58 -0600
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
X-Inumbo-ID: d0cb67dc-7fa7-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tk+7GEV8oNjnSI0CpgJewuKXhNJgolm5u1Ii1aa+/wMdZ3rlNgVfB4+69LJLsDr12BoX7jJRBlYmLRUfpppk82hakZS0tYrJP4W7IyTEDPhQF7adFH36BcnpPcD0HevzwtcbCqY3qCGj8gldHnZ8bSml7EmGoMn9txPEqezJ9g1dmAE0mgxZTJA9Gjvhj+yuxi/BTi+3k0tnxNQ1+afIbh4Gz9c5jUfr0wv8oF37AUjLLBzTLFYHgLNt+khu6S5KC0drvKBawYfoLmanGmFRWXPFBZAoXInjE4fzjxZ501OUQhN3zhg/o60r4NkSzpNtenYgqIl+YU/h8HO+ATJQkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wOW6trCc8zTnHRP40ysC1hkMyaXlqA9mm0gd9HxSMNo=;
 b=e7NXX+fsxT1R7QWTKCeyV7f+Hs0D5d0h7OY/iBqPTAIZudFCOwg7O7xc1c8J0gtSOg7gw5ZRbJLM5d66rP8EbG6iMMJsicb+VyXXTx0LDZ939QQNiIw0iCKbKaO5H/QrXIUMqLAyfQr11Hk/5FTyVAh0Io+VEbUPpI0b1ViRrC0hugwgzDJ5bOB9JCHR5tz5sgBl1okn+brGfkPDFZyP6w5BnnrIIyyNwtIJaVKJtRHT5ptLkrQgd1RI5JGm9qwUj2fv+jOOYk8T3FlH+9ntXxrPw93tWqdBrjH//wxWvB1m1w2r9QsRCgNLrZtX4Fyggt1nmwOP3XpsXGlB/PktcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wOW6trCc8zTnHRP40ysC1hkMyaXlqA9mm0gd9HxSMNo=;
 b=VcJcfp2fJl0DgbiCZE3as2ZpwPxZ777sADhCN6ouHkUmcwhQ+vvEYqYhWbOFbA7lnvOJ4tGdYw+lil+wz+pxJDydqOMQsG1/bFzqqbyNOpotEvFApKS6cIbWe5MA1hJoecmOls1apyERJEuj1WnSc1gtmRRJ5CYNhR5dH9EZaNI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <43a1c5c8-6243-4912-bf3f-f3e35b504271@amd.com>
Date: Fri, 10 Nov 2023 10:01:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] arm/dom0less: introduce Kconfig for dom0less
 feature
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231109090615.3878767-1-luca.fancellu@arm.com>
 <20231109090615.3878767-6-luca.fancellu@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20231109090615.3878767-6-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3A:EE_|DM4PR12MB7552:EE_
X-MS-Office365-Filtering-Correlation-Id: 2224af27-bb8a-485e-7e69-08dbe1cbb368
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8hM69RxP8gyWztDSDJ4DokB3O+KCc7NKAVb+oXA5lH4jnIQhmbItZYOEmrKE7HqigMFdppUl4Bj8r0KGgTOV8D1eHEbBmfC+Y55wysRc1iSckp0JW9NdKuzYMGbhZO3IZ6q2cqHBiKNC3lnrtENTYSVcwPKlU1u0lZFJPZPohBG16vsk9jmAEBqTAZqjPskAeR7SViDT30l7z7eQcPPukubU3d6aEuuJYs1EAb8DaSzD4Rlt9+T6PSzmNjn7YLIPAxUirlh5vXnUgRd/lpRGG5L7EHR7MWhMLpdpHR7ye23nyUCR3O9DsmMUS+s9SgceEXmYiMC79d0UMr3JX2hYJycInEU4iAsqIyizweT+i1Bu0dD8YYGFLss1+onfxCIwR+xrlYU1gTql3Iq5TkYp35Mxv+B97AJv2pJip7l1aulwHpovIGhxQawXBTtPNmUPUibL8qmS7KLSfVwdktUIWYZbAqSFnVtni3rPG/q2ZI0gNHol1s/WXTjvAhLPYLEe2zTPY5il/lUy/utNng6ZGrLIeMoh6zXoPr1kTeo2lODvvFWLJDWbKwtOOS+D/JcXEq8TUYoXnK7WyqAuLLVVz0RiDD9rxIsOmjzgOzqokqL+t8dIJ0V09b92MyxsxSnU/5WFUCJFrp1NZtwj26iwvLQ22171Gb3ZAXW1ypf5YJEqnKWvWj3s69l6TYOUTYq/lF/ur3j4l0xMCDc+GF9E2tOAFwUh8DWuZogF0mkGOyJRNvG4W9UXNcwDsCNe/BUTy3BEcDTRDrRisbdOZ62PTXg6i3BV6L8wd2+c9zxVADwCkpctsbH1a/zA6tkOmlUekhB9KUkol2TRJNywYp+6+TrHTVwDlj384RSKR1NFZmcrr4vd9xw2W1nYZOFoOeXf
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(136003)(39860400002)(396003)(230273577357003)(230173577357003)(230922051799003)(82310400011)(64100799003)(1800799009)(451199024)(186009)(40470700004)(46966006)(36840700001)(40480700001)(36860700001)(47076005)(26005)(8676002)(4326008)(356005)(81166007)(83380400001)(478600001)(31686004)(53546011)(8936002)(426003)(2616005)(336012)(316002)(70586007)(54906003)(70206006)(110136005)(16576012)(86362001)(31696002)(36756003)(41300700001)(5660300002)(40460700003)(82740400003)(2906002)(44832011)(32563001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 09:02:00.5918
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2224af27-bb8a-485e-7e69-08dbe1cbb368
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7552

Hi Luca,

On 09/11/2023 10:06, Luca Fancellu wrote:
> 
> 
> Introduce a Kconfig for the dom0less feature, enabled by default,
> to be able to choose if the feature should be compiled or not.
> 
> Provide static inline stubs when the option is disabled for the
> functions externally visible.
> 
> Use the new Kconfig to remove dom0less DT binding from the efi-boot.h
> code when the Kconfig is not enabled, do the same for
> allocate_bank_memory inside domain_build.c that currently is used
> only by dom0less-build.c module, but it's kept there provisioning
> its usage by dom0 code.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> Changes from v2:
>  - protect allocate_bank_memory with the new Kconfig
> ---
>  xen/arch/arm/Kconfig                      |  9 +++++++++
>  xen/arch/arm/Makefile                     |  2 +-
>  xen/arch/arm/domain_build.c               |  2 ++
>  xen/arch/arm/efi/efi-boot.h               |  4 ++++
>  xen/arch/arm/include/asm/dom0less-build.h | 12 ++++++++++++
>  xen/arch/arm/include/asm/domain_build.h   |  2 ++
>  6 files changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 0045a3762d86..0399f2faf734 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -88,6 +88,15 @@ config GICV2
>           Driver for the ARM Generic Interrupt Controller v2.
>           If unsure, say Y
> 
> +config DOM0LESS_BOOT
> +       bool "Dom0less boot support" if EXPERT
> +       depends on ARM
You're in the Arm Kconfig, so there should be no need for this dependency (it is implicit).

Apart from that, we have 2 features: static mem and static shmem that are only meant for dom0less domUs.
Shouldn't we make them dependent on DOM0LESS_BOOT? Otherwise, what is the purpose of selecting them
with DOM0LESS_BOOT=n?

~Michal

