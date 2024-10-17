Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3134A9A2FBA
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 23:22:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821339.1235101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1Xwn-0002jy-DY; Thu, 17 Oct 2024 21:22:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821339.1235101; Thu, 17 Oct 2024 21:22:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1Xwn-0002h6-Aa; Thu, 17 Oct 2024 21:22:17 +0000
Received: by outflank-mailman (input) for mailman id 821339;
 Thu, 17 Oct 2024 21:22:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QiKY=RN=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1t1Xwl-0002gv-MA
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 21:22:15 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2413::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e06bdf51-8ccd-11ef-99a3-01e77a169b0f;
 Thu, 17 Oct 2024 23:22:13 +0200 (CEST)
Received: from CH0PR04CA0003.namprd04.prod.outlook.com (2603:10b6:610:76::8)
 by MW4PR12MB6730.namprd12.prod.outlook.com (2603:10b6:303:1ec::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.19; Thu, 17 Oct
 2024 21:22:09 +0000
Received: from CH3PEPF00000017.namprd21.prod.outlook.com
 (2603:10b6:610:76:cafe::74) by CH0PR04CA0003.outlook.office365.com
 (2603:10b6:610:76::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.19 via Frontend
 Transport; Thu, 17 Oct 2024 21:22:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000017.mail.protection.outlook.com (10.167.244.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.1 via Frontend Transport; Thu, 17 Oct 2024 21:22:08 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Oct
 2024 16:22:08 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Oct
 2024 16:22:08 -0500
Received: from [172.21.242.153] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 17 Oct 2024 16:22:07 -0500
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
X-Inumbo-ID: e06bdf51-8ccd-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I1HmjA20HWlMxWI1BF+G/VuCymfx9BhrIjtTNp1YmRIYnAHp/OCr+JTbOMB7JAvuRW2CEwVJ/7rwJDasSTMDGo0W10fguFuBGQnuROxhbm+J86lWV18f7Znk59nUXt3P2M4N1xX7puvrLpIe+5Uu4kBZVYvCiCoc6qgqfbAU/ULBAYtQSayDCoHgGzIikDPrxeidlhoVPNDVctwgIPzM8dfkrIV2PbH6vIVmq/MbjBBqXgRL1+7Wm1BmWNwUj+fCE+aWl2av4BtfYoFIUdls1K18Lr5QqJzu+Sqo96t14uBhRJ47D88oI/8epzTyjrTTQTjbbcrShRvjLBAFtLHVMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZIJNiSPda1uLXfBZUDr5py1ZfFbvvz2cKDS1+fXWd8U=;
 b=Z2IrXuCLJr/NPX5OzrT6TWnallOz+sZ36S0k6RQPMREkwHck1TJWBWpGHflTYDtlGMIMsKqOGnpwtMn34Ceb5eSQKoIpiKfwtnzZ8WfRr1+41t4vUT0yNWee4y8dat8/8M3CqtSKEVOx5VHtbW9+ZFWS9OcUt/+r6B+qLQTFTWOyW3pUVKESIzu3/lRJMmDVZFzF+TeurI8yWf+Er8w45iulz90Qy9clvZWsIpE6rEyzDX5rn1Gnig/jBgtQagYEG6f3R0su5Gih7Oyb4jMmvzIKg8giV5+0C/siVI3Z6824KrtyQbZVKjzUBY0r8GyOyB9BNadwpoVsjonLoVH9fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZIJNiSPda1uLXfBZUDr5py1ZfFbvvz2cKDS1+fXWd8U=;
 b=B2dJqoRh7HUuat6o2KhCBOkOnBhRyLtn6SmvcTHGPCGJBRmEYyKaTodEA7IXWKQXtSmtdx6goIpL47sDKvtRULE4byjorcUrp9ETUw03pu8fjtuZougbrNeakcHlIhAaidNyf/ZXwRZf2mHG3lkHX/8IRe3Ankc3GZExlaaHbGQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <35ae437a-83f4-4c71-a0c7-94894f232710@amd.com>
Date: Thu, 17 Oct 2024 17:22:07 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/44] x86/boot: move headroom to boot modules
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
 <20241017170325.3842-8-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241017170325.3842-8-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000017:EE_|MW4PR12MB6730:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e3ab54d-6db7-4b25-23e4-08dceef1c204
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R0VIMnlrRHhwQW5XeFlkdGIvNHFPUnkxMjdyRGdET2pyY1JNRXZoRFlPWk1Q?=
 =?utf-8?B?eXAxUTN6VUVFa1E1VWlESExBcFczeU5QL25YNHBhWTJxTlZUUTlYWEVWVEh1?=
 =?utf-8?B?Z204OUxjOWNoajI4WHh3K0RsREM5NDdxYURjZldIdmEyYVNRVHFqMlU0RDh0?=
 =?utf-8?B?MEdUbVk3b1hXUEFvZ3FUYWF4M1czd3RIK0g1WlgzUURsRjNycnJZWElTSDY2?=
 =?utf-8?B?SDg5VzJDMkxCc3lIQUFmVW1YM2hsUmtDTFErazNmZTIweFE4b1FrN21hcHpM?=
 =?utf-8?B?dHpwdjRwVWZDbkkrSUpIcW9oRVFpUEZ5cmVFMUtzQk1xcWM3c1dSa3ZOaGsz?=
 =?utf-8?B?YzkyOVZLQVJhaU81SWdsZUpaY01OUjZ3aStNRnd4WVNlTlpwcUlSRTl0UkM0?=
 =?utf-8?B?Uk96SEZsMlkvdkhZUTI5ZDUzRzkxYVNvbFFZSjY4ZnV0YVZXeXlHUVQwekJG?=
 =?utf-8?B?dmt3WTBlYWhlUW5ZVkhKcmlUUFRVeEdHeERrWEh3UFBmM3lJQ2Z2NWVSWURp?=
 =?utf-8?B?TkNaQ1UwWVVZeXFhYTRnYVNJS0xZcWllRGpKSDA5VmxXY0tZRDFoM1lsbURm?=
 =?utf-8?B?VXFUNkF3dlVDem5DTzJNSkRhYk5pV0FON3dLUGtOSnlFZmZ4R2FyTGYxU2pp?=
 =?utf-8?B?V3JvQ3JEY2lhTE50dTdJcm5qd240ZDhLTnRUVGc4N1hIbHFFU2RrM3BiaUNy?=
 =?utf-8?B?SkEwUmpwQk1sSlRvVnJhaGEzdTBJRkdUUUtZUjl0TUdmL0NmcFdTNWZNSk5k?=
 =?utf-8?B?Y2F1MnNHSmVFd29yU0FlTitwQjg0UkRTZXI3UVdxSmpLdTRDZnh2SHVyNFdh?=
 =?utf-8?B?YzFua2xHdDJ3K1FIRHlKMUdYOHVwc1FGcHRjdTg0d1BIT204UE1YUEdvQjQw?=
 =?utf-8?B?WFJZZGMyQ1NGTVE3dSt5akM3OWVrL1dHcW1TVlZCZExoR3JOLzJlc3pOUHJH?=
 =?utf-8?B?VnhST3B5V0VYZmlhNU1UdENBOGNDNnNKQXlQcm9JbFNUa29yb0ppaUJRRmkx?=
 =?utf-8?B?NitpYjVCQU5ieEhhTVd3cXovRCtRdU1NRGNYY2VNdkNJU1VOSXVVMG1sZ1g3?=
 =?utf-8?B?VmFwa010RzcwVGZSeGlrYlVlSHFvc0lUWWRNeXlDZXU5MlREcVdOMFFVYTFh?=
 =?utf-8?B?RlJiL2V3QS9maE1RTEFSRFZ6UWlLcjV1QklLVDErNmhPNEIwQlI5dUxodTE4?=
 =?utf-8?B?M3pFcTNJN3ZjcnRKWFVsRWVYdTBTS2FnSzVhTEo4eDRQbWhKMXRtY3NmOFE0?=
 =?utf-8?B?bTZLbk9FMnB4VnlpUkZ5dHpJM1lhWHNRYlZTcllxT29UbHJLNFZwc2xCWmt0?=
 =?utf-8?B?R1ZJUjViS2E5YjUreWNoc3ZabFdPRHZoR1NnNzFKNHhVb0R1SHVDd2l4OUlZ?=
 =?utf-8?B?VzdXUjBrMkJjMHBOSDNvbUNOYW8wY1NsSzNXQ0VRSzZROXE0WWtiNHJzS3ZE?=
 =?utf-8?B?MEpjWWhIRk1yOU1xVEJVbGJQU05nSWpCTUh6R2toQnV5MUVwSG5MVE1XQ2Ns?=
 =?utf-8?B?TnN5Z1NXeGZtKy9ueWNpTWEyY3pOa2Yvc1dNR2ZXaDRIV3M5Qm5vOFlRTFRP?=
 =?utf-8?B?NXNPWFRnckN4dUxpVzRtcDlrc3NRY3FTaGszeXRBR3dSUkZ3aXpId09YSTJh?=
 =?utf-8?B?dmpZRnhjYjlia05LNDdkb1krUDdpUXhHdHRseGhaWHk2U3VEbmRzOG5abDVl?=
 =?utf-8?B?dUw1aVZZOERLN0Q4T0Z6QjFBc1VyY3VUR2hiYldkSHVEM1lHQTBVMldUanV1?=
 =?utf-8?B?QitDUmVzaDdPZVJvc0xmWTFiR0ZtQmtnQjdFcEJrYUZFKzNQZjQ1ZFFkYjRB?=
 =?utf-8?B?bmY5aDArZ1JsSkZsSlpzelVFSngzdTBKUkptWTZ1UStOdnUrcUQyMHMyKzA4?=
 =?utf-8?B?b0g3UTIyQXFXZ00rNzVaN1FyZGVEclZ4MzRpODRtNmFRNXc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 21:22:08.8566
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e3ab54d-6db7-4b25-23e4-08dceef1c204
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000017.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6730

On 2024-10-17 13:02, Daniel P. Smith wrote:
> The purpose of struct boot_module is to encapsulate the state of boot module as
> it is processed by Xen. Locating boot module state struct boot_module reduces
> the number of global variables as well as the number of state variables that
> must be passed around. It also lays the groundwork for hyperlaunch mult-domain
> construction, where multiple instances of state variables like headroom will be
> needed.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

