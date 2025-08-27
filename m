Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DCBB38447
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 16:01:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096171.1450964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urGhw-00055d-9n; Wed, 27 Aug 2025 14:01:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096171.1450964; Wed, 27 Aug 2025 14:01:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urGhw-00052U-6e; Wed, 27 Aug 2025 14:01:00 +0000
Received: by outflank-mailman (input) for mailman id 1096171;
 Wed, 27 Aug 2025 14:00:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n4tM=3H=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1urGhu-0004Rw-As
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 14:00:58 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20613.outbound.protection.outlook.com
 [2a01:111:f403:200a::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 407f18cc-834e-11f0-ae26-e363de0e7a9e;
 Wed, 27 Aug 2025 16:00:56 +0200 (CEST)
Received: from CH5PR05CA0008.namprd05.prod.outlook.com (2603:10b6:610:1f0::17)
 by DS7PR12MB6238.namprd12.prod.outlook.com (2603:10b6:8:96::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Wed, 27 Aug
 2025 14:00:52 +0000
Received: from CH3PEPF0000000D.namprd04.prod.outlook.com
 (2603:10b6:610:1f0:cafe::48) by CH5PR05CA0008.outlook.office365.com
 (2603:10b6:610:1f0::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.6 via Frontend Transport; Wed,
 27 Aug 2025 14:00:52 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH3PEPF0000000D.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Wed, 27 Aug 2025 14:00:52 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 09:00:51 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 09:00:51 -0500
Received: from [172.31.63.243] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 27 Aug 2025 09:00:51 -0500
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
X-Inumbo-ID: 407f18cc-834e-11f0-ae26-e363de0e7a9e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NLisXCE+zng0Wt5yHrwoiDfIY2WKk1wiLG1wUEvGYQYZLj6pS7/d+RG+CFvapWt0OoH31KFt5eHWryMttdZi7oPQ4fmKaq8Qu1D7tftmDHljx6oiddolTPpogJjEKRxmYAriTB9XsErxvbTqSvV6M+Ns4fY4Z68GPa0EFBrWu5BH95FteF1ehOUPejYEZtwoMyetNGtdJyzY1zwgOKlnQFOnPY29Na00Qwp24C+V1ItmSSgg1mBB4XGNC7DvngE+6c4usjym4robT4kS+YDUcMBDmlN1mBkDRDWL0v8rjUNTrMjZJSuRz9R8RWPdKXIHpJXU/+2/5w36uPbEgdZiiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rFy7EjDhskpnyyqz5KdYr5/BiPtvpffxStEk5hiTMCM=;
 b=cbq8nDkRTFe5OHRjor0sXrJb/4mvve4By7Jf2jLWCBqTuY1vS/48+VQLQWKMElKfe2ivm1HDibVo2PjtqEmfRiIcmTdGED8RflzWZKIUJ46uNZ3VI5L8HOaolzibs5pOGC6arbrsQVq6lq2PMli9id+am02Oge6mUKHBz4gn1fwfP0U7uoEirnE830NngD0qdgNadLAikgmMa7MBsli19e/UNlv5ry9xNkbTxXnuc4+Bv6bUEmSaPpNmnUfgNGSsymOOE1MuTC7Naav+o8GQJdVgJn05/quYA4vgH2GZ1BldOW+cvHjzCrLPUzU2sQR3BFPx1f78XTFwlr7sEadLLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rFy7EjDhskpnyyqz5KdYr5/BiPtvpffxStEk5hiTMCM=;
 b=IDoWxh58fHK2Dn/sGzaes+iPT8xyvMdnqxwVxS0DAQY/G6OPwvdKwgdn/RcnjMkRJSKkHAf0Lb7SdX7cC8Ej0AzxblGgmzlD1bAcTBXZzL5Q4eOaPwm2jxYm7uN48K59wSPyZkE68Zs4G9ZuSE1lJ7Z14zx1OCfatZeTlthGL4U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <9194431b-2178-40df-bcc1-da0faeb9778e@amd.com>
Date: Wed, 27 Aug 2025 10:01:23 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drivers/xen/gntdev: use xen_pv_domain() instead of
 cached value
To: Juergen Gross <jgross@suse.com>, <linux-kernel@vger.kernel.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, <xen-devel@lists.xenproject.org>
References: <20250826145608.10352-1-jgross@suse.com>
 <20250826145608.10352-4-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250826145608.10352-4-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000D:EE_|DS7PR12MB6238:EE_
X-MS-Office365-Filtering-Correlation-Id: cc817e4c-dad0-46c1-8c5c-08dde5722281
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?blFPMW56ZFEzWHk2WmpRM2tURlBnVlluNjZxZ1JkTGRHNlIvc1pKNWFuTUp1?=
 =?utf-8?B?bnhSdi9MYkgydm9jT2xNamZSVnltZzZuR0RHNFREQmkrRXVTL3U5MG4rT2w3?=
 =?utf-8?B?RGxnQ1hkbEJwU1FGSzRvc0FVaVJPY3AyWVhyY25PS2o1V2NSR0ozMzJlSkx1?=
 =?utf-8?B?TjFKWEV3aWVhVVA5YUk0K3hWOUtWV1g1d3BxZ1NyVFRaZDlUMnJPcWlOcG94?=
 =?utf-8?B?WW83Z3I5K25sY3MvSXV1VlN2YXZ3VXpBZjFyU2NzOGxmbi9EL0VpbS9uT1NQ?=
 =?utf-8?B?Wm5GUVlGcmJwMGlQVG5QUy9Ec2lYTXFhUVhJUVEvZ09RZk5aT1o3MXY4UlRR?=
 =?utf-8?B?azF5U2J0VE5URHd4azZWNjR6WUt6TmNLWWJ2UnJvMU5kWlFhM1BvQS93VFdW?=
 =?utf-8?B?Y3ZMNkYxcEVlWjRNYytydUtSeWd2SmNuREtsZUhFdWcvQzVxZGRtaTNzUVpN?=
 =?utf-8?B?MHJBd3pzRkRjNW1kTTFQaUdZVGREWVVUdDhSRzAydEJtcU9rTnFLaEVTTUR5?=
 =?utf-8?B?NXVRZFhLN2g3QlJBbnJHcVJFK2x6SXNKN3FFRDhRc1BvdTFSdzM5QjVjNG41?=
 =?utf-8?B?a1ovd29CRDNLRDBkM1BSQlFHZmZWNG9LeEk3ZGFEcFgydzRXcHRaM09Rd3Aw?=
 =?utf-8?B?YldqaTNmSkJwbkpQS21QZzZOUnhtdDNwZHRCOGIxbHRQWm9ZeW9WekE2WWdh?=
 =?utf-8?B?ZktWOEpicnlVOEZqTFphV0tPakR6NjBJOTFjcDQxWFUwOERBTW9mZy8remlm?=
 =?utf-8?B?bDJXUEVqTFExKzdxalBUSitqSXF6WUFuZEJDZ1RaVnF2MlhlZHkwb0pVenVR?=
 =?utf-8?B?RnAzUlNnSkdMOWsyWjdsbURNaHpRYU1LaWxvTzc2QjNBTkRtck9SczZ5MnVh?=
 =?utf-8?B?bU1DVFFtTzVtYUM2aUR2eFdtcWNjZ2RKM3dWM2FqRXQ1RnI2aWwwRmtULytD?=
 =?utf-8?B?WkVHKzJQOUI2RVEwZ2l3eENwaXBneXVONmt4dVFsbHNRLzNvbDNSdm5CRXYz?=
 =?utf-8?B?aXFNUFA0RjhYNTk2aUJRSTQ1NTcwdGZFdUU0Sm81dmxaYmVFV0ZkTVBoeTRY?=
 =?utf-8?B?bnBGMGNDZDZPQU11RGJ2MzRmYng0VDh6Yy8wTVROS3NSSUJiOGNITjlkSkFz?=
 =?utf-8?B?Y1pJZE9BaW1pbHVUZElkZTlaWlJuaGJSeSsrdnRxeGIvUmZad2hvcHJ2RHNG?=
 =?utf-8?B?ZzlGWk1yZk1UeTBmOGhWRVFoR0NRalNyMXBnQXd3MS80QWIyMWFESG9uRk5a?=
 =?utf-8?B?SVBKSUoxZU9CNVUyS1N0bnUxbjI5MGRZS0oxQXg4cFdsRTU2WkxXcDZTdldm?=
 =?utf-8?B?MXZ3V3cvTnZWczFONXVZMjBBYnpJUVIrWG1BbVU2Z2JzcE03RmsyM3pKdXk3?=
 =?utf-8?B?RTAxaEpZMWMvajgwbWFDTGYyUDU0NjRRcDF3Ni9CN043QWpsMHVLMXdJV3Rk?=
 =?utf-8?B?bVByVy9nd1ZROEpCSWlTVDkxT2NFZnhDRE1IMkZmdmdDcmVSSU9jR04rdnY5?=
 =?utf-8?B?RG90WDFDNEdHRFhjMncwSW1mekhRRkhhZGFseEpnSnhvQWVMRXRwRkdjVSta?=
 =?utf-8?B?Si9YVzRLdjBxSEJ6ejJXOFlHTFJSYU9ZZmRvY2RaS3BibUNlRXNIazVYZExy?=
 =?utf-8?B?UEhuMjg3U2FlTk56Q01SM2syL1dGYnVtNFU0ZlFNc0RjVHNGZkNpM1pkSlBJ?=
 =?utf-8?B?ZmxPN2VXcFVucGNMeHBMRlNMM3FYeWlFd1dkZ0RKMnZic3FGREV4UXlCdm5O?=
 =?utf-8?B?alFncWdxbnBaSFpKNUtnT0RDOTA3dUtBVmowNVdsZzhobU5TTjROcndqYUZB?=
 =?utf-8?B?MENSWlhPbUxiVENtQko1WHpHWk1KQ2MzMFlaT0VGKzlvV3JMLzZxMzFjVitU?=
 =?utf-8?B?RXNTV1hxc25rdmxmVGVmR0c2TjRrck81b2crdUlMV1EybVQ1RjNBSFk4aWV0?=
 =?utf-8?B?NldzN2owNXA1bXhuVEk2MjFBSGdqVmkrTlczV2haWG43WkFOQ1BqVVMrZmwz?=
 =?utf-8?B?Qm0rWENac0cxVEREZEhIcHFmcitMcDJkMkhkTHEyZld3R1JNM3hTYVRBa2FQ?=
 =?utf-8?Q?07neBR?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 14:00:52.2611
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc817e4c-dad0-46c1-8c5c-08dde5722281
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6238

On 2025-08-26 10:56, Juergen Gross wrote:
> Eliminate the use_ptemod variable by replacing its use cases with
> xen_pv_domain().
> 
> Instead of passing the xen_pv_domain() return value to
> gntdev_ioctl_dmabuf_exp_from_refs(), use xen_pv_domain() in that
> function.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

