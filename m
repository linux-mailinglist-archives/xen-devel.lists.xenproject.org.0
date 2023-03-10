Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFB76B4051
	for <lists+xen-devel@lfdr.de>; Fri, 10 Mar 2023 14:23:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508491.783186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pacib-0004Qc-GQ; Fri, 10 Mar 2023 13:23:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508491.783186; Fri, 10 Mar 2023 13:23:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pacib-0004O5-DZ; Fri, 10 Mar 2023 13:23:33 +0000
Received: by outflank-mailman (input) for mailman id 508491;
 Fri, 10 Mar 2023 13:23:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C5rF=7C=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1paciZ-0004Nx-Mk
 for xen-devel@lists.xenproject.org; Fri, 10 Mar 2023 13:23:31 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20628.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bed301c4-bf46-11ed-87f5-c1b5be75604c;
 Fri, 10 Mar 2023 14:23:29 +0100 (CET)
Received: from MW4PR04CA0184.namprd04.prod.outlook.com (2603:10b6:303:86::9)
 by DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 13:23:25 +0000
Received: from CO1NAM11FT041.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:86:cafe::88) by MW4PR04CA0184.outlook.office365.com
 (2603:10b6:303:86::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.20 via Frontend
 Transport; Fri, 10 Mar 2023 13:23:24 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT041.mail.protection.outlook.com (10.13.174.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.19 via Frontend Transport; Fri, 10 Mar 2023 13:23:24 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 10 Mar
 2023 07:23:23 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 10 Mar
 2023 07:23:22 -0600
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 10 Mar 2023 07:23:21 -0600
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
X-Inumbo-ID: bed301c4-bf46-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MQw7EzLhKDCnX9yIqlE2Bw26jd9dtGxUsHWiKzrV3Yz1pNVvf5TYwz8fqKdmrFT/cLrZIpg4aXER1M+P79kKAIkn8m0aQo0FKNb0l5Tw+SQ8DyWFBzbnb71kRlwZ3D2TYoiFdD2kD0y1U/7fmfYX6/EfS9q3lncO37LAqobsVVcsX/HmqkQW5eH+4566CI9E7+hrIeJAfzGU5PcFoy7MJY/hkfMGWRpkFySJqMqaddfxJ6qKedfYTsBtOEFLOw16z2LLJBAfXJZHeIDXMAVU7fhdlKJp9ju0/v/kLX5zOgf/AGvchw4FE3xvH0QKLxFd54D84ULSupFAgB3xLdGrQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J0JihwpdVKh+75YoCU+4CiPQfiFiQ1GqJXVed1TfyBA=;
 b=DpAhZz7jMC+AF3KuZW9yRUw27/ndZMJ3L/YcI6t2+5tkus6YMRQswNUxuZa4fFI5vT7tlWndf1YwFYPpoS8fdq44jUp9bbuSs3itA2LaUd8LeSXHRJSWjQcGLi/ykJedjSv362OeaWLS8SXDKAT2DAasgqbOAQykMaZ27Kfs096UUVYW1u5VYZwnByX8QpfOXl2mPaxqie11r6dB+/Zu9SBXZbOBE4uRVdJKSZUKzd2CyiNiXlQOWpFARp8Mm/I5hP4lhlCd9AOfrpcnzNVX3D8o07dMVotP9u6JQCNVBQkFuYedXwmr89M5f5IGxjROnw1pszJZHp63TXZo9dol/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=oss.nxp.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J0JihwpdVKh+75YoCU+4CiPQfiFiQ1GqJXVed1TfyBA=;
 b=eeo1e4Z9ANoAVIw8Ld7OD9BrqvmfiYnxufvsp8G28DVDSGb/09+5dnkuY0WdR/p617qDUqWTnWzu57Zw1PwBImBDUa7TLiFQTEGE1IrM0W+4Tz3u61I3cl3LMdxF0XQB/k9S8RMduwF+ODBf/KDaW9eCauaXxN/R6UfLSjHkh6U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <9403b242-0fac-c91b-5145-3e128bed7923@amd.com>
Date: Fri, 10 Mar 2023 14:23:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/2] arch/arm: time: Add support for parsing interrupts
 by names
To: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>,
	<xen-devel@lists.xenproject.org>
CC: <Bertrand.Marquis@arm.com>, <sstabellini@kernel.org>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <rahul.singh@arm.com>, Andrei Cherechesu
	<andrei.cherechesu@nxp.com>
References: <20230309161933.1336367-1-andrei.cherechesu@oss.nxp.com>
 <20230309161933.1336367-3-andrei.cherechesu@oss.nxp.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230309161933.1336367-3-andrei.cherechesu@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT041:EE_|DS0PR12MB7726:EE_
X-MS-Office365-Filtering-Correlation-Id: 292b8ecb-c79e-485f-6235-08db216aa093
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6SQnjwkmklMee46zXbaWyFgP2a4OoMfXK3tzHW8DReVNTNqpl1F5esTNnG8sacBHn2MhK0WMvQV56VUnjIkNTm8Z4RhGc0o0M2BYkpV2/0ySVk1kNXppITmaBmviKquO3Mfy4He0SrLMRXPlRVCu6X3jgVK/SlxrBsA4OhxT/HDVcRi8WPP/kKhffUvnV+VggLGDppjZWQW2bdHzarjzYBScHpBseF2c2e7baJSj/AzyAkf/KwXdf825o+JEpU+aSwRYS2PGUP2hUEkIQxlbz2M8GQkI++WkGsfz23UruHbyCdiLPuDp882tancERDCCJ55LTjpTaUN06KvQfhaPL7CGN9GU9GlJhRNRvlH0EMjnR70V2QC3SqB2hi7mhi4yQkKuvWjQiD9J27Q2Al1/0+sA4kZjza5iJVQXuop2yrw1ucT6rN5CvwDwzg5kmJhxZFYnpy6eFX2ClkGoyflBaR9iMIhwgLgss7VdhQ7nI2Izavb7RzsYnGleC1C5y80kit6OT01AQjAa73VnSr+0THx0y5T/qwuH96/N1W6FwNbPbpSMZ0s7Qb9NdGSpzRf37qKb9bFzQ4fyzXzha+3/CxrYh+fuPL0SABwpTCN7L2j0S33QyVjKaKCz7x784gWpVCMART+NzwaP0UxjOhNbXtTx1t0L0wWuD9lTNe8O6otjGgr9C7/dY7zWIpdu9N+IXK3xL0rzM51TIwSPQ3FQ/EGSl+t3hA2csd4Bz1DIqz5clp2jeqFwbl1PhoKReXe7No4ytbkokbbDRjTpJY7fkw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(136003)(346002)(376002)(451199018)(46966006)(40470700004)(36840700001)(83380400001)(36756003)(82740400003)(81166007)(54906003)(31686004)(47076005)(478600001)(426003)(2906002)(186003)(40480700001)(356005)(82310400005)(70206006)(8676002)(4326008)(70586007)(44832011)(2616005)(26005)(53546011)(31696002)(5660300002)(86362001)(8936002)(110136005)(316002)(41300700001)(16576012)(336012)(40460700003)(36860700001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 13:23:24.5914
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 292b8ecb-c79e-485f-6235-08db216aa093
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT041.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7726

Hi Andrei,

On 09/03/2023 17:19, Andrei Cherechesu (OSS) wrote:
> 
> 
> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> 
> Added support for parsing the ARM generic timer interrupts DT
> node by the "interrupt-names" property, if it is available.
> 
> If not available, the usual parsing based on the expected
> IRQ order is performed.
> 
> Also changed to treating returning 0 as an error case for the
> platform_get_irq() calls, since it is not a valid PPI ID and
> treating it as a valid case would only cause Xen to BUG() later,
> during vgic_reserve_virq().
vgic_reserve_virq() itself does not call BUG(), so to be more precise,
instead of "during vgic_reserve_virq()", how about:
"when trying to reserve vIRQ being SGI."

> 
> Added the "hyp-virt" PPI to the timer PPI list, even
> though it's currently not in use. If the "hyp-virt" PPI is
> not found, the hypervisor won't panic.
> 
> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> ---
>  xen/arch/arm/include/asm/time.h |  3 ++-
>  xen/arch/arm/time.c             | 27 +++++++++++++++++++++++----
>  2 files changed, 25 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/time.h b/xen/arch/arm/include/asm/time.h
> index 4b401c1110..49ad8c1a6d 100644
> --- a/xen/arch/arm/include/asm/time.h
> +++ b/xen/arch/arm/include/asm/time.h
> @@ -82,7 +82,8 @@ enum timer_ppi
>      TIMER_PHYS_NONSECURE_PPI = 1,
>      TIMER_VIRT_PPI = 2,
>      TIMER_HYP_PPI = 3,
> -    MAX_TIMER_PPI = 4,
> +    TIMER_HYP_VIRT_PPI = 4,
> +    MAX_TIMER_PPI = 5,
>  };
> 
>  /*
> diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
> index 433d7be909..868e03ecf6 100644
> --- a/xen/arch/arm/time.c
> +++ b/xen/arch/arm/time.c
> @@ -38,6 +38,14 @@ uint32_t __read_mostly timer_dt_clock_frequency;
> 
>  static unsigned int timer_irq[MAX_TIMER_PPI];
> 
> +static const char *timer_irq_names[MAX_TIMER_PPI] = {
This wants to be marked as __initconst as it is const and only used in init code.
So it would be:
static const char *const timer_irq_names[...

Furthermore, as the only user of this array is init_dt_xen_time(), you could move the
definition to the function itself.

~Michal

