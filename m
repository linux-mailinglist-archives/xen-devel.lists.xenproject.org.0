Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2207987F3B
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 09:17:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806071.1217378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su5Dn-0002Lf-TM; Fri, 27 Sep 2024 07:16:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806071.1217378; Fri, 27 Sep 2024 07:16:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su5Dn-0002Jr-QP; Fri, 27 Sep 2024 07:16:59 +0000
Received: by outflank-mailman (input) for mailman id 806071;
 Fri, 27 Sep 2024 07:16:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tfRU=QZ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1su5Dl-0002JS-Kc
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2024 07:16:57 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2414::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 788ad35c-7ca0-11ef-99a2-01e77a169b0f;
 Fri, 27 Sep 2024 09:16:53 +0200 (CEST)
Received: from SJ0PR05CA0110.namprd05.prod.outlook.com (2603:10b6:a03:334::25)
 by MN2PR12MB4254.namprd12.prod.outlook.com (2603:10b6:208:1d0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.23; Fri, 27 Sep
 2024 07:16:49 +0000
Received: from SJ5PEPF000001F3.namprd05.prod.outlook.com
 (2603:10b6:a03:334:cafe::b0) by SJ0PR05CA0110.outlook.office365.com
 (2603:10b6:a03:334::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.17 via Frontend
 Transport; Fri, 27 Sep 2024 07:16:48 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001F3.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8005.15 via Frontend Transport; Fri, 27 Sep 2024 07:16:48 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 27 Sep
 2024 02:16:47 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 27 Sep 2024 02:16:46 -0500
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
X-Inumbo-ID: 788ad35c-7ca0-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=soV2pZ1jRb50CBlsY6PwbdHFHDiy2DSTy1Iyx5tluZzw9KBlz4ugQA0jn31X2j8axgH7wLkv8+sfj3eTYmvKBqGDf/5pVgbV+6c4DkqLFFTskNpMYW3mXiMw9QzMTlxnmInLshyFSjd1rNnZU+1mRhG5t4GcSPQouAiRHDr/3ZDMwJ2zGj1Rvt3Rr85B38BJow9YMeUvzUVnyUexDZb1akqioR5bbkJmCP8YJNEExVRnEaVnm2FwRQZxIgcRQyOqsYmdt7XIcWAwR+Ynefe+T8kyQhF2frP3zGO4fQJUFKQ7Uv0ycS1o/z4Cx1MrIvhZxiNXDoQqghUzlVCsc7+kZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g6NO069kaw5dxx9clmpVHXUlfBD56QiTFYtC503U7Zg=;
 b=ovQpjc2udQZg7aDOvLICRV3aS4/kbi371gLEIKFbrqiqEK1H5APEvqft5eK9le8JDCUhf85IQOlxWp2KX0lehPYnB43x4qbjSN8aNPlPc0AIhYQSqQNUs18ax2OG3CqhSjWPz8jUvJ8z4kxuUPDKrOIKHSrPqgZjoYXslhvLXl67hVpfUZfuyCzH/qFk/MwHvFFA25z5g9OuE8GD+rQlXNnlrKTMD20q5GNhGWctUkWC5OXSuyjR60m3DRmwnXNPZVdd7RLXigp/WbeJsq7wwyrkt2wS5gzsHNsIKvvpREYlTj2dFCU2hXWjalaLoKARSfbvEU+YCi12P3r4Di9fnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g6NO069kaw5dxx9clmpVHXUlfBD56QiTFYtC503U7Zg=;
 b=kTMIW/LUKWR9W3ZicklXXhyBHkUThYAPe4kPdy9ZQ5b0a8bqPGiz2ULnah8srVUvI57ePRyhMUWdfsziwp1xZJm5Bz3caOz46ZXU2ExzyIiAAzQ9JICkEgk45qlUEI3tuHIR0MPXD6unozaZUeV5imuSOlYuIAOLkF4UmF90xqU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <fc736022-1114-48f8-a20e-fd67060716f8@amd.com>
Date: Fri, 27 Sep 2024 09:16:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] xen/arm: use {DT,ACPI}_DEV_INFO for device info
 sections
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1727365854.git.oleksii.kurochko@gmail.com>
 <fc4243be6e43224f27311d96512dc0f465c73a38.1727365854.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <fc4243be6e43224f27311d96512dc0f465c73a38.1727365854.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F3:EE_|MN2PR12MB4254:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d014f49-5e93-4fe6-d2ab-08dcdec45a4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V1liK3JvUzB3ak9zTDVRaVNPMGcxTXArbjNMVlJqcWx3MGdMbkIxbStjWW9H?=
 =?utf-8?B?YmJLUmFZSjRHL01HZHI5SHc0bjg1b1NZWGRCQW8wOWw2aHNKOHRiRkZFZHFH?=
 =?utf-8?B?QzhnWkJNaldQL0lUVmk1N3VwOWFRTWVNMmN0d0xEWm95VSttU0cvZTl6MVJN?=
 =?utf-8?B?OWpSVlRrV09LK0hNa2VDb3VGRzdWRjk3L2JsZWtwL29hWTlWSU1oUVFJZkkw?=
 =?utf-8?B?VW03YVZ5ZU5QVWExRWxnU01vQmpERkFuazRGV3JoRCtvNi8yemowTzBTblNu?=
 =?utf-8?B?aG1BSnh4WnB5NVNza2xFa0o5a3g4b0pnNmIwU0NUQ3dGb1BhdENGb3p1dW9r?=
 =?utf-8?B?OUdLd2hJdm8wZ3pBVXFrQjRTdFBQeWhpZ003dWhkbW9OWEN0WDlkM1BZT1Zy?=
 =?utf-8?B?WFpNMmVneGpwbHJWZytKdG1DbGZlVlhwT0FnY0w5L3ZrYlEzU2M4YXpTdExC?=
 =?utf-8?B?TGQrNDhoU1VUR2crTkJMYVFmOERabHd6ZEZpUVczdzdtZFh4dEhQVVFGa3N4?=
 =?utf-8?B?NnU2eGxVUG1ERThGTmErTHdDWTdad2l4c0FvWW90VzduM01GcExqR1F0bEpV?=
 =?utf-8?B?L2sveUR1NjVrTHV3NWJ3VnkzckhvYURNamo1TkZKV3JZQ0N4bi81ZWpndDdj?=
 =?utf-8?B?dU92MUE1cXNvVTFyeWlQeER0QnNDb3N4cVYvMWkxNHRaRnV6SDJ2UXIyTlNB?=
 =?utf-8?B?K1lMc0tkc1Ava0RtZG41K2EwandraVQ0dXZXWVlvNk0yaHJjZDVGMkx6WUda?=
 =?utf-8?B?cmRQYW9oYko1N1NEekNkSmh6bTZxa0lxWCswTGNqOFptQUtvV3psYTBZTGZP?=
 =?utf-8?B?K3NWc2RscTU4YTI1NFNUeW9BWXU4MjBLSDh1U28wdi95QTI3N3B4Rmh6UjFy?=
 =?utf-8?B?OXk2SHhkRmpWejJ3VnlwMDlTVHU4cUlZQ29Jd1c1bEdLNkM4VmdyUVJTWjRR?=
 =?utf-8?B?SVNQTmF5NlE0djh4SUZ3V3hFNnI0U24xcUxWdGhkd3AwSnRWQjFBWlpPL1dQ?=
 =?utf-8?B?RzJiRVUxVnBpVHdJeS9ZcGRwem1JVzl2bjdUNnYvRlNjZ3R0aXUrNzIwNXJF?=
 =?utf-8?B?VFg0aGdwanpKMVJTZWx5MzBHUTMyakpqcDluRTYwU01IbzFzeU9zTHZXNVJ2?=
 =?utf-8?B?V1pBUFlwNldTZ3VraVgvbThpOG84K01FUlpNMEtPcXEvbTFOR3V0WlBidDl6?=
 =?utf-8?B?cS9NMFl1Z2YzZlRtMUJDK1pnRVk4SnVnMmlaWWo0TlVEdk1EMnljZmkvb3Jk?=
 =?utf-8?B?V0tnL0VPMTRGeXhmV3ZlQS9XQWhhRVd3Zm43Ykozd09qNG0velRYQ1dTTlNv?=
 =?utf-8?B?VG5yb0tiOS9sOExnSE91WUt1V2dZVitibHg0aFUxRGlmMEp3N0lkZ2g4eHhl?=
 =?utf-8?B?YklvMU8vdGZPQ1FLZDJjK3NvV1JFSUptTDUzU1NlRmMxT3RxRlkxamlrSHhx?=
 =?utf-8?B?SDk4UjBZOWxRSS8zL2x6SWhYLzZ5TFBKVFF1QU5RZ1B6eWRJUkduTkFoc25I?=
 =?utf-8?B?OFQyZTBsQ3l2aGZhZ255ZGluaEIrS2d0dUs4b1FESHg1alA3K3hpWXVkMklr?=
 =?utf-8?B?Mm9pNXo3ZUJ0b0xFZkpMM3V5UTNrVnh3RXQ1NTBGTmVqS2l3L1N6bVBYeDVm?=
 =?utf-8?B?R3FVQWZWeVNNdjBkaHBDWEIxR3BLYU9kZEM1c1BNTkdwK2t1a0R0aTBabUc4?=
 =?utf-8?B?NWlOaFl0Q1BNVUFieVJ0cUVZWjcySEs2ZUREcEIrY1dOS2lkQWpOMWY2blRw?=
 =?utf-8?B?WUZjNWVLN1NEWVVZNU9aZTNVaXBHeGNXWFo1M1M3R0xhTGRRdkF2NUVGVExp?=
 =?utf-8?B?WmlHZ0JGbEs3RjRHMmIwNTBlditvSmxrTFZnN3NjSW04QUw3YUdybDU1RGY2?=
 =?utf-8?Q?x44G3ZlbOClc8?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 07:16:48.8014
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d014f49-5e93-4fe6-d2ab-08dcdec45a4a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4254

Hi Oleksii,

On 26/09/2024 18:54, Oleksii Kurochko wrote:
> 
> 
> Refactor arm/xen.lds.S by replacing the inline definitions for
> device info sections with the newly introduced {DT,ACPI}_DEV_INFO
> macros from xen/xen.lds.h.

I would expect so see a note about s/8/POINTER_ALIGN/ that it's safe to do that.

> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V4:
>  - use newly refactored ACPI_DEV_INFO and DT_DEV_INFO
> ---
> Changes in V3:
>  - use refactored ADEV_INFO and DT_DEV_INFO macros.
> ---
>  xen/arch/arm/xen.lds.S | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)
> 
> diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
> index 0987052f1a..3b7b677197 100644
> --- a/xen/arch/arm/xen.lds.S
> +++ b/xen/arch/arm/xen.lds.S
> @@ -4,6 +4,8 @@
> 
>  #include <xen/cache.h>
>  #include <xen/lib.h>
> +
> +#define SIMPLE_DECL_SECTION
>  #include <xen/xen.lds.h>
>  #include <asm/page.h>
>  #undef ENTRY
> @@ -124,20 +126,10 @@ SECTIONS
>        _eplatform = .;
>    } :text
> 
> -  . = ALIGN(8);
> -  .dev.info : {
> -      _sdevice = .;
> -      *(.dev.info)
> -      _edevice = .;
> -  } :text
> +  DT_DEV_INFO(.dev.info)
> 
>  #ifdef CONFIG_ACPI
> -  . = ALIGN(8);
> -  .adev.info : {
The name of the section is ".adev.info", but ...
> -      _asdevice = .;
> -      *(.adev.info)
> -      _aedevice = .;
> -  } :text
> +  ACPI_DEV_INFO(adev.info)
here you're missing the leading dot which will cause the probe to fail.

Apart from that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

