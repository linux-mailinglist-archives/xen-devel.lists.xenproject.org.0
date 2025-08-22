Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4FCB310CC
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 09:50:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089645.1447150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upMXk-0002k2-6d; Fri, 22 Aug 2025 07:50:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089645.1447150; Fri, 22 Aug 2025 07:50:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upMXk-0002i1-34; Fri, 22 Aug 2025 07:50:36 +0000
Received: by outflank-mailman (input) for mailman id 1089645;
 Fri, 22 Aug 2025 07:50:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cd3U=3C=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1upMXi-0002ht-BU
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 07:50:34 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2417::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae5fc460-7f2c-11f0-a32b-13f23c93f187;
 Fri, 22 Aug 2025 09:50:33 +0200 (CEST)
Received: from CH0PR04CA0115.namprd04.prod.outlook.com (2603:10b6:610:75::30)
 by SA1PR12MB5614.namprd12.prod.outlook.com (2603:10b6:806:228::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.16; Fri, 22 Aug
 2025 07:50:28 +0000
Received: from CH1PEPF0000AD75.namprd04.prod.outlook.com
 (2603:10b6:610:75:cafe::24) by CH0PR04CA0115.outlook.office365.com
 (2603:10b6:610:75::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.19 via Frontend Transport; Fri,
 22 Aug 2025 07:50:28 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD75.mail.protection.outlook.com (10.167.244.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Fri, 22 Aug 2025 07:50:28 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 22 Aug
 2025 02:50:27 -0500
Received: from [10.252.147.171] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 22 Aug 2025 02:50:25 -0500
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
X-Inumbo-ID: ae5fc460-7f2c-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UPZZPSltBICy62F9+36ywCvnQKx29aIDZaoG92auvNYOdXFRmttXMWE3MyAAQnPjUt107CEF2IudA2XVg9qtUsqRm7l2nphhyp6fk6Exg1+A5oB+Oo37xeWaTrO048mg63SOg1T2eWoAWjoTjS62Cwaq4cH+gtGBzqfAsKmBmo1yNwyc8He3kv6e5rsbcuJU7FVo6d3iGAoDi52u9Cj8r/kPqqprcqTx9lZdldC6u32PrbUGZTsuxCxEwGIktAE2mZZuC0rYUjqHztX6iVzgtZq7eJI24049ABjRIB1lJ4wqkHAlg70d8gWTWLN9h3u6svlQPHzcLa/IrOyppN9Azg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YcSlBYGaeo1+EAeQK6fGxxF/HO2wobmy7Ikal3h2dgk=;
 b=LR+XyP40Wi5EUW/CbHRAK641EnOLUSpdX0NmGXtggdqAkpmcZCvAZixxwg3h8R+mPZQ6E2OOKI4BVFu3alr/3z8yOYdkshm+pYjTV20EC5dX9XuIwb1rXnFJDOs6NKtRP/lAgKM/x4ncDCnYPTzvc3o2twLOklZoHDY4mhgGh2umSyi5p0k7sHVw7Wph/CRmc/kKZMwlPOQ2N24AVvnyNorbMxDHIRJCUbwiesyXrhmqW9Uq2OHfBz3Ss5VVNs8oIvO8Nxu7I4oALa4qRBWoN9YbcViyBf1Tmk4cSmfjHm1DHyYov1w3Apqq0TStAyEqgIvNX4wta5isgm51BTR4GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YcSlBYGaeo1+EAeQK6fGxxF/HO2wobmy7Ikal3h2dgk=;
 b=wvA3r3bAzG8lKMGFtKN8dxQQlAXsrIQ3f0WVqkRPIYNW9+9anoVdybO5M6Tk3yrKjwWWsVB/XoEor3XhN67wVDI8jSPUt/xgCJekXFMsvTQIS00WUbHifEAqu27hG1ROUOWVT/yhTpmTxYaLkn9rpxQ39j79VHbt5QcZ0yFUAVg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <b12b9c9c-069c-4c45-adc6-5b7026f812f7@amd.com>
Date: Fri, 22 Aug 2025 09:50:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] xen/arm: map static memory on demand
To: Hari Limaye <hari.limaye@arm.com>, <xen-devel@lists.xenproject.org>
CC: <luca.fancellu@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Chen
	<wei.chen@arm.com>
References: <cover.1753864612.git.hari.limaye@arm.com>
 <c85ac9d6da3c13dabd26627faac90ea95feb3f95.1753864612.git.hari.limaye@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <c85ac9d6da3c13dabd26627faac90ea95feb3f95.1753864612.git.hari.limaye@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD75:EE_|SA1PR12MB5614:EE_
X-MS-Office365-Filtering-Correlation-Id: bb452a54-8911-42e2-1bdc-08dde1508fb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eU9lZk9oNlJwQVVCR3huSDJMcXE4akNjcUQ5Tk1LNG9lajF1ZVIwUGk0cjhi?=
 =?utf-8?B?R25vZmU2S2J0V0xlVUZ1djBFc3VvMzNMaUxrdHdXTjVBc0orQm9Hazc4UzVX?=
 =?utf-8?B?M2tZd1RENXFPcDU0NVBVTEx6d3BONnloek8rZ29ocG1iMkZKOUY4Z3RobjJk?=
 =?utf-8?B?czd0QjFua0ZocGh3cytndkl5OXBxYWlkb1UzN3lPRkh4V1E3U2JHZm04OHZs?=
 =?utf-8?B?VzN6bGhESHRId0tvZ2xuZVNyS2pwWXF1V2xXd0JXUTd6TnF0Qzd3dGYrVERO?=
 =?utf-8?B?MU9LSUtXMVhRdkhBbm9SejQrOHYraXB3OFJUWWx1L3JrMU1WeVlXUlM0clNi?=
 =?utf-8?B?bTJtNVdNRHpNQmw2U01BZ214MWpSNDBuQSt5WGcwVlBGTGRYNXNHcmpORFp3?=
 =?utf-8?B?UVRQSjJaRjJKVG8xa3B4SENYQzBDbDVvU2RzVmhvWENkU1NPa1IvRVdGSU50?=
 =?utf-8?B?eGFHcHR5a2x3VXJvTyttOWl3bkVMdi9KUzN6VTlxVHBRcWdHcVV1Q2YwOS9T?=
 =?utf-8?B?RFZBMm5uK2dMYjg4bFZibnZNYXNGZlFuMlhKNHQ1OVRBUjZmb2NTYXI5ZERM?=
 =?utf-8?B?Z0ZyVWR3MUZVcWowUVJFL1RycjU0M2xTcVBhZnNlUVlSTW9UcjNyVFpCeEhS?=
 =?utf-8?B?Ym5USWlwMU5tRGxvVEprdEdUem5VVVB5cHpBR2FOOGFOVnd0VHNoTVpUNHla?=
 =?utf-8?B?Yzl6Ykk5YTI0YWpCeS9XUEMvVWEyeXZPQzErZERZbHZMZTBLaFdnb3FrMVht?=
 =?utf-8?B?blNMaFAzKytuQ1FTR2RTNzBUazJQdE5XbkJNVWhsTWtXM3pFMHBqb2p6NlZC?=
 =?utf-8?B?YndlQlM0QWpiQzNVQy9reVJGb0oxQTRrNGZSVzlpbjNsdktqL2RDUWNIdy91?=
 =?utf-8?B?YURWUHFJcTlYL2tSaUxRajNlTk1DRUpXUzZjNEhBUXdBN25DTmxHbWhLYVhs?=
 =?utf-8?B?emhHb0h0Vk0yRTZyVkVnRGpkSUpsS3dWNi9vT0NGb1FYQzhXMTZHTmUzMkcr?=
 =?utf-8?B?REhhS0IyUy91OHVhb0pvNGtxMjlzKzR3SnN3SExCR2Vwc0gxL0dEeWVJUXdK?=
 =?utf-8?B?NjkxQXF6MWxxWFU2WUJWcGZzRXhIbTI2d3pkK0lYYWlyNmNEZlFucE5CZjZI?=
 =?utf-8?B?NlovQUtqTFBaR01haDhxZUt4cmZDclRYM3lFQVRCVmZ3SVYyRkZaQlpZdnFP?=
 =?utf-8?B?YnAraDltTlVYY2pldDIrMXR4QTRWeUV0UmVMTDVMbFlBYitZa0YvOG1Vbjh1?=
 =?utf-8?B?RXZVSWFqdGFieXpIZUpSbnFBRStZQWxUa0x0cXZDeEo5MmRWc2RLUEl6dG12?=
 =?utf-8?B?Qm5KQW1XaU1uZ1ZvZThjdzA0QlVEdE1mQzRYejdZdWZweTA3SUQzbndHT05B?=
 =?utf-8?B?bVRTVXRmU2JrTlZCYzNKU2ZxQkxjWVV4Ylo2TlVkbURWc3RJcTI3cmVPNnZG?=
 =?utf-8?B?V3VxM0R4WTZjK1NjelNkMkMrR08rTkxvWEYxNDdJQ2pkZTFZSmVVeXcydHho?=
 =?utf-8?B?QjIwNXRHVXk5N3RpSkcwUnNTY0lXcjdkOUJGcjY4ZEw2RUJnbWs5MC90QWJo?=
 =?utf-8?B?VW9oa3JTVGJ2MVRoKzV5aUFVemZsVXNqMHBMNWxMVEc0SXZIY2ROU3o1akpZ?=
 =?utf-8?B?cFQ5ejdtRUVvSU1Qbzl6SVM2bCtENEpkUVJMcDZNYjVxTW9RbTN2QkloT3BS?=
 =?utf-8?B?azBjQVZaekhyNG8rTUtBV1JzU3ZQbU9IZlhMSlJJdUVLV3VDMzVUaklYcnhm?=
 =?utf-8?B?eGtVMGxaRjA3QXo0RERlL3ovTWQ2MUxDaVpmZ2JPS24venkvYnlMc3Z1bjhU?=
 =?utf-8?B?ek9JTDA2THhkc0s3UEpyemwxNStLZDFFTWFpOEZVRjY4L2JRZVQyS09ZVEww?=
 =?utf-8?B?SER1YW1YOWMxRjI1bnk0cWEwOUlKRnZYYXRXYkZCTW1BSHBqdExDekc5ak8z?=
 =?utf-8?B?S1RFZk54L2paMjQ3cDR6ajBRai9JRkRjcklTVzFNZEhNUTRyeHAzZWNZTXU4?=
 =?utf-8?B?cjFyY2orRHNSem9tV3E2b3dKWEJEM05QemdyWloxcmdUay84bDVtL2ZRcFVz?=
 =?utf-8?Q?841dR9?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 07:50:28.0513
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb452a54-8911-42e2-1bdc-08dde1508fb4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD75.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5614



On 30/07/2025 10:45, Hari Limaye wrote:
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> In the function `init_staticmem_pages` we need to have mapped static
> memory banks for initialization. Unlike on an MMU system, we cannot map
> the entire RAM on an MPU system as we have a limited number of MPU
> memory regions. To solve this, transiently map the static memory banks
> for initialization.
How does this correspond to Arm32 MPU (R52), where all of the RAM will be
covered? I don't think 'transient' mappings will be needed there but all of your
work targets common (i.e. not only Arm64) MPU code.

~Michal


