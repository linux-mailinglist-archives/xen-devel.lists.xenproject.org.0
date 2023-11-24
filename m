Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1400E7F7475
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 14:01:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640673.999233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6VnT-0007aq-EL; Fri, 24 Nov 2023 13:00:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640673.999233; Fri, 24 Nov 2023 13:00:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6VnT-0007YO-BV; Fri, 24 Nov 2023 13:00:39 +0000
Received: by outflank-mailman (input) for mailman id 640673;
 Fri, 24 Nov 2023 13:00:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u6gD=HF=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1r6VnR-0007YI-QW
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 13:00:37 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061a.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74d9ab33-8ac9-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 14:00:36 +0100 (CET)
Received: from SN7PR04CA0172.namprd04.prod.outlook.com (2603:10b6:806:125::27)
 by CH3PR12MB9431.namprd12.prod.outlook.com (2603:10b6:610:1c1::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20; Fri, 24 Nov
 2023 13:00:32 +0000
Received: from SN1PEPF000252A4.namprd05.prod.outlook.com
 (2603:10b6:806:125:cafe::a8) by SN7PR04CA0172.outlook.office365.com
 (2603:10b6:806:125::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20 via Frontend
 Transport; Fri, 24 Nov 2023 13:00:32 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A4.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Fri, 24 Nov 2023 13:00:31 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 24 Nov
 2023 07:00:31 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Fri, 24 Nov 2023 07:00:29 -0600
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
X-Inumbo-ID: 74d9ab33-8ac9-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dmD1/Fc5aZ1LULXO3t6niazlgkgWU4q++KQzDauPUMJBZqmrOB+oIcGlc7TNZUG3axz9kJwWsX++dsTcvtZBE6qKLFy8wLI5lTyJxSI57w4/UrzCWr964Q4CRmbrl5oF7jACX5ehN/49706yfPhCXJnTX9NPtfPQmQ6u6FhDYQigpCEoD6F1OZ1vgTqENu5wG1sJ0E/Xl2OGzoZopvhlSV2Vot6+2FQqn9xQSjGAdEngNOnzgcR+6YiVUEcxsWbWEcuoWGKWyh3R7C7WbF+wK8U1xGErVWPrOmML63N9wQAlqfhfw3mTU6Yjrs4/1ijAXdxHq0zKQ+LGuWC0nYGQ3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i7SFUSNGiUIjnozlsTsX9Le9wc3ZYVthP5VFGjMhrPY=;
 b=ZjhfiXdgLbLZlF+yNeSwAF0pE50WDnWfCz01biUPvmPJmn/7jOoHfUcCbeu20Jg38j01DDdmoML9MYS/Z77eo8A4hzyZr1RSnXb/Ep/qSTjF9MZzaQj07viM40sEq0AWczjiDCwncvVpzuUNYWiW3pBojmrTIY3J7LUrFYQt3ctpbFQOKLmMq15PdlSfyeou66Qkgfc5hosIX9RNl9NsXRjkLdm2aRg7d7L9jynHACHZuI3slX/pOWvJbDEs+OqyTR9d9rd0Uaqf3q4dMfezmVFXXrG6fujzyeL9gullHyt5rjHVfhtl2/b0UrlHyYx5q11sXJst5DUSJRtmhrdMYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i7SFUSNGiUIjnozlsTsX9Le9wc3ZYVthP5VFGjMhrPY=;
 b=2McaqmEvTtv9P7eAsnhVys6xhZGNqqguh/6RINjl3ZesmeUdSvXdzqhAc9vfHM1pWMkX6aXpafxLhzm1U2P5SAGd1kFo8QezpRTKocZ0WpJI/7YUtwAyiXrXjA73wAqd5DI07Slq+/dE+Yogh2Il6j/ABxVeTkA8MAyrTk/3tr0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <5a1b98cc-cbda-4355-87db-9aea12d21d73@amd.com>
Date: Fri, 24 Nov 2023 14:00:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/14] xen/asm-generic: introduce generic header
 altp2m.h
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
 <efb6b1864de36d9990a2d2a84308f4bdebebb66a.1700221559.git.oleksii.kurochko@gmail.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <efb6b1864de36d9990a2d2a84308f4bdebebb66a.1700221559.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A4:EE_|CH3PR12MB9431:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b3cb597-09af-4502-5216-08dbeced5763
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yAhBvqac1aXNIveh+HFCJ6dh0PfKzKWqbsBk5lOEmSp2Vcx8ClTpGmM8jHhwg0iSFwUasaVE/Vg85fgJjk0Ozq8Y/V5W9dRSxCooMrtEC8y2PczQGbUgELAIyNeFAS2xaX6yAVeKxxGgB9FREs29iQie6YyMhEMEm0z9rp7sC/ou5bVjAjA5spDkHBTJZif9t/y/QT7tHL5z2hWhqFM1GGsyDS3izZN8ICZw1gt/WNl6cjpiUl50U5H1T9d9dnE5PQlMj+hF2E/4FMGAHot3YVUAnRvEhyhyEvkZsVANhqK57YSqGxl6pmxDPRCehWk+TnOwR9+cSMSWKKQM3pAPOJlFk5FNbXdbaxd/DXVQu8BjjFZWoGo6y26M3H5RUI/tSKfGt4OzfyPefDGP6LP12lsKrCc0izkHOPsZLLOvSJ+gtMujdtiwv2dKcY/rAbV9LokRANivlNpTiP1L3sLGDIs5TJxf86hXKNq2y0B2ughfCyOO/Bt6YduQZm+a56FdvyjSMGt1I1fLiSeNDakjOiV1fNIYYtprOgCXASGRw4Eeq+UA27IQiQZVapIyeJXgFPTWp5ws4L5js+an0oH0Flj1eNdDxjpXTx76x5eUBh+568PyiHkQlOs+rd09OS3Nv4H7ltRELhNOzmIM1K1K+Z81rU35AeHAUKzYpvjnmX9lCw/A4b6v8vxqY6EVqvZKnkHtgkn4+/YoLG79BJdMxsLXbrjKekAJXYZIoWxqHwpDhP7g644RHxghU2NIn1rLgqsBnanVT4EKif49oDUPWUCeM8JarRBA1HBrz0Jn5b0etBclnmfQy7x6rFMYlTAz
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(346002)(376002)(396003)(230922051799003)(451199024)(1800799012)(64100799003)(82310400011)(186009)(36840700001)(46966006)(40470700004)(7416002)(31686004)(2906002)(44832011)(41300700001)(8936002)(8676002)(4326008)(40480700001)(5660300002)(316002)(70586007)(70206006)(54906003)(16576012)(110136005)(40460700003)(47076005)(86362001)(2616005)(478600001)(36756003)(53546011)(336012)(426003)(26005)(36860700001)(356005)(83380400001)(81166007)(82740400003)(31696002)(41533002)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 13:00:31.9963
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b3cb597-09af-4502-5216-08dbeced5763
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9431

Hi,

On 17/11/2023 13:24, Oleksii Kurochko wrote:
> 
> 
> <asm/alt2pm.h> is common between archs so it is moved to
> asm-generic.
> 
> Arm and PPC were switched to asm-generic version of altp2m.h.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V3:
>  - Drop Arm and PPC's altp2m.h
>  - Update the commit message.
> ---
> Changes in V2:
>         - change uint16_t to unsigned int in declaration of altp2m_vcpu_idx
>         - update the commit message
> ---
>  xen/arch/arm/include/asm/Makefile |  1 +
>  xen/arch/arm/include/asm/altp2m.h | 39 -------------------------------
>  xen/arch/ppc/include/asm/Makefile |  1 +
>  xen/arch/ppc/include/asm/altp2m.h | 25 --------------------
>  xen/include/asm-generic/altp2m.h  | 34 +++++++++++++++++++++++++++
>  5 files changed, 36 insertions(+), 64 deletions(-)
>  delete mode 100644 xen/arch/arm/include/asm/altp2m.h
>  delete mode 100644 xen/arch/ppc/include/asm/altp2m.h
>  create mode 100644 xen/include/asm-generic/altp2m.h
> 
> diff --git a/xen/arch/arm/include/asm/Makefile b/xen/arch/arm/include/asm/Makefile
> index 36d95d6310..8221429c2c 100644
> --- a/xen/arch/arm/include/asm/Makefile
> +++ b/xen/arch/arm/include/asm/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> +generic-y += altp2m.h
>  generic-y += hardirq.h
>  generic-y += iocap.h
>  generic-y += paging.h
> diff --git a/xen/arch/arm/include/asm/altp2m.h b/xen/arch/arm/include/asm/altp2m.h
> deleted file mode 100644
> index df50cb2f09..0000000000
> --- a/xen/arch/arm/include/asm/altp2m.h
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -/*
> - * Alternate p2m
> - *
> - * Copyright (c) 2014, Intel Corporation.
Shouldn't this copyright be moved to generic header as well?

Apart from that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

