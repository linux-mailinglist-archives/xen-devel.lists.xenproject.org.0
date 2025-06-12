Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A52AD7247
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 15:39:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1013111.1391661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPi9M-0002TK-Or; Thu, 12 Jun 2025 13:39:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1013111.1391661; Thu, 12 Jun 2025 13:39:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPi9M-0002Qf-LY; Thu, 12 Jun 2025 13:39:24 +0000
Received: by outflank-mailman (input) for mailman id 1013111;
 Thu, 12 Jun 2025 13:39:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FA4y=Y3=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uPi9K-0002P2-8z
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 13:39:22 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2418::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4469b7a-4792-11f0-a309-13f23c93f187;
 Thu, 12 Jun 2025 15:39:20 +0200 (CEST)
Received: from MN2PR05CA0017.namprd05.prod.outlook.com (2603:10b6:208:c0::30)
 by CH1PPF5A8F51299.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::60f) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Thu, 12 Jun
 2025 13:39:16 +0000
Received: from BN1PEPF00006001.namprd05.prod.outlook.com
 (2603:10b6:208:c0:cafe::b0) by MN2PR05CA0017.outlook.office365.com
 (2603:10b6:208:c0::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Thu,
 12 Jun 2025 13:39:16 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN1PEPF00006001.mail.protection.outlook.com (10.167.243.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Thu, 12 Jun 2025 13:39:16 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Jun
 2025 08:39:15 -0500
Received: from [172.26.5.4] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 12 Jun 2025 08:39:14 -0500
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
X-Inumbo-ID: a4469b7a-4792-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f/zNeGFgIV6OdyjTp+NOMZMZIHrbbbJC1PS1rfF7TECqnPzDpCBoeu/SyLuZTa8dLSjqZ1GHm0fhX22GkBysYTghgG29CxhtMTBLl2PyGDsGZdi/AhNdQbETp4GR2VPWsbYFvqhuWhKeKgr88vrauSHwWUi4te4snSYfyaqZVIDsFUbX9M76plFwElV+Rr2skGCsy22LXp2MphlR3N8ERDXXfs6ZfKlRgZ9PlyYxVOK65Tr/xkNb0TMbthue9Qn3Jat8S36AOf+AWszaS0zU6SbsnWEHCwK3+JQAWGJUewaKWluBJ29/LF0qSWisROLZ8o/wN1fuFj0bzCPKksgJDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XvAT/c0VKDKjk7ZT131qrDxyqcca2fj89igx5iZZwJw=;
 b=DG+VBMchVmE5JnNWovaW4RY/cS7msplRkOCGTbq/FSVhDyIjVK79R7+NZteFsDCoKJoakTTiAsC/stSW7Sgc4dZN6gDf1kO+OxvvwQshqw+aZ++dBKL8re5U3HeYkVQjRgOrd58eyBefFRI872vodhFnHzW7VyhOrDVzIAGoWf2s0+HcN97vNVd3ywNL+UK2qdlbvc4PvEk3OCNdyoo+u0SyxxeGvYhKFP07yd/PUQEyMOq5bkYJpychumsJISkUmg6zhZRnNMzTKzXZhwcrt+BgDEzzxnM+q+zoUSxjTdeoFhs1KIs2OBt+tnafMEU8K34GVqkE3Po/0kAWej3LVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XvAT/c0VKDKjk7ZT131qrDxyqcca2fj89igx5iZZwJw=;
 b=OoFXcDOYaAFc32yPF08WthCnqSA3eddCnwBmTnO5GHLlz2qdufCIV0C2i7G/GvCykjDjhzGvHl1MU6sj+ZvcVGe/8c2RzL0VDsXOJim5KyREVGXBEuWDvhndVuWm6dapXB5eDEDhB9jiHjXSOtJPkm8tqSU47X2nVnridCm92xM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <3a203b96-94e3-47c3-92b6-b68141ea3794@amd.com>
Date: Thu, 12 Jun 2025 09:39:13 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] xen/arm: pci: introduce PCI_PASSTHROUGH Kconfig option
To: Jan Beulich <jbeulich@suse.com>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Stefano
 Stabellini" <stefano.stabellini@amd.com>, <xen-devel@lists.xenproject.org>
References: <20250610174635.203439-1-stewart.hildebrand@amd.com>
 <6ac8ffbc-5bd3-4bea-9ade-f31710747291@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <6ac8ffbc-5bd3-4bea-9ade-f31710747291@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006001:EE_|CH1PPF5A8F51299:EE_
X-MS-Office365-Filtering-Correlation-Id: 475aebdc-d242-4e45-3173-08dda9b6866d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UW02T1dnQW52TlNKN1Z1dSswajVRZFFhVnR6MHFMeTdLLzd1NVJCOW0rV3hl?=
 =?utf-8?B?WFl1MVNQVDBXZ3JhYTVPdCtkc1RxL2VyeU5STHprZERlY0J3b0JpV2wwaFpT?=
 =?utf-8?B?SkZBY0ZTUE92YllFMy9kMzJ6am9PcS8yYlVwSU5kc000TkRNdzd6TjNwbGlY?=
 =?utf-8?B?dkxNL1pETFFSMFM2OFdCeG1xK1N1dHJtUlE2VXZzbTVDTEs4T2thUkxTb0JN?=
 =?utf-8?B?a2pGdTdYWFIvenpKNDhhYjY3ZG45dGRCQ0xoS0RLeGFRNDdpditTRmFRb1Jn?=
 =?utf-8?B?YjV0dHlmNVpUdlJKQUVHQytGVTdOYWhhSHgrQWN5WmQ4bkFEM2tKR0k3MUNz?=
 =?utf-8?B?dmE3WHFFbVM1eVQxQndYbjJPQ3I1TlVWU2VON1o1MGx0YnVmU0xFTDNySGZi?=
 =?utf-8?B?WjQ2azhlRTJCLytUbXlXK1V5dmVDamtNanhvM0tJQjAzaUdQbHVmUUoydEJq?=
 =?utf-8?B?clVXSkdPUFM2d2pzaTVzV2NwWVlESDNpQWFycVlST2xObHNFYVlLeE90OW5K?=
 =?utf-8?B?clorcmNZQU42NUFZSXMyREpWeFNDL2ROQnNRNWVjSE9KTUpjK1VaZkVrTHRn?=
 =?utf-8?B?QjF6L2VWOSs3eTAvMjBZSHZ6Tkdoc0hCN2J0YnVmdnpqeTIwdENEcitkRlNy?=
 =?utf-8?B?UjhlWTA2RE5PVlBBUzRtMFhEM0RiMkR5czZsbEtoUmN6YXJmSUVBcVRUTVFw?=
 =?utf-8?B?MENBdkdXMzBkWllweG9wVnhpTUFNRzVKWGwzK3JWeVJiTTlQK3lXQ09KTHVC?=
 =?utf-8?B?dW9vZlFVVkNSbGJIU3JUS20xOEZsTHozdmVvT1dhZDF5WEFYSjNnVmpVd3Iy?=
 =?utf-8?B?S3B3bXl1c1Z2U1g5RExnY0krZVltTnNRQ29WRUptUGIzVDZadzQzWnhTelhS?=
 =?utf-8?B?UDdnU3FodEtlQ1g1VGVsQ3c0R1BaUmMyYU5sUTlRTHdPNVNqeXM2MXArNTNa?=
 =?utf-8?B?bS9TVk11Z0hUZTF2ZkFtVE1WN210dnRnMFBJK21XalJ6Wkk2SzdJL1diQlRM?=
 =?utf-8?B?NjFBeDhMRGlWUEZhNWU1bUFtMWNZeTVpUGk0U1hac2k5OStrWVcvS3FETVBk?=
 =?utf-8?B?SzdVWmxnU2lxaHR6Ums2Y0lFVUlVU0RqaXE3NUorcFVwU3RIUXBpaG14MXM0?=
 =?utf-8?B?b1JOUk1xd3g3WHhwTjhTajFzRk43eVFlUjlsT0x6RHF5am1tKzJCNGhwOFhN?=
 =?utf-8?B?Zi9tbmhhWjczNkJLa3RibmN1MktlZmVSNUsrb0lrbXMxTDQyZTBiNGJNME9r?=
 =?utf-8?B?OUszTkhjei9zelNRbm8rcGx3M3E0QUFuSzRDY0Uwd3lHT0RHWFRlUkRMYTdB?=
 =?utf-8?B?K2hHMFdvZDZsMlgxSjBNOWlETUNudHVvajFnaUU4ak5UTk9YTTJsRFpreDZG?=
 =?utf-8?B?V1M3UEtSMWpDNHF1bjE5K21leWVodGNMVVJ4dEVkSm5QZGlRTG8xSzNxYVY0?=
 =?utf-8?B?TnA3emVqb1lINmVpWlNhVm85YlpIWjk5WnpXZS9ieEQ1WTdDMG9qVUV0NDlY?=
 =?utf-8?B?cFlKYXMvQlQyTWxQTDBNVzBScXN6a2c0SWRqM0VGeTFSY2x4K2JiVk5Ub1pS?=
 =?utf-8?B?VTJnL0NXbkVXN3pkOUV2NTdsaHkvbFVwQSt3YkRCT2MzekFaZzJVWXd2bC9a?=
 =?utf-8?B?MjNBM0J6QTQydUhCTk0yeDdsaGZEaGNIQjd6WFBaY05jR1FzK0d3eE4xT1hP?=
 =?utf-8?B?ZlpPNy95M1ZSdEZ3LzhhMkY0clo3cGdFQmdldUpHQnhlUGY3U1dWMXQzbmU4?=
 =?utf-8?B?enNmWnJyQkZQWmtZeVJHRTJaS2lIVERkR21ZWU5kcm5ObXVnNE5nMzR5Wk9a?=
 =?utf-8?B?bVY5Zk5RNTZuc25vbVVqUXBRNHB3YnFjY2hNSkpOY1owUXJ4UlFnNitwa3RX?=
 =?utf-8?B?K21UaUwyTXZMZVY5bXJPSGUwMTRlaksxOGhBc3lGTERTaXk0MGRIOUYyYTcx?=
 =?utf-8?B?Z3FNYlgyUkxSNllPN0RmQzE3ZTloNnkwdlRwY3VIOXdHUU0vT1BmTjI0cVZZ?=
 =?utf-8?B?Nk5FeGd3bHdOWGxkRlhwdHB2MDNOanlkQnE3OVRUUzY2NFZxcDBPT3pQeC9t?=
 =?utf-8?Q?6nu7Xn?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 13:39:16.0390
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 475aebdc-d242-4e45-3173-08dda9b6866d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006001.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF5A8F51299

On 6/11/25 01:23, Jan Beulich wrote:
> On 10.06.2025 19:46, Stewart Hildebrand wrote:
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -258,6 +258,16 @@ config PARTIAL_EMULATION
>>  
>>  source "arch/arm/firmware/Kconfig"
>>  
>> +config PCI_PASSTHROUGH
>> +	bool "PCI passthrough" if EXPERT
>> +	depends on ARM_64
>> +	select HAS_PCI
>> +	select HAS_VPCI
>> +	select HAS_VPCI_GUEST_SUPPORT
> 
> What about HAS_PASSTHROUGH? Seeing that being selected by MMU, what about
> that connection here?

Hm, yes. I'm not sure if depends or select would be better?

	depends on ARM_64 && HAS_PASSTHROUGH

or

	select HAS_PASSTHROUGH

> Selecting HAS_VPCI shouldn't really be necessary; HAS_VPCI_GUEST_SUPPORT
> does that for you already. (I further wonder whether HAS_VPCI wouldn't
> in turn better select HAS_PCI.)

I'd be happy to make these changes.

>> +	default n
> 
> This is unnecessary (redundant) and would hence better be omitted.

OK, I'll remove it.

