Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A17BAFF61A
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jul 2025 02:45:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1038826.1411020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZfPY-0005F2-Fx; Thu, 10 Jul 2025 00:45:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1038826.1411020; Thu, 10 Jul 2025 00:45:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZfPY-0005DQ-C8; Thu, 10 Jul 2025 00:45:16 +0000
Received: by outflank-mailman (input) for mailman id 1038826;
 Thu, 10 Jul 2025 00:45:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sQai=ZX=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uZfPX-0004nm-DV
 for xen-devel@lists.xenproject.org; Thu, 10 Jul 2025 00:45:15 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2060b.outbound.protection.outlook.com
 [2a01:111:f403:240a::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23d245ab-5d27-11f0-b894-0df219b8e170;
 Thu, 10 Jul 2025 02:45:13 +0200 (CEST)
Received: from BYAPR11CA0103.namprd11.prod.outlook.com (2603:10b6:a03:f4::44)
 by LV2PR12MB5799.namprd12.prod.outlook.com (2603:10b6:408:179::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Thu, 10 Jul
 2025 00:45:09 +0000
Received: from CO1PEPF000044F5.namprd05.prod.outlook.com
 (2603:10b6:a03:f4:cafe::d4) by BYAPR11CA0103.outlook.office365.com
 (2603:10b6:a03:f4::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.21 via Frontend Transport; Thu,
 10 Jul 2025 00:45:09 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F5.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.20 via Frontend Transport; Thu, 10 Jul 2025 00:45:09 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Jul
 2025 19:45:04 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Jul
 2025 19:45:04 -0500
Received: from [172.21.62.237] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 9 Jul 2025 19:45:03 -0500
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
X-Inumbo-ID: 23d245ab-5d27-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LlV2i6FXGMHnGaWC1OlCcgp1+XAmp3MCqyKSVmS55pmcAhST7Wbz1eePoST1PAIzVKJNr1HXXY6bl/ZmZw2Ub65RU+faDgf0LIABDeI2Xmaalbnvz0pjS/bOyAGNws7LCMGLHLXu0jyxuYmYAcT7S9dxiIyyk+xGsuNuUqJ/aZ8xKnokBtmAs/6K2g7DBW+IYxbu6aDONvvgKMNUPO6/b684CapysY0PlRFaYPqAXtkY4/KUvfdDPrzHjQ/6w9+94M9IUPACkivFtytQkNZF2iN6bUFsrGw0+Tu/fz9Ao9eEvE1EXVNCjVYPRfhwL/Qdk45j5/V80jI+XI1MJF2MJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VWfh85+yWazNd/YOZ6kiArV+PbZ6mFqsyhqn+lgITyY=;
 b=mN3Fp6UO5zfKF5RTNf5D/2+z/xgPiBc4YPRMym4xAtgp4yMSGyHbU6O8WD2TsV0tQnlKaILzmdZAYOVbz3+q3If2C6fXyqC1IPjpkOC/1BnYcMZyF/itj6aZBpmesFaIQ+mV72J1C3A7jTQQ1JHZQW/KY7fIwcRr9mSZhU4Aaq+hEzRPxrk8GbCnFwlh1BuXZCnMz1T8gqNLm8+GmODWlVErHOxtdMkA2yM7UOgDmFG0OOtysOWC7Y47iStgF+thZUAVUnpD+fhJKYs4UJscAwxpVQAjLIPwy3CK2Gn3AFjcA71cwdsmZs5z1eN0FIf6b/rx16NdM+IBMOjmMjk96w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VWfh85+yWazNd/YOZ6kiArV+PbZ6mFqsyhqn+lgITyY=;
 b=T3qlWi1+OnUkeS5hW4UJWIyyHwCOr0MMdy2GMzV+HrJQg2kTmoKHCmS1khpoS48T/Acad0X7YmpR57egn2mHLA4wQmZHC36cD8CLPuVDQLAc8eWKoludW6Xd6l8UzS9Kko77AV4Bs0Z5exEXe5t4uVnprPj8zcIaBdPhx73er6U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <88f1cac7-14af-4be6-88f3-2dedc625eba2@amd.com>
Date: Wed, 9 Jul 2025 20:44:57 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] xen/arm: fix arm_iommu_map_page after f9f6b22ab
To: Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Rahul Singh <rahul.singh@arm.com>,
	<jason.andryuk@amd.com>
References: <alpine.DEB.2.22.394.2507091613161.605088@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2507091613161.605088@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F5:EE_|LV2PR12MB5799:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e127a15-e418-47e4-5938-08ddbf4b057b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UVN1d3o5cnBxZzFQMENrRTBBZjFidkdSMkFuSU9VRVdad2ZjS0cxSzREWk9N?=
 =?utf-8?B?ODFVbSt5QWdLUU9OTitza3BSOW53bWoyZHowRkRwelk2Ung1RVRmV1dkd3dl?=
 =?utf-8?B?WWdKdGJQamZzYjA1Nm9aS0FTSGt2dmFwQkg4dUw4a2gwdy9YOC9qVExZOTc0?=
 =?utf-8?B?VHQ5Qk5QRXpZWXFheFVNYWVHNDllUm9ReGhFMGh6SllXSGROSHhXTkFoNFdS?=
 =?utf-8?B?eGdtTTg4eTl2K0oxUmVNTXZmS0R4NzdtSHdranYxTDRjTVdjRExqRkJtM0Er?=
 =?utf-8?B?VWwzYklDQjkyWnJxZzVBeXNYVC8zOE5kb3Vjdy9YZ3lKNi9YV3o3ZEVGOHRV?=
 =?utf-8?B?dkI4TnFGTkhxVDQvL01uSlQ3WGI1VnkySUNjQU1GZWxxOFdDRUZ3VmVrc0R6?=
 =?utf-8?B?T01RL3hQRlkyWXpuK1E2Wit2WEJGYStGM2pjZzlscXd1OFlsQXFlRkY0SHhh?=
 =?utf-8?B?dW9XaDZyU0FiM2JIeXlvWC95K2pkYTRIcE8rQUpSa3Q4bWZHcW1qL2tJSG9Z?=
 =?utf-8?B?dnBzc1RiQjh2ZEFwYlpOU215MzNuVWtndWJkUXBzZ2RZMUVOK1V6ZGo5eUJM?=
 =?utf-8?B?aGxyZ0h0VXpVVm9FUzYwM3RHdzJ1VWpYYi9EdERqc0Z5UmF3cWtXWkdPVEVn?=
 =?utf-8?B?UjVrdlBBTk0zeDFvUE5rS3l1S2U4U0N6T3U0RzVINmR5VFM2NUsrVTk5QTkz?=
 =?utf-8?B?cEtZeUJsWVNtQ1NZMXRrbjRFNnZNVndZT3daN3NPREtBckp2V2ZVbHBEd1NC?=
 =?utf-8?B?OHA4UjFRQ3VBclh0Ym1JaUJqV0QxdGZLTWIwblRPSEs2UmtSdGZCQTFnSEtP?=
 =?utf-8?B?MzNUcEZNRFh6V1pUcWJtTU82MWdhT2YzRERMUVlVb25nS0NkTFdGMGhYUlBO?=
 =?utf-8?B?T1BpdU5KRGxRSis2c0RtV3NVdHVYaFg1czB3ME5OT2ZTZUIxTndVa2lFWmRt?=
 =?utf-8?B?WUJOTVF0Z2RCb3pvTHVpN3E5MGVqQU00c1U1TWtMNVJhdU9PM01lOFJOZXQ3?=
 =?utf-8?B?UmhVVy8zbjlSYWhaNWRuQURsUjRQdGJrK2dRbmlqVUZ0K1BVUUQwVzlxcGE0?=
 =?utf-8?B?cHBzQXpnOGJvYytlZlp3ajh4K2lYVW5HanNWNThjNENvRXhRbVdlK2lFYzhL?=
 =?utf-8?B?b2d5UXNodHZUNG14SDVNSUV4aGUxOWVvaDJOcUJFN2Z3M2RCa0dISzdGY01l?=
 =?utf-8?B?ZXpQU2hlaGFGT2hQQTN2UVpiVlcrTWtqcU9HaC9qUDVMR3hGR3ZsRUlWcWhH?=
 =?utf-8?B?cWlsbVRJWkI4TFFwYWNPbFVkQUV6cEhJWm1rZ0FaMjBjTkZRVHZzSnBSaUtW?=
 =?utf-8?B?NTdrUHZKNElUZjlYVnV6RTgrMlJWR2JrMVpZZEJlSllKQkUxenhwSU5NbWd0?=
 =?utf-8?B?aHViMzYxY3l5Qm5IMEE3YnUxcGhDVEVwRlpNOVdWY2F5ZktCRyt6bk56aWEv?=
 =?utf-8?B?SmIwbEpnQWc2YXNsanNINFZwWjFjMnpyRVV5TFo3N0hDb3J1T283YW5xMlhC?=
 =?utf-8?B?Q2NNNVNjTHBHczVYa2NjWWVRS2h5K0ZyM0M5UkpUZW96VGJmR3Z2OFo1bndI?=
 =?utf-8?B?OE40eEZySm5Na3NTLzdWbWNxc2Y1QU85VkF1STgzLzZoUFNUeW9FZWg1SzR2?=
 =?utf-8?B?VHRHSUhqNFpzdWFvbWJiRTFZaVJBR1N1QTlUeVFSQ2lVRFF4ZHFLTTBpdGFQ?=
 =?utf-8?B?OXFaaU5HcDBxTjRabHBBdW02N0ZKMHlweHgrN2QyNHpBMkcreVlkVXp0RS8v?=
 =?utf-8?B?aGc5NGQvY2QyTmlLVEV3Ni85cDVpa2dIRXl5L0h3VXNldENKUXF6VFg1M0xi?=
 =?utf-8?B?VkZLc01OT2ZOUTN1d2xtbk1xUFJ5THRjODgxQk82NUVCTDMvdXR2Ky9EeFVE?=
 =?utf-8?B?SnhSeERIVndFbG1OVjB5dXMyTkFleE9NMml3dkVBbGlrZ3NqaURrV3VQYlRt?=
 =?utf-8?B?bGx4dEcwcUxPUlZZeGNyZmd4T3RNRkNVV0JTaWZtUGszUWZSRXBZYUpWdTFB?=
 =?utf-8?B?QUZ6UUI5VGMxWmRzWVVuTk1BOTJBclp3ZzhDV04xUSttVFhZcG03UGZpb0xW?=
 =?utf-8?Q?tJcldx?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 00:45:09.0554
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e127a15-e418-47e4-5938-08ddbf4b057b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5799

On 7/9/25 19:28, Stefano Stabellini wrote:
> Hi all,
> 
> Up until f9f6b22ab "xen/arm: Map ITS doorbell register to IOMMU page
> tables" the only caller of iommu_map on ARM was grant_table.c which has
> a specific usage model and restrictions as described by the in-code
> comment in arm_iommu_map_page.
> 
> f9f6b22ab introduced a second caller to iommu_map on ARM:
> vgic_v3_its_init_virtual. This specific statement in the
> f9f6b22ab commit message is wrong:
> 
> "Note that the 1:1 check in arm_iommu_map_page remains for now, as
> virtual ITSes are currently only created for hwdom where the doorbell
> mapping is always 1:1."

The doorbell mapping is still expected to be DFN == MFN for non-direct
map hwdom as far as I understand. In other words,
domain_use_host_layout(d) is true for non-direct-map hwdom, but not
is_domain_direct_mapped(d).

> Leading to crashes any time the hardware domain is not direct-mapped
> (e.g. cache coloring and non-Dom0 hardware domain):
> 
> (XEN) Loading d1 initrd from 0000000045800000 to 
> 0x0000000048200000-0x000000004bdcd615
> (XEN) Loading d1 DTB to 0x0000000048000000-0x00000000480005c4
> (XEN) Xen BUG at drivers/passthrough/arm/iommu_helpers.c:49
> (XEN) ----[ Xen-4.21-unstable  arm64  debug=y  Tainted: I      ]----
> (XEN) CPU:    0
> (XEN) PC:     00000a000024c758 arm_iommu_map_page+0x80/0x90
> (XEN) LR:     00000a000024c750
> (XEN) SP:     00000a000032fb70
> (XEN) CPSR:   0000000080000249 MODE:64-bit EL2h (Hypervisor, handler)
> (XEN)      X0: 0000000000000008  X1: 0000000000000000  X2: 0000000000000000
> (XEN)      X3: 0000000000000001  X4: 00000a00002c98e0  X5: 0000000000000000
> (XEN)      X6: 00008000ffffa710  X7: 00008000ffffa710  X8: 7f7f7f7f7f7f7f7f
> (XEN)      X9: 0000000000000080 X10: 7f7f7f7f7f7f7f7f X11: 0101010101010101
> (XEN)     X12: 0000000000000008 X13: 0000000000000020 X14: 0000000000000000
> (XEN)     X15: ffffffffffffffff X16: 00000a000033cce8 X17: 0000000000000000
> (XEN)     X18: 000000013e688d90 X19: 0000000000008090 X20: 0000000000000080
> (XEN)     X21: 00008000f3a01000 X22: 0000000000008090 X23: 0000000000000080
> (XEN)     X24: 0000000000008090 X25: 0000000000008090 X26: 0000000000000001
> (XEN)     X27: 0000000000008090 X28: 0000000000000000  FP: 00000a000032fb70
> (XEN)
> (XEN)   VTCR_EL2: 0000000080043594
> (XEN)  VTTBR_EL2: 000000013fdcb000
> (XEN)
> (XEN)  SCTLR_EL2: 0000000030cd183d
> (XEN)    HCR_EL2: 0000000000000039
> (XEN)  TTBR0_EL2: 000000004dd50000
> (XEN)
> (XEN)    ESR_EL2: 00000000f2000001
> (XEN)  HPFAR_EL2: 0000000000000000
> (XEN)    FAR_EL2: 0000000000000000
> (XEN)
> (XEN) Xen stack trace from sp=00000a000032fb70:
> (XEN)    00000a000032fba0 00000a0000250884 0000000000000000 0000000000000000
> (XEN)    00008000ffffa410 00008000f3a01000 00000a000032fc30 00000a0000288024
> (XEN)    00008000f3a07010 00008000f3a01000 00008000ffffa410 0000000008080000
> (XEN)    0000000008090040 00008000f3a01570 0000000000000010 0000000000000010
> (XEN)    0000000000010040 3800000000000400 0000000000000010 00000a000032fc9c
> (XEN)    0000000000008090 00008000f3a01150 00000a0000339388 00000a000033df80
> (XEN)    00000a000032fca0 00000a0000285228 00008000f3a01000 0000000000000001
> (XEN)    0000000000003800 0000000000000008 0000000000000000 0000000000000000
> (XEN)    0000000000000001 0000000000000003 000000013e6c9950 000000013e6c9920
> (XEN)    00008000f3a01000 0000000000000008 00000a000032fce0 00000a0000281dcc
> (XEN)    00008000f3a01000 0000000000000100 00000a000032fce0 00000a0000281d40
> (XEN)    0000000000000000 00000000000000ff 00000a000032fd10 00000a00002705a4
> (XEN)    0000000000000000 00008000f3a01000 00000a000032fe08 00000a0000270578
> (XEN)    00000a000032fd50 00000a00002055e8 00008000f3a01000 00000a000032fe08
> (XEN)    0000000000000000 00000a00002053a8 00008000f3a01000 000000030032fda0
> (XEN)    00000a000032fda0 00000a00002cf090 00008000fffed4c8 0000000000000003
> (XEN)    0000000000000008 00000a00002f1bb8 0000000000000004 0000000000000048
> (XEN)    19170c1f5f0cee0e 0000000000000002 00000a000032fe60 00000a00002eb588
> (XEN)    0000000000000004 00000a00002bc000 00000a00002bd900 00000a00002b7c28
> (XEN)    0000000000000004 0000000000000000 0000000000000000 0000000000000000
> (XEN)    00000a000032fe20 00000000ffffffc8 000000030032fe60 0000000000000000
> (XEN)    0000000000000000 0000012300000000 0000000100000000 00000040ffffffff
> (XEN)    00000001ffffffff 0000000000000000 0000000200000000 0000000000000100
> (XEN)    0000000000000000 00008000ffffa710 000000013e588620 00000a000020018c
> (XEN)    000000004dc00000 fffff6004da00000 000000004de00000 0000000000001710
> (XEN)    000000013e5887a0 0000000000000000 0000000000000000 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
> (XEN)    0000000000000000 0000000000000000
> (XEN) Xen call trace:
> (XEN)    [<00000a000024c758>] arm_iommu_map_page+0x80/0x90 (PC)
> (XEN)    [<00000a000024c750>] arm_iommu_map_page+0x78/0x90 (LR)
> (XEN)    [<00000a0000250884>] iommu_map+0xcc/0x29c
> (XEN)    [<00000a0000288024>] vgic_v3_its_init_domain+0x18c/0x1e8
> (XEN)    [<00000a0000285228>] vgic-v3.c#vgic_v3_domain_init+0x168/0x21c
> (XEN)    [<00000a0000281dcc>] domain_vgic_init+0x14c/0x210
> (XEN)    [<00000a00002705a4>] arch_domain_create+0x150/0x1f0
> (XEN)    [<00000a00002055e8>] domain_create+0x47c/0x6c0
> (XEN)    [<00000a00002cf090>] create_domUs+0x7f8/0x8cc
> (XEN)    [<00000a00002eb588>] start_xen+0x8f4/0x998
> (XEN)    [<00000a000020018c>] head.o#primary_switched+0x4/0x10
> (XEN)
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) Xen BUG at drivers/passthrough/arm/iommu_helpers.c:49
> (XEN) ****************************************
> (XEN)
> (XEN) Reboot in five seconds...
> 
> Credits go to Jason for spotting this problem.
> 
> It makes sense to generalize the arm_iommu_map_page function to be more
> generic and unopinionated. The comment specific to the grant table can
> live in grant-table.c instead.
> 
> Opinions?
> 
> diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
> index cf131c43a1..5c841d4f17 100644
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -1274,8 +1274,14 @@ map_grant_ref(
>          }
>  
>          /*
> -         * We're not translated, so we know that dfns and mfns are
> -         * the same things, so the IOMMU entry is always 1-to-1.
> +         * Grant mappings can be used for DMA requests. The dev_bus_addr
> +         * returned by the hypercall is the MFN (not the IPA). For
> +         * device protected by an IOMMU, Xen needs to add a 1:1 mapping
> +         * in the domain p2m to allow DMA request to work. This is only
> +         * valid when the domain is directed mapped.
> +         * 
> +         * We're not translated, so we know that dfns and mfns are the
> +         * same things, so the IOMMU entry is always 1-to-1.
>           */
>          if ( !(op->flags & GNTMAP_readonly) && node.cnt.wr == 1 )
>              kind = IOMMUF_readable | IOMMUF_writable;
> diff --git a/xen/drivers/passthrough/arm/iommu_helpers.c b/xen/drivers/passthrough/arm/iommu_helpers.c
> index 5cb1987481..2585f2e526 100644
> --- a/xen/drivers/passthrough/arm/iommu_helpers.c
> +++ b/xen/drivers/passthrough/arm/iommu_helpers.c
> @@ -36,17 +36,6 @@ int __must_check arm_iommu_map_page(struct domain *d, dfn_t dfn, mfn_t mfn,
>  {
>      p2m_type_t t;
>  
> -    /*
> -     * Grant mappings can be used for DMA requests. The dev_bus_addr
> -     * returned by the hypercall is the MFN (not the IPA). For device
> -     * protected by an IOMMU, Xen needs to add a 1:1 mapping in the domain
> -     * p2m to allow DMA request to work.
> -     * This is only valid when the domain is directed mapped. Hence this
> -     * function should only be used by gnttab code with gfn == mfn == dfn.
> -     */
> -    BUG_ON(!is_domain_direct_mapped(d));
> -    BUG_ON(mfn_x(mfn) != dfn_x(dfn));

Removing both of these checks is taking it further that minimally
necessary to address the reported issue. It would suffice to replace
is_domain_direct_mapped with domain_use_host_layout. However, removing
both can still be considered desirable as preparation for exposing a
vITS to domUs where the doorbell mapping will be DFN != MFN, but this is
not yet the case upstream. If removing both, I would just ask that it be
described so as to not conflate fixing the reported issue with the
preparation for future work.

> -
>      /* We only support readable and writable flags */
>      if ( !(flags & (IOMMUF_readable | IOMMUF_writable)) )
>          return -EINVAL;
> @@ -57,7 +46,7 @@ int __must_check arm_iommu_map_page(struct domain *d, dfn_t dfn, mfn_t mfn,
>       * The function guest_physmap_add_entry replaces the current mapping
>       * if there is already one...
>       */
> -    return guest_physmap_add_entry(d, _gfn(dfn_x(dfn)), _mfn(dfn_x(dfn)),
> +    return guest_physmap_add_entry(d, _gfn(dfn_x(dfn)), _mfn(dfn_x(mfn)),

This can be simplified to:

    return guest_physmap_add_entry(d, _gfn(dfn_x(dfn)), mfn,

>                                     IOMMUF_order(flags), t);
>  }
>  


