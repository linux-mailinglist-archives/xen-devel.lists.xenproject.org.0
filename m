Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF798A8331
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 14:32:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707472.1105417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx4S9-00082Z-Hr; Wed, 17 Apr 2024 12:31:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707472.1105417; Wed, 17 Apr 2024 12:31:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx4S9-00080t-FC; Wed, 17 Apr 2024 12:31:53 +0000
Received: by outflank-mailman (input) for mailman id 707472;
 Wed, 17 Apr 2024 12:31:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R6tE=LW=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rx4S8-00080a-1r
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 12:31:52 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2418::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 765434b5-fcb6-11ee-94a3-07e782e9044d;
 Wed, 17 Apr 2024 14:31:50 +0200 (CEST)
Received: from BN6PR17CA0040.namprd17.prod.outlook.com (2603:10b6:405:75::29)
 by SJ2PR12MB7824.namprd12.prod.outlook.com (2603:10b6:a03:4c4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.37; Wed, 17 Apr
 2024 12:31:46 +0000
Received: from BN1PEPF00004684.namprd03.prod.outlook.com
 (2603:10b6:405:75:cafe::ce) by BN6PR17CA0040.outlook.office365.com
 (2603:10b6:405:75::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.26 via Frontend
 Transport; Wed, 17 Apr 2024 12:31:46 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN1PEPF00004684.mail.protection.outlook.com (10.167.243.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Wed, 17 Apr 2024 12:31:36 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 17 Apr
 2024 07:31:20 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 17 Apr
 2024 07:31:20 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 17 Apr 2024 07:31:19 -0500
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
X-Inumbo-ID: 765434b5-fcb6-11ee-94a3-07e782e9044d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZSm+l4DkJ/m7k9Mom85vTJ7hQeL3UWjUULnZa15SbX43u/Be/k5YkQn0naCWk+nk8O0cy8K5k6PPfk4bOzqQOFAToi7QgY8NQwyIIWM3WwjZCwa/H6K9Q1l7TCQm0Fo3qGD4d/we39zxtDYzYxTe3wZ2QkYAZcb9753Oj4t//HfsXnU2TUKwNOEeG0IX0Ad37PmBFCVHRIy2omAuuE1xaDFNCI9yoeFIFX97ohGRTCRJtJC6uVczxeeegzL4YwYj2M9+dONHd4LuFHn6aCAa8eN1qg77szXuHQuC8irXVX4uXpc7yLGsnivns+UmAE5DoK0fIqu4djovZMV+sVV4lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SMDR6xsZMDWzwOSdPUcHxnz4fr/pnydhYWoe70ouwH4=;
 b=bSNiLXIlH4AnaWKUcyRmGEaYiRA/PuMU45hciW9+0r9ogU1YvupbvFvWzSPrUfRF1grvOYyppZ1gvBVOdoOJ4zcQuTeZm9nZw2eH2DBDSvbbvc2XGfSs4jtxgaa6yrcwzBF6hBDZu0gcm65h0vIYJqdOCcET97W6f+TFaIv6mO8ryj0HMgbiXImDXdGwtBGGIshepSc3HN4lQ044/6ytM/U5d6gQU41lZHf99OOT2Vyk4DXkc/x01DCMf++TdTXzyb5dTygy92RxW4eCqoJ646I9xvgxpdsBkSqTEtR6mUL0gkdRDSlWMNbYGJiX0L1Y8qG0Dy1OKTUndFeGLJuwjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMDR6xsZMDWzwOSdPUcHxnz4fr/pnydhYWoe70ouwH4=;
 b=3wZqE+m8PR9b22E78M3FQrEM+B/pfWHNAdf2Mb6+GFoSDd9OYJrcgletJi8flYmwLcvg14jcdopqCoVc61Soy2vIYZw7wfplDqAX9XX+hgvDkc8U05HxWv6ow5cOEoIuFMyoL0hmgj+05gQOjCg0zmPVahIecVX0EOT/s23iRgU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <427481d9-19cf-4fcb-a8bc-0fb73f824b42@amd.com>
Date: Wed, 17 Apr 2024 14:31:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ImageBuilder 4/5] uboot-script-gen: Add ability to unselect
 "vpl011"
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20240417120741.2453431-1-olekstysh@gmail.com>
 <20240417120741.2453431-5-olekstysh@gmail.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240417120741.2453431-5-olekstysh@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004684:EE_|SJ2PR12MB7824:EE_
X-MS-Office365-Filtering-Correlation-Id: a0454454-b7f5-47f1-e9f7-08dc5eda5707
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wletAtvmie8k4sxgwbGfGcMT3uvR4EVfUMTnOag7LPEIFDlqa/e3lVgH+yszjdOAqMzwDKNzTX0JyIhBQJIZZgeDNVhhkPga+cFGycbHj2CpiI4/V1qJ7reEskZKODsxQt3R2PoniVc4sNZsfSJJFQvjHcR3IJ8nickfTh6p7WsfORJM5rGDMEEBRYaNpVdRpfaxqXZNhAu7929S1a24Q/WYvtNZJjjLBDgaMgbczpqn7M5spFLepy7n0MKJpYpQZ8p8Rn7MOHB1IreYPpmG9KGqxGhoiP6RzKGRswGR+VT2UdsOtxGwHHErhJ08kGutKxrOAy/ezkIeq8rQlHZm7tyKvHXWi4uLr38KVh3/Jf7seiMv3KljHblZfc1uN4l4so/VXJsJjLQDUJWmBmcwY0h/YceVnoWn3MrpBkaqYDKt84xo4df4i1wTdfYX7d2Gcz2d1SLSZ1/9aPSQifnpFhm00Th+vBGLe/IxZOLt6E98d6PwZtgjctNP86JEwOK5aHBiRXxOHoTtYEzloNZ/9acWYl/frsRYucClZ6vyleReLSbNCJL2dh0SpapL9OsKZ0ykMr9JDa5Std+baXXU1f1p8Enw5KFc/Fy15pb1ve7aById889l4RM5ZJtQpRkpHJ1zZT6OC/vEbHXJM4uUxdCZbBFL5iAlV+UMhHcHvsg1JPFPRW6f06MZSmLOOdlqrpYXi9kGwVkYxcD6wut7ytsfmYmI/lwUgOiN0oRQDWolfUF9mbOBcJ+VQxdj2nBX
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 12:31:36.7504
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0454454-b7f5-47f1-e9f7-08dc5eda5707
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004684.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7824



On 17/04/2024 14:07, Oleksandr Tyshchenko wrote:
> 
> 
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Introduce new option DOMU_VPL011[nr] that can be set to 0
> or 1 (default).
> 
> Also align "console=ttyAMA0" Linux cmd arg setting with "vpl011" presense.
> 
> Suggested-by: Michal Orzel <michal.orzel@amd.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

That said, I noticed ...

> ---
>  README.md                | 7 ++++++-
>  scripts/uboot-script-gen | 7 +++++--
>  2 files changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/README.md b/README.md
> index b2459fd..63c4708 100644
> --- a/README.md
> +++ b/README.md
> @@ -151,7 +151,8 @@ Where:
>  - DOMU_KERNEL[number] specifies the DomU kernel to use.
> 
>  - DOMU_CMD[number] specifies the command line arguments for DomU's Linux
> -  kernel. If not set, then "console=ttyAMA0" is used.
> +  kernel. If not set and DOMU_VPL011[number] is not set to 0, then
> +  "console=ttyAMA0" is used.
> 
>  - DOMU_RAMDISK[number] specifies the DomU ramdisk to use.
> 
> @@ -232,6 +233,10 @@ Where:
>  - DOMU_MAPTRACK_FRAMES[number] is optional but specifies the maximum number
>    of grant maptrack frames (the default value used by Xen on Arm64 is 1024)
> 
> +- DOMU_VPL011[number] is optional but used to enable (1)/disable (0) a virtual
> +  PL011 UART for domain. The default is 1. If explicitly set to 0, then
> +  "console=ttyAMA0" is not used as a default DOMU_CMD[number].
> +
>  - DOMU_CPUPOOL[number] specifies the id of the cpupool (created using
>    CPUPOOL[number] option, where number == id) that will be assigned to domU.
> 
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index adec6f9..fd37e18 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -344,7 +344,10 @@ function xen_device_tree_editing()
>              add_device_tree_static_mem "/chosen/domU$i" "${DOMU_STATIC_MEM[$i]}"
>              dt_set "/chosen/domU$i" "direct-map" "bool" "${DOMU_DIRECT_MAP[$i]}"
>          fi
> -        dt_set "/chosen/domU$i" "vpl011" "hex" "0x1"
> +        if test -z "${DOMU_VPL011[$i]}" || test "${DOMU_VPL011[$i]}" -eq "1"
> +        then
> +            dt_set "/chosen/domU$i" "vpl011" "hex" "0x1"
... that the property type is incorrect. According to Xen docs, this should be a bool property.
@Stefano, can you fix it on commit?

~Michal

