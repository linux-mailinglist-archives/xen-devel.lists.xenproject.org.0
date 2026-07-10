Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GUOKH9oLUWpC+gIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 17:12:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C93B873C1D6
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 17:12:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=yjsE0NnO;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1359533.1613068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiCti-00020j-2u; Fri, 10 Jul 2026 15:12:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1359533.1613068; Fri, 10 Jul 2026 15:12:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiCti-0001yB-0B; Fri, 10 Jul 2026 15:12:14 +0000
Received: by outflank-mailman (input) for mailman id 1359533;
 Fri, 10 Jul 2026 15:12:11 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ayan.kumar.halder@amd.com>) id 1wiCtf-0001y5-Px
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 15:12:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wiCtf-0012C6-6u
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 17:12:11 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6a510ba3-5cb7-0a2a0a5109dd-0a2a450ab842-24
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 17:12:10 +0200
Received: from [40.107.200.37]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6a510bc9-ec7d-0a2a450a0019-286bc8259a9f-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 17:12:10 +0200
Received: from SJ0PR03CA0246.namprd03.prod.outlook.com (2603:10b6:a03:3a0::11)
 by MW3PR12MB4473.namprd12.prod.outlook.com (2603:10b6:303:56::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.14; Fri, 10 Jul
 2026 15:12:04 +0000
Received: from SJ1PEPF00002310.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::2d) by SJ0PR03CA0246.outlook.office365.com
 (2603:10b6:a03:3a0::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.14 via Frontend Transport; Fri,
 10 Jul 2026 15:12:04 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00002310.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 15:12:04 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 10 Jul
 2026 10:12:03 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 10 Jul
 2026 10:12:03 -0500
Received: from [10.71.198.170] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 10 Jul 2026 10:12:01 -0500
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KQgoN0yXfYZUxi/bB1dPBiMPq7cHJKVfV7snDvs25rY3utp7jJIMIs9772jb3shTo8N1ijPRGcGTZ6/PyC+izRmxcdqh4KDmgrZJfl31SMtYBJ5MQxHGdTnKA0QEH1oDo6Tx/77rVRTkm2XE1zbaoOIwiL5FpBSUzYaO7qOx9iB0x935LE3Xl+H4vI2njHAjOBuNIBUbNhr3PdADcRXSIkwZJBW2reOzCPMsPjhup7I8lrdLeRyOU1m5hYw7ZijupEioltlqiyXKO4Xkv6kvs8X4SrWWOeSbj4AoZZ/YxfKYqqyEaFKCDv/mvMNEBsQBQ8OUSCbNNEs9snDnquhANA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cdT2BxK3wpnwb08T2pxSEO8seT4xo5R6LNR6iy+WDnU=;
 b=rosjpeOy0RBfoRdZescx1y+UXW8TrDhgiqw6xOqaUjR7c93+eOj/Z+kfSFErw2NgySn3CquQyBRnaPhSiUUyW6e8HyndkeQZO4CrdS+AhzFZZa1b7T2DVgifn8tz01y4AFOnJU2yOnJ/Ndc/m7jNnn5mwW89nbwA0jxRfnGpxiW8Tn1gWwgHrbkcslk9DDSiPXIXl5XLeX00l8FiaqbHNIlXjukC+XfVk522tCWBqQK0KthBTpup6LhO9blPJOhbugL9dLFRXdGrECZBF1Q4/qILkHjHORrwpFtjylFaSs4lEw+GmWzpqZcpYL2XmxA1+ZQLzSJbxsG1752noSmREQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cdT2BxK3wpnwb08T2pxSEO8seT4xo5R6LNR6iy+WDnU=;
 b=yjsE0NnOa9EyV53cd/DUolGa/H4maB5ZKjLcbGNGGY57s1ZvcwAauMHm7K4Z819f9BsrECwX/iZyh11uOWC1SSLI8FV2NRnYT/cG0qJV5R0VU9rjuCtfLDJ6IUw+Bc4dowAy59EClxf8d5KCYNsADFWM2xAguyATbXnwRUCOOfw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <702eb2ba-e02f-4f95-9a1b-01ed75d00f50@amd.com>
Date: Fri, 10 Jul 2026 16:11:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] arm/mpu: Support vCPU context switch on MPU systems
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Penny Zheng <Penny.Zheng@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>, "Hari
 Limaye" <hari.limaye@arm.com>, Harry Ramsey <harry.ramsey@arm.com>
References: <20260420142524.1804073-1-luca.fancellu@arm.com>
 <20260420142524.1804073-5-luca.fancellu@arm.com>
Content-Language: en-US
From: "Halder, Ayan Kumar" <ayankuma@amd.com>
In-Reply-To: <20260420142524.1804073-5-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002310:EE_|MW3PR12MB4473:EE_
X-MS-Office365-Filtering-Correlation-Id: bc1b0c7e-1fac-4a2c-1682-08dede9599c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|376014|7416014|36860700016|56012099006|11063799006|4143699003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	5Jcc91B5gWU8jnITyNIlEa48gndHONcrUDVIJ0n2FkT7jPgBgyAZ6t3LljVsivSqK74kK3PRAdNXqi714dG6h3cc/6geWdKgaZ5z6gjsG5qPGKyL6WQrQsRj6ajttuPsOoOXWO7Kg4lzrqNeHqOJV24L79eEIUb2aaXcWjrwjcJS1FbKchnqOfJ0Uav/W4XV3Sq+2vULZLtaaXPYbYLX/VmPKNkPTo318QHT8aKOTSLdrSelYDqsnOqZkbdyqyxsRYRMLkt/Tv+7+2+YnugF8fB3ydAAizgYVF85WrnJ8DUwPByqyzLmm/Tgnj8rtqjlooGmkZadQDAtGY3TNG1gMyD6o7jA/GuLhTb9qSyjhcZcrmcQX+kHmW93d9URrUbMiQ2LM0mHoiSvvTf4VYPWC4Zws5Ar+P1H0fEcjIDq5dB+nhNlbX3nKqW6NQm5iHHRGS+8var9ZS/e3612fCr4uCePl3vF7vANbsNsrxgho6mXT1UoIJBhWnoF4O91P7gJAIMn7Cm72jl8Jz1SWZtzLAchOZJ8wMqO6nRHBmsLSWW7TOX0QWGEc7kTL1sZS1w/hfSIk71Z4wkZqP8gG7i2ThhCHHymxwWhmE4sg4PyTiZDuR5AI6cGzYycOmURKQOwxJyMFe8uoNsZJrZ+SsSkR6P5QVdUuM68YEr7uLEx5NmBDZ0iRuYLiqmN4DuFh+UOVihoROc7bpBoQIjZJ1VjAg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(376014)(7416014)(36860700016)(56012099006)(11063799006)(4143699003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PMPOhQl7gFZpaqJrEbIAPJn/j7y+3/ReypOKws9AWZ+30MmTjTco7axS90GM6F0EbABAN40HqRbmiNYnsf7PUUxbOPKJqLaa9Qp7XZL+NzEbeHRnsLSyzYfbcwOS1ypiknaFeTLs11tyxsFJMku9dCv/ZBSG/Gu3K8bIHgnEEZAyaRr6imo9aV2dS8RHcjSGInn6ejDGavgdAoSsAFL9S8Cb2RzvhGFXOCuMmeK/BSoKNJ7HDQMaVXMt0K+Ge4/6zjwgLmV7FGgOK0w7XenH89hQs+7ui8G8RKy/OspVxYM5TlzKLlSqkg4piyoglcJB677pUrNk4tfRsnE/xbj8AG+x5Xt4CmvbUsR/3skcy18VUGE9rY4CR2sadpL9s2mxt8YoJn+E1U4s2uggRP6F7zd7wO9cyZutA3KB/WmJUYFajM2Ehn4Y+dg57zSfEB/S
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 15:12:04.3288
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc1b0c7e-1fac-4a2c-1682-08dede9599c6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002310.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4473
X-purgate-ID: tlsNG-4011c0/1783696330-3D576248-B5F7EE2D/0/0
X-purgate-type: clean
X-purgate-size: 5154
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:luca.fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:Penny.Zheng@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:wei.chen@arm.com,m:hari.limaye@arm.com,m:harry.ramsey@arm.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[ayankuma@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ayankuma@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,amd.com:from_mime,amd.com:dkim,amd.com:mid,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C93B873C1D6

Hi Luca,

On 20/04/2026 15:25, Luca Fancellu wrote:
> From: Penny Zheng <Penny.Zheng@arm.com>
>
> Implement the functions p2m_save_state and p2m_restore_state for MPU
> systems. Unlike on MMU systems, where we simply update VTTBR_EL2 with
> the incoming guest's p2m table on context switch, we have to disable the
> outgoing guest's p2m memory regions and enable the incoming guest's p2m
> memory regions.
>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Hari Limaye <hari.limaye@arm.com>
> Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
> ---
>   xen/arch/arm/include/asm/mpu/cpregs.h |  4 +++
>   xen/arch/arm/mpu/mm.c                 | 11 +++++--
>   xen/arch/arm/mpu/p2m.c                | 47 +++++++++++++++++++++++++--
>   3 files changed, 57 insertions(+), 5 deletions(-)
>
> diff --git a/xen/arch/arm/include/asm/mpu/cpregs.h b/xen/arch/arm/include/asm/mpu/cpregs.h
> index 9f3b32acd79f..5a3d92cf5389 100644
> --- a/xen/arch/arm/include/asm/mpu/cpregs.h
> +++ b/xen/arch/arm/include/asm/mpu/cpregs.h
> @@ -6,6 +6,9 @@
>   /* CP15 CR0: MPU Type Register */
>   #define HMPUIR          p15,4,c0,c0,4
>   
> +/* CP15 CR2: Virtualization System Control register */
> +#define VSCTLR          p15,4,c2,c0,1
> +
>   /* CP15 CR6: Protection Region Enable Register */
>   #define HPRENR          p15,4,c6,c1,1
>   
> @@ -88,6 +91,7 @@
>   #define PRENR_EL2       HPRENR
>   #define PRLAR_EL2       HPRLAR
>   #define PRSELR_EL2      HPRSELR
> +#define VSCTLR_EL2      VSCTLR
>   #endif /* CONFIG_ARM_32 */
>   
>   #endif /* __ARM_MPU_CPREGS_H */
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index 4ee58ded5ad6..5ed77355a5f9 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -421,9 +421,14 @@ static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
>       return 0;
>   }
>   
> -int check_mpu_mapping(paddr_t base, paddr_t limit, unsigned int flags)
> +static bool check_mpu_mapping(paddr_t base, paddr_t limit, unsigned int flags,
> +                              bool p2m)
The static bool conversion belongs in patch 1 where the function is
introduced; only the new p2m parameter is in scope
for this patch.
>   {
> -    if ( flags_has_rwx(flags) )
> +    /*
> +     * Mappings should not be both Writeable and Executable, unless
> +     * it is for guest P2M mapping.
> +     */
> +    if ( flags_has_rwx(flags) && !p2m )
>       {
>           printk("Mappings should not be both Writeable and Executable\n");
>           return false;
> @@ -450,7 +455,7 @@ int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned int flags, bool p2m)
>   {
>       int rc;
>   
> -    if ( !check_mpu_mapping(base, limit, flags) )
> +    if ( !check_mpu_mapping(base, limit, flags, p2m) )
>           return -EINVAL;
>   
>       spin_lock(&xen_mpumap_lock);
> diff --git a/xen/arch/arm/mpu/p2m.c b/xen/arch/arm/mpu/p2m.c
> index f2482237412b..bf87c65c106c 100644
> --- a/xen/arch/arm/mpu/p2m.c
> +++ b/xen/arch/arm/mpu/p2m.c
> @@ -285,14 +285,57 @@ int p2m_init(struct domain *d)
>       return 0;
>   }
>   
> +static int p2m_xenmpu_update(struct p2m_domain *p2m, bool online)
> +{
> +    pr_t *p2m_table;
> +    unsigned int flags = online ? _PAGE_PRESENT : 0;
> +
> +    p2m_table = (pr_t *)page_to_virt(p2m->root);
> +    if ( !p2m_table )
> +        return -EINVAL;
> +
> +    for ( unsigned int i = 0; i < p2m->nr_regions; i++ )
> +    {
> +        paddr_t base = pr_get_base(&p2m_table[i]);
> +        paddr_t limit = pr_get_limit(&p2m_table[i]) + 1;
> +        unsigned int region_flags;
> +
> +        region_flags = build_p2m_flags(region_get_p2m(&p2m_table[i])) | flags;
> +        if ( xen_mpumap_update(base, limit, region_flags, true) )
> +        {
> +            printk(XENLOG_G_ERR "Unable to update MPU memory mapping with P2M region %#"PRIpaddr"-%#"PRIpaddr"\n",
> +                   base, limit);
> +            return -EINVAL;
> +        }
> +    }
> +
> +    return 0;
> +}
> +
> +/* p2m_save_state and p2m_restore_state work in pair. */
>   void p2m_save_state(struct vcpu *p)
>   {
> -    BUG_ON("unimplemented");
> +    struct p2m_domain *p2m = p2m_get_hostp2m(p->domain);
> +
> +    p->arch.sctlr = READ_SYSREG(SCTLR_EL1);
> +
> +    if ( p2m_xenmpu_update(p2m, false) )
> +        panic("Failed to offline P2M MPU memory mapping\n");
>   }
>   
>   void p2m_restore_state(struct vcpu *n)
>   {
> -    BUG_ON("unimplemented");
> +    struct p2m_domain *p2m = p2m_get_hostp2m(n->domain);
> +    uint8_t *last_vcpu_ran = &p2m->last_vcpu_ran[smp_processor_id()];
> +
> +    WRITE_SYSREG(n->arch.sctlr, SCTLR_EL1);
> +    WRITE_SYSREG(n->arch.hcr_el2, HCR_EL2);
> +
> +    WRITE_SYSREG(p2m->vsctlr, VSCTLR_EL2);
> +    if ( p2m_xenmpu_update(p2m, true) )
> +        panic("Failed to online P2M MPU memory mapping\n");
> +
> +    *last_vcpu_ran = n->vcpu_id;
>   }
>   
>   void p2m_final_teardown(struct domain *d)
- Ayan

