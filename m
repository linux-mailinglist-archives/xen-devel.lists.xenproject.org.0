Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CF77F7482
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 14:03:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640676.999244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6VqJ-0008HT-Sl; Fri, 24 Nov 2023 13:03:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640676.999244; Fri, 24 Nov 2023 13:03:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6VqJ-0008Er-PU; Fri, 24 Nov 2023 13:03:35 +0000
Received: by outflank-mailman (input) for mailman id 640676;
 Fri, 24 Nov 2023 13:03:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u6gD=HF=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1r6VqJ-0008Ej-1j
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 13:03:35 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20631.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id def08799-8ac9-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 14:03:33 +0100 (CET)
Received: from MN2PR16CA0062.namprd16.prod.outlook.com (2603:10b6:208:234::31)
 by SA0PR12MB4461.namprd12.prod.outlook.com (2603:10b6:806:9c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21; Fri, 24 Nov
 2023 13:03:28 +0000
Received: from BL6PEPF0001AB50.namprd04.prod.outlook.com
 (2603:10b6:208:234:cafe::a3) by MN2PR16CA0062.outlook.office365.com
 (2603:10b6:208:234::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27 via Frontend
 Transport; Fri, 24 Nov 2023 13:03:28 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB50.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Fri, 24 Nov 2023 13:03:27 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 24 Nov
 2023 07:03:26 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Fri, 24 Nov 2023 07:03:24 -0600
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
X-Inumbo-ID: def08799-8ac9-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kEkU8uKxj1IVVEXlQEA00WBii0fE4uI6Wte+ci89VYdBr9pMT6lQ0CSgZ9Rmyu5dyM4wlh8wNACBDqFDMvfSag+3ZfnmgBoWd0UgDuJOI99LQMuFThKGqBNTL9Jwk0VPkkjlRvj0vF57Zpb1KlPNXK+2jc7Fsg2u+GHI+nhPL4sX9M15moVdFKlF4D1CG1TBmQll3VBKyWChUPnclWheBpoLNsxNICVXtqm7ywNfFIQ52JxkYytV4k1+CqpXN1aPJD0QsUmV3cNVkij+OiTInFeWhx4iLwI6UVq9dS4sVCBVvGg868ojSTTuWQEZ7lzkf254vI24IoqzSA/eWkeoUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2/KWxRtgo9u9naN8fCMsjhe9r40LEJgm9tnGJbTO5+I=;
 b=G6Cl4GbN3HE2gh/FofqbgwaUqhvWjMhdqbt5Rnze1ur6epjewx59doFKme1qpOrdFMk8YpCNaxfH2AfF1zX/pmQ0T6gDPZBuD1iuHCFofUYAzZgErmcSUbk1OX8NJhUVC7Px/nzuqPxnHXMmj9gkXBysTQM15XudAnzafFqeb37Cjdn1ziwic2NV9bd4l9FWYVVHOaBEJYThOMjW6cAIUA9giz3WaUbJtv66PGEbUY4kLk0jfXcOoVeD+6G+NuQAN/pS3qUitJyFLuXEZ+HHkVoIe7GSILIk6NsZVYtAibODvyAe+e2BUHJQ0PBu0sUnCXKgc5z1rW+0rj25sKF3PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2/KWxRtgo9u9naN8fCMsjhe9r40LEJgm9tnGJbTO5+I=;
 b=30+J0yz7YdaGw15qYlnVXs5SZjAM1Jp+FtbIwceDCsr32lmRIImPcgI2crnLxxlrK5CbVyzmuh7QmQyyAzq2iaQfCnV4LfuhDTXqRqynCPODyyFNm58SPXP72sp34/G69nw01ug8ALXt1qAk5lqQkeM+1ZCrKCf5LJ0I+0Wz9T8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <c728ba04-8cbd-45d5-af2c-eefcdf3f7afd@amd.com>
Date: Fri, 24 Nov 2023 14:03:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/14] xen/asm-generic: introduce stub header numa.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Shawn Anastasio
	<sanastasio@raptorengineering.com>
References: <cover.1700221559.git.oleksii.kurochko@gmail.com>
 <7ae3b2dbdb8e711b2462af511e1f64c2700113d7.1700221559.git.oleksii.kurochko@gmail.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <7ae3b2dbdb8e711b2462af511e1f64c2700113d7.1700221559.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB50:EE_|SA0PR12MB4461:EE_
X-MS-Office365-Filtering-Correlation-Id: a66a6895-2e86-4d5f-ce81-08dbecedc045
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QQvGWly0ZUmYp6h2YFMbLxTz1CnCJ7dnWxgis1P5sSIsNTpdkvt2P1jPmVwxYlDUjM5JogSeGN3Y2MEiVso03UHQllTgtA8VRzZvsnzkjekOAxsf/26V3PdvDNCi4rYEKw4Vm8obZvzLliC344KI+sGslCC+vmUp9GHOSjssWVMoNNzNvzmvBWzA0hCbmq5m3K7O2WjsdfC004uqU1dIFKX/F3GyvqXmyPzChTn9XkTqn3oggvRn/30v/s7NFMO2T1lftFAmJCNgtpPTdHonkFESz5tPptg7bj9gr3M/fGIpa45dccYDgxIGFLw19MZrbL81efP2PhSR9/hcbIZcfIuGpcoIvBxQreOU7BoVmfX0RKn91w6wIEwmmuxg9/n64+GwDhzaMh5+SIxTzAjy+MmpFQMrGFhBudVV64QEuXhnbu/HClyFBVg28k9a64wPfgMQ2bykXzUSJJmCmqnb9xNX/D0ccyR8+dYD5kD/PkF5HRdTLEZjtxyd5ISRy1bdd2EU3zFAIG64zFlnE9wvmDSC4N72IzNomms9AKXGD8X3QMKBcPWv87I99SoObxXPIwaDke9tY+X+6o7zCJIFeWsMjB9aor83/7BoLXcKnRrKJGD4Eu06r0Q03VIOH7hEyWPAqRBeqgW12yJDdbYRc4tQifYQiUbCQDhD5gxwmip8q+a4JR8PL2oBt0sPII/jqD8cSLLI918UOq0N5sWsCxEZ/8/UpRWtvVOcwGEukRPAy81kFKuIRmP5KkSOPXsV1tePfY+JQyWreWYF10ywXLRCZhdQgEGtFhayKjD92N8a15OnuxthPqnto8n1qBSsT4bcajoeujl7aDtGhxnYOl4+db5lHKRRZlJRrgxaffI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(136003)(39860400002)(396003)(230922051799003)(186009)(1800799012)(64100799003)(82310400011)(451199024)(40470700004)(46966006)(36840700001)(53546011)(40480700001)(82740400003)(26005)(47076005)(356005)(81166007)(8676002)(110136005)(316002)(70206006)(70586007)(16576012)(54906003)(4326008)(36860700001)(31686004)(336012)(426003)(2616005)(83380400001)(478600001)(8936002)(44832011)(86362001)(31696002)(7416002)(2906002)(5660300002)(41300700001)(36756003)(40460700003)(41533002)(21314003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 13:03:27.9792
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a66a6895-2e86-4d5f-ce81-08dbecedc045
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB50.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4461

Hi,

On 17/11/2023 13:24, Oleksii Kurochko wrote:
> 
> 
> <asm/numa.h> is common through some archs so it is moved
> to asm-generic.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V3:
>  - Remove old header inclusion in asm-generic numa.h and include
>    <xen/mm-frame.h> and <xen/stdint.h>
>  - Drop Arm and PPC's numa.h and use asm-generic version instead.
> ---
> Changes in V2:
>         - update the commit message.
>         - change u8 to uint8_t.
>         - add ifnded CONFIG_NUMA.
> ---
>  xen/arch/arm/include/asm/Makefile             |  1 +
>  xen/arch/ppc/include/asm/Makefile             |  1 +
>  xen/arch/ppc/include/asm/numa.h               | 26 -------------------
>  .../asm => include/asm-generic}/numa.h        | 13 ++++++----
>  4 files changed, 10 insertions(+), 31 deletions(-)
>  delete mode 100644 xen/arch/ppc/include/asm/numa.h
>  rename xen/{arch/arm/include/asm => include/asm-generic}/numa.h (75%)
> 
> diff --git a/xen/arch/arm/include/asm/Makefile b/xen/arch/arm/include/asm/Makefile
> index 8221429c2c..0c855a798a 100644
> --- a/xen/arch/arm/include/asm/Makefile
> +++ b/xen/arch/arm/include/asm/Makefile
> @@ -2,6 +2,7 @@
>  generic-y += altp2m.h
>  generic-y += hardirq.h
>  generic-y += iocap.h
> +generic-y += numa.h
>  generic-y += paging.h
>  generic-y += percpu.h
>  generic-y += random.h
> diff --git a/xen/arch/ppc/include/asm/Makefile b/xen/arch/ppc/include/asm/Makefile
> index 9bbae4cec8..d5a94bc718 100644
> --- a/xen/arch/ppc/include/asm/Makefile
> +++ b/xen/arch/ppc/include/asm/Makefile
> @@ -5,6 +5,7 @@ generic-y += hardirq.h
>  generic-y += hypercall.h
>  generic-y += iocap.h
>  generic-y += monitor.h
> +generic-y += numa.h
>  generic-y += paging.h
>  generic-y += percpu.h
>  generic-y += random.h
> diff --git a/xen/arch/ppc/include/asm/numa.h b/xen/arch/ppc/include/asm/numa.h
> deleted file mode 100644
> index 7fdf66c3da..0000000000
> --- a/xen/arch/ppc/include/asm/numa.h
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -#ifndef __ASM_PPC_NUMA_H__
> -#define __ASM_PPC_NUMA_H__
> -
> -#include <xen/types.h>
> -#include <xen/mm.h>
> -
> -typedef uint8_t nodeid_t;
> -
> -/* Fake one node for now. See also node_online_map. */
> -#define cpu_to_node(cpu) 0
> -#define node_to_cpumask(node)   (cpu_online_map)
> -
> -/*
> - * TODO: make first_valid_mfn static when NUMA is supported on PPC, this
> - * is required because the dummy helpers are using it.
> - */
> -extern mfn_t first_valid_mfn;
> -
> -/* XXX: implement NUMA support */
> -#define node_spanned_pages(nid) (max_page - mfn_x(first_valid_mfn))
> -#define node_start_pfn(nid) (mfn_x(first_valid_mfn))
> -#define __node_distance(a, b) (20)
> -
> -#define arch_want_default_dmazone() (false)
> -
> -#endif /* __ASM_PPC_NUMA_H__ */
> diff --git a/xen/arch/arm/include/asm/numa.h b/xen/include/asm-generic/numa.h
> similarity index 75%
> rename from xen/arch/arm/include/asm/numa.h
> rename to xen/include/asm-generic/numa.h
> index e2bee2bd82..c5b522dee8 100644
> --- a/xen/arch/arm/include/asm/numa.h
> +++ b/xen/include/asm-generic/numa.h
> @@ -1,9 +1,11 @@
> -#ifndef __ARCH_ARM_NUMA_H
> -#define __ARCH_ARM_NUMA_H
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ARCH_GENERIC_NUMA_H
> +#define __ARCH_GENERIC_NUMA_H
ASM_GENERIC ?

> 
> -#include <xen/mm.h>
> +#include <xen/mm-frame.h>
If this is for mfn_t, shouldn't this inclusion be moved under #ifndef ?

Apart from that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

