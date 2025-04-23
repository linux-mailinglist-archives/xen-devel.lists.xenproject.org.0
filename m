Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50731A99ACC
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 23:33:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.965510.1356052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7hiG-00018F-Tx; Wed, 23 Apr 2025 21:33:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 965510.1356052; Wed, 23 Apr 2025 21:33:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7hiG-00016l-QE; Wed, 23 Apr 2025 21:33:00 +0000
Received: by outflank-mailman (input) for mailman id 965510;
 Wed, 23 Apr 2025 21:32:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hbtc=XJ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u7hiF-00016b-Kg
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 21:32:59 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060d.outbound.protection.outlook.com
 [2a01:111:f403:200a::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83c99424-208a-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 23:32:55 +0200 (CEST)
Received: from BL1PR13CA0330.namprd13.prod.outlook.com (2603:10b6:208:2c1::35)
 by CYYPR12MB8656.namprd12.prod.outlook.com (2603:10b6:930:c3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Wed, 23 Apr
 2025 21:32:47 +0000
Received: from BL02EPF00029928.namprd02.prod.outlook.com
 (2603:10b6:208:2c1:cafe::44) by BL1PR13CA0330.outlook.office365.com
 (2603:10b6:208:2c1::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.34 via Frontend Transport; Wed,
 23 Apr 2025 21:32:47 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00029928.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Wed, 23 Apr 2025 21:32:46 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Apr
 2025 16:32:46 -0500
Received: from [172.21.185.2] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 23 Apr 2025 16:32:46 -0500
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
X-Inumbo-ID: 83c99424-208a-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dc3uOBA80S1Da9zFHuARgC74cH+PiuX0P9sAAI9sHNDyejptZQHD+QYk/LMiBifWKavQ7n0+zvVDNb5UNxV09fi06y+UhkGZUt1Mg16o5ljtWa6sBY2oQZRONdV8HAd4R3GNlqfjrzgjWgM54AgCcQQUYpbD1JC5DRDX1RS+JumYKMVv0A1RBorqzz+p/PwT0DjbwRUga4TRR0ELqRky1x+nOSrcEjRJALioueXO7f2puQqrTIG6F/c4kMMsc4lFPll1J8iUi4CpcsQoF9mhyKXUwXKrZpMKvzwZc0ru6B7tui2dgBHnJPaVZTnBgZ7WyM4MRggt8ryGkHaPjYhD0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8IpLAiOXtAXXaVizj4crPg2YRTfFM3GKIbmAWcVnv2A=;
 b=UFMKptwRWzlXoDPODZ7NmjMwETfnep/8IwiG1ozh9b7es17ZhDcBQKr8GPDk6yc4KEvw+aPhHJ4qGqEgYXV64rs3jjEikIBYoAl0PrkrZyTn4CIHm+tJIB8j+ZDhNVApSiOOFSLAN1qAk+xhR8UEBfQgfKr/0jaSNexuSxk3V6zliLqIy+1TCxE5wqY9n1IyAVACDLmNvN9GAgj0qHs5r7+iiiHcCxsKLgUXiWN7bypdzHeBkq+GNlUMDf6g0w/5tebVzt6PWTtWMt7gBCzQy61aIxJf2MC/5t2R0Ik+hQLzZ0cO/p4M897J1xcBH32//KDMvc2bDB+Ou3uykS0cvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8IpLAiOXtAXXaVizj4crPg2YRTfFM3GKIbmAWcVnv2A=;
 b=0txNiPS1mksWv/KOaqp/Sv+juO2lLBm5I/W2y8xzLft60hKFscZcLqu7trjiTPopImlcuP/txKd+v+7K0zh/VXa15Hy1qLykrdPmRGXgVsFWGiXQIfcIVVGZkYoowhmfWWRy9keCWmXkoNISUl/FstRN0+0NJxEO6xmzdz3IhT4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <839574d2-0433-45bb-abdc-154eb91677d1@amd.com>
Date: Wed, 23 Apr 2025 17:32:43 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/vpci: Fix msix existing mapping printk
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250423212229.32721-1-jason.andryuk@amd.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250423212229.32721-1-jason.andryuk@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029928:EE_|CYYPR12MB8656:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a90af70-a958-40a2-9420-08dd82ae63ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bVNBZlllZ2FKMmNqTEZ5Y1lyc1pWYkovM2hrOWY5cFFUUkk5Q0syTDZqMnlF?=
 =?utf-8?B?cTM2b0RkaW1sckpmbzkwMFFKdkNRaVptdVFST2xOWENvRTZUa2NKR3JIMmFP?=
 =?utf-8?B?Wk9ZTzBETXhuTmtOOVh3T0JDMVZ4bmlLaGczOFA2SiswMGkvZmEzRUpnWGdN?=
 =?utf-8?B?UTNPb1lQd0M2RWdzd3gyWjI0UytPdnllQWplUDYrSDVIczU5ZnVwVTY1Z1Rr?=
 =?utf-8?B?RVJiQ3hJd3NMY0NGK3FtM1MzblNMWktWNktlR3JpcXN5M2FBcy9BZlBNWVEx?=
 =?utf-8?B?cFc2V3ZJMThEWm8xTXdXRzhoYzlPRmFtelZGQlEwdkdObEdJZy8zT0hTdzc3?=
 =?utf-8?B?cjFMam4wM1Y2aU42S1NXZ3NmOWhpSWpnaVlCV2Y3RTVaTkd0WXJGNXRJZVhE?=
 =?utf-8?B?Nnl6alYzUWFoQWQ2bzR6ZWprK3cwUWh4VENPZWxFaGNvLzhhSFl5cWRCajFC?=
 =?utf-8?B?Q3RpdGZNOVFucE5tSDkyWnh4ZjJhS1NTOXFEamtCMDJJWFB3eFBOUlN3OHh6?=
 =?utf-8?B?TktoRkliemRqTEwwZHl5MjZFQkNsV3NHV2JUNEphSGdSVWsxVFNDc1RQTHo0?=
 =?utf-8?B?ejNFYUx3R1ZKNm9xdUUrZVZpdTRSdnl6WnpUNVRGa0ZqaVhJS0pCS0F5aExU?=
 =?utf-8?B?V0tTcDVzWVJOUEF4a25xaEVTa0ZLYkN4TmpwdTE1N24wN2dlUDZsU3FyUTBM?=
 =?utf-8?B?Z2lQdCtNb3E0WFBkZkxRemxNbnJLL3B0V09TWTR4bkdaTnRWSlZWNjhvcml6?=
 =?utf-8?B?SzJSRHUyemZhZ0hRY1gzdk1CcUQ2TER5UDJpaWVQSmV3U0ROazNWK1R3dG9r?=
 =?utf-8?B?MTM5RHk4OHg3K3RUWlNZRWxXK3F6bVNTbzZVUGN3WjhUbFBRTmJtcCtjS1kr?=
 =?utf-8?B?MFZJczNoeXgrSUNEblVBTnFlV1c4TFFZdXNXbVhwbk5SUXI3dXVPREJjc0F4?=
 =?utf-8?B?UXdkbkJBRmNEN1JFYUJ5Ky94OWlzdkFaNnhQZHNZWXpuczlNZHFCZXkwZWht?=
 =?utf-8?B?R2xxZ05NK2V2ZDZQd1ljU3FRT0R6a0wyR1U5VU4xVTBYRStGb0duaDk3UG5V?=
 =?utf-8?B?VDJiRmRoQS9lM0s0d0ZPMXRBaTU1N1lFaFBFN285TkZpNXd2eStRUmhTY0hV?=
 =?utf-8?B?Mzl0SHJOMlNLZU5CS1U2WUFtbEFta2RKeXVHblhSbUFxZjdaWEVIZTB3R3Fi?=
 =?utf-8?B?SjBQaWMyellPVFlmYmZEMVpRVDZsQzB2L2x5Uk5DdDYwYWdSV1U2S2laN1l4?=
 =?utf-8?B?ZWtMUnNLSHhraW95UjYvUmNSQ09BWG9SN052SjV0dS9rVUgrOG1EaHlCTUF1?=
 =?utf-8?B?R0xFbzBLczIwUUNLMzN0YzdxcHRJOHJ0RERkcnpueUFtV0xrYnhERTBobGZs?=
 =?utf-8?B?WmJRQnBBYTlpcXg3K25lb3NwRVNLbWllaUFPTEo3STZZRlRsaUU4SFpDRWJ4?=
 =?utf-8?B?bFk5VUFaeFh0dWt6OXIvWEVzeXRKdmNOdEFBNkd6OFFsN2UzMitkWUMwMzll?=
 =?utf-8?B?Vnl6VG4yUUNiZGw0NWdXRVBxQjZ5cVplaFZUZ1JkVlJNd0NCUTBuTXM3TE11?=
 =?utf-8?B?cWpRWkQwT0l3bUtSN3JjNGJOTlNGY29GSlhja1hvUmZnT1ZSV2V5YVJBTTll?=
 =?utf-8?B?d2Z4MmpDV0xyOHBiMDZZQ1g1OFAvd3BQSzJXWjBML3R1VFNkRVNQRnRiWVgx?=
 =?utf-8?B?dzNJYkl0ZWwzdlVFZVRPU3YzSmN5N3EzNDM3TDk3STB4cTRSMDJNNFl6Z1VO?=
 =?utf-8?B?ejM1OEw4MW4rNi9UNm52c3c3ZkxxUDUzNlVMTWg4QWRFYXJXaVlVaDBqdjNp?=
 =?utf-8?B?NktsVXRpTXBzOFpLZzVvYm9EemF4WXczQXBrdlVKV1hvY2xGMkJnNml6VHNB?=
 =?utf-8?B?M1NNR0taanh1aU5SVG8yL0dqd1gxOUQwbmhlU05pZlFhWlBNeHY5YXBLbng2?=
 =?utf-8?B?M2VCZDJtSG9NRE1CbXdjZjNUK1Y2ZjVJZmphKzVkNlhHVGlzNmJ3QkszRDhm?=
 =?utf-8?B?UGVKZXE4bzhCK2xwMHBTRVpkcjVLY2hieHcweStHSStHSVBsVGFzQi9OOEZY?=
 =?utf-8?Q?jFU6q+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 21:32:46.9648
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a90af70-a958-40a2-9420-08dd82ae63ff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029928.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8656

On 2025-04-23 17:22, Jason Andryuk wrote:
> The format string lacks a space, so mfn and type run together:
> (XEN) d0v0 0000:06:00.7: existing mapping (mfn: 753037type: 0) at 0x1 clobbers MSIX MMIO area
> 
> Add a space.
> 

Fixes: 677053fac17a ("vpci/msix: carve p2m hole for MSIX MMIO regions")

if we want one.

Regards,
Jason

