Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F1CA2029C
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 01:33:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878242.1288414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcZWq-0003cD-7t; Tue, 28 Jan 2025 00:32:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878242.1288414; Tue, 28 Jan 2025 00:32:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcZWq-0003aa-3s; Tue, 28 Jan 2025 00:32:32 +0000
Received: by outflank-mailman (input) for mailman id 878242;
 Tue, 28 Jan 2025 00:32:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LT9m=UU=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tcZWo-0003aU-K7
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 00:32:30 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20629.outbound.protection.outlook.com
 [2a01:111:f403:2009::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59b19d04-dd0f-11ef-99a4-01e77a169b0f;
 Tue, 28 Jan 2025 01:32:28 +0100 (CET)
Received: from BY5PR16CA0017.namprd16.prod.outlook.com (2603:10b6:a03:1a0::30)
 by DM4PR12MB7693.namprd12.prod.outlook.com (2603:10b6:8:103::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Tue, 28 Jan
 2025 00:32:24 +0000
Received: from SJ5PEPF000001D0.namprd05.prod.outlook.com
 (2603:10b6:a03:1a0:cafe::a4) by BY5PR16CA0017.outlook.office365.com
 (2603:10b6:a03:1a0::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.22 via Frontend Transport; Tue,
 28 Jan 2025 00:32:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001D0.mail.protection.outlook.com (10.167.242.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Tue, 28 Jan 2025 00:32:23 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 27 Jan
 2025 18:32:22 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 27 Jan
 2025 18:32:22 -0600
Received: from [172.25.15.116] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 27 Jan 2025 18:32:21 -0600
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
X-Inumbo-ID: 59b19d04-dd0f-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ppn/jytpHTpsSAr+utwlVpsHb9xOm2Jg3Ooz85LSLVb+6n+ZvxaYzcjaUHoqf6n40eGuCZGQ56WGojDmA/Vts2d4Ry1WfvdeCf6chw72yWCGA8WtlpPQqpe7tYLbdcaCj0eVrhekPyE5VCsKuzEdiiDBf6S4HcaffjLgZ/GFOd8RzeOfzYbut4kOmXPj0rLoaGQI6cMGON6QRol1eP6UocxNI4vPiCv7jmDauMi92DRJIIXxs4fzE5xFULBJwnQWY7yXep/OT5CK7/+O+ZL5HwROH0KaUlNR8V4qcJiLnpSToF0ZHZzwPTFD0iCrSPlpL6FD0YpePEDeAkMhAV7CAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=51YNYtPACKD20etOArML24Odd1c+C2MmKvdCCVrsVvI=;
 b=HsJ1/3Kp1gZdl2bi6kzm3jcIYjHI1N9/uJYvtTneU4ve8s+Nke3vr8z3xKtHE0Mcz2t7TenwWKfnY2T+rMRcgoVvSUdq+VgYP8watESXpebrJxyQsLwlRBUM7TjBTAidO7VN8xz4rVNN4mN8NQuueWuWmR4EYKJ0s03j1cJ9uiSN587vAD2oNwvhJuPE27sdFA6kqqx00F2dhYwR4TQdPxnXMU79t9uHQbXxx2LkJ3vqaV/QexhfxDav0fK4hIN9/QaXQ4b1UMxuuVhtCAMj/i8VKjVQYkPZHW+ZvX3NN+5y+7J2aQFC51lKZdaQAzNgsDV9g5UtR2cDhXV1xR8m7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ford.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=51YNYtPACKD20etOArML24Odd1c+C2MmKvdCCVrsVvI=;
 b=i00qMbnAzvk1b59UfEq55RlNhMbrhQaTEonY2/mhH9mgpPTAF77dFLvOU+lV1ieSvGZ2361sE7spk9TOKgB5xeGxJqcajdEwE6iq53uj7JEQvkcYLWsVw2naGumJ5n9jcU/Z0rbJzNjRFmOlrrcLJnwXv4ydgSwSWfPpogaoEEw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <3ab581fb-4c7b-43ff-8ac4-6bab65758437@amd.com>
Date: Mon, 27 Jan 2025 18:57:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/24] xen/domain: introduce hardware emulation flags
To: <dmukhin@ford.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
 <20250103-vuart-ns8250-v3-v1-6-c5d36b31d66c@ford.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250103-vuart-ns8250-v3-v1-6-c5d36b31d66c@ford.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D0:EE_|DM4PR12MB7693:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d0b5f9a-6952-45c5-ae21-08dd3f333be9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ekxNK05kUGRad2RmMTNyMHdkOUpJOExrK2RhYzBndUV5QlUwZWRDVEFiWk5M?=
 =?utf-8?B?UjJ0Y0x6akRwWUhsUUFWTSsrYVRINnJMd3hQUmNBVTNDZjVGQXRsdmNVcVF4?=
 =?utf-8?B?c21jdjlVMXFEanlHelFOUWhRaXowQ0NuWEY5ekJKRTFqanJGd2RteEUwVS82?=
 =?utf-8?B?WFVsOEpuYjd1YVdPWGN6T2lZbkJMRUdQRjMwR1hBd0Z6eExBdlAwOXNNMmZt?=
 =?utf-8?B?RGJEbmhwczdvMlpyMllXY0VCcWJLeVVtV1NFMms0K05YMzJHejQ5WWp1ck1y?=
 =?utf-8?B?bXI4SUVOYXVLK3hWZEZDYXM3T3ZqMjRXVkxWTFpnSU5zSk5EREVkSVR4aVpD?=
 =?utf-8?B?cDVEbEhpM1Y0Ym5KamJLYUJEQnVPa2FvVGNwOG9XTldLTFFMMytKejhvTzJo?=
 =?utf-8?B?cHpuNWZ5NzRNZEE1aWh2YjRhVmMxY1dOcE1BSjB5aUlIbTVNUE5nREJNUnlJ?=
 =?utf-8?B?VWh5T0tOS24yTTRhcFhKeTJpb3JhYUFocXRYY0VzdWFjOGRDY0hwSlZFMFRQ?=
 =?utf-8?B?NzByMklCbWFLSFhXajFibm94bDNvaUpsd1lkZjVCNG1pOUZWbFplV3Uwbmgx?=
 =?utf-8?B?VFlMT0Y2UzQwNkpEeFd4RlJFa1BoOEVOa1Rqcm00U2Z6VDY5LysyM2NvcURk?=
 =?utf-8?B?T1JGcGRuenVGZUpkc3dMaXQyNmNROHRXeW5MMkozeFl3YVBJYytRM25BM0dx?=
 =?utf-8?B?MXY1dTYyNkRMUVlOWmJoRmFmQXFJMDRpVEk0cWVZZTBGdTlxM1hvazhTckhO?=
 =?utf-8?B?STFGVDAyOVNZa1Nnbm9MNWVKMTdpYWhoMGZRT3dvWVNCT3M2VnE0YVBxQXZN?=
 =?utf-8?B?OXhDUGVEQW9rVnJIOUJvSVlDMTdEM1hnMHBGN2pBVWgrMkZZUFdkTjRhd0k0?=
 =?utf-8?B?bG9ESWdITXo4MS8vTWJrWDhORHd1RnEyRTF5VFJldTc1WGdSanZnRmp1Y3Rv?=
 =?utf-8?B?aXgrWFBkZk0xNFliSFZxQk9ZWkFJWTQ2REJnR2JyNEx1WCtEMlZVRTR5WGRQ?=
 =?utf-8?B?OWNDK2JMbDcra3pvNDk5dnVVS05tT0Q5WWlUYXNWVEJySmhnU25FV0lkWUR4?=
 =?utf-8?B?dVByZmx6TjFBNCtoUS9Wc1dHeW5rRDY3YlVteVFkZG15eVJzWW05QzNaZmtP?=
 =?utf-8?B?N2xLNW1YeXBHSHd3TEZ5bG4wODM2b3BvNzhWR2RQZTgxYTg3aWZMdDRYZVRh?=
 =?utf-8?B?a09ZSks0TXZuWFZxbWtldUxtSWpMKzREQVIzWVh6RXptdFJrMkdjOXBybzhP?=
 =?utf-8?B?azFXUC9weVpRdGYwZThEa2VkWUN4TVlEdE56NU5DMHhWdG5UcmtnbDBYUWNy?=
 =?utf-8?B?UTZpeGRRbUlHUVlDWlF3Ympidk9TVm9wUFFmd1NYTkkyV01temM5cmx3ZW9x?=
 =?utf-8?B?SCtqTkIvM1ZiUFFjazMrclovRmxqT1Q4eDVpbHpMV0hCWEZmN1UyTkxuTSs5?=
 =?utf-8?B?WUQyUU5EdElPTkk0TDZqdmlES3B0MzJaZU9BQmxhMzNXUTB3RUxwWWNjNUVa?=
 =?utf-8?B?V1VKWVI5VzN2a0pjdUdDNStYTDNtb2Y2MWl1djRGdzdmM1FJbFEyMDFvWEFY?=
 =?utf-8?B?RHlkdkYrbDF3Um1jeHRIVHJSU3dUOE9iU09UbGpiYkMvSFA1N0FXMUpVNWNU?=
 =?utf-8?B?MlQ0NzlqcDdlNm8yaklnRUlxTnR3MUpuUVRTOVU5REN5RTVKVzE1UFRqb3Ar?=
 =?utf-8?B?ano5WkthczMxck03c05xa29NRFBIejM3aUprUm1HVWloQzJuODdGNHdYV29N?=
 =?utf-8?B?NnM3ZHQvUDNVbmd5UGxoZnA0TWZLODF1b0pGckh6MTJrQ3NQUmF5WXlIVFcx?=
 =?utf-8?B?d0l3ZU4zOGNZMWdFNThhRTRhMTlNZDBrdWNpQlFKMmRRTVExZUwxbHZjaFdo?=
 =?utf-8?B?LzduUG1XeTVzNWdsZTBiQjVrT21yaTM5aGxvWUhiRXVIODNZTW12MFVucUtH?=
 =?utf-8?B?Z2Z2UUU2SzczSVhwaHY2WFMvUTdsU0oveHBqT3kwZWdrTUVQV2FQZGhubU9C?=
 =?utf-8?Q?kLBChtUa4BH99XI75FTAhLUVTNIM2Q=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 00:32:23.5968
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d0b5f9a-6952-45c5-ae21-08dd3f333be9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7693

On 2025-01-03 20:58, Denis Mukhin via B4 Relay wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Define an architecture-independent location for describing hardware emulation
> flags for configuring in-hypervisor emulators.

I'm not sure about this.  It's a lot of churn.  The common internal 
handling makes sense, but specifying in a domain architecture-specific 
fashion seems okay.  Letting ARM specify EMU_VPL011 and x86 EMU_UART 
better aligns with the rest of the architecture-specific emulation flags.

> Print d->arch.emulation_flags from 'q' keyhandler for better traceability while
> debugging in-hypervisor hardware emulators.
> 
> Also, expanded the error message in arch_domain_create() in x86 case when
> user-defined domain emulation_flags are incompatible w/ platform supported
> emulation_flags.

These two seem okay, but could be in their own patch.

> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

> diff --git a/xen/include/public/virtdev.h b/xen/include/public/virtdev.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..27434377ecacfe069a91dea3768d14b0c14e08b4
> --- /dev/null
> +++ b/xen/include/public/virtdev.h
> @@ -0,0 +1,61 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef XEN__PUBLIC_VIRTDEV_H
> +#define XEN__PUBLIC_VIRTDEV_H
> +
> +/*
> + * Domain hardware emulation flags.
> + */
> +enum {
> +    VIRTDEV_LAPIC      = 1U << 0,
> +    VIRTDEV_HPET       = 1U << 1,
> +    VIRTDEV_PM         = 1U << 2,
> +    VIRTDEV_RTC        = 1U << 3,
> +    VIRTDEV_IOAPIC     = 1U << 4,
> +    VIRTDEV_PIC        = 1U << 5,
> +    VIRTDEV_VGA        = 1U << 6,
> +    VIRTDEV_IOMMU      = 1U << 7,
> +    VIRTDEV_PIT        = 1U << 8,
> +    VIRTDEV_PIRQ       = 1U << 9,
> +    VIRTDEV_PCI        = 1U << 10,
> +};

If you do create this new header, I think you'll want to leave these as 
just bit numbers and shifts.  IIRC, the headers strive for greatest 
compatibility and, enums are less rigorously defined.

Regards,
Jason

