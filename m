Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA896160C8
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 11:27:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435771.689526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqAwt-0007SA-8T; Wed, 02 Nov 2022 10:26:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435771.689526; Wed, 02 Nov 2022 10:26:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqAwt-0007Pe-5U; Wed, 02 Nov 2022 10:26:19 +0000
Received: by outflank-mailman (input) for mailman id 435771;
 Wed, 02 Nov 2022 10:26:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cd3U=3C=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oqAwr-0007PY-Sl
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 10:26:18 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2080.outbound.protection.outlook.com [40.107.102.80])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c76639c2-5a98-11ed-91b5-6bf2151ebd3b;
 Wed, 02 Nov 2022 11:26:15 +0100 (CET)
Received: from DM6PR08CA0044.namprd08.prod.outlook.com (2603:10b6:5:1e0::18)
 by MN0PR12MB6295.namprd12.prod.outlook.com (2603:10b6:208:3c0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Wed, 2 Nov
 2022 10:26:12 +0000
Received: from DM6NAM11FT111.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1e0:cafe::57) by DM6PR08CA0044.outlook.office365.com
 (2603:10b6:5:1e0::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20 via Frontend
 Transport; Wed, 2 Nov 2022 10:26:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT111.mail.protection.outlook.com (10.13.173.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5791.20 via Frontend Transport; Wed, 2 Nov 2022 10:26:12 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 2 Nov
 2022 05:26:11 -0500
Received: from [10.71.192.110] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Wed, 2 Nov 2022 05:26:09 -0500
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
X-Inumbo-ID: c76639c2-5a98-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VWrdhQKafJIJiQbM1+/U5K65cR6uwSWMP4EVe8+N3cXZbmZ2LDbdMEteWgFbqaupYz0+JZlpNiq2IC0GtNVkm3k39LbIjHbvXjuVzvqIAYBJUYFJL0jkp60bMHxu0kNyW8zLdU/BM75zeYB65eVvM8m04dli7IaTL2kTJQATbgIzqdaMXEpvzftDfYjG+Zywal0O4HFtiQYyJ3n8nz9OWXN5/CPPeKQt5bbuQgxiLEnsiJdVtOZ6BdwTuKIejO28gyxrCqB/mJkw1ERs4tnZJLRtL2nbBZorAp+ka0xgDaO6aNA86l5KvGxT05Yi78frmoOyjPb0QWKV8MnPNKg+lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jBbRSb269aG1kYLOZeTi/FdLlssi7ojyFLAGVh5a67A=;
 b=i8C+4RFM/GKMjT4vS2lh+kYy3DGi5k08jKl0BQmIEq0SNDoP63UEN0AsJ0u6wystQ6vmLvmYnkf41yPh94ejFHVgnt9enlE2ru8YGz4UfSLYRSRUpfoliB90i862oOr/apZv/wg/0j50UpcKyuwWU8/w0KY2PhNQPBWqEc3I6ATH4TloS2l3dqtyh2cMMnZi9zXMyWwbhzPpv6LzrJLu5aw7o7J47uDNKYSd+xfT9cAEdb4wffCtae3AxPk8e/UnpxQxSnGcsjYXo3+D9Ni81xXzokeoExq9BQtcoPzjLu6g9VZ2wUlHZZTY4tbsiZ1Fa9G0F/Usy7Bfhb4i+4HUVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jBbRSb269aG1kYLOZeTi/FdLlssi7ojyFLAGVh5a67A=;
 b=n9DLPJxaEVR/bn76ztHoR5fBu2V8DfUti6lUYcyy6Zi9+pPGRMdWd3CYGFBaJ9LGg6okDfGVFDJ6NujIIfEcyV7s1iiAc7Z6gE2h/yAkG3EM+uGgUB9gEDyAYZOAMrspWAVTbOQJ8bjAlNSdrAblnCKARjUpE7X1YR9oDI8Ic5A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <b3fab6e0-0f95-049a-7d7c-7b896a80489f@amd.com>
Date: Wed, 2 Nov 2022 11:26:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [XEN v2 05/12] xen/Arm: GICv3: Fix GICR_{PENDBASER, PROPBASER}
 emulation on 32-bit host
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<burzalodowa@gmail.com>
References: <20221031151326.22634-1-ayankuma@amd.com>
 <20221031151326.22634-6-ayankuma@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20221031151326.22634-6-ayankuma@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT111:EE_|MN0PR12MB6295:EE_
X-MS-Office365-Filtering-Correlation-Id: af8bfe0f-7527-4567-64ce-08dabcbcaa44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5ZdhBlTsRi/CkmM6rjPFAT/cUeNKQII6OQDtI35SEnjFt/zDlWERlHcgNA5VPgRyZuFkJxFUU2XWaTwh/P+YOC7EBYk+R3o+K6JytT7umjAooL0/6096FVeo8/MjOIsQnnqMFrWrvRYFUgYL7PXrT/Vamx+QPyOHHw6bTbWYaj7GwrtrnfRkM3QRyH78raTu408wFCR8C9pZ1LuqIrWaio06SMXLk0lRCmY5qxdA2sttZ96JgTEL0277bt1WqB+/eiyaTeeo0asjRTBlkiV7I5yCQGr4CwYuZEDrka+7YaXo3PSIJtCWIxJ1wba/uhiHlNpcGQU7BE8ORNsaNthnXc8Al2dMz3lX32/28iYD5mwWJe4tlG5U23/nNfpLjIsylUrehxKQ+5gIoyjurcWKPsg5JSl/H/rF/cPovOXiCU4bQbafHaBy99OC9EJcr6i+w6I5TagobjjFmy2eAZ6XEpvX+1ynmSfzvV0ldBeK40/WatLouggB2JT+S27JWwN9jNNTkEbsZZjzoefo6uO+DUrLcxwQL31z7QxTRh+oQioGLqX+YJ70J9q27923pD/ucC2mOGztAKh+2voOrSMYDW2aFRto++TF7+e3cxccXa7jaUdwavJ3beNHF4Zy8PTnsG1zr4l6ANkGtzxGjLoZAS9ty7QWLCKN7AqDIBPFjR9U4dwaXQERdPtuiDWdkgLKqKxTggdfC0UCflL2wesdtJet+F4v3QieJSFearm8omaFxFnQbmq6FCcbPlhYGDkIARFiCE+VYQuywpNH/5AkDvO3c6PC2JVsGrbBeaTaeY3QldbTYYk5BjJruLDLxWoTS+hj4I+GbeWbqvSvcniDw/+sUYULQo8h8Iovzdvop20RhhC5ovkkAuPBF2qK/icf
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(396003)(39860400002)(346002)(451199015)(36840700001)(40470700004)(46966006)(82310400005)(26005)(8676002)(70206006)(36756003)(53546011)(54906003)(110136005)(70586007)(36860700001)(2906002)(40480700001)(336012)(316002)(47076005)(426003)(5660300002)(31696002)(86362001)(41300700001)(40460700003)(83380400001)(2616005)(44832011)(8936002)(4326008)(966005)(31686004)(478600001)(186003)(356005)(82740400003)(16576012)(81166007)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2022 10:26:12.2204
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af8bfe0f-7527-4567-64ce-08dabcbcaa44
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT111.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6295

Hi Ayan,

On 31/10/2022 16:13, Ayan Kumar Halder wrote:
> 
> 
> 'unsigned long long' is defined as 64 bit across both aarch32 and aarch64.
> So, use 'ULL' for 64 bit word instead of UL which is 32 bits for aarch32.
> GICR_PENDBASER and GICR_PROPBASER both are 64 bit registers.
> 
> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
> ---
> 
> Changes from -
> v1 - 1. Extract the bug fix for incorrect bit clearing (GICR_PENDBASER_PTZ)
> into a separate patch fix.
> https://patchwork.kernel.org/project/xen-devel/patch/20221027185555.46125-1-ayankuma@amd.com/
> 
>  xen/arch/arm/include/asm/gic_v3_defs.h | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/asm/gic_v3_defs.h
> index 728e28d5e5..48a1bc401e 100644
> --- a/xen/arch/arm/include/asm/gic_v3_defs.h
> +++ b/xen/arch/arm/include/asm/gic_v3_defs.h
> @@ -134,15 +134,15 @@
> 
>  #define GICR_PROPBASER_OUTER_CACHEABILITY_SHIFT         56
>  #define GICR_PROPBASER_OUTER_CACHEABILITY_MASK               \
> -        (7UL << GICR_PROPBASER_OUTER_CACHEABILITY_SHIFT)
> +        (7ULL << GICR_PROPBASER_OUTER_CACHEABILITY_SHIFT)
>  #define GICR_PROPBASER_SHAREABILITY_SHIFT               10
>  #define GICR_PROPBASER_SHAREABILITY_MASK                     \
> -        (3UL << GICR_PROPBASER_SHAREABILITY_SHIFT)
> +        (3ULL << GICR_PROPBASER_SHAREABILITY_SHIFT)
>  #define GICR_PROPBASER_INNER_CACHEABILITY_SHIFT         7
>  #define GICR_PROPBASER_INNER_CACHEABILITY_MASK               \
> -        (7UL << GICR_PROPBASER_INNER_CACHEABILITY_SHIFT)
> +        (7ULL << GICR_PROPBASER_INNER_CACHEABILITY_SHIFT)
>  #define GICR_PROPBASER_RES0_MASK                             \
> -        (GENMASK(63, 59) | GENMASK(55, 52) | GENMASK(6, 5))
> +        (GENMASK_ULL(63, 59) | GENMASK_ULL(55, 52) | GENMASK_ULL(6, 5))
> 
>  #define GICR_PENDBASER_SHAREABILITY_SHIFT               10
>  #define GICR_PENDBASER_INNER_CACHEABILITY_SHIFT         7
> @@ -152,11 +152,11 @@
>  #define GICR_PENDBASER_INNER_CACHEABILITY_MASK               \
>         (7UL << GICR_PENDBASER_INNER_CACHEABILITY_SHIFT)
>  #define GICR_PENDBASER_OUTER_CACHEABILITY_MASK               \
> -        (7UL << GICR_PENDBASER_OUTER_CACHEABILITY_SHIFT)
> -#define GICR_PENDBASER_PTZ                              BIT(62, UL)
> +        (7ULL << GICR_PENDBASER_OUTER_CACHEABILITY_SHIFT)
> +#define GICR_PENDBASER_PTZ                              BIT(62, ULL)
>  #define GICR_PENDBASER_RES0_MASK                             \
> -        (BIT(63, UL) | GENMASK(61, 59) | GENMASK(55, 52) |  \
> -         GENMASK(15, 12) | GENMASK(6, 0))
> +        (BIT(63, ULL) | GENMASK_ULL(61, 59) | GENMASK_ULL(55, 52) |  \
It would be good to align \ but at the same time I can understand that it was not
aligned before your change and you may not want to do this, so:

Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

